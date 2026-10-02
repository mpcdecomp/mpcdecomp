; app3 -- MPC2000XL flash: UI screens and keys.
; v1.20 0x2310a-0x3270e (62980 bytes), v1.14 0x23088-0x32120 (61592 bytes),
; v1.12 0x22e98-0x31f30 (61592 bytes), v1.11 0x22e18-0x31e2e (61462 bytes),
; v1.10 0x22e08-0x31e10 (61448 bytes), v1.07 0x22b68-0x318d2 (60778 bytes).

APP3_CSBASE set     APP3_SEG*16-SEGBASE

; 0x2310a-0x23658, 1358 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 120
FREE_2310A:
        PAD_TO  APPDATA_SEG*16+00F08h-SEGBASE, 000h
        endif
; UI string tables, disk/UI data segment DS=2275h (base 0x22750).  format: one
; leading byte = entry width, then fixed-width space-padded entries, no
; terminators, no count.

d_a3_fp_00f08:
        dw      EP_FAR_270FB_OFF, EP_FAR_270FB_SEG
d_c0_w_00f0c:
        db      0b8h, 02h, 0ffh, 00h
d_a3_w_00f10:
        db      00h, 80h, 00h, 00h
d_a3_fp_00f14:
        dw      EP_L_2782A_OFF, EP_L_2782A_SEG
d_a3_w_00f18:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 111
        db      68h, 10h
        else
        db      5bh, 10h
        endif
d_a3_w_00f1a:
        if      FW_VERSION >= 112
d_a3_fp_00f1a:
        dw      EP_L_27B78_OFF, APP3_SEG
        else
        dw      EP_FAR_272A8_OFF, APP3_SEG
        endif
d_a3_w_00f1e_2:
        if      FW_VERSION >= 111
d_a3_w_00f1e:
        db      0b6h, 13h
d_a3_w_00f20:
        db      00h, 00h, 00h, 00h
d_a3_w_00f24:
        db      00h, 00h
d_a3_w_00f26:
        db      00h, 00h
        else
d_a3_w_00f1e:
        db      0a9h, 13h
d_a3_w_00f20:
        db      00h, 00h, 00h, 00h
d_a3_w_00f24:
        db      00h, 00h
d_a3_w_00f26:
        db      00h, 00h
        endif
d_a3_w_00f28:
        db      00h, 00h
d_a3_w_00f2a:
        db      00h, 00h
d_a3_b_00f2c:
        db      00h
d_a3_b_00f2d:
        db      00h
d_a2_b_00f2e:
        db      00h, 00h
d_a3_b_00f30:
        db      00h
timing_correct_names:                   ; width 7, 7: OFF 1/8 1/8(3) 1/16 1/16(3) 1/32 1/32(3)
        else
        db      4ch, 10h
d_a3_w_00f1a:
        dw      EP_FAR_272A8_OFF, APP3_SEG
d_a3_w_00f1e:
        db      9ah, 13h
d_a3_w_00f20:
        db      00h, 00h, 00h, 00h
d_a3_w_00f24:
        db      00h, 00h
d_a3_w_00f26:
        db      00h, 00h
d_a3_w_00f28:
        db      000h, 000h
d_a3_w_00f2a:
        db      000h, 000h
d_a3_b_00f2c:
        db      000h
d_a3_b_00f2d:
        db      000h
d_a2_b_00f2e:
        db      000h, 000h
d_a3_b_00f30:
        db      000h
        endif
        TBL_NOTE_VALUE_NAMES_DATA
timing_tick_ticks:
        db      "`@0 "
        db      18h, 10h, 0ch, 08h, 05h
        db      "(MAS)(SEQ)"
        db      02h
        db      " S M"
        db      03h
        db      "OFF^ON^NOYESTrack-          (Unused)        MIDI :DRUM1:DRUM2:DRUM3:DRUM4:OFF  1A- 2A- 3A- 4A- 5A- 6A- 7A- 8A- 9A-10A-11A-12A-13A-14A-15A-16A- 1B- 2B- 3B- 4B- 5B- 6B- 7B- 8B- 9B-10B-11B-12B-13B-14B-15B-16B-OFF"
        db      0fh
        db      "BAR,BEAT,CLOCK HOUR,MINUTE"
        db      ",SEC"

; 0x237bc-0x238bc, 256 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_237BC:
        else
FREE_22FFC:
        if      FW_VERSION >= 110
FREE_237BC:
        endif
        endif
        PAD_TO  (APPDATA_SEG*16+0116Ch-SEGBASE)-0feh, 000h
d_a3_w_0106e:
        PAD_TO  APPDATA_SEG*16+0116Ch-SEGBASE, 000h

        db      27h

; 0x238bd-0x23924, 103 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_238BD:
        else
FREE_230FD:
        if      FW_VERSION >= 110
FREE_238BD:
        endif
        endif
        PAD_TO  APPDATA_SEG*16+011D4h-SEGBASE, 000h

d_a3_fp_011d4:
        dw      EP_FAR_285F5_OFF, EP_FAR_285F5_SEG
d_a3_w_011d8:
        if      FW_VERSION >= 111
        db      02h, 1ch
d_a3_b_011da:
        db      00h, 00h
d_a3_w_011dc:
        db      00h, 00h
d_a3_w_011de:
        db      00h, 00h, 00h, 00h, 00h, 00h
        elseif  FW_VERSION >= 110
        db      0f5h, 1bh
d_a3_b_011da:
        db      00h, 00h
d_a3_w_011dc:
        db      00h, 00h
d_a3_w_011de:
        db      00h, 00h, 00h, 00h, 00h, 00h
        else
        db      0dch, 1bh
d_a3_b_011da:
        db      00h, 00h
d_a3_w_011dc:
        db      00h, 00h
d_a3_w_011de:
        db      00h, 00h, 00h, 00h, 00h, 00h
        endif
        db      00h, 00h, 00h
d_a3_b_011e7:
        db      00h
d_a3_w_011e8:
        db      00h, 00h
d_a3_w_011ea:
        db      00h, 00h
d_a3_w_011ec:
        db      03h, 00h
d_a3_w_011ee:
        db      00h, 00h
d_a3_w_011f0:
        db      00h, 00h
d_a3_w_011f2:
        db      00h, 00h
        db      00h, 00h, 00h, 00h
d_a3_w_011f8:
        db      00h, 00h
d_a3_w_011fa:
        db      00h, 00h
d_a3_w_011fc:
        db      00h, 00h
d_a3_w_011fe:
        db      00h, 00h
d_a3_w_01200:
        db      00h, 00h, 00h, 00h
        db      00h, 00h
d_a3_w_01206:
        db      10h, 04h
d_a3_tbl_01208:
        TBL_XS_15B8_DATA
d_a3_w_012aa:
        db      83h, 04h
d_a3_w_012ac:
        db      00h, 00h
d_a3_w_012ae:
        db      00h, 00h
d_a3_w_012b0:
        db      00h, 00h
d_a3_w_012b2:
        db      00h, 00h
d_a3_w_012b4:
        db      00h, 00h
d_a3_w_012b6:
        db      00h, 00h
d_a3_w_012b8:
        db      00h, 00h
d_a3_w_012ba:
        db      00h, 00h
d_a3_w_012bc:
        db      00h, 00h
d_a3_w_012be:
        db      00h, 00h
d_a3_w_012c0:
        db      00h, 00h
d_a3_w_012c2:
        db      00h, 00h
        if      FW_VERSION >= 120
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_L_2938B_OFF, APP3_SEG
        db      98h, 33h, 00h, 00h, 00h
        elseif  FW_VERSION >= 114
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 0abh, 33h, 1dh, 26h, 98h, 33h, 00h, 00h, 00h
        else
d_a3_w_012c4:
        db      00h, 00h
d_a3_w_012c6:
        db      00h, 00h
d_a3_w_012c8:
        db      00h, 00h
d_a3_b_012ca:
        db      00h
        dw      EP_L_2938B_OFF, APP3_SEG
        if      FW_VERSION >= 111
        db      98h, 33h, 00h, 00h, 00h
        elseif  FW_VERSION >= 110
        db      8bh, 33h, 00h, 00h, 00h
        else
        db      61h, 33h, 00h, 00h, 00h
        endif
        endif
        db      17h, 0fh, 0bh, 07h, 05h, 03h, 07h
        db      "EARLIERLATER  "
d_a3_fp_012e9:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        dw      (APP3_BASE+L_29E91-APP3_SEG*16), APP3_SEG
d_a3_w_012ed:
        db      0b4h, 36h
        dw      EP_FAR_29F77_OFF, APP3_SEG
        db      96h, 38h
        elseif  FW_VERSION >= 114
        db      0e1h, 36h, 1dh, 26h, 0b4h, 36h, 0c7h, 37h, 1dh, 26h, 96h, 38h
        else
        dw      (APP3_BASE+L_29E91-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 111
d_a3_w_012ed:
        db      0b4h, 36h
        else
d_a3_w_012ed:
        db      0a7h, 36h
        endif
        dw      EP_FAR_29F77_OFF, APP3_SEG
        if      FW_VERSION >= 111
        db      96h, 38h
        else
        db      89h, 38h
        endif
        endif
        else
        dw      (APP3_BASE+L_29E91-APP3_SEG*16), APP3_SEG
        db      7dh, 36h, 90h, 37h, 9ch, 25h, 5fh, 38h
        endif
        TBL_REC_MODE_NAMES_DATA
        db      05h
        if      FW_VERSION >= 110
        db      "CLICKDRUM1DRUM2DRUM3DRUM4"
        if      FW_VERSION >= 112
        dw      (APP3_BASE+L_2A349-APP3_SEG*16), APP3_SEG
        dw      (APP3_BASE+L_297B9-APP3_SEG*16), APP3_SEG
        else
        dw      (APP3_BASE+L_29A79-APP3_SEG*16), APP3_SEG
        dw      (APP3_BASE+FAR_29D10-APP3_SEG*16), APP3_SEG
        endif
d_a3_w_013a0_2:
        if      FW_VERSION >= 111
d_a3_w_013a0:
        db      0e8h, 3dh
        else
d_a3_w_013a0:
        db      0dbh, 3dh
        endif
d_a3_fp_013a2:
        dw      (APP3_BASE+far_2A116-APP3_SEG*16), APP3_SEG
d_a3_w_013a6_2:
        if      FW_VERSION >= 111
d_a3_w_013a6:
        db      0eeh, 41h
d_a3_w_013a8:
        db      02h
        else
d_a3_w_013a6:
        db      0e1h, 41h
d_a3_w_013a8:
        db      02h
        endif
        else
        db      "CLICKDRUM1DRUM2DRUM3DRUM4b;"
        db      9ch, 25h
        dw      (APP3_BASE+FAR_29D10-APP3_SEG*16), APP3_SEG
d_a3_w_013a0:
        db      0b1h, 3dh
d_a3_fp_013a2:
        dw      EP_FAR_2A116_OFF, APP3_SEG
d_a3_w_013a6:
        db      0b7h, 41h, 02h
        endif
        TBL_SYNC_MODE_NAMES_DATA
        db      03h
        db      "24 25 30D30 "
        db      02h
        db      "A B AB"
        db      0ah
        db      "PLAY STRT   PLAY      STOP    REC+PLAY  ODUB+PLAY REC/PUNCH ODUB/PNCH    TAP    PAD^BANK^APAD^BANK^BPAD^BANK^CPAD^BANK^D PAD  1    PAD  2    PAD  3    PAD  4    PAD  5    PAD  6    PAD  7    PAD  8    PAD  9    PAD 10    PAD 11    PAD 12    PAD 13    PAD 14    PAD 15    PAD 16      F1        F2        F3        F4        F5        F6     "
        db      00h
d_a3_w_0154d:
        db      00h, 00h
d_a3_b_0154f:
        db      00h
d_a3_b_01550:
        db      00h
d_a3_w_01551:
        db      00h, 00h
d_a3_b_01553:
        db      00h
d_a3_b_01554:
        db      00h
d_a3_w_01555:
        db      00h, 00h
d_c0_b_01557:
        db      00h
d_a3_b_01558:
        db      00h
d_a3_w_01559:
        db      00h, 00h
d_a3_b_0155b:
        db      00h
d_a3_b_0155c:
        db      00h
d_a3_w_0155d:
        db      00h, 00h
d_a3_w_0155f:
        db      00h, 00h, 00h, 00h
d_a3_w_01563:
        db      00h
        db      00h
d_a3_w_01565:
        db      00h, 00h, 00h, 00h
d_a3_w_01569:
        db      00h, 00h
d_a3_w_0156b:
        db      00h, 00h, 00h, 00h
d_a3_w_0156f:
        db      00h, 00h
d_a3_w_01571:
        db      00h, 00h, 00h
        db      00h
d_a3_w_01575:
        db      00h, 00h
d_c0_b_01577:
        db      00h
d_a3_b_01578:
        db      7fh
d_a3_b_01579:
        db      41h
d_a3_b_0157a:
        db      22h, 00h
        dw      EP_FAR_2B5B9_OFF, EP_FAR_2B5B9_SEG
        if      FW_VERSION >= 111
        db      0eeh, 4dh
        elseif  FW_VERSION >= 110
        db      0e1h, 4dh
        else
        db      0b7h, 4dh
        endif
        dw      EP_FAR_2B889_OFF, EP_FAR_2B889_SEG
d_a3_w_01586:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_a3_fp_01590:
        dw      EP_L_2BCB6_OFF, EP_L_2BCB6_SEG
d_a3_w_01594:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 111
        db      0f4h, 54h
        else
        db      0e6h, 54h
        endif
d_a3_w_01596_2:
        if      FW_VERSION >= 112
d_a3_w_01596:
        dw      (APP3_BASE+L_2C12B-APP3_SEG*16), APP3_SEG
d_a3_w_0159a:
        db      69h, 59h
d_a3_w_0159c:
        db      00h, 00h
d_a3_b_0159e:
        db      00h
        else
d_a3_w_01596:
        dw      EP_L_2B859_OFF, APP3_SEG
        if      FW_VERSION >= 111
d_a3_w_0159a:
        db      67h, 59h
d_a3_w_0159c:
        db      00h, 00h
d_a3_b_0159e:
        db      00h
        else
d_a3_w_0159a:
        db      59h, 59h
d_a3_w_0159c:
        db      00h, 00h
d_a3_b_0159e:
        db      00h
        endif
        endif
        else
        db      0bch, 54h
d_a3_w_01596:
        db      41h, 59h, 9ch, 25h
d_a3_w_0159a:
        db      2fh, 59h
d_a3_w_0159c:
        db      00h, 00h
d_a3_b_0159e:
        db      00h
        endif
        db      "1^2^3^4^5^6^7^8^9^01-1617-3233-4849-6465-8081-9697-99"

; 0x23d24-0x23e1e, 250 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_23D24:
        else
FREE_23564:
        if      FW_VERSION >= 110
FREE_23D24:
        endif
        endif
        PAD_TO  APPDATA_SEG*16+016CEh-SEGBASE, 000h

        db      27h

; 0x23e1f-0x23e86, 103 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_23E1F:
        else
FREE_2365F:
        if      FW_VERSION >= 110
FREE_23E1F:
        endif
        endif
        PAD_TO  APPDATA_SEG*16+01736h-SEGBASE, 000h

        dw      (APP3_BASE+L_2C6D1-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 112
        db      0a2h, 5eh, 00h, 00h
        elseif  FW_VERSION >= 111
        db      0a0h, 5eh, 00h, 00h
        elseif  FW_VERSION >= 110
        db      92h, 5eh, 00h, 00h
        else
        db      66h, 5eh, 00h, 00h
        endif
        db      "1-011-021-031-041-051-061-071-081-091-101-111-121-131-141-151-161-Ex2-012-022-032-042-052-062-072-082-092-102-112-122-132-142-152-162-Ex"
d_a3_fp_017c6:
        dw      EP_L_2C9BF_OFF, EP_L_2C9BF_SEG
d_a3_w_017ca:
        if      FW_VERSION >= 112
        db      0d9h, 61h
d_a3_b_017cc:
        db      00h
        elseif  FW_VERSION >= 111
        db      0d7h, 61h
d_a3_b_017cc:
        db      00h
        elseif  FW_VERSION >= 110
        db      0c9h, 61h
d_a3_b_017cc:
        db      00h
        else
        db      9dh, 61h
d_a3_b_017cc:
        db      00h
        endif
        TBL_EVENT_TYPE_NAMES_DATA
d_a3_fp_01816:
        if      FW_VERSION >= 114
        dw      EP_FAR_2CD36_OFF, APP3_SEG
d_a3_w_0181a:
        db      6bh, 65h
d_a3_b_0181c:
        db      00h, 08h
        elseif  FW_VERSION >= 112
        db      86h, 65h, 0feh, 25h
d_a3_w_0181a:
        db      6bh, 65h
d_a3_b_0181c:
        db      00h, 08h
        elseif  FW_VERSION >= 111
        db      84h, 65h, 0eeh, 25h
d_a3_w_0181a:
        db      69h, 65h
d_a3_b_0181c:
        db      00h, 08h
        elseif  FW_VERSION >= 110
        db      76h, 65h, 0edh, 25h
d_a3_w_0181a:
        db      5bh, 65h
d_a3_b_0181c:
        db      00h, 08h
        else
d_a3_w_01816:
        db      "Je"
        db      9ch, 25h
d_a3_w_0181a:
        db      2fh, 65h
d_a3_b_0181c:
        db      00h, 08h
        endif
        db      "OFF     AS TRACKOMNI-A  OMNI-B  OMNI-AB "
d_a3_w_01846:
        if      FW_VERSION >= 110
        db      00h, 00h
d_a3_fp_01848:
        dw      (APP3_BASE+FAR_2D074-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 112
d_a3_w_0184c:
        db      0a8h, 68h
d_a3_b_0184e:
        db      00h
d_a3_b_0184f:
        db      01h
        elseif  FW_VERSION >= 111
        db      0a6h, 68h
d_a3_b_0184e:
        db      00h
d_a3_b_0184f:
        db      01h
        else
        db      98h, 68h
d_a3_b_0184e:
        db      00h
d_a3_b_0184f:
        db      01h
        endif
        TBL_EDIT_OP_NAMES_DATA
        db      00h, 00h, 00h, 00h, 00h, 00h
        if      FW_VERSION >= 112
d_a3_fp_01880:
        dw      (APP3_BASE+L_2CB76-APP3_SEG*16), APP3_SEG
d_a3_w_01884:
        db      57h, 6ch
        else
d_a3_fp_01880:
        dw      EP_L_2CB76_OFF, APP3_SEG
        if      FW_VERSION >= 111
d_a3_w_01884:
        db      55h, 6ch
        else
d_a3_w_01884:
        db      47h, 6ch
        endif
        endif
d_a3_w_01886:
        TBL_ERASE_MODE_NAMES_DATA
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
d_a3_b_01911:
        db      00h
d_a3_b_01912:
        db      02h
d_a3_b_01913:
        db      01h, 00h
d_a3_b_01915:
        db      40h
d_a3_b_01916:
        db      00h, 00h, 00h, 00h
d_a3_fp_0191a:
        dw      EP_L_2DA1A_OFF, APP3_SEG
        if      FW_VERSION >= 112
d_a3_w_0191e:
        db      0b2h, 73h, 00h, 00h
d_a3_w_01922:
        db      00h, 00h, 55h, 7ch
d_a3_w_01926:
        db      0f7h, 89h
d_a3_w_01928:
        db      00h, 00h, 00h, 00h
d_a3_w_0192c:
        db      00h, 00h, 00h, 00h
d_a3_w_01930:
        db      00h, 00h, 00h, 00h
d_a3_w_01934:
        db      00h, 00h
        elseif  FW_VERSION >= 111
d_a3_w_0191e:
        db      0b0h, 73h, 00h, 00h
d_a3_w_01922:
        db      00h, 00h, 53h, 7ch
d_a3_w_01926:
        db      0f5h, 89h
d_a3_w_01928:
        db      00h, 00h, 00h, 00h
d_a3_w_0192c:
        db      00h, 00h, 00h, 00h
d_a3_w_01930:
        db      00h, 00h, 00h, 00h
d_a3_w_01934:
        db      00h, 00h
        else
d_a3_w_0191e:
        db      0a2h, 73h, 00h, 00h
d_a3_w_01922:
        db      00h, 00h, 45h, 7ch
d_a3_w_01926:
        db      0e7h, 89h
d_a3_w_01928:
        db      00h, 00h, 00h, 00h
d_a3_w_0192c:
        db      00h, 00h, 00h, 00h
d_a3_w_01930:
        db      00h, 00h, 00h, 00h
d_a3_w_01934:
        db      00h, 00h
        endif
d_a3_w_01936:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_a3_fp_01940:
        dw      EP_L_2E658_OFF, APP3_SEG
        if      FW_VERSION >= 112
        dw      (APP3_BASE+L_2DE86-APP3_SEG*16), APP3_SEG
        elseif  FW_VERSION >= 111
        db      0a6h, 7fh
        db      0eeh, 25h
        else
        db      98h, 7fh
        db      0edh, 25h
        endif
        dw      EP_L_2EBE3_OFF, APP3_SEG
        if      FW_VERSION >= 111
        dw      EP_FAR_2EC72_OFF, APP3_SEG
d_a3_fp_01950:
        dw      EP_L_2EFBD_OFF, APP3_SEG
        else
        db      0b2h, 84h, 0edh, 25h
d_a3_fp_01950:
        db      0fdh, 87h, 0edh, 25h
        endif

        else
        db      00h, 00h
d_a3_fp_01848:
        db      86h, 68h, 9ch, 25h
d_a3_w_0184c:
        db      6ah, 68h
d_a3_b_0184e:
        db      00h
d_a3_b_0184f:
        db      01h, 0ah
        db      "ADD VALUE SUB VALUE MULT VAL% SET TO VAL"
        db      7 dup (00h)
d_a3_fp_01880:
        db      5ah, 6ch, 9ch, 25h
d_a3_w_01884:
        db      19h, 6ch
d_a3_w_01886:
        db      7 dup (00h)
        db      0ch
        db      "ALL EVENTS  ALL EXCEPT  ONLY ERASE  "
        db      0ch
        db      "NOTES       PITCH BEND  CONTROL:    PROG CHANGE CH PRESSURE POLY PRESS  EXCLUSIVE   "
        db      10 dup (00h)
d_a3_b_01911:
        db      1 dup (00h)
d_a3_b_01912:
        db      02h
d_a3_b_01913:
        db      01h, 00h
d_a3_b_01915:
        db      40h
d_a3_b_01916:
        db      4 dup (00h)
d_a3_fp_0191a:
        db      2ch, 72h, 9ch, 25h
d_a3_w_0191e:
        db      74h, 73h
        db      2 dup (00h)
d_a3_w_01922:
        db      2 dup (00h)
        db      17h, 7ch
d_a3_w_01926:
        db      0b9h, 89h
d_a3_w_01928:
        db      4 dup (00h)
d_a3_w_0192c:
        db      4 dup (00h)
d_a3_w_01930:
        db      4 dup (00h)
d_a3_w_01934:
        db      2 dup (00h)
d_a3_w_01936:
        db      10 dup (00h)
d_a3_fp_01940:
        db      6ah, 7eh, 9ch, 25h, 6ah, 7fh, 9ch, 25h, 0f5h, 83h, 9ch, 25h, 84h, 84h, 9ch, 25h
d_a3_fp_01950:
        db      0cfh, 87h, 9ch, 25h, 00h, 00h

        endif
; 0x240a4-0x2413d, 153 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_240A4:
        else
FREE_238E4:
        if      FW_VERSION >= 110
FREE_240A4:
        endif
        endif
        PAD_TO  (APPDATA_SEG*16+019EDh-SEGBASE)-091h, 000h
d_a3_w_0195c:
        PAD_TO  (APPDATA_SEG*16+019EDh-SEGBASE)-08fh, 000h
d_a3_w_0195e:
        PAD_TO  (APPDATA_SEG*16+019EDh-SEGBASE)-08dh, 000h
d_a3_w_01960:
        PAD_TO  (APPDATA_SEG*16+019EDh-SEGBASE)-08bh, 000h
d_a3_w_01962:
        PAD_TO  (APPDATA_SEG*16+019EDh-SEGBASE)-084h, 000h
d_a3_b_01969:
        PAD_TO  (APPDATA_SEG*16+019EDh-SEGBASE)-083h, 000h
d_a3_b_0196a:
        PAD_TO  (APPDATA_SEG*16+019EDh-SEGBASE)-082h, 000h
d_a3_tbl_0196b:
        PAD_TO  APPDATA_SEG*16+019EDh-SEGBASE, 000h

        db      0e0h, 0b0h, 0c0h, 0a0h, 0d0h, 0f0h
        TBL_EVENT_FILTER_NAMES_DATA
        db      "EXCLUSIVE   "
        db      0ch
        db      "    ALL     "
        TBL_MIDI_CC_NAMES_DATA
        db      1dh
        db      "                             >STEREO LEVEL   N:64/A01   L:>STEREO PAN     N:64/A01   P:>"
        TBL_FXSEND_LEVEL_TEXT_DATA
        db      " >INDIV LEVEL    N:64/A01   L:"
        db      01h, 02h
        db      003h, 005h, 000h, 000h, 001h, 002h, 000h, 003h, 003h, "TunDcyA"
        db      "tkFlt"
        db      0eh
        db      "     NOTE     "
        TBL_EVENT_TYPE_NAMES_LONG_DATA
        db      " EXCLUSIVE       MIXER     "
        db      00h, 00h, 00h, 00h, 3ch, 01h, 7fh, 40h, 00h, 00h
        db      00h, 00h, 0e0h, 00h, 40h, 00h, 00h, 00h, 00h, 00h, 0b0h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 0c0h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0d0h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 0a0h, 3ch, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 0f0h, 09h, 00h, 00h, 01h, 30h, 20h, 18h, 10h, 0ch, 08h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 3ch, 05h, 7fh, 00h, 00h, 00h, 00h, 00h, 0a0h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 0b0h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0c0h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 0d0h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0e0h
        db      7fh, 7fh, 00h, 00h, 00h, 00h, 00h, 0f0h, 11h, 00h, 00h, 0f0h, 47h, 00h, 44h, 45h
        db      01h, 00h, 07h, 08h, 09h, 0ah, 0bh, 0ch, 0dh, 00h, 00h, 0f7h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 0f8h, 00h, 00h, 00h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh
d_a3_w_02260:
        db      00h, 00h
d_a3_w_02262:
        db      00h, 00h
d_a3_w_02264:
        db      00h, 00h
d_a3_fp_02266:
        dw      EP_L_305E3_OFF, EP_L_305E3_SEG
        if      FW_VERSION >= 112
        db      0e1h, 9dh
d_a3_w_0226c:
        db      00h
        elseif  FW_VERSION >= 111
        db      0dfh, 9dh
d_a3_w_0226c:
        db      00h
        elseif  FW_VERSION >= 110
        db      0d1h, 9dh
d_a3_w_0226c:
        db      00h
        else
        db      0a3h, 9dh
d_a3_w_0226c:
        db      00h
        endif
        db      00h, 00h, 00h
d_a3_fp_02270:
        dw      EP_L_30BDD_OFF, EP_L_30BDD_SEG
        db      00h, 00h, 00h, 00h, 0b0h, 04h, 01h, 03h, 00h
        db      00h, 00h, 00h, 0ch, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 01h, 64h, 00h
        db      00h, 01h, 00h, 00h, 00h, 00h, 00h, 7fh, 40h, 01h, 00h, 01h, 00h, 00h, 00h, 01h
        db      02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0ah, 0bh, 0ch, 0dh, 0eh, 0fh, 10h, 11h
        db      12h, 13h, 14h, 15h, 16h, 17h, 18h, 19h, 1ah, 1bh, 1ch, 1dh, 1eh, 1fh, 20h, 21h
        db      22h, 01h, 00h, 00h, 00h, 00h, 00h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 00h, 00h, 00h, 00h, 01h, 00h, 00h, 53h, 6fh
        db      "ng            "
        db      01h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 64h

; 0x24a75-0x24ac4, 79 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_24A75:
        else
FREE_242B5:
        if      FW_VERSION >= 110
FREE_24A75:
        endif
        endif
        PAD_TO  APPDATA_SEG*16+02374h-SEGBASE, 000h

        db      "Sequence        "
        db      01h, 00h, 00h, 01h, 01h, 00h, 0b0h, 04h, 04h, 04h, 02h, 00h, 00h, 00h, 00h, 00h
        db      80h, 84h, 1eh, 00h, 80h, 84h, 1eh, 00h, 80h, 84h, 1eh, 00h, 80h, 84h, 1eh, 00h
        db      00h, 00h, 0ffh, 0ffh, 01h

; 0x24af9-0x24b3c, 67 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_24AF9:
        else
FREE_24339:
        if      FW_VERSION >= 110
FREE_24AF9:
        endif
        endif
        PAD_TO  APPDATA_SEG*16+023ECh-SEGBASE, 000h

        db      "        Device01Device02De"
d_a3_tbl_02406:
        db      "vice03Device04Device05Device06Device07Device08Device09Device10Device11Device12Device13Device14Device15Device16Device17Device18Device19Device20Device21Device22Device23Device24Device25Device26Device27Device28Device29Device30Device31Device32Track-01        Track-02        Track-03        Track-04        Track-05        Track-06        Track-07        Track-08        Track-09        Track-10        Track-11        Track-12        Track-13        Track-14        Track-15        Track-16        Track-17        Track-18        Track-19        Track-20        Track-21        Track-22        Track-23        Track-24        Track-25        Track-26        Track-27        Track-28        Track-29        Track-30        Track-31        Track-32        Track-33        Track-34        Track-35        Track-36        Track-37        Track-38        Track-39        Track-40        Track-41        Track-42        Track-43        Track-44        Track-45        Track-46        Track-47        Track-48        Track-49        Track-50        Track-51        Track-52        Track-53        Track-54        Track-55        Track-56        Track-57        Track-58        Track-59        Track-60        Track-61        Track-62        Track-63        Track-64        "

; 0x25044-0x25084, 64 x 00h -- per-track default, 1 byte/track
        if      FW_VERSION >= 114
FREE_25044:
        else
FREE_24884:
        if      FW_VERSION >= 110
FREE_25044:
        endif
        endif
        PAD_TO  APPDATA_SEG*16+02934h-SEGBASE, 000h


; 0x25084-0x250c4, 64 x 01h -- per-track default, 1 byte/track
        if      FW_VERSION >= 114
FREE_25084:
        else
FREE_248C4:
        if      FW_VERSION >= 110
FREE_25084:
        endif
        endif
        PAD_TO  APPDATA_SEG*16+02974h-SEGBASE, 001h


; 0x250c4-0x25104, 64 x 00h -- per-track default, 1 byte/track
        if      FW_VERSION >= 114
FREE_250C4:
        else
FREE_24904:
        if      FW_VERSION >= 110
FREE_250C4:
        endif
        endif
        PAD_TO  APPDATA_SEG*16+029B4h-SEGBASE, 000h


; 0x25104-0x25144, 64 x 64h -- per-track default, Velo% 100
        if      FW_VERSION >= 114
FREE_25104:
        else
FREE_24944:
        if      FW_VERSION >= 110
FREE_25104:
        endif
        endif
        PAD_TO  APPDATA_SEG*16+029F4h-SEGBASE, 064h


; 0x25144-0x25184, 64 x 06h -- per-track default, 1 byte/track
        if      FW_VERSION >= 114
FREE_25144:
        else
FREE_24984:
        if      FW_VERSION >= 110
FREE_25144:
        endif
        endif
        PAD_TO  APPDATA_SEG*16+02A34h-SEGBASE, 006h


; 0x25184-0x251cc, 72 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_25184:
        if      FW_VERSION >= 120
        PAD_TO  (APPDATA_SEG*16+02A7Ch-SEGBASE)-08h, 000h
d_a3_w_02a74:
        PAD_TO  (APPDATA_SEG*16+02A7Ch-SEGBASE)-06h, 000h
d_a3_w_02a76:
        PAD_TO  (APPDATA_SEG*16+02A7Ch-SEGBASE)-04h, 000h
d_a3_w_02a78:
        PAD_TO  (APPDATA_SEG*16+02A7Ch-SEGBASE)-02h, 000h
d_a3_w_02a7a:
        PAD_TO  APPDATA_SEG*16+02A7Ch-SEGBASE, 000h
        db      03h
        db      "OFF 2  3  4 "
L_251DA                         equ     $+1
        db      00h, 00h, 00h
L_251E7                         equ     $+11
        db      00h, 00h, 00h, 00h
        dw      (APP3_BASE+FAR_3139C-APP3_SEG*16), APP3_SEG
        db      90h, 0abh, 00h, 00h, 00h, 00h, 00h, 00h
L_251ED                         equ     $+1
        db      00h, 06h
        db      "TUNINGDECAY ATTACKFILTER\""
        db      0b5h, 23h, 00h, 00h, 00h, 00h, 08h
        db      "VELOCITYNOTE V"
        db      41h, 52h, 00h, 00h
        dw      EP_L_31E4B_OFF, APP3_SEG
        db      0b2h, 0b8h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_a3_fp_02ae8:
        dw      (APP3_BASE+L_323B3-APP3_SEG*16)
        dw      APP3_SEG
        db      0dfh, 0bbh
        TBL_TRANSPOSE_NAMES_DATA
        else
L_251DA                         equ     $+73
        PAD_TO  (APPDATA_SEG*16+02A80h-SEGBASE)-0ch, 000h
d_a3_w_02a74:
        PAD_TO  (APPDATA_SEG*16+02A80h-SEGBASE)-0ah, 000h
d_a3_w_02a76:
        PAD_TO  (APPDATA_SEG*16+02A80h-SEGBASE)-08h, 000h
d_a3_w_02a78:
        PAD_TO  (APPDATA_SEG*16+02A80h-SEGBASE)-06h, 000h
d_a3_w_02a7a:
        PAD_TO  APPDATA_SEG*16+02A80h-SEGBASE, 000h
L_251E7                         equ     $+7
L_251ED                         equ     $+13
        dw      (APP3_BASE+FAR_3139C-APP3_SEG*16), APP3_SEG
        db      82h, 0abh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 54h, 55h
        db      "NINGDECAY ATTACKFILTER"
        db      14h, 0b5h, 23h, 00h, 00h, 00h, 00h, 08h
        db      "VELOCITYNOTE VAR"
        endif
        db      00h, 00h
        if      FW_VERSION >= 120
        db      00h, 00h, 00h, 00h
        dw      EP_FAR_32782_OFF, EP_FAR_32782_SEG
        dw      (C0_BASE+far_32B57-APP3_SEG*16)
        dw      APP3_SEG
        db      1fh, 0c1h
        dw      (C0_BASE+L_32686-APP3_SEG*16)
L_252A3                         equ     $+7
L_252A7                         equ     $+11
L_252A9                         equ     $+13
L_252A4                         equ     $+8
L_252A6                         equ     $+10
        dw      APP3_SEG
d_c0_w_02b4e:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 01h, 00h, 0ch, 03h, 00h
        db      07h
        db      "REPLACEMERGE  "
        else
        dw      EP_FAR_3185D_OFF, APP3_SEG
        db      0a4h, 0b8h, 00h, 00h, 00h, 00h
d_a3_b_02aca:
        db      00h
d_a3_b_02acb:
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_a3_w_02ad8:
        dw      (APP3_BASE+far_31DC5-APP3_SEG*16), APP3_SEG
d_a3_w_02adc:
        db      0d1h, 0bbh
        TBL_TRANSPOSE_NAMES_DATA
        db      00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_FAR_32782_OFF, EP_FAR_32782_SEG
        db      99h, 0c3h, 1dh, 26h, 11h, 0c1h, 0b6h, 0c4h, 1dh, 26h
d_c0_w_02b3e:
        db      00h, 00h
L_252A3                         equ     $+3
L_252A7                         equ     $+7
L_252A9                         equ     $+9
L_252A4                         equ     $+4
L_252A6                         equ     $+6
        db      00h, 00h
d_c0_b_02b42:
        db      00h, 00h
d_c0_w_02b44:
        db      00h, 00h, 00h, 01h, 00h
d_c0_b_02b49:
        db      0ch, 03h, 00h, 07h, 52h, 45h, 50h
        db      "LACEMERGE  "
        endif
        else
FREE_249C4:
        if      FW_VERSION >= 110
FREE_25184:
        endif
L_251DA                         equ     $+73
        PAD_TO  (APPDATA_SEG*16+02A80h-SEGBASE)-0ch, 000h
d_a3_w_02a74:
        PAD_TO  (APPDATA_SEG*16+02A80h-SEGBASE)-0ah, 000h
d_a3_w_02a76:
        PAD_TO  (APPDATA_SEG*16+02A80h-SEGBASE)-08h, 000h
d_a3_w_02a78:
        PAD_TO  (APPDATA_SEG*16+02A80h-SEGBASE)-06h, 000h
d_a3_w_02a7a:
        PAD_TO  APPDATA_SEG*16+02A80h-SEGBASE, 000h

        if      FW_VERSION >= 112
        db      0deh, 0abh, 0feh, 25h, 82h, 0abh, 00h
d_a3_b_02a87:
        db      00h, 00h, 00h, 00h, 00h, 00h, 06h, 54h, 55h
        elseif  FW_VERSION >= 111
        db      0dch, 0abh, 0eeh, 25h, 80h, 0abh, 00h
d_a3_b_02a87:
        db      00h, 00h, 00h, 00h, 00h, 00h, 06h, 54h, 55h
        elseif  FW_VERSION >= 110
        db      0ceh, 0abh, 0edh, 25h, 72h, 0abh, 00h
d_a3_b_02a87:
        db      00h, 00h, 00h, 00h, 00h, 00h, 06h, 54h, 55h
        else
        dw      (APP3_BASE+FAR_3139C-APP3_SEG*16), APP3_SEG
        db      44h, 0abh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 54h, 55h
        endif
        db      "NINGDECAY ATTACKFILTER"
        if      FW_VERSION >= 112
        db      14h, 0b5h, 23h, 00h, 00h, 00h, 00h, 08h
        elseif  FW_VERSION >= 111
        db      12h, 0b5h, 23h, 00h, 00h, 00h, 00h, 08h
        elseif  FW_VERSION >= 110
        db      4h, 0b5h, 23h, 00h, 00h, 00h, 00h, 08h
        else
        db      0d6h, 0b4h
d_a3_b_02aa8:
        db      23h
d_a3_b_02aa9:
        db      00h
d_a3_b_02aaa:
        db      00h, 00h
d_a3_b_02aac:
        db      00h, 08h
        endif
        db      "VELOCITYNOTE VAR"
        db      00h, 00h
        if      FW_VERSION >= 112
        dw      EP_FAR_3185D_OFF, APP3_SEG
        db      0a4h, 0b8h, 00h, 00h, 00h, 00h
d_a3_b_02aca:
        db      00h
d_a3_b_02acb:
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_a3_w_02ad8:
        dw      (APP3_BASE+FAR_31BD5-APP3_SEG*16), APP3_SEG
d_a3_w_02adc:
        db      0d1h, 0bbh
        elseif  FW_VERSION >= 111
        db      8bh, 0b6h, 0eeh, 25h, 0a2h, 0b8h, 00h, 00h, 00h, 00h
d_a3_b_02aca:
        db      00h
d_a3_b_02acb:
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0f3h, 0bbh, 0eeh, 25h, 0cfh, 0bbh
        elseif  FW_VERSION >= 110
        db      7dh, 0b6h, 0edh, 25h, 94h, 0b8h, 00h, 00h, 00h, 00h
d_a3_b_02aca:
        db      00h
d_a3_b_02acb:
        db      00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0e5h, 0bbh, 0edh, 25h, 0c1h, 0bbh
        else
        dw      EP_L_3100F_OFF, APP3_SEG
        db      66h, 0b8h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0b7h, 0bbh, 9ch, 25h, 93h, 0bbh
        endif
        TBL_TRANSPOSE_NAMES_DATA
        db      00h, 00h, 00h, 00h, 00h, 00h
d_c0_w_02b30:
        dw      EP_FAR_32782_OFF, EP_FAR_32782_SEG
        if      FW_VERSION >= 112
        db      99h, 0c3h, 0feh, 25h, 11h, 0c1h, 0b6h, 0c4h, 0feh, 25h
d_c0_w_02b3e:
        db      00h, 00h
        elseif  FW_VERSION >= 111
        db      97h, 0c3h, 0eeh, 25h, 0fh, 0c1h, 0b4h, 0c4h, 0eeh, 25h
d_c0_w_02b3e:
        db      00h, 00h
        elseif  FW_VERSION >= 110
        db      89h, 0c3h, 0edh, 25h, 01h, 0c1h, 0a6h, 0c4h, 0edh, 25h
d_c0_w_02b3e:
        db      00h, 00h
        else
        dw      (C0_BASE+FAR_31D19-APP3_SEG*16), APP3_SEG
        db      0d1h, 0c0h, 76h, 0c4h, 9ch, 25h
d_c0_w_02b3e:
        db      00h, 00h
        endif
L_252A3                         equ     $+3
L_252A7                         equ     $+7
L_252A9                         equ     $+9
L_252A4                         equ     $+4
L_252A6                         equ     $+6
        db      00h, 00h
d_c0_b_02b42:
        db      00h, 00h
d_c0_w_02b44:
        db      00h, 00h, 00h, 01h, 00h
d_c0_b_02b49:
        db      0ch
d_c0_w_02b4a:
        db      03h, 00h, 07h, 52h, 45h, 50h
        db      "LACEMERGE  "
        endif
        db      0ah
        db      "ADD VALUE SUB VALUE MULTI VAL%SET TO VAL"
        db      03h
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        db      "-12-11-10 -9 -8 -7 -6 -5 -4 -3 -2 -1  0 +1 +2 +3 +4 +5 +6 +7 +8 +9+10+1"
        db      31h, 2bh, 31h, 32h
        dw      (C0_BASE+far_32F2B-APP3_SEG*16)
        dw      APP3_SEG
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h
        dw      (C0_BASE+L_34479-APP3_SEG*16)
        dw      APP3_SEG
d_c0_w_02bf4:
        dw      (C0_BASE+cb_33C65-APP3_SEG*16)
        dw      (C0_BASE+L_346DF-APP3_SEG*16)
        dw      APP3_SEG
        db      1dh, 0dfh
        db      9bh, 0e2h, 00h, 00h, 00h, 00h
d_c0_w_02c02:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        else
        db      "-12-11-10 -9 -8 -7 -6 -5 -4 -3 -2 -1  0 +1 +2 +3 +4 +5 +6 +7 +8 +9+10+11+12"
        dw      EP_FAR_32F2B_OFF, APP3_SEG
        db      00h, 00h
d_c0_w_02bd6:
        db      00h, 00h
d_c0_w_02bd8:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        if      FW_VERSION >= 114
        db      0bbh, 0dch, 1dh, 26h
d_c0_w_02be4:
        db      95h, 0dah
d_c0_w_02be6:
        db      21h, 0dfh, 1dh, 26h, 0fh, 0dfh, 8dh, 0e2h, 00h, 00h
        else
        if      FW_VERSION >= 112
        db      0bbh, 0dch, 0feh, 25h
d_c0_w_02be4:
        db      95h, 0dah
d_c0_w_02be6:
        db      21h, 0dfh, 0feh, 25h, 0fh, 0dfh, 8dh, 0e2h, 00h, 00h
        else
        if      FW_VERSION >= 111
d_c0_w_02be0:
        db      0b9h, 0dch, 0eeh, 25h
d_c0_w_02be4:
        db      93h, 0dah, 1fh, 0dfh, 0eeh, 25h
d_c0_w_02bea:
        db      0dh, 0dfh, 8bh, 0e2h, 00h, 00h
        else
d_c0_w_02be0:
        db      0abh, 0dch, 0edh, 25h
d_c0_w_02be4:
        db      85h, 0dah, 11h, 0dfh, 0edh, 25h
d_c0_w_02bea:
        db      0ffh, 0deh, 7dh, 0e2h, 00h, 00h
        endif
; 0x24b86-0x24d7c, 502 bytes of ffh -- unverified, do not assume free
        endif
        endif
        endif
        else
        db      "-12-11-10 -9 -8 -7 -6 -5 -4 -3 -2 -1  0 +1 +2 +3 +4 +5 +6 +7 +8 +9+10+11+12"
        dw      EP_FAR_32F2B_OFF, APP3_SEG
        db      00h, 00h
d_c0_w_02bd6:
        db      00h, 00h
d_c0_w_02bd8:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c0_w_02be0:
        db      84h, 0dch, 9ch, 25h
d_c0_w_02be4:
        db      55h, 0dah, 0deh, 0deh, 9ch, 25h, 0cch, 0deh, 4ah, 0e2h, 00h, 00h
        endif
        db      00h, 00h
d_c0_w_02bf2:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c0_w_02bfa:
        db      00h, 00h, 00h, 00h, 00h, 00h
d_c0_w_02c00:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_c0_w_02c08:
        db      00h, 00h, 00h, 00h, 00h, 00h
d_c0_w_02c0e:
        db      00h, 00h
        if      FW_VERSION >= 120
        db      00h, 00h, 00h, 00h, 00h, 00h, 03h
        else
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 03h
        endif
        db      "MASSEQ"
        db      14h
        db      "REFERENCED TO 1ST SQOFF TRACKS IGNORED  MERGED ON MIDI CH.  (Unused)        "
        if      FW_VERSION >= 112

; 0x253d6-0x255cc, 502 bytes of ffh -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_253D6:
        if      FW_VERSION >= 120
        PAD_TO  APPDATA_SEG*16+02E7Ch-SEGBASE, 0ffh
        else
        PAD_TO  APPDATA_SEG*16+02E6Ch-SEGBASE, 0ffh
        endif

        else
FREE_24C06:
FREE_253D6:
        PAD_TO  APPDATA_SEG*16+02E6Ch-SEGBASE, 0ffh

        endif
        elseif  FW_VERSION >= 110
FREE_24C06:
; 0x24d94-0x24e0a, 118 bytes of 00h -- unverified, do not assume free
FREE_253D6:
        PAD_TO  APPDATA_SEG*16+02E6Ch-SEGBASE, 0ffh
        else

; 0x248d6-0x24acc, 502 bytes of ffh -- unverified, do not assume free
FREE_248D6:
        PAD_TO  APPDATA_SEG*16+02E6Ch-SEGBASE, 0ffh

        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      EP_BR_1C359_OFF, EP_BR_1C359_SEG
        if      FW_VERSION >= 110
        db      09h, 19h
        else
        db      0e1h, 18h
        endif
        dw      EP_FAR_1C7CE_OFF, EP_FAR_1C7CE_SEG
        if      FW_VERSION >= 110
        db      0e5h, 1dh
        if      FW_VERSION >= 112

; 0x255e4-0x2565a, 118 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_255E4:
        if      FW_VERSION >= 120
        PAD_TO  (APPDATA_SEG*16+02F0Ah-SEGBASE)-023h, 000h
d_a2_b_02ee7:
        PAD_TO  APPDATA_SEG*16+02F0Ah-SEGBASE, 000h
        else
        PAD_TO  (APPDATA_SEG*16+02EFAh-SEGBASE)-018h, 000h
d_a2_w_02ee2:
        PAD_TO  APPDATA_SEG*16+02EFAh-SEGBASE, 000h
        endif

        else
FREE_24E14:
FREE_255E4:
        PAD_TO  (APPDATA_SEG*16+02EFAh-SEGBASE)-018h, 000h
d_a2_w_02ee2:
        PAD_TO  APPDATA_SEG*16+02EFAh-SEGBASE, 000h

        endif
        else
FREE_24E14:
; 0x24fb3-0x250ae, 251 bytes of 00h -- unverified, do not assume free
FREE_255E4:
        PAD_TO  (APPDATA_SEG*16+02EFAh-SEGBASE)-018h, 000h
d_a2_w_02ee2:
        PAD_TO  (APPDATA_SEG*16+02EFAh-SEGBASE)-010h, 000h
d_a2_w_02eea:
        PAD_TO  APPDATA_SEG*16+02EFAh-SEGBASE, 000h
        endif
        else
        db      0bch, 1dh

; 0x24ae4-0x24b5a, 118 bytes of 00h -- unverified, do not assume free
FREE_24AE4:
        PAD_TO  (APPDATA_SEG*16+02EFAh-SEGBASE)-018h, 000h
d_a2_w_02ee2:
        PAD_TO  (APPDATA_SEG*16+02EFAh-SEGBASE)-010h, 000h
d_a2_w_02eea:
        PAD_TO  APPDATA_SEG*16+02EFAh-SEGBASE, 000h

        endif
        db      "                    NEWFOLDR            "
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
media_type_names:                       ; width 9, 15, DS:2F5Bh: No disk/1.44M/MPC3000/...
        db      09h
        db      "No disk  ???????  1.44M    720K     MPC3000  S3000    S1000    640K     EMU      Roland   MPC2000  MPC2000XLPC       No FROM  PC       "
        if      FW_VERSION >= 110
unknown_9_bytes:
        if      FW_VERSION >= 114
        db      12h, 02h, 03h, 04h, 12h, 05h, 07h, 06h, 08h
device_names:
file_type_ext_table             equ     $+143
file_type_names                 equ     $+03dh
        TBL_DEVICE_FILETYPE_NAMES_DATA
        else
        db      12h, 02h, 03h, 04h, 12h, 05h, 07h, 06h, 08h, 06h
        db      "FloppySCSI-0SCSI-1SCSI-2SCSI-3SCSI-4SCSI-5SCSI-6SCSI-7F-ROM "
FILE_TYPE_NAMES:
        db      09h
        db      "All Files.SND     .PGM     .APS     .MID     .ALL     .WAV     .SEQ     .SET        SNDPGMAPSMIDALLWAVSEQSET"
        endif
autoload_option_names:                  ; width 7, 4, DS:3096h: OFF/APS/ALL/APS+ALL bitmask
        else
        db      12h, 02h, 03h, 04h, 12h, 05h, 07h, 06h, 08h
        TBL_DEVICE_FILETYPE_NAMES_DATA
        endif
        pop     es
        db      "OFF    APS    ALL    APS+ALL"

; 0x25803-0x258fe, 251 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_25803:
        if      FW_VERSION >= 120
        PAD_TO  APPDATA_SEG*16+031AEh-SEGBASE, 000h
        else
        PAD_TO  APPDATA_SEG*16+0319Eh-SEGBASE, 000h
        endif

        else
FREE_25033:
        if      FW_VERSION >= 110
FREE_25803:
        endif
        PAD_TO  APPDATA_SEG*16+0319Eh-SEGBASE, 000h

        endif
        db      27h

; 0x258ff-0x25966, 103 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_258FF:
        if      FW_VERSION >= 120
        PAD_TO  APPDATA_SEG*16+03216h-SEGBASE, 000h
        else
        PAD_TO  APPDATA_SEG*16+03206h-SEGBASE, 000h
        endif

        else
FREE_2512F:
        if      FW_VERSION >= 110
FREE_258FF:
        endif
        PAD_TO  APPDATA_SEG*16+03206h-SEGBASE, 000h

        endif
        db      "MPC2000XL"
        db      00h, 00h, 00h, 00h
        db      "MPC2000 ALL"
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      0fh
        db      "HIHT CLSD (A01)HIHT MEDM (A01)HIHT OPEN (A01)SNR1      (A02)SNR2      (A03)BASS      (A04)TOM1      (A05)TOM2      (A06)TOM3      (A07)TOM4      (A08)RID1      (A09)RID2      (A10)CRS1      (A11)CRS2      (A12)PRC1      (A13)PRC2      (A14)PRC3      (A15)PRC4      (A16)DR01      (B01)DR02      (B02)DR03      (B03)DR04      (B04)DR05      (B05)DR06      (B06)DR07      (B07)DR08      (B08)DR09      (B09)DR10      (B10)DR11      (B11)DR12      (B12)DR13      (B13)DR14      (B14)DR15      (B15)DR16      (B16)"
        db      00h
        db      "*R.&%$0/-+3517E68'9:;<=>?@ABCDFGHI"
        db      0ah
        db      "NO(FASTER)YES"
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h

; 0x25bdd-0x25dde, 513 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_25BDD:
        if      FW_VERSION >= 120
        PAD_TO  APPDATA_SEG*16+0368Eh-SEGBASE, 000h
        else
        PAD_TO  APPDATA_SEG*16+0367Eh-SEGBASE, 000h
        endif

        else
FREE_2540D:
        if      FW_VERSION >= 110
FREE_25BDD:
        endif
        PAD_TO  APPDATA_SEG*16+0367Eh-SEGBASE, 000h

        endif
        dw      EP_FAR_1F303_OFF, EP_FAR_1F303_SEG
        if      FW_VERSION >= 120
        db      26h, 49h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        else
        dw      P_4926
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      "MPC2000XL V1.00 ALL_SEQ_SONG1   .ALL                .MIDPROGRAM_01      .PGM                .SND (No sound)     "
        db      00h, 00h, 00h, 01h, 00h, 03h
        db      "SNDWAV"
        db      0bh
        db      "WITH SOUNDS NO  SOUNDS"
        TBL_MIDI_FILE_TYPE_NAMES_DATA
        if      FW_VERSION >= 120
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0bfh, 52h
        else
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      0000h, P_52BF
        endif
        TBL_DISK_TYPE_NAMES_DATA
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 04h, 04h

; 0x25ef5-0x262a7, 946 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_25EF5:
        if      FW_VERSION >= 120
        PAD_TO  APPDATA_SEG*16+03B57h-SEGBASE, 000h
        else
        PAD_TO  APPDATA_SEG*16+03B27h-SEGBASE, 000h
        endif
        if      FW_VERSION < 120
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        endif
        else
FREE_25725:
        if      FW_VERSION >= 110
FREE_25EF5:
        PAD_TO  APPDATA_SEG*16+03B47h-SEGBASE, 000h
        else
        PAD_TO  APPDATA_SEG*16+03837h-SEGBASE, 000h

; 0x25497-0x25537, 160 bytes of 00h -- unverified, do not assume free
FREE_25497:
        PAD_TO  APPDATA_SEG*16+038D7h-SEGBASE, 000h
        endif

        endif
        db      "TRACK-"

; 0x262ad-0x2661c, 879 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION >= 114
FREE_262AD:
        if      FW_VERSION >= 120
        PAD_TO  (APPDATA_SEG*16+03ECCh-SEGBASE)-02cch, 000h
d_a3_tbl_03c00:
        PAD_TO  APPDATA_SEG*16+03ECCh-SEGBASE, 000h
        else
        PAD_TO  APPDATA_SEG*16+03EBCh-SEGBASE, 000h
        endif

        else
FREE_25CCD:
FREE_262AD:
        if      FW_VERSION >= 110
; 0x25f0b-0x25f68, 93 bytes of 00h -- unverified, do not assume free
        PAD_TO  APPDATA_SEG*16+03EBCh-SEGBASE, 000h
        else
; 0x2596b-0x259c8, 93 bytes of 00h -- unverified, do not assume free
        PAD_TO  APPDATA_SEG*16+03C4Ch-SEGBASE, 000h
        endif
        endif
        db      "MThd", 000h, 000h, 000h, 006h, 000h, 000h, 000h, 000h, 000h, 060h, 04dh, 054h
        db      72h, 6bh, 00h, 00h, 00h, 40h, 00h, 0ffh, 03h
        db      " MPC2000XL 1.00     "
        TBL_SEQ_LOOP_TEXT_DATA
        TBL_SMF_TRACK_HEADER_DATA
        db      "000007   "
        db      00h, 0ffh, 04h, 08h
        db      "        "
        if      FW_VERSION >= 114

; 0x266db-0x26738, 93 bytes of 00h -- unverified, do not assume free
FREE_266DB:
        if      FW_VERSION >= 120
        PAD_TO  APPDATA_SEG*16+03FE8h-SEGBASE, 000h
        else
        PAD_TO  APPDATA_SEG*16+03FD8h-SEGBASE, 000h
        endif

        else
FREE_260FB:
FREE_266DB:
        if      FW_VERSION >= 110
        PAD_TO  APPDATA_SEG*16+03FD8h-SEGBASE, 000h
        else
        PAD_TO  APPDATA_SEG*16+03D68h-SEGBASE, 000h
        endif
        endif
        if      FW_VERSION >= 112
        db      0ch, 0ch, 0ch, 0ch, 0dh, 0dh, 0dh, 0dh, 0eh, 0eh, 0eh, 0eh, 0fh, 0fh, 0fh, 0fh
        db      10h, 10h, 10h, 10h, 11h, 11h, 11h, 11h, 12h, 12h, 12h, 13h, 13h, 13h, 13h, 14h
        db      14h, 14h, 14h, 15h, 15h, 15h, 15h, 16h, 16h, 16h, 16h, 17h, 17h, 17h, 17h, 18h
        db      18h, 18h, 18h, 19h, 19h, 19h, 1ah, 1ah, 1ah, 1ah, 1bh, 1bh, 1bh, 1bh, 1ch, 1ch
        db      1ch, 1ch, 1dh, 1dh, 1dh, 1dh, 1eh, 1eh, 1eh, 1eh, 1fh, 1fh, 1fh, 20h, 20h, 20h
        db      20h, 21h, 21h, 21h, 21h, 22h, 22h, 22h, 22h, 23h, 23h, 23h, 23h, 24h, 24h, 24h ;  !!!!""""####$$$
        db      24h, 25h, 25h, 25h, 25h, 26h, 26h, 26h, 27h, 27h, 27h, 27h, 28h, 28h, 28h, 28h ; $%%%%&&&''''((((
        db      29h, 29h, 29h, 29h, 2ah, 2ah, 2ah, 2ah, 2bh, 2bh, 2bh, 2bh, 2ch, 2ch, 2ch, 2dh ; ))))****++++,,,-
        endif
APP3_HEAD:                              ; APP3_SEG:0008h
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        mov     dx, ds
        mov     si, 710h
        int     75h
        DISP_PLANE      00h
        if      FW_VERSION >= 112
        if      FW_VERSION >= 120
        call    fn_27F33
        call    L_279FD
        call    C0_BASE+fn_34052-SEGBASE
        call    L_267E7
        db      0b8h, 00h, 00h
        else
        db      0e8h, 67h, 17h, 0e8h, 0eh, 18h, 0e8h, 72h, 0d8h, 0e8h, 12h, 00h, 0b8h, 00h, 00h
        endif
        else
        if      FW_VERSION >= 111
        db      0e8h, 67h, 17h, 0e8h, 0eh, 18h, 0e8h, 70h, 0d8h, 0e8h, 12h, 00h, 0b8h, 00h, 00h
        elseif  FW_VERSION >= 110
        db      0e8h, 5ah, 17h, 0e8h, 1h, 18h, 0e8h, 62h, 0d8h, 0e8h, 12h, 00h, 0b8h, 00h, 00h
        else
        db      0e8h, 4bh, 17h, 0e8h, 0f2h, 17h, 0e8h, 32h, 0d8h, 0e8h, 12h, 00h, 0b8h, 00h, 00h
        endif
        endif
        db      8eh, 0c0h, 9ah
        dw      EP_FAR_1BD76_OFF, EP_FAR_1BD76_SEG
        db      8bh, 0c8h, 8ch, 0c8h, 8ch, 0dbh, 1fh
retf_267E6:
        db      0cbh
L_267E7:
        db      0c7h
        db      06h, 0a8h, 13h, 02h, 00h, 0b0h, 35h, 0bah, 0c4h, 01h, 0eeh, 0b0h, 00h, 0bah, 0c6h, 01h
        db      0eeh, 0bah, 0c4h, 01h, 0b0h, 35h, 0eeh, 0bah, 0c6h, 01h, 0ech, 3ch, 00h, 74h, 01h, 0c3h
        db      0b0h, 35h, 0bah, 0c4h, 01h, 0eeh, 0b0h, 0fh, 0bah, 0c6h, 01h, 0eeh, 0bah, 0c4h, 01h, 0b0h
        db      35h, 0eeh, 0bah, 0c6h, 01h, 0ech, 3ch, 0fh, 74h, 01h, 0c3h, 0c7h, 06h, 0a8h, 13h, 03h
        db      00h, 0c3h
goto_main_screen:
        push    ds
        mov     ax, APPDATA_SEG
        mov     ds, ax
        mov     al, 0
        mov     byte ptr [A2_B_00F2F], al
        int     0adh
        mov     al, 0
        int     0aeh
        mov     al, 0
        int     7ah
        int     0fdh
        int     88h
        cmp     al, 0
        jne     br_26874
        mov     word ptr [A3_W_007BB], 0
        int     0cch
        mov     bl, 0
        int     4eh
        mov     word ptr [A3_W_00F10], 8000h
        cmp     byte ptr [A3_B_00F30], 0
        je      br_26864
        push    cs
        call    L_27146
br_26864:
        mov     byte ptr [A3_B_00F30], 0
        cmp     byte ptr [A2_B_00F2E], 0
        jne     br_26874
        push    cs
        call    L_27146
br_26874:
        callf   [A3_FP_00F08]
        pop     ds
        retf
        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
FN_2687A:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [A3_FP_00F08], si
        int     0a4h
        callf   EP_L_2FD80_SEG:EP_L_2FD80_OFF
        KEY_DOWN        21h, EP_L_2695A_OFF, APP3_SEG
        KEY_DOWN        1dh, (APP3_BASE+L_276FF-APP3_SEG*16), APP3_SEG
        KEY_SHIFTED     04h, EP_FAR_340B3_OFF, EP_FAR_340B3_SEG
        KEY_SHIFTED     05h, (APP3_BASE+L_3154A-APP3_SEG*16), APP3_SEG
        KEY_SHIFTED     06h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_SHIFTED     0bh, EP_L_30BC6_OFF, APP3_SEG
        if      FW_VERSION >= 111
        KEY_SHIFTED     0ch, (APP3_BASE+L_2A32F-APP3_SEG*16), APP3_SEG
        else
        KEY_SHIFTED     0ch, (APP3_BASE+L_29A42-APP3_SEG*16), APP3_SEG
        endif
        KEY_SHIFTED     0eh, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        KEY_SHIFTED     0dh, EP_L_310BA_OFF, APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2699C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        25h, (APP3_BASE+L_269AA-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0dh, EP_L_26957_OFF, APP3_SEG
        if      FW_VERSION >= 110
        if      FW_VERSION >= 114
        KEY_DOWN        29h, EP_L_31B40_OFF, APP3_SEG
        else
        if      FW_VERSION >= 112
        KEY_DOWN        29h, (APP3_BASE+L_31B40-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        29h, EP_L_31260_OFF, APP3_SEG
        endif
        endif
        KEY_DOWN        1ch, EP_L_282A9_OFF, APP3_SEG
        if      FW_VERSION >= 120
        KEY_SOFT        (APP3_BASE+L_2CE54-APP3_SEG*16), APP3_SEG, EP_L_32120_OFF, APP3_SEG, (APP3_BASE+L_26E1A-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26DE7-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26E07-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26DF4-APP3_SEG*16), APP3_SEG
        XL2K_TRANSPORT_KEYS (APP3_BASE+L_2B9A7-APP3_SEG*16), (APP3_BASE+L_2712B-APP3_SEG*16)
        else
        KEY_SOFT        (APP3_BASE+L_2CE54-APP3_SEG*16), APP3_SEG, (C0_BASE+L_32120-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26E1A-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26DE7-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26E07-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26DF4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        2eh, (APP3_BASE+L_2B9A7-APP3_SEG*16), APP3_SEG
        KEY_DOWN        2fh, EP_L_2712B_OFF, APP3_SEG
        endif
        if      FW_VERSION >= 114
        KEY_DOWN        0fh, EP_L_26967_OFF, APP3_SEG
        KEY_DOWN        1bh, (APP3_BASE+L_26970-APP3_SEG*16), APP3_SEG
        cmp     byte ptr [C0_B_02AD7], 0
        jne     L_2635C
        ret
L_2635C:
        KEY_SOFT        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (APP3_BASE+L_267AC-APP3_SEG*16), APP3_SEG
        ret
L_26957:
        db      0cdh, 0c1h, 0cbh
L_2695A:
        call    fn_271BC
        call    fn_280BD
        je      br_26963
        retf
br_26963:
        call    fn_26DD1
        retf
        else
        KEY_DOWN        0fh, (APP3_BASE+L_25B77-APP3_SEG*16), APP3_SEG
        KEY_DOWN        1bh, (APP3_BASE+L_26970-APP3_SEG*16), APP3_SEG
        db      80h, 3eh, 0c7h, 2ah, 00h, 75h, 01h, 0c3h
        KEY_SOFT        0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, EP_L_267AC_OFF, APP3_SEG
        db      0c3h
L_26957:
        db      0cdh, 0c1h, 0cbh
L_2695A:
        if      FW_VERSION >= 111
        db      0e8h, 5fh, 08h, 0e8h, 5dh, 17h, 74h
        else
        db      0e8h, 5fh, 08h, 0e8h, 50h, 17h, 74h
        endif
        db      01h, 0cbh, 0e8h, 6bh, 04h, 0cbh
        endif
        else
        KEY_DOWN        29h, (APP3_BASE+L_31B40-APP3_SEG*16), APP3_SEG
        KEY_DOWN        1ch, (APP3_BASE+L_282A9-APP3_SEG*16), APP3_SEG
        KEY_SOFT        (APP3_BASE+L_2CE54-APP3_SEG*16), APP3_SEG, EP_L_32120_OFF, EP_L_32120_SEG, (APP3_BASE+L_268E4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_268B7-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26E07-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26DF4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        2eh, (APP3_BASE+L_2B9A7-APP3_SEG*16), APP3_SEG
        KEY_DOWN        2fh, (APP3_BASE+L_2712B-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, EP_L_26967_OFF, APP3_SEG
        KEY_DOWN        1bh, (APP3_BASE+L_26970-APP3_SEG*16), APP3_SEG
        db      80h
        db      3eh
        db      0c7h
        sub     al, byte ptr [bx+si]
        jne     L_2635C
        ret
L_2635C:
        KEY_SOFT        0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_267AC-APP3_SEG*16), APP3_SEG
        db      0c3h
L_26957:
        db      0cdh, 0c1h, 0cbh
L_2695A:
        db      0e8h, 5fh, 08h, 0e8h, 41h, 17h
        je      br_26963
        retf
br_26963:
        db      0e8h, 6bh, 04h
        retf
        endif
L_25B77:
        KEY_UP          1bh, 0000h, 0000h
        retf
L_26970:
        call    fn_280BD
        je      br_26992
        mov     al, 2
        int     0aah
        cmp     al, 0
        jne     br_26992
        cmp     byte ptr [A3_B_00717], 0
        jne     br_26985
        retf
br_26985:
        mov     al, 1
        int     0aah
        KEY_UP          1bh, (APP3_BASE+L_26997-APP3_SEG*16), APP3_SEG
        retf
br_26992:
        mov     al, 0
        int     0aah
        retf
L_26997:
        mov     al, 0
        int     0aah
        retf
L_2699C:
        call    fn_269AE
        int     0ach
        call    fn_280BD
        je      br_269A7
        retf
br_269A7:
        int     0f9h
        retf
L_269AA:
        call    fn_269AE
        db      0cbh
fn_269AE:
        call    fn_269F5
        DISP_HDOTS      00h, 1dh, 0f5h
        db      0e8h
        db      82h, 00h, 0e8h
        dec     bx
        db      01h, 0e8h
        mov     cx, 0e800h
        and     al, byte ptr [bx+di]
        call    fn_26B96
        call    fn_26C0F
        call    fn_26BEB
        call    fn_26BC9
        call    fn_26C3C
        call    fn_26C59
        call    fn_26C7D
        call    fn_26CB0
        call    fn_26CCD
        call    fn_26CF5
        call    fn_26D5C
        call    FN_26E18
        call    fn_2708A
        call    fn_2709C
        call    fn_26DAF
        call    word ptr [A3_W_PAGE_CURSOR_FN]
        ret
fn_269F5:
        DISP_PLANE0
        DISP_CLEAR
        DISP_FONT       DISP_FONT_7ROW
        DISP_HLINE      00h, 00h, 87h
        DISP_HDOTS      00h, 0ah, 87h
        DISP_HLINE      86h, 0ah, 71h
        DISP_HLINE      00h, 30h, 0f8h
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      00h, 00h, 30h
        DISP_VLINE      87h, 00h, 0bh
        DISP_VLINE      88h, 01h, 0ah
        DISP_VLINE      0f6h, 0ah, 26h
        DISP_VLINE      0f7h, 0bh, 25h
        db      0c3h
        DISP_TEXT       02h, 02h, "Sq:  -"
        db      0a1h, 10h, 07h, 40h, 0b1h, 14h, 0b5h, 02h, 0b7h
        db      02h, 0b3h, 09h, 0cdh, 90h, 0beh, 00h, 00h, 8bh, 16h, 10h, 0fh, 0b1h, 26h, 0b5h, 02h
        db      0b4h, 10h, 0b3h, 05h, 0cdh, 90h, 0c3h
cb_26A68:
        db      83h, 3eh, 0bbh, 07h, 00h, 74h, 01h, 0c3h, 0b1h
        db      14h, 0b5h, 02h, 0b0h, 74h, 0cdh, 0b0h, 0c3h
        DISP_TEXT       08h, 0ch, "\\:"
        db      8ch, 0dah
        DISP_TEXT_IDX   2fh, 0ch, 00716h, 00f6bh
        db      0cdh, 88h, 3ch, 00h
        db      74h, 11h, 80h, 0ffh, 00h, 74h, 0ch
        DISP_TEXT       12h, 0ch, "(Ext)"
        db      0c3h
        DISP_TEXT       25h, 0ch, "."
        db      0cdh, 0bdh, 51h, 2bh, 0d2h, 0bbh
        db      0ah, 00h, 0f7h, 0f3h, 52h
        DISP_NUM        14h, 0ch, 03h
        db      58h
        DISP_NUM        29h, 0ch, 01h
        db      59h, 81h, 0f9h, 0e8h, 03h, 75h, 01h, 0c3h
        DISP_TEXT       02h, 0ch, "c"
        db      0c3h
cb_26AD3:
        db      0b1h, 13h, 0b5h, 0ch, 0b0h, 1dh, 0cdh, 0b0h, 0c3h
cb_26ADC:
        mov     cl, 35h
        mov     ch, 0ch
        mov     al, 13h
        int     0b0h
        ret
        DISP_TEXT       60h, 0ch, "Timing:"
        mov     dx, ds
        DISP_TEXT_IDX   8ah, 0ch, 00717h, 00f31h
        ret
cb_26AFF:
        mov     cl, 8ah
        mov     ch, 0ch
        mov     al, 2ah
        int     0b0h
        ret
fn_26B08:
        cmp     byte ptr [A3_B_00718], 0
        jne     L_2636E
        DISP_TEXT       0a8h, 01h, "Now:"
        int     86h
        mov     cl, 0c0h
        mov     ch, 1
        call    fn_280DD
        ret
cb_26B23:
        mov     cl, 0c0h
        mov     ch, 1
        mov     al, 13h
        int     0b0h
        ret
cb_26B2C:
        DISP_CURSOR     0d8h, 1, 0dh
        ret
cb_26B35:
        DISP_CURSOR     0eah, 1, 0dh
        ret
L_2636E:
        DISP_TEXT       0a8h, 01h, "Now:  H  M  S"
        db      0cdh
        sar     byte ptr [bx-1180h], 0beh
        db      36h, 00h, 0cdh
        mov     ax, 183ch
        jb      br_26B61
        sub     al, 18h
br_26B61:
        mov     cl, 0c0h
        mov     ch, 1
        mov     bh, 2
        mov     bl, 9
        int     90h
        mov     ax, di
        mov     dx, si
        mov     di, 0ea60h
        div     di
        add     cl, 12h
        mov     bl, 9
        int     90h
        mov     ax, dx
        mov     dx, 0
        mov     di, 3e8h
        div     di
        add     cl, 12h
        mov     bl, 9
        int     90h
        ret
cb_26B8D:
        DISP_CURSOR     0c0h, 1, 37h
        ret
fn_26B96:
        DISP_TEXT       0b9h, 0ch, "Tsig:  /  "
        db      0cdh
        xchg    cl, byte ptr [bp+di-93fh]
        db      0f3h, 50h
        mov     ax, 180h
        div     bl
        DISP_NUMR       0e9h, 0ch, 02h
        pop     ax
        DISP_NUMR       0d7h, 0ch, 02h
        ret
cb_26BC0:
        DISP_CURSOR     0d7h, 0ch, 1fh
        ret
fn_26BC9:
        DISP_TEXT       08h, 15h, "Count:"
        mov     dx, ds
        DISP_TEXT_IDX   2ch, 15h, 00725h, 00f7bh
        ret
cb_26BE2:
        DISP_CURSOR     2ch, 15h, 13h
        ret
fn_26BEB:
        DISP_TEXT       6ch, 15h, "Loop:"
        mov     es, word ptr [A3_W_00F10]
        mov     al, byte ptr es:[34h]
        mov     cl, 8ah
        mov     ch, 15h
        call    fn_26D9C
        ret
cb_26C06:
        db      0b1h
        mov     dh, byte ptr [di-4febh]
        adc     cx, bp
        mov     al, 0c3h
fn_26C0F:
        DISP_TEXT       0b9h, 15h, "Bars:"
        sub     ax, ax
        mov     es, word ptr [A3_W_00F10]
        cmp     byte ptr es:[12h], 0
        je      br_26C2C
        mov     ax, word ptr es:[A3_W_0001A]
br_26C2C:
        DISP_NUMR       0d7h, 15h, 03h
        db      0c3h
cb_26C33:
        DISP_CURSOR     0d7h, 15h, 13h
        ret
fn_26C3C:
        DISP_TEXT       02h, 1fh, "Tr:"
        db      0a1h, 12h, 07h
        mov     cl, 14h
        mov     ch, 1fh
        call    fn_28022
        ret
cb_26C50:
        DISP_CURSOR     14h, 1fh, 73h
        ret
fn_26C59:
        DISP_TEXT       8ah, 1fh, "ON:"
        call    fn_280C2
        mov     al, byte ptr es:[si+680h]
        and     al, 2
        mov     cl, 9ch
        mov     ch, 1fh
        call    fn_26E05
        ret
cb_26C74:
        DISP_CURSOR     9ch, 1fh, 13h
        ret
fn_26C7D:
        DISP_TEXT       0b9h, 1fh, " Pgm:"
        call    fn_280C2
        mov     al, byte ptr es:[si+600h]
        mov     ah, 0
        cmp     al, 0
        jne     br_26CA0
        DISP_TEXT       0d7h, 1fh, "OFF"
        db      0c3h
br_26CA0:
        DISP_NUMR       0d7h, 1fh, 03h
        db      0c3h
cb_26CA7:
        DISP_CURSOR     0d7h, 1fh, 13h
        ret
fn_26CB0:
        DISP_TEXT       0eh, 28h, ":"
        mov     dx, ds
        DISP_TEXT_IDX   02h, 28h, 00737h, 00f76h
        ret
cb_26CC4:
        DISP_CURSOR     8, 28h, 7
        ret
fn_26CCD:
        call    fn_280C2
        mov     al, byte ptr es:[si+5c0h]
        mov     ah, 6
        mul     ah
        add     ax, 0fa8h
        mov     si, ax
        mov     dx, ds
        mov     ah, 6
        mov     cl, 14h
        mov     ch, 28h
        mov     bl, 5
d_a3_w_04588:
        int     90h
        ret
        ret
cb_26CEC:
        DISP_CURSOR     14h, 28h, 1fh
        ret
fn_26CF5:
        call    fn_280C2
        mov     al, byte ptr es:[si+580h]
        push    ax
        mov     ah, 4
        mul     ah
        add     ax, 0fc6h
        mov     si, ax
        mov     dx, ds
        mov     ah, 4
        mov     cl, 38h
        mov     ch, 28h
        mov     bl, 5
        int     90h
        pop     ax
        cmp     al, 0
        je      br_26D2F
        mov     ah, 0
        shl     ax, 3
        add     ax, 78h
        mov     si, ax
        mov     cl, 50h
        mov     ch, 28h
        mov     ah, 8
        mov     dx, es
        mov     bl, 5
        int     90h
        ret
br_26D2F:
        call    fn_280C2
        mov     al, byte ptr es:[si+5c0h]
        cmp     al, 0
        jne     br_26D3C
        ret
br_26D3C:
        int     0c5h
        mov     dx, es
        add     si, 2
        mov     ch, 28h
        mov     cl, 50h
        mov     ah, 10h
        cmp     word ptr [A2_W_CUR_SEQ], 2
        mov     bl, 5
        int     90h
        ret
cb_26D53:
        DISP_CURSOR     38h, 28h, 13h
        ret
fn_26D5C:
        DISP_TEXT       0b3h, 28h, "Velo%:"
        call    fn_280C2
        mov     al, byte ptr es:[si+640h]
        mov     ah, 0
        DISP_NUM        0d7h, 28h, 03h
        ret
cb_26D79:
        DISP_CURSOR     0d7h, 28h, 13h
        ret
        db      0cdh, 0bdh, 8bh, 0c1h, 2bh, 0d2h, 0bbh, 0ah, 00h, 0f7h, 0f3h, 52h
        DISP_NUM        32h, 01h, 03h
        db      58h
        DISP_NUM        47h, 01h, 01h
        db      0c3h
fn_26D9C:
        cmp     al, 0
        mov     si, 0f7ch
        je      br_26DA6
        mov     si, 0f7fh
br_26DA6:
        mov     dx, ds
        mov     ah, 3
        mov     bl, 5
        int     90h
        ret
fn_26DAF:
        mov     al, 0
        int     0c4h
        cmp     al, 0
        jne     br_26DB8
        ret
br_26DB8:
        int     0a7h
        test    al, 2
        je      br_26DC6
        DISP_ERASE      7eh, 34h, 25h, 07h
        ret
br_26DC6:
        DISP_SOFTKEY    04h, DISP_SK_BOX,    "SOLO"
        db      0c3h
fn_26DD1:
        mov     al, 0
        int     0c4h
        cmp     al, 0
        jne     br_26DDA
        ret
br_26DDA:
        int     0a7h
        test    al, 2
        je      br_26DF1
        DISP_ERASE      7eh, 34h, 25h, 07h
        call    fn_280BD
        je      L_2651D
        ret
L_2651D:
        DISP_FLUSH
        db      0c3h
br_26DF1:
        DISP_SOFTKEY    04h, DISP_SK_BOX,    "SOLO"
        db      0e8h
        if      FW_VERSION >= 111
        db      0bfh, 12h, 74h
        elseif  FW_VERSION >= 110
        db      0b2h, 12h, 74h
        else
        mov     word ptr [A3_W_07412], ax
        endif
        db      01h, 0c3h
        DISP_FLUSH
        db      0c3h
fn_26E05:
        cmp     al, 0
        mov     si, 0f82h
        je      br_26E0F
        mov     si, 0f85h
br_26E0F:
        mov     dx, ds
        mov     ah, 3
        mov     bl, 5
        int     90h
        ret
FN_26E18:
        call    fn_280BD
        jne     br_26E96
        cmp     byte ptr [C0_B_02AD7], 0
        je      fn_26E28
        call    fn_26E67
        ret
fn_26E28:
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "STEP"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "EDIT"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "TrMUTE"
        DISP_SOFTKEY    04h, DISP_SK_BOX,    "SOLO"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "Tr -"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "Tr +"
        ret
fn_26E67:
        DISP_TEXT       0ah, 33h, "Auto punch function is active!!"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "OFF"
        db      0c3h
br_26E96:
        mov     al, 2
        int     0aah
        cmp     al, 0
        jne     br_26ED2
        cmp     word ptr [A3_W_007BB], 0
        je      br_26EA8
        jmp     br_270AE
br_26EA8:
        cmp     word ptr [A3_W_00F28], 0
        je      br_26EB3
        callf   [A3_FP_00F08]
br_26EB3:
        mov     word ptr [A3_W_00F28], 0
        int     88h
        cmp     ah, 0
        je      br_26EC7
        mov     bx, 0aeh
        int     0a9h
        jb      br_26F0A
br_26EC7:
        cmp     byte ptr [C0_B_02AD7], 0
        jne     br_26F33
        call    fn_26E28
        ret
br_26ED2:
        int     88h
        cmp     ah, 0
        je      br_26EE0
        mov     bx, 0aeh
        int     0a9h
        jb      br_26F0A
br_26EE0:
        DISP_TEXT       00h, 34h, "      (Hold pads or keys to repeat)"
        db      0c3h
br_26F0A:
        DISP_TEXT       00h, 34h, "      (Hold pads or keys to erase)"
        ret
br_26F33:
        int     88h
        cmp     ah, 0
        jne     br_26F3D
        jmp     fn_26E67
br_26F3D:
        cmp     byte ptr [C0_B_02AD6], 0
        je      br_26F78
        cmp     byte ptr [C0_B_02AD6], 1
        je      br_26F8E
        call    fn_26FA4
        call    fn_26FC0
        if      FW_VERSION >= 110
        call    L_318C6
        else
        db      0e8h, 06h, 0b2h
        endif
        jb      br_26F5A
        je      br_26F64
        jmp     br_26F6E
br_26F5A:
        call    fn_2700A
        call    fn_26FEC
        call    fn_26FFB
        ret
br_26F64:
        call    fn_26FDD
        call    fn_27030
        call    fn_26FFB
        ret
br_26F6E:
        call    fn_26FDD
        call    fn_26FEC
        call    fn_27056
        ret
br_26F78:
        call    fn_26FA4
        if      FW_VERSION >= 110
        call    L_318C6
        else
        db      0e8h, 0dch, 0b1h
        endif
        je      br_26F87
        call    fn_2700A
        call    fn_26FEC
        ret
br_26F87:
        call    fn_26FDD
        call    fn_27030
        ret
br_26F8E:
        call    fn_26FC0
        if      FW_VERSION >= 110
        call    L_318C6
        else
        db      0e8h, 0c6h, 0b1h
        endif
        jne     br_26F9D
        call    fn_27030
        call    fn_26FFB
        ret
br_26F9D:
        call    fn_26FEC
        call    fn_27056
        ret
fn_26FA4:
        DISP_TEXT       20h, 34h, "IN:"
        mov     ax, word ptr [C0_W_02AD8]
        mov     dl, byte ptr [C0_B_02ADA]
        mov     dh, byte ptr [C0_B_02ADB]
        mov     cl, 32h
        mov     ch, 34h
        call    fn_280DD
        ret
fn_26FC0:
        DISP_TEXT       8ah, 34h, "OUT:"
        mov     ax, word ptr [C0_W_02ADC]
        mov     dl, byte ptr [C0_B_02ADE]
        mov     dh, byte ptr [C0_B_02ADF]
        mov     cl, 0a2h
        mov     ch, 34h
        call    fn_280DD
        ret
fn_26FDD:
        DISP_ERASE      00h, 34h, 1eh, 07h
        DISP_BOX        00h, 34h, 1eh, 07h
        ret
fn_26FEC:
        DISP_ERASE      69h, 34h, 1eh, 07h
        DISP_BOX        69h, 34h, 1eh, 07h
        ret
fn_26FFB:
        DISP_ERASE      0d9h, 34h, 1eh, 07h
        DISP_BOX        0d9h, 34h, 1eh, 07h
        ret
fn_2700A:
        DISP_BOX        00h, 34h, 1eh, 07h
        DISP_HDOTS      01h, 35h, 1ch
        DISP_HDOTS      02h, 36h, 1bh
        DISP_HDOTS      01h, 37h, 1ch
        DISP_HDOTS      02h, 38h, 1bh
        DISP_HDOTS      01h, 39h, 1ch
        ret
fn_27030:
        DISP_BOX        69h, 34h, 1eh, 07h
        DISP_HDOTS      6ah, 35h, 1ch
        DISP_HDOTS      6bh, 36h, 1bh
        DISP_HDOTS      6ah, 37h, 1ch
        DISP_HDOTS      6bh, 38h, 1bh
        DISP_HDOTS      6ah, 39h, 1ch
        db      0c3h
fn_27056:
        DISP_BOX        0d9h, 34h, 1eh, 07h
        DISP_HDOTS      0dah, 35h, 1ch
        DISP_HDOTS      0dbh, 36h, 1bh
        DISP_HDOTS      0dah, 37h, 1ch
        DISP_HDOTS      0dbh, 38h, 1bh
        DISP_HDOTS      0dah, 39h, 1ch
        ret
L_267AC:
        mov     byte ptr [C0_B_02AD7], 0
        mov     bl, 1bh
        int     87h
        push    cs
        call    goto_main_screen
        retf
fn_2708A:
        cmp     byte ptr [A3_B_0071C], 0ch
        jne     br_27092
        ret
br_27092:
        mov     si, 22h
        DISP_BMP        8ch, 00h, 22h
        db      0c3h
fn_2709C:
        cmp     byte ptr [A3_B_00719], 0
        jne     br_270A4
        ret
br_270A4:
        mov     si, 23h
        DISP_BMP        97h, 00h, 23h
        ret
br_270AE:
        DISP_TEXT       04h, 34h, "Next Sq:"
        mov     ax, word ptr [A3_W_007BB]
        mov     word ptr [A3_W_00F28], ax
        DISP_NUM        34h, 34h, 02h
        DISP_CURSOR     34h, 34h, 0dh
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "TrMUTE"
        DISP_SOFTKEY    04h, DISP_SK_BOX,    "SOLO"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "Tr -"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "Tr +"
        ret
far_270FB:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26A68-APP3_CSBASE
        mov     ax, word ptr [A2_W_CUR_SEQ]
        mov     word ptr [A3_W_00F24], ax
        FIELD_ENTRY     ds, 0f24h, 1, 1, 63h, intcb_27136-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+FAR_271D9-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_27331-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_2777C-APP3_SEG*16), APP3_SEG
        retf
intcb_27136:
        call    fn_280BD
        jne     br_2717A
        mov     ax, word ptr [A3_W_00F24]
        mov     word ptr [A2_W_CUR_SEQ], ax
        push    cs
        call    L_27146
        retf
L_27146:
        mov     byte ptr [C0_B_02AD7], 0
        mov     bl, 1bh
        int     87h
        mov     al, 0
        int     0ddh
        mov     word ptr [A3_W_00F10], 8000h
        int     0e6h
        mov     ax, word ptr [A2_W_CUR_SEQ]
        mov     word ptr [A3_W_00F24], ax
        mov     word ptr [A3_W_00F26], ax
        push    ax
        int     0d1h
        pop     ax
        int     0d8h
        mov     ax, word ptr [A3_W_0071A]
        int     0d9h
        mov     byte ptr [A2_B_00F2E], 1
        call    fn_2B3C5
        int     0a5h
        retf
br_2717A:
        int     88h
        cmp     bl, 0
        je      br_27182
        retf
br_27182:
        call    fn_271A7
        jae     br_27188
        retf
br_27188:
        mov     word ptr [A3_W_00F24], ax
        mov     word ptr [A3_W_00F26], ax
        inc     ax
        mov     word ptr [A3_W_007BB], ax
        mov     byte ptr [C0_B_02AD7], 0
        mov     bl, 1bh
        int     87h
        mov     word ptr [A3_W_00F10], 0f000h
        mov     byte ptr [A3_B_00F30], 1
        retf
fn_271A7:
        mov     ax, word ptr [A3_W_00F24]
        mov     bx, ax
        xchg    bx, word ptr [A3_W_00F26]
        cmp     ax, bx
        jb      BR_271B9
        int     0f0h
        jb      BR_271B9
        ret
BR_271B9:
        int     0f1h
        ret
fn_271BC:
        int     0fdh
        cmp     al, 0
        jne     br_271C3
        ret
br_271C3:
        cmp     byte ptr [7c1h], 0
        jne     br_271CB
        ret
br_271CB:
        dec     al
        mov     ah, 0
        mov     word ptr [A3_W_00F24], ax
        push    cs
        call    intcb_27136
        int     8dh
        ret
far_271D9:
        call    FN_2687A
        call    fn_2823E
        jae     br_271E4
        jmp     far_270FB
br_271E4:
        int     86h
        mov     word ptr [A3_W_00F2A], ax
        mov     byte ptr [A3_B_00F2C], dl
        mov     byte ptr [A3_B_00F2D], dh
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26B8D-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_CURSOR      EP_FAR_270FB_OFF, EP_FAR_270FB_SEG, EP_L_27259_OFF, EP_L_27259_SEG, 0000h, 0000h, EP_L_2742F_OFF, APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_27C35-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 114
        cmp     byte ptr [A3_B_00718], 0
        je      br_27219
        else
        db      80h, 3eh
br_27219:
        sbb     byte ptr [bx], al
        add     byte ptr [si+1], dh
        endif
        retf
        else
        KEY_CURSOR      EP_FAR_270FB_OFF, EP_FAR_270FB_SEG, EP_L_27259_OFF, EP_L_27259_SEG, 0000h, 0000h, (APP3_BASE+L_2662D-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_L_27348_OFF, APP3_SEG
        cmp     byte ptr [A3_B_00718], 0
        je      br_27219
        retf
br_27219:
        endif
        if      FW_VERSION >= 114
br_27219:
        endif
        FIELD_ENTRY     ds, 0f2ah, 1, 0, 3e7h, intcb_27231-APP3_CSBASE
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26B23-APP3_CSBASE
        retf
intcb_27231:
        push    ax
        call    fn_280BD
        pop     ax
        je      br_27239
        retf
br_27239:
        mov     es, word ptr [A3_W_00F10]
        cmp     ax, word ptr es:[A3_W_0001A]
        jb      br_27248
        mov     ax, word ptr es:[A3_W_0001A]
br_27248:
        mov     word ptr [A3_W_00F2A], ax
        mov     byte ptr [A3_B_00F2C], 0
        mov     byte ptr [A3_B_00F2D], 0
        call    fn_30425
        retf
L_27259:
        call    fn_280BD
        je      br_2725F
        retf
br_2725F:
        cmp     byte ptr [A3_B_00718], 0
        je      L_26A97
        retf
L_26A97:
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26B2C-APP3_CSBASE
        FIELD_ENTRY     ds, 0f2ch, 1, 0, 20h, intcb_27291-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_CURSOR      EP_FAR_271D9_OFF, EP_FAR_271D9_SEG, (APP3_BASE+L_272CF-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_2742F_OFF, APP3_SEG
        retf
intcb_27291:
        mov     bx, word ptr [A3_W_00F2A]
        else
        KEY_CURSOR      EP_FAR_271D9_OFF, EP_FAR_271D9_SEG, (APP3_BASE+L_272CF-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2662D-APP3_SEG*16), APP3_SEG
        db      0cbh
intcb_27291:
        db      8bh
        push    ds
        sub     cl, byte ptr [bx]
        endif
        mov     es, word ptr [A3_W_00F10]
        cmp     bx, word ptr es:[A3_W_0001A]
        jne     L_272A8
        mov     al, 0
        mov     byte ptr [A3_B_00F2C], al
        mov     byte ptr [A3_B_00F2D], al
L_272A8:
        push    ax
        int     86h
        mov     ax, cx
        div     bl
        mov     bx, ax
        pop     ax
        cmp     al, bl
        jb      L_269EA
        mov     al, bl
        dec     al
L_269EA:
        mov     byte ptr [A3_B_00F2C], al
        mov     dl, al
        mov     dh, 0
        mov     ax, word ptr [A3_W_00F2A]
        mov     cl, byte ptr [A3_B_00F2D]
        mov     ch, 0
        mov     bl, 0bh
        int     87h
        retf
L_272CF:
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26B35-APP3_CSBASE
        mov     cx, ds
        mov     si, 0f2dh
        if      FW_VERSION >= 110
        mov     bl, 0
        else
        mov     bl, 1
        endif
        mov     bh, 0
        mov     dx, 63h
        mov     di, intcb_272F9-APP3_CSBASE
        int     7eh
        if      FW_VERSION >= 114
        KEY_CURSOR      EP_L_27259_OFF, EP_L_27259_SEG, EP_FAR_27331_OFF, APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2662D-APP3_SEG*16), APP3_SEG
        retf
intcb_272F9:
        mov     bx, word ptr [A3_W_00F2A]
        else
        if      FW_VERSION >= 110
        KEY_CURSOR      EP_L_27259_OFF, EP_L_27259_SEG, EP_APP3_0B81_OFF, APP3_SEG, 0000h, 0000h, EP_L_2742F_OFF, APP3_SEG
        else
        KEY_CURSOR      EP_L_27259_OFF, EP_L_27259_SEG, EP_APP3_0B81_OFF, APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2662D-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
intcb_272F9:
        db      8bh
        push    ds
        sub     cl, byte ptr [bx]
        endif
        mov     es, word ptr [A3_W_00F10]
        cmp     bx, word ptr es:[A3_W_0001A]
        jne     br_27310
        mov     al, 0
        mov     byte ptr [A3_B_00F2C], al
        mov     byte ptr [A3_B_00F2D], al
br_27310:
        push    ax
        int     86h
        pop     ax
        cmp     al, bl
        jb      br_2731C
        mov     al, bl
        dec     al
br_2731C:
        mov     byte ptr [A3_B_00F2D], al
        mov     cl, al
        mov     ch, 0
        mov     ax, word ptr [A3_W_00F2A]
        mov     dl, byte ptr [A3_B_00F2C]
        mov     dh, 0
        mov     bl, 0bh
        int     87h
        retf
far_27331:
        call    FN_2687A
        call    fn_2823E
        jae     br_2733C
        jmp     far_270FB
br_2733C:
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26AD3-APP3_CSBASE
        mov     ax, word ptr [A3_W_00714]
        cmp     byte ptr [A3_B_00716], 0
        je      br_27354
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[16h]
br_27354:
        mov     bl, 0
        mov     bh, 1
        mov     dx, 0bb8h
        mov     di, intcb_2737B-APP3_CSBASE
        int     7fh
        KEY_CURSOR      (APP3_BASE+FAR_271D9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_273B1-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_270FB-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_274C0-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_282B6-APP3_SEG*16), APP3_SEG
        retf
intcb_2737B:
        cmp     ax, 12ch
        jae     L_26DA3
        mov     ax, 12ch
L_26DA3:
        mov     word ptr es:[di], ax
        cmp     byte ptr [A3_B_00716], 0
        je      L_26DB7
        mov     es, word ptr [A3_W_00F10]
        mov     word ptr es:[16h], ax
        jmp     SHORT br_2739A
L_26DB7:
        mov     word ptr [A3_W_00714], ax
br_2739A:
        mov     bl, 15h
        int     87h
        if      FW_VERSION >= 111
        call    fn_280BD
        je      L_26AD4
        retf
L_26AD4:
        endif
        if      FW_VERSION <> 107
        int     86h
        if      FW_VERSION >= 111
        mov     cl, dh
        mov     ch, 0
        mov     dh, 0
        mov     bl, 0bh
        int     87h
        else
        call    fn_30425
        endif
        endif
        retf
L_273B1:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26ADC-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_WHEEL2      EP_L_273DF_OFF, APP3_SEG, EP_L_273E9_OFF, APP3_SEG
        KEY_CURSOR      (APP3_BASE+FAR_27331-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26C23-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_270FB-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_274C0-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_L_282B6_OFF, APP3_SEG
        retf
        else
        KEY_WHEEL2      (APP3_BASE+L_265DD-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_273E9-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      EP_APP3_0B81_OFF, APP3_SEG, (APP3_BASE+L_26C23-APP3_SEG*16), APP3_SEG, EP_FAR_270FB_OFF, EP_FAR_270FB_SEG, (APP3_BASE+L_274C0-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_282B6-APP3_SEG*16), APP3_SEG
        db      0cbh
        endif
L_265DD:
        mov     byte ptr [A3_B_00716], 0
        mov     bl, 16h
        int     87h
        retf
L_273E9:
        mov     byte ptr [A3_B_00716], 1
        mov     bl, 16h
        int     87h
        retf
L_26C23:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26AFF-APP3_CSBASE
        mov     cx, ds
        mov     si, 717h
        mov     bl, 0
        mov     bh, 1
        mov     dx, 6
        mov     di, A3_W_00C78
        int     7dh
        if      FW_VERSION >= 110
        KEY_CURSOR      EP_L_273B1_OFF, APP3_SEG, EP_L_2742F_OFF, APP3_SEG, EP_FAR_270FB_OFF, EP_FAR_270FB_SEG, EP_L_27489_OFF, APP3_SEG
        if      FW_VERSION >= 111
        KEY_DOWN        16h, (APP3_BASE+L_299D1-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        16h, (APP3_BASE+L_290E4-APP3_SEG*16), APP3_SEG
        endif
        retf
        else
        KEY_CURSOR      (APP3_BASE+L_273B1-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2662D-APP3_SEG*16), APP3_SEG, EP_FAR_270FB_OFF, EP_FAR_270FB_SEG, (APP3_BASE+L_27489-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_290E4-APP3_SEG*16), APP3_SEG
        db      0cbh
        endif
d_a3_w_00c78:
        mov     word ptr [A3_W_012CB], L_2938B-APP3_CSBASE
        retf
L_2662D:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26BC0-APP3_CSBASE
        KEY_WHEEL       (APP3_BASE+FAR_28BE5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+FAR_28BE5-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_26C23-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_274C0-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_271D9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27459-APP3_SEG*16), APP3_SEG
        db      0cbh
L_27459:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26C33-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_CURSOR      (APP3_BASE+L_27489-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_274F5-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2662D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26DA5-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 114
        KEY_WHEEL       (APP3_BASE+L_29070-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_29070-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_29305-APP3_SEG*16), APP3_SEG
        else
        KEY_WHEEL       (APP3_BASE+L_28783-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_28783-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_28A18-APP3_SEG*16), APP3_SEG
        endif
        retf
L_27489:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26C06-APP3_CSBASE
        if      FW_VERSION >= 120
        KEY_CURSOR      (APP3_BASE+L_274C0-APP3_SEG*16), APP3_SEG, EP_L_27459_OFF, APP3_SEG, (APP3_BASE+L_26C23-APP3_SEG*16), APP3_SEG, EP_L_2752D_OFF, APP3_SEG
        mov     cx, word ptr [A3_W_00F10]
        else
        if      FW_VERSION >= 114
        KEY_CURSOR      (APP3_BASE+L_274C0-APP3_SEG*16), APP3_SEG, EP_L_27459_OFF, APP3_SEG, (APP3_BASE+L_26C23-APP3_SEG*16), APP3_SEG, EP_L_2752D_OFF, APP3_SEG
        db      8bh
        push    cs
        else
        KEY_CURSOR      EP_L_274C0_OFF, APP3_SEG, EP_L_27459_OFF, APP3_SEG, EP_L_26C23_OFF, APP3_SEG, EP_L_26D5D_OFF, APP3_SEG
        db      8bh, 0eh
        endif
        adc     byte ptr [bx], cl
        endif
        else
        KEY_CURSOR      (APP3_BASE+L_27489-APP3_SEG*16), APP3_SEG, EP_L_274F5_OFF, APP3_SEG, (APP3_BASE+L_2662D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26DA5-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       (APP3_BASE+L_28783-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_28783-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_28A18-APP3_SEG*16), APP3_SEG
L_27489                         equ     $+1
        db      0cbh
        db      0e8h
        db      00h, 0f4h
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26C06-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_274C0-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27459-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26C23-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26D5D-APP3_SEG*16), APP3_SEG
        db      8bh, 0eh
        adc     byte ptr [bx], cl
        endif
        mov     si, 34h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_DOWN        16h, (APP3_BASE+L_2B467-APP3_SEG*16), APP3_SEG
        retf
L_274C0:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26BE2-APP3_CSBASE
        if      FW_VERSION >= 114
        KEY_CURSOR      (APP3_BASE+L_2662D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27489-APP3_SEG*16), APP3_SEG, EP_FAR_27331_OFF, APP3_SEG, EP_L_274F5_OFF, APP3_SEG
        FIELD_WHEEL     ds, 725h, 0, 0, 1, field_cb_none-APP3_CSBASE
        KEY_DOWN        16h, EP_L_29D52_OFF, EP_L_29D52_SEG
        db      0cbh
L_274F5:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26C50-APP3_CSBASE
        KEY_CURSOR      EP_L_27459_OFF, APP3_SEG, EP_L_2752D_OFF, APP3_SEG, (APP3_BASE+L_274C0-APP3_SEG*16), APP3_SEG, EP_L_275F0_OFF, EP_L_275F0_SEG
        mov     cx, ds
        else
        if      FW_VERSION >= 110
        KEY_CURSOR      EP_L_2742F_OFF, APP3_SEG, EP_L_27489_OFF, APP3_SEG, EP_APP3_0B81_OFF, APP3_SEG, EP_L_274F5_OFF, APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+L_2662D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27489-APP3_SEG*16), APP3_SEG, EP_APP3_0B81_OFF, APP3_SEG, EP_L_274F5_OFF, APP3_SEG
        endif
        mov     cx, ds
        mov     si, 725h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_DOWN        16h, EP_L_29D52_OFF, EP_L_29D52_SEG
        db      0cbh
L_274F5:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26C50-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_27459-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26D5D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_274C0-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_275F0-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h
        endif
        mov     si, 712h
        mov     bl, 1
        mov     bh, 1
        mov     dx, 40h
        mov     di, intcb_2752A-APP3_CSBASE
        int     7eh
        KEY_DOWN        16h, (APP3_BASE+L_2BC28-APP3_SEG*16), APP3_SEG
        if      FW_VERSION < 114
        db      0cbh
intcb_2752A:
        db      0cdh
        sti
        endif
        retf
        if      FW_VERSION >= 114
intcb_2752A:
        db      0cdh, 0fbh, 0cbh
        endif
L_26D5D:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26C74-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_CURSOR      (APP3_BASE+L_274F5-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26DA5-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27489-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        if      FW_VERSION >= 111
        KEY_WHEEL2      (APP3_BASE+L_2755B-APP3_SEG*16), APP3_SEG, EP_L_27568_OFF, APP3_SEG
        else
        KEY_WHEEL2      (APP3_BASE+L_26C6E-APP3_SEG*16), APP3_SEG, EP_L_27568_OFF, APP3_SEG
        endif
        KEY_DOWN        16h, (APP3_BASE+L_2B7FE-APP3_SEG*16), APP3_SEG
        retf
        if      FW_VERSION >= 120
        elseif  FW_VERSION >= 114
L_2755B:
        call    fn_280C2
        and     byte ptr es:[si+680h], 0fdh
        call    fn_28082
        retf
        else
L_2755B:
L_26C6E:
        call    fn_280C2
        and     byte ptr es:[si+680h], 0fdh
        call    fn_28082
        retf
        endif
        if      FW_VERSION >= 120
L_2755B:
        call    fn_280C2
        db      26h, 80h, 0a4h, 80h, 06h, 0fdh, 0e8h, 1bh
        or      cx, bx
        endif
        else
        KEY_CURSOR      EP_L_274F5_OFF, APP3_SEG, (APP3_BASE+L_26DA5-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27489-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_WHEEL2      (APP3_BASE+L_26C6E-APP3_SEG*16), APP3_SEG, EP_L_27568_OFF, APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_2B7FE-APP3_SEG*16), APP3_SEG
L_26C6E                         equ     $+1
        db      0cbh, 0e8h
        pop     dx
        or      sp, word ptr [0a480h]
        add     byte ptr [0e8fdh], 11h
        or      cx, bx
        endif
L_27568:
        call    fn_280C2
        or      byte ptr es:[si+680h], 2
        call    fn_28082
        retf
L_26DA5:
L_27575:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26CA7-APP3_CSBASE
        if      FW_VERSION >= 110
        if      FW_VERSION >= 114
        KEY_CURSOR      EP_L_2752D_OFF, APP3_SEG, (APP3_BASE+L_26DEB-APP3_SEG*16), APP3_SEG, EP_L_27459_OFF, APP3_SEG, (APP3_BASE+L_26E9A-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      EP_L_26D5D_OFF, APP3_SEG, EP_L_26DEB_OFF, APP3_SEG, EP_L_27459_OFF, APP3_SEG, EP_L_26E9A_OFF, APP3_SEG
        endif
        KEY_DOWN        16h, (APP3_BASE+L_2CED6-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+L_26D5D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26DEB-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27459-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26E9A-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_2CED6-APP3_SEG*16), APP3_SEG
        mov     bl, 0
        endif
        call    fn_280C2
        add     si, 600h
        mov     cx, es
        mov     bl, 0
        mov     bh, 1
        mov     dx, 80h
        mov     di, intcb_275AE-APP3_CSBASE
        int     7eh
        retf
intcb_275AE:
        sub     al, 1
        jae     L_26FD3
        retf
L_26FD3:
        mov     bl, 18h
        int     87h
        call    fn_28082
        retf
L_26DEB:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 111
        call    FN_2687A
        else
        db      0e8h, 0c9h, 0f2h
        endif
        else
        call    FN_2687A
        endif
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26CC4-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_26DA5-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_275F0-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_274F5-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        FIELD_WHEEL     ds, 737h, 0, 0, 1, field_cb_none-APP3_CSBASE
        KEY_DOWN        16h, EP_FAR_2C541_OFF, APP3_SEG
        retf
L_275F0:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26CEC-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_CURSOR      (APP3_BASE+L_26DEB-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26E5D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_274F5-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      (APP3_BASE+L_26DEB-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2682D-APP3_SEG*16), APP3_SEG, EP_L_274F5_OFF, APP3_SEG, 0000h, 0000h
        endif
        KEY_DOWN        16h, (APP3_BASE+L_2C803-APP3_SEG*16), APP3_SEG
        call    fn_280C2
        add     si, 5c0h
        mov     cx, es
        mov     bl, 0
        mov     bh, 1
        mov     dx, 4
        mov     di, A3_W_00E79
        int     7dh
        retf
d_a3_w_00e79:
        call    fn_28082
        retf
        if      FW_VERSION >= 110
L_26E5D:
        if      FW_VERSION >= 111
        call    FN_2687A
        else
        db      0e8h, 57h, 0f2h
        endif
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26D53-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_275F0-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_26E9A-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_274F5-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        else
L_2682D:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26D53-APP3_CSBASE
        KEY_CURSOR      EP_L_275F0_OFF, EP_L_275F0_SEG, (APP3_BASE+L_26E9A-APP3_SEG*16), APP3_SEG, EP_L_274F5_OFF, APP3_SEG, 0000h, 0000h
        endif
        KEY_DOWN        16h, (APP3_BASE+L_2CC5B-APP3_SEG*16), APP3_SEG
        call    fn_280C2
        add     si, 580h
        mov     cx, es
        mov     bl, 0
        mov     bh, 1
        mov     dx, 20h
        mov     di, A3_W_00EB6
        int     7dh
        retf
d_a3_w_00eb6:
        call    fn_28082
        retf
L_26E9A:
        call    FN_2687A
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26D79-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_CURSOR      EP_L_2762D_OFF, APP3_SEG, 0000h, 0000h, EP_L_27575_OFF, APP3_SEG, 0000h, 0000h
        KEY_DOWN        16h, (APP3_BASE+L_2CF8D-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+L_2682D-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_26DA5-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_DOWN        16h, (APP3_BASE+L_2C161-APP3_SEG*16), APP3_SEG
        endif
        call    fn_280C2
        add     si, 640h
        mov     cx, es
        mov     bl, 0
        mov     bh, 1
        mov     dx, 0c8h
        mov     di, A3_W_00EF3
        int     7eh
        retf
d_a3_w_00ef3:
        db      3ch, 00h
        jne     L_276A9
        mov     al, 1
L_276A9:
        push    ax
        call    fn_280C2
        pop     ax
        mov     byte ptr es:[si+640h], al
        call    fn_28082
        retf
        if      FW_VERSION >= 110
L_26DE7:
        call    fn_28233
        jne     L_268B7
        retf
        endif
L_268B7:
        mov     al, 1
        int     0c4h
        int     0a8h
        retf
L_26DF4:
        int     0a3h
        cmp     word ptr [A3_W_00712], 3fh
        jne     br_276CE
        retf
br_276CE:
        inc     word ptr [A3_W_00712]
        callf   [A3_FP_00F08]
        retf
L_26E07:
        int     0a3h
        cmp     word ptr [A3_W_00712], 0
        jne     br_276E1
        retf
br_276E1:
        dec     word ptr [A3_W_00712]
        callf   [A3_FP_00F08]
        retf
        if      FW_VERSION >= 110
L_26E1A:
        call    fn_2823E
        jae     L_268E4
        retf
        endif
L_268E4:
        mov     es, word ptr [A3_W_00F10]
        mov     bx, word ptr [A3_W_00712]
        xor     byte ptr es:[bx+680h], 2
        retf
L_276FF:
        call    fn_280BD
        je      br_27705
        retf
br_27705:
        callf   EP_X_2D274_SEG:EP_X_2D274_OFF
        retf
L_2712B:
        int     88h
        cmp     ah, 0
        je      br_27713
        retf
br_27713:
        push    cs
        call    far_2B6D2
        retf
        int     0a4h
        DISP_CLEAR
        DISP_TEXT       37h, 19h, "BANK A KEY ON"
        db      0cbh
        int     0a4h
        DISP_CLEAR
        DISP_TEXT       37h, 19h, "BANK B KEY ON"
        db      0cbh
        int     0a4h
        DISP_CLEAR
        DISP_TEXT       37h, 19h, "BANK C KEY ON"
        db      0cbh
        int     0a4h
        DISP_CLEAR
        DISP_TEXT       37h, 19h, "BANK D KEY ON"
        db      0cbh
L_2777C:
        call    fn_280BD
        je      br_27782
        retf
br_27782:
        call    fn_2823E
        jae     br_2778A
        jmp     NEAR far_270FB
br_2778A:
        mov     byte ptr [A2_B_00F2E], 0
        push    cs
        call    seq_names_fetch
        callf   [A3_FP_00F14]
        retf
L_26EC8:
        DISP_WIN_WIDE   "Sequence"
        DISP_TEXT       20h, 10h, "Sequence name:"
        DISP_TEXT       20h, 1dh, " Default name:"
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "DELETE"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "COPY"
        DISP_HDOTS      1ah, 1ah, 0c4h
        mov     dx, 0f000h
        mov     si, 0
        mov     cl, 74h
        mov     ch, 10h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     si, 10h
        mov     dx, ds
        mov     cl, 74h
        mov     ch, 1dh
        mov     ah, 10h
        mov     bl, 5
        int     90h
        call    word ptr [A3_W_00F18]
        retf
cb_27818:
        DISP_CURSOR     74h, 10h, 7
        ret
cb_27821:
        mov     cl, 74h
        mov     ch, 1dh
        mov     al, 7
        int     0b0h
        ret
L_2782A:
        mov     word ptr [A3_FP_00F14], L_2782A-APP3_CSBASE
        mov     word ptr [A3_W_00F18], cb_27818-APP3_CSBASE
        int     0a4h
        if      FW_VERSION >= 110
        if      FW_VERSION >= 114
        KEY_DOWN        20h, (APP3_BASE+L_26EC8-APP3_SEG*16), APP3_SEG
        KEY_DOWN        1ah, (APP3_BASE+far_26FDE-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, EP_L_27930_OFF, APP3_SEG
        KEY_DOWN        13h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_271F0-APP3_SEG*16), APP3_SEG
        KEY_DOWN        27h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       (APP3_BASE+L_27895-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_27895-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_27895-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+L_27895-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        db      0cbh
L_27895:
        mov     si, 0
        mov     dx, 0f000h
        mov     ah, 10h
        mov     bx, 18ddh
        mov     cx, cs
        int     0b7h
        retf
L_270D5:
        push    cs
        call    seq_names_fetch
        push    cs
        call    goto_main_screen
        retf
far_26FDE:
        mov     word ptr [A3_FP_00F14], far_26FDE-APP3_CSBASE
        mov     word ptr [A3_W_00F18], cb_27821-APP3_CSBASE
        int     0a4h
        KEY_DOWN        20h, (APP3_BASE+L_26EC8-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        20h, EP_L_26EC8_OFF, APP3_SEG
        KEY_DOWN        1ah, (APP3_BASE+far_26FDE-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 112
        KEY_DOWN        11h, EP_L_27930_OFF, APP3_SEG
        else
        KEY_DOWN        11h, (APP3_BASE+L_27930-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        13h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, EP_L_271F0_OFF, APP3_SEG
        KEY_DOWN        27h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 112
        KEY_WHEEL       (APP3_BASE+L_26A89-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_26A89-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_26A89-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+L_26A89-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        db      0cbh
L_26A89:
        db      0beh, 00h, 00h, 0bah, 00h, 0f0h, 0b4h, 10h
        db      0bbh, 0ddh, 18h, 8ch, 0c9h, 0cdh, 0b7h, 0cbh
L_270D5:
        db      0eh, 0e8h, 80h, 09h, 0eh, 0e8h, 7dh, 0efh
        else
        KEY_WHEEL       (APP3_BASE+FAR_26FC5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+FAR_26FC5-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+FAR_26FC5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+FAR_26FC5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        db      0cbh
far_26FC5:
        db      0beh, 00h, 00h, 0bah, 00h, 0f0h, 0b4h, 10h
        if      FW_VERSION >= 111
        db      0bbh, 0ddh, 18h, 8ch, 0c9h, 0cdh, 0b7h, 0cbh
        else
        db      0bbh, 0d0h, 18h, 8ch, 0c9h, 0cdh, 0b7h, 0cbh
        endif
L_270D5:
        if      FW_VERSION >= 111
        db      0eh, 0e8h, 80h, 09h, 0eh, 0e8h, 7dh, 0efh
        else
        db      0eh, 0e8h, 80h, 09h, 0eh, 0e8h, 8ah, 0efh
        endif
        endif
        db      0cbh
far_26FDE:
        mov     word ptr [A3_FP_00F14], far_26FDE-APP3_CSBASE
        mov     word ptr [A3_W_00F18], cb_27821-APP3_CSBASE
        db      0cdh, 0a4h
        KEY_DOWN        20h, EP_L_26EC8_OFF, APP3_SEG
        endif
        KEY_DOWN        19h, EP_L_2782A_OFF, EP_L_2782A_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        11h, EP_L_27930_OFF, APP3_SEG
        KEY_DOWN        12h, (APP3_BASE+L_27921-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_271F0-APP3_SEG*16), APP3_SEG
        KEY_DOWN        27h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       (APP3_BASE+L_27921-APP3_SEG*16), APP3_SEG
        else
        if      FW_VERSION >= 111
        KEY_DOWN        11h, EP_L_27930_OFF, APP3_SEG
        else
        KEY_DOWN        11h, (APP3_BASE+L_27930-APP3_SEG*16), APP3_SEG
        endif
        if      FW_VERSION >= 112
        KEY_DOWN        12h, (APP3_BASE+L_26B15-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        12h, (APP3_BASE+L_27051-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        13h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, EP_L_271F0_OFF, APP3_SEG
        KEY_DOWN        27h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 112
        KEY_WHEEL       (APP3_BASE+L_26B15-APP3_SEG*16), APP3_SEG
        else
        KEY_WHEEL       (APP3_BASE+L_27051-APP3_SEG*16), APP3_SEG
        endif
        endif
        if      FW_VERSION >= 114
        KEY_DOWN        22h, (APP3_BASE+L_27921-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_27921-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+L_27921-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        retf
L_27921:
        mov     si, 10h
        mov     dx, ds
        mov     ah, 10h
        mov     bx, 18ddh
        mov     cx, cs
        int     0b7h
        retf
L_27930:
        mov     byte ptr [C0_B_02AD7], 0
        mov     bl, 1bh
        int     87h
        push    cs
        call    seq_names_fetch
        int     0a4h
        FIELD_ENTRY     ds, 710h, 1, 0, 63h, field_cb_none-APP3_CSBASE
        KEY_DOWN        20h, (APP3_BASE+L_270A9-APP3_SEG*16), APP3_SEG
        else
        if      FW_VERSION >= 112
        KEY_DOWN        22h, (APP3_BASE+L_26B15-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_26B15-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+L_26B15-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        22h, (APP3_BASE+L_27051-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_27051-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+L_27051-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
L_27051                         equ     $+1
        endif
        if      FW_VERSION >= 111
        db      0cbh
L_26B15:
        db      0beh, 10h, 00h, 8ch, 0dah, 0b4h, 10h, 0bbh, 0ddh, 18h, 8ch, 0c9h
        if      FW_VERSION < 112
L_27930                         equ     $+3
        endif
        db      0cdh, 0b7h, 0cbh
L_27160:
        db      0c6h, 06h, 0c7h, 2ah, 00h, 0b3h, 1bh, 0cdh, 87h, 0eh, 0e8h, 0ech, 08h
        db      0cdh, 0a4h, 8ch, 0d9h, 0beh, 10h, 07h, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 0dch
        else
        db      0cbh, 0beh, 10h, 00h, 8ch, 0dah, 0b4h, 10h, 0bbh, 0d0h, 18h, 8ch, 0c9h
L_27930                         equ     $+3
        db      0cdh, 0b7h, 0cbh, 0c6h, 06h, 0c7h, 2ah, 00h, 0b3h, 1bh, 0cdh, 87h, 0eh, 0e8h, 0ech, 08h
        db      0cdh, 0a4h, 8ch, 0d9h, 0beh, 10h, 07h, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 0cfh
        endif
        db      18h, 0cdh, 7eh
        KEY_DOWN        20h, EP_L_270A9_OFF, APP3_SEG
        endif
        KEY_DOWN        12h, EP_L_27A10_OFF, APP3_SEG
        KEY_DOWN        13h, EP_L_2777C_OFF, APP3_SEG
        else
        KEY_DOWN        20h, EP_L_26EC8_OFF, APP3_SEG
        KEY_DOWN        1ah, EP_APP3_10FE_OFF, APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_27930-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, EP_L_271F0_OFF, APP3_SEG
        KEY_DOWN        27h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       (APP3_BASE+L_26A89-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_26A89-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_26A89-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+L_26A89-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        db      0cbh
L_26A89:
        mov     si, 0
        mov     dx, 0f000h
        mov     ah, 10h
        mov     bx, 18c1h
        mov     cx, cs
        int     0b7h
        retf
L_270D5:
        push    cs
        call    seq_names_fetch
        push    cs
        call    goto_main_screen
        retf
far_26FDE:
        mov     word ptr [A3_FP_00F14], far_26FDE-APP3_CSBASE
        mov     word ptr [A3_W_00F18], cb_27821-APP3_CSBASE
        int     0a4h
        KEY_DOWN        20h, EP_L_26EC8_OFF, APP3_SEG
        KEY_DOWN        19h, EP_L_2782A_OFF, APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_27930-APP3_SEG*16), APP3_SEG
        KEY_DOWN        12h, (APP3_BASE+L_26B15-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, EP_L_271F0_OFF, APP3_SEG
        KEY_DOWN        27h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       (APP3_BASE+L_26B15-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_26B15-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_26B15-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+L_26B15-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (APP3_BASE+L_270D5-APP3_SEG*16), APP3_SEG
        db      0cbh
L_26B15:
        db      0beh, 10h, 00h, 8ch, 0dah, 0b4h, 10h
        mov     bx, 18c1h
        mov     cx, cs
        int     0b7h
        retf
L_27930:
        mov     byte ptr [C0_B_02AD7], 0
        mov     bl, 1bh
        int     87h
        push    cs
        call    seq_names_fetch
        int     0a4h
        mov     cx, ds
        mov     si, 710h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, intcb_2808C-APP3_CSBASE
        int     7eh
        KEY_DOWN        20h, EP_L_270A9_OFF, APP3_SEG
        KEY_DOWN        12h, (APP3_BASE+L_27A10-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, EP_L_26EAC_OFF, APP3_SEG
        endif
        KEY_DOWN        14h, (APP3_BASE+L_272DD-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_270A9:
        DISP_WIN        32h, 06h, 0beh, 36h, "Delete Sequence"
        DISP_TEXT       46h, 11h, "Sq:  -"
        DISP_TEXT       46h, 1fh, "Pressing DO^IT will^erase"
        DISP_TEXT       46h, 28h, "this sequence!!"
        db      0beh, 11h, 00h
        DISP_BMP        0d8h, 18h, 11h
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "ALL SQ"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        db      0a1h, 10h, 07h
        mov     cl, 58h
        mov     ch, 11h
        call    fn_27FF8
        DISP_CURSOR     58h, 11h, 73h
        retf
L_27A10:
        int     0a4h
        if      FW_VERSION >= 114
        KEY_DOWN        13h, EP_L_27930_OFF, APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_271CD-APP3_SEG*16), APP3_SEG
        else
        if      FW_VERSION >= 111
        KEY_DOWN        13h, EP_L_27930_OFF, APP3_SEG
        else
        KEY_DOWN        13h, (APP3_BASE+L_27930-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        14h, EP_L_271CD_OFF, APP3_SEG
        endif
        DISP_WIN        32h, 06h, 0beh, 36h, "Delete ALL Sequences"
        mov     si, 0eh
        DISP_BMP        3ch, 16h, 0eh
        mov     si, 11h
        DISP_BMP        0d9h, 1ch, 11h
        DISP_TEXT       53h, 14h, "Pressing DO IT will^erase"
        DISP_TEXT       53h, 1eh, "ALL sequences!!"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        db      0cbh
L_271CD:
        int     0d4h
        mov     byte ptr [A2_B_00F2E], 0
        push    cs
        call    seq_names_fetch
        push    cs
        call    goto_main_screen
        retf
L_272DD:
        mov     ax, word ptr [A2_W_CUR_SEQ]
        int     0d3h
        mov     byte ptr [A2_B_00F2E], 0
        push    cs
        call    seq_names_fetch
        push    cs
        call    goto_main_screen
        retf
L_271F0:
        push    cs
        call    seq_names_fetch
        int     0ebh
        mov     word ptr [A3_W_00F20], ax
        int     0a4h
        if      FW_VERSION >= 110
        if      FW_VERSION >= 111
        KEY_DOWN        20h, (APP3_BASE+L_27AF0-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        20h, (APP3_BASE+L_27203-APP3_SEG*16), APP3_SEG
        endif
        if      FW_VERSION >= 112
        KEY_DOWN        12h, (APP3_BASE+L_2743D-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        12h, (APP3_BASE+FAR_2733D-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        13h, EP_L_2777C_OFF, APP3_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        14h, (APP3_BASE+L_27404-APP3_SEG*16), APP3_SEG
        callf   [A3_FP_00F1A]
        retf
        else
        if      FW_VERSION >= 112
        KEY_DOWN        14h, EP_APP3_1424_OFF, APP3_SEG
        else
        KEY_DOWN        14h, EP_FAR_27304_OFF, APP3_SEG
        endif
        db      0ffh, 1eh, 1ah, 0fh, 0cbh
L_27203:
        endif
L_27AF0:
        else
        KEY_DOWN        20h, (APP3_BASE+L_27203-APP3_SEG*16), APP3_SEG
        KEY_DOWN        12h, (APP3_BASE+L_2743D-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, EP_L_26EAC_OFF, APP3_SEG
        KEY_DOWN        14h, EP_APP3_1424_OFF, APP3_SEG
        db      0ffh, 1eh
        sbb     cl, byte ptr [bx]
        retf
L_27203:
        endif
        DISP_WIN        32h, 06h, 0beh, 36h, "Copy Sequence"
        DISP_TEXT       46h, 10h, "Sq:"
        DISP_TEXT       46h, 28h, "Sq:"
        mov     si, 0dh
        DISP_BMP        82h, 19h, 0dh
        DISP_TEXT       92h, 1bh, "COPY"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "PARAM"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        mov     ax, word ptr [A2_W_CUR_SEQ]
        mov     cl, 58h
        mov     ch, 10h
        call    fn_27FF8
        mov     ax, word ptr [A3_W_00F20]
        mov     cl, 58h
        mov     ch, 28h
        call    fn_27FF8
        call    word ptr [A3_W_00F1E]
        retf
cb_27B66:
        DISP_CURSOR     58h, 10h, 73h
        ret
cb_27B6F:
        mov     cl, 58h
        mov     ch, 28h
        mov     al, 73h
        int     0b0h
        ret
        if      FW_VERSION >= 110
far_272A8:
        mov     word ptr [A3_W_00F1A], FAR_272A8-APP3_CSBASE
        mov     word ptr [A3_W_00F1E_2], cb_27B66-APP3_CSBASE
        FIELD_ENTRY     ds, 710h, 1, 0, 63h, field_cb_none-APP3_CSBASE
        KEY_DOWN        19h, 0000h, 0000h
        if      FW_VERSION >= 114
        KEY_DOWN        1ah, (APP3_BASE+L_27BA6-APP3_SEG*16), APP3_SEG
        retf
L_27BA6:
        mov     word ptr [A3_FP_00F1A], L_27BA6-APP3_CSBASE
        mov     word ptr [A3_W_00F1E], cb_27B6F-APP3_CSBASE
        FIELD_ENTRY     ds, 0f20h, 1, 0, 63h, field_cb_none-APP3_CSBASE
        else
        if      FW_VERSION >= 112
        KEY_DOWN        1ah, (APP3_BASE+L_273D6-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        1ah, (APP3_BASE+FAR_272D6-APP3_SEG*16), APP3_SEG
far_272D6                       equ     $+1
        endif
        if      FW_VERSION >= 111
        db      0cbh
L_273D6:
        db      0c7h, 06h, 1ah, 0fh, 0f6h, 13h
        mov     word ptr [A3_W_00F1E], cb_27B6F-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 20h, 0fh, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 0dch
        else
        db      0cbh, 0c7h, 06h, 1ah, 0fh, 0e9h, 13h
        mov     word ptr [A3_W_00F1E], cb_27B6F-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 20h, 0fh, 0b3h, 01h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 0cfh
        endif
        db      18h, 0cdh, 7eh
        endif
        if      FW_VERSION >= 112
        KEY_DOWN        19h, EP_L_27B78_OFF, APP3_SEG
        else
        KEY_DOWN        19h, EP_FAR_272A8_OFF, APP3_SEG
        endif
        KEY_DOWN        1ah, 0000h, 0000h
        if      FW_VERSION < 114
        db      0cbh
L_27404:
        db      0a1h, 20h, 0fh, 3bh, 06h, 10h, 07h, 75h, 01h, 0cbh, 0cdh, 0d3h
        db      0a1h, 10h, 07h, 0cdh, 0d1h, 0b8h, 0e7h, 03h, 0bah, 00h, 00h, 0b9h, 00h, 00h, 0b3h, 0bh
        db      0cdh, 87h, 0cdh, 80h, 0a1h, 20h, 0fh, 50h, 0cdh, 0d2h, 72h, 0dh, 58h, 0a3h, 10h, 07h
far_2733D                       equ     $+0dh
        if      FW_VERSION >= 111
        db      0eh, 0e8h, 25h, 06h, 0eh, 0e8h, 22h, 0ech, 0cbh, 5bh, 0cdh, 95h, 0cbh
L_2743D:
        db      0a1h, 20h, 0fh
        else
        db      0eh, 0e8h, 25h, 06h, 0eh, 0e8h, 2fh, 0ech, 0cbh, 5bh, 0cdh, 95h, 0cbh, 0a1h, 20h, 0fh
        endif
        db      3bh, 06h, 10h, 07h, 75h, 01h, 0cbh, 0cdh, 0d3h, 0a1h, 10h, 07h, 0cdh, 0d1h, 0b3h, 0bh
        db      0cdh, 87h, 0a1h, 20h, 0fh, 50h, 0cdh, 71h, 58h, 0a3h, 10h, 07h, 0eh, 0e8h, 0f9h, 05h
        if      FW_VERSION >= 111
        db      0eh, 0e8h, 0f6h, 0ebh, 0cbh
L_27C35:
        db      8eh, 06h, 10h, 0fh, 0beh, 35h, 00h, 0e8h, 2ah, 00h
        else
L_27C35                         equ     $+5
        db      0eh, 0e8h, 03h, 0ech, 0cbh, 8eh, 06h, 10h, 0fh, 0beh, 35h, 00h, 0e8h, 2ah, 00h
        endif
        KEY_DOWN        13h, (APP3_BASE+far_27390-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+far_27390-APP3_SEG*16), APP3_SEG
        KEY_DOWN        27h, (APP3_BASE+far_27390-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (APP3_BASE+far_27390-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
        if      FW_VERSION >= 114
L_27404:
        mov     ax, word ptr [A3_W_00F20]
        cmp     ax, word ptr [A2_W_CUR_SEQ]
        jne     br_27BDE
        retf
br_27BDE:
        int     0d3h
        mov     ax, word ptr [A2_W_CUR_SEQ]
        int     0d1h
        mov     ax, 3e7h
        mov     dx, 0
        mov     cx, 0
        mov     bl, 0bh
        int     87h
        int     80h
        mov     ax, word ptr [A3_W_00F20]
        push    ax
        int     0d2h
        jb      br_27C09
        pop     ax
        mov     word ptr [A2_W_CUR_SEQ], ax
        push    cs
        call    seq_names_fetch
        push    cs
        call    goto_main_screen
        retf
br_27C09:
        pop     bx
        int     95h
        retf
L_2743D:
        mov     ax, word ptr [A3_W_00F20]
        cmp     ax, word ptr [A2_W_CUR_SEQ]
        jne     br_27C17
        retf
br_27C17:
        int     0d3h
        mov     ax, word ptr [A2_W_CUR_SEQ]
        int     0d1h
        mov     bl, 0bh
        int     87h
        mov     ax, word ptr [A3_W_00F20]
        push    ax
        int     71h
        pop     ax
        mov     word ptr [A2_W_CUR_SEQ], ax
        push    cs
        call    seq_names_fetch
        push    cs
        call    goto_main_screen
        retf
L_27C35:
        mov     es, word ptr [A3_W_00F10]
        mov     si, 35h
        call    L_27689
        KEY_DOWN        13h, EP_L_27C60_OFF, APP3_SEG
        KEY_DOWN        16h, EP_L_27C60_OFF, APP3_SEG
        KEY_DOWN        27h, EP_L_27C60_OFF, APP3_SEG
        KEY_DOWN        26h, EP_L_27C60_OFF, APP3_SEG
        retf
far_27390:
        KEY_RESTORE     A3_TBL_01072
        push    cs
        call    far_271D9
        retf
L_27689:
        mov     word ptr [A3_FP_0106C], si
        mov     word ptr [A3_W_0106E], es
        KEY_SAVE        A3_TBL_01072
        int     0a4h
        KEY_DOWN        20h, (APP3_BASE+L_27C84-APP3_SEG*16), APP3_SEG
        else
far_27390:
        KEY_RESTORE     A3_TBL_01072
        push    cs
        call    far_271D9
        retf
        mov     word ptr [A3_FP_0106C], si
        mov     word ptr [A3_W_0106E], es
        KEY_SAVE        A3_TBL_01072
        int     0a4h
        KEY_DOWN        20h, EP_L_273B4_OFF, APP3_SEG
        endif
        db      0eh
        else
FAR_272A8:
        mov     word ptr [A3_W_00F1A], FAR_272A8-APP3_CSBASE
        mov     word ptr [A3_W_00F1E], cb_27B66-APP3_CSBASE
        mov     cx, ds
        mov     si, 710h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, intcb_2808C-APP3_CSBASE
        int     7eh
        KEY_DOWN        19h, 0000h, 0000h
        KEY_DOWN        1ah, (APP3_BASE+L_27BA6-APP3_SEG*16), APP3_SEG
        db      0cbh
L_27BA6:
        mov     word ptr [A3_W_00F1A], L_27BA6-APP3_CSBASE
        mov     word ptr [A3_W_00F1E], cb_27B6F-APP3_CSBASE
        FIELD_ENTRY     ds, 0f20h, 1, 0, 63h, field_cb_none-APP3_CSBASE
        KEY_DOWN        19h, (APP3_BASE+FAR_272A8-APP3_SEG*16), APP3_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        db      0cbh
L_27404:
        mov     ax, word ptr [A3_W_00F20]
        cmp     ax, word ptr [A2_W_CUR_SEQ]
        jne     br_27BDE
        retf
br_27BDE:
        int     0d3h
        mov     ax, word ptr [A2_W_CUR_SEQ]
        int     0d1h
        mov     ax, 3e7h
        mov     dx, 0
        mov     cx, 0
        mov     bl, 0bh
        int     87h
        int     80h
        mov     ax, word ptr [A3_W_00F20]
        push    ax
        int     0d2h
        jb      br_27C09
        pop     ax
        mov     word ptr [A2_W_CUR_SEQ], ax
        push    cs
        call    seq_names_fetch
        push    cs
        call    goto_main_screen
        retf
br_27C09:
        pop     bx
        int     95h
        retf
L_2743D:
        mov     ax, word ptr [A3_W_00F20]
        cmp     ax, word ptr [A2_W_CUR_SEQ]
        jne     br_27C17
        retf
br_27C17:
        int     0d3h
        mov     ax, word ptr [A2_W_CUR_SEQ]
        int     0d1h
        mov     bl, 0bh
        int     87h
        mov     ax, word ptr [A3_W_00F20]
        push    ax
        int     71h
        pop     ax
        mov     word ptr [A2_W_CUR_SEQ], ax
        push    cs
        call    seq_names_fetch
        push    cs
        call    goto_main_screen
        retf
L_27C35:
        mov     es, word ptr [A3_W_00F10]
        mov     si, 35h
        call    L_26E5D
        KEY_DOWN        13h, EP_L_27C60_OFF, APP3_SEG
        KEY_DOWN        16h, EP_L_27C60_OFF, APP3_SEG
        KEY_DOWN        27h, EP_L_27C60_OFF, APP3_SEG
        KEY_DOWN        26h, EP_L_27C60_OFF, APP3_SEG
        db      0cbh
far_27390:
        KEY_RESTORE     A3_TBL_01072
        push    cs
        call    far_271D9
        retf
L_26E5D:
        mov     word ptr [A3_FP_0106C], si
        mov     word ptr [A3_W_0106E], es
        KEY_SAVE        A3_TBL_01072
        int     0a4h
        KEY_DOWN        20h, (APP3_BASE+L_27C84-APP3_SEG*16), APP3_SEG
        push    cs
        endif
        call    far_27D8E
        ret
L_27C84:
        DISP_WIN_WIDE   "Time Display"
        DISP_TEXT       1ah, 0dh, " Display style:"
        DISP_TEXT       1ah, 17h, "    Start time:  h  m  s  f  "
        DISP_TEXT       1ah, 21h, "    Frame rate:"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        db      8ch, 0dah
        DISP_TEXT_IDX   74h, 0dh, 00718h, 0104dh
        db      0c4h, 36h, 6ch
        adc     byte ptr [A3_B_0048A], ah
        DISP_NUM0       74h, 17h, 02h
        les     si, [A3_FP_0106C]
        mov     al, byte ptr es:[si+1]
        DISP_NUM0       86h, 17h, 02h
        les     si, [A3_FP_0106C]
        mov     al, byte ptr es:[si+2]
        DISP_NUM0       98h, 17h, 02h
        les     si, [A3_FP_0106C]
        mov     al, byte ptr es:[si+3]
        DISP_NUM0       0aah, 17h, 02h
        les     si, [A3_FP_0106C]
        mov     al, byte ptr es:[si+4]
        DISP_NUM0       0bch, 17h, 02h
        mov     dx, ds
        DISP_TEXT_IDX   74h, 21h, 00774h, 013e3h
        call    word ptr [A3_W_01070]
        retf
tgt_27D4F:
        DISP_CURSOR     74h, 0dh, 5bh
        ret
cb_27D58:
        DISP_CURSOR     74h, 17h, 0dh
        ret
cb_27D61:
        DISP_CURSOR     86h, 17h, 0dh
        ret
cb_27D6A:
        DISP_CURSOR     98h, 17h, 0dh
        ret
cb_27D73:
        DISP_CURSOR     0aah, 17h, 0dh
        ret
cb_27D7C:
        DISP_CURSOR     0bch, 17h, 0dh
        ret
cb_27D85:
        DISP_CURSOR     74h, 21h, 13h
        ret
far_27D8E:
        mov     word ptr [A3_W_01070], tgt_27D4F-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_27DB8-APP3_SEG*16), APP3_SEG
        FIELD_WHEEL     ds, 718h, 0, 1, 1, field_cb_none-APP3_CSBASE
        retf
L_27DB8:
        call    fn_280BD
        je      L_277DE
        retf
L_277DE:
        mov     word ptr [A3_W_01070], cb_27D58-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_27619-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_27D8E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27EE3-APP3_SEG*16), APP3_SEG
        les     si, [A3_FP_0106C]
        mov     cx, es
        mov     bl, 0
        mov     bh, 0
        mov     dx, 17h
        mov     di, field_cb_none-APP3_CSBASE
        int     7eh
        retf
L_27619:
        mov     word ptr [A3_W_01070], cb_27D61-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_27DB8-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27E17-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_27D8E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27EE3-APP3_SEG*16), APP3_SEG
        les     si, [A3_FP_0106C]
        mov     cx, es
        add     si, 1
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3bh
        mov     di, L_27E81-APP3_CSBASE
        int     7eh
        retf
L_27E17:
        mov     word ptr [A3_W_01070], cb_27D6A-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_27619-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27E45-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_27D8E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27EE3-APP3_SEG*16), APP3_SEG
        les     si, [A3_FP_0106C]
        mov     cx, es
        add     si, 2
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3bh
        mov     di, field_cb_none-APP3_CSBASE
        int     7eh
        retf
L_27E45:
        mov     word ptr [A3_W_01070], cb_27D73-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_27E17-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27EB4-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_27D8E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27EE3-APP3_SEG*16), APP3_SEG
        les     si, [A3_FP_0106C]
        add     si, 3
        mov     bl, byte ptr [A3_B_00774]
        mov     bh, 0
        mov     dl, byte ptr cs:[bx+TBL_27E7D-APP3_CSBASE]
        mov     dh, 0
        mov     cx, es
        mov     bl, 0
        mov     bh, 0
        mov     di, L_27E81-APP3_CSBASE
        int     7eh
        retf
TBL_27E7D:
        db      17h, 18h, 1dh, 1dh
L_27E81:
        cmp     byte ptr [A3_B_00774], 2
        je      br_27E89
        retf
br_27E89:
        les     si, [A3_FP_0106C]
        mov     al, byte ptr es:[si+3]
        cmp     al, 2
        jb      br_27E96
        retf
br_27E96:
        cmp     byte ptr es:[si+2], 0
        je      br_27E9E
        retf
br_27E9E:
        sub     ax, ax
        mov     al, byte ptr es:[si+1]
        mov     bl, 0ah
        div     bl
        cmp     ah, 0
        jne     L_278CE
        retf
L_278CE:
        mov     byte ptr es:[si+3], 2
        retf
L_27EB4:
        mov     word ptr [A3_W_01070], cb_27D7C-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_27E45-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+far_27D8E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27EE3-APP3_SEG*16), APP3_SEG
        les     si, [A3_FP_0106C]
        mov     cx, es
        add     si, 4
        mov     bl, 0
        mov     bh, 0
        mov     dx, 63h
        mov     di, field_cb_none-APP3_CSBASE
        int     7eh
        retf
        retf
L_27EE3:
        mov     word ptr [A3_W_01070], cb_27D85-APP3_CSBASE
        FIELD_ENTRY     ds, 774h, 0, 0, 3, intcb_27F0D-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_27DB8-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
intcb_27F0D:
        les     si, [A3_FP_0106C]
        mov     al, byte ptr es:[si+3]
        mov     bl, byte ptr [A3_B_00774]
        mov     bh, 0
        mov     bl, byte ptr cs:[bx+TBL_27E7D-APP3_CSBASE]
        dec     bl
        cmp     al, bl
        jb      br_27F2A
        mov     byte ptr es:[si+3], bl
br_27F2A:
        push    cs
        call    L_27E81
        retf
seq_buffer_init_blank:
        call    fn_27F33
        retf
fn_27F33:
        mov     es, word ptr [0f10h]
        sub     di, di
        sub     ax, ax
        mov     cx, 2000h
        rep stosw
        mov     si, 10h
        sub     di, di
        mov     cx, 700h
        rep movsb
        mov     di, 0
        mov     si, 0f98h
        mov     cx, 10h
        rep movsb
        call    fn_27F67
        mov     es, word ptr [0f10h]
        mov     di, 2800h
        mov     al, 0ffh
        mov     cx, 10h
        rep stosb
        ret
fn_27F67:
        mov     es, word ptr [0f10h]
        mov     di, 700h
        mov     word ptr es:[di], 3e8h
        sub     ax, ax
        mov     word ptr es:[di+2], ax
        mov     word ptr es:[di+4], ax
        add     di, 0eh
        mov     bl, byte ptr es:[19h]
        mov     bh, 0
        sub     dx, dx
        mov     ax, 180h
        div     bx
        mov     bx, ax
        mov     ah, byte ptr es:[18h]
        mul     ah
        mov     bp, ax
        mul     word ptr es:[A3_W_0001A]
        mov     word ptr es:[di+2], ax
        mov     word ptr es:[di+4], dx
        mov     word ptr es:[1ch], ax
        mov     word ptr es:[1eh], dx
        mov     word ptr es:[di], 3e8h
        mov     di, 1500h
        mov     dh, bl
        sub     ax, ax
        mov     dl, 0
        mov     cx, word ptr es:[A3_W_0001A]
tgt_27FC2:
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], dx
        add     di, 4
        add     ax, bp
        adc     dl, 0
        loop    tgt_27FC2
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], dx
        int     0dfh
        ret
L_279FD:
        push    ds
L_2780E:
        mov     ax, 63h
        int     0deh
        mov     es, dx
        mov     ds, word ptr [A3_W_00F10]
        sub     si, si
        sub     di, di
        mov     cx, 2000h
        rep movsw
        pop     ds
        ret
draw_seq_number_name:
        call    fn_27FF8
        retf
fn_27FF8:
        mov     ah, 0
        push    ax
        inc     al
        mov     bh, 2
        mov     bl, 9
        int     90h
        add     cl, 0ch
        mov     al, 2dh
        mov     bl, 4
        int     90h
        add     cl, 6
        pop     ax
        mov     ah, 12h
        mul     ah
        add     ax, 810h
        mov     si, ax
        mov     dx, ds
        mov     ah, 10h
        mov     bl, 5
        int     90h
        ret
fn_28022:
        push    ax
        inc     al
        mov     bh, 2
        mov     bl, 9
        int     90h
        add     cl, 0ch
        mov     al, 2dh
        mov     bl, 4
        int     90h
        add     cl, 6
        pop     ax
fn_28038:
        mov     si, ax
        mov     es, word ptr [A3_W_00F10]
        test    byte ptr es:[si+680h], 1
        je      br_2805C
        mov     ah, 10h
        mul     ah
        add     ax, 180h
        mov     si, ax
        mov     dx, word ptr [A3_W_00F10]
        mov     ah, 10h
        mov     dx, es
        mov     bl, 5
        int     90h
        ret
br_2805C:
        mov     si, str_28068-APP3_CSBASE
        mov     dx, cs
        mov     ah, 8
        mov     bl, 5
        int     90h
        ret
str_28068:
        db      "(Unused)"
L_28070:
        mov     ah, 10h
        mul     ah
        add     ax, 190h
        mov     si, ax
        mov     dx, ds
        mov     ah, 10h
        mov     bl, 5
        int     90h
        ret
fn_28082:
        call    fn_280C2
        or      byte ptr es:[si+680h], 1
        ret
field_cb_none:
intcb_2808C:
        retf
d_a3_w_018dd:
        mov     ax, 1
        retf
        call    fn_280C2
        and     byte ptr es:[si+680h], 0feh
        mov     di, si
        mov     ax, si
        shl     di, 4
        add     di, 180h
        mov     si, 0f88h
        mov     cx, 10h
        push    di
        rep movsb
        pop     di
        inc     al
        mov     bl, 0ah
        div     bl
        or      ax, 3030h
        mov     word ptr es:[di+6], ax
        ret
fn_280BD:
        int     88h
        cmp     al, 0
        ret
fn_280C2:
        mov     es, word ptr [A3_W_00F10]
        mov     si, word ptr [A3_W_00712]
        ret
fn_280CB:
        push    es
        push    si
        call    fn_280C2
        cmp     byte ptr es:[si+5c0h], 0
        pop     si
        pop     es
        ret
draw_bar_beat_tick:
        call    fn_280DD
        retf
fn_280DD:
        inc     ax
        cmp     ax, 3e8h
        jb      br_280E6
        sub     ax, 3e8h
br_280E6:
        mov     bh, 3
        mov     bl, 9
        int     90h
        add     cl, 12h
        mov     al, 2eh
        mov     bl, 4
        int     90h
        add     cl, 6
        mov     al, dl
        inc     al
        mov     bh, 2
        mov     bl, 9
        int     90h
        add     cl, 0ch
        mov     al, 2eh
        mov     bl, 4
        int     90h
        add     cl, 6
        mov     al, dh
        mov     bl, 9
        int     90h
        ret
fn_28115:
        mov     dx, cs
        mov     si, str_28145-APP3_CSBASE
        mov     ah, 19h
        mov     bl, 5
        int     90h
        add     cl, 24h
        mov     ax, word ptr [A3_W_0154D]
        mov     dl, byte ptr [A3_B_0154F]
        mov     dh, byte ptr [A3_B_01550]
        push    cx
        call    fn_280DD
        pop     cx
        mov     ax, word ptr [A3_W_01551]
        mov     dl, byte ptr [A3_B_01553]
        mov     dh, byte ptr [A3_B_01554]
        add     cl, 3ch
        call    fn_280DD
        ret
str_28145:
        db      " Time:   .  .  -   .  .  "
fn_2815E:
        call    fn_280CB
        jne     br_28187
        mov     dx, cs
        mov     si, str_281A3-APP3_CSBASE
        mov     ah, 19h
        mov     bl, 5
        int     90h
        add     cl, 24h
        mov     al, byte ptr [A3_B_01577]
        mov     bl, 1eh
        mov     bh, 1
        int     90h
        add     cl, 36h
        mov     al, byte ptr [A3_B_01578]
        mov     bl, 1eh
        mov     bh, 1
        int     90h
        ret
br_28187:
        mov     dx, cs
        mov     ah, 21h
        mov     si, str_281BC-APP3_CSBASE
        mov     bl, 5
        int     90h
        mov     al, byte ptr [A3_B_0157A]
        mov     ah, byte ptr [A3_B_01579]
        add     cl, 24h
        mov     bl, 1eh
        mov     bh, 2
        int     90h
        ret
str_281A3:
        db      "Notes:        -          "
str_281BC:
        db      "Notes:                  (Hit pad)"
        mov     es, word ptr [A3_W_00F10]
        shl     ax, 2
        add     ax, 1500h
        mov     si, ax
        mov     bx, word ptr es:[si+4]
        sub     bx, word ptr es:[si]
        mov     ax, bx
        mov     dx, word ptr es:[si+2]
        div     dh
        mov     cx, ax
        mov     ax, word ptr es:[si]
        ret
fn_281FE:
        mov     al, byte ptr es:[si+4]
        add     si, 8
        jae     br_2820F
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_2820F:
        cmp     al, 0f0h
        jne     L_27958
loop_28213:
        mov     al, byte ptr es:[si+4]
        add     si, 8
        jae     br_28224
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_28224:
        cmp     al, 0f8h
        jne     loop_28213
L_27958:
        ret
seq_names_fetch:
        mov     ax, ds
        mov     es, ax
        mov     si, 810h
        int     0e9h
        retf
fn_28233:
        mov     es, word ptr [A3_W_00F10]
        cmp     byte ptr es:[12h], 0
        ret
fn_2823E:
        call    fn_28233
        clc
        je      br_28245
        ret
br_28245:
        int     0d5h
        cmp     al, 0
        je      br_2825A
        call    fn_28260
        int     0d2h
        push    cs
        call    seq_names_fetch
        push    cs
        call    L_27146
        clc
        ret
br_2825A:
        mov     al, 19h
        int     95h
        stc
        ret
fn_28260:
        call    fn_27F33
        mov     es, word ptr [A3_W_00F10]
        mov     di, 2800h
        mov     al, 0ffh
        mov     cx, 10h
        rep stosb
        mov     si, 10h
        mov     di, 0
        mov     cx, 10h
        rep movsb
        mov     di, 0
        mov     cx, 10h
tgt_28282:
        cmp     byte ptr es:[di], 20h
        je      br_2828B
        inc     di
        loop    tgt_28282
br_2828B:
        cmp     cx, 2
        jae     br_28293
        mov     di, 0eh
br_28293:
        mov     ax, word ptr [A2_W_CUR_SEQ]
        push    ax
        inc     al
        mov     byte ptr es:[12h], al
        mov     bl, 0ah
        div     bl
        or      ax, 3030h
        mov     word ptr es:[di], ax
        pop     ax
        ret
L_282A9:
        call    fn_280BD
        je      br_282AF
        retf
br_282AF:
        int     0d7h
        push    cs
        call    seq_names_fetch
        retf
L_282B6:
        call    fn_280BD
        je      br_282BC
        retf
br_282BC:
        call    fn_28792
        callf   [A3_FP_011D4]
        retf
fn_282C4:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [A3_FP_011D4], si
        int     0a4h
        KEY_DOWN        16h, (APP3_BASE+L_2831C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (APP3_BASE+L_2831C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        27h, (APP3_BASE+L_2831C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2832C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_283E2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        12h, (APP3_BASE+L_2824C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_282DF-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 110
        KEY_DOWN        26h, EP_L_28310_OFF, APP3_SEG
        ret
        else
        KEY_DOWN        26h, (APP3_BASE+L_27504-APP3_SEG*16), APP3_SEG
        db      0c3h
        endif
L_27504:
        mov     bl, 15h
        int     87h
        if      FW_VERSION <> 107
        int     86h
        call    fn_30425
        endif
        int     0d6h
        retf
L_2831C:
        mov     bl, 15h
        int     87h
        if      FW_VERSION <> 107
        int     86h
        call    fn_30425
        endif
        int     0d6h
        push    cs
        call    goto_main_screen
        retf
L_2832C:
        DISP_WIN_WIDE   "Tempo Change"
        DISP_HDOTS      15h, 13h, 0ceh
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "DELETE"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "NOW"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "INSERT"
        db      0e8h
        or      ax, word ptr [bx+si]
        call    fn_283BB
        call    fn_283E7
        call    word ptr [A3_W_011D8]
        retf
        DISP_TEXT       8ch, 0bh, "Initial \\:"
        DISP_TEXT       0d8h, 0bh, "."
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[16h]
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        push    dx
        DISP_NUM        0c7h, 0bh, 03h
        pop     ax
        DISP_NUM        0dch, 0bh, 01h
        ret
cb_283B2:
        DISP_CURSOR     0c7h, 0bh, 1ch
        ret
fn_283BB:
        DISP_TEXT       1ah, 0bh, "Tempo change:"
        mov     es, word ptr [A3_W_00F10]
        mov     al, byte ptr es:[13h]
        mov     cl, 68h
        mov     ch, 0bh
        call    fn_26D9C
        ret
cb_283DE:
        DISP_CURSOR     68h, 0bh, 13h
        ret
fn_283E7:
        mov     cl, 17h
        mov     ch, 16h
        mov     ax, word ptr [A3_W_011DC]
        call    fn_28444
        jb      br_283FB
        call    fn_28444
        jb      br_283FB
        call    fn_28444
br_283FB:
        ret
cb_283FC:
        call    fn_2852B
        DISP_CURSOR     17h, ch, 13h
        ret
cb_28408:
        call    fn_2852B
        DISP_CURSOR     2fh, ch, 13h
        ret
cb_28414:
        call    fn_2852B
        DISP_CURSOR     47h, ch, 0dh
        ret
cb_28420:
        call    fn_2852B
        DISP_CURSOR     59h, ch, 0dh
        ret
cb_2842C:
        call    fn_2852B
        db      0b1h, 78h, 8ah, 0edh, 0b0h
        sbb     al, 0cdh
        mov     al, 0c3h
cb_28438:
        call    fn_2852B
        DISP_CURSOR     0a8h, ch, 1ch
        ret
fn_28444:
        mov     es, word ptr [A3_W_00F10]
        cmp     ax, word ptr es:[14h]
        jne     br_28452
        jmp     br_284EC
br_28452:
        pusha
        push    ax
        mov     bx, 0eh
        mul     bx
        add     ax, 700h
        mov     si, ax
        pop     ax
        push    si
        inc     ax
        mov     bh, 3
        mov     bl, 0ah
        int     90h
        add     cl, 12h
        mov     dx, cs
        mov     si, str_28536-APP3_CSBASE
        mov     ah, 1ah
        mov     bl, 5
        int     90h
        add     cl, 6
        pop     si
        push    cx
        mov     ax, word ptr es:[si]
        push    ax
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        add     cl, 49h
        mov     bh, 3
        mov     bl, 8
        int     90h
        mov     ax, dx
        add     cl, 15h
        mov     bh, 1
        mov     bl, 8
        int     90h
        pop     ax
        call    fn_28509
        push    ax
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        add     cl, 1bh
        mov     bh, 3
        mov     bl, 8
        int     90h
        mov     ax, dx
        add     cl, 15h
        mov     bh, 1
        mov     bl, 8
        int     90h
        pop     ax
        sub     ax, 12ch
        mov     bx, 1eh
        mul     bx
        mov     bx, 0a8ch
        div     bx
        inc     al
        mov     cl, 0c3h
        mov     ah, 5
        mov     bl, 13h
        int     90h
        pop     cx
        push    es
        push    si
        push    cx
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        int     0beh
        pop     cx
        pop     si
        pop     es
        call    fn_280DD
        popa
        inc     ax
        add     ch, 8
        clc
        ret
br_284EC:
        mov     dx, cs
        mov     si, str_28550-APP3_CSBASE
        mov     ah, 3
        mov     bl, 5
        int     90h
        stc
        ret
        mov     ax, word ptr es:[A3_W_0001A]
        inc     ax
        add     cl, 18h
        mov     bh, 3
        mov     bl, 9
        int     90h
        stc
        ret
fn_28509:
        mul     word ptr es:[16h]
        mov     bx, 3e8h
        cmp     dx, bx
        jb      br_28518
        mov     dx, bx
        dec     dx
br_28518:
        div     bx
        cmp     ax, 12ch
        jae     br_28522
        mov     ax, 12ch
br_28522:
        cmp     ax, 0bb8h
        jb      br_2852A
        mov     ax, 0bb8h
br_2852A:
        ret
fn_2852B:
        mov     ch, byte ptr [A3_B_011DA]
        shl     ch, 3
        add     ch, 16h
        ret
str_28536:
        db      ":   .  .   %:   .  ", 5ch, "=   . "
str_28550:
        db      "END"
L_28553:
        call    fn_282C4
        mov     word ptr [A3_W_011D8], cb_283B2-APP3_CSBASE
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[16h]
        mov     bl, 0
        mov     bh, 0
        mov     dx, 0bb8h
        mov     di, intcb_28593-APP3_CSBASE
        int     7fh
        KEY_CURSOR      (APP3_BASE+L_285B6-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_285AF-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, 0000h, 0000h
        KEY_DOWN        14h, 0000h, 0000h
        retf
intcb_28593:
        cmp     ax, 0bb8h
        jb      L_27DCB
        mov     ax, 0bb8h
L_27DCB:
        cmp     ax, 12ch
        jae     br_285A3
        mov     ax, 12ch
br_285A3:
        mov     word ptr es:[di], ax
        mov     es, word ptr [A3_W_00F10]
        mov     word ptr es:[16h], ax
        retf
L_285AF:
        push    cs
        call    far_285F5
        int     0a3h
        retf
L_285B6:
        call    fn_282C4
        mov     word ptr [A3_W_011D8], cb_283DE-APP3_CSBASE
        FIELD_ENTRY     word ptr [0f10h], 13h, 0, 0, 1, field_cb_none-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, EP_L_28553_OFF, APP3_SEG, 0000h, 0000h, EP_L_2898A_OFF, APP3_SEG
        KEY_DOWN        11h, 0000h, 0000h
        KEY_DOWN        14h, 0000h, 0000h
        retf
far_285F5:
        call    fn_282C4
        mov     word ptr [A3_W_011D8], cb_283FC-APP3_CSBASE
        mov     ax, word ptr [A3_W_011DC]
        if      FW_VERSION >= 110
        KEY_WHEEL2      EP_L_2863E_OFF, APP3_SEG, EP_L_28649_OFF, APP3_SEG
        KEY_CURSOR      EP_L_285B6_OFF, APP3_SEG, EP_L_28698_OFF, APP3_SEG, EP_L_2863E_OFF, APP3_SEG, EP_L_28649_OFF, APP3_SEG
        retf
        push    es
        else
        KEY_WHEEL2      (APP3_BASE+L_2863E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_28649-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      EP_L_285B6_OFF, APP3_SEG, (APP3_BASE+L_28698-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2863E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_28649-APP3_SEG*16), APP3_SEG
        db      0cbh, 06h
        endif
        mov     es, word ptr [A3_W_00F10]
        mov     bx, word ptr es:[14h]
        pop     es
        cmp     ax, bx
        if      FW_VERSION >= 120
        db      72h, 02h, 8bh
        db      0c3h, 2bh, 06h
        else
        jb      L_28631
        mov     ax, bx
        endif
L_28631:
        if      FW_VERSION >= 120
        db      0dah
        adc     word ptr [bp+di+2], si
        else
        sub     ax, word ptr [A3_B_011DA]
        jae     L_27D67
        endif
        sub     ax, ax
L_27D67:
        mov     word ptr es:[di], ax
        mov     word ptr [A3_W_011DC], ax
        retf
L_2863E:
        call    fn_28651
        jae     L_28644
        retf
L_28644:
        push    cs
        call    far_285F5
        retf
L_28649:
        call    fn_2866F
        push    cs
        call    far_285F5
        retf
fn_28651:
        int     0a3h
        cmp     word ptr [A3_B_011DA], 0
        je      br_28660
        dec     word ptr [A3_B_011DA]
        clc
        ret
br_28660:
        cmp     word ptr [A3_W_011DC], 0
        stc
        jne     br_28669
        ret
br_28669:
        dec     word ptr [A3_W_011DC]
        clc
        ret
fn_2866F:
        int     0a3h
L_27EA1:
        call    fn_28788
        cmp     word ptr [A3_B_011DA], 2
        je      br_28687
        cmp     bx, word ptr [A3_B_011DA]
        ja      L_28682
        ret
L_28682:
        inc     word ptr [A3_B_011DA]
        ret
br_28687:
        mov     ax, word ptr [A3_B_011DA]
        add     ax, word ptr [A3_W_011DC]
        cmp     ax, bx
        jne     br_28693
        ret
br_28693:
        inc     word ptr [A3_W_011DC]
        ret
L_28698:
        call    fn_28788
        mov     ax, word ptr [A3_B_011DA]
        add     ax, word ptr [A3_W_011DC]
        cmp     ax, bx
        jne     br_286A7
        retf
br_286A7:
        push    cs
        call    far_286AC
        retf
far_286AC:
        call    fn_282C4
        mov     word ptr [A3_W_011D8], cb_28408-APP3_CSBASE
        call    fn_28792
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        int     0beh
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, intcb_286E1-APP3_CSBASE
        int     7fh
        KEY_CURSOR      (APP3_BASE+FAR_285F5-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_287C1-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2875F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2876A-APP3_SEG*16), APP3_SEG
        retf
intcb_286E1:
        call    fn_28792
        cmp     bx, 0
        jne     br_286EA
        retf
br_286EA:
        cmp     bx, word ptr es:[14h]
        jne     br_286F2
        retf
br_286F2:
        cmp     ax, word ptr es:[A3_W_0001A]
        jb      br_286FD
        mov     ax, word ptr es:[A3_W_0001A]
br_286FD:
        mov     di, ax
        shl     di, 2
        add     di, 1500h
        mov     ax, word ptr es:[di]
        mov     dl, byte ptr es:[di+2]
        sub     si, 0eh
        mov     bx, word ptr es:[si+2]
        mov     cx, word ptr es:[si+4]
        sub     bx, ax
        sbb     cl, dl
        jb      br_2872C
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        add     ax, 1
        adc     dx, 0
br_2872C:
        add     si, 1ch
        mov     dh, 0
        mov     bx, ax
        mov     cx, dx
        sub     bx, word ptr es:[si+2]
        sbb     cx, word ptr es:[si+4]
        jb      br_2874D
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        sub     ax, 1
        sbb     dx, 0
br_2874D:
        sub     si, 0eh
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
        int     0beh
        push    cs
        call    far_286AC
        retf
L_2875F:
        call    fn_28651
        jae     br_28765
        retf
br_28765:
        push    cs
        call    far_286AC
        retf
L_2876A:
        call    fn_2866F
        push    cs
        call    far_286AC
        call    fn_28775
        retf
fn_28775:
        call    fn_28788
        mov     ax, word ptr [A3_B_011DA]
        add     ax, word ptr [A3_W_011DC]
        cmp     ax, bx
        jne     br_28787
        push    cs
        call    far_285F5
br_28787:
        ret
fn_28788:
        mov     es, word ptr [A3_W_00F10]
        mov     bx, word ptr es:[14h]
        ret
fn_28792:
        push    ax
        push    cx
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr [A3_B_011DA]
        add     ax, word ptr [A3_W_011DC]
        cmp     ax, word ptr es:[14h]
        jbe     br_287AE
        sub     ax, ax
        mov     word ptr [A3_B_011DA], ax
        mov     word ptr [A3_W_011DC], ax
br_287AE:
        mov     bx, ax
        mov     dx, 0eh
        mul     dx
        add     ax, 700h
        mov     si, ax
        mov     word ptr [A3_W_011DE], si
        pop     cx
        pop     ax
        ret
far_287C1:
        call    fn_282C4
        mov     word ptr [A3_W_011D8], cb_28414-APP3_CSBASE
        call    fn_28792
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        int     0beh
        mov     dh, 0
        push    dx
        mov     byte ptr [A3_B_011E7], bl
        mov     di, ax
        shl     di, 2
        add     di, 1500h
        mov     ax, word ptr es:[di]
        mov     dl, byte ptr es:[di+2]
        mov     dh, 0
        mov     word ptr [A3_W_011E8], ax
        mov     word ptr [A3_W_011EA], dx
        pop     ax
        mov     bl, 1
        mov     bh, 0
        mov     dx, 10h
        mov     di, intcb_28817-APP3_CSBASE
        int     7fh
        if      FW_VERSION >= 110
        KEY_CURSOR      EP_FAR_286AC_OFF, EP_FAR_286AC_SEG, EP_ISR_288A2_OFF, APP3_SEG, (APP3_BASE+L_2888C-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_28897-APP3_SEG*16), APP3_SEG
        retf
intcb_28817:
        call    fn_28792
        cmp     bx, 0
        jne     br_28820
        retf
br_28820:
        cmp     bx, word ptr es:[14h]
        jne     br_28828
        retf
br_28828:
        mov     bl, byte ptr [A3_B_011E7]
        mul     bl
        sub     dx, dx
        add     ax, word ptr [A3_W_011E8]
        adc     dx, word ptr [A3_W_011EA]
        sub     si, 0eh
        mov     bx, word ptr es:[si+2]
        mov     cx, word ptr es:[si+4]
        sub     bx, ax
        sbb     cl, dl
        jb      br_28857
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        add     ax, 1
        adc     dx, 0
br_28857:
        add     si, 1ch
        mov     dh, 0
        mov     bx, ax
        mov     cx, dx
        sub     bx, word ptr es:[si+2]
        sbb     cx, word ptr es:[si+4]
        jb      br_28878
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        sub     ax, 1
        sbb     dx, 0
br_28878:
        sub     si, 0eh
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
        int     0beh
        mov     dh, 0
        push    cs
        call    far_287C1
        retf
L_2888C:
        call    fn_28651
        jae     br_28892
        retf
br_28892:
        push    cs
        call    far_287C1
        retf
L_28897:
        call    fn_2866F
        push    cs
        call    far_287C1
        call    fn_28775
        retf
isr_288A2:
        call    fn_282C4
        mov     word ptr [A3_W_011D8], cb_28420-APP3_CSBASE
        call    fn_28792
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        int     0beh
        mov     byte ptr [A3_B_011E7], bl
        mov     di, ax
        shl     di, 2
        add     di, 1500h
        mov     al, dl
        mul     bl
        sub     bx, bx
        add     ax, word ptr es:[di]
        adc     bl, byte ptr es:[di+2]
        mov     word ptr [A3_W_011E8], ax
        mov     word ptr [A3_W_011EA], bx
        mov     al, dh
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 63h
        mov     di, intcb_288FC-APP3_CSBASE
        int     7fh
        KEY_CURSOR      EP_FAR_287C1_OFF, APP3_SEG, EP_L_2898A_OFF, APP3_SEG, (APP3_BASE+L_28974-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2897F-APP3_SEG*16), APP3_SEG
        retf
intcb_288FC:
        mov     cx, es
        call    fn_28792
        cmp     bx, 0
        jne     br_28907
        retf
br_28907:
        cmp     bx, word ptr es:[14h]
        jne     L_2832F
        retf
L_2832F:
        cmp     al, byte ptr [A3_B_011E7]
        jb      br_2891A
        mov     al, byte ptr [A3_B_011E7]
        dec     al
br_2891A:
        sub     dx, dx
        add     ax, word ptr [A3_W_011E8]
        adc     dx, word ptr [A3_W_011EA]
        sub     si, 0eh
        mov     bx, word ptr es:[si+2]
        mov     cx, word ptr es:[si+4]
        sub     bx, ax
        sbb     cl, dl
        jb      br_28943
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        add     ax, 1
        adc     dx, 0
br_28943:
        add     si, 1ch
        mov     dh, 0
        mov     bx, ax
        mov     cx, dx
        sub     bx, word ptr es:[si+2]
        sbb     cx, word ptr es:[si+4]
        jb      br_28964
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        sub     ax, 1
        sbb     dx, 0
br_28964:
        sub     si, 0eh
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
        push    cs
        call    isr_288A2
        retf
L_28974:
        call    fn_28651
        jae     L_281AA
        retf
L_281AA:
        push    cs
        call    isr_288A2
        retf
L_2897F:
        call    fn_2866F
        push    cs
        call    isr_288A2
        call    fn_28775
        retf
L_2898A:
        call    fn_282C4
        mov     word ptr [A3_W_011D8], cb_2842C-APP3_CSBASE
        call    fn_28792
        mov     ax, word ptr es:[si]
        mov     bl, 0
        mov     bh, 0
        mov     dx, 270eh
        mov     di, intcb_289C8-APP3_CSBASE
        int     7fh
        KEY_CURSOR      EP_ISR_288A2_OFF, APP3_SEG, (APP3_BASE+L_28A12-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_289EE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_28A07-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_283E2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_282DF-APP3_SEG*16), APP3_SEG
        db      0cbh
intcb_289C8:
        if      FW_VERSION >= 114
        db      0e8h, 0c7h
        db      0fdh, 26h, 3bh, 1eh, 14h, 00h, 75h, 01h, 0cbh, 3dh, 64h, 00h
        jae     L_289DB
        db      0b8h, 64h
        db      00h
        else
        db      0e8h
        db      0c7h
        std
        cmp     bx, word ptr es:[14h]
        jne     L_28203
        retf
L_28203:
        cmp     ax, 64h
        jae     L_2820B
        mov     ax, 64h
L_2820B:
        endif
L_289DB:
        cmp     ax, 270fh
        jb      L_289E3
        mov     ax, 270fh
L_289E3:
        call    fn_28792
        mov     word ptr es:[si], ax
        push    cs
L_289EE                         equ     $+4
        call    L_2898A
        db      0cbh, 0a1h, 0dch, 11h, 03h, 06h, 0dah, 11h, 74h, 0bh
        call    fn_28651
        if      FW_VERSION >= 111
L_28A07                         equ     $+0dh
        else
L_28A07                         equ     $+13
        endif
        db      73h, 01h, 0cbh, 0eh
        call    L_2898A
        db      0cbh, 0eh
        call    L_285B6
        db      0cbh
        call    fn_2866F
        db      0eh
        call    L_2898A
        call    fn_28775
        retf
L_28A12:
        call    fn_282C4
        mov     word ptr [A3_W_011D8], cb_28438-APP3_CSBASE
        call    fn_28792
        mov     ax, word ptr es:[si]
        call    fn_28509
        mov     bl, 0
        mov     bh, 0
        mov     dx, 0bb8h
        mov     di, intcb_28A53-APP3_CSBASE
        int     7fh
        if      FW_VERSION >= 114
        KEY_CURSOR      EP_L_2898A_OFF, APP3_SEG, EP_L_28553_OFF, APP3_SEG, (APP3_BASE+FAR_28A99-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_28AA4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_283E2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_282DF-APP3_SEG*16), APP3_SEG
        db      0cbh
intcb_28A53:
        db      8ch, 0c1h
        call    fn_28792
        db      26h, 3bh
        db      1eh, 14h, 00h, 75h, 01h, 0cbh, 3dh, 2ch, 01h, 73h, 03h, 0b8h, 2ch, 01h, 06h, 8eh
        db      0c1h, 26h, 89h, 05h, 07h, 50h, 0bah, 0e8h, 03h, 0f7h, 0e2h, 26h, 8bh, 1eh, 16h, 00h
        db      3bh, 0d3h, 72h, 03h, 8bh, 0d3h, 4ah, 0f7h, 0f3h, 26h, 89h, 04h, 51h
        call    fn_28509
        db      59h, 5bh, 3bh, 0c3h, 75h, 01h, 0cbh, 26h, 0ffh, 04h, 0eh
        call    L_28A12
        db      0cbh
far_28A99:
        call    fn_28651
        db      73h, 01h, 0cbh, 0eh
        call    L_28A12
        db      0cbh
far_28AA4:
        call    fn_2866F
        db      0eh
        call    L_28A12
        call    fn_28775
        db      0cbh
L_282DF:
        db      0cdh, 0a3h, 0a1h, 0dah, 11h, 03h, 06h, 0dch, 11h
        jne     L_28ABD
        call    L_27EA1
L_28ABD:
        call    fn_28792
        db      26h, 81h, 3eh, 14h, 00h, 0ffh, 00h, 75h, 01h, 0cbh
        db      26h, 8bh, 44h, 0f4h, 26h, 8bh, 54h, 0f6h, 05h, 01h, 00h, 83h, 0d2h, 00h, 26h, 2bh
        db      06h, 1ch, 00h, 26h, 1bh, 16h, 1eh, 00h, 0bh, 0c2h, 75h, 01h, 0cbh, 26h, 8bh, 44h
        db      0f4h, 26h, 8bh, 54h, 0f6h, 05h, 01h, 00h, 83h, 0d2h, 00h, 26h, 2bh, 44h, 02h, 26h
        db      1bh, 54h, 04h, 0bh, 0c2h, 75h, 01h, 0cbh, 26h, 0ffh, 06h, 14h, 00h, 0bfh, 0ffh, 14h
        db      8bh, 0cfh, 2bh, 0ceh, 83h, 0e9h, 05h, 0beh, 0f1h, 14h, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0fah
        db      0fdh, 0f3h, 0a4h, 0fch, 0fbh, 1fh
        call    fn_28792
        db      26h, 8bh, 44h, 02h, 26h, 0bh, 44h
        db      04h, 75h, 01h, 0cbh, 26h, 83h, 6ch, 02h, 01h, 26h, 83h, 6ch, 04h, 00h, 0cbh
L_2824C:
        db      0c7h
        db      06h, 0dah, 11h, 00h, 00h, 0c7h, 06h, 0dch, 11h, 00h, 00h, 0cdh, 85h, 8bh, 0d8h, 0bh
        db      0dah, 75h, 01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 81h, 3eh, 14h, 00h, 0ffh, 00h, 75h
        db      01h, 0cbh, 0ffh, 0eh, 0dch, 11h, 0beh, 0f2h, 06h, 83h, 0c6h, 0eh, 0ffh, 06h, 0dch, 11h
        db      8bh, 0d8h, 8bh, 0cah, 26h, 2bh, 5ch, 02h, 26h, 1bh, 4ch, 04h, 72h, 07h, 0bh, 0d9h
        db      075h, 001h, 0cbh, 0ebh, 0e4h, "PRV&", 0ffh, 006h, 014h, 000h, 0bfh, 0f1h, 014h
        db      8bh, 0cfh, 2bh, 0ceh, 83h, 0e9h, 05h, 0beh, 0e3h, 14h, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0fah
        db      0fdh, 0f3h, 0a4h, 0fch, 0fbh, 1fh, 5eh, 5ah, 58h, 26h, 89h, 44h, 02h, 26h, 89h, 54h
        db      04h, 0b8h
        call    L_2B1B2
        db      89h, 04h, 0cbh
L_283E2:
        db      0a1h, 0dch, 11h, 03h, 06h, 0dah, 11h, 75h
        db      01h, 0cbh, 50h, 0eh
        call    far_285F5
        call    fn_28792
        db      58h, 26h, 3bh, 06h, 14h, 00h
        db      75h, 01h, 0cbh, 26h, 0ffh, 0eh, 14h, 00h, 8bh, 0feh, 83h, 0c6h, 0eh, 0b9h, 0f2h, 14h
        db      2bh, 0cfh, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0f3h, 0a4h, 1fh, 0cbh
        else
        KEY_CURSOR      EP_L_2898A_OFF, APP3_SEG, EP_L_28553_OFF, APP3_SEG, (APP3_BASE+L_282C9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_282D4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_283E2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_282DF-APP3_SEG*16), APP3_SEG
        db      0cbh
intcb_28A53:
        db      8ch
        shr     ax, 3ah
        std
        cmp     bx, word ptr es:[14h]
        jne     L_28290
        retf
L_28290:
        cmp     ax, 12ch
        jae     L_28298
        mov     ax, 12ch
L_28298:
        push    es
        mov     es, cx
        mov     word ptr es:[di], ax
        pop     es
        push    ax
        mov     dx, 3e8h
        mul     dx
        mov     bx, word ptr es:[16h]
        cmp     dx, bx
        jb      L_282B1
        mov     dx, bx
        dec     dx
L_282B1:
        div     bx
        mov     word ptr es:[si], ax
        push    cx
        call    fn_28509
        pop     cx
        pop     bx
        cmp     ax, bx
        jne     L_282C1
        retf
L_282C1:
        inc     word ptr es:[si]
        push    cs
        call    L_28A12
        retf
L_282C9:
        call    fn_28651
        jae     L_282CF
        retf
L_282CF:
        push    cs
        call    L_28A12
        retf
L_282D4:
        call    fn_2866F
        push    cs
        call    L_28A12
        call    fn_28775
        retf
L_282DF:
        int     0a3h
        mov     ax, word ptr [A3_B_011DA]
        add     ax, word ptr [A3_W_011DC]
        jne     L_282ED
        call    L_27EA1
L_282ED:
        call    fn_28792
        cmp     word ptr es:[14h], 0ffh
        jne     L_282FA
        retf
L_282FA:
        mov     ax, word ptr es:[si-0ch]
        mov     dx, word ptr es:[si-0ah]
        add     ax, 1
        adc     dx, 0
        sub     ax, word ptr es:[1ch]
        sbb     dx, word ptr es:[1eh]
        or      ax, dx
        jne     L_28317
        retf
L_28317:
        mov     ax, word ptr es:[si-0ch]
        mov     dx, word ptr es:[si-0ah]
        add     ax, 1
        adc     dx, 0
        sub     ax, word ptr es:[si+2]
        sbb     dx, word ptr es:[si+4]
        or      ax, dx
        jne     L_28332
        retf
L_28332:
        inc     word ptr es:[14h]
        mov     di, 14ffh
        mov     cx, di
        sub     cx, si
        sub     cx, 5
        mov     si, 14f1h
        push    ds
        mov     ax, es
        mov     ds, ax
        cli
        std
        rep movsb
        cld
        sti
        pop     ds
        call    fn_28792
        mov     ax, word ptr es:[si+2]
        or      ax, word ptr es:[si+4]
        jne     L_2835E
        retf
L_2835E:
        sub     word ptr es:[si+2], 1
        sub     word ptr es:[si+4], 0
        retf
L_2824C:
        mov     word ptr [A3_B_011DA], 0
        mov     word ptr [A3_W_011DC], 0
        int     85h
        mov     bx, ax
        or      bx, dx
        jne     L_2837E
        retf
L_2837E:
        mov     es, word ptr [A3_W_00F10]
        cmp     word ptr es:[14h], 0ffh
        jne     L_2838C
        retf
L_2838C:
        dec     word ptr [A3_W_011DC]
        mov     si, 6f2h
L_28393:
        add     si, 0eh
        inc     word ptr [A3_W_011DC]
        mov     bx, ax
        mov     cx, dx
        sub     bx, word ptr es:[si+2]
        sbb     cx, word ptr es:[si+4]
        jb      L_283AF
        or      bx, cx
        jne     L_283AD
        retf
L_283AD:
        jmp     L_28393
L_283AF:
        push    ax
        push    dx
        push    si
        inc     word ptr es:[14h]
        mov     di, 14f1h
        mov     cx, di
        sub     cx, si
        sub     cx, 5
        mov     si, 14e3h
        push    ds
        mov     ax, es
        mov     ds, ax
        cli
        std
        rep movsb
        cld
        sti
        pop     ds
        pop     si
        pop     dx
        pop     ax
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
        mov     ax, 3e8h
        mov     word ptr es:[si], ax
        retf
L_283E2:
        mov     ax, word ptr [A3_W_011DC]
        add     ax, word ptr [A3_B_011DA]
        jne     L_283EC
        retf
L_283EC:
        push    ax
        push    cs
        call    far_285F5
        call    fn_28792
        pop     ax
        cmp     ax, word ptr es:[14h]
        jne     L_283FD
        retf
L_283FD:
        dec     word ptr es:[14h]
        mov     di, si
        add     si, 0eh
        mov     cx, 14f2h
        sub     cx, di
        push    ds
        mov     ax, es
        mov     ds, ax
        rep movsb
        pop     ds
        retf
        endif
far_28BE5:
        if      FW_VERSION >= 114
        call    fn_280BD
        db      74h, 01h
        db      0cbh, 80h, 0fch, 00h, 74h, 01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 1ah, 00h, 0a3h
        db      0f2h, 11h, 48h, 3bh, 06h, 0eeh, 11h, 73h, 03h, 0a3h, 0eeh, 11h, 3bh, 06h, 0f0h, 11h
        db      73h, 03h, 0a3h, 0f0h, 11h, 0cdh, 0a4h, 0eh
        call    L_2854B
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+FAR_28DD7-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_28466-APP3_SEG*16), APP3_SEG
        else
        call    fn_280BD
        je      L_2841B
        retf
L_2841B:
        cmp     ah, 0
        je      L_28421
        retf
L_28421:
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[A3_W_0001A]
        mov     word ptr [A3_W_011F2], ax
        dec     ax
        cmp     ax, word ptr [A3_W_011EE]
        jae     L_28436
        mov     word ptr [A3_W_011EE], ax
L_28436:
        cmp     ax, word ptr [A3_W_011F0]
        jae     L_2843F
        mov     word ptr [A3_W_011F0], ax
L_2843F:
        int     0a4h
        push    cs
        call    L_2854B
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+L_28607-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_L_28466_OFF, APP3_SEG
        endif
        else
        KEY_CURSOR      EP_FAR_286AC_OFF, EP_FAR_286AC_SEG, EP_ISR_288A2_OFF, APP3_SEG, (APP3_BASE+L_27A76-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27A81-APP3_SEG*16), APP3_SEG
        db      0cbh
intcb_28817:
        db      0e8h, 78h, 0ffh, 83h, 0fbh, 00h, 75h, 01h, 0cbh, 26h, 3bh, 1eh, 14h, 00h, 75h
        db      01h, 0cbh, 8ah, 1eh, 0e7h, 11h, 0f6h, 0e3h, 2bh, 0d2h, 03h, 06h, 0e8h, 11h, 13h, 16h
        db      0eah, 11h, 83h, 0eeh, 0eh, 26h, 8bh, 5ch, 02h, 26h, 8bh, 4ch, 04h, 2bh, 0d8h, 1ah
        db      0cah, 72h, 0eh, 26h, 8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 05h, 01h, 00h, 83h, 0d2h
        db      00h, 83h, 0c6h, 1ch, 0b6h, 00h, 8bh, 0d8h, 8bh, 0cah, 26h, 2bh, 5ch, 02h, 26h, 1bh
        db      4ch, 04h, 72h, 0eh, 26h, 8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 2dh, 01h, 00h, 83h
        db      0dah, 00h, 83h, 0eeh, 0eh, 26h, 89h, 44h, 02h, 26h, 89h, 54h, 04h, 0cdh, 0beh, 0b6h
        db      00h, 0eh, 0e8h, 36h, 0ffh, 0cbh
L_27A76:
        db      0e8h, 0c2h, 0fdh, 73h, 01h, 0cbh, 0eh, 0e8h, 2bh, 0ffh
        db      0cbh
L_27A81:
        db      0e8h, 0d5h, 0fdh, 0eh, 0e8h, 23h, 0ffh, 0e8h, 0d4h, 0feh, 0cbh
ISR_288A2:
        db      0e8h, 29h, 0fah
        mov     word ptr [A3_W_011D8], cb_28420-APP3_CSBASE
        db      0e8h, 0e4h, 0feh, 26h, 8bh, 44h, 02h, 26h, 8bh, 54h, 04h
        db      0cdh, 0beh, 88h, 1eh, 0e7h, 11h, 8bh, 0f8h, 0c1h, 0e7h, 02h, 81h, 0c7h, 00h, 15h, 8ah
        db      0c2h, 0f6h, 0e3h, 2bh, 0dbh, 26h, 03h, 05h, 26h, 12h, 5dh, 02h, 0a3h, 0e8h, 11h, 89h
        db      1eh, 0eah, 11h, 8ah, 0c6h, 0b4h, 00h, 0b3h, 00h, 0b7h, 00h, 0bah, 63h, 00h, 0bfh, 26h
        db      21h, 0cdh, 7fh
        KEY_CURSOR      (APP3_BASE+far_287C1-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2898A-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27B5E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27B69-APP3_SEG*16), APP3_SEG
        db      0cbh, 8ch, 0c1h, 0e8h, 91h, 0feh, 83h, 0fbh, 00h, 75h, 01h
        db      0cbh, 26h, 3bh, 1eh, 14h, 00h, 75h, 01h, 0cbh, 3ah, 06h, 0e7h, 11h, 72h, 05h, 0a0h
        db      0e7h, 11h, 0feh, 0c8h, 2bh, 0d2h, 03h, 06h, 0e8h, 11h, 13h, 16h, 0eah, 11h, 83h, 0eeh
        db      0eh, 26h, 8bh, 5ch, 02h, 26h, 8bh, 4ch, 04h, 2bh, 0d8h, 1ah, 0cah, 72h, 0eh, 26h
        db      8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 05h, 01h, 00h, 83h, 0d2h, 00h, 83h, 0c6h, 1ch
        db      0b6h, 00h, 8bh, 0d8h, 8bh, 0cah, 26h, 2bh, 5ch, 02h, 26h, 1bh, 4ch, 04h, 72h, 0eh
        db      26h, 8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 2dh, 01h, 00h, 83h, 0dah, 00h, 83h, 0eeh
        db      0eh, 26h, 89h, 44h, 02h, 26h, 89h, 54h, 04h, 0eh, 0e8h, 2fh, 0ffh, 0cbh
L_27B5E:
        db      0e8h, 0dah
        db      0fch, 73h, 01h, 0cbh, 0eh, 0e8h, 24h, 0ffh, 0cbh
L_27B69:
        db      0e8h, 0edh, 0fch, 0eh, 0e8h, 1ch, 0ffh
        db      0e8h, 0ech, 0fdh, 0cbh
L_2898A:
        db      0e8h, 41h, 0f9h
        mov     word ptr [A3_W_011D8], cb_2842C-APP3_CSBASE
        db      0e8h, 0fch, 0fdh
        db      26h, 8bh, 04h, 0b3h, 00h, 0b7h, 00h, 0bah, 0eh, 27h, 0bfh, 0f2h, 21h, 0cdh, 7fh
        KEY_CURSOR      EP_ISR_288A2_OFF, APP3_SEG, (APP3_BASE+L_27BFC-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27BD8-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27BF1-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_283E2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_282DF-APP3_SEG*16), APP3_SEG
        db      0cbh, 0e8h, 0c7h, 0fdh, 26h, 3bh, 1eh, 14h, 00h, 75h, 01h, 0cbh, 3dh, 64h, 00h
        db      73h, 03h, 0b8h, 64h, 00h, 3dh, 0fh, 27h, 72h, 03h, 0b8h, 0fh, 27h, 0e8h, 0ach, 0fdh
        db      26h, 89h, 04h, 0eh, 0e8h, 9dh, 0ffh, 0cbh
L_27BD8:
        db      0a1h, 0dch, 11h, 03h, 06h, 0dah, 11h, 74h
        db      0bh, 0e8h, 57h, 0fch, 73h, 01h, 0cbh, 0eh, 0e8h, 89h, 0ffh, 0cbh, 0eh, 0e8h, 0b0h, 0fbh
        db      0cbh
L_27BF1:
        db      0e8h, 65h, 0fch, 0eh, 0e8h, 7ch, 0ffh, 0e8h, 64h, 0fdh, 0cbh
L_27BFC:
        db      0e8h, 0b9h, 0f8h
        mov     word ptr [A3_W_011D8], cb_28438-APP3_CSBASE
        db      0e8h, 74h, 0fdh, 26h, 8bh, 04h, 0e8h, 0e5h, 0fah, 0b3h, 00h
        db      0b7h, 00h, 0bah, 0b8h, 0bh, 0bfh, 7dh, 22h, 0cdh, 7fh
        KEY_CURSOR      EP_L_2898A_OFF, APP3_SEG, EP_L_28553_OFF, APP3_SEG, (APP3_BASE+L_27C83-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_27C8E-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_283E2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_282DF-APP3_SEG*16), APP3_SEG
        db      0cbh, 8ch, 0c1h, 0e8h
        db      3ah, 0fdh, 26h, 3bh, 1eh, 14h, 00h, 75h, 01h, 0cbh, 3dh, 2ch, 01h, 73h, 03h, 0b8h
        db      2ch, 01h, 06h, 8eh, 0c1h, 26h, 89h, 05h, 07h, 50h, 0bah, 0e8h, 03h, 0f7h, 0e2h, 26h
        db      8bh, 1eh, 16h, 00h, 3bh, 0d3h, 72h, 03h, 8bh, 0d3h, 4ah, 0f7h, 0f3h, 26h, 89h, 04h
        db      51h, 0e8h, 7fh, 0fah, 59h, 5bh, 3bh, 0c3h, 75h, 01h, 0cbh, 26h, 0ffh, 04h, 0eh, 0e8h
        db      7ah, 0ffh, 0cbh
L_27C83:
        db      0e8h, 0b5h, 0fbh, 73h, 01h, 0cbh, 0eh, 0e8h, 6fh, 0ffh, 0cbh
L_27C8E:
        db      0e8h, 0c8h
        db      0fbh, 0eh, 0e8h, 67h, 0ffh, 0e8h, 0c7h, 0fch, 0cbh
L_282DF:
        db      0cdh, 0a3h, 0a1h, 0dah, 11h, 03h, 06h
        db      0dch, 11h, 75h, 03h, 0e8h, 0b4h, 0fbh, 0e8h, 0d2h, 0fch, 26h, 81h, 3eh, 14h, 00h, 0ffh
        db      00h, 75h, 01h, 0cbh, 26h, 8bh, 44h, 0f4h, 26h, 8bh, 54h, 0f6h, 05h, 01h, 00h, 83h
        db      0d2h, 00h, 26h, 2bh, 06h, 1ch, 00h, 26h, 1bh, 16h, 1eh, 00h, 0bh, 0c2h, 75h, 01h
        db      0cbh, 26h, 8bh, 44h, 0f4h, 26h, 8bh, 54h, 0f6h, 05h, 01h, 00h, 83h, 0d2h, 00h, 26h
        db      2bh, 44h, 02h, 26h, 1bh, 54h, 04h, 0bh, 0c2h, 75h, 01h, 0cbh, 26h, 0ffh, 06h, 14h
        db      00h, 0bfh, 0ffh, 14h, 8bh, 0cfh, 2bh, 0ceh, 83h, 0e9h, 05h, 0beh, 0f1h, 14h, 1eh, 8ch
        db      0c0h, 8eh, 0d8h, 0fah, 0fdh, 0f3h, 0a4h, 0fch, 0fbh, 1fh, 0e8h, 6fh, 0fch, 26h, 8bh, 44h
        db      02h, 26h, 0bh, 44h, 04h, 75h, 01h, 0cbh, 26h, 83h, 6ch, 02h, 01h, 26h, 83h, 6ch
        db      04h, 00h, 0cbh
L_2824C:
        db      0c7h, 06h, 0dah, 11h, 00h, 00h, 0c7h, 06h, 0dch, 11h, 00h, 00h, 0cdh
        db      85h, 8bh, 0d8h, 0bh, 0dah, 75h, 01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 81h, 3eh, 14h
        db      00h, 0ffh, 00h, 75h, 01h, 0cbh, 0ffh, 0eh, 0dch, 11h, 0beh, 0f2h, 06h, 83h, 0c6h, 0eh
        inc     word ptr [A3_W_011DC]
        mov     bx, ax
        mov     cx, dx
        sub     bx, word ptr es:[si+2]
        sbb     cx, word ptr es:[si+4]
        db      072h, 007h, 00bh, 0d9h, 075h, 001h, 0cbh, 0ebh, 0e4h, "PRV&", 0ffh, 006h, 014h
        db      00h, 0bfh, 0f1h, 14h, 8bh, 0cfh, 2bh, 0ceh, 83h, 0e9h, 05h, 0beh, 0e3h, 14h, 1eh, 8ch
        db      0c0h, 8eh, 0d8h, 0fah, 0fdh, 0f3h, 0a4h, 0fch, 0fbh, 1fh, 5eh, 5ah, 58h, 26h, 89h, 44h
        db      02h, 26h, 89h, 54h, 04h, 0b8h, 0e8h, 03h, 26h, 89h, 04h, 0cbh
L_283E2:
        db      0a1h, 0dch, 11h, 03h
        db      06h, 0dah, 11h, 75h, 01h, 0cbh, 50h, 0eh, 0e8h, 34h, 0fah, 0e8h, 0ceh, 0fbh, 58h, 26h
        db      3bh, 06h, 14h, 00h, 75h, 01h, 0cbh, 26h, 0ffh, 0eh, 14h, 00h, 8bh, 0feh, 83h, 0c6h
        db      0eh, 0b9h, 0f2h, 14h, 2bh, 0cfh, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0f3h, 0a4h, 1fh, 0cbh
FAR_28BE5:
        db      0e8h
        db      0dfh, 0f4h, 74h, 01h, 0cbh, 80h, 0fch, 00h, 74h, 01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h
        db      0a1h, 1ah, 00h, 0a3h, 0f2h, 11h, 48h, 3bh, 06h, 0eeh, 11h, 73h, 03h, 0a3h, 0eeh, 11h
        db      3bh, 06h, 0f0h, 11h, 73h, 03h, 0a3h, 0f0h, 11h, 0cdh, 0a4h, 0eh, 0e8h, 06h, 01h
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+L_28607-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_28466-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_28466:
        DISP_WIN        29h, 06h, 0cdh, 36h, "Change Tsig"
        DISP_TEXT       33h, 10h, "Bar:    -      > New Tsig:  /  "
        DISP_HDOTS      2fh, 1ah, 0c1h
        DISP_TEXT       3ch, 1eh, "Pressing DO IT will truncate"
        DISP_TEXT       3ch, 27h, "or add space in each bar."
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        db      8bh, 1eh, 0ech, 11h, 0d1h, 0e3h, 8bh, 87h, 08h, 12h, 50h
        DISP_NUM        0cfh, 10h, 02h
        pop     ax
        mov     al, ah
        DISP_NUM        0e1h, 10h, 02h
        db      0a1h, 0eeh, 11h
        db      40h
        DISP_NUM        4bh, 10h, 03h
        db      0a1h, 0f0h, 11h, 40h
        DISP_NUM        6fh, 10h, 03h
        db      0ffh
        push    ss
        push    es
        adc     cl, bl
        mov     cl, 0cfh
        mov     ch, 10h
        mov     al, 1fh
        int     0b0h
        ret
        DISP_CURSOR     6fh, 10h, 13h
        ret
        mov     cl, 4bh
        mov     ch, 10h
        mov     al, 13h
        int     0b0h
        ret
L_2854B:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 111
        mov     word ptr [A3_W_01206], 2550h
        else
        mov     word ptr [A3_W_01206], 2543h
        endif
        FIELD_WHEEL     ds, 11ech, 0, 0, 50h, field_cb_none-APP3_CSBASE
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 114
        KEY_CURSOR      (APP3_BASE+FAR_28D92-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        db      0cbh
L_28D4D:
        db      0c7h, 06h, 06h, 12h, 62h, 25h, 0a1h, 0eeh, 11h, 0b3h, 01h, 0b7h, 00h
        db      0bah, 0e7h, 03h, 0bfh, 0c5h, 25h, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+FAR_28D92-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h
        db      0cbh, 8eh, 06h, 10h, 0fh, 26h
        db      3bh, 06h, 1ah, 00h, 72h, 05h, 26h, 0a1h, 1ah, 00h, 48h, 3bh, 06h, 0f0h, 11h, 76h
far_28D92                       equ     $+8
        db      03h, 0a3h, 0f0h, 11h, 0a3h, 0eeh, 11h, 0cbh, 0c7h, 06h, 06h, 12h, 59h, 25h, 0a1h, 0f0h
        db      11h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 0ah, 26h, 0cdh, 7fh
        KEY_CURSOR      (APP3_BASE+L_28D4D-APP3_SEG*16), APP3_SEG, EP_FAR_28D1B_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h
        db      0cbh
        else
        KEY_CURSOR      (APP3_BASE+L_285C2-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        retf
L_2857D:
        if      FW_VERSION >= 111
        db      0c7h, 06h, 06h, 12h, 62h, 25h, 0a1h, 0eeh, 11h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h
        db      0bfh, 0c5h, 25h, 0cdh, 7fh
        else
        db      0c7h, 06h, 06h, 12h, 55h, 25h, 0a1h, 0eeh, 11h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h
        db      0bfh, 0b8h, 25h, 0cdh, 7fh
        endif
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_285C2-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h
        retf
        endif
        db      8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 05h, 26h, 0a1h, 1ah, 00h, 48h
        if      FW_VERSION >= 114
far_28DD7                       equ     $+0dh
        db      3bh, 06h, 0eeh, 11h, 73h, 03h, 0a3h, 0eeh, 11h, 0a3h, 0f0h, 11h, 0cbh, 0cdh, 0b4h, 8bh
        db      1eh, 0ech, 11h, 0d1h, 0e3h, 8bh, 8fh, 08h, 12h, 0b8h, 80h, 01h, 0f6h, 0f5h, 0b4h, 00h
        db      0a3h, 0fch, 11h, 0f6h, 0e1h, 0a3h, 0fah, 11h, 0ffh, 36h, 0eeh, 11h
        call    L_28E4B
        db      8eh
        db      06h, 10h, 0fh, 26h, 8bh, 36h, 1ah, 00h, 0c1h, 0e6h, 02h, 81h, 0c6h, 00h, 15h, 26h
        db      8ah, 44h, 0ffh, 26h, 88h, 44h, 03h, 8eh, 06h, 10h, 0fh, 26h, 8bh, 0eh, 14h, 00h
        db      0b8h, 0eh, 00h, 0f7h, 0e1h, 05h, 00h, 07h, 8bh, 0f0h, 26h, 0a1h, 1ch, 00h, 26h, 8bh
        db      16h, 1eh, 00h, 26h, 89h, 44h, 02h, 26h, 89h, 54h, 04h, 0b3h, 15h, 0cdh, 87h, 0cdh
        db      0d6h, 58h, 0bah, 00h, 00h, 0b9h, 00h, 00h, 0b3h, 0bh, 0cdh, 87h, 0eh
        call    goto_main_screen
        db      0cbh
L_28E4B:
        call    L_28E62
        db      0a1h, 0eeh, 11h, 8bh, 1eh, 0f0h, 11h, 3bh, 06h, 0f0h, 11h, 75h
        db      01h, 0c3h, 0ffh, 06h, 0eeh, 11h, 0ebh, 0e9h
L_28E62:
        db      0a1h, 0eeh, 11h, 50h
        call    fn_30425
        db      58h
        db      0c1h, 0e0h, 02h, 0beh, 00h, 15h, 03h, 0f0h, 8eh, 06h, 10h, 0fh, 26h, 8bh, 2eh, 1ch
        db      00h, 26h, 8ah, 3eh, 1eh, 00h, 26h, 8bh, 44h, 04h, 26h, 2bh, 04h, 2bh, 06h, 0fah
        db      11h
        jae     L_28E90
        jmp     NEAR L_28FB6
L_28E90:
        db      0a3h, 0f8h, 11h, 8ah, 1eh, 0fch, 11h, 26h, 88h, 5ch
        db      03h, 26h, 8bh, 04h, 26h, 8ah, 5ch, 02h, 03h, 06h, 0fah, 11h, 80h, 0d3h, 00h, 50h
        db      53h, 26h, 8bh, 44h, 04h, 26h, 8ah, 5ch, 06h, 0a3h, 0feh, 11h, 89h, 1eh, 00h, 12h
        db      83h, 0c6h, 04h, 26h, 8bh, 04h, 26h, 8ah, 5ch, 02h, 8bh, 0c8h, 8ah, 0d3h, 2bh, 06h
        db      0f8h, 11h, 80h, 0dbh, 00h, 26h, 89h, 04h, 26h, 88h, 5ch, 02h, 3bh, 0cdh, 75h, 0e0h
        db      3ah, 0d7h, 75h, 0dch, 26h, 0a3h, 1ch, 00h, 0b7h, 00h, 26h, 89h, 1eh, 1eh, 00h, 5ah
        db      58h, 0b6h, 00h, 0b3h, 0ah, 0cdh, 87h, 0cdh, 83h, 26h, 80h, 7ch, 04h, 0ffh, 74h, 41h
        db      26h, 8bh, 04h, 26h, 8ah, 54h, 02h, 80h, 0e2h, 0fh, 2bh, 06h, 0feh, 11h, 1ah, 16h
        db      00h, 12h, 73h, 04h, 0cdh, 81h, 0ebh, 0e1h
L_28F12:
        db      26h, 80h, 7ch, 04h, 0ffh, 74h, 22h, 26h
        db      8bh, 04h, 26h, 8bh, 5ch, 02h, 8ah, 0fbh, 81h, 0e3h, 0fh, 0f0h, 2bh, 06h, 0f8h, 11h
        db      80h, 0dbh, 00h, 0ah, 0dfh, 26h, 89h, 04h, 26h, 88h, 5ch, 02h
        call    fn_281FE
        jmp     SHORT L_28F12
        db      0cdh, 85h, 8eh, 06h, 10h, 0fh, 0beh, 00h, 07h, 26h, 8bh, 0eh, 14h, 00h, 83h
        db      0f9h, 01h, 75h, 01h, 0c3h, 8bh, 0d8h, 8bh, 0fah, 26h, 2bh, 5ch, 02h, 26h, 1bh, 7ch
        db      04h, 72h, 0ah, 0bh, 0dfh, 74h, 06h, 83h, 0c6h, 0eh, 0e2h, 0e9h, 0c3h, 26h, 8bh, 44h
        db      02h, 26h, 8bh, 54h, 04h, 2bh, 06h, 0feh, 11h, 1ah, 16h, 00h, 12h, 73h, 20h, 06h
        db      56h, 51h, 26h, 0ffh, 0eh, 14h, 00h, 8bh, 0feh, 83h, 0c6h, 0eh, 0b9h, 0f2h, 14h, 2bh
        db      0cfh, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0f3h, 0a4h, 1fh, 59h, 5eh, 07h, 0e2h, 0cfh, 0c3h, 26h
        db      8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 2bh, 06h, 0f8h, 11h, 80h, 0dah, 00h, 26h, 89h
        db      44h, 02h, 26h, 89h, 54h, 04h, 83h, 0c6h, 0eh, 0e2h, 0e4h, 0c3h
L_28FB6:
        db      0f7h, 0d8h, 0a3h, 0f8h
        db      11h, 60h, 06h, 0a1h, 0eeh, 11h, 40h
        call    fn_30425
        db      0cdh, 83h
L_28FC6:
        db      26h, 80h, 7ch, 04h
        db      0ffh
        je      L_28FEF
        db      26h, 8bh, 04h, 26h, 8bh, 5ch, 02h, 8ah, 0fbh, 81h, 0e3h, 0fh, 0f0h
        db      03h, 06h, 0f8h, 11h, 80h, 0d3h, 00h, 0ah, 0dfh, 26h, 89h, 04h, 26h, 88h, 5ch, 02h
        call    fn_281FE
        jmp     SHORT L_28FC6
L_28FEF:
        db      07h, 61h, 0a0h, 0fch, 11h, 26h, 88h, 44h, 03h, 83h, 0c6h
        db      04h, 26h, 8bh, 04h, 26h, 8ah, 5ch, 02h, 8bh, 0c8h, 8ah, 0d3h, 03h, 06h, 0f8h, 11h
        db      80h, 0d3h, 00h, 26h, 89h, 04h, 26h, 88h, 5ch, 02h, 3bh, 0cdh, 75h, 0e0h, 3ah, 0d7h
        db      75h, 0dch, 26h, 0a3h, 1ch, 00h, 0b7h, 00h, 26h, 89h, 1eh, 1eh, 00h, 0cdh, 85h, 8eh
        db      06h, 10h, 0fh, 0beh, 00h, 07h, 26h, 8bh, 0eh, 14h, 00h, 83h, 0f9h, 01h, 75h, 01h
        db      0c3h, 8bh, 0d8h, 8bh, 0fah, 26h, 2bh, 5ch, 02h, 26h, 1bh, 7ch, 04h, 72h, 0ah, 0bh
        db      0dfh, 74h, 06h, 83h, 0c6h, 0eh, 0e2h, 0e9h, 0c3h, 26h, 8bh, 44h, 02h, 26h, 8bh, 54h
        db      04h, 03h, 06h, 0f8h, 11h, 80h, 0d2h, 00h, 26h, 89h, 44h, 02h, 26h, 89h, 54h, 04h
        db      83h, 0c6h, 0eh, 0e2h, 0e4h, 0c3h
L_29070:
        call    fn_280BD
        db      74h, 01h, 0cbh, 80h, 0fch, 00h, 74h
        db      01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 1ah, 00h, 48h, 0a3h, 0ach, 12h, 0a3h, 0aeh
        db      12h, 0cdh, 0a4h
        else
        db      3bh, 06h, 0f0h, 11h, 76h, 03h, 0a3h, 0f0h, 11h, 0a3h
        out     dx, al
        db      11h, 0cbh
L_285C2:
        if      FW_VERSION >= 111
        mov     word ptr [A3_W_01206], 2559h
        else
        mov     word ptr [A3_W_01206], 254ch
        endif
        mov     ax, word ptr [A3_W_011F0]
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, intcb_285EA_112-APP3_CSBASE
        int     7fh
        KEY_CURSOR      (APP3_BASE+L_2857D-APP3_SEG*16), APP3_SEG, EP_L_2854B_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h
        retf
intcb_285EA_112:
        mov     es, word ptr [A3_W_00F10]
        cmp     ax, word ptr es:[A3_W_0001A]
        jb      L_285FA
        mov     ax, word ptr es:[A3_W_0001A]
        dec     ax
L_285FA:
        cmp     ax, word ptr [A3_W_011EE]
        jae     L_28603
        mov     word ptr [A3_W_011EE], ax
L_28603:
        mov     word ptr [A3_W_011F0], ax
        retf
L_28607:
        int     0b4h
        mov     bx, word ptr [A3_W_011EC]
        shl     bx, 1
        mov     cx, word ptr [bx+A3_TBL_01208]
        mov     ax, 180h
        div     ch
        mov     ah, 0
        mov     word ptr [A3_W_011FC], ax
        mul     cl
        mov     word ptr [A3_W_011FA], ax
        push    word ptr [A3_W_011EE]
        call    L_2867B
        mov     es, word ptr [A3_W_00F10]
        mov     si, word ptr es:[A3_W_0001A]
        shl     si, 2
        add     si, 1500h
        mov     al, byte ptr es:[si-1]
        mov     byte ptr es:[si+3], al
        mov     es, word ptr [A3_W_00F10]
        mov     cx, word ptr es:[14h]
        mov     ax, 0eh
        mul     cx
        add     ax, 700h
        mov     si, ax
        mov     ax, word ptr es:[1ch]
        mov     dx, word ptr es:[1eh]
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
        mov     bl, 15h
        int     87h
        int     0d6h
        pop     ax
        mov     dx, 0
        mov     cx, 0
        mov     bl, 0bh
        int     87h
        push    cs
        call    goto_main_screen
        retf
L_2867B:
        call    L_28692
        mov     ax, word ptr [A3_W_011EE]
        mov     bx, word ptr [A3_W_011F0]
        cmp     ax, word ptr [A3_W_011F0]
        jne     L_2868C
        ret
L_2868C:
        inc     word ptr [A3_W_011EE]
        jmp     L_2867B
L_28692:
        mov     ax, word ptr [A3_W_011EE]
        push    ax
        call    fn_30425
        pop     ax
        shl     ax, 2
        mov     si, 1500h
        add     si, ax
        mov     es, word ptr [A3_W_00F10]
        mov     bp, word ptr es:[1ch]
        mov     bh, byte ptr es:[1eh]
        mov     ax, word ptr es:[si+4]
        sub     ax, word ptr es:[si]
        sub     ax, word ptr [A3_W_011FA]
        jae     L_286C0
        jmp     L_287E6
L_286C0:
        mov     word ptr [A3_W_011F8], ax
        mov     bl, byte ptr [A3_W_011FC]
        mov     byte ptr es:[si+3], bl
        mov     ax, word ptr es:[si]
        mov     bl, byte ptr es:[si+2]
        add     ax, word ptr [A3_W_011FA]
        adc     bl, 0
        push    ax
        push    bx
        mov     ax, word ptr es:[si+4]
        mov     bl, byte ptr es:[si+6]
        mov     word ptr [A3_W_011FE], ax
        mov     word ptr [A3_W_01200], bx
L_286EA:
        add     si, 4
        mov     ax, word ptr es:[si]
        mov     bl, byte ptr es:[si+2]
        mov     cx, ax
        mov     dl, bl
        sub     ax, word ptr [A3_W_011F8]
        sbb     bl, 0
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        cmp     cx, bp
        jne     L_286EA
        cmp     dl, bh
        jne     L_286EA
        mov     word ptr es:[1ch], ax
        mov     bh, 0
        mov     word ptr es:[1eh], bx
        pop     dx
        pop     ax
        mov     dh, 0
        mov     bl, 0ah
        int     87h
        int     83h
L_28723:
        cmp     byte ptr es:[si+4], 0ffh
        je      L_2876B
        mov     ax, word ptr es:[si]
        mov     dl, byte ptr es:[si+2]
        and     dl, 0fh
        sub     ax, word ptr [A3_W_011FE]
        sbb     dl, byte ptr [A3_W_01200]
        jae     L_28742
        int     81h
        jmp     L_28723
L_28742:
        cmp     byte ptr es:[si+4], 0ffh
        je      L_2876B
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        mov     bh, bl
        and     bx, 0f00fh
        sub     ax, word ptr [A3_W_011F8]
        sbb     bl, 0
        or      bl, bh
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        call    fn_281FE
        jmp     L_28742
L_2876B:
        int     85h
        mov     es, word ptr [A3_W_00F10]
        mov     si, 700h
        mov     cx, word ptr es:[14h]
        cmp     cx, 1
        jne     L_2877F
        ret
L_2877F:
        mov     bx, ax
        mov     di, dx
        sub     bx, word ptr es:[si+2]
        sbb     di, word ptr es:[si+4]
        jb      L_28797
        or      bx, di
        je      L_28797
        add     si, 0eh
        loop    L_2877F
        ret
L_28797:
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        sub     ax, word ptr [A3_W_011FE]
        sbb     dl, byte ptr [A3_W_01200]
        jae     L_287C9
        push    es
        push    si
        push    cx
        dec     word ptr es:[14h]
        mov     di, si
        add     si, 0eh
        mov     cx, 14f2h
        sub     cx, di
        push    ds
        mov     ax, es
        mov     ds, ax
        rep movsb
        pop     ds
        pop     cx
        pop     si
        pop     es
        loop    L_28797
        ret
L_287C9:
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        sub     ax, word ptr [A3_W_011F8]
        sbb     dl, 0
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
        add     si, 0eh
        loop    L_287C9
        ret
L_287E6:
        neg     ax
        mov     word ptr [A3_W_011F8], ax
        pusha
        push    es
        mov     ax, word ptr [A3_W_011EE]
        inc     ax
        call    fn_30425
        int     83h
L_287F6:
        cmp     byte ptr es:[si+4], 0ffh
        je      L_2881F
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        mov     bh, bl
        and     bx, 0f00fh
        add     ax, word ptr [A3_W_011F8]
        adc     bl, 0
        or      bl, bh
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        call    fn_281FE
        jmp     L_287F6
L_2881F:
        pop     es
        popa
        mov     al, byte ptr [A3_W_011FC]
        mov     byte ptr es:[si+3], al
L_28828:
        add     si, 4
        mov     ax, word ptr es:[si]
        mov     bl, byte ptr es:[si+2]
        mov     cx, ax
        mov     dl, bl
        add     ax, word ptr [A3_W_011F8]
        adc     bl, 0
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        cmp     cx, bp
        jne     L_28828
        cmp     dl, bh
        jne     L_28828
        mov     word ptr es:[1ch], ax
        mov     bh, 0
        mov     word ptr es:[1eh], bx
        int     85h
        mov     es, word ptr [A3_W_00F10]
        mov     si, 700h
        mov     cx, word ptr es:[14h]
        cmp     cx, 1
        jne     L_2886B
        ret
L_2886B:
        mov     bx, ax
        mov     di, dx
        sub     bx, word ptr es:[si+2]
        sbb     di, word ptr es:[si+4]
        jb      L_28883
        or      bx, di
        je      L_28883
        add     si, 0eh
        loop    L_2886B
        ret
L_28883:
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        add     ax, word ptr [A3_W_011F8]
        adc     dl, 0
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
        add     si, 0eh
        loop    L_28883
        ret
L_28783:
L_29070:
        call    fn_280BD
        je      L_288A6
        retf
L_288A6:
        cmp     ah, 0
        je      L_288AC
        retf
L_288AC:
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[A3_W_0001A]
        dec     ax
        mov     word ptr [A3_W_012AC], ax
        mov     word ptr [A3_W_012AE], ax
        int     0a4h
        endif
        KEY_DOWN        20h, EP_FAR_290D9_OFF, APP3_SEG
        KEY_DOWN        12h, (APP3_BASE+L_29305-APP3_SEG*16), APP3_SEG
        else
        mov     word ptr [A3_W_01206], 252ah
        FIELD_WHEEL     ds, 11ech, 0, 0, 50h, field_cb_none-APP3_CSBASE
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_CURSOR      (APP3_BASE+L_27F7C-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        db      0cbh
L_27F37:
        db      0c7h, 06h, 06h, 12h, 3ch, 25h, 0a1h, 0eeh, 11h
        db      0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 9fh, 25h, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_27F7C-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h
        db      0cbh, 8eh
        db      06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 05h, 26h, 0a1h, 1ah, 00h, 48h, 3bh
        db      06h, 0f0h, 11h, 76h, 03h, 0a3h, 0f0h, 11h, 0a3h, 0eeh, 11h, 0cbh
L_27F7C:
        db      0c7h, 06h, 06h, 12h
        db      33h, 25h, 0a1h, 0f0h, 11h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 0e4h, 25h, 0cdh
        db      7fh
        KEY_CURSOR      (APP3_BASE+L_27F37-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2854B-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h
        db      0cbh, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 05h, 26h
        db      0a1h, 1ah, 00h, 48h, 3bh, 06h, 0eeh, 11h, 73h, 03h, 0a3h, 0eeh, 11h, 0a3h, 0f0h, 11h
        retf
L_28607:
        int     0b4h
        mov     bx, word ptr [A3_W_011EC]
        shl     bx, 1
        mov     cx, word ptr [bx+A3_TBL_01208]
        mov     ax, 180h
        div     ch
        mov     ah, 0
        mov     word ptr [A3_W_011FC], ax
        mul     cl
        mov     word ptr [A3_W_011FA], ax
        push    word ptr [A3_W_011EE]
        db      0e8h, 52h, 00h, 8eh, 06h, 10h, 0fh, 26h, 8bh, 36h, 1ah, 00h, 0c1h, 0e6h, 02h, 81h
        db      0c6h, 00h, 15h, 26h, 8ah, 44h, 0ffh, 26h, 88h, 44h, 03h, 8eh, 06h, 10h, 0fh, 26h
        db      8bh, 0eh, 14h, 00h, 0b8h, 0eh, 00h, 0f7h, 0e1h, 05h, 00h, 07h, 8bh, 0f0h, 26h, 0a1h
        db      1ch, 00h, 26h, 8bh, 16h, 1eh, 00h, 26h, 89h, 44h, 02h, 26h, 89h, 54h, 04h, 0b3h
        db      15h, 0cdh, 87h, 0cdh, 0d6h, 58h, 0bah, 00h, 00h, 0b9h, 00h, 00h, 0b3h, 0bh, 0cdh, 87h
        db      0eh, 0e8h, 06h, 0dah, 0cbh, 0e8h, 14h, 00h, 0a1h, 0eeh, 11h, 8bh, 1eh, 0f0h, 11h, 3bh
        db      06h, 0f0h, 11h, 75h, 01h, 0c3h, 0ffh, 06h, 0eeh, 11h, 0ebh, 0e9h, 0a1h, 0eeh, 11h, 50h
        db      0e8h, 0a4h, 75h, 58h, 0c1h, 0e0h, 02h, 0beh, 00h, 15h, 03h, 0f0h, 8eh, 06h, 10h, 0fh
        db      26h, 8bh, 2eh, 1ch, 00h, 26h, 8ah, 3eh, 1eh, 00h, 26h, 8bh, 44h, 04h, 26h, 2bh ; &....&.>..&.D.&+
        db      04h, 2bh, 06h, 0fah, 11h, 73h, 03h, 0e9h, 26h, 01h, 0a3h, 0f8h, 11h, 8ah, 1eh, 0fch
        db      11h, 26h, 88h, 5ch, 03h, 26h, 8bh, 04h, 26h, 8ah, 5ch, 02h, 03h, 06h, 0fah, 11h
        adc     bl, 0
        push    ax
        push    bx
        mov     ax, word ptr es:[si+4]
        mov     bl, byte ptr es:[si+6]
        mov     word ptr [A3_W_011FE], ax
        mov     word ptr [A3_W_01200], bx
L_286EA:
        add     si, 4
        mov     ax, word ptr es:[si]
        mov     bl, byte ptr es:[si+2]
        mov     cx, ax
        mov     dl, bl
        sub     ax, word ptr [A3_W_011F8]
        sbb     bl, 0
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        db      3bh, 0cdh, 75h, 0e0h, 3ah, 0d7h, 75h, 0dch, 26h, 0a3h, 1ch, 00h, 0b7h, 00h, 26h, 89h
        db      1eh, 1eh, 00h, 5ah, 58h, 0b6h, 00h, 0b3h, 0ah, 0cdh, 87h, 0cdh, 83h, 26h, 80h, 7ch
        db      04h, 0ffh, 74h, 41h, 26h, 8bh, 04h, 26h, 8ah, 54h, 02h, 80h, 0e2h, 0fh, 2bh, 06h
        db      0feh, 11h, 1ah, 16h, 00h, 12h, 73h, 04h, 0cdh, 81h, 0ebh, 0e1h, 26h, 80h, 7ch, 04h
        db      0ffh, 74h, 22h, 26h, 8bh, 04h, 26h, 8bh, 5ch, 02h, 8ah, 0fbh, 81h, 0e3h, 0fh, 0f0h
        sub     ax, word ptr [A3_W_011F8]
        sbb     bl, 0
        or      bl, bh
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        db      0e8h, 0cfh, 0f2h, 0ebh, 0d7h, 0cdh, 85h, 8eh, 06h, 10h, 0fh, 0beh, 00h, 07h, 26h, 8bh
        db      0eh, 14h, 00h, 83h, 0f9h, 01h, 75h, 01h, 0c3h, 8bh, 0d8h, 8bh, 0fah, 26h, 2bh, 5ch
        db      02h, 26h, 1bh, 7ch, 04h, 72h, 0ah, 0bh, 0dfh, 74h, 06h, 83h, 0c6h, 0eh, 0e2h, 0e9h
        db      0c3h, 26h, 8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 2bh, 06h, 0feh, 11h, 1ah, 16h, 00h
        db      12h, 73h, 20h, 06h, 56h, 51h, 26h, 0ffh, 0eh, 14h, 00h, 8bh, 0feh, 83h, 0c6h, 0eh
        db      0b9h, 0f2h, 14h, 2bh, 0cfh, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0f3h, 0a4h, 1fh, 59h, 5eh, 07h
        db      0e2h, 0cfh, 0c3h, 26h, 8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 2bh, 06h, 0f8h, 11h, 80h
        db      0dah, 00h, 26h, 89h, 44h, 02h, 26h, 89h, 54h, 04h, 83h, 0c6h, 0eh, 0e2h, 0e4h, 0c3h
        db      0f7h, 0d8h, 0a3h, 0f8h, 11h, 60h, 06h, 0a1h, 0eeh, 11h, 40h, 0e8h, 49h, 74h, 0cdh, 83h
        db      26h, 80h, 7ch, 04h, 0ffh, 74h, 22h, 26h, 8bh, 04h, 26h, 8bh, 5ch, 02h, 8ah, 0fbh
        and     bx, 0f00fh
        add     ax, word ptr [A3_W_011F8]
        adc     bl, 0
        or      bl, bh
        mov     word ptr es:[si], ax
        db      26h, 88h, 5ch, 02h, 0e8h, 1bh, 0f2h, 0ebh, 0d7h, 07h, 61h, 0a0h, 0fch, 11h, 26h, 88h
        db      44h, 03h, 83h, 0c6h, 04h, 26h, 8bh, 04h, 26h, 8ah, 5ch, 02h, 8bh, 0c8h, 8ah, 0d3h
        add     ax, word ptr [A3_W_011F8]
        adc     bl, 0
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        cmp     cx, bp
        db      75h, 0e0h, 3ah, 0d7h, 75h, 0dch, 26h, 0a3h, 1ch, 00h, 0b7h, 00h, 26h, 89h, 1eh, 1eh
        db      00h, 0cdh, 85h, 8eh, 06h, 10h, 0fh, 0beh, 00h, 07h, 26h, 8bh, 0eh, 14h, 00h, 83h
        db      0f9h, 01h, 75h, 01h, 0c3h, 8bh, 0d8h, 8bh, 0fah, 26h, 2bh, 5ch, 02h, 26h, 1bh, 7ch
        db      04h, 72h, 0ah, 0bh, 0dfh, 74h, 06h, 83h, 0c6h, 0eh, 0e2h, 0e9h, 0c3h, 26h, 8bh, 44h
        db      02h, 26h, 8bh, 54h, 04h, 03h, 06h, 0f8h, 11h, 80h, 0d2h, 00h, 26h, 89h, 44h, 02h
L_28783                         equ     $+0ah
        db      26h, 89h, 54h, 04h, 83h, 0c6h, 0eh, 0e2h, 0e4h, 0c3h, 0e8h, 54h, 0f0h, 74h, 01h, 0cbh
        db      80h, 0fch, 00h, 74h, 01h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 1ah, 00h, 48h, 0a3h
        db      0ach, 12h, 0a3h, 0aeh, 12h, 0cdh, 0a4h
        KEY_DOWN        20h, (APP3_BASE+far_290D9-APP3_SEG*16), APP3_SEG
        KEY_DOWN        12h, (APP3_BASE+L_284EA-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 111
        KEY_DOWN        14h, (APP3_BASE+L_291EC-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        14h, (APP3_BASE+L_288FF-APP3_SEG*16), APP3_SEG
        endif
        KEY_CURSOR      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        mov     cx, ds
        mov     si, 12aeh
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, field_cb_none-APP3_CSBASE
        int     7eh
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
far_290D9:
        DISP_WIN        29h, 06h, 0cdh, 36h, "Change Bars"
        DISP_TEXT       3ch, 10h, "Current= ###   > New Bars:###"
        DISP_HDOTS      2fh, 1ah, 0c1h
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "IN/DEL"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        db      0a1h
        db      0ach, 12h, 50h, 40h
        DISP_NUM        72h, 10h, 03h
        db      0a1h, 0aeh, 12h, 50h, 40h
        DISP_NUM        0d8h, 10h, 03h
        db      0b1h, 0d8h, 0b5h, 10h, 0b0h, 13h, 0cdh, 0b0h, 5bh, 58h, 3bh
        db      0c3h, 75h, 01h, 0cbh, 72h, 43h
        DISP_ERASE      32h, 1dh, 0a0h, 16h
        db      0beh, 0eh, 00h
        DISP_BMP        32h, 1dh, 0eh
        DISP_TEXT       4ah, 1eh, "Pressing DO^IT will^truncate"
        DISP_TEXT       4ah, 27h, "last bars."
        db      0cbh
        DISP_ERASE      32h, 1dh, 0a0h, 16h
        DISP_TEXT       32h, 1eh, "Pressing DO^IT will^add^blank    "
        DISP_TEXT       32h, 27h, "bars after last bar."
        if      FW_VERSION >= 114
        db      0cbh
L_291EC:
        call    fn_2B3C5
        db      0a1h, 0ach, 12h, 8bh, 1eh, 0aeh, 12h, 3bh, 0c3h
        jne     L_291FD
        jmp     NEAR L_292FD
L_291FD:
        db      73h, 02h, 0ebh, 77h, 8eh, 06h, 10h, 0fh, 8bh, 36h, 0aeh, 12h, 46h
        db      26h, 89h, 36h, 1ah, 00h, 0c1h, 0e6h, 02h, 81h, 0c6h, 00h, 15h, 26h, 8bh, 04h, 26h
        db      8bh, 54h, 02h, 83h, 0e2h, 0fh, 26h, 0a3h, 1ch, 00h, 26h, 89h, 16h, 1eh, 00h, 50h
        db      52h, 0b3h, 0ah, 0cdh, 87h, 0cdh, 83h, 26h, 80h, 7ch, 04h, 0ffh, 74h, 09h, 0cdh, 81h
        db      26h, 80h, 7ch, 04h, 0ffh, 75h, 0f7h, 5ah, 58h, 8eh, 06h, 10h, 0fh, 0beh, 0eh, 07h
        db      0bfh, 01h, 00h, 26h, 8bh, 5ch, 02h, 26h, 8bh, 4ch, 04h, 83h, 0e2h, 0fh, 2bh, 0d8h
        db      1bh, 0cah, 73h, 06h, 47h, 83h, 0c6h, 0eh, 0ebh, 0e9h, 26h, 89h, 44h, 02h, 26h, 89h
        db      54h, 04h, 26h, 0c7h, 04h, 0e8h, 03h, 26h, 89h, 3eh, 14h, 00h, 0ebh, 50h, 0b8h, 0e7h
        db      03h, 0e8h, 0a7h, 71h, 0a1h, 0ach, 12h, 50h, 0e8h, 58h, 0efh, 59h, 03h, 0c3h, 80h, 0d2h
        db      00h, 83h, 0c6h, 04h, 26h, 89h, 04h, 26h, 89h, 54h, 02h, 41h, 3bh, 0eh, 0aeh, 12h
        db      76h, 0eah, 83h, 0e2h, 0fh, 26h, 89h, 0eh, 1ah, 00h, 26h, 0a3h, 1ch, 00h, 26h, 89h
        db      16h, 1eh, 00h, 50h, 52h, 26h, 0a1h, 14h, 00h, 0beh, 0eh, 00h, 0f7h, 0e6h, 8bh, 0f0h
        db      81h, 0c6h, 00h, 07h, 5ah, 58h, 26h, 89h, 44h, 02h, 26h, 89h, 54h, 04h, 8eh, 06h
        db      10h, 0fh, 26h, 0c7h, 06h, 30h, 00h, 00h, 00h, 26h, 0c7h, 06h, 32h, 00h, 0ffh, 0ffh
        db      26h, 8bh, 36h, 1ah, 00h, 0c1h, 0e6h, 02h, 81h, 0c6h, 00h, 15h, 26h, 8ah, 44h, 0ffh
        db      26h, 88h, 44h, 03h, 0cdh, 0dfh, 0cdh, 0d6h, 0a1h, 1ah, 07h, 0cdh, 0d9h, 0b8h, 00h, 00h
        call    fn_30425
L_292FD:
        db      0eh
        call    goto_main_screen
        call    fn_2B3C5
        db      0cbh
L_29305:
        call    fn_280BD
        db      74h, 01h
        db      0cbh, 2bh, 0c0h, 0a3h, 0b0h, 12h, 0a3h, 0b2h, 12h, 0a3h, 0b4h, 12h, 0c7h, 06h, 0b6h, 12h
        db      00h, 00h, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 1ah, 00h, 48h, 0a3h, 0ach, 12h, 0cdh, 0a4h
        db      0eh
        call    far_294C3
        KEY_DOWN        20h, EP_L_28D7F_OFF, APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+FAR_295BC-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+FAR_296F1-APP3_SEG*16), APP3_SEG
        else
        if      FW_VERSION >= 110
        db      0cbh
L_288FF:
L_291EC:
        call    fn_2B3C5
        mov     ax, word ptr [A3_W_012AC]
        mov     bx, word ptr [A3_W_012AE]
        cmp     ax, bx
        jne     L_28A2D
        jmp     L_28B2D
L_28A2D:
        jae     L_28A31
        jmp     L_28AA8
L_28A31:
        mov     es, word ptr [A3_W_00F10]
        mov     si, word ptr [A3_W_012AE]
        inc     si
        mov     word ptr es:[A3_W_0001A], si
        shl     si, 2
        add     si, 1500h
        else
L_288FF                         equ     $+1
        db      0cbh, 0e8h, 0c5h, 21h, 0a1h, 0ach, 12h, 8bh, 1eh, 0aeh, 12h
        db      3bh, 0c3h, 75h, 03h, 0e9h, 0fbh, 00h, 73h, 02h, 0ebh, 77h, 8eh, 06h, 10h, 0fh, 8bh
        db      36h, 0aeh, 12h, 46h, 26h, 89h, 36h, 1ah, 00h, 0c1h, 0e6h, 02h, 81h, 0c6h, 00h, 15h
        endif
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 0fh
        mov     word ptr es:[1ch], ax
        mov     word ptr es:[1eh], dx
        push    ax
        push    dx
        mov     bl, 0ah
        int     87h
        int     83h
        cmp     byte ptr es:[si+4], 0ffh
        if      FW_VERSION >= 110
        je      L_28A71
L_28A68:
        int     81h
        cmp     byte ptr es:[si+4], 0ffh
        jne     L_28A68
L_28A71:
        pop     dx
        pop     ax
        mov     es, word ptr [A3_W_00F10]
        mov     si, 70eh
        mov     di, 1
L_28A7D:
        mov     bx, word ptr es:[si+2]
        mov     cx, word ptr es:[si+4]
        and     dx, 0fh
        sub     bx, ax
        sbb     cx, dx
        jae     L_28A94
        inc     di
        add     si, 0eh
        jmp     L_28A7D
L_28A94:
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
        mov     word ptr es:[si], 3e8h
        mov     word ptr es:[14h], di
        jmp     L_28AF8
L_28AA8:
        mov     ax, 3e7h
        call    fn_30425
        mov     ax, word ptr [A3_W_012AC]
        push    ax
        db      0e8h, 58h, 0efh
        pop     cx
L_28AB6:
        else
        db      74h, 09h, 0cdh, 81h, 26h, 80h, 7ch, 04h, 0ffh, 75h, 0f7h, 5ah, 58h, 8eh, 06h, 10h
        db      0fh, 0beh, 0eh, 07h, 0bfh, 01h, 00h, 26h, 8bh, 5ch, 02h, 26h, 8bh, 4ch, 04h, 83h
        db      0e2h, 0fh, 2bh, 0d8h, 1bh, 0cah, 73h, 06h, 47h, 83h, 0c6h, 0eh, 0ebh, 0e9h, 26h, 89h
        db      44h, 02h, 26h, 89h, 54h, 04h, 26h, 0c7h, 04h, 0e8h, 03h, 26h, 89h, 3eh, 14h, 00h
        db      0ebh, 50h, 0b8h, 0e7h, 03h, 0e8h, 8fh, 71h, 0a1h, 0ach, 12h, 50h, 0e8h, 62h, 0efh, 59h
        endif
        add     ax, bx
        adc     dl, 0
        add     si, 4
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], dx
        inc     cx
        if      FW_VERSION >= 110
        cmp     cx, word ptr [A3_W_012AE]
        jbe     L_28AB6
        and     dx, 0fh
        mov     word ptr es:[A3_W_0001A], cx
        mov     word ptr es:[1ch], ax
        mov     word ptr es:[1eh], dx
        push    ax
        push    dx
        mov     ax, word ptr es:[14h]
        mov     si, 0eh
        mul     si
        mov     si, ax
        add     si, 700h
        pop     dx
        pop     ax
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
L_28AF8:
        mov     es, word ptr [A3_W_00F10]
        mov     word ptr es:[30h], 0
        mov     word ptr es:[32h], 0ffffh
        mov     si, word ptr es:[A3_W_0001A]
        shl     si, 2
        add     si, 1500h
        mov     al, byte ptr es:[si-1]
        mov     byte ptr es:[si+3], al
        int     0dfh
        int     0d6h
        mov     ax, word ptr [A3_W_0071A]
        int     0d9h
        mov     ax, 0
        call    fn_30425
L_28B2D:
        push    cs
        call    goto_main_screen
        call    fn_2B3C5
        retf
L_28A18:
L_29305:
        call    fn_280BD
        je      L_28B3B
        retf
L_28B3B:
        else
        db      3bh, 0eh, 0aeh, 12h, 76h, 0eah, 83h, 0e2h, 0fh, 26h, 89h, 0eh, 1ah, 00h, 26h, 0a3h
        db      1ch, 00h, 26h, 89h, 16h, 1eh, 00h, 50h, 52h, 26h, 0a1h, 14h, 00h, 0beh, 0eh, 00h
        db      0f7h, 0e6h, 8bh, 0f0h, 81h, 0c6h, 00h, 07h, 5ah, 58h, 26h, 89h, 44h, 02h, 26h, 89h
        db      54h, 04h, 8eh, 06h, 10h, 0fh, 26h, 0c7h, 06h, 30h, 00h, 00h, 00h, 26h, 0c7h, 06h
        db      32h, 00h, 0ffh, 0ffh, 26h, 8bh, 36h, 1ah, 00h, 0c1h, 0e6h, 02h, 81h, 0c6h, 00h, 15h
        db      26h, 8ah, 44h, 0ffh, 26h, 88h, 44h, 03h, 0cdh, 0dfh, 0cdh, 0d6h, 0b8h, 00h, 00h, 0e8h
L_28A18                         equ     $+0ah
        db      15h, 71h, 0eh, 0e8h, 54h, 0d5h, 0e8h, 0b5h, 20h, 0cbh
L_284EA:
        db      0e8h, 0c4h, 0edh, 74h, 01h, 0cbh
        endif
        sub     ax, ax
        mov     word ptr [A3_W_012B0], ax
        mov     word ptr [A3_W_012B2], ax
        mov     word ptr [A3_W_012B4], ax
        mov     word ptr [A3_W_012B6], 0
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[A3_W_0001A]
        dec     ax
        mov     word ptr [A3_W_012AC], ax
        int     0a4h
        push    cs
        call    L_28CF3
        KEY_DOWN        20h, (APP3_BASE+L_28D7F-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 110
        KEY_DOWN        11h, (APP3_BASE+L_28DEC-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        11h, (APP3_BASE+L_287A1-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+L_28F21-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_28D7F:
        DISP_WIN_WIDE   "Change Bars"
        DISP_TEXT       18h, 0bh, "     After bar:###  First bar:###"
        DISP_TEXT       18h, 21h, "Number of bars:###   Last bar:###"
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "INSERT"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DELETE"
        DISP_BOX        33h, 18h, 0bh, 04h
        DISP_BOX        3dh, 18h, 0bh, 04h
        DISP_BOX        47h, 18h, 0bh, 04h
        DISP_BOX        5bh, 18h, 0bh, 04h
        DISP_BOX        65h, 18h, 0bh, 04h
        mov     si, 14h
        DISP_BMP        49h, 14h, 14h
        mov     si, 13h
        DISP_BMP        53h, 1ah, 13h
        DISP_VDOTS      8ah, 0bh, 28h
        DISP_BOX        90h, 18h, 0bh, 04h
        DISP_FILL       9bh, 18h, 0bh, 04h
        DISP_FILL       0afh, 18h, 0bh, 04h
        DISP_BOX        0b9h, 18h, 0bh, 04h
        DISP_BOX        0c3h, 18h, 0bh, 04h
        db      0beh, 14h, 00h
        DISP_BMP        9dh, 14h, 14h
        db      0beh, 13h, 00h
        DISP_BMP        0b1h, 1ch, 13h
        db      0beh, 15h, 00h
        DISP_BMP        0a5h, 16h, 15h
        db      0beh
        db      16h, 00h
        DISP_BMP        0a5h, 1ah, 16h
        db      0beh, 15h, 00h
        DISP_BMP        0aeh, 16h, 15h
        db      0beh, 16h, 00h
        DISP_BMP        0aeh, 1ah, 16h
        db      0a1h, 0b0h, 12h
        DISP_NUM        72h, 0bh, 03h
        db      0a1h, 0b6h, 12h
        DISP_NUM        72h, 21h, 03h
        db      0a1h, 0b2h, 12h, 40h
        DISP_NUM        0cch, 0bh, 03h
        db      0a1h, 0b4h, 12h, 40h
        DISP_NUM        0cch, 21h, 03h
        if      FW_VERSION >= 114
        db      0ffh, 16h, 0aah, 12h, 0cbh, 0b1h, 72h, 0b5h, 0bh, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 72h
        db      0b5h, 21h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 0cch, 0b5h, 0bh, 0b0h, 13h, 0cdh, 0b0h, 0c3h
far_294C3                       equ     $+9
        db      0b1h, 0cch, 0b5h, 21h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0c7h, 06h, 0aah, 12h, 0efh, 2ch, 0a1h
        db      0b0h, 12h, 0b3h, 00h, 0b7h, 00h, 0bah, 0e6h, 03h, 0bfh, 3bh, 2dh, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+FAR_29539-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_294FD-APP3_SEG*16), APP3_SEG
        db      0cbh, 8bh, 1eh, 0ach, 12h, 43h, 3bh, 0c3h, 72h, 02h, 8bh, 0c3h, 0a3h, 0b0h, 12h, 26h
far_294FD                       equ     $+3
        db      89h, 05h, 0cbh, 0c7h, 06h, 0aah, 12h, 0f8h, 2ch, 0a1h, 0b6h, 12h, 0b3h, 00h, 0b7h, 00h
        db      0bah, 0e7h, 03h, 0bfh, 75h, 2dh, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+FAR_2957B-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_294C3-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh, 0bbh, 0e6h, 03h, 2bh, 1eh
far_29539                       equ     $+0fh
        db      0ach, 12h, 3bh, 0c3h, 72h, 02h, 8bh, 0c3h, 0a3h, 0b6h, 12h, 26h, 89h, 05h, 0cbh, 0c7h
        db      06h, 0aah, 12h, 01h, 2dh, 0a1h, 0b2h, 12h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh
        db      0b1h, 2dh, 0cdh, 7fh
        KEY_CURSOR      (APP3_BASE+FAR_294C3-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+FAR_2957B-APP3_SEG*16), APP3_SEG
        db      0cbh, 8bh, 1eh, 0ach, 12h, 3bh, 0c3h, 72h, 02h, 8bh
        db      0c3h, 0a3h, 0b2h, 12h, 26h, 89h, 05h, 3bh, 06h, 0b4h, 12h, 72h, 03h, 0a3h, 0b4h, 12h
far_2957B                       equ     $+1
        db      0cbh, 0c7h, 06h, 0aah, 12h, 0ah, 2dh, 0a1h, 0b4h, 12h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h
        db      03h, 0bfh, 0f3h, 2dh, 0cdh, 7fh
        KEY_CURSOR      (APP3_BASE+FAR_294FD-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_29539-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh, 3bh, 06h, 0ach, 12h, 72h, 03h, 0a1h
        db      0ach, 12h, 0a3h, 0b4h, 12h, 26h, 89h, 05h, 3bh, 06h, 0b2h, 12h, 73h, 03h, 0a3h, 0b2h
far_295BC                       equ     $+2
        db      12h, 0cbh, 83h, 3eh, 0b6h, 12h, 00h, 75h, 03h
        jmp     NEAR L_296E9
        db      8eh, 06h, 10h, 0fh
        db      26h, 8ah, 1eh, 18h, 00h, 26h, 8ah, 3eh, 19h, 00h, 0b8h, 80h, 01h, 0f6h, 0f7h, 0a2h
        db      0cah, 12h, 0f6h, 0e3h, 0a3h, 0bch, 12h, 8bh, 1eh, 0b6h, 12h, 0f7h, 0e3h, 0a3h, 0b8h, 12h
        db      89h, 16h, 0bah, 12h, 0a1h, 0b0h, 12h, 0c1h, 0e0h, 02h, 05h, 00h, 15h, 8bh, 0f0h, 26h
        db      8bh, 2eh, 1ch, 00h, 26h, 8ah, 3eh, 1eh, 00h, 26h, 0ffh, 34h, 26h, 0ffh, 74h, 02h
        db      56h, 56h, 26h, 8bh, 04h, 26h, 8ah, 5ch, 02h, 8bh, 0c8h, 8ah, 0d3h, 03h, 06h, 0b8h
        db      12h, 12h, 1eh, 0bah, 12h, 26h, 89h, 04h, 26h, 88h, 5ch, 02h, 3bh, 0cdh, 75h, 04h
        db      3ah, 0fah, 74h, 05h, 83h, 0c6h, 04h, 0ebh, 0d9h, 5bh, 83h, 0ebh, 04h, 8bh, 3eh, 0b6h
        db      12h, 0c1h, 0e7h, 02h, 03h, 0feh, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0b9h, 02h, 00h, 0f3h, 0a5h
        db      83h, 0eeh, 08h, 83h, 0efh, 08h, 3bh, 0deh, 75h, 0f1h, 1fh, 5eh, 5bh, 58h, 53h, 0b7h
        db      00h, 0a3h, 0beh, 12h, 89h, 1eh, 0c0h, 12h, 5bh, 8bh, 0eh, 0b6h, 12h, 8ah, 3eh, 0cah
        db      12h, 26h, 89h, 04h, 26h, 89h, 5ch, 02h, 03h, 06h, 0bch, 12h, 80h, 0d3h, 00h, 83h
        db      0c6h, 04h, 0e2h, 0edh, 0a1h, 0b8h, 12h, 8bh, 16h, 0bah, 12h, 26h, 01h, 06h, 1ch, 00h
        db      26h, 11h, 16h, 1eh, 00h, 0a1h, 0b6h, 12h, 26h, 01h, 06h, 1ah, 00h
        call    L_2982D
        db      0a1h, 0b0h, 12h
        call    fn_30425
        db      0cdh, 83h, 26h, 80h, 7ch, 04h, 0ffh
        je      L_296CC
        db      26h
        db      8bh, 04h, 26h, 8bh, 5ch, 02h, 8ah, 0fbh, 81h, 0e3h, 0fh, 0f0h, 03h, 06h, 0b8h, 12h
        db      12h, 1eh, 0bah, 12h, 0ah, 0dfh, 26h, 89h, 04h, 26h, 88h, 5ch, 02h
        call    fn_281FE
        db      0ebh, 0d6h
L_296CC:
        db      8eh, 06h, 10h, 0fh, 26h, 0c7h, 06h, 30h, 00h, 00h, 00h, 26h, 0c7h, 06h
        db      32h, 00h, 0ffh, 0ffh, 0b3h, 15h, 0cdh, 87h, 0cdh, 0d6h, 0a1h, 1ah, 07h, 0cdh, 0d9h
L_296E9:
        db      0eh
far_296F1                       equ     $+7
        call    goto_main_screen
        call    fn_2B3C5
        db      0cbh, 0a1h, 0b4h, 12h, 2bh, 06h, 0b2h, 12h, 40h, 8eh
        db      06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 75h, 03h
        jmp     NEAR L_29824
        db      8bh, 3eh, 0b2h
        db      12h, 0c1h, 0e7h, 02h, 81h, 0c7h, 00h, 15h, 8bh, 36h, 0b4h, 12h, 46h, 0c1h, 0e6h, 02h
        db      81h, 0c6h, 00h, 15h, 26h, 8bh, 04h, 26h, 8bh, 54h, 02h, 0b6h, 00h, 0a3h, 0c2h, 12h
        db      89h, 16h, 0c4h, 12h, 26h, 0ffh, 35h, 26h, 0ffh, 75h, 02h, 57h, 1eh, 8ch, 0c0h, 8eh
        db      0d8h, 0b9h, 02h, 00h, 0f3h, 0a5h, 81h, 0feh, 0a0h, 24h, 75h, 0f5h, 1fh, 5eh, 59h, 5bh
        db      0b5h, 00h, 89h, 1eh, 0c6h, 12h, 89h, 0eh, 0c8h, 12h, 26h, 8bh, 04h, 26h, 8bh, 54h
        db      02h, 2bh, 0c3h, 1ah, 0d1h, 0b6h, 00h, 0a3h, 0b8h, 12h, 89h, 16h, 0bah, 12h, 26h, 8bh
        db      2eh, 1ch, 00h, 26h, 8ah, 3eh, 1eh, 00h, 26h, 8bh, 0ch, 26h, 8ah, 5ch, 02h, 26h
        db      29h, 04h, 26h, 18h, 54h, 02h, 3bh, 0cdh, 75h, 04h, 3ah, 0fbh, 74h, 05h, 83h, 0c6h
        db      04h, 0ebh, 0e5h, 0a1h, 0b8h, 12h, 8bh, 16h, 0bah, 12h, 26h, 29h, 06h, 1ch, 00h, 26h
        db      19h, 16h, 1eh, 00h, 0a1h, 0b4h, 12h, 2bh, 06h, 0b2h, 12h, 40h, 26h, 29h, 06h, 1ah
        db      00h, 0e8h, 35h, 01h, 0a1h, 0b2h, 12h
        call    fn_30425
        db      0cdh, 83h
L_297B6:
        db      26h, 80h, 7ch, 04h
        db      0ffh
        je      L_297FF
        db      26h, 8bh, 04h, 26h, 8ah, 54h, 02h, 80h, 0e2h, 0fh, 2bh, 06h, 0c2h
        db      12h, 1ah, 16h, 0c4h, 12h, 73h, 04h, 0cdh, 81h
        jmp     SHORT L_297B6
L_297D5:
        db      26h, 80h, 7ch, 04h, 0ffh
        db      74h, 23h, 26h, 8bh, 04h, 26h, 8bh, 5ch, 02h, 8ah, 0fbh, 81h, 0e3h, 0fh, 0f0h, 2bh
        db      06h, 0b8h, 12h, 1ah, 1eh, 0bah, 12h, 0ah, 0dfh, 26h, 89h, 04h, 26h, 88h, 5ch, 02h
        call    fn_281FE
        jmp     SHORT L_297D5
L_297FF:
        db      8eh, 06h, 10h, 0fh, 26h, 0c7h, 06h, 30h, 00h, 00h, 00h
        db      26h, 0c7h, 06h, 32h, 00h, 0ffh, 0ffh, 0b3h, 15h, 0cdh, 87h, 0cdh, 0d6h, 0a1h, 1ah, 07h
        db      0cdh, 0d9h, 0eh
        call    goto_main_screen
        call    fn_2B3C5
        db      0cbh
L_29824:
        db      0eh
        call    L_272DD
        db      0eh
        call    far_270FB
        db      0cbh
L_2982D:
        db      8eh, 06h, 10h, 0fh, 26h, 8bh, 0eh, 14h, 00h, 0b8h, 0eh, 00h, 0f7h
        db      0e1h, 05h, 00h, 07h, 8bh, 0f0h, 26h, 0a1h, 1ch, 00h, 26h, 8bh, 16h, 1eh, 00h, 26h
        db      89h, 44h, 02h, 26h, 89h, 54h, 04h, 0beh, 0f2h, 06h, 26h, 8bh, 0eh, 14h, 00h, 41h
        db      83h, 0c6h, 0eh, 49h, 75h, 01h, 0c3h, 26h, 8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 2bh
        db      06h, 0beh, 12h, 1bh, 16h, 0c0h, 12h, 72h, 0e7h, 0a1h, 0b8h, 12h, 8bh, 16h, 0bah, 12h
        db      26h, 01h, 44h, 02h, 26h, 11h, 54h, 04h, 83h, 0c6h, 0eh, 49h, 75h, 0f2h, 0a1h, 0beh
        db      12h, 0bh, 06h, 0c0h, 12h, 74h, 01h, 0c3h, 0beh, 00h, 07h, 26h, 81h, 3ch, 0e8h, 03h
        db      74h, 3ch, 26h, 81h, 3eh, 14h, 00h, 0ffh, 00h, 74h, 05h, 26h, 0ffh, 06h, 14h, 00h
        db      0bfh, 0ffh, 14h, 8bh, 0cfh, 81h, 0e9h, 00h, 07h, 83h, 0e9h, 05h, 0beh, 0f1h, 14h, 1eh
        db      8ch, 0c0h, 8eh, 0d8h, 0fah, 0fdh, 0f3h, 0a4h, 0fch, 0fbh, 1fh, 0beh, 00h, 07h, 26h, 0c7h
        db      04h, 0e8h, 03h, 2bh, 0c0h, 26h, 89h, 44h, 02h, 26h, 89h, 44h, 04h, 0c3h, 2bh, 0c0h
        db      26h, 89h, 44h, 02h, 26h, 89h, 44h, 04h, 0c3h, 8eh, 06h, 10h, 0fh, 26h, 8bh, 0eh
        db      14h, 00h, 0b8h, 0eh, 00h, 0f7h, 0e1h, 05h, 00h, 07h, 8bh, 0f0h, 26h, 0a1h, 1ch, 00h
        db      26h, 8bh, 16h, 1eh, 00h, 26h, 89h, 44h, 02h, 26h, 89h, 54h, 04h
        call    L_29943
        call    L_29996
        db      8eh, 06h, 10h, 0fh, 0beh, 00h, 07h, 26h, 8bh, 0eh, 14h, 00h, 49h
        db      75h, 01h, 0c3h, 83h, 0c6h, 0eh, 26h, 8bh, 44h, 02h, 26h, 0bh, 44h, 04h, 74h, 01h
        db      0c3h, 26h, 0ffh, 0eh, 14h, 00h, 8bh, 0feh, 83h, 0efh, 0eh, 0b9h, 0f2h, 14h, 2bh, 0cfh
        db      1eh, 8ch, 0c0h, 8eh, 0d8h, 0f3h, 0a4h, 1fh, 0c3h
L_29943:
        db      8eh, 06h, 10h, 0fh, 0beh, 00h, 07h
        db      26h, 8bh, 0eh, 14h, 00h, 83h, 0c6h, 0eh, 49h, 75h, 01h, 0c3h, 26h, 8bh, 44h, 02h
        db      26h, 8bh, 54h, 04h, 2bh, 06h, 0c6h, 12h, 1bh, 16h, 0c8h, 12h, 72h, 0e7h, 26h, 8bh
        db      44h, 02h, 26h, 8bh, 54h, 04h, 2bh, 06h, 0c2h, 12h, 1bh, 16h, 0c4h, 12h, 72h, 01h
        db      0c3h, 56h, 26h, 0ffh, 0eh, 14h, 00h, 8bh, 0feh, 83h, 0c6h, 0eh, 0b9h, 0f2h, 14h, 2bh
        db      0cfh, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0f3h, 0a4h, 1fh, 5eh, 0ebh, 0adh
L_29996:
        db      8eh, 06h, 10h, 0fh
        db      0beh, 00h, 07h, 26h, 8bh, 0eh, 14h, 00h, 83h, 0c6h, 0eh, 49h, 75h, 01h, 0c3h, 26h
        db      8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 2bh, 06h, 0c6h, 12h, 1bh, 16h, 0c8h, 12h, 72h
        db      0e7h, 0a1h, 0b8h, 12h, 8bh, 16h, 0bah, 12h, 26h, 29h, 44h, 02h, 26h, 19h, 54h, 04h
        db      83h, 0c6h, 0eh, 49h, 75h, 0f2h, 0c3h
L_299D1:
        call    fn_280BD
        je      L_299D7
        db      0cbh
L_299D7:
        call    L_29C23
        db      0cdh, 0a4h, 0cdh, 57h, 2bh, 0c0h, 0a3h, 4dh, 15h, 0a2h, 4fh, 15h, 0a2h, 50h, 15h, 0a2h
        db      53h, 15h, 0a2h, 54h, 15h
        call    fn_2B3C5
        db      0ffh, 1eh, 0cbh, 12h, 0cbh
        else
        db      0ffh, 16h, 0aah, 12h, 0cbh, 0b1h, 72h, 0b5h, 0bh, 0b0h, 13h, 0cdh, 0b0h, 0c3h
        db      0b1h, 72h, 0b5h, 21h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 0cch, 0b5h, 0bh, 0b0h, 13h, 0cdh
        db      0b0h, 0c3h, 0b1h, 0cch, 0b5h, 21h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
L_28CF3:
        if      FW_VERSION >= 111
        mov     word ptr [A3_W_012AA], 2cefh
        elseif  FW_VERSION >= 110
        mov     word ptr [A3_W_012AA], 2ce2h
        else
        mov     word ptr [A3_W_012AA], 2cc4h
        endif
        mov     ax, word ptr [A3_W_012B0]
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3e6h
        mov     di, intcb_28D1B_112-APP3_CSBASE
        int     7fh
        if      FW_VERSION >= 110
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_28D69-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_28D2D-APP3_SEG*16), APP3_SEG
        retf
intcb_28D1B_112:
        mov     bx, word ptr [A3_W_012AC]
        inc     bx
        cmp     ax, bx
        jb      L_28D26
        mov     ax, bx
L_28D26:
        mov     word ptr [A3_W_012B0], ax
        mov     word ptr es:[di], ax
        retf
L_28D2D:
        if      FW_VERSION >= 111
        mov     word ptr [A3_W_012AA], 2cf8h
        else
        mov     word ptr [A3_W_012AA], 2cebh
        endif
        mov     ax, word ptr [A3_W_012B6]
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, intcb_28D55_112-APP3_CSBASE
        int     7fh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_28DAB-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_28CF3-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
intcb_28D55_112:
        mov     bx, 3e6h
        sub     bx, word ptr [A3_W_012AC]
        cmp     ax, bx
        jb      L_28D62
        mov     ax, bx
L_28D62:
        mov     word ptr [A3_W_012B6], ax
        mov     word ptr es:[di], ax
        retf
L_28D69:
        if      FW_VERSION >= 111
        mov     word ptr [A3_W_012AA], 2d01h
        else
        mov     word ptr [A3_W_012AA], 2cf4h
        endif
        mov     ax, word ptr [A3_W_012B2]
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, intcb_28D91_112-APP3_CSBASE
        int     7fh
        KEY_CURSOR      (APP3_BASE+L_28CF3-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_28DAB-APP3_SEG*16), APP3_SEG
        retf
intcb_28D91_112:
        mov     bx, word ptr [A3_W_012AC]
        cmp     ax, bx
        jb      L_28D9B
        mov     ax, bx
L_28D9B:
        mov     word ptr [A3_W_012B2], ax
        mov     word ptr es:[di], ax
        cmp     ax, word ptr [A3_W_012B4]
        jb      L_28DAA
        mov     word ptr [A3_W_012B4], ax
L_28DAA:
        retf
L_28DAB:
        if      FW_VERSION >= 111
        mov     word ptr [A3_W_012AA], 2d0ah
        else
        mov     word ptr [A3_W_012AA], 2cfdh
        endif
        mov     ax, word ptr [A3_W_012B4]
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, intcb_28DD3_112-APP3_CSBASE
        int     7fh
        KEY_CURSOR      (APP3_BASE+L_28D2D-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_28D69-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
intcb_28DD3_112:
        cmp     ax, word ptr [A3_W_012AC]
        jb      L_28DDC
        mov     ax, word ptr [A3_W_012AC]
L_28DDC:
        mov     word ptr [A3_W_012B4], ax
        mov     word ptr es:[di], ax
        cmp     ax, word ptr [A3_W_012B2]
        jae     L_28DEB
        mov     word ptr [A3_W_012B2], ax
L_28DEB:
        retf
L_28DEC:
        cmp     word ptr [A3_W_012B6], 0
        jne     L_28DF6
        jmp     L_28F19
L_28DF6:
        mov     es, word ptr [A3_W_00F10]
        mov     bl, byte ptr es:[18h]
        mov     bh, byte ptr es:[19h]
        mov     ax, 180h
        div     bh
        mov     byte ptr [A3_B_012CA], al
        mul     bl
        mov     word ptr [A3_W_012BC], ax
        mov     bx, word ptr [A3_W_012B6]
        mul     bx
        mov     word ptr [A3_W_012B8], ax
        mov     word ptr [A3_W_012BA], dx
        mov     ax, word ptr [A3_W_012B0]
        shl     ax, 2
        add     ax, 1500h
        mov     si, ax
        mov     bp, word ptr es:[1ch]
        mov     bh, byte ptr es:[1eh]
        push    word ptr es:[si]
        push    word ptr es:[si+2]
        push    si
        push    si
L_28E3C:
        mov     ax, word ptr es:[si]
        mov     bl, byte ptr es:[si+2]
        mov     cx, ax
        mov     dl, bl
        add     ax, word ptr [A3_W_012B8]
        adc     bl, byte ptr [A3_W_012BA]
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        cmp     cx, bp
        jne     L_28E5E
        cmp     bh, dl
        je      L_28E63
L_28E5E:
        add     si, 4
        jmp     L_28E3C
L_28E63:
        pop     bx
        sub     bx, 4
        mov     di, word ptr [A3_W_012B6]
        shl     di, 2
        add     di, si
        push    ds
        mov     ax, es
        mov     ds, ax
L_28E75:
        mov     cx, 2
        rep movsw
        sub     si, 8
        sub     di, 8
        cmp     bx, si
        jne     L_28E75
        pop     ds
        pop     si
        pop     bx
        pop     ax
        push    bx
        mov     bh, 0
        else
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2871E-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_286E2-APP3_SEG*16), APP3_SEG
        db      0cbh
intcb_28D1B_112:
        db      8bh, 1eh, 0ach, 12h, 43h, 3bh, 0c3h, 72h, 02h, 8bh, 0c3h, 0a3h, 0b0h, 12h, 26h, 89h
        db      05h, 0cbh
L_286E2:
        db      0c7h, 06h, 0aah, 12h, 0cdh, 2ch, 0a1h, 0b6h, 12h, 0b3h, 00h, 0b7h, 00h, 0bah
        db      0e7h, 03h, 0bfh, 4ah, 2dh, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_28760-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_28CF3-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh, 0bbh, 0e6h, 03h, 2bh, 1eh, 0ach
        db      12h, 3bh, 0c3h, 72h, 02h, 8bh, 0c3h, 0a3h, 0b6h, 12h, 26h, 89h, 05h, 0cbh
L_2871E:
        db      0c7h, 06h
        db      0aah, 12h, 0d6h, 2ch, 0a1h, 0b2h, 12h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 86h
        db      2dh, 0cdh, 7fh
        KEY_CURSOR      (APP3_BASE+L_28CF3-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_28760-APP3_SEG*16), APP3_SEG
        db      0cbh, 8bh, 1eh, 0ach, 12h, 3bh, 0c3h, 72h, 02h, 8bh, 0c3h
        db      0a3h, 0b2h, 12h, 26h, 89h, 05h, 3bh, 06h, 0b4h, 12h, 72h, 03h, 0a3h, 0b4h, 12h, 0cbh
L_28760:
        db      0c7h, 06h, 0aah, 12h, 0dfh, 2ch, 0a1h, 0b4h, 12h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h
        db      0bfh, 0c8h, 2dh, 0cdh, 7fh
        KEY_CURSOR      (APP3_BASE+L_286E2-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2871E-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh, 3bh, 06h, 0ach, 12h, 72h, 03h, 0a1h, 0ach
        db      12h, 0a3h, 0b4h, 12h, 26h, 89h, 05h, 3bh, 06h, 0b2h, 12h, 73h, 03h, 0a3h, 0b2h, 12h
        db      0cbh
L_287A1:
        db      83h, 3eh, 0b6h, 12h, 00h, 75h, 03h, 0e9h, 1eh, 01h, 8eh, 06h, 10h, 0fh, 26h
        db      8ah, 1eh, 18h, 00h, 26h, 8ah, 3eh, 19h, 00h, 0b8h, 80h, 01h, 0f6h, 0f7h, 0a2h, 0cah
        db      12h, 0f6h, 0e3h, 0a3h, 0bch, 12h, 8bh, 1eh, 0b6h, 12h, 0f7h, 0e3h, 0a3h, 0b8h, 12h, 89h
        db      16h, 0bah, 12h, 0a1h, 0b0h, 12h, 0c1h, 0e0h, 02h, 05h, 00h, 15h, 8bh, 0f0h, 26h, 8bh
        db      2eh, 1ch, 00h, 26h, 8ah, 3eh, 1eh, 00h, 26h, 0ffh, 34h, 26h, 0ffh, 74h, 02h, 56h ; ...&.>..&.4&.t.V
        db      56h, 26h, 8bh, 04h, 26h, 8ah, 5ch, 02h, 8bh, 0c8h, 8ah, 0d3h, 03h, 06h, 0b8h, 12h
        db      12h, 1eh, 0bah, 12h, 26h, 89h, 04h, 26h, 88h, 5ch, 02h, 3bh, 0cdh, 75h, 04h, 3ah
        db      0fah, 74h, 05h, 83h, 0c6h, 04h, 0ebh, 0d9h, 5bh, 83h, 0ebh, 04h, 8bh, 3eh, 0b6h, 12h
        db      0c1h, 0e7h, 02h, 03h, 0feh, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0b9h, 02h, 00h, 0f3h, 0a5h, 83h
        db      0eeh, 08h, 83h, 0efh, 08h, 3bh, 0deh, 75h, 0f1h, 1fh, 5eh, 5bh, 58h, 53h, 0b7h, 00h
        endif
        mov     word ptr [A3_W_012BE], ax
        mov     word ptr [A3_W_012C0], bx
        pop     bx
        mov     cx, word ptr [A3_W_012B6]
        mov     bh, byte ptr [A3_B_012CA]
        if      FW_VERSION >= 110
L_28E9B:
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], bx
        add     ax, word ptr [A3_W_012BC]
        adc     bl, 0
        add     si, 4
        loop    L_28E9B
        mov     ax, word ptr [A3_W_012B8]
        mov     dx, word ptr [A3_W_012BA]
        add     word ptr es:[1ch], ax
        adc     word ptr es:[1eh], dx
        mov     ax, word ptr [A3_W_012B6]
        add     word ptr es:[A3_W_0001A], ax
        call    L_2905D
        mov     ax, word ptr [A3_W_012B0]
        call    fn_30425
        int     83h
L_28ED2:
        cmp     byte ptr es:[si+4], 0ffh
        je      L_28EFC
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        mov     bh, bl
        and     bx, 0f00fh
        add     ax, word ptr [A3_W_012B8]
        adc     bl, byte ptr [A3_W_012BA]
        or      bl, bh
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        call    fn_281FE
        jmp     L_28ED2
L_28EFC:
        mov     es, word ptr [A3_W_00F10]
        mov     word ptr es:[30h], 0
        mov     word ptr es:[32h], 0ffffh
        mov     bl, 15h
        int     87h
        int     0d6h
        mov     ax, word ptr [A3_W_0071A]
        int     0d9h
L_28F19:
        push    cs
        call    goto_main_screen
        call    fn_2B3C5
        retf
L_28F21:
        mov     ax, word ptr [A3_W_012B4]
        sub     ax, word ptr [A3_W_012B2]
        inc     ax
        mov     es, word ptr [A3_W_00F10]
        cmp     ax, word ptr es:[A3_W_0001A]
        jne     L_28F37
        jmp     L_29054
L_28F37:
        mov     di, word ptr [A3_W_012B2]
        shl     di, 2
        add     di, 1500h
        mov     si, word ptr [A3_W_012B4]
        inc     si
        shl     si, 2
        add     si, 1500h
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     dh, 0
        mov     word ptr [A3_W_012C2], ax
        mov     word ptr [A3_W_012C4], dx
        push    word ptr es:[di]
        push    word ptr es:[di+2]
        push    di
        push    ds
        mov     ax, es
        mov     ds, ax
L_28F6B:
        mov     cx, 2
        rep movsw
        cmp     si, 24a0h
        jne     L_28F6B
        pop     ds
        pop     si
        pop     cx
        pop     bx
        mov     ch, 0
        mov     word ptr [A3_W_012C6], bx
        mov     word ptr [A3_W_012C8], cx
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        sub     ax, bx
        sbb     dl, cl
        mov     dh, 0
        mov     word ptr [A3_W_012B8], ax
        mov     word ptr [A3_W_012BA], dx
        mov     bp, word ptr es:[1ch]
        mov     bh, byte ptr es:[1eh]
L_28FA2:
        mov     cx, word ptr es:[si]
        mov     bl, byte ptr es:[si+2]
        sub     word ptr es:[si], ax
        sbb     byte ptr es:[si+2], dl
        cmp     cx, bp
        jne     L_28FB8
        cmp     bh, bl
        je      L_28FBD
L_28FB8:
        add     si, 4
        jmp     L_28FA2
L_28FBD:
        mov     ax, word ptr [A3_W_012B8]
        mov     dx, word ptr [A3_W_012BA]
        sub     word ptr es:[1ch], ax
        sbb     word ptr es:[1eh], dx
        mov     ax, word ptr [A3_W_012B4]
        sub     ax, word ptr [A3_W_012B2]
        inc     ax
        sub     word ptr es:[A3_W_0001A], ax
        call    L_29113
        mov     ax, word ptr [A3_W_012B2]
        call    fn_30425
        int     83h
L_28FE6:
        cmp     byte ptr es:[si+4], 0ffh
        je      L_2902F
        mov     ax, word ptr es:[si]
        mov     dl, byte ptr es:[si+2]
        and     dl, 0fh
        sub     ax, word ptr [A3_W_012C2]
        sbb     dl, byte ptr [A3_W_012C4]
        jae     L_29005
        int     81h
        jmp     L_28FE6
L_29005:
        cmp     byte ptr es:[si+4], 0ffh
        je      L_2902F
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        mov     bh, bl
        and     bx, 0f00fh
        sub     ax, word ptr [A3_W_012B8]
        sbb     bl, byte ptr [A3_W_012BA]
        or      bl, bh
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        call    fn_281FE
        jmp     L_29005
L_2902F:
        mov     es, word ptr [A3_W_00F10]
        mov     word ptr es:[30h], 0
        mov     word ptr es:[32h], 0ffffh
        mov     bl, 15h
        int     87h
        int     0d6h
        mov     ax, word ptr [A3_W_0071A]
        int     0d9h
        push    cs
        call    goto_main_screen
        call    fn_2B3C5
        retf
L_29054:
        push    cs
        call    L_272DD
        push    cs
        call    far_270FB
        retf
L_2905D:
        mov     es, word ptr [A3_W_00F10]
        mov     cx, word ptr es:[14h]
        mov     ax, 0eh
        mul     cx
        add     ax, 700h
        mov     si, ax
        mov     ax, word ptr es:[1ch]
        mov     dx, word ptr es:[1eh]
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
        mov     si, 6f2h
        mov     cx, word ptr es:[14h]
        inc     cx
L_2908A:
        add     si, 0eh
        dec     cx
        jne     L_29091
        ret
L_29091:
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        sub     ax, word ptr [A3_W_012BE]
        sbb     dx, word ptr [A3_W_012C0]
        jb      L_2908A
        mov     ax, word ptr [A3_W_012B8]
        mov     dx, word ptr [A3_W_012BA]
L_290AA:
        add     word ptr es:[si+2], ax
        adc     word ptr es:[si+4], dx
        add     si, 0eh
        dec     cx
        jne     L_290AA
        mov     ax, word ptr [A3_W_012BE]
        or      ax, word ptr [A3_W_012C0]
        je      L_290C2
        ret
L_290C2:
        mov     si, 700h
        cmp     word ptr es:[si], 3e8h
        je      L_29108
        cmp     word ptr es:[14h], 0ffh
        je      L_290DA
        inc     word ptr es:[14h]
L_290DA:
        mov     di, 14ffh
        mov     cx, di
        sub     cx, 700h
        sub     cx, 5
        mov     si, 14f1h
        push    ds
        mov     ax, es
        mov     ds, ax
        cli
        std
        rep movsb
        cld
        sti
        pop     ds
        mov     si, 700h
        mov     word ptr es:[si], 3e8h
        sub     ax, ax
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], ax
        ret
L_29108:
        sub     ax, ax
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], ax
        ret
L_29113:
        mov     es, word ptr [A3_W_00F10]
        mov     cx, word ptr es:[14h]
        mov     ax, 0eh
        mul     cx
        add     ax, 700h
        mov     si, ax
        mov     ax, word ptr es:[1ch]
        mov     dx, word ptr es:[1eh]
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], dx
        call    L_29173
        call    L_291C6
        mov     es, word ptr [A3_W_00F10]
        mov     si, 700h
        mov     cx, word ptr es:[14h]
        dec     cx
        jne     L_2914D
        ret
L_2914D:
        add     si, 0eh
        mov     ax, word ptr es:[si+2]
        or      ax, word ptr es:[si+4]
        je      L_2915B
        ret
L_2915B:
        dec     word ptr es:[14h]
        mov     di, si
        sub     di, 0eh
        mov     cx, 14f2h
        sub     cx, di
        push    ds
        mov     ax, es
        mov     ds, ax
        rep movsb
        pop     ds
        ret
L_29173:
        mov     es, word ptr [A3_W_00F10]
        mov     si, 700h
        mov     cx, word ptr es:[14h]
L_2917F:
        add     si, 0eh
        dec     cx
        jne     L_29186
        ret
L_29186:
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        sub     ax, word ptr [A3_W_012C6]
        sbb     dx, word ptr [A3_W_012C8]
        jb      L_2917F
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        sub     ax, word ptr [A3_W_012C2]
        sbb     dx, word ptr [A3_W_012C4]
        jb      L_291AB
        ret
L_291AB:
        push    si
        dec     word ptr es:[14h]
        mov     di, si
        add     si, 0eh
        mov     cx, 14f2h
        sub     cx, di
        push    ds
        mov     ax, es
        mov     ds, ax
        rep movsb
        pop     ds
        pop     si
        jmp     L_29173
L_291C6:
        mov     es, word ptr [A3_W_00F10]
        mov     si, 700h
        mov     cx, word ptr es:[14h]
L_291D2:
        add     si, 0eh
        dec     cx
        jne     L_291D9
        ret
L_291D9:
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        sub     ax, word ptr [A3_W_012C6]
        sbb     dx, word ptr [A3_W_012C8]
        jb      L_291D2
        mov     ax, word ptr [A3_W_012B8]
        mov     dx, word ptr [A3_W_012BA]
L_291F2:
        sub     word ptr es:[si+2], ax
        sbb     word ptr es:[si+4], dx
        add     si, 0eh
        dec     cx
        jne     L_291F2
        ret
L_290E4:
L_299D1:
        call    fn_280BD
        je      L_29207
        retf
L_29207:
        db      0e8h, 49h, 02h
        int     0a4h
        int     57h
        sub     ax, ax
        mov     word ptr [A3_W_0154D], ax
        mov     byte ptr [A3_B_0154F], al
        mov     byte ptr [A3_B_01550], al
        mov     byte ptr [A3_B_01553], al
        mov     byte ptr [A3_B_01554], al
        call    fn_2B3C5
        callf   [A3_W_012CB]
        retf
        else
        db      26h, 89h, 04h, 26h, 89h, 5ch, 02h, 03h, 06h, 0bch, 12h, 80h, 0d3h, 00h, 83h, 0c6h
        db      04h, 0e2h, 0edh, 0a1h, 0b8h, 12h, 8bh, 16h, 0bah, 12h, 26h, 01h, 06h, 1ch, 00h, 26h
        db      11h, 16h, 1eh, 00h, 0a1h, 0b6h, 12h, 26h, 01h, 06h, 1ah, 00h, 0e8h, 89h, 01h, 0a1h
        db      0b0h, 12h, 0e8h, 72h, 6dh, 0cdh, 83h, 26h, 80h, 7ch, 04h, 0ffh, 74h, 23h, 26h, 8bh
        db      04h, 26h, 8bh, 5ch, 02h, 8ah, 0fbh, 81h, 0e3h, 0fh, 0f0h, 03h, 06h, 0b8h, 12h, 12h
        db      1eh, 0bah, 12h, 0ah, 0dfh, 26h, 89h, 04h, 26h, 88h, 5ch, 02h, 0e8h, 43h, 0ebh, 0ebh
        db      0d6h, 8eh, 06h, 10h, 0fh, 26h, 0c7h, 06h, 30h, 00h, 00h, 00h, 26h, 0c7h, 06h, 32h
        db      00h, 0ffh, 0ffh, 0b3h, 15h, 0cdh, 87h, 0cdh, 0d6h, 0eh, 0e8h, 6dh, 0d1h, 0e8h, 0ceh, 1ch
        db      0cbh
L_28F21:
        db      0a1h, 0b4h, 12h, 2bh, 06h, 0b2h, 12h, 40h, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h
        db      1ah, 00h, 75h, 03h, 0e9h, 18h, 01h, 8bh, 3eh, 0b2h, 12h, 0c1h, 0e7h, 02h, 81h, 0c7h
        db      00h, 15h, 8bh, 36h, 0b4h, 12h, 46h, 0c1h, 0e6h, 02h, 81h, 0c6h, 00h, 15h, 26h, 8bh
        db      04h, 26h, 8bh, 54h, 02h, 0b6h, 00h, 0a3h, 0c2h, 12h, 89h, 16h, 0c4h, 12h, 26h, 0ffh
        db      35h, 26h, 0ffh, 75h, 02h, 57h, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0b9h, 02h, 00h, 0f3h, 0a5h
        db      81h, 0feh, 0a0h, 24h, 75h, 0f5h, 1fh, 5eh, 59h, 5bh, 0b5h, 00h, 89h, 1eh, 0c6h, 12h
        db      89h, 0eh, 0c8h, 12h, 26h, 8bh, 04h, 26h, 8bh, 54h, 02h, 2bh, 0c3h, 1ah, 0d1h, 0b6h
        db      00h, 0a3h, 0b8h, 12h, 89h, 16h, 0bah, 12h, 26h, 8bh, 2eh, 1ch, 00h, 26h, 8ah, 3eh
        db      1eh, 00h, 26h, 8bh, 0ch, 26h, 8ah, 5ch, 02h, 26h, 29h, 04h, 26h, 18h, 54h, 02h
        db      3bh, 0cdh, 75h, 04h, 3ah, 0fbh, 74h, 05h, 83h, 0c6h, 04h, 0ebh, 0e5h, 0a1h, 0b8h, 12h
        db      8bh, 16h, 0bah, 12h, 26h, 29h, 06h, 1ch, 00h, 26h, 19h, 16h, 1eh, 00h, 0a1h, 0b4h
        db      12h, 2bh, 06h, 0b2h, 12h, 40h, 26h, 29h, 06h, 1ah, 00h, 0e8h, 30h, 01h, 0a1h, 0b2h
        db      12h, 0e8h, 63h, 6ch, 0cdh, 83h, 26h, 80h, 7ch, 04h, 0ffh, 74h, 42h, 26h, 8bh, 04h
        db      26h, 8ah, 54h, 02h, 80h, 0e2h, 0fh, 2bh, 06h, 0c2h, 12h, 1ah, 16h, 0c4h, 12h, 73h
        db      04h, 0cdh, 81h, 0ebh, 0e1h, 26h, 80h, 7ch, 04h, 0ffh, 74h, 23h, 26h, 8bh, 04h, 26h
        db      8bh, 5ch, 02h, 8ah, 0fbh, 81h, 0e3h, 0fh, 0f0h, 2bh, 06h, 0b8h, 12h, 1ah, 1eh, 0bah
        db      12h, 0ah, 0dfh, 26h, 89h, 04h, 26h, 88h, 5ch, 02h, 0e8h, 15h, 0eah, 0ebh, 0d6h, 8eh
        db      06h, 10h, 0fh, 26h, 0c7h, 06h, 30h, 00h, 00h, 00h, 26h, 0c7h, 06h, 32h, 00h, 0ffh
        db      0ffh, 0b3h, 15h, 0cdh, 87h, 0cdh, 0d6h, 0eh, 0e8h, 3fh, 0d0h, 0e8h, 0a0h, 1bh, 0cbh, 0eh
        db      0e8h, 9eh, 0e2h, 0eh, 0e8h, 04h, 0d9h, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 8bh, 0eh, 14h
        db      00h, 0b8h, 0eh, 00h, 0f7h, 0e1h, 05h, 00h, 07h, 8bh, 0f0h, 26h, 0a1h, 1ch, 00h, 26h
        db      8bh, 16h, 1eh, 00h, 26h, 89h, 44h, 02h, 26h, 89h, 54h, 04h, 0beh, 0f2h, 06h, 26h
        db      8bh, 0eh, 14h, 00h, 41h, 83h, 0c6h, 0eh, 49h, 75h, 01h, 0c3h, 26h, 8bh, 44h, 02h
        db      26h, 8bh, 54h, 04h, 2bh, 06h, 0beh, 12h, 1bh, 16h, 0c0h, 12h, 72h, 0e7h, 0a1h, 0b8h
        db      12h, 8bh, 16h, 0bah, 12h, 26h, 01h, 44h, 02h, 26h, 11h, 54h, 04h, 83h, 0c6h, 0eh
        db      49h, 75h, 0f2h, 0a1h, 0beh, 12h, 0bh, 06h, 0c0h, 12h, 74h, 01h, 0c3h, 0beh, 00h, 07h
        db      26h, 81h, 3ch, 0e8h, 03h, 74h, 3ch, 26h, 81h, 3eh, 14h, 00h, 0ffh, 00h, 74h, 05h
        db      26h, 0ffh, 06h, 14h, 00h, 0bfh, 0ffh, 14h, 8bh, 0cfh, 81h, 0e9h, 00h, 07h, 83h, 0e9h
        db      05h, 0beh, 0f1h, 14h, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0fah, 0fdh, 0f3h, 0a4h, 0fch, 0fbh, 1fh
        db      0beh, 00h, 07h, 26h, 0c7h, 04h, 0e8h, 03h, 2bh, 0c0h, 26h, 89h, 44h, 02h, 26h, 89h
        db      44h, 04h, 0c3h, 2bh, 0c0h, 26h, 89h, 44h, 02h, 26h, 89h, 44h, 04h, 0c3h, 8eh, 06h
        db      10h, 0fh, 26h, 8bh, 0eh, 14h, 00h, 0b8h, 0eh, 00h, 0f7h, 0e1h, 05h, 00h, 07h, 8bh
        db      0f0h, 26h, 0a1h, 1ch, 00h, 26h, 8bh, 16h, 1eh, 00h, 26h, 89h, 44h, 02h, 26h, 89h
        db      54h, 04h, 0e8h, 39h, 00h, 0e8h, 89h, 00h, 8eh, 06h, 10h, 0fh, 0beh, 00h, 07h, 26h
        db      8bh, 0eh, 14h, 00h, 49h, 75h, 01h, 0c3h, 83h, 0c6h, 0eh, 26h, 8bh, 44h, 02h, 26h
        db      0bh, 44h, 04h, 74h, 01h, 0c3h, 26h, 0ffh, 0eh, 14h, 00h, 8bh, 0feh, 83h, 0efh, 0eh
        db      0b9h, 0f2h, 14h, 2bh, 0cfh, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0f3h, 0a4h, 1fh, 0c3h, 8eh, 06h
        db      10h, 0fh, 0beh, 00h, 07h, 26h, 8bh, 0eh, 14h, 00h, 83h, 0c6h, 0eh, 49h, 75h, 01h
        db      0c3h, 26h, 8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 2bh, 06h, 0c6h, 12h, 1bh, 16h, 0c8h
        db      12h, 72h, 0e7h, 26h, 8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 2bh, 06h, 0c2h, 12h, 1bh
        db      16h, 0c4h, 12h, 72h, 01h, 0c3h, 56h, 26h, 0ffh, 0eh, 14h, 00h, 8bh, 0feh, 83h, 0c6h
        db      0eh, 0b9h, 0f2h, 14h, 2bh, 0cfh, 1eh, 8ch, 0c0h, 8eh, 0d8h, 0f3h, 0a4h, 1fh, 5eh, 0ebh
        db      0adh, 8eh, 06h, 10h, 0fh, 0beh, 00h, 07h, 26h, 8bh, 0eh, 14h, 00h, 83h, 0c6h, 0eh
        db      49h, 75h, 01h, 0c3h, 26h, 8bh, 44h, 02h, 26h, 8bh, 54h, 04h, 2bh, 06h, 0c6h, 12h
        db      1bh, 16h, 0c8h, 12h, 72h, 0e7h, 0a1h, 0b8h, 12h, 8bh, 16h, 0bah, 12h, 26h, 29h, 44h
L_290E4                         equ     $+0ch
        db      02h, 26h, 19h, 54h, 04h, 83h, 0c6h, 0eh, 49h, 75h, 0f2h, 0c3h, 0e8h, 02h, 0e7h, 74h
        db      01h, 0cbh, 0e8h, 47h, 02h, 0cdh, 0a4h, 2bh, 0c0h, 0a3h, 4dh, 15h, 0a2h, 4fh, 15h, 0a2h
        db      50h, 15h, 0a2h, 53h, 15h, 0a2h, 54h, 15h, 0e8h, 0d3h, 19h, 0ffh, 1eh, 0cbh, 12h, 0cbh
        endif
        endif
fn_299F7:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [A3_W_012CB], si
        int     0a4h
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+L_29D01-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        20h, (APP3_BASE+L_29A33-APP3_SEG*16), APP3_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        21h, (APP3_BASE+L_2B3A1-APP3_SEG*16), APP3_SEG
        ret
L_29A33:
        DISP_WIN_WIDE   "Timing Correct"
        DISP_HDOTS      15h, 14h, 0ceh
        DISP_HDOTS      15h, 1eh, 0ceh
        DISP_TEXT       1ah, 0ch, "Note value:             "
        DISP_TEXT       1ah, 16h, "Shift timing:           amount:  "
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        db      80h, 3eh, 17h
        pop     es
        add     byte ptr [si+0bh], dh
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        db      8ch, 0dah
        DISP_TEXT_IDX   5ch, 0ch, 00717h, 00f31h
        DISP_TEXT       0aah, 0ch, "         "
        cmp     byte ptr [A3_B_00717], 1
        jne     L_29AD9
        call    L_29AF9
L_29AD9:
        cmp     byte ptr [A3_B_00717], 3
        jne     L_29AE3
        call    L_29AF9
L_29AE3:
        call    L_29B1D
        mov     cl, 1ah
        mov     ch, 20h
        call    fn_28115
        mov     cl, 1ah
        mov     ch, 28h
        call    fn_2815E
        call    word ptr [A3_W_012CF]
        retf
L_29AF9:
        DISP_TEXT       0aah, 0ch, "Swing%:  "
        mov     al, byte ptr [A3_B_00722]
        add     al, 32h
        DISP_NUM        0d5h, 0ch, 02h
        ret
cb_29B14:
        DISP_CURSOR     0d5h, 0ch, 0dh
        ret
L_29B1D:
        mov     dx, ds
        DISP_TEXT_IDX   68h, 16h, 00723h, 012dah
        db      0e8h
        test    word ptr [bx+si], 24a2h
        pop     es
        DISP_NUM        0d5h, 16h, 02h
        db      0c3h
cb_29B36:
        DISP_CURSOR     68h, 16h, 2bh
        ret
cb_29B3F:
        DISP_CURSOR     0d5h, 16h, 0dh
        ret
cb_29B48:
        DISP_CURSOR     5ch, 0ch, 2bh
        ret
cb_29B51:
        ret
cb_29B52:
        DISP_CURSOR     3eh, 28h, 25h
        ret
L_2938B:
        call    fn_299F7
        mov     word ptr [A3_W_012CF], cb_29B48-APP3_CSBASE
        FIELD_WHEEL     ds, 717h, 0, 0, 6, field_cb_none-APP3_CSBASE
        if      FW_VERSION >= 111
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29B88-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29BC9-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29B88-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_292DC-APP3_SEG*16), APP3_SEG
        endif
        retf
L_29B88:
        cmp     byte ptr [A3_B_00717], 1
        jne     L_29B91
        jmp     SHORT L_293CC
L_29B91:
        cmp     byte ptr [A3_B_00717], 3
        jne     L_293CA
        jmp     SHORT L_293CC
L_293CA:
        jmp     SHORT L_29426
L_293CC:
        call    fn_299F7
        mov     word ptr [A3_W_012CF], cb_29B14-APP3_CSBASE
        FIELD_ENTRY     ds, 722h, 0, 0, 19h, field_cb_none-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_2938B-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_29426-APP3_SEG*16), APP3_SEG
        retf
        if      FW_VERSION >= 111
L_29BC9:
        else
L_292DC:
        endif
        call    fn_299F7
        mov     word ptr [A3_W_012CF], cb_29B36-APP3_CSBASE
        FIELD_ENTRY     ds, 723h, 0, 0, 1, field_cb_none-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_29484-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29426-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2938B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29484-APP3_SEG*16), APP3_SEG
        retf
L_29426:
        if      FW_VERSION = 107
L_29BC9:
        endif
        call    fn_299F7
        mov     word ptr [A3_W_012CF], cb_29B3F-APP3_CSBASE
        FIELD_ENTRY     ds, 724h, 0, 0, 63h, field_cb_none-APP3_CSBASE
        if      FW_VERSION >= 111
        KEY_CURSOR      (APP3_BASE+L_29BC9-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29C3D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29C77-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+L_292DC-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29C3D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29C77-APP3_SEG*16), APP3_SEG
        endif
        retf
L_29C23:
        call    L_29C30
        cmp     al, ah
        jb      L_2945F
        mov     al, ah
        mov     byte ptr [A3_B_00724], al
L_2945F:
        ret
L_29C30:
        mov     al, byte ptr [A3_B_00717]
        mov     bx, 12d3h
        xlat
        mov     ah, al
        mov     al, byte ptr [A3_B_00724]
        ret
L_29C3D:
        cmp     byte ptr [A3_B_00717], 1
        jne     br_29C47
        jmp     L_293CC
br_29C47:
        cmp     byte ptr [A3_B_00717], 3
        jne     br_29C51
        jmp     L_293CC
br_29C51:
        jmp     L_2938B
L_29484:
        call    fn_299F7
        mov     word ptr [A3_W_012CF], cb_29B51-APP3_CSBASE
        if      FW_VERSION >= 111
        mov     ax, 3419h
        mov     bx, 34eah
        mov     bp, 3446h
        mov     dx, 352eh
        elseif  FW_VERSION >= 110
        mov     ax, 340ch
        mov     bx, 34ddh
        mov     bp, 3439h
        mov     dx, 3521h
        else
        mov     ax, 33e2h
        mov     bx, 34b3h
        mov     bp, 340fh
        mov     dx, 34f7h
        endif
        mov     di, br_29D00-APP3_CSBASE
        if      FW_VERSION >= 111
        mov     si, 3283h
        elseif  FW_VERSION >= 110
        mov     si, 3276h
        else
        mov     si, 324ch
        endif
        mov     cl, 3eh
        mov     ch, 20h
        call    fn_2ABF2
        retf
L_29C77:
        call    fn_299F7
        mov     word ptr [A3_W_012CF], cb_29B51-APP3_CSBASE
        if      FW_VERSION >= 111
        mov     ax, 3419h
        mov     bx, 34eah
        mov     bp, 3446h
        mov     dx, 352eh
        elseif  FW_VERSION >= 110
        mov     ax, 340ch
        mov     bx, 34ddh
        mov     bp, 3439h
        mov     dx, 3521h
        else
        mov     ax, 33e2h
        mov     bx, 34b3h
        mov     bp, 340fh
        mov     dx, 34f7h
        endif
        mov     di, br_29D00-APP3_CSBASE
        if      FW_VERSION >= 111
        mov     si, 3283h
        elseif  FW_VERSION >= 110
        mov     si, 3276h
        else
        mov     si, 324ch
        endif
        mov     cl, 3eh
        mov     ch, 20h
        call    fn_2AC05
        retf
        call    fn_299F7
        mov     word ptr [A3_W_012CF], cb_29B51-APP3_CSBASE
        call    fn_280CB
        jne     loop_29CC2
        if      FW_VERSION >= 111
        mov     ax, 34a4h
        mov     bx, 3550h
        mov     bp, 34c7h
        mov     dx, 3550h
        elseif  FW_VERSION >= 110
        mov     ax, 3497h
        mov     bx, 3543h
        mov     bp, 34bah
        mov     dx, 3543h
        else
        mov     ax, 346dh
        mov     bx, 3519h
        mov     bp, 3490h
        mov     dx, 3519h
        endif
        mov     di, br_29D00-APP3_CSBASE
        if      FW_VERSION >= 111
        mov     si, 3283h
        elseif  FW_VERSION >= 110
        mov     si, 3276h
        else
        mov     si, 324ch
        endif
        mov     cl, 3eh
        mov     ch, 28h
        call    fn_2B21A
        retf
loop_29CC2:
        mov     word ptr [A3_W_012CF], cb_29B52-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_29484-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        call    fn_2B2E2
        retf
        call    fn_299F7
        call    fn_280CB
        jne     loop_29CC2
        if      FW_VERSION >= 111
        mov     ax, 34a4h
        mov     bx, 3550h
        mov     bp, 34c7h
        mov     dx, 3550h
        elseif  FW_VERSION >= 110
        mov     ax, 3497h
        mov     bx, 3543h
        mov     bp, 34bah
        mov     dx, 3543h
        else
        mov     ax, 346dh
        mov     bx, 3519h
        mov     bp, 3490h
        mov     dx, 3519h
        endif
        mov     di, br_29D00-APP3_CSBASE
        if      FW_VERSION >= 111
        mov     si, 3283h
        elseif  FW_VERSION >= 110
        mov     si, 3276h
        else
        mov     si, 324ch
        endif
        mov     cl, 3dh
        mov     ch, 28h
        call    fn_2B27E
        retf
br_29D00:
        retf
L_29D01:
        int     0ach
        call    C0_BASE+L_32B1C-SEGBASE
        call    fn_280CB
        je      br_29D22
        mov     al, 0
        mov     ah, 7fh
        cmp     byte ptr [A3_B_01579], 41h
        je      br_29D1B
        mov     al, byte ptr [A3_B_0157A]
        mov     ah, al
br_29D1B:
        mov     byte ptr [A3_B_01577], al
        mov     byte ptr [A3_B_01578], ah
br_29D22:
        cmp     byte ptr [A3_B_00717], 0
        jne     br_29D2A
        retf
br_29D2A:
        int     0b4h
        int     85h
        push    ax
        push    dx
        call    fn_2B32D
        call    fn_2B36F
        mov     bl, byte ptr [A3_B_01577]
        mov     bh, byte ptr [A3_B_01578]
        int     0c6h
        int     0d6h
        pop     dx
        pop     ax
        mov     bl, 0ah
        int     87h
        DISP_PLANE0
        int     0a5h
        push    cs
        call    goto_main_screen
        retf
L_29D52:
        call    fn_280BD
        je      br_29D58
        retf
br_29D58:
        callf   [A3_FP_012E9]
        retf
fn_29D5D:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [A3_FP_012E9], si
        int     0a4h
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, EP_L_29F72_OFF, APP3_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        02h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 111
        KEY_DOWN        20h, (APP3_BASE+L_29D99-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        20h, EP_L_294AC_OFF, APP3_SEG
        endif
        ret
L_29D99:
        DISP_WIN_WIDE   "Count/Metronome"
        DISP_TEXT       1ch, 0eh, "  Count IN:          In play:"
        DISP_TEXT       2eh, 18h, "   Rate:          In rec :"
        DISP_TEXT       16h, 2ah, " Wait for key:"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "SOUND"
        DISP_HDOTS      18h, 25h, 0c8h
        mov     si, 17h
        DISP_BMP        18h, 0fh, 17h
        mov     dx, ds
        DISP_TEXT_IDX   5eh, 0eh, 00726h, 012f5h
        mov     al, byte ptr [A3_B_00729]
        mov     cl, 0cah
        mov     ch, 0eh
        call    fn_26E05
        mov     al, byte ptr [A3_B_0072A]
        mov     cl, 0cah
        mov     ch, 18h
        call    fn_26E05
        mov     al, byte ptr [A3_B_0072C]
        mov     cl, 6ah
        mov     ch, 2ah
        call    fn_26D9C
        mov     dx, ds
        DISP_TEXT_IDX   5eh, 18h, 00728h, 0130eh
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        db      0ffh
        push    ss
        in      ax, dx
        adc     cl, bl
        DISP_CURSOR     5eh, 0eh, 31h
        ret
        DISP_CURSOR     0cah, 0eh, 13h
        ret
        DISP_CURSOR     0cah, 18h, 13h
        ret
        DISP_CURSOR     5eh, 18h, 2bh
        ret
        DISP_CURSOR     6ah, 2ah, 13h
        ret
L_29E91:
        call    fn_29D5D
        mov     word ptr [A3_W_012ED], 36b4h
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_296EE-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29748-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 726h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 2
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        retf
L_296EE:
        call    fn_29D5D
        mov     word ptr [A3_W_012ED], 36bdh
        KEY_CURSOR      (APP3_BASE+L_29E91-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29748-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2971B-APP3_SEG*16), APP3_SEG
        FIELD_WHEEL     ds, 729h, 0, 0, 1, field_cb_none-APP3_CSBASE
        retf
L_2971B:
        call    fn_29D5D
        db      0c7h, 06h, 0edh, 12h, 0c6h
        db      36h
        KEY_CURSOR      (APP3_BASE+L_29748-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29775-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_296EE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29775-APP3_SEG*16), APP3_SEG
        FIELD_WHEEL     ds, 72ah, 0, 0, 1, field_cb_none-APP3_CSBASE
        retf
L_29748:
        call    fn_29D5D
        db      0c7h, 06h, 0edh, 12h, 0cfh, 36h
        KEY_CURSOR      (APP3_BASE+L_296EE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2971B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29E91-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29775-APP3_SEG*16), APP3_SEG
        FIELD_WHEEL     ds, 728h, 0, 0, 7, field_cb_none-APP3_CSBASE
        retf
L_29775:
        call    fn_29D5D
        db      0c7h, 06h, 0edh, 12h, 0d8h
        db      36h
        KEY_CURSOR      (APP3_BASE+L_2971B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2971B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29748-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        FIELD_WHEEL     ds, 72ch, 0, 0, 1, field_cb_none-APP3_CSBASE
        retf
L_29F72:
        callf   [A3_W_012EF]
        retf
far_29F77:
        mov     word ptr [A3_W_012EF], far_29F77-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A046-APP3_CSBASE
        call    fn_29FA0
        elseif  FW_VERSION >= 114
        db      0ffh, 16h, 0edh, 12h, 0cbh, 0b1h, 5eh, 0b5h, 0eh, 0b0h, 31h
        db      0cdh, 0b0h, 0c3h, 0b1h, 0cah, 0b5h, 0eh, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 0cah, 0b5h, 18h
        db      0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 5eh, 0b5h, 18h, 0b0h, 2bh, 0cdh, 0b0h, 0c3h, 0b1h, 6ah
        db      0b5h, 2ah, 0b0h, 13h, 0cdh, 0b0h, 0c3h
L_298B1:
        db      0e8h, 0c9h, 0feh, 0c7h, 06h, 0edh, 12h, 0b4h, 36h
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_298DE-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29938-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 26h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 02h, 00h, 0bfh, 0dch
        db      18h, 0cdh, 7dh, 0cbh
L_298DE:
        db      0e8h, 9ch, 0feh, 0c7h, 06h, 0edh, 12h, 0bdh, 36h
        KEY_CURSOR      (APP3_BASE+L_298B1-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29938-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2990B-APP3_SEG*16), APP3_SEG
        db      8ch
        db      0d9h, 0beh, 29h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        db      0cbh
L_2990B:
        db      0e8h, 6fh, 0feh, 0c7h, 06h, 0edh, 12h, 0c6h, 36h
        KEY_CURSOR      (APP3_BASE+L_29938-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29965-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_298DE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29965-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 2ah
        db      07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh, 0cbh
L_29938:
        db      0e8h, 42h
        db      0feh, 0c7h, 06h, 0edh, 12h, 0cfh, 36h
        KEY_CURSOR      (APP3_BASE+L_298DE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2990B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_298B1-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29965-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 28h, 07h, 0b3h, 00h
        db      0b7h, 00h, 0bah, 07h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh, 0cbh
L_29965:
        db      0e8h, 15h, 0feh, 0c7h, 06h
        db      0edh, 12h, 0d8h, 36h
        KEY_CURSOR      (APP3_BASE+L_2990B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2990B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29938-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 2ch, 07h, 0b3h, 00h, 0b7h, 00h, 0bah
        db      01h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh, 0cbh
L_29F72:
        db      0ffh, 1eh, 0efh, 12h, 0cbh
far_29F77:
        db      0c7h, 06h, 0efh
        db      12h, 0c7h, 37h, 0c7h, 06h, 0f3h, 12h, 96h, 38h, 0e8h, 1ah, 00h
        else
        db      0ffh
        push    ss
        in      ax, dx
        adc     cl, bl
        DISP_CURSOR     5eh, 0eh, 31h
        ret
        DISP_CURSOR     0cah, 0eh, 13h
        ret
        DISP_CURSOR     0cah, 18h, 13h
        ret
        DISP_CURSOR     5eh, 18h, 2bh
        ret
        DISP_CURSOR     6ah, 2ah, 13h
        ret
L_29E91:
        call    fn_29D5D
        if      FW_VERSION >= 111
        mov     word ptr [A3_W_012ED], 36b4h
        else
        mov     word ptr [A3_W_012ED], 36a7h
        endif
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_296EE-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29748-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 726h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 2
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        retf
L_296EE:
        call    fn_29D5D
        if      FW_VERSION >= 111
        mov     word ptr [A3_W_012ED], 36bdh
        else
        mov     word ptr [A3_W_012ED], 36b0h
        endif
        KEY_CURSOR      (APP3_BASE+L_29E91-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29748-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2971B-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 729h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        retf
L_2971B:
        if      FW_VERSION >= 111
        call    fn_29D5D
        mov     word ptr [A3_W_012ED], 36c6h
        else
        db      0e8h, 6fh, 0feh, 0c7h, 06h, 0edh, 12h, 0b9h, 36h
        endif
        KEY_CURSOR      (APP3_BASE+L_29748-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29775-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_296EE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29775-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h
        mov     si, 72ah
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        retf
L_29748:
        if      FW_VERSION >= 111
        call    fn_29D5D
        mov     word ptr [A3_W_012ED], 36cfh
        else
        db      0e8h, 42h, 0feh, 0c7h, 06h, 0edh, 12h, 0c2h, 36h
        endif
        KEY_CURSOR      (APP3_BASE+L_296EE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2971B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29E91-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29775-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h
        mov     si, 728h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        retf
L_29775:
        call    fn_29D5D
        if      FW_VERSION >= 111
        mov     word ptr [A3_W_012ED], 36d8h
        else
        mov     word ptr [A3_W_012ED], 36cbh
        endif
        KEY_CURSOR      (APP3_BASE+L_2971B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2971B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29748-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        FIELD_WHEEL     ds, 72ch, 0, 0, 1, field_cb_none-APP3_CSBASE
        retf
L_29F72:
        callf   [A3_W_012EF]
        retf
far_29F77:
        mov     word ptr [A3_W_012EF], far_29F77-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A046-APP3_CSBASE
        call    fn_29FA0
        endif
        KEY_DOWN        1ah, (APP3_BASE+L_2A061-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 72dh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 4
        mov     di, intcb_29FC3-APP3_CSBASE
        int     7dh
        retf
fn_29FA0:
        int     0a4h
        KEY_DOWN        13h, EP_L_29D52_OFF, EP_L_29D52_SEG
        else
        db      0ffh, 16h, 0edh, 12h, 0cbh, 0b1h, 5eh, 0b5h
        db      0eh, 0b0h, 31h, 0cdh, 0b0h, 0c3h, 0b1h, 0cah, 0b5h, 0eh, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h
        db      0cah, 0b5h, 18h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 5eh, 0b5h, 18h, 0b0h, 2bh, 0cdh, 0b0h
L_29E91                         equ     $+0ah
        db      0c3h, 0b1h, 6ah, 0b5h, 2ah, 0b0h, 13h, 0cdh, 0b0h, 0c3h
L_2906A:
        db      0e8h, 0c9h, 0feh, 0c7h, 06h, 0edh
        db      12h, 7dh
d_a3_w_07412:
        db      36h
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29097-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2990B-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 26h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 02h
        db      00h, 0bfh, 0c0h, 18h, 0cdh, 7dh, 0cbh
L_29097:
        db      0e8h, 9ch, 0feh, 0c7h, 06h, 0edh, 12h, 86h, 36h
        KEY_CURSOR      (APP3_BASE+L_2906A-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2990B-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_298DE-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 29h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0c0h
        db      18h, 0cdh, 7dh, 0cbh
L_298DE:
        db      0e8h, 6fh, 0feh, 0c7h, 06h, 0edh, 12h, 8fh, 36h
        KEY_CURSOR      (APP3_BASE+L_2990B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2911E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29097-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2911E-APP3_SEG*16), APP3_SEG
        db      8ch
        db      0d9h, 0beh, 2ah, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        db      0cbh
L_2990B:
        db      0e8h, 42h, 0feh, 0c7h, 06h, 0edh, 12h, 98h, 36h
        KEY_CURSOR      (APP3_BASE+L_29097-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_298DE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2906A-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2911E-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 28h
        db      07h, 0b3h, 00h, 0b7h, 00h, 0bah, 07h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh, 0cbh
L_2911E:
        db      0e8h, 15h
        db      0feh, 0c7h, 06h, 0edh, 12h, 0a1h, 36h
        KEY_CURSOR      (APP3_BASE+L_298DE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_298DE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2990B-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 2ch, 07h, 0b3h, 00h
        db      0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh, 0cbh
L_29F72:
        db      0ffh, 1eh, 0efh, 12h, 0cbh
FAR_29F77:
        db      0c7h, 06h, 0efh, 12h, 90h, 37h, 0c7h, 06h, 0f3h, 12h, 5fh, 38h, 0e8h, 1ah, 00h
        KEY_DOWN        1ah, (APP3_BASE+L_2A061-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 2dh, 07h, 0b3h, 00h, 0b7h, 00h
        db      0bah, 04h, 00h, 0bfh, 0dch, 37h, 0cdh, 7dh, 0cbh, 0cdh, 0a4h
        KEY_DOWN        13h, EP_L_29D52_OFF, APP3_SEG
        endif
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 111
        KEY_DOWN        20h, (APP3_BASE+L_29FCC-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        20h, EP_L_296DF_OFF, APP3_SEG
        endif
        if      FW_VERSION >= 120
        ret
intcb_29FC3:
        cmp     al, 0
        je      L_29FCB
        push    cs
        call    far_2A0C3
L_29FCB:
        retf
L_29FCC:
        DISP_WIN_NARROW "Metronome Sound"
        mov     si, 17h
        else
        db      0c3h
intcb_29FC3:
        if      (FW_VERSION >= 110) && (FW_VERSION < 114)
        db      3ch
        add     byte ptr [si+4], dh
        push    cs
        call    far_2A0C3
L_29FCB:
        retf
        else
        db      3ch, 00h, 74h, 04h, 0eh, 0e8h, 0f8h
        db      00h, 0cbh
        endif
L_29FCC:
        DISP_WIN_NARROW "Metronome Sound"
        db      0beh, 17h, 00h
        endif
        DISP_BMP        0a4h, 14h, 17h
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_TEXT       28h, 0ch, "Sound:"
        DISP_TEXT       28h, 18h, "  Volume:"
        DISP_TEXT       28h, 22h, "  Output:"
        db      8ch, 0dah
        DISP_TEXT_IDX   4eh, 0ch, 0072dh, 0137eh
        db      0a0h, 27h, 07h
        sub     ah, ah
        DISP_NUM        5eh, 18h, 03h
        db      8ch, 0dah
        DISP_TEXT_IDX   5eh, 22h, 0072bh, 01347h
        if      FW_VERSION >= 110
        if      FW_VERSION <> 114
        db      0ffh
        push    ss
        db      0f3h, 12h, 0cbh
cb_2A046:
        mov     cl, 4eh
        mov     ch, 0ch
        mov     al, 1fh
        int     0b0h
        ret
cb_2A04F:
        db      0b1h, 5eh, 0b5h, 18h, 0b0h, 13h, 0cdh, 0b0h
        ret
cb_2A058:
        db      0b1h, 5eh, 0b5h, 22h, 0b0h
        and     ax, 0b0cdh
        ret
L_2A061:
        mov     word ptr [A3_W_012EF], L_2A061-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A04F-APP3_CSBASE
        call    fn_29FA0
        KEY_DOWN        19h, EP_FAR_29F77_OFF, APP3_SEG
        else
        db      0ffh, 16h, 0f3h, 12h, 0cbh, 0b1h, 4eh, 0b5h, 0ch
        db      0b0h, 1fh, 0cdh, 0b0h, 0c3h
cb_2A04F:
        db      0b1h, 5eh, 0b5h, 18h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 5eh
        db      0b5h, 22h, 0b0h, 25h, 0cdh, 0b0h, 0c3h
L_2A061:
        mov     word ptr [A3_W_012EF], L_2A061-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A04F-APP3_CSBASE
        db      0e8h, 30h, 0ffh
        KEY_DOWN        19h, (APP3_BASE+far_29F77-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        1ah, (APP3_BASE+L_2A092-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 120
        mov     cx, ds
        mov     si, 727h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 64h
        mov     di, intcb_2808C-APP3_CSBASE
        int     7eh
        retf
L_2A092:
        mov     word ptr [A3_W_012EF], L_2A092-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A058-APP3_CSBASE
        call    fn_29FA0
        elseif  FW_VERSION >= 114
        db      8ch, 0d9h, 0beh, 27h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah
        db      64h, 00h, 0bfh, 0dch, 18h, 0cdh, 7eh, 0cbh
L_2A092:
        db      0c7h, 06h, 0efh, 12h, 0e2h, 38h, 0c7h, 06h
        db      0f3h, 12h, 0a8h, 38h, 0e8h, 0ffh, 0feh
        else
        db      8ch, 0d9h
        mov     si, 727h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 64h
        mov     di, intcb_2808C-APP3_CSBASE
        int     7eh
        retf
L_2A092:
        mov     word ptr [A3_W_012EF], L_2A092-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A058-APP3_CSBASE
        call    fn_29FA0
        endif
        KEY_DOWN        19h, (APP3_BASE+L_2A061-APP3_SEG*16), APP3_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        else
        db      0ffh
        push    ss
        db      0f3h, 12h, 0cbh
cb_2A046:
        mov     cl, 4eh
        mov     ch, 0ch
        mov     al, 1fh
        int     0b0h
        ret
        db      0b1h, 5eh, 0b5h, 18h, 0b0h, 13h, 0cdh, 0b0h
L_2A092                         equ     $+0ah
        db      0c3h, 0b1h, 5eh, 0b5h, 22h, 0b0h, 25h, 0cdh, 0b0h, 0c3h
L_2A061:
        db      0c7h, 06h, 0efh, 12h, 7ah, 38h
        db      0c7h, 06h, 0f3h, 12h, 68h, 38h, 0e8h, 30h, 0ffh
        KEY_DOWN        19h, (APP3_BASE+FAR_29F77-APP3_SEG*16), APP3_SEG
        KEY_DOWN        1ah, (APP3_BASE+L_2926B-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 27h, 07h, 0b3h, 00h
        db      0b7h, 00h, 0bah, 64h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7eh, 0cbh
L_2926B:
        db      0c7h, 06h, 0efh, 12h, 0abh
        db      38h, 0c7h, 06h, 0f3h, 12h, 71h, 38h, 0e8h, 0ffh, 0feh
        KEY_DOWN        19h, EP_L_297A5_OFF, APP3_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 2bh, 07h, 0b3h
        db      00h, 0b7h, 00h, 0bah, 08h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh, 0cbh
L_2929C:
        db      0c7h, 06h, 0efh, 12h
        db      0dch, 38h, 0c7h, 06h, 0f3h, 12h, 5fh, 38h, 0e8h, 24h, 00h
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29CC3-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_293F2-APP3_SEG*16), APP3_SEG
        endif
        db      8ch, 0d9h, 0beh
        if      FW_VERSION >= 110
        sub     ax, word ptr [bx]
        mov     bl, 0
        mov     bh, 0
        if      FW_VERSION <> 114
        mov     dx, 8
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        retf
far_2A0C3:
        mov     word ptr [A3_W_012EF], far_2A0C3-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A046-APP3_CSBASE
        call    fn_2A0F6
        else
        db      0bah, 08h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh, 0cbh
L_2929C:
        db      0c7h, 06h, 0efh, 12h, 13h, 39h, 0c7h
        db      06h, 0f3h, 12h, 96h, 38h, 0e8h, 24h, 00h
        endif
        if      FW_VERSION >= 111
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2A2A3_120-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A219_120-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29AD3-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29A49-APP3_SEG*16), APP3_SEG
        endif
        FIELD_WHEEL     ds, 72dh, 0, 0, 4, intcb_2A119-APP3_CSBASE
        retf
fn_2A0F6:
        int     0a4h
        KEY_DOWN        13h, EP_L_29D52_OFF, EP_L_29D52_SEG
        else
        db      2dh, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 04h, 00h, 0bfh, 32h, 39h, 0cdh, 7dh, 0cbh
        int     0a4h
        KEY_DOWN        13h, EP_L_29D52_OFF, APP3_SEG
        endif
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 111
        KEY_DOWN        20h, (APP3_BASE+L_2A122-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        20h, EP_L_29835_OFF, APP3_SEG
        endif
        if      FW_VERSION >= 120
        ret
intcb_2A119:
        cmp     al, 0
        jne     L_2A121
        push    cs
        call    far_29F77
        else
        db      0c3h
intcb_2A119:
        db      3ch
        add     byte ptr [di+4], dh
        push    cs
        if      FW_VERSION >= 110
        call    far_29F77
        else
        call    FAR_29F77
        endif
        endif
L_2A121:
        retf
L_2A122:
        DISP_WIN_NARROW "Metronome Sound"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_TEXT       28h, 0ch, "Sound:"
        DISP_TEXT       28h, 18h, "  Accent:          :"
        DISP_TEXT       28h, 22h, "  Normal:          :"
        DISP_TEXT       8eh, 0fh, "Velocty"
        mov     dx, ds
        DISP_TEXT_IDX   4eh, 0ch, 0072dh, 0137eh
        mov     al, byte ptr [A3_B_00730]
        mov     ah, 0
        DISP_NUM        0a0h, 18h, 03h
        mov     al, byte ptr [A3_B_00731]
        mov     ah, 0
        DISP_NUM        0a0h, 22h, 03h
        mov     bl, byte ptr [A3_B_0072D]
        mov     bh, 0
        dec     bx
        shl     bx, 2
        add     bx, 180h
        mov     ax, 0
        mov     es, ax
        mov     si, word ptr es:[bx]
        mov     es, word ptr es:[bx+2]
        mov     bl, byte ptr [A3_B_0072E]
        mov     ah, bl
        mov     bh, 0
        mov     al, byte ptr es:[bx+si]
        push    es
        push    si
        DISP_NOTE_CHAN  5eh, 18h
        pop     si
        pop     es
        mov     bl, byte ptr [A3_B_0072F]
        mov     ah, bl
        mov     bh, 0
        mov     al, byte ptr es:[bx+si]
        DISP_NOTE_CHAN  5eh, 22h
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        call    word ptr [A3_W_012F3]
        retf
cb_2A1F5:
        DISP_CURSOR     5eh, 18h, 25h
        ret
cb_2A1FE:
        mov     cl, 5eh
        mov     ch, 22h
        mov     al, 25h
        int     0b0h
        ret
cb_2A207:
        DISP_CURSOR     0a0h, 18h, 13h
        ret
cb_2A210:
        DISP_CURSOR     0a0h, 22h, 13h
        ret
L_29A49:
L_2A219_120:
        mov     word ptr [A3_W_012EF], L_29A49-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A1F5-APP3_CSBASE
        call    fn_2A0F6
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29AD3-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_2A0C3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29A8E-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 72eh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3fh
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        elseif  FW_VERSION >= 114
        db      0ffh, 16h, 0f3h, 12h, 0cbh, 0b1h, 5eh, 0b5h, 18h, 0b0h
        db      25h, 0cdh, 0b0h, 0c3h, 0b1h, 5eh, 0b5h, 22h, 0b0h, 25h, 0cdh, 0b0h, 0c3h, 0b1h, 0a0h, 0b5h
        db      18h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 0a0h, 0b5h, 22h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
L_29A49:
L_2A219_120:
        db      0c7h
        db      06h, 0efh, 12h, 69h, 3ah, 0c7h, 06h, 0f3h, 12h, 45h, 3ah, 0e8h, 0ceh, 0feh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29CC3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2929C-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29A8E-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 2eh, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 3fh, 00h, 0bfh, 0dch, 18h, 0cdh
        db      7dh
        else
        call    word ptr [A3_W_012F3]
        retf
cb_2A1F5:
        DISP_CURSOR     5eh, 18h, 25h
        ret
cb_2A1FE:
        mov     cl, 5eh
        mov     ch, 22h
        mov     al, 25h
        int     0b0h
        ret
cb_2A207:
        DISP_CURSOR     0a0h, 18h, 13h
        ret
cb_2A210:
        DISP_CURSOR     0a0h, 22h, 13h
        ret
L_29A49:
        if      FW_VERSION >= 111
L_2A219_120:
        endif
        mov     word ptr [A3_W_012EF], L_29A49-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A1F5-APP3_CSBASE
        call    fn_2A0F6
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29AD3-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_2A0C3-APP3_SEG*16), APP3_SEG, EP_L_29A8E_OFF, APP3_SEG
        mov     cx, ds
        mov     si, 72eh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3fh
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        endif
        if      FW_VERSION >= 111
        KEY_DOWN        22h, (APP3_BASE+L_2A254-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        22h, (APP3_BASE+L_29967-APP3_SEG*16), APP3_SEG
        endif
        if      FW_VERSION >= 120
        db      0cbh
L_2A254:
        cmp     al, 23h
        jae     L_2A259
        retf
L_2A259:
        mov     byte ptr [A3_B_0072E], ah
        retf
L_29A8E:
        mov     word ptr [A3_W_012EF], L_29A8E-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A1FE-APP3_CSBASE
        call    fn_2A0F6
        elseif  FW_VERSION >= 114
        db      0cbh
L_2A254:
        db      3ch, 23h, 73h, 01h, 0cbh, 88h
        db      26h, 2eh, 07h, 0cbh
L_29A8E:
        db      0c7h, 06h, 0efh, 12h, 0aeh, 3ah, 0c7h, 06h, 0f3h, 12h, 4eh, 3ah
        db      0e8h, 89h, 0feh
        else
L_29967                         equ     $+1
        db      0cbh
L_2A254:
        db      3ch
        and     si, word ptr [bp+di+1]
        retf
L_2A259:
        mov     byte ptr [A3_B_0072E], ah
        retf
L_29A8E:
        mov     word ptr [A3_W_012EF], L_29A8E-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A1FE-APP3_CSBASE
        call    fn_2A0F6
        endif
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29B19-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29A49-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        FIELD_WHEEL     ds, 72fh, 0, 0, 3fh, field_cb_none-APP3_CSBASE
        KEY_DOWN        22h, (APP3_BASE+L_2A299-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 120
        retf
L_2A299:
        db      3ch, 23h
        jae     L_2A29E
        retf
L_2A29E:
        mov     byte ptr [A3_B_0072F], ah
        retf
L_29AD3:
L_2A2A3_120:
        mov     word ptr [A3_W_012EF], L_29AD3-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A207-APP3_CSBASE
        call    fn_2A0F6
        KEY_CURSOR      (APP3_BASE+L_29A49-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_2A0C3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29B19-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 730h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2A2DE-APP3_CSBASE
        int     7dh
        else
        db      0cbh
L_2A299:
        db      3ch
        if      FW_VERSION >= 114
        db      23h, 73h, 01h, 0cbh, 88h, 26h, 2fh, 07h, 0cbh
L_29CC3:
L_2A2A3_120:
        db      0c7h, 06h, 0efh, 12h, 0f3h, 3ah, 0c7h
        db      06h, 0f3h, 12h, 57h, 3ah, 0e8h, 44h, 0feh
        KEY_CURSOR      (APP3_BASE+L_29A49-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2929C-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29B19-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 30h, 07h, 0b3h
        db      00h, 0b7h, 00h, 0bah, 7fh, 00h, 0bfh, 2eh, 3bh, 0cdh, 7dh
        else
        and     si, word ptr [bp+di+1]
        retf
        mov     byte ptr [A3_B_0072F], ah
        retf
L_29AD3:
        if      FW_VERSION >= 111
L_2A2A3_120:
        endif
        mov     word ptr [A3_W_012EF], L_29AD3-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A207-APP3_CSBASE
        call    fn_2A0F6
        KEY_CURSOR      (APP3_BASE+L_29A49-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_2A0C3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29B19-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 730h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2A2DE-APP3_CSBASE
        int     7dh
        endif
        endif
        KEY_DOWN        22h, 0000h, 0000h
        if      FW_VERSION <> 114
        db      0cbh
intcb_2A2DE:
        cmp     al, 0
        je      br_2A2E3
        retf
br_2A2E3:
        mov     byte ptr [A3_B_00730], 1
        retf
L_29B19:
        mov     word ptr [A3_W_012EF], L_29B19-APP3_CSBASE
        mov     word ptr [A3_W_012F3], cb_2A210-APP3_CSBASE
        call    fn_2A0F6
        else
        db      0cbh, 3ch, 00h, 74h, 01h, 0cbh, 0c6h, 06h, 30h, 07h, 01h, 0cbh
L_29B19:
        db      0c7h
        db      06h, 0efh, 12h, 39h, 3bh, 0c7h, 06h, 0f3h, 12h, 60h, 3ah, 0e8h, 0feh, 0fdh
        endif
        if      FW_VERSION >= 111
        KEY_CURSOR      (APP3_BASE+L_29A8E-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A2A3_120-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      EP_L_29A8E_OFF, APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29AD3-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        endif
        FIELD_WHEEL     ds, 731h, 0, 0, 7fh, intcb_2A324-APP3_CSBASE
        KEY_DOWN        22h, 0000h, 0000h
        db      0cbh
intcb_2A324:
        cmp     al, 0
        je      L_29B59
        retf
L_29B59:
        mov     byte ptr [A3_B_00731], 1
        retf
L_2A32F:
        if      FW_VERSION >= 120
        mov     ax, APPDATA_SEG
        elseif  FW_VERSION >= 114
        mov     ax, APPDATA_SEG
        elseif  FW_VERSION >= 112
L_29A42:
        mov     ax, APPDATA_SEG
        elseif  FW_VERSION >= 111
L_29A42:
        mov     ax, APPDATA_SEG
        else
L_29A42:
        mov     ax, APPDATA_SEG
        endif
        mov     ds, ax
        mov     al, 0
        int     7ah
        mov     al, 6
        mov     byte ptr [C0_B_00F2F], al
        int     0adh
        mov     ax, word ptr [A2_W_CUR_SEQ]
        int     0d8h
        callf   [A3_W_01398]
        retf
L_2A349:
        if      FW_VERSION >= 120
        mov     ax, APPDATA_SEG
        elseif  FW_VERSION >= 114
        mov     ax, APPDATA_SEG
        elseif  FW_VERSION >= 112
L_29A79:
        mov     ax, APPDATA_SEG
        elseif  FW_VERSION >= 111
L_29A79:
        mov     ax, APPDATA_SEG
        else
L_29A79:
        mov     ax, APPDATA_SEG
        endif
        mov     ds, ax
        mov     word ptr [A3_W_01398], L_2A349-APP3_CSBASE
        callf   [A3_W_0139C]
        retf
L_2A359:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [A3_W_0139C], si
        int     0a4h
        if      FW_VERSION >= 111
        KEY_SOFT        0000h, 0000h, (APP3_BASE+L_29D7F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A7EC-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, (APP3_BASE+L_2A38F-APP3_SEG*16), APP3_SEG
        else
        KEY_SOFT        0000h, 0000h, EP_L_2A3D6_OFF, APP3_SEG, (APP3_BASE+L_29EFF-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, EP_L_29AA2_OFF, APP3_SEG
        endif
        else
        db      0ffh, 16h, 0f3h, 12h, 0cbh, 0b1h, 5eh
        db      0b5h, 18h, 0b0h, 25h, 0cdh, 0b0h, 0c3h, 0b1h, 5eh, 0b5h, 22h, 0b0h, 25h, 0cdh, 0b0h, 0c3h
        db      0b1h, 0a0h, 0b5h, 18h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 0a0h, 0b5h, 22h, 0b0h, 13h, 0cdh
        db      0b0h, 0c3h
L_293F2:
        db      0c7h, 06h, 0efh, 12h, 32h, 3ah, 0c7h, 06h, 0f3h, 12h, 0eh, 3ah, 0e8h, 0ceh
        db      0feh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29CC3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2929C-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29A8E-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 2eh, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 3fh, 00h, 0bfh
        db      0c0h, 18h, 0cdh, 7dh
        KEY_DOWN        22h, (APP3_BASE+L_2A254-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2A254:
        db      3ch, 23h, 73h
L_29A8E                         equ     $+7
        db      01h, 0cbh, 88h, 26h, 2eh, 07h, 0cbh
        db      0c7h, 06h, 0efh, 12h, 77h, 3ah, 0c7h, 06h, 0f3h
        db      12h, 17h, 3ah, 0e8h, 89h, 0feh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_294C2-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_293F2-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 2fh, 07h, 0b3h, 00h, 0b7h
        db      00h, 0bah, 3fh, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_DOWN        22h, (APP3_BASE+L_29967-APP3_SEG*16), APP3_SEG
L_29AD3                         equ     $+0bh
L_29967                         equ     $+1
        db      0cbh, 3ch, 23h, 73h, 01h, 0cbh, 88h, 26h, 2fh, 07h, 0cbh
L_29CC3:
        db      0c7h, 06h, 0efh, 12h
        db      0bch, 3ah, 0c7h, 06h, 0f3h, 12h, 20h, 3ah, 0e8h, 44h, 0feh
        KEY_CURSOR      (APP3_BASE+L_293F2-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2929C-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_294C2-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh
        db      30h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 7fh, 00h, 0bfh, 0f7h, 3ah, 0cdh, 7dh
        KEY_DOWN        22h, 0000h, 0000h
        db      0cbh, 3ch, 00h, 74h, 01h, 0cbh, 0c6h, 06h, 30h, 07h
        db      01h, 0cbh
L_294C2:
        db      0c7h, 06h, 0efh, 12h, 02h, 3bh, 0c7h, 06h, 0f3h, 12h, 29h, 3ah, 0e8h, 0feh
        db      0fdh
        KEY_CURSOR      EP_L_29A8E_OFF, APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29AD3-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 31h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 7fh, 00h, 0bfh
        db      3dh, 3bh, 0cdh, 7dh
        KEY_DOWN        22h, 0000h, 0000h
        db      0cbh, 3ch, 00h, 74h
L_29A42                         equ     $+8
        db      01h, 0cbh, 0c6h, 06h, 31h, 07h, 01h, 0cbh, 0b8h, 0c6h, 21h, 8eh, 0d8h, 0b0h, 00h, 0cdh
        db      7ah, 0b0h, 06h, 0a2h, 2fh, 0fh, 0cdh, 0adh, 0a1h, 10h, 07h, 0cdh, 0d8h, 0ffh, 1eh, 98h
        db      13h, 0cbh
L_29A79:
        db      0b8h, 0c6h, 21h, 8eh, 0d8h, 0c7h, 06h, 98h, 13h, 62h, 3bh, 0ffh, 1eh, 9ch
        db      13h, 0cbh, 5eh, 56h, 83h, 0eeh, 03h, 89h, 36h, 9ch, 13h, 0cdh, 0a4h
        KEY_SOFT        0000h, 0000h, EP_L_2A3D6_OFF, APP3_SEG, (APP3_BASE+L_29EFF-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, EP_L_29AA2_OFF, APP3_SEG
        endif
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0c3h
L_2A38F:
        if      FW_VERSION >= 114
        db      0c6h
        push    es
        dec     sp
        adc     ax, 0cd00h
        pop     word ptr [bp+si]
        callf   EP_L_2FD80_SEG:EP_L_2FD80_OFF
        else
        db      0c6h, 06h, 4ch, 15h, 00h
        DISP_CLEAR
        db      9ah
        dw      EP_L_2FD80_OFF, EP_L_2FD80_SEG
        endif
        DISP_BOX        00h, 00h, 7ah, 30h
        DISP_HLINE      01h, 30h, 79h
        DISP_VLINE      7ah, 01h, 30h
        DISP_HDOTS      00h, 0ah, 7ah
        DISP_BOX        7ch, 00h, 7ah, 30h
        DISP_HLINE      7dh, 30h, 79h
        DISP_VLINE      0f6h, 01h, 30h
        DISP_HDOTS      7ch, 0ah, 7ah
        DISP_TEXT       04h, 02h, "Sync In"
        DISP_TEXT       04h, 0ch, "Mode:"
        DISP_TEXT       04h, 26h, "Receive MMC:"
        DISP_TEXT       80h, 02h, "Sync Out"
        DISP_TEXT       80h, 0ch, "Mode:"
        DISP_TEXT       80h, 26h, "Send MMC:"
        DISP_SOFTKEY    01h, DISP_SK_PLAIN, "SYNC"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "DUMP"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "MIDIsw"
        db      0e8h
        or      al, 0
        call    L_2A509
        call    word ptr [A3_W_013A0]
        int     0ach
        int     0fah
        retf
        DISP_TEXT       4ch, 02h, "      "
        db      80h, 3eh, 70h, 07h
        db      03h
        je      L_2A478
        DISP_TEXT       4ch, 02h, "(In:2)"
        mov     al, byte ptr [A3_B_00775]
        add     al, 31h
        DISP_CHAR       64h, 02h
L_2A478:
        db      8ch, 0dah
        DISP_TEXT_IDX   22h, 0ch, 00770h, 013aah
        db      0a0h, 0b2h, 07h
        and     al, 1
        mov     cl, 4ch
        mov     ch, 26h
        call    fn_26D9C
        DISP_TEXT       04h, 16h, "                  "
        cmp     byte ptr [A3_B_00770], 1
        jne     br_2A4CF
        DISP_TEXT       04h, 16h, "Shift early(ms):"
        mov     al, byte ptr [A3_B_00772]
        DISP_NUM        64h, 16h, 02h
        ret
br_2A4CF:
        cmp     byte ptr [A3_B_00770], 2
        jae     L_2A4D7
        ret
L_2A4D7:
        DISP_TEXT       04h, 16h, "Frame rate:"
        mov     dx, ds
        DISP_TEXT_IDX   46h, 16h, 00774h, 013e3h
        cmp     byte ptr [A3_B_00771], 2
        jae     L_2A4FC
        ret
L_2A4FC:
        mov     dx, ds
        DISP_TEXT_IDX   0c2h, 16h, 00774h, 013e3h
        ret
L_2A509:
        DISP_TEXT       0c2h, 02h, "        "
        db      80h, 3eh, 71h
        pop     es
        add     si, word ptr [si+21h]
        DISP_TEXT       0c2h, 02h, "(Out:  )"
        mov     dx, ds
        DISP_TEXT_IDX   0e0h, 02h, 00776h, 013f0h
        DISP_ERASE      80h, 16h, 5ah, 07h
        mov     dx, ds
        DISP_TEXT_IDX   9eh, 0ch, 00771h, 013aah
        mov     al, byte ptr [A3_B_00773]
        mov     cl, 0b6h
        mov     ch, 26h
        call    fn_26D9C
        cmp     byte ptr [A3_B_00771], 2
        jae     L_2A55D
        ret
L_2A55D:
        DISP_TEXT       80h, 16h, "Frame rate:"
        mov     dx, ds
        DISP_TEXT_IDX   0c2h, 16h, 00774h, 013e3h
        cmp     byte ptr [A3_B_00770], 2
        jae     L_2A582
        ret
L_2A582:
        mov     dx, ds
        DISP_TEXT_IDX   46h, 16h, 00774h, 013e3h
        if      FW_VERSION >= 110
        ret
cb_2A58F:
        mov     cl, 64h
        mov     ch, 2
        mov     al, 7
        else
        db      0c3h
cb_2A58F:
        db      0b1h, 64h, 0b5h, 02h, 0b0h, 07h, 0cdh, 0b0h
        db      0c3h
cb_2A598:
        db      0b1h, 22h, 0b5h, 0ch, 0b0h, 55h, 0cdh, 0b0h, 0c3h
cb_2977A_107:
        db      0b1h, 64h, 0b5h, 16h, 0b0h, 0dh
        endif
        int     0b0h
        ret
        if      FW_VERSION >= 114
cb_2A598:
        DISP_CURSOR     22h, 0ch, 55h
        ret
L_2A5A1:
        DISP_CURSOR     64h, 16h, 0dh
        ret
        if      FW_VERSION >= 120
cb_2A5AA:
        else
cb_29DDA:
        endif
        DISP_CURSOR     46h, 16h, 13h
        ret
        if      FW_VERSION >= 120
cb_2A5B3:
        else
cb_29DE3:
        endif
        DISP_CURSOR     4ch, 26h, 13h
        ret
        if      FW_VERSION >= 120
cb_2A5BC:
        else
cb_29DEC:
        endif
        DISP_CURSOR     0e0h, 2, 0dh
        ret
        if      FW_VERSION >= 120
cb_2A5C5:
        else
cb_29DF5:
        endif
        DISP_CURSOR     9eh, 0ch, 55h
        ret
        if      FW_VERSION >= 120
cb_2A5CE:
        else
cb_29DFE:
        endif
        DISP_CURSOR     0c2h, 16h, 13h
        ret
cb_29E07:
        DISP_CURSOR     0b6h, 26h, 13h
        ret
L_297E7:
L_297B9:
        call    L_2A359
        mov     word ptr [A3_W_013A0], cb_2A598-APP3_CSBASE
        FIELD_WHEEL     ds, 770h, 0, 0, word ptr [013a8h], field_cb_none-APP3_CSBASE
        if      FW_VERSION >= 120
        KEY_CURSOR      (APP3_BASE+L_2A709-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A167-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A02E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A618-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+L_29F77-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A167-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A02E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29D48-APP3_SEG*16), APP3_SEG
        endif
        retf
L_2A02E:
        cmp     byte ptr [A3_B_00770], 3
        je      L_2A617
        jmp     SHORT L_2A68C
L_2A617:
        retf
        if      FW_VERSION >= 120
L_2A618:
        else
L_29D48:
        endif
        cmp     byte ptr [A3_B_00770], 0
        jne     L_2A622
        jmp     X_2A6CA
L_2A622:
        cmp     byte ptr [A3_B_00770], 1
        jne     L_2A62B
        jmp     SHORT L_2A632
L_2A62B:
        jmp     SHORT L_2A65F
        jae     L_2A632
        jmp     X_2A6CA
L_2A632:
        call    L_2A359
        mov     word ptr [A3_W_013A0], L_2A5A1-APP3_CSBASE
        FIELD_ENTRY     ds, 772h, 0, 0, 14h, field_cb_none-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_2A167-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A19F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG, (APP3_BASE+X_2A6CA-APP3_SEG*16), APP3_SEG
        retf
L_2A65F:
        call    L_2A359
        if      FW_VERSION >= 120
        mov     word ptr [A3_W_013A0], cb_2A5AA-APP3_CSBASE
        else
        mov     word ptr [A3_W_013A0], cb_29DDA-APP3_CSBASE
        endif
        FIELD_WHEEL     ds, 774h, 0, 0, 3, field_cb_none-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_2A167-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A19F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG, (APP3_BASE+X_2A6CA-APP3_SEG*16), APP3_SEG
        retf
L_2A68C:
        call    L_2A359
        mov     word ptr [A3_W_013A0], cb_2A58F-APP3_CSBASE
        FIELD_WHEEL     ds, 775h, 0, 0, 1, field_cb_none-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2A0D9-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG
        retf
L_2A0D9:
        cmp     byte ptr [A3_B_00771], 3
        je      L_2A6C5
        push    cs
        if      FW_VERSION >= 120
        call    L_2A709
        else
        call    L_29F77
        endif
        retf
L_2A6C5:
        push    cs
        call    L_2A167
        retf
X_2A6CA:
        call    L_2A359
        if      FW_VERSION >= 120
        mov     word ptr [A3_W_013A0], cb_2A5B3-APP3_CSBASE
        else
        mov     word ptr [A3_W_013A0], cb_29DE3-APP3_CSBASE
        endif
        FIELD_WHEEL     ds, 7b2h, 0, 0, 1, field_cb_none-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_2A012-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A1D5-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A117-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
L_2A117:
        cmp     byte ptr [A3_B_00770], 1
        jne     L_2A701
        jmp     L_2A632
L_2A701:
        jb      L_2A706
        jmp     L_2A65F
L_2A706:
        jmp     L_297E7
        if      FW_VERSION >= 120
L_2A709:
        call    L_2A359
        mov     word ptr [A3_W_013A0], cb_2A5BC-APP3_CSBASE
        else
L_29F77:
        call    L_2A359
        mov     word ptr [A3_W_013A0], cb_29DEC-APP3_CSBASE
        endif
        FIELD_WHEEL     ds, 776h, 0, 0, 2, field_cb_none-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_2A156-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A167-APP3_SEG*16), APP3_SEG
        retf
L_2A156:
        cmp     byte ptr [A3_B_00770], 3
        je      L_2A742
        push    cs
        call    L_2A68C
        retf
L_2A742:
        push    cs
        call    L_297E7
        retf
L_2A167:
        if      FW_VERSION >= 120
L_29FAF:
        call    L_2A359
        mov     word ptr [A3_W_013A0], cb_2A5C5-APP3_CSBASE
        else
        call    L_2A359
        mov     word ptr [A3_W_013A0], cb_29DF5-APP3_CSBASE
        endif
        FIELD_WHEEL     ds, 771h, 0, 0, word ptr [013a8h], field_cb_none-APP3_CSBASE
        if      FW_VERSION >= 120
        KEY_CURSOR      (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A618-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A195-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A19F-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29D48-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A195-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A19F-APP3_SEG*16), APP3_SEG
        endif
        retf
L_2A195:
        cmp     byte ptr [A3_B_00771], 3
        je      L_2A77E
        if      FW_VERSION >= 120
        jmp     SHORT L_2A709
        else
        jmp     SHORT L_29F77
        endif
L_2A77E:
        retf
L_2A19F:
        cmp     byte ptr [A3_B_00771], 2
        jb      L_2A1D5
        jmp     SHORT L_2A788
L_2A788:
        call    L_2A359
        if      FW_VERSION >= 120
        mov     word ptr [A3_W_013A0], cb_2A5CE-APP3_CSBASE
        else
        mov     word ptr [A3_W_013A0], cb_29DFE-APP3_CSBASE
        endif
        FIELD_WHEEL     ds, 774h, 0, 0, 3, field_cb_none-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_2A117-APP3_SEG*16), APP3_SEG, (APP3_BASE+X_2A6CA-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A167-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A1D5-APP3_SEG*16), APP3_SEG
        retf
L_2A1D5:
        call    L_2A359
        mov     word ptr [A3_W_013A0], cb_29E07-APP3_CSBASE
        FIELD_WHEEL     ds, 773h, 0, 0, 1, field_cb_none-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+X_2A6CA-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A012-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
L_2A012:
        cmp     byte ptr [A3_B_00771], 2
        jae     L_2A788
        jmp     L_2A167
L_2A7EC:
        mov     ax, APPDATA_SEG
        mov     ds, ax
        mov     al, 0
        int     7ah
        mov     al, 0
        mov     byte ptr [C0_B_00F2F], al
        int     0adh
        mov     word ptr [A3_W_01398], L_2A7EC-APP3_CSBASE
        int     0a4h
        callf   EP_L_2FD80_SEG:EP_L_2FD80_OFF
        KEY_SOFT        (APP3_BASE+L_2A349-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29D7F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        elseif  FW_VERSION >= 110
cb_2A598:
        db      0b1h, 22h, 0b5h, 0ch, 0b0h, 55h, 0cdh, 0b0h, 0c3h
cb_29DD1_112:
        db      0b1h, 64h, 0b5h, 16h, 0b0h, 0dh, 0cdh
        db      0b0h, 0c3h
cb_29DDA:
        db      0b1h, 46h, 0b5h, 16h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
cb_29DE3:
        db      0b1h, 4ch, 0b5h, 26h, 0b0h
        db      13h, 0cdh, 0b0h, 0c3h
cb_29DEC:
        db      0b1h, 0e0h, 0b5h, 02h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
cb_29DF5:
        db      0b1h, 9eh, 0b5h
        db      0ch, 0b0h, 55h, 0cdh, 0b0h, 0c3h
cb_29DFE:
        db      0b1h, 0c2h, 0b5h, 16h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
cb_29E07:
        db      0b1h
far_29D10                       equ     $+8
        if      FW_VERSION >= 111
        db      0b6h, 0b5h, 26h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
L_297E7:
L_297B9:
        db      0e8h, 76h, 0fdh
        mov     word ptr [A3_W_013A0], cb_2A598-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 70h, 07h, 0b3h, 00h, 0b7h, 00h, 8bh, 16h, 0a8h, 13h, 0bfh, 0dch
        else
        db      0b6h, 0b5h, 26h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0e8h, 76h, 0fdh
        mov     word ptr [A3_W_013A0], cb_2A598-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 70h, 07h, 0b3h, 00h, 0b7h, 00h, 8bh, 16h, 0a8h, 13h, 0bfh, 0cfh
        endif
        db      18h, 0cdh, 7dh
        if      FW_VERSION >= 112
        KEY_CURSOR      (APP3_BASE+L_29F39-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29F77-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29E3E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29D48-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+FAR_29E39-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29E77-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29D3E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29D48-APP3_SEG*16), APP3_SEG
far_29D3E                       equ     $+1
        endif
        db      0cbh
L_29E3E:
        db      80h, 3eh, 70h, 07h, 03h, 74h, 02h, 0ebh, 75h, 0cbh
L_29D48:
        db      80h, 3eh, 70h, 07h, 00h, 75h, 03h, 0e9h, 0a8h, 00h, 80h, 3eh, 70h, 07h, 01h, 75h
        db      02h, 0ebh, 07h, 0ebh, 32h, 73h, 03h, 0e9h, 98h, 00h, 0e8h, 24h, 0fdh
        mov     word ptr [A3_W_013A0_2], cb_29DD1_112-APP3_CSBASE
        mov     cx, ds
        mov     si, 772h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 14h
        mov     di, field_cb_none-APP3_CSBASE
        int     7eh
        if      FW_VERSION < 112
        KEY_CURSOR      (APP3_BASE+FAR_29E77-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29EAF-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29D10-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29DFA-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+L_29F77-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29FAF-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29EFA-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh, 0e8h, 0f7h, 0fch
        mov     word ptr [A3_W_013A0_2], cb_29DDA-APP3_CSBASE
        if      FW_VERSION >= 111
        db      8ch, 0d9h, 0beh, 74h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 03h, 00h, 0bfh, 0dch, 18h, 0cdh
        else
        db      8ch, 0d9h, 0beh, 74h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 03h, 00h, 0bfh, 0cfh, 18h, 0cdh
        endif
        db      7dh
        if      FW_VERSION >= 112
        KEY_CURSOR      (APP3_BASE+L_29F77-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29FAF-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29EFA-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+FAR_29E77-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29EAF-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29D10-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29DFA-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh, 0e8h, 0cah, 0fch
        mov     word ptr [A3_W_013A0_2], cb_2A58F-APP3_CSBASE
        mov     cx, ds
        mov     si, 775h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        if      FW_VERSION < 112
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+FAR_29DE9-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_29D10-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29EE9-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
        if      FW_VERSION < 112
far_29DE9:
        endif
L_29EE9:
        db      80h, 3eh, 71h, 07h, 03h, 74h, 05h, 0eh, 0e8h, 45h, 00h, 0cbh, 0eh, 0e8h, 7eh
L_29DFA                         equ     $+2
        if      FW_VERSION >= 111
        db      00h, 0cbh
L_29EFA:
        db      0e8h, 8ch, 0fch
        mov     word ptr [A3_W_013A0], cb_29DE3-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b2h, 07h
        db      0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        else
        db      00h, 0cbh, 0e8h, 8ch, 0fch
        mov     word ptr [A3_W_013A0], cb_29DE3-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b2h, 07h
        db      0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0cfh, 18h, 0cdh, 7dh
        endif
        if      FW_VERSION >= 112
        KEY_CURSOR      (APP3_BASE+L_2A012-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29FE5-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29F27-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      (APP3_BASE+L_29F12-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29EE5-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29E27-APP3_SEG*16), APP3_SEG, 0000h, 0000h
far_29E27                       equ     $+1
        endif
        db      0cbh
L_29F27:
        db      80h
        db      3eh, 70h, 07h, 01h, 75h, 03h, 0e9h, 31h, 0ffh, 72h, 03h, 0e9h, 59h, 0ffh, 0e9h, 0d7h
far_29E39                       equ     $+1
        if      FW_VERSION >= 111
        db      0feh
L_29F39:
        db      0e8h, 4dh, 0fch
        mov     word ptr [A3_W_013A0], cb_29DEC-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 76h, 07h, 0b3h
        db      00h, 0b7h, 00h, 0bah, 02h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        else
        db      0feh, 0e8h, 4dh, 0fch
        mov     word ptr [A3_W_013A0], cb_29DEC-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 76h, 07h, 0b3h
        db      00h, 0b7h, 00h, 0bah, 02h, 00h, 0bfh, 0cfh, 18h, 0cdh, 7dh
        endif
        if      FW_VERSION >= 112
        KEY_CURSOR      (APP3_BASE+L_29F66-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29F77-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+FAR_29E66-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29D10-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_29E77-APP3_SEG*16), APP3_SEG
far_29E66                       equ     $+1
        endif
        db      0cbh
L_29F66:
        db      80h, 3eh
far_29E77                       equ     $+0fh
        db      70h, 07h, 03h, 74h, 05h, 0eh, 0e8h, 4bh, 0ffh, 0cbh, 0eh, 0e8h, 9ah, 0feh, 0cbh
L_29F77:
        db      0e8h
        db      0fh, 0fch
        mov     word ptr [A3_W_013A0_2], cb_29DF5-APP3_CSBASE
        mov     cx, ds
        mov     si, 771h
        mov     bl, 0
        mov     bh, 0
        mov     dx, word ptr [A3_W_013A8]
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        if      FW_VERSION < 112
        KEY_CURSOR      (APP3_BASE+FAR_29D10-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29D48-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29EA5-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29EAF-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29D48-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29FA5-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29FAF-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
        if      FW_VERSION < 112
far_29EA5:
        endif
L_29FA5:
        db      80h, 3eh, 71h
far_29EAF                       equ     $+7
        db      07h, 03h, 74h, 02h, 0ebh, 8bh, 0cbh
L_29FAF:
        db      80h, 3eh, 71h, 07h, 02h, 72h, 2fh, 0ebh, 00h
L_2A788:
        db      0e8h, 0ceh, 0fbh
        mov     word ptr [A3_W_013A0_2], cb_29DFE-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 74h, 07h, 0b3h, 00h
        if      FW_VERSION >= 111
        db      0b7h, 00h, 0bah, 03h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        else
        db      0b7h, 00h, 0bah, 03h, 00h, 0bfh, 0cfh, 18h, 0cdh, 7dh
        endif
        if      FW_VERSION >= 112
        KEY_CURSOR      (APP3_BASE+L_29F27-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29EFA-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29F77-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29FE5-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+FAR_29E27-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29DFA-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29E77-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_29EE5-APP3_SEG*16), APP3_SEG
far_29EE5                       equ     $+1
        endif
        db      0cbh
L_29FE5:
        db      0e8h, 0a1h, 0fbh
        mov     word ptr [A3_W_013A0_2], cb_29E07-APP3_CSBASE
        mov     cx, ds
        mov     si, 773h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        if      FW_VERSION < 112
        KEY_CURSOR      (APP3_BASE+L_29DFA-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29F12-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      (APP3_BASE+L_29EFA-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A012-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        endif
L_29F12                         equ     $+1
        if      FW_VERSION >= 111
        db      0cbh
L_2A012:
        db      80h, 3eh, 71h, 07h, 02h, 73h
        db      9fh, 0e9h, 5bh, 0ffh
L_2A7EC:
        if      FW_VERSION >= 112
        db      0b8h, 0f9h, 21h, 8eh, 0d8h, 0b0h, 00h, 0cdh, 7ah, 0b0h, 00h, 0a2h
        else
        db      0b8h, 0f1h, 21h, 8eh, 0d8h, 0b0h, 00h, 0cdh, 7ah, 0b0h, 00h, 0a2h
        endif
        db      2fh, 0fh, 0cdh, 0adh
        mov     word ptr [A3_W_01398], L_2A7EC-APP3_CSBASE
        else
        db      0cbh, 80h, 3eh, 71h, 07h, 02h, 73h
L_29EFF                         equ     $+4
        db      9fh, 0e9h, 5bh, 0ffh, 0b8h, 0f0h, 21h, 8eh, 0d8h, 0b0h, 00h, 0cdh, 7ah, 0b0h, 00h, 0a2h
        db      2fh, 0fh, 0cdh, 0adh
        mov     word ptr [A3_W_01398], L_29EFF-APP3_CSBASE
        endif
        db      0cdh, 0a4h, 9ah
        dw      EP_L_2FD80_OFF, EP_L_2FD80_SEG
        KEY_SOFT        (APP3_BASE+L_29A79-APP3_SEG*16), APP3_SEG, EP_L_2A3D6_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        else
cb_29DDA:
        DISP_CURSOR     46h, 16h, 13h
        ret
cb_2A5B3:
        mov     cl, 4ch
        mov     ch, 26h
        db      0b0h, 13h, 0cdh, 0b0h, 0c3h
cb_29DEC:
        db      0b1h, 0e0h, 0b5h, 02h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
cb_29DF5:
        db      0b1h, 9eh
        db      0b5h, 0ch, 0b0h, 55h, 0cdh, 0b0h, 0c3h
cb_29DFE:
        db      0b1h, 0c2h, 0b5h, 16h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
FAR_29D10                       equ     $+9
cb_297B0_107:
        db      0b1h, 0b6h, 0b5h, 26h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
L_297B9:
        db      0e8h, 76h, 0fdh
        mov     word ptr [A3_W_013A0], cb_2A598-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 70h, 07h, 0b3h, 00h, 0b7h, 00h, 8bh, 16h, 0a8h, 13h, 0bfh
        db      0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_298E2-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29FAF-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297E7-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297F1-APP3_SEG*16), APP3_SEG
        db      0cbh
L_297E7:
        db      80h, 3eh, 70h, 07h, 03h, 74h, 02h, 0ebh, 75h
L_2A617:
        db      0cbh
L_297F1:
        db      80h, 3eh, 70h, 07h, 00h, 75h, 03h, 0e9h, 0a8h, 00h, 80h, 3eh, 70h, 07h, 01h
        db      75h, 02h, 0ebh, 07h, 0ebh, 32h, 73h, 03h, 0e9h, 98h, 00h, 0e8h, 24h, 0fdh
        mov     word ptr [A3_W_013A0], cb_2977A_107-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 72h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 14h, 00h
        db      0bfh, 0c0h, 18h, 0cdh, 7eh
        KEY_CURSOR      (APP3_BASE+L_29FAF-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29958-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297B9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29EFA-APP3_SEG*16), APP3_SEG
        db      0cbh, 0e8h, 0f7h, 0fch
        mov     word ptr [A3_W_013A0], cb_29DDA-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 74h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 03h, 00h, 0bfh, 0c0h, 18h
        db      0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_29FAF-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29958-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297B9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29EFA-APP3_SEG*16), APP3_SEG
        db      0cbh, 0e8h, 0cah, 0fch
        mov     word ptr [A3_W_013A0], cb_2A58F-APP3_CSBASE
        db      8ch, 0d9h
        db      0beh, 75h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_29EE9-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_297B9-APP3_SEG*16), APP3_SEG
        db      0cbh
L_29EE9:
        db      80h, 3eh, 71h, 07h, 03h, 74h, 05h, 0eh, 0e8h, 45h, 00h, 0cbh, 0eh, 0e8h
        db      7eh, 00h, 0cbh
L_29EFA:
        db      0e8h, 8ch, 0fch
        mov     word ptr [A3_W_013A0], cb_2A5B3-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b2h
        db      07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_299BB-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2998E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_298D0-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh
L_298D0:
        db      80h, 3eh, 70h, 07h, 01h, 75h, 03h, 0e9h, 31h, 0ffh, 72h, 03h, 0e9h, 59h, 0ffh, 0e9h
        db      0d7h, 0feh
L_298E2:
        db      0e8h, 4dh, 0fch
        mov     word ptr [A3_W_013A0], cb_29DEC-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 76h, 07h
        db      0b3h, 00h, 0b7h, 00h, 0bah, 02h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_2990F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297B9-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29FAF-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2990F:
        db      80h
        db      3eh, 70h, 07h, 03h, 74h, 05h, 0eh, 0e8h, 4bh, 0ffh, 0cbh, 0eh, 0e8h, 9ah, 0feh, 0cbh
L_29FAF:
        db      0e8h, 0fh, 0fch
        mov     word ptr [A3_W_013A0], cb_29DF5-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 71h, 07h, 0b3h, 00h
        db      0b7h, 00h, 8bh, 16h, 0a8h, 13h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_297B9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_297F1-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2994E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29958-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2994E:
        db      80h, 3eh
        db      71h, 07h, 03h, 74h, 02h, 0ebh, 8bh, 0cbh
L_29958:
        db      80h, 3eh, 71h, 07h, 02h, 72h, 2fh, 0ebh
        db      00h, 0e8h, 0ceh, 0fbh
        mov     word ptr [A3_W_013A0], cb_29DFE-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 74h, 07h, 0b3h
        db      00h, 0b7h, 00h, 0bah, 03h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_298D0-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29EFA-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29FAF-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2998E-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2998E:
        db      0e8h, 0a1h
        db      0fbh
        mov     word ptr [A3_W_013A0], cb_297B0_107-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 73h, 07h, 0b3h, 00h, 0b7h, 00h
        db      0bah, 01h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_29EFA-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_299BB-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh
L_299BB:
        db      80h, 3eh, 71h, 07h, 02h
L_29EFF                         equ     $+5
        db      73h, 9fh, 0e9h, 5bh, 0ffh, 0b8h, 0c6h, 21h, 8eh, 0d8h, 0b0h, 00h, 0cdh, 7ah, 0b0h, 00h
        db      0a2h, 2fh, 0fh, 0cdh, 0adh, 0c7h, 06h, 98h, 13h, 05h, 40h, 0cdh, 0a4h, 9ah
        dw      EP_L_2FD80_OFF, EP_L_2FD80_SEG
        KEY_SOFT        (APP3_BASE+L_29A79-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29D7F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        endif
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0c6h, 06h, 4ch, 15h, 00h
        callf   [A3_FP_013A2]
        retf
        if      FW_VERSION >= 120
midi_sw_screen_paint:
        endif
L_2A835:
        if      FW_VERSION < 120
midi_sw_screen_paint:
        endif
        DISP_CLEAR
        DISP_TEXT       09h, 02h, "Switch 1"
        DISP_TEXT       47h, 02h, "Switch 2"
        DISP_TEXT       85h, 02h, "Switch 3"
        DISP_TEXT       0c3h, 02h, "Switch 4"
        DISP_TEXT       05h, 0fh, "Ctrl:"
        DISP_TEXT       43h, 0fh, "Ctrl:"
        DISP_TEXT       81h, 0fh, "Ctrl:"
        DISP_TEXT       0bfh, 0fh, "Ctrl:"
        DISP_TEXT       05h, 19h, "Function:"
        DISP_TEXT       43h, 19h, "Function:"
        DISP_TEXT       81h, 19h, "Function:"
        DISP_TEXT       0bfh, 19h, "Function:"
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "SYNC"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "DUMP"
        DISP_SOFTKEY    03h, DISP_SK_PLAIN, "MIDIsw"
        if      FW_VERSION >= 111
        mov     al, byte ptr [A3_B_007B3]
        mov     cl, 23h
        mov     ch, 0fh
        call    L_2A982
        mov     al, byte ptr [A3_B_007B5]
        mov     cl, 61h
        mov     ch, 0fh
        call    L_2A982
        mov     al, byte ptr [A3_B_007B7]
        mov     cl, 9fh
        mov     ch, 0fh
        call    L_2A982
        mov     al, byte ptr [A3_B_007B9]
        mov     cl, 0ddh
        mov     ch, 0fh
        call    L_2A982
        mov     dx, ds
        else
        db      0a0h, 0b3h, 07h, 0b1h, 23h, 0b5h, 0fh, 0e8h, 80h, 00h, 0a0h, 0b5h, 07h, 0b1h, 61h, 0b5h
        db      0fh, 0e8h, 76h, 00h, 0a0h, 0b7h, 07h, 0b1h, 9fh, 0b5h, 0fh, 0e8h, 6ch, 00h, 0a0h, 0b9h
        db      07h, 0b1h, 0ddh, 0b5h, 0fh, 0e8h, 62h, 00h, 8ch, 0dah
        endif
        DISP_TEXT_IDX   05h, 23h, 007b4h, 013f7h
        db      8ch, 0dah
        DISP_TEXT_IDX   43h, 23h, 007b6h, 013f7h
        mov     dx, ds
        DISP_TEXT_IDX   81h, 23h, 007b8h, 013f7h
        mov     dx, ds
        DISP_TEXT_IDX   0bfh, 23h, 007bah, 013f7h
        call    word ptr [A3_W_013A6]
        DISP_BOX        00h, 00h, 0f7h, 30h
        DISP_HLINE      01h, 30h, 0f6h
        DISP_VLINE      0f7h, 01h, 30h
        DISP_HDOTS      00h, 0ah, 0f6h
        DISP_VLINE      3eh, 01h, 2fh
        DISP_VLINE      7ch, 01h, 2fh
        DISP_VLINE      0bah, 01h, 2fh
        if      FW_VERSION >= 111
        int     0ach
        retf
L_2A982:
        sub     al, 1
        jb      L_2A98F
        mov     bh, 3
        mov     ah, 0
        mov     bl, 0ah
        int     90h
        ret
L_2A98F:
        mov     si, str_2A99B-APP3_CSBASE
        mov     dx, cs
        mov     ah, 3
        mov     bl, 5
        else
        db      0cdh, 0ach, 0cbh, 2ch, 01h, 72h, 09h, 0b7h, 03h
        if      FW_VERSION >= 110
        db      0b4h, 00h, 0b3h, 0ah, 0cdh, 90h, 0c3h, 0beh, 0deh, 41h, 8ch, 0cah, 0b4h, 03h, 0b3h, 05h
        else
        db      0b4h, 00h, 0b3h, 0ah, 0cdh, 90h, 0c3h, 0beh, 0b4h, 41h, 8ch, 0cah, 0b4h, 03h, 0b3h, 05h
        endif
        endif
        int     90h
        ret
str_2A99B:
        db      "OFF"
cb_2A99E:
        DISP_CURSOR     23h, 0fh, 13h
        ret
cb_2A9A7:
        DISP_CURSOR     5, 23h, 37h
        ret
cb_2A9B0:
        DISP_CURSOR     61h, 0fh, 13h
        ret
cb_2A9B9:
        DISP_CURSOR     43h, 23h, 37h
        ret
cb_2A9C2:
        DISP_CURSOR     9fh, 0fh, 13h
        ret
cb_2A9CB:
        DISP_CURSOR     81h, 23h, 37h
        ret
cb_2A9D4:
        mov     cl, 0ddh
        mov     ch, 0fh
        mov     al, 13h
        int     0b0h
        ret
cb_2A9DD:
        DISP_CURSOR     0bfh, 23h, 37h
        ret
far_2A116:
        mov     word ptr [A3_FP_013A2], far_2A116-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A99E-APP3_CSBASE
        FIELD_WHEEL     ds, 7b3h, 0, 0, 80h, field_cb_none-APP3_CSBASE
        if      FW_VERSION >= 110
        if      FW_VERSION >= 114
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2A286-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+far_2A14E-APP3_SEG*16), APP3_SEG
        elseif  FW_VERSION >= 112
        KEY_CURSOR      0000h, 0000h, EP_APP3_42A6_OFF, APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_2A14E-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      0000h, 0000h, EP_FAR_2A186_OFF, APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_2A14E-APP3_SEG*16), APP3_SEG
        endif
        if      FW_VERSION >= 120
        KEY_DOWN        20h, EP_L_2A835_OFF, APP3_SEG
        else
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        endif
        retf
far_2A14E:
        mov     word ptr [A3_FP_013A2], far_2A14E-APP3_CSBASE
        mov     word ptr [A3_W_013A6_2], cb_2A9A7-APP3_CSBASE
        mov     cx, ds
        mov     si, 7b4h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 21h
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        if      FW_VERSION >= 114
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2AA8E-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_2A116-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_DOWN        20h, (APP3_BASE+L_2A835-APP3_SEG*16), APP3_SEG
        retf
L_2A286:
        mov     word ptr [A3_FP_013A2], L_2A286-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9B0-APP3_CSBASE
        mov     cx, ds
        mov     si, 7b5h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 80h
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_CURSOR      (APP3_BASE+far_2A116-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2AAC6-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2AA8E-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 120
        KEY_DOWN        20h, EP_L_2A835_OFF, APP3_SEG
        else
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        endif
        retf
L_2AA8E:
        mov     word ptr [A3_FP_013A2], L_2AA8E-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9B9-APP3_CSBASE
        mov     cx, ds
        mov     si, 7b6h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 21h
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_CURSOR      (APP3_BASE+far_2A14E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A2F6-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A286-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_DOWN        20h, (APP3_BASE+L_2A835-APP3_SEG*16), APP3_SEG
        retf
L_2AAC6:
        mov     word ptr [A3_FP_013A2], L_2AAC6-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9C2-APP3_CSBASE
        mov     cx, ds
        mov     si, 7b7h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 80h
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_CURSOR      (APP3_BASE+L_2A286-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2AB36-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A2F6-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 120
        KEY_DOWN        20h, EP_L_2A835_OFF, APP3_SEG
        else
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        endif
        retf
L_2A2F6:
        mov     word ptr [A3_FP_013A2], L_2A2F6-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9CB-APP3_CSBASE
        mov     cx, ds
        mov     si, 7b8h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 21h
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_CURSOR      (APP3_BASE+L_2AA8E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2AB6E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2AAC6-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_DOWN        20h, (APP3_BASE+L_2A835-APP3_SEG*16), APP3_SEG
        retf
L_2AB36:
        mov     word ptr [A3_FP_013A2], L_2AB36-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9D4-APP3_CSBASE
        mov     cx, ds
        mov     si, 7b9h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 80h
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_CURSOR      (APP3_BASE+L_2AAC6-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2AB6E-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 120
        KEY_DOWN        20h, EP_L_2A835_OFF, APP3_SEG
        else
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        endif
        retf
L_2AB6E:
        mov     word ptr [A3_FP_013A2], L_2AB6E-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9DD-APP3_CSBASE
        mov     cx, ds
        mov     si, 7bah
        mov     bl, 0
        mov     bh, 0
        mov     dx, 21h
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_CURSOR      (APP3_BASE+L_2A2F6-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2AB36-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_DOWN        20h, (APP3_BASE+L_2A835-APP3_SEG*16), APP3_SEG
        retf
L_29D7F:
        mov     word ptr [A3_W_01398], L_29D7F-APP3_CSBASE
        mov     al, 1
        int     7ah
        mov     al, 5
        mov     byte ptr [A2_B_00F2F], al
        int     0adh
        mov     ax, 3b99h
        mov     bx, cs
        mov     cx, 403ch
        else
        if      FW_VERSION >= 112
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2A2BE-APP3_SEG*16), APP3_SEG, EP_APP3_4236_OFF, APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+FAR_2A1BE-APP3_SEG*16), APP3_SEG, EP_FAR_2A116_OFF, APP3_SEG, 0000h, 0000h
        endif
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        db      0cbh
L_2A286:
        mov     word ptr [A3_FP_013A2], L_2A286-APP3_CSBASE
        mov     word ptr [A3_W_013A6_2], cb_2A9B0-APP3_CSBASE
        mov     cx, ds
        mov     si, 7b5h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 80h
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        if      FW_VERSION < 112
        KEY_CURSOR      EP_FAR_2A116_OFF, APP3_SEG, EP_FAR_2A1F6_OFF, APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_2A1BE-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      EP_APP3_4236_OFF, APP3_SEG, EP_APP3_4316_OFF, APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A2BE-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
far_2A1BE                       equ     $+1
        db      0cbh
        if      FW_VERSION >= 111
L_2A2BE:
        mov     word ptr [A3_FP_013A2], L_2A2BE-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9B9-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b6h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 21h, 00h, 0bfh, 0dch
        else
cb_2A1A1_110:
        mov     word ptr [A3_FP_013A2], cb_2A1A1_110-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9B9-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b6h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 21h, 00h, 0bfh, 0cfh
        endif
        db      18h, 0cdh, 7dh
        if      FW_VERSION >= 112
        KEY_CURSOR      (APP3_BASE+FAR_2A14E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A32E-APP3_SEG*16), APP3_SEG, EP_APP3_42A6_OFF, APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      (APP3_BASE+FAR_2A14E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A22E-APP3_SEG*16), APP3_SEG, EP_FAR_2A186_OFF, APP3_SEG, 0000h, 0000h
        endif
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        db      0cbh
L_2A2F6:
        mov     word ptr [A3_FP_013A2], L_2A2F6-APP3_CSBASE
        mov     word ptr [A3_W_013A6_2], cb_2A9C2-APP3_CSBASE
        mov     cx, ds
        mov     si, 7b7h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 80h
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        if      FW_VERSION < 112
        KEY_CURSOR      EP_FAR_2A186_OFF, APP3_SEG, (APP3_BASE+FAR_2A266-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A22E-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      EP_APP3_42A6_OFF, APP3_SEG, (APP3_BASE+L_2A366-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A32E-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
L_2A22E                         equ     $+1
        db      0cbh
        if      FW_VERSION >= 111
L_2A32E:
        mov     word ptr [A3_FP_013A2], L_2A32E-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9CB-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b8h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 21h, 00h, 0bfh, 0dch
        else
cb_2A211_110:
        mov     word ptr [A3_FP_013A2], cb_2A211_110-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9CB-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b8h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 21h, 00h, 0bfh, 0cfh
        endif
        db      18h, 0cdh, 7dh
        if      FW_VERSION >= 112
        KEY_CURSOR      (APP3_BASE+L_2A2BE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A39E-APP3_SEG*16), APP3_SEG, EP_APP3_4316_OFF, APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      (APP3_BASE+FAR_2A1BE-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_2A29E-APP3_SEG*16), APP3_SEG, EP_FAR_2A1F6_OFF, APP3_SEG, 0000h, 0000h
        endif
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
far_2A266                       equ     $+1
        db      0cbh
L_2A366:
        mov     word ptr [A3_FP_013A2], L_2A366-APP3_CSBASE
        mov     word ptr [A3_W_013A6_2], cb_2A9D4-APP3_CSBASE
        mov     cx, ds
        mov     si, 7b9h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 80h
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        if      FW_VERSION < 112
        KEY_CURSOR      EP_FAR_2A1F6_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+FAR_2A29E-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      EP_APP3_4316_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2A39E-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
far_2A29E                       equ     $+1
        db      0cbh
        if      FW_VERSION >= 111
L_2A39E:
        mov     word ptr [A3_FP_013A2], L_2A39E-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9DD-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0bah, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 21h, 00h, 0bfh, 0dch
        else
cb_2A281_110:
        mov     word ptr [A3_FP_013A2], cb_2A281_110-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9DD-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0bah, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 21h, 00h, 0bfh, 0cfh
        endif
        db      18h, 0cdh, 7dh
        if      FW_VERSION >= 112
        KEY_CURSOR      (APP3_BASE+L_2A32E-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A366-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      (APP3_BASE+L_2A22E-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_2A266-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        endif
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        db      0cbh
L_29D7F:
        mov     word ptr [A3_W_01398], L_29D7F-APP3_CSBASE
        mov     al, 1
        int     7ah
        mov     al, 5
        mov     byte ptr [A2_B_00F2F], al
        int     0adh
        if      FW_VERSION < 111
        mov     ax, 3b8ch
        else
        mov     ax, 3b99h
        endif
        mov     bx, cs
        if      FW_VERSION < 111
        mov     cx, 402fh
        else
        mov     cx, 403ch
        endif
        endif
        mov     dx, cs
        push    ds
        int     4ch
        pop     ds
        else
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2A2F6-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A286-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        db      0cbh
L_2A286:
        mov     word ptr [A3_FP_013A2], L_2A286-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9A7-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b4h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 21h, 00h, 0bfh
        db      0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2A366-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_2A116-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        db      0cbh
L_2A2F6:
        mov     word ptr [A3_FP_013A2], L_2A2F6-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9B0-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b5h, 07h
        db      0b3h, 00h, 0b7h, 00h, 0bah, 80h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+far_2A116-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29C9F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2A366-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        db      0cbh
L_2A366:
        mov     word ptr [A3_FP_013A2], L_2A366-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9B9-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b6h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 21h, 00h, 0bfh
        db      0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_2A286-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29CD7-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2A2F6-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        db      0cbh
L_29C9F:
        mov     word ptr [A3_FP_013A2], L_29C9F-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9C2-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b7h, 07h
        db      0b3h, 00h, 0b7h, 00h, 0bah, 80h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_2A2F6-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29D0F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29CD7-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        db      0cbh
L_29CD7:
        mov     word ptr [A3_FP_013A2], L_29CD7-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9CB-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b8h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 21h, 00h, 0bfh
        db      0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_2A366-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29D47-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_29C9F-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        db      0cbh
L_29D0F:
        mov     word ptr [A3_FP_013A2], L_29D0F-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9D4-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0b9h, 07h
        db      0b3h, 00h, 0b7h, 00h, 0bah, 80h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_29C9F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_29D47-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        db      0cbh
L_29D47:
        mov     word ptr [A3_FP_013A2], L_29D47-APP3_CSBASE
        mov     word ptr [A3_W_013A6], cb_2A9DD-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0bah, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 21h, 00h, 0bfh
        db      0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      (APP3_BASE+L_29CD7-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_29D0F-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_DOWN        20h, EP_MIDI_SW_SCREEN_PAINT_OFF, APP3_SEG
        db      0cbh
L_29D7F:
        db      0c7h
        db      06h, 98h, 13h, 0bfh, 43h, 0b0h, 01h, 0cdh, 7ah, 0b0h, 05h, 0a2h, 2fh, 0fh, 0cdh, 0adh
        db      0b8h, 62h, 3bh, 8ch, 0cbh, 0b9h, 05h, 40h, 8ch, 0cah, 1eh, 0cdh, 4ch, 1fh
        endif
        KEY_LOCATE      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_TRANSPORT   0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        retf
fn_2ABF2:
        call    fn_2AC68
        push    cs
        call    L_2A745
        mov     byte ptr [A3_B_0157B], 1
        mov     word ptr [A3_W_01567], field_cb_none-APP3_CSBASE
        ret
fn_2AC05:
        call    fn_2AC68
        push    cs
        call    L_2A5E9
        mov     byte ptr [A3_B_0157B], 1
        mov     word ptr [A3_W_01567], field_cb_none-APP3_CSBASE
        ret
tgt_2AC18:
        call    fn_2AC68
        mov     word ptr [A3_W_01567], field_cb_none-APP3_CSBASE
        push    cs
        call    L_2A745
        mov     byte ptr [A3_B_0157B], 0
        ret
tgt_2AC2B:
        pusha
        call    fn_2AC68
        push    cs
        call    L_2A745
        mov     byte ptr [A3_B_0157B], 2
        popa
        mov     word ptr [A3_W_01567], bp
        ret
tgt_2AC3E:
        call    fn_2AC68
        mov     word ptr [A3_W_01567], field_cb_none-APP3_CSBASE
        push    cs
        call    L_2A5E9
        mov     byte ptr [A3_B_0157B], 0
        ret
L_2AC51:
        mov     word ptr [A3_W_01567], di
        call    fn_2AC68
        mov     word ptr [A3_W_01561], field_cb_none-APP3_CSBASE
        push    cs
        call    L_2A745
        mov     byte ptr [A3_B_0157B], 1
        ret
fn_2AC68:
        mov     byte ptr [A3_B_0155B], cl
        mov     byte ptr [A3_B_0155C], ch
        mov     word ptr [A3_W_0155D], ax
        mov     word ptr [A3_W_0155F], bx
        mov     word ptr [A3_W_01563], bp
        mov     word ptr [A3_W_01565], dx
        mov     word ptr [A3_W_01561], di
        mov     word ptr [A3_W_01569], si
        mov     word ptr [A3_W_0156B], cs
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[A3_W_0001A]
        mov     word ptr [A3_W_01559], ax
        KEY_DOWN        20h, (APP3_BASE+L_2AC9F-APP3_SEG*16), APP3_SEG
        ret
L_2AC9F:
        callf   [A3_W_01569]
        call    word ptr [A3_W_0156D]
        retf
cb_2ACA8:
        DISP_CURSOR     byte ptr [155bh], byte ptr [155ch], 13h
        ret
cb_2ACB5:
        mov     al, byte ptr [A3_B_0155B]
        add     al, 18h
        mov     cl, al
        mov     ch, byte ptr [A3_B_0155C]
        mov     al, 0dh
        int     0b0h
        ret
cb_2ACC5:
        mov     al, byte ptr [A3_B_0155B]
        add     al, 2ah
        DISP_CURSOR     al, byte ptr [155ch], 0dh
        ret
cb_2ACD5:
        mov     al, byte ptr [A3_B_0155B]
        add     al, 3ch
        DISP_CURSOR     al, byte ptr [155ch], 13h
        ret
cb_2ACE5:
        mov     al, byte ptr [A3_B_0155B]
        add     al, 54h
        DISP_CURSOR     al, byte ptr [155ch], 0dh
        ret
cb_2ACF5:
        mov     al, byte ptr [A3_B_0155B]
        add     al, 66h
        DISP_CURSOR     al, byte ptr [155ch], 0dh
        ret
cb_2AD05:
        mov     al, byte ptr [A3_B_0155B]
        inc     al
        DISP_CURSOR     al, byte ptr [155ch], 2fh
        ret
cb_2AD15:
        mov     al, byte ptr [A3_B_0155B]
        add     al, 37h
        DISP_CURSOR     al, byte ptr [155ch], 2fh
        ret
L_2A745:
        mov     word ptr [A3_W_0156D], cb_2ACA8-APP3_CSBASE
        mov     bx, 96h
        mov     dx, cs
        mov     si, word ptr [A3_W_0155D]
        int     0a6h
        mov     bx, 9ch
        mov     dx, cs
        mov     si, word ptr [A3_W_0155F]
        int     0a6h
        mov     bx, 8ah
        mov     dx, cs
        mov     si, word ptr [A3_W_01561]
        int     0a6h
        KEY_DOWN        18h, EP_L_2A4C4_OFF, EP_L_2A4C4_SEG
        mov     ax, word ptr [A3_W_0154D]
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, intcb_2AD64-APP3_CSBASE
        int     7fh
        retf
intcb_2AD64:
        cmp     ax, word ptr [A3_W_01559]
        jb      L_2A78D
        mov     ax, word ptr [A3_W_01559]
L_2A78D:
        mov     word ptr [A3_W_0154D], ax
        call    fn_2B050
        jbe     L_2A7AF
        mov     ax, word ptr [A3_W_0154D]
        mov     word ptr [A3_W_01551], ax
        mov     byte ptr [A3_B_0154F], 0
        mov     byte ptr [A3_B_01550], 0
        mov     byte ptr [A3_B_01553], 0
        mov     byte ptr [A3_B_01554], 0
L_2A7AF:
        push    cs
        call    L_2A745
        retf
L_2A4C4:
        mov     word ptr [A3_W_0156D], cb_2ACB5-APP3_CSBASE
        KEY_DOWN        17h, EP_L_2A745_OFF, EP_L_2A745_SEG
        KEY_DOWN        18h, EP_L_2A834_OFF, EP_L_2A834_SEG
        mov     al, byte ptr [A3_B_0154F]
        mov     ah, 0
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, intcb_2ADBC-APP3_CSBASE
        int     7fh
        retf
intcb_2ADBC:
        mov     byte ptr [A3_B_0154F], al
        mov     si, word ptr [A3_W_0154D]
        cmp     si, word ptr [A3_W_01559]
        jb      L_2A7F5
        mov     byte ptr [A3_B_0154F], 0
        mov     byte ptr [A3_B_01550], 0
        jmp     br_2AE0F
L_2A7F5:
        mov     al, byte ptr [A3_B_0154F]
        mov     cl, byte ptr [A3_B_01550]
        call    fn_2B029
        jb      br_2ADFA
        mov     ax, word ptr es:[si+4]
        mov     dx, word ptr es:[si+6]
        sub     ax, word ptr es:[si]
        div     byte ptr es:[si+3]
        dec     al
        mov     byte ptr [A3_B_0154F], al
        mov     byte ptr [A3_B_01550], 0
br_2ADFA:
        call    fn_2B050
        jbe     br_2AE0F
        mov     al, byte ptr [A3_B_0154F]
        mov     byte ptr [A3_B_01553], al
        mov     byte ptr [A3_B_01550], 0
        mov     byte ptr [A3_B_01554], 0
br_2AE0F:
        push    cs
        call    L_2A4C4
        retf
L_2A834:
        mov     word ptr [A3_W_0156D], cb_2ACC5-APP3_CSBASE
        mov     bx, 96h
        mov     dx, cs
        mov     si, word ptr [A3_W_0155D]
        int     0a6h
        mov     bx, 9ch
        mov     dx, cs
        mov     si, word ptr [A3_W_0155F]
        int     0a6h
        KEY_DOWN        17h, EP_L_2A4C4_OFF, EP_L_2A4C4_SEG
        KEY_DOWN        18h, EP_L_2A5E9_OFF, EP_L_2A5E9_SEG
        cmp     byte ptr [A3_B_0157B], 1
        je      L_2AE61
        mov     bx, 90h
        mov     dx, cs
        mov     si, word ptr [A3_W_01567]
        int     0a6h
        cmp     byte ptr [A3_B_0157B], 2
        je      L_2AE61
        KEY_DOWN        18h, 0000h, 0000h
L_2AE61:
        db      0a0h, 50h, 15h
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 63h
        mov     di, intcb_2AE73-APP3_CSBASE
        int     7fh
        retf
intcb_2AE73:
        mov     byte ptr [A3_B_01550], al
        mov     si, word ptr [A3_W_0154D]
        cmp     si, word ptr [A3_W_01559]
        jb      br_2AE8C
        mov     byte ptr [A3_B_0154F], 0
        mov     byte ptr [A3_B_01550], 0
        jmp     br_2AEB4
br_2AE8C:
        mov     al, byte ptr [A3_B_0154F]
        mov     cl, byte ptr [A3_B_01550]
        call    fn_2B029
        mov     al, byte ptr [A3_B_0154F]
        mov     cl, byte ptr [A3_B_01550]
        cmp     byte ptr [A3_B_01550], dh
        jb      br_2AEA9
        dec     dh
        mov     byte ptr [A3_B_01550], dh
br_2AEA9:
        call    fn_2B050
        jbe     br_2AEB4
        mov     al, byte ptr [A3_B_01550]
        mov     byte ptr [A3_B_01554], al
br_2AEB4:
        push    cs
        call    L_2A834
        retf
L_2A5E9:
        mov     word ptr [A3_W_0156D], cb_2ACD5-APP3_CSBASE
        mov     bx, 96h
        mov     dx, cs
        mov     si, word ptr [A3_W_01563]
        int     0a6h
        mov     bx, 9ch
        mov     dx, cs
        mov     si, word ptr [A3_W_01565]
        int     0a6h
        KEY_DOWN        17h, EP_L_2A834_OFF, EP_L_2A834_SEG
        cmp     byte ptr [A3_B_0157B], 0
        jne     L_2AEEC
        KEY_DOWN        17h, 0000h, 0000h
L_2AEEC:
        KEY_DOWN        18h, EP_FAR_2AF3E_OFF, EP_FAR_2AF3E_SEG
        mov     ax, word ptr [A3_W_01551]
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, intcb_2AF04-APP3_CSBASE
        int     7fh
        retf
intcb_2AF04:
        cmp     ax, word ptr [A3_W_01559]
        jb      br_2AF17
        mov     ax, word ptr [A3_W_01559]
        mov     byte ptr [A3_B_01553], 0
        mov     byte ptr [A3_B_01554], 0
br_2AF17:
        mov     word ptr [A3_W_01551], ax
        call    fn_2B050
        jbe     br_2AF39
        mov     ax, word ptr [A3_W_01551]
        mov     word ptr [A3_W_0154D], ax
        mov     byte ptr [A3_B_0154F], 0
        mov     byte ptr [A3_B_01550], 0
        mov     byte ptr [A3_B_01553], 0
        mov     byte ptr [A3_B_01554], 0
br_2AF39:
        push    cs
        call    L_2A5E9
        retf
far_2AF3E:
        mov     word ptr [A3_W_0156D], cb_2ACE5-APP3_CSBASE
        KEY_DOWN        17h, EP_L_2A5E9_OFF, EP_L_2A5E9_SEG
        KEY_DOWN        18h, EP_FAR_2AFBF_OFF, EP_FAR_2AFBF_SEG
        mov     al, byte ptr [A3_B_01553]
        mov     ah, 0
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, intcb_2AF66-APP3_CSBASE
        int     7fh
        retf
intcb_2AF66:
        mov     byte ptr [A3_B_01553], al
        mov     si, word ptr [A3_W_01551]
        cmp     si, word ptr [A3_W_01559]
        if      FW_VERSION >= 120
        db      72h, 0ch
        else
        jb      br_2AF7A
        endif
        mov     byte ptr [A3_B_01553], 0
        if      FW_VERSION >= 120
        db      0c6h, 06h
        else
        mov     byte ptr [A3_B_01554], 0
        jmp     br_2AFBA
        endif
br_2AF7A:
        if      FW_VERSION >= 120
        push    sp
        adc     ax, 0eb00h
        cmp     sp, word ptr [bx+si+A3_B_01553]
        else
        mov     al, byte ptr [A3_B_01553]
        endif
        mov     cl, byte ptr [A3_B_01554]
        call    fn_2B029
        jb      br_2AFA5
        mov     ax, word ptr es:[si+4]
        sub     ax, word ptr es:[si]
        div     byte ptr es:[si+3]
        dec     al
        mov     byte ptr [A3_B_01553], al
        mov     byte ptr [A3_B_01550], 0
        mov     byte ptr [A3_B_01554], 0
br_2AFA5:
        call    fn_2B050
        jbe     br_2AFBA
        mov     al, byte ptr [A3_B_01553]
        mov     byte ptr [A3_B_0154F], al
        mov     byte ptr [A3_B_01550], 0
        mov     byte ptr [A3_B_01554], 0
br_2AFBA:
        push    cs
        call    far_2AF3E
        retf
far_2AFBF:
        mov     word ptr [A3_W_0156D], cb_2ACF5-APP3_CSBASE
        KEY_DOWN        17h, EP_FAR_2AF3E_OFF, EP_FAR_2AF3E_SEG
        mov     bx, 90h
        mov     dx, cs
        mov     si, word ptr [A3_W_01567]
        int     0a6h
        mov     al, byte ptr [A3_B_01554]
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 63h
        mov     di, intcb_2AFEA-APP3_CSBASE
        int     7fh
        retf
intcb_2AFEA:
        mov     byte ptr [A3_B_01554], al
        mov     si, word ptr [A3_W_01551]
        cmp     si, word ptr [A3_W_01559]
        jb      br_2B003
        mov     byte ptr [A3_B_01553], 0
        mov     byte ptr [A3_B_01554], 0
        jmp     br_2B024
br_2B003:
        mov     al, byte ptr [A3_B_01553]
        mov     cl, byte ptr [A3_B_01554]
        call    fn_2B029
        cmp     byte ptr [A3_B_01554], dh
        jb      br_2B019
        dec     dh
        mov     byte ptr [A3_B_01554], dh
br_2B019:
        call    fn_2B050
        jbe     br_2B024
        mov     al, byte ptr [A3_B_01554]
        mov     byte ptr [A3_B_01550], al
br_2B024:
        push    cs
        call    far_2AFBF
        retf
fn_2B029:
        mov     es, word ptr [A3_W_00F10]
        shl     si, 2
        add     si, 1500h
        mov     dx, word ptr es:[si+2]
        mul     dh
        add     ax, word ptr es:[si]
        adc     dl, 0
        mov     ch, 0
        add     ax, cx
        adc     dl, 0
        sub     ax, word ptr es:[si+4]
        sbb     dl, byte ptr es:[si+6]
        ret
fn_2B050:
        mov     es, word ptr [A3_W_00F10]
        mov     si, word ptr [A3_W_0154D]
        mov     di, word ptr [A3_W_01551]
        shl     si, 2
        shl     di, 2
        add     si, 1500h
        add     di, 1500h
        mov     al, byte ptr [A3_B_01553]
        mul     byte ptr es:[di+3]
        add     al, byte ptr [A3_B_01554]
        adc     ah, 0
        mov     bx, ax
        add     bx, word ptr es:[di]
        mov     cl, byte ptr es:[di+2]
        adc     cl, 0
        mov     al, byte ptr [A3_B_0154F]
        mul     byte ptr es:[si+3]
        add     al, byte ptr [A3_B_01550]
        adc     ah, 0
        add     ax, word ptr es:[si]
        mov     dl, byte ptr es:[si+2]
        adc     dl, 0
        sub     ax, bx
        sbb     dl, cl
        jae     br_2B0A3
        ret
br_2B0A3:
        or      al, ah
        or      al, cl
        ret
tgt_2B0A8:
        mov     byte ptr [A3_B_0155B], cl
        mov     byte ptr [A3_B_0155C], ch
        mov     word ptr [A3_W_0155D], ax
        mov     word ptr [A3_W_0155F], bx
        mov     word ptr [A3_W_01561], di
        mov     word ptr [A3_W_01569], si
        mov     word ptr [A3_W_0156B], cs
        mov     ax, 0f800h
        mov     es, ax
        sub     ax, ax
        cmp     byte ptr es:[12h], 0
        je      br_2B0D6
        mov     ax, word ptr es:[A3_W_0001A]
br_2B0D6:
        mov     word ptr [A3_W_01559], ax
        KEY_DOWN        20h, (APP3_BASE+L_2AC9F-APP3_SEG*16), APP3_SEG
        push    cs
        call    L_2AB06
        ret
L_2AB06:
        mov     word ptr [A3_W_0156D], cb_2ACA8-APP3_CSBASE
        mov     bx, 96h
        mov     dx, cs
        mov     si, word ptr [A3_W_0155D]
        int     0a6h
        mov     bx, 9ch
        mov     dx, cs
        mov     si, word ptr [A3_W_0155F]
        int     0a6h
        mov     bx, 8ah
        mov     dx, cs
        mov     si, word ptr [A3_W_01561]
        int     0a6h
        KEY_DOWN        18h, EP_FAR_2B136_OFF, EP_FAR_2B136_SEG
        mov     ax, word ptr [A3_W_01555]
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, intcb_2B125-APP3_CSBASE
        int     7fh
        retf
intcb_2B125:
        cmp     ax, word ptr [A3_W_01559]
        jb      br_2B12E
        mov     ax, word ptr [A3_W_01559]
br_2B12E:
        mov     word ptr [A3_W_01555], ax
        push    cs
        call    L_2AB06
        retf
far_2B136:
        mov     word ptr [A3_W_0156D], cb_2ACB5-APP3_CSBASE
        KEY_DOWN        17h, EP_L_2AB06_OFF, EP_L_2AB06_SEG
        KEY_DOWN        18h, EP_FAR_2B1A1_OFF, EP_FAR_2B1A1_SEG
        mov     al, byte ptr [A3_B_01557]
        mov     ah, 0
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, intcb_2B15E-APP3_CSBASE
        int     7fh
        retf
intcb_2B15E:
        mov     byte ptr [A3_B_01557], al
        mov     si, word ptr [A3_W_01555]
        cmp     si, word ptr [A3_W_01559]
        if      FW_VERSION >= 120
        db      72h
        or      al, 0c6h
        push    es
        push    di
        adc     ax, 0c600h
        push    es
        else
        jb      br_2B172
        mov     byte ptr [A3_B_01557], 0
        mov     byte ptr [A3_B_01558], 0
        jmp     br_2B19C
        endif
br_2B172:
        if      FW_VERSION >= 120
        pop     ax
        adc     ax, 0eb00h
        and     ax, 57a0h
        adc     ax, 0e8ah
        pop     ax
        adc     ax, 0a8e8h
        db      0feh
        else
        mov     al, byte ptr [A3_B_01557]
        mov     cl, byte ptr [A3_B_01558]
        call    fn_2B029
        endif
        jb      br_2B19C
        mov     ax, word ptr es:[si+4]
        mov     dx, word ptr es:[si+6]
        sub     ax, word ptr es:[si]
        div     byte ptr es:[si+3]
        dec     al
        mov     byte ptr [A3_B_01557], al
        mov     byte ptr [A3_B_01558], 0
br_2B19C:
        push    cs
        call    far_2B136
        retf
far_2B1A1:
        mov     word ptr [A3_W_0156D], cb_2ACC5-APP3_CSBASE
        mov     bx, 96h
        mov     dx, cs
        mov     si, word ptr [A3_W_0155D]
        int     0a6h
L_2B1B2:
        mov     bx, 9ch
        mov     dx, cs
        mov     si, word ptr [A3_W_0155F]
        int     0a6h
        KEY_DOWN        17h, EP_FAR_2B136_OFF, EP_FAR_2B136_SEG
        KEY_DOWN        18h, 0000h, 0000h
        mov     al, byte ptr [A3_B_01558]
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 63h
        mov     di, intcb_2B1DF-APP3_CSBASE
        int     7fh
        retf
intcb_2B1DF:
        mov     byte ptr [A3_B_01558], al
        mov     si, word ptr [A3_W_01555]
        cmp     si, word ptr [A3_W_01559]
        jb      br_2B1F8
        mov     byte ptr [A3_B_01557], 0
        mov     byte ptr [A3_B_01558], 0
        jmp     br_2B215
br_2B1F8:
        mov     al, byte ptr [A3_B_01557]
        mov     cl, byte ptr [A3_B_01558]
        call    fn_2B029
        mov     al, byte ptr [A3_B_01557]
        mov     cl, byte ptr [A3_B_01558]
        cmp     byte ptr [A3_B_01558], dh
        jb      br_2B215
        dec     dh
        mov     byte ptr [A3_B_01558], dh
br_2B215:
        push    cs
        call    far_2B1A1
        retf
fn_2B21A:
        mov     word ptr [A3_W_01567], di
        call    fn_2AC68
        mov     word ptr [A3_W_01561], field_cb_none-APP3_CSBASE
        push    cs
        call    far_2B22C
        ret
far_2B22C:
        mov     word ptr [A3_W_0156D], cb_2AD05-APP3_CSBASE
        mov     bx, 96h
        mov     dx, cs
        mov     si, word ptr [A3_W_0155D]
        int     0a6h
        mov     bx, 9ch
        mov     dx, cs
        mov     si, word ptr [A3_W_0155F]
        int     0a6h
        mov     bx, 8ah
        mov     dx, cs
        mov     si, word ptr [A3_W_01561]
        int     0a6h
        KEY_DOWN        18h, EP_FAR_2B290_OFF, EP_FAR_2B290_SEG
        mov     al, byte ptr [A3_B_01577]
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2B26D-APP3_CSBASE
        int     7fh
        retf
intcb_2B26D:
        mov     byte ptr [A3_B_01577], al
        cmp     al, byte ptr [A3_B_01578]
        jb      br_2B279
        mov     byte ptr [A3_B_01578], al
br_2B279:
        push    cs
        call    far_2B22C
        retf
fn_2B27E:
        mov     word ptr [A3_W_01567], di
        call    fn_2AC68
        mov     word ptr [A3_W_01561], field_cb_none-APP3_CSBASE
        push    cs
        call    far_2B290
        ret
far_2B290:
        mov     word ptr [A3_W_0156D], cb_2AD15-APP3_CSBASE
        mov     bx, 96h
        mov     dx, cs
        mov     si, word ptr [A3_W_01563]
        int     0a6h
        mov     bx, 9ch
        mov     dx, cs
        mov     si, word ptr [A3_W_01565]
        int     0a6h
        KEY_DOWN        17h, EP_FAR_2B22C_OFF, EP_FAR_2B22C_SEG
        mov     bx, 90h
        mov     dx, cs
        mov     si, word ptr [A3_W_01567]
        int     0a6h
        mov     al, byte ptr [A3_B_01578]
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, A3_W_04B21
        int     7fh
        retf
d_a3_w_04b21:
        db      0a2h, 78h, 15h, 3ah, 06h, 77h, 15h
        jae     L_2B2DD
        mov     byte ptr [A3_B_01577], al
L_2B2DD:
        push    cs
        call    far_2B290
        retf
fn_2B2E2:
        if      FW_VERSION >= 114
far_2AE3A                       equ     $+0328h
far_2AE92                       equ     $+0380h
        endif
        if      FW_VERSION >= 111
        KEY_WHEEL       (APP3_BASE+L_2B2F1-APP3_SEG*16), APP3_SEG
        else
        KEY_WHEEL       (APP3_BASE+L_2AA04-APP3_SEG*16), APP3_SEG
        endif
        if      FW_VERSION >= 110
        KEY_DOWN        22h, EP_L_2B31A_OFF, APP3_SEG
        ret
        if      FW_VERSION >= 120
L_2B2F1:
        db      02h, 06h, 7ah, 15h, 2ah, 0c1h, 73h, 02h, 0b0h, 00h, 3ch
        else
L_2AA04:
L_2B2F1:
        add     al, byte ptr [A3_B_0157A]
        sub     al, cl
        jae     br_2B2FC
        mov     al, 0
        endif
        else
        KEY_DOWN        22h, (APP3_BASE+L_2B31A-APP3_SEG*16), APP3_SEG
L_2AA04                         equ     $+1
        db      0c3h, 02h
        push    es
        jp      L_2AD2A
        sub     al, cl
        jae     br_2B2FC
        mov     al, 0
        endif
br_2B2FC:
        if      FW_VERSION >= 120
        and     si, word ptr [bp+di+0bh]
        else
        cmp     al, 23h
        jae     L_2AD2A
        endif
        mov     byte ptr [A3_B_01579], 41h
        mov     byte ptr [A3_B_0157A], 22h
        retf
L_2AD2A:
        db      3ch, 63h
        jb      L_2B310
        if      FW_VERSION < 110
        mov     al, 62h
        endif
        if      FW_VERSION >= 110
        mov     al, 62h
        endif
L_2B310:
        mov     byte ptr [A3_B_0157A], al
        int     7bh
        mov     byte ptr [A3_B_01579], ah
        retf
L_2B31A:
        cmp     cl, 0
        jne     br_2B320
        retf
br_2B320:
        cmp     al, 23h
        jae     br_2B325
        retf
br_2B325:
        mov     byte ptr [A3_B_01579], ah
        mov     byte ptr [A3_B_0157A], al
        retf
fn_2B32D:
        mov     ax, word ptr [A3_W_0154D]
        mov     dl, byte ptr [A3_B_0154F]
        mov     cl, byte ptr [A3_B_01550]
        mov     dh, 0
        mov     ch, 0
        mov     bl, 0bh
        int     87h
        ret
tgt_2B341:
        mov     es, word ptr [A3_W_00F10]
        cmp     ax, word ptr es:[A3_W_0001A]
        jb      br_2B354
        mov     ax, word ptr es:[A3_W_0001A]
        sub     dx, dx
        sub     cx, cx
br_2B354:
        mov     si, ax
        shl     si, 2
        add     si, 1500h
        mov     al, byte ptr es:[si+3]
        mul     dl
        add     ax, cx
        sub     dx, dx
        add     ax, word ptr es:[si]
        adc     dl, byte ptr es:[si+2]
        ret
fn_2B36F:
        mov     es, word ptr [A3_W_00F10]
        mov     si, word ptr [A3_W_01551]
        shl     si, 2
        add     si, 1500h
        mov     al, byte ptr es:[si+3]
        mul     byte ptr [A3_B_01553]
        add     al, byte ptr [A3_B_01554]
        adc     ah, 0
        add     ax, word ptr es:[si]
        mov     dl, byte ptr es:[si+2]
        adc     dl, 0
        mov     dh, 0
        mov     word ptr [A3_W_0156F], ax
        mov     word ptr [A3_W_01571], dx
        ret
L_2B3A1:
        call    fn_280CB
        je      br_2B3A7
        retf
br_2B3A7:
        int     58h
        or      ax, ax
        jne     br_2B3AE
        retf
br_2B3AE:
        cmp     al, byte ptr [A3_B_01577]
        jne     br_2B3BB
        cmp     ah, byte ptr [A3_B_01578]
        jne     br_2B3BB
        retf
br_2B3BB:
        mov     byte ptr [A3_B_01577], al
        mov     byte ptr [A3_B_01578], ah
        int     0b2h
        retf
fn_2B3C5:
        sub     ax, ax
        mov     word ptr [A3_W_0154D], ax
        mov     byte ptr [A3_B_0154F], al
        mov     byte ptr [A3_B_01550], al
        mov     byte ptr [A3_B_01553], al
        mov     byte ptr [A3_B_01554], al
        mov     word ptr [C0_W_02AD8], ax
        mov     byte ptr [C0_B_02ADA], al
        mov     byte ptr [C0_B_02ADB], al
        mov     word ptr [C0_W_02ADC], ax
        mov     byte ptr [C0_B_02ADE], al
        mov     byte ptr [C0_B_02ADF], al
        mov     word ptr [A3_W_0071E], ax
        mov     word ptr [A3_W_00720], ax
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[A3_W_0001A]
        mov     word ptr [A3_W_01551], ax
        mov     word ptr [C0_W_02ADC], ax
        ret
        ret
fn_2B3FE:
        mov     bx, ds
        mov     ds, bp
        mov     es, dx
        mov     cx, 4
        rep movsw
        or      si, si
        jne     br_2B413
        add     bp, 1000h
        mov     ds, bp
br_2B413:
        or      di, di
        jne     br_2B41D
        add     dx, 1000h
        mov     es, dx
br_2B41D:
        cmp     al, 0f0h
        jne     br_2B441
loop_2B421:
        mov     al, byte ptr [si+4]
        mov     cx, 4
        rep movsw
        or      si, si
        jne     br_2B433
        add     bp, 1000h
        mov     ds, bp
br_2B433:
        or      di, di
        jne     br_2B43D
        add     dx, 1000h
        mov     es, dx
br_2B43D:
        cmp     al, 0f8h
        jne     loop_2B421
br_2B441:
        mov     ds, bx
        ret
fn_2B444:
        add     si, 8
        jae     br_2B44F
        add     bp, 1000h
        mov     es, bp
br_2B44F:
        cmp     al, 0f0h
        jne     br_2B466
loop_2B453:
        mov     al, byte ptr es:[si+4]
        add     si, 8
        jae     br_2B462
        add     bp, 1000h
        mov     es, bp
br_2B462:
        cmp     al, 0f8h
        jne     loop_2B453
br_2B466:
        ret
L_2B467:
        call    fn_280BD
        je      br_2B46D
        retf
br_2B46D:
        int     0a4h
        KEY_DOWN        20h, (APP3_BASE+L_2B494-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        13h, EP_FAR_2B6BA_OFF, APP3_SEG
        KEY_DOWN        16h, EP_FAR_2B6BA_OFF, APP3_SEG
        KEY_DOWN        27h, EP_FAR_2B6BA_OFF, APP3_SEG
        db      0ffh, 1eh, 7ch, 15h
        else
        KEY_DOWN        13h, EP_APP3_4F0A_OFF, APP3_SEG
        KEY_DOWN        16h, EP_APP3_4F0A_OFF, APP3_SEG
        KEY_DOWN        27h, EP_APP3_4F0A_OFF, APP3_SEG
        db      0ffh, 1eh
        jl      br_2B49D
        endif
        retf
L_2B494:
        DISP_WIN_WIDE   "Loop"
        if      FW_VERSION < 114
br_2B49D                        equ     $+11
        else
br_2B49D:
        endif
        DISP_TEXT       3ch, 0bh, "      First bar:   "
        DISP_TEXT       3ch, 21h, "       Last bar:   "
        DISP_TEXT       3ch, 2ah, "Number of  bars:   "
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_BOX        5ah, 18h, 0bh, 04h
        DISP_FILL       64h, 18h, 0bh, 04h
        DISP_FILL       78h, 18h, 0bh, 04h
        DISP_BOX        82h, 18h, 0bh, 04h
        DISP_BOX        8ch, 18h, 0bh, 04h
        db      0beh, 14h, 00h
        DISP_BMP        65h, 14h, 14h
        db      0beh, 13h, 00h
        DISP_BMP        7bh, 1ch, 13h
        db      0beh, 15h, 00h
        DISP_BMP        6eh, 16h, 15h
        db      0beh, 16h, 00h
        DISP_BMP        6eh, 1ah, 16h
        db      0beh, 15h, 00h
        DISP_BMP        77h, 16h, 15h
        db      0beh, 16h, 00h
        DISP_BMP        77h, 1ah, 16h
        db      8eh, 06h
        db      10h, 0fh, 26h, 0a1h, 30h, 00h, 40h, 06h
        DISP_NUMR       9ch, 0bh, 03h
        DISP_TEXT       9ch, 21h, "END"
        db      07h, 26h, 0a1h, 1ah, 00h, 26h, 8bh, 1eh, 32h
        db      00h, 83h, 0fbh, 0ffh
        je      L_2B58C
        db      53h, 06h
        DISP_TEXT       9ch, 21h, "   "
        db      07h, 58h, 40h, 50h, 06h
        DISP_NUMR       9ch, 21h, 03h
        db      07h, 58h
L_2B58C:
        db      26h, 2bh
        db      06h, 30h, 00h
        DISP_NUMR       9ch, 2ah, 03h
        db      0ffh, 16h, 80h, 15h, 0cdh, 0ach, 0cbh
        db      0b1h, 9ch, 0b5h, 0bh, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 9ch, 0b5h, 21h, 0b0h, 13h, 0cdh
        if      FW_VERSION >= 110
        db      0b0h, 0c3h, 0b1h, 9ch, 0b5h, 2ah, 0b0h, 13h, 0cdh, 0b0h, 0c3h
far_2B5B9:
        if      FW_VERSION >= 111
        db      0c7h, 06h, 80h, 15h, 0eeh
        else
        db      0c7h, 06h, 80h, 15h, 0e1h
        endif
        db      4dh, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 30h, 00h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e6h, 03h
        if      FW_VERSION >= 114
        db      0bfh, 36h, 4eh, 0cdh, 7fh
        if      FW_VERSION >= 120
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, EP_FAR_2B60A_OFF, APP3_SEG
        db      0cbh, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah
        db      00h, 72h, 05h, 26h, 0a1h, 1ah, 00h, 48h, 26h, 0a3h, 30h, 00h, 26h, 3bh, 06h, 32h ; .r.&...H&.0.&;.2
        db      00h, 72h, 04h, 26h, 0a3h, 32h, 00h, 0eh
        call    far_2B5B9
        db      0cbh
        db      0c7h, 06h, 80h, 15h
        db      0f7h, 4dh, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 32h, 00h, 3dh, 0ffh, 0ffh, 75h, 04h, 26h
        db      0a1h, 1ah, 00h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 90h, 4eh, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, EP_FAR_2B5B9_OFF, EP_FAR_2B5B9_SEG, (APP3_BASE+FAR_2B662-APP3_SEG*16), APP3_SEG
        db      0cbh, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 03h, 0b8h, 0ffh, 0ffh
        db      26h, 0a3h, 32h, 00h, 26h, 3bh, 06h, 30h, 00h, 73h, 04h, 26h, 0a3h, 30h, 00h, 0eh ; &.2.&;.0.s.&.0..
        call    far_2AE3A
        db      0cbh
far_2B662:
        db      0c7h, 06h, 80h, 15h, 00h, 4eh, 8eh, 06h, 10h, 0fh, 26h, 0a1h
        db      32h, 00h, 3dh, 0ffh, 0ffh
        jne     L_2B67A
        db      26h, 0a1h, 1ah, 00h, 48h
L_2B67A:
        db      26h, 2bh, 06h, 30h
        db      00h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e6h, 03h, 0bfh, 0eeh, 4eh, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, EP_FAR_2B60A_OFF, APP3_SEG, 0000h, 0000h
        db      0cbh
        db      8eh, 06h, 10h, 0fh, 26h, 03h, 06h, 30h, 00h, 26h, 3bh, 06h, 1ah, 00h, 72h, 03h
        db      0b8h, 0ffh, 0ffh, 26h, 0a3h, 32h, 00h, 0eh
        call    far_2AE92
        db      0cbh
        else
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, EP_APP3_4EB2_OFF, APP3_SEG
        db      0cbh, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 05h, 26h, 0a1h, 1ah
        db      00h, 48h, 26h, 0a3h, 30h, 00h, 26h, 3bh, 06h, 32h, 00h, 72h, 04h, 26h, 0a3h, 32h ; .H&.0.&;.2.r.&.2
        db      00h, 0eh, 0e8h, 0b0h, 0ffh, 0cbh
        db      0c7h, 06h, 80h, 15h, 0f7h, 4dh, 8eh, 06h, 10h, 0fh
        db      26h, 0a1h, 32h, 00h, 3dh, 0ffh, 0ffh, 75h, 04h, 26h, 0a1h, 1ah, 00h, 0b3h, 01h, 0b7h
        db      00h, 0bah, 0e7h, 03h, 0bfh, 90h, 4eh, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+far_2B5B9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2B082-APP3_SEG*16), APP3_SEG
        db      0cbh, 8eh, 06h, 10h, 0fh
        db      26h, 3bh, 06h, 1ah, 00h, 72h, 03h, 0b8h, 0ffh, 0ffh, 26h, 0a3h, 32h, 00h, 26h, 3bh
        db      06h, 30h, 00h, 73h, 04h, 26h, 0a3h, 30h, 00h, 0eh, 0e8h, 0a9h, 0ffh, 0cbh
L_2B082:
        db      0c7h, 06h
        db      80h, 15h, 00h, 4eh, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 32h, 00h, 3dh, 0ffh, 0ffh, 75h
        db      05h, 26h, 0a1h, 1ah, 00h, 48h, 26h, 2bh, 06h, 30h, 00h, 0b3h, 01h, 0b7h, 00h, 0bah
        db      0e6h, 03h, 0bfh, 0eeh, 4eh, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+far_2AE3A-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh, 8eh, 06h, 10h, 0fh, 26h, 03h
        db      06h, 30h, 00h, 26h, 3bh, 06h, 1ah, 00h, 72h, 03h, 0b8h, 0ffh, 0ffh, 26h, 0a3h, 32h
        db      00h, 0eh, 0e8h, 0a9h, 0ffh, 0cbh
        endif
        else
        if      FW_VERSION < 111
        db      0bfh, 29h, 4eh, 0cdh, 7fh
        else
        db      0bfh, 36h, 4eh, 0cdh, 7fh
        endif
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, EP_FAR_2AE3A_OFF, APP3_SEG
        db      0cbh, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah
        db      00h, 72h, 05h, 26h, 0a1h, 1ah, 00h, 48h, 26h, 0a3h, 30h, 00h, 26h, 3bh, 06h, 32h ; .r.&...H&.0.&;.2
far_2AE3A                       equ     $+0ch
        db      00h, 72h, 04h, 26h, 0a3h, 32h, 00h, 0eh, 0e8h, 0b0h, 0ffh, 0cbh, 0c7h, 06h, 80h, 15h
        if      FW_VERSION < 111
        db      0eah, 4dh, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 32h, 00h, 3dh, 0ffh, 0ffh, 75h, 04h, 26h
        db      0a1h, 1ah, 00h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 83h, 4eh, 0cdh, 7fh
        else
        db      0f7h, 4dh, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 32h, 00h, 3dh, 0ffh, 0ffh, 75h, 04h, 26h
        db      0a1h, 1ah, 00h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 90h, 4eh, 0cdh, 7fh
        endif
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, EP_FAR_2B5B9_OFF, EP_FAR_2B5B9_SEG, (APP3_BASE+far_2AE92-APP3_SEG*16), APP3_SEG
        db      0cbh, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 03h, 0b8h, 0ffh, 0ffh
        db      26h, 0a3h, 32h, 00h, 26h, 3bh, 06h, 30h, 00h, 73h, 04h, 26h, 0a3h, 30h, 00h, 0eh ; &.2.&;.0.s.&.0..
far_2AE92                       equ     $+4
        if      FW_VERSION >= 111
        db      0e8h, 0a9h, 0ffh, 0cbh, 0c7h, 06h, 80h, 15h, 00h, 4eh, 8eh, 06h, 10h, 0fh, 26h, 0a1h
        else
        db      0e8h, 0a9h, 0ffh, 0cbh, 0c7h, 06h, 80h, 15h, 0f3h, 4dh, 8eh, 06h, 10h, 0fh, 26h, 0a1h
        endif
        db      32h, 00h, 3dh, 0ffh, 0ffh, 75h, 05h, 26h, 0a1h, 1ah, 00h, 48h, 26h, 2bh, 06h, 30h ; 2.=..u.&...H&+.0
        if      FW_VERSION >= 111
        db      00h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e6h, 03h, 0bfh, 0eeh, 4eh, 0cdh, 7fh
        else
        db      00h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e6h, 03h, 0bfh, 0e1h, 4eh, 0cdh, 7fh
        endif
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, EP_FAR_2AE3A_OFF, APP3_SEG, 0000h, 0000h
        db      0cbh
        db      8eh, 06h, 10h, 0fh, 26h, 03h, 06h, 30h, 00h, 26h, 3bh, 06h, 1ah, 00h, 72h, 03h
        db      0b8h, 0ffh, 0ffh, 26h, 0a3h, 32h, 00h, 0eh, 0e8h, 0a9h, 0ffh, 0cbh
        endif
far_2B6BA:
        db      0b8h, 0e7h, 03h, 0e8h
        if      FW_VERSION >= 111
        if      FW_VERSION >= 112
        db      65h, 4dh, 0cdh, 68h, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 30h, 00h
        call    fn_30425
        db      0eh
        else
        db      63h, 4dh, 0cdh, 68h, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 30h, 00h, 0e8h, 56h, 4dh, 0eh
        endif
        call    goto_main_screen
        db      0cbh
        else
        db      62h, 4dh, 0cdh, 68h, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 30h, 00h, 0e8h, 55h, 4dh, 0eh
        db      0e8h, 66h, 0b1h, 0cbh
        endif
        else
FAR_2B5B9                       equ     $+0bh
        db      0b0h, 0c3h, 0b1h, 9ch, 0b5h, 2ah, 0b0h, 13h, 0cdh, 0b0h, 0c3h
        db      0c7h, 06h, 80h, 15h, 0b7h
        db      4dh, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 30h, 00h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e6h, 03h
        db      0bfh, 0ffh, 4dh, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+far_2AE3A-APP3_SEG*16), APP3_SEG
        db      0cbh, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah
        db      00h, 72h, 05h, 26h, 0a1h, 1ah, 00h, 48h, 26h, 0a3h, 30h, 00h, 26h, 3bh, 06h, 32h ; .r.&...H&.0.&;.2
far_2AE3A                       equ     $+0ch
        db      00h, 72h, 04h, 26h, 0a3h, 32h, 00h, 0eh, 0e8h, 0b0h, 0ffh, 0cbh
        db      0c7h, 06h, 80h, 15h
        db      0c0h, 4dh, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 32h, 00h, 3dh, 0ffh, 0ffh, 75h, 04h, 26h
        db      0a1h, 1ah, 00h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e7h, 03h, 0bfh, 59h, 4eh, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+far_2B5B9-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_2B662-APP3_SEG*16), APP3_SEG
        db      0cbh, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 03h, 0b8h, 0ffh, 0ffh
        db      26h, 0a3h, 32h, 00h, 26h, 3bh, 06h, 30h, 00h, 73h, 04h, 26h, 0a3h, 30h, 00h, 0eh ; &.2.&;.0.s.&.0..
        db      0e8h, 0a9h, 0ffh, 0cbh
far_2B662:
        db      0c7h, 06h, 80h, 15h, 0c9h, 4dh, 8eh, 06h, 10h, 0fh, 26h, 0a1h
        db      32h, 00h, 3dh, 0ffh, 0ffh, 75h, 05h, 26h, 0a1h, 1ah, 00h, 48h, 26h, 2bh, 06h, 30h ; 2.=..u.&...H&+.0
        db      00h, 0b3h, 01h, 0b7h, 00h, 0bah, 0e6h, 03h, 0bfh, 0b7h, 4eh, 0cdh, 7fh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, EP_APP3_4E5A_OFF, APP3_SEG, 0000h, 0000h
        db      0cbh
        db      8eh, 06h, 10h, 0fh, 26h, 03h, 06h, 30h, 00h, 26h, 3bh, 06h, 1ah, 00h, 72h, 03h
        db      0b8h, 0ffh, 0ffh, 26h, 0a3h, 32h, 00h, 0eh, 0e8h, 0a9h, 0ffh, 0cbh
far_2B6BA:
        db      0b8h, 0e7h, 03h, 0e8h
        db      5eh, 4dh, 0cdh, 68h, 8eh, 06h, 10h
d_a3_tbl_08c3e:
        db      0fh, 26h, 0a1h, 30h, 00h, 0e8h, 51h, 4dh, 0eh
        db      0e8h, 90h, 0b1h, 0cbh
        endif
far_2B6D2:
        mov     bx, 0a2h
        int     0a9h
        jae     br_2B6DA
        retf
br_2B6DA:
        mov     bx, 13eh
        int     0a9h
        jae     br_2B6E2
        retf
br_2B6E2:
        mov     bx, 144h
        int     0a9h
        jae     br_2B6EA
        retf
br_2B6EA:
        mov     al, 2
        int     0aah
        cmp     al, 0
        je      br_2B6F3
        retf
br_2B6F3:
        call    fn_280BD
        je      br_2B702
        int     88h
        cmp     bl, 0
        je      L_2B700
        retf
L_2B700:
        jmp     br_2B707
br_2B702:
        int     0e6h
        call    fn_2823E
br_2B707:
        mov     al, 4
        mov     byte ptr [A2_B_00F2F], al
        int     0adh
        mov     byte ptr [A3_B_00F30], 1
        mov     al, 0
        int     0aeh
        mov     al, 0
        int     7ah
        cmp     word ptr [A3_W_007BB], 0
        jne     br_2B727
        push    cs
        call    far_2B889
        retf
br_2B727:
        push    cs
        if      FW_VERSION >= 110
        call    L_2B3E0
        else
        call    L_2AB99
        endif
        retf
far_2B72C:
        int     0a4h
        KEY_DOWN        21h, (APP3_BASE+L_2B86A-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 111
        KEY_DOWN        20h, (APP3_BASE+L_2B787-APP3_SEG*16), APP3_SEG
        else
        KEY_DOWN        20h, EP_L_2AE9A_OFF, APP3_SEG
        endif
        KEY_DOWN        25h, (APP3_BASE+L_2B82E-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, EP_FAR_2B832_OFF, EP_FAR_2B832_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2B840-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (APP3_BASE+L_2BA47-APP3_SEG*16), APP3_SEG
        KEY_DOWN        35h, 0000h, 0000h
        KEY_DOWN        36h, 0000h, 0000h
        KEY_DOWN        2eh, (APP3_BASE+L_2B9A7-APP3_SEG*16), APP3_SEG
        KEY_DOWN        2fh, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        0dh, EP_L_26957_OFF, APP3_SEG
        ret
L_2B787:
        DISP_CLEAR
        DISP_FONT       DISP_FONT_7ROW
        DISP_HLINE      00h, 00h, 87h
        DISP_HDOTS      00h, 0ah, 87h
        DISP_HLINE      86h, 0ah, 71h
        DISP_HLINE      00h, 21h, 0f8h
        DISP_HLINE      01h, 22h, 0f7h
        DISP_VLINE      00h, 00h, 21h
        DISP_VLINE      87h, 00h, 0bh
        DISP_VLINE      88h, 01h, 0ah
        DISP_VLINE      0f6h, 0ah, 17h
        DISP_VLINE      0f7h, 0bh, 16h
        DISP_BOX        00h, 24h, 0f7h, 0dh
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      0f7h, 25h, 0ch
        if      FW_VERSION >= 111
        db      0e8h, 5ch, 0b2h
        db      0e8h, 96h, 0b2h, 0e8h, 0ffh, 0b2h
        call    fn_26B08
        call    fn_2709C
        call    fn_2708A
        elseif  FW_VERSION >= 110
        db      0e8h, 69h, 0b2h
        db      0e8h, 0a3h, 0b2h, 0e8h, 0ch, 0b3h, 0e8h, 2ch, 0b3h, 0e8h, 0bdh, 0b8h, 0e8h, 0a8h, 0b8h
        else
        db      0e8h, 93h, 0b2h
        db      0e8h, 0cdh, 0b2h, 0e8h, 36h, 0b3h, 0e8h, 56h, 0b3h, 0e8h, 0e7h, 0b8h, 0e8h, 0d2h, 0b8h
        endif
        DISP_TEXT       02h, 27h, "Next Sq:"
        db      0a1h, 0bbh, 07h
        db      0b1h, 32h, 0b5h, 27h
        call    fn_2BBF7
        DISP_SOFTKEY    04h, DISP_SK_BOX,    "SUDDEN"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "CLEAR"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "PAD"
        if      FW_VERSION >= 110
L_2B82E                         equ     $+7
        if      FW_VERSION >= 111
        db      0ffh, 16h, 0ch, 0fh, 0cdh, 0ach, 0cbh, 0e8h, 0d7h
        else
        db      0ffh, 16h, 0ch, 0fh, 0cdh, 0ach, 0cbh, 0e8h, 0e4h
        endif
        db      0b2h, 0cbh
        else
        db      0ffh, 16h, 0ch, 0fh, 0cdh, 0ach, 0cbh
L_2B82E:
        db      0e8h, 0eh
        db      0b3h, 0cbh
        endif
far_2B832:
        cmp     word ptr [A3_W_007BB], 0
        jne     br_2B83A
        retf
br_2B83A:
        mov     byte ptr [A3_B_007BD], 1
        retf
L_2B840:
        mov     word ptr [A3_W_007BB], 0
        retf
        call    fn_28233
        mov     ax, word ptr [A2_W_CUR_SEQ]
        jne     br_2B85A
        mov     ax, 0
        int     0f0h
        jae     br_2B857
        ret
br_2B857:
        mov     word ptr [A2_W_CUR_SEQ], ax
br_2B85A:
        mov     word ptr [A3_W_01586], ax
        int     0ech
        clc
        ret
cb_2B861:
        DISP_CURSOR     14h, 2, 74h
        ret
L_2B86A:
        int     0fdh
        cmp     al, 0
        jne     br_2B871
        retf
br_2B871:
        cmp     byte ptr [7c1h], 0
        jne     br_2B879
        retf
br_2B879:
        dec     al
        mov     ah, 0
        mov     word ptr [A3_W_00F24], ax
        push    cs
        call    far_2B8CA
        int     0b2h
        int     8dh
        retf
far_2B889:
        call    far_2B72C
        mov     word ptr [A3_W_01582], A3_W_050D9
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_2B861-APP3_CSBASE
        mov     ax, word ptr [A2_W_CUR_SEQ]
        mov     word ptr [A3_W_00F24], ax
        mov     cx, ds
        mov     si, 0f24h
        mov     bl, 1
        mov     bh, 1
        mov     dx, 63h
        mov     di, intcb_2B8CA-APP3_CSBASE
        int     7eh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2B909-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, 0000h, 0000h
        retf
far_2B8CA:
intcb_2B8CA:
        mov     ax, word ptr [A3_W_00F24]
        cmp     ax, word ptr [A2_W_CUR_SEQ]
        je      loop_2B8E0
        jb      br_2B8F3
        int     0f0h
        jae     loop_2B8E0
        int     0f1h
        jae     loop_2B8E0
        mov     ax, word ptr [A2_W_CUR_SEQ]
loop_2B8E0:
        mov     word ptr [A3_W_00F24], ax
        push    ax
        int     88h
        cmp     al, 0
        pop     ax
        jne     br_2B900
        mov     word ptr [A2_W_CUR_SEQ], ax
        push    cs
        call    L_27146
        retf
br_2B8F3:
        int     0f1h
        jae     loop_2B8E0
        int     0f0h
        jae     loop_2B8E0
        mov     ax, word ptr [A2_W_CUR_SEQ]
        jmp     loop_2B8E0
br_2B900:
        inc     ax
        mov     word ptr [A3_W_007BB], ax
        push    cs
        if      FW_VERSION >= 110
        call    L_2B3E0
        else
        call    L_2AB99
        endif
        retf
L_2B909:
        mov     word ptr [A3_W_01582], A3_W_05159
        call    far_2B72C
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26AD3-APP3_CSBASE
        mov     ax, word ptr [A3_W_00714]
        cmp     byte ptr [A3_B_00716], 0
        je      L_2B05A
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[16h]
L_2B05A:
        mov     bl, 0
        mov     bh, 1
        mov     dx, 0bb8h
        mov     di, intcb_2737B-APP3_CSBASE
        int     7fh
        if      FW_VERSION < 110
        KEY_CURSOR      0000h, 0000h, EP_L_2B951_OFF, APP3_SEG, EP_FAR_2B889_OFF, EP_FAR_2B889_SEG, EP_L_2AB99_OFF, APP3_SEG
        else
        KEY_CURSOR      0000h, 0000h, EP_L_2B951_OFF, APP3_SEG, EP_FAR_2B889_OFF, EP_FAR_2B889_SEG, EP_L_2B3E0_OFF, APP3_SEG
        endif
        KEY_DOWN        16h, 0000h, 0000h
        retf
L_2B951:
        mov     word ptr [A3_W_01582], A3_W_051A1
        call    far_2B72C
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26ADC-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_WHEEL2      EP_L_273DF_OFF, APP3_SEG, EP_L_273E9_OFF, APP3_SEG
        KEY_CURSOR      EP_L_2B909_OFF, APP3_SEG, EP_L_2B985_OFF, APP3_SEG, EP_FAR_2B889_OFF, EP_FAR_2B889_SEG, EP_L_2B3E0_OFF, APP3_SEG
        else
        KEY_WHEEL2      (APP3_BASE+L_265DD-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_273E9-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_2B909-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2B985-APP3_SEG*16), APP3_SEG, EP_FAR_2B889_OFF, EP_FAR_2B889_SEG, EP_L_2AB99_OFF, APP3_SEG
        endif
        KEY_DOWN        16h, 0000h, 0000h
        retf
L_2B985:
        mov     word ptr [A3_W_01582], A3_W_051D5
        call    far_2B72C
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_26AFF-APP3_CSBASE
        mov     cx, ds
        mov     si, 717h
        mov     bl, 0
        mov     bh, 1
        mov     dx, 6
        mov     di, A3_W_00C78
        int     7eh
        if      FW_VERSION < 110
        KEY_CURSOR      (APP3_BASE+L_2B909-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_FAR_2B889_OFF, EP_FAR_2B889_SEG, EP_L_2AB99_OFF, APP3_SEG
        else
        KEY_CURSOR      EP_L_2B909_OFF, APP3_SEG, 0000h, 0000h, EP_FAR_2B889_OFF, EP_FAR_2B889_SEG, EP_L_2B3E0_OFF, APP3_SEG
        endif
        KEY_DOWN        16h, 0000h, 0000h
        retf
L_2AB99:
        if      FW_VERSION >= 110
L_2B3E0:
        endif
        mov     word ptr [A3_W_01582], A3_W_05210
        mov     word ptr [A3_W_PAGE_CURSOR_FN], cb_2B9FB-APP3_CSBASE
        call    far_2B72C
        mov     cx, ds
        mov     si, 0f24h
        mov     bl, 0
        mov     bh, 1
        mov     dx, 63h
        mov     di, intcb_2BA10-APP3_CSBASE
        int     7eh
        KEY_CURSOR      (APP3_BASE+L_2B909-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2B985-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2B909-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_DOWN        16h, 0000h, 0000h
        retf
cb_2B9FB:
        DISP_CURSOR     32h, 27h, 74h
        ret
        db      83h, 3eh, 0bbh, 07h, 00h
        jne     L_2BA0F
        db      0eh
        call    far_2B6D2
L_2BA0F:
        retf
intcb_2BA10:
        cmp     ax, 0
        je      loop_2BA29
        cmp     ax, word ptr [A3_W_007BB]
        je      loop_2BA29
        jb      br_2BA38
        dec     ax
        int     0f0h
        jae     loop_2BA30
        int     0f1h
        jae     loop_2BA30
        mov     ax, word ptr [A3_W_007BB]
loop_2BA29:
        mov     word ptr [A3_W_00F24], ax
        mov     word ptr [A3_W_007BB], ax
        retf
loop_2BA30:
        inc     ax
        mov     word ptr [A3_W_00F24], ax
        mov     word ptr [A3_W_007BB], ax
        retf
br_2BA38:
        dec     al
        int     0f1h
        jae     loop_2BA30
        int     0f0h
        jae     loop_2BA30
        mov     ax, word ptr [A3_W_007BB]
        jmp     loop_2BA29
L_2BA47:
        mov     al, 0
        int     0c7h
        push    cs
        call    far_270FB
        call    far_2B72C
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        22h, (APP3_BASE+L_2BBC8-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2BAA9-APP3_SEG*16), APP3_SEG
        KEY_DOWN        25h, (APP3_BASE+L_2B82E-APP3_SEG*16), APP3_SEG
        mov     al, 1
        int     7ah
        KEY_DOWN        13h, EP_FAR_2B832_OFF, EP_FAR_2B832_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2B840-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (APP3_BASE+L_2BC07-APP3_SEG*16), APP3_SEG
        KEY_DOWN        35h, 0000h, 0000h
        KEY_DOWN        36h, 0000h, 0000h
        db      0cbh
L_2BAA9:
        call    fn_269F5
        DISP_TEXT       0a8h, 01h, "Now:   .  .  "
        mov     si, 1ah
        DISP_BMP        04h, 1dh, 1ah
        db      0beh, 1bh, 00h
        DISP_BMP        1dh, 1dh, 1bh
        DISP_TEXT       06h, 0dh, "Sq:"
        DISP_TEXT       09h, 1dh, "BANK"
        db      0e8h
        if      FW_VERSION >= 111
        db      55h
        elseif  FW_VERSION >= 110
        db      62h
        else
        db      8ch
        endif
        scasw
        call    fn_26B08
        int     0c3h
        mov     ah, 0
        push    ax
        shr     al, 4
        add     al, 41h
        mov     cl, 12h
        mov     ch, 25h
        mov     bl, 4
        int     90h
        pop     ax
        push    ax
        shr     al, 4
        mov     ah, 5
        mul     ah
        add     ax, 15b1h
        mov     si, ax
        mov     dx, ds
        mov     ah, 5
        mov     cl, 6
        mov     ch, 15h
        mov     bl, 5
        int     90h
        pop     di
        mov     cx, 10h
tgt_2BB1A:
        push    cx
        call    fn_2BB8D
        pop     cx
        inc     di
        loop    tgt_2BB1A
        mov     ax, word ptr [A3_W_007BB]
        mov     cl, 6
        mov     ch, 33h
        call    fn_2BBF7
        DISP_CURSOR     14h, 2, 74h
        DISP_SOFTKEY    04h, DISP_SK_BOX,    "SUDDEN"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "CLEAR"
        DISP_SOFTKEY    06h, DISP_SK_FILL,   "CLOSE"
        mov     ax, word ptr [A3_W_007BB]
        sub     ax, 1
        jae     br_2BB5F
        retf
br_2BB5F:
        mov     di, ax
        and     al, 0fh
        shr     ax, 2
        mov     ah, 3
        sub     ah, al
        mov     al, 9
        mul     ah
        mov     ch, al
        add     ch, 0dh
        mov     ax, di
        and     al, 3
        mov     ah, 34h
        mul     ah
        mov     cl, al
        add     cl, 28h
        dec     cl
        dec     ch
        mov     al, 31h
        mov     ah, 9
        mov     bl, 15h
        int     90h
        retf
fn_2BB8D:
        mov     ax, di
        and     al, 0fh
        shr     ax, 2
        mov     ah, 3
        sub     ah, al
        mov     al, 9
        mul     ah
        mov     ch, al
        add     ch, 0dh
        mov     ax, di
        and     al, 3
        mov     ah, 34h
        mul     ah
        mov     cl, al
        add     cl, 28h
        cmp     di, 63h
        jb      br_2BBB4
        ret
br_2BBB4:
        mov     ax, di
        mov     ah, 12h
        mul     ah
        add     ax, 810h
        mov     si, ax
        mov     dx, ds
        mov     ah, 8
        mov     bl, 5
        int     90h
        ret
L_2BBC8:
        mov     al, ah
        mov     ah, 0
        push    ax
        int     0f0h
        pop     bx
        jb      br_2BBEA
        cmp     ax, bx
        jne     br_2BBEA
        inc     ax
        mov     word ptr [A3_W_01586], ax
        mov     word ptr [A3_W_007BB], ax
        mov     bx, 72h
        int     0a9h
        jb      br_2BBE5
        retf
br_2BBE5:
        push    cs
        call    far_2B832
        retf
br_2BBEA:
        mov     word ptr [A3_W_01586], 0
        mov     word ptr [A3_W_007BB], 0
        retf
fn_2BBF7:
        sub     al, 1
        jb      br_2BBFF
        call    fn_27FF8
        ret
br_2BBFF:
        DISP_ERASE      06h, 33h, 72h, 07h
        ret
L_2BC07:
        mov     al, 0
        int     0aeh
        mov     al, 4
        mov     byte ptr [A2_B_00F2F], al
        int     0adh
        mov     al, 0
        int     7ah
        cmp     word ptr [A3_W_007BB], 0
        jne     br_2BC22
        push    cs
        call    far_2B889
        retf
br_2BC22:
        push    cs
        if      FW_VERSION >= 110
        call    L_2B3E0
        else
        call    L_2AB99
        endif
        retf
        if      FW_VERSION >= 111
        db      00h
        endif
L_2BC28:
        call    fn_280BD
        je      br_2BC2E
        retf
br_2BC2E:
        call    fn_28082
        callf   [A3_FP_01590]
        retf
L_2BC36:
        DISP_WIN_WIDE   "Track"
        DISP_TEXT       20h, 10h, "Track name:"
        DISP_TEXT       20h, 1eh, "   Default:"
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "DELETE"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    " COPY "
        DISP_HDOTS      1ah, 1ah, 0c4h
        mov     ax, word ptr [A3_W_00712]
        mov     cl, 62h
        mov     ch, 10h
        call    fn_28038
        mov     ax, word ptr [A3_W_00712]
        mov     cl, 62h
        mov     ch, 1eh
        if      FW_VERSION >= 111
        call    L_28070
        elseif  FW_VERSION >= 110
        db      0e8h, 0d2h, 0c3h
        else
        db      0e8h, 0edh, 0c3h
        endif
        call    word ptr [A3_W_01594]
        retf
cb_2BCA4:
        db      0b1h, 62h, 0b5h, 10h, 0b0h
        pop     es
        int     0b0h
        ret
cb_2BCAD:
        DISP_CURSOR     62h, 1eh, 7
        ret
L_2BCB6:
        mov     word ptr [A3_FP_01590], L_2BCB6-APP3_CSBASE
        mov     word ptr [A3_W_01594], cb_2BCA4-APP3_CSBASE
        int     0a4h
        KEY_DOWN        20h, (APP3_BASE+L_2BC36-APP3_SEG*16), APP3_SEG
        KEY_DOWN        1ah, EP_L_2BD37_OFF, APP3_SEG
        KEY_DOWN        11h, EP_L_2BDB6_OFF, APP3_SEG
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2B7BA-APP3_SEG*16), APP3_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 110
        KEY_WHEEL       (APP3_BASE+L_2BD19-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_2BD19-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_2BD19-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+L_2BD19-APP3_SEG*16), APP3_SEG
        retf
L_2BD19:
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        mov     si, word ptr [A3_W_00712]
        else
        KEY_WHEEL       (APP3_BASE+L_2AEF1-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_2AEF1-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_2AEF1-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+L_2AEF1-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2AEF1:
        db      9ah
        jp      L_2B54C
L_2B54C:
        pushf
        and     ax, 368bh
        adc     al, byte ptr [bx]
        endif
        shl     si, 4
        add     si, 180h
        mov     dx, word ptr [A3_W_00F10]
        mov     ah, 10h
        mov     bx, A3_W_018DD
        mov     cx, cs
        int     0b7h
        retf
L_2BD37:
        mov     word ptr [A3_FP_01590], L_2BD37-APP3_CSBASE
        mov     word ptr [A3_W_01594], cb_2BCAD-APP3_CSBASE
        int     0a4h
        KEY_DOWN        20h, (APP3_BASE+L_2BC36-APP3_SEG*16), APP3_SEG
        KEY_DOWN        19h, (APP3_BASE+L_2BCB6-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, EP_L_2BDB6_OFF, APP3_SEG
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2B7BA-APP3_SEG*16), APP3_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 110
        KEY_WHEEL       (APP3_BASE+far_2B4CA-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+far_2B4CA-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+far_2B4CA-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+far_2B4CA-APP3_SEG*16), APP3_SEG
        db      0cbh
far_2B4CA:
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        mov     si, word ptr [A3_W_00712]
        else
        KEY_WHEEL       EP_APP3_55EA_OFF, APP3_SEG
        KEY_DOWN        22h, EP_APP3_55EA_OFF, APP3_SEG
        KEY_DIGITS      EP_APP3_55EA_OFF, APP3_SEG
        KEY_DOWN        18h, EP_APP3_55EA_OFF, APP3_SEG
        db      0cbh
far_2B4CA:
        db      9ah
        jp      L_2B5CD
L_2B5CD:
        pushf
        and     ax, 368bh
        adc     al, byte ptr [bx]
        endif
        shl     si, 4
        add     si, 190h
        mov     dx, ds
        mov     ah, 10h
        mov     bx, A3_W_018DD
        mov     cx, cs
        int     0b7h
        retf
L_2BDB6:
        int     0a4h
        mov     cx, ds
        mov     si, 712h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 40h
        mov     di, intcb_2808C-APP3_CSBASE
        int     7eh
        KEY_DOWN        20h, (APP3_BASE+L_2BDF2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        12h, (APP3_BASE+L_2BE81-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (APP3_BASE+L_2BC28-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, EP_TGT_2BF3C_OFF, EP_TGT_2BF3C_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        retf
L_2BDF2:
        DISP_WIN        32h, 06h, 0beh, 36h, "Delete track"
        DISP_TEXT       46h, 11h, "Tr:"
        DISP_TEXT       46h, 1fh, "Pressing DO^IT will^erase"
        DISP_TEXT       46h, 28h, "this track !!"
        mov     si, 11h
        DISP_BMP        0d8h, 18h, 11h
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "ALL Tr"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        mov     ax, word ptr [A3_W_00712]
        mov     cl, 58h
        mov     ch, 11h
        call    fn_28022
        DISP_CURSOR     58h, 11h, 73h
        retf
L_2BE81:
        int     0a4h
        KEY_DOWN        13h, EP_L_2BDB6_OFF, APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2BF0F-APP3_SEG*16), APP3_SEG
        DISP_WIN        32h, 06h, 0beh, 36h, "Delete ALL Tracks"
        mov     si, 0eh
        DISP_BMP        3ch, 16h, 0eh
        mov     si, 11h
        DISP_BMP        0d9h, 1ah, 11h
        DISP_TEXT       56h, 19h, "Pressing DO IT will   "
        DISP_TEXT       56h, 22h, "erase ALL track data!!"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        db      0cbh
L_2BF0F:
        mov     word ptr [A3_W_01886], 0
        call    fn_2BF52
        push    word ptr [A3_W_00712]
        mov     word ptr [A3_W_00712], 0
loop_2BF22:
        call    fn_2BF86
        inc     word ptr [A3_W_00712]
        cmp     word ptr [A3_W_00712], 40h
        jne     loop_2BF22
        pop     ax
        mov     word ptr [A3_W_00712], ax
        int     0d6h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
tgt_2BF3C:
        mov     ax, word ptr [A3_W_00712]
        inc     al
        mov     word ptr [A3_W_01886], ax
        call    fn_2BF52
        call    fn_2BF86
        int     0d6h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
fn_2BF52:
        sub     ax, ax
        mov     word ptr [A3_W_0154D], ax
        mov     byte ptr [A3_B_0154F], al
        mov     byte ptr [A3_B_01550], al
        mov     byte ptr [A3_B_01553], al
        mov     byte ptr [A3_B_01554], al
        mov     es, word ptr [A3_W_00F10]
        mov     ax, word ptr es:[A3_W_0001A]
        mov     word ptr [A3_W_01551], ax
        mov     byte ptr [A3_B_01577], 0
        mov     byte ptr [A3_B_01578], 7fh
        mov     byte ptr [A3_B_01579], 41h
        mov     byte ptr [1888h], 0
        call    fn_2D5E3
        ret
fn_2BF86:
        call    fn_280C2
        mov     di, si
        mov     si, 10h
        mov     al, byte ptr [si+A3_TBL_00680]
        mov     ah, byte ptr [si+A3_TBL_00580]
        mov     bl, byte ptr [si+A3_TBL_005C0]
        mov     bh, byte ptr [si+A3_TBL_00600]
        mov     cl, byte ptr [si+A3_TBL_00640]
        mov     byte ptr es:[di+680h], al
        mov     byte ptr es:[di+580h], ah
        mov     byte ptr es:[di+5c0h], bl
        mov     byte ptr es:[di+600h], bh
        mov     byte ptr es:[di+640h], cl
        shl     di, 4
        add     si, di
        add     di, 180h
        add     si, 180h
        mov     cx, 10h
        rep movsb
        ret
L_2B7FE:
        call    fn_280BD
        je      br_2BFD4
        retf
br_2BFD4:
        DISP_WIN_WIDE   "Erase all OFF tracks"
        mov     si, 0eh
        DISP_BMP        1eh, 14h, 0eh
        DISP_TEXT       3ch, 14h, "Pressing DO^IT will^erase"
        DISP_TEXT       3ch, 1eh, "all OFF tracks!!"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        int     0a4h
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 110
        KEY_DOWN        14h, EP_FAR_2B794_OFF, APP3_SEG
        else
        KEY_DOWN        14h, EP_FAR_2B23C_OFF, APP3_SEG
        endif
        retf
        if      FW_VERSION < 110
far_2B794:
        endif
far_2B23C:
        if      FW_VERSION >= 110
far_2B794:
        endif
        mov     word ptr [A3_W_01886], 0ffh
        call    fn_2BF52
        mov     es, word ptr [A3_W_00F10]
        mov     si, 680h
        mov     cx, 40h
tgt_2C077:
        test    byte ptr es:[si], 2
        jne     br_2C081
        mov     byte ptr es:[si], 2
br_2C081:
        inc     si
        loop    tgt_2C077
        if      FW_VERSION >= 112
        int     0d6h
        endif
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_2B7BA:
        mov     ax, word ptr [A3_W_00712]
        mov     word ptr [A3_W_0159C], ax
        int     0a4h
        KEY_DOWN        20h, (APP3_BASE+L_2B7DF-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 110
        KEY_DOWN        13h, EP_L_2BC28_OFF, APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2B8B5-APP3_SEG*16), APP3_SEG
        db      0ffh
        push    ds
        else
        KEY_DOWN        13h, (APP3_BASE+L_2BC28-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2B8B5-APP3_SEG*16), APP3_SEG
        db      0ffh, 1eh
        endif
        xchg    si, ax
        db      15h, 0cbh
L_2B7DF:
        DISP_WIN        32h, 06h, 0beh, 36h, "Copy Track"
        DISP_TEXT       46h, 10h, "Tr:"
        DISP_TEXT       46h, 28h, "Tr:"
        mov     si, 0dh
        DISP_BMP        82h, 19h, 0dh
        DISP_TEXT       92h, 1bh, "COPY"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        mov     ax, word ptr [A3_W_00712]
        mov     cl, 58h
        mov     ch, 10h
        call    fn_28022
        mov     ax, word ptr [A3_W_0159C]
        mov     cl, 58h
        mov     ch, 28h
        call    fn_28022
        call    word ptr [A3_W_0159A]
        retf
cb_2C119:
        DISP_CURSOR     58h, 10h, 73h
        ret
cb_2C122:
        DISP_CURSOR     58h, 28h, 73h
        ret
L_2C12B:
        mov     word ptr [A3_W_01596], L_2C12B-APP3_CSBASE
        mov     word ptr [A3_W_0159A], cb_2C119-APP3_CSBASE
        mov     cx, ds
        mov     si, 712h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 40h
        mov     di, intcb_2808C-APP3_CSBASE
        int     7eh
        KEY_DOWN        19h, 0000h, 0000h
        KEY_DOWN        1ah, (APP3_BASE+L_2C159-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2C159:
        if      FW_VERSION >= 110
        mov     word ptr [A3_W_01596_2], L_2C159-APP3_CSBASE
        else
        db      0c7h
        push    es
        xchg    si, ax
        adc     ax, 596fh
        endif
        mov     word ptr [A3_W_0159A], cb_2C122-APP3_CSBASE
        mov     cx, ds
        mov     si, 159ch
        mov     bl, 1
        mov     bh, 0
        mov     dx, 40h
        mov     di, intcb_2808C-APP3_CSBASE
        int     7eh
        KEY_DOWN        19h, (APP3_BASE+L_2C12B-APP3_SEG*16), APP3_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        db      0cbh
L_2B8B5:
        mov     byte ptr [A3_B_0159E], 0
        mov     ax, word ptr [A3_W_0159C]
        cmp     ax, word ptr [A3_W_00712]
        je      br_2C1F4
        inc     al
        mov     word ptr [A3_W_01886], ax
        call    fn_2BF52
        call    fn_2C206
        call    fn_280C2
        mov     di, word ptr [A3_W_0159C]
        mov     al, byte ptr es:[si+640h]
        mov     ah, byte ptr es:[si+600h]
        mov     bl, byte ptr es:[si+580h]
        mov     bh, byte ptr es:[si+5c0h]
        mov     cl, byte ptr es:[si+680h]
        mov     byte ptr es:[di+640h], al
        mov     byte ptr es:[di+600h], ah
        mov     byte ptr es:[di+580h], bl
        mov     byte ptr es:[di+5c0h], bh
        mov     byte ptr es:[di+680h], cl
        shl     si, 4
        shl     di, 4
        add     si, 180h
        add     di, 180h
        mov     cx, 10h
        push    ds
        mov     ax, es
        mov     ds, ax
        rep movsb
        pop     ds
        if      FW_VERSION >= 110
        int     0d6h
        endif
br_2C1F4:
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        cmp     byte ptr [A3_B_0159E], 0
        jne     br_2C201
        retf
br_2C201:
        mov     al, 19h
        int     95h
        retf
fn_2C206:
        int     85h
        push    ax
        push    dx
        call    fn_2B32D
        call    fn_2B36F
        int     84h
        push    si
        push    es
        int     83h
        mov     bp, es
        pop     dx
        pop     di
        call    fn_2C226
        int     0bfh
        pop     dx
        pop     ax
        mov     bl, 0ah
        int     87h
        ret
fn_2C226:
        mov     es, bp
        mov     al, byte ptr es:[si+4]
        cmp     al, 0ffh
        jne     br_2C231
        ret
br_2C231:
        mov     ah, byte ptr es:[si+3]
        and     ah, 3fh
        cmp     ah, byte ptr [A3_W_00712]
        jne     br_2C241
        call    fn_2C257
br_2C241:
        call    fn_2B3FE
        cmp     bp, dx
        ja      fn_2C226
        mov     ax, si
        sub     ax, di
        cmp     ax, 1000h
        jae     fn_2C226
        mov     byte ptr [A3_B_0159E], 1
        ret
fn_2C257:
        push    bp
        push    si
        push    ax
        mov     ah, byte ptr [A3_W_0159C]
        and     byte ptr es:[si+3], 0c0h
        or      byte ptr es:[si+3], ah
        call    fn_2B3FE
        pop     ax
        pop     si
        pop     bp
        mov     es, bp
        and     byte ptr es:[si+3], 0c0h
        or      byte ptr es:[si+3], ah
        ret
L_2B9A7:
        mov     bx, 0a2h
        int     0a9h
        jae     br_2C281
        retf
br_2C281:
        mov     bx, 13eh
        int     0a9h
        jae     br_2C289
        retf
br_2C289:
        mov     bx, 144h
        int     0a9h
        jae     br_2C291
        retf
br_2C291:
        int     88h
        cmp     ah, 0
        je      br_2C299
        retf
br_2C299:
        mov     al, 2
        int     0aah
        cmp     al, 0
        je      br_2C2A2
        retf
br_2C2A2:
        mov     al, 1
        int     0aeh
        int     0a5h
        mov     al, 0
        int     0c7h
        call    fn_2823E
        KEY_SAVE        A3_TBL_015D4
        push    cs
        call    far_2C2B8
        retf
far_2C2B8:
        mov     al, 3
        int     0c4h
        int     0a4h
        FIELD_ENTRY     ds, 710h, 1, 0, 63h, L_27146-APP3_CSBASE
        KEY_DOWN        22h, EP_L_2C465_OFF, APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2C318-APP3_SEG*16), APP3_SEG
        KEY_DOWN        25h, (APP3_BASE+L_2C314-APP3_SEG*16), APP3_SEG
        KEY_DOWN        2eh, (APP3_BASE+L_2C4A3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, (APP3_BASE+L_2C49E-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (APP3_BASE+L_2C4B6-APP3_SEG*16), APP3_SEG
        KEY_DOWN        2fh, EP_FAR_2B6D2_OFF, EP_FAR_2B6D2_SEG
        KEY_DOWN        0dh, EP_L_26957_OFF, APP3_SEG
        mov     al, 1
        int     7ah
        retf
L_2C314:
        call    fn_26B08
        retf
L_2C318:
        call    L_2BD60
        DISP_TEXT       00h, 34h, "  Press pads to Track ON/OFF"
        db      0cdh
        db      0ach
        db      0cbh
L_2BD60:
        call    fn_269F5
        DISP_TEXT       0a8h, 01h, "Now:   .  .  "
        db      0beh, 1ah, 00h
        DISP_BMP        04h, 1dh, 1ah
        db      0beh, 1bh, 00h
        DISP_BMP        1dh, 1dh, 1bh
        DISP_TEXT       06h, 0dh, "Tr:"
        DISP_TEXT       09h, 1dh, "BANK"
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        db      0e8h
        mov     si, 0e8a6h
        xchg    sp, word ptr [bx+A3_TBL_006E8]
        lodsw
        int     0c3h
        mov     ah, 0
        push    ax
        shr     al, 4
        add     al, 41h
        mov     cl, 12h
        mov     ch, 25h
        mov     bl, 4
        int     90h
        pop     ax
        push    ax
        shr     al, 4
        mov     ah, 5
        mul     ah
        add     ax, 15b1h
        mov     si, ax
        mov     dx, ds
        mov     ah, 5
        mov     cl, 6
tgt_2C3AA:
        mov     ch, 15h
        mov     bl, 5
        int     90h
        pop     di
        mov     cx, 10h
tgt_2C3B4:
        push    cx
        call    fn_2C3CF
        pop     cx
        inc     di
        loop    tgt_2C3B4
        DISP_CURSOR     14h, 2, 74h
        else
        if      FW_VERSION >= 111
        db      0e8h, 0c0h, 0a6h, 0e8h, 89h, 0a7h, 0e8h, 08h, 0adh, 0cdh, 0c3h, 0b4h, 00h, 50h, 0c0h, 0e8h
        else
        db      0e8h, 0ceh, 0a6h, 0e8h, 97h, 0a7h, 0e8h, 16h, 0adh, 0cdh, 0c3h, 0b4h, 00h, 50h, 0c0h, 0e8h
        endif
        db      04h, 04h, 41h, 0b1h, 12h, 0b5h, 25h, 0b3h, 04h, 0cdh, 90h, 58h, 50h, 0c0h, 0e8h, 04h
        db      0b4h, 05h, 0f6h, 0e4h, 05h, 0b1h, 15h, 8bh, 0f0h, 8ch, 0dah, 0b4h, 05h, 0b1h, 06h, 0b5h
        db      15h, 0b3h, 05h, 0cdh, 90h, 5fh, 0b9h, 10h, 00h, 51h, 0e8h, 17h, 00h, 59h, 47h, 0e2h
        db      0f8h, 0b1h, 14h, 0b5h, 02h, 0b0h, 74h, 0cdh, 0b0h
        endif
        else
        db      0e8h
        cli
        cmpsb
        call    fn_26B08
        call    fn_2708A
        int     0c3h
        mov     ah, 0
        push    ax
        shr     al, 4
        add     al, 41h
        mov     cl, 12h
        mov     ch, 25h
        mov     bl, 4
        int     90h
        pop     ax
        push    ax
        shr     al, 4
        mov     ah, 5
        mul     ah
        add     ax, 15b1h
        mov     si, ax
        mov     dx, ds
        mov     ah, 5
        mov     cl, 6
tgt_2C3AA:
        mov     ch, 15h
        mov     bl, 5
        int     90h
        pop     di
        mov     cx, 10h
tgt_2C3B4:
        push    cx
        call    fn_2C3CF
        pop     cx
        inc     di
        loop    tgt_2C3B4
        DISP_CURSOR     14h, 2, 74h
        endif
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "SOLO"
        db      0c3h
fn_2C3CF:
        mov     ax, di
        and     al, 0fh
        shr     ax, 2
        mov     ah, 3
        sub     ah, al
        mov     al, 9
        mul     ah
        mov     ch, al
        add     ch, 0dh
        mov     ax, di
        and     al, 3
        mov     ah, 34h
        mul     ah
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        db      8ah, 0c8h, 80h, 0c1h, 28h, 0e8h, 22h, 00h, 0b0h, 00h, 0cdh, 0c4h, 3ch, 00h, 75h, 4ch
        db      8eh, 06h, 10h, 0fh, 26h, 0f6h, 85h, 80h, 06h, 02h, 75h, 01h, 0c3h, 0feh, 0c9h, 0feh
        db      0cdh, 0b0h, 31h, 0b4h, 09h, 0b3h, 15h, 0cdh, 90h, 0c3h, 8eh, 06h, 10h, 0fh, 26h, 0f6h
        db      85h, 80h, 06h, 01h, 74h, 12h, 8bh, 0f7h, 0c1h, 0e6h, 04h, 81h, 0c6h, 80h, 01h, 8ch
        if      FW_VERSION >= 111
        db      0c2h, 0b4h, 08h, 0b3h, 05h, 0cdh, 90h, 0c3h, 0beh, 8dh, 5ch, 8ch, 0cah, 0b4h, 08h, 0b3h
        else
        db      0c2h, 0b4h, 08h, 0b3h, 05h, 0cdh, 90h, 0c3h, 0beh, 7fh, 5ch, 8ch, 0cah, 0b4h, 08h, 0b3h
        endif
        db      05h, 0cdh, 90h, 0c3h
        db      "(Unused);>"
        db      12h, 07h
        db      74h, 01h, 0c3h, 8eh, 06h, 10h, 0fh, 26h, 80h, 8dh, 80h, 06h, 02h, 0feh, 0c9h, 0feh
        db      0cdh, 0b0h, 31h, 0b4h, 09h, 0b3h, 15h, 0cdh, 90h, 0c3h
L_2C465:
        db      80h, 0f9h, 00h, 75h, 01h, 0cbh
        if      FW_VERSION >= 111
        db      0e8h, 0d2h, 0bdh, 8ah, 0dch, 0b7h, 00h, 8eh, 06h, 10h, 0fh, 26h, 80h, 0b7h, 80h, 06h
        else
        db      0e8h, 0d3h, 0bdh, 8ah, 0dch, 0b7h, 00h, 8eh, 06h, 10h, 0fh, 26h, 80h, 0b7h, 80h, 06h
        endif
        db      02h, 26h, 8ah, 87h, 80h, 06h, 0b9h, 00h, 0f0h, 8eh, 0c1h, 26h, 88h, 87h, 80h, 06h
        db      0a8h, 02h, 74h, 01h, 0cbh, 8bh, 0c3h, 0cdh, 0fch, 0cbh
        KEY_RESTORE     A3_TBL_015D4
        mov     al, 0
        if      FW_VERSION < 111
L_2C4A3                         equ     $+8
        endif
L_2C49E                         equ     $+3
        if      FW_VERSION >= 111
L_2C4A3                         equ     $+8
        endif
        db      0cdh, 7ah, 0cbh, 0b0h, 00h, 0cdh, 0aeh, 0cbh, 80h, 3eh, 2fh, 0fh, 04h, 75h, 06h, 9ah
        dw      EP_FAR_2B6D2_OFF, EP_FAR_2B6D2_SEG
        db      0cbh, 9ah
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
L_2C4B6                         equ     $+1
        db      0cbh, 0eh, 0e8h, 0feh, 0fdh
        KEY_DOWN        22h, EP_L_2BC25_OFF, APP3_SEG
        KEY_DOWN        20h, EP_L_2BC01_OFF, APP3_SEG
        else
        mov     cl, al
        add     cl, 28h
        call    fn_2C415
        mov     al, 0
        int     0c4h
        cmp     al, 0
        jne     br_2C447
        mov     es, word ptr [A3_W_00F10]
        test    byte ptr es:[di+680h], 2
        jne     br_2C408
        ret
br_2C408:
        dec     cl
        dec     ch
        mov     al, 31h
        mov     ah, 9
        mov     bl, 15h
        int     90h
        ret
fn_2C415:
        mov     es, word ptr [A3_W_00F10]
        test    byte ptr es:[di+680h], 1
        je      br_2C433
        mov     si, di
        shl     si, 4
        add     si, 180h
        mov     dx, es
        mov     ah, 8
        mov     bl, 5
        int     90h
        ret
br_2C433:
        mov     si, str_2C43F-APP3_CSBASE
        mov     dx, cs
        mov     ah, 8
        mov     bl, 5
        int     90h
        ret
str_2C43F:
        db      "(Unused)"
br_2C447:
        cmp     di, word ptr [A3_W_00712]
        je      br_2C44E
        ret
br_2C44E:
        mov     es, word ptr [A3_W_00F10]
        or      byte ptr es:[di+680h], 2
        dec     cl
        dec     ch
        mov     al, 31h
        mov     ah, 9
        mov     bl, 15h
        int     90h
        ret
L_2C465:
        cmp     cl, 0
        jne     br_2C46B
        retf
br_2C46B:
        call    fn_2823E
        mov     bl, ah
        mov     bh, 0
        mov     es, word ptr [A3_W_00F10]
        xor     byte ptr es:[bx+680h], 2
        mov     al, byte ptr es:[bx+680h]
        mov     cx, 0f000h
        mov     es, cx
        mov     byte ptr es:[bx+680h], al
        test    al, 2
        je      br_2C490
        retf
br_2C490:
        mov     ax, bx
        int     0fch
        retf
        KEY_RESTORE     A3_TBL_015D4
        mov     al, 0
        int     7ah
        retf
L_2C49E:
        mov     al, 0
        int     0aeh
        retf
L_2C4A3:
        cmp     byte ptr [A2_B_00F2F], 4
        jne     br_2C4B0
        callf   EP_FAR_2B6D2_SEG:EP_FAR_2B6D2_OFF
        retf
br_2C4B0:
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_2C4B6:
        push    cs
        call    far_2C2B8
        KEY_DOWN        22h, (APP3_BASE+L_2C4F7-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2C4D3-APP3_SEG*16), APP3_SEG
        endif
        KEY_UP          15h, EP_FAR_2C2B8_OFF, EP_FAR_2C2B8_SEG
        db      0cbh
L_2C4D3:
        if      FW_VERSION >= 112
        call    L_2BD60
        DISP_TEXT       00h, 34h, "  Press pads to Track SOLO"
        db      0cbh
L_2C4F7:
        push    cs
        call    far_2C51C
        push    cs
        call    far_2C2B8
        else
        db      0e8h, 6ah, 0feh
        DISP_TEXT       00h, 34h, "  Press pads to Track SOLO"
        db      0cbh
L_2C4F7:
        db      0eh, 0e8h, 21h, 00h
        db      0eh, 0e8h, 0b9h, 0fdh
        endif
        KEY_DOWN        22h, EP_FAR_2C51C_OFF, APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2BC54-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, EP_FAR_2C2B8_OFF, EP_FAR_2C2B8_SEG
        db      0b0h, 02h
        int     0c4h
        retf
far_2C51C:
        mov     al, ah
        mov     ah, 0
        mov     word ptr [A3_W_00712], ax
        int     0ach
        retf
L_2BC54:
        call    L_2BD60
        DISP_TEXT       00h, 34h, "  SOLO is active."
        db      0cbh
far_2C541:
        if      FW_VERSION = 111
        db      0e8h, 7bh, 0bbh, 74h, 01h, 0cbh, 0ffh, 1eh, 36h, 17h
        elseif  FW_VERSION <> 110
        call    fn_280BD
        je      br_2C547
        else
        db      0e8h, 7ch, 0bbh, 74h, 01h, 0cbh, 0ffh, 1eh, 36h, 17h
        endif
        retf
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
L_2BC7A:
        else
br_2C547:
        callf   [A3_W_01736]
        retf
L_2C54C:
        endif
        DISP_WIN_WIDE   "Multi Recording Setup"
        DISP_TEXT       1bh, 0bh, "In    Track                  Out"
        DISP_HDOTS      15h, 14h, 0ceh
        DISP_TEXT       33h, 0bh, 0ch
        DISP_TEXT       33h, 18h, 0ch
        int     8fh                 ; 05h DISP_TEXT
        add     ax, 2133h
        or      al, 0
        DISP_TEXT       33h, 2ah, 0ch
        DISP_TEXT       0bdh, 0bh, 0ch
        DISP_TEXT       0bdh, 18h, 0ch
        DISP_TEXT       0bdh, 21h, 0ch
        DISP_TEXT       0bdh, 2ah, 0ch
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        if      FW_VERSION >= 112
        mov     al, byte ptr [A3_B_0173C]
        mov     cl, 18h
        mov     ch, 18h
        call    fn_2C5EA
        call    fn_2C5EA
        call    fn_2C5EA
        call    word ptr [A3_W_0173A]
        retf
fn_2C5EA:
        push    ax
        push    cx
        push    ax
        mov     ah, 4
        mul     ah
        mov     si, ax
        add     si, 173eh
        mov     ah, 4
        mov     dx, ds
        mov     bl, 5
        int     90h
tgt_2C5FF:
        add     cl, 27h
        pop     bx
        mov     bh, 0
        mov     al, byte ptr [bx+A3_TBL_00738]
        mov     ah, 0
        call    fn_2C616
        pop     cx
        pop     ax
        inc     al
        add     ch, 9
        ret
fn_2C616:
        cmp     al, 0
        je      br_2C640
        dec     al
        push    ax
        call    fn_28022
        pop     bx
        mov     bh, 0
        mov     es, word ptr [A3_W_00F10]
        mov     al, byte ptr es:[bx+580h]
        mov     ah, 4
        mul     ah
        add     ax, 0fc6h
        mov     si, ax
        mov     dx, ds
        mov     ah, 3
        mov     cl, 0c9h
        mov     bl, 5
        int     90h
        ret
br_2C640:
        mov     si, str_2C64C-APP3_CSBASE
        mov     dx, cs
        mov     ah, 6
        mov     bl, 5
        int     90h
        ret
str_2C64C:
        db      "---OFF"
cb_2C652:
        mov     al, byte ptr [A3_B_0173D]
        mov     ah, 9
        mul     ah
        add     al, 18h
        DISP_CURSOR     18h, al, 19h
        ret
cb_2C664:
        mov     al, byte ptr [A3_B_0173D]
        mov     ah, 9
        mul     ah
        add     al, 18h
        DISP_CURSOR     3fh, al, 0dh
        ret
cb_2C676:
        mov     al, byte ptr [A3_B_0173D]
        mov     ah, 9
        mul     ah
        add     al, 18h
        DISP_CURSOR     0c9h, al, 13h
        ret
far_2C688:
        int     0a3h
        cmp     byte ptr [A3_B_0173D], 2
        je      br_2C696
        inc     byte ptr [A3_B_0173D]
        retf
br_2C696:
        cmp     byte ptr [A3_B_0173C], 1fh
        jne     L_2C0BE
        retf
L_2C0BE:
        inc     byte ptr [A3_B_0173C]
        retf
L_2C6A3:
        int     0a3h
        cmp     byte ptr [A3_B_0173D], 0
        je      br_2C6B1
        dec     byte ptr [A3_B_0173D]
        retf
br_2C6B1:
        cmp     byte ptr [A3_B_0173C], 0
        jne     br_2C6B9
        retf
br_2C6B9:
        dec     byte ptr [A3_B_0173C]
        retf
intcb_2C6BE:
        mov     bl, byte ptr [A3_B_0173C]
        add     bl, byte ptr [A3_B_0173D]
        mov     bh, 0
        mov     byte ptr [bx+A3_TBL_00738], al
        push    cs
        call    far_2C541
        retf
        else
        if      FW_VERSION >= 110
        db      0a0h, 3ch, 17h, 0b1h, 18h, 0b5h
        db      18h, 0e8h, 0bh, 00h, 0e8h, 08h, 00h, 0e8h, 05h, 00h, 0ffh, 16h, 3ah, 17h, 0cbh, 50h
        else
        db      0a0h, 3ch, 17h
        mov     cl, 18h
        mov     ch, 18h
        call    fn_2C5EA
        call    fn_2C5EA
        call    fn_2C5EA
        call    word ptr [A3_W_0173A]
        retf
fn_2C5EA:
        push    ax
        endif
        db      51h, 50h, 0b4h, 04h, 0f6h, 0e4h, 8bh, 0f0h, 81h, 0c6h, 3eh, 17h, 0b4h, 04h, 8ch, 0dah
        if      FW_VERSION >= 110
        db      0b3h, 05h, 0cdh, 90h, 80h, 0c1h, 27h, 5bh, 0b7h, 00h, 8ah, 87h, 38h, 07h, 0b4h, 00h
        db      0e8h, 08h, 00h, 59h, 58h, 0feh, 0c0h, 80h, 0c5h, 09h, 0c3h, 3ch, 00h, 74h, 26h, 0feh
        if      FW_VERSION >= 111
        db      0c8h, 50h, 0e8h, 04h, 0bah, 5bh, 0b7h, 00h, 8eh, 06h, 10h, 0fh, 26h, 8ah, 87h, 80h
        else
        db      0c8h, 50h, 0e8h, 5h, 0bah, 5bh, 0b7h, 00h, 8eh, 06h, 10h, 0fh, 26h, 8ah, 87h, 80h
        endif
        db      05h, 0b4h, 04h, 0f6h, 0e4h, 05h, 0c6h, 0fh, 8bh, 0f0h, 8ch, 0dah, 0b4h, 03h, 0b1h, 0c9h
        if      FW_VERSION >= 111
        db      0b3h, 05h, 0cdh, 90h, 0c3h, 0beh, 9ah, 5eh, 8ch, 0cah, 0b4h, 06h, 0b3h, 05h, 0cdh, 90h
        else
        db      0b3h, 05h, 0cdh, 90h, 0c3h, 0beh, 8ch, 5eh, 8ch, 0cah, 0b4h, 06h, 0b3h, 05h, 0cdh, 90h
        endif
        db      0c3h, "---OFF", 0a0h, 03dh, 017h, 0b4h, 009h, 0f6h, 0e4h, 004h, 018h
        else
        mov     bl, 5
        int     90h
tgt_2C5FF:
        add     cl, 27h
        pop     bx
        mov     bh, 0
        mov     al, byte ptr [bx+A3_TBL_00738]
        mov     ah, 0
        call    fn_2C616
        pop     cx
        pop     ax
        inc     al
        add     ch, 9
        ret
fn_2C616:
        cmp     al, 0
        je      br_2C640
        dec     al
        push    ax
        call    fn_28022
        pop     bx
        mov     bh, 0
        mov     es, word ptr [A3_W_00F10]
        mov     al, byte ptr es:[bx+580h]
        mov     ah, 4
        mul     ah
        add     ax, 0fc6h
        mov     si, ax
        mov     dx, ds
        mov     ah, 3
        mov     cl, 0c9h
        mov     bl, 5
        int     90h
        ret
br_2C640:
        mov     si, str_2B820_107-APP3_CSBASE
        mov     dx, cs
        mov     ah, 6
        mov     bl, 5
        int     90h
        ret
str_2B820_107:
        db      "---OFF"
cb_2C652:
        mov     al, byte ptr [A3_B_0173D]
        mov     ah, 9
        mul     ah
        add     al, 18h
        endif
        db      0b1h, 18h, 8ah, 0e8h, 0b0h, 19h, 0cdh, 0b0h, 0c3h
cb_2C664:
        db      0a0h, 3dh, 17h, 0b4h, 09h, 0f6h, 0e4h
        db      04h, 18h, 0b1h, 3fh, 8ah, 0e8h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h
cb_2C676:
        db      0a0h, 3dh, 17h, 0b4h, 09h
        if      FW_VERSION >= 110
        db      0f6h, 0e4h, 04h, 18h, 0b1h, 0c9h, 8ah, 0e8h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
FAR_2C688:
        db      0cdh, 0a3h, 80h
        db      3eh, 3dh, 17h, 02h, 74h, 05h, 0feh, 06h, 3dh, 17h, 0cbh, 80h, 3eh, 3ch, 17h, 1fh
L_2BDD1                         equ     $+8
        db      75h, 01h, 0cbh, 0feh, 06h, 3ch, 17h, 0cbh
L_2BDB3:
        db      0cdh, 0a3h, 80h, 3eh, 3dh, 17h, 00h, 74h
        db      05h, 0feh, 0eh, 3dh, 17h, 0cbh, 80h, 3eh, 3ch, 17h, 00h, 75h, 01h, 0cbh, 0feh, 0eh
        db      3ch, 17h, 0cbh, 8ah, 1eh, 3ch, 17h, 02h, 1eh, 3dh, 17h, 0b7h, 00h, 88h, 87h, 38h
        db      07h, 0eh, 0e8h, 71h, 0feh, 0cbh
        else
        mul     ah
        add     al, 18h
        DISP_CURSOR     0c9h, al, 13h
        ret
far_2C688:
        int     0a3h
        cmp     byte ptr [A3_B_0173D], 2
        je      br_2C696
        inc     byte ptr [A3_B_0173D]
        retf
br_2C696:
        cmp     byte ptr [A3_B_0173C], 1fh
        jne     L_2C0BE
        retf
L_2C0BE:
        inc     byte ptr [A3_B_0173C]
        retf
L_2C6A3:
        int     0a3h
        cmp     byte ptr [A3_B_0173D], 0
        je      br_2C6B1
        dec     byte ptr [A3_B_0173D]
        retf
br_2C6B1:
        cmp     byte ptr [A3_B_0173C], 0
        jne     br_2C6B9
        retf
br_2C6B9:
        dec     byte ptr [A3_B_0173C]
        retf
intcb_2B892_107:
        mov     bl, byte ptr [A3_B_0173C]
        add     bl, byte ptr [A3_B_0173D]
        mov     bh, 0
        mov     byte ptr [bx+A3_TBL_00738], al
        push    cs
        call    far_2C541
        retf
        endif
        endif
L_2C6D1:
        int     0a4h
        mov     word ptr [A3_W_01736], L_2C6D1-APP3_CSBASE
        if      (FW_VERSION <> 110) && (FW_VERSION <> 111)
        mov     word ptr [A3_W_0173A], cb_2C652-APP3_CSBASE
        elseif  FW_VERSION >= 111
        mov     word ptr [A3_W_0173A], 5ea0h
        else
        mov     word ptr [A3_W_0173A], 5e92h
        endif
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2C71C-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C6A3-APP3_SEG*16), APP3_SEG, EP_FAR_2C688_OFF, APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2C54C-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_2C6A3-APP3_SEG*16), APP3_SEG, EP_FAR_2C688_OFF, APP3_SEG
        retf
L_2C71C:
        int     0a4h
        mov     word ptr [A3_W_01736], L_2C71C-APP3_CSBASE
        mov     word ptr [A3_W_0173A], cb_2C664-APP3_CSBASE
        else
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2BE4A-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2BDB3-APP3_SEG*16), APP3_SEG, EP_FAR_2C688_OFF, APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2BC7A-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_2BDB3-APP3_SEG*16), APP3_SEG, EP_FAR_2C688_OFF, APP3_SEG
L_2BE4A                         equ     $+1
        db      0cbh
L_2BE2C:
        if      FW_VERSION >= 111
        db      0cdh, 0a4h, 0c7h, 06h, 36h, 17h, 6ah, 5fh, 0c7h, 06h, 3ah, 17h, 0b2h, 5eh
        else
        db      0cdh, 0a4h, 0c7h, 06h, 36h, 17h, 5ch, 5fh, 0c7h, 06h, 3ah, 17h, 0a4h, 5eh
        endif
        endif
        else
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2C71C-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C6A3-APP3_SEG*16), APP3_SEG, EP_FAR_2C688_OFF, APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2C54C-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_2C6A3-APP3_SEG*16), APP3_SEG, EP_FAR_2C688_OFF, APP3_SEG
        db      0cbh
L_2C71C:
        int     0a4h
        mov     word ptr [A3_W_01736], L_2C71C-APP3_CSBASE
        mov     word ptr [A3_W_0173A], cb_2C664-APP3_CSBASE
        endif
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        KEY_CURSOR      EP_L_2C6D1_OFF, EP_L_2C6D1_SEG, (APP3_BASE+L_2C78D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C77D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C785-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2C54C-APP3_SEG*16), APP3_SEG
        call    L_2C760
        retf
L_2C760:
        mov     bl, byte ptr [A3_B_0173C]
        add     bl, byte ptr [A3_B_0173D]
        mov     bh, 0
        mov     al, byte ptr [bx+A3_TBL_00738]
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 40h
        mov     di, intcb_2C6BE-APP3_CSBASE
        int     7fh
        ret
L_2C77D:
        push    cs
        call    L_2C6A3
        call    L_2C760
        retf
L_2C785:
        push    cs
        call    far_2C688
        call    L_2C760
        retf
L_2C78D:
        int     0a4h
        mov     word ptr [A3_W_01736], L_2C78D-APP3_CSBASE
        mov     word ptr [A3_W_0173A], cb_2C676-APP3_CSBASE
        else
        KEY_CURSOR      (APP3_BASE+L_2C6D1-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2BEBB-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2BEAB-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2BEB3-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2BC7A-APP3_SEG*16), APP3_SEG
        db      0e8h, 01h, 00h, 0cbh, 8ah, 1eh, 3ch, 17h, 02h, 1eh, 3dh, 17h, 0b7h, 00h, 8ah
        if      FW_VERSION >= 111
        db      87h, 38h, 07h, 0b4h, 00h, 0b3h, 00h, 0b7h, 00h, 0bah, 40h, 00h, 0bfh, 0ch, 5fh, 0cdh
        else
        db      87h, 38h, 07h, 0b4h, 00h, 0b3h, 00h, 0b7h, 00h, 0bah, 40h, 00h, 0bfh, 0feh, 5eh, 0cdh
L_2BEB3                         equ     $+0ah
        endif
L_2BEAB                         equ     $+2
        if      FW_VERSION >= 111
L_2BEB3                         equ     $+0ah
        endif
        db      7fh, 0c3h, 0eh, 0e8h, 22h, 0ffh, 0e8h, 0dch, 0ffh, 0cbh, 0eh, 0e8h, 0ffh, 0feh, 0e8h, 0d4h
L_2BEBB                         equ     $+2
        if      FW_VERSION >= 111
        db      0ffh, 0cbh, 0cdh, 0a4h, 0c7h, 06h, 36h, 17h, 0dbh, 5fh, 0c7h, 06h, 3ah, 17h, 0c4h, 5eh
        else
        db      0ffh, 0cbh, 0cdh, 0a4h, 0c7h, 06h, 36h, 17h, 0cdh, 5fh, 0c7h, 06h, 3ah, 17h, 0b6h, 5eh
        endif
        endif
        else
        KEY_CURSOR      EP_L_2C6D1_OFF, EP_L_2C6D1_SEG, (APP3_BASE+L_2C78D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C77D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C785-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2C54C-APP3_SEG*16), APP3_SEG
        db      0e8h, 01h
        db      00h, 0cbh
L_2C760:
        mov     bl, byte ptr [A3_B_0173C]
        add     bl, byte ptr [A3_B_0173D]
        mov     bh, 0
        mov     al, byte ptr [bx+A3_TBL_00738]
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 40h
        mov     di, intcb_2B892_107-APP3_CSBASE
        int     7fh
        ret
L_2C77D:
        push    cs
        call    L_2C6A3
        call    L_2C760
        retf
L_2C785:
        push    cs
        call    far_2C688
        call    L_2C760
        retf
L_2C78D:
        int     0a4h
        mov     word ptr [A3_W_01736], L_2C78D-APP3_CSBASE
        mov     word ptr [A3_W_0173A], cb_2C676-APP3_CSBASE
        endif
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        KEY_CURSOR      (APP3_BASE+L_2C71C-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2C6A3-APP3_SEG*16), APP3_SEG, EP_FAR_2C688_OFF, APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2C54C-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       (APP3_BASE+L_2C7D4-APP3_SEG*16), APP3_SEG
        retf
L_2C7D4:
        mov     es, word ptr [A3_W_00F10]
        mov     bl, byte ptr [A3_B_0173C]
        add     bl, byte ptr [A3_B_0173D]
        mov     bh, 0
        mov     bl, byte ptr [bx+A3_TBL_00738]
        sub     bl, 1
        jae     L_2C7EC
        retf
L_2C7EC:
        add     al, byte ptr es:[bx+580h]
        cmp     al, 20h
        jb      L_2C027
        mov     al, 20h
L_2C027:
        sub     al, cl
        if      FW_VERSION >= 114
br_2C7F9:
        endif
        jae     br_2C7FD
        mov     al, 0
br_2C7FD:
        mov     byte ptr es:[bx+580h], al
        retf
L_2C803:
        call    fn_280BD
        je      br_2C809
        retf
br_2C809:
        callf   [A3_FP_017C6]
        retf
        if      FW_VERSION < 114
br_2C7F9:
        endif
L_2C80E:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [A3_FP_017C6], si
        int     0a4h
        KEY_DOWN        20h, (APP3_BASE+L_2C842-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_2CB11-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      EP_L_2C6D1_OFF, APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2BDD1-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_2C688-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2BC7A-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       (APP3_BASE+L_2BF02-APP3_SEG*16), APP3_SEG
L_2BF02                         equ     $+1
        db      0cbh, 8eh, 06h, 10h, 0fh, 8ah, 1eh, 3ch
        db      17h, 02h, 1eh, 3dh, 17h, 0b7h, 00h, 8ah, 9fh, 38h, 07h, 80h, 0ebh, 01h, 73h, 01h
        db      0cbh, 26h, 02h, 87h, 80h, 05h, 3ch, 20h, 72h, 02h, 0b0h, 20h, 2ah, 0c1h, 73h, 02h
L_2C803                         equ     $+8
        if      FW_VERSION >= 111
        db      0b0h, 00h, 26h, 88h, 87h, 80h, 05h, 0cbh, 0e8h, 0b9h, 0b8h, 74h, 01h, 0cbh, 0ffh, 1eh
        else
        db      0b0h, 00h, 26h, 88h, 87h, 80h, 05h, 0cbh, 0e8h, 0bah, 0b8h, 74h, 01h, 0cbh, 0ffh, 1eh
        endif
        db      0c6h, 17h, 0cbh, 5eh, 56h, 83h, 0eeh, 03h, 89h, 36h, 0c6h, 17h, 0cdh, 0a4h
        KEY_DOWN        20h, EP_L_2BF70_OFF, APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_2C23F-APP3_SEG*16), APP3_SEG
        endif
        else
        KEY_CURSOR      (APP3_BASE+L_2C71C-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2C6A3-APP3_SEG*16), APP3_SEG, EP_FAR_2C688_OFF, APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2C54C-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       (APP3_BASE+L_2C7D4-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2C7D4:
        db      8eh
        push    es
        adc     byte ptr [bx], cl
        mov     bl, byte ptr [A3_B_0173C]
        add     bl, byte ptr [A3_B_0173D]
        mov     bh, 0
        mov     bl, byte ptr [bx+A3_TBL_00738]
        sub     bl, 1
        jae     L_2B3E0
        retf
L_2B3E0:
        add     al, byte ptr es:[bx+580h]
        cmp     al, 20h
        jb      L_2C027
        mov     al, 20h
L_2C027:
        sub     al, cl
        jae     br_2C7FD
        mov     al, 0
br_2C7FD:
        mov     byte ptr es:[bx+580h], al
        retf
L_2C803:
        call    fn_280BD
        je      br_2C809
        retf
br_2C809:
        callf   [A3_FP_017C6]
        retf
br_2C7F9:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [A3_FP_017C6], si
        int     0a4h
        KEY_DOWN        20h, (APP3_BASE+L_2C842-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_2CB11-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0c3h
L_2C842:
        DISP_WIN_WIDE   "MIDI Input"
        if      FW_VERSION >= 112
        if      FW_VERSION <> 120
br_2C857:
        endif
        else
        if      FW_VERSION = 107
br_2C857:
        endif
        endif
        DISP_TEXT       1ah, 22h, "MIDI filter:"
        DISP_TEXT       1ah, 2ah, "Type:                   Pass?:"
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "MONITR"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_HDOTS      1ah, 1fh, 0c4h
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        db      0e8h, 14h, 00h, 0e8h, 42h, 00h, 0e8h
        db      60h, 00h, 0e8h, 88h, 00h, 0e8h, 90h, 00h, 0e8h, 0c4h, 00h, 0ffh, 16h, 0cah, 17h, 0cbh
        db      80h, 3eh, 37h, 07h, 00h, 74h, 01h, 0c3h
        DISP_TEXT       1ah, 0dh, "Receive^ch:"
        db      0a0h, 33h, 07h, 3ch, 00h, 74h, 07h
        else
        call    fn_2C8BB
        call    fn_2C8EC
        call    fn_2C90D
        call    L_2BB0C
        call    fn_2C943
        call    fn_2C97A
        call    word ptr [A3_W_017CA]
        retf
fn_2C8BB:
        cmp     byte ptr [A3_B_00737], 0
        je      br_2C8C3
        ret
br_2C8C3:
        DISP_TEXT       1ah, 0dh, "Receive^ch:"
        mov     al, byte ptr [A3_B_00733]
        cmp     al, 0
        je      L_2C112
        endif
        DISP_NUMR       59h, 0dh, 02h
        db      0c3h
L_2C112:
        DISP_TEXT       59h, 0dh, "ALL"
        db      0c3h
fn_2C8EC:
        DISP_TEXT       71h, 0dh, "Prog^change>Seq:"
        mov     cl, 0ceh
        mov     ch, 0dh
        mov     al, byte ptr [7c1h]
        call    fn_26D9C
        ret
fn_2C90D:
        DISP_TEXT       1ah, 16h, "Sustain pedal to Duration:"
        mov     al, byte ptr [A3_B_00734]
        mov     cl, 0b7h
        mov     ch, 16h
        call    fn_26D9C
        ret
L_2BB0C:
        mov     al, byte ptr [A3_B_00735]
        mov     cl, 62h
        mov     ch, 22h
        call    fn_26D9C
        ret
fn_2C943:
        mov     al, byte ptr [A3_B_00736]
        sub     al, 6
        jae     br_2C957
        mov     dx, ds
        DISP_TEXT_IDX   38h, 2ah, 00736h, 017cdh
        ret
br_2C957:
        mov     byte ptr [A3_B_017CC], al
        sub     ah, ah
        DISP_NUM        38h, 2ah, 03h
        DISP_TEXT       4ah, 2ah, "-"
        inc     byte ptr [A3_B_017CC]
        mov     dx, ds
        DISP_TEXT_IDX   50h, 2ah, 017cch, 01a54h
        if      FW_VERSION >= 112
        db      0c3h
fn_2C97A:
        call    fn_2CADE
        and     bl, byte ptr [si]
        mov     al, bl
        mov     cl, 0ceh
        mov     ch, 2ah
        call    fn_26E05
tgt_2C988:
        ret
cb_2C989:
        DISP_CURSOR     59h, 0dh, 13h
        ret
tgt_2C992:
        DISP_CURSOR     0ceh, 0dh, 13h
        ret
cb_2C99B:
        DISP_CURSOR     0b7h, 16h, 13h
        ret
cb_2C9A4:
        DISP_CURSOR     62h, 22h, 13h
        ret
cb_2C9AD:
        DISP_CURSOR     38h, 2ah, 61h
        ret
cb_2C9B6:
        DISP_CURSOR     0ceh, 2ah, 13h
        ret
L_2C9BF:
        if      FW_VERSION >= 114
        call    L_2C80E
        db      80h, 3eh, 37h, 07h, 00h
        jne     L_2C9F3
        mov     word ptr [A3_W_017CA], cb_2C989-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 33h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 10h, 00h
        mov     di, field_cb_none-APP3_CSBASE
        db      0cdh
        db      7eh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+FAR_2C9F8-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_2CA25-APP3_SEG*16), APP3_SEG
far_2C9F8                       equ     $+6
        db      0cbh
L_2C9F3:
        db      0eh
        call    far_2CA25
        db      0cbh
        call    L_2C80E
        mov     word ptr [A3_W_017CA], tgt_2C992-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0c1h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h
        mov     di, field_cb_none-APP3_CSBASE
        db      0cdh, 7eh
        KEY_CURSOR      EP_L_2C9BF_OFF, EP_L_2C9BF_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+FAR_2CA25-APP3_SEG*16), APP3_SEG
far_2CA25                       equ     $+1
        db      0cbh
        call    L_2C80E
        mov     word ptr [A3_W_017CA], cb_2C99B-APP3_CSBASE
        db      8ch
        db      0d9h, 0beh, 34h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h
        mov     di, field_cb_none-APP3_CSBASE
        db      0cdh, 7dh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+FAR_2C9F8-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_2CA52-APP3_SEG*16), APP3_SEG
far_2CA52                       equ     $+1
        db      0cbh
        call    L_2C80E
        mov     word ptr [A3_W_017CA], cb_2C9A4-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 35h
        db      07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h
        mov     di, field_cb_none-APP3_CSBASE
        db      0cdh, 7dh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2CAAC-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_2CA25-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CA7F-APP3_SEG*16), APP3_SEG
        else
        call    br_2C7F9
        cmp     byte ptr [A3_B_00737], 0
        db      75h, 2ah
        mov     word ptr [A3_W_017CA], cb_2C989-APP3_CSBASE
        FIELD_ENTRY     ds, 733h, 0, 0, 10h, field_cb_none-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2C228-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_2C255_OFF, APP3_SEG
        db      0cbh, 0eh
        call    X_2A6CA
        retf
L_2C228:
        db      0e8h, 13h, 0feh
        mov     word ptr [A3_W_017CA], tgt_2C992-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0c1h, 07h, 0b3h, 00h
        db      0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0dch, 18h, 0cdh, 7eh
        KEY_CURSOR      EP_L_2C9BF_OFF, EP_L_2C9BF_SEG, 0000h, 0000h, 0000h, 0000h, EP_L_2C255_OFF, APP3_SEG
        endif
        db      0cbh
        if      FW_VERSION >= 114
L_2CA7F:
        call    L_2C80E
        mov     word ptr [A3_W_017CA], cb_2C9AD-APP3_CSBASE
        db      8ch, 0d9h
        else
X_2A6CA:
        call    br_2C7F9
        mov     word ptr [A3_W_017CA], cb_2C99B-APP3_CSBASE
        mov     cx, ds
        mov     si, 734h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2C228-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C282-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2C282:
        db      0e8h
        mov     cx, 0c7fdh
        push    es
        retf    0f417h
        db      61h
        FIELD_WHEEL     ds, 735h, 0, 0, 1, field_cb_none-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2C2DC-APP3_SEG*16), APP3_SEG, EP_L_2C255_OFF, APP3_SEG, (APP3_BASE+L_2CA7F-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2CA7F:
        db      0e8h
        db      8ch
        std
        mov     word ptr [A3_W_017CA], cb_2C9AD-APP3_CSBASE
        mov     cx, ds
        endif
        mov     si, 736h
        mov     bl, 0
        db      0b7h, 00h, 0bah, 85h, 00h
        mov     di, field_cb_none-APP3_CSBASE
        db      0cdh, 7dh
        if      FW_VERSION >= 114
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2CAAC-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_2CA52-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh
L_2CAAC:
        call    L_2C80E
        else
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2C2DC-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C282-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
L_2C2DC:
        call    br_2C7F9
        endif
        mov     word ptr [A3_W_017CA], cb_2C9B6-APP3_CSBASE
        KEY_WHEEL2      (APP3_BASE+L_2CAD8-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CAD2-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 114
        KEY_CURSOR      (APP3_BASE+L_2CA7F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_2CA25-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh
L_2CAD2:
        call    fn_2CADE
        db      08h, 1ch, 0cbh
L_2CAD8:
        call    fn_2CADE
        db      20h, 3ch, 0cbh
        else
        KEY_CURSOR      (APP3_BASE+L_2CA7F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_2C255_OFF, APP3_SEG, 0000h, 0000h
        retf
L_2CAD2:
        call    fn_2CADE
        or      byte ptr [si], bl
        retf
L_2CAD8:
        call    fn_2CADE
        and     byte ptr [si], bh
        retf
        endif
fn_2CADE:
        mov     al, byte ptr [A3_B_00736]
        mov     ah, 0
        cmp     al, 6
        jae     br_2CAF0
        mov     bx, 0fe01h
        mov     si, 75ah
        add     si, ax
        ret
br_2CAF0:
        sub     al, 6
        mov     bl, al
        and     bx, 7
        mov     bl, byte ptr cs:[bx+(APP3_BASE+TBL_2CB09-APP3_SEG*16)]
        shr     al, 3
        mov     si, 760h
        add     si, ax
        mov     bh, bl
        not     bh
        ret
TBL_2CB09:
        db      01h, 02h, 04h, 08h, 10h, 20h, 40h, 80h
L_2CB11:
        DISP_WIN_WIDE   "MIDI Input Monitor"
        call    L_2CB54
        else
        if      FW_VERSION >= 110
        db      0c3h, 0e8h
        if      FW_VERSION >= 111
        db      61h, 01h, 22h, 1ch, 8ah, 0c3h, 0b1h, 0ceh, 0b5h, 2ah, 0e8h, 7fh, 0a4h, 0c3h, 0b1h, 59h
        else
        db      61h, 01h, 22h, 1ch, 8ah, 0c3h, 0b1h, 0ceh, 0b5h, 2ah, 0e8h, 8dh, 0a4h, 0c3h, 0b1h, 59h
        endif
        db      0b5h, 0dh, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 0ceh, 0b5h, 0dh, 0b0h, 13h, 0cdh, 0b0h, 0c3h
        db      0b1h, 0b7h, 0b5h, 16h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 62h, 0b5h, 22h, 0b0h, 13h, 0cdh
        db      0b0h, 0c3h, 0b1h, 38h, 0b5h, 2ah, 0b0h, 61h, 0cdh, 0b0h, 0c3h, 0b1h, 0ceh, 0b5h, 2ah, 0b0h
        db      13h, 0cdh, 0b0h, 0c3h
        else
        db      0c3h
fn_2C97A:
        call    fn_2CADE
        and     bl, byte ptr [si]
        mov     al, bl
        mov     cl, 0ceh
        mov     ch, 2ah
        call    fn_26E05
tgt_2C988:
        ret
cb_2C989:
        DISP_CURSOR     59h, 0dh, 13h
        ret
tgt_2C992:
        DISP_CURSOR     0ceh, 0dh, 13h
        ret
cb_2C99B:
        DISP_CURSOR     0b7h, 16h, 13h
        ret
        DISP_CURSOR     62h, 22h, 13h
        ret
cb_2C9AD:
        DISP_CURSOR     38h, 2ah, 61h
        ret
cb_2C9B6:
        DISP_CURSOR     0ceh, 2ah, 13h
        ret
        endif
L_2C9BF:
        if      FW_VERSION >= 110
        db      0e8h, 4ch, 0feh, 80h, 3eh, 37h, 07h, 00h, 75h, 2ah, 0c7h, 06h
        if      FW_VERSION >= 111
        db      0cah, 17h, 0d7h, 61h, 8ch, 0d9h, 0beh, 33h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 10h, 00h
        db      0bfh, 0dch, 18h, 0cdh, 7eh
        else
        db      0cah, 17h, 0c9h, 61h, 8ch, 0d9h, 0beh, 33h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 10h, 00h
        db      0bfh, 0cfh, 18h, 0cdh, 7eh
        endif
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2C126-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_L_2C153_OFF, APP3_SEG
L_2C126                         equ     $+6
        db      0cbh, 0eh, 0e8h, 2eh, 00h, 0cbh, 0e8h, 13h, 0feh
        if      FW_VERSION >= 111
        db      0c7h, 06h, 0cah, 17h, 0e0h, 61h, 8ch, 0d9h, 0beh, 0c1h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah
        db      01h, 00h, 0bfh, 0dch, 18h, 0cdh, 7eh
        else
        db      0c7h, 06h, 0cah, 17h, 0d2h, 61h, 8ch, 0d9h, 0beh, 0c1h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah
        db      01h, 00h, 0bfh, 0cfh, 18h, 0cdh, 7eh
        endif
        KEY_CURSOR      EP_L_2C9BF_OFF, EP_L_2C9BF_SEG, 0000h, 0000h, 0000h, 0000h, EP_X_2A6CA_OFF, APP3_SEG
        db      0cbh
X_2A6CA:
        db      0e8h, 0e6h, 0fdh, 0c7h, 06h, 0cah
        if      FW_VERSION >= 111
        db      17h, 0e9h, 61h, 8ch, 0d9h, 0beh, 34h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh
        db      0dch, 18h, 0cdh, 7dh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2C126-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C162-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2C162:
        db      0e8h, 0b9h, 0fdh, 0c7h, 06h, 0cah, 17h, 0f2h, 61h
        db      8ch, 0d9h, 0beh, 35h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0dch, 18h, 0cdh
        else
        db      17h, 0dbh, 61h, 8ch, 0d9h, 0beh, 34h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh
        db      0cfh, 18h, 0cdh, 7dh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2C126-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C162-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2C162:
        db      0e8h, 0b9h, 0fdh, 0c7h, 06h, 0cah, 17h, 0e4h, 61h
        db      8ch, 0d9h, 0beh, 35h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0cfh, 18h, 0cdh
        endif
        db      7dh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2C1DA-APP3_SEG*16), APP3_SEG, EP_L_2C153_OFF, APP3_SEG, (APP3_BASE+L_2C1AD-APP3_SEG*16), APP3_SEG
L_2C1AD                         equ     $+1
        if      FW_VERSION >= 111
        db      0cbh, 0e8h, 8ch, 0fdh, 0c7h, 06h, 0cah, 17h, 0fbh, 61h, 8ch, 0d9h, 0beh
        db      36h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 85h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        else
        db      0cbh, 0e8h, 8ch, 0fdh, 0c7h, 06h, 0cah, 17h, 0edh, 61h, 8ch, 0d9h, 0beh
        db      36h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 85h, 00h, 0bfh, 0cfh, 18h, 0cdh, 7dh
        endif
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2C1DA-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C162-APP3_SEG*16), APP3_SEG, 0000h, 0000h
L_2C1DA                         equ     $+1
        if      FW_VERSION >= 111
        db      0cbh, 0e8h, 5fh, 0fdh, 0c7h, 06h, 0cah, 17h, 04h, 62h
        else
        db      0cbh, 0e8h, 5fh, 0fdh, 0c7h, 06h, 0cah, 17h, 0f6h, 61h
        endif
        KEY_WHEEL2      (APP3_BASE+L_2C206-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C200-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_2C1AD-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_X_2A6CA_OFF, APP3_SEG, 0000h, 0000h
        if      FW_VERSION < 111
L_2C206                         equ     $+7
        endif
L_2C200                         equ     $+1
        if      FW_VERSION >= 111
L_2C206                         equ     $+7
        endif
        db      0cbh, 0e8h, 09h, 00h, 08h, 1ch, 0cbh, 0e8h, 03h, 00h
        db      20h, 3ch, 0cbh, 0a0h, 36h, 07h, 0b4h, 00h, 3ch, 06h, 73h, 09h, 0bbh, 01h, 0feh, 0beh
        db      5ah, 07h, 03h, 0f0h, 0c3h, 2ch, 06h, 8ah, 0d8h, 83h, 0e3h, 07h
        mov     bl, byte ptr cs:[bx+TBL_2CB09-APP3_CSBASE]
        db      0c0h, 0e8h, 03h, 0beh, 60h, 07h, 03h, 0f0h, 8ah, 0fbh, 0f6h, 0d7h, 0c3h
TBL_2CB09:
        db      01h, 02h
        db      04h, 08h, 10h, 20h, 40h, 80h
L_2C23F:
        else
        call    br_2C7F9
        cmp     byte ptr [A3_B_00737], 0
        db      75h, 2ah
        mov     word ptr [A3_W_017CA], cb_2C989-APP3_CSBASE
        FIELD_ENTRY     ds, 733h, 0, 0, 10h, field_cb_none-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2C228-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_X_2A6CA_OFF, APP3_SEG
        db      0cbh, 0eh
        call    X_2A6CA
        retf
L_2C228:
        db      0e8h, 13h, 0feh
        mov     word ptr [A0_W_01804], tgt_2C992-APP3_CSBASE
        db      8ch, 0d9h, 0beh, 0c1h, 07h, 0b3h, 00h
        db      0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7eh
        KEY_CURSOR      EP_L_2C9BF_OFF, EP_L_2C9BF_SEG, 0000h, 0000h, 0000h, 0000h, EP_X_2A6CA_OFF, APP3_SEG
        db      0cbh
X_2A6CA:
        call    br_2C7F9
        mov     word ptr [A3_W_017CA], cb_2C99B-APP3_CSBASE
        FIELD_WHEEL     ds, 734h, 0, 0, 1, field_cb_none-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2C228-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C282-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2C282:
        db      0e8h
        mov     cx, 0c7fdh
        push    es
        retf    0b817h
        db      61h, 8ch, 0d9h, 0beh, 35h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0c0h, 18h
        db      0cdh, 7dh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2CAAC-APP3_SEG*16), APP3_SEG, EP_X_2A6CA_OFF, APP3_SEG, (APP3_BASE+L_2BC53-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2BC53:
        db      0e8h, 8ch, 0fdh
        mov     word ptr [A0_W_01804], cb_2C9AD-APP3_CSBASE
        db      8ch, 0d9h
        db      0beh, 36h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 85h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2CAAC-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C282-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh
L_2CAAC:
        db      0e8h, 5fh, 0fdh
        mov     word ptr [A0_W_01804], cb_2C9B6-APP3_CSBASE
        KEY_WHEEL2      (APP3_BASE+L_2CAD8-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CAD2-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_2BC53-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_X_2A6CA_OFF, APP3_SEG, 0000h, 0000h
        db      0cbh
L_2CAD2:
        db      0e8h, 09h, 00h, 08h, 1ch, 0cbh
L_2CAD8:
        db      0e8h, 03h
        db      00h, 20h, 3ch, 0cbh
fn_2CADE:
        mov     al, byte ptr [A3_B_00736]
        mov     ah, 0
        cmp     al, 6
        jae     br_2CAF0
        mov     bx, 0fe01h
        mov     si, 75ah
        add     si, ax
        ret
br_2CAF0:
        sub     al, 6
        mov     bl, al
        and     bx, 7
        mov     bl, byte ptr cs:[bx+(APP3_BASE+TBL_2CB09-APP3_SEG*16)]
        shr     al, 3
        mov     si, 760h
        add     si, ax
        mov     bh, bl
        not     bh
        ret
TBL_2CB09:
        db      01h, 02h, 04h, 08h, 10h, 20h, 40h, 80h
L_2CB11:
        endif
        DISP_WIN_WIDE   "MIDI Input Monitor"
        db      0e8h, 29h, 00h
        endif
        DISP_TEXT       20h, 11h, "IN^1"
        DISP_TEXT       20h, 26h, "IN^2"
        int     0f4h
        int     0a4h
        KEY_DOWN        13h, (APP3_BASE+L_2C803-APP3_SEG*16), APP3_SEG
        KEY_DOWN        21h, (APP3_BASE+L_2CC46-APP3_SEG*16), APP3_SEG
        retf
L_2CB54:
        mov     al, 31h
        DISP_CHAR       43h, 16h
        mov     al, 32h
        DISP_CHAR       4dh, 16h
        mov     al, 33h
        DISP_CHAR       57h, 16h
        mov     al, 34h
        DISP_CHAR       61h, 16h
        mov     al, 35h
        DISP_CHAR       6bh, 16h
        mov     al, 36h
        DISP_CHAR       75h, 16h
        mov     al, 37h
        DISP_CHAR       7fh, 16h
        mov     al, 38h
        DISP_CHAR       89h, 16h
        mov     al, 39h
        DISP_CHAR       93h, 16h
        mov     al, 0
        DISP_CHAR       9ch, 16h
        mov     al, 1
        DISP_CHAR       0a6h, 16h
        mov     al, 2
        DISP_CHAR       0b0h, 16h
        mov     al, 3
        DISP_CHAR       0bah, 16h
        mov     al, 4
        DISP_CHAR       0c4h, 16h
        mov     al, 5
        DISP_CHAR       0ceh, 16h
        mov     al, 6
        DISP_CHAR       0d8h, 16h
        DISP_HDOTS      16h, 1fh, 0cch
        mov     al, 31h
        DISP_CHAR       43h, 2ah
        db      0b0h, 32h
        DISP_CHAR       4dh, 2ah
        db      0b0h, 33h
        DISP_CHAR       57h, 2ah
        db      0b0h, 34h
        DISP_CHAR       61h, 2ah
        db      0b0h, 35h
        DISP_CHAR       6bh, 2ah
        db      0b0h
        db      36h
        DISP_CHAR       75h, 2ah
        db      0b0h, 37h
        DISP_CHAR       7fh, 2ah
        mov     al, 38h
        DISP_CHAR       89h, 2ah
        db      0b0h, 39h
        DISP_CHAR       93h, 2ah
        db      0b0h, 00h
        DISP_CHAR       9ch, 2ah
        db      0b0h, 01h
        DISP_CHAR       0a6h, 2ah
        db      0b0h, 02h
        DISP_CHAR       0b0h, 2ah
        db      0b0h, 03h
        DISP_CHAR       0bah, 2ah
        db      0b0h, 04h
        DISP_CHAR       0c4h, 2ah
        mov     al, 5
        DISP_CHAR       0ceh, 2ah
        db      0b0h, 06h
        DISP_CHAR       0d8h, 2ah
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        ret
L_2CC46:
        int     77h
        mov     bx, ax
        sub     ax, word ptr [A3_W_01846]
        cmp     ax, 1eh
        jae     br_2CC54
        retf
br_2CC54:
        mov     word ptr [A3_W_01846], bx
        int     0f2h
        retf
L_2CC5B:
        call    fn_280BD
        je      br_2CC61
        retf
br_2CC61:
        call    fn_280C2
        mov     al, byte ptr es:[si+580h]
        sub     al, 1
        jae     br_2CC6F
        mov     al, 0
br_2CC6F:
        mov     byte ptr [A3_B_0181C], al
        callf   [A3_FP_01816]
        retf
L_2BE4B:
        DISP_WIN_WIDE   "MIDI Output"
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "MONITR"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "PANIC"
        DISP_HDOTS      1ah, 1fh, 0c4h
        DISP_TEXT       20h, 10h, "  Soft thru:"
        DISP_TEXT       20h, 24h, "Device name:"
        mov     al, byte ptr [A3_B_00732]
        mov     dx, ds
        if      FW_VERSION >= 112
tgt_2CCDB                       equ     $+3
        DISP_TEXT_IDX   68h, 10h, 00732h, 0181dh
        mov     al, byte ptr [A3_B_0181C]
        inc     al
        push    ax
        mov     ah, 4
        mul     ah
        add     ax, 0fc6h
        mov     si, ax
        mov     dx, ds
        mov     ah, 4
        mov     cl, 68h
        mov     ch, 24h
        mov     bl, 5
        int     90h
        pop     ax
        mov     ah, 0
        shl     ax, 3
        add     ax, 78h
        mov     si, ax
        mov     cl, 80h
        mov     ch, 24h
        mov     ah, 8
        mov     dx, word ptr [A3_W_00F10]
        mov     bl, 5
        int     90h
        call    word ptr [A3_W_0181A]
        retf
cb_2CD1B:
        DISP_CURSOR     68h, 10h, 31h
        ret
cb_2CD24:
tgt_2CD25                       equ     $+1
        mov     cl, 68h
        mov     ch, 24h
        mov     al, 13h
        int     0b0h
        ret
cb_2CD2D:
        mov     cl, 80h
        mov     ch, 24h
        mov     al, 7
tgt_2CD33:
        int     0b0h
        ret
far_2CD36:
        int     0a4h
        mov     word ptr [A3_FP_01816], far_2CD36-APP3_CSBASE
        mov     word ptr [A3_W_0181A], cb_2CD1B-APP3_CSBASE
        KEY_DOWN        20h, (APP3_BASE+L_2BE4B-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 732h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 4
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_DOWN        1ah, (APP3_BASE+L_2C4BC-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_2C5A9-APP3_SEG*16), APP3_SEG
        else
        if      FW_VERSION < 110
tgt_2CCDB                       equ     $+3
        endif
        DISP_TEXT_IDX   68h, 10h, 00732h, 0181dh
        mov     al, byte ptr [A3_B_0181C]
        inc     al
        push    ax
        mov     ah, 4
        mul     ah
        add     ax, 0fc6h
        mov     si, ax
        mov     dx, ds
        mov     ah, 4
        mov     cl, 68h
        mov     ch, 24h
        mov     bl, 5
        db      0cdh, 90h, 58h, 0b4h, 00h, 0c1h, 0e0h, 03h, 05h, 78h, 00h, 8bh, 0f0h, 0b1h, 80h, 0b5h
        db      24h, 0b4h, 08h, 8bh, 16h, 10h, 0fh, 0b3h, 05h, 0cdh, 90h, 0ffh, 16h, 1ah, 18h, 0cbh
        if      FW_VERSION >= 110
        db      0b1h, 68h, 0b5h, 10h, 0b0h, 31h, 0cdh, 0b0h, 0c3h, 0b1h, 68h, 0b5h, 24h, 0b0h, 13h, 0cdh
        db      0b0h, 0c3h, 0b1h, 80h, 0b5h, 24h, 0b0h, 07h, 0cdh, 0b0h, 0c3h
far_2CD36:
        int     0a4h
        mov     word ptr [A3_FP_01816], far_2CD36-APP3_CSBASE
        if      FW_VERSION < 111
        mov     word ptr [A3_W_0181A], 655bh
        else
        mov     word ptr [A3_W_0181A], 6569h
        endif
        KEY_DOWN        20h, EP_L_2C3A5_OFF, APP3_SEG
        mov     cx, ds
        mov     si, 732h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 4
        mov     di, field_cb_none-APP3_CSBASE
        db      0cdh, 7dh
        KEY_DOWN        1ah, EP_L_2C4BC_OFF, APP3_SEG
        KEY_DOWN        11h, EP_L_2C5A9_OFF, APP3_SEG
        else
cb_2CD1B:
        DISP_CURSOR     68h, 10h, 31h
        ret
        db      0b1h
tgt_2CD25:
        push    24b5h
        mov     al, 13h
        int     0b0h
        ret
        db      0b1h, 80h, 0b5h, 24h, 0b0h, 07h
tgt_2CD33:
        int     0b0h
        ret
far_2CD36:
        int     0a4h
        mov     word ptr [A3_W_01816], far_2CD36-APP3_CSBASE
        mov     word ptr [A3_W_0181A], cb_2CD1B-APP3_CSBASE
        KEY_DOWN        20h, (APP3_BASE+L_2BE4B-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 732h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 4
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_DOWN        1ah, (APP3_BASE+L_2C4BC-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_2C5A9-APP3_SEG*16), APP3_SEG
        endif
        endif
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2C5A4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_2C4BC:
        int     0a4h
        mov     word ptr [A3_FP_01816], L_2C4BC-APP3_CSBASE
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        mov     word ptr [A3_W_0181A], cb_2CD24-APP3_CSBASE
        KEY_DOWN        20h, (APP3_BASE+L_2BE4B-APP3_SEG*16), APP3_SEG
        else
        if      FW_VERSION >= 111
        mov     word ptr [A3_W_0181A], 6572h
        else
        mov     word ptr [A3_W_0181A], 6564h
        endif
        KEY_DOWN        20h, EP_L_2C3A5_OFF, APP3_SEG
        endif
        else
        mov     word ptr [A3_W_0181A], 6538h
        KEY_DOWN        20h, (APP3_BASE+L_2BE4B-APP3_SEG*16), APP3_SEG
        endif
        mov     cx, ds
        mov     si, 181ch
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1fh
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        KEY_DOWN        19h, EP_L_2C464_OFF, APP3_SEG
        else
        KEY_DOWN        19h, (APP3_BASE+far_2CD36-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        18h, (APP3_BASE+far_2CDEE-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_2C5A9-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2C5A4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        26h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        retf
far_2CDEE:
        int     0a4h
        mov     word ptr [A3_FP_01816], far_2CDEE-APP3_CSBASE
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        mov     word ptr [A3_W_0181A], cb_2CD2D-APP3_CSBASE
        KEY_DOWN        20h, (APP3_BASE+L_2BE4B-APP3_SEG*16), APP3_SEG
        else
        if      FW_VERSION >= 111
        mov     word ptr [A3_W_0181A], 657bh
        else
        mov     word ptr [A3_W_0181A], 656dh
        endif
        KEY_DOWN        20h, EP_L_2C3A5_OFF, APP3_SEG
        endif
        KEY_DOWN        19h, (APP3_BASE+FAR_2CD36-APP3_SEG*16), APP3_SEG
        else
        mov     word ptr [A3_W_0181A], 6541h
        KEY_DOWN        20h, (APP3_BASE+L_2BE4B-APP3_SEG*16), APP3_SEG
        KEY_DOWN        19h, EP_APP3_6586_OFF, APP3_SEG
        endif
        KEY_DOWN        17h, (APP3_BASE+L_2C4BC-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+L_2C5A9-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2C5A4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        26h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 114
        KEY_WHEEL       EP_FAR_2CE59_OFF, APP3_SEG
        KEY_DOWN        22h, EP_FAR_2CE59_OFF, APP3_SEG
        KEY_DOWN        18h, EP_FAR_2CE59_OFF, APP3_SEG
        KEY_DIGITS      EP_FAR_2CE59_OFF, APP3_SEG
        db      0cbh
        else
        KEY_WHEEL       (APP3_BASE+L_2C02D-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_2C02D-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+L_2C02D-APP3_SEG*16), APP3_SEG
        KEY_DIGITS      (APP3_BASE+L_2C02D-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2C02D:
        db      0a0h
        endif
far_2CE59:
        if      FW_VERSION >= 114
        mov     al, byte ptr [A3_B_0181C]
        else
        sbb     al, 18h
        endif
        inc     al
        mov     ah, 0
        shl     ax, 3
        add     ax, 78h
        mov     si, ax
        mov     dx, word ptr [A3_W_00F10]
        mov     ah, 8
        if      FW_VERSION >= 111
        mov     bx, 18ddh
        elseif  FW_VERSION >= 110
        mov     bx, 18d0h
        else
        mov     bx, 18c1h
        endif
        mov     cx, cs
        int     0b7h
        retf
L_2C5A4:
        mov     bl, 17h
        int     87h
        retf
L_2C5A9:
        DISP_WIN_WIDE   "MIDI Output Monitor"
        call    L_2CB54
        DISP_TEXT       1eh, 11h, "OUT^A"
        DISP_TEXT       1eh, 26h, "OUT^B"
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        db      0cdh
        hlt
        int     0a4h
        KEY_DOWN        13h, (APP3_BASE+L_2CC5B-APP3_SEG*16), APP3_SEG
        KEY_DOWN        21h, (APP3_BASE+L_2CEC1-APP3_SEG*16), APP3_SEG
        retf
L_2CEC1:
        int     77h
        mov     bx, ax
        sub     ax, word ptr [A3_W_01846]
        cmp     ax, 1eh
        jae     br_2CECF
        retf
br_2CECF:
        mov     word ptr [A3_W_01846], bx
        int     0f3h
        retf
L_2CED6:
        call    fn_280BD
        je      L_2C70C
        retf
L_2C70C:
        int     0a4h
        KEY_WHEEL2      (APP3_BASE+L_2CF80-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CF73-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2CF09-APP3_SEG*16), APP3_SEG
        else
        db      0cdh, 0f4h, 0cdh, 0a4h
        KEY_DOWN        13h, (APP3_BASE+L_2CC5B-APP3_SEG*16), APP3_SEG
        KEY_DOWN        21h, (APP3_BASE+L_2C5EF-APP3_SEG*16), APP3_SEG
L_2C5EF                         equ     $+1
        db      0cbh, 0cdh, 77h, 8bh, 0d8h, 2bh, 06h, 46h, 18h, 3dh, 1eh
L_2CED6                         equ     $+0bh
        if      FW_VERSION >= 111
        db      00h, 73h, 01h, 0cbh, 89h, 1eh, 46h, 18h, 0cdh, 0f3h, 0cbh, 0e8h, 0e6h, 0b1h, 74h, 01h
        else
        db      00h, 73h, 01h, 0cbh, 89h, 1eh, 46h, 18h, 0cdh, 0f3h, 0cbh, 0e8h, 0e7h, 0b1h, 74h, 01h
        endif
        db      0cbh, 0cdh, 0a4h
        KEY_WHEEL2      (APP3_BASE+L_2C6AE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2C6A1-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_L_2C637_OFF, APP3_SEG
        endif
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        else
        db      0cdh
        hlt
        int     0a4h
        KEY_DOWN        13h, (APP3_BASE+L_2CC5B-APP3_SEG*16), APP3_SEG
        KEY_DOWN        21h, (APP3_BASE+L_2CEC1-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2CEC1:
        db      0cdh
        db      77h, 8bh, 0d8h
        sub     ax, word ptr [A3_W_01846]
        cmp     ax, 1eh
        jae     br_2CECF
        retf
br_2CECF:
        mov     word ptr [A3_W_01846], bx
        int     0f3h
        retf
L_2CED6:
        call    fn_280BD
        je      L_2C70C
        retf
L_2C70C:
        int     0a4h
        KEY_WHEEL2      (APP3_BASE+L_2CF80-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CF73-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2CF09-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, APP3_SEG
        endif
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_2CF09:
        DISP_WIN_WIDE   "Program change"
        DISP_TEXT       30h, 18h, "Transmit program changes"
        DISP_TEXT       30h, 23h, "in this track:"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        call    fn_280C2
        mov     al, byte ptr es:[si+680h]
        and     al, 4
        mov     cl, 84h
        mov     ch, 23h
        call    fn_26E05
        DISP_CURSOR     84h, 23h, 13h
        retf
L_2CF73:
        db      0e8h
        or      al, 0b1h
        call    fn_280C2
        or      byte ptr es:[si+680h], 4
        retf
L_2CF80:
        call    fn_28082
        db      0e8h, 3ch
tgt_2CF85:
        mov     cl, 26h
        and     byte ptr [si+A3_TBL_00680], 0fbh
        retf
L_2CF8D:
        call    fn_280BD
        db      74h
tgt_2CF91:
        db      01h, 0cbh
L_2CF93:
        int     57h
        call    fn_2B3C5
        callf   [A3_FP_01848]
        retf
fn_2CF9D:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [A3_FP_01848], si
        int     0a4h
        KEY_DOWN        20h, (APP3_BASE+L_2CFD9-APP3_SEG*16), APP3_SEG
        else
        if      FW_VERSION >= 111
        db      0e8h, 68h
        db      0b1h, 26h, 8ah, 84h, 80h, 06h, 24h, 04h, 0b1h, 84h, 0b5h, 23h, 0e8h, 9dh, 9eh, 0b1h
        else
        db      0e8h, 69h
        db      0b1h, 26h, 8ah, 84h, 80h, 06h, 24h, 04h, 0b1h, 84h, 0b5h, 23h, 0e8h, 0abh, 9eh, 0b1h
        endif
L_2C6A1                         equ     $+8
        if      FW_VERSION >= 111
        db      84h, 0b5h, 23h, 0b0h, 13h, 0cdh, 0b0h, 0cbh, 0e8h, 0eh, 0b1h, 0e8h, 4bh, 0b1h, 26h, 80h
        else
        db      84h, 0b5h, 23h, 0b0h, 13h, 0cdh, 0b0h, 0cbh, 0e8h, 0fh, 0b1h, 0e8h, 4ch, 0b1h, 26h, 80h
        endif
L_2C6AE                         equ     $+5
        if      FW_VERSION >= 111
        db      8ch, 80h, 06h, 04h, 0cbh, 0e8h, 01h, 0b1h, 0e8h, 3eh, 0b1h, 26h, 80h, 0a4h, 80h, 06h
        else
        db      8ch, 80h, 06h, 04h, 0cbh, 0e8h, 02h, 0b1h, 0e8h, 3fh, 0b1h, 26h, 80h, 0a4h, 80h, 06h
        endif
L_2CF8D                         equ     $+2
        if      FW_VERSION >= 111
        db      0fbh, 0cbh, 0e8h, 2fh, 0b1h, 74h, 01h, 0cbh, 0cdh, 57h, 0e8h, 2fh, 0e4h, 0ffh, 1eh, 48h
        else
        db      0fbh, 0cbh, 0e8h, 30h, 0b1h, 74h, 01h, 0cbh, 0cdh, 57h, 0e8h, 30h, 0e4h, 0ffh, 1eh, 48h
        endif
        db      18h, 0cbh, 5eh, 56h, 83h, 0eeh, 03h, 89h, 36h, 48h, 18h, 0cdh, 0a4h
        KEY_DOWN        20h, EP_L_2C707_OFF, APP3_SEG
        endif
        else
        db      0e8h
        xchg    dh, byte ptr [bx+di-75dah]
        test    byte ptr [bx+si+A3_TBL_02406], al
        add     al, 0b1h
        test    byte ptr [di+A3_TBL_0E823], dh
        xlat
        sahf
        DISP_CURSOR     84h, 23h, 13h
        retf
L_2CF73:
        db      0e8h
        sub     al, 0b1h
        call    fn_280C2
        or      byte ptr es:[si+680h], 4
        retf
L_2CF80:
        db      0e8h, 1fh, 0b1h, 0e8h, 5ch
tgt_2CF85:
        mov     cl, 26h
        and     byte ptr [si+A3_TBL_00680], 0fbh
        retf
L_2C161:
        db      0e8h, 4dh, 0b1h, 74h
tgt_2CF91:
        db      01h, 0cbh
        call    fn_2B3C5
        callf   [A3_FP_01848]
        retf
fn_2CF9D:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [A3_FP_01848], si
        int     0a4h
        KEY_DOWN        20h, (APP3_BASE+L_2CFD9-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, EP_L_2C9D9_OFF, EP_L_2C9D9_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 110
        KEY_DOWN        21h, EP_L_2B3A1_OFF, APP3_SEG
        ret
        else
        KEY_DOWN        21h, EP_L_2AAD1_OFF, APP3_SEG
        db      0c3h
        endif
L_2CFD9:
        DISP_WIN_WIDE   "Edit Velocity"
        DISP_HDOTS      18h, 1eh, 0c8h
        DISP_TEXT       1ah, 10h, "Edit type:              Value:   "
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        mov     dx, ds
        DISP_TEXT_IDX   56h, 10h, 0184eh, 01850h
        mov     al, byte ptr [A3_B_0184F]
        mov     ah, 0
        DISP_NUM        0ceh, 10h, 03h
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        mov     cl, 1ah
        mov     ch, 21h
        call    fn_28115
        mov     cl, 1ah
        mov     ch, 2ah
        call    fn_2815E
        call    word ptr [A3_W_0184C]
        retf
cb_2D058:
        DISP_CURSOR     56h, 10h, 3dh
        ret
cb_2D061:
        db      0b1h, 0ceh, 0b5h
tgt_2D064:
        adc     byte ptr [bx+si-32edh], dh
        mov     al, 0c3h
cb_2D06A:
        DISP_CURSOR     3eh, 2ah, 25h
        ret
far_2D074                       equ     $+1
cb_2D073:
        db      0c3h
        call    fn_2CF9D
        mov     word ptr [A3_W_0184C], cb_2D058-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2D0B4-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2D0FC-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h
        mov     si, 184eh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3
        mov     di, intcb_2D0A1-APP3_CSBASE
        int     7dh
        retf
intcb_2D0A1:
        cmp     al, 2
        jne     L_2CAC6
        retf
L_2CAC6:
        mov     al, byte ptr [A3_B_0184F]
        cmp     al, 7fh
        jae     br_2D0AE
        retf
br_2D0AE:
        mov     byte ptr [A3_B_0184F], 7fh
        retf
L_2D0B4:
        call    fn_2CF9D
        mov     word ptr [A3_W_0184C], cb_2D061-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+FAR_2D074-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2D11F-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 184fh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 0c8h
        mov     di, intcb_2D0E1-APP3_CSBASE
        int     7dh
        retf
intcb_2D0E1:
        mov     bl, 0c8h
        cmp     byte ptr [A3_B_0184E], 2
        je      br_2D0EC
        mov     bl, 7fh
br_2D0EC:
        cmp     al, bl
        jb      br_2D0F2
        mov     al, bl
br_2D0F2:
        cmp     al, 0
        jne     br_2D0F8
        mov     al, 1
br_2D0F8:
        mov     byte ptr [A3_B_0184F], al
        retf
L_2D0FC:
        call    fn_2CF9D
        mov     word ptr [A3_W_0184C], cb_2D073-APP3_CSBASE
        mov     ax, 68c4h
        mov     bx, 6992h
        mov     bp, 6904h
        mov     dx, 69d6h
        mov     di, 69f8h
        mov     si, 6829h
        mov     cl, 3eh
        mov     ch, 21h
        call    fn_2ABF2
        retf
L_2D11F:
        call    fn_2CF9D
        mov     word ptr [A3_W_0184C], cb_2D073-APP3_CSBASE
        mov     ax, 68c4h
        mov     bx, 6992h
        mov     bp, 6904h
        mov     dx, 69d6h
        mov     di, 69f8h
        mov     si, 6829h
        mov     cl, 3eh
        mov     ch, 21h
        call    fn_2AC05
        retf
        call    fn_2CF9D
        mov     word ptr [A3_W_0184C], cb_2D073-APP3_CSBASE
        call    fn_280CB
        jne     loop_2D16A
        mov     ax, 694ch
        mov     bx, 69f8h
        mov     bp, 696fh
        mov     dx, 69f8h
        mov     di, 69f8h
        mov     si, 6829h
        mov     cl, 3eh
        mov     ch, 2ah
        call    fn_2B21A
        retf
loop_2D16A:
        mov     word ptr [A3_W_0184C], cb_2D06A-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2D0FC-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        call    fn_2B2E2
        retf
        call    fn_2CF9D
        call    fn_280CB
        jne     loop_2D16A
        mov     ax, 694ch
        mov     bx, 69f8h
        mov     bp, 696fh
        mov     dx, 69f8h
        mov     di, 69f8h
        mov     si, 6829h
        mov     cl, 3dh
        mov     ch, 2ah
        call    fn_2B27E
        retf
        retf
        else
        if      FW_VERSION >= 111
        db      0b1h, 1ah, 0b5h, 21h, 0e8h, 0cbh
        db      0b0h, 0b1h, 1ah, 0b5h, 2ah, 0e8h, 0dh, 0b1h, 0ffh, 16h, 4ch, 18h, 0cbh, 0b1h, 56h, 0b5h
        else
        db      0b1h, 1ah, 0b5h, 21h, 0e8h, 0cch
        db      0b0h, 0b1h, 1ah, 0b5h, 2ah, 0e8h, 0eh, 0b1h, 0ffh, 16h, 4ch, 18h, 0cbh, 0b1h, 56h, 0b5h
        endif
        db      10h, 0b0h, 3dh, 0cdh, 0b0h, 0c3h, 0b1h, 0ceh, 0b5h, 10h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h
        db      3eh, 0b5h, 2ah, 0b0h, 25h, 0cdh, 0b0h, 0c3h, 0c3h
far_2D074:
        db      0e8h, 26h, 0ffh, 0c7h, 06h, 4ch, 18h
        if      FW_VERSION >= 111
        db      0a6h, 68h
        else
        db      98h, 68h
        endif
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2C7E2-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2C82A-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 4eh, 18h, 0b3h, 00h, 0b7h, 00h, 0bah, 03h, 00h
        if      FW_VERSION >= 111
        db      0bfh, 0efh, 68h, 0cdh, 7dh, 0cbh, 3ch, 02h, 75h, 01h, 0cbh, 0a0h, 4fh, 18h, 3ch, 7fh
        else
        db      0bfh, 0e1h, 68h, 0cdh, 7dh, 0cbh, 3ch, 02h, 75h, 01h, 0cbh, 0a0h, 4fh, 18h, 3ch, 7fh
        endif
L_2C7E2                         equ     $+9
        db      73h, 01h, 0cbh, 0c6h, 06h, 4fh, 18h, 7fh, 0cbh, 0e8h, 0e6h, 0feh, 0c7h, 06h, 4ch, 18h
        if      FW_VERSION >= 111
        db      0afh, 68h
        else
        db      0a1h, 68h
        endif
        KEY_CURSOR      (APP3_BASE+FAR_2D074-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2C84D-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 4fh, 18h, 0b3h, 00h, 0b7h, 00h, 0bah, 0c8h, 00h
        if      FW_VERSION >= 111
        db      0bfh, 2fh, 69h, 0cdh, 7dh, 0cbh, 0b3h, 0c8h, 80h, 3eh, 4eh, 18h, 02h, 74h, 02h, 0b3h
        else
        db      0bfh, 21h, 69h, 0cdh, 7dh, 0cbh, 0b3h, 0c8h, 80h, 3eh, 4eh, 18h, 02h, 74h, 02h, 0b3h
        endif
        db      7fh, 3ah, 0c3h, 72h, 02h, 8ah, 0c3h, 3ch, 00h, 75h, 02h, 0b0h, 01h, 0a2h, 4fh, 18h
L_2C82A                         equ     $+1
        if      FW_VERSION >= 111
        db      0cbh, 0e8h, 9eh, 0feh, 0c7h, 06h, 4ch, 18h, 0c1h, 68h, 0b8h, 0c2h, 68h, 0bbh, 90h, 69h
        db      0bdh, 02h, 69h, 0bah, 0d4h, 69h, 0bfh, 0f6h, 69h, 0beh, 27h, 68h, 0b1h, 3eh, 0b5h, 21h
        else
        db      0cbh, 0e8h, 9eh, 0feh, 0c7h, 06h, 4ch, 18h, 0b3h, 68h, 0b8h, 0b4h, 68h, 0bbh, 82h, 69h
        db      0bdh, 0f4h, 68h, 0bah, 0c6h, 69h, 0bfh, 0e8h, 69h, 0beh, 19h, 68h, 0b1h, 3eh, 0b5h, 21h
        endif
L_2C84D                         equ     $+4
        if      FW_VERSION >= 111
        db      0e8h, 0d6h, 0dah, 0cbh, 0e8h, 7bh, 0feh, 0c7h, 06h, 4ch, 18h, 0c1h, 68h, 0b8h, 0c2h, 68h
        db      0bbh, 90h, 69h, 0bdh, 02h, 69h, 0bah, 0d4h, 69h, 0bfh, 0f6h, 69h, 0beh, 27h, 68h, 0b1h
        db      3eh, 0b5h, 21h, 0e8h, 0c6h, 0dah, 0cbh, 0e8h, 58h, 0feh, 0c7h, 06h, 4ch, 18h, 0c1h, 68h
        db      0e8h, 7fh, 0afh, 75h, 1ah, 0b8h, 4ah, 69h, 0bbh, 0f6h, 69h, 0bdh, 6dh, 69h, 0bah, 0f6h
        db      69h, 0bfh, 0f6h, 69h, 0beh, 27h, 68h, 0b1h, 3eh, 0b5h, 2ah, 0e8h, 0b3h, 0e0h, 0cbh, 0c7h
        db      06h, 4ch, 18h, 0b8h, 68h
        else
        db      0e8h, 0d7h, 0dah, 0cbh, 0e8h, 7bh, 0feh, 0c7h, 06h, 4ch, 18h, 0b3h, 68h, 0b8h, 0b4h, 68h
        db      0bbh, 82h, 69h, 0bdh, 0f4h, 68h, 0bah, 0c6h, 69h, 0bfh, 0e8h, 69h, 0beh, 19h, 68h, 0b1h
        db      3eh, 0b5h, 21h, 0e8h, 0c7h, 0dah, 0cbh, 0e8h, 58h, 0feh, 0c7h, 06h, 4ch, 18h, 0b3h, 68h
        db      0e8h, 80h, 0afh, 75h, 1ah, 0b8h, 3ch, 69h, 0bbh, 0e8h, 69h, 0bdh, 5fh, 69h, 0bah, 0e8h
        db      69h, 0bfh, 0e8h, 69h, 0beh, 19h, 68h, 0b1h, 3eh, 0b5h, 2ah, 0e8h, 0b4h, 0e0h, 0cbh, 0c7h
        db      06h, 4ch, 18h, 0aah, 68h
        endif
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2C82A-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        if      FW_VERSION >= 111
        db      0e8h, 5fh, 0e1h, 0cbh, 0e8h, 14h, 0feh, 0e8h, 41h
        db      0afh, 75h, 0dch, 0b8h, 4ah, 69h, 0bbh, 0f6h, 69h, 0bdh, 6dh, 69h, 0bah, 0f6h, 69h, 0bfh
        db      0f6h, 69h, 0beh, 27h, 68h, 0b1h, 3dh, 0b5h, 2ah, 0e8h, 0d9h, 0e0h, 0cbh, 0cbh
        else
        db      0e8h, 60h, 0e1h, 0cbh, 0e8h, 14h, 0feh, 0e8h, 42h
        db      0afh, 75h, 0dch, 0b8h, 3ch, 69h, 0bbh, 0e8h, 69h, 0bdh, 5fh, 69h, 0bah, 0e8h, 69h, 0bfh
        db      0e8h, 69h, 0beh, 19h, 68h, 0b1h, 3dh, 0b5h, 2ah, 0e8h, 0dah, 0e0h, 0cbh, 0cbh
        endif
        endif
        else
        mov     cl, 1ah
        mov     ch, 21h
        call    fn_28115
        mov     cl, 1ah
        mov     ch, 2ah
        call    fn_2815E
        call    word ptr [A3_W_0184C]
        retf
cb_2D058:
        DISP_CURSOR     56h, 10h, 3dh
        ret
cb_2D061:
        db      0b1h, 0ceh, 0b5h
tgt_2D064:
        adc     byte ptr [bx+si-32edh], dh
        mov     al, 0c3h
cb_2D06A:
        DISP_CURSOR     3eh, 2ah, 25h
        ret
cb_2D073:
        db      0c3h
L_2C246:
        db      0e8h, 26h, 0ffh
        mov     word ptr [A3_W_0184C], cb_2D058-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2D0B4-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2D0FC-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh
        dec     si
        sbb     byte ptr [bp+di-4900h], dh
        db      00h, 0bah, 03h, 00h
        mov     di, intcb_2C273_107-APP3_CSBASE
        int     7dh
        retf
intcb_2C273_107:
        cmp     al, 2
        jne     L_2CAC6
        retf
L_2CAC6:
        mov     al, byte ptr [A3_B_0184F]
        cmp     al, 7fh
        jae     br_2D0AE
        retf
br_2D0AE:
        mov     byte ptr [A3_B_0184F], 7fh
        retf
L_2D0B4:
        call    fn_2CF9D
        mov     word ptr [A3_W_0184C], cb_2D061-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_2C246-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2D11F-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 184fh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 0c8h
        mov     di, intcb_2C2B3_107-APP3_CSBASE
        int     7dh
        retf
intcb_2C2B3_107:
        mov     bl, 0c8h
        cmp     byte ptr [A3_B_0184E], 2
        je      br_2D0EC
        mov     bl, 7fh
br_2D0EC:
        cmp     al, bl
        jb      br_2D0F2
        mov     al, bl
br_2D0F2:
        cmp     al, 0
        jne     br_2D0F8
        mov     al, 1
br_2D0F8:
        mov     byte ptr [A3_B_0184F], al
        retf
L_2D0FC:
        call    fn_2CF9D
        mov     word ptr [A3_W_0184C], cb_2D073-APP3_CSBASE
        mov     ax, 6886h
        mov     bx, 6954h
        mov     bp, 68c6h
        mov     dx, 6998h
        mov     di, 69bah
        mov     si, 67ebh
        mov     cl, 3eh
        mov     ch, 21h
        call    fn_2ABF2
        retf
L_2D11F:
        call    fn_2CF9D
        mov     word ptr [A3_W_0184C], cb_2D073-APP3_CSBASE
        mov     ax, 6886h
        mov     bx, 6954h
        mov     bp, 68c6h
        mov     dx, 6998h
        mov     di, 69bah
        mov     si, 67ebh
        mov     cl, 3eh
        mov     ch, 21h
        call    fn_2AC05
        retf
        call    fn_2CF9D
        mov     word ptr [A3_W_0184C], cb_2D073-APP3_CSBASE
        call    fn_280CB
        jne     loop_2D16A
        mov     ax, 690eh
        mov     bx, 69bah
        mov     bp, 6931h
        mov     dx, 69bah
        mov     di, 69bah
        mov     si, 67ebh
        mov     cl, 3eh
        mov     ch, 2ah
        call    fn_2B21A
        retf
loop_2D16A:
        mov     word ptr [A3_W_0184C], cb_2D06A-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2D0FC-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0e8h, 64h, 0e1h, 0cbh
        call    fn_2CF9D
        call    fn_280CB
        jne     loop_2D16A
        mov     ax, 690eh
        mov     bx, 69bah
        mov     bp, 6931h
        mov     dx, 69bah
        mov     di, 69bah
        mov     si, 67ebh
        mov     cl, 3dh
        mov     ch, 2ah
        call    fn_2B27E
        retf
        db      0cbh
        endif
L_2C8D7:
        int     85h
        push    ax
        push    dx
        call    fn_2B32D
        call    fn_2B36F
        mov     bl, byte ptr [A3_B_01577]
        mov     bh, byte ptr [A3_B_01578]
        push    bx
        call    fn_280CB
        pop     bx
        je      br_2D1D3
        mov     bl, 0
        mov     bh, 7fh
        cmp     byte ptr [A3_B_01579], 41h
        je      br_2D1D3
        mov     bl, byte ptr [A3_B_0157A]
        mov     bh, bl
br_2D1D3:
        push    bx
        int     83h
        mov     bl, byte ptr [A3_B_0184E]
        mov     bh, 0
        shl     bx, 1
        mov     di, word ptr cs:[bx+TBL_2D234-APP3_CSBASE]
        pop     bx
loop_2D1E4:
        mov     al, byte ptr es:[si+4]
        cmp     al, 0ffh
        je      br_2D226
        mov     cx, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 3f0fh
        sub     cx, word ptr [A3_W_0156F]
        sbb     dl, byte ptr [A3_W_01571]
        jae     br_2D226
        cmp     al, bl
        jb      br_2D221
        cmp     al, bh
        ja      br_2D221
        cmp     dh, byte ptr [A3_W_00712]
        jne     br_2D221
        mov     cl, byte ptr es:[si+6]
        mov     ch, cl
        and     cx, 807fh
        call    di
        or      al, ch
        mov     byte ptr es:[si+6], al
br_2D221:
        call    fn_281FE
        jmp     loop_2D1E4
br_2D226:
        int     0d6h
        pop     dx
        pop     ax
        mov     bl, 0ah
        int     87h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
TBL_2D234:
        dw      tscb_2D23C-APP3_CSBASE, tscb_2D249-APP3_CSBASE, tscb_2D25A-APP3_CSBASE, tscb_2D270-APP3_CSBASE
tscb_2D23C:
        mov     al, cl
        add     al, byte ptr [A3_B_0184F]
        cmp     al, 7fh
        jb      br_2D248
        mov     al, 7fh
br_2D248:
        ret
tscb_2D249:
        mov     al, cl
        sub     al, byte ptr [A3_B_0184F]
        jae     br_2D253
        mov     al, 1
br_2D253:
        cmp     al, 0
        jne     br_2D259
        mov     al, 1
br_2D259:
        ret
tscb_2D25A:
        mov     al, byte ptr [A3_B_0184F]
        mul     cl
        mov     cl, 64h
        div     cl
        cmp     al, 7fh
        jb      br_2D269
        mov     al, 7fh
br_2D269:
        cmp     al, 0
        jne     br_2D26F
        mov     al, 1
br_2D26F:
        ret
tscb_2D270:
        db      0a0h, 4fh, 18h, 0c3h
X_2D274:
        mov     bx, 13eh
        int     0a9h
        jae     br_2D27C
        retf
br_2D27C:
        mov     bx, 144h
        int     0a9h
        jae     br_2D284
        retf
br_2D284:
        int     57h
        call    fn_2B3C5
        mov     ax, word ptr [A3_W_00712]
        inc     ax
        mov     word ptr [A3_W_01886], ax
        callf   [A3_FP_01880]
        retf
fn_2D295:
        pop     si
L_2D296:
        push    si
        sub     si, 3
        mov     word ptr [A3_FP_01880], si
        int     0a4h
        KEY_DOWN        16h, (APP3_BASE+goto_main_screen-APP3_SEG*16), APP3_SEG
        KEY_DOWN        1dh, (APP3_BASE+goto_main_screen-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, (APP3_BASE+goto_main_screen-APP3_SEG*16), APP3_SEG
        KEY_DOWN        27h, (APP3_BASE+goto_main_screen-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2CCFC-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2D2E1-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_2B31A-APP3_SEG*16), APP3_SEG
        KEY_DOWN        21h, (APP3_BASE+L_2B3A1-APP3_SEG*16), APP3_SEG
        ret
L_2D2E1:
        DISP_WIN_WIDE   "ERASE"
        DISP_TEXT       1ah, 0dh, "Track:  -"
        DISP_TEXT       0b6h, 0dh, "(0=all)"
        DISP_TEXT       1ah, 0dh, "Track:  -"
        DISP_TEXT       1ah, 17h, "Times:   .  .  -   .  .  "
        DISP_TEXT       1ah, 21h, "Erase:"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        db      0e8h
        adc     al, byte ptr [bx+si]
        mov     cl, 1ah
        mov     ch, 17h
        call    fn_28115
        call    fn_2D3AD
        call    fn_2D3F0
        call    word ptr [A3_W_01884]
        retf
        db      0a1h, 86h, 18h
        cmp     al, 0
        je      br_2D393
        push    ax
        DISP_NUM        3eh, 0dh, 02h
        pop     si
        dec     si
        shl     si, 4
        add     si, 180h
        mov     dx, word ptr [A3_W_00F10]
        mov     ah, 10h
        mov     cl, 50h
        mov     ch, 0dh
        mov     bl, 5
        int     90h
        ret
br_2D393:
        DISP_TEXT       3eh, 0dh, " 0-ALL             "
        ret
fn_2D3AD:
        mov     dx, ds
        DISP_TEXT_IDX   3eh, 21h, 01888h, 0188dh
        db      80h
        mov     byte ptr ds:[bx+si], bl
        add     byte ptr [di+1], dh
        ret
        mov     dx, ds
        DISP_TEXT_IDX   8ch, 21h, 01889h, 018b2h
        db      80h
        mov     word ptr ds:[bx+si], bx
        add     byte ptr [di+1], dh
        ret
        DISP_ERASE      1ah, 28h, 0c6h, 07h
        cmp     byte ptr [A3_B_01889], 2
        je      br_2D3E4
        ret
br_2D3E4:
        mov     al, byte ptr [188ah]
        sub     ah, ah
        DISP_NUM        0bch, 21h, 03h
        ret
fn_2D3F0:
        cmp     byte ptr [1888h], 0
        je      br_2D3FF
        cmp     byte ptr [A3_B_01889], 0
        je      br_2D3FF
        ret
br_2D3FF:
        mov     cl, 1ah
        mov     ch, 2bh
        call    fn_2815E
        ret
cb_2D407:
        DISP_CURSOR     3eh, 0dh, 0dh
        ret
cb_2D410:
        DISP_CURSOR     3eh, 21h, 3dh
        ret
cb_2D419:
        DISP_CURSOR     8ch, 21h, 49h
        ret
cb_2D422:
        DISP_CURSOR     0bch, 21h, 13h
        ret
        DISP_CURSOR     3eh, 2bh, 31h
        ret
        DISP_CURSOR     80h, 2bh, 31h
        ret
cb_2D43D:
        DISP_CURSOR     3eh, 2bh, 25h
        ret
cb_2D446:
        ret
d_a3_w_06c97:
        retf
L_2CB76:
        call    fn_2D295
        mov     word ptr [A3_W_01884], cb_2D407-APP3_CSBASE
        FIELD_ENTRY     ds, 1886h, 0, 0, 40h, field_cb_none-APP3_CSBASE
        KEY_DOWN        19h, 0000h, 0000h
        KEY_DOWN        1ah, (APP3_BASE+L_2CBA1-APP3_SEG*16), APP3_SEG
        retf
L_2CBA1:
        call    fn_2D295
        mov     word ptr [A3_W_01884], cb_2D446-APP3_CSBASE
        mov     ax, A3_W_06C98
        mov     bx, A3_W_06CE6
        mov     bp, A3_W_06C98
        mov     dx, A3_W_06CE6
        mov     di, A3_W_06C97
        mov     si, A3_W_06B31
        mov     cl, 3eh
        mov     ch, 17h
        call    fn_2ABF2
        retf
L_2CBC4:
        call    fn_2D295
        mov     word ptr [A3_W_01884], cb_2D410-APP3_CSBASE
        KEY_WHEEL       EP_FN_2D4AE_OFF, EP_FN_2D4AE_SEG
        sub     ax, ax
        sub     cx, cx
        push    cs
        call    fn_2D4AE
        retf
fn_2D4AE:
        add     al, byte ptr [1888h]
        sub     al, cl
        jae     br_2D4B8
        mov     al, 0
br_2D4B8:
        cmp     al, 2
        jb      L_2D4BE
        mov     al, 2
L_2D4BE:
        mov     byte ptr [1888h], al
        cmp     al, 0
        if      FW_VERSION >= 112
        je      L_2CF08
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2D4FB-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CBA1-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        else
        db      74h, 23h
        if      FW_VERSION >= 110
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2CC29-APP3_SEG*16), APP3_SEG, EP_L_2CBA1_OFF, APP3_SEG, 0000h, 0000h
        else
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2D4FB-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CBA1-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        endif
        endif
        cmp     byte ptr [A3_B_01889], 0
        je      br_2D4DF
        retf
br_2D4DF:
        KEY_DOWN        1ah, (APP3_BASE+L_2CCB8-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 110
        retf
        if      FW_VERSION >= 112
L_2CF08:
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2CBA1-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CCB8-APP3_SEG*16), APP3_SEG
        retf
L_2D4FB:
        call    fn_2D295
        else
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, EP_L_2CBA1_OFF, APP3_SEG, EP_L_2CCB8_OFF, APP3_SEG
L_2CC29                         equ     $+1
        db      0cbh, 0e8h
        xchg    di, ax
        std
        endif
        else
        db      0cbh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2CBA1-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CCB8-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2D4FB:
        db      0e8h
        xchg    di, ax
        std
        endif
        mov     word ptr [A3_W_01884], cb_2D419-APP3_CSBASE
        KEY_WHEEL       EP_FN_2D513_OFF, EP_FN_2D513_SEG
        sub     ax, ax
        sub     cx, cx
        push    cs
        call    fn_2D513
        retf
fn_2D513:
        add     al, byte ptr [A3_B_01889]
        sub     al, cl
        jae     br_2D51D
        mov     al, 0
br_2D51D:
        cmp     al, 6
        jb      L_2CF43
        mov     al, 6
L_2CF43:
        mov     byte ptr [A3_B_01889], al
        cmp     al, 2
        if      FW_VERSION >= 112
        je      L_2CF6A
        else
        db      74h, 20h
        endif
        KEY_CURSOR      (APP3_BASE+L_2CBC4-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2CBA1-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        cmp     al, 0
        je      L_2D541
        retf
L_2D541:
        KEY_DOWN        1ah, (APP3_BASE+L_2CCB8-APP3_SEG*16), APP3_SEG
        if      FW_VERSION < 112
        db      0cbh
        KEY_CURSOR      (APP3_BASE+L_2CBC4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CC8B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CBA1-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        endif
        retf
        if      FW_VERSION >= 112
L_2CF6A:
        KEY_CURSOR      (APP3_BASE+L_2CBC4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2D55D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CBA1-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
L_2D55D:
        else
L_2CC8B:
        endif
        call    fn_2D295
        mov     word ptr [A3_W_01884], cb_2D422-APP3_CSBASE
        mov     cx, ds
        mov     si, 188ah
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_CURSOR      (APP3_BASE+L_2CBC4-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_2CBA1-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
L_2CCB8:
        call    fn_2D295
        mov     word ptr [A3_W_01884], cb_2D446-APP3_CSBASE
        call    fn_280CB
        jne     L_2CFD2
        mov     ax, A3_W_06CE6
        mov     bx, A3_W_06C97
        mov     bp, A3_W_06CE6
        mov     dx, A3_W_06C97
        mov     di, A3_W_06C97
        mov     si, A3_W_06B31
        mov     cl, 3eh
        mov     ch, 2bh
        call    fn_2B21A
        retf
L_2CFD2:
        mov     word ptr [A3_W_01884], cb_2D43D-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_2CBC4-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        call    fn_2B2E2
        retf
L_2CCFC:
        int     85h
        push    ax
        push    dx
        call    fn_2D5E3
        int     0d6h
        pop     dx
        pop     ax
        mov     bl, 0ah
        int     87h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
fn_2D5E3:
        call    fn_2B32D
        call    fn_2B36F
        mov     bl, byte ptr [A3_B_01577]
        mov     bh, byte ptr [A3_B_01578]
        push    bx
        call    fn_280CB
        pop     bx
        je      br_2D609
        mov     bl, 0
        mov     bh, 7fh
        cmp     byte ptr [A3_B_01579], 41h
        je      br_2D609
        mov     bl, byte ptr [A3_B_0157A]
        mov     bh, bl
br_2D609:
        cmp     byte ptr [1888h], 0
        je      br_2D61B
        cmp     byte ptr [A3_B_01889], 0
        je      br_2D61B
        mov     bh, 80h
        mov     bl, 80h
br_2D61B:
        mov     byte ptr [188bh], bl
        mov     byte ptr [188ch], bh
        int     84h
        push    si
        push    es
        int     83h
        mov     bp, es
        pop     dx
        pop     di
        call    fn_2D633
        int     0bfh
        ret
fn_2D633:
        mov     es, bp
        mov     al, byte ptr es:[si+4]
        cmp     al, 0ffh
        jne     br_2D63E
        ret
br_2D63E:
        mov     bx, word ptr es:[si]
        mov     cx, word ptr es:[si+2]
        and     cx, 3f0fh
        sub     bx, word ptr [A3_W_0156F]
        sbb     cl, byte ptr [A3_W_01571]
        jb      br_2D654
        ret
br_2D654:
        and     ch, 3fh
        call    fn_2D65C
        jmp     fn_2D633
fn_2D65C:
        cmp     word ptr [A3_W_01886], 0
        je      br_2D687
        cmp     word ptr [A3_W_01886], 0ffh
        jne     br_2D67F
        push    es
        mov     es, word ptr [A3_W_00F10]
        mov     bl, ch
        mov     bh, 0
        test    byte ptr es:[bx+680h], 2
        pop     es
        je      br_2D687
        jmp     br_2D6B4
br_2D67F:
        inc     ch
        cmp     ch, byte ptr [A3_W_01886]
        jne     br_2D6B4
br_2D687:
        cmp     byte ptr [1888h], 1
        jb      br_2D69E
        je      br_2D697
        call    fn_2D6B8
        jb      br_2D6B0
        jmp     br_2D6B4
br_2D697:
        call    fn_2D6B8
        jae     br_2D6B0
        jmp     br_2D6B4
br_2D69E:
        cmp     al, 80h
        jae     br_2D6B0
        cmp     al, byte ptr [188bh]
        jb      br_2D6B4
        cmp     al, byte ptr [188ch]
        ja      br_2D6B4
        jmp     br_2D6B0
br_2D6B0:
        call    fn_2B444
        ret
br_2D6B4:
        call    fn_2B3FE
        ret
fn_2D6B8:
        mov     ah, byte ptr [A3_B_01889]
        cmp     al, 80h
        jb      br_2D70C
        cmp     al, 0f0h
        je      br_2D701
        cmp     al, 0e0h
        je      br_2D6DB
        cmp     al, 0b0h
        je      br_2D6F0
        cmp     al, 0c0h
        je      br_2D6E2
        cmp     al, 0d0h
        je      br_2D6E9
        cmp     ah, 5
        je      loop_2D708
        jmp     loop_2D70A
br_2D6DB:
        cmp     ah, 1
        je      loop_2D708
        jmp     loop_2D70A
br_2D6E2:
        cmp     ah, 3
        je      loop_2D708
        jmp     loop_2D70A
br_2D6E9:
        cmp     ah, 4
        je      loop_2D708
        jmp     loop_2D70A
br_2D6F0:
        cmp     ah, 2
        jne     loop_2D70A
        mov     ah, byte ptr es:[si+5]
        cmp     ah, byte ptr [188ah]
        je      loop_2D708
        jmp     loop_2D70A
br_2D701:
        cmp     ah, 6
        je      loop_2D708
        jmp     loop_2D70A
loop_2D708:
        stc
        ret
loop_2D70A:
        clc
        ret
br_2D70C:
        cmp     ah, 0
        jne     loop_2D70A
        mov     ah, byte ptr es:[si+4]
        and     ah, 7fh
        cmp     ah, byte ptr [188bh]
        jb      loop_2D70A
        cmp     ah, byte ptr [188ch]
        ja      loop_2D70A
        jmp     loop_2D708
L_2CE54:
        call    fn_280BD
        je      br_2D72C
        retf
br_2D72C:
        call    fn_2823E
        mov     al, 1
        mov     byte ptr [A2_B_00F2F], al
        int     0adh
        mov     word ptr [A3_W_01954], 0ffffh
        mov     word ptr [A3_W_01956], 0ffffh
        mov     byte ptr [A3_B_01966], 0
        call    fn_2F3CE
        push    cs
        call    isr_2D74F
        retf
isr_2D74F:
        mov     al, 0
        int     79h
        int     0a4h
        KEY_SOFT        (APP3_BASE+L_2F07F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2EAA6-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2EC4B-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E7FC-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2F3DF-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2ECB5-APP3_SEG*16), APP3_SEG
        KEY_SHIFTED     06h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        if      FW_VERSION >= 111
        KEY_SHIFTED     0ch, (APP3_BASE+L_2A32F-APP3_SEG*16), APP3_SEG
        else
        KEY_SHIFTED     0ch, (APP3_BASE+L_29A42-APP3_SEG*16), APP3_SEG
        endif
        KEY_SHIFTED     0dh, EP_L_310BA_OFF, APP3_SEG
        KEY_DOWN        0dh, EP_L_26957_OFF, APP3_SEG
        KEY_DOWN        19h, EP_FAR_2DDC4_OFF, EP_FAR_2DDC4_SEG
        KEY_DOWN        1ah, EP_FAR_2DD8C_OFF, APP3_SEG
        mov     cx, ds
        mov     si, 21fah
        mov     bl, 0
        mov     bh, 0
        mov     dx, 6
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        if      FW_VERSION >= 112
        KEY_DOWN        20h, (APP3_BASE+far_2CF71-APP3_SEG*16), APP3_SEG
        KEY_DOWN        26h, EP_FAR_2D7EF_OFF, APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_2DC26-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, EP_L_2D7FA_OFF, APP3_SEG
        KEY_DOWN        16h, EP_L_2D9EE_OFF, EP_L_2D9EE_SEG
        KEY_TRANSPORT   EP_L_2D811_OFF, EP_L_2D811_SEG, (APP3_BASE+L_2CF49-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CF53-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CF5D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CF67-APP3_SEG*16), APP3_SEG
        db      0cbh
far_2D7EF:
        call    fn_2FD0B
        else
        KEY_DOWN        20h, EP_FAR_2CF71_OFF, APP3_SEG
        KEY_DOWN        26h, (APP3_BASE+far_2D7EF-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 110
        KEY_DOWN        0fh, EP_L_2D354_OFF, APP3_SEG
        else
        KEY_DOWN        0fh, (APP3_BASE+L_2DC26-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        22h, (APP3_BASE+L_2D7FA-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, (APP3_BASE+L_2D9EE-APP3_SEG*16), APP3_SEG
        KEY_TRANSPORT   (APP3_BASE+L_2D811-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CF49-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CF53-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CF5D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2CF67-APP3_SEG*16), APP3_SEG
        db      0cbh
far_2D7EF:
        db      0e8h
        sbb     word ptr [di], sp
        endif
        int     0d6h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_2D7FA:
        cmp     cl, 0
        jne     br_2D800
        retf
br_2D800:
        call    fn_302FE
        cmp     byte ptr [A3_B_01914], 2
        jae     L_2D80B
        retf
L_2D80B:
        mov     byte ptr [A3_B_01914], 0
        retf
L_2D811:
        push    cs
        call    far_2D7EF
        callf   EP_X_2FE09_SEG:EP_X_2FE09_OFF
        retf
L_2CF49:
        push    cs
        call    far_2D7EF
        callf   EP_L_2FE15_SEG:EP_L_2FE15_OFF
        retf
L_2CF53:
        push    cs
        call    far_2D7EF
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_2CF5D:
        push    cs
        call    far_2D7EF
        callf   EP_X_2FE29_SEG:EP_X_2FE29_OFF
        retf
L_2CF67:
        push    cs
        call    far_2D7EF
        callf   EP_L_2FE35_SEG:EP_L_2FE35_OFF
        retf
far_2CF71:
        DISP_CLEAR
        DISP_HDOTS      00h, 09h, 0f8h
        if      FW_VERSION <> 114
        db      0e8h, 12h, 00h
        call    fn_2D93F
        call    fn_26B08
        call    fn_2D8BF
        else
        db      0e8h, 12h, 00h, 0e8h, 0edh, 00h, 0e8h
        db      0b3h
        endif
        if      FW_VERSION = 114
        xchg    dx, ax
        call    fn_2D8BF
        endif
        push    cs
        call    far_2E5AA
        call    word ptr [A3_W_STEP_CURSOR_FN]
        retf
        DISP_SOFTKEY    01h, DISP_SK_BOX,    "TC"
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "COPY"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "DELETE"
        db      80h, 3eh
        db      66h, 19h, 00h, 75h, 22h
        DISP_SOFTKEY    04h, DISP_SK_BOX,    "INSERT"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "PASTE"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "PLAY"
        db      0c3h
        DISP_SOFTKEY    04h, DISP_SK_BOX,    "EDIT"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "CANCEL"
        db      0c3h
fn_2D8BF:
        int     85h
        xchg    ax, word ptr [A3_W_01954]
        xchg    dx, word ptr [A3_W_01956]
        sub     ax, word ptr [A3_W_01954]
        sbb     dx, word ptr [A3_W_01956]
        or      ax, dx
        je      br_2D8ED
        mov     word ptr [A3_W_0193C], 0
        mov     word ptr [A3_W_0193E], 0
        mov     word ptr [A3_W_01958], 0
        mov     word ptr [A3_W_0195A], 0
br_2D8ED:
        DISP_ERASE      00h, 0ah, 0f8h, 24h
        call    fn_2E410
        les     di, [A3_W_01928]
        mov     cl, 0
        mov     ch, 0ch
        call    fn_2DE21
        les     di, [A3_W_0192C]
        mov     cl, 0
        mov     ch, 15h
        call    fn_2DE21
        les     di, [A3_W_01930]
        mov     cl, 0
        mov     ch, 1eh
        call    fn_2DE21
        les     di, [A3_W_01934]
        mov     cl, 0
        mov     ch, 27h
        call    fn_2DE21
        mov     si, word ptr [A3_W_0193E]
        mov     cx, si
        mov     al, 9
        mul     cl
        add     al, 0ch
        mov     byte ptr [A3_B_01910], al
        shl     si, 2
        add     si, 1928h
        mov     di, word ptr [si]
        mov     es, word ptr [si+2]
        ret
fn_2D93F:
        DISP_ERASE      00h, 00h, 0f8h, 09h
        DISP_TEXT       01h, 01h, "View:"
        mov     dx, ds
        DISP_TEXT_IDX   1fh, 01h, 01914h, 019f3h
        cmp     byte ptr [A3_B_01914], 1
        jne     br_2D991
        call    fn_280CB
        jne     br_2D983
        mov     al, byte ptr [A3_B_01577]
        DISP_NOTE       3dh, 01h
        DISP_TEXT       6dh, 01h, "-"
        mov     al, byte ptr [A3_B_01578]
        DISP_NOTE       73h, 01h
        ret
br_2D983:
        mov     ah, byte ptr [A3_B_01579]
        mov     al, byte ptr [A3_B_0157A]
        DISP_NOTE_CHAN  42h, 01h
        ret
br_2D991:
        cmp     byte ptr [A3_B_01914], 3
        jne     br_2D9B6
        mov     al, byte ptr [A3_B_01915]
        sub     ah, ah
        cmp     al, 0
        je      br_2D9A9
        dec     al
        DISP_NUM        3dh, 01h, 03h
br_2D9A9:
        mov     dx, ds
        DISP_TEXT_IDX   55h, 01h, 01915h, 01a54h
        db      0c3h
br_2D9B6:
        ret
stepcur_2D9B7:
        DISP_CURSOR     1fh, 1, 86h
        ret
stepcur_2D9C0:
        DISP_CURSOR     42h, 1, 25h
        ret
stepcur_2D9C9:
        DISP_CURSOR     3dh, 1, 68h
        ret
stepcur_2D9D2:
        DISP_CURSOR     0c0h, 1, 13h
        ret
stepcur_2D9DB:
        DISP_CURSOR     0d8h, 1, 0dh
        ret
stepcur_2D9E4:
        DISP_CURSOR     0eah, 1, 0dh
        ret
stepcur_2D9ED:
        ret
L_2D9EE:
        int     0bbh
        jae     br_2D9F3
        retf
br_2D9F3:
        int     0a4h
        KEY_DOWN        26h, EP_FAR_2D7EF_OFF, APP3_SEG
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        KEY_DOWN        20h, EP_L_2D207_OFF, APP3_SEG
        else
        KEY_DOWN        20h, (APP3_BASE+L_2DAD9-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        14h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_DOWN        16h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        callf   [A3_FP_0191A]
        retf
L_2DA1A:
        mov     word ptr [A3_FP_0191A], L_2DA1A-APP3_CSBASE
        mov     word ptr [A3_W_0191E], cb_2DB62-APP3_CSBASE
        mov     cx, ds
        mov     si, 7beh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, intcb_2808C-APP3_CSBASE
        int     7eh
        KEY_DOWN        19h, 0000h, 0000h
        KEY_DOWN        18h, 0000h, 0000h
        KEY_DOWN        17h, 0000h, 0000h
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_DOWN        1ah, EP_L_2DA58_OFF, APP3_SEG
        db      0cbh
cb_2DA58:
        mov     word ptr [A3_FP_0191A], cb_2DA58-APP3_CSBASE
        db      0c7h, 06h, 1eh, 19h, 0bbh, 73h
        else
        KEY_DOWN        1ah, (APP3_BASE+cb_2DA58-APP3_SEG*16), APP3_SEG
        db      0cbh
cb_2DA58:
        mov     word ptr [A3_FP_0191A], cb_2DA58-APP3_CSBASE
        mov     word ptr [A3_W_0191E], cb_2D39B_112-APP3_CSBASE
        endif
        else
        if      FW_VERSION >= 110
        KEY_DOWN        1ah, EP_L_2D186_OFF, APP3_SEG
        else
        KEY_DOWN        1ah, (APP3_BASE+cb_2DA58-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
cb_2DA58:
        mov     word ptr [A3_FP_0191A], cb_2DA58-APP3_CSBASE
        mov     word ptr [A3_W_0191E], cb_2D39B_112-APP3_CSBASE
        endif
        mov     cx, ds
        mov     si, 7bfh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, intcb_2CC64_107-APP3_CSBASE
        int     7eh
        KEY_DOWN        19h, EP_L_2DA1A_OFF, APP3_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        KEY_DOWN        17h, 0000h, 0000h
        push    cs
        call    far_2DA92
        retf
far_2DA92:
intcb_2CC64_107:
        mov     al, byte ptr [A3_B_007BF]
        or      al, al
        jne     L_2D4C2
        KEY_DOWN        18h, 0000h, 0000h
        db      0cbh
L_2D4C2:
        if      FW_VERSION >= 112
        KEY_DOWN        18h, (APP3_BASE+L_2DAAB-APP3_SEG*16), APP3_SEG
        else
        if      FW_VERSION >= 110
        KEY_DOWN        18h, EP_L_2D1D9_OFF, APP3_SEG
        else
        KEY_DOWN        18h, (APP3_BASE+L_2DAAB-APP3_SEG*16), APP3_SEG
        endif
        endif
        db      0cbh
L_2DAAB:
        mov     word ptr [A3_FP_0191A], L_2DAAB-APP3_CSBASE
        mov     word ptr [A3_W_0191E], cb_2DB74-APP3_CSBASE
        mov     cx, ds
        mov     si, 7c0h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 64h
        mov     di, intcb_2808C-APP3_CSBASE
        int     7eh
        KEY_DOWN        18h, 0000h, 0000h
        if      FW_VERSION >= 114
        KEY_DOWN        17h, EP_L_2DA58_OFF, APP3_SEG
        retf
        else
        KEY_DOWN        17h, EP_APP3_72A8_OFF, APP3_SEG
        db      0cbh
        endif
L_2DAD9:
        DISP_WIN_NARROW "Step Edit Options"
        DISP_TEXT       25h, 10h, "Auto step increment:"
        DISP_TEXT       25h, 20h, "Duration of recorded notes:"
        DISP_SOFTKEY    05h, DISP_SK_FILL,   "CLOSE"
        db      0a0h, 0beh, 07h
        mov     cl, 9dh
        mov     ch, 10h
        call    fn_26E05
        mov     dx, ds
        DISP_TEXT_IDX   31h, 28h, 007bfh, 02061h
        db      80h, 3eh, 0bfh
        pop     es
        add     byte ptr [si+0bh], dh
        mov     al, byte ptr [A3_B_007C0]
        sub     ah, ah
        DISP_NUM        67h, 28h, 03h
        db      0ffh
        push    ss
        push    ds
        db      19h, 0cbh
cb_2DB62:
        DISP_CURSOR     9dh, 10h, 13h
        ret
cb_2D39B_112:
        DISP_CURSOR     31h, 28h, 37h
        ret
cb_2DB74:
        DISP_CURSOR     67h, 28h, 19h
        ret
loop_2DB7D:
        int     86h
        mov     word ptr [A3_W_00F2A], ax
        mov     byte ptr [A3_B_00F2C], dl
        mov     byte ptr [A3_B_00F2D], dh
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2D9D2-APP3_CSBASE
        KEY_DOWN        20h, (APP3_BASE+L_2D429-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+FAR_2DCB9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2D2FA-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+ISR_2D74F-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 0f2ah
        mov     bl, 1
        mov     bh, 0
        mov     dx, 3e7h
        mov     di, intcb_27231-APP3_CSBASE
        int     7eh
        KEY_DOWN        0fh, 0000h, 0000h
        KEY_DOWN        12h, 0000h, 0000h
        db      0cbh
L_2D2FA:
        call    fn_280BD
        je      br_2DBD2
        retf
br_2DBD2:
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2D9DB-APP3_CSBASE
        mov     cx, ds
        mov     si, 0f2ch
        mov     bl, 1
        mov     bh, 0
        mov     dx, 20h
        mov     di, intcb_27291-APP3_CSBASE
        int     7eh
        if      FW_VERSION >= 112
        KEY_CURSOR      EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, (APP3_BASE+L_2DBFC-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        retf
L_2DBFC:
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2D9E4-APP3_CSBASE
        FIELD_ENTRY     ds, 0f2dh, 0, 0, 63h, intcb_272F9-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_2D2FA-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+ISR_2D74F-APP3_SEG*16), APP3_SEG
        retf
L_2DC26:
        mov     ax, word ptr [A3_FP_STEP_EVENT]
        else
        if      FW_VERSION >= 110
        KEY_CURSOR      EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, EP_L_2D32A_OFF, APP3_SEG, 0000h, 0000h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        else
        KEY_CURSOR      EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, (APP3_BASE+L_2DBFC-APP3_SEG*16), APP3_SEG, 0000h, 0000h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        endif
        db      0cbh
L_2DBFC:
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2D9E4-APP3_CSBASE
        mov     cx, ds
        mov     si, 0f2dh
        if      FW_VERSION >= 111
        mov     bl, 0
        else
        mov     bl, 1
        endif
        mov     bh, 0
        mov     dx, 63h
        mov     di, intcb_272F9-APP3_CSBASE
        int     7eh
        if      FW_VERSION >= 110
        KEY_CURSOR      EP_L_2D2FA_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, EP_L_2D16F_OFF, APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+L_2D2FA-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        endif
        db      0cbh
L_2DC26:
        db      0a1h
        and     byte ptr [bx+di], bl
        endif
        or      ax, word ptr [A3_W_01922]
        jne     br_2DC30
        retf
br_2DC30:
        mov     byte ptr [A3_B_01966], 1
        mov     ax, word ptr [A3_W_0193C]
        add     ax, word ptr [A3_W_0193E]
        mov     word ptr [A3_W_0195E], ax
        mov     word ptr [A3_W_01960], ax
        KEY_SHIFTED     19h, EP_L_2DC5B_OFF, APP3_SEG
        KEY_SHIFTED     1ah, EP_L_2DC7A_OFF, APP3_SEG
        KEY_UP          0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        db      0cbh
L_2DC5B:
        cmp     word ptr [A3_W_0193E], 0
        je      br_2DC6A
        dec     word ptr [A3_W_0193E]
        call    fn_2DCAE
        retf
br_2DC6A:
        cmp     word ptr [A3_W_0193C], 0
        jne     br_2DC72
        retf
br_2DC72:
        dec     word ptr [A3_W_0193C]
        call    fn_2DCAE
        retf
L_2DC7A:
        cmp     word ptr [A3_W_0193E], 3
        je      br_2DC9C
        mov     ax, word ptr [A3_W_0193E]
        shl     ax, 2
        add     ax, 1928h
        mov     si, ax
        mov     ax, word ptr [si]
        or      ax, word ptr [si+2]
        jne     br_2DC94
        retf
br_2DC94:
        inc     word ptr [A3_W_0193E]
        call    fn_2DCAE
        retf
br_2DC9C:
        mov     ax, word ptr [A3_W_01934]
        or      ax, word ptr [A3_W_01936]
        jne     br_2DCA6
        retf
br_2DCA6:
        inc     word ptr [A3_W_0193C]
        call    fn_2DCAE
        retf
fn_2DCAE:
        mov     ax, word ptr [A3_W_0193C]
        add     ax, word ptr [A3_W_0193E]
        mov     word ptr [A3_W_01960], ax
        ret
far_2DCB9:
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2D9B7-APP3_CSBASE
        FIELD_WHEEL     ds, 1914h, 0, 0, 7, field_cb_none-APP3_CSBASE
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_2D437-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+ISR_2D74F-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2D429-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, 0000h, 0000h
        KEY_DOWN        12h, 0000h, 0000h
        db      0cbh
L_2D429:
        call    fn_2D93F
        call    fn_26B08
        call    fn_2D8BF
        call    word ptr [A3_W_STEP_CURSOR_FN]
        retf
L_2D437:
        cmp     byte ptr [A3_B_01914], 1
        je      br_2DD1A
        cmp     byte ptr [A3_B_01914], 3
        je      br_2DD62
        jmp     loop_2DB7D
br_2DD1A:
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2D9ED-APP3_CSBASE
        call    fn_280CB
        jne     br_2DD46
        mov     ax, A3_W_07595
        mov     bx, A3_W_06F9F
        mov     bp, A3_W_07595
        mov     dx, A3_W_06F9F
        mov     di, loop_2DB7D-APP3_CSBASE
        mov     si, A3_W_0754B
        mov     cl, 3dh
        mov     ch, 1
        call    fn_2B21A
        mov     word ptr [A3_W_01561], A3_W_07509
        retf
d_a3_w_07595:
        db      0cbh
br_2DD46:
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2D9C0-APP3_CSBASE
        KEY_CURSOR      EP_FAR_2DCB9_OFF, EP_FAR_2DCB9_SEG, EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, 0000h, 0000h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        call    fn_2B2E2
        retf
br_2DD62:
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2D9C9-APP3_CSBASE
        FIELD_WHEEL     ds, 1915h, 0, 0, 80h, field_cb_none-APP3_CSBASE
        KEY_CURSOR      EP_FAR_2DCB9_OFF, EP_FAR_2DCB9_SEG, EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, 0000h, 0000h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        retf
far_2DD8C:
        cmp     word ptr [A3_W_0193E], 3
        je      br_2DDB0
        mov     ax, word ptr [A3_W_0193E]
        shl     ax, 2
        add     ax, 1928h
        mov     si, ax
        mov     ax, word ptr [si]
        or      ax, word ptr [si+2]
        stc
        jne     br_2DDA7
        retf
br_2DDA7:
        inc     word ptr [A3_W_0193E]
        call    fn_2DDEC
        clc
        retf
br_2DDB0:
        mov     ax, word ptr [A3_W_01934]
        or      ax, word ptr [A3_W_01936]
        stc
        jne     br_2DDBB
        retf
br_2DDBB:
        inc     word ptr [A3_W_0193C]
        call    fn_2DDEC
        clc
        retf
far_2DDC4:
        cmp     word ptr [A3_W_0193E], 0
        je      br_2DDD3
        dec     word ptr [A3_W_0193E]
        call    fn_2DDEC
        retf
br_2DDD3:
        cmp     word ptr [A3_W_0193C], 0
        je      br_2DDE2
        dec     word ptr [A3_W_0193C]
        call    fn_2DDEC
        retf
br_2DDE2:
        push    cs
        call    far_2DCB9
        mov     byte ptr [A3_B_01966], 0
        retf
fn_2DDEC:
        cmp     byte ptr [A3_B_01966], 0
        jne     br_2DDF4
        ret
br_2DDF4:
        mov     ax, word ptr [A3_W_0193C]
        add     ax, word ptr [A3_W_0193E]
        call    fn_2DE07
        jae     br_2DE01
        ret
br_2DE01:
        mov     byte ptr [A3_B_01966], 0
        ret
fn_2DE07:
        mov     bx, word ptr [A3_W_0195E]
        mov     dx, word ptr [A3_W_01960]
        cmp     bx, dx
        jbe     br_2DE15
        xchg    bx, dx
br_2DE15:
        cmp     ax, bx
        jb      br_2DE1F
        cmp     ax, dx
        ja      br_2DE1F
        stc
        ret
br_2DE1F:
        clc
        ret
fn_2DE21:
        push    cx
        mov     al, 0f8h
        mov     ah, 9
        dec     cl
        dec     ch
        mov     bl, 14h
        int     90h
        pop     cx
        mov     ax, es
        or      ax, di
        jne     br_2DE36
        ret
br_2DE36:
        push    cx
        call    fn_2DE64
        pop     cx
        cmp     byte ptr [A3_B_01966], 0
        jne     br_2DE43
        ret
br_2DE43:
        mov     al, ch
        sub     al, 0ch
        mov     ah, 0
        mov     bl, 9
        div     bl
        mov     ah, 0
        add     ax, word ptr [A3_W_0193C]
        call    fn_2DE07
        jb      br_2DE59
        ret
br_2DE59:
        dec     ch
        mov     ah, 9
        mov     al, 0c2h
        mov     bl, 15h
        int     90h
        ret
fn_2DE64:
        mov     al, byte ptr es:[di+4]
        cmp     al, 80h
        jae     br_2DE6E
        jmp     br_2DE9B
br_2DE6E:
        cmp     al, 0f0h
        jne     br_2DE75
        jmp     br_2E2AB
br_2DE75:
        cmp     al, 0a0h
        jne     br_2DE7C
        jmp     br_2E0D3
br_2DE7C:
        cmp     al, 0b0h
        jne     br_2DE83
        jmp     br_2E133
br_2DE83:
        cmp     al, 0c0h
        jne     br_2DE8A
        jmp     br_2E1A5
br_2DE8A:
        cmp     al, 0d0h
        jne     br_2DE91
        jmp     br_2E1EA
br_2DE91:
        cmp     al, 0e0h
        jne     L_2D5C6
        jmp     br_2E230
L_2D5C6:
        jmp     br_2E3D0
br_2DE9B:
        call    fn_280CB
        je      br_2DEA3
        jmp     br_2DF3F
br_2DEA3:
        push    cx
        push    cx
        mov     dx, cs
        mov     si, str_2DEEE-APP3_CSBASE
        mov     ah, 1dh
        mov     bl, 5
        int     90h
        mov     al, byte ptr es:[di+4]
        add     cl, 2ah
        mov     bl, 1eh
        mov     bh, 1
        int     90h
        mov     al, byte ptr es:[di+3]
        mov     ah, byte ptr es:[di+2]
        shr     ah, 4
        shl     ax, 2
        mov     al, byte ptr es:[di+5]
        pop     cx
        add     cl, 6ch
        mov     bh, 4
        mov     bl, 8
        int     90h
        mov     al, byte ptr es:[di+6]
        and     ax, 7fh
        pop     cx
        add     cl, 9ch
        mov     bh, 3
        mov     bl, 8
        int     90h
        call    fn_2DF2C
        ret
str_2DEEE:
        db      ">Note:          D:      V:   "
cb_2DF0B:
        DISP_CURSOR     2ah, byte ptr [A3_B_01910], 13h
        ret
stepcur_2DF16:
        DISP_CURSOR     6ch, byte ptr [A3_B_01910], 19h
        ret
stepcur_2DF21:
        DISP_CURSOR     9ch, byte ptr [A3_B_01910], 13h
        ret
fn_2DF2C:
        mov     ah, 64h
        mul     ah
        mov     bl, 7fh
        div     bl
        shr     al, 1
        mov     cl, 0c6h
        mov     ah, 5
        mov     bl, 13h
        int     90h
        ret
br_2DF3F:
        mov     dx, cs
        mov     si, str_2DFC1-APP3_CSBASE
        mov     ah, 1dh
        mov     bl, 5
        int     90h
        push    es
        push    di
        push    cx
        mov     al, byte ptr es:[di+4]
        int     7bh
        pop     cx
        pop     di
        pop     es
        add     cl, 18h
        mov     bl, 1eh
        mov     bh, 2
        int     90h
        mov     al, byte ptr es:[di+6]
        shl     ax, 1
        mov     al, byte ptr es:[di+7]
        shl     ax, 1
        and     ah, 3
        push    ax
        mov     al, 3
        mul     ah
        add     ax, A3_TBL_02136
        mov     si, ax
        mov     ah, 3
        mov     dx, ds
        add     cl, 2ah
        mov     bl, 5
        int     90h
        pop     ax
        mov     al, byte ptr es:[di+7]
        and     al, 7fh
        add     cl, 18h
        push    cx
        call    step_draw_variation_value
        pop     cx
        mov     al, byte ptr es:[di+3]
        mov     ah, byte ptr es:[di+2]
        shr     ah, 4
        shl     ax, 2
        mov     al, byte ptr es:[di+5]
        add     cl, 2ah
        mov     bh, 4
        mov     bl, 8
        int     90h
        mov     al, byte ptr es:[di+6]
        and     ax, 7fh
        add     cl, 2ah
        mov     bh, 3
        mov     bl, 8
        int     90h
        call    fn_2DF2C
        ret
str_2DFC1:
        db      ">N:   /OFF    :     D:     V:"
stepcur_2DFDE:
        mov     cl, 18h
        mov     ch, byte ptr [A3_B_01910]
        mov     al, 25h
        int     0b0h
        ret
stepcur_2DFE9:
        DISP_CURSOR     42h, byte ptr [A3_B_01910], 13h
        ret
stepcur_2DFF4:
        DISP_CURSOR     5eh, byte ptr [A3_B_01910], 13h
        ret
stepcur_2DFFF:
        DISP_CURSOR     5ah, byte ptr [A3_B_01910], 19h
        ret
stepcur_2E00A:
        DISP_CURSOR     84h, byte ptr [A3_B_01910], 19h
        ret
stepcur_2E015:
        DISP_CURSOR     0aeh, byte ptr [A3_B_01910], 13h
        ret
step_draw_variation_value:
        cmp     ah, 0
        je      br_2E034
        cmp     ah, 2
        jne     br_2E02D
        jmp     br_2E0B2
br_2E02D:
        jae     L_2DA52
        jmp     br_2E0B2
L_2DA52:
        jmp     br_2E077
br_2E034:
        mov     ah, 0
        cmp     al, 7ch
        jb      br_2E03C
        mov     al, 7ch
br_2E03C:
        cmp     al, 4
        jae     br_2E042
        mov     al, 4
br_2E042:
        shl     al, 1
        sub     al, 80h
        jb      br_2E062
        push    ax
        add     cl, 6
        mov     bh, 3
        mov     bl, 8
        int     90h
        sub     cl, 6
        pop     ax
        or      ax, ax
        jne     br_2E05B
        ret
br_2E05B:
        mov     al, 2bh
        mov     bl, 4
        int     90h
        ret
br_2E062:
        neg     al
        add     cl, 6
        mov     bh, 3
        mov     bl, 8
        int     90h
        sub     cl, 6
        mov     al, 2dh
        mov     bl, 4
        int     90h
        ret
br_2E077:
        mov     ah, 0
        cmp     al, 64h
        jb      br_2E07F
        mov     al, 64h
br_2E07F:
        sub     al, 32h
        jb      br_2E09D
        push    ax
        add     cl, 6
        mov     bh, 2
        mov     bl, 8
        int     90h
        sub     cl, 6
        pop     ax
        or      ax, ax
        jne     br_2E096
        ret
br_2E096:
        mov     al, 2bh
        mov     bl, 4
        int     90h
        ret
br_2E09D:
        neg     al
        add     cl, 6
        mov     bh, 2
        mov     bl, 8
        int     90h
        sub     cl, 6
        mov     al, 2dh
        mov     bl, 4
        int     90h
        ret
br_2E0B2:
        cmp     al, 64h
        jb      br_2E0B8
        mov     al, 64h
br_2E0B8:
        mov     ah, 0
        add     cl, 4
        mov     bh, 3
        mov     bl, 8
        int     90h
        ret
        mov     si, str_2E0D0-APP3_CSBASE
        mov     dx, cs
        mov     ah, 3
        mov     bl, 5
        int     90h
        ret
str_2E0D0:
        db      "OFF"
br_2E0D3:
        mov     dx, cs
        mov     si, str_2E100-APP3_CSBASE
        mov     ah, 1dh
        mov     bl, 5
        int     90h
        push    cx
        mov     al, byte ptr es:[di+5]
        add     cl, 66h
        mov     bl, 1eh
        mov     bh, 1
        int     90h
        pop     cx
        add     cl, 0aeh
        mov     al, byte ptr es:[di+6]
        mov     ah, 0
        mov     bh, 3
        mov     bl, 8
        int     90h
        call    fn_2DF2C
        ret
str_2E100:
        db      ">POLY PRESSURE :            :"
stepcur_2E11D:
        mov     cl, 66h
        mov     ch, byte ptr [A3_B_01910]
        mov     al, 13h
        int     0b0h
        ret
stepcur_2E128:
        DISP_CURSOR     0aeh, byte ptr [A3_B_01910], 13h
        ret
br_2E133:
        mov     dx, cs
        mov     si, str_2E172-APP3_CSBASE
        mov     ah, 1dh
        mov     bl, 5
        int     90h
        push    cx
        mov     al, byte ptr es:[di+5]
        mov     si, 1a54h
        mov     ah, byte ptr [si]
        mov     bl, ah
        mov     bh, 0
        inc     si
        add     si, bx
        push    ax
        mul     ah
        add     si, ax
        mov     dx, ds
        pop     ax
        add     cl, 60h
        mov     bl, 5
        int     90h
        pop     cx
        add     cl, 0aeh
        mov     al, byte ptr es:[di+6]
        mov     ah, 0
        mov     bh, 3
        mov     bl, 8
        int     90h
        call    fn_2DF2C
        ret
str_2E172:
        db      ">CONTROL CHANGE:            :"
stepcur_2E18F:
        DISP_CURSOR     60h, byte ptr [A3_B_01910], 49h
        ret
stepcur_2E19A:
        DISP_CURSOR     0aeh, byte ptr [A3_B_01910], 13h
        ret
br_2E1A5:
        mov     dx, cs
        mov     si, str_2E1C2-APP3_CSBASE
        mov     ah, 1dh
        mov     bl, 5
        int     90h
        mov     al, byte ptr es:[di+5]
        inc     al
        mov     ah, 0
        add     cl, 60h
        mov     bh, 3
        mov     bl, 8
        int     90h
        ret
str_2E1C2:
        db      ">PROGRAM CHANGE:            :"
stepcur_2E1DF:
        DISP_CURSOR     60h, byte ptr [A3_B_01910], 13h
        ret
br_2E1EA:
        mov     dx, cs
        mov     si, str_2E208-APP3_CSBASE
        mov     ah, 1dh
        mov     bl, 5
        int     90h
        mov     al, byte ptr es:[di+5]
        mov     ah, 0
        add     cl, 0aeh
        mov     bh, 3
        mov     bl, 8
        int     90h
        call    fn_2DF2C
        ret
str_2E208:
        db      ">CH PRESSURE   :            :"
stepcur_2E225:
        mov     cl, 0aeh
        mov     ch, byte ptr [A3_B_01910]
        mov     al, 13h
        int     0b0h
        ret
br_2E230:
        mov     dx, cs
        mov     si, str_2E283-APP3_CSBASE
        mov     ah, 1dh
        mov     bl, 5
        int     90h
        mov     ax, word ptr es:[di+5]
        shl     al, 1
        shr     ax, 1
        sub     ax, 2000h
        je      br_2E25F
        jb      br_2E26C
        push    ax
        add     cl, 60h
        mov     al, 2bh
        mov     bl, 4
        int     90h
        pop     ax
        add     cl, 6
        mov     bh, 4
        mov     bl, 8
        int     90h
        ret
br_2E25F:
        add     cl, 66h
        mov     ax, 0
        mov     bh, 4
        mov     bl, 8
        int     90h
        ret
br_2E26C:
        push    ax
        add     cl, 60h
        mov     al, 2dh
        mov     bl, 4
        int     90h
        pop     ax
        neg     ax
        add     cl, 6
        mov     bh, 4
        mov     bl, 8
        int     90h
        ret
str_2E283:
        db      ">BEND          :            :"
stepcur_2E2A0:
        DISP_CURSOR     60h, byte ptr [A3_B_01910], 1fh
        ret
br_2E2AB:
        mov     bp, word ptr [A3_W_01958]
        mov     ax, es
        mov     bx, di
        shr     bx, 4
        add     ax, bx
        mov     es, ax
        and     di, 8
        mov     ax, word ptr es:[di+9]
        cmp     ax, 47h
        jne     br_2E2D4
        mov     ax, word ptr es:[di+0bh]
        cmp     ax, 4544h
        jne     br_2E2D4
        call    fn_280CB
        jne     br_2E332
br_2E2D4:
        mov     dx, cs
        mov     si, str_2E313-APP3_CSBASE
        mov     ah, 0bh
        mov     bl, 5
        int     90h
        add     cl, 42h
        mov     al, 0b4h
        mov     ah, 7
        mov     bl, 14h
        int     90h
        mov     dx, word ptr es:[di+5]
        sub     dx, bp
        add     di, bp
        add     di, 8
        mov     bp, 0ch
loop_2E2F8:
        mov     al, byte ptr es:[di]
        mov     bl, 0bh
        int     90h
        add     cl, 0fh
        inc     di
        jne     br_2E30C
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_2E30C:
        dec     bp
        je      br_2E312
        dec     dx
        jne     loop_2E2F8
br_2E312:
        ret
str_2E313:
        db      3eh, "Exclusive:"
cb_2E31E:
        mov     ax, word ptr [A3_W_0195A]
        mov     ah, 0fh
        mul     ah
        add     al, 42h
        DISP_CURSOR     al, byte ptr [A3_B_01910], 0dh
        ret
br_2E332:
        mov     al, byte ptr es:[di+0dh]
        push    ax
        mov     si, 207ch
        mov     ah, byte ptr [si]
        inc     si
        push    ax
        mul     ah
        add     si, ax
        pop     ax
        mov     dx, ds
        mov     bl, 5
        int     90h
        mov     ah, byte ptr es:[di+0eh]
        int     7ch
        add     cl, 6ch
        mov     bl, 1eh
        mov     bh, 2
        int     90h
        pop     ax
        cmp     al, 2
        je      br_2E36F
        mov     al, byte ptr es:[di+0fh]
        mov     ah, 0
        mov     cl, 0aeh
        mov     bh, 3
        mov     bl, 8
        int     90h
        call    fn_2E3FA
        ret
br_2E36F:
        mov     al, byte ptr es:[di+0fh]
        push    ax
        call    fn_2E3FA
        pop     ax
        cmp     al, 32h
        jb      br_2E391
        je      br_2E3A6
        sub     al, 32h
        mov     cl, 0b4h
        mov     bh, 2
        mov     bl, 8
        int     90h
        mov     al, 52h
        mov     cl, 0aeh
        mov     bl, 4
        int     90h
        ret
br_2E391:
        sub     al, 32h
        neg     al
        mov     cl, 0b4h
        mov     bh, 2
        mov     bl, 8
        int     90h
        mov     cl, 0aeh
        mov     al, 4ch
        mov     bl, 4
        int     90h
        ret
br_2E3A6:
        mov     cl, 0aeh
        mov     al, 30h
        mov     bl, 4
        int     90h
        ret
stepcur_2E3AF:
        DISP_CURSOR     6, byte ptr [A3_B_01910], 48h
        ret
stepcur_2D58C_107:
        DISP_CURSOR     6ch, byte ptr [A3_B_01910], 25h
        ret
stepcur_2E3C5:
        DISP_CURSOR     0aeh, byte ptr [A3_B_01910], 13h
        ret
br_2E3D0:
        mov     dx, cs
        mov     si, str_2E3DC-APP3_CSBASE
        mov     ah, 1dh
        mov     bl, 5
        int     90h
        ret
str_2E3DC:
        db      ">---- Event data error !!----"
cb_2E3F9:
        db      0c3h
fn_2E3FA:
        shr     al, 1
        mov     cl, 0c6h
        mov     ah, 5
        mov     bl, 13h
        int     90h
        ret
stepcur_2E405:
        DISP_CURSOR     6, byte ptr [A3_B_01910], 7
        ret
fn_2E410:
        mov     ax, ds
        mov     es, ax
        sub     ax, ax
        mov     cx, 0ah
        mov     di, 1928h
        push    di
        rep stosw
        pop     di
        int     83h
        mov     cx, 5
        mov     bx, word ptr [A3_W_0193C]
loop_2E429:
        mov     al, byte ptr es:[si+4]
        cmp     al, 0ffh
        je      br_2E461
        push    bx
        push    cx
        push    di
        call    fn_2FCC4
        call    fn_2FCF6
        pop     di
        pop     cx
        pop     bx
        jne     br_2E461
        call    fn_2E462
        jb      br_2E45A
        cmp     bx, 0
        jne     BR_2E459
        mov     word ptr [di], si
        mov     word ptr [di+2], es
        add     di, 4
        push    bx
        call    fn_2FCD4
        pop     bx
        loop    loop_2E429
        ret
BR_2E459:
        dec     bx
br_2E45A:
        push    bx
        call    fn_2FCD4
        pop     bx
        jmp     loop_2E429
br_2E461:
        ret
fn_2E462:
        cmp     byte ptr [A3_B_01913], 0
        je      br_2E471
        cmp     dh, byte ptr [A3_W_00712]
        stc
        je      br_2E471
        ret
br_2E471:
        mov     al, byte ptr [A3_B_01914]
        cmp     al, 0
        jne     br_2E479
        ret
br_2E479:
        mov     ah, byte ptr es:[si+4]
        cmp     al, 1
        jne     br_2E4B0
        test    ah, 80h
        stc
        je      br_2E488
        ret
br_2E488:
        call    fn_280CB
        jne     br_2E49E
        cmp     ah, byte ptr [A3_B_01577]
        jae     br_2E494
        ret
br_2E494:
        cmp     ah, byte ptr [A3_B_01578]
        ja      loop_2E49C
        clc
        ret
loop_2E49C:
        stc
        ret
br_2E49E:
        mov     al, byte ptr [A3_B_01579]
        cmp     byte ptr [A3_B_01579], 41h
        jne     br_2E4A9
        ret
br_2E4A9:
        cmp     ah, byte ptr [A3_B_0157A]
        jne     loop_2E49C
        ret
br_2E4B0:
        cmp     al, 2
        jne     br_2E4BC
        cmp     ah, 0e0h
        jne     br_2E4BA
        ret
br_2E4BA:
        stc
        ret
br_2E4BC:
        cmp     al, 3
        jne     br_2E4DA
        cmp     ah, 0b0h
        stc
        je      br_2E4C7
        ret
br_2E4C7:
        mov     al, byte ptr [A3_B_01915]
        cmp     al, 0
        jne     br_2E4CF
        ret
br_2E4CF:
        dec     al
        cmp     al, byte ptr es:[si+5]
        jne     br_2E4D8
        ret
br_2E4D8:
        stc
        ret
br_2E4DA:
        cmp     al, 4
        jne     br_2E4E6
        cmp     ah, 0c0h
        jne     br_2E4E4
        ret
br_2E4E4:
        stc
        ret
br_2E4E6:
        cmp     al, 5
        jne     br_2E4F2
        cmp     ah, 0a0h
        jne     br_2E4F0
        ret
br_2E4F0:
        stc
        ret
br_2E4F2:
        cmp     al, 6
        jne     br_2E4FE
        cmp     ah, 0d0h
        jne     br_2E4FC
        ret
br_2E4FC:
        stc
        ret
br_2E4FE:
        cmp     al, 7
        jne     br_2E50A
        cmp     ah, 0f0h
        jne     br_2E508
        ret
br_2E508:
        stc
        ret
br_2E50A:
        stc
        ret
fn_2E50C:
        mov     ax, word ptr [A3_W_0195E]
        mov     bx, word ptr [A3_W_01960]
        cmp     ax, bx
        jb      br_2E51E
        mov     word ptr [A3_W_0195E], bx
        mov     word ptr [A3_W_01960], ax
br_2E51E:
        int     83h
        mov     di, 0
        mov     bx, 0
loop_2E526:
        mov     al, byte ptr es:[si+4]
        cmp     al, 0ffh
        je      br_2E597
        push    bx
        push    di
        call    fn_2FCC4
        call    fn_2FCF6
        pop     di
        pop     bx
        jne     br_2E597
        call    fn_2E462
        jb      br_2E590
        cmp     bx, word ptr [A3_W_0195E]
        jb      br_2E58F
        cmp     bx, word ptr [A3_W_01960]
        ja      br_2E597
        push    ds
        push    si
        mov     dl, byte ptr es:[si+4]
        mov     ax, es
        mov     ds, ax
        mov     ax, 0e2a0h
        mov     es, ax
        mov     cx, 4
        rep movsw
        cmp     dl, 0f0h
        jne     br_2E589
        cmp     si, 0
        jne     loop_2E570
        mov     ax, ds
        add     ax, 1000h
        mov     ds, ax
loop_2E570:
        mov     dl, byte ptr [si+4]
        mov     cx, 4
        rep movsw
        cmp     si, 0
        jne     br_2E584
        mov     ax, ds
        add     ax, 1000h
        mov     ds, ax
br_2E584:
        cmp     dl, 0f8h
        jne     loop_2E570
br_2E589:
        mov     ax, ds
        mov     es, ax
        pop     si
        pop     ds
br_2E58F:
        inc     bx
br_2E590:
        push    bx
        call    fn_2FCD4
        pop     bx
        jmp     loop_2E526
br_2E597:
        mov     ax, 0e2a0h
        mov     es, ax
        mov     ax, 0ffffh
        mov     cx, 4
        rep stosw
        mov     byte ptr [A3_B_01966], 0
        ret
far_2E5AA:
        mov     word ptr [A3_FP_STEP_EVENT], di
        mov     word ptr [A3_W_01922], es
        mov     ax, es
        or      ax, di
        jne     br_2E5BA
        jmp     br_2E626
br_2E5BA:
        mov     al, byte ptr es:[di+4]
        cmp     al, 80h
        jae     br_2E5C5
        jmp     br_2E649
br_2E5C5:
        cmp     al, 0f0h
        jne     br_2E5CC
        jmp     br_2EEDB
br_2E5CC:
        cmp     al, 0a0h
        jne     BR_2E5D3
        jmp     NEAR L_2E30C
BR_2E5D3:
        cmp     al, 0b0h
        jne     BR_2E5DA
        jmp     NEAR br_2EC6D
BR_2E5DA:
        cmp     al, 0c0h
        jne     br_2E5E1
        jmp     NEAR br_2ECFC
br_2E5E1:
        cmp     al, 0d0h
        jne     br_2E5E8
        if      FW_VERSION >= 120
        jmp     NEAR L_2DF0D
        else
        db      0e9h, 53h, 07h
        endif
br_2E5E8:
        cmp     al, 0e0h
        jne     br_2E5EF
        jmp     NEAR L_2E4A8
br_2E5EF:
        jmp     br_2E603
L_2DD1F:
        push    cs
        call    isr_2D74F
        push    cs
        call    far_2DDC4
        retf
L_2E5FA:
        push    cs
        call    isr_2D74F
        push    cs
        call    far_2DD8C
        retf
br_2E603:
        mov     word ptr [A3_W_STEP_CURSOR_FN], cb_2E3F9-APP3_CSBASE
        KEY_WHEEL       0000h, 0000h
        KEY_DIGITS      0000h, 0000h
        KEY_DOWN        17h, 0000h, 0000h
        KEY_DOWN        18h, 0000h, 0000h
        db      0cbh
br_2E626:
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E405-APP3_CSBASE
        KEY_WHEEL       0000h, 0000h
        KEY_DIGITS      0000h, 0000h
        KEY_DOWN        17h, EP_FAR_2DCB9_OFF, EP_FAR_2DCB9_SEG
        KEY_DOWN        18h, 0000h, 0000h
        db      0cbh
br_2E649:
        call    fn_280CB
        jne     br_2E653
        callf   [A3_FP_01940]
        retf
br_2E653:
        callf   [A3_W_01944]
        retf
L_2E658:
        mov     byte ptr [A3_B_01967], 1
        mov     word ptr [A3_FP_01940], L_2E658-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+FAR_2DCB9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DDC9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        mov     word ptr [A3_W_STEP_CURSOR_FN], cb_2DF0B-APP3_CSBASE
        les     di, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[di+4]
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2E692-APP3_CSBASE
        int     7fh
        retf
intcb_2E692:
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+4], al
        retf
L_2DDC9:
        mov     byte ptr [A3_B_01967], 4
        mov     word ptr [A3_FP_01940], L_2DDC9-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2DF16-APP3_CSBASE
        if      FW_VERSION >= 120
        KEY_CURSOR      EP_L_2E658_OFF, APP3_SEG, (APP3_BASE+L_2DE32-APP3_SEG*16), APP3_SEG, EP_L_2DD1F_OFF, APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        db      0c4h, 3eh, 20h, 19h
        mov     al, byte ptr es:[di+3]
        mov     ah, byte ptr es:[di+2]
        shr     ah, 4
        shl     ax, 2
        mov     al, byte ptr es:[di+5]
        mov     bl, 0
        mov     bh, 0
        elseif  FW_VERSION >= 114
        KEY_CURSOR      EP_L_2E658_OFF, APP3_SEG, (APP3_BASE+L_2DE32-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        db      0c4h, 3eh, 20h, 19h, 26h, 8ah, 45h, 03h, 26h, 8ah, 65h, 02h, 0c0h
        db      0ech, 04h, 0c1h, 0e0h, 02h, 26h, 8ah, 45h, 05h, 0b3h, 00h, 0b7h
        else
        KEY_CURSOR      (APP3_BASE+L_2E658-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DE32-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        db      0c4h, 3eh
        and     byte ptr [bx+di], bl
        mov     al, byte ptr es:[di+3]
        mov     ah, byte ptr es:[di+2]
        shr     ah, 4
        shl     ax, 2
        mov     al, byte ptr es:[di+5]
        mov     bl, 0
        mov     bh, 0
        endif
        if      FW_VERSION <> 114
        mov     dx, 270fh
        else
        add     byte ptr [bp+si+270fh], bh
        endif
        mov     di, intcb_2E6E1-APP3_CSBASE
        int     7fh
        retf
intcb_2E6E1:
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+5], al
        mov     al, 0
        shr     ax, 2
        shl     ah, 4
        and     byte ptr es:[di+2], 0fh
        or      byte ptr es:[di+2], ah
        and     byte ptr es:[di+3], 3fh
        or      byte ptr es:[di+3], al
        retf
L_2DE32:
        mov     byte ptr [A3_B_01967], 3
        mov     word ptr [A3_FP_01940], L_2DE32-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2DF21-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_2DDC9-APP3_SEG*16), APP3_SEG, (APP3_BASE+LOOP_2DB7D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        les     di, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[di+6]
        and     al, 7fh
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2E740-APP3_CSBASE
        int     7fh
        retf
intcb_2E740:
        cmp     al, 0
        jne     L_2E166
        inc     al
L_2E166:
        les     di, [A3_FP_STEP_EVENT]
        mov     ah, byte ptr es:[di+6]
        and     ax, 807fh
        or      al, ah
        mov     byte ptr es:[di+6], al
        retf
L_2DE86:
        mov     byte ptr [A3_B_01967], 2
        mov     word ptr [A3_W_01944], L_2DE86-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2DFDE-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_CURSOR      (APP3_BASE+FAR_2DCB9-APP3_SEG*16), APP3_SEG, (APP3_BASE+STEP_EDIT_VARIATION_TYPE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        db      0c4h, 3eh, 20h, 19h
        else
        KEY_CURSOR      EP_FAR_2DCB9_OFF, EP_FAR_2DCB9_SEG, EP_STEP_EDIT_VARIATION_TYPE_OFF, EP_STEP_EDIT_VARIATION_TYPE_SEG, EP_L_2DD1F_OFF, APP3_SEG, EP_APP3_7E4A_OFF, APP3_SEG
        db      0c4h, 3eh
        and     byte ptr [bx+di], bl
        endif
        mov     al, byte ptr es:[di+4]
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 62h
        mov     di, A3_W_07FE2
        int     7fh
        retf
d_a3_w_07fe2:
        if      FW_VERSION >= 114
        if      FW_VERSION >= 120
        db      3ch, 23h, 73h, 02h, 0b0h
        and     di, word ptr [si]
        db      62h, 72h, 02h, 0b0h
br_2E79D:
        db      62h
        else
        db      3ch
        and     si, word ptr [bp+di+2]
        mov     al, 23h
        cmp     al, 62h
        jb      br_2E79D
        mov     al, 62h
br_2E79D:
        endif
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+4], al
        retf
        else
        if      FW_VERSION >= 112
        db      3ch, 23h, 73h, 02h, 0b0h
        and     di, word ptr [si]
        db      62h, 72h, 02h, 0b0h, 62h, 0c4h, 3eh, 20h, 19h, 26h, 88h, 45h, 04h, 0cbh
        else
        cmp     al, 23h
        jae     L_2DEC6
        mov     al, 23h
L_2DEC6:
        cmp     al, 62h
        jb      br_2E79D
        mov     al, 62h
br_2E79D:
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+4], al
        retf
        endif
        endif
step_edit_variation_type:
        mov     byte ptr [A3_B_01967], 5
        mov     word ptr [A3_W_01944], step_edit_variation_type-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2DFE9-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_2DE86-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DF3F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        les     di, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[di+6]
        shl     ax, 1
        mov     al, byte ptr es:[di+7]
        shl     ax, 1
        mov     al, ah
        and     ax, 3
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3
        mov     di, intcb_2E7F2-APP3_CSBASE
        int     7fh
        KEY_DIGITS      0000h, 0000h
        retf
step_store_variation_type:
intcb_2E7F2:
        mov     ah, al
        les     di, [A3_FP_STEP_EVENT]
resume_2E7F8:
        mov     al, byte ptr es:[di+7]
        shl     al, 1
        shr     ax, 1
        mov     byte ptr es:[di+7], al
        mov     al, byte ptr es:[di+6]
        shl     al, 1
        shr     ax, 1
        mov     byte ptr es:[di+6], al
        retf
L_2DF3F:
        mov     byte ptr [A3_B_01967], 6
        mov     word ptr [A3_W_01944], L_2DF3F-APP3_CSBASE
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        KEY_CURSOR      EP_STEP_EDIT_VARIATION_TYPE_OFF, EP_STEP_EDIT_VARIATION_TYPE_SEG, EP_FAR_2EB5C_OFF, EP_FAR_2EB5C_SEG, EP_L_2DD1F_OFF, APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
step_edit_variation_value:
        else
        KEY_CURSOR      EP_STEP_EDIT_VARIATION_TYPE_OFF, EP_STEP_EDIT_VARIATION_TYPE_SEG, EP_FAR_2EB5C_OFF, EP_FAR_2EB5C_SEG, EP_L_2DD1F_OFF, APP3_SEG, EP_L_2E5FA_OFF, APP3_SEG
        endif
        les     di, [A3_FP_STEP_EVENT]
        else
        KEY_CURSOR      EP_STEP_EDIT_VARIATION_TYPE_OFF, EP_STEP_EDIT_VARIATION_TYPE_SEG, EP_FAR_2EB5C_OFF, EP_FAR_2EB5C_SEG, EP_L_2DD1F_OFF, APP3_SEG, EP_APP3_7E4A_OFF, APP3_SEG
        db      0c4h, 3eh
        and     byte ptr [bx+di], bl
        endif
        mov     al, byte ptr es:[di+6]
resume_2E836:
        shl     ax, 1
        mov     al, byte ptr es:[di+7]
        shl     ax, 1
        mov     al, ah
        and     ax, 3
        mov     bx, A3_W_080AB
        cmp     al, 1
        je      br_2E858
        cmp     al, 2
        je      br_2E858
        mov     bx, A3_W_080F2
        cmp     al, 0
        je      br_2E858
        if      FW_VERSION >= 112
        mov     bx, 8256h
        elseif  FW_VERSION >= 111
        mov     bx, 8254h
        elseif  FW_VERSION >= 110
        mov     bx, 8246h
        else
        mov     bx, 8218h
        endif
br_2E858:
        call    bx
        retf
d_a3_w_080ab:
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2DFF4-APP3_CSBASE
        les     di, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[di+7]
        and     ax, 7fh
        mov     bl, 0
        mov     bh, 0
        mov     dx, 64h
        mov     di, intcb_2E879-APP3_CSBASE
        int     7fh
        ret
intcb_2E879:
        les     di, [A3_FP_STEP_EVENT]
        mov     bl, byte ptr es:[di+6]
        shl     bx, 1
        mov     bl, byte ptr es:[di+7]
        shl     bx, 1
        and     bh, 3
        je      br_2E894
        cmp     al, 64h
        jb      br_2E894
        mov     al, 64h
br_2E894:
        mov     ah, byte ptr es:[di+7]
        and     ah, 80h
        or      al, ah
        mov     byte ptr es:[di+7], al
        retf
d_a3_w_080f2:
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2DFFF-APP3_CSBASE
        mov     byte ptr [A3_B_01917], 0
        mov     byte ptr [A3_B_01916], 0
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        KEY_DIGITS      (APP3_BASE+L_2E919-APP3_SEG*16), APP3_SEG
        else
        KEY_DIGITS      EP_L_2E047_OFF, APP3_SEG
        endif
        KEY_DOWN        0eh, (APP3_BASE+L_2DFF5-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       (APP3_BASE+L_2E019-APP3_SEG*16), APP3_SEG
        ret
L_2DFF5:
        mov     word ptr [A3_W_01918], 0
        mov     byte ptr [A3_B_01917], 1
        if      FW_VERSION < 112
        KEY_DOWN        20h, EP_L_2E0C5_OFF, APP3_SEG
        else
        KEY_DOWN        20h, (APP3_BASE+L_2E997-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_2E102-APP3_SEG*16), APP3_SEG
        retf
L_2E019:
        les     di, [A3_FP_STEP_EVENT]
        else
        KEY_DIGITS      (APP3_BASE+L_2E919-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_2DFF5-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       (APP3_BASE+L_2E019-APP3_SEG*16), APP3_SEG
        db      0c3h
L_2DFF5:
        db      0c7h
        push    es
        sbb     byte ptr [bx+di], bl
        add     byte ptr [bx+si], al
        mov     byte ptr [A3_B_01917], 1
        KEY_DOWN        20h, (APP3_BASE+L_2E997-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_2E102-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2E019:
        db      0c4h, 3eh
        and     byte ptr [bx+di], bl
        endif
        mov     bl, byte ptr es:[di+7]
        and     bx, 7fh
        add     ax, bx
        cmp     ax, 7fh
        jb      br_2E900
        mov     ax, 7fh
br_2E900:
        sub     ax, cx
        jae     br_2E907
        mov     ax, 0
br_2E907:
        mov     byte ptr es:[di+7], al
        KEY_DOWN        20h, (APP3_BASE+far_2CF71-APP3_SEG*16), APP3_SEG
        mov     byte ptr [A3_B_01916], 0
        retf
L_2E919:
        if      FW_VERSION <> 114
        mov     ah, 0
        cmp     byte ptr [A3_B_01916], 0
        jne     br_2E92D
        mov     byte ptr [A3_B_01916], 1
        mov     word ptr [A3_W_01918], 0
        else
        db      0b4h, 00h, 80h, 3eh, 16h, 19h, 00h, 75h, 0bh, 0c6h, 06h, 16h, 19h, 01h, 0c7h, 06h
        db      18h, 19h, 00h, 00h, 8bh, 0c8h
        endif
br_2E92D:
        if      FW_VERSION < 114
        mov     cx, ax
        endif
        if      FW_VERSION >= 120
        mov     cx, ax
        endif
        mov     ax, word ptr [A3_W_01918]
        mov     bx, 0ah
        mul     bx
        or      dx, dx
        je      br_2E93E
        mov     ax, 0
br_2E93E:
        add     ax, cx
        cmp     ax, 79h
        jb      L_2E367
        mov     ax, cx
L_2E367:
        mov     word ptr [A3_W_01918], ax
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        KEY_DOWN        20h, EP_L_2E0C5_OFF, APP3_SEG
        else
        KEY_DOWN        20h, (APP3_BASE+L_2E997-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        19h, EP_L_2DD1F_OFF, APP3_SEG
        KEY_DOWN        1ah, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_2E102-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_CURSOR      (APP3_BASE+L_2E0B3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E0BC-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2E0B3:
        push    cs
        call    isr_2D74F
        push    cs
        call    step_edit_variation_type
        retf
L_2E0BC:
        push    cs
        call    isr_2D74F
        push    cs
        call    far_2EB5C
        retf
L_2E997:
        if      FW_VERSION >= 120
        mov     cl, 5ah
        dec     cl
        db      8ah, 2eh, 10h
        db      19h, 0feh
        int     0b0h
        sbb     word ptr [si-4cf7h], si
        adc     al, 0cdh
        nop
        else
        db      0b1h, 5ah, 0feh, 0c9h, 8ah
        adc     byte ptr cs:[bx+di], bl
        dec     ch
        mov     al, 19h
        mov     ah, 9
        mov     bl, 14h
        int     90h
        endif
        add     ch, 9
        mov     ah, 1
        mov     bl, 0eh
        int     90h
        mov     cl, 5ah
        mov     ch, byte ptr [A3_B_01910]
        mov     al, 2bh
        cmp     byte ptr [A3_B_01917], 0
        je      br_2E9C3
        mov     al, 2dh
br_2E9C3:
        mov     bl, 4
        int     90h
        add     cl, 6
        mov     ax, word ptr [A3_W_01918]
        mov     bh, 3
        mov     bl, 8
        int     90h
        retf
L_2E102:
        mov     byte ptr [A3_B_01916], 0
        push    cs
        call    isr_2D74F
        cmp     byte ptr [A3_B_01917], 0
        jne     br_2E9F4
        mov     ax, word ptr [A3_W_01918]
        shr     ax, 1
        add     al, 40h
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+7], al
        retf
br_2E9F4:
        mov     ax, word ptr [A3_W_01918]
        shr     ax, 1
        mov     ah, 40h
        sub     ah, al
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+7], ah
        retf
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2DFFF-APP3_CSBASE
        mov     byte ptr [A3_B_01917], 0
        mov     byte ptr [A3_B_01916], 0
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        KEY_DIGITS      EP_L_2E1AE_OFF, APP3_SEG
        else
        KEY_DIGITS      (APP3_BASE+L_2EA80-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        0eh, (APP3_BASE+L_2E15A-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       EP_L_2EA50_OFF, APP3_SEG
        ret
        ret
L_2E15A:
        mov     word ptr [A3_W_01918], 0
        mov     byte ptr [A3_B_01917], 1
        KEY_DOWN        20h, (APP3_BASE+L_2EAEC-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        if      FW_VERSION >= 112
        KEY_DOWN        0eh, (APP3_BASE+L_2EB29_120-APP3_SEG*16), APP3_SEG
        retf
L_2DC22:
        if      FW_VERSION >= 120
        db      0c4h, 3eh, 20h, 19h, 26h, 8ah, 5dh, 07h, 83h, 0e3h, 7fh
        add     ax, bx
        cmp     ax, 64h
        jb      L_2EA65
        db      0b8h, 64h, 00h
L_2EA65:
        db      2bh, 0c1h
        jae     L_2EA6C
        db      0b8h, 00h, 00h
        else
        db      0c4h, 3eh, 20h, 19h, 26h, 8ah, 5dh, 07h, 83h, 0e3h, 7fh, 03h, 0c3h, 3dh, 64h, 00h
        jb      L_2E485
        mov     ax, 64h
L_2E485:
        sub     ax, cx
        jae     L_2E48C
        mov     ax, 0
L_2E48C:
        endif
L_2EA6C:
        or      al, 80h
        mov     byte ptr es:[di+7], al
        KEY_DOWN        20h, (APP3_BASE+far_2CF71-APP3_SEG*16), APP3_SEG
        mov     byte ptr [A3_B_01916], 0
        retf
L_2EA80:
        if      FW_VERSION <> 114
        mov     ah, 0
        cmp     byte ptr [A3_B_01916], 0
        jne     br_2EA94
        mov     byte ptr [A3_B_01916], 1
        mov     word ptr [A3_W_01918], 0
        else
        db      0b4h, 00h, 80h, 3eh, 16h, 19h, 00h, 75h, 0bh, 0c6h, 06h, 16h, 19h, 01h, 0c7h, 06h
        db      18h, 19h, 00h, 00h, 8bh, 0c8h
        endif
br_2EA94:
        if      FW_VERSION < 114
        mov     cx, ax
        endif
        if      FW_VERSION >= 120
        mov     cx, ax
        endif
        mov     ax, word ptr [A3_W_01918]
        mov     bx, 0ah
        mul     bx
        or      dx, dx
        je      br_2EAA5
        mov     ax, 0
br_2EAA5:
        add     ax, cx
        cmp     ax, 33h
        jb      br_2EAAE
        mov     ax, cx
br_2EAAE:
        mov     word ptr [A3_W_01918], ax
        else
        KEY_DOWN        0eh, (APP3_BASE+L_2E239-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2DC22:
        db      0c4h, 3eh, 20h, 19h, 26h, 8ah
        db      5dh, 07h, 83h, 0e3h, 7fh, 03h, 0c3h, 3dh, 64h, 00h, 72h, 03h, 0b8h, 64h, 00h, 2bh
        db      0c1h, 73h, 03h, 0b8h, 00h, 00h, 0ch, 80h, 26h, 88h, 45h, 07h
        KEY_DOWN        20h, EP_FAR_2CF71_OFF, APP3_SEG
        db      0c6h, 06h, 16h, 19h, 00h, 0cbh
L_2EA80:
        db      0b4h, 00h, 80h, 3eh, 16h, 19h
        db      00h, 75h, 0bh, 0c6h, 06h, 16h, 19h, 01h, 0c7h, 06h, 18h, 19h, 00h, 00h, 8bh, 0c8h
        db      0a1h, 18h, 19h, 0bbh, 0ah, 00h, 0f7h, 0e3h, 0bh, 0d2h, 74h, 03h, 0b8h, 00h, 00h, 03h
        db      0c1h, 3dh, 33h, 00h, 72h, 02h, 8bh, 0c1h, 0a3h, 18h, 19h
        endif
        KEY_DOWN        20h, (APP3_BASE+L_2EAEC-APP3_SEG*16), APP3_SEG
        KEY_DOWN        19h, EP_L_2DD1F_OFF, APP3_SEG
        if      FW_VERSION >= 110
        KEY_DOWN        1ah, EP_L_2E5FA_OFF, APP3_SEG
        if      FW_VERSION >= 112
        KEY_DOWN        0eh, (APP3_BASE+L_2EB29_120-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        if      FW_VERSION >= 120
        KEY_CURSOR      (APP3_BASE+L_2E0B3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E0BC-APP3_SEG*16), APP3_SEG, EP_L_2DD1F_OFF, APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2EAEC:
        db      0b1h, 5ah, 0feh
        leave
        else
        KEY_CURSOR      (APP3_BASE+L_2E0B3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E0BC-APP3_SEG*16), APP3_SEG, EP_L_2DD1F_OFF, APP3_SEG, EP_L_2E5FA_OFF, APP3_SEG
        db      0cbh
L_2EAEC:
        db      0b1h
        pop     dx
        dec     cl
        endif
        mov     ch, byte ptr [A3_B_01910]
        dec     ch
        mov     al, 19h
        mov     ah, 9
        mov     bl, 14h
        int     90h
        add     ch, 9
        mov     ah, 1
        mov     bl, 0eh
        int     90h
        mov     cl, 5ah
        mov     ch, byte ptr [A3_B_01910]
        mov     al, 2bh
        cmp     byte ptr [A3_B_01917], 0
        je      br_2EB18
        mov     al, 2dh
br_2EB18:
        mov     bl, 4
        int     90h
        add     cl, 6
        mov     ax, word ptr [A3_W_01918]
        mov     bh, 2
        mov     bl, 8
        int     90h
        retf
L_2EB29_120:
        db      0c6h, 06h, 16h, 19h, 00h, 0eh
        call    isr_2D74F
        db      80h, 3eh, 17h, 19h, 00h
        jne     L_2EB49
        mov     ax, word ptr [A3_W_01918]
        add     al, 32h
        les     di, [A3_FP_STEP_EVENT]
        else
        KEY_DOWN        0eh, (APP3_BASE+L_2E239-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_CURSOR      EP_L_2E0B3_OFF, APP3_SEG, EP_L_2E0BC_OFF, APP3_SEG, EP_L_2DD1F_OFF, APP3_SEG, EP_L_2E5FA_OFF, APP3_SEG
L_2EAEC                         equ     $+1
        db      0cbh, 0b1h, 5ah, 0feh, 0c9h, 8ah, 2eh, 10h, 19h, 0feh, 0cdh
        db      0b0h, 19h, 0b4h, 09h, 0b3h, 14h, 0cdh, 90h, 80h, 0c5h, 09h, 0b4h, 01h, 0b3h, 0eh, 0cdh
        db      90h, 0b1h, 5ah, 8ah, 2eh, 10h, 19h, 0b0h, 2bh, 80h, 3eh, 17h, 19h, 00h, 74h, 02h
        db      0b0h, 2dh, 0b3h, 04h, 0cdh, 90h, 80h, 0c1h, 06h, 0a1h, 18h, 19h, 0b7h, 02h, 0b3h, 08h
        db      0cdh, 90h, 0cbh
L_2E239:
        db      0c6h, 06h, 16h, 19h, 00h, 0eh, 0e8h, 1dh, 0ech, 80h, 3eh, 17h, 19h
        db      00h, 75h, 10h, 0a1h, 18h
tgt_2EB3B:
        sbb     word ptr [si], ax
        xor     al, ah
        and     byte ptr ds:[bx+di], bl
        endif
        else
        KEY_DOWN        1ah, EP_APP3_7E4A_OFF, APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_2E239-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_CURSOR      (APP3_BASE+L_2E0B3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E0BC-APP3_SEG*16), APP3_SEG, EP_L_2DD1F_OFF, APP3_SEG, EP_APP3_7E4A_OFF, APP3_SEG
        db      0cbh
L_2EAEC:
        db      0b1h, 5ah, 0feh, 0c9h, 8ah, 2eh, 10h, 19h, 0feh, 0cdh
        db      0b0h, 19h, 0b4h, 09h, 0b3h, 14h, 0cdh, 90h, 80h, 0c5h, 09h, 0b4h, 01h, 0b3h, 0eh, 0cdh
        db      90h, 0b1h, 5ah, 8ah, 2eh, 10h, 19h, 0b0h, 2bh, 80h, 3eh, 17h, 19h, 00h, 74h, 02h
        db      0b0h, 2dh, 0b3h, 04h, 0cdh, 90h, 80h, 0c1h, 06h, 0a1h, 18h, 19h, 0b7h, 02h, 0b3h, 08h
L_2E239                       equ     $+3
        db      0cdh, 90h, 0cbh, 0c6h, 06h, 16h, 19h, 00h, 0eh, 0e8h, 1dh, 0ech, 80h, 3eh, 17h, 19h
        db      00h, 75h, 10h, 0a1h, 18h
tgt_2EB3B:
        sbb     word ptr [si], ax
        xor     al, ah
        and     byte ptr ds:[bx+di], bl
        endif
        or      al, 80h
        mov     byte ptr es:[di+7], al
        retf
L_2EB49:
        mov     ax, word ptr [A3_W_01918]
        mov     ah, 32h
        sub     ah, al
        les     di, [A3_FP_STEP_EVENT]
        or      ah, 80h
        mov     byte ptr es:[di+7], ah
        retf
far_2EB5C:
        mov     byte ptr [A3_B_01967], 4
        mov     word ptr [A3_W_01944], far_2EB5C-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E00A-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_2DF3F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E2D0-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        les     di, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[di+3]
        mov     ah, byte ptr es:[di+2]
        shr     ah, 4
        shl     ax, 2
        mov     al, byte ptr es:[di+5]
        mov     bl, 0
        mov     bh, 0
        mov     dx, 270fh
        mov     di, intcb_2E6E1-APP3_CSBASE
        int     7fh
        retf
L_2E2D0:
        mov     byte ptr [A3_B_01967], 3
        mov     word ptr [A3_W_01944], L_2E2D0-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E015-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_CURSOR      (APP3_BASE+FAR_2EB5C-APP3_SEG*16), APP3_SEG, (APP3_BASE+LOOP_2DB7D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        db      0c4h, 3eh, 20h, 19h
        else
        KEY_CURSOR      EP_FAR_2EB5C_OFF, EP_FAR_2EB5C_SEG, EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, EP_L_2DD1F_OFF, APP3_SEG, EP_APP3_7E4A_OFF, APP3_SEG
        db      0c4h, 3eh
        and     byte ptr [bx+di], bl
        endif
        mov     al, byte ptr es:[di+6]
        and     al, 7fh
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2E740-APP3_CSBASE
        int     7fh
        retf
L_2E30C:
        callf   [A3_W_01948]
        retf
L_2EBE3:
        mov     byte ptr [A3_B_01967], 0
        mov     word ptr [A3_W_01948], L_2EBE3-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E11D-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+FAR_2DCB9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E356-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        les     di, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[di+5]
        and     al, 7fh
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, A3_W_0846F
        int     7fh
        retf
d_a3_w_0846f:
        if      FW_VERSION >= 110
        les     di, [A3_FP_STEP_EVENT]
        db      26h
        else
        db      0c4h, 3eh, 20h, 19h, 26h
        endif
        mov     byte ptr [di+5], al
        retf
L_2E356:
        mov     byte ptr [A3_B_01967], 8
        mov     word ptr [A3_W_01948], L_2E356-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E128-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_CURSOR      (APP3_BASE+L_2EBE3-APP3_SEG*16), APP3_SEG, (APP3_BASE+LOOP_2DB7D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        db      0c4h, 3eh, 20h, 19h
        else
        KEY_CURSOR      EP_L_2EBE3_OFF, APP3_SEG, EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, EP_L_2DD1F_OFF, APP3_SEG, EP_APP3_7E4A_OFF, APP3_SEG
        db      0c4h, 3eh
        and     byte ptr [bx+di], bl
        endif
        mov     al, byte ptr es:[di+6]
        and     al, 7fh
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2EC64-APP3_CSBASE
        int     7fh
        retf
intcb_2EC64:
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+6], al
        retf
br_2EC6D:
        callf   [A3_W_0194C]
        retf
far_2EC72:
        mov     byte ptr [A3_B_01967], 0
        mov     word ptr [A3_W_0194C], far_2EC72-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E18F-APP3_CSBASE
        KEY_CURSOR      EP_FAR_2DCB9_OFF, EP_FAR_2DCB9_SEG, L_2E3E5-APP3_CSBASE, APP3_SEG, EP_L_2DD1F_OFF, APP3_SEG, L_2E5FA-APP3_CSBASE, APP3_SEG
        les     di, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[di+5]
        and     al, 7fh
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2ECAE-APP3_CSBASE
        int     7fh
        retf
intcb_2ECAE:
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+5], al
        retf
L_2E3E5:
        mov     byte ptr [A3_B_01967], 8
        mov     word ptr [A3_W_0194C], L_2E3E5-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E19A-APP3_CSBASE
        KEY_CURSOR      far_2EC72-APP3_CSBASE, APP3_SEG, EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, EP_L_2DD1F_OFF, APP3_SEG, L_2E5FA-APP3_CSBASE, APP3_SEG
        les     di, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[di+6]
        and     al, 7fh
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2ECF3-APP3_CSBASE
        int     7fh
        retf
intcb_2ECF3:
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+6], al
        retf
br_2ECFC:
        mov     byte ptr [A3_B_01967], 7
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E1DF-APP3_CSBASE
        if      FW_VERSION >= 110
        KEY_CURSOR      (APP3_BASE+FAR_2DCB9-APP3_SEG*16), APP3_SEG, (APP3_BASE+LOOP_2DB7D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2DD1F-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        db      0c4h, 3eh, 20h, 19h
        mov     al, byte ptr es:[di+5]
        and     al, 7fh
        mov     ah, 0
        mov     bl, 1
        mov     bh, 0
        mov     dx, 80h
        mov     di, intcb_2ED32-APP3_CSBASE
        int     7fh
        retf
intcb_2ED32:
        if      FW_VERSION >= 114
        if      FW_VERSION >= 120
        db      0c4h
        and     byte ptr ds:[bx+di], bl
        mov     byte ptr es:[di+5], al
        retf
L_2DF0D:
        mov     byte ptr [A3_B_01967], 7
        else
        db      0c4h, 3eh, 20h
        sbb     word ptr [A3_W_04588], sp
        add     ax, 0c6cbh
        push    es
        db      67h
        sbb     word ptr [bx], ax
        endif
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E225-APP3_CSBASE
        KEY_CURSOR      EP_FAR_2DCB9_OFF, EP_FAR_2DCB9_SEG, EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, EP_L_2DD1F_OFF, APP3_SEG, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        db      0c4h, 3eh, 20h, 19h
        else
        if      FW_VERSION >= 112
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+5], al
        retf
L_2DF0D:
        mov     byte ptr [A3_B_01967], 7
        else
        db      0c4h, 3eh, 20h, 19h, 26h, 88h, 45h
        add     ax, 0c6cbh
        push    es
        db      67h
        sbb     word ptr [bx], ax
        endif
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E225-APP3_CSBASE
        KEY_CURSOR      EP_FAR_2DCB9_OFF, EP_FAR_2DCB9_SEG, EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, EP_APP3_7E41_OFF, APP3_SEG, EP_L_2E5FA_OFF, APP3_SEG
        db      0c4h, 3eh
        and     byte ptr [bx+di], bl
        endif
        else
        KEY_CURSOR      EP_FAR_2DCB9_OFF, EP_FAR_2DCB9_SEG, EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, EP_L_2DD1F_OFF, APP3_SEG, EP_APP3_7E4A_OFF, APP3_SEG
        db      0c4h
        db      3eh, 20h, 19h, 26h, 8ah, 45h, 05h, 24h, 7fh, 0b4h, 00h, 0b3h
        add     word ptr [bx-4600h], si
        add     byte ptr [bx+si], 0bfh
        inc     sp
        test    bp, cx
        db      7fh, 0cbh
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+5], al
        retf
L_2DF0D:
        mov     byte ptr [A3_B_01967], 7
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E225-APP3_CSBASE
        KEY_CURSOR      EP_FAR_2DCB9_OFF, EP_FAR_2DCB9_SEG, EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG, EP_APP3_7E41_OFF, APP3_SEG, EP_APP3_7E4A_OFF, APP3_SEG
        db      0c4h, 3eh
        and     byte ptr [bx+di], bl
        endif
        mov     al, byte ptr es:[di+5]
        and     al, 7fh
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2ED71-APP3_CSBASE
        int     7fh
        retf
intcb_2ED71:
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+5], al
        retf
L_2E4A8:
        mov     byte ptr [A3_B_01917], 0
        mov     byte ptr [A3_B_01916], 0
        mov     byte ptr [A3_B_01967], 0
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E2A0-APP3_CSBASE
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        KEY_DIGITS      EP_L_2E531_OFF, APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_2E4E2-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       EP_L_2E4FE_OFF, APP3_SEG
        else
        KEY_DIGITS      (APP3_BASE+L_2EE03-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_2E4E2-APP3_SEG*16), APP3_SEG
        KEY_WHEEL       (APP3_BASE+L_2EDD0-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        17h, EP_FAR_2DCB9_OFF, EP_FAR_2DCB9_SEG
        KEY_DOWN        18h, EP_LOOP_2DB7D_OFF, EP_LOOP_2DB7D_SEG
        db      0cbh
L_2E4E2:
        mov     word ptr [A3_W_01918], 0
        mov     byte ptr [A3_B_01917], 1
        if      FW_VERSION >= 120
        KEY_DOWN        20h, (APP3_BASE+L_2EE67-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        elseif  FW_VERSION >= 110
        KEY_DOWN        20h, EP_L_2EE67_OFF, APP3_SEG
        KEY_DOWN        0fh, EP_L_2D16F_OFF, APP3_SEG
        else
        KEY_DOWN        20h, EP_APP3_86B7_OFF, APP3_SEG
        KEY_DOWN        0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        endif
        db      0cbh
L_2EDD0:
        les     di, [A3_FP_STEP_EVENT]
        mov     bx, word ptr es:[di+5]
        shl     bl, 1
        shr     bx, 1
        add     ax, bx
        cmp     ax, 3fffh
        jb      br_2EDE6
        mov     ax, 3fffh
br_2EDE6:
        sub     ax, cx
        jae     br_2EDED
        mov     ax, 0
br_2EDED:
        shl     ax, 1
        shr     al, 1
        mov     word ptr es:[di+5], ax
        KEY_DOWN        20h, (APP3_BASE+far_2CF71-APP3_SEG*16), APP3_SEG
        mov     byte ptr [A3_B_01916], 0
        retf
L_2EE03:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 114
        mov     ah, 0
        cmp     byte ptr [A3_B_01916], 0
        jne     L_2EE17
        mov     byte ptr [A3_B_01916], 1
        mov     word ptr [A3_W_01918], 0
L_2EE17:
        db      8bh, 0c8h, 0a1h, 18h, 19h, 0bbh, 0ah, 00h, 0f7h, 0e3h, 0bh, 0d2h
        if      FW_VERSION >= 120
        db      74h, 03h, 0b8h, 00h, 00h, 03h, 0c1h, 0bbh, 00h, 20h
        else
        je      br_2EE2D
        mov     ax, 0
        endif
br_2EE2D:
        if      FW_VERSION < 120
        add     ax, cx
        mov     bx, 2000h
        endif
        cmp     byte ptr [A3_B_01917], 0
        je      br_2EE35
        inc     bx
br_2EE35:
        cmp     ax, bx
        jb      L_2E00D
        mov     ax, cx
L_2E00D:
        mov     word ptr [A3_W_01918], ax
        KEY_DOWN        20h, (APP3_BASE+L_2EE67-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+far_2E5D2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_DOWN        19h, EP_L_2DD1F_OFF, APP3_SEG
        KEY_DOWN        1ah, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        retf
        else
        db      0b4h, 00h, 80h, 3eh, 16h, 19h, 00h, 75h, 0bh, 0c6h, 06h, 16h, 19h, 01h, 0c7h, 06h
        db      18h, 19h, 00h, 00h, 8bh, 0c8h, 0a1h, 18h, 19h, 0bbh, 0ah, 00h, 0f7h, 0e3h, 0bh, 0d2h
        db      74h, 03h, 0b8h, 00h, 00h, 03h, 0c1h, 0bbh, 00h, 20h, 80h, 3eh, 17h, 19h, 00h, 74h
        db      01h, 43h, 3bh, 0c3h, 72h, 02h, 8bh, 0c1h, 0a3h, 18h, 19h
        KEY_DOWN        20h, EP_L_2EE67_OFF, APP3_SEG
        KEY_DOWN        0eh, EP_FAR_2E5D2_OFF, APP3_SEG
        KEY_DOWN        0fh, EP_L_2D16F_OFF, APP3_SEG
        KEY_DOWN        19h, EP_APP3_7E41_OFF, APP3_SEG
        KEY_DOWN        1ah, EP_L_2E5FA_OFF, APP3_SEG
        db      0cbh
        endif
L_2EE67:
        if      FW_VERSION >= 114
        db      0b1h, 60h, 0feh, 0c9h, 8ah, 2eh, 10h, 19h
        dec     ch
        mov     al, 1fh
        mov     ah, 9
        mov     bl, 14h
        int     90h
        add     ch, 9
        mov     ah, 1
        mov     bl, 0eh
        int     90h
        mov     cl, 60h
        mov     ch, byte ptr [A3_B_01910]
        mov     al, 2bh
        cmp     byte ptr [A3_B_01917], 0
        je      br_2EE93
        mov     al, 2dh
        else
        db      0b1h, 60h, 0feh, 0c9h, 8ah, 2eh, 10h, 19h, 0feh, 0cdh, 0b0h, 1fh
        db      0b4h, 09h, 0b3h, 14h, 0cdh, 90h, 80h, 0c5h, 09h, 0b4h, 01h, 0b3h, 0eh, 0cdh, 90h, 0b1h
        db      60h, 8ah, 2eh, 10h, 19h, 0b0h, 2bh, 80h, 3eh, 17h, 19h, 00h, 74h, 02h, 0b0h, 2dh
        db      0b3h
        endif
br_2EE93:
        if      FW_VERSION >= 114
        mov     bl, 4
        int     90h
        else
        add     al, 0cdh
        nop
        endif
        else
        mov     ah, 0
        cmp     byte ptr [A3_B_01916], 0
        jne     L_2DFE9
        mov     byte ptr [A3_B_01916], 1
        mov     word ptr [A3_W_01918], 0
L_2DFE9:
        mov     cx, ax
        mov     ax, word ptr [A3_W_01918]
        mov     bx, 0ah
        mul     bx
        or      dx, dx
        je      br_2EE2D
        mov     ax, 0
br_2EE2D:
        add     ax, cx
        mov     bx, 2000h
        cmp     byte ptr [A3_B_01917], 0
        je      br_2EE35
        inc     bx
br_2EE35:
        cmp     ax, bx
        jb      L_2E00D
        mov     ax, cx
L_2E00D:
        mov     word ptr [A3_W_01918], ax
        KEY_DOWN        20h, (APP3_BASE+L_2EE67-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+far_2E5D2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_DOWN        19h, EP_L_2DD1F_OFF, APP3_SEG
        KEY_DOWN        1ah, (APP3_BASE+L_2E5FA-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2EE67:
        db      0b1h
        pusha
        dec     cl
        mov     ch, byte ptr [A3_B_01910]
        dec     ch
        mov     al, 1fh
        mov     ah, 9
        mov     bl, 14h
        int     90h
        add     ch, 9
        mov     ah, 1
        mov     bl, 0eh
        int     90h
        mov     cl, 60h
        mov     ch, byte ptr [A3_B_01910]
        mov     al, 2bh
        cmp     byte ptr [A3_B_01917], 0
        je      br_2EE93
        mov     al, 2dh
br_2EE93:
        mov     bl, 4
        int     90h
        endif
        add     cl, 6
        mov     ax, word ptr [A3_W_01918]
        mov     bh, 4
        mov     bl, 8
        int     90h
        retf
far_2E5D2:
        mov     byte ptr [A3_B_01916], 0
        push    cs
        call    isr_2D74F
        cmp     byte ptr [A3_B_01917], 0
        jne     br_2EEC7
        mov     ax, word ptr [A3_W_01918]
        add     ax, 2000h
        les     di, [A3_FP_STEP_EVENT]
        shl     ax, 1
        shr     al, 1
        mov     word ptr es:[di+5], ax
        retf
br_2EEC7:
        mov     ax, 2000h
        sub     ax, word ptr [A3_W_01918]
        les     di, [A3_FP_STEP_EVENT]
        shl     ax, 1
        shr     al, 1
        mov     word ptr es:[di+5], ax
        retf
br_2EEDB:
        mov     ax, es
        mov     bx, di
        shr     bx, 4
        add     ax, bx
        mov     es, ax
        and     di, 8
        add     di, 8
        mov     ax, word ptr es:[di+1]
        cmp     ax, 47h
        jne     br_2EF03
        mov     ax, word ptr es:[di+3]
        cmp     ax, 4544h
        jne     br_2EF03
        call    fn_280CB
        jne     br_2EF20
br_2EF03:
        mov     word ptr [A3_W_STEP_CURSOR_FN], cb_2E31E-APP3_CSBASE
        KEY_WHEEL       (APP3_BASE+L_2E653-APP3_SEG*16), APP3_SEG
        KEY_DOWN        17h, EP_L_2EFA2_OFF, EP_L_2EFA2_SEG
        KEY_DOWN        18h, EP_L_2EF68_OFF, EP_L_2EF68_SEG
        db      0cbh
br_2EF20:
        callf   [A3_FP_01950]
        retf
L_2E653:
        db      50h, 51h, 0c4h, 3eh, 20h, 19h, 83h, 0c7h, 08h, 0a1h, 58h, 19h, 03h, 06h, 5ah, 19h
        add     di, ax
        jae     br_2EF41
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_2EF41:
        pop     cx
        pop     ax
        cmp     byte ptr es:[di], 0f0h
        jne     br_2EF4A
        retf
br_2EF4A:
        cmp     byte ptr es:[di], 0f7h
        jne     br_2EF51
        retf
br_2EF51:
        add     al, byte ptr es:[di]
        jae     br_2EF58
        mov     al, 7fh
br_2EF58:
        cmp     al, 7fh
        jb      br_2EF5E
        mov     al, 7fh
br_2EF5E:
        sub     al, cl
        jae     br_2EF64
        mov     al, 0
br_2EF64:
        mov     byte ptr es:[di], al
        retf
L_2EF68:
        int     0a3h
        les     di, [A3_FP_STEP_EVENT]
        mov     cx, word ptr es:[di+5]
        cmp     byte ptr es:[di+7], 0
        je      br_2EF7C
        mov     cx, 0ffffh
br_2EF7C:
        cmp     word ptr [A3_W_0195A], 0bh
        je      br_2EF93
        mov     bx, word ptr [A3_W_0195A]
        inc     bl
        cmp     bx, cx
        jne     br_2EF8E
        retf
br_2EF8E:
        inc     word ptr [A3_W_0195A]
        retf
br_2EF93:
        sub     cx, 0ch
        cmp     cx, word ptr [A3_W_01958]
        jne     br_2EF9D
        retf
br_2EF9D:
        inc     word ptr [A3_W_01958]
        retf
L_2EFA2:
        int     0a3h
        cmp     word ptr [A3_W_0195A], 0
        je      br_2EFB0
        dec     word ptr [A3_W_0195A]
        retf
br_2EFB0:
        cmp     word ptr [A3_W_01958], 0
        jne     L_2EFB8
        retf
L_2EFB8:
        dec     word ptr [A3_W_01958]
        retf
L_2EFBD:
        mov     word ptr [A3_FP_01950], L_2EFBD-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E3AF-APP3_CSBASE
        les     di, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[di+0dh]
        and     al, 7fh
        mov     bx, 212fh
        xlat
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3
        mov     di, intcb_2EFF6-APP3_CSBASE
        int     7fh
        KEY_DOWN        17h, EP_FAR_2DCB9_OFF, EP_FAR_2DCB9_SEG
        KEY_DOWN        18h, (APP3_BASE+L_2F003-APP3_SEG*16), APP3_SEG
        retf
intcb_2EFF6:
        les     di, [A3_FP_STEP_EVENT]
        mov     bx, 212bh
        xlat
        mov     byte ptr es:[di+0dh], al
        retf
L_2F003:
        mov     word ptr [A3_FP_01950], L_2F003-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2D58C_107-APP3_CSBASE
        les     di, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[di+0eh]
        and     al, 7fh
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3fh
        mov     di, A3_W_08888
        int     7fh
        KEY_DOWN        17h, EP_L_2EFBD_OFF, APP3_SEG
        KEY_DOWN        18h, (APP3_BASE+L_2E76F-APP3_SEG*16), APP3_SEG
        retf
d_a3_w_08888:
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+0eh], al
        retf
L_2E76F:
        mov     word ptr [A3_FP_01950], L_2E76F-APP3_CSBASE
        mov     word ptr [A3_W_STEP_CURSOR_FN], stepcur_2E3C5-APP3_CSBASE
        les     di, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[di+0fh]
        and     al, 7fh
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 64h
        mov     di, intcb_2F076-APP3_CSBASE
        int     7fh
        KEY_DOWN        17h, (APP3_BASE+L_2F003-APP3_SEG*16), APP3_SEG
        KEY_DOWN        18h, 0000h, 0000h
        db      0cbh
intcb_2F076:
        les     di, [A3_FP_STEP_EVENT]
        mov     byte ptr es:[di+0fh], al
        retf
L_2F07F:
        KEY_DOWN        20h, (APP3_BASE+L_2E7CF-APP3_SEG*16), APP3_SEG
        mov     cx, ds
        mov     si, 717h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 6
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_UP          10h, (APP3_BASE+isr_2D74F-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2E7CF:
        DISP_WIN        4dh, 14h, 64h, 15h, ""
        db      00h
        DISP_TEXT       57h, 1bh, "Value:"
        mov     dx, ds
        DISP_TEXT_IDX   7bh, 1bh, 00717h, 00f31h
        DISP_CURSOR     7bh, 1bh, 2bh
        int     0ach
        retf
L_2E7FC:
        cmp     byte ptr [A3_B_01966], 0
        jne     br_2F0D9
        call    fn_2F0DD
        retf
br_2F0D9:
        call    fn_2F5A1
        retf
fn_2F0DD:
        call    fn_2FCAD
        jae     br_2F0E3
        ret
br_2F0E3:
        int     0bbh
        jae     br_2F0E8
        ret
br_2F0E8:
        int     0a4h
        mov     word ptr [A3_W_01926], L_2E8D5-APP3_CSBASE
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        KEY_DOWN        20h, EP_L_2E868_OFF, APP3_SEG
        else
        KEY_DOWN        20h, (APP3_BASE+L_2F13A-APP3_SEG*16), APP3_SEG
        endif
        mov     cx, ds
        mov     si, 1911h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_DOWN        18h, (APP3_BASE+L_2E8E7-APP3_SEG*16), APP3_SEG
        KEY_DOWN        13h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2E921-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_DOWN        26h, EP_FAR_2D7EF_OFF, APP3_SEG
        KEY_DOWN        27h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        db      0c3h
L_2F13A:
        DISP_WIN_NARROW "Insert Event"
        DISP_TEXT       25h, 1ch, "Type:"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        db      8ch, 0dah
        DISP_TEXT_IDX   43h, 1ch, 01911h, 02142h
        DISP_TEXT       9dh, 1ch, "       "
        db      80h, 3eh, 11h
        sbb     word ptr [A3_W_01575], ax
        DISP_TEXT       0afh, 1ch, "Byte"
        db      0a0h, 12h, 19h
        sub     ah, ah
        DISP_NUM        9dh, 1ch, 03h
        call    word ptr [A3_W_01926]
        retf
L_2E8D5:
        mov     cl, 43h
        mov     ch, 1ch
        mov     al, 55h
        int     0b0h
        ret
cb_2F1B0:
        DISP_CURSOR     9dh, 1ch, 13h
        ret
L_2E8E7:
        cmp     byte ptr [A3_B_01911], 6
        je      br_2F1C1
        retf
br_2F1C1:
        mov     word ptr [A3_W_01926], cb_2F1B0-APP3_CSBASE
        mov     al, byte ptr [A3_B_01912]
        mov     ah, 0
        mov     bl, 0
        mov     bh, 0
        mov     dx, 80h
        mov     di, A3_W_08A39
        int     7fh
        KEY_DOWN        18h, 0000h, 0000h
        KEY_DOWN        17h, (APP3_BASE+L_2E7FC-APP3_SEG*16), APP3_SEG
        retf
d_a3_w_08a39:
        cmp     al, 2
        jae     br_2F1EF
        mov     al, 2
br_2F1EF:
        mov     byte ptr [A3_B_01912], al
        retf
L_2E921:
        call    fn_2FCBE
        jae     loop_2F1F9
        retf
loop_2F1F9:
        push    cs
        call    far_2DD8C
        pushf
        call    fn_2E410
        popf
        jae     loop_2F1F9
        call    fn_28082
        cmp     byte ptr [A3_B_01911], 6
        je      br_2F24D
        cmp     byte ptr [A3_B_01911], 7
        jne     br_2F217
        jmp     br_2F255
br_2F217:
        call    fn_2F375
        mov     al, 8
        mov     ah, byte ptr [A3_B_01911]
        mul     ah
        add     ax, 21b3h
        mov     si, ax
        mov     cx, 8
        push    di
        rep movsb
        pop     di
        mov     ax, word ptr [A3_W_00712]
        mov     byte ptr es:[di+3], al
        int     85h
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], dl
        cmp     byte ptr [A3_B_01911], 0
        jne     br_2F248
        call    fn_2F25D
br_2F248:
        push    cs
        call    isr_2D74F
        retf
br_2F24D:
        call    fn_2F269
        push    cs
        call    isr_2D74F
        retf
br_2F255:
        call    fn_2F30F
        push    cs
        call    isr_2D74F
        retf
fn_2F25D:
        mov     al, byte ptr [A3_B_00717]
        mov     bx, 21f3h
        xlat
        mov     byte ptr es:[di+5], al
        ret
fn_2F269:
        call    fn_2F375
        call    fn_2F375
        mov     cl, byte ptr [A3_B_01912]
loop_2F273:
        push    cx
        call    fn_2F375
        pop     cx
        sub     cl, 8
        ja      loop_2F273
        int     85h
        mov     dh, byte ptr [A3_W_00712]
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], dx
        mov     byte ptr es:[di+4], 0f0h
        mov     cl, byte ptr [A3_B_01912]
        mov     byte ptr es:[di+5], cl
        mov     word ptr es:[di+6], 0
        call    fn_2F300
        mov     byte ptr es:[di], 0f0h
        mov     cl, byte ptr [A3_B_01912]
        mov     ch, 0
        inc     di
        sub     cl, 2
        je      br_2F2C4
        mov     al, 0
tgt_2F2B2:
        mov     byte ptr es:[di], al
        add     di, 1
        jne     L_2F2C2
        mov     bx, es
        add     bx, 1000h
        mov     es, bx
L_2F2C2:
        loop    tgt_2F2B2
br_2F2C4:
        mov     byte ptr es:[di], 0f7h
loop_2F2C8:
        inc     di
        test    di, 7
        je      br_2F2D6
        mov     al, 0
        mov     byte ptr es:[di], al
        jmp     loop_2F2C8
br_2F2D6:
        or      di, di
        jne     loop_2F2E2
        mov     bx, es
        add     bx, 1000h
        mov     es, bx
loop_2F2E2:
        int     85h
        mov     dh, byte ptr [A3_W_00712]
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], dx
        mov     byte ptr es:[di+4], 0f8h
        mov     byte ptr es:[di+5], 0
        mov     word ptr es:[di+6], 0
        ret
fn_2F300:
        add     di, 8
        jb      br_2F306
        ret
br_2F306:
        mov     bx, es
        add     bx, 1000h
        mov     es, bx
        ret
fn_2F30F:
        call    fn_2F375
        call    fn_2F375
        call    fn_2F375
        call    fn_2F375
        int     85h
        mov     dh, byte ptr [A3_W_00712]
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], dx
        mov     byte ptr es:[di+4], 0f0h
        mov     byte ptr es:[di+5], 9
        mov     word ptr es:[di+6], 0
        call    fn_2F300
        mov     byte ptr es:[di], 0f0h
        mov     word ptr es:[di+1], 47h
        mov     word ptr es:[di+3], 4544h
        mov     word ptr es:[di+5], 1
        mov     byte ptr es:[di+7], 0
        call    fn_2F300
        mov     byte ptr es:[di], 0f7h
        sub     ax, ax
        mov     byte ptr es:[di+1], al
        mov     word ptr es:[di+2], ax
        mov     word ptr es:[di+4], ax
        mov     word ptr es:[di+6], ax
        call    fn_2F300
        jmp     loop_2F2E2
fn_2F375:
        int     82h
        ret
L_2EAA6:
        call    fn_2F3CE
        cmp     byte ptr [A3_B_01966], 0
        jne     br_2F3CA
        les     si, [A3_FP_STEP_EVENT]
        mov     ax, es
        or      ax, si
        jne     br_2F38D
        retf
br_2F38D:
        mov     al, byte ptr es:[si+4]
        push    ds
        mov     cx, es
        mov     ds, cx
        mov     cx, 0e2a0h
        mov     es, cx
        mov     di, 0
        mov     cx, 4
        rep movsw
        cmp     al, 0f0h
        jne     br_2F3C0
loop_2F3A7:
        cmp     si, 0
        jne     br_2F3B4
        mov     cx, ds
        add     cx, 1000h
        mov     ds, cx
br_2F3B4:
        mov     al, byte ptr [si+4]
        mov     cx, 4
        rep movsw
        cmp     al, 0f8h
        jne     loop_2F3A7
br_2F3C0:
        mov     ax, 0ffffh
        mov     cx, 4
        rep stosw
        pop     ds
        retf
br_2F3CA:
        call    fn_2E50C
        retf
fn_2F3CE:
        mov     ax, 0e2a0h
        mov     es, ax
        mov     di, 0
        mov     ax, 0ffffh
        mov     cx, 4
        rep stosw
        ret
L_2F3DF:
        cmp     byte ptr [A3_B_01966], 0
        je      br_2F3E7
        retf
br_2F3E7:
        mov     word ptr [A3_W_0195C], 0
        mov     ax, 0e2a0h
        mov     es, ax
        cmp     byte ptr es:[4], 0ffh
        jne     L_2EB29
        retf
L_2EB29:
        DISP_WIN_WIDE   "Paste Event"
        DISP_TEXT       30h, 14h, "Pressing DO IT will paste"
        DISP_TEXT       30h, 1eh, "events from clipboard."
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        int     0a4h
        KEY_DOWN        26h, EP_FAR_2D7EF_OFF, APP3_SEG
        KEY_DOWN        27h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_DOWN        13h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        if      FW_VERSION >= 112
        KEY_DOWN        14h, (APP3_BASE+L_2F480-APP3_SEG*16), APP3_SEG
        elseif  FW_VERSION >= 110
        KEY_DOWN        14h, EP_L_2EBAE_OFF, APP3_SEG
        else
        KEY_DOWN        14h, (APP3_BASE+L_2F480-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2F480:
        push    cs
        call    isr_2D74F
        call    fn_2FCBE
        jae     tgt_2F488
        endif
        retf
        if      FW_VERSION = 114
L_2F480:
        db      0eh, 0e8h, 0cbh
        elseif  FW_VERSION >= 110
L_2F480:
        db      0eh
        call    isr_2D74F
        call    fn_2FCBE
        db      73h
        endif
tgt_2F488:
        if      FW_VERSION = 114
        db      0e2h, 0e8h
        aaa
        or      byte ptr [bp+di+1], dh
        retf
        elseif  FW_VERSION >= 110
        db      01h, 0cbh
        endif
        mov     si, word ptr [A3_W_0195C]
        mov     cx, 0e2a0h
        mov     es, cx
        mov     cx, 0
loop_2F496:
        inc     cx
        add     si, 8
        cmp     byte ptr es:[si+4], 0ffh
        jne     loop_2F496
L_2F4A1:
        push    cx
        call    fn_2F375
        pop     cx
        loop    L_2F4A1
        push    di
        push    es
        int     85h
        pop     es
        pop     di
        mov     si, 0
        push    ds
        mov     cx, 0e2a0h
        mov     ds, cx
loop_2F4B7:
        stosw
        push    ax
        mov     ax, word ptr [si+2]
        and     al, 0f0h
        or      al, dl
        stosw
        pop     ax
        mov     bl, byte ptr [si+4]
        add     si, 4
        mov     cx, 2
        rep movsw
        cmp     di, 0
        jne     br_2F4DA
        mov     cx, es
        add     cx, 1000h
        mov     es, cx
br_2F4DA:
        cmp     bl, 0f0h
        jne     br_2F515
loop_2F4DF:
        mov     bl, byte ptr [si+4]
        mov     cx, 4
        rep movsw
        cmp     bl, 0f8h
        jne     br_2F503
        push    bx
        push    si
        push    di
        push    es
        int     85h
        pop     es
        pop     di
        pop     si
        pop     bx
        sub     di, 8
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], dx
        add     di, 8
br_2F503:
        cmp     di, 0
        jne     br_2F510
        mov     cx, es
        add     cx, 1000h
        mov     es, cx
br_2F510:
        cmp     bl, 0f8h
        jne     loop_2F4DF
br_2F515:
        cmp     byte ptr [si+4], 0ffh
        jne     loop_2F4B7
        pop     ds
        retf
L_2EC4B:
        les     si, [A3_FP_STEP_EVENT]
        int     78h
        cmp     byte ptr [A3_B_01966], 0
        je      br_2F52D
        call    fn_2F533
br_2F52D:
        mov     byte ptr [A3_B_01966], 0
        retf
fn_2F533:
        mov     ax, word ptr [A3_W_0195E]
        mov     bx, word ptr [A3_W_01960]
        cmp     ax, bx
        jb      br_2F545
        mov     word ptr [A3_W_0195E], bx
        mov     word ptr [A3_W_01960], ax
br_2F545:
        int     83h
        mov     di, 0
        mov     bx, 0
loop_2F54D:
        mov     al, byte ptr es:[si+4]
        cmp     al, 0ffh
        je      br_2F580
        push    bx
        push    di
        call    fn_2FCC4
        call    fn_2FCF6
        pop     di
        pop     bx
        jne     br_2F580
        call    fn_2E462
        jb      br_2F579
        cmp     bx, word ptr [A3_W_0195E]
        jb      L_2EF98
        cmp     bx, word ptr [A3_W_01960]
        ja      br_2F580
        push    si
        push    bx
        int     78h
        pop     bx
        pop     si
L_2EF98:
        inc     bx
br_2F579:
        push    bx
        call    fn_2FCD4
        pop     bx
        jmp     loop_2F54D
br_2F580:
        mov     word ptr [A3_W_0193E], 0
        ret
L_2ECB5:
        cmp     byte ptr [A3_B_01966], 0
        jne     br_2F597
        les     si, [A3_FP_STEP_EVENT]
        mov     bl, 19h
        int     87h
        retf
br_2F597:
        mov     byte ptr [A3_B_01966], 0
        push    cs
        call    isr_2D74F
        retf
fn_2F5A1:
        les     si, [A3_FP_STEP_EVENT]
        mov     ax, es
        or      ax, si
        jne     br_2F5AC
        ret
br_2F5AC:
        cmp     byte ptr es:[si+4], 0f0h
        jne     br_2F5B4
        ret
br_2F5B4:
        mov     al, byte ptr [A3_B_01967]
        cmp     al, 0
        jne     br_2F5BC
        ret
br_2F5BC:
        cmp     al, 1
        jne     br_2F5C2
        jmp     SHORT br_2F5F4
br_2F5C2:
        cmp     al, 2
        jne     br_2F5C9
        jmp     br_2F6E4
br_2F5C9:
        cmp     al, 3
        jne     br_2F5D0
        jmp     br_2F89F
br_2F5D0:
        cmp     al, 4
        jne     br_2F5D7
        jmp     br_2F759
br_2F5D7:
        cmp     al, 5
        jne     br_2F5DE
        jmp     br_2F9FB
br_2F5DE:
        cmp     al, 6
        jne     br_2F5E5
        jmp     NEAR L_2F4C0
br_2F5E5:
        cmp     al, 7
        jne     br_2F5EC
        jmp     NEAR L_2F284
br_2F5EC:
        cmp     al, 8
        jne     L_2ED21
        jmp     br_2FBF2
L_2ED21:
        ret
br_2F5F4:
        call    fn_2F62C
        KEY_DOWN        20h, (APP3_BASE+L_2ED85-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, EP_L_2F6B5_OFF, APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_2ED81-APP3_SEG*16), APP3_SEG
        db      0c4h, 36h
        and     byte ptr [bx+di], bl
        mov     al, byte ptr es:[si+4]
        mov     byte ptr [A3_B_STEP_CHANGE_NOTE], al
        FIELD_ENTRY     ds, 1968h, 0, 0, 7fh, field_cb_none-APP3_CSBASE
        ret
fn_2F62C:
        int     0a4h
        KEY_DOWN        26h, EP_FAR_2D7EF_OFF, APP3_SEG
        KEY_DOWN        27h, EP_ISR_2D74F_OFF, EP_ISR_2D74F_SEG
        KEY_DOWN        13h, EP_FAR_2F681_OFF, EP_FAR_2F681_SEG
        KEY_DOWN        16h, EP_FAR_2F681_OFF, EP_FAR_2F681_SEG
        mov     al, 1
        int     79h
        ret
L_2ED81:
        mov     byte ptr [A3_B_STEP_CHANGE_NOTE], al
        retf
L_2ED85:
        call    far_2F68B
        DISP_TEXT       3ch, 1ah, "Change note to:"
        mov     al, byte ptr [A3_B_STEP_CHANGE_NOTE]
        DISP_NOTE       96h, 1ah
        mov     cl, 96h
        mov     ch, 1ah
        mov     al, 31h
        int     0b0h
        retf
far_2F681:
        mov     byte ptr [A3_B_01966], 0
        push    cs
        call    isr_2D74F
        retf
far_2F68B:
        DISP_WIN_WIDE   "Edit Multiple"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        db      0c3h
L_2F6B5:
        mov     word ptr [A3_W_01964], 0
        int     83h
loop_2F6BD:
        call    fn_2FC8E
        jb      br_2F6DF
        mov     ax, word ptr [A3_W_01964]
        call    fn_2DE07
        jae     br_2F6D6
        and     byte ptr es:[si+4], 80h
        mov     al, byte ptr [A3_B_STEP_CHANGE_NOTE]
        or      byte ptr es:[si+4], al
br_2F6D6:
        call    fn_2FCD4
        inc     word ptr [A3_W_01964]
        jmp     loop_2F6BD
br_2F6DF:
        push    cs
        call    far_2F681
        retf
br_2F6E4:
        call    fn_2F62C
        KEY_DOWN        20h, (APP3_BASE+L_2EE5A-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, EP_L_2F6B5_OFF, APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_2ED81-APP3_SEG*16), APP3_SEG
        db      0c4h, 36h
        and     byte ptr [bx+di], bl
        mov     al, byte ptr es:[si+4]
        mov     byte ptr [A3_B_STEP_CHANGE_NOTE], al
        mov     cx, ds
        mov     si, 1968h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2F71C-APP3_CSBASE
        int     7eh
        ret
intcb_2F71C:
        cmp     al, 23h
        jae     br_2F722
        mov     al, 23h
br_2F722:
        cmp     al, 63h
        jb      br_2F728
        mov     al, 62h
br_2F728:
        mov     byte ptr [A3_B_STEP_CHANGE_NOTE], al
        retf
L_2EE5A:
        call    far_2F68B
        DISP_TEXT       3ch, 1ah, "Change note to:"
        mov     al, byte ptr [A3_B_STEP_CHANGE_NOTE]
        int     7bh
        DISP_NOTE_CHAN  96h, 1ah
        db      0b1h
        xchg    si, ax
        mov     ch, 1ah
        mov     al, 25h
        int     0b0h
        retf
        db      0cbh
br_2F759:
        call    fn_2F62C
        KEY_DOWN        14h, (APP3_BASE+L_2EF70-APP3_SEG*16), APP3_SEG
        les     si, [A3_FP_STEP_EVENT]
        mov     ah, byte ptr es:[si+2]
        shr     ah, 4
        mov     al, byte ptr es:[si+3]
        shl     ax, 2
        mov     al, byte ptr es:[si+5]
        mov     word ptr [A3_W_01962], ax
        push    cs
        call    far_2F786
        push    cs
        call    far_2F7F2
        ret
far_2F786:
        mov     cx, ds
        mov     si, 1969h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3
        mov     di, P_9042
        int     7dh
        KEY_DOWN        19h, 0000h, 0000h
        if      FW_VERSION >= 112
        KEY_DOWN        1ah, (APP3_BASE+L_2E98E-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2EEDE-APP3_SEG*16), APP3_SEG
        elseif  FW_VERSION >= 110
        KEY_DOWN        1ah, EP_L_2EEEA_OFF, APP3_SEG
        KEY_DOWN        20h, EP_L_2EEDE_OFF, APP3_SEG
        else
        KEY_DOWN        1ah, (APP3_BASE+L_2E98E-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_2EEDE-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2EEDE:
        db      0e8h
        push    si
        add     byte ptr [bx+di-4a88h], dh
        adc     al, 0b0h
        cmp     ax, 0b0cdh
        endif
        retf
        if      FW_VERSION >= 110
L_2EEDE:
        call    far_2F809
        DISP_CURSOR     78h, 14h, 3dh
        retf
        endif
L_2E98E:
        KEY_DOWN        19h, EP_FAR_2F786_OFF, EP_FAR_2F786_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        mov     cx, ds
        mov     si, 1962h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 270fh
        mov     di, P_9042
        int     7eh
        KEY_DOWN        20h, (APP3_BASE+far_2F206-APP3_SEG*16), APP3_SEG
        retf
far_2F206:
        call    far_2F809
        DISP_CURSOR     78h, 1eh, 19h
        retf
far_2F7F2:
        cmp     byte ptr [A3_B_01969], 2
        je      br_2F7FA
        retf
br_2F7FA:
        mov     ax, word ptr [A3_W_01962]
        cmp     ax, 0c8h
        jb      br_2F805
        mov     ax, 0c8h
br_2F805:
        mov     word ptr [A3_W_01962], ax
        retf
far_2F809:
        call    far_2F68B
        DISP_TEXT       3ch, 14h, "Edit type:"
        DISP_TEXT       3ch, 1eh, "    Value:"
        mov     dx, ds
        DISP_TEXT_IDX   78h, 14h, 01969h, 01850h
        mov     ax, word ptr [A3_W_01962]
        DISP_NUM        78h, 1eh, 04h
        db      0c3h
L_2EF70:
        mov     word ptr [A3_W_01964], 0
        int     83h
loop_2F84A:
        call    fn_2FC8E
        jb      br_2F89A
        mov     ax, word ptr [A3_W_01964]
        call    fn_2DE07
        jae     br_2F891
        mov     ah, byte ptr es:[si+2]
        shr     ah, 4
        mov     al, byte ptr es:[si+3]
        shl     ax, 2
        mov     al, byte ptr es:[si+5]
        and     byte ptr es:[si+2], 0fh
        and     byte ptr es:[si+3], 3fh
        mov     dx, word ptr [A3_W_01962]
        mov     cx, 270fh
        call    fn_2F9C2
        mov     byte ptr es:[si+5], al
        mov     al, 0
        shr     ax, 2
        shl     ah, 4
        or      byte ptr es:[si+2], ah
        or      byte ptr es:[si+3], al
br_2F891:
        call    fn_2FCD4
        inc     word ptr [A3_W_01964]
        jmp     loop_2F84A
br_2F89A:
        push    cs
        call    far_2F681
        retf
br_2F89F:
        call    fn_2F62C
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        KEY_DOWN        14h, EP_L_2F0AA_OFF, APP3_SEG
        db      0c4h, 36h
        and     byte ptr [bx+di], bl
        else
        KEY_DOWN        14h, (APP3_BASE+L_2F0AA-APP3_SEG*16), APP3_SEG
        les     si, [A3_FP_STEP_EVENT]
        endif
        mov     al, byte ptr es:[si+6]
        and     al, 7fh
        mov     byte ptr [A3_B_STEP_CHANGE_NOTE], al
        push    cs
        call    far_2F8C0
        push    cs
        call    far_2F92C
        ret
far_2F8C0:
        FIELD_WHEEL     ds, 1969h, 0, 0, 3, far_2F92C-APP3_CSBASE
        KEY_DOWN        19h, 0000h, 0000h
        KEY_DOWN        1ah, EP_L_2F8F6_OFF, APP3_SEG
        if      FW_VERSION >= 112
        KEY_DOWN        20h, (APP3_BASE+L_2F8EA-APP3_SEG*16), APP3_SEG
        retf
L_2F8EA:
        call    far_2F941
        DISP_CURSOR     78h, 14h, 3dh
        else
        if      FW_VERSION >= 110
        KEY_DOWN        20h, EP_L_2F018_OFF, APP3_SEG
        else
        KEY_DOWN        20h, (APP3_BASE+L_2F8EA-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
L_2F8EA:
        db      0e8h
        push    sp
        add     byte ptr [bx+di-4a88h], dh
        adc     al, 0b0h
        cmp     ax, 0b0cdh
        endif
        retf
L_2F8F6:
        KEY_DOWN        19h, EP_FAR_2F8C0_OFF, EP_FAR_2F8C0_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        mov     cx, ds
        mov     si, 1968h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 0c8h
        if      FW_VERSION >= 120
        mov     di, P_917C
        else
        mov     di, far_2F92C-APP3_CSBASE
        endif
        int     7eh
        KEY_DOWN        20h, (APP3_BASE+L_2F920-APP3_SEG*16), APP3_SEG
        retf
L_2F920:
        call    far_2F941
        DISP_CURSOR     78h, 1eh, 13h
        retf
far_2F92C:
        mov     al, byte ptr [A3_B_STEP_CHANGE_NOTE]
        cmp     byte ptr [A3_B_01969], 2
        jne     br_2F937
        retf
br_2F937:
        cmp     al, 7fh
        jb      br_2F93D
        mov     al, 7fh
br_2F93D:
        mov     byte ptr [A3_B_STEP_CHANGE_NOTE], al
        retf
far_2F941:
        call    far_2F68B
        DISP_TEXT       3ch, 14h, "Edit type:"
        DISP_TEXT       3ch, 1eh, "    Value:"
        mov     dx, ds
        DISP_TEXT_IDX   78h, 14h, 01969h, 01850h
        mov     al, byte ptr [A3_B_STEP_CHANGE_NOTE]
        mov     ah, 0
        DISP_NUM        78h, 1eh, 03h
        db      0c3h
L_2F0AA:
        mov     word ptr [A3_W_01964], 0
        int     83h
loop_2F984:
        call    fn_2FC8E
        jb      br_2F9BD
        mov     ax, word ptr [A3_W_01964]
        call    fn_2DE07
        jae     L_2F0E2
        mov     al, byte ptr es:[si+6]
        and     al, 7fh
        and     byte ptr es:[si+6], 80h
        mov     ah, 0
        mov     dl, byte ptr [A3_B_STEP_CHANGE_NOTE]
        mov     dh, 0
        mov     cx, 7fh
        call    fn_2F9C2
        cmp     al, 0
        jne     L_2F0DE
        mov     al, 1
L_2F0DE:
        or      byte ptr es:[si+6], al
L_2F0E2:
        call    fn_2FCD4
        inc     word ptr [A3_W_01964]
        jmp     loop_2F984
br_2F9BD:
        push    cs
        call    far_2F681
        retf
fn_2F9C2:
        cmp     byte ptr [A3_B_01969], 0
        je      br_2F9DA
        cmp     byte ptr [A3_B_01969], 1
        je      br_2F9E4
        cmp     byte ptr [A3_B_01969], 2
        je      br_2F9EC
        mov     ax, dx
        ret
br_2F9DA:
        add     ax, dx
        cmp     ax, cx
        jae     br_2F9E1
        ret
br_2F9E1:
        mov     ax, cx
        ret
br_2F9E4:
        sub     ax, dx
        jb      br_2F9E9
        ret
br_2F9E9:
        sub     ax, ax
        ret
br_2F9EC:
        mul     dx
        mov     bx, 64h
        div     bx
        cmp     ax, cx
        jae     br_2F9F8
        ret
br_2F9F8:
        mov     ax, cx
        ret
br_2F9FB:
        call    fn_2F62C
        KEY_DOWN        20h, (APP3_BASE+L_2F164-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2F191-APP3_SEG*16), APP3_SEG
        les     si, [A3_FP_STEP_EVENT]
        mov     ah, 0
        mov     al, byte ptr es:[si+6]
        shl     ax, 1
        mov     al, byte ptr es:[si+7]
        shl     ax, 1
        mov     byte ptr [A3_B_STEP_CHANGE_NOTE], ah
        mov     cx, ds
        mov     si, 1968h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 3
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        ret
L_2F164:
        call    far_2F68B
        DISP_TEXT       3ch, 1ah, "Variation type:"
        mov     dx, ds
        DISP_TEXT_IDX   96h, 1ah, 01968h, 02135h
        db      0b1h, 96h, 0b5h
        sbb     dh, byte ptr [bx+si-32edh]
        mov     al, 0cbh
L_2F191:
        mov     word ptr [A3_W_01964], 0
        int     83h
loop_2FA6B:
        call    fn_2FC8E
        jb      br_2FA9B
        mov     ax, word ptr [A3_W_01964]
        call    fn_2DE07
        jae     br_2FA92
        and     byte ptr es:[si+6], 7fh
        and     byte ptr es:[si+7], 7fh
        mov     al, byte ptr [A3_B_STEP_CHANGE_NOTE]
        shl     ax, 7
        or      byte ptr es:[si+7], al
        shr     ax, 1
        or      byte ptr es:[si+6], al
br_2FA92:
        call    fn_2FCD4
        inc     word ptr [A3_W_01964]
        jmp     loop_2FA6B
br_2FA9B:
        push    cs
        call    far_2F681
        retf
L_2F4C0:
        call    fn_2F62C
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        KEY_DOWN        20h, EP_L_2F212_OFF, APP3_SEG
        KEY_DOWN        14h, EP_L_2F255_OFF, APP3_SEG
        db      0c4h, 36h
        and     byte ptr [bx+di], bl
        else
        KEY_DOWN        20h, (APP3_BASE+L_2F212-APP3_SEG*16), APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+L_2F255-APP3_SEG*16), APP3_SEG
        les     si, [A3_FP_STEP_EVENT]
        endif
        mov     al, byte ptr es:[si+7]
        and     al, 7fh
        mov     byte ptr [A3_B_STEP_CHANGE_NOTE], al
        mov     ah, 0
        mov     al, byte ptr es:[si+6]
        shl     ax, 1
        mov     al, byte ptr es:[si+7]
        shl     ax, 1
        mov     byte ptr [A3_B_01969], ah
        mov     cx, ds
        mov     si, 1968h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 7fh
        mov     di, intcb_2FB14-APP3_CSBASE
        int     7eh
        ret
L_2F212:
        call    far_2F68B
        DISP_TEXT       36h, 1ah, "Variation value:"
        mov     ah, byte ptr [A3_B_01969]
        mov     al, byte ptr [A3_B_STEP_CHANGE_NOTE]
        mov     ch, 1ah
        mov     cl, 96h
        call    step_draw_variation_value
        DISP_CURSOR     96h, 1ah, 19h
        retf
intcb_2FB14:
        cmp     byte ptr [A3_B_01969], 0
        je      br_2FB23
        jmp     br_2FB23
        db      3ch, 64h
        jb      br_2FB23
        db      0b0h, 64h
br_2FB23:
        mov     byte ptr [A3_B_STEP_CHANGE_NOTE], al
        retf
L_2F255:
        mov     word ptr [A3_W_01964], 0
        int     83h
loop_2FB2F:
        call    fn_2FC8E
        jb      br_2FB51
        mov     ax, word ptr [A3_W_01964]
        call    fn_2DE07
        jae     br_2FB48
        and     byte ptr es:[si+7], 80h
        mov     al, byte ptr [A3_B_STEP_CHANGE_NOTE]
        or      byte ptr es:[si+7], al
br_2FB48:
        call    fn_2FCD4
        inc     word ptr [A3_W_01964]
        jmp     loop_2FB2F
br_2FB51:
        push    cs
        call    far_2F681
        retf
L_2F284:
        call    fn_2F62C
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        KEY_DOWN        14h, EP_L_2F2E0_OFF, APP3_SEG
        else
        KEY_DOWN        14h, (APP3_BASE+L_2FBB2-APP3_SEG*16), APP3_SEG
        endif
        les     si, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[si+5]
        and     al, 7fh
        mov     byte ptr [A3_B_STEP_CHANGE_NOTE], al
        push    cs
        call    far_2FB77
        push    cs
        call    far_2F92C
        ret
far_2FB77:
        push    cs
        call    far_2F8C0
        KEY_DOWN        19h, 0000h, 0000h
        KEY_DOWN        1ah, (APP3_BASE+L_2F2BA-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2F2BA:
        if      FW_VERSION >= 110
        push    cs
        else
        db      0eh
        endif
        call    L_2F8F6
        KEY_DOWN        19h, EP_FAR_2FB77_OFF, EP_FAR_2FB77_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        db      8ch, 0d9h, 0beh
        push    0b319h
        add     byte ptr [bx-4600h], dh
        if      FW_VERSION >= 112
        enter   -4100h, 7ch
        elseif  FW_VERSION >= 111
        enter   -4100h, 7ah
        elseif  FW_VERSION >= 110
        db      0c8h, 00h, 0bfh, 6ch
        else
        enter   -4100h, 3eh
        endif
        xchg    cx, ax
        int     7eh
        retf
L_2FBB2:
        if      FW_VERSION >= 120
        db      0c7h, 06h, 64h, 19h, 00h, 00h, 0cdh
        db      83h
L_2FBBA:
        db      0e8h, 0d1h
        add     byte ptr [bp+si+2eh], dh
        else
        mov     word ptr [A3_W_01964], 0
        int     83h
        call    fn_2FC8E
        jb      tgt_2FBED
        endif
        mov     ax, word ptr [A3_W_01964]
        call    fn_2DE07
        jae     br_2FBE4
        mov     al, byte ptr es:[si+5]
        and     al, 7fh
        and     byte ptr es:[si+5], 80h
        mov     ah, 0
        mov     dl, byte ptr [A3_B_STEP_CHANGE_NOTE]
        mov     dh, 0
        mov     cx, 7fh
        call    fn_2F9C2
        or      byte ptr es:[si+5], al
br_2FBE4:
        call    fn_2FCD4
        inc     word ptr [A3_W_01964]
        if      FW_VERSION >= 120
        jmp     SHORT L_2FBBA
        else
        db      0ebh, 0cdh
        endif
tgt_2FBED:
        push    cs
        call    far_2F681
        retf
br_2FBF2:
        call    fn_2F62C
        KEY_DOWN        14h, (APP3_BASE+L_2F37C-APP3_SEG*16), APP3_SEG
        les     si, [A3_FP_STEP_EVENT]
        mov     al, byte ptr es:[si+6]
        and     al, 7fh
        mov     byte ptr [A3_B_STEP_CHANGE_NOTE], al
        push    cs
        call    far_2FC13
        push    cs
        call    far_2F92C
        ret
far_2FC13:
        push    cs
        call    far_2F8C0
        KEY_DOWN        19h, 0000h, 0000h
        KEY_DOWN        1ah, (APP3_BASE+L_2F356-APP3_SEG*16), APP3_SEG
        db      0cbh
L_2F356:
        if      FW_VERSION >= 110
        push    cs
        else
        db      0eh
        endif
        call    L_2F8F6
        KEY_DOWN        19h, EP_FAR_2FC13_OFF, EP_FAR_2FC13_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        db      8ch, 0d9h, 0beh
        push    0b319h
        add     byte ptr [bx-4600h], dh
        if      FW_VERSION >= 112
        enter   -4100h, 7ch
        elseif  FW_VERSION >= 111
        enter   -4100h, 7ah
        elseif  FW_VERSION >= 110
        db      0c8h, 00h, 0bfh, 6ch
        else
        enter   -4100h, 3eh
        endif
        xchg    cx, ax
        int     7eh
        retf
L_2F37C:
        mov     word ptr [A3_W_01964], 0
        int     83h
loop_2FC56:
        call    fn_2FC8E
        jb      br_2FC89
        mov     ax, word ptr [A3_W_01964]
        call    fn_2DE07
        jae     br_2FC80
        mov     al, byte ptr es:[si+6]
        and     al, 7fh
        and     byte ptr es:[si+6], 80h
        mov     ah, 0
        mov     dl, byte ptr [A3_B_STEP_CHANGE_NOTE]
        mov     dh, 0
        mov     cx, 7fh
        call    fn_2F9C2
        or      byte ptr es:[si+6], al
br_2FC80:
        call    fn_2FCD4
        inc     word ptr [A3_W_01964]
        jmp     loop_2FC56
br_2FC89:
        push    cs
        call    far_2F681
        retf
fn_2FC8E:
        mov     al, byte ptr es:[si+4]
        cmp     al, 0ffh
        stc
        jne     br_2FC98
        ret
br_2FC98:
        call    fn_2FCC4
        call    fn_2FCF6
        stc
        je      br_2FCA2
        ret
br_2FCA2:
        call    fn_2E462
        jb      br_2FCA8
        ret
br_2FCA8:
        call    fn_2FCD4
        jmp     fn_2FC8E
fn_2FCAD:
        int     86h
        mov     es, word ptr [A3_W_00F10]
        cmp     ax, word ptr es:[A3_W_0001A]
        stc
        jne     br_2FCBC
        ret
br_2FCBC:
        clc
        ret
fn_2FCBE:
        pusha
        call    fn_302FE
        popa
        ret
fn_2FCC4:
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 3f0fh
        mov     bh, byte ptr es:[si+4]
        ret
fn_2FCD4:
        call    fn_2FCC4
        cmp     bh, 0f0h
        jne     fn_2FCE7
loop_2FCDC:
        call    fn_2FCE7
        call    fn_2FCC4
        cmp     bh, 0f8h
        jne     loop_2FCDC
fn_2FCE7:
        add     si, 8
        jb      br_2FCED
        ret
br_2FCED:
        mov     cx, es
        add     cx, 1000h
        mov     es, cx
        ret
fn_2FCF6:
        push    ax
        push    dx
        int     85h
        mov     bx, ax
        mov     cl, dl
        pop     dx
        pop     ax
        sub     ax, bx
        sbb     dl, cl
        jb      br_2FD0A
        or      al, ah
        or      al, dl
br_2FD0A:
        ret
fn_2FD0B:
        mov     bl, 22h
        int     87h
        mov     ax, ds
        mov     es, ax
        mov     cx, 80h
        mov     di, 196bh
        mov     al, 0
        rep stosb
loop_2FD1D:
        int     83h
loop_2FD1F:
        call    fn_2FCC4
        cmp     bh, 0ffh
        jne     br_2FD28
        ret
br_2FD28:
        call    fn_2FCF6
        je      br_2FD2E
        ret
br_2FD2E:
        call    fn_2FCC4
        mov     dh, byte ptr [A3_W_00712]
        jne     loop_2FD3C
        test    bh, 80h
        je      br_2FD41
loop_2FD3C:
        call    fn_2FCD4
        jmp     loop_2FD1F
br_2FD41:
        mov     bl, bh
        mov     bh, 0
        cmp     byte ptr [bx+A3_TBL_0196B], 0
        jne     loop_2FD3C
        mov     byte ptr [bx+A3_TBL_0196B], 1
        mov     byte ptr [A3_B_0196A], bl
loop_2FD55:
        call    fn_2FCD4
        call    fn_2FCC4
        cmp     bh, 0ffh
        je      loop_2FD1D
        call    fn_2FCF6
        jne     loop_2FD1D
        call    fn_2FCC4
        mov     dh, byte ptr [A3_W_00712]
        jne     loop_2FD55
        mov     al, byte ptr [A3_B_0196A]
        cmp     al, byte ptr es:[si+4]
        jne     loop_2FD55
        push    es
        push    si
        int     78h
        pop     si
        pop     es
        jmp     loop_2FD55
        db      00h
L_2FD80:
        pusha
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        call    L_2FD8D
        pop     ds
        popa
        retf
L_2FD8D:
        KEY_LOCATE      (APP3_BASE+L_300D7-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2FEBE-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2FAEF-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2FAAD-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2FA72-APP3_SEG*16), APP3_SEG
        KEY_TRANSPORT   (APP3_BASE+FAR_30161-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_3021E-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2F500-APP3_SEG*16), APP3_SEG, (APP3_BASE+SEQ_PLAY_START-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_2FEC1-APP3_SEG*16), APP3_SEG
        KEY_DOWN        3ah, (APP3_BASE+L_2F9EC-APP3_SEG*16), APP3_SEG
        KEY_UP          35h, 0000h, 0000h
        KEY_UP          36h, 0000h, 0000h
        db      0c3h
L_2F500:
        int     0afh
        retf
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        KEY_LOCATE      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_TRANSPORT   EP_X_2FE09_OFF, EP_X_2FE09_SEG, EP_L_2FE15_OFF, EP_L_2FE15_SEG, EP_L_2FE21_OFF, EP_L_2FE21_SEG, EP_X_2FE29_OFF, EP_X_2FE29_SEG, EP_L_2FE35_OFF, EP_L_2FE35_SEG
        pop     ds
        iret
X_2FE09:
        int     70h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        push    cs
        call    far_30161
        retf
L_2FE15:
        int     70h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        push    cs
        call    far_3021E
        retf
L_2FE21:
        int     70h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
X_2FE29:
        int     70h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        push    cs
        call    seq_play_start
        retf
L_2FE35:
        int     70h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        push    cs
        call    far_2FEC1
        retf
isr_2FE41:
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        KEY_LOCATE      (APP3_BASE+L_2F5A3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2F5A3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2F5A3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2F5A3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2F5A3-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 112
        KEY_TRANSPORT   (APP3_BASE+L_2F5AD-APP3_SEG*16), APP3_SEG, EP_L_2FE8D_OFF, EP_L_2FE8D_SEG, (APP3_BASE+L_2F5C9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2F5D3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2F5E1-APP3_SEG*16), APP3_SEG
        pop     ds
        iret
        else
        KEY_TRANSPORT   (APP3_BASE+L_2F5AD-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2FE8D-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2F5C9-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2F5D3-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2F5E1-APP3_SEG*16), APP3_SEG
        db      1fh, 0cfh
        endif
L_2F5A3:
        int     70h
        int     9bh
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_2F5AD:
        int     70h
        int     9bh
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        push    cs
        call    far_30161
        retf
L_2FE8D:
        int     70h
        int     9bh
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        push    cs
        call    far_3021E
        retf
L_2F5C9:
        int     70h
        int     9bh
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_2F5D3:
        int     70h
        int     9bh
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        push    cs
        call    seq_play_start
        retf
L_2F5E1:
        int     70h
        int     9bh
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        push    cs
        call    far_2FEC1
        retf
far_2FEC1:
        int     0afh
        call    fn_28233
        jne     br_2FEC9
        retf
br_2FEC9:
        mov     bx, 14ah
        int     0a9h
        jb      br_2FEF1
        call    far_2FEF7
        mov     bl, 21h
        int     87h
        mov     bl, 1fh
        int     87h
        mov     bl, 10h
        int     87h
        mov     bl, 0eh
        int     87h
        call    fn_2FF8C
        jae     br_2FEE9
        retf
br_2FEE9:
        mov     bl, 3
        int     87h
        if      FW_VERSION >= 112
        call    fn_2FF3C
        else
        db      0e8h, 4ch, 00h
        endif
        retf
br_2FEF1:
        sub     ax, ax
        call    fn_30425
        retf
far_2FEF7:
        KEY_LOCATE      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        if      FW_VERSION >= 112
        KEY_TRANSPORT   (APP3_BASE+L_2F908-APP3_SEG*16), APP3_SEG, EP_L_2FAAA_OFF, APP3_SEG, EP_SEQ_PLAY_STOP_OFF, APP3_SEG, EP_FAR_30054_OFF, APP3_SEG, 0000h, 0000h
        KEY_UP          35h, 0000h, 0000h
        KEY_UP          36h, 0000h, 0000h
        KEY_DOWN        3ah, EP_FAR_302CB_OFF, APP3_SEG
        db      0c3h
fn_2FF3C:
        cmp     byte ptr [A3_B_0072C], 0
        jne     br_2FF44
        else
        KEY_TRANSPORT   (APP3_BASE+L_2F908-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_2FAAA-APP3_SEG*16), APP3_SEG, (APP3_BASE+SEQ_PLAY_STOP-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_30054-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        KEY_UP          35h, 0000h, 0000h
        KEY_UP          36h, 0000h, 0000h
        KEY_DOWN        3ah, EP_APP3_9B1B_OFF, APP3_SEG
        db      0c3h, 80h
        db      3eh, 2ch, 07h
        add     byte ptr [di+1], dh
        endif
        ret
br_2FF44:
        int     0b2h
        DISP_ERASE      00h, 33h, 0f8h, 09h
        DISP_TEXT       00h, 34h, "        Wait any pad or MIDI note"
        DISP_FLUSH
loop_2FF77:
        int     88h
        cmp     al, 8
        jne     br_2FF8B
        int     0b3h
        cmp     ax, 14ah
        jne     loop_2FF77
        mov     bl, 1
        int     87h
        call    L_2FD8D
br_2FF8B:
        ret
fn_2FF8C:
        cmp     byte ptr [A3_B_00773], 0
        je      br_3000E
        cmp     byte ptr [A3_B_00770], 0
        je      br_3000E
        DISP_ERASE      00h, 33h, 0f8h, 09h
        db      80h, 3eh, 70h
        pop     es
        add     word ptr [di+28h], si
        DISP_TEXT       00h, 34h, "         Waiting for MIDI 'Play'"
        db      0ebh, 25h
        DISP_TEXT       00h, 34h, "         Waiting for time code."
        DISP_FLUSH
        int     88h
        cmp     al, 2
        je      br_3000C
        int     0b3h
        cmp     ax, 14ah
        db      75h, 0f0h
        mov     bl, 1
        int     87h
        call    L_2FD8D
br_3000C:
        stc
        ret
br_3000E:
        clc
        ret
seq_play_start:
        int     0afh
        call    fn_28233
        jne     br_30018
        retf
br_30018:
        int     85h
        mov     es, word ptr [A3_W_00F10]
        sub     ax, word ptr es:[1ch]
        sbb     dx, word ptr es:[1eh]
        jb      br_3003B
        cmp     byte ptr es:[34h], 0
        jne     br_30033
        retf
br_30033:
        sub     ax, ax
        sub     dx, dx
        mov     bl, 0ah
        int     87h
br_3003B:
        call    far_2FEF7
        mov     bl, 20h
        int     87h
        mov     bl, 0eh
        int     87h
        call    fn_2FF8C
        jae     br_3004C
        retf
br_3004C:
        mov     bl, 2
        int     87h
        if      FW_VERSION >= 112
        call    fn_2FF3C
        else
        db      0e8h, 0e9h, 0feh
        endif
        retf
far_30054:
        db      80h
        db      3eh, 2fh
        db      0fh
        add     al, 75h
        db      01h, 0cbh
        mov     al, 2
        int     0ddh
        cmp     al, 0
        je      br_30065
        retf
br_30065:
        mov     bx, 13eh
        int     0a9h
        jb      br_30074
        mov     bx, 144h
        int     0a9h
        jb      br_30079
        retf
br_30074:
        mov     bl, 4
        int     87h
        retf
br_30079:
        mov     bl, 5
        int     87h
        retf
seq_play_stop:
        int     0afh
        call    fn_28233
        jne     br_30086
        retf
br_30086:
        call    fn_300B0
        jb      br_30095
        mov     bl, 1
        int     87h
loop_3008F:
        int     88h
        cmp     al, 0
        jne     loop_3008F
br_30095:
        call    fn_30157
        call    fn_3011E
        call    L_2FD8D
        int     86h
        mov     word ptr [A3_W_00F2A], ax
        mov     byte ptr [A3_B_00F2C], dl
        mov     byte ptr [A3_B_00F2D], dh
        mov     al, 0
        int     0aah
        retf
fn_300B0:
        int     0a5h
        cmp     byte ptr [A3_B_00773], 0
        je      br_3011C
        cmp     byte ptr [A3_B_00770], 1
        jb      br_30118
        pushf
        mov     bl, 0fh
        int     87h
        popf
        db      75h, 1eh
        DISP_MSG        " Waiting for MIDI 'Stop'"
        jmp     loop_30106
        DISP_MSG        " Waiting for time code. stop"
loop_30106:
        int     88h
        cmp     al, 0
        je      br_30113
        int     0b9h
        cmp     ax, 14ah
        jne     loop_30106
br_30113:
        DISP_PLANE0
        stc
        ret
br_30118:
        mov     bl, 0fh
        int     87h
br_3011C:
        clc
        ret
fn_3011E:
        mov     word ptr [A3_W_007BB], 0
        cmp     byte ptr [A2_B_00F2F], 4
        jne     br_3012C
        ret
br_3012C:
        cmp     byte ptr [A2_B_00F2F], 3
        jne     br_30134
        ret
br_30134:
        mov     word ptr [A3_W_00F10], 8000h
        cmp     byte ptr [A3_B_00F30], 0
        jne     br_30142
        ret
br_30142:
        mov     byte ptr [A3_B_00F30], 0
        int     85h
        push    ax
        push    dx
        callf   EP_L_27146_SEG:EP_L_27146_OFF
        pop     dx
        pop     ax
        mov     bl, 0ah
        int     87h
        ret
fn_30157:
        int     6ah
        cmp     al, 0
        jne     br_3015E
        ret
br_3015E:
        int     0d6h
        ret
far_30161:
        cmp     byte ptr [A2_B_00F2F], 4
        jne     br_30169
        retf
br_30169:
        int     88h
        cmp     cl, 0
        je      br_30171
        retf
br_30171:
        mov     al, 2
        int     0ddh
        cmp     al, 0
        je      br_3017A
        retf
br_3017A:
        int     0afh
        call    fn_2823E
        call    fn_302FE
        jae     br_30185
        retf
br_30185:
        mov     bx, 13eh
        int     6ch
        mov     bl, 4
        int     87h
        KEY_UP          35h, 0000h, 0000h
        mov     bx, 156h
        int     0a9h
        jae     br_3019E
        retf
br_3019E:
        mov     bx, 150h
        int     0a9h
        jae     br_301A6
        retf
br_301A6:
        KEY_UP          35h, (APP3_BASE+L_2F8E6-APP3_SEG*16), APP3_SEG
        int     85h
        mov     word ptr [A3_W_02262], ax
        mov     word ptr [A3_W_02264], dx
        retf
L_2F8E6:
        mov     bl, 6
        int     87h
        int     85h
        mov     bx, word ptr [A3_W_02262]
        mov     cx, word ptr [A3_W_02264]
        cmp     ax, bx
        jne     br_301CF
        cmp     dx, cx
        jne     br_301CF
        retf
br_301CF:
        mov     ax, bx
        mov     dx, cx
        mov     bl, 0ah
        int     87h
        int     0d6h
        retf
L_2F908:
        cmp     byte ptr [A2_B_00F2F], 4
        jne     br_301E2
        retf
br_301E2:
        int     88h
        cmp     cl, 0
        je      br_301EA
        retf
br_301EA:
        mov     al, 2
        int     0ddh
        cmp     al, 0
        je      br_301F3
        retf
br_301F3:
        int     88h
        cmp     ah, 4
        je      br_30219
        cmp     ah, 5
        je      br_30219
        call    fn_302FE
        jae     br_30205
        retf
br_30205:
        mov     bx, 156h
        int     0a9h
        jb      br_30214
        mov     bx, 150h
        int     0a9h
        jb      br_30214
        retf
br_30214:
        mov     bl, 4
        int     87h
        retf
br_30219:
        mov     bl, 6
        int     87h
        retf
far_3021E:
        cmp     byte ptr [A2_B_00F2F], 4
        jne     br_30226
        retf
br_30226:
        int     88h
        cmp     cl, 0
        je      br_3022E
        retf
br_3022E:
        mov     al, 2
        int     0ddh
        cmp     al, 0
        je      br_30237
        retf
br_30237:
        int     0afh
        call    fn_2823E
        call    fn_302FE
        jae     br_30242
        retf
br_30242:
        mov     bx, 144h
        int     6ch
        mov     bl, 5
        int     87h
        KEY_UP          36h, 0000h, 0000h
        mov     bx, 156h
        int     0a9h
        jae     br_3025B
        retf
br_3025B:
        mov     bx, 150h
        int     0a9h
        jae     br_30263
        retf
br_30263:
        KEY_UP          36h, (APP3_BASE+L_2F8E6-APP3_SEG*16), APP3_SEG
        int     85h
        mov     word ptr [A3_W_02262], ax
        mov     word ptr [A3_W_02264], dx
        retf
        mov     bl, 6
        int     87h
        retf
L_2FAAA:
        cmp     byte ptr [A2_B_00F2F], 4
        jne     br_30282
        retf
br_30282:
        int     88h
        cmp     cl, 0
        je      br_3028A
        retf
br_3028A:
        mov     al, 2
        int     0ddh
        cmp     al, 0
        je      br_30293
        retf
br_30293:
        int     88h
        cmp     ah, 4
        je      br_302B9
        cmp     ah, 5
        je      br_302B9
        call    fn_302FE
        jae     br_302A5
        retf
br_302A5:
        mov     bx, 156h
        int     0a9h
        jb      br_302B4
        mov     bx, 150h
        int     0a9h
        jb      br_302B4
        retf
br_302B4:
        mov     bl, 5
        int     87h
        retf
br_302B9:
        mov     bl, 6
        int     87h
        retf
L_2F9EC:
        int     88h
        cmp     al, 0
        jne     br_302C5
        retf
br_302C5:
        call    far_2FEF7
        int     0b2h
        retf
far_302CB:
        int     77h
        mov     bx, ax
        sub     ax, word ptr [A3_W_02260]
        cmp     ax, 43h
        jb      br_302DE
        mov     word ptr [A3_W_02260], bx
        int     8dh
br_302DE:
        int     88h
        cmp     al, 0
        je      br_302E5
        retf
br_302E5:
        call    fn_30157
        call    fn_3011E
        push    ax
        call    L_2FD8D
        mov     al, 0
        int     0aah
        pop     ax
        cmp     ah, 0
        jne     L_2FA28
        retf
L_2FA28:
        call    fn_302FE
        retf
fn_302FE:
        int     83h
        push    es
        push    si
        int     84h
        mov     ax, es
        pop     cx
        pop     bx
        cmp     ax, bx
        jne     tgt_30342
        sub     cx, si
        cmp     cx, 200h
        jb      br_30315
        ret
br_30315:
        DISP_MSG        "    Insufficient Memory !!  "
        DISP_FLUSH
        mov     cx, 2bch
        int     0b6h
        DISP_PLANE0
        stc
        ret
tgt_30342:
        clc
        ret
L_2FA72:
        call    fn_28233
        jne     br_3034A
        retf
br_3034A:
        call    fn_280BD
        je      br_30350
        retf
br_30350:
        cmp     byte ptr [C0_B_00F2F], 1
        jne     br_3035A
        call    fn_2FD0B
br_3035A:
        int     0afh
        mov     bx, 12ch
        int     0a9h
        jb      br_3036E
        int     0a3h
        int     86h
        add     ax, 1
        call    fn_30425
        retf
br_3036E:
        mov     ax, 3e7h
        call    fn_30425
        int     8ah
        KEY_UP          32h, 0000h, 0000h
        retf
L_2FAAD:
        call    fn_28233
        jne     br_30385
        retf
br_30385:
        call    fn_280BD
        je      br_3038B
        retf
br_3038B:
        cmp     byte ptr [C0_B_00F2F], 1
        jne     br_30395
        call    fn_2FD0B
br_30395:
        int     0afh
        mov     bx, 12ch
        int     0a9h
        jb      br_303B1
        int     0a3h
        int     86h
        or      dl, dh
        jne     X_303AD
        sub     ax, 1
        jae     X_303AD
        sub     ax, ax
X_303AD:
        call    fn_30425
        retf
br_303B1:
        sub     ax, ax
        call    fn_30425
        int     8ah
        KEY_UP          32h, 0000h, 0000h
        retf
L_2FAEF:
        call    fn_28233
        jne     br_303C7
        retf
br_303C7:
        call    fn_280BD
        je      br_303CD
        retf
br_303CD:
        cmp     byte ptr [C0_B_00F2F], 0
        je      br_303D5
        retf
br_303D5:
        mov     bx, 13eh
        int     0a9h
        jae     br_303DD
        retf
br_303DD:
        mov     bx, 144h
        int     0a9h
        jae     br_303E5
        retf
br_303E5:
        int     0afh
        int     89h
        KEY_WHEEL       EP_L_2FB2E_OFF, APP3_SEG
        cmp     byte ptr [C0_B_00F2F], 1
        jne     br_303F7
        retf
br_303F7:
        KEY_UP          32h, EP_BR_3043F_OFF, APP3_SEG
        retf
L_2FB2E:
        push    ax
        push    cx
        int     86h
        pop     cx
        pop     bx
        add     ax, bx
        sub     ax, cx
        jae     L_2F5E0
        sub     ax, ax
L_2F5E0:
        call    fn_30425
        KEY_UP          32h, EP_L_2FB48_OFF, APP3_SEG
        retf
L_2FB48:
        int     8ah
        KEY_UP          32h, 0000h, 0000h
        retf
fn_30425:
        sub     dx, dx
        sub     cx, cx
        mov     bl, 0bh
        int     87h
        call    fn_30431
        ret
fn_30431:
        int     86h
        mov     word ptr [C0_W_00F2A], ax
        mov     byte ptr [C0_B_00F2C], dl
        mov     byte ptr [C0_B_00F2D], dh
        ret
br_3043F:
        int     8ah
        int     86h
        mov     word ptr [A3_W_00789], ax
        mov     word ptr [A3_W_0078B], dx
        mov     word ptr [A3_W_0154D], ax
        mov     byte ptr [A3_B_0154F], dl
        mov     byte ptr [A3_B_01550], dh
        callf   [A3_FP_02266]
        retf
fn_3045A:
        pop     si
        push    si
        sub     si, 3
        mov     word ptr [A3_FP_02266], si
        int     0a4h
        KEY_DOWN        20h, EP_FAR_304BE_OFF, EP_FAR_304BE_SEG
        KEY_DOWN        11h, EP_L_3076F_OFF, APP3_SEG
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, EP_L_2FF85_OFF, APP3_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_LOCATE      0000h, 0000h, 0000h, 0000h, EP_L_304AC_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        ret
L_304AC:
        int     0b9h
        cmp     ax, 812ch
        jne     L_304AC
        int     0a5h
        call    fn_2B3C5
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
far_304BE:
        DISP_WIN        0ah, 02h, 0e4h, 3ah, "Locate"
        DISP_TEXT       50h, 0bh, "Go to:001.01.00"
        DISP_HDOTS      15h, 13h, 0ceh
        DISP_TEXT       14h, 16h, "7:"
        DISP_TEXT       14h, 20h, "4:"
        DISP_TEXT       14h, 2ah, "1:"
        DISP_TEXT       5ch, 16h, "8:"
        DISP_TEXT       5ch, 20h, "5:"
        DISP_TEXT       5ch, 2ah, "2:"
        DISP_TEXT       0a4h, 16h, "9:"
        DISP_TEXT       0a4h, 20h, "6:"
        DISP_TEXT       0a4h, 2ah, "3:"
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "STORE"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "GO TO"
        mov     si, 789h
        mov     ax, word ptr [si]
        mov     dx, word ptr [si+2]
        mov     cl, 74h
        mov     ch, 0bh
        callf   EP_DRAW_BAR_BEAT_TICK_SEG:EP_DRAW_BAR_BEAT_TICK_OFF
        mov     bh, 3
        mov     ch, 2ah
        mov     cl, 20h
        mov     si, 78dh
loop_3056B:
        push    cx
        mov     bl, 3
L_2FF8E:
        mov     ax, word ptr [si]
        mov     dx, word ptr [si+2]
        add     si, 4
        pusha
        callf   EP_DRAW_BAR_BEAT_TICK_SEG:EP_DRAW_BAR_BEAT_TICK_OFF
        popa
        add     cl, 48h
        dec     bl
        jne     L_2FF8E
        pop     cx
        sub     ch, 0ah
        dec     bh
        jne     loop_3056B
        call    word ptr [C0_W_0226A]
        retf
L_30591:
        ret
L_30592:
        DISP_CURSOR     20h, 2ah, 37h
        ret
L_3059B:
        DISP_CURSOR     68h, 2ah, 37h
        ret
L_305A4:
        DISP_CURSOR     0b0h, 2ah, 37h
        ret
L_305AD:
        DISP_CURSOR     20h, 20h, 37h
        ret
L_305B6:
        DISP_CURSOR     68h, 20h, 37h
        ret
L_305BF:
        DISP_CURSOR     0b0h, 20h, 37h
        ret
L_305C8:
        DISP_CURSOR     20h, 16h, 37h
        ret
L_305D1:
        DISP_CURSOR     68h, 16h, 37h
        ret
L_305DA:
        DISP_CURSOR     0b0h, 16h, 37h
        ret
L_305E3:
        call    fn_3045A
        mov     word ptr [C0_W_0226C], 789h
        mov     word ptr [C0_W_0226A], EP_L_30591_OFF
        mov     ax, field_cb_none-APP3_CSBASE
        mov     bx, EP_L_2FF41_OFF
        mov     bp, field_cb_none-APP3_CSBASE
        mov     dx, field_cb_none-APP3_CSBASE
        mov     di, field_cb_none-APP3_CSBASE
        mov     si, EP_L_3060C_OFF
        mov     cl, 74h
        mov     ch, 0bh
        call    tgt_2AC2B
        retf
L_3060C:
        mov     ax, word ptr [A3_W_0154D]
        mov     dl, byte ptr [A3_B_0154F]
        mov     dh, byte ptr [A3_B_01550]
        mov     word ptr [A3_W_00789], ax
        mov     word ptr [A3_W_0078B], dx
        push    cs
        call    far_304BE
        retf
L_30623:
        call    fn_3045A
        mov     word ptr [C0_W_0226C], 78dh
        mov     word ptr [C0_W_0226A], EP_L_30592_OFF
        KEY_CURSOR      0000h, 0000h, EP_L_30645_OFF, APP3_SEG, EP_L_30689_OFF, APP3_SEG, 0000h, 0000h
        retf
L_30645:
        call    fn_3045A
        mov     word ptr [C0_W_0226C], 791h
        mov     word ptr [C0_W_0226A], EP_L_3059B_OFF
        KEY_CURSOR      EP_L_30623_OFF, APP3_SEG, EP_L_30667_OFF, APP3_SEG, EP_L_306AB_OFF, APP3_SEG, 0000h, 0000h
        retf
L_30667:
        call    fn_3045A
        mov     word ptr [C0_W_0226C], 795h
        mov     word ptr [C0_W_0226A], EP_L_305A4_OFF
        KEY_CURSOR      EP_L_30645_OFF, APP3_SEG, 0000h, 0000h, EP_L_306CD_OFF, APP3_SEG, 0000h, 0000h
        retf
L_30689:
        call    fn_3045A
        mov     word ptr [C0_W_0226C], 799h
        mov     word ptr [C0_W_0226A], EP_L_305AD_OFF
        KEY_CURSOR      0000h, 0000h, EP_L_306AB_OFF, APP3_SEG, EP_L_306EF_OFF, APP3_SEG, EP_L_30623_OFF, APP3_SEG
        retf
L_306AB:
        call    fn_3045A
        mov     word ptr [C0_W_0226C], 79dh
        mov     word ptr [C0_W_0226A], EP_L_305B6_OFF
        KEY_CURSOR      EP_L_30689_OFF, APP3_SEG, EP_L_306CD_OFF, APP3_SEG, EP_L_2FF41_OFF, APP3_SEG, EP_L_30645_OFF, APP3_SEG
        retf
L_306CD:
        call    fn_3045A
        mov     word ptr [C0_W_0226C], 7a1h
        mov     word ptr [C0_W_0226A], EP_L_305BF_OFF
        KEY_CURSOR      EP_L_306AB_OFF, APP3_SEG, 0000h, 0000h, EP_L_2FF63_OFF, APP3_SEG, EP_L_30667_OFF, APP3_SEG
        retf
L_306EF:
        call    fn_3045A
        mov     word ptr [C0_W_0226C], 7a5h
        mov     word ptr [C0_W_0226A], EP_L_305C8_OFF
        KEY_CURSOR      0000h, 0000h, EP_L_2FF41_OFF, APP3_SEG, EP_L_305E3_OFF, APP3_SEG, EP_L_30689_OFF, APP3_SEG
        retf
L_2FF41:
        call    fn_3045A
        mov     word ptr [C0_W_0226C], 7a9h
        mov     word ptr [C0_W_0226A], EP_L_305D1_OFF
        KEY_CURSOR      EP_L_306EF_OFF, APP3_SEG, EP_L_2FF63_OFF, APP3_SEG, EP_L_305E3_OFF, APP3_SEG, EP_L_306AB_OFF, APP3_SEG
        retf
L_2FF63:
        call    fn_3045A
        mov     word ptr [C0_W_0226C], 7adh
        mov     word ptr [C0_W_0226A], EP_L_305DA_OFF
        KEY_CURSOR      EP_L_2FF41_OFF, APP3_SEG, 0000h, 0000h, EP_L_305E3_OFF, APP3_SEG, EP_L_306CD_OFF, APP3_SEG
        retf
L_2FF85:
        mov     si, word ptr [C0_W_0226C]
        mov     ax, word ptr [si]
        mov     dl, byte ptr [si+2]
        mov     cl, byte ptr [si+3]
        mov     dh, 0
        mov     ch, 0
        mov     bl, 0bh
        int     87h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_3076F:
        mov     si, word ptr [A3_W_0226C]
        cmp     si, 789h
        jne     br_3077A
        retf
br_3077A:
        mov     ax, word ptr [A3_W_0154D]
        mov     dl, byte ptr [A3_B_0154F]
        mov     dh, byte ptr [A3_B_01550]
        mov     word ptr [si], ax
        mov     word ptr [si+2], dx
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_2FEBE:
        call    fn_28233
        jne     br_30796
        retf
br_30796:
        call    fn_280BD
        je      br_3079C
        retf
br_3079C:
        cmp     byte ptr [C0_B_00F2F], 1
        jne     br_307A6
        call    fn_2FD0B
br_307A6:
        int     0afh
        int     0a3h
        mov     bx, 12ch
        int     0a9h
        jb      br_307B9
        mov     bl, 12h
        int     87h
        call    fn_30431
        retf
br_307B9:
        cmp     byte ptr [C0_B_00F2F], 1
        je      br_307D2
        int     8ah
        KEY_UP          32h, 0000h, 0000h
        mov     bl, 14h
        int     87h
        call    fn_30431
        retf
br_307D2:
        call    fn_307D9
        call    fn_30431
        retf
fn_307D9:
        int     85h
        add     ax, 1
        adc     dx, 0
        mov     bl, 0ah
        int     87h
        int     83h
        cmp     byte ptr es:[si+4], 0ffh
        jne     br_307F1
        jmp     br_30993
br_307F1:
        mov     bp, 0
        mov     bl, 0
        cmp     byte ptr [A3_B_01913], 0
        je      br_30804
        mov     bp, 3fffh
        mov     bx, word ptr [A3_W_00712]
br_30804:
        mov     al, byte ptr [A3_B_01914]
        cmp     al, 0
        je      loop_30822
        cmp     al, 1
        je      br_30867
        mov     ah, 0
        add     ax, 19ebh
        mov     di, ax
        mov     al, byte ptr [di]
        cmp     al, 0b0h
        jne     br_3081F
        jmp     br_3091E
br_3081F:
        jmp     loop_30961
loop_30822:
        mov     dl, byte ptr es:[si+4]
        cmp     dl, 0ffh
        jne     br_3082E
        jmp     br_30993
br_3082E:
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bh, bl
        jne     br_3083B
        jmp     loop_3099A
br_3083B:
        cmp     dl, 0f0h
        jne     br_30843
        call    fn_30852
br_30843:
        add     si, 8
        jae     loop_30822
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
        jmp     loop_30822
fn_30852:
        add     si, 8
        jae     br_3085F
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_3085F:
        cmp     byte ptr es:[si+4], 0f8h
        jne     fn_30852
        ret
br_30867:
        call    fn_280CB
        jne     br_308AB
        mov     al, byte ptr [A3_B_01577]
        mov     ah, byte ptr [A3_B_01578]
loop_30873:
        mov     dl, byte ptr es:[si+4]
        cmp     dl, 0ffh
        jne     br_3087F
        jmp     br_30993
br_3087F:
        cmp     al, dl
        ja      br_30894
        cmp     ah, dl
        jb      br_30894
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bl, bh
        jne     br_30894
        jmp     loop_3099A
br_30894:
        cmp     dl, 0f0h
        jne     br_3089C
        call    fn_30852
br_3089C:
        add     si, 8
        jae     loop_30873
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
        jmp     loop_30873
br_308AB:
        cmp     byte ptr [A3_B_01579], 41h
        je      loop_308E9
        mov     al, byte ptr [A3_B_0157A]
loop_308B5:
        mov     dl, byte ptr es:[si+4]
        cmp     dl, 0ffh
        jne     br_308C1
        jmp     br_30993
br_308C1:
        cmp     al, dl
        jne     br_308D2
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bl, bh
        jne     br_308D2
        jmp     loop_3099A
br_308D2:
        cmp     dl, 0f0h
        jne     br_308DA
        call    fn_30852
br_308DA:
        add     si, 8
        jae     loop_308B5
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
        jmp     loop_308B5
loop_308E9:
        mov     dl, byte ptr es:[si+4]
        cmp     dl, 0ffh
        jne     br_308F5
        jmp     br_30993
br_308F5:
        test    dl, 80h
        jne     br_30907
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bl, bh
        jne     br_30907
        jmp     loop_3099A
br_30907:
        cmp     dl, 0f0h
        jne     br_3090F
        call    fn_30852
br_3090F:
        add     si, 8
        jae     loop_308E9
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
        jmp     loop_308E9
br_3091E:
        mov     ch, 0ffh
        mov     ah, byte ptr [A3_B_01915]
        sub     ah, 1
        jae     loop_3092D
        mov     ah, 0
        mov     ch, 0
loop_3092D:
        mov     dx, word ptr es:[si+4]
        cmp     dl, 0ffh
        jne     br_30938
        jmp     br_30993
br_30938:
        and     dh, ch
        cmp     ax, dx
        jne     br_3094A
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bl, bh
        jne     br_3094A
        jmp     loop_3099A
br_3094A:
        cmp     dl, 0f0h
        jne     br_30952
        call    fn_30852
br_30952:
        add     si, 8
        jae     loop_3092D
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
        jmp     loop_3092D
loop_30961:
        mov     dl, byte ptr es:[si+4]
        cmp     dl, 0ffh
        jne     br_3096C
        jmp     br_30993
br_3096C:
        cmp     al, dl
        jne     br_3097C
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bl, bh
        jne     br_3097C
        jmp     loop_3099A
br_3097C:
        cmp     dl, 0f0h
        jne     br_30984
        call    fn_30852
br_30984:
        add     si, 8
        jae     loop_30961
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
        jmp     loop_30961
br_30993:
        mov     ax, 3e7h
        call    fn_30425
        ret
loop_3099A:
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 0fh
        mov     bl, 0ah
        int     87h
        ret
L_300D7:
        call    fn_28233
        jne     br_309AF
        retf
br_309AF:
        call    fn_280BD
        je      br_309B5
        retf
br_309B5:
        cmp     byte ptr [C0_B_00F2F], 1
        jne     br_309BF
        call    fn_2FD0B
br_309BF:
        int     0afh
        int     0a3h
        mov     bx, 12ch
        int     0a9h
        jb      br_309D2
        mov     bl, 11h
        int     87h
        call    fn_30431
        retf
br_309D2:
        cmp     byte ptr [C0_B_00F2F], 1
        je      br_309EB
        int     8ah
        KEY_UP          32h, 0000h, 0000h
        mov     bl, 13h
        int     87h
        call    fn_30431
        retf
br_309EB:
        call    fn_309F2
        call    fn_30431
        retf
fn_309F2:
        int     84h
        mov     bp, 0
        mov     bl, 0
        cmp     byte ptr [A3_B_01913], 0
        je      br_30A07
        mov     bp, 3fffh
        mov     bx, word ptr [A3_W_00712]
br_30A07:
        mov     al, byte ptr [A3_B_01914]
        cmp     al, 0
        je      loop_30A25
        cmp     al, 1
        je      br_30A6E
        mov     ah, 0
        add     ax, 19ebh
        mov     di, ax
        mov     al, byte ptr [di]
        cmp     al, 0b0h
        jne     L_30442
        jmp     NEAR br_30B3A
L_30442:
        jmp     NEAR loop_30B85
loop_30A25:
        cmp     si, 2800h
        jne     br_30A35
        mov     ax, es
        cmp     ax, 8000h
        jne     br_30A35
        jmp     NEAR L_2FD91
br_30A35:
        sub     si, 8
        jae     br_30A42
        mov     dx, es
        sub     dx, 1000h
        mov     es, dx
br_30A42:
        cmp     byte ptr es:[si+4], 0f8h
        jne     br_30A4C
        call    fn_30A59
br_30A4C:
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bh, bl
        jne     loop_30A25
        jmp     loop_3099A
fn_30A59:
        sub     si, 8
        jae     br_30A66
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_30A66:
        cmp     byte ptr es:[si+4], 0f0h
        jne     fn_30A59
        ret
br_30A6E:
        call    fn_280CB
        jne     br_30AB9
        mov     al, byte ptr [A3_B_01577]
        mov     ah, byte ptr [A3_B_01578]
loop_30A7A:
        cmp     si, 2800h
        jne     br_30A8B
        mov     dx, es
        cmp     dx, 8000h
        jne     br_30A8B
        jmp     NEAR L_2FD91
br_30A8B:
        sub     si, 8
        jae     br_30A98
        mov     dx, es
        sub     dx, 1000h
        mov     es, dx
br_30A98:
        mov     dl, byte ptr es:[si+4]
        cmp     dl, 0f8h
        jne     br_30AA4
        call    fn_30A59
br_30AA4:
        cmp     al, dl
        ja      loop_30A7A
        cmp     ah, dl
        jb      loop_30A7A
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bl, bh
        jne     loop_30A7A
        jmp     loop_3099A
br_30AB9:
        cmp     byte ptr [A3_B_01579], 41h
        je      loop_30AFE
        mov     al, byte ptr [A3_B_0157A]
loop_30AC3:
        cmp     si, 2800h
        jne     br_30AD4
        mov     cx, es
        cmp     cx, 8000h
        jne     br_30AD4
        jmp     NEAR L_2FD91
br_30AD4:
        sub     si, 8
        jae     br_30AE1
        mov     dx, es
        sub     dx, 1000h
        mov     es, dx
br_30AE1:
        mov     dl, byte ptr es:[si+4]
        cmp     dl, 0f8h
        jne     br_30AED
        call    fn_30A59
br_30AED:
        cmp     al, dl
        jne     loop_30AC3
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bl, bh
        jne     loop_30AC3
        jmp     loop_3099A
loop_30AFE:
        cmp     si, 2800h
        jne     br_30B0F
        mov     cx, es
        cmp     cx, 8000h
        jne     br_30B0F
        jmp     NEAR L_2FD91
br_30B0F:
        sub     si, 8
        jae     br_30B1C
        mov     dx, es
        sub     dx, 1000h
        mov     es, dx
br_30B1C:
        mov     dl, byte ptr es:[si+4]
        cmp     dl, 0f8h
        jne     br_30B28
        call    fn_30A59
br_30B28:
        test    dl, 80h
        jne     loop_30AFE
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bl, bh
        jne     loop_30AFE
        jmp     loop_3099A
br_30B3A:
        mov     ch, 0ffh
        mov     ah, byte ptr [A3_B_01915]
        sub     ah, 1
        jae     loop_30B49
        mov     ah, 0
        mov     ch, 0
loop_30B49:
        cmp     si, 2800h
        jne     br_30B59
        mov     dx, es
        cmp     dx, 8000h
        jne     br_30B59
        jmp     SHORT L_2FD91
br_30B59:
        sub     si, 8
        jae     br_30B66
        mov     dx, es
        sub     dx, 1000h
        mov     es, dx
br_30B66:
        mov     dx, word ptr es:[si+4]
        cmp     dl, 0f8h
        jne     br_30B72
        call    fn_30A59
br_30B72:
        and     dh, ch
        cmp     ax, dx
        jne     loop_30B49
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bl, bh
        jne     loop_30B49
        jmp     loop_3099A
loop_30B85:
        cmp     si, 2800h
        jne     br_30B95
        mov     dx, es
        cmp     dx, 8000h
        jne     br_30B95
        jmp     SHORT L_2FD91
br_30B95:
        sub     si, 8
        jae     br_30BA2
        mov     dx, es
        sub     dx, 1000h
        mov     es, dx
br_30BA2:
        mov     dl, byte ptr es:[si+4]
        cmp     dl, 0f8h
        jne     br_30BAE
        call    fn_30A59
br_30BAE:
        cmp     al, dl
        jne     loop_30B85
        mov     bh, byte ptr es:[si+3]
        and     bx, bp
        cmp     bl, bh
        jne     loop_30B85
        jmp     loop_3099A
L_2FD91:
        mov     ax, 0
        call    fn_30425
        ret
L_30BC6:
        mov     al, 7
        mov     byte ptr [C0_B_00F2F], al
        int     0adh
        mov     byte ptr [C0_B_00F2E], 0
        mov     word ptr [A3_W_00F10], 8000h
        callf   [A3_FP_02270]
        retf
L_30BDD:
        mov     word ptr [A3_FP_02270], EP_L_30BDD_OFF
        int     0a4h
        FIELD_WHEEL     ds, 7b1h, 0, 0, 2, field_cb_none-APP3_CSBASE
        KEY_SOFT        0000h, 0000h, EP_L_303F5_OFF, APP3_SEG, EP_L_304ED_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, EP_L_3034F_OFF, APP3_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_3034F:
        DISP_CLEAR
        DISP_BOX        00h, 00h, 0f7h, 31h
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      0f7h, 01h, 31h
        DISP_HDOTS      00h, 14h, 0f7h
        DISP_TEXT       04h, 03h, "  Tap averaging:"
        DISP_TEXT       04h, 17h, "Display contrast"
        DISP_TEXT       04h, 20h, "    Hold SHIFT and turn jog(anytime)"
        DISP_SOFTKEY    01h, DISP_SK_PLAIN, "OTHERS"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "INIT"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "VER."
        mov     al, byte ptr [A3_B_007B1]
        add     al, 2
        DISP_NUM        64h, 03h, 01h
        DISP_CURSOR     64h, 03h, 07h
        retf
L_303F5:
        mov     word ptr [A3_FP_02270], EP_L_30BDD_OFF
        int     0a4h
        KEY_SOFT        EP_L_30BDD_OFF, APP3_SEG, EP_L_303F5_OFF, APP3_SEG, EP_L_304ED_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        DISP_CLEAR
        DISP_BOX        00h, 00h, 0f7h, 31h
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      0f7h, 01h, 31h
        DISP_TEXT       0ch, 0ch, "Initialize ALL PARAMETERS"
        DISP_TEXT       0ch, 20h, "Pressing DO IT will initialize!!"
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "OTHERS"
        DISP_SOFTKEY    02h, DISP_SK_PLAIN, "INIT"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "VER."
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "DO IT"
        KEY_DOWN        15h, EP_L_304AE_OFF, APP3_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
L_304AE                         equ     $+1
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        db      0cbh, 0cdh, 6bh, 0b0h, 00h, 0b4h, 03h, 0cdh, 6dh, 0beh
        db      74h, 22h
        mov     di, 710h
        mov     ax, ds
        mov     es, ax
        mov     cx, 100h
        rep movsb
        mov     si, 2374h
        mov     di, 10h
        mov     cx, 700h
        rep movsb
        call    fn_27F33
        call    L_279FD
        int     41h
        callf   APP3_SEG:EP_L_33BF2_OFF
        callf   EP_FAR_33D3A_SEG:EP_FAR_33D3A_OFF
        mov     byte ptr [C0_B_00F2E], 0
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_304ED:
        int     0a4h
        else
        db      0cbh, 0cdh, 6bh, 0b0h, 00h, 0b4h, 03h, 0cdh, 6dh, 0beh, 74h
        db      22h, 0bfh, 10h, 07h, 8ch, 0d8h, 8eh, 0c0h, 0b9h, 00h, 01h, 0f3h, 0a4h, 0beh, 74h, 23h
        if      FW_VERSION >= 111
        db      0bfh, 10h, 00h, 0b9h, 00h, 07h, 0f3h, 0a4h, 0e8h, 90h, 71h, 0e8h, 37h, 72h, 0cdh, 41h
        else
        db      0bfh, 10h, 00h, 0b9h, 00h, 07h, 0f3h, 0a4h, 0e8h, 91h, 71h, 0e8h, 38h, 72h, 0cdh, 41h
        endif
        db      9ah
        dw      (C0_BASE+L_33BF2-APP3_SEG*16), APP3_SEG
        db      9ah
        dw      EP_FAR_33D3A_OFF, EP_FAR_33D3A_SEG
        db      0c6h, 06h, 2eh, 0fh, 00h, 9ah
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
L_304ED                         equ     $+1
        db      0cbh, 0cdh, 0a4h
        endif
        if      FW_VERSION >= 114
        KEY_SOFT        EP_L_30BDD_OFF, EP_L_30BDD_SEG, (APP3_BASE+L_303F5-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, L_3056C-APP3_CSBASE, APP3_SEG
        else
        KEY_SOFT        EP_L_30BDD_OFF, EP_L_30BDD_SEG, EP_L_303F5_OFF, APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, EP_L_3056C_OFF, APP3_SEG
        endif
        else
        db      0cbh, 0cdh, 6bh, 0b0h, 00h, 0b4h, 03h, 0cdh, 6dh, 0beh
        db      74h, 22h
        mov     di, 710h
        mov     ax, ds
        mov     es, ax
        mov     cx, 100h
        rep movsb
        mov     si, 2374h
        mov     di, 10h
        mov     cx, 700h
        rep movsb
        call    fn_27F33
        call    L_279FD
        int     41h
        callf   APP3_SEG:EP_L_33BF2_OFF
        callf   EP_FAR_33D3A_SEG:EP_FAR_33D3A_OFF
        mov     byte ptr [C0_B_00F2E], 0
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_304ED:
        int     0a4h
        KEY_SOFT        (APP3_BASE+L_30BDD-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_303F5-APP3_SEG*16), APP3_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_3056C-APP3_SEG*16), APP3_SEG
        endif
        DISP_CLEAR
        DISP_BOX        00h, 00h, 0f7h, 31h
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      0f7h, 01h, 31h
        mov     si, 1
        DISP_BMP        0fh, 10h, 01h
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "OTHERS"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "INIT"
        DISP_SOFTKEY    03h, DISP_SK_PLAIN, "VER."
        if      FW_VERSION >= 120
        DISP_TEXT       3ch, 0ah, "Operating system:     "
        else
        DISP_TEXT       3ch, 0ah, "Operating system:    "
        endif
        if      FW_VERSION >= 112
        mov     al, 1
        mov     cl, 0a2h
        mov     ch, 0ah
        int     0dah
        if      FW_VERSION >= 120
        DISP_TEXT       0a2h, 0ah, "1.2    "
        endif
        retf
L_3056C:
        int     0dbh
        if      FW_VERSION >= 114
        KEY_UP          15h, far_30679-APP3_CSBASE, APP3_SEG
        retf
        else
        KEY_UP          15h, EP_FAR_30679_OFF, APP3_SEG
        db      0cbh
        endif
        else
        if      FW_VERSION >= 110
        db      0b0h, 01h, 0b1h, 0a2h, 0b5h
L_3056C                         equ     $+4
        db      0ah, 0cdh, 0dah, 0cbh, 0cdh, 0dbh
        KEY_UP          15h, EP_FAR_30679_OFF, APP3_SEG
        else
        db      0b0h, 01h, 0b1h
        mov     byte ptr [A3_B_00AB5], al
        int     0dah
        retf
L_3056C:
        db      0cdh, 0dbh
        KEY_UP          15h, (APP3_BASE+far_30679-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
        endif
far_30679:
        DISP_ERASE      3ch, 1eh, 96h, 10h
        db      0cbh
isr_30E5F:
        push    cs
        if      FW_VERSION >= 114
        call    L_308B2
        else
        db      0e8h, 3dh, 00h
        endif
        iret
L_30876:
        DISP_CLEAR
        DISP_SOFTKEY    01h, DISP_SK_BOX,    "PAD"
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "MEMORY"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "JOG"
        int     0a4h
        if      FW_VERSION >= 114
        KEY_DOWN        10h, EP_L_308B2_OFF, APP3_SEG
        KEY_DOWN        11h, L_30F5E-APP3_CSBASE, APP3_SEG
        KEY_DOWN        12h, L_30FE6-APP3_CSBASE, APP3_SEG
        db      0c3h
L_308B2:
        call    L_30876
        else
        if      FW_VERSION >= 110
        KEY_DOWN        10h, EP_L_308B2_OFF, APP3_SEG
        else
        KEY_DOWN        10h, (APP3_BASE+L_306C2-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        11h, EP_L_30F5E_OFF, APP3_SEG
        KEY_DOWN        12h, (APP3_BASE+L_30706-APP3_SEG*16), APP3_SEG
        if      FW_VERSION <> 107
L_308B2                         equ     $+1
        endif
L_306C2                         equ     $+1
        db      0c3h
L_306C2_112:
        db      0e8h
        db      0c1h, 0ffh
        endif
        KEY_DOWN        22h, (APP3_BASE+L_30675-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        21h, L_30F24-APP3_CSBASE, APP3_SEG
        else
        KEY_DOWN        21h, EP_L_30F24_OFF, APP3_SEG
        endif
        DISP_TEXT       58h, 01h, "[ PAD TEST ]"
        DISP_HLINE      00h, 09h, 0f8h
        DISP_TEXT       1eh, 15h, "    PAD:          SLIDER:      "
        DISP_TEXT       1eh, 23h, "Velocty       After touch      "
        DISP_BOX        48h, 21h, 18h, 0bh
        DISP_BOX        0b4h, 21h, 18h, 0bh
        db      0cbh
L_30F24:
        mov     al, byte ptr [P_2A89]
        int     0f6h
        push    bx
        sub     ah, ah
        DISP_NUM        0b7h, 23h, 03h
        mov     al, byte ptr [P_2A89]
        inc     al
        DISP_NUM        4eh, 15h, 02h
        mov     al, byte ptr [EP_L_251DA_OFF]
        sub     ah, ah
        DISP_NUM        4ch, 23h, 03h
        db      58h, 2ah
        db      0e4h
        DISP_NUM        0b7h, 15h, 03h
        DISP_FLUSH
        db      0cbh
L_30675:
        mov     byte ptr [P_2A89], ah
        mov     byte ptr [EP_L_251DA_OFF], cl
        retf
L_30F5E:
        call    L_30876
        DISP_TEXT       43h, 01h, "[ CPU Memory Test ]"
        DISP_HLINE      00h, 09h, 0f8h
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "DO IT"
        if      FW_VERSION < 112
        KEY_DOWN        15h, (APP3_BASE+L_30158-APP3_SEG*16), APP3_SEG
        db      0cbh
L_30158:
        db      0cdh
        cmc
        jb      L_306DF
        DISP_MSG        "      Memory test OK !"
        endif
        if      FW_VERSION >= 120
        KEY_DOWN        15h, (APP3_BASE+L_30F94-APP3_SEG*16), APP3_SEG
        retf
L_30F94:
        db      0cdh, 0f5h, 72h, 27h
        DISP_MSG        "      Memory test OK !"
        db      0cdh, 0a5h
        db      0cdh, 0b9h, 0bh, 0c0h, 74h
        cli
        push    cs
        call    L_308B2
        retf
        DISP_MSG        "      Memory test NG !"
        endif
        if      FW_VERSION < 112
        int     0a5h
loop_30FDB:
        int     0b9h
        or      ax, ax
        je      loop_30FDB
        push    cs
        db      0e8h, 0e2h, 0feh
        retf
L_306DF:
        DISP_MSG        "      Memory test NG !"
        db      0cdh
        movsw
L_306FB:
        int     0b9h
        or      ax, ax
        je      L_306FB
        push    cs
        db      0e8h, 0bbh, 0feh
        retf
L_30706:
        db      0e8h, 7bh, 0feh, 0c7h, 06h
        elseif  FW_VERSION < 114
        KEY_DOWN        15h, (APP3_BASE+FAR_307B6-APP3_SEG*16), APP3_SEG
far_307B6                       equ     $+1
        db      0cbh, 0cdh, 0f5h, 72h, 27h
        DISP_MSG        "      Memory test OK !"
        db      0cdh, 0a5h, 0cdh, 0b9h, 0bh, 0c0h, 74h, 0fah, 0eh, 0e8h, 0e2h
        db      0feh, 0cbh
        DISP_MSG        "      Memory test NG !"
        db      0cdh, 0a5h, 0cdh, 0b9h
L_30FE6                         equ     $+9
L_30706                         equ     $+9
        db      0bh, 0c0h, 74h, 0fah, 0eh, 0e8h, 0bbh, 0feh, 0cbh, 0e8h, 7bh, 0feh, 0c7h, 06h
        elseif  FW_VERSION < 120
        KEY_DOWN        15h, (APP3_BASE+FAR_309A6-APP3_SEG*16), APP3_SEG
far_309A6                       equ     $+1
        db      0cbh, 0cdh, 0f5h, 72h, 27h
        DISP_MSG        "      Memory test OK !"
        db      0cdh, 0a5h, 0cdh, 0b9h, 0bh, 0c0h, 74h, 0fah, 0eh, 0e8h, 0e2h
        db      0feh, 0cbh
        DISP_MSG        "      Memory test NG !"
        db      0cdh, 0a5h, 0cdh, 0b9h
L_30FE6                         equ     $+9
L_30706                         equ     $+9
        db      0bh, 0c0h, 74h, 0fah, 0eh, 0e8h, 0bbh, 0feh, 0cbh, 0e8h, 7bh, 0feh, 0c7h, 06h
        else
        db      0cdh
        movsw
loop_30FDB:
        int     0b9h
        or      ax, ax
        je      loop_30FDB
        push    cs
        call    L_308B2
        retf
L_30FE6:
        call    L_30876
        db      0c7h, 06h
        endif
        if      FW_VERSION >= 114
        je      L_30A29
        else
        db      74h, 2ah
        endif
        add     byte ptr [bx+si], al
        mov     word ptr [A3_W_02A76], 0
        mov     word ptr [A3_W_02A78], 0
        mov     word ptr [A3_W_02A7A], 0
        if      FW_VERSION < 114
        KEY_DOWN        21h, EP_L_3107B_OFF, APP3_SEG
        KEY_WHEEL       EP_L_31072_OFF, APP3_SEG
        else
        KEY_DOWN        21h, L_3107B-APP3_CSBASE, APP3_SEG
        KEY_WHEEL       L_31072-APP3_CSBASE, APP3_SEG
L_30A29                         equ     $+8
        endif
        DISP_TEXT       58h, 01h, "[ JOG TEST ]"
        DISP_HLINE      00h, 09h, 0f8h
        DISP_TEXT       1eh, 15h, "    JOG_L:        JOG_R:       "
        DISP_TEXT       1eh, 15h, "         :             :       "
        retf
L_31072:
        add     word ptr [A3_W_02A7A], ax
        add     word ptr [A3_W_02A78], cx
        retf
L_3107B:
        int     69h
        add     word ptr [A3_W_02A76], ax
        add     word ptr [A3_W_02A74], cx
        mov     ax, word ptr [A3_W_02A76]
        mov     dx, 0
        DISP_NUM        0aeh, 15h, 06h
        mov     ax, word ptr [A3_W_02A74]
        mov     dx, 0
L_3025D                         equ     $+2
        DISP_NUM        5ah, 15h, 06h
        mov     ax, word ptr [A3_W_02A7A]
        mov     dx, 0
        DISP_NUM        0aeh, 1fh, 06h
        mov     ax, word ptr [A3_W_02A78]
        mov     dx, 0
        DISP_NUM        5ah, 1fh, 06h
        DISP_FLUSH
        retf
        db      00h
L_310BA:
        cmp     byte ptr [C0_B_00F2F], 3
        jne     tgt_310C2
        retf
tgt_310C2:
        mov     al, 0
        int     0c7h
        mov     al, 9
        mov     byte ptr [C0_B_00F2F], al
        int     0adh
        int     0a4h
        if      FW_VERSION >= 110
        KEY_DOWN        20h, L_302E7-APP3_CSBASE, APP3_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        22h, L_3141B-APP3_CSBASE, APP3_SEG
        else
        KEY_DOWN        22h, (APP3_BASE+L_30B3B-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        0dh, EP_L_26957_OFF, APP3_SEG
        KEY_DOWN        2eh, EP_L_2B9A7_OFF, APP3_SEG
        KEY_DOWN        2fh, EP_L_2712B_OFF, APP3_SEG
        else
        KEY_DOWN        20h, (APP3_BASE+L_302E7-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_3141B-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0dh, EP_L_26957_OFF, APP3_SEG
        KEY_DOWN        2eh, (APP3_BASE+L_2B9A7-APP3_SEG*16), APP3_SEG
        KEY_DOWN        2fh, (APP3_BASE+L_2712B-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        26h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 114
        call    fn_31396
        mov     al, byte ptr es:[si+13h]
        int     7bh
        mov     byte ptr [C0_B_02A96], ah
        call    fn_3137F
        mov     al, byte ptr es:[si+16h]
        mov     byte ptr [C0_B_02A97], al
        callf   [P_2A90]
        elseif  FW_VERSION >= 110
        db      0e8h, 8ch, 02h, 26h, 8ah, 44h, 13h, 0cdh, 7bh, 88h, 26h
        db      86h, 2ah, 0e8h, 68h, 02h, 26h, 8ah, 44h, 16h, 0a2h, 87h, 2ah, 0ffh, 1eh, 80h, 2ah
        else
        db      0e8h, 8ch
        add     ah, byte ptr [448ah]
        adc     cx, bp
        jnp     L_3025D
        xchg    byte ptr es:[bp+si], ch
        call    fn_3137F
        mov     al, byte ptr es:[si+16h]
        mov     byte ptr [C0_B_02A97], al
        callf   [P_2A90]
        endif
        retf
L_302E7:
        DISP_CLEAR
        DISP_HLINE      00h, 00h, 0d8h
        DISP_HDOTS      00h, 0ah, 0d8h
        DISP_HLINE      0d8h, 0ah, 21h
        DISP_HLINE      00h, 30h, 0f8h
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      00h, 00h, 30h
        DISP_VLINE      0d8h, 00h, 0bh
        DISP_VLINE      0d9h, 01h, 0ah
        DISP_VLINE      0f6h, 0ah, 26h
        DISP_VLINE      0f7h, 0bh, 25h
        DISP_TEXT       07h, 14h, "Parameter:"
        DISP_TEXT       84h, 0eh, "High range:"
        DISP_TEXT       84h, 18h, "Low  range:"
        DISP_TEXT       06h, 24h, "Assign NV slider to ctrl change:"
        db      0beh, 18h
        db      00h
        DISP_BMP        6eh, 0ch, 18h
        DISP_TEXT       06h, 02h, "Assign note:OFF                    "
        if      FW_VERSION >= 120
        call    L_311F4
        db      0ffh, 16h, 94h, 2ah, 0cbh
L_311F4:
        call    fn_31396
        db      26h, 8ah, 44h, 13h, 0a2h
        db      99h, 2ah, 2ah, 0e4h, 3ch, 00h
        je      L_31251
        db      8ah, 26h, 96h, 2ah, 50h
        else
        db      0e8h, 05h, 00h, 0ffh, 16h, 84h, 2ah, 0cbh, 0e8h, 9fh, 01h, 26h, 8ah, 44h, 13h, 0a2h
        db      89h, 2ah, 2ah, 0e4h, 3ch, 00h, 74h, 4dh, 8ah, 26h, 86h, 2ah, 50h
        endif
        DISP_NOTE_CHAN  4eh, 02h
        DISP_TEXT       72h, 02h, "-(No sound)"
        if      FW_VERSION >= 112
        db      0cdh, 0c5h, 81h, 0c6h, 0deh, 07h, 58h, 2ch, 23h, 0b4h, 00h, 0c1h
        db      0e0h, 02h, 03h, 0f0h, 26h, 8bh, 04h, 26h, 8bh, 54h, 02h, 8bh, 0f0h, 0bh, 0c2h, 74h
        db      0dh, 83h, 0c6h, 12h, 0b1h, 78h, 0b5h, 02h, 0b4h, 10h, 0b3h, 05h, 0cdh, 90h, 0e8h, 32h
        if      FW_VERSION >= 120
        db      01h, 26h, 8ah, 44h, 16h
L_31251:
        db      24h, 03h, 0a2h, 97h, 2ah, 8ch, 0dah
        else
        db      01h, 26h, 8ah, 44h, 16h, 24h, 03h, 0a2h, 87h, 2ah, 8ch, 0dah
        endif
        if      FW_VERSION >= 114
        DISP_TEXT_IDX   42h, 14h, (APP3_BASE+L_251E7-APPDATA_SEG*16), (APP3_BASE+L_251ED-APPDATA_SEG*16)
        if      FW_VERSION >= 120
        call    fn_31AD8
        db      8ah, 1eh, 97h, 2ah, 2ah, 0ffh, 0d1h
        else
        db      0e8h, 73h, 08h, 8ah, 1eh, 87h, 2ah, 2ah, 0ffh, 0d1h
        endif
        db      0e3h
        else
        DISP_TEXT_IDX   42h, 14h, 02a87h, 02a8dh
        db      0e8h, 73h, 08h, 8ah, 1eh, 87h, 2ah, 2ah, 0ffh, 0d1h, 0e3h
        endif
        else
        db      0cdh, 0c5h
        db      81h, 0c6h, 0deh, 07h, 58h, 2ch, 23h, 0b4h, 00h, 0c1h, 0e0h, 02h, 03h, 0f0h, 26h, 8bh
        db      04h, 26h, 8bh, 54h, 02h, 8bh, 0f0h, 0bh, 0c2h, 74h, 0dh, 83h, 0c6h, 12h, 0b1h, 78h
        db      0b5h, 02h, 0b4h, 10h, 0b3h, 05h, 0cdh, 90h, 0e8h, 32h, 01h, 26h, 8ah, 44h, 16h, 24h
        db      03h, 0a2h, 87h, 2ah, 8ch, 0dah
        DISP_TEXT_IDX   42h, 14h, 02a87h, 02a8dh
        db      0e8h, 73h, 08h, 8ah, 1eh, 87h, 2ah, 2ah, 0ffh, 0d1h, 0e3h
        endif
        call    word ptr cs:[bx+TBL_3128E-APP3_CSBASE]
        DISP_TEXT       0c6h, 24h, "OFF"
        db      0a0h
        db      0c2h, 07h, 3ch, 00h, 75h, 01h, 0c3h, 0feh, 0c8h, 2ah, 0e4h
        DISP_NUM        0c6h, 24h, 03h
        db      0c3h
TBL_3128E:
        dw      tgt_31297-APP3_CSBASE, tgt_3132B-APP3_CSBASE, tgt_3132B-APP3_CSBASE, tgt_312E1-APP3_CSBASE
        ret
tgt_31297:
        push    ax
        mov     al, ah
        db      98h
        or      ah, ah
        js      L_312AE
        DISP_NUM        0cch, 0eh, 03h
        DISP_TEXT       0c6h, 0eh, "+"
        if      FW_VERSION >= 120
        jmp     SHORT L_312BD
        else
        db      0ebh, 0fh
        endif
L_312AE:
        db      0f7h, 0d8h
        DISP_NUM        0cch, 0eh, 03h
        DISP_TEXT       0c6h, 0eh, "-"
        if      FW_VERSION >= 114
L_312BD:
        db      58h, 98h, 0ah, 0e4h
        js      L_312D1
        DISP_NUM        0cch, 18h, 03h
        DISP_TEXT       0c6h, 18h, "+"
        db      0c3h
L_312D1:
        db      0f7h, 0d8h
        DISP_NUM        0cch, 18h, 03h
        DISP_TEXT       0c6h, 18h, "-"
        db      0c3h
tgt_312E1:
        push    ax
        mov     al, ah
        db      98h
        or      ah, ah
        js      L_312F8
        DISP_NUM        0cch, 0eh, 03h
        DISP_TEXT       0c6h, 0eh, "+"
        jmp     SHORT L_31307
L_312F8:
        db      0f7h, 0d8h
        DISP_NUM        0cch, 0eh, 03h
        DISP_TEXT       0c6h, 0eh, "-"
        endif
L_31307:
        db      58h, 98h
d_a3_tbl_0e823:
        db      0ah, 0e4h
        js      L_3131B
        DISP_NUM        0cch, 18h, 03h
        DISP_TEXT       0c6h, 18h, "+"
        db      0c3h
L_3131B:
        db      0f7h
        db      0d8h
        if      FW_VERSION < 114
        DISP_NUM        0cch, 18h, 03h
        DISP_TEXT       0c6h, 18h, "-"
        db      0c3h
tgt_312E1:
        push    ax
        db      8ah, 0c4h, 98h, 0ah, 0e4h, 78h, 0fh
        DISP_NUM        0cch, 0eh, 03h
        DISP_TEXT       0c6h, 0eh, "+"
        db      0ebh, 0fh, 0f7h, 0d8h
        DISP_NUM        0cch, 0eh, 03h
        DISP_TEXT       0c6h, 0eh, "-"
        db      58h, 98h, 0ah, 0e4h, 78h, 0eh
        DISP_NUM        0cch, 18h, 03h
        DISP_TEXT       0c6h, 18h, "+"
        db      0c3h, 0f7h, 0d8h
        endif
        DISP_NUM        0cch, 18h, 03h
        DISP_TEXT       0c6h, 18h, "-"
        db      0c3h
tgt_3132B:
        push    ax
        mov     al, ah
        sub     ah, ah
        DISP_NUM        0c6h, 0eh, 03h
        db      58h, 2ah, 0e4h
        DISP_NUM        0c6h, 18h, 03h
        if      FW_VERSION >= 110
        if      FW_VERSION >= 114
        db      0c3h
d_p_ab90:
        db      0b1h, 4dh, 0b5h, 02h, 0b0h, 8ch, 0cdh, 0b0h, 0c3h
d_p_ab99:
        db      0b1h, 42h, 0b5h
        db      14h, 0b0h, 25h, 0cdh, 0b0h, 0c3h
d_p_aba2:
        db      0b1h, 0c6h, 0b5h, 0eh, 0b0h, 13h, 0cdh, 0b0h, 0c3h
d_p_abab:
        db      0b1h
        db      0c6h, 0b5h, 0eh, 0b0h, 19h, 0cdh, 0b0h, 0c3h
d_p_abb4:
        db      0b1h, 0c6h, 0b5h, 18h, 0b0h, 13h, 0cdh, 0b0h
        db      0c3h
d_p_abbd:
        db      0b1h, 0c6h, 0b5h, 18h, 0b0h, 19h, 0cdh, 0b0h, 0c3h
d_p_abc6:
        db      0b1h, 0c6h, 0b5h, 24h, 0b0h, 13h
        db      0cdh, 0b0h, 0c3h
fn_3137F:
        call    fn_31396
        mov     al, byte ptr es:[si+13h]
        sub     al, 23h
        mov     ah, 18h
        mul     ah
        add     ax, 1eh
        push    ax
        int     0c5h
        pop     ax
        add     si, ax
        ret
fn_31396:
        int     0c5h
        add     si, 0
        ret
far_3139C:
        mov     word ptr [C0_W_02A94], P_AB90
        KEY_WHEEL       L_313EB-APP3_CSBASE, APP3_SEG
        KEY_DOWN        22h, L_3141B-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      0000h, 0000h, L_313D7-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_313C3-APP3_CSBASE, APP3_SEG
        retf
L_313C3:
        call    fn_31396
        cmp     byte ptr es:[si+13h], 0
        je      L_30DE4
        push    cs
        call    far_3142F
        retf
        else
L_30B62                         equ     $+1
        db      0c3h
d_p_ab90:
        db      0b1h, 4dh
L_30B6B                         equ     $+7
        db      0b5h, 02h, 0b0h, 8ch, 0cdh, 0b0h, 0c3h
d_p_ab99:
        db      0b1h, 42h, 0b5h, 14h, 0b0h, 25h, 0cdh, 0b0h, 0c3h
L_30B7D                         equ     $+9
L_30B74:
d_p_aba2:
        db      0b1h, 0c6h, 0b5h, 0eh, 0b0h, 13h, 0cdh, 0b0h, 0c3h
d_p_abab:
        db      0b1h, 0c6h, 0b5h, 0eh, 0b0h, 19h, 0cdh
L_30B8F                         equ     $+0bh
        db      0b0h, 0c3h
d_p_abb4:
        db      0b1h, 0c6h, 0b5h, 18h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
d_p_abbd:
        db      0b1h, 0c6h, 0b5h, 18h, 0b0h
        db      19h, 0cdh, 0b0h, 0c3h
d_p_abc6:
        db      0b1h, 0c6h, 0b5h, 24h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
fn_3137F:
        db      0e8h, 14h, 00h
        db      26h, 8ah, 44h, 13h, 2ch, 23h, 0b4h, 18h, 0f6h, 0e4h, 05h, 1eh, 00h, 50h, 0cdh, 0c5h
L_30ABC                         equ     $+0ah
        if      FW_VERSION >= 111
        db      58h, 03h, 0f0h, 0c3h, 0cdh, 0c5h, 83h, 0c6h, 00h, 0c3h, 0c7h, 06h, 84h, 2ah
        dw      (APP3_BASE+L_30B62-APP3_SEG*16)
        else
        db      58h, 03h, 0f0h, 0c3h, 0cdh, 0c5h, 83h, 0c6h, 00h, 0c3h, 0c7h, 06h, 84h, 2ah, 72h, 0abh
        endif
        KEY_WHEEL       (APP3_BASE+L_30B0B-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_30B3B-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_30AF7-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_30AE3-APP3_SEG*16), APP3_SEG
L_30AE3                         equ     $+1
        db      0cbh, 0e8h, 0d0h, 0ffh, 26h, 80h, 7ch, 13h, 00h, 74h, 05h, 0eh, 0e8h, 5eh, 00h, 0cbh
        endif
L_30DE4:
        if      FW_VERSION >= 114
        push    cs
        call    far_31AF9
        retf
L_313D7:
        call    fn_31396
        cmp     byte ptr es:[si+13h], 0
        if      FW_VERSION >= 120
        db      74h
        else
        je      br_313E0
        push    cs
        call    far_31478
        retf
        endif
br_313E0:
        if      FW_VERSION >= 120
        add     ax, 0e80eh
        xchg    bx, ax
        add.d0  bl, cl
        endif
        push    cs
        call    far_31AF9
        retf
L_313EB:
        push    ax
        call    fn_31396
        pop     ax
        add     al, byte ptr es:[si+13h]
        cmp     al, 23h
        jae     br_313FA
        mov     al, 23h
br_313FA:
        cmp     al, 62h
        jb      br_31400
        mov     al, 62h
br_31400:
        sub     al, cl
        jae     br_31406
        mov     al, 0
br_31406:
        cmp     al, 23h
        jae     br_3140C
        mov     al, 0
br_3140C:
        mov     byte ptr es:[si+13h], al
        int     7bh
        mov     byte ptr [C0_B_02A96], ah
        push    cs
        call    far_3139C
        retf
L_3141B:
        cmp     cl, 0
        jne     br_31421
        retf
br_31421:
        mov     byte ptr [C0_B_02A96], ah
        push    ax
        call    fn_31396
        pop     ax
        mov     byte ptr es:[si+13h], al
        retf
far_3142F:
        call    fn_31396
        cmp     byte ptr es:[si+13h], 0
        jne     X_3143C
        jmp     NEAR far_31AF9
X_3143C:
        mov     word ptr [C0_W_02A94], P_AB99
        KEY_WHEEL       L_3145B-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+FAR_31478-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_3139C-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_31AF9-APP3_SEG*16), APP3_SEG
L_3145B                         equ     $+1
        db      0cbh, 50h
        call    fn_3137F
        pop     ax
        add     al, byte ptr es:[si+16h]
        cmp     al, 3
        jb      br_3146A
        mov     al, 3
br_3146A:
        sub     al, cl
        jae     br_31470
        mov     al, 0
br_31470:
        mov     byte ptr es:[si+16h], al
        mov     byte ptr [C0_B_02A97], al
        retf
far_31478:
        call    fn_3147C
        retf
fn_3147C:
        cmp     byte ptr [C0_B_02A97], 0
        jne     br_31486
        jmp     NEAR L_30F55
br_31486:
        cmp     byte ptr [C0_B_02A97], 3
        jne     L_30EA2
        jmp     NEAR L_3106E
L_30EA2:
        mov     word ptr [C0_W_02A94], P_ABA2
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        FIELD_ENTRY     ds, C0_B_02A9A, 0, 0, 64h, intcb_314F8-APP3_CSBASE
        KEY_WHEEL2      L_31526-APP3_CSBASE, APP3_SEG, L_31509-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      L_314CB-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_314D4-APP3_CSBASE, APP3_SEG, L_314E6-APP3_CSBASE, APP3_SEG
        ret
L_314CB:
        push    cs
        call    L_310BA
        push    cs
        call    far_3142F
        retf
L_314D4:
        push    cs
        call    L_310BA
        push    cs
        call    far_3139C
        retf
L_314DD:
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        retf
L_314E6:
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        retf
L_314EF:
        db      0eh
        call    L_310BA
        push    cs
        call    far_31AF9
        retf
intcb_314F8:
        push    ax
        call    fn_31AD8
        pop     bx
        mov     ah, bl
        cmp     al, ah
        jb      br_31505
        mov     al, ah
br_31505:
        mov     word ptr es:[si], ax
        retf
L_31509:
        push    ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        call    fn_31AD8
        pop     bx
        add     ah, bl
        jae     br_3151C
        mov     ah, 64h
br_3151C:
        cmp     ah, ch
        jb      br_31522
        mov     ah, ch
br_31522:
        mov     word ptr es:[si], ax
        retf
L_31526:
        push    cx
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        call    fn_31AD8
        pop     bx
        sub     ah, bl
        jae     br_31539
        mov     ah, 0
br_31539:
        cmp     ah, al
        jge     br_3153F
        mov     al, ah
br_3153F:
        mov     word ptr es:[si], ax
        retf
L_30F55:
        mov     word ptr [C0_W_02A94], P_ABAB
        mov     byte ptr [C0_B_02A9B], 0
        mov     byte ptr [C0_B_02A9C], 0
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        KEY_DIGITS      L_315B1-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_31585-APP3_CSBASE, APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_31796-APP3_SEG*16), APP3_SEG, L_31772-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      L_314CB-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_314D4-APP3_CSBASE, APP3_SEG, L_314E6-APP3_CSBASE, APP3_SEG
        ret
L_31585:
        mov     byte ptr [C0_B_02A9A], 0
        mov     byte ptr [C0_B_02A9B], 1
        KEY_DOWN        20h, L_30D12-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0fh, L_315A8-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_31621-APP3_CSBASE, APP3_SEG
        retf
L_315A8:
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        retf
L_315B1:
        mov     ah, 0
        cmp     byte ptr [C0_B_02A9C], 0
        jne     L_30FD6
        mov     byte ptr [C0_B_02A9C], 1
        mov     byte ptr [C0_B_02A9A], 0
L_30FD6:
        mov     cx, ax
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0ah
        mul     ah
        add     ax, cx
        cmp     ax, 79h
        jb      L_30FE8
        mov     ax, cx
L_30FE8:
        mov     byte ptr [C0_B_02A9A], al
        KEY_DOWN        20h, L_30D12-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_31621-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0fh, L_315A8-APP3_CSBASE, APP3_SEG
        retf
        else
L_30AF7                         equ     $+5
        db      0eh, 0e8h, 23h, 07h, 0cbh, 0e8h, 0bch, 0ffh, 26h, 80h, 7ch, 13h, 00h, 74h, 05h, 0eh
L_30B0B                         equ     $+9
        db      0e8h, 93h, 00h, 0cbh, 0eh, 0e8h, 0fh, 07h, 0cbh, 50h, 0e8h, 0a7h, 0ffh, 58h, 26h, 02h
        db      44h, 13h, 3ch, 23h, 73h, 02h, 0b0h
        db      "#<br"
        db      02h, 0b0h, 62h, 2ah, 0c1h
        db      73h, 02h, 0b0h, 00h, 3ch, 23h, 73h, 02h, 0b0h, 00h, 26h, 88h, 44h, 13h, 0cdh, 7bh
L_30B3B                         equ     $+9
        db      88h, 26h, 86h, 2ah, 0eh, 0e8h, 82h, 0ffh, 0cbh, 80h, 0f9h, 00h, 75h, 01h, 0cbh, 88h
L_30B4F                         equ     $+0dh
        db      26h, 86h, 2ah, 50h, 0e8h, 6dh, 0ffh, 58h, 26h, 88h, 44h, 13h, 0cbh, 0e8h, 64h, 0ffh ; &.*P.m.X&.D...d.
        if      FW_VERSION >= 111
        db      26h, 80h, 7ch, 13h, 00h, 75h, 03h, 0e9h, 0bdh, 06h, 0c7h, 06h, 84h, 2ah
        dw      (APP3_BASE+L_30B6B-APP3_SEG*16)
        else
        db      26h, 80h, 7ch, 13h, 00h, 75h, 03h, 0e9h, 0bdh, 06h, 0c7h, 06h, 84h, 2ah, 7bh, 0abh
        endif
        KEY_WHEEL       (APP3_BASE+L_30B7B-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_30B98-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_30ABC-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_31219-APP3_SEG*16), APP3_SEG
L_30B7B                         equ     $+1
        db      0cbh, 50h, 0e8h, 20h, 0ffh, 58h, 26h, 02h
        db      44h, 16h, 3ch, 03h, 72h, 02h, 0b0h, 03h, 2ah, 0c1h, 73h, 02h, 0b0h, 00h, 26h, 88h
L_30B98                         equ     $+6
        db      44h, 16h, 0a2h, 87h, 2ah, 0cbh, 0e8h, 01h, 00h, 0cbh, 80h, 3eh, 87h, 2ah, 00h, 75h
        db      03h, 0e9h, 0bdh, 00h, 80h, 3eh, 87h, 2ah, 03h, 75h, 03h, 0e9h, 0cch, 01h, 0c7h, 06h
        if      FW_VERSION >= 111
        db      84h, 2ah
        dw      (APP3_BASE+L_30B74-APP3_SEG*16)
        db      0e8h, 3fh, 06h, 88h, 26h, 8ah, 2ah, 8ch, 0d9h, 0beh, 8ah, 2ah, 0b3h, 00h, 0b7h, 00h
        db      0bah, 64h, 00h, 0bfh
        dw      (APP3_BASE+L_30D1A-APP3_SEG*16)
        db      0cdh, 7eh
        else
        db      84h, 2ah, 84h, 0abh, 0e8h, 3fh, 06h, 88h, 26h, 8ah, 2ah, 8ch, 0d9h, 0beh, 8ah, 2ah
        db      0b3h, 00h, 0b7h, 00h, 0bah, 64h, 00h, 0bfh, 2ah, 0adh, 0cdh, 7eh
        endif
        KEY_WHEEL2      (APP3_BASE+L_30C46-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_30C29-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_30BEB-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_30BF4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_30C06-APP3_SEG*16), APP3_SEG
L_30BEB                         equ     $+1
        db      0c3h, 0eh, 0e8h, 0ebh, 0fbh, 0eh, 0e8h, 5ch
        if      FW_VERSION < 111
L_30BFD                         equ     $+0bh
        endif
L_30BF4                         equ     $+2
        if      FW_VERSION >= 111
L_30BFD                         equ     $+0bh
        endif
        db      0ffh, 0cbh, 0eh, 0e8h, 0e2h, 0fbh, 0eh, 0e8h, 0c0h, 0feh, 0cbh, 0eh, 0e8h, 0d9h, 0fbh, 0eh
        if      FW_VERSION < 111
L_30C0F                         equ     $+0dh
        endif
L_30C06                         equ     $+4
        if      FW_VERSION >= 111
L_30C0F                         equ     $+0dh
        endif
        db      0e8h, 93h, 0ffh, 0cbh, 0eh, 0e8h, 0d0h, 0fbh, 0eh, 0e8h, 0d2h, 02h, 0cbh, 0eh, 0e8h, 0c7h
L_30D1A                         equ     $+6
        db      0fbh, 0eh, 0e8h, 02h, 06h, 0cbh, 50h, 0e8h, 0dch, 05h, 5bh, 8ah, 0e3h, 3ah, 0c4h, 72h
L_30C29                         equ     $+7
        db      02h, 8ah, 0c4h, 26h, 89h, 04h, 0cbh, 50h, 0eh, 0e8h, 0ach, 0fbh, 0eh, 0e8h, 66h, 0ffh
        db      0e8h, 0c3h, 05h, 5bh, 02h, 0e3h, 73h, 02h, 0b4h, 64h, 3ah, 0e5h, 72h, 02h, 8ah, 0e5h
L_30C46                         equ     $+4
        db      26h, 89h, 04h, 0cbh, 51h, 0eh, 0e8h, 8fh, 0fbh, 0eh, 0e8h, 49h, 0ffh, 0e8h, 0a6h, 05h
        db      5bh, 2ah, 0e3h, 73h, 02h, 0b4h, 00h, 3ah, 0e0h, 7dh, 02h, 8ah, 0c4h, 26h, 89h, 04h
        if      FW_VERSION >= 111
        db      0cbh, 0c7h, 06h, 84h, 2ah
        dw      (APP3_BASE+L_30B7D-APP3_SEG*16)
        db      0c6h, 06h, 8bh, 2ah, 00h, 0c6h, 06h, 8ch, 2ah
        else
        db      0cbh, 0c7h, 06h, 84h, 2ah, 8dh, 0abh, 0c6h, 06h, 8bh, 2ah, 00h, 0c6h, 06h, 8ch, 2ah
        endif
        db      00h, 0e8h, 82h, 05h, 88h, 26h, 8ah, 2ah
        KEY_DIGITS      (APP3_BASE+L_30CD1-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_30CA5-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_30EB6-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_30E92-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_30BEB-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_30BF4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_30C06-APP3_SEG*16), APP3_SEG
L_30CA5                         equ     $+1
        db      0c3h, 0c6h, 06h, 8ah, 2ah, 00h, 0c6h, 06h, 8bh, 2ah, 01h
        KEY_DOWN        20h, EP_L_30D12_OFF, APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_30CC8-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_30D41-APP3_SEG*16), APP3_SEG
        if      FW_VERSION < 111
L_30CD1                         equ     $+0ah
        endif
L_30CC8                         equ     $+1
        if      FW_VERSION >= 111
L_30CD1                         equ     $+0ah
        endif
        db      0cbh, 0eh, 0e8h, 0eh, 0fbh, 0eh, 0e8h, 0c8h, 0feh, 0cbh, 0b4h
        db      00h, 80h, 3eh, 8ch, 2ah, 00h, 75h, 0ah, 0c6h, 06h, 8ch, 2ah, 01h, 0c6h, 06h, 8ah
        db      2ah, 00h, 8bh, 0c8h, 0a0h, 8ah, 2ah, 0b4h, 0ah, 0f6h, 0e4h, 03h, 0c1h, 3dh, 79h, 00h
        db      72h, 02h, 8bh, 0c1h, 0a2h, 8ah, 2ah
        KEY_DOWN        20h, EP_L_30D12_OFF, APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_30D41-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_30CC8-APP3_SEG*16), APP3_SEG
        db      0cbh
        endif
        else
        db      0c3h
d_p_ab90:
        db      0b1h, 4dh, 0b5h, 02h, 0b0h, 8ch, 0cdh, 0b0h, 0c3h
d_p_ab99:
        db      0b1h, 42h, 0b5h
        db      14h, 0b0h, 25h, 0cdh, 0b0h, 0c3h
d_p_aba2:
        db      0b1h, 0c6h, 0b5h, 0eh, 0b0h, 13h, 0cdh, 0b0h, 0c3h
d_p_abab:
        db      0b1h
        db      0c6h, 0b5h, 0eh, 0b0h, 19h, 0cdh, 0b0h, 0c3h
d_p_abb4:
        db      0b1h, 0c6h, 0b5h, 18h, 0b0h, 13h, 0cdh, 0b0h
        db      0c3h
d_p_abbd:
        db      0b1h, 0c6h, 0b5h, 18h, 0b0h, 19h, 0cdh, 0b0h, 0c3h
d_p_abc6:
        db      0b1h, 0c6h, 0b5h, 24h, 0b0h, 13h
        db      0cdh, 0b0h, 0c3h
fn_3137F:
        call    fn_31396
        mov     al, byte ptr es:[si+13h]
        sub     al, 23h
        mov     ah, 18h
        mul     ah
        add     ax, 1eh
        push    ax
        int     0c5h
        pop     ax
        add     si, ax
        ret
fn_31396:
        int     0c5h
        add     si, 0
        ret
far_3139C:
        mov     word ptr [C0_W_02A94], P_AB90
        KEY_WHEEL       (APP3_BASE+L_305AF-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_3141B-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_313C3-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_30587-APP3_SEG*16), APP3_SEG
        db      0cbh
L_30587:
        db      0e8h
        sar     bh, 1
        cmp     byte ptr es:[si+13h], 0
        je      L_30596
        push    cs
        call    far_3142F
        retf
L_30596:
        push    cs
        call    far_31AF9
        retf
L_313C3:
        call    fn_31396
        cmp     byte ptr es:[si+13h], 0
        je      br_313E0
        push    cs
        call    far_31478
        retf
br_313E0:
        push    cs
        call    far_31AF9
        retf
L_305AF:
        db      50h, 0e8h, 0a7h, 0ffh, 58h, 26h, 02h, 44h, 13h, 3ch, 23h, 73h, 02h, 0b0h, 23h, 3ch ; P...X&.D.<#s..#<
        db      62h
br_313FA:
        jb      br_31400
        mov     al, 62h
br_31400:
        sub     al, cl
        jae     br_31406
        mov     al, 0
br_31406:
        cmp     al, 23h
        jae     br_3140C
        mov     al, 0
br_3140C:
        mov     byte ptr es:[si+13h], al
        int     7bh
        mov     byte ptr [C0_B_02A96], ah
        push    cs
        call    far_3139C
        retf
L_3141B:
        cmp     cl, 0
        jne     br_31421
        retf
br_31421:
        mov     byte ptr [C0_B_02A96], ah
        push    ax
        call    fn_31396
        pop     ax
        mov     byte ptr es:[si+13h], al
        retf
far_3142F:
        call    fn_31396
        cmp     byte ptr es:[si+13h], 0
        jne     X_3143C
        jmp     NEAR far_31AF9
X_3143C:
        mov     word ptr [C0_W_02A94], P_AB99
        KEY_WHEEL       (APP3_BASE+L_3061F-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+FAR_31478-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_3139C-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_31AF9-APP3_SEG*16), APP3_SEG
        db      0cbh
L_3061F:
        db      50h
        call    fn_3137F
        pop     ax
        add     al, byte ptr es:[si+16h]
        cmp     al, 3
        jb      br_3146A
        mov     al, 3
br_3146A:
        sub     al, cl
        jae     br_31470
        mov     al, 0
br_31470:
        mov     byte ptr es:[si+16h], al
        mov     byte ptr [C0_B_02A97], al
        retf
far_31478:
        call    fn_3147C
        retf
fn_3147C:
        cmp     byte ptr [C0_B_02A97], 0
        jne     br_31486
        jmp     NEAR L_30F55
br_31486:
        cmp     byte ptr [C0_B_02A97], 3
        jne     L_30EA2
        jmp     NEAR L_3106E
L_30EA2:
        mov     word ptr [C0_W_02A94], P_ABA2
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        FIELD_ENTRY     ds, C0_B_02A9A, 0, 0, 64h, intcb_314F8-APP3_CSBASE
        KEY_WHEEL2      (APP3_BASE+L_31526-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_31509-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_3068F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_314D4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_314E6-APP3_SEG*16), APP3_SEG
        db      0c3h
L_3068F:
        db      0eh
        db      0e8h, 0ebh, 0fbh
        push    cs
        call    far_3142F
        retf
L_314D4:
        push    cs
        db      0e8h, 0e2h, 0fbh
        push    cs
        call    far_3139C
        retf
L_314DD:
        push    cs
        db      0e8h, 0d9h, 0fbh
        push    cs
        call    far_31478
        retf
L_314E6:
        push    cs
        db      0e8h, 0d0h, 0fbh
        push    cs
        call    far_317C0
        retf
L_314EF:
        db      0eh
        db      0e8h, 0c7h, 0fbh
        push    cs
        call    far_31AF9
        retf
intcb_314F8:
        push    ax
        call    fn_31AD8
        pop     bx
        mov     ah, bl
        cmp     al, ah
        jb      br_31505
        mov     al, ah
br_31505:
        mov     word ptr es:[si], ax
        retf
L_31509:
        push    ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        call    fn_31AD8
        pop     bx
        add     ah, bl
        jae     br_3151C
        mov     ah, 64h
br_3151C:
        cmp     ah, ch
        jb      br_31522
        mov     ah, ch
br_31522:
        mov     word ptr es:[si], ax
        retf
L_31526:
        push    cx
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        call    fn_31AD8
        pop     bx
        sub     ah, bl
        jae     br_31539
        mov     ah, 0
br_31539:
        cmp     ah, al
        jge     br_3153F
        mov     al, ah
br_3153F:
        mov     word ptr es:[si], ax
        retf
L_30F55:
        mov     word ptr [C0_W_02A94], P_ABAB
        mov     byte ptr [C0_B_02A9B], 0
        mov     byte ptr [C0_B_02A9C], 0
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        KEY_DIGITS      (APP3_BASE+L_315B1-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_30749-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_31796-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_31772-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_3068F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_314D4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_314E6-APP3_SEG*16), APP3_SEG
        db      0c3h
L_30749:
        db      0c6h
        push    es
        mov     ch, byte ptr [bp+si]
        db      00h, 0c6h
        push    es
        mov     bp, word ptr [bp+si]
        db      01h
        KEY_DOWN        20h, EP_L_30D12_OFF, APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_3076C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_307E5-APP3_SEG*16), APP3_SEG
        db      0cbh
L_3076C:
        db      0eh
        db      0e8h, 0eh, 0fbh
        push    cs
        call    far_31478
        retf
L_315B1:
        mov     ah, 0
        cmp     byte ptr [C0_B_02A9C], 0
        jne     L_30FD6
        mov     byte ptr [C0_B_02A9C], 1
        mov     byte ptr [C0_B_02A9A], 0
L_30FD6:
        mov     cx, ax
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0ah
        mul     ah
        add     ax, cx
        cmp     ax, 79h
        jb      br_316EC
        mov     ax, cx
br_316EC:
        mov     byte ptr [C0_B_02A9A], al
        KEY_DOWN        20h, EP_L_30D12_OFF, APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_307E5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_3076C-APP3_SEG*16), APP3_SEG
        db      0cbh
        endif
L_30D12:
        DISP_ERASE      0c5h, 0dh, 19h, 09h
        DISP_HLINE      0c5h, 16h, 19h
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0
        DISP_NUM        0cch, 0eh, 03h
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_31619
        DISP_TEXT       0c6h, 0eh, "+"
        retf
br_31619:
        DISP_TEXT       0c6h, 0eh, "-"
        if      FW_VERSION >= 110
        if      FW_VERSION < 114
        retf
L_30D41:
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_31641
        call    fn_31AD8
        mov     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_31635
        mov     al, ah
br_31635:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    L_30B98
        retf
br_31641:
        call    fn_31AD8
        mov     ah, 0
        sub     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_31650
        mov     al, ah
br_31650:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    L_30B98
        retf
        mov     word ptr [C0_W_02A94], P_ABAB
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        mov     byte ptr [C0_B_02A9B], 0
        mov     byte ptr [C0_B_02A9C], 0
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], al
        KEY_DIGITS      (APP3_BASE+L_30DE7-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_30DC4-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_30EB6-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_30E92-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_30BEB-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_30BF4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_30C06-APP3_SEG*16), APP3_SEG
        ret
L_30DC4:
        mov     byte ptr [C0_B_02A9A], 0
        mov     byte ptr [C0_B_02A9B], 1
        KEY_DOWN        20h, EP_L_30E28_OFF, APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_30CC8-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_30E57-APP3_SEG*16), APP3_SEG
        retf
L_30DE7:
        mov     ah, 0
        cmp     byte ptr [C0_B_02A9C], 0
        jne     L_310EC
        mov     byte ptr [C0_B_02A9C], 1
        mov     byte ptr [C0_B_02A9A], 0
L_310EC:
        mov     cx, ax
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0ah
        mul     ah
        add     ax, cx
        cmp     ax, 33h
        jb      br_316EC
        mov     ax, cx
br_316EC:
        mov     byte ptr [C0_B_02A9A], al
        KEY_DOWN        20h, EP_L_30E28_OFF, APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_30E57-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_30CC8-APP3_SEG*16), APP3_SEG
        endif
        else
        retf
L_307E5:
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_31641
        call    fn_31AD8
        mov     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_31635
        mov     al, ah
br_31635:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        retf
br_31641:
        call    fn_31AD8
        mov     ah, 0
        sub     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_31650
        mov     al, ah
br_31650:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        retf
L_3106E:
        mov     word ptr [C0_W_02A94], P_ABAB
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        mov     byte ptr [C0_B_02A9B], 0
        mov     byte ptr [C0_B_02A9C], 0
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], al
        KEY_DIGITS      (APP3_BASE+L_3088B-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_30868-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_31796-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_31772-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_3068F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_314D4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_314E6-APP3_SEG*16), APP3_SEG
        db      0c3h
L_30868:
        db      0c6h
        push    es
        mov     ch, byte ptr [bp+si]
        db      00h, 0c6h
        push    es
        mov     bp, word ptr [bp+si]
        db      01h
        KEY_DOWN        20h, EP_L_30E28_OFF, APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_3076C-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_308FB-APP3_SEG*16), APP3_SEG
        db      0cbh
L_3088B:
        db      0b4h
        add     byte ptr [bx+si+A3_TBL_08C3E], al
        sub     al, byte ptr [bx+si]
        jne     L_3089E
        mov     byte ptr [C0_B_02A9C], 1
        mov     byte ptr [C0_B_02A9A], 0
L_3089E:
        mov     cx, ax
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0ah
        mul     ah
        add     ax, cx
        cmp     ax, 33h
        jb      br_3171D
        mov     ax, cx
br_3171D:
        mov     byte ptr [C0_B_02A9A], al
        KEY_DOWN        20h, EP_L_30E28_OFF, APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_308FB-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_3076C-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
        if      FW_VERSION >= 114
L_31621:
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_31641
        call    fn_31AD8
        mov     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_31635
        mov     al, ah
br_31635:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        retf
br_31641:
        call    fn_31AD8
        mov     ah, 0
        sub     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_31650
        mov     al, ah
br_31650:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        retf
L_3106E:
        mov     word ptr [C0_W_02A94], P_ABAB
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        mov     byte ptr [C0_B_02A9B], 0
        mov     byte ptr [C0_B_02A9C], 0
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], al
        KEY_DIGITS      L_316C7-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_316A4-APP3_CSBASE, APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_31796-APP3_SEG*16), APP3_SEG, L_31772-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      L_314CB-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_314D4-APP3_CSBASE, APP3_SEG, L_314E6-APP3_CSBASE, APP3_SEG
        ret
L_316A4:
        mov     byte ptr [C0_B_02A9A], 0
        mov     byte ptr [C0_B_02A9B], 1
        KEY_DOWN        20h, L_30E28-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0fh, L_315A8-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_31737-APP3_CSBASE, APP3_SEG
        db      0cbh
L_316C7:
        mov     ah, 0
        cmp     byte ptr [C0_B_02A9C], 0
        jne     L_310EC
        mov     byte ptr [C0_B_02A9C], 1
        mov     byte ptr [C0_B_02A9A], 0
L_310EC:
        mov     cx, ax
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0ah
        mul     ah
        add     ax, cx
        cmp     ax, 33h
        jb      br_316EC
        mov     ax, cx
br_316EC:
        mov     byte ptr [C0_B_02A9A], al
        KEY_DOWN        20h, L_30E28-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_31737-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0fh, L_315A8-APP3_CSBASE, APP3_SEG
        retf
        endif
L_30E28:
        DISP_ERASE      0c5h, 0dh, 19h, 09h
        DISP_HLINE      0c5h, 16h, 13h
        if      FW_VERSION >= 114
        if      FW_VERSION >= 120
        db      0a0h, 9ah, 2ah
        db      0b4h, 00h
br_3171D                        equ     $+3
        DISP_NUM        0d2h, 0eh, 02h
        db      80h
        db      3eh
        db      9bh
        else
        db      0a0h
        mov     ch, byte ptr [bp+si]
        mov     ah, 0
        DISP_NUM        0d2h, 0eh, 02h
        db      80h, 3eh, 8bh
        endif
        sub     al, byte ptr [bx+si]
        jne     br_3172F
        else
        db      0a0h
        mov     ch, byte ptr [bp+si]
        mov     ah, 0
        DISP_NUM        0d2h, 0eh, 02h
        db      80h, 3eh
        db      8bh, 2ah, 00h, 75h, 08h
        endif
        DISP_TEXT       0c6h, 0eh, "+"
        if      FW_VERSION < 110
        retf
br_3172F:
        DISP_TEXT       0c6h, 0eh, "-"
        endif
        if      FW_VERSION >= 114
        retf
br_3172F:
        else
        db      0cbh
        endif
        if      FW_VERSION >= 110
        DISP_TEXT       0c6h, 0eh, "-"
        if      FW_VERSION < 114
        retf
L_30E57:
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_30F79
        call    fn_31AD8
        mov     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_30F6D
        mov     al, ah
br_30F6D:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    L_30B98
        retf
br_30F79:
        call    fn_31AD8
        mov     ah, 0
        sub     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_30F88
        mov     al, ah
br_30F88:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    L_30B98
        retf
L_30E92:
        push    ax
        push    cs
        call    L_310BA
        push    cs
        call    L_30B98
        call    fn_31AD8
        pop     bx
        cmp     bx, 40h
        jb      br_30FA8
        mov     bl, 40h
br_30FA8:
        add     ah, bl
        jno     br_30FAE
        mov     ah, ch
br_30FAE:
        cmp     ah, ch
        jle     br_30FB4
        mov     ah, ch
br_30FB4:
        mov     word ptr es:[si], ax
        retf
L_30EB6:
        push    cx
        push    cs
        call    L_310BA
        push    cs
        call    L_30B98
        call    fn_31AD8
        pop     bx
        cmp     bx, 40h
        jb      br_30FCC
        mov     bl, 40h
br_30FCC:
        sub     ah, bl
        jno     br_30FD2
        mov     ah, cl
br_30FD2:
        cmp     ah, cl
        jge     br_30FD8
        mov     ah, cl
br_30FD8:
        cmp     ah, al
        jge     br_30FDE
        mov     al, ah
br_30FDE:
        mov     word ptr es:[si], ax
        retf
L_30EE0:
        call    fn_30FE6
        retf
fn_30FE6:
        cmp     byte ptr [A3_B_02A87], 0
        jne     br_30FF0
        jmp     br_3107F
br_30FF0:
        cmp     byte ptr [A3_B_02A87], 3
        jne     br_30FFA
        jmp     br_31197
br_30FFA:
        mov     word ptr [C0_W_02A94], P_ABB4
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], al
        FIELD_ENTRY     ds, C0_B_02A9A, 0, 0, 64h, intcb_309D6-APP3_CSBASE
        KEY_WHEEL2      (APP3_BASE+L_30F66-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_30F43-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_30BEB-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_30BFD-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_30C0F-APP3_SEG*16), APP3_SEG
        ret
intcb_309D6:
        push    ax
        call    fn_31AD8
        pop     bx
        mov     al, bl
        cmp     ah, al
        jae     br_31041
        mov     ah, al
br_31041:
        mov     word ptr es:[si], ax
        retf
L_30F43:
        push    ax
        push    cs
        call    L_310BA
        push    cs
        call    L_30EE0
        call    fn_31AD8
        pop     bx
        add     al, bl
        jae     br_31058
        mov     al, 64h
br_31058:
        cmp     al, ch
        jb      br_3105E
        mov     al, ch
br_3105E:
        cmp     ah, al
        jge     br_31064
        mov     ah, al
br_31064:
        mov     word ptr es:[si], ax
        retf
L_30F66:
        push    cx
        push    cs
        call    L_310BA
        push    cs
        call    L_30EE0
        call    fn_31AD8
        pop     bx
        sub     al, bl
        jae     br_3107B
        mov     al, 0
br_3107B:
        mov     word ptr es:[si], ax
        retf
br_3107F:
        mov     word ptr [C0_W_02A94], P_ABBD
        mov     byte ptr [C0_B_02A9B], 0
        mov     byte ptr [C0_B_02A9C], 0
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        KEY_DIGITS      (APP3_BASE+L_30FEB-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_30FBF-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_311D4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_311AA-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_30BEB-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_30BFD-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_30C0F-APP3_SEG*16), APP3_SEG
        ret
L_30FBF:
        mov     byte ptr [C0_B_02A9A], 0
        mov     byte ptr [C0_B_02A9B], 1
        KEY_DOWN        20h, EP_L_3102C_OFF, APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_30FE2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_3105B-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
        if      FW_VERSION >= 114
L_31737:
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_31757
        call    fn_31AD8
        mov     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_3174B
        mov     al, ah
br_3174B:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        retf
br_31757:
        call    fn_31AD8
        mov     ah, 0
        sub     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_31766
        mov     al, ah
br_31766:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        retf
L_31772:
        push    ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        call    fn_31AD8
        pop     bx
        cmp     bx, 40h
        jb      br_31786
        mov     bl, 40h
br_31786:
        add     ah, bl
        jno     br_3178C
        mov     ah, ch
br_3178C:
        cmp     ah, ch
        jle     br_31792
        mov     ah, ch
br_31792:
        mov     word ptr es:[si], ax
        retf
L_31796:
        push    cx
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        call    fn_31AD8
        pop     bx
        cmp     bx, 40h
        jb      br_317AA
        mov     bl, 40h
br_317AA:
        sub     ah, bl
        jno     br_317B0
        mov     ah, cl
br_317B0:
        cmp     ah, cl
        jge     br_317B6
        mov     ah, cl
br_317B6:
        cmp     ah, al
        jge     br_317BC
        mov     al, ah
br_317BC:
        mov     word ptr es:[si], ax
        retf
far_317C0:
        call    fn_317C4
        retf
fn_317C4:
        cmp     byte ptr [C0_B_02A97], 0
        jne     br_317CE
        jmp     NEAR L_3126F
br_317CE:
        cmp     byte ptr [C0_B_02A97], 3
        jne     br_317D8
        jmp     NEAR br_31975
br_317D8:
        mov     word ptr [C0_W_02A94], P_ABB4
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], al
        FIELD_ENTRY     ds, C0_B_02A9A, 0, 0, 64h, intcb_309D6-APP3_CSBASE
        KEY_WHEEL2      L_31846-APP3_CSBASE, APP3_SEG, L_31823-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      L_314CB-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_314DD-APP3_CSBASE, APP3_SEG, L_314EF-APP3_CSBASE, APP3_SEG
        ret
intcb_309D6:
        push    ax
        call    fn_31AD8
        pop     bx
        mov     al, bl
        cmp     ah, al
        jae     L_31231
        mov     ah, al
L_31231:
        mov     word ptr es:[si], ax
        retf
L_31823:
        push    ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        call    fn_31AD8
        pop     bx
        add     al, bl
        jae     br_31836
        mov     al, 64h
br_31836:
        cmp     al, ch
        jb      br_3183C
        mov     al, ch
br_3183C:
        cmp     ah, al
        jge     br_31842
        mov     ah, al
br_31842:
        mov     word ptr es:[si], ax
        retf
L_31846:
        push    cx
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        call    fn_31AD8
        pop     bx
        sub     al, bl
        jae     br_31859
        mov     al, 0
br_31859:
        mov     word ptr es:[si], ax
        retf
L_3126F:
        mov     word ptr [C0_W_02A94], P_ABBD
        mov     byte ptr [C0_B_02A9B], 0
        mov     byte ptr [C0_B_02A9C], 0
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        KEY_DIGITS      L_318CB-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_3189F-APP3_CSBASE, APP3_SEG
        KEY_WHEEL2      L_31AB4-APP3_CSBASE, APP3_SEG, L_31A8A-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      L_314CB-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_314DD-APP3_CSBASE, APP3_SEG, L_314EF-APP3_CSBASE, APP3_SEG
        ret
L_3189F:
        mov     byte ptr [C0_B_02A9A], 0
        mov     byte ptr [C0_B_02A9B], 1
        KEY_DOWN        20h, L_30AD0-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0fh, L_318C2-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_3193B-APP3_CSBASE, APP3_SEG
        else
L_30FE2:
L_30FEB                         equ     $+9
        db      0eh, 0e8h, 0f4h, 0f7h, 0eh, 0e8h, 0f6h, 0feh, 0cbh, 0b4h, 00h, 80h, 3eh, 8ch, 2ah, 00h
        db      75h, 0ah, 0c6h, 06h, 8ch, 2ah, 01h, 0c6h, 06h, 8ah, 2ah, 00h, 8bh, 0c8h, 0a0h, 8ah
        db      2ah, 0b4h, 0ah, 0f6h, 0e4h, 03h, 0c1h, 3dh, 79h, 00h, 72h, 02h, 8bh, 0c1h, 0a2h, 8ah
        db      2ah
        KEY_DOWN        20h, EP_L_3102C_OFF, APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_3105B-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_30FE2-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
        if      FW_VERSION >= 114
L_318C2:
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        retf
L_318CB:
        mov     ah, 0
        cmp     byte ptr [C0_B_02A9C], 0
        jne     br_318DE
        mov     byte ptr [C0_B_02A9C], 1
        mov     byte ptr [C0_B_02A9A], 0
br_318DE:
        mov     cx, ax
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0ah
        mul     ah
        add     ax, cx
        cmp     ax, 79h
        jb      br_318F0
        mov     ax, cx
br_318F0:
        mov     byte ptr [C0_B_02A9A], al
        KEY_DOWN        20h, L_30AD0-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_3193B-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0fh, L_318C2-APP3_CSBASE, APP3_SEG
        db      0cbh
        endif
        else
L_308FB:
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_31757
        call    fn_31AD8
        mov     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_3174B
        mov     al, ah
br_3174B:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        retf
br_31757:
        call    fn_31AD8
        mov     ah, 0
        sub     ah, byte ptr [C0_B_02A9A]
        cmp     al, ah
        jl      br_31766
        mov     al, ah
br_31766:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        retf
L_31772:
        push    ax
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        call    fn_31AD8
        pop     bx
        cmp     bx, 40h
        jb      br_31786
        mov     bl, 40h
br_31786:
        add     ah, bl
        jno     br_3178C
        mov     ah, ch
br_3178C:
        cmp     ah, ch
        jle     br_31792
        mov     ah, ch
br_31792:
        mov     word ptr es:[si], ax
        retf
L_31796:
        push    cx
        push    cs
        call    L_310BA
        push    cs
        call    far_31478
        call    fn_31AD8
        pop     bx
        cmp     bx, 40h
        jb      br_317AA
        mov     bl, 40h
br_317AA:
        sub     ah, bl
        jno     br_317B0
        mov     ah, cl
br_317B0:
        cmp     ah, cl
        jge     br_317B6
        mov     ah, cl
br_317B6:
        cmp     ah, al
        jge     br_317BC
        mov     al, ah
br_317BC:
        mov     word ptr es:[si], ax
        retf
far_317C0:
        call    fn_317C4
        retf
fn_317C4:
        cmp     byte ptr [C0_B_02A97], 0
        jne     br_317CE
        jmp     NEAR L_3126F
br_317CE:
        cmp     byte ptr [C0_B_02A97], 3
        jne     br_317D8
        jmp     NEAR br_31975
br_317D8:
        mov     word ptr [C0_W_02A94], P_ABB4
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], al
        FIELD_ENTRY     ds, C0_B_02A9A, 0, 0, 64h, intcb_309D6-APP3_CSBASE
        KEY_WHEEL2      (APP3_BASE+L_31846-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_31823-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_3068F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_314DD-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_314EF-APP3_SEG*16), APP3_SEG
        db      0c3h
intcb_309D6:
        db      50h
        call    fn_31AD8
        pop     bx
        mov     al, bl
        cmp     ah, al
        jae     L_31231
        mov     ah, al
L_31231:
        mov     word ptr es:[si], ax
        retf
L_31823:
        push    ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        call    fn_31AD8
        pop     bx
        add     al, bl
        jae     br_31836
        mov     al, 64h
br_31836:
        cmp     al, ch
        jb      br_3183C
        mov     al, ch
br_3183C:
        cmp     ah, al
        jge     br_31842
        mov     ah, al
br_31842:
        mov     word ptr es:[si], ax
        retf
L_31846:
        push    cx
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        call    fn_31AD8
        pop     bx
        sub     al, bl
        jae     br_31859
        mov     al, 0
br_31859:
        mov     word ptr es:[si], ax
        retf
L_3126F:
        mov     word ptr [C0_W_02A94], P_ABBD
        mov     byte ptr [C0_B_02A9B], 0
        mov     byte ptr [C0_B_02A9C], 0
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        KEY_DIGITS      (APP3_BASE+L_318CB-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_30A63-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_31AB4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_31A8A-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_3068F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_314DD-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_314EF-APP3_SEG*16), APP3_SEG
        db      0c3h
L_30A63:
        db      0c6h
        push    es
        mov     ch, byte ptr [bp+si]
        db      00h, 0c6h
        push    es
        mov     bp, word ptr [bp+si]
        db      01h
        KEY_DOWN        20h, (APP3_BASE+L_30AD0-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_30FE2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_3193B-APP3_SEG*16), APP3_SEG
        db      0cbh
L_30FE2:
        db      0eh
        db      0e8h, 0f4h, 0f7h
        push    cs
        call    far_317C0
        retf
L_318CB:
        mov     ah, 0
        cmp     byte ptr [C0_B_02A9C], 0
        jne     br_318DE
        mov     byte ptr [C0_B_02A9C], 1
        mov     byte ptr [C0_B_02A9A], 0
br_318DE:
        mov     cx, ax
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0ah
        mul     ah
        add     ax, cx
        cmp     ax, 79h
        jb      br_318F0
        mov     ax, cx
br_318F0:
        mov     byte ptr [C0_B_02A9A], al
        KEY_DOWN        20h, (APP3_BASE+L_30AD0-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_3193B-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_30FE2-APP3_SEG*16), APP3_SEG
        db      0cbh
        endif
L_30AD0:
        DISP_ERASE      0c5h, 17h, 19h, 09h
        DISP_HLINE      0c5h, 20h, 19h
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0
        DISP_NUM        0cch, 18h, 03h
        if      FW_VERSION >= 114
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_31933
        else
        db      80h, 3eh, 8bh, 2ah, 00h, 75h, 08h
        endif
        DISP_TEXT       0c6h, 18h, "+"
        if      FW_VERSION < 110
        retf
br_31933:
        DISP_TEXT       0c6h, 18h, "-"
        endif
        if      FW_VERSION >= 114
        retf
br_31933:
        else
        db      0cbh
        endif
        if      FW_VERSION >= 110
        DISP_TEXT       0c6h, 18h, "-"
        if      FW_VERSION >= 114
        db      0cbh
L_3193B:
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_3195A
        call    fn_31AD8
        mov     al, byte ptr [C0_B_02A9A]
        cmp     ah, al
        jg      br_3194E
        mov     ah, al
br_3194E:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        retf
br_3195A:
        call    fn_31AD8
        mov     al, 0
        sub     al, byte ptr [C0_B_02A9A]
        cmp     ah, al
        jg      br_31969
        mov     ah, al
br_31969:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        retf
br_31975:
        mov     word ptr [C0_W_02A94], P_ABBD
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        mov     byte ptr [C0_B_02A9B], 0
        mov     byte ptr [C0_B_02A9C], 0
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], al
        KEY_DIGITS      L_319E0-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_319BD-APP3_CSBASE, APP3_SEG
        KEY_WHEEL2      L_31AB4-APP3_CSBASE, APP3_SEG, L_31A8A-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      L_314CB-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_314DD-APP3_CSBASE, APP3_SEG, L_314EF-APP3_CSBASE, APP3_SEG
        ret
L_319BD:
        mov     byte ptr [C0_B_02A9A], 0
        mov     byte ptr [C0_B_02A9B], 1
        KEY_DOWN        20h, L_31A21-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0fh, L_318C2-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_31A50-APP3_CSBASE, APP3_SEG
L_319E0                         equ     $+1
        else
L_3105B                         equ     $+1
        db      0cbh, 80h, 3eh, 8bh, 2ah, 00h, 75h, 18h
        db      0e8h, 93h, 01h, 0a0h, 8ah, 2ah, 3ah, 0e0h, 7fh, 02h, 8ah, 0e0h, 26h, 89h, 04h, 0eh
        db      0e8h, 65h, 0f7h, 0eh, 0e8h, 67h, 0feh, 0cbh, 0e8h, 7bh, 01h, 0b0h, 00h, 2ah, 06h, 8ah
        db      2ah, 3ah, 0e0h, 7fh, 02h, 8ah, 0e0h, 26h, 89h, 04h, 0eh, 0e8h, 4ah, 0f7h, 0eh, 0e8h
        db      4ch, 0feh, 0cbh
br_31197:
        if      FW_VERSION >= 111
        db      0c7h, 06h, 84h, 2ah
        dw      (APP3_BASE+L_30B8F-APP3_SEG*16)
        db      0e8h, 5ah, 01h, 88h, 26h, 8ah, 2ah
        else
        db      0c7h, 06h, 84h, 2ah, 9fh, 0abh, 0e8h, 5ah, 01h, 88h, 26h, 8ah, 2ah
        endif
        db      0c6h, 06h, 8bh, 2ah, 00h, 0c6h, 06h, 8ch, 2ah, 00h, 0e8h, 49h, 01h, 0a2h, 8ah, 2ah
        KEY_DIGITS      (APP3_BASE+L_31100-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_310DD-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_311D4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_311AA-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_30BEB-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_30BFD-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_30C0F-APP3_SEG*16), APP3_SEG
L_310DD                         equ     $+1
        db      0c3h, 0c6h, 06h, 8ah, 2ah, 00h
        db      0c6h, 06h, 8bh, 2ah, 01h
        KEY_DOWN        20h, EP_L_31A21_OFF, APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_30FE2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_31170-APP3_SEG*16), APP3_SEG
        endif
L_31100                         equ     $+1
        db      0cbh, 0b4h, 00h
        else
L_3193B:
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_3195A
        call    fn_31AD8
        mov     al, byte ptr [C0_B_02A9A]
        cmp     ah, al
        jg      br_3194E
        mov     ah, al
br_3194E:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        retf
br_3195A:
        call    fn_31AD8
        mov     al, 0
        sub     al, byte ptr [C0_B_02A9A]
        cmp     ah, al
        jg      br_31969
        mov     ah, al
br_31969:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        retf
br_31975:
        mov     word ptr [C0_W_02A94], P_ABBD
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], ah
        mov     byte ptr [C0_B_02A9B], 0
        mov     byte ptr [C0_B_02A9C], 0
        call    fn_31AD8
        mov     byte ptr [C0_B_02A9A], al
        KEY_DIGITS      (APP3_BASE+L_30BA4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_30B81-APP3_SEG*16), APP3_SEG
        KEY_WHEEL2      (APP3_BASE+L_31AB4-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_31A8A-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      (APP3_BASE+L_3068F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_314DD-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_314EF-APP3_SEG*16), APP3_SEG
        db      0c3h
L_30B81:
        db      0c6h
        push    es
        mov     ch, byte ptr [bp+si]
        db      00h, 0c6h
        push    es
        mov     bp, word ptr [bp+si]
        db      01h
        KEY_DOWN        20h, EP_L_31A21_OFF, APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_30FE2-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_31170-APP3_SEG*16), APP3_SEG
        db      0cbh
L_30BA4:
        db      0b4h
        add     byte ptr [bx+si+A3_TBL_08C3E], al
        endif
        if      FW_VERSION >= 114
        cmp     byte ptr [C0_B_02A9C], 0
        jne     br_319F3
        mov     byte ptr [C0_B_02A9C], 1
        mov     byte ptr [C0_B_02A9A], 0
br_319F3:
        mov     cx, ax
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0ah
        mul     ah
        add     ax, cx
        cmp     ax, 33h
        jb      br_31A05
        mov     ax, cx
br_31A05:
        mov     byte ptr [C0_B_02A9A], al
        KEY_DOWN        20h, L_31A21-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0eh, L_31A50-APP3_CSBASE, APP3_SEG
        KEY_DOWN        0fh, L_318C2-APP3_CSBASE, APP3_SEG
        else
        if      FW_VERSION >= 110
        db      80h, 3eh, 8ch, 2ah, 00h, 75h, 0ah, 0c6h, 06h, 8ch, 2ah, 01h, 0c6h, 06h, 8ah, 2ah
        db      00h, 8bh, 0c8h, 0a0h, 8ah, 2ah, 0b4h, 0ah, 0f6h, 0e4h, 03h, 0c1h, 3dh, 33h, 00h, 72h
        db      02h, 8bh, 0c1h, 0a2h, 8ah, 2ah
        else
        sub     al, byte ptr [bx+si]
        jne     br_319F3
        mov     byte ptr [C0_B_02A9C], 1
        mov     byte ptr [C0_B_02A9A], 0
br_319F3:
        mov     cx, ax
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0ah
        mul     ah
        add     ax, cx
        cmp     ax, 33h
        jb      br_31A05
        mov     ax, cx
br_31A05:
        mov     byte ptr [C0_B_02A9A], al
        endif
        KEY_DOWN        20h, EP_L_31A21_OFF, APP3_SEG
        KEY_DOWN        0eh, (APP3_BASE+L_31170-APP3_SEG*16), APP3_SEG
        KEY_DOWN        0fh, (APP3_BASE+L_30FE2-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
L_31A21:
        DISP_ERASE      0c5h, 17h, 19h, 09h
        DISP_HLINE      0c5h, 20h, 13h
        mov     al, byte ptr [C0_B_02A9A]
        mov     ah, 0
        DISP_NUM        0d2h, 18h, 02h
        if      FW_VERSION >= 114
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_31A48
        else
        db      80h, 3eh, 8bh, 2ah, 00h, 75h, 08h
        endif
        DISP_TEXT       0c6h, 18h, "+"
        if      FW_VERSION < 110
        retf
br_31A48:
        DISP_TEXT       0c6h, 18h, "-"
        endif
        if      FW_VERSION >= 114
        retf
br_31A48:
        else
        db      0cbh
        endif
        if      FW_VERSION >= 110
        DISP_TEXT       0c6h, 18h, "-"
        if      FW_VERSION >= 114
        db      0cbh
L_31A50:
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_31A6F
        call    fn_31AD8
        mov     al, byte ptr [C0_B_02A9A]
        cmp     ah, al
        jg      br_31A63
        mov     ah, al
br_31A63:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        retf
br_31A6F:
        call    fn_31AD8
        mov     al, 0
        sub     al, byte ptr [C0_B_02A9A]
        cmp     ah, al
        jg      br_31A7E
        mov     ah, al
br_31A7E:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        retf
L_31A8A:
        push    ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        call    fn_31AD8
        pop     bx
        cmp     bx, 40h
        jb      br_31A9E
        mov     bl, 40h
br_31A9E:
        add     al, bl
        jno     br_31AA4
        mov     al, ch
br_31AA4:
        cmp     al, ch
        jle     br_31AAA
        mov     al, ch
br_31AAA:
        cmp     al, ah
        jle     br_31AB0
        mov     ah, al
br_31AB0:
        mov     word ptr es:[si], ax
        retf
L_31AB4:
        push    cx
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        call    fn_31AD8
loop_31AC0:
        pop     bx
        cmp     bx, 40h
        jb      br_31AC8
        mov     bl, 40h
br_31AC8:
        sub     al, bl
        jno     br_31ACE
        mov     al, cl
br_31ACE:
        cmp     al, cl
        jge     br_31AD4
        mov     al, cl
br_31AD4:
        mov     word ptr es:[si], ax
        retf
fn_31AD8:
        int     0c5h
        mov     al, byte ptr [C0_B_02A97]
        sub     ah, ah
        shl     ax, 1
        mov     bx, ax
        add     ax, 14h
        add     si, ax
        mov     ax, word ptr es:[si]
        mov     cx, word ptr cs:[bx+TBL_31AF1-APP3_CSBASE]
        ret
TBL_31AF1:
        db      88h, 78h, 00h, 64h, 00h, 64h, 0ceh, 32h
far_31AF9:
        mov     word ptr [C0_W_02A94], P_ABC6
        FIELD_WHEEL     ds, 7c2h, 0, 0, 80h, field_cb_none-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+FAR_3142F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_317C0-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        call    fn_31396
        cmp     byte ptr es:[si+13h], 0
        je      br_31B2D
        retf
br_31B2D:
        KEY_CURSOR      (APP3_BASE+FAR_3139C-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_3139C-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
L_31B40:
        mov     bx, 13eh
        int     0a9h
        jae     br_31B48
        retf
br_31B48:
        mov     bx, 144h
        int     0a9h
        jae     br_31B50
        retf
br_31B50:
        call    fn_280BD
        je      br_31B56
        retf
br_31B56:
        int     0bbh
        jae     L_3156D
        retf
L_3156D:
        mov     al, 2
        int     0c7h
        cmp     al, 0
        je      br_31B68
        mov     al, 0
        int     0c7h
        retf
br_31B68:
        int     0a4h
        KEY_DOWN        22h, L_31D61-APP3_CSBASE, APP3_SEG
        else
L_31170                         equ     $+1
        db      0cbh, 80h, 3eh
        db      8bh, 2ah, 00h, 75h, 18h, 0e8h, 7eh, 00h, 0a0h, 8ah, 2ah, 3ah, 0e0h, 7fh, 02h, 8ah
        db      0e0h, 26h, 89h, 04h, 0eh, 0e8h, 50h, 0f6h, 0eh, 0e8h, 52h, 0fdh, 0cbh, 0e8h, 66h, 00h
        db      0b0h, 00h, 2ah, 06h, 8ah, 2ah, 3ah, 0e0h, 7fh, 02h, 8ah, 0e0h, 26h, 89h, 04h, 0eh
L_311AA                         equ     $+8
        db      0e8h, 35h, 0f6h, 0eh, 0e8h, 37h, 0fdh, 0cbh, 50h, 0eh, 0e8h, 2bh, 0f6h, 0eh, 0e8h, 2dh
        db      0fdh, 0e8h, 42h, 00h, 5bh, 83h, 0fbh, 40h, 72h, 02h, 0b3h, 40h, 02h, 0c3h, 71h, 02h
        db      8ah, 0c5h, 3ah, 0c5h, 7eh, 02h, 8ah, 0c5h, 3ah, 0c4h, 7eh, 02h, 8ah, 0e0h, 26h, 89h
L_311D4                         equ     $+2
        db      04h, 0cbh, 51h, 0eh, 0e8h, 01h, 0f6h, 0eh, 0e8h, 03h, 0fdh, 0e8h, 18h, 00h, 5bh, 83h
        db      0fbh, 40h, 72h, 02h, 0b3h, 40h, 2ah, 0c3h, 71h, 02h, 8ah, 0c1h, 3ah, 0c1h, 7dh, 02h
fn_31AD8                        equ     $+6
        db      8ah, 0c1h, 26h, 89h, 04h, 0cbh, 0cdh, 0c5h, 0a0h, 87h, 2ah, 2ah, 0e4h, 0d1h, 0e0h, 8bh
        if      FW_VERSION >= 111
L_31313                         equ     $+0fh
        db      0d8h, 05h, 14h, 00h, 03h, 0f0h, 26h, 8bh, 04h, 2eh, 8bh, 8fh
        dw      (APP3_BASE+L_31313-APP3_SEG*16)
        db      0c3h, 88h
L_31219                         equ     $+7
        db      78h, 00h, 64h, 00h, 64h, 0ceh, 32h
        mov     word ptr [C0_W_02A94], P_ABC6
        db      8ch, 0d9h, 0beh
        db      0c2h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 80h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        else
        db      0d8h, 05h, 14h, 00h, 03h, 0f0h, 26h, 8bh, 04h
        mov     cx, word ptr cs:[bx+L_31313-APP3_CSBASE]
        db      0c3h
L_31313:
        db      88h
L_31219                         equ     $+7
        db      78h, 00h, 64h, 00h, 64h, 0ceh, 32h, 0c7h, 06h, 84h, 2ah, 0a8h, 0abh, 8ch, 0d9h, 0beh
        db      0c2h, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 80h, 00h, 0bfh, 0cfh, 18h, 0cdh, 7dh
        endif
        KEY_CURSOR      (APP3_BASE+L_30B4F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_30EE0-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0e8h, 71h, 0f8h, 26h, 80h, 7ch, 13h, 00h, 74h, 01h, 0cbh
        KEY_CURSOR      (APP3_BASE+L_30ABC-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_30ABC-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh
L_31B40:
        db      0bbh, 3eh
        db      01h, 0cdh, 0a9h, 73h, 01h, 0cbh, 0bbh, 44h, 01h, 0cdh, 0a9h, 73h, 01h, 0cbh
        call    fn_280BD
        db      74h, 01h, 0cbh, 0cdh, 0bbh, 73h, 01h, 0cbh, 0b0h, 02h, 0cdh, 0c7h, 3ch, 00h, 74h
        db      05h, 0b0h, 00h, 0cdh, 0c7h, 0cbh, 0cdh, 0a4h
        KEY_DOWN        22h, (APP3_BASE+L_31481-APP3_SEG*16), APP3_SEG
        endif
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, EP_LEVELS16_DO_IT_OFF, APP3_SEG
        KEY_DOWN        20h, EP_LEVELS16_WINDOW_DRAW_OFF, EP_LEVELS16_WINDOW_DRAW_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 114
        mov     al, byte ptr [C0_B_02AB8]
        int     7bh
        mov     byte ptr [C0_B_02AB9], ah
        push    cs
        call    L_30ED8
        retf
        else
        db      0a0h, 0a8h, 2ah, 0cdh, 7bh, 88h, 26h, 0a9h
        db      2ah, 0eh, 0e8h, 6dh, 01h, 0cbh
        endif
        else
L_31170:
        cmp     byte ptr [C0_B_02A9B], 0
        jne     br_31A6F
        call    fn_31AD8
        mov     al, byte ptr [C0_B_02A9A]
        cmp     ah, al
        jg      br_31A63
        mov     ah, al
br_31A63:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        retf
br_31A6F:
        call    fn_31AD8
        mov     al, 0
        sub     al, byte ptr [C0_B_02A9A]
        cmp     ah, al
        jg      br_31A7E
        mov     ah, al
br_31A7E:
        mov     word ptr es:[si], ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        retf
L_31A8A:
        push    ax
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        call    fn_31AD8
        pop     bx
        cmp     bx, 40h
        jb      br_31A9E
        mov     bl, 40h
br_31A9E:
        add     al, bl
        jno     br_31AA4
        mov     al, ch
br_31AA4:
        cmp     al, ch
        jle     br_31AAA
        mov     al, ch
br_31AAA:
        cmp     al, ah
        jle     br_31AB0
        mov     ah, al
br_31AB0:
        mov     word ptr es:[si], ax
        retf
L_31AB4:
        push    cx
        push    cs
        call    L_310BA
        push    cs
        call    far_317C0
        call    fn_31AD8
loop_31AC0:
        pop     bx
        cmp     bx, 40h
        jb      br_31AC8
        mov     bl, 40h
br_31AC8:
        sub     al, bl
        jno     br_31ACE
        mov     al, cl
br_31ACE:
        cmp     al, cl
        jge     br_31AD4
        mov     al, cl
br_31AD4:
        mov     word ptr es:[si], ax
        retf
fn_31AD8:
        int     0c5h
        mov     al, byte ptr [C0_B_02A97]
        sub     ah, ah
        shl     ax, 1
        mov     bx, ax
        add     ax, 14h
        add     si, ax
        mov     ax, word ptr es:[si]
        mov     cx, word ptr cs:[bx+TBL_31AF1-APP3_CSBASE]
        ret
TBL_31AF1:
        db      88h, 78h, 00h, 64h, 00h, 64h, 0ceh, 32h
far_31AF9:
        mov     word ptr [C0_W_02A94], P_ABC6
        FIELD_WHEEL     ds, 7c2h, 0, 0, 80h, field_cb_none-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+FAR_3142F-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_317C0-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        call    fn_31396
        cmp     byte ptr es:[si+13h], 0
        je      br_31B2D
        retf
br_31B2D:
        KEY_CURSOR      (APP3_BASE+FAR_3139C-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_3139C-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
L_31B40:
        mov     bx, 13eh
        int     0a9h
        jae     br_31B48
        retf
br_31B48:
        mov     bx, 144h
        int     0a9h
        jae     br_31B50
        retf
br_31B50:
        call    fn_280BD
        je      br_31B56
        retf
br_31B56:
        int     0bbh
        jae     L_3156D
        retf
L_3156D:
        mov     al, 2
        int     0c7h
        cmp     al, 0
        je      br_31B68
        mov     al, 0
        int     0c7h
        retf
br_31B68:
        int     0a4h
        KEY_DOWN        22h, (APP3_BASE+L_31D61-APP3_SEG*16), APP3_SEG
        KEY_DOWN        16h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        13h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        14h, (APP3_BASE+levels16_do_it-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_LEVELS16_WINDOW_DRAW_OFF, EP_LEVELS16_WINDOW_DRAW_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        mov     al, byte ptr [A3_B_02AA8]
        int     7bh
        mov     byte ptr [A3_B_02AA9], ah
        push    cs
        call    L_30ED8
        retf
        endif
levels16_window_draw:
        DISP_WIN_WIDE   "Assign 16 levels"
        DISP_TEXT       25h, 10h, "Note :--/OFF-"
        DISP_TEXT       25h, 1ah, "Param:"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "TurnON"
        if      FW_VERSION >= 114
        mov     al, byte ptr [C0_B_02AB8]
        mov     ah, byte ptr [C0_B_02AB9]
        else
        db      0a0h, 0a8h, 2ah, 8ah, 26h, 0a9h, 2ah
        endif
        DISP_NOTE_CHAN  49h, 10h
        mov     dx, ds
        DISP_TEXT_IDX   49h, 1ah, C0_B_02ABB, TBL_VELO_NOTEVAR_LABELS
        if      FW_VERSION >= 110
        if      FW_VERSION >= 114
        call    levels16_draw_note
        call    levels16_draw_type_row
        call    word ptr [C0_W_02AB6]
        retf
levels16_draw_note:
        if      FW_VERSION >= 120
        db      0a0h, 0b8h, 2ah, 3ch, 23h, 72h, 30h
        else
        db      0a0h, 0a8h, 2ah, 3ch, 23h, 72h, 30h
        endif
tgt_31C1F:
        cmp     al, 63h
        jae     br_31C4F
        push    ax
        int     0c5h
        add     si, 7deh
        pop     ax
tgt_31C2B:
        sub     al, 23h
        mov     ah, 0
        shl     ax, 2
        add     si, ax
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     si, ax
        or      ax, dx
        je      br_31C67
        add     si, 12h
        mov     cl, 73h
        mov     ch, 10h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        ret
br_31C4F:
        else
        db      0e8h, 08h, 00h, 0e8h, 65h
        db      00h, 0ffh, 16h, 0a6h, 2ah, 0cbh, 0a0h, 0a8h
        db      "*<#r0<cs"
        db      2ch, 50h, 0cdh, 0c5h, 81h, 0c6h, 0deh, 07h, 58h, 2ch, 23h, 0b4h, 00h, 0c1h, 0e0h, 02h
        db      03h, 0f0h, 26h, 8bh, 04h, 26h, 8bh, 54h, 02h, 8bh, 0f0h, 0bh, 0c2h, 74h, 26h, 83h
        db      0c6h, 12h, 0b1h, 73h, 0b5h, 10h, 0b4h, 10h, 0b3h, 05h, 0cdh, 90h, 0c3h
        endif
        else
        db      0e8h
        or      byte ptr [bx+si], al
        call    levels16_draw_type_row
        call    word ptr [C0_W_02AB6]
        retf
        db      0a0h, 0a8h, 2ah, 3ch, 23h, 72h, 30h
tgt_31C1F:
        cmp     al, 63h
        jae     br_31C4F
        push    ax
        int     0c5h
        add     si, 7deh
        pop     ax
tgt_31C2B:
        sub     al, 23h
        mov     ah, 0
        shl     ax, 2
        add     si, ax
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     si, ax
        or      ax, dx
        je      br_31C67
        add     si, 12h
        mov     cl, 73h
        mov     ch, 10h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        ret
br_31C4F:
        endif
        DISP_TEXT       49h, 10h, "--/OFF-(No sound)"
        ret
br_31C67:
        DISP_TEXT       73h, 10h, "(No sound)"
        ret
levels16_draw_type_row:
        cmp     byte ptr [C0_B_02ABB], 0
        jne     br_31C80
        ret
br_31C80:
        DISP_TEXT       25h, 24h, "Type :"
        mov     al, byte ptr [C0_B_02AB8]
        call    fn_3137F
        mov     al, byte ptr es:[si+16h]
        and     al, 3
        mov     byte ptr [G_NOTE_VAR_PARAM], al
        mov     dx, ds
        DISP_TEXT_IDX   49h, 24h, G_NOTE_VAR_PARAM, TBL_NOTE_VAR_PARAM_LABELS
        cmp     byte ptr [G_NOTE_VAR_PARAM], 0
        je      br_31CAF
        ret
br_31CAF:
        DISP_TEXT       74h, 24h, "Original^key^pad:"
        mov     al, byte ptr [P_2ABA]
        add     al, 4
        DISP_NUM        0d4h, 24h, 02h
        ret
        if      FW_VERSION >= 110
        if      FW_VERSION >= 114
cb_31CD2:
        DISP_CURSOR     49h, 10h, 8bh
        ret
cb_31CDB:
        DISP_CURSOR     49h, 1ah, 31h
        ret
cb_31CE4:
        DISP_CURSOR     49h, 24h, 25h
        ret
cb_31CED:
        DISP_CURSOR     0d4h, 24h, 0dh
        ret
levels16_do_it:
        mov     bl, byte ptr [C0_B_02AB8]
        mov     bh, byte ptr [C0_B_02AB9]
resume_31CFE:
        mov     cl, byte ptr [C0_B_02ABB]
        mov     ch, byte ptr [G_NOTE_VAR_PARAM]
        mov     dl, byte ptr [P_2ABA]
        mov     al, 1
        int     0c7h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_30ED8:
        mov     word ptr [C0_W_02AB6], cb_31CD2-APP3_CSBASE
        KEY_WHEEL       L_31D3B-APP3_CSBASE, APP3_SEG
        KEY_DOWN        22h, L_31D61-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, L_31D6F-APP3_CSBASE, APP3_SEG
        if      FW_VERSION >= 120
        db      0cbh
L_31D3B:
        db      02h, 06h, 0b8h, 2ah, 3ch, 23h
        jae     L_31D45
        db      0b0h
        db      23h
L_31D45:
        db      3ch, 62h
        jb      L_31D4B
        db      0b0h, 62h
L_31D4B:
        db      2ah, 0c1h, 73h
        add     dh, byte ptr [bx+si+A3_TBL_03C00]
        and     si, word ptr [bp+di+2]
        else
        db      0cbh
L_31D3B:
        add     al, byte ptr [C0_B_02AB8]
        cmp     al, 23h
        jae     L_31757
        endif
        mov     al, 23h
        if      FW_VERSION < 120
L_31757:
        cmp     al, 62h
        jb      L_3175D
        mov     al, 62h
L_3175D:
        sub     al, cl
        jae     L_31763
        mov     al, 0
L_31763:
        cmp     al, 23h
        jae     L_31769
        mov     al, 23h
L_31769:
        endif
        mov     byte ptr [C0_B_02AB8], al
        int     7bh
        mov     byte ptr [C0_B_02AB9], ah
        retf
L_31D61:
        cmp     cl, 0
        jne     br_31D67
        retf
br_31D67:
        mov     byte ptr [C0_B_02AB9], ah
        mov     byte ptr [C0_B_02AB8], al
        retf
L_31D6F:
        mov     word ptr [C0_W_02AB6], cb_31CDB-APP3_CSBASE
        mov     cx, ds
        mov     si, C0_B_02ABB
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_30ED8-APP3_SEG*16), APP3_SEG, L_31D99-APP3_CSBASE, APP3_SEG
        db      0cbh
L_31D99:
        cmp     byte ptr [C0_B_02ABB], 0
        jne     levels16_type_field
resume_31DA0:
        retf
levels16_type_field:
        mov     word ptr [C0_W_02AB6], cb_31CE4-APP3_CSBASE
        KEY_WHEEL2      L_31DDA-APP3_CSBASE, APP3_SEG, L_31DC4-APP3_CSBASE, APP3_SEG
        KEY_CURSOR      0000h, 0000h, L_31DF0-APP3_CSBASE, APP3_SEG, L_31D6F-APP3_CSBASE, APP3_SEG, 0000h, 0000h
        retf
L_31DC4:
        mov     al, byte ptr [C0_B_02AB8]
        call    fn_3137F
        mov     al, byte ptr es:[si+16h]
        cmp     al, 3
        jne     br_31DD3
        retf
br_31DD3:
        inc     al
        mov     byte ptr es:[si+16h], al
        retf
L_31DDA:
        mov     al, byte ptr [C0_B_02AB8]
        call    fn_3137F
        mov     al, byte ptr es:[si+16h]
        cmp     al, 0
        jne     br_31DE9
        retf
br_31DE9:
        dec     al
        mov     byte ptr es:[si+16h], al
        retf
L_31DF0:
        mov     al, byte ptr [C0_B_02AB8]
        call    fn_3137F
        mov     al, byte ptr es:[si+16h]
        cmp     al, 0
        je      br_31DFF
        retf
br_31DFF:
        mov     word ptr [C0_W_02AB6], cb_31CED-APP3_CSBASE
        FIELD_WHEEL     ds, P_2ABA, 0, 0, 9, field_cb_none-APP3_CSBASE
        KEY_CURSOR      L_31D99-APP3_CSBASE, APP3_SEG, 0000h, 0000h, L_31D6F-APP3_CSBASE, APP3_SEG, 0000h, 0000h
        if      FW_VERSION >= 120
        retf
L_3154A                         equ     $+1
        db      00h, 0e8h, 90h, 62h
        je      br_31E3C
        cmp     byte ptr [C0_B_00F2F], 3
        jne     br_31E37
        retf
br_31E37:
        je      br_31E3C
        jmp     far_31BD9
br_31E3C:
        mov     al, 8
        mov     byte ptr [C0_B_00F2F], al
        int     0adh
        call    fn_2823E
        callf   [C0_W_02AD0]
        retf
far_3185D:
        mov     word ptr [C0_W_02AD0], far_3185D-APP3_CSBASE
        mov     ax, word ptr [C0_W_02AD8]
        mov     bl, byte ptr [C0_B_02ADA]
        mov     bh, byte ptr [C0_B_02ADB]
        mov     word ptr [A3_W_0154D], ax
        mov     byte ptr [A3_B_0154F], bl
        mov     byte ptr [A3_B_01550], bh
        mov     ax, word ptr [C0_W_02ADC]
        mov     bl, byte ptr [C0_B_02ADE]
        mov     bh, byte ptr [C0_B_02ADF]
        mov     word ptr [A3_W_01551], ax
        mov     byte ptr [A3_B_01553], bl
        mov     byte ptr [A3_B_01554], bh
        push    cs
        call    far_3206C
        retf
far_31E82:
        int     0a4h
        int     0a4h
        else
L_3154A                         equ     $+2
        db      0cbh, 00h, 0e8h
        sahf
        db      62h, 74h, 0dh, 80h, 3eh, 2fh, 0fh, 03h, 75h, 01h, 0cbh, 74h, 03h, 0e9h, 8bh, 03h
        db      0b0h, 08h, 0a2h, 2fh, 0fh, 0cdh, 0adh, 0e8h, 06h, 64h, 0ffh, 1eh, 0c0h, 2ah, 0cbh
far_3185D:
        db      0c7h
        db      06h, 0c0h, 2ah, 8dh, 0b6h, 0a1h, 0c8h, 2ah, 8ah, 1eh, 0cah, 2ah, 8ah, 3eh, 0cbh, 2ah
        db      0a3h, 4dh, 15h, 88h, 1eh, 4fh, 15h, 88h, 3eh, 50h, 15h, 0a1h, 0cch, 2ah, 8ah, 1eh
        db      0ceh, 2ah, 8ah, 3eh, 0cfh, 2ah, 0a3h, 51h, 15h, 88h, 1eh, 53h, 15h, 88h, 3eh, 54h
        db      15h, 0eh, 0e8h, 0ebh, 01h, 0cbh, 0cdh, 0a4h, 0cdh, 0a4h
        endif
        KEY_DOWN        11h, EP_BR_321C7_OFF, APP3_SEG
        else
L_314FD                         equ     $+9
L_314F4:
        db      0b1h, 49h, 0b5h, 10h, 0b0h, 8bh, 0cdh, 0b0h, 0c3h, 0b1h, 49h, 0b5h, 1ah, 0b0h, 31h, 0cdh
L_3150F                         equ     $+0bh
L_31506                         equ     $+2
        db      0b0h, 0c3h, 0b1h, 49h, 0b5h, 24h, 0b0h, 25h, 0cdh, 0b0h, 0c3h, 0b1h, 0d4h, 0b5h, 24h, 0b0h
LEVELS16_DO_IT                         equ     $+4
        db      0dh, 0cdh, 0b0h, 0c3h
        db      8ah, 1eh, 0a8h, 2ah, 8ah, 3eh, 0a9h, 2ah, 8ah, 0eh, 0abh, 2ah
        db      8ah, 2eh, 0ach, 2ah, 8ah, 16h, 0aah, 2ah, 0b0h, 01h, 0cdh, 0c7h, 9ah
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
L_31434                         equ     $+1
        if      FW_VERSION >= 111
        db      0cbh, 0c7h, 06h, 0a6h, 2ah
        dw      (APP3_BASE+L_314F4-APP3_SEG*16)
        else
        db      0cbh, 0c7h, 06h, 0a6h, 2ah, 4h, 0b5h
        endif
        KEY_WHEEL       (APP3_BASE+L_3143D-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_31481-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_3148F-APP3_SEG*16), APP3_SEG
L_3143D                         equ     $+1
        db      0cbh, 02h, 06h, 0a8h, 2ah, 3ch, 23h, 73h
        db      02h, 0b0h
        db      "#<br"
        db      02h, 0b0h, 62h, 2ah, 0c1h, 73h, 02h, 0b0h, 00h, 3ch
L_31481                         equ     $+0fh
        db      23h, 73h, 02h, 0b0h, 23h, 0a2h, 0a8h, 2ah, 0cdh, 7bh, 88h, 26h, 0a9h, 2ah, 0cbh, 80h
L_3148F                         equ     $+0dh
        db      0f9h, 00h, 75h, 01h, 0cbh, 88h, 26h, 0a9h, 2ah, 0a2h, 0a8h, 2ah, 0cbh, 0c7h, 06h, 0a6h
        if      FW_VERSION >= 111
        db      2ah
        dw      (APP3_BASE+L_314FD-APP3_SEG*16)
        db      8ch, 0d9h, 0beh, 0abh, 2ah, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh, 0dch, 18h, 0cdh
        db      7dh
        else
        db      2ah, 0dh, 0b5h, 8ch, 0d9h, 0beh, 0abh, 2ah, 0b3h, 00h, 0b7h, 00h, 0bah, 01h, 00h, 0bfh
        db      0cfh, 18h, 0cdh, 7dh
        endif
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_31434-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_314B9-APP3_SEG*16), APP3_SEG
L_314B9                         equ     $+1
        db      0cbh, 80h, 3eh, 0abh, 2ah, 00h, 75h, 01h, 0cbh, 0c7h
        if      FW_VERSION >= 111
        db      06h, 0a6h, 2ah
        dw      (APP3_BASE+L_31506-APP3_SEG*16)
        else
        db      06h, 0a6h, 2ah, 16h, 0b5h
        endif
        KEY_WHEEL2      (APP3_BASE+L_314FA-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_314E4-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_31510-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_3148F-APP3_SEG*16), APP3_SEG, 0000h, 0000h
L_314E4                         equ     $+1
        db      0cbh, 0a0h, 0a8h, 2ah, 0e8h, 0b5h, 0f5h, 26h, 8ah, 44h, 16h, 3ch, 03h, 75h, 01h
L_314FA                         equ     $+8
        db      0cbh, 0feh, 0c0h, 26h, 88h, 44h, 16h, 0cbh, 0a0h, 0a8h, 2ah, 0e8h, 9fh, 0f5h, 26h, 8ah
L_31510                         equ     $+0eh
        db      44h, 16h, 3ch, 00h, 75h, 01h, 0cbh, 0feh, 0c8h, 26h, 88h, 44h, 16h, 0cbh, 0a0h, 0a8h
        db      2ah, 0e8h, 89h, 0f5h, 26h, 8ah, 44h, 16h, 3ch, 00h, 74h, 01h, 0cbh, 0c7h, 06h, 0a6h
        if      FW_VERSION >= 111
        db      2ah
        dw      (APP3_BASE+L_3150F-APP3_SEG*16)
        db      8ch, 0d9h, 0beh, 0aah, 2ah, 0b3h, 00h, 0b7h, 00h, 0bah, 09h, 00h, 0bfh, 0dch, 18h, 0cdh
        db      7dh
        else
        db      2ah, 1fh, 0b5h, 8ch, 0d9h, 0beh, 0aah, 2ah, 0b3h, 00h, 0b7h, 00h, 0bah, 09h, 00h, 0bfh
        db      0cfh, 18h, 0cdh, 7dh
        endif
        KEY_CURSOR      (APP3_BASE+L_314B9-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_3148F-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      0cbh, 00h
L_3154A:
        call    fn_280BD
        db      74h, 0dh, 80h, 3eh, 2fh
        db      0fh, 03h, 75h, 01h, 0cbh, 74h, 03h, 0e9h, 8bh, 03h, 0b0h, 08h, 0a2h, 2fh, 0fh, 0cdh
        db      0adh
        call    fn_2823E
        db      0ffh, 1eh, 0c0h, 2ah, 0cbh
far_3185D:
        mov     word ptr [C0_W_02AD0], far_3185D-APP3_CSBASE
        db      0a1h, 0c8h, 2ah, 8ah, 1eh, 0cah, 2ah, 8ah, 3eh, 0cbh, 2ah
        db      0a3h, 4dh, 15h, 88h, 1eh, 4fh, 15h, 88h, 3eh, 50h, 15h, 0a1h, 0cch, 2ah, 8ah, 1eh
        db      0ceh, 2ah, 8ah, 3eh, 0cfh, 2ah, 0a3h, 51h, 15h, 88h, 1eh, 53h, 15h, 88h, 3eh, 54h
        db      15h, 0eh, 0e8h, 0ebh, 01h, 0cbh, 0cdh, 0a4h, 0cdh, 0a4h
        KEY_DOWN        11h, EP_FAR_31BD9_OFF, APP3_SEG
        endif
        KEY_DOWN        12h, EP_L_325E5_OFF, APP3_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        15h, L_32115-APP3_CSBASE, APP3_SEG
        KEY_DOWN        20h, L_31084-APP3_CSBASE, APP3_SEG
        KEY_DOWN        27h, L_315D7-APP3_CSBASE, APP3_SEG
        KEY_DOWN        02h, L_315D7-APP3_CSBASE, APP3_SEG
        if      FW_VERSION >= 120
        db      0c3h
L_315D7:
        call    fn_3212B
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
        else
L_315D7                         equ     $+1
        db      0c3h, 0e8h, 71h, 02h, 9ah
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
        endif
        else
        KEY_DOWN        15h, (APP3_BASE+L_31835-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_L_315E0_OFF, APP3_SEG
        KEY_DOWN        27h, EP_L_315D7_OFF, APP3_SEG
        KEY_DOWN        02h, EP_L_315D7_OFF, APP3_SEG
L_315D7                         equ     $+1
        db      0c3h, 0e8h, 71h, 02h, 9ah
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
        endif
        else
cb_31CD2:
        DISP_CURSOR     49h, 10h, 8bh
        ret
cb_31CDB:
        db      0b1h, 49h, 0b5h, 1ah, 0b0h, 31h, 0cdh
        mov     al, 0c3h
cb_31CE4:
        DISP_CURSOR     49h, 24h, 25h
        ret
cb_31CED:
        DISP_CURSOR     0d4h, 24h, 0dh
        ret
levels16_do_it:
        mov     bl, byte ptr [C0_B_02AB8]
        mov     bh, byte ptr [C0_B_02AB9]
        mov     cl, byte ptr [C0_B_02ABB]
        mov     ch, byte ptr [A3_B_02AAC]
        mov     dl, byte ptr [A3_B_02AAA]
        mov     al, 1
        int     0c7h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
L_30ED8:
        mov     word ptr [C0_W_02AB6], cb_31CD2-APP3_CSBASE
        KEY_WHEEL       (APP3_BASE+L_3143D-APP3_SEG*16), APP3_SEG
        KEY_DOWN        22h, (APP3_BASE+L_31D61-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_31D6F-APP3_SEG*16), APP3_SEG
L_3143D                         equ     $+1
        db      0cbh, 02h
        push    es
        test    al, 2ah
        cmp     al, 23h
        jae     L_31757
        mov     al, 23h
L_31757:
        cmp     al, 62h
        jb      L_3175D
        mov     al, 62h
L_3175D:
        sub     al, cl
        jae     L_31763
        mov     al, 0
L_31763:
        cmp     al, 23h
        jae     L_31769
        mov     al, 23h
L_31769:
        mov     byte ptr [C0_B_02AB8], al
        int     7bh
        mov     byte ptr [C0_B_02AB9], ah
        retf
L_31D61:
        cmp     cl, 0
        jne     br_31D67
        retf
br_31D67:
        mov     byte ptr [C0_B_02AB9], ah
        mov     byte ptr [C0_B_02AB8], al
        retf
L_31D6F:
        mov     word ptr [C0_W_02AB6], cb_31CDB-APP3_CSBASE
        mov     cx, ds
        mov     si, C0_B_02ABB
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_30ED8-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_31D99-APP3_SEG*16), APP3_SEG
        db      0cbh
L_31D99:
        db      80h
        db      3eh, 0abh
        sub     al, byte ptr [bx+si]
        jne     levels16_type_field
        retf
levels16_type_field:
        mov     word ptr [C0_W_02AB6], cb_31CE4-APP3_CSBASE
        KEY_WHEEL2      (APP3_BASE+L_31DDA-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_31DC4-APP3_SEG*16), APP3_SEG
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+L_31DF0-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_31D6F-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
L_31DC4:
        mov     al, byte ptr [C0_B_02AB8]
        call    fn_3137F
        mov     al, byte ptr es:[si+16h]
        cmp     al, 3
        jne     br_31DD3
        retf
br_31DD3:
        inc     al
        mov     byte ptr es:[si+16h], al
        retf
L_31DDA:
        mov     al, byte ptr [C0_B_02AB8]
        call    fn_3137F
        mov     al, byte ptr es:[si+16h]
        cmp     al, 0
        jne     br_31DE9
        retf
br_31DE9:
        dec     al
        mov     byte ptr es:[si+16h], al
        retf
L_31DF0:
        mov     al, byte ptr [C0_B_02AB8]
        call    fn_3137F
        mov     al, byte ptr es:[si+16h]
        cmp     al, 0
        je      br_31DFF
        retf
br_31DFF:
        mov     word ptr [C0_W_02AB6], cb_31CED-APP3_CSBASE
        FIELD_WHEEL     ds, P_2ABA, 0, 0, 9, field_cb_none-APP3_CSBASE
        KEY_CURSOR      (APP3_BASE+L_31D99-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+L_31D6F-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        retf
        db      00h
L_3154A:
        db      0e8h, 0c0h, 62h
        je      br_31E3C
        cmp     byte ptr [C0_B_00F2F], 3
        jne     br_31E37
        retf
br_31E37:
        je      br_31E3C
        jmp     far_31BD9
br_31E3C:
        mov     al, 8
        mov     byte ptr [C0_B_00F2F], al
        int     0adh
        call    fn_2823E
        callf   [C0_W_02AD0]
        retf
far_3185D:
        mov     word ptr [C0_W_02AD0], far_3185D-APP3_CSBASE
        mov     ax, word ptr [C0_W_02AD8]
        mov     bl, byte ptr [C0_B_02ADA]
        mov     bh, byte ptr [C0_B_02ADB]
        mov     word ptr [A3_W_0154D], ax
        mov     byte ptr [A3_B_0154F], bl
        mov     byte ptr [A3_B_01550], bh
        mov     ax, word ptr [C0_W_02ADC]
        mov     bl, byte ptr [C0_B_02ADE]
        mov     bh, byte ptr [C0_B_02ADF]
        mov     word ptr [A3_W_01551], ax
        mov     byte ptr [A3_B_01553], bl
        mov     byte ptr [A3_B_01554], bh
        push    cs
        call    far_3206C
        retf
far_31E82:
        int     0a4h
        int     0a4h
        KEY_DOWN        11h, EP_BR_321C7_OFF, APP3_SEG
        KEY_DOWN        12h, (APP3_BASE+L_325E5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (APP3_BASE+L_32115-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_31084-APP3_SEG*16), APP3_SEG
        KEY_DOWN        27h, (APP3_BASE+L_315D7-APP3_SEG*16), APP3_SEG
        KEY_DOWN        02h, (APP3_BASE+L_315D7-APP3_SEG*16), APP3_SEG
        db      0c3h
L_315D7:
        db      0e8h
        db      71h, 02h
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
        endif
L_31084:
        DISP_CLEAR
        DISP_BOX        00h, 00h, 0f7h, 31h
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      0f7h, 01h, 31h
        DISP_TEXT       02h, 03h, "Auto punch:PUNCH"
        mov     si, 14h
        DISP_BMP        49h, 20h, 14h
        mov     si, 14h
        DISP_BMP        0a9h, 20h, 14h
        DISP_SOFTKEY    01h, DISP_SK_PLAIN, "PUNCH"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "TRANS"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "2ndSEQ"
        DISP_ERASE      1eh, 0eh, 0bch, 1ch
        DISP_BOX        1eh, 24h, 0bch, 06h
        DISP_VLINE      4ch, 25h, 04h
        DISP_VLINE      0ach, 25h, 04h
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        db      0e8h
        sbb     al, 0
        call    fn_32035
        call    word ptr [C0_W_02AD4]
        cmp     byte ptr [C0_B_02AD7], 0
        je      br_31F4C
        retf
        else
        db      0e8h, 1ch
        db      00h, 0e8h, 0f5h, 00h, 0ffh, 16h, 0c4h, 2ah, 80h, 3eh, 0c7h, 2ah, 00h, 74h, 01h, 0cbh
        endif
br_31F4C:
        if      FW_VERSION >= 120
tgt_31F52                       equ     $+6
        DISP_SOFTKEY    06h, DISP_SK_BOX, "TurnON"
        retf
        mov     cl, 20h
        mov     ch, 17h
        call    fn_28115
        cmp     byte ptr [C0_B_02AD6], 1
        jb      br_31FB6
        jne     br_31F6C
        jmp     br_31FF5
br_31F6C:
        else
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "TurnON"
        if      FW_VERSION >= 112
        db      0cbh, 0b1h, 20h, 0b5h
        db      17h, 0e8h, 0c3h, 61h, 80h, 3eh, 0c6h, 2ah, 01h, 72h, 4fh, 75h, 03h, 0e9h, 89h, 00h
        else
        if      FW_VERSION >= 111
        db      0cbh, 0b1h, 20h, 0b5h, 17h, 0e8h, 0c5h, 61h, 80h, 3eh
        else
        db      0cbh, 0b1h, 20h, 0b5h, 17h, 0e8h, 0c6h, 61h, 80h, 3eh
        endif
        db      0c6h, 2ah, 01h, 72h, 4fh, 75h, 03h, 0e9h, 89h, 00h
        endif
        endif
        else
        db      0e8h
        sbb     al, 0
        call    fn_32035
        call    word ptr [C0_W_02AD4]
        cmp     byte ptr [C0_B_02AD7], 0
        je      br_31F4C
        retf
br_31F4C:
tgt_31F52                       equ     $+6
        DISP_SOFTKEY    06h, DISP_SK_BOX, "TurnON"
        retf
        mov     cl, 20h
        mov     ch, 17h
        call    fn_28115
        cmp     byte ptr [C0_B_02AD6], 1
        jb      br_31FB6
        jne     br_31F6C
        jmp     br_31FF5
br_31F6C:
        endif
        DISP_HDOTS      4ch, 25h, 61h
        DISP_HDOTS      4dh, 26h, 60h
        DISP_HDOTS      4ch, 27h, 61h
        DISP_HDOTS      4dh, 28h, 60h
        DISP_TEXT       68h, 03h, "IN OUT  "
        DISP_TEXT       51h, 0eh, "IN"
        DISP_TEXT       8ch, 0eh, "OUT"
        db      0beh, 14h, 00h
        DISP_BMP        49h, 20h, 14h
        mov     si, 14h
        DISP_BMP        0a8h, 20h, 14h
        db      0c3h
        if      FW_VERSION < 110
br_31FB6:
        endif
        if      FW_VERSION >= 112
br_31FB6:
        endif
        DISP_HDOTS      4ch, 25h, 8eh
        DISP_HDOTS      4dh, 26h, 8dh
        DISP_HDOTS      4ch, 27h, 8eh
        DISP_HDOTS      4dh, 28h, 8dh
        DISP_TEXT       68h, 03h, "IN ONLY "
        DISP_TEXT       51h, 0eh, "IN"
        DISP_ERASE      7ah, 17h, 3ch, 07h
        mov     si, 14h
        DISP_BMP        49h, 20h, 14h
        ret
        if      FW_VERSION < 110
br_31FF5:
        endif
        if      FW_VERSION >= 112
br_31FF5:
        endif
        DISP_HDOTS      1fh, 25h, 8eh
        DISP_HDOTS      20h, 26h, 8dh
        DISP_HDOTS      1fh, 27h, 8eh
        DISP_HDOTS      20h, 28h, 8dh
        DISP_TEXT       68h, 03h, "OUT ONLY"
        DISP_TEXT       8ch, 0eh, "OUT"
        DISP_ERASE      44h, 17h, 3ch, 07h
        mov     si, 14h
        DISP_BMP        0a8h, 20h, 14h
        if      FW_VERSION >= 112
        db      0c3h
fn_32035:
        mov     ax, word ptr [A3_W_0154D]
        mov     bl, byte ptr [A3_B_0154F]
        mov     bh, byte ptr [A3_B_01550]
        mov     word ptr [C0_W_02AD8], ax
        mov     byte ptr [C0_B_02ADA], bl
        mov     byte ptr [C0_B_02ADB], bh
        mov     ax, word ptr [A3_W_01551]
        mov     bl, byte ptr [A3_B_01553]
        mov     bh, byte ptr [A3_B_01554]
        mov     word ptr [C0_W_02ADC], ax
        mov     byte ptr [C0_B_02ADE], bl
        mov     byte ptr [C0_B_02ADF], bh
        ret
cb_32062:
        DISP_CURSOR     44h, 3, 55h
        ret
a3_ret_stub:
        db      0c3h
        if      FW_VERSION >= 120
far_3206C:
        call    fn_280BD
        je      L_32072
        retf
L_32072:
        call    far_31E82
        mov     word ptr [C0_W_02AD4], cb_32062-APP3_CSBASE
        mov     cx, ds
        mov     si, C0_B_02AD6
        mov     bl, 0
        mov     bh, 0
        mov     dx, 2
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        else
        db      0e8h, 5ch, 60h, 74h, 01h, 0cbh, 0e8h, 0dh, 0feh, 0c7h, 06h, 0c4h, 2ah, 0a4h, 0b8h, 8ch
        db      0d9h, 0beh, 0c6h, 2ah, 0b3h, 00h, 0b7h, 00h, 0bah, 02h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        endif
        if      FW_VERSION >= 114
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, L_3209F-APP3_CSBASE, APP3_SEG
        if      FW_VERSION >= 120
        retf
L_3209F:
        call    L_320A3
        retf
L_320A3:
        cmp     byte ptr [C0_B_02AD6], 1
        jb      br_320CF
        je      br_320F2
        call    far_31E82
        mov     word ptr [C0_W_02AD4], a3_ret_stub-APP3_CSBASE
        mov     ax, P_B8BC
        mov     bx, field_cb_none-APP3_CSBASE
        mov     bp, P_B8BC
        mov     dx, field_cb_none-APP3_CSBASE
        mov     di, field_cb_none-APP3_CSBASE
        mov     si, P_B710
        mov     cl, 44h
        mov     ch, 17h
        call    fn_2ABF2
        ret
br_320CF:
        call    far_31E82
        mov     word ptr [C0_W_02AD4], a3_ret_stub-APP3_CSBASE
        mov     ax, P_B8BC
        mov     bx, field_cb_none-APP3_CSBASE
        mov     bp, P_B8BC
        mov     dx, field_cb_none-APP3_CSBASE
        mov     di, field_cb_none-APP3_CSBASE
        mov     si, P_B710
        mov     cl, 44h
        mov     ch, 17h
        call    tgt_2AC18
        ret
br_320F2:
        call    far_31E82
        mov     word ptr [C0_W_02AD4], a3_ret_stub-APP3_CSBASE
        mov     ax, P_B8BC
        mov     bx, field_cb_none-APP3_CSBASE
        mov     bp, P_B8BC
        mov     dx, field_cb_none-APP3_CSBASE
        mov     di, field_cb_none-APP3_CSBASE
        mov     si, P_B710
        mov     cl, 44h
        mov     ch, 17h
        call    tgt_2AC3E
        ret
L_32115:
        cmp     byte ptr [C0_B_02AD7], 0
        je      br_3211D
        retf
br_3211D:
        mov     byte ptr [C0_B_02AD7], 1
        call    fn_3212B
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
fn_3212B:
        call    fn_32035
        call    fn_32170
        mov     ax, word ptr [C0_W_02AD8]
        mov     dl, byte ptr [C0_B_02ADA]
        mov     cl, byte ptr [C0_B_02ADB]
        mov     dh, 0
        mov     ch, 0
        call    tgt_2B341
        mov     word ptr [C0_W_02AE0], ax
        mov     word ptr [C0_W_02AE2], dx
        push    ax
        push    dx
        mov     ax, word ptr [C0_W_02ADC]
        mov     dl, byte ptr [C0_B_02ADE]
        mov     cl, byte ptr [C0_B_02ADF]
        mov     dh, 0
        mov     ch, 0
        call    tgt_2B341
        mov     word ptr [C0_W_02AE4], ax
        mov     word ptr [C0_W_02AE6], dx
        mov     di, ax
        mov     si, dx
        pop     dx
        pop     ax
        mov     bl, 1ah
        int     87h
        ret
fn_32170:
        cmp     byte ptr [C0_B_02AD6], 0
        je      br_3217F
        cmp     byte ptr [C0_B_02AD6], 1
        je      br_32195
        ret
br_3217F:
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     ax, word ptr es:[1ah]
        mov     word ptr [C0_W_02ADC], ax
        mov     byte ptr [C0_B_02ADE], 0
        mov     byte ptr [C0_B_02ADF], 0
        ret
br_32195:
        mov     word ptr [C0_W_02AD8], 0
        mov     byte ptr [C0_B_02ADA], 0
        mov     byte ptr [C0_B_02ADB], 0
        else
L_3209F                         equ     $+1
        db      0cbh, 0e8h, 01h, 00h, 0cbh, 80h, 3eh, 0c6h, 2ah, 01h, 72h, 25h, 74h, 46h
        db      0e8h, 0d3h, 0fdh, 0c7h, 06h, 0c4h, 2ah, 0adh, 0b8h, 0b8h, 0aeh, 0b8h, 0bbh, 0dch, 18h, 0bdh
        db      0aeh, 0b8h, 0bah, 0dch, 18h, 0bfh, 0dch, 18h, 0beh, 02h, 0b7h, 0b1h, 44h, 0b5h, 17h, 0e8h
        db      32h, 8bh, 0c3h, 0e8h, 0b0h, 0fdh, 0c7h, 06h, 0c4h, 2ah, 0adh, 0b8h, 0b8h, 0aeh, 0b8h, 0bbh
        db      0dch, 18h, 0bdh, 0aeh, 0b8h, 0bah, 0dch, 18h, 0bfh, 0dch, 18h, 0beh, 02h, 0b7h, 0b1h, 44h
        db      0b5h, 17h, 0e8h, 35h, 8bh, 0c3h, 0e8h, 8dh, 0fdh, 0c7h, 06h, 0c4h, 2ah, 0adh, 0b8h, 0b8h
        db      0aeh, 0b8h, 0bbh, 0dch, 18h, 0bdh, 0aeh, 0b8h, 0bah, 0dch, 18h, 0bfh, 0dch, 18h, 0beh, 02h
L_32115                         equ     $+9
        db      0b7h, 0b1h, 44h, 0b5h, 17h, 0e8h, 38h, 8bh, 0c3h, 80h, 3eh, 0c7h, 2ah, 00h, 74h, 01h
        db      0cbh, 0c6h, 06h, 0c7h, 2ah, 01h, 0e8h, 06h, 00h, 9ah
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh, 0e8h
        db      07h, 0ffh, 0e8h, 3fh, 00h, 0a1h, 0c8h, 2ah, 8ah, 16h, 0cah, 2ah, 8ah, 0eh, 0cbh, 2ah
        db      0b6h, 00h, 0b5h, 00h, 0e8h, 0ch, 92h, 0a3h, 0d0h, 2ah, 89h, 16h, 0d2h, 2ah, 50h, 52h
        db      0a1h, 0cch, 2ah, 8ah, 16h, 0ceh, 2ah, 8ah, 0eh, 0cfh, 2ah, 0b6h, 00h, 0b5h, 00h, 0e8h
        db      0f1h, 91h, 0a3h, 0d4h, 2ah, 89h, 16h, 0d6h, 2ah, 8bh, 0f8h, 8bh, 0f2h, 5ah, 58h, 0b3h
        db      1ah, 0cdh, 87h, 0c3h, 80h, 3eh, 0c6h, 2ah, 00h, 74h, 08h, 80h, 3eh, 0c6h, 2ah, 01h
        db      74h, 17h, 0c3h, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 1ah, 00h, 0a3h, 0cch, 2ah, 0c6h, 06h
        db      0ceh, 2ah, 00h, 0c6h, 06h, 0cfh, 2ah, 00h, 0c3h, 0c7h, 06h
        enter   2ah, 0
        mov     byte ptr [A3_B_02ACA], 0
        mov     byte ptr [A3_B_02ACB], 0
        endif
        else
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_317BF-APP3_SEG*16), APP3_SEG
L_317BF                         equ     $+1
        db      0cbh, 0e8h, 01h, 00h
        db      0cbh, 80h, 3eh, 0c6h, 2ah, 01h, 72h, 25h, 74h, 46h, 0e8h, 0d3h, 0fdh, 0c7h, 06h, 0c4h
        db      2ah, 0adh, 0b8h, 0b8h, 0aeh, 0b8h, 0bbh, 0dch, 18h, 0bdh, 0aeh, 0b8h, 0bah, 0dch, 18h, 0bfh
        db      0dch, 18h, 0beh, 02h, 0b7h, 0b1h, 44h, 0b5h, 17h, 0e8h, 32h, 8bh, 0c3h, 0e8h, 0b0h, 0fdh
        db      0c7h, 06h, 0c4h, 2ah, 0adh, 0b8h, 0b8h, 0aeh, 0b8h, 0bbh, 0dch, 18h, 0bdh, 0aeh, 0b8h, 0bah
        db      0dch, 18h, 0bfh, 0dch, 18h, 0beh, 02h, 0b7h, 0b1h, 44h, 0b5h, 17h, 0e8h, 35h, 8bh, 0c3h
br_320F2:
        db      0e8h, 8dh, 0fdh, 0c7h, 06h, 0c4h, 2ah, 0adh, 0b8h, 0b8h, 0aeh, 0b8h, 0bbh, 0dch, 18h, 0bdh
        db      0aeh, 0b8h, 0bah, 0dch, 18h, 0bfh, 0dch, 18h, 0beh, 02h, 0b7h, 0b1h, 44h, 0b5h, 17h, 0e8h
L_31835                         equ     $+3
        db      38h, 8bh, 0c3h, 80h, 3eh, 0c7h, 2ah, 00h, 74h, 01h, 0cbh, 0c6h, 06h, 0c7h, 2ah, 01h
        db      0e8h, 06h, 00h, 9ah
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh, 0e8h, 07h, 0ffh, 0e8h, 3fh, 00h, 0a1h
        db      0c8h, 2ah, 8ah, 16h, 0cah, 2ah, 8ah, 0eh, 0cbh, 2ah, 0b6h, 00h, 0b5h, 00h, 0e8h, 0ch
        db      92h, 0a3h, 0d0h, 2ah, 89h, 16h, 0d2h, 2ah, 50h, 52h, 0a1h, 0cch, 2ah, 8ah, 16h, 0ceh
        db      2ah, 8ah, 0eh, 0cfh, 2ah, 0b6h, 00h, 0b5h, 00h
        db      0e8h
        dw      tgt_2B341-($+2)
        db      0a3h, 0d4h, 2ah, 89h
        db      16h, 0d6h, 2ah, 8bh, 0f8h, 8bh, 0f2h, 5ah, 58h, 0b3h, 1ah, 0cdh, 87h, 0c3h, 80h, 3eh
        db      0c6h, 2ah, 00h, 74h, 08h, 80h, 3eh, 0c6h, 2ah, 01h, 74h, 17h, 0c3h, 8eh, 06h, 10h
        db      0fh, 26h, 0a1h, 1ah, 00h, 0a3h, 0cch, 2ah, 0c6h, 06h, 0ceh, 2ah, 00h, 0c6h, 06h, 0cfh
        db      2ah, 00h, 0c3h, 0c7h, 06h
        enter   2ah, 0
        mov     byte ptr [A3_B_02ACA], 0
        mov     byte ptr [A3_B_02ACB], 0
        endif
        ret
L_318C6:
        else
        if      FW_VERSION >= 110
        db      0c3h, 0a1h, 4dh, 15h, 8ah, 1eh, 4fh, 15h, 8ah, 3eh, 50h, 15h, 0a3h, 0c8h
        db      2ah, 88h, 1eh, 0cah, 2ah, 88h, 3eh, 0cbh, 2ah, 0a1h, 51h, 15h, 8ah, 1eh, 53h, 15h
        db      8ah, 3eh, 54h, 15h, 0a3h, 0cch, 2ah, 88h, 1eh, 0ceh, 2ah, 88h, 3eh, 0cfh, 2ah, 0c3h
        if      FW_VERSION >= 111
        db      0b1h, 44h, 0b5h, 03h, 0b0h, 55h, 0cdh, 0b0h, 0c3h, 0c3h, 0e8h, 5eh, 60h, 74h, 01h, 0cbh
        db      0e8h, 0dh, 0feh, 0c7h, 06h, 0c4h, 2ah, 0a2h, 0b8h, 8ch, 0d9h, 0beh, 0c6h, 2ah, 0b3h, 00h
        db      0b7h, 00h, 0bah, 02h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        else
        db      0b1h, 44h, 0b5h, 03h, 0b0h, 55h, 0cdh, 0b0h, 0c3h, 0c3h, 0e8h, 5fh, 60h, 74h, 01h, 0cbh
        db      0e8h, 0dh, 0feh, 0c7h, 06h, 0c4h, 2ah, 94h, 0b8h, 8ch, 0d9h, 0beh, 0c6h, 2ah, 0b3h, 00h
        db      0b7h, 00h, 0bah, 02h, 00h, 0bfh, 0cfh, 18h, 0cdh, 7dh
        endif
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_317BF-APP3_SEG*16), APP3_SEG
L_317BF                         equ     $+1
        db      0cbh, 0e8h, 01h, 00h
        db      0cbh, 80h, 3eh, 0c6h, 2ah, 01h, 72h, 25h, 74h, 46h, 0e8h, 0d3h, 0fdh, 0c7h, 06h, 0c4h
        if      FW_VERSION >= 111
        db      2ah, 0abh, 0b8h, 0b8h, 0ach, 0b8h, 0bbh, 0dch, 18h, 0bdh, 0ach, 0b8h, 0bah, 0dch, 18h, 0bfh
        db      0dch, 18h, 0beh, 00h, 0b7h, 0b1h, 44h, 0b5h, 17h, 0e8h, 34h, 8bh, 0c3h, 0e8h, 0b0h, 0fdh
        db      0c7h, 06h, 0c4h, 2ah, 0abh, 0b8h, 0b8h, 0ach, 0b8h, 0bbh, 0dch, 18h, 0bdh, 0ach, 0b8h, 0bah
        db      0dch, 18h, 0bfh, 0dch, 18h, 0beh, 00h, 0b7h, 0b1h, 44h, 0b5h, 17h, 0e8h, 37h, 8bh, 0c3h
        db      0e8h, 8dh, 0fdh, 0c7h, 06h, 0c4h, 2ah, 0abh, 0b8h, 0b8h, 0ach, 0b8h, 0bbh, 0dch, 18h, 0bdh
        db      0ach, 0b8h, 0bah, 0dch, 18h, 0bfh, 0dch, 18h, 0beh, 00h, 0b7h, 0b1h, 44h, 0b5h, 17h, 0e8h
        else
        db      2ah, 9dh, 0b8h, 0b8h, 9eh, 0b8h, 0bbh, 0cfh, 18h, 0bdh, 9eh, 0b8h, 0bah, 0cfh, 18h, 0bfh
        db      0cfh, 18h, 0beh, 0f2h, 0b6h, 0b1h, 44h, 0b5h, 17h, 0e8h, 35h, 8bh, 0c3h, 0e8h, 0b0h, 0fdh
        db      0c7h, 06h, 0c4h, 2ah, 9dh, 0b8h, 0b8h, 9eh, 0b8h, 0bbh, 0cfh, 18h, 0bdh, 9eh, 0b8h, 0bah
        db      0cfh, 18h, 0bfh, 0cfh, 18h, 0beh, 0f2h, 0b6h, 0b1h, 44h, 0b5h, 17h, 0e8h, 38h, 8bh, 0c3h
        db      0e8h, 8dh, 0fdh, 0c7h, 06h, 0c4h, 2ah, 9dh, 0b8h, 0b8h, 9eh, 0b8h, 0bbh, 0cfh, 18h, 0bdh
        db      9eh, 0b8h, 0bah, 0cfh, 18h, 0bfh, 0cfh, 18h, 0beh, 0f2h, 0b6h, 0b1h, 44h, 0b5h, 17h, 0e8h
        endif
L_31835                         equ     $+3
        if      FW_VERSION >= 111
        db      3ah, 8bh, 0c3h, 80h, 3eh, 0c7h, 2ah, 00h, 74h, 01h, 0cbh, 0c6h, 06h, 0c7h, 2ah, 01h
        else
        db      3bh, 8bh, 0c3h, 80h, 3eh, 0c7h, 2ah, 00h, 74h, 01h, 0cbh, 0c6h, 06h, 0c7h, 2ah, 01h
        endif
        db      0e8h, 06h, 00h, 9ah
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh, 0e8h, 07h, 0ffh, 0e8h, 3fh, 00h, 0a1h
        if      FW_VERSION >= 111
        db      0c8h, 2ah, 8ah, 16h, 0cah, 2ah, 8ah, 0eh, 0cbh, 2ah, 0b6h, 00h, 0b5h, 00h, 0e8h, 0eh
        else
        db      0c8h, 2ah, 8ah, 16h, 0cah, 2ah, 8ah, 0eh, 0cbh, 2ah, 0b6h, 00h, 0b5h, 00h, 0e8h, 0fh
        endif
        db      92h, 0a3h, 0d0h, 2ah, 89h, 16h, 0d2h, 2ah, 50h, 52h, 0a1h, 0cch, 2ah, 8ah, 16h, 0ceh
        if      FW_VERSION >= 111
        db      2ah, 8ah, 0eh, 0cfh, 2ah, 0b6h, 00h, 0b5h, 00h
        db      0e8h
        dw      tgt_2B341-($+2)
        db      0a3h, 0d4h, 2ah, 89h
        else
        db      2ah, 8ah, 0eh, 0cfh, 2ah, 0b6h, 00h, 0b5h, 00h, 0e8h, 0f4h, 91h, 0a3h, 0d4h, 2ah, 89h
        endif
        db      16h, 0d6h, 2ah, 8bh, 0f8h, 8bh, 0f2h, 5ah, 58h, 0b3h, 1ah, 0cdh, 87h, 0c3h, 80h, 3eh
        db      0c6h, 2ah, 00h, 74h, 08h, 80h, 3eh, 0c6h, 2ah, 01h, 74h, 17h, 0c3h, 8eh, 06h, 10h
        db      0fh, 26h, 0a1h, 1ah, 00h, 0a3h, 0cch, 2ah, 0c6h, 06h, 0ceh, 2ah, 00h, 0c6h, 06h, 0cfh
        db      2ah, 00h, 0c3h, 0c7h, 06h
        enter   2ah, 0
        mov     byte ptr [A3_B_02ACA], 0
        mov     byte ptr [A3_B_02ACB], 0
        else
        db      0c3h
fn_32035:
        mov     ax, word ptr [A3_W_0154D]
        mov     bl, byte ptr [A3_B_0154F]
        mov     bh, byte ptr [A3_B_01550]
        mov     word ptr [C0_W_02AD8], ax
        mov     byte ptr [C0_B_02ADA], bl
        mov     byte ptr [C0_B_02ADB], bh
        mov     ax, word ptr [A3_W_01551]
        mov     bl, byte ptr [A3_B_01553]
        mov     bh, byte ptr [A3_B_01554]
        mov     word ptr [C0_W_02ADC], ax
        mov     byte ptr [C0_B_02ADE], bl
        mov     byte ptr [C0_B_02ADF], bh
        endif
        ret
        if      FW_VERSION >= 110
L_318C6:
        else
cb_32062:
        DISP_CURSOR     44h, 3, 55h
        ret
a3_ret_stub:
        db      0c3h
far_3206C:
        call    fn_280BD
        je      L_32072
        retf
L_32072:
        call    far_31E82
        mov     word ptr [C0_W_02AD4], cb_32062-APP3_CSBASE
        mov     cx, ds
        mov     si, C0_B_02AD6
        mov     bl, 0
        mov     bh, 0
        mov     dx, 2
        mov     di, field_cb_none-APP3_CSBASE
        int     7dh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP3_BASE+L_31263-APP3_SEG*16), APP3_SEG
        db      0cbh
L_31263:
        db      0e8h
        add     word ptr [bx+si], ax
        retf
L_320A3:
        cmp     byte ptr [C0_B_02AD6], 1
        jb      br_320CF
        je      br_320F2
        call    far_31E82
        mov     word ptr [C0_W_02AD4], a3_ret_stub-APP3_CSBASE
        mov     ax, P_B8BC
        mov     bx, field_cb_none-APP3_CSBASE
        mov     bp, P_B8BC
        mov     dx, field_cb_none-APP3_CSBASE
        mov     di, field_cb_none-APP3_CSBASE
        mov     si, P_B710
        mov     cl, 44h
        mov     ch, 17h
        call    fn_2ABF2
        ret
br_320CF:
        call    far_31E82
        mov     word ptr [C0_W_02AD4], a3_ret_stub-APP3_CSBASE
        mov     ax, P_B8BC
        mov     bx, field_cb_none-APP3_CSBASE
        mov     bp, P_B8BC
        mov     dx, field_cb_none-APP3_CSBASE
        mov     di, field_cb_none-APP3_CSBASE
        mov     si, P_B710
        mov     cl, 44h
        mov     ch, 17h
        call    tgt_2AC18
        ret
br_320F2:
        call    far_31E82
        mov     word ptr [C0_W_02AD4], a3_ret_stub-APP3_CSBASE
        mov     ax, P_B8BC
        mov     bx, field_cb_none-APP3_CSBASE
        mov     bp, P_B8BC
        mov     dx, field_cb_none-APP3_CSBASE
        mov     di, field_cb_none-APP3_CSBASE
        mov     si, P_B710
        mov     cl, 44h
        mov     ch, 17h
        call    tgt_2AC3E
        ret
L_32115:
        cmp     byte ptr [C0_B_02AD7], 0
        je      br_3211D
        retf
br_3211D:
        mov     byte ptr [C0_B_02AD7], 1
        call    fn_3212B
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
fn_3212B:
        call    fn_32035
        call    fn_32170
        mov     ax, word ptr [C0_W_02AD8]
        mov     dl, byte ptr [C0_B_02ADA]
        mov     cl, byte ptr [C0_B_02ADB]
        mov     dh, 0
        mov     ch, 0
        call    tgt_2B341
        mov     word ptr [C0_W_02AE0], ax
        mov     word ptr [C0_W_02AE2], dx
        push    ax
        push    dx
        mov     ax, word ptr [C0_W_02ADC]
        mov     dl, byte ptr [C0_B_02ADE]
        mov     cl, byte ptr [C0_B_02ADF]
        mov     dh, 0
        mov     ch, 0
        call    tgt_2B341
        mov     word ptr [C0_W_02AE4], ax
        mov     word ptr [C0_W_02AE6], dx
        mov     di, ax
        mov     si, dx
        pop     dx
        pop     ax
        mov     bl, 1ah
        int     87h
        ret
fn_32170:
        cmp     byte ptr [C0_B_02AD6], 0
        je      br_3217F
        cmp     byte ptr [C0_B_02AD6], 1
        je      br_32195
        ret
br_3217F:
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     ax, word ptr es:[1ah]
        mov     word ptr [C0_W_02ADC], ax
        mov     byte ptr [C0_B_02ADE], 0
        mov     byte ptr [C0_B_02ADF], 0
        ret
br_32195:
        mov     word ptr [C0_W_02AD8], 0
        mov     byte ptr [C0_B_02ADA], 0
        mov     byte ptr [C0_B_02ADB], 0
        ret
        endif
        endif
        int     85h
        mov     bx, ax
        mov     cx, dx
        sub     ax, word ptr [C0_W_02AE0]
        sbb     dx, word ptr [C0_W_02AE2]
        jae     br_321B7
        ret
br_321B7:
        sub     bx, word ptr [C0_W_02AE4]
        sbb     cx, word ptr [C0_W_02AE6]
        jae     br_321C4
        sub     ax, ax
        ret
br_321C4:
        or      bx, cx
        ret
far_31BD9:
        if      FW_VERSION >= 120
        mov     word ptr [C0_W_02AD0], far_31BD9-APP3_CSBASE
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     ax, word ptr es:[1ah]
        mov     word ptr [A3_W_00720], ax
        mov     word ptr [A3_W_0071E], 0
        int     0a4h
        KEY_DOWN        10h, EP_L_31E4B_OFF, APP3_SEG
        KEY_DOWN        12h, (APP3_BASE+L_325E5-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (APP3_BASE+L_324B4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, (APP3_BASE+L_3221B-APP3_SEG*16), APP3_SEG
        KEY_TRANSPORT   EP_FAR_30161_OFF, EP_FAR_30161_SEG, EP_FAR_3021E_OFF, EP_FAR_3021E_SEG, EP_SEQ_PLAY_STOP_OFF, APP3_SEG, EP_SEQ_PLAY_START_OFF, EP_SEQ_PLAY_START_SEG, EP_FAR_2FEC1_OFF, EP_FAR_2FEC1_SEG
        callf   [A3_FP_02AE8]
        retf
        elseif  FW_VERSION >= 110
        if      FW_VERSION >= 112
        db      0c7h, 06h, 0c0h, 2ah, 09h, 0bah, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 1ah, 00h, 0a3h, 20h
        db      07h, 0c7h, 06h, 1eh, 07h, 00h, 00h, 0cdh, 0a4h
        KEY_DOWN        10h, EP_FAR_3185D_OFF, APP3_SEG
        KEY_DOWN        12h, EP_L_325E5_OFF, EP_L_325E5_SEG
        KEY_DOWN        15h, (APP3_BASE+far_31EC6-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_FAR_31C2D_OFF, APP3_SEG
        KEY_TRANSPORT   EP_L_2FB81_OFF, APP3_SEG, (APP3_BASE+far_3021E-APP3_SEG*16), APP3_SEG, EP_SEQ_PLAY_STOP_OFF, APP3_SEG, EP_SEQ_PLAY_START_OFF, EP_SEQ_PLAY_START_SEG, EP_L_2F8E1_OFF, APP3_SEG
        else
        if      FW_VERSION >= 111
        db      0c7h, 06h, 0c0h, 2ah, 07h, 0bah, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 1ah, 00h, 0a3h, 20h
        else
        db      0c7h, 06h, 0c0h, 2ah, 0f9h, 0b9h, 8eh, 06h, 10h, 0fh, 26h, 0a1h, 1ah, 00h, 0a3h, 20h
        endif
        db      07h, 0c7h, 06h, 1eh, 07h, 00h, 00h, 0cdh, 0a4h
        KEY_DOWN        10h, EP_FAR_3185D_OFF, APP3_SEG
        KEY_DOWN        12h, EP_L_325E5_OFF, APP3_SEG
        KEY_DOWN        15h, (APP3_BASE+far_31EC6-APP3_SEG*16), APP3_SEG
        if      FW_VERSION >= 111
        KEY_DOWN        20h, EP_L_3221B_OFF, APP3_SEG
        else
        KEY_DOWN        20h, EP_FAR_31C2D_OFF, APP3_SEG
        endif
        KEY_TRANSPORT   EP_L_2FB81_OFF, APP3_SEG, EP_FAR_3021E_OFF, EP_FAR_3021E_SEG, EP_SEQ_PLAY_STOP_OFF, APP3_SEG, EP_SEQ_PLAY_START_OFF, EP_SEQ_PLAY_START_SEG, EP_FAR_2FEC1_OFF, EP_FAR_2FEC1_SEG
        endif
        db      0ffh
        db      1eh, 0d8h, 2ah, 0cbh
        else
        mov     word ptr [C0_W_02AD0], far_31BD9-APP3_CSBASE
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     ax, word ptr es:[1ah]
        mov     word ptr [A3_W_00720], ax
        mov     word ptr [A3_W_0071E], 0
        int     0a4h
        KEY_DOWN        10h, EP_L_3100F_OFF, APP3_SEG
        KEY_DOWN        12h, EP_L_325E5_OFF, APP3_SEG
        KEY_DOWN        15h, (APP3_BASE+L_324B4-APP3_SEG*16), APP3_SEG
        KEY_DOWN        20h, EP_L_3221B_OFF, APP3_SEG
        KEY_TRANSPORT   EP_FAR_30161_OFF, EP_FAR_30161_SEG, EP_FAR_3021E_OFF, EP_FAR_3021E_SEG, EP_SEQ_PLAY_STOP_OFF, APP3_SEG, EP_SEQ_PLAY_START_OFF, EP_SEQ_PLAY_START_SEG, EP_FAR_2FEC1_OFF, EP_FAR_2FEC1_SEG
        db      0ffh, 1eh
        db      0d8h
        sub     cl, bl
        endif
L_3221B:
        DISP_CLEAR
        DISP_HLINE      00h, 00h, 0d8h
        DISP_HDOTS      00h, 0ah, 0d8h
        DISP_HDOTS      00h, 17h, 0f6h
        DISP_HLINE      0d8h, 0ah, 21h
        DISP_HLINE      00h, 30h, 0f8h
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      00h, 00h, 30h
        DISP_VLINE      0d8h, 00h, 0bh
        DISP_VLINE      0d9h, 01h, 0ah
        DISP_VLINE      0f6h, 0ah, 26h
        DISP_VLINE      0f7h, 0bh, 25h
        DISP_TEXT       02h, 02h, "Tr:##-"
        DISP_TEXT       92h, 02h, "<Tr:00=ALL>"
        DISP_TEXT       04h, 0dh, "Transpose amount:###    <except drum tr>"
        DISP_TEXT       04h, 19h, " Pressing FIX will change the note data"
        DISP_TEXT       04h, 24h, " permanently!!            Bar:    -    "
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        call    fn_280BD
        jne     L_32335
        elseif  FW_VERSION >= 112
        db      0e8h, 0c3h, 5dh, 75h, 2bh
        else
        if      FW_VERSION >= 111
        db      0e8h, 0c5h
        else
        db      0e8h, 0c6h
        endif
        db      5dh, 75h, 2bh
        endif
        else
        db      0e8h, 0e5h, 5dh, 75h, 2bh
        endif
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "PUNCH"
        DISP_SOFTKEY    02h, DISP_SK_PLAIN, "TRANS"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "2ndSEQ"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "FIX"
L_32335:
        db      8ch, 0dah
        DISP_TEXT_IDX   6ah, 0dh, 0071ch, P_2AEE
        db      0cdh, 0ach, 0a1h, 1eh, 07h, 40h
        DISP_NUM0       0b8h, 24h, 03h
        db      0a1h, 20h, 07h, 40h, 3dh, 0e8h, 03h, 75h, 0bh
        DISP_TEXT       0dch, 24h, "000"
        if      FW_VERSION >= 120
        jmp     SHORT L_32367
        else
        db      0ebh, 06h
        endif
        DISP_NUM0       0dch, 24h, 03h
        if      FW_VERSION >= 112
L_32367:
        db      0a0h, 1dh, 07h
        if      FW_VERSION >= 120
        db      3ch, 00h, 74h, 10h, 0b4h, 00h, 0b1h, 14h, 0b5h, 02h, 0feh, 0c8h, 0e8h, 0a9h, 5ch, 0ffh
        db      16h, 0ech, 2ah, 0cbh
        else
        db      3ch, 00h, 74h, 10h, 0b4h, 00h, 0b1h, 14h, 0b5h, 02h, 0feh, 0c8h, 0e8h, 0b7h, 5ch, 0ffh
        db      16h, 0dch, 2ah, 0cbh
        endif
        else
        db      0a0h, 1dh, 07h, 3ch, 00h, 74h, 10h, 0b4h, 00h, 0b1h, 14h, 0b5h, 02h, 0feh, 0c8h, 0e8h
        if      FW_VERSION >= 111
        db      0b9h, 5ch, 0ffh, 16h, 0dch, 2ah, 0cbh
        elseif  FW_VERSION >= 110
        db      0bah, 5ch, 0ffh, 16h, 0dch, 2ah, 0cbh
        else
        db      0d9h, 5ch, 0ffh, 16h, 0dch, 2ah, 0cbh
        endif
        endif
        DISP_TEXT       14h, 02h, "00-ALL"
        if      FW_VERSION >= 120
        db      0ffh, 16h, 0ech, 2ah, 0cbh, 0b1h, 14h, 0b5h, 02h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h, 0b1h, 6ah
        db      0b5h, 0dh, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 0b8h, 0b5h, 24h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
        db      0b1h, 0dch, 0b5h, 24h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
L_323B3:
        mov     word ptr [A3_FP_02AE8], L_323B3-APP3_CSBASE
        db      0c7h
        db      06h, 0ech, 2ah, 0dfh, 0bbh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+FAR_323E3-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_323E3-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 1dh, 07h, 0b3h, 00h, 0b7h, 01h
        db      0bah, 40h, 00h
        mov     di, field_cb_none-APP3_CSBASE
        db      0cdh, 7eh, 0cbh
far_323E3:
        mov     word ptr [A3_FP_02AE8], far_323E3-APP3_CSBASE
        db      0c7h
        db      06h, 0ech, 2ah, 0e8h, 0bbh, 8ch, 0d9h, 0beh, 1ch, 07h, 0b3h, 00h, 0b7h, 01h, 0bah, 18h
        db      00h
        mov     di, field_cb_none-APP3_CSBASE
        db      0cdh, 7dh
        KEY_DIGITS      0000h, 0000h
        KEY_CURSOR      (APP3_BASE+L_323B3-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_32419-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_323B3-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_32419-APP3_SEG*16), APP3_SEG
        db      0cbh
far_32419:
        mov     word ptr [A3_FP_02AE8], far_32419-APP3_CSBASE
        db      0c7h, 06h, 0ech, 2ah, 0f1h, 0bbh
        KEY_CURSOR      (APP3_BASE+FAR_323E3-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_32467-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_323E3-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh
        db      1eh, 07h, 0b3h, 01h, 0b7h, 01h, 0bah, 0e7h, 03h
        mov     di, L_32449-APP3_CSBASE
        db      0cdh, 7eh, 0cbh
L_32449:
        db      8eh
        db      06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 05h, 26h, 0a1h, 1ah, 00h, 48h, 0a3h
        db      1eh, 07h, 3bh, 06h, 20h, 07h, 73h, 01h, 0cbh, 0a3h, 20h, 07h, 0cbh
far_32467:
        mov     word ptr [A3_FP_02AE8], far_32467-APP3_CSBASE
        db      0c7h, 06h, 0ech, 2ah, 0fah, 0bbh
        KEY_CURSOR      (APP3_BASE+far_32419-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_323E3-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 20h, 07h
        db      0b3h, 01h, 0b7h, 01h, 0bah, 0e8h, 03h
        mov     di, L_32497-APP3_CSBASE
        db      0cdh, 7eh, 0cbh
L_32497:
        db      8eh, 06h, 10h
        db      0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 04h, 26h, 0a1h, 1ah, 00h, 0a3h, 20h, 07h, 3bh
        db      06h, 1eh, 07h, 72h, 01h, 0cbh, 0a3h, 1eh, 07h, 0cbh
L_324B4:
        db      0e8h, 06h, 5ch, 74h, 01h, 0cbh
        elseif  FW_VERSION >= 110
        db      0ffh, 16h, 0dch, 2ah, 0cbh, 0b1h, 14h, 0b5h, 02h, 0b0h, 0dh, 0cdh, 0b0h
        db      0c3h, 0b1h, 6ah, 0b5h, 0dh, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 0b8h, 0b5h, 24h, 0b0h, 13h
far_31DC5                       equ     $+0ch
        if      FW_VERSION < 114
far_31BD5                       equ     $+0ch
        endif
        db      0cdh, 0b0h, 0c3h, 0b1h, 0dch, 0b5h, 24h, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0c7h, 06h, 0d8h, 2ah
        if      FW_VERSION >= 112
        db      0f5h, 0bbh, 0c7h, 06h, 0dch, 2ah, 0d1h, 0bbh
        else
        if      FW_VERSION >= 111
        db      0f3h, 0bbh, 0c7h, 06h, 0dch, 2ah, 0cfh, 0bbh
        else
        db      0e5h, 0bbh, 0c7h, 06h, 0dch, 2ah, 0c1h, 0bbh
        endif
        endif
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+far_31DF5-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+far_31DF5-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 1dh, 07h, 0b3h
far_31DF5                       equ     $+0ch
        if      FW_VERSION >= 111
        db      00h, 0b7h, 01h, 0bah, 40h, 00h, 0bfh, 0dch, 18h, 0cdh, 7eh, 0cbh, 0c7h, 06h, 0d8h, 2ah
        if      FW_VERSION >= 112
        db      25h, 0bch, 0c7h, 06h, 0dch, 2ah, 0dah, 0bbh, 8ch, 0d9h, 0beh, 1ch, 07h, 0b3h, 00h, 0b7h
        db      01h, 0bah, 18h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        KEY_DIGITS      0000h, 0000h
        if      FW_VERSION < 114
        KEY_CURSOR      (APP3_BASE+FAR_31BD5-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31C3B-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_31BD5-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31C3B-APP3_SEG*16), APP3_SEG
        else
        KEY_CURSOR      (APP3_BASE+far_31DC5-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_31E2B-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31DC5-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_31E2B-APP3_SEG*16), APP3_SEG
        endif
        db      0cbh
        if      FW_VERSION < 114
far_31C3B:
        else
far_31E2B:
        endif
far_32419:
        mov     word ptr [A3_W_02AD8], 0bc5bh
        mov     word ptr [A3_W_02ADC], 0bbe3h
        KEY_CURSOR      (APP3_BASE+far_31DF5-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31E79-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31DF5-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 1eh, 07h, 0b3h, 01h, 0b7h, 01h, 0bah, 0e7h, 03h, 0bfh, 8bh, 0bch, 0cdh
        else
        db      23h, 0bch, 0c7h, 06h, 0dch, 2ah, 0d8h, 0bbh, 8ch, 0d9h, 0beh, 1ch, 07h, 0b3h, 00h, 0b7h
        db      01h, 0bah, 18h, 00h, 0bfh, 0dch, 18h, 0cdh, 7dh
        KEY_DIGITS      0000h, 0000h
        KEY_CURSOR      (APP3_BASE+far_31DC5-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31C3B-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31DC5-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31C3B-APP3_SEG*16), APP3_SEG
far_31C3B                         equ     $+1
        db      0cbh, 0c7h, 06h, 0d8h, 2ah, 59h, 0bch, 0c7h, 06h, 0dch, 2ah, 0e1h, 0bbh
        KEY_CURSOR      (APP3_BASE+far_31DF5-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31E79-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31DF5-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 1eh, 07h, 0b3h, 01h, 0b7h, 01h, 0bah, 0e7h, 03h, 0bfh, 89h, 0bch, 0cdh
        endif
        else
        db      00h, 0b7h, 01h, 0bah, 40h, 00h, 0bfh, 0cfh, 18h, 0cdh, 7eh, 0cbh, 0c7h, 06h, 0d8h, 2ah
        db      15h, 0bch, 0c7h, 06h, 0dch, 2ah, 0cah, 0bbh, 8ch, 0d9h, 0beh, 1ch, 07h, 0b3h, 00h, 0b7h
        db      01h, 0bah, 18h, 00h, 0bfh, 0cfh, 18h, 0cdh, 7dh
        KEY_DIGITS      0000h, 0000h
        KEY_CURSOR      (APP3_BASE+far_31DC5-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31C3B-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31DC5-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31C3B-APP3_SEG*16), APP3_SEG
far_31C3B                         equ     $+1
        db      0cbh, 0c7h, 06h, 0d8h, 2ah, 4bh, 0bch, 0c7h, 06h, 0dch, 2ah, 0d3h, 0bbh
        KEY_CURSOR      (APP3_BASE+far_31DF5-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31E79-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_31DF5-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 1eh, 07h, 0b3h, 01h, 0b7h, 01h, 0bah, 0e7h, 03h, 0bfh, 7bh, 0bch, 0cdh
        endif
        db      7eh, 0cbh, 8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 05h, 26h, 0a1h, 1ah
        db      00h, 48h, 0a3h, 1eh, 07h, 3bh, 06h, 20h, 07h, 73h, 01h, 0cbh, 0a3h, 20h, 07h, 0cbh
far_31E79:
        if      FW_VERSION >= 112
        mov     word ptr [A3_W_02AD8], 0bca9h
        mov     word ptr [A3_W_02ADC], 0bbech
        KEY_CURSOR      (APP3_BASE+far_32419-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+far_31DF5-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        mov     cx, ds
        db      0beh, 20h, 07h, 0b3h, 01h, 0b7h, 01h, 0bah, 0e8h, 03h, 0bfh, 0d9h, 0bch, 0cdh, 7eh, 0cbh
        else
        if      FW_VERSION >= 111
        db      0c7h, 06h, 0d8h, 2ah, 0a7h, 0bch, 0c7h, 06h, 0dch, 2ah, 0eah, 0bbh
        else
        db      0c7h, 06h, 0d8h, 2ah, 99h, 0bch, 0c7h, 06h, 0dch, 2ah, 0dch, 0bbh
        endif
        KEY_CURSOR      (APP3_BASE+far_31C3B-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+far_31DF5-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h
        if      FW_VERSION >= 111
        db      0beh, 20h, 07h, 0b3h, 01h, 0b7h, 01h, 0bah, 0e8h, 03h, 0bfh, 0d7h, 0bch, 0cdh, 7eh, 0cbh
        else
        db      0beh, 20h, 07h, 0b3h, 01h, 0b7h, 01h, 0bah, 0e8h, 03h, 0bfh, 0c9h, 0bch, 0cdh, 7eh, 0cbh
        endif
        endif
        db      8eh, 06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 04h, 26h, 0a1h, 1ah, 00h, 0a3h
far_31EC6                       equ     $+0dh
        if      FW_VERSION >= 112
        db      20h, 07h, 3bh, 06h, 1eh, 07h, 72h, 01h, 0cbh, 0a3h, 1eh, 07h, 0cbh, 0e8h, 14h, 5ch
        elseif  FW_VERSION >= 111
        db      20h, 07h, 3bh, 06h, 1eh, 07h, 72h, 01h, 0cbh, 0a3h, 1eh, 07h, 0cbh, 0e8h, 16h, 5ch
        else
        db      20h, 07h, 3bh, 06h, 1eh, 07h, 72h, 01h, 0cbh, 0a3h, 1eh, 07h, 0cbh, 0e8h, 17h, 5ch
        endif
        db      74h, 01h, 0cbh
        else
        db      0ffh, 16h, 0dch, 2ah, 0cbh, 0b1h, 14h, 0b5h, 02h, 0b0h, 0dh, 0cdh, 0b0h, 0c3h, 0b1h, 6ah
        db      0b5h, 0dh, 0b0h, 13h, 0cdh, 0b0h, 0c3h, 0b1h, 0b8h, 0b5h, 24h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
        db      0b1h, 0dch, 0b5h, 24h, 0b0h, 13h, 0cdh, 0b0h, 0c3h
L_323B3:
        db      0c7h, 06h, 0d8h, 2ah, 0b7h, 0bbh, 0c7h
        db      06h, 0dch, 2ah, 93h, 0bbh
        KEY_CURSOR      0000h, 0000h, (APP3_BASE+FAR_315A7-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_315A7-APP3_SEG*16), APP3_SEG
        db      8ch, 0d9h, 0beh, 1dh, 07h, 0b3h, 00h, 0b7h, 01h
        db      0bah, 40h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7eh, 0cbh
far_315A7:
        db      0c7h, 06h, 0d8h, 2ah, 0e7h, 0bbh, 0c7h
        db      06h, 0dch, 2ah, 9ch, 0bbh, 8ch, 0d9h, 0beh, 1ch, 07h, 0b3h, 00h, 0b7h, 01h, 0bah, 18h
        db      00h, 0bfh, 0c0h, 18h, 0cdh, 7dh
        KEY_DIGITS      0000h, 0000h
        KEY_CURSOR      (APP3_BASE+L_323B3-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_32419-APP3_SEG*16), APP3_SEG, (APP3_BASE+L_323B3-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_32419-APP3_SEG*16), APP3_SEG
        db      0cbh
far_32419:
        db      0c7h
        db      06h, 0d8h, 2ah, 1dh, 0bch, 0c7h, 06h, 0dch, 2ah, 0a5h, 0bbh
        KEY_CURSOR      (APP3_BASE+FAR_315A7-APP3_SEG*16), APP3_SEG, (APP3_BASE+far_32467-APP3_SEG*16), APP3_SEG, (APP3_BASE+FAR_315A7-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh
        db      1eh, 07h, 0b3h, 01h, 0b7h, 01h, 0bah, 0e7h, 03h, 0bfh, 4dh, 0bch, 0cdh, 7eh, 0cbh, 8eh
        db      06h, 10h, 0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 05h, 26h, 0a1h, 1ah, 00h, 48h, 0a3h
        db      1eh, 07h, 3bh, 06h, 20h, 07h, 73h, 01h, 0cbh, 0a3h, 20h, 07h, 0cbh
far_32467:
        db      0c7h, 06h, 0d8h
        db      2ah, 6bh, 0bch, 0c7h, 06h, 0dch, 2ah, 0aeh, 0bbh
        KEY_CURSOR      (APP3_BASE+far_32419-APP3_SEG*16), APP3_SEG, 0000h, 0000h, (APP3_BASE+FAR_315A7-APP3_SEG*16), APP3_SEG, 0000h, 0000h
        db      8ch, 0d9h, 0beh, 20h, 07h
        db      0b3h, 01h, 0b7h, 01h, 0bah, 0e8h, 03h, 0bfh, 9bh, 0bch, 0cdh, 7eh, 0cbh, 8eh, 06h, 10h
        db      0fh, 26h, 3bh, 06h, 1ah, 00h, 72h, 04h, 26h, 0a1h, 1ah, 00h, 0a3h, 20h, 07h, 3bh
        db      06h, 1eh, 07h, 72h, 01h, 0cbh, 0a3h, 1eh, 07h, 0cbh
L_324B4:
        db      0e8h, 36h, 5ch, 74h, 01h, 0cbh
        endif
        DISP_WIN_WIDE   "Transpose permanent"
        DISP_TEXT       24h, 10h, "Pressing DO IT will transpose"
        DISP_TEXT       24h, 1ah, "note data permanently"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        db      0cdh, 0a4h
        if      FW_VERSION >= 112
        KEY_DOWN        13h, EP_BR_321C7_OFF, APP3_SEG
        if      FW_VERSION >= 120
        KEY_DOWN        14h, (APP3_BASE+far_32539-APP3_SEG*16), APP3_SEG
        db      0cbh
far_32539:
        db      0a1h
        db      1eh, 07h, 3bh, 06h, 20h, 07h
        jne     L_32545
        jmp     NEAR L_325DF
L_32545:
        db      0cdh, 85h, 50h, 52h, 0a1h
        db      1eh, 07h, 2bh, 0d2h, 2bh, 0c9h, 0b3h, 0bh, 0cdh, 87h, 8eh, 06h, 10h, 0fh, 8bh, 36h
        db      20h, 07h, 0c1h, 0e6h, 02h, 81h, 0c6h, 00h, 15h, 26h, 03h, 04h, 26h, 8ah, 54h, 02h
        db      0b6h, 00h, 0a3h, 6fh, 15h, 89h, 16h, 71h, 15h, 0cdh, 83h
L_32575:
        db      26h, 8ah, 44h, 04h, 3ch
        db      0ffh, 74h, 55h, 0a8h, 80h, 75h, 4ch, 26h, 8bh, 0ch, 26h, 8bh, 54h, 02h, 81h, 0e2h
        db      0fh, 3fh, 2bh, 0eh, 6fh, 15h, 1ah, 16h, 71h, 15h, 73h, 3ch, 80h, 3eh, 1dh, 07h
        db      00h, 74h, 0ah, 0feh, 0c6h, 3ah, 36h, 1dh, 07h, 75h, 28h, 0feh, 0ceh, 8ah, 0deh, 0b7h
        db      00h, 06h, 8eh, 06h, 10h, 0fh, 26h, 80h, 0bfh, 0c0h, 05h, 00h, 07h, 75h, 14h, 02h
        db      06h, 1ch, 07h, 2ch, 0ch, 73h, 02h, 04h, 0ch, 3ch, 7fh, 72h, 02h, 2ch, 0ch, 26h
        db      88h, 44h, 04h
        call    fn_281FE
        jmp     SHORT L_32575
        db      0c6h, 06h, 1ch, 07h, 0ch, 0cdh, 0d6h, 5ah
        db      58h, 0b3h, 0ah, 0cdh, 87h
L_325DF:
        db      9ah
        else
        if      FW_VERSION < 114
        KEY_DOWN        14h, (APP3_BASE+far_31D5B-APP3_SEG*16), APP3_SEG
far_31D5B                       equ     $+1
        else
        KEY_DOWN        14h, (APP3_BASE+FAR_31F4B-APP3_SEG*16), APP3_SEG
far_31F4B                       equ     $+1
        endif
        db      0cbh, 0a1h, 1eh, 07h, 3bh, 06h, 20h, 07h, 75h, 03h, 0e9h, 9ah, 00h, 0cdh, 85h
        db      50h, 52h, 0a1h, 1eh, 07h, 2bh, 0d2h, 2bh, 0c9h, 0b3h, 0bh, 0cdh, 87h, 8eh, 06h, 10h
        db      0fh, 8bh, 36h, 20h, 07h, 0c1h, 0e6h, 02h, 81h, 0c6h, 00h, 15h, 26h, 03h, 04h, 26h
        db      8ah, 54h, 02h, 0b6h, 00h, 0a3h, 6fh, 15h, 89h, 16h, 71h, 15h, 0cdh, 83h, 26h, 8ah
        db      44h, 04h, 3ch, 0ffh, 74h, 55h, 0a8h, 80h, 75h, 4ch, 26h, 8bh, 0ch, 26h, 8bh, 54h ; D.<.tU..uL&..&.T
        db      02h, 81h, 0e2h, 0fh, 3fh, 2bh, 0eh, 6fh, 15h, 1ah, 16h, 71h, 15h, 73h, 3ch, 80h
        db      3eh, 1dh, 07h, 00h, 74h, 0ah, 0feh, 0c6h, 3ah, 36h, 1dh, 07h, 75h, 28h, 0feh, 0ceh
        db      8ah, 0deh, 0b7h, 00h, 06h, 8eh, 06h, 10h, 0fh, 26h, 80h, 0bfh, 0c0h, 05h, 00h, 07h
        db      75h, 14h, 02h, 06h, 1ch, 07h, 2ch, 0ch, 73h, 02h, 04h, 0ch, 3ch, 7fh, 72h, 02h
        db      2ch, 0ch, 26h, 88h, 44h, 04h, 0e8h, 3ch, 5ch, 0ebh, 0a3h, 0c6h, 06h, 1ch, 07h, 0ch
        db      0cdh, 0d6h, 5ah, 58h, 0b3h, 0ah, 0cdh, 87h, 9ah
        endif
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
L_325E5                         equ     $+1
        if      FW_VERSION >= 114
        if      FW_VERSION >= 120
        db      0cbh
        db      0e8h, 0d5h, 5ah, 74h, 01h
        else
        db      0cbh, 0e8h, 0e3h, 5ah, 74h, 01h
        endif
        db      0cbh, 9ah
        dw      EP_SEQ_NAMES_FETCH_OFF, EP_SEQ_NAMES_FETCH_SEG
        if      FW_VERSION >= 120
        mov     word ptr [A0_W_02AD0], L_325E5-APP3_CSBASE
        int     0a4h
        mov     cx, ds
        else
        db      0c7h, 06h, 0c0h, 2ah, 27h, 0beh, 0cdh, 0a4h, 8ch, 0d9h
        endif
        db      0beh, 1ah, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 62h, 00h, 0bfh, 0dch, 18h, 0cdh, 7eh
        KEY_DOWN        20h, EP_L_32632_OFF, APP3_SEG
        else
        db      0cbh, 0e8h, 0e3h
        db      5ah, 74h, 01h, 0cbh, 9ah
        dw      EP_SEQ_NAMES_FETCH_OFF, EP_SEQ_NAMES_FETCH_SEG
        db      0c7h, 06h, 0c0h, 2ah
        dw      EP_L_31E07_OFF
        db      0cdh, 0a4h, 8ch, 0d9h, 0beh, 1ah, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 62h, 00h, 0bfh, 0dch
        db      18h
        db      0cdh, 7eh
        KEY_DOWN        20h, EP_FAR_31E54_OFF, APP3_SEG
        endif
        KEY_DOWN        10h, (APP3_BASE+far_3185D-APP3_SEG*16), APP3_SEG
        KEY_DOWN        11h, (APP3_BASE+far_31BD9-APP3_SEG*16), APP3_SEG
        KEY_DOWN        15h, (APP3_BASE+L_32110-APP3_SEG*16), APP3_SEG
        else
        if      FW_VERSION >= 110
        KEY_DOWN        13h, EP_FAR_31BD9_OFF, APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+far_31D5B-APP3_SEG*16), APP3_SEG
far_31D5B                         equ     $+1
        db      0cbh, 0a1h, 1eh, 07h, 3bh, 06h, 20h, 07h, 75h, 03h, 0e9h, 9ah, 00h, 0cdh, 85h
        db      50h, 52h, 0a1h, 1eh, 07h, 2bh, 0d2h, 2bh, 0c9h, 0b3h, 0bh, 0cdh, 87h, 8eh, 06h, 10h
        db      0fh, 8bh, 36h, 20h, 07h, 0c1h, 0e6h, 02h, 81h, 0c6h, 00h, 15h, 26h, 03h, 04h, 26h
        db      8ah, 54h, 02h, 0b6h, 00h, 0a3h, 6fh, 15h, 89h, 16h, 71h, 15h, 0cdh, 83h, 26h, 8ah
        db      44h, 04h, 3ch, 0ffh, 74h, 55h, 0a8h, 80h, 75h, 4ch, 26h, 8bh, 0ch, 26h, 8bh, 54h ; D.<.tU..uL&..&.T
        db      02h, 81h, 0e2h, 0fh, 3fh, 2bh, 0eh, 6fh, 15h, 1ah, 16h, 71h, 15h, 73h, 3ch, 80h
        db      3eh, 1dh, 07h, 00h, 74h, 0ah, 0feh, 0c6h, 3ah, 36h, 1dh, 07h, 75h, 28h, 0feh, 0ceh
        db      8ah, 0deh, 0b7h, 00h, 06h, 8eh, 06h, 10h, 0fh, 26h, 80h, 0bfh, 0c0h, 05h, 00h, 07h
        db      75h, 14h, 02h, 06h, 1ch, 07h, 2ch, 0ch, 73h, 02h, 04h, 0ch, 3ch, 7fh, 72h, 02h
        if      FW_VERSION >= 111
        db      2ch, 0ch, 26h, 88h, 44h, 04h, 0e8h, 3eh, 5ch, 0ebh, 0a3h, 0c6h, 06h, 1ch, 07h, 0ch
        else
        db      2ch, 0ch, 26h, 88h, 44h, 04h, 0e8h, 3fh, 5ch, 0ebh, 0a3h, 0c6h, 06h, 1ch, 07h, 0ch
        endif
        db      0cdh, 0d6h, 5ah, 58h, 0b3h, 0ah, 0cdh, 87h, 9ah
        else
        KEY_DOWN        13h, EP_BR_321C7_OFF, APP3_SEG
        KEY_DOWN        14h, (APP3_BASE+far_32539-APP3_SEG*16), APP3_SEG
        db      0cbh
far_32539:
        db      0a1h
        db      1eh, 07h, 3bh, 06h, 20h, 07h, 75h, 03h, 0e9h, 9ah, 00h, 0cdh, 85h, 50h, 52h, 0a1h
        db      1eh, 07h, 2bh, 0d2h, 2bh, 0c9h, 0b3h, 0bh, 0cdh, 87h, 8eh, 06h, 10h, 0fh, 8bh, 36h
        db      20h, 07h, 0c1h, 0e6h, 02h, 81h, 0c6h, 00h, 15h, 26h, 03h, 04h, 26h, 8ah, 54h, 02h
        db      0b6h, 00h, 0a3h, 6fh, 15h, 89h, 16h, 71h, 15h, 0cdh, 83h, 26h, 8ah, 44h, 04h, 3ch
        db      0ffh, 74h, 55h, 0a8h, 80h, 75h, 4ch, 26h, 8bh, 0ch, 26h, 8bh, 54h, 02h, 81h, 0e2h
        db      0fh, 3fh, 2bh, 0eh, 6fh, 15h, 1ah, 16h, 71h, 15h, 73h, 3ch, 80h, 3eh, 1dh, 07h
        db      00h, 74h, 0ah, 0feh, 0c6h, 3ah, 36h, 1dh, 07h, 75h, 28h, 0feh, 0ceh, 8ah, 0deh, 0b7h
        db      00h, 06h, 8eh, 06h, 10h, 0fh, 26h, 80h, 0bfh, 0c0h, 05h, 00h, 07h, 75h, 14h, 02h
        db      06h, 1ch, 07h, 2ch, 0ch, 73h, 02h, 04h, 0ch, 3ch, 7fh, 72h, 02h, 2ch, 0ch, 26h
        db      88h, 44h, 04h, 0e8h, 5eh, 5ch, 0ebh, 0a3h, 0c6h, 06h, 1ch, 07h, 0ch, 0cdh, 0d6h, 5ah
        db      58h, 0b3h, 0ah, 0cdh, 87h, 9ah
        endif
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
L_325E5                         equ     $+1
        if      FW_VERSION >= 110
        if      FW_VERSION >= 111
        db      0cbh, 0e8h, 0e5h
        else
        db      0cbh, 0e8h, 0e6h
        endif
        db      5ah, 74h, 01h, 0cbh, 9ah
        dw      EP_SEQ_NAMES_FETCH_OFF, EP_SEQ_NAMES_FETCH_SEG
        if      FW_VERSION >= 111
        db      0c7h, 06h, 0c0h, 2ah
        dw      EP_L_31E07_OFF
        db      0cdh, 0a4h, 8ch, 0d9h, 0beh, 1ah, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 62h, 00h, 0bfh, 0dch
        db      18h
        else
        db      0c7h, 06h, 0c0h, 2ah, 17h, 0beh, 0cdh
        db      0a4h, 8ch, 0d9h, 0beh, 1ah, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 62h, 00h, 0bfh, 0cfh, 18h
        endif
        db      0cdh, 7eh
        KEY_DOWN        20h, EP_FAR_31E54_OFF, APP3_SEG
        KEY_DOWN        10h, EP_FAR_3185D_OFF, APP3_SEG
        KEY_DOWN        11h, EP_FAR_31BD9_OFF, APP3_SEG
        KEY_DOWN        15h, (APP3_BASE+L_31E1E-APP3_SEG*16), APP3_SEG
        else
        db      0cbh
        db      0e8h, 05h, 5bh, 74h, 01h
        db      0cbh, 9ah
        dw      EP_SEQ_NAMES_FETCH_OFF, EP_SEQ_NAMES_FETCH_SEG
        mov     word ptr [C0_W_02AD0], L_325E5-APP3_CSBASE
        db      0cdh, 0a4h, 8ch, 0d9h
        db      0beh, 1ah, 07h, 0b3h, 00h, 0b7h, 00h, 0bah, 62h, 00h, 0bfh, 0c0h, 18h, 0cdh, 7eh
        KEY_DOWN        20h, EP_FAR_31E54_OFF, APP3_SEG
        KEY_DOWN        10h, EP_L_3100F_OFF, APP3_SEG
        KEY_DOWN        11h, EP_BR_321C7_OFF, APP3_SEG
        KEY_DOWN        15h, (APP3_BASE+FAR_318C2-APP3_SEG*16), APP3_SEG
        endif
        endif
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_32632:
        DISP_CLEAR
        DISP_BOX        00h, 00h, 0f7h, 31h
        DISP_HLINE      01h, 31h, 0f7h
        DISP_VLINE      0f7h, 01h, 31h
        DISP_HDOTS      00h, 19h, 0f6h
        DISP_TEXT       0ah, 0ah, "  SQ:"
        mov     ax, word ptr [A3_W_0071A]
        mov     cl, 28h
        mov     ch, 0ah
        call    fn_27FF8
        DISP_TEXT       0ah, 1bh, "This sequence will play simultaneously"
        DISP_TEXT       0ah, 24h, "with the active sequence or song."
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "PUNCH"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "TRANS"
        DISP_SOFTKEY    03h, DISP_SK_PLAIN, "2ndSEQ"
        db      0b1h, 28h
        db      0b5h, 0ah, 0b0h, 0dh, 0cdh, 0b0h, 80h, 3eh, 19h, 07h, 00h, 75h, 0dh
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "TurnON"
        db      0cbh
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "OFF"
        if      FW_VERSION >= 120
L_32110                       equ     $+1
        db      0cbh, 80h, 36h, 19h, 07h, 01h, 0c6h, 06h, 2eh, 0fh, 00h, 9ah
        else
L_31E1E                         equ     $+1
        if      FW_VERSION < 110
far_318C2                       equ     $+1
        endif
        if      FW_VERSION >= 112
far_318C2                       equ     $+1
        endif
        db      0cbh
L_32110:
        db      80h, 36h, 19h, 07h, 01h, 0c6h, 06h, 2eh, 0fh
        db      00h, 9ah
        endif
        dw      EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
        FRAME_PAD SEG_C0                ; growth in app3 keeps C0_SEG on a paragraph
APP3_END:
