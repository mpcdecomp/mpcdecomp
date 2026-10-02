; ROM 50000h v3.12 image; v3.08/v3.11/v3.12 shared; FW_VERSION for differences

        db      " copies "
        if      FW_VERSION >= 312
        db      0bah, 020h, 09ch, 020h, 0aeh, 020h, 061h, 020h, 0bch, 020h, 084h, 00ah, 061h, 020h, 0c5h
        elseif  FW_VERSION = 311
        db      0b9h, 020h, 09dh, 020h, 0ach, 020h, 061h, 020h, 0bbh, 020h, 084h, 00ah, 061h, 020h, 0d0h
        else
        db      0b9h, 020h, 09ch, 020h, 0b0h, 020h, 061h, 020h, 0b5h, 020h, 084h, 00ah, 061h, 020h, 0c4h
        endif
        db      " long "
        db      082h
        db      ", allowing easier"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 01ah, 02eh, 020h, 0a3h
        db      " source "
        db      0bch, 02ch, 020h, 01bh, 008h, 00ah, 082h, 02ch, 020h, 097h, 020h, 08bh, 020h, 03ch, 01bh, 084h
        db      020h, 0f1h, 03eh, 02eh, 00ah, 000h, 089h, 020h, 0a9h, 020h, 082h, 027h, 073h, 020h, 0afh, 020h
        db      0cbh, 00ah, 0b0h, 020h, 0e2h, 020h, 01bh, 0f1h, 020h, 0e0h, 02eh, 00ah, 01bh, 097h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 02fh, 02eh, 020h, 0a6h, 020h, 01bh, 074h, 020h, 0bbh, 02ch, 020h, 0b8h, 00ah, 082h
        db      02ch, 020h, 09ch, 020h, 089h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 02eh, 00ah, 000h, 092h
        db      020h, 061h, 020h, 083h, 020h, 01bh, 0a3h, 020h, 084h, 020h, 093h, 020h, 01bh, 0ach, 020h, 01bh
        db      008h, 02eh, 00ah, 000h, 08bh, 020h, 0adh, 020h, 082h, 027h, 073h, 020h, 0afh, 020h, 0c5h, 00ah
        db      0b2h, 020h, 0cfh
        db      " listed "
        db      0edh, 02eh, 00ah, 01bh, 0b3h
        else
        db      00ah, 01bh, 021h, 02eh, 020h, 0a2h, 020h, 01bh, 09eh, 020h, 0b5h, 02ch, 020h, 0c2h, 00ah, 082h
        db      02ch, 020h, 09ah, 020h, 088h, 020h, 03ch, 01bh, 085h, 020h, 0dch, 03eh, 02eh, 00ah, 000h, 090h
        db      020h, 061h, 020h, 083h, 020h, 01bh, 082h, 020h, 084h, 020h, 092h, 020h, 01bh, 0c5h, 020h, 0fdh
        db      02eh, 00ah, 000h, 089h, 020h, 0aah, 020h, 082h, 027h, 073h, 020h, 0ach, 020h, 0bch, 00ah, 0aeh
        db      020h, 0d6h, 020h, 01bh, 0fdh, 020h, 0e4h, 02eh, 00ah, 01bh, 08bh
        endif
        db      " KEYS 1 "
        if      FW_VERSION <> 311
        db      091h
        else
        db      08eh
        endif
        db      " 2 display "
        if      FW_VERSION >= 312
        db      01bh, 00eh
        elseif  FW_VERSION = 311
        db      0f3h
        else
        db      01bh, 01ah
        endif
        db      " pages "
        if      FW_VERSION >= 312
        db      09eh, 00ah, 0b0h, 020h, 01bh
        db      "F they exist. "
        db      01bh, 097h
        elseif  FW_VERSION = 311
        db      09eh, 00ah, 0b2h, 020h, 01bh
        db      "S they exist. "
        db      01bh, 0b3h
        else
        db      09dh, 00ah, 0aeh, 020h, 01bh
        db      "Y they exist. "
        db      01bh, 08bh
        endif
        db      " KEY 3"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 0fbh, 020h, 061h, 020h, 01bh
        db      "w's "
        db      0afh, 020h, 0cbh, 020h, 084h, 020h, 096h, 00ah, 01bh, 002h, 02eh, 00ah, 000h, 01bh, 043h, 020h
        db      0a2h, 020h, 0afh, 020h, 0cbh, 02ch, 020h, 0dfh, 020h, 01bh, 077h, 00ah, 083h, 020h, 091h, 020h
        db      0c5h, 020h, 0afh, 020h, 0cbh, 02ch, 020h, 097h, 00ah, 08bh, 020h, 03ch, 01bh, 084h, 020h, 0f1h
        db      03eh, 02eh, 00ah, 000h, 01bh, 057h, 020h, 088h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 0bah, 020h, 061h, 020h, 01bh, 060h, 027h, 073h, 020h, 0afh, 020h, 0c5h, 020h, 084h
        db      020h, 097h, 00ah, 01bh, 019h, 02eh, 00ah, 000h, 01bh, 04bh, 020h, 0a2h, 020h, 0afh, 020h, 0c5h
        db      02ch, 020h, 0e2h, 020h, 01bh, 060h, 00ah, 083h, 020h, 08eh, 020h, 0d0h, 020h, 0afh, 020h, 0c5h
        db      02ch, 020h, 09ch, 00ah, 089h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 02eh, 00ah, 000h, 01bh
        db      072h, 020h, 087h
        else
        db      00ah, 01bh, 094h, 020h, 061h, 020h, 01bh
        db      "S's "
        db      0ach, 020h, 0bch, 020h, 084h, 020h, 098h, 00ah, 01bh, 00bh, 02eh, 00ah, 000h, 01bh, 03ch, 020h
        db      09bh, 020h, 0ach, 020h, 0bch, 02ch, 020h, 0f7h, 020h, 01bh, 053h, 00ah, 083h, 020h, 091h, 020h
        db      0c4h, 020h, 0ach, 020h, 0bch, 02ch, 020h, 09ah, 00ah, 088h, 020h, 03ch, 01bh, 085h, 020h, 0dch
        db      03eh, 02eh, 00ah, 000h, 01bh, 061h, 020h, 087h
        endif
        db      " order "
        if      FW_VERSION >= 312
        db      084h, 020h, 096h
        elseif  FW_VERSION = 311
        db      084h, 020h, 097h
        else
        db      084h, 020h, 098h
        endif
        db      " rearranged."
        if      FW_VERSION >= 312
        db      00ah, 09fh, 020h, 03ch, 01bh, 084h, 020h, 0f1h, 03eh, 020h, 084h, 020h, 01bh, 0cch, 020h, 081h
        elseif  FW_VERSION = 311
        db      00ah, 092h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 020h, 084h, 020h, 01bh, 0e1h, 020h, 081h
        else
        db      00ah, 090h, 020h, 03ch, 01bh, 085h, 020h, 0dch, 03eh, 020h, 084h, 020h, 01bh, 0aeh, 020h, 081h
        endif
        db      " top "
        if      FW_VERSION >= 312
        db      088h, 00ah, 0c8h, 020h, 081h
        elseif  FW_VERSION = 311
        db      087h, 00ah, 0d2h, 020h, 081h
        else
        db      087h, 00ah, 0c6h, 020h, 081h
        endif
        db      " bottom "
        if      FW_VERSION >= 312
        db      088h, 02eh, 00ah, 000h, 089h, 020h, 082h, 020h, 083h, 020h, 0d1h, 020h, 0b1h, 020h, 081h, 020h
        db      0c5h, 00ah
        elseif  FW_VERSION = 311
        db      087h, 02eh, 00ah, 000h, 08bh, 020h, 082h, 020h, 083h, 020h, 0d9h, 020h, 0b3h, 020h, 081h, 020h
        db      0d0h, 00ah
        else
        db      087h, 02eh, 00ah, 000h, 089h, 020h, 082h, 020h, 083h, 020h, 0e0h, 020h, 0b3h, 020h, 081h, 020h
        db      0c4h, 00ah
        endif
        db      "blank "
        if      FW_VERSION >= 312
        db      0ebh, 020h, 085h, 020h, 096h, 020h, 0fdh, 02eh, 00ah, 000h, 089h, 020h, 083h, 020h, 09eh, 020h
        db      0ebh, 020h, 084h, 020h, 096h, 020h, 0fdh, 020h, 0b6h, 00ah, 03ch, 01bh, 084h, 020h, 0f1h, 03eh
        db      020h, 099h, 020h, 0b7h, 02eh, 00ah, 000h, 089h
        elseif  FW_VERSION = 311
        db      01bh, 004h, 020h, 085h, 020h, 097h, 020h, 01bh, 010h, 02eh, 00ah, 000h, 08bh, 020h, 083h, 020h
        db      09eh, 020h, 01bh, 004h, 020h, 084h, 020h, 097h, 020h, 01bh, 010h, 020h, 0c1h, 00ah, 03ch, 01bh
        db      061h, 020h, 0f5h, 03eh, 020h, 096h, 020h, 0bch, 02eh, 00ah, 000h, 08bh
        else
        db      01bh, 007h, 020h, 085h, 020h, 098h, 020h, 01bh, 006h, 02eh, 00ah, 000h, 089h, 020h, 083h, 020h
        db      09dh, 020h, 01bh, 007h, 020h, 084h, 020h, 098h, 020h, 01bh, 006h, 020h, 0bah, 00ah, 03ch, 01bh
        db      085h, 020h, 0dch, 03eh, 020h, 0a6h, 020h, 0bdh, 02eh, 00ah, 000h, 089h
        endif
        db      " upper "
        if      FW_VERSION >= 312
        db      091h
        db      " lower parts "
        db      09eh, 020h, 081h, 020h, 0afh, 00ah, 0cbh, 020h, 09eh, 020h, 081h, 020h, 0c5h, 020h, 0ebh, 02eh
        db      00ah, 000h, 089h, 020h, 0d4h, 020h, 0aeh, 020h, 081h, 020h, 082h, 020h, 01bh, 007h, 020h, 0f6h
        db      00ah, 01bh, 041h, 020h, 084h, 020h, 0f2h, 020h, 081h, 020h, 0c5h, 020h, 0ebh, 02eh, 00ah, 000h
        db      089h, 020h, 082h, 020h, 0c0h, 020h, 0b1h, 020h, 081h, 020h, 0ebh, 020h, 085h, 00ah, 096h, 020h
        db      01bh, 037h, 02eh, 00ah, 000h, 089h, 020h, 0e1h, 020h, 01bh, 077h, 020h, 084h, 020h, 096h, 020h
        db      01bh, 037h, 02eh, 00ah, 000h, 089h
        elseif  FW_VERSION = 311
        db      08eh, 020h, 01bh, 0c0h
        db      " parts "
        db      09eh, 020h, 081h, 020h, 0afh, 00ah, 0c5h, 020h, 09eh, 020h, 081h, 020h, 0d0h, 020h, 01bh, 004h
        db      02eh, 00ah, 000h, 08bh, 020h, 0e1h, 020h, 0ach, 020h, 081h, 020h, 082h, 020h, 01bh, 025h, 020h
        db      0ebh, 00ah, 01bh, 01bh, 020h, 084h, 020h, 01bh, 009h, 020h, 081h, 020h, 0d0h, 020h, 01bh, 004h
        db      02eh, 00ah, 000h, 08bh, 020h, 082h, 020h, 0b7h, 020h, 0b3h, 020h, 081h, 020h, 01bh, 004h, 020h
        db      085h, 00ah, 097h, 020h, 01bh, 013h, 02eh, 00ah, 000h, 08bh, 020h, 0feh, 020h, 01bh, 060h, 020h
        db      084h, 020h, 097h, 020h, 01bh, 013h, 02eh, 00ah, 000h, 08bh
        else
        db      091h, 020h, 01bh, 09bh
        db      " parts "
        db      09dh, 020h, 081h, 020h, 0ach, 00ah, 0bch, 020h, 09dh, 020h, 081h, 020h, 0c4h, 020h, 01bh, 007h
        db      02eh, 00ah, 000h, 089h, 020h, 0dah, 020h, 0b0h, 020h, 081h, 020h, 082h, 020h, 01bh, 00fh, 020h
        db      0f8h, 00ah, 01bh, 01dh, 020h, 084h, 020h, 0fah, 020h, 081h, 020h, 0c4h, 020h, 01bh, 007h, 02eh
        db      00ah, 000h, 089h, 020h, 082h, 020h, 0b4h, 020h, 0b3h, 020h, 081h, 020h, 01bh, 007h, 020h, 085h
        db      00ah, 098h, 020h, 01bh, 008h, 02eh, 00ah, 000h, 089h, 020h, 0f6h, 020h, 01bh, 053h, 020h, 084h
        db      020h, 098h, 020h, 01bh, 008h, 02eh, 00ah, 000h, 089h
        endif
        db      " last "
        if      FW_VERSION >= 312
        db      01bh, 077h, 020h, 084h, 020h, 096h, 020h, 01bh, 037h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      01bh, 060h, 020h, 084h, 020h, 097h, 020h, 01bh, 013h, 02eh, 00ah, 000h
        else
        db      01bh, 053h, 020h, 084h, 020h, 098h, 020h, 01bh, 008h, 02eh, 00ah, 000h
        endif
        db      "Makes a "
        if      FW_VERSION >= 312
        db      01bh, 095h, 020h, 09eh, 020h, 061h, 020h, 01bh, 00ch, 020h, 083h, 020h, 09eh, 00ah, 0ebh
        db      " (including "
        db      01bh, 02eh, 020h, 0c1h, 029h, 020h, 0aeh, 020h, 087h, 00ah, 082h, 020h, 091h, 020h, 01bh, 0c9h
        db      020h, 081h, 020h, 01bh, 095h, 020h, 0c8h, 020h, 061h, 00ah, 01bh, 022h, 020h, 01bh, 077h, 020h
        db      0aeh, 020h, 087h, 020h, 0adh, 020h, 0a8h, 00ah, 082h, 02eh, 00ah, 000h, 089h, 020h, 0e1h, 020h
        db      01bh, 077h, 020h, 084h, 020h, 096h, 020h, 0a6h
        elseif  FW_VERSION = 311
        db      01bh, 082h, 020h, 09eh, 020h, 061h, 020h, 01bh, 021h, 020h, 083h, 020h, 09eh, 00ah, 01bh, 004h
        db      020h, 028h, 01bh, 0f5h, 020h, 01bh, 040h, 020h, 0bfh, 029h, 020h, 0ach, 020h, 088h, 00ah, 082h
        db      020h, 08eh, 020h, 01bh, 0cch, 020h, 081h, 020h, 01bh, 082h, 020h, 0d2h, 020h, 061h, 00ah, 01bh
        db      03dh, 020h, 01bh, 060h, 020h, 0ach, 020h, 088h, 020h, 0aah, 020h, 0a9h, 00ah, 082h, 02eh, 00ah
        db      000h, 08bh, 020h, 0feh, 020h, 01bh, 060h, 020h, 084h, 020h, 097h, 020h, 0a7h
        else
        db      01bh, 088h, 020h, 09dh, 020h, 061h, 020h, 01bh, 017h, 020h, 083h, 020h, 09dh, 00ah, 01bh, 007h
        db      020h, 028h, 01bh, 0deh, 020h, 01bh, 02fh, 020h, 0e9h, 029h, 020h, 0b0h, 020h, 086h, 00ah, 082h
        db      020h, 091h, 020h, 01bh, 0b6h, 020h, 081h, 020h, 01bh, 088h, 020h, 0c6h, 020h, 061h, 00ah, 01bh
        db      028h, 020h, 01bh, 053h, 020h, 0b0h, 020h, 086h, 020h, 0abh, 020h, 0a7h, 00ah, 082h, 02eh, 00ah
        db      000h, 089h, 020h, 0f6h, 020h, 01bh, 053h, 020h, 084h, 020h, 098h, 020h, 0a3h
        endif
        db      " FROM."
        if      FW_VERSION <> 311
        db      00ah, 000h, 089h
        else
        db      00ah, 000h, 08bh
        endif
        db      " last "
        if      FW_VERSION >= 312
        db      01bh, 077h, 020h, 09eh, 020h, 081h, 020h, 01bh, 0cfh, 020h, 084h, 020h, 096h, 00ah, 0a6h, 02eh
        db      00ah, 000h, 089h, 020h, 082h, 020h, 083h, 020h, 084h, 020h, 01bh, 095h
        elseif  FW_VERSION = 311
        db      01bh, 060h, 020h, 09eh, 020h, 081h, 020h, 01bh, 0e5h, 020h, 084h, 020h, 097h, 00ah, 0a7h, 02eh
        db      00ah, 000h, 08bh, 020h, 082h, 020h, 083h, 020h, 084h, 020h, 01bh, 082h
        else
        db      01bh, 053h, 020h, 09dh, 020h, 081h, 020h, 01bh, 0b3h, 020h, 084h, 020h, 098h, 00ah, 0a3h, 02eh
        db      00ah, 000h, 089h, 020h, 082h, 020h, 083h, 020h, 084h, 020h, 01bh, 088h
        endif
        db      " TO."
        if      FW_VERSION >= 312
        db      00ah, 000h, 089h, 020h, 0a6h, 020h, 0ebh, 020h, 085h, 020h, 096h, 020h, 0fdh, 020h, 0c8h, 00ah
        db      087h, 020h, 01bh, 077h, 02eh, 00ah, 000h, 01bh
        db      "g how "
        db      01bh, 0bdh, 020h, 01bh, 045h, 020h, 09eh, 020h, 081h, 00ah, 0a6h, 020h, 0ebh, 020h, 085h, 020h
        db      096h, 020h, 0fdh, 020h, 0d1h, 020h, 081h, 00ah, 0c5h, 020h, 093h, 02eh, 00ah, 000h, 01bh, 0abh
        db      020h, 0bah, 020h, 0bfh, 020h, 0c0h, 020h, 01bh, 00ch, 00ah, 01bh, 0cah, 020h, 09eh, 020h, 061h
        db      020h, 088h, 020h, 084h, 020h, 01bh, 00ch, 020h, 01bh, 0cah, 00ah, 09eh, 020h, 0a8h, 020h, 088h
        db      02ch, 020h, 01bh, 0a8h, 020h, 01bh, 065h, 00ah, 0c2h, 020h, 0bfh, 020h, 0adh
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08bh, 020h, 0a7h, 020h, 01bh, 004h, 020h, 085h, 020h, 097h, 020h, 01bh, 010h, 020h
        db      0d2h, 00ah, 088h, 020h, 01bh, 060h, 02eh, 00ah, 000h, 01bh, 098h
        db      " how "
        db      01bh, 0e3h, 020h, 01bh, 052h, 020h, 09eh, 020h, 081h, 00ah, 0a7h, 020h, 01bh, 004h, 020h, 085h
        db      020h, 097h, 020h, 01bh, 010h, 020h, 0d9h, 020h, 081h, 00ah, 0d0h, 020h, 099h, 02eh, 00ah, 000h
        db      "Copies "
        db      0b9h, 020h, 0c0h, 020h, 0b7h, 020h, 01bh, 021h, 00ah, 01bh, 0d5h, 020h, 09eh, 020h, 061h, 020h
        db      087h, 020h, 084h, 020h, 01bh, 021h, 020h, 01bh, 0d5h, 00ah, 09eh, 020h, 0a9h, 020h, 087h, 02ch
        db      020h, 01bh, 05bh, 020h, 01bh, 045h, 00ah, 0bdh, 020h, 0c0h, 020h, 0aah
        else
        db      00ah, 000h, 089h, 020h, 0a3h, 020h, 01bh, 007h, 020h, 085h, 020h, 098h, 020h, 01bh, 006h, 020h
        db      0c6h, 00ah, 086h, 020h, 01bh, 053h, 02eh, 00ah, 000h, 01bh
        db      "q how "
        db      01bh, 0b8h, 020h, 01bh, 043h, 020h, 09dh, 020h, 081h, 00ah, 0a3h, 020h, 01bh, 007h, 020h, 085h
        db      020h, 098h, 020h, 01bh, 006h, 020h, 0e0h, 020h, 081h, 00ah, 0c4h, 020h, 099h, 02eh, 00ah, 000h
        db      "Copies "
        db      0b9h, 020h, 0bfh, 020h, 0b4h, 020h, 01bh, 017h, 00ah, 01bh, 0abh, 020h, 09dh, 020h, 061h, 020h
        db      087h, 020h, 084h, 020h, 01bh, 017h, 020h, 01bh, 0abh, 00ah, 09dh, 020h, 0a7h, 020h, 087h, 02ch
        db      020h, 01bh, 04bh, 020h, 01bh, 0d0h, 00ah, 0b6h, 020h, 0bfh, 020h, 0abh
        endif
        db      " merging "
        if      FW_VERSION >= 312
        db      0d3h
        db      " them."
        db      00ah, 08eh, 020h, 0bbh, 020h, 082h, 020h, 084h, 020h, 096h, 020h, 0a6h
        elseif  FW_VERSION = 311
        db      0d8h, 020h, 01bh, 0e9h, 02eh, 00ah, 08fh, 020h, 0b4h, 020h, 082h, 020h, 084h, 020h, 097h, 020h
        db      0a7h
        else
        db      0e1h, 020h, 01bh, 0b9h, 02eh, 00ah, 08fh, 020h, 0b1h, 020h, 082h, 020h, 084h, 020h, 098h, 020h
        db      0a3h
        endif
        db      " FROM."
        if      FW_VERSION >= 312
        db      00ah, 000h, 089h, 020h, 088h, 020h, 083h, 020h, 084h, 020h, 096h, 020h, 0a6h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08bh, 020h, 087h, 020h, 083h, 020h, 084h, 020h, 097h, 020h, 0a7h
        else
        db      00ah, 000h, 089h, 020h, 087h, 020h, 083h, 020h, 084h, 020h, 098h, 020h, 0a3h
        endif
        db      " FROM."
        if      FW_VERSION >= 312
        db      00ah, 0a3h, 020h, 022h, 030h, 022h, 020h, 084h, 020h, 01bh, 095h, 020h, 01bh, 02eh, 020h, 0c1h
        db      02eh, 00ah, 000h, 01bh, 067h, 020h, 093h, 020h, 0aeh
        elseif  FW_VERSION = 311
        db      00ah, 0a6h, 020h, 022h, 030h, 022h, 020h, 084h, 020h, 01bh, 082h, 020h, 01bh, 040h, 020h, 0bfh
        db      02eh, 00ah, 000h, 01bh, 098h, 020h, 099h, 020h, 0ach
        else
        db      00ah, 0a2h, 020h, 022h, 030h, 022h, 020h, 084h, 020h, 01bh, 088h, 020h, 01bh, 02fh, 020h, 0e9h
        db      02eh, 00ah, 000h, 01bh, 071h, 020h, 099h, 020h, 0b0h
        endif
        db      " SOURCE "
        if      FW_VERSION >= 312
        db      082h, 00ah, 028h, 01bh, 024h, 02eh, 0e3h, 02eh, 0e4h, 029h, 020h, 01bh, 007h, 020h, 0a5h, 020h
        db      084h, 020h, 096h, 020h, 0a6h, 00ah, 085h, 020h, 01bh, 09bh, 02eh, 00ah, 000h, 089h, 020h, 093h
        db      020h, 084h, 020h, 096h, 020h, 0a6h
        elseif  FW_VERSION = 311
        db      082h, 00ah, 028h, 01bh, 03fh, 02eh, 0f0h, 02eh, 0f1h, 029h, 020h, 01bh, 025h, 020h, 0a3h, 020h
        db      084h, 020h, 097h, 020h, 0a7h, 00ah, 085h, 020h, 01bh, 0c9h, 02eh, 00ah, 000h, 08bh, 020h, 099h
        db      020h, 084h, 020h, 097h, 020h, 0a7h
        else
        db      082h, 00ah, 028h, 01bh, 02eh, 02eh, 0e7h, 02eh, 0e5h, 029h, 020h, 01bh, 00fh, 020h, 0a5h, 020h
        db      084h, 020h, 098h, 020h, 0a3h, 00ah, 085h, 020h, 01bh, 0a1h, 02eh, 00ah, 000h, 089h, 020h, 099h
        db      020h, 084h, 020h, 098h, 020h, 0a3h
        endif
        db      " ends "
        if      FW_VERSION >= 312
        db      0cch, 020h, 01bh, 08eh, 00ah, 0c8h, 020h, 081h, 020h, 01bh, 024h, 02eh, 0e3h, 02eh, 0e4h, 020h
        db      083h, 020h, 0eeh, 00ah, 0bbh, 02eh, 00ah, 000h, 08eh, 020h, 01bh, 032h, 020h, 09eh, 020h, 0aah
        db      020h, 084h, 020h, 096h, 020h, 0a6h, 02eh, 00ah, 01bh, 0c4h, 020h, 01bh, 074h, 020h, 0ach, 020h
        db      01bh, 026h, 020h, 0e9h, 020h, 061h, 020h, 086h, 020h, 0c4h, 020h, 084h, 00ah, 064h, 06fh, 020h
        db      087h, 02eh, 00ah, 000h, 089h, 020h, 082h, 020h, 084h, 020h, 096h, 020h, 0a6h
        elseif  FW_VERSION = 311
        db      0d1h, 020h, 01bh, 0a7h, 00ah, 0d2h, 020h, 081h, 020h, 01bh, 03fh, 02eh, 0f0h, 02eh, 0f1h, 020h
        db      083h, 020h, 01bh, 018h, 00ah, 0b4h, 02eh, 00ah, 000h, 08fh, 020h, 01bh, 046h, 020h, 09eh, 020h
        db      0aeh, 020h, 084h, 020h, 097h, 020h, 0a7h, 02eh, 00ah, 01bh, 0a0h, 020h, 01bh, 02bh, 020h, 0b0h
        db      020h, 01bh, 042h, 020h, 0eah, 020h, 061h, 020h, 086h, 020h, 0c8h, 020h, 084h, 00ah, 064h, 06fh
        db      020h, 088h, 02eh, 00ah, 000h, 08bh, 020h, 082h, 020h, 084h, 020h, 097h, 020h, 0a7h
        else
        db      0d5h, 020h, 01bh, 087h, 00ah, 0c6h, 020h, 081h, 020h, 01bh, 02eh, 02eh, 0e7h, 02eh, 0e5h, 020h
        db      083h, 020h, 01bh, 01fh, 00ah, 0b1h, 02eh, 00ah, 000h, 08fh, 020h, 01bh, 03bh, 020h, 09dh, 020h
        db      0a8h, 020h, 084h, 020h, 098h, 020h, 0a3h, 02eh, 00ah, 01bh, 0aah, 020h, 01bh, 036h, 020h, 0afh
        db      020h, 01bh, 032h, 020h, 0efh, 020h, 061h, 020h, 08eh, 020h, 0c0h, 020h, 084h, 00ah, 064h, 06fh
        db      020h, 086h, 02eh, 00ah, 000h, 089h, 020h, 082h, 020h, 084h, 020h, 098h, 020h, 0a3h
        endif
        db      " TO."
        if      FW_VERSION >= 312
        db      00ah, 000h, 089h, 020h, 088h, 020h, 083h, 020h, 084h, 020h, 096h, 020h, 0a6h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08bh, 020h, 087h, 020h, 083h, 020h, 084h, 020h, 097h, 020h, 0a7h
        else
        db      00ah, 000h, 089h, 020h, 087h, 020h, 083h, 020h, 084h, 020h, 098h, 020h, 0a3h
        endif
        db      " TO."
        db      00ah, 000h
        db      "REPLACE: "
        if      FW_VERSION >= 312
        db      0a6h, 020h, 0bfh, 020h, 085h, 020h, 01bh, 0c6h, 00ah, 0c2h, 020h, 0bfh, 020h, 0aeh, 020h, 022h
        elseif  FW_VERSION = 311
        db      0a7h, 020h, 0c0h, 020h, 085h, 020h, 01bh, 0d8h, 00ah, 0bdh, 020h, 0c0h, 020h, 0ach, 020h, 022h
        else
        db      0a3h, 020h, 0bfh, 020h, 085h, 020h, 01bh, 0b2h, 00ah, 0b6h, 020h, 0bfh, 020h, 0b0h, 020h, 022h
        endif
        db      "Copy "
        if      FW_VERSION >= 312
        db      01bh, 043h, 022h
        elseif  FW_VERSION = 311
        db      01bh, 04bh, 022h
        else
        db      01bh, 03ch, 022h
        endif
        db      " area."
        db      00ah
        db      "MERGE: "
        if      FW_VERSION >= 312
        db      0a6h, 020h, 0bfh, 020h, 085h
        elseif  FW_VERSION = 311
        db      0a7h, 020h, 0c0h, 020h, 085h
        else
        db      0a3h, 020h, 0bfh, 020h, 085h
        endif
        db      " merge "
        if      FW_VERSION >= 312
        db      0d3h, 00ah, 0c2h, 020h, 0bfh, 020h, 0aeh, 020h, 022h
        elseif  FW_VERSION = 311
        db      0d8h, 00ah, 0bdh, 020h, 0c0h, 020h, 0ach, 020h, 022h
        else
        db      0e1h, 00ah, 0b6h, 020h, 0bfh, 020h, 0b0h, 020h, 022h
        endif
        db      "Copy "
        if      FW_VERSION >= 312
        db      01bh, 043h, 022h
        elseif  FW_VERSION = 311
        db      01bh, 04bh, 022h
        else
        db      01bh, 03ch, 022h
        endif
        db      " area."
        if      FW_VERSION >= 312
        db      00ah, 000h, 01bh
        db      "g how "
        db      01bh, 0bdh, 020h, 01bh, 045h, 020h, 09eh, 020h, 081h, 00ah, 0a6h, 020h, 0ebh, 020h, 085h, 020h
        db      096h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 01bh, 098h
        db      " how "
        db      01bh, 0e3h, 020h, 01bh, 052h, 020h, 09eh, 020h, 081h, 00ah, 0a7h, 020h, 01bh, 004h, 020h, 085h
        db      020h, 097h
        else
        db      00ah, 000h, 01bh
        db      "q how "
        db      01bh, 0b8h, 020h, 01bh, 043h, 020h, 09dh, 020h, 081h, 00ah, 0a3h, 020h, 01bh, 007h, 020h, 085h
        db      020h, 098h
        endif
        db      " placed "
        if      FW_VERSION >= 312
        db      0d1h, 020h, 081h, 00ah, 022h
        elseif  FW_VERSION = 311
        db      0d9h, 020h, 081h, 00ah, 022h
        else
        db      0e0h, 020h, 081h, 00ah, 022h
        endif
        db      "Copy "
        if      FW_VERSION >= 312
        db      01bh, 043h, 022h
        elseif  FW_VERSION = 311
        db      01bh, 04bh, 022h
        else
        db      01bh, 03ch, 022h
        endif
        db      " area."
        if      FW_VERSION >= 312
        db      00ah, 000h, 089h, 020h, 093h, 020h, 028h, 01bh, 024h, 02eh, 0e3h, 02eh, 0e4h, 029h, 020h, 0aeh
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08bh, 020h, 099h, 020h, 028h, 01bh, 03fh, 02eh, 0f0h, 02eh, 0f1h, 029h, 020h, 0ach
        else
        db      00ah, 000h, 089h, 020h, 099h, 020h, 028h, 01bh, 02eh, 02eh, 0e7h, 02eh, 0e5h, 029h, 020h, 0b0h
        endif
        db      020h, 081h, 00ah
        db      "DESTINATION "
        if      FW_VERSION >= 312
        db      082h, 020h, 01bh, 007h, 020h, 0a5h, 020h, 084h, 020h, 096h, 00ah, 0a6h, 020h, 085h, 020h, 01bh
        db      09bh, 02eh, 00ah, 000h, 01bh, 0abh, 020h, 01bh, 0adh, 020h, 01bh, 04dh, 020h, 09eh, 020h, 0cch
        db      020h, 082h, 00ah, 0d1h, 020h, 0a8h, 02ch, 020h, 01bh, 065h, 020h, 081h, 020h, 01bh, 008h, 00ah
        db      082h, 027h, 073h, 020h, 0c2h, 020h, 01bh, 04dh, 02eh, 00ah, 08ch, 020h, 09dh, 020h, 01bh, 0e2h
        db      020h, 081h, 020h, 082h, 020h, 084h, 020h, 096h, 00ah, 0a6h
        elseif  FW_VERSION = 311
        db      082h, 020h, 01bh, 025h, 020h, 0a3h, 020h, 084h, 020h, 097h, 00ah, 0a7h, 020h, 085h, 020h, 01bh
        db      0c9h, 02eh, 00ah, 000h
        db      "Copies "
        db      01bh, 0c8h, 020h, 01bh, 063h, 020h, 09eh, 020h, 0d1h, 020h, 082h, 00ah, 0d9h, 020h, 0a9h, 02ch
        db      020h, 01bh, 045h, 020h, 081h, 020h, 0b8h, 00ah, 082h, 027h, 073h, 020h, 0bdh, 020h, 01bh, 063h
        db      02eh, 00ah, 08dh, 020h, 0a0h
        db      " specifies "
        db      081h, 020h, 082h, 020h, 084h, 020h, 097h, 00ah, 0a7h
        else
        db      082h, 020h, 01bh, 00fh, 020h, 0a5h, 020h, 084h, 020h, 098h, 00ah, 0a3h, 020h, 085h, 020h, 01bh
        db      0a1h, 02eh, 00ah, 000h
        db      "Copies "
        db      01bh, 0efh, 020h, 01bh, 04fh, 020h, 09dh, 020h, 0d5h, 020h, 082h, 00ah, 0e0h, 020h, 0a7h, 02ch
        db      020h, 01bh, 0d0h, 020h, 081h, 020h, 0c2h, 00ah, 082h, 027h, 073h, 020h, 0b6h, 020h, 01bh, 04fh
        db      02eh, 00ah, 08dh, 020h, 0a0h, 020h, 01bh, 0d4h, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 098h
        db      00ah, 0a3h
        endif
        db      " FROM."
        if      FW_VERSION >= 312
        db      00ah, 000h, 089h, 020h, 082h, 020h, 084h, 020h, 096h, 020h, 0a6h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08bh, 020h, 082h, 020h, 084h, 020h, 097h, 020h, 0a7h
        else
        db      00ah, 000h, 089h, 020h, 082h, 020h, 084h, 020h, 098h, 020h, 0a3h
        endif
        db      " TO."
        if      FW_VERSION >= 312
        db      00ah, 089h, 020h, 0c2h, 020h, 01bh, 04dh, 020h, 09eh, 020h, 087h, 020h, 082h, 00ah, 085h, 020h
        db      096h, 020h, 01bh, 00bh, 021h, 00ah, 000h
        elseif  FW_VERSION = 311
        db      00ah, 08bh, 020h, 0bdh, 020h, 01bh, 063h, 020h, 09eh, 020h, 088h, 020h, 082h, 00ah, 085h, 020h
        db      097h, 020h, 01bh, 024h, 021h, 00ah, 000h
        else
        db      00ah, 089h, 020h, 0b6h, 020h, 01bh, 04fh, 020h, 09dh, 020h, 086h, 020h, 082h, 00ah, 000h
        endif
        db      "Permits "
        if      FW_VERSION >= 312
        db      0bah, 020h, 0adh
        elseif  FW_VERSION = 311
        db      0b9h, 020h, 0aah
        else
        db      0b9h, 020h, 0abh
        endif
        db      " part "
        if      FW_VERSION >= 312
        db      09eh, 020h, 061h, 020h, 01bh, 036h, 020h, 088h, 00ah, 084h, 020h, 096h, 020h, 0f8h
        elseif  FW_VERSION = 311
        db      09eh, 020h, 061h, 020h, 01bh, 03eh, 020h, 087h, 00ah, 084h, 020h, 097h, 020h, 01bh, 014h
        else
        db      09dh, 020h, 061h, 020h, 01bh, 044h, 020h, 087h, 00ah, 084h, 020h, 098h, 020h, 01bh, 005h
        endif
        db      " forward "
        if      FW_VERSION >= 312
        db      0adh
        elseif  FW_VERSION = 311
        db      0aah
        else
        db      0abh
        endif
        db      " backward "
        if      FW_VERSION >= 312
        db      0aeh, 00ah, 0afh, 02eh, 00ah, 0a3h, 020h, 0bbh, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 096h
        db      020h, 0b8h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      0ach, 00ah, 0afh, 02eh, 00ah, 0a6h, 020h, 0b4h, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 097h
        db      020h, 0cch, 02eh, 00ah, 000h
        else
        db      0b0h, 00ah, 0ach, 02eh, 00ah, 0a2h, 020h, 0b1h, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 098h
        db      020h, 0c1h, 02eh, 00ah, 000h
        endif
        db      "EARLIER: shifts "
        if      FW_VERSION <> 311
        db      0bfh
        else
        db      0c0h
        endif
        db      " earlier."
        db      00ah
        db      "LATER: shifts "
        if      FW_VERSION >= 312
        db      0bfh
        db      " later."
        db      00ah, 000h, 0a3h, 020h, 0bbh, 020h, 081h, 020h, 088h, 020h, 084h, 020h, 096h, 020h, 0f8h, 02eh
        db      00ah, 000h, 089h
        db      " distance "
        db      084h, 020h, 096h, 020h, 0f8h, 020h, 0aeh, 020h, 022h, 01bh, 0e3h, 022h, 00ah, 028h, 031h, 02fh
        db      033h, 038h, 034h, 02dh, 098h, 029h, 02eh, 020h, 01bh
        db      "` an "
        db      0b3h, 020h, 099h, 020h, 0f8h, 00ah, 0c8h, 020h, 081h, 020h, 0d5h, 020h, 0adh, 020h, 01bh, 0b3h
        db      020h, 081h, 020h, 01bh, 086h, 020h, 09eh, 00ah, 081h, 020h, 082h, 02ch, 020h, 0f1h, 020h, 085h
        db      020h, 096h
        elseif  FW_VERSION = 311
        db      0c0h
        db      " later."
        db      00ah, 000h, 0a6h, 020h, 0b4h, 020h, 081h, 020h, 087h, 020h, 084h, 020h, 097h, 020h, 01bh, 014h
        db      02eh, 00ah, 000h, 08bh, 020h, 01bh, 0a5h, 020h, 084h, 020h, 097h, 020h, 01bh, 014h, 020h, 0ach
        db      020h, 022h, 01bh, 0f3h, 022h, 00ah, 028h, 031h, 02fh, 033h, 038h, 034h, 02dh, 09bh, 029h, 02eh
        db      020h, 01bh, 078h, 020h, 01bh, 0ach, 020h, 0bah, 020h, 096h, 020h, 01bh, 014h, 00ah, 0d2h, 020h
        db      081h, 020h, 0d7h, 020h, 0aah, 020h, 01bh, 085h, 020h, 081h, 020h, 01bh, 09bh, 020h, 09eh, 00ah
        db      081h, 020h, 082h, 02ch, 020h, 0f5h, 020h, 085h, 020h, 097h
        else
        db      0bfh, 020h, 01bh, 0dch, 02eh, 00ah, 000h, 0a2h, 020h, 0b1h, 020h, 081h, 020h, 087h, 020h, 084h
        db      020h, 098h, 020h, 01bh, 005h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 092h, 020h, 084h, 020h, 098h
        db      020h, 01bh, 005h, 020h, 0b0h, 020h, 022h
        db      "ticks"
        db      022h, 00ah, 028h, 031h, 02fh, 033h, 038h, 034h, 02dh, 097h, 029h, 02eh, 020h, 01bh, 0c1h, 020h
        db      01bh, 0c5h, 020h, 0b7h, 020h, 0a6h, 020h, 01bh, 005h, 00ah, 0c6h, 020h, 081h, 020h, 0d3h, 020h
        db      0abh, 020h, 01bh, 06bh, 020h, 081h, 020h, 01bh, 064h, 020h, 09dh, 00ah, 081h, 020h, 082h, 02ch
        db      020h, 0dch, 020h, 085h, 020h, 098h
        endif
        db      " lost."
        if      FW_VERSION >= 312
        db      00ah, 000h, 089h, 020h, 0d5h, 020h, 09eh, 020h, 081h, 020h, 0d2h, 020h, 084h, 020h, 096h, 020h
        db      0f8h, 00ah, 028h, 01bh, 024h, 02eh, 0e3h, 02eh, 0e4h, 029h, 02eh, 00ah, 000h, 089h, 020h, 093h
        db      020h, 0cch, 020h, 01bh, 08eh, 020h, 01bh, 0b3h, 020h, 081h, 020h, 01bh, 086h, 020h, 09eh, 00ah
        db      081h, 020h, 0d2h, 020h, 084h, 020h, 096h, 020h, 0f8h, 020h, 028h, 01bh, 024h, 02eh, 0e3h, 02eh
        db      0e4h, 00ah, 0f4h, 029h, 02eh, 00ah, 000h, 08eh, 020h, 01bh, 032h, 020h, 09eh, 020h, 0aah, 020h
        db      084h, 020h, 096h, 020h, 0f8h, 02eh, 00ah, 01bh, 0c4h, 020h, 01bh, 074h, 020h, 0ach, 020h, 01bh
        db      026h, 020h, 0e9h, 020h, 061h, 020h, 086h, 020h, 0c4h, 020h, 084h, 00ah, 064h, 06fh, 020h, 087h
        db      02eh, 00ah, 000h, 09fh, 020h, 061h, 020h, 083h
        db      " key "
        db      084h, 020h, 09bh
        db      " an "
        db      01bh, 0aeh, 02eh, 00ah, 000h, 08ch, 020h, 01bh, 015h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08bh, 020h, 0d7h, 020h, 09eh, 020h, 081h, 020h, 0dch, 020h, 084h, 020h, 097h, 020h
        db      01bh, 014h, 00ah, 028h, 01bh, 03fh, 02eh, 0f0h, 02eh, 0f1h, 029h, 02eh, 00ah, 000h, 08bh, 020h
        db      099h, 020h, 0d1h, 020h, 01bh, 0a7h, 020h, 01bh, 085h, 020h, 081h, 020h, 01bh, 09bh, 020h, 09eh
        db      00ah, 081h, 020h, 0dch, 020h, 084h, 020h, 097h, 020h, 01bh, 014h, 020h, 028h, 01bh, 03fh, 02eh
        db      0f0h, 02eh, 0f1h, 00ah, 01bh, 005h, 029h, 02eh, 00ah, 000h, 08fh, 020h, 01bh, 046h, 020h, 09eh
        db      020h, 0aeh, 020h, 084h, 020h, 097h, 020h, 01bh, 014h, 02eh, 00ah, 01bh, 0a0h, 020h, 01bh, 02bh
        db      020h, 0b0h, 020h, 01bh, 042h, 020h, 0eah, 020h, 061h, 020h, 086h, 020h, 0c8h, 020h, 084h, 00ah
        db      064h, 06fh, 020h, 088h, 02eh, 00ah, 000h, 092h, 020h, 061h, 020h, 083h, 020h, 01bh, 0a3h, 020h
        db      084h, 020h, 093h, 020h, 01bh, 0ach, 020h, 01bh, 008h, 02eh, 00ah, 000h, 08dh, 020h, 0e9h
        else
        db      00ah, 000h, 089h, 020h, 0d3h, 020h, 09dh, 020h, 081h, 020h, 0d2h, 020h, 084h, 020h, 098h, 020h
        db      01bh, 005h, 00ah, 028h, 01bh, 02eh, 02eh, 0e7h, 02eh, 0e5h, 029h, 02eh, 00ah, 000h, 089h, 020h
        db      099h, 020h, 0d5h, 020h, 01bh, 087h, 020h, 01bh, 06bh, 020h, 081h, 020h, 01bh, 064h, 020h, 09dh
        db      00ah, 081h, 020h, 0d2h, 020h, 084h, 020h, 098h, 020h, 01bh, 005h, 020h, 028h, 01bh, 02eh, 02eh
        db      0e7h, 02eh, 0e5h, 00ah, 01bh, 0a6h, 029h, 02eh, 00ah, 000h, 08fh, 020h, 01bh, 03bh, 020h, 09dh
        db      020h, 0a8h, 020h, 084h, 020h, 098h, 020h, 01bh, 005h, 02eh, 00ah, 01bh, 0aah, 020h, 01bh, 036h
        db      020h, 0afh, 020h, 01bh, 032h, 020h, 0efh, 020h, 061h, 020h, 08eh, 020h, 0c0h, 020h, 084h, 00ah
        db      064h, 06fh, 020h, 086h, 02eh, 00ah, 000h, 090h, 020h, 061h, 020h, 083h, 020h, 01bh, 082h, 020h
        db      084h, 020h, 092h, 020h, 01bh, 0c5h, 020h, 0fdh, 02eh, 00ah, 000h, 08dh, 020h, 0e2h
        endif
        db      " alters "
        if      FW_VERSION >= 312
        db      081h, 020h, 092h, 020h, 0adh, 00ah, 0eah, 020h, 09eh, 020h, 061h, 020h, 0d2h, 020h, 09eh, 020h
        db      0aah, 020h, 0aeh, 020h, 0cch, 00ah, 088h, 020h, 0aeh, 020h, 061h, 020h, 082h, 02eh, 020h, 0a3h
        db      020h, 0bbh, 020h, 081h, 00ah, 082h, 020h, 084h, 020h, 096h
        elseif  FW_VERSION = 311
        db      081h, 020h, 098h, 020h, 0aah, 00ah, 0f7h, 020h, 09eh, 020h, 061h, 020h, 0dch, 020h, 09eh, 020h
        db      0aeh, 020h, 0ach, 020h, 0d1h, 00ah, 087h, 020h, 0ach, 020h, 061h, 020h, 082h, 02eh, 020h, 0a6h
        db      020h, 0b4h, 020h, 081h, 00ah, 082h, 020h, 084h, 020h, 097h
        else
        db      081h, 020h, 096h, 020h, 0abh, 00ah, 0edh, 020h, 09dh, 020h, 061h, 020h, 0d2h, 020h, 09dh, 020h
        db      0a8h, 020h, 0b0h, 020h, 0d5h, 00ah, 087h, 020h, 0b0h, 020h, 061h, 020h, 082h, 02eh, 020h, 0a2h
        db      020h, 0b1h, 020h, 081h, 00ah, 082h, 020h, 084h, 020h, 098h
        endif
        db      " altered."
        db      00ah, 000h
        db      "VELOCITY: edit "
        if      FW_VERSION >= 312
        db      098h, 020h, 092h, 02eh, 00ah
        elseif  FW_VERSION = 311
        db      09bh, 020h, 098h, 02eh, 00ah
        else
        db      097h, 020h, 096h, 02eh, 00ah
        endif
        db      "DURATION: edit "
        if      FW_VERSION >= 312
        db      098h, 020h, 0eah, 02eh, 00ah, 000h, 089h, 020h, 088h, 020h, 083h, 020h, 084h, 020h, 096h, 020h
        db      0b8h, 02eh, 00ah, 000h, 01bh, 05bh, 020h, 0bbh, 020h, 01bh, 07eh, 020h, 081h, 020h, 0a0h, 020h
        db      0eeh, 00ah, 0e0h, 020h, 085h
        elseif  FW_VERSION = 311
        db      09bh, 020h, 0f7h, 02eh, 00ah, 000h, 08bh, 020h, 087h, 020h, 083h, 020h, 084h, 020h, 097h, 020h
        db      0cch, 02eh, 00ah, 000h, 01bh, 073h, 020h, 0b4h, 020h, 01bh, 07ah, 020h, 081h, 020h, 0a4h, 020h
        db      01bh, 018h, 00ah, 0edh, 020h, 085h
        else
        db      097h, 020h, 0edh, 02eh, 00ah, 000h, 089h, 020h, 087h, 020h, 083h, 020h, 084h, 020h, 098h, 020h
        db      0c1h, 02eh, 00ah, 000h
        db      "Choose "
        db      0b1h, 020h, 01bh, 0b1h, 020h, 081h, 020h, 0a1h, 020h, 01bh, 01fh, 00ah, 0e4h, 020h, 085h
        endif
        db      " ADD "
        db      084h
        db      ", SUBtract "
        if      FW_VERSION >= 312
        db      0c0h, 02ch, 00ah
        elseif  FW_VERSION = 311
        db      0b7h, 02ch, 00ah
        else
        db      0b4h, 02ch, 00ah
        endif
        db      "MULTiply, "
        if      FW_VERSION >= 312
        db      0adh
        elseif  FW_VERSION = 311
        db      0aah
        else
        db      0abh
        endif
        db      " SET "
        if      FW_VERSION >= 312
        db      081h, 020h, 08dh, 020h, 0aah, 027h, 073h, 00ah
        db      "parameters."
        db      00ah, 000h, 089h, 020h, 01bh, 024h, 02eh, 0e3h, 02eh, 0e4h, 020h, 0d4h, 020h, 01bh, 007h, 020h
        db      081h, 00ah, 092h, 020h, 0adh, 020h, 0eah, 020h, 0a2h, 020h, 085h, 020h, 01bh, 09bh, 02eh, 00ah
        db      000h, 089h, 020h, 01bh, 024h, 02eh, 0e3h, 02eh, 0e4h, 020h, 0d4h, 020h, 01bh, 007h, 020h, 081h
        db      00ah, 092h, 020h, 0adh, 020h, 0eah, 020h, 0a2h, 020h, 085h
        elseif  FW_VERSION = 311
        db      081h, 020h, 08ch, 020h, 0aeh, 027h, 073h, 00ah, 01bh, 0cfh, 02eh, 00ah, 000h, 08bh, 020h, 01bh
        db      03fh, 02eh, 0f0h, 02eh, 0f1h, 020h, 0e1h, 020h, 01bh, 025h, 020h, 081h, 00ah, 098h, 020h, 0aah
        db      020h, 0f7h, 020h, 0a2h, 020h, 085h, 020h, 01bh, 0c9h, 02eh, 00ah, 000h, 08bh, 020h, 01bh, 03fh
        db      02eh, 0f0h, 02eh, 0f1h, 020h, 0e1h, 020h, 01bh, 025h, 020h, 081h, 00ah, 098h, 020h, 0aah, 020h
        db      0f7h, 020h, 0a2h, 020h, 085h
        else
        db      081h, 020h, 08ah, 020h, 0a8h, 027h, 073h, 00ah, 01bh, 0c0h, 02eh, 00ah, 000h, 089h, 020h, 01bh
        db      02eh, 02eh, 0e7h, 02eh, 0e5h, 020h, 0dah, 020h, 01bh, 00fh, 020h, 081h, 00ah, 096h, 020h, 0abh
        db      020h, 0edh, 020h, 09bh, 020h, 085h, 020h, 01bh, 0a1h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 02eh
        db      02eh, 0e7h, 02eh, 0e5h, 020h, 0dah, 020h, 01bh, 00fh, 020h, 081h, 00ah, 096h, 020h, 0abh, 020h
        db      0edh, 020h, 09bh, 020h, 085h
        endif
        db      " END."
        if      FW_VERSION >= 312
        db      00ah, 01bh, 0d5h, 020h, 099h, 020h, 081h, 020h, 0e1h, 020h, 01bh, 08eh, 020h, 01bh, 0b0h, 020h
        db      081h, 020h, 0d2h, 00ah, 084h, 020h, 096h, 020h, 01bh, 002h, 02eh, 00ah, 000h, 08ch, 020h, 0a0h
        db      020h, 099h, 020h, 01bh, 010h, 020h, 01bh, 09fh, 020h, 081h, 020h, 022h, 01bh, 084h, 022h, 020h
        db      09dh, 00ah, 01bh, 07ch, 020h, 084h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 0bfh, 020h, 096h, 020h, 081h, 020h, 0feh, 020h, 01bh, 0a7h, 020h, 01bh, 0b7h, 020h
        db      081h, 020h, 0dch, 00ah, 084h, 020h, 097h, 020h, 01bh, 019h, 02eh, 00ah, 000h, 08dh, 020h, 0a4h
        db      020h, 096h, 020h, 0fah, 020h, 01bh, 0d0h, 020h, 081h, 020h, 022h, 01bh, 061h, 022h, 020h, 0a0h
        db      00ah, 01bh, 07dh, 020h, 084h
        else
        db      00ah, 049h, 074h, 020h, 0a6h, 020h, 081h, 020h, 0f6h, 020h, 01bh, 087h, 020h, 01bh, 0a3h, 020h
        db      081h, 020h, 0d2h, 00ah, 084h, 020h, 098h, 020h, 01bh, 00bh, 02eh, 00ah, 000h, 08dh, 020h, 0a1h
        db      020h, 0a6h, 020h, 0fbh, 020h, 01bh, 0fbh, 020h, 081h, 020h, 022h, 01bh, 085h, 022h, 020h, 0a0h
        db      00ah, 01bh, 065h, 020h, 084h
        endif
        db      " alter "
        if      FW_VERSION >= 312
        db      092h, 020h, 0adh, 020h, 0eah, 02eh, 00ah, 000h, 08eh, 020h, 01bh, 032h, 020h, 09eh, 020h, 0aah
        db      020h, 084h, 020h, 096h, 020h, 0b8h, 02eh, 00ah, 01bh, 0c4h, 020h, 01bh, 074h, 020h, 0ach, 020h
        db      01bh, 026h, 020h, 0e9h, 020h, 061h, 020h, 086h, 020h, 0c4h, 020h, 084h, 00ah, 064h, 06fh, 020h
        db      087h, 02eh, 00ah, 000h, 08ch, 020h, 01bh, 015h
        elseif  FW_VERSION = 311
        db      098h, 020h, 0aah, 020h, 0f7h, 02eh, 00ah, 000h, 08fh, 020h, 01bh, 046h, 020h, 09eh, 020h, 0aeh
        db      020h, 084h, 020h, 097h, 020h, 0cch, 02eh, 00ah, 01bh, 0a0h, 020h, 01bh, 02bh, 020h, 0b0h, 020h
        db      01bh, 042h, 020h, 0eah, 020h, 061h, 020h, 086h, 020h, 0c8h, 020h, 084h, 00ah, 064h, 06fh, 020h
        db      088h, 02eh, 00ah, 000h, 08dh, 020h, 0e9h
        else
        db      096h, 020h, 0abh, 020h, 0edh, 02eh, 00ah, 000h, 08fh, 020h, 01bh, 03bh, 020h, 09dh, 020h, 0a8h
        db      020h, 084h, 020h, 098h, 020h, 0c1h, 02eh, 00ah, 01bh, 0aah, 020h, 01bh, 036h, 020h, 0afh, 020h
        db      01bh, 032h, 020h, 0efh, 020h, 061h, 020h, 08eh, 020h, 0c0h, 020h, 084h, 00ah, 064h, 06fh, 020h
        db      086h, 02eh, 00ah, 000h, 08dh, 020h, 0e2h
        endif
        db      " converts "
        if      FW_VERSION >= 312
        db      08dh, 020h, 01bh, 03ah, 00ah, 0aah, 020h, 0aeh, 020h, 061h, 020h, 088h, 020h, 0c0h, 020h, 0cch
        db      020h, 086h, 020h, 098h, 00ah, 083h, 020h, 0cfh, 020h, 084h, 020h, 0a8h, 02eh, 020h, 0a3h, 00ah
        db      0bbh, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 096h, 020h, 0b8h, 02eh, 00ah, 000h, 0a3h, 020h
        db      0bbh, 020h, 081h, 020h, 088h, 020h, 083h, 020h, 084h, 020h, 096h, 00ah, 0b8h
        elseif  FW_VERSION = 311
        db      08ch, 020h, 01bh, 057h, 00ah, 0aeh, 020h, 0ach, 020h, 061h, 020h, 087h, 020h, 0b7h, 020h, 0d1h
        db      020h, 086h, 020h, 09bh, 00ah, 083h, 020h, 0c4h, 020h, 084h, 020h, 0a9h, 02eh, 020h, 0a6h, 00ah
        db      0b4h, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 097h, 020h, 0cch, 02eh, 00ah, 000h, 0a6h, 020h
        db      0b4h, 020h, 081h, 020h, 087h, 020h, 083h, 020h, 084h, 020h, 097h, 00ah, 0cch
        else
        db      08ah, 020h, 01bh, 05ch, 00ah, 0a8h, 020h, 0b0h, 020h, 061h, 020h, 087h, 020h, 0b4h, 020h, 0d5h
        db      020h, 08eh, 020h, 097h, 00ah, 083h, 020h, 0cdh, 020h, 084h, 020h, 0a7h, 02eh, 020h, 0a2h, 00ah
        db      0b1h, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 098h, 020h, 0c1h, 02eh, 00ah, 000h, 0a2h, 020h
        db      0b1h, 020h, 081h, 020h, 087h, 020h, 083h, 020h, 084h, 020h, 098h, 00ah, 0c1h
        endif
        db      ". (Must "
        if      FW_VERSION >= 312
        db      096h, 020h, 061h, 020h, 01bh, 050h, 020h, 088h, 02eh, 029h, 00ah, 000h, 089h, 020h, 01bh, 024h
        db      02eh, 0e3h, 02eh, 0e4h, 020h, 0d4h, 020h, 01bh, 007h, 020h, 081h, 00ah, 0deh, 020h, 01bh, 0e6h
        db      020h, 0a2h, 020h, 085h, 020h, 01bh, 09bh, 02eh, 00ah, 000h, 089h, 020h, 01bh, 024h, 02eh, 0e3h
        db      02eh, 0e4h, 020h, 0d4h, 020h, 01bh, 007h, 020h, 081h, 00ah, 0deh, 020h, 01bh, 0e6h, 020h, 0a2h
        db      020h, 085h
        elseif  FW_VERSION = 311
        db      097h, 020h, 061h, 020h, 01bh, 04eh, 020h, 087h, 02eh, 029h, 00ah, 000h, 08bh, 020h, 01bh, 03fh
        db      02eh, 0f0h, 02eh, 0f1h, 020h, 0e1h, 020h, 01bh, 025h, 020h, 081h, 00ah, 0f2h
        db      " Number "
        db      0a2h, 020h, 085h, 020h, 01bh, 0c9h, 02eh, 00ah, 000h, 08bh, 020h, 01bh, 03fh, 02eh, 0f0h, 02eh
        db      0f1h, 020h, 0e1h, 020h, 01bh, 025h, 020h, 081h, 00ah, 0f2h
        db      " Number "
        db      0a2h, 020h, 085h
        else
        db      098h, 020h, 061h, 020h, 01bh, 049h, 020h, 087h, 02eh, 029h, 00ah, 000h, 089h, 020h, 01bh, 02eh
        db      02eh, 0e7h, 02eh, 0e5h, 020h, 0dah, 020h, 01bh, 00fh, 020h, 081h, 00ah, 0e6h, 020h, 01bh, 0e9h
        db      020h, 09bh, 020h, 085h, 020h, 01bh, 0a1h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 02eh, 02eh, 0e7h
        db      02eh, 0e5h, 020h, 0dah, 020h, 01bh, 00fh, 020h, 081h, 00ah, 0e6h, 020h, 01bh, 0e9h, 020h, 09bh
        db      020h, 085h
        endif
        db      " END."
        if      FW_VERSION >= 312
        db      00ah, 01bh, 0d5h, 020h, 099h, 020h, 081h, 020h, 0e1h, 020h, 01bh, 08eh, 020h, 01bh, 0b0h, 020h
        db      081h, 020h, 0d2h, 00ah, 084h, 020h, 096h, 020h, 01bh, 002h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 0bfh, 020h, 096h, 020h, 081h, 020h, 0feh, 020h, 01bh, 0a7h, 020h, 01bh, 0b7h, 020h
        db      081h, 020h, 0dch, 00ah, 084h, 020h, 097h, 020h, 01bh, 019h, 02eh, 00ah, 000h
        else
        db      00ah, 049h, 074h, 020h, 0a6h, 020h, 081h, 020h, 0f6h, 020h, 01bh, 087h, 020h, 01bh, 0a3h, 020h
        db      081h, 020h, 0d2h, 00ah, 084h, 020h, 098h, 020h, 01bh, 00bh, 02eh, 00ah, 000h
        endif
        db      "Any "
        if      FW_VERSION >= 312
        db      01bh, 03ah, 020h, 0aah, 020h, 0d6h, 020h, 084h, 020h, 081h, 020h, 086h, 00ah, 098h, 020h, 083h
        db      020h, 0eeh, 020h, 0aeh, 020h, 022h
        db      "Change Notes"
        db      022h, 00ah, 09dh, 020h, 085h, 020h, 096h
        elseif  FW_VERSION = 311
        db      01bh, 057h, 020h, 0aeh, 020h, 0cdh, 020h, 084h, 020h, 081h, 020h, 086h, 00ah, 09bh, 020h, 083h
        db      020h, 01bh, 018h, 020h, 0ach, 020h, 022h
        db      "Change Notes"
        db      022h, 00ah, 0a0h, 020h, 085h, 020h, 097h
        else
        db      01bh, 05ch, 020h, 0a8h, 020h, 0cch, 020h, 084h, 020h, 081h, 020h, 08eh, 00ah, 097h, 020h, 083h
        db      020h, 01bh, 01fh, 020h, 0b0h, 020h, 022h, 01bh, 0f7h
        db      " Notes"
        db      022h, 00ah, 0a0h, 020h, 085h, 020h, 098h
        endif
        db      " reassigned "
        if      FW_VERSION >= 312
        db      084h, 020h, 098h, 020h, 083h, 00ah, 0eeh, 020h, 0aeh, 020h, 022h, 01bh, 043h, 020h, 0aah, 022h
        db      020h, 09dh, 02eh, 00ah, 000h, 01bh, 0f7h, 020h, 061h, 020h, 01bh, 032h, 020h, 09eh, 020h, 01bh
        db      03ah, 020h, 0aah, 020h, 0aeh, 020h, 061h, 020h, 088h, 00ah, 084h, 020h, 061h, 020h, 01bh, 022h
        db      020h, 0deh, 020h, 0ech
        db      " Parameter"
        db      00ah, 028h, 01bh, 05ah, 02ch, 020h, 01bh, 005h, 02ch, 020h, 0adh, 020h, 0f5h, 029h, 020h, 091h
        db      020h, 0a0h, 02eh, 00ah, 0a3h, 020h, 0bbh, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 096h, 020h
        db      0b8h, 02eh, 00ah, 000h, 0a3h, 020h, 0bbh, 020h, 081h, 020h, 088h, 020h, 083h, 020h, 084h, 020h
        db      096h, 00ah, 0b8h, 02eh, 020h, 08ch, 020h, 01bh, 052h, 020h, 096h, 020h, 061h, 020h, 01bh, 050h
        db      020h, 088h, 02eh, 00ah, 000h, 0a3h, 020h, 0bbh, 020h, 081h, 020h, 0d5h, 020h, 09eh, 020h, 081h
        db      020h, 0d2h, 020h, 084h, 00ah, 096h, 020h, 0b8h, 020h, 028h, 01bh, 024h, 02eh, 0e3h, 02eh, 0e4h
        db      029h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 024h, 02eh, 0e3h, 02eh, 0e4h, 020h, 0d4h, 020h, 01bh
        db      007h, 020h, 081h, 00ah, 0deh, 020h, 0ech, 020h, 0a2h, 020h, 085h
        db      " END. "
        db      01bh, 0d5h, 020h, 099h, 00ah, 081h, 020h, 0e1h, 020h, 01bh, 08eh, 020h, 01bh, 0b0h, 020h, 081h
        db      020h, 0d2h, 020h, 084h, 020h, 096h, 00ah, 01bh, 002h, 02eh, 00ah, 000h, 0a3h, 020h, 0bbh, 020h
        db      081h, 020h, 0deh, 020h, 0ech, 020h, 01bh, 033h, 00ah, 028h, 01bh, 05ah, 02ch, 020h, 01bh, 005h
        db      02ch, 020h, 0adh, 020h, 0f5h, 029h, 020h, 084h, 020h, 0b1h, 020h, 0bah, 00ah, 0aah, 020h, 0aeh
        db      020h, 081h, 020h, 01bh, 032h, 020h, 085h, 020h, 096h, 020h, 0feh, 02eh, 00ah, 000h, 0a3h, 020h
        db      0bbh, 020h, 081h, 020h, 0deh, 020h, 0ech, 020h, 0a0h, 020h, 084h, 00ah, 0b1h, 020h, 0bah, 020h
        db      0aah, 020h, 0aeh, 020h, 081h, 020h, 01bh, 032h, 020h, 085h, 020h, 096h, 00ah, 0feh, 02eh, 00ah
        db      000h, 08ch, 020h, 0beh, 020h, 01bh, 06ch, 020h, 0bah, 020h, 0bfh, 020h, 0c2h, 00ah, 01bh, 056h
        db      020h, 087h, 020h, 093h, 020h, 028h, 0cch, 020h, 0b3h
        elseif  FW_VERSION = 311
        db      084h, 020h, 09bh, 020h, 083h, 00ah, 01bh, 018h, 020h, 0ach, 020h, 022h, 01bh, 04bh, 020h, 0aeh
        db      022h, 020h, 0a0h, 02eh, 00ah, 000h, 08dh, 020h, 0e9h
        db      " sets a "
        db      01bh, 046h, 020h, 09eh, 020h, 01bh, 057h, 020h, 0aeh, 00ah, 0ach, 020h, 061h, 020h, 087h, 020h
        db      084h, 020h, 061h, 020h, 01bh, 03dh, 020h, 0f2h, 020h, 01bh, 002h, 00ah
        db      "Parameter ("
        db      01bh, 071h, 02ch, 020h, 01bh, 00ch, 02ch, 020h, 0aah, 020h, 01bh, 00eh, 029h, 00ah, 08eh, 020h
        db      0a4h, 02eh, 020h, 0a6h, 020h, 0b4h, 020h, 081h, 020h, 082h, 020h, 084h, 00ah, 097h, 020h, 0cch
        db      02eh, 00ah, 000h, 0a6h, 020h, 0b4h, 020h, 081h, 020h, 087h, 020h, 083h, 020h, 084h, 020h, 097h
        db      00ah, 0cch, 02eh, 020h, 08dh, 020h, 01bh, 06fh, 020h, 097h, 020h, 061h, 020h, 01bh, 04eh, 020h
        db      087h, 02eh, 00ah, 000h, 0a6h, 020h, 0b4h, 020h, 081h, 020h, 0d7h, 020h, 09eh, 020h, 081h, 020h
        db      0dch, 020h, 084h, 00ah, 097h, 020h, 0cch, 020h, 028h, 01bh, 03fh, 02eh, 0f0h, 02eh, 0f1h, 029h
        db      02eh, 00ah, 000h, 08bh, 020h, 01bh, 03fh, 02eh, 0f0h, 02eh, 0f1h, 020h, 0e1h, 020h, 01bh, 025h
        db      020h, 081h, 00ah, 0f2h, 020h, 01bh, 002h, 020h, 0a2h, 020h, 085h
        db      " END. "
        db      01bh, 0bfh, 020h, 096h, 00ah, 081h, 020h, 0feh, 020h, 01bh, 0a7h, 020h, 01bh, 0b7h, 020h, 081h
        db      020h, 0dch, 020h, 084h, 020h, 097h, 00ah, 01bh, 019h, 02eh, 00ah, 000h, 0a6h, 020h, 0b4h, 020h
        db      081h, 020h, 0f2h, 020h, 01bh, 002h, 020h, 01bh, 044h, 00ah, 028h, 01bh, 071h, 02ch, 020h, 01bh
        db      00ch, 02ch, 020h, 0aah, 020h, 01bh, 00eh, 029h, 020h, 084h, 020h, 0b3h, 020h, 0b9h, 00ah, 0aeh
        db      020h, 0ach, 020h, 081h, 020h, 01bh, 046h, 020h, 085h, 020h, 097h, 020h, 01bh, 00fh, 02eh, 00ah
        db      000h, 0a6h, 020h, 0b4h, 020h, 081h, 020h, 0f2h, 020h, 01bh, 002h, 020h, 0a4h, 020h, 084h, 00ah
        db      0b3h, 020h, 0b9h, 020h, 0aeh, 020h, 0ach, 020h, 081h, 020h, 01bh, 046h, 020h, 085h, 020h, 097h
        db      00ah, 01bh, 00fh, 02eh, 00ah, 000h, 08dh, 020h, 0cbh, 020h, 01bh, 062h, 020h, 0b9h, 020h, 0c0h
        db      020h, 0bdh, 00ah, 01bh, 04ch, 020h, 088h, 020h, 099h, 020h, 028h, 0d1h, 020h, 0bah
        else
        db      084h, 020h, 097h, 020h, 083h, 00ah, 01bh, 01fh, 020h, 0b0h, 020h, 022h, 01bh, 03ch, 020h, 0a8h
        db      022h, 020h, 0a0h, 02eh, 00ah, 000h, 08dh, 020h, 0e2h
        db      " sets a "
        db      01bh, 03bh, 020h, 09dh, 020h, 01bh, 05ch, 020h, 0a8h, 00ah, 0b0h, 020h, 061h, 020h, 087h, 020h
        db      084h, 020h, 061h, 020h, 01bh, 028h, 020h, 0e6h, 020h, 0f0h, 00ah
        db      "Parameter ("
        db      01bh, 063h, 02ch, 020h, 0fch, 02ch, 020h, 0abh, 020h, 01bh, 000h, 029h, 00ah, 091h, 020h, 0a1h
        db      02eh, 020h, 0a2h, 020h, 0b1h, 020h, 081h, 020h, 082h, 020h, 084h, 00ah, 098h, 020h, 0c1h, 02eh
        db      00ah, 000h, 0a2h, 020h, 0b1h, 020h, 081h, 020h, 087h, 020h, 083h, 020h, 084h, 020h, 098h, 00ah
        db      0c1h, 02eh, 020h, 08dh, 020h, 01bh, 05eh, 020h, 098h, 020h, 061h, 020h, 01bh, 049h, 020h, 087h
        db      02eh, 00ah, 000h, 0a2h, 020h, 0b1h, 020h, 081h, 020h, 0d3h, 020h, 09dh, 020h, 081h, 020h, 0d2h
        db      020h, 084h, 00ah, 098h, 020h, 0c1h, 020h, 028h, 01bh, 02eh, 02eh, 0e7h, 02eh, 0e5h, 029h, 02eh
        db      00ah, 000h, 089h, 020h, 01bh, 02eh, 02eh, 0e7h, 02eh, 0e5h, 020h, 0dah, 020h, 01bh, 00fh, 020h
        db      081h, 00ah, 0e6h, 020h, 0f0h, 020h, 09bh, 020h, 085h
        db      " END. It "
        db      0a6h, 00ah, 081h, 020h, 0f6h, 020h, 01bh, 087h, 020h, 01bh, 0a3h, 020h, 081h, 020h, 0d2h, 020h
        db      084h, 020h, 098h, 00ah, 01bh, 00bh, 02eh, 00ah, 000h, 0a2h, 020h, 0b1h, 020h, 081h, 020h, 0e6h
        db      020h, 0f0h, 020h, 01bh, 03ah, 00ah, 028h, 01bh, 063h, 02ch, 020h, 0fch, 02ch, 020h, 0abh, 020h
        db      01bh, 000h, 029h, 020h, 084h, 020h, 0b3h, 020h, 0b9h, 00ah, 0a8h, 020h, 0b0h, 020h, 081h, 020h
        db      01bh, 03bh, 020h, 085h, 020h, 098h, 020h, 01bh, 018h, 02eh, 00ah, 000h, 0a2h, 020h, 0b1h, 020h
        db      081h, 020h, 0e6h, 020h, 0f0h, 020h, 0a1h, 020h, 084h, 00ah, 0b3h, 020h, 0b9h, 020h, 0a8h, 020h
        db      0b0h, 020h, 081h, 020h, 01bh, 03bh, 020h, 085h, 020h, 098h, 00ah, 01bh, 018h, 02eh, 00ah, 000h
        db      08dh, 020h, 0c8h, 020h, 01bh, 051h, 020h, 0b9h, 020h, 0bfh, 020h, 0b6h, 00ah, 01bh, 034h, 020h
        db      086h, 020h, 099h, 020h, 028h, 0d5h, 020h, 0b7h
        endif
        db      " per line)."
        if      FW_VERSION >= 312
        db      00ah
        db      "Each line "
        db      01bh, 06ch, 020h, 081h, 020h, 0b3h, 020h, 0c7h, 020h, 091h, 020h, 01bh, 087h, 00ah, 0a5h, 020h
        db      0e7h, 02eh, 020h, 01bh, 09dh
        db      " cursor buttons "
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 0e0h
        db      " line "
        db      01bh, 062h, 020h, 081h, 020h, 0bah, 020h, 0ceh, 020h, 08eh, 020h, 01bh, 0c5h, 00ah, 0a3h, 020h
        db      0e7h, 02eh, 020h, 01bh
        db      "p cursor buttons "
        else
        db      00ah, 01bh, 0bch
        db      " line "
        db      01bh, 051h, 020h, 081h, 020h, 0b7h, 020h, 0c3h, 020h, 091h, 020h, 01bh, 0a9h, 00ah, 0a5h, 020h
        db      0ddh, 02eh, 020h, 01bh
        db      "_ cursor buttons "
        endif
        db      084h
        db      " edit"
        if      FW_VERSION >= 312
        db      00ah, 0a5h, 020h, 091h, 020h, 022h, 03ch, 022h, 020h, 091h, 020h, 022h, 03eh, 022h, 020h, 084h
        db      020h, 01bh, 0cch, 020h, 084h, 020h, 01bh, 030h, 00ah, 01bh, 082h, 02eh, 00ah, 000h, 049h, 06eh
        db      020h, 081h, 020h, 01bh, 0f4h
        db      " EDIT "
        db      0beh, 02ch, 020h, 0f7h, 00ah, 03ch, 01bh, 0ffh, 03eh, 020h, 01bh, 0c9h
        db      " an "
        db      0b3h, 020h, 01bh, 056h, 020h, 081h, 00ah, 01bh, 02bh, 020h, 0f3h, 02eh, 020h, 01bh, 05bh, 020h
        db      0bbh, 020h, 081h, 020h, 0b3h, 00ah, 0c7h, 020h, 084h, 020h, 0f2h, 02eh, 00ah, 000h, 01bh, 060h
        db      020h, 01bh, 0b6h, 02ch, 020h, 081h
        elseif  FW_VERSION = 311
        db      00ah, 0a3h, 020h, 08eh, 020h, 022h, 03ch, 022h, 020h, 08eh, 020h, 022h, 03eh, 022h, 020h, 084h
        db      020h, 01bh, 0e1h, 020h, 084h, 020h, 01bh, 022h, 00ah, 01bh, 07fh, 02eh, 00ah, 000h, 049h, 06eh
        db      020h, 081h
        db      " STEP EDIT "
        db      0cbh, 02ch, 020h, 01bh, 036h, 00ah
        db      "<Insert> "
        db      01bh, 0cch, 020h, 01bh, 0ach, 020h, 0bah, 020h, 01bh, 04ch, 020h, 081h, 00ah, 0fch, 020h, 01bh
        db      006h, 02eh, 020h, 01bh, 073h, 020h, 0b4h, 020h, 081h, 020h, 0bah, 009h, 0ceh, 020h, 084h, 020h
        db      01bh, 009h, 02eh, 00ah, 000h, 01bh, 078h, 020h, 01bh, 0dch, 02ch, 020h, 081h
        else
        db      00ah, 0a5h, 020h, 091h, 020h, 022h, 03ch, 022h, 020h, 091h, 020h, 022h, 03eh, 022h, 020h, 084h
        db      020h, 01bh, 0aeh, 020h, 084h, 020h, 01bh, 037h, 00ah, 01bh, 076h, 02eh, 00ah, 000h, 049h, 06eh
        db      020h, 081h, 020h, 01bh, 0e8h
        db      " EDIT "
        db      0c8h, 02ch, 020h, 01bh, 029h, 00ah, 03ch, 01bh, 0f9h, 03eh, 020h, 01bh, 0b6h, 020h, 01bh, 0c5h
        db      020h, 0b7h, 020h, 01bh, 034h, 020h, 081h, 00ah, 0f3h, 020h, 0f9h
        db      ". Choose "
        db      0b1h, 020h, 081h, 020h, 0b7h, 020h, 009h, 0c3h, 020h, 084h, 020h, 0fah, 02eh, 00ah, 000h, 01bh
        db      0c1h
        db      " YES, "
        db      081h
        endif
        db      " NOW "
        if      FW_VERSION >= 312
        db      09dh, 020h, 085h
        else
        db      0a0h, 020h, 085h
        endif
        db      " advance "
        if      FW_VERSION >= 312
        db      0cch, 00ah, 022h, 0f3h, 022h, 020h, 028h, 0feh, 020h, 0aeh, 020h, 081h
        db      " Timing Correct"
        db      00ah, 0beh, 027h, 073h, 020h, 0deh
        db      " Value "
        db      09dh, 029h, 020h, 0b6h, 020h, 061h, 00ah, 0c4h
        db      " key "
        db      0adh, 020h, 01bh, 03ah, 020h, 01bh, 025h, 020h, 099h
        elseif  FW_VERSION = 311
        db      0d1h, 00ah, 022h, 01bh, 006h, 022h
        db      " (usually "
        db      0d1h, 020h, 031h, 02fh, 031h, 036h, 02dh, 09bh, 029h, 020h, 0c1h, 020h, 061h, 00ah, 0c8h, 020h
        db      01bh, 0a3h, 020h, 0aah, 020h, 01bh, 057h, 020h, 01bh, 033h, 020h, 096h
        else
        db      0d5h, 00ah, 022h, 0f9h, 022h
        db      " (usually "
        db      0d5h, 020h, 031h, 02fh, 031h, 036h, 02dh, 097h, 029h, 020h, 0bah, 020h, 061h, 00ah, 0c0h, 020h
        db      01bh, 082h, 020h, 0abh, 020h, 01bh, 05ch, 020h, 01bh, 023h, 020h, 0a6h
        endif
        db      " released."
        if      FW_VERSION >= 312
        db      00ah, 08ch, 020h, 01bh, 0fbh, 020h, 01bh, 027h, 020h, 0f3h, 02dh, 0ceh, 020h, 098h, 020h, 084h
        db      00ah, 01bh, 06fh, 020h, 01bh, 087h, 020h, 01bh, 03dh, 020h, 01bh, 017h, 00ah, 000h
        elseif  FW_VERSION = 311
        db      00ah, 08dh, 020h, 01bh, 0bah, 020h, 01bh, 035h, 020h, 01bh, 006h, 02dh, 0d6h, 020h, 09bh, 020h
        db      084h, 00ah, 01bh, 089h, 020h, 01bh, 0c5h, 020h, 01bh, 05ah, 020h, 01bh, 02dh, 00ah, 000h
        else
        db      00ah, 08dh, 020h, 01bh, 094h, 020h, 01bh, 05ah, 020h, 0f9h, 02dh, 0ceh, 020h, 097h, 020h, 084h
        db      00ah, 01bh, 066h, 020h, 01bh, 0a9h, 020h, 01bh, 041h, 020h, 01bh, 020h, 00ah, 000h
        endif
        db      "AS PLAYED: "
        if      FW_VERSION >= 312
        db      081h, 020h, 098h, 027h, 073h, 020h, 0eah, 020h, 085h, 020h, 096h, 00ah, 0ceh
        elseif  FW_VERSION = 311
        db      081h, 020h, 09bh, 027h, 073h, 020h, 0f7h, 020h, 085h, 020h, 097h, 00ah, 0d6h
        else
        db      081h, 020h, 097h, 027h, 073h, 020h, 0edh, 020h, 085h, 020h, 098h, 00ah, 0ceh
        endif
        db      " as "
        if      FW_VERSION >= 312
        db      0e6h, 020h, 028h, 031h, 02fh, 034h, 02dh, 098h
        elseif  FW_VERSION = 311
        db      0f4h, 020h, 028h, 031h, 02fh, 034h, 02dh, 09bh
        else
        db      0ech, 020h, 028h, 031h, 02fh, 034h, 02dh, 097h
        endif
        db      " click "
        db      085h, 00ah
        db      "guide "
        if      FW_VERSION >= 312
        db      0f6h, 029h, 02eh, 00ah
        db      "SAME AS "
        db      01bh, 0f4h, 03ah, 020h, 0eah, 020h, 085h, 020h, 096h, 020h, 081h, 00ah, 0a9h, 020h, 022h, 0deh
        db      020h, 0a0h, 022h, 020h, 01bh, 070h, 020h, 0aeh, 020h, 081h, 00ah
        db      "TIMING "
        db      01bh, 0ceh, 020h, 0beh, 02eh, 00ah, 000h
        db      "INSERT/DELETE: "
        db      01bh, 0fch
        db      " Keys 1 "
        db      091h, 020h, 032h, 020h, 0f2h, 00ah, 091h, 020h, 0dah, 020h, 0bfh, 02eh, 00ah
        db      "PASTE/CUT: "
        db      01bh, 0fch
        db      " Key 2 removes an "
        db      0b3h, 00ah, 0c0h, 020h, 081h, 020h, 0beh, 02ch, 020h, 01bh, 0fch
        db      " Key 1 pastes "
        db      0f1h, 00ah, 01bh, 094h, 020h, 01bh, 056h, 020h, 0a8h, 020h, 093h, 02eh, 00ah, 000h
        db      "NEXT "
        db      01bh, 0f4h, 03ah, 020h, 0f7h, 020h, 022h, 03eh, 022h, 020h, 091h, 020h, 022h, 03ch, 022h, 020h
        db      01bh, 026h, 00ah
        elseif  FW_VERSION = 311
        db      0ebh, 029h, 02eh, 00ah
        db      "SAME AS STEP: "
        db      0f7h, 020h, 085h, 020h, 097h, 020h, 081h, 00ah, 0adh, 020h, 022h, 0f2h, 020h, 0a4h, 022h, 020h
        db      01bh, 07ch, 020h, 0ach, 020h, 081h, 00ah
        db      "TIMING "
        db      01bh, 0d3h, 020h, 0cbh, 02eh, 00ah, 000h
        db      "INSERT/DELETE: Soft Keys 1 "
        db      08eh, 020h, 032h, 020h, 01bh, 009h, 00ah, 08eh, 020h, 0e5h, 020h, 0c0h, 02eh, 00ah
        db      "PASTE/CUT: Soft Key 2 removes "
        db      01bh, 0ach, 020h, 0bah, 00ah, 0b7h, 020h, 081h, 020h, 0cbh
        db      ", Soft Key 1 pastes "
        db      0f5h, 00ah, 01bh, 0adh, 020h, 01bh, 04ch, 020h, 0a9h, 020h, 099h, 02eh, 00ah, 000h
        db      "NEXT STEP: "
        db      01bh, 036h, 020h, 022h, 03eh, 022h, 020h, 08eh, 020h, 022h, 03ch, 022h, 020h, 01bh, 042h, 00ah
        else
        db      0f8h, 029h, 02eh, 00ah
        db      "SAME AS "
        db      01bh, 0e8h, 03ah, 020h, 0edh, 020h, 085h, 020h, 098h, 020h, 081h, 00ah, 0aah, 020h, 022h, 0e6h
        db      020h, 0a1h, 022h, 020h, 01bh, 075h, 020h, 0b0h, 020h, 081h, 00ah, 01bh, 0fah, 020h, 01bh, 0b7h
        db      020h, 0c8h, 02eh, 00ah, 000h
        db      "INSERT/DELETE: "
        db      01bh, 0ffh
        db      " Keys 1 "
        db      091h, 020h, 032h, 020h, 0fah, 00ah, 091h, 020h, 0deh, 020h, 0bfh, 02eh, 00ah
        db      "PASTE/CUT: "
        db      01bh, 0ffh
        db      " Key 2 removes "
        db      01bh, 0c5h, 020h, 0b7h, 00ah, 0b4h, 020h, 081h, 020h, 0c8h, 02ch, 020h, 01bh, 0ffh
        db      " Key 1 pastes "
        db      0dch, 00ah, 01bh, 08eh, 020h, 01bh, 034h, 020h, 0a7h, 020h, 099h, 02eh, 00ah, 000h
        db      "NEXT "
        db      01bh, 0e8h, 03ah, 020h, 01bh, 029h, 020h, 022h, 03eh, 022h, 020h, 091h, 020h, 022h, 03ch, 022h
        db      020h, 01bh, 032h, 00ah
        endif
        db      "moves "
        if      FW_VERSION >= 312
        db      0cch, 020h, 0f3h
        elseif  FW_VERSION = 311
        db      0d1h, 020h, 01bh, 006h
        else
        db      0d5h, 020h, 0f9h
        endif
        db      " forward "
        if      FW_VERSION >= 312
        db      0adh, 020h, 01bh, 094h, 020h, 028h, 0feh, 00ah, 0f3h
        db      " size "
        db      0aeh
        db      " TIMING "
        db      01bh, 0ceh, 020h, 0beh, 027h, 073h, 00ah, 022h, 0deh
        elseif  FW_VERSION = 311
        db      0aah, 020h, 01bh, 0adh, 020h, 028h, 01bh, 00fh, 00ah, 01bh, 006h, 020h, 01bh, 0b1h, 020h, 0ach
        db      " TIMING "
        db      01bh, 0d3h, 020h, 0cbh, 027h, 073h, 00ah, 022h, 0f2h
        else
        db      0abh, 020h, 01bh, 08eh, 020h, 028h, 01bh, 018h, 00ah, 0f9h, 020h, 01bh, 0cah, 020h, 0b0h, 020h
        db      01bh, 0fah, 020h, 01bh, 0b7h, 020h, 0c8h, 027h, 073h, 00ah, 022h, 0e6h
        endif
        db      " Value"
        if      FW_VERSION >= 312
        db      022h, 020h, 09dh, 029h, 02eh, 00ah
        else
        db      022h, 020h, 0a0h, 029h, 02eh, 00ah
        endif
        db      "NEXT EVENT: "
        if      FW_VERSION >= 312
        db      0f7h, 020h, 022h, 03eh, 022h, 020h, 0adh, 020h, 022h, 03ch, 022h
        elseif  FW_VERSION = 311
        db      01bh, 036h, 020h, 022h, 03eh, 022h, 020h, 0aah, 020h, 022h, 03ch, 022h
        else
        db      01bh, 029h, 020h, 022h, 03eh, 022h, 020h, 0abh, 020h, 022h, 03ch, 022h
        endif
        db      " moves"
        db      00ah, 084h
        db      " next "
        if      FW_VERSION >= 312
        db      0adh
        elseif  FW_VERSION = 311
        db      0aah
        else
        db      0abh
        endif
        db      " previous "
        if      FW_VERSION >= 312
        db      0b3h, 020h, 0aeh, 020h, 088h, 02eh, 00ah, 000h, 01bh
        db      ". EVENTS "
        db      01bh, 06ch, 020h, 0bah, 020h, 0b3h
        elseif  FW_VERSION = 311
        db      0bah, 020h, 0ach, 020h, 087h, 02eh, 00ah, 000h, 01bh
        db      "@ EVENTS "
        db      01bh, 062h, 020h, 0b9h, 020h, 0bah
        else
        db      0b7h, 020h, 0b0h, 020h, 087h, 02eh, 00ah, 000h, 01bh
        db      "/ EVENTS "
        db      01bh, 051h, 020h, 0b9h, 020h, 0b7h
        endif
        db      " types."
        if      FW_VERSION >= 312
        db      00ah, 01bh, 0fdh
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 0b2h
        else
        db      00ah, 01bh, 0feh
        endif
        db      " VIEW "
        if      FW_VERSION >= 312
        db      01bh, 06ch, 020h, 0fch, 020h, 081h, 020h, 0b3h, 020h, 0aeh, 020h, 081h, 00ah, 09dh, 020h, 084h
        db      020h, 081h, 020h, 01bh, 016h, 02eh, 00ah, 01bh, 02eh, 020h, 01bh, 09ch, 020h, 01bh, 06ch, 020h
        db      0bah, 020h, 0bfh
        elseif  FW_VERSION = 311
        db      01bh, 062h, 020h, 0ffh, 020h, 081h, 020h, 0bah, 020h, 0ach, 020h, 081h, 00ah, 0a0h, 020h, 084h
        db      020h, 081h, 020h, 0dbh, 02eh, 00ah, 01bh, 040h, 020h, 01bh, 0c2h, 020h, 01bh, 062h, 020h, 0b9h
        db      020h, 0c0h
        else
        db      01bh, 051h, 020h, 01bh, 045h, 020h, 081h, 020h, 0b7h, 020h, 0b0h, 020h, 081h, 00ah, 0a0h, 020h
        db      084h, 020h, 081h, 020h, 0d1h, 02eh, 00ah, 01bh, 02fh, 020h, 01bh, 09fh, 020h, 01bh, 051h, 020h
        db      0b9h, 020h, 0bfh
        endif
        db      " except "
        if      FW_VERSION >= 312
        db      081h, 00ah, 0b3h, 020h, 0aeh, 020h, 081h, 020h, 09dh, 020h, 084h, 020h, 081h, 020h, 01bh, 016h
        db      02eh, 00ah, 000h, 08ch, 020h, 09dh, 020h, 01bh, 053h, 020h, 0b1h, 020h, 0b3h, 020h, 0c7h, 00ah
        db      085h, 020h, 096h, 020h, 01bh, 02bh, 020h, 028h, 01bh, 046h, 020h, 01bh, 0fdh
        elseif  FW_VERSION = 311
        db      081h, 00ah, 0bah, 020h, 0ach, 020h, 081h, 020h, 0a0h, 020h, 084h, 020h, 081h, 020h, 0dbh, 02eh
        db      00ah, 000h, 08dh, 020h, 0a0h, 020h, 01bh, 06ah, 020h, 0b3h, 020h, 0bah, 020h, 0ceh, 00ah, 085h
        db      020h, 097h, 020h, 0fch, 020h, 028h, 01bh, 053h, 020h, 01bh, 0b2h
        else
        db      081h, 00ah, 0b7h, 020h, 0b0h, 020h, 081h, 020h, 0a0h, 020h, 084h, 020h, 081h, 020h, 0d1h, 02eh
        db      00ah, 000h, 08dh, 020h, 0a0h, 020h, 01bh, 056h, 020h, 0b3h, 020h, 0b7h, 020h, 0c3h, 00ah, 085h
        db      020h, 098h, 020h, 0f3h, 020h, 028h, 01bh, 059h, 020h, 01bh, 0feh
        endif
        db      " VIEW "
        if      FW_VERSION >= 312
        db      099h, 00ah, 08dh, 020h, 084h, 020h, 081h, 020h, 01bh, 014h, 029h, 020h, 0adh
        elseif  FW_VERSION = 311
        db      096h, 00ah, 08ch, 020h, 084h, 020h, 081h, 020h, 01bh, 034h, 029h, 020h, 0aah
        else
        db      0a6h, 00ah, 08ah, 020h, 084h, 020h, 081h, 020h, 01bh, 031h, 029h, 020h, 0abh
        endif
        db      " hidden ("
        if      FW_VERSION >= 312
        db      01bh, 046h, 020h, 01bh, 02eh, 00ah, 01bh, 09ch, 020h, 099h, 020h, 08dh, 029h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      01bh, 053h, 020h, 01bh, 040h, 00ah, 01bh, 0c2h, 020h, 096h, 020h, 08ch, 029h, 02eh, 00ah, 000h
        else
        db      01bh, 059h, 020h, 01bh, 02fh, 00ah, 01bh, 09fh, 020h, 0a6h, 020h, 08ah, 029h, 02eh, 00ah, 000h
        endif
        db      022h
        if      FW_VERSION >= 312
        db      "Edit "
        db      01bh, 0ech, 022h
        elseif  FW_VERSION = 311
        db      "Edit Loop"
        db      022h
        else
        db      "Edit "
        db      01bh, 0f5h, 022h
        endif
        db      " permits a "
        if      FW_VERSION >= 312
        db      01bh, 00ch, 020h, 083h, 00ah, 09eh, 020h, 0ebh, 020h, 084h, 020h, 096h, 020h, 0e6h, 020h, 0aeh
        db      020h, 061h, 020h, 01bh, 08ah, 020h, 0a4h
        elseif  FW_VERSION = 311
        db      01bh, 021h, 020h, 083h, 00ah, 09eh, 020h, 01bh, 004h, 020h, 084h, 020h, 097h, 020h, 0f4h, 020h
        db      0ach, 020h, 061h, 020h, 01bh, 0a6h, 020h, 0a5h
        else
        db      01bh, 017h, 020h, 083h, 00ah, 09dh, 020h, 01bh, 007h, 020h, 084h, 020h, 098h, 020h, 0ech, 020h
        db      0b0h, 020h, 061h, 020h, 01bh, 08ah, 020h, 0a4h
        endif
        db      " fast"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 01ah, 02eh, 020h, 09fh, 020h, 03ch, 01bh, 0d1h
        db      " On> "
        db      084h, 020h, 01bh, 08dh, 020h, 01bh, 08ah, 00ah, 0e9h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 02fh, 02eh, 020h, 092h, 020h, 03ch, 01bh, 08fh
        db      " On> "
        db      084h, 020h, 01bh, 086h, 020h, 01bh, 0a6h, 00ah, 0eah
        else
        db      00ah, 01bh, 021h, 02eh, 020h, 090h, 020h, 03ch, 01bh
        db      "r On> "
        db      084h, 020h, 01bh, 081h, 020h, 01bh, 08ah, 00ah, 0efh
        endif
        db      ". Later, "
        if      FW_VERSION >= 312
        db      08bh, 020h, 03ch, 01bh, 0d1h, 020h, 01bh, 0d2h, 03eh, 02ch, 020h, 084h
        elseif  FW_VERSION = 311
        db      089h, 020h, 03ch, 01bh, 08fh, 020h, 01bh, 0f2h, 03eh, 02ch, 020h, 084h
        else
        db      088h, 020h, 03ch, 01bh, 072h, 020h, 01bh, 0e0h, 03eh, 02ch, 020h, 084h
        endif
        db      " keep"
        if      FW_VERSION >= 312
        db      00ah, 081h, 020h, 0b0h, 020h, 0adh
        elseif  FW_VERSION = 311
        db      00ah, 081h, 020h, 0b2h, 020h, 0aah
        else
        db      00ah, 081h, 020h, 0aeh, 020h, 0abh
        endif
        db      " <Undo & "
        if      FW_VERSION >= 312
        db      01bh, 0d2h, 03eh, 020h, 084h
        elseif  FW_VERSION = 311
        db      01bh, 0f2h, 03eh, 020h, 084h
        else
        db      01bh, 0e0h, 03eh, 020h, 084h
        endif
        db      " undo"
        if      FW_VERSION >= 312
        db      00ah, 0b0h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      00ah, 0b2h, 02eh, 00ah, 000h, 092h, 020h, 061h, 020h, 083h, 020h, 01bh, 0a3h, 020h, 084h, 020h
        db      093h, 020h, 01bh, 0ach, 020h, 01bh, 008h, 02eh, 00ah, 000h
        else
        db      00ah, 0aeh, 02eh, 00ah, 000h, 090h, 020h, 061h, 020h, 083h, 020h, 01bh, 082h, 020h, 084h, 020h
        db      092h, 020h, 01bh, 0c5h, 020h, 0fdh, 02eh, 00ah, 000h
        endif
        db      "Pads "
        if      FW_VERSION >= 312
        db      01bh, 052h, 020h, 096h, 020h, 0d6h, 020h, 084h, 020h, 086h, 020h, 098h, 00ah, 01bh, 03fh, 020h
        db      0c8h, 020h, 01bh, 06bh, 02eh, 00ah
        db      "PROGRAM "
        db      01bh, 07ah, 020h, 0a9h, 020h, 090h, 027h, 073h, 00ah, 0e8h, 02eh, 00ah, 01bh, 0a9h, 020h, 01bh
        db      "z a master "
        db      0feh, 020h, 01bh, 04ah, 020h, 0aeh, 020h, 081h, 00ah, 022h, 041h, 050h, 053h, 022h, 020h, 08fh
        db      02eh, 00ah, 000h, 08eh, 020h, 01bh
        db      "% (A01-D16) "
        db      084h, 020h, 096h, 020h, 0d6h, 02eh, 00ah, 000h, 089h, 020h, 098h, 020h, 083h, 020h, 0f6h, 020h
        db      01bh, 041h, 020h, 087h, 020h, 01bh, 025h, 020h, 084h, 020h, 096h, 00ah, 0d6h, 020h, 084h
        elseif  FW_VERSION = 311
        db      01bh, 06fh, 020h, 097h, 020h, 0cdh, 020h, 084h, 020h, 086h, 020h, 09bh, 00ah, 0f9h, 020h, 0d2h
        db      020h, 01bh, 0c4h, 02eh, 00ah, 01bh, 094h, 020h, 01bh, 0b0h, 020h, 0adh, 020h, 090h, 027h, 073h
        db      00ah, 0c9h, 02eh, 00ah, 01bh, 0bdh, 020h, 01bh, 0b0h
        db      " a master "
        db      01bh, 00fh, 020h, 0fdh, 020h, 0ach, 020h, 081h, 00ah, 022h, 041h, 050h, 053h, 022h, 020h, 091h
        db      02eh, 00ah, 000h, 08fh, 020h, 01bh
        db      "3 (A01-D16) "
        db      084h, 020h, 097h, 020h, 0cdh, 02eh, 00ah, 01bh, 0a0h, 020h, 01bh, 02bh, 020h, 089h, 020h, 081h
        db      020h, 01bh, 033h, 020h, 084h, 020h, 093h, 020h, 0f5h, 02eh, 00ah, 000h, 08bh, 020h, 09bh, 020h
        db      083h, 020h, 0ebh, 020h, 01bh, 01bh, 020h, 088h, 020h, 01bh, 033h, 020h, 084h, 020h, 097h, 00ah
        db      0cdh, 020h, 084h
        else
        db      01bh, 05eh, 020h, 098h, 020h, 0cch, 020h, 084h, 020h, 08eh, 020h, 097h, 00ah, 0f1h, 020h, 0c6h
        db      020h, 01bh, 0bfh, 02eh, 00ah
        db      "PROGRAM "
        db      01bh, 07dh, 020h, 0aah, 020h, 08ch, 027h, 073h, 00ah, 0d0h, 02eh, 00ah, 01bh, 0a0h, 020h, 01bh
        db      "} a master "
        db      01bh, 018h, 020h, 01bh, 09ch, 020h, 0b0h, 020h, 081h, 00ah, 022h, 041h, 050h, 053h, 022h, 020h
        db      093h, 02eh, 00ah, 000h, 08fh, 020h, 01bh
        db      "# (A01-D16) "
        db      084h, 020h, 098h, 020h, 0cch, 02eh, 00ah, 01bh, 0aah, 020h, 01bh, 036h, 020h, 088h, 020h, 081h
        db      020h, 01bh, 023h, 020h, 084h, 020h, 092h, 020h, 0dch, 02eh, 00ah, 000h, 089h, 020h, 097h, 020h
        db      083h, 020h, 0f8h, 020h, 01bh, 01dh, 020h, 086h, 020h, 01bh, 023h, 020h, 084h, 020h, 098h, 00ah
        db      0cch, 020h, 084h
        endif
        db      ". When "
        if      FW_VERSION >= 312
        db      087h, 020h, 01bh, 025h, 020h, 099h, 020h, 0e6h, 02ch, 00ah, 087h, 020h, 098h, 020h, 083h, 020h
        db      085h, 020h, 096h, 020h, 01bh
        db      "8 over"
        db      00ah, 086h, 020h, 091h, 020h, 0ceh, 020h, 0d1h, 020h, 09ch, 02eh, 00ah, 000h, 089h, 020h, 0dbh
        db      020h, 088h, 020h, 085h, 020h, 01bh, 06fh, 020h, 086h, 020h, 0a5h, 00ah, 0e9h, 020h, 087h, 020h
        db      094h, 020h, 028h, 031h, 02dh, 031h, 036h, 020h, 0adh, 020h, 01bh, 02eh, 029h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      088h, 020h, 01bh, 033h, 020h, 096h, 020h, 0f4h, 02ch, 00ah, 088h, 020h, 09bh, 020h, 083h, 020h
        db      085h, 020h, 097h, 020h, 01bh
        db      "X over"
        db      00ah, 086h, 02ch, 020h, 0d6h, 020h, 0d9h, 020h, 09dh, 02ch, 020h, 08eh, 00ah
        db      "determine "
        db      0b3h, 020h, 01bh, 016h, 020h, 08ah, 020h, 081h, 020h, 01bh, 064h, 00ah, 01bh, 027h, 02eh, 00ah
        db      000h, 08bh, 020h, 0deh, 020h, 087h, 020h, 085h, 020h, 01bh, 089h, 020h, 086h, 020h, 0a3h, 00ah
        db      0eah, 020h, 088h, 020h, 09ah, 020h, 028h, 031h, 02dh, 031h, 036h, 020h, 0aah, 020h, 01bh, 040h
        db      029h, 02eh, 00ah, 000h
        else
        db      086h, 020h, 01bh, 023h, 020h, 0a6h, 020h, 0ech, 02ch, 00ah, 086h, 020h, 097h, 020h, 083h, 020h
        db      085h, 020h, 098h, 020h, 01bh, 089h
        db      " over"
        db      00ah, 08eh, 02ch, 020h, 0ceh, 020h, 0e0h, 020h, 09ch, 02ch, 020h, 091h, 00ah
        db      "determine "
        db      0b3h, 020h, 01bh, 00ah, 020h, 08bh, 020h, 081h
        db      " MPC"
        db      00ah, 01bh, 015h, 02eh, 00ah, 000h, 089h, 020h, 0e8h, 020h, 087h, 020h, 085h, 020h, 01bh, 066h
        db      020h, 08eh, 020h, 0a5h, 00ah, 0efh, 020h, 086h, 020h, 0a9h, 020h, 028h, 031h, 02dh, 031h, 036h
        db      020h, 0abh, 020h, 01bh, 02fh, 029h, 02eh, 00ah, 000h
        endif
        db      "ON: "
        if      FW_VERSION >= 312
        db      01bh, 040h, 020h, 01bh, 0f5h
        elseif  FW_VERSION = 311
        db      01bh, 054h, 020h, 01bh, 0ddh
        else
        db      01bh, 048h, 020h, 01bh, 0b0h
        endif
        db      " triggers "
        if      FW_VERSION >= 312
        db      01bh, 021h, 00ah, 0bdh, 02eh, 00ah, 01bh, 012h
        db      ": disconnects "
        db      01bh, 0f5h, 020h, 0c0h, 020h, 01bh, 069h, 020h, 08ah, 00ah, 01bh, 02dh, 02eh, 020h, 01bh, 09dh
        db      020h, 087h, 020h, 01bh, 051h, 020h, 01bh, 046h, 020h, 0efh, 00ah, 084h, 020h, 01bh, 000h
        db      " sequencer."
        elseif  FW_VERSION = 311
        db      01bh, 016h, 00ah, 0a1h, 02eh, 00ah, 01bh
        db      "2: disconnects "
        db      01bh, 0ddh, 020h, 0b7h, 020h, 01bh, 064h, 020h, 08ah, 00ah, 01bh, 049h, 02eh, 020h, 01bh, 070h
        db      020h, 088h, 020h, 01bh, 050h, 020h, 01bh, 053h, 020h, 0e0h, 00ah, 084h, 020h, 01bh, 011h
        db      " sequencer."
        else
        db      01bh, 00ah, 00ah, 0b2h, 02eh, 00ah, 01bh
        db      "%: disconnects "
        db      01bh, 0b0h, 020h, 0b4h
        db      " MPC "
        db      08bh, 00ah, 01bh, 035h, 02eh, 020h, 01bh, 05fh, 020h, 086h, 020h, 01bh, 03fh, 020h, 01bh, 059h
        db      020h, 0d7h, 00ah, 084h, 020h, 01bh
        db      "M sequencer."
        endif
        db      00ah, 000h
        db      "ON: "
        if      FW_VERSION >= 312
        db      0d7h, 020h, 086h, 020h, 099h
        elseif  FW_VERSION = 311
        db      0e3h, 020h, 086h, 020h, 096h
        else
        db      0d8h, 020h, 08eh, 020h, 0a6h
        endif
        db      " passed "
        if      FW_VERSION >= 312
        db      084h, 020h, 0dbh, 00ah, 088h, 027h, 073h, 020h, 086h, 020h, 0b5h, 020h, 094h
        elseif  FW_VERSION = 311
        db      084h, 020h, 0deh, 00ah, 087h, 027h, 073h, 020h, 086h, 020h, 0b5h, 020h, 09ah
        else
        db      084h, 020h, 0e8h, 00ah, 087h, 027h, 073h, 020h, 08eh, 020h, 0c7h, 020h, 0a9h
        endif
        db      " (useful "
        if      FW_VERSION >= 312
        db      01bh, 046h, 00ah, 086h, 020h, 0c4h, 020h, 091h, 020h, 08ah
        elseif  FW_VERSION = 311
        db      01bh, 053h, 00ah, 086h, 020h, 0c8h, 020h, 08eh, 020h, 08ah
        else
        db      01bh, 059h, 00ah, 08eh, 020h, 0c0h, 020h, 091h, 020h, 08bh
        endif
        db      " modules "
        if      FW_VERSION >= 312
        db      0e2h, 00ah
        elseif  FW_VERSION = 311
        db      0cfh, 00ah
        else
        db      0d6h, 00ah
        endif
        db      "separated)."
        if      FW_VERSION >= 312
        db      00ah, 01bh, 012h, 03ah, 020h, 0f1h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 032h, 03ah, 020h, 0f5h
        else
        db      00ah, 01bh, 025h, 03ah, 020h, 0dch
        endif
        db      " isn't (useful "
        if      FW_VERSION >= 312
        db      0b6h, 020h, 061h, 020h, 01bh, 036h, 00ah
        elseif  FW_VERSION = 311
        db      0c1h, 020h, 061h, 020h, 01bh, 03eh, 00ah
        else
        db      0bah, 020h, 061h, 020h, 01bh, 044h, 00ah
        endif
        db      "integrated "
        if      FW_VERSION >= 312
        db      0c4h
        elseif  FW_VERSION = 311
        db      0c8h
        else
        db      0c0h
        endif
        db      " synth "
        if      FW_VERSION >= 312
        db      099h, 020h, 01bh, 010h, 029h, 02eh, 00ah, 000h, 01bh
        db      "W remote control "
        db      09eh, 020h, 0deh, 020h, 0ech, 00ah
        elseif  FW_VERSION = 311
        db      096h, 020h, 0fah, 029h, 02eh, 00ah, 000h, 01bh
        db      "r remote "
        db      01bh, 0d6h, 020h, 09eh, 020h, 0f2h, 020h, 01bh, 002h, 00ah
        else
        db      0a6h, 020h, 0fbh, 029h, 02eh, 00ah, 000h, 01bh
        db      "a remote "
        db      01bh, 0afh, 020h, 09dh, 020h, 0e6h, 020h, 0f0h, 00ah
        endif
        db      "Slider "
        if      FW_VERSION >= 312
        db      01bh, 09fh, 020h, 086h, 02eh, 020h, 01bh
        db      "C emulate "
        db      081h, 020h, 01bh, 0a5h, 00ah, 0c0h, 020h, 061h, 020h, 0c4h
        elseif  FW_VERSION = 311
        db      01bh, 0d0h, 020h, 086h, 02eh, 020h, 01bh
        db      "K emulate "
        db      081h, 020h, 01bh, 0bbh, 00ah, 0b7h, 020h, 061h, 020h, 0c8h
        else
        db      01bh, 0fbh, 020h, 08eh, 02eh, 020h, 01bh
        db      "< emulate "
        db      081h, 020h, 01bh, 099h, 00ah, 0b4h, 020h, 061h, 020h, 0c0h
        endif
        db      " modulation wheel, "
        if      FW_VERSION >= 312
        db      0dfh, 00ah, 022h, 031h, 022h, 02eh, 00ah, 000h, 01bh, 012h, 03ah, 020h, 01bh, 0bch
        elseif  FW_VERSION = 311
        db      0e2h, 00ah, 022h, 031h, 022h, 02eh, 00ah, 000h, 01bh, 032h, 03ah, 020h, 01bh, 0ech
        else
        db      0f7h, 00ah, 022h, 031h, 022h, 02eh, 00ah, 000h, 01bh, 025h, 03ah, 020h, 01bh, 0c7h
        endif
        db      " pedal "
        if      FW_VERSION >= 312
        db      0ffh, 020h, 028h, 01bh, 01bh, 00ah, 036h, 034h, 029h, 020h, 0e2h, 020h, 0ceh, 020h, 0d1h, 020h
        db      081h, 020h, 088h, 02eh, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 015h, 020h, 028h, 01bh, 02eh, 00ah, 036h, 034h, 029h, 020h, 0cfh, 020h, 0d6h, 020h, 0d9h
        db      020h, 081h, 020h, 087h, 02eh, 00ah
        else
        db      01bh, 002h, 020h, 028h, 01bh, 024h, 00ah, 036h, 034h, 029h, 020h, 0d6h, 020h, 0ceh, 020h, 0e0h
        db      020h, 081h, 020h, 087h, 02eh, 00ah
        endif
        db      "ON: durations "
        if      FW_VERSION >= 311
        db      09eh
        else
        db      09dh
        endif
        db      " newly-"
        if      FW_VERSION >= 312
        db      0ceh, 020h, 0aah, 00ah, 0e2h
        elseif  FW_VERSION = 311
        db      0d6h, 020h, 0aeh, 00ah, 0cfh
        else
        db      0ceh, 020h, 0a8h, 00ah, 0d6h
        endif
        db      " lengthened "
        if      FW_VERSION >= 312
        db      0b6h, 020h, 01bh, 0bch
        elseif  FW_VERSION = 311
        db      0c1h, 020h, 01bh, 0ech
        else
        db      0bah, 020h, 01bh, 0c7h
        endif
        db      " pedal "
        if      FW_VERSION >= 312
        db      099h, 00ah, 0b7h
        db      ", eliminating problems "
        db      0aeh, 00ah, 01bh, 01ah, 020h, 091h
        elseif  FW_VERSION = 311
        db      096h, 00ah, 0bch, 02ch, 020h, 01bh, 0c1h
        db      " problems "
        db      0ach, 00ah, 01bh, 02fh, 020h, 08eh
        else
        db      0a6h, 00ah, 0bdh, 02ch, 020h, 01bh, 0a4h
        db      " problems "
        db      0b0h, 00ah, 01bh, 021h, 020h, 091h
        endif
        db      " merging "
        if      FW_VERSION >= 312
        db      01bh, 0bch, 020h, 0a5h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      01bh, 0ech, 020h, 0a3h, 02eh, 00ah, 000h
        else
        db      01bh, 0c7h, 020h, 0a5h, 02eh, 00ah, 000h
        endif
        db      "RECEIVE: "
        if      FW_VERSION >= 312
        db      0d7h, 020h, 086h, 020h, 09ah, 020h, 0ffh, 00ah, 028h, 01bh, 01bh, 020h, 037h, 029h, 020h, 0a2h
        db      020h, 09ah, 020h, 09eh, 020h, 0bah, 00ah, 01bh, 0d4h, 020h, 01bh, 039h, 02eh, 00ah
        elseif  FW_VERSION = 311
        db      0e3h, 020h, 086h, 020h, 095h, 020h, 01bh, 015h, 00ah, 028h, 01bh, 02eh, 020h, 037h, 029h, 020h
        db      0a2h, 020h, 095h, 020h, 09eh, 020h, 0b9h, 00ah, 01bh, 0b6h, 020h, 01bh, 04dh, 02eh, 00ah
        else
        db      0d8h, 020h, 08eh, 020h, 094h, 020h, 01bh, 002h, 00ah, 028h, 01bh, 024h, 020h, 037h, 029h, 020h
        db      09bh, 020h, 094h, 020h, 09dh, 020h, 0b9h, 00ah, 01bh, 096h, 020h, 01bh, 047h, 02eh, 00ah
        endif
        db      "IGNORE: they "
        if      FW_VERSION >= 312
        db      0e2h, 020h, 01bh, 042h, 02eh, 00ah, 000h, 089h, 020h, 0a9h, 020h, 086h, 020h, 09ah, 020h, 0a0h
        db      020h, 028h, 030h, 02dh, 031h, 032h, 037h, 029h, 02eh, 00ah, 01bh, 0d5h
        db      " affects "
        db      081h, 020h, 09ah, 020h, 09eh, 020h, 0bah, 020h, 01bh, 0d4h, 00ah, 01bh, 039h, 020h, 091h, 020h
        db      01bh, 074h, 020h, 096h, 020h, 0feh, 020h, 01bh, 09fh, 020h, 0d7h, 020h, 086h, 00ah, 09ah, 020h
        db      0ffh, 020h, 028h, 01bh, 01bh, 020h, 037h, 029h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      0cfh, 020h, 01bh, 05ch, 02eh, 00ah, 000h, 08bh, 020h, 0adh, 020h, 086h, 020h, 095h, 020h, 0a4h
        db      02eh, 00ah, 01bh, 0bfh
        db      " affects "
        db      081h, 020h, 095h, 020h, 09eh, 020h, 0b9h, 020h, 01bh, 0b6h, 00ah, 01bh, 04dh, 020h, 08eh, 020h
        db      01bh, 02bh, 020h, 097h, 020h, 01bh, 00fh, 020h, 01bh, 0d0h, 020h, 0e3h, 020h, 086h, 00ah, 095h
        db      020h, 01bh, 015h, 020h, 028h, 01bh
        db      ". 7). Set "
        db      0f5h, 00ah, 084h, 020h, 031h, 032h, 037h, 020h, 0a5h, 020h, 01bh, 00ah, 020h, 095h, 020h, 01bh
        db      0c7h
        db      ". Set "
        db      084h, 00ah, 030h, 020h, 0a5h, 020h, 01bh, 09fh, 020h, 01bh, 0b6h, 02eh, 00ah, 000h
        else
        db      0d6h, 020h, 01bh, 03dh, 02eh, 00ah, 000h, 089h, 020h, 0aah, 020h, 08eh, 020h, 094h, 020h, 0a1h
        db      02eh, 00ah
        db      "It affects "
        db      081h, 020h, 094h, 020h, 09dh, 020h, 0b9h, 020h, 01bh, 096h, 00ah, 01bh, 047h, 020h, 091h, 020h
        db      01bh, 036h, 020h, 098h, 020h, 01bh, 018h, 020h, 01bh, 0fbh, 020h, 0d8h, 020h, 08eh, 00ah, 094h
        db      020h, 01bh, 002h, 020h, 028h, 01bh
        db      "$ 7). Set "
        db      0dch, 00ah, 084h, 020h, 031h, 032h, 037h, 020h, 0a4h, 020h, 0ffh, 020h, 094h, 020h, 01bh, 0a5h
        db      ". Set "
        db      084h, 00ah, 030h, 020h, 0a4h, 020h, 01bh, 097h, 020h, 01bh, 096h, 02eh, 00ah, 000h
        endif
        db      "RECEIVE: "
        if      FW_VERSION >= 312
        db      0d7h, 020h, 086h, 020h, 090h, 020h, 0b0h, 00ah, 085h, 020h, 0a2h, 020h, 081h, 020h, 0dbh, 020h
        db      090h, 020h, 083h, 02eh, 00ah
        elseif  FW_VERSION = 311
        db      0e3h, 020h, 086h, 020h, 090h, 020h, 0b2h, 00ah, 085h, 020h, 0a2h, 020h, 081h, 020h, 0deh, 020h
        db      090h, 020h, 083h, 02eh, 00ah
        else
        db      0d8h, 020h, 08eh, 020h, 08ch, 020h, 0aeh, 00ah, 085h, 020h, 09bh, 020h, 081h, 020h, 0e8h, 020h
        db      08ch, 020h, 083h, 02eh, 00ah
        endif
        db      "IGNORE: they "
        if      FW_VERSION >= 312
        db      085h, 020h, 096h, 020h, 01bh, 042h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      085h, 020h, 097h, 020h, 01bh, 05ch, 02eh, 00ah, 000h
        else
        db      085h, 020h, 098h, 020h, 01bh, 03dh, 02eh, 00ah, 000h
        endif
        db      "Removes "
        if      FW_VERSION >= 312
        db      08dh, 020h, 0d7h, 020h, 086h, 020h, 0b3h, 00ah
        elseif  FW_VERSION = 311
        db      08ch, 020h, 0e3h, 020h, 086h, 020h, 0bah, 00ah
        else
        db      08ah, 020h, 0d8h, 020h, 08eh, 020h, 0b7h, 00ah
        endif
        db      "types. "
        db      01bh
        if      FW_VERSION >= 312
        db      "C remove an "
        db      0b3h, 020h, 0c7h, 02ch, 020h, 09bh, 00ah, 0f1h, 020h, 0aeh, 020h, 022h
        elseif  FW_VERSION = 311
        db      "K remove "
        db      01bh, 0ach, 020h, 0bah, 020h, 0ceh, 02ch, 020h, 093h, 00ah, 0f5h, 020h, 0ach, 020h, 022h
        else
        db      "< remove "
        db      01bh, 0c5h, 020h, 0b7h, 020h, 0c3h, 02ch, 020h, 092h, 00ah, 0dch, 020h, 0b0h, 020h, 022h
        endif
        db      "Event"
        if      FW_VERSION >= 312
        db      022h, 020h, 09dh, 02ch, 020h, 097h, 020h, 09bh
        elseif  FW_VERSION = 311
        db      022h, 020h, 0a0h, 02ch, 020h, 09ch, 020h, 093h
        else
        db      022h, 020h, 0a0h, 02ch, 020h, 09ah, 020h, 092h
        endif
        db      " NO "
        if      FW_VERSION >= 312
        db      0aeh, 00ah, 022h
        elseif  FW_VERSION = 311
        db      0ach, 00ah, 022h
        else
        db      0b0h, 00ah, 022h
        endif
        db      "Pass "
        if      FW_VERSION >= 312
        db      0b3h, 022h, 020h, 09dh, 02eh, 00ah, 01bh
        db      "C allow "
        db      0f1h, 020h, 084h
        elseif  FW_VERSION = 311
        db      0bah, 022h, 020h, 0a0h, 02eh, 00ah, 01bh
        db      "K allow "
        db      0f5h, 020h, 084h
        else
        db      0b7h, 022h, 020h, 0a0h, 02eh, 00ah, 01bh
        db      "< allow "
        db      0dch, 020h, 084h
        endif
        db      " pass, "
        if      FW_VERSION >= 312
        db      09bh, 020h, 01bh, 0b6h, 02eh, 00ah, 000h, 01bh, 060h, 020h, 022h
        elseif  FW_VERSION = 311
        db      093h, 020h, 01bh, 0dch, 02eh, 00ah, 000h, 01bh, 078h, 020h, 022h
        else
        db      092h
        db      " YES."
        db      00ah, 000h, 01bh, 0c1h, 020h, 022h
        endif
        db      "Pass "
        if      FW_VERSION >= 312
        db      0b3h, 022h, 020h, 09dh, 020h, 099h, 020h, 0feh, 020h, 084h, 020h, 01bh, 0b6h, 020h, 0a4h, 00ah
        elseif  FW_VERSION = 311
        db      0bah, 022h, 020h, 0a0h, 020h, 096h, 020h, 01bh, 00fh, 020h, 084h, 020h, 01bh, 0dch, 020h, 0a5h
        db      00ah
        else
        db      0b7h, 022h, 020h, 0a0h, 020h, 0a6h, 020h, 01bh, 018h, 020h, 084h
        db      " YES "
        db      0a4h, 00ah
        endif
        db      "a given "
        if      FW_VERSION >= 312
        db      0b3h, 020h, 0c7h, 02ch, 020h, 087h, 020h, 09dh, 00ah, 01bh, 0e2h
        db      " how much "
        db      081h, 020h, 0a0h, 020h, 01bh, 052h, 00ah, 0a2h, 020h, 0c0h, 020h, 01bh, 087h
        elseif  FW_VERSION = 311
        db      0bah, 020h, 0ceh, 02ch, 020h, 088h, 020h, 0a0h, 00ah
        db      "specifies how much "
        db      081h, 020h, 0a4h, 020h, 01bh, 06fh, 00ah, 0a2h, 020h, 0b7h, 020h, 01bh, 0c5h
        else
        db      0b7h, 020h, 0c3h, 02ch, 020h, 086h, 020h, 0a0h, 00ah, 01bh, 0d4h
        db      " how much "
        db      081h, 020h, 0a1h, 020h, 01bh, 05eh, 00ah, 09bh, 020h, 0b4h, 020h, 01bh, 0a9h
        endif
        db      " last "
        if      FW_VERSION >= 312
        db      0ceh, 020h, 0a0h, 00ah, 0c8h, 020h, 0f1h, 020h, 099h
        elseif  FW_VERSION = 311
        db      0d6h, 020h, 0a4h, 00ah, 0d2h, 020h, 0f5h, 020h, 096h
        else
        db      0ceh, 020h, 0a1h, 00ah, 0c6h, 020h, 0dch, 020h, 0a6h
        endif
        db      " allowed "
        db      084h
        db      " pass. "
        if      FW_VERSION >= 312
        db      08ch, 00ah
        db      "thins out "
        db      0d7h, 020h, 01bh, 01bh, 020h, 0a5h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      08dh, 00ah
        db      "thins "
        db      01bh, 0fdh, 020h, 0e3h, 020h, 01bh, 02eh, 020h, 0a3h, 02eh, 00ah, 000h
        else
        db      08dh, 00ah
        db      "thins "
        db      01bh, 0d6h, 020h, 0d8h, 020h, 01bh, 024h, 020h, 0a5h, 02eh, 00ah, 000h
        endif
        db      "(Controls "
        if      FW_VERSION >= 312
        db      01bh, 07eh, 020h, 0adh, 020h, 01bh, 031h, 020h, 0d7h, 020h, 086h, 00ah, 092h, 020h, 0a5h, 020h
        db      085h, 020h, 096h, 020h, 01bh, 010h, 02eh, 029h, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 07ah, 020h, 0aah, 020h, 01bh, 01eh, 020h, 0e3h, 020h, 086h, 00ah, 098h, 020h, 0a3h, 020h
        db      085h, 020h, 097h, 020h, 0fah, 02eh, 029h, 00ah
        else
        db      01bh, 0b1h, 020h, 0abh, 020h, 01bh, 039h, 020h, 0d8h, 020h, 08eh, 00ah, 096h, 020h, 0a5h, 020h
        db      085h, 020h, 098h, 020h, 0fbh, 02eh, 029h, 00ah
        endif
        db      "NORMAL: "
        if      FW_VERSION >= 312
        db      092h, 020h, 099h, 020h, 01bh, 010h, 02eh, 00ah
        elseif  FW_VERSION = 311
        db      098h, 020h, 096h, 020h, 0fah, 02eh, 00ah
        else
        db      096h, 020h, 0a6h, 020h, 0fbh, 02eh, 00ah
        endif
        db      "FIXED: "
        if      FW_VERSION >= 312
        db      0a0h, 020h, 0aeh, 020h, 081h, 020h, 022h
        elseif  FW_VERSION = 311
        db      0a4h, 020h, 0ach, 020h, 081h, 020h, 022h
        else
        db      0a1h, 020h, 0b0h, 020h, 081h, 020h, 022h
        endif
        db      "Fixed veloc"
        if      FW_VERSION >= 312
        db      022h, 020h, 09dh, 00ah, 099h
        elseif  FW_VERSION = 311
        db      022h, 020h, 0a0h, 00ah, 096h
        else
        db      022h, 020h, 0a0h, 00ah, 0a6h
        endif
        db      " substituted."
        if      FW_VERSION >= 312
        db      00ah, 000h, 01bh
        db      "` Velocity "
        elseif  FW_VERSION = 311
        db      00ah, 000h, 01bh
        db      "x Velocity "
        else
        db      00ah, 000h, 01bh, 0c1h
        db      " Velocity "
        endif
        db      01bh
        if      FW_VERSION >= 312
        db      "Q = FIXED, "
        db      087h, 020h, 0a0h, 00ah
        elseif  FW_VERSION = 311
        db      "P = FIXED, "
        db      088h, 020h, 0a4h, 00ah
        else
        db      "? = FIXED, "
        db      086h, 020h, 0a1h, 00ah
        endif
        db      "replaces "
        if      FW_VERSION >= 312
        db      0d7h, 020h, 086h, 020h, 092h, 020h, 01bh, 0f0h, 02eh, 00ah, 000h, 089h, 020h, 09ah, 020h, 09eh
        db      020h, 081h, 020h, 0efh, 020h, 01bh, 0deh, 00ah, 028h, 030h, 02dh, 031h, 030h, 030h, 029h, 02eh
        elseif  FW_VERSION = 311
        db      0e3h, 020h, 086h, 020h, 098h
        db      " values."
        db      00ah, 000h, 08bh, 020h, 095h, 020h, 09eh, 020h, 081h, 020h, 0e0h, 020h, 01bh, 09dh, 00ah, 028h
        db      030h, 02dh, 031h, 030h, 030h, 029h, 02eh, 00ah, 000h
        db      "Determines "
        db      01bh, 053h, 020h, 01bh, 09dh, 020h, 096h, 020h, 0eah, 020h, 0aah, 020h, 01bh, 0f2h, 00ah
        db      "during "
        db      0b0h, 02eh, 020h, 028h, 01bh, 0bfh, 020h, 096h
        db      " always "
        db      0eah
        db      " during"
        db      00ah, 01bh, 039h, 03bh, 020h, 01bh, 00fh, 020h, 01bh, 09dh, 020h, 095h, 020h, 084h, 020h, 030h
        db      020h, 01bh, 053h, 00ah, 0ebh
        db      " never "
        db      01bh, 01bh, 020h, 081h
        db      " click.)"
        db      00ah, 000h, 01bh, 0f7h
        db      " click "
        db      01bh, 02bh, 020h, 097h, 020h, 01bh, 058h, 020h, 084h, 020h, 081h, 00ah
        db      "STEREO mix "
        db      0aah
        db      " INDIVidual "
        db      01bh, 04dh, 020h, 031h, 02dh, 038h, 02eh, 00ah, 000h
        db      "REC+PLAY: "
        db      01bh, 0f1h, 02dh, 0ach, 020h, 085h
        db      " occur "
        db      0d2h, 00ah
        db      "both "
        db      01bh, 039h, 020h, 08eh, 020h, 0b0h, 02eh, 00ah
        db      "REC "
        db      01bh, 0b2h, 03ah, 020h, 01bh, 0f1h, 02dh, 0ach, 020h, 085h, 020h, 0ffh
        db      " occur"
        db      00ah, 0d2h, 020h, 01bh, 039h, 02eh, 00ah, 000h, 01bh, 0f7h, 027h, 073h, 020h, 09bh, 020h, 0a4h
        db      02ch, 020h, 0b7h, 020h, 031h, 02fh, 034h, 02dh, 09bh, 00ah, 084h
        db      " 1/32 triplet."
        else
        db      0d8h, 020h, 08eh, 020h, 096h
        db      " values."
        db      00ah, 000h, 089h, 020h, 094h, 020h, 09dh, 020h, 081h, 020h, 0d7h, 020h, 01bh, 078h, 00ah, 028h
        db      030h, 02dh, 031h, 030h, 030h, 029h, 02eh, 00ah, 000h
        db      "Determines "
        db      01bh, 059h, 020h, 01bh, 078h, 020h, 0a6h, 020h, 0efh, 020h, 0abh, 020h, 01bh, 0e0h, 00ah
        db      "during "
        db      0afh
        db      ". (It "
        db      0a6h
        db      " always "
        db      0efh
        db      " during"
        db      00ah, 01bh, 027h, 03bh, 020h, 01bh, 018h, 020h, 01bh, 078h, 020h, 094h, 020h, 084h, 020h, 030h
        db      020h, 01bh, 059h, 00ah, 0f8h
        db      " never "
        db      01bh, 01dh, 020h, 081h
        db      " click.)"
        db      00ah, 000h, 01bh, 0d9h
        db      " click "
        db      01bh, 036h, 020h, 098h, 020h, 01bh, 089h, 020h, 084h, 020h, 081h, 00ah
        db      "STEREO mix "
        db      0abh
        db      " INDIVidual "
        db      01bh, 047h, 020h, 031h, 02dh, 038h, 02eh, 00ah, 000h
        db      "REC+PLAY: "
        db      01bh, 0d8h, 02dh, 0b0h, 020h, 085h
        db      " occur "
        db      0c6h, 00ah
        db      "both "
        db      01bh, 027h, 020h, 091h, 020h, 0afh, 02eh, 00ah
        db      "REC "
        db      01bh, 0feh, 03ah, 020h, 01bh, 0d8h, 02dh, 0b0h, 020h, 085h, 020h, 01bh
        db      "E occur"
        db      00ah, 0c6h, 020h, 01bh, 027h, 02eh, 00ah, 000h, 01bh, 0d9h, 027h, 073h, 020h, 097h, 020h, 0a1h
        db      02ch, 020h, 0b4h, 020h, 031h, 02fh, 034h, 02dh, 097h, 00ah, 084h
        db      " 1/32 triplet."
        endif
        db      00ah, 000h
        if      FW_VERSION >= 312
        db      "Determines "
        db      01bh, 046h, 020h, 01bh, 0deh, 020h, 099h, 020h, 0e9h, 020h, 0adh, 020h, 01bh, 0d2h, 00ah
        db      "during "
        db      0ach, 02eh, 00ah, 000h, 01bh, 0d3h
        db      " click "
        db      01bh, 074h, 020h, 096h, 020h, 01bh, 038h, 020h, 084h, 020h, 081h, 00ah
        db      "STEREO mix "
        db      0adh
        db      " INDIVidual "
        db      01bh, 039h, 020h, 031h, 02dh, 038h, 02eh, 00ah, 000h
        db      "REC+PLAY: count-"
        db      0aeh, 020h, 085h
        db      " occur "
        db      0c8h, 00ah
        db      "both "
        db      01bh, 044h, 020h, 091h, 020h, 0ach, 02eh, 00ah
        db      "REC "
        db      01bh, 0fdh
        db      ": count-"
        db      0aeh, 020h, 085h, 020h, 0fch
        db      " occur"
        db      00ah, 0c8h, 020h, 01bh, 044h, 02eh, 00ah, 000h, 01bh, 0d3h, 027h, 073h, 020h, 098h, 020h, 0a0h
        db      02ch, 020h, 0c0h, 020h, 031h, 02fh, 034h, 02dh, 098h, 00ah, 084h
        db      " 1/32 triplet."
        db      00ah, 000h, 01bh, 0f7h, 020h, 01bh, 02fh, 020h, 09eh, 020h, 081h
        db      " two footswitches."
        db      00ah, 000h, 0d8h, 020h, 0e2h, 020h, 01bh, 0bdh
        elseif  FW_VERSION = 311
        db      "Sets "
        db      01bh, 048h, 020h, 09eh, 020h, 081h, 020h, 01bh, 0fah
        db      " footswitches."
        db      00ah, 000h, 0dah, 020h, 0cfh, 020h, 01bh, 0e3h
        else
        db      "Sets "
        db      01bh, 038h, 020h, 09dh, 020h, 081h
        db      " two footswitches."
        db      00ah, 000h, 0f4h, 020h, 0d6h, 020h, 01bh, 0b8h
        endif
        db      " minor "
        if      FW_VERSION >= 312
        db      0fah, 020h, 0edh, 020h, 0e2h, 00ah, 01bh, 04ah, 020h, 0b6h, 020h, 01bh, 0ach, 020h, 099h, 020h
        db      01bh, 0e8h, 020h, 01bh, 0d2h, 020h, 091h, 00ah, 028h, 0e9h, 020h, 095h, 029h, 020h, 0aeh
        elseif  FW_VERSION = 311
        db      0f8h, 020h, 0ech, 020h, 0cfh, 00ah, 0fdh, 020h, 0c1h, 020h, 01bh, 05fh, 020h, 096h
        db      " turned "
        db      01bh, 0f2h, 020h, 08eh, 00ah, 028h, 0eah, 020h, 094h, 029h, 020h, 0ach
        else
        db      0eeh, 020h, 0dfh, 020h, 0d6h, 00ah, 01bh, 09ch, 020h, 0bah, 020h, 01bh, 0d7h, 020h, 0a6h, 020h
        db      01bh, 0ebh, 020h, 01bh, 0e0h, 020h, 091h, 00ah, 028h, 0efh, 020h, 095h, 029h, 020h, 0b0h
        endif
        db      " PAR "
        if      FW_VERSION >= 312
        db      01bh, 0e5h, 02eh, 020h, 01bh, 043h, 020h, 01bh, 0cbh, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 092h, 02eh, 020h, 01bh, 04bh, 020h, 01bh, 0edh, 00ah
        else
        db      01bh, 07fh, 02eh, 020h, 01bh, 03ch, 020h, 01bh, 0bah, 00ah
        endif
        db      "these "
        if      FW_VERSION >= 312
        db      0fah, 02ch, 020h, 09bh
        elseif  FW_VERSION = 311
        db      0f8h, 02ch, 020h, 093h
        else
        db      0eeh, 02ch, 020h, 092h
        endif
        db      " category "
        if      FW_VERSION >= 312
        db      0bbh, 02ch, 00ah, 097h, 020h, 08bh, 020h, 03ch, 01bh, 084h, 020h, 0f1h, 03eh, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      0b4h, 02ch, 00ah, 09ch, 020h, 089h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 02eh, 00ah, 000h
        else
        db      0b1h, 02ch, 00ah, 09ah, 020h, 088h, 020h, 03ch, 01bh, 085h, 020h, 0dch, 03eh, 02eh, 00ah, 000h
        endif
        db      01bh
        if      FW_VERSION >= 312
        db      "W simultaneous "
        db      0efh, 020h, 0e9h, 020h, 031h, 036h, 00ah, 086h
        db      " channels "
        db      01bh, 09fh, 020h, 0efh
        elseif  FW_VERSION = 311
        db      "r simultaneous "
        db      0e0h, 020h, 0eah, 020h, 031h, 036h, 00ah, 086h, 020h, 01bh, 0a8h, 020h, 01bh, 0d0h, 020h, 0e0h
        else
        db      "a simultaneous "
        db      0d7h, 020h, 0efh, 020h, 031h, 036h, 00ah, 08eh
        db      " channels "
        db      01bh, 0fbh, 020h, 0d7h
        endif
        db      " onto "
        if      FW_VERSION >= 312
        db      0c1h, 00ah, 031h, 02dh, 031h, 036h, 020h, 091h
        db      " assigning them "
        db      084h
        db      " channels"
        db      00ah, 031h, 02dh, 031h, 036h, 02eh, 020h, 08eh, 020h, 0bbh, 020h, 081h, 020h, 082h, 020h, 084h
        db      020h, 096h, 00ah, 0ceh, 020h, 0d1h
        elseif  FW_VERSION = 311
        db      0bfh, 00ah, 031h, 02dh, 031h, 036h, 020h, 08eh
        db      " assigning "
        db      01bh, 0e9h, 020h, 084h, 020h, 01bh, 0a8h, 00ah, 031h, 02dh, 031h, 036h, 02eh, 020h, 08fh, 020h
        db      0b4h, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 097h, 00ah, 0d6h, 020h, 0d9h
        else
        db      0e9h, 00ah, 031h, 02dh, 031h, 036h, 020h, 091h
        db      " assigning "
        db      01bh, 0b9h, 020h, 084h
        db      " channels"
        db      00ah, 031h, 02dh, 031h, 036h, 02eh, 020h, 08fh, 020h, 0b1h, 020h, 081h, 020h, 082h, 020h, 084h
        db      020h, 098h, 00ah, 0ceh, 020h, 0e0h
        endif
        db      ". THIS "
        db      01bh
        if      FW_VERSION >= 312
        db      "H WILL BE"
        elseif  FW_VERSION = 311
        db      "h WILL BE"
        else
        db      "P WILL BE"
        endif
        db      00ah
        db      "ERASED WHEN <Proceed> IS PRESSED!"
        if      FW_VERSION >= 312
        db      00ah, 000h, 089h, 020h, 0a9h, 020h, 0a1h, 020h, 09eh, 020h, 081h, 020h, 082h, 00ah, 08dh, 020h
        db      084h, 020h, 081h, 020h, 01bh, 014h, 02eh, 00ah, 01bh, 043h, 020h, 0c3h, 03ah, 020h, 08bh, 020h
        db      02bh, 02fh, 02dh, 02ch, 020h, 0c7h, 020h, 0c5h, 020h, 0a1h, 02ch, 00ah, 097h, 020h, 0d0h, 02eh
        db      00ah, 000h, 0a3h, 020h, 081h, 020h, 0afh, 020h, 0cbh, 020h, 0a4h, 020h, 081h, 020h, 0c5h, 00ah
        db      082h, 020h, 0bbh, 02eh, 00ah, 000h, 0a3h, 020h, 086h, 020h, 094h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08bh, 020h, 0adh, 020h, 0abh, 020h, 09eh, 020h, 081h, 020h, 082h, 00ah, 08ch, 020h
        db      084h, 020h, 081h, 020h, 01bh, 034h, 02eh, 00ah, 01bh, 04bh, 020h, 0c7h, 03ah, 020h, 089h, 020h
        db      02bh, 02fh, 02dh, 02ch, 020h, 0ceh, 020h, 0d0h, 020h, 0abh, 02ch, 00ah, 09ch, 020h, 0ddh, 02eh
        db      00ah, 000h, 0a6h, 020h, 081h, 020h, 0afh, 020h, 0c5h, 020h, 0a5h, 020h, 081h, 020h, 0d0h, 00ah
        db      082h, 020h, 0b4h, 02eh, 00ah, 000h, 0a6h, 020h, 086h, 020h, 09ah
        else
        db      00ah, 000h, 089h, 020h, 0aah, 020h, 0adh, 020h, 09dh, 020h, 081h, 020h, 082h, 00ah, 08ah, 020h
        db      084h, 020h, 081h, 020h, 01bh, 031h, 02eh, 00ah, 01bh, 03ch, 020h, 0beh, 03ah, 020h, 088h, 020h
        db      02bh, 02fh, 02dh, 02ch, 020h, 0c3h, 020h, 0c4h, 020h, 0adh, 02ch, 00ah, 09ah, 020h, 0d4h, 02eh
        db      00ah, 000h, 0a2h, 020h, 081h, 020h, 0ach, 020h, 0bch, 020h, 0a4h, 020h, 081h, 020h, 0c4h, 00ah
        db      082h, 020h, 0b1h, 02eh, 00ah, 000h, 0a2h, 020h, 08eh, 020h, 0a9h
        endif
        db      " over "
        if      FW_VERSION >= 312
        db      0b1h, 020h, 01bh, 03ah, 020h, 0a5h, 00ah, 085h, 020h, 096h, 020h, 01bh, 04eh, 020h, 028h, 031h
        db      02dh, 031h, 036h, 020h, 0adh
        elseif  FW_VERSION = 311
        db      0b3h, 020h, 01bh, 057h, 020h, 0a3h, 00ah, 085h, 020h, 097h, 020h, 01bh, 05dh, 020h, 028h, 031h
        db      02dh, 031h, 036h, 020h, 0aah
        else
        db      0b3h, 020h, 01bh, 05ch, 020h, 0a5h, 00ah, 085h, 020h, 098h, 020h, 01bh, 086h, 020h, 028h, 031h
        db      02dh, 031h, 036h, 020h, 0abh
        endif
        db      " NONE)."
        if      FW_VERSION >= 312
        db      00ah, 089h, 020h, 088h, 020h, 0d3h, 020h, 087h, 020h, 083h, 020h, 085h, 020h, 097h, 00ah, 096h
        elseif  FW_VERSION = 311
        db      00ah, 08bh, 020h, 087h, 020h, 0d8h, 020h, 088h, 020h, 083h, 020h, 085h, 020h, 09ch, 00ah, 097h
        else
        db      00ah, 089h, 020h, 087h, 020h, 0e1h, 020h, 086h, 020h, 083h, 020h, 085h, 020h, 09ah, 00ah, 098h
        endif
        db      " made a "
        if      FW_VERSION >= 312
        db      01bh, 050h, 020h, 088h, 020h, 01bh, 017h, 02eh, 00ah, 000h, 01bh, 057h, 020h, 01bh, 044h, 020h
        db      01bh, 051h, 020h, 084h, 020h, 096h, 020h, 0eeh, 020h, 091h, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 04eh, 020h, 087h, 020h, 01bh, 02dh, 02eh, 00ah, 000h, 01bh, 072h, 020h, 01bh, 039h, 020h
        db      01bh, 050h, 020h, 084h, 020h, 097h, 020h, 01bh, 018h, 020h, 08eh, 00ah
        else
        db      01bh, 049h, 020h, 087h, 020h, 01bh, 020h, 02eh, 00ah, 000h, 01bh, 061h, 020h, 01bh, 027h, 020h
        db      01bh, 03fh, 020h, 084h, 020h, 098h, 020h, 01bh, 01fh, 020h, 091h, 00ah
        endif
        db      "exited "
        if      FW_VERSION >= 312
        db      01bh, 017h, 020h, 01bh
        db      "V preset "
        db      01bh, 06eh, 02eh, 00ah, 0a3h, 020h, 01bh, 0c8h, 020h, 091h
        elseif  FW_VERSION = 311
        db      01bh, 02dh, 020h, 01bh
        db      "L preset "
        db      01bh, 08ah, 02eh, 00ah, 0a6h, 020h, 01bh, 0e6h, 020h, 08eh
        else
        db      01bh, 020h, 020h, 01bh
        db      "4 preset "
        db      01bh, 0dah, 02eh, 00ah, 0a2h, 020h, 01bh, 0b4h, 020h, 091h
        endif
        db      " In/Out "
        if      FW_VERSION >= 312
        db      01bh, 06eh, 02ch, 020h, 097h, 020h, 0d5h, 00ah, 0efh
        elseif  FW_VERSION = 311
        db      01bh, 08ah, 02ch, 020h, 09ch, 020h, 0d7h, 00ah, 0e0h
        else
        db      01bh, 0dah, 02ch, 020h, 09ah, 020h, 0d3h, 00ah, 0d7h
        endif
        db      " as "
        if      FW_VERSION >= 311
        db      01bh, 00ah
        else
        db      0ffh
        endif
        db      ". REC light "
        db      085h, 00ah
        db      "flash until punch-"
        if      FW_VERSION >= 312
        db      0aeh, 020h, 0afh, 020h, 099h
        elseif  FW_VERSION = 311
        db      0ach, 020h, 0afh, 020h, 096h
        else
        db      0b0h, 020h, 0ach, 020h, 0a6h
        endif
        db      " reached."
        if      FW_VERSION >= 312
        db      00ah, 03ch, 01bh, 09dh
        db      " 'Last'> repeats "
        elseif  FW_VERSION = 311
        db      00ah, 03ch, 01bh
        db      "p 'Last'> repeats "
        else
        db      00ah, 03ch, 01bh
        db      "_ 'Last'> repeats "
        endif
        db      081h
        db      " last manual"
        db      00ah
        db      "punch."
        if      FW_VERSION >= 312
        db      00ah, 000h, 08eh, 020h, 081h, 020h, 088h, 020h, 084h, 020h, 096h, 020h, 01bh, 055h, 02eh, 00ah
        db      08eh, 020h, 022h, 030h, 022h, 020h, 084h, 020h, 01bh, 0d8h, 020h, 0bah, 020h, 0c1h, 020h, 028h
        db      091h, 00ah, 084h, 020h, 01bh, 0d0h, 020h, 084h, 020h, 022h, 030h, 022h, 020h, 0b6h, 020h, 087h
        db      020h, 0beh, 020h, 099h, 00ah, 072h, 065h, 02dh, 0eeh
        db      ".) Drum "
        db      0c1h, 020h, 0e2h, 020h, 01bh, 031h, 00ah, 01bh, 055h, 02eh, 00ah, 000h, 089h, 020h, 083h, 020h
        db      09eh
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08dh, 020h, 087h, 020h, 085h, 020h, 097h, 020h, 01bh, 069h, 02eh, 00ah, 08fh, 020h
        db      022h, 030h, 022h, 020h, 084h, 020h, 01bh, 0efh, 020h, 0b9h, 020h, 0bfh, 00ah
        db      "(except "
        db      01bh, 04eh, 020h, 0bfh, 029h, 02eh, 00ah, 000h, 08bh, 020h, 083h, 020h, 09eh
        else
        db      00ah, 000h, 08dh, 020h, 087h, 020h, 085h, 020h, 098h, 020h, 01bh, 057h, 02eh, 00ah, 08fh, 020h
        db      022h, 030h, 022h, 020h, 084h, 020h, 01bh, 0dfh, 020h, 0b9h, 020h, 0e9h, 00ah
        db      "(except "
        db      01bh, 049h, 020h, 0e9h, 029h, 02eh, 00ah, 000h, 089h, 020h, 083h, 020h, 09dh
        endif
        db      " semitones "
        if      FW_VERSION >= 312
        db      081h, 020h, 088h, 028h, 073h, 029h, 00ah, 085h, 020h, 096h, 020h, 01bh, 055h, 02eh, 020h, 01bh
        db      0c4h
        db      " may "
        db      01bh, 06bh, 020h, 081h, 00ah, 081h, 020h, 086h, 020h, 0c4h, 020h, 084h, 020h, 0feh, 020h, 01bh
        db      059h, 00ah
        db      "(middle C = 0)."
        db      00ah, 000h, 01bh, 043h, 020h, 01bh, 0d8h, 020h, 061h, 020h, 01bh, 022h, 020h, 01bh, 0cfh, 00ah
        db      01bh, 0b1h, 02ch, 020h, 0feh, 020h, 022h
        elseif  FW_VERSION = 311
        db      081h, 020h, 087h, 028h, 073h, 029h, 00ah, 085h, 020h, 097h, 020h, 01bh, 069h, 02eh, 020h, 01bh
        db      04bh, 020h, 0a2h, 02ch, 020h, 01bh, 086h, 00ah, 01bh, 059h, 020h, 01bh, 028h, 020h, 0aah, 020h
        db      089h, 020h, 061h, 020h, 01bh, 0a3h, 020h, 0eah, 020h, 061h, 020h, 086h, 00ah, 0c8h, 02eh, 020h
        db      08bh, 020h, 087h, 028h, 073h, 029h, 020h, 085h, 020h, 097h, 00ah, 01bh
        db      "i up "
        db      0aah
        db      " down "
        db      01bh, 0d0h, 020h, 01bh, 0ach, 020h, 0f6h, 00ah, 01bh, 0eeh, 020h, 084h, 020h, 0ech, 020h, 01bh
        db      0a3h, 027h, 073h, 020h, 01bh, 0a5h, 020h, 0b7h, 00ah
        db      "Middle C."
        db      00ah, 000h, 01bh, 04bh, 020h, 01bh, 0efh, 020h, 061h, 020h, 01bh, 03dh, 020h, 01bh, 0e5h, 00ah
        db      01bh, 0c6h, 02ch, 020h, 01bh, 00fh, 020h, 022h
        else
        db      081h, 020h, 087h, 028h, 073h, 029h, 00ah, 085h, 020h, 098h, 020h, 01bh, 057h, 02eh, 020h, 01bh
        db      03ch, 020h, 09bh, 02ch, 020h, 01bh, 081h, 00ah, 01bh, 042h, 020h, 01bh, 01ch, 020h, 0abh, 020h
        db      088h, 020h, 061h, 020h, 01bh, 082h, 020h, 0efh, 020h, 061h, 020h, 08eh, 00ah, 0c0h, 02eh, 020h
        db      089h, 020h, 087h, 028h, 073h, 029h, 020h, 085h, 020h, 098h, 00ah, 01bh
        db      "W up "
        db      0abh
        db      " down "
        db      01bh, 0fbh, 020h, 01bh, 0c5h, 020h, 0eah, 00ah, 01bh, 0ceh, 020h, 084h, 020h, 0dfh, 020h, 01bh
        db      082h, 027h, 073h, 020h, 01bh, 092h, 020h, 0b4h, 00ah
        db      "Middle C."
        db      00ah, 000h, 01bh, 03ch, 020h, 01bh, 0dfh, 020h, 061h, 020h, 01bh, 028h, 020h, 01bh, 0b3h, 00ah
        db      01bh, 0a2h, 02ch, 020h, 01bh, 018h, 020h, 022h
        endif
        db      "From"
        if      FW_VERSION >= 312
        db      022h, 020h, 091h, 020h, 022h, 01bh, 043h, 022h, 00ah, 01bh, 082h, 020h, 028h, 01bh, 024h, 02eh
        db      0e3h, 02eh, 0e4h, 029h, 02ch, 020h, 097h, 020h, 08bh, 00ah
        elseif  FW_VERSION = 311
        db      022h, 020h, 08eh, 020h, 022h, 01bh, 04bh, 022h, 00ah, 01bh, 07fh, 020h, 028h, 01bh, 03fh, 02eh
        db      0f0h, 02eh, 0f1h, 029h, 02ch, 020h, 09ch, 020h, 089h, 00ah
        else
        db      022h, 020h, 091h, 020h, 022h, 01bh, 03ch, 022h, 00ah, 01bh, 076h, 020h, 028h, 01bh, 02eh, 02eh
        db      0e7h, 02eh, 0e5h, 029h, 02ch, 020h, 09ah, 020h, 088h, 00ah
        endif
        db      "<Transpose permanent>."
        if      FW_VERSION >= 312
        db      00ah, 000h, 08ch, 020h, 01bh, 015h, 020h, 01bh, 0fbh
        db      " an "
        db      01bh, 04fh, 00ah, 082h, 020h, 084h, 020h, 0ach, 020h, 01bh, 00fh, 020h, 0d3h, 00ah, 081h, 020h
        db      0dbh, 020h, 082h, 020h, 0adh, 020h, 0bch
        db      ". Set"
        db      00ah, 022h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08dh, 020h, 0e9h, 020h, 01bh, 0bah, 020h, 01bh, 0ach, 020h, 01bh, 06ch, 00ah, 082h
        db      020h, 084h, 020h, 0b0h, 020h, 01bh, 029h, 020h, 0d8h, 00ah, 081h, 020h, 0deh, 020h, 082h, 020h
        db      0aah, 020h, 0bbh
        db      ". (Could "
        db      097h, 00ah, 0fah, 020h, 084h, 020h, 0a2h
        db      " drumbeats "
        db      01bh, 096h, 020h, 081h, 00ah, 0deh, 020h, 082h, 020h, 01bh
        db      "' synth parts.)"
        db      00ah
        db      "Set "
        db      022h
        else
        db      00ah, 000h, 08dh, 020h, 0e2h, 020h, 01bh, 094h, 020h, 01bh, 0c5h, 020h, 01bh, 05dh, 00ah, 082h
        db      020h, 084h, 020h, 0afh, 020h, 01bh, 019h, 020h, 0e1h, 00ah, 081h, 020h, 0e8h, 020h, 082h, 020h
        db      0abh, 020h, 0b5h
        db      ". (Could "
        db      098h, 00ah, 0fbh, 020h, 084h, 020h, 09bh
        db      " drumbeats "
        db      01bh, 073h, 020h, 081h, 00ah, 0e8h, 020h, 082h, 020h, 01bh, 015h
        db      " synth parts.)"
        db      00ah
        db      "Set "
        db      022h
        endif
        db      "On/Off"
        db      022h, 020h, 084h
        db      " ON "
        if      FW_VERSION >= 312
        db      091h, 020h, 0dfh, 020h, 061h, 020h, 082h, 00ah, 083h, 02eh, 00ah, 000h, 089h, 020h, 0a1h, 020h
        db      09eh, 020h, 081h, 020h, 08dh, 020h, 082h, 02eh, 00ah, 000h, 08eh, 020h, 082h, 020h, 084h, 020h
        db      096h, 020h, 01bh, 00bh, 02eh, 00ah, 000h, 08ch, 020h, 088h, 020h, 085h, 020h, 096h, 020h, 01bh
        db      00bh, 020h, 0b6h, 020h, 03ch, 01bh, 084h, 020h, 0f1h, 03eh, 00ah, 099h, 020h, 0b7h, 02eh, 020h
        db      0a3h, 020h, 022h, 030h, 022h, 020h, 084h, 020h, 01bh, 0e4h, 020h, 0bah, 00ah, 0c1h, 02eh, 00ah
        db      000h, 089h, 020h, 01bh, 024h, 02eh, 0e3h, 02eh, 0e4h, 020h, 093h, 020h, 09eh, 020h, 081h, 020h
        db      0d5h, 00ah, 09eh, 020h, 081h, 020h, 0d2h, 020h, 084h, 020h, 096h, 020h, 01bh, 00bh, 02eh, 00ah
        db      000h, 089h
        elseif  FW_VERSION = 311
        db      08eh, 020h, 0e2h, 020h, 081h, 00ah, 01bh, 01ah, 020h, 082h, 020h, 083h, 02eh, 00ah, 000h, 08bh
        db      020h, 0abh, 020h, 09eh, 020h, 081h, 020h, 08ch, 020h, 082h, 02eh, 00ah, 000h, 08fh, 020h, 082h
        db      020h, 084h, 020h, 097h, 020h, 01bh, 024h, 02eh, 00ah, 000h, 08dh, 020h, 087h, 020h, 085h, 020h
        db      097h, 020h, 01bh, 024h, 020h, 0c1h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 00ah, 096h, 020h
        db      0bch, 02eh, 020h, 0a6h, 020h, 022h, 030h, 022h, 020h, 084h, 020h, 01bh, 0b9h, 020h, 0b9h, 00ah
        db      0bfh, 02eh, 00ah, 000h, 08bh, 020h, 01bh, 03fh, 02eh, 0f0h, 02eh, 0f1h, 020h, 099h, 020h, 09eh
        db      020h, 081h, 020h, 0d7h, 00ah, 09eh, 020h, 081h, 020h, 0dch, 020h, 084h, 020h, 097h, 020h, 01bh
        db      024h, 02eh, 00ah, 000h, 08bh
        else
        db      091h, 020h, 0f7h, 020h, 081h, 00ah, 01bh, 004h, 020h, 082h, 020h, 083h, 02eh, 00ah, 000h, 089h
        db      020h, 0adh, 020h, 09dh, 020h, 081h, 020h, 08ah, 020h, 082h, 02eh, 00ah, 000h, 08fh, 020h, 082h
        db      020h, 084h, 020h, 098h, 020h, 01bh, 02dh, 02eh, 00ah, 000h, 08dh, 020h, 087h, 020h, 085h, 020h
        db      098h, 020h, 01bh, 02dh, 020h, 0bah, 020h, 03ch, 01bh, 085h, 020h, 0dch, 03eh, 00ah, 0a6h, 020h
        db      0bdh, 02eh, 020h, 0a2h, 020h, 022h, 030h, 022h, 020h, 084h, 020h, 01bh, 09ah, 020h, 0b9h, 00ah
        db      0e9h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 02eh, 02eh, 0e7h, 02eh, 0e5h, 020h, 099h, 020h, 09dh
        db      020h, 081h, 020h, 0d3h, 00ah, 09dh, 020h, 081h, 020h, 0d2h, 020h, 084h, 020h, 098h, 020h, 01bh
        db      02dh, 02eh, 00ah, 000h, 089h
        endif
        db      " END "
        if      FW_VERSION >= 312
        db      09eh, 020h, 081h, 020h, 0d2h, 020h, 084h, 020h, 096h, 020h, 01bh, 00bh, 02eh, 020h, 01bh, 0d5h
        db      00ah, 099h, 020h, 0cch, 020h, 01bh, 08eh, 020h, 01bh, 0b0h, 020h, 081h, 020h, 0d2h, 020h, 0f6h
        db      020h, 01bh, 041h, 00ah, 084h, 020h, 01bh, 0e4h, 02eh, 00ah, 000h, 01bh
        db      ". EVENTS "
        db      01bh, 0feh, 020h, 0bah, 020h, 0bfh, 02eh, 00ah, 01bh, 0fdh
        elseif  FW_VERSION = 311
        db      09eh, 020h, 081h, 020h, 0dch, 020h, 084h, 020h, 097h, 020h, 01bh, 024h, 02eh, 020h, 01bh, 0bfh
        db      00ah, 096h, 020h, 0d1h, 020h, 01bh, 0a7h, 020h, 01bh, 0b7h, 020h, 081h, 020h, 0dch, 020h, 0ebh
        db      020h, 01bh, 01bh, 00ah, 084h, 020h, 01bh, 0b9h, 02eh, 00ah, 000h, 01bh
        db      "@ EVENTS erases "
        db      0b9h, 020h, 0c0h, 02eh, 00ah, 01bh, 0b2h
        else
        db      09dh, 020h, 081h, 020h, 0d2h, 020h, 084h, 020h, 098h, 020h, 01bh
        db      "-. It"
        db      00ah, 0a6h, 020h, 0d5h, 020h, 01bh, 087h, 020h, 01bh, 0a3h, 020h, 081h, 020h, 0d2h, 020h, 0f8h
        db      020h, 01bh, 01dh, 00ah, 084h, 020h, 01bh, 09ah, 02eh, 00ah, 000h, 01bh
        db      "/ EVENTS "
        db      01bh, 0e7h, 020h, 0b9h, 020h, 0bfh, 02eh, 00ah, 01bh, 0feh
        endif
        db      " ERASE "
        if      FW_VERSION >= 312
        db      0fch, 020h, 01bh, 0feh, 020h, 081h, 020h, 0b3h, 00ah, 01bh, 02bh, 020h, 0aeh, 020h, 081h, 020h
        db      09dh, 020h, 084h, 020h, 081h, 020h, 01bh, 016h, 02eh, 00ah, 01bh, 02eh, 020h, 01bh, 09ch, 020h
        db      01bh, 0feh, 020h, 0bah, 020h, 0bfh
        elseif  FW_VERSION = 311
        db      0ffh
        db      " erases "
        db      081h, 020h, 0bah, 00ah, 0fch, 020h, 0ach, 020h, 081h, 020h, 0a0h, 020h, 084h, 020h, 081h, 020h
        db      0dbh, 02eh, 00ah, 01bh, 040h, 020h, 01bh, 0c2h
        db      " erases "
        db      0b9h, 020h, 0c0h
        else
        db      01bh, 045h, 020h, 01bh, 0e7h, 020h, 081h, 020h, 0b7h, 00ah, 0f3h, 020h, 0b0h, 020h, 081h, 020h
        db      0a0h, 020h, 084h, 020h, 081h, 020h, 0d1h, 02eh, 00ah, 01bh, 02fh, 020h, 01bh, 09fh, 020h, 01bh
        db      0e7h, 020h, 0b9h, 020h, 0bfh
        endif
        db      " except"
        if      FW_VERSION >= 312
        db      00ah, 0edh, 020h, 0b3h, 02eh, 00ah, 000h, 08ch, 020h, 09dh, 020h, 01bh, 053h, 020h, 0b1h, 020h
        db      0b3h, 020h, 0c7h, 00ah, 085h, 020h, 096h, 020h, 01bh, 00bh, 020h, 028h, 01bh, 046h, 020h, 01bh
        db      0fdh
        elseif  FW_VERSION = 311
        db      00ah, 0ech, 020h, 0bah, 02eh, 00ah, 000h, 08dh, 020h, 0a0h, 020h, 01bh, 06ah, 020h, 0b3h, 020h
        db      0bah, 020h, 0ceh, 00ah, 085h, 020h, 097h, 020h, 01bh, 024h, 020h, 028h, 01bh, 053h, 020h, 01bh
        db      0b2h
        else
        db      00ah, 0dfh, 020h, 0b7h, 02eh, 00ah, 000h, 08dh, 020h, 0a0h, 020h, 01bh, 056h, 020h, 0b3h, 020h
        db      0b7h, 020h, 0c3h, 00ah, 085h, 020h, 098h, 020h, 01bh, 02dh, 020h, 028h, 01bh, 059h, 020h, 01bh
        db      0feh
        endif
        db      " ERASE "
        if      FW_VERSION >= 312
        db      099h, 00ah, 08dh, 020h, 084h, 020h, 081h, 020h, 01bh, 014h, 029h, 020h, 0adh
        elseif  FW_VERSION = 311
        db      096h, 00ah, 08ch, 020h, 084h, 020h, 081h, 020h, 01bh, 034h, 029h, 020h, 0aah
        else
        db      0a6h, 00ah, 08ah, 020h, 084h, 020h, 081h, 020h, 01bh, 031h, 029h, 020h, 0abh
        endif
        db      " NOT "
        if      FW_VERSION >= 312
        db      01bh, 00bh, 00ah, 028h, 01bh, 046h, 020h, 01bh, 02eh, 020h, 01bh, 09ch, 020h, 099h, 020h, 08dh
        db      020h, 084h, 020h, 081h, 00ah, 01bh, 014h, 029h, 02eh, 00ah, 000h, 09fh
        db      " two "
        db      01bh, 026h, 020h, 0e9h, 020h, 061h, 020h, 086h, 020h, 0c4h, 020h, 0adh, 00ah, 01bh, 08dh, 020h
        db      081h, 020h, 01bh, 098h, 020h, 01bh, 03eh, 020h, 084h, 020h, 0dfh, 020h, 081h, 020h, 01bh, 032h
        db      00ah, 09eh, 020h, 0aah, 020h, 0f6h, 020h, 01bh, 041h, 020h, 084h, 020h, 01bh, 0e4h, 02eh, 00ah
        db      000h, 08eh, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 096h
        elseif  FW_VERSION = 311
        db      01bh, 024h, 00ah, 028h, 01bh, 053h, 020h, 01bh, 040h, 020h, 01bh, 0c2h, 020h, 096h, 020h, 08ch
        db      020h, 084h, 020h, 081h, 00ah, 01bh, 034h, 029h, 02eh, 00ah, 000h, 092h, 020h, 01bh, 0fah, 020h
        db      01bh, 042h, 020h, 0eah, 020h, 061h, 020h, 086h, 020h, 0c8h, 020h, 0aah, 00ah, 01bh, 086h, 020h
        db      081h, 020h, 01bh, 059h, 020h, 01bh, 028h, 020h, 084h, 020h, 0e2h, 020h, 081h, 020h, 01bh, 046h
        db      00ah, 09eh, 020h, 0aeh, 020h, 0ebh, 020h, 01bh, 01bh, 020h, 084h, 020h, 01bh, 0b9h, 02eh, 00ah
        db      000h, 08fh, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 097h
        else
        db      01bh, 02dh, 00ah, 028h, 01bh, 059h, 020h, 01bh, 02fh, 020h, 01bh, 09fh, 020h, 0a6h, 020h, 08ah
        db      020h, 084h, 020h, 081h, 00ah, 01bh, 031h, 029h, 02eh, 00ah, 000h, 090h
        db      " two "
        db      01bh, 032h, 020h, 0efh, 020h, 061h, 020h, 08eh, 020h, 0c0h, 020h, 0abh, 00ah, 01bh, 081h, 020h
        db      081h, 020h, 01bh, 042h, 020h, 01bh, 01ch, 020h, 084h, 020h, 0f7h, 020h, 081h, 020h, 01bh, 03bh
        db      00ah, 09dh, 020h, 0a8h, 020h, 0f8h, 020h, 01bh, 01dh, 020h, 084h, 020h, 01bh, 09ah, 02eh, 00ah
        db      000h, 08fh, 020h, 081h, 020h, 082h, 020h, 084h, 020h, 098h
        endif
        db      " initialized"
        if      FW_VERSION >= 312
        db      00ah, 084h, 020h, 081h, 020h, 01bh, 0f0h, 020h, 0e0h, 02eh, 00ah, 000h, 01bh, 043h, 020h, 0dfh
        db      020h, 01bh, 0a4h, 020h, 01bh, 00dh, 020h, 0fah, 00ah, 0a4h, 020h, 01bh, 027h, 020h, 088h, 02ch
        db      020h, 09bh, 020h, 081h, 020h, 088h, 020h, 0bbh, 00ah, 028h, 0adh, 020h, 01bh, 06bh, 020h, 01bh
        db      097h
        elseif  FW_VERSION = 311
        db      00ah, 084h, 020h, 081h
        db      " values "
        db      0edh, 02eh, 00ah, 000h, 01bh, 04bh, 020h, 0e2h, 020h, 01bh, 056h, 020h, 01bh, 02ah, 020h, 0f8h
        db      00ah, 0a5h, 020h, 01bh, 035h, 020h, 087h, 02ch, 020h, 093h, 020h, 081h, 020h, 087h, 020h, 0b4h
        db      00ah, 028h, 0aah, 020h, 01bh, 0c4h, 020h, 01bh, 0b3h
        else
        db      00ah, 084h, 020h, 081h
        db      " values "
        db      0e4h, 02eh, 00ah, 000h, 01bh, 03ch, 020h, 0f7h, 020h, 01bh, 03eh, 020h, 01bh, 01bh, 020h, 0eeh
        db      00ah, 0a4h, 020h, 01bh, 05ah, 020h, 087h, 02ch, 020h, 092h, 020h, 081h, 020h, 087h, 020h, 0b1h
        db      00ah, 028h, 0abh, 020h, 01bh, 0bfh, 020h, 01bh, 08bh
        endif
        db      " KEYS 3 "
        if      FW_VERSION >= 312
        db      091h, 020h, 034h, 029h, 02ch, 020h, 097h, 020h, 0dfh, 00ah, 081h, 020h, 0a5h, 020h, 0aeh, 020h
        elseif  FW_VERSION = 311
        db      08eh, 020h, 034h, 029h, 02ch, 020h, 09ch, 020h, 0e2h, 00ah, 081h, 020h, 0a3h, 020h, 0ach, 020h
        else
        db      091h, 020h, 034h, 029h, 02ch, 020h, 09ah, 020h, 0f7h, 00ah, 081h, 020h, 0a5h, 020h, 0b0h, 020h
        endif
        db      081h, 020h, 022h
        db      "Type"
        if      FW_VERSION >= 312
        db      022h, 02ch, 020h, 022h, 050h, 067h, 06dh, 022h, 020h, 091h, 020h, 022h, 043h, 068h, 06eh, 022h
        db      00ah, 0e7h, 02eh, 00ah, 000h, 089h, 020h, 083h, 020h, 09eh, 020h, 0ebh, 020h, 01bh, 0b3h, 00ah
        db      01bh, 00dh, 02eh, 00ah, 000h, 089h, 020h, 0afh, 020h, 0cbh, 020h, 09eh, 020h, 081h, 020h, 0c5h
        db      020h, 0ebh, 02eh, 00ah, 000h, 01bh, 043h, 020h, 01bh, 061h, 020h, 081h, 020h, 088h, 020h, 01bh
        db      073h, 020h, 01bh, 07ch, 020h, 0e9h, 00ah, 01bh, 00dh, 02ch, 020h, 09bh
        elseif  FW_VERSION = 311
        db      022h, 02ch, 020h, 022h, 050h, 067h, 06dh, 022h, 020h, 08eh, 020h, 022h, 043h, 068h, 06eh, 022h
        db      00ah, 0e7h, 02eh, 00ah, 000h, 08bh, 020h, 083h, 020h, 09eh, 020h, 01bh, 004h, 020h, 01bh, 085h
        db      00ah, 01bh, 02ah, 02eh, 00ah, 000h, 08bh, 020h, 0afh, 020h, 0c5h, 020h, 09eh, 020h, 081h, 020h
        db      0d0h, 020h, 01bh, 004h, 02eh, 00ah, 000h, 01bh, 04bh, 020h, 01bh, 076h, 020h, 081h, 020h, 087h
        db      020h, 01bh, 00dh, 020h, 01bh, 07dh, 020h, 0eah, 00ah, 01bh, 02ah, 02ch, 020h, 093h
        else
        db      022h, 02ch, 020h, 022h, 050h, 067h, 06dh, 022h, 020h, 091h, 020h, 022h, 043h, 068h, 06eh, 022h
        db      00ah, 0ddh, 02eh, 00ah, 000h, 089h, 020h, 083h, 020h, 09dh, 020h, 01bh, 007h, 020h, 01bh, 06bh
        db      00ah, 01bh, 01bh, 02eh, 00ah, 000h, 089h, 020h, 0ach, 020h, 0bch, 020h, 09dh, 020h, 081h, 020h
        db      0c4h, 020h, 01bh, 007h, 02eh, 00ah, 000h, 01bh
        db      "< create "
        db      081h, 020h, 087h, 020h, 01bh, 012h, 020h, 01bh, 065h, 020h, 0efh, 00ah, 01bh, 01bh, 02ch, 020h
        db      092h
        endif
        db      " IN USE "
        if      FW_VERSION >= 312
        db      091h, 020h, 0dfh, 00ah, 0a5h, 020h, 0aeh, 020h, 081h, 020h, 0e7h, 020h, 0e0h
        elseif  FW_VERSION = 311
        db      08eh, 020h, 0e2h, 00ah, 0a3h, 020h, 0ach, 020h, 081h, 020h, 0e7h, 020h, 0edh
        else
        db      091h, 020h, 0f7h, 00ah, 0a5h, 020h, 0b0h, 020h, 081h, 020h, 0ddh, 020h, 0e4h
        endif
        db      ". Otherwise,"
        if      FW_VERSION >= 312
        db      00ah, 09bh
        elseif  FW_VERSION = 311
        db      00ah, 093h
        else
        db      00ah, 092h
        endif
        db      " UNUSED "
        if      FW_VERSION >= 312
        db      084h, 020h, 01bh, 091h, 020h, 0b4h, 02eh, 00ah, 000h, 089h, 020h, 0c6h, 020h, 09eh, 020h, 081h
        db      020h, 0c5h, 020h, 082h, 02eh, 00ah, 000h, 089h, 020h, 088h, 020h, 0c7h, 020h, 028h, 01bh, 050h
        db      020h, 0adh, 020h, 086h, 029h, 020h, 0a4h, 020h, 081h, 00ah, 088h, 020h, 08dh, 020h, 01bh, 07ch
        db      02eh, 00ah, 000h, 089h, 020h, 090h, 020h, 083h, 020h, 0a4h, 020h, 081h, 020h, 088h, 00ah, 08dh
        db      020h, 01bh, 07ch, 02eh, 00ah, 000h, 089h, 020h, 01bh, 08ah
        elseif  FW_VERSION = 311
        db      084h, 020h, 01bh, 0a4h, 020h, 0b1h, 02eh, 00ah, 000h, 08bh, 020h, 0c3h, 020h, 09eh, 020h, 081h
        db      020h, 0d0h, 020h, 082h, 02eh, 00ah, 000h, 08bh, 020h, 087h, 020h, 0ceh, 020h, 028h, 01bh, 04eh
        db      020h, 0aah, 020h, 086h, 029h, 020h, 0a5h, 020h, 081h, 00ah, 087h, 020h, 08ch, 020h, 01bh, 07dh
        db      02eh, 00ah, 000h, 08bh, 020h, 090h, 020h, 083h, 020h, 0a5h, 020h, 081h, 020h, 087h, 00ah, 08ch
        db      020h, 01bh, 07dh, 02eh, 00ah, 000h, 08bh, 020h, 01bh, 0a6h
        else
        db      084h, 020h, 01bh, 0bdh, 020h, 0c5h, 02eh, 00ah, 000h, 089h, 020h, 0bbh, 020h, 09dh, 020h, 081h
        db      020h, 0c4h, 020h, 082h, 02eh, 00ah, 000h, 089h, 020h, 087h, 020h, 0c3h, 020h, 028h, 01bh, 049h
        db      020h, 0abh, 020h, 08eh, 029h, 020h, 0a4h, 020h, 081h, 00ah, 087h, 020h, 08ah, 020h, 01bh, 065h
        db      02eh, 00ah, 000h, 089h, 020h, 08ch, 020h, 083h, 020h, 0a4h, 020h, 081h, 020h, 087h, 00ah, 08ah
        db      020h, 01bh, 065h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 08ah
        endif
        db      " status "
        if      FW_VERSION >= 312
        db      09eh, 020h, 081h, 020h, 0c5h, 020h, 082h, 00ah, 028h, 01bh, 012h, 020h, 0adh
        elseif  FW_VERSION = 311
        db      09eh, 020h, 081h, 020h, 0d0h, 020h, 082h, 00ah, 028h, 01bh, 032h, 020h, 0aah
        else
        db      09dh, 020h, 081h, 020h, 0c4h, 020h, 082h, 00ah, 028h, 01bh, 025h, 020h, 0abh
        endif
        db      " TO BAR)."
        if      FW_VERSION >= 312
        db      00ah, 000h, 089h, 020h, 01bh, 077h, 020h, 081h, 020h, 0c5h, 020h, 082h, 020h, 085h, 020h, 01bh
        db      08ah, 020h, 084h, 00ah, 028h, 01bh, 046h, 020h, 022h, 01bh, 0ech, 022h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08bh, 020h, 01bh, 060h, 020h, 081h, 020h, 0d0h, 020h, 082h, 020h, 085h, 020h, 01bh
        db      0a6h, 020h, 084h, 00ah, 028h, 01bh, 053h, 020h, 022h
        db      "Loop"
        db      022h
        else
        db      00ah, 000h, 089h, 020h, 01bh, 053h, 020h, 081h, 020h, 0c4h, 020h, 082h, 020h, 085h, 020h, 01bh
        db      08ah, 020h, 084h, 00ah, 028h, 01bh, 059h, 020h, 022h, 01bh, 0f5h, 022h
        endif
        db      " = TO BAR)."
        if      FW_VERSION <> 311
        db      00ah, 000h, 089h
        else
        db      00ah, 000h, 08bh
        endif
        db      " primary "
        if      FW_VERSION >= 312
        db      086h, 020h, 094h, 020h, 091h, 020h, 0b5h, 00ah, 01bh, 0c7h, 020h, 0a4h, 020h, 081h, 020h, 088h
        db      020h, 08dh, 020h, 01bh, 07ch, 02eh, 00ah, 000h, 089h, 020h, 01bh, 063h, 020h, 086h, 020h, 094h
        db      020h, 091h, 020h, 0b5h, 00ah, 01bh, 0c7h, 020h, 0a4h, 020h, 081h, 020h, 088h, 020h, 08dh, 020h
        db      01bh, 07ch, 02eh, 00ah, 000h, 08eh, 020h, 082h, 020h, 084h, 020h, 096h, 020h, 01bh, 037h, 020h
        db      097h, 00ah, 08bh, 020h, 03ch, 01bh, 084h, 020h, 0f1h, 03eh, 02eh, 00ah, 000h, 08ch, 020h, 01bh
        db      015h
        elseif  FW_VERSION = 311
        db      086h, 020h, 09ah, 020h, 08eh, 020h, 0b5h, 00ah, 01bh, 0d1h, 020h, 0a5h, 020h, 081h, 020h, 087h
        db      020h, 08ch, 020h, 01bh, 07dh, 02eh, 00ah, 000h, 08bh, 020h, 01bh, 097h, 020h, 086h, 020h, 09ah
        db      020h, 08eh, 020h, 0b5h, 00ah, 01bh, 0d1h, 020h, 0a5h, 020h, 081h, 020h, 087h, 020h, 08ch, 020h
        db      01bh, 07dh, 02eh, 00ah, 000h, 08fh, 020h, 082h, 020h, 084h, 020h, 097h, 020h, 01bh, 013h, 020h
        db      09ch, 00ah, 089h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 02eh, 00ah, 000h
        db      "What "
        db      0f3h, 020h, 01bh
        db      "+ we say?"
        db      00ah, 000h, 08dh, 020h, 0e9h
        else
        db      08eh, 020h, 0a9h, 020h, 091h, 020h, 0c7h, 00ah, 01bh, 0f2h, 020h, 0a4h, 020h, 081h, 020h, 087h
        db      020h, 08ah, 020h, 01bh, 065h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 06fh, 020h, 08eh, 020h, 0a9h
        db      020h, 091h, 020h, 0c7h, 00ah, 01bh, 0f2h, 020h, 0a4h, 020h, 081h, 020h, 087h, 020h, 08ah, 020h
        db      01bh, 065h, 02eh, 00ah, 000h, 08fh, 020h, 082h, 020h, 084h, 020h, 098h, 020h, 01bh, 008h, 020h
        db      09ah, 00ah, 088h, 020h, 03ch, 01bh, 085h, 020h, 0dch, 03eh, 02eh, 00ah, 000h
        db      "What "
        db      01bh, 01ah, 020h, 01bh
        db      "6 we say?"
        db      00ah, 000h, 08dh, 020h, 0e2h
        endif
        db      " corrects any "
        if      FW_VERSION >= 312
        db      01bh, 03dh, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 05ah, 00ah
        else
        db      01bh, 041h, 00ah
        endif
        db      "errors "
        if      FW_VERSION >= 312
        db      0e6h, 020h, 01bh, 09fh
        elseif  FW_VERSION = 311
        db      0f4h, 020h, 01bh, 0d0h
        else
        db      0ech, 020h, 01bh, 0fbh
        endif
        db      " moving "
        if      FW_VERSION >= 312
        db      0bah, 020h, 0aah, 020h, 084h, 00ah, 081h
        elseif  FW_VERSION = 311
        db      0b9h, 020h, 0aeh, 020h, 084h, 00ah, 081h
        else
        db      0b9h, 020h, 0a8h, 020h, 084h, 00ah, 081h
        endif
        db      " nearest 1/16 "
        if      FW_VERSION >= 312
        db      098h, 020h, 028h, 0adh, 020h, 01bh, 030h, 00ah, 08dh, 020h, 0a0h, 029h, 02eh, 020h, 08eh, 020h
        db      0edh, 020h, 0a0h, 020h, 0bbh, 00ah, 0adh, 020h, 01bh, 0e7h, 020h, 022h, 01bh, 012h, 022h, 020h
        db      084h
        elseif  FW_VERSION = 311
        db      09bh, 020h, 028h, 0aah, 020h, 01bh, 022h, 00ah, 08ch, 020h, 0a4h, 029h, 02eh, 020h, 08fh, 020h
        db      0ech, 020h, 0a4h, 020h, 0b4h, 00ah, 0aah, 020h, 01bh, 0bch, 020h, 022h, 01bh, 032h, 022h, 020h
        db      084h
        else
        db      097h, 020h, 028h, 0abh, 020h, 01bh, 037h, 00ah, 08ah, 020h, 0a1h, 029h, 02eh, 020h, 08fh, 020h
        db      0dfh, 020h, 0a1h, 020h, 0b1h, 00ah, 0abh
        db      " choose "
        db      022h, 01bh, 025h, 022h, 020h, 084h
        endif
        db      " defeat "
        if      FW_VERSION >= 312
        db      01bh, 03dh, 00ah, 01bh, 07fh, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      01bh, 05ah, 00ah, 01bh, 08dh, 02eh, 00ah, 000h
        else
        db      01bh, 041h, 00ah
        db      "correct."
        db      00ah, 000h
        endif
        db      "Adds a "
        db      022h
        db      "swing"
        db      022h
        db      " feel "
        if      FW_VERSION >= 312
        db      084h, 020h, 031h, 02fh, 038h, 020h, 0adh, 020h, 031h, 02fh, 031h, 036h, 00ah, 0aah
        db      ". 50% = equal "
        db      01bh, 03dh, 020h, 084h, 020h, 01bh, 027h, 020h, 098h, 00ah, 09eh
        elseif  FW_VERSION = 311
        db      084h, 020h, 031h, 02fh, 038h, 020h, 0aah, 020h, 031h, 02fh, 031h, 036h, 00ah, 0aeh, 02eh, 020h
        db      035h, 030h, 025h, 020h, 03dh, 020h, 01bh, 0eeh, 020h, 01bh, 05ah, 020h, 084h, 020h, 01bh, 035h
        db      020h, 09bh, 00ah, 09eh
        else
        db      084h, 020h, 031h, 02fh, 038h, 020h, 0abh, 020h, 031h, 02fh, 031h, 036h, 00ah, 0a8h, 02eh, 020h
        db      035h, 030h, 025h, 020h, 03dh, 020h, 01bh, 0ceh, 020h, 01bh, 041h, 020h, 084h, 020h, 01bh, 05ah
        db      020h, 097h, 00ah, 09dh
        endif
        db      " pair ("
        if      FW_VERSION >= 312
        db      01bh, 088h
        elseif  FW_VERSION = 311
        db      01bh, 09fh
        else
        db      01bh, 097h
        endif
        db      " swing); 66% = dotted "
        if      FW_VERSION >= 312
        db      0aah, 00ah, 028h, 032h, 02fh, 033h, 020h, 09eh, 020h, 01bh, 03dh, 020h, 09eh, 020h, 01bh
        db      "' pair given "
        db      084h, 00ah, 0e1h, 020h, 098h, 020h, 09eh
        elseif  FW_VERSION = 311
        db      0aeh, 00ah, 028h, 032h, 02fh, 033h, 020h, 09eh, 020h, 01bh, 05ah, 020h, 09eh, 020h, 01bh
        db      "5 pair given "
        db      084h, 00ah, 0feh, 020h, 09bh, 020h, 09eh
        else
        db      0a8h, 00ah, 028h, 032h, 02fh, 033h, 020h, 09dh, 020h, 01bh, 041h, 020h, 09dh, 020h, 01bh
        db      "Z pair given "
        db      084h, 00ah, 0f6h, 020h, 097h, 020h, 09dh
        endif
        db      " pair)."
        db      00ah, 000h
        db      "Shifts "
        if      FW_VERSION >= 312
        db      081h, 020h, 01bh, 082h, 020h, 084h, 020h, 0b1h
        db      " TIMING"
        db      00ah, 01bh, 0ceh, 020h, 085h, 020h, 01bh, 0cch, 020h, 0aah, 02eh, 020h, 0a3h
        elseif  FW_VERSION = 311
        db      081h, 020h, 01bh, 07fh, 020h, 084h, 020h, 0b3h
        db      " TIMING"
        db      00ah, 01bh, 0d3h, 020h, 085h, 020h, 01bh, 0e1h, 020h, 0aeh, 02eh, 020h, 0a6h
        else
        db      081h, 020h, 01bh, 076h, 020h, 084h, 020h, 0b3h, 020h, 01bh, 0fah, 00ah, 01bh, 0b7h, 020h, 085h
        db      020h, 01bh, 0aeh, 020h, 0a8h, 02eh, 020h, 0a2h
        endif
        db      " shift"
        db      00ah
        db      "direction "
        if      FW_VERSION >= 312
        db      0aeh, 020h, 022h
        elseif  FW_VERSION = 311
        db      0ach, 020h, 022h
        else
        db      0b0h, 020h, 022h
        endif
        db      "Shift Timing"
        if      FW_VERSION >= 312
        db      022h, 020h, 09dh, 020h, 091h, 00ah
        db      "distance ("
        db      0aeh, 020h, 01bh, 0e3h, 02dh, 02dh, 031h, 02fh, 033h, 038h, 034h, 020h, 0aah, 029h, 020h, 0aeh
        db      00ah, 022h
        elseif  FW_VERSION = 311
        db      022h, 020h, 0a0h, 020h, 08eh, 00ah, 01bh, 0a5h, 020h, 028h, 0ach, 020h, 01bh, 0f3h, 02dh, 02dh
        db      031h, 02fh, 033h, 038h, 034h, 020h, 0aeh, 029h, 020h, 0ach, 00ah, 022h
        else
        db      022h, 020h, 0a0h, 020h, 091h, 00ah, 01bh, 092h, 020h, 028h, 0b0h
        db      " ticks--1/384 "
        db      0a8h, 029h, 020h, 0b0h, 00ah, 022h
        endif
        db      "Shift Amount"
        if      FW_VERSION >= 312
        db      022h, 020h, 09dh, 02eh, 00ah, 000h, 089h, 020h, 088h, 020h, 084h, 020h, 096h, 020h, 01bh, 06dh
        db      020h, 0b6h
        elseif  FW_VERSION = 311
        db      022h, 020h, 0a0h, 02eh, 00ah, 000h, 08bh, 020h, 087h, 020h, 084h, 020h, 097h, 020h, 01bh, 08bh
        db      020h, 0c1h
        else
        db      022h, 020h, 0a0h, 02eh, 00ah, 000h, 089h, 020h, 087h, 020h, 084h, 020h, 098h, 020h, 01bh, 069h
        db      020h, 0bah
        endif
        db      " <Move"
        if      FW_VERSION >= 312
        db      00ah, 0c2h, 03eh, 020h, 099h, 020h, 0b7h, 02eh, 020h, 0a3h, 020h, 022h, 030h, 022h, 020h, 084h
        db      020h, 01bh, 0cch, 00ah, 0bah, 020h, 0c1h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 024h, 02eh, 0e3h
        db      02eh, 0e4h, 020h, 093h, 020h, 09eh, 020h, 081h, 020h, 0d5h, 00ah, 09eh, 020h, 081h, 020h, 0d2h
        db      020h, 084h, 020h, 096h, 020h, 01bh, 06dh, 02eh, 00ah, 000h, 089h, 020h, 01bh, 024h, 02eh, 0e3h
        db      02eh, 0e4h, 020h, 093h, 020h, 09eh, 020h, 081h, 020h, 0e1h, 00ah, 01bh, 08eh, 020h, 01bh, 0b0h
        db      020h, 081h, 020h, 0d2h, 020h, 084h, 020h, 096h, 020h, 01bh, 06dh, 02eh, 00ah, 000h, 01bh, 0d1h
        db      020h, 081h, 020h, 01bh, 098h, 020h, 01bh, 03eh, 020h, 0adh, 020h, 08bh
        db      " two "
        db      01bh, 026h, 020h, 0e9h, 00ah, 061h, 020h, 086h, 020h, 0c4h, 020h, 084h, 020h, 0dfh, 020h, 081h
        db      020h, 01bh, 032h, 020h, 09eh, 00ah, 0aah, 020h, 0f6h, 020h, 01bh, 041h, 020h, 084h
        elseif  FW_VERSION = 311
        db      00ah, 0bdh, 03eh, 020h, 096h, 020h, 0bch, 02eh, 020h, 0a6h, 020h, 022h, 030h, 022h, 020h, 084h
        db      020h, 01bh, 0e1h, 00ah, 0b9h, 020h, 0bfh, 02eh, 00ah, 000h, 08bh, 020h, 01bh, 03fh, 02eh, 0f0h
        db      02eh, 0f1h, 020h, 099h, 020h, 09eh, 020h, 081h, 020h, 0d7h, 00ah, 09eh, 020h, 081h, 020h, 0dch
        db      020h, 084h, 020h, 097h, 020h, 01bh, 08bh, 02eh, 00ah, 000h, 08bh, 020h, 01bh, 03fh, 02eh, 0f0h
        db      02eh, 0f1h, 020h, 099h, 020h, 09eh, 020h, 081h, 020h, 0feh, 00ah, 01bh, 0a7h, 020h, 01bh, 0b7h
        db      020h, 081h, 020h, 0dch, 020h, 084h, 020h, 097h, 020h, 01bh, 08bh, 02eh, 00ah, 000h, 01bh, 08fh
        db      020h, 081h, 020h, 01bh, 059h, 020h, 01bh, 028h, 020h, 0aah, 020h, 089h, 020h, 01bh, 0fah, 020h
        db      01bh, 042h, 020h, 0eah, 00ah, 061h, 020h, 086h, 020h, 0c8h, 020h, 084h, 020h, 0e2h, 020h, 081h
        db      020h, 01bh, 046h, 020h, 09eh, 00ah, 0aeh, 020h, 0ebh, 020h, 01bh, 01bh, 020h, 084h
        else
        db      00ah, 0b6h, 03eh, 020h, 0a6h, 020h, 0bdh, 02eh, 020h, 0a2h, 020h, 022h, 030h, 022h, 020h, 084h
        db      020h, 01bh, 0aeh, 00ah, 0b9h, 020h, 0e9h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 02eh, 02eh, 0e7h
        db      02eh, 0e5h, 020h, 099h, 020h, 09dh, 020h, 081h, 020h, 0d3h, 00ah, 09dh, 020h, 081h, 020h, 0d2h
        db      020h, 084h, 020h, 098h, 020h, 01bh, 069h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 02eh, 02eh, 0e7h
        db      02eh, 0e5h, 020h, 099h, 020h, 09dh, 020h, 081h, 020h, 0f6h, 00ah, 01bh, 087h, 020h, 01bh, 0a3h
        db      020h, 081h, 020h, 0d2h, 020h, 084h, 020h, 098h, 020h, 01bh, 069h, 02eh, 00ah, 000h, 01bh, 072h
        db      020h, 081h, 020h, 01bh, 042h, 020h, 01bh, 01ch, 020h, 0abh, 020h, 088h
        db      " two "
        db      01bh, 032h, 020h, 0efh, 00ah, 061h, 020h, 08eh, 020h, 0c0h, 020h, 084h, 020h, 0f7h, 020h, 081h
        db      020h, 01bh, 03bh, 020h, 09dh, 00ah, 0a8h, 020h, 0f8h, 020h, 01bh, 01dh, 020h, 084h
        endif
        db      " affect."
        if      FW_VERSION >= 312
        db      00ah, 000h, 089h, 020h, 0d9h, 020h, 01bh, 0a1h, 03ah, 020h, 08bh, 020h, 01bh, 013h, 020h, 01bh
        db      03ah, 00ah, 01bh, 025h, 02ch, 020h, 08bh
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08fh, 020h, 081h, 020h, 01bh, 01ah, 020h, 01bh, 01ch
        db      ". (Or desire"
        db      00ah, 081h, 020h, 08ch, 020h, 01bh, 01ch, 02eh, 029h, 00ah, 000h, 08bh, 020h, 0e4h, 020h, 01bh
        db      08eh, 03ah, 020h, 089h, 020h, 01bh, 01ah, 020h, 01bh, 057h, 00ah, 01bh, 033h, 02ch, 020h, 089h
        else
        db      00ah, 000h, 08fh, 020h, 081h, 020h, 01bh, 004h, 020h, 01bh, 003h
        db      ". (Or desire"
        db      00ah, 081h, 020h, 08ah, 020h, 01bh, 003h, 02eh, 029h, 00ah, 000h, 089h, 020h, 0ebh, 020h, 01bh
        db      07eh, 03ah, 020h, 088h, 020h, 01bh, 004h, 020h, 01bh, 05ch, 00ah, 01bh, 023h, 02ch, 020h, 088h
        endif
        db      " DOWN "
        if      FW_VERSION >= 312
        db      084h, 020h, 0a2h, 020h, 09ah, 020h, 0adh, 020h, 055h, 050h, 00ah, 084h, 020h, 0a2h
        elseif  FW_VERSION = 311
        db      084h, 020h, 0a2h, 020h, 095h, 020h, 0aah, 020h, 055h, 050h, 00ah, 084h, 020h, 0a2h
        else
        db      084h, 020h, 09bh, 020h, 094h, 020h, 0abh, 020h, 055h, 050h, 00ah, 084h, 020h, 09bh
        endif
        db      " pan, "
        if      FW_VERSION >= 312
        db      097h, 020h, 01bh, 08dh, 020h, 01bh, 098h, 020h, 01bh, 03eh, 02eh, 00ah, 09fh, 020h, 01bh, 097h
        elseif  FW_VERSION = 311
        db      09ch, 020h, 01bh, 086h, 020h, 01bh, 059h, 020h, 01bh, 028h, 02eh, 00ah, 092h, 020h, 01bh, 0b3h
        else
        db      09ah, 020h, 01bh, 081h, 020h, 01bh, 042h, 020h, 01bh, 01ch, 02eh, 00ah, 090h, 020h, 01bh, 08bh
        endif
        db      " KEY 1 "
        if      FW_VERSION >= 312
        db      084h, 020h, 0a2h, 020h, 0bah, 03bh, 020h, 08bh, 00ah, 01bh, 019h, 020h, 0b6h
        elseif  FW_VERSION = 311
        db      084h, 020h, 0a2h, 020h, 0b9h, 03bh, 020h, 089h, 00ah, 0eeh, 020h, 0c1h
        else
        db      084h, 020h, 09bh, 020h, 0b9h, 03bh, 020h, 088h, 00ah, 0e3h, 020h, 0bah
        endif
        db      " done."
        db      00ah, 000h
        db      "Individual outs/"
        if      FW_VERSION >= 312
        db      01bh, 03bh, 020h, 01bh, 0a1h, 03ah, 020h, 08bh, 020h, 055h, 050h, 00ah, 026h, 020h, 01bh, 08dh
        db      020h, 01bh, 03eh, 020h, 084h
        elseif  FW_VERSION = 311
        db      01bh, 04fh, 020h, 01bh, 08eh, 03ah, 020h, 089h, 020h, 055h, 050h, 00ah, 026h, 020h, 01bh, 086h
        db      020h, 01bh, 028h, 020h, 084h
        else
        db      01bh, 04ch, 020h, 01bh, 07eh, 03ah, 020h, 088h, 020h, 055h, 050h, 00ah, 026h, 020h, 01bh, 081h
        db      020h, 01bh, 01ch, 020h, 084h
        endif
        db      " assign "
        if      FW_VERSION >= 312
        db      01bh, 027h, 020h, 08ah, 020h, 084h, 020h, 031h, 00ah, 09eh, 020h, 038h, 020h, 01bh, 01dh
        db      " outs "
        db      0adh, 020h, 084h, 020h, 01bh, 03bh, 020h, 028h, 045h, 029h, 02eh, 00ah, 09fh
        elseif  FW_VERSION = 311
        db      01bh, 035h, 020h, 08ah, 020h, 084h, 020h, 031h, 00ah, 09eh, 020h, 038h, 020h, 01bh
        db      "1 outs "
        db      0aah, 020h, 084h, 020h, 01bh, 04fh, 020h, 028h, 045h, 029h, 02eh, 00ah, 092h
        else
        db      01bh, 05ah, 020h, 08bh, 020h, 084h, 020h, 031h, 00ah, 09dh, 020h, 038h, 020h, 01bh, 022h
        db      " outs "
        db      0abh, 020h, 084h, 020h, 01bh, 04ch, 020h, 028h, 045h, 029h, 02eh, 00ah, 090h
        endif
        db      " DOWN & "
        if      FW_VERSION >= 312
        db      01bh, 08dh, 020h, 01bh, 03eh, 020h, 084h, 020h, 0feh
        elseif  FW_VERSION = 311
        db      01bh, 086h, 020h, 01bh, 028h, 020h, 084h, 020h, 01bh, 00fh
        else
        db      01bh, 081h, 020h, 01bh, 01ch, 020h, 084h, 020h, 01bh, 018h
        endif
        db      " send"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 066h, 020h, 0a4h, 020h, 0cfh, 02eh, 020h, 09fh, 020h, 01bh, 0fch
        db      " Key 1"
        db      00ah, 084h, 020h, 0a2h, 020h, 0bah, 020h, 01bh
        db      "V once; "
        db      08bh, 020h, 01bh, 019h, 00ah, 0b6h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 066h, 020h, 0a5h, 020h, 0c4h, 02eh, 020h, 092h
        db      " Soft Key 1"
        db      00ah, 084h, 020h, 0a2h, 020h, 0b9h, 020h, 01bh
        db      "L once; "
        db      089h, 020h, 0eeh, 00ah, 0c1h
        else
        db      00ah, 01bh, 04eh, 020h, 0a4h, 020h, 0cdh, 02eh, 020h, 090h, 020h, 01bh, 0ffh
        db      " Key 1"
        db      00ah, 084h, 020h, 09bh, 020h, 0b9h, 020h, 01bh
        db      "4 once; "
        db      088h, 020h, 0e3h, 00ah, 0bah
        endif
        db      " done."
        if      FW_VERSION >= 312
        db      00ah, 000h, 08ch, 020h, 0beh, 020h, 01bh, 06ch, 020h, 081h, 020h, 01bh, 093h, 020h, 0a5h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08dh, 020h, 0cbh, 020h, 01bh, 062h, 020h, 081h, 020h, 01bh, 0e8h, 020h, 0a3h
        else
        db      00ah, 000h, 08dh, 020h, 0c8h, 020h, 01bh, 051h, 020h, 081h
        db      " same "
        db      0a5h
        endif
        db      " as "
        if      FW_VERSION >= 312
        db      081h, 00ah
        db      "graphic "
        elseif  FW_VERSION = 311
        db      0ach, 00ah, 081h
        db      " Graphic "
        else
        db      0b0h, 00ah, 081h
        db      " Graphic "
        endif
        db      01bh
        if      FW_VERSION >= 312
        db      "# Mix "
        db      091h
        db      " Indiv Out Mix"
        elseif  FW_VERSION = 311
        db      "< Mix "
        db      08eh
        db      " Indiv Out"
        else
        db      ", Mix "
        db      091h
        db      " Indiv Out"
        endif
        db      00ah
        if      FW_VERSION >= 312
        db      "screens but "
        db      0aeh
        elseif  FW_VERSION = 311
        db      "Mix screens but "
        db      0ach
        else
        db      "Mix screens but "
        db      0b0h
        endif
        db      " text form. "
        if      FW_VERSION >= 312
        db      08eh, 020h, 0bbh, 00ah, 081h, 020h, 01bh, 025h, 020h, 084h
        db      " adjust "
        db      01bh, 09fh, 020h, 0f7h, 020h, 0f1h, 020h, 0adh, 00ah
        db      "entering "
        db      01bh, 087h, 020h, 086h, 020h, 098h, 020h, 083h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 066h, 020h
        db      0aeh, 020h, 081h, 020h, 0d9h
        elseif  FW_VERSION = 311
        db      08fh, 00ah, 0b4h, 020h, 081h, 020h, 086h, 020h, 09bh, 020h, 083h, 020h, 084h, 020h, 097h, 00ah
        db      "adjusted (35-98). "
        db      08bh, 020h, 01bh, 026h, 00ah, 0cdh, 020h, 01bh, 033h, 020h, 08eh, 020h, 08ah, 020h, 0cfh, 020h
        db      0fch, 020h, 084h, 00ah, 081h, 020h, 0dbh, 02eh, 00ah, 000h, 08dh, 020h, 096h, 020h, 081h, 020h
        db      095h, 020h, 01bh, 066h, 020h, 084h, 020h, 081h, 020h, 0e4h, 00ah
        db      "mix."
        db      00ah, 000h, 08dh, 020h, 096h, 020h, 081h, 020h, 095h, 020h, 01bh, 066h, 020h, 084h, 020h, 081h
        db      00ah, 01bh, 031h, 020h, 0b5h, 02fh, 01bh
        db      "O mix."
        db      00ah, 000h, 08dh, 020h, 096h, 020h, 081h
        db      " pan "
        db      0e1h
        db      " within "
        db      081h, 00ah, 0e4h
        else
        db      08fh, 00ah, 0b1h, 020h, 081h, 020h, 08eh, 020h, 097h, 020h, 083h, 020h, 084h, 020h, 098h, 00ah
        db      "adjusted (35-98). "
        db      089h, 020h, 01bh, 010h, 00ah, 0cch, 020h, 01bh, 023h, 020h, 091h, 020h, 08bh, 020h, 0d6h, 020h
        db      0f3h, 020h, 084h, 00ah, 081h, 020h, 0d1h, 02eh, 00ah, 000h, 08dh, 020h, 0a6h, 020h, 081h, 020h
        db      094h, 020h, 01bh, 04eh, 020h, 084h, 020h, 081h, 020h, 0ebh, 00ah
        db      "mix."
        db      00ah, 000h, 08dh, 020h, 0a6h, 020h, 081h, 020h, 094h, 020h, 01bh, 04eh, 020h, 084h, 020h, 081h
        db      00ah, 01bh, 022h, 020h, 0c7h, 02fh, 01bh
        db      "L mix."
        db      00ah, 000h, 08dh, 020h, 0a6h, 020h, 081h
        db      " pan "
        db      0dah, 020h, 01bh, 0f4h, 020h, 081h, 00ah, 0ebh
        endif
        db      " mix."
        if      FW_VERSION >= 312
        db      00ah, 000h, 08ch, 020h, 099h, 020h, 081h, 020h, 09ah, 020h, 01bh, 066h, 020h, 084h, 020h, 081h
        db      00ah, 01bh, 01dh, 020h, 0b5h, 02fh, 01bh
        db      "; mix."
        db      00ah, 000h, 08ch, 020h, 099h, 020h, 081h
        db      " pan "
        db      0d4h, 020h, 01bh, 0eah, 020h, 081h, 00ah, 0d9h
        db      " mix."
        db      00ah, 000h, 08ch, 020h, 099h, 020h, 081h, 020h, 0cfh, 020h, 084h, 020h, 081h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08dh, 020h, 096h, 020h, 081h, 020h, 0c4h, 020h, 084h, 020h, 081h
        else
        db      00ah, 000h, 08dh, 020h, 0a6h, 020h, 081h, 020h, 0cdh, 020h, 084h, 020h, 081h
        endif
        db      " indiviual"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 039h, 020h, 0adh, 020h, 01bh, 021h, 020h, 01bh
        db      ";. Options"
        db      00ah, 0e2h, 020h, 022h, 01bh, 012h, 022h, 020h, 028h, 01bh, 088h, 020h, 0cfh
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 04dh, 020h, 0aah, 020h, 01bh, 016h, 020h, 01bh
        db      "O. Options"
        db      00ah, 0cfh, 020h, 022h, 01bh, 032h, 022h, 020h, 028h, 01bh, 09fh, 020h, 0c4h
        else
        db      00ah, 01bh, 047h, 020h, 0abh, 020h, 01bh, 00ah, 020h, 01bh
        db      "L. Options"
        db      00ah, 0d6h, 020h, 022h, 01bh, 025h, 022h, 020h, 028h, 01bh, 097h, 020h, 0cdh
        endif
        db      "), OUT1-OUT8"
        if      FW_VERSION >= 312
        db      00ah, 028h, 01bh, 039h, 020h, 031h, 02dh, 038h, 029h, 020h, 091h, 020h, 022h
        elseif  FW_VERSION = 311
        db      00ah, 028h, 01bh, 04dh, 020h, 031h, 02dh, 038h, 029h, 020h, 08eh, 020h, 022h
        else
        db      00ah, 028h, 01bh, 047h, 020h, 031h, 02dh, 038h, 029h, 020h, 091h, 020h, 022h
        endif
        db      "EFCT"
        db      022h
        db      " (sends "
        if      FW_VERSION >= 312
        db      084h, 00ah, 01bh, 021h, 020h, 01bh, 03bh, 020h, 01bh, 02dh, 029h, 02eh, 00ah, 000h, 01bh, 060h
        db      020h, 01bh, 0b6h, 02ch, 020h, 01bh, 01dh
        db      " out "
        db      09ah, 020h, 099h, 00ah
        elseif  FW_VERSION = 311
        db      084h, 00ah, 01bh, 016h, 020h, 01bh, 04fh, 020h, 01bh, 049h, 029h, 02eh, 00ah, 000h, 01bh, 078h
        db      020h, 01bh, 0dch, 02ch, 020h, 01bh, 031h, 020h, 01bh, 0fdh, 020h, 095h, 020h, 096h, 00ah
        else
        db      084h, 00ah, 01bh, 00ah, 020h, 01bh, 04ch, 020h, 01bh, 035h, 029h, 02eh, 00ah, 000h, 01bh, 0c1h
        db      " YES, "
        db      01bh, 022h, 020h, 01bh, 0d6h, 020h, 094h, 020h, 0a6h, 00ah
        endif
        db      "proportional "
        if      FW_VERSION >= 312
        db      084h, 020h, 0d9h, 020h, 09ah
        elseif  FW_VERSION = 311
        db      084h, 020h, 0e4h, 020h, 095h
        else
        db      084h, 020h, 0ebh, 020h, 094h
        endif
        db      " (like"
        db      00ah, 022h
        db      "post fader"
        if      FW_VERSION >= 312
        db      022h, 020h, 0e9h, 020h, 01bh, 0d4h
        elseif  FW_VERSION = 311
        db      022h, 020h, 0eah, 020h, 01bh, 0b6h
        else
        db      022h, 020h, 0efh, 020h, 01bh, 096h
        endif
        db      " console); "
        db      01bh
        if      FW_VERSION >= 312
        db      "F NO,"
        db      00ah, 01bh, 01dh
        db      " out "
        db      09ah, 020h, 099h
        elseif  FW_VERSION = 311
        db      "S NO,"
        db      00ah, 01bh, 031h, 020h, 01bh, 0fdh, 020h, 095h, 020h, 096h
        else
        db      "Y NO,"
        db      00ah, 01bh, 022h, 020h, 01bh, 0d6h, 020h, 094h, 020h, 0a6h
        endif
        db      " independent"
        if      FW_VERSION >= 312
        db      00ah, 09eh, 020h, 0d9h, 020h, 09ah
        elseif  FW_VERSION = 311
        db      00ah, 09eh, 020h, 0e4h, 020h, 095h
        else
        db      00ah, 09dh, 020h, 0ebh, 020h, 094h
        endif
        db      " (like "
        db      022h
        db      "pre fader"
        if      FW_VERSION >= 312
        db      022h, 020h, 0e9h, 00ah, 01bh, 0d4h
        elseif  FW_VERSION = 311
        db      022h, 020h, 0eah, 00ah, 01bh, 0b6h
        else
        db      022h, 020h, 0efh, 00ah, 01bh, 096h
        endif
        db      " console.)"
        if      FW_VERSION >= 312
        db      00ah, 000h, 01bh, 0f7h, 020h, 061h, 020h, 01bh, 036h, 020h, 01bh, 0a1h, 020h, 01bh, 033h, 020h
        db      0a4h, 020h, 0bah, 00ah, 036h, 034h, 020h, 098h, 020h, 01bh, 03fh, 03ah, 020h, 0a3h, 020h, 081h
        db      020h, 01bh, 033h, 020h, 084h, 00ah, 096h, 020h, 01bh, 002h, 020h, 0aeh, 020h, 081h
        elseif  FW_VERSION = 311
        db      00ah, 000h
        db      "Sets a "
        db      01bh, 03eh, 020h, 01bh, 08eh, 020h, 01bh, 044h, 020h, 0a5h, 020h, 0b9h, 00ah, 036h, 034h, 020h
        db      09bh, 020h, 0f9h, 03ah, 020h, 0a6h, 020h, 081h, 020h, 01bh, 044h, 020h, 084h, 00ah, 097h, 020h
        db      01bh, 019h, 020h, 0ach, 020h, 081h
        else
        db      00ah, 000h
        db      "Sets a "
        db      01bh, 044h, 020h, 01bh, 07eh, 020h, 01bh, 03ah, 020h, 0a4h, 020h, 0b9h, 00ah, 036h, 034h, 020h
        db      097h, 020h, 0f1h, 03ah, 020h, 0a2h, 020h, 081h, 020h, 01bh, 03ah, 020h, 084h, 00ah, 098h, 020h
        db      01bh, 00bh, 020h, 0b0h, 020h, 081h
        endif
        db      " upper "
        if      FW_VERSION >= 312
        db      09dh, 02ch, 020h, 081h, 00ah, 0a0h, 020h, 0aeh, 020h, 081h
        db      " lower "
        db      09dh, 02ch, 020h, 097h, 020h, 08bh, 00ah, 03ch, 01bh, 084h, 020h, 0f1h, 03eh, 02eh, 00ah, 000h
        db      01bh, 0a9h, 020h, 01bh
        db      "z a "
        db      01bh, 036h, 020h, 0feh, 020h, 09eh, 020h, 01bh, 0a1h, 00ah, 0fah
        elseif  FW_VERSION = 311
        db      0a0h, 02ch, 020h, 081h, 00ah, 0a4h, 020h, 0ach, 020h, 081h, 020h, 01bh, 0c0h, 020h, 0a0h, 02ch
        db      020h, 09ch, 020h, 089h, 00ah, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 02eh, 00ah, 000h, 01bh, 0bdh
        db      020h, 01bh, 0b0h, 020h, 061h, 020h, 01bh, 03eh, 020h, 01bh, 00fh, 020h, 09eh, 020h, 01bh, 08eh
        db      00ah, 0f8h
        else
        db      0a0h, 02ch, 020h, 081h, 00ah, 0a1h, 020h, 0b0h, 020h, 081h, 020h, 01bh, 09bh, 020h, 0a0h, 02ch
        db      020h, 09ah, 020h, 088h, 00ah, 03ch, 01bh, 085h, 020h, 0dch, 03eh, 02eh, 00ah, 000h, 01bh, 0a0h
        db      020h, 01bh, 07dh, 020h, 061h, 020h, 01bh, 044h, 020h, 01bh, 018h, 020h, 09dh, 020h, 01bh, 07eh
        db      00ah, 0eeh
        endif
        db      " common "
        if      FW_VERSION >= 312
        db      084h, 020h, 0bah, 020h, 09ch, 020h, 091h, 00ah, 01bh, 08bh, 02eh, 00ah, 01bh, 048h, 020h, 01bh
        db      07ah, 020h, 081h, 020h, 0a9h, 020h, 082h, 027h, 073h, 00ah, 01bh, 0a4h
        db      " mix "
        db      0a5h, 02eh, 00ah
        db      "PROGRAM "
        db      01bh, 07ah, 020h, 081h, 020h, 0a9h, 020h, 090h, 027h, 073h, 00ah, 01bh, 0a4h
        db      " mix "
        db      0a5h, 02eh, 00ah, 000h, 01bh, 060h, 020h, 01bh, 0b6h, 02ch, 020h, 0b0h, 020h, 084h, 020h, 081h
        db      020h, 0d9h, 020h, 0adh
        db      " indiv"
        elseif  FW_VERSION = 311
        db      084h, 020h, 0b9h, 020h, 09dh, 020h, 08eh, 00ah, 01bh, 0aeh, 02eh, 00ah, 01bh, 068h, 020h, 01bh
        db      0b0h, 020h, 081h, 020h, 0adh, 020h, 082h, 027h, 073h, 00ah, 01bh
        db      "V mix "
        db      0a3h, 02eh, 00ah, 01bh, 094h, 020h, 01bh, 0b0h, 020h, 081h, 020h, 0adh, 020h, 090h, 027h, 073h
        db      00ah, 01bh
        db      "V mix "
        db      0a3h, 02eh, 00ah, 000h, 01bh, 078h, 020h, 01bh, 0dch, 02ch, 020h, 0b2h
        db      " made "
        db      0ach, 020h, 081h, 020h, 0e4h, 00ah, 01bh, 08eh, 020h, 028h, 095h, 020h, 0aah
        db      " pan) "
        db      0aah
        db      " indiv "
        db      01bh, 0fdh
        db      "/echo"
        else
        db      084h, 020h, 0b9h, 020h, 09ch, 020h, 091h, 00ah, 01bh, 093h, 02eh, 00ah, 01bh, 050h, 020h, 01bh
        db      07dh, 020h, 081h, 020h, 0aah, 020h, 082h, 027h, 073h, 00ah, 01bh
        db      "> mix "
        db      0a5h, 02eh, 00ah
        db      "PROGRAM "
        db      01bh, 07dh, 020h, 081h, 020h, 0aah, 020h, 08ch, 027h, 073h, 00ah, 01bh
        db      "> mix "
        db      0a5h, 02eh, 00ah, 000h, 01bh, 0c1h
        db      " YES, "
        db      0aeh
        db      " made "
        db      0b0h, 020h, 081h, 020h, 0ebh, 00ah, 01bh, 07eh, 020h, 028h, 094h, 020h, 0abh
        db      " pan) "
        db      0abh
        db      " indiv "
        db      01bh, 0d6h
        db      "/echo"
        endif
        db      00ah
        if      FW_VERSION >= 312
        db      "out/echo "
        db      01bh, 0a1h, 020h, 085h, 020h, 096h, 020h, 0ceh, 020h, 0d1h, 00ah, 081h, 020h, 082h, 020h, 0aeh
        elseif  FW_VERSION = 311
        db      "send "
        db      01bh, 08eh, 020h, 028h, 01bh, 066h, 020h, 0ffh, 029h, 020h, 01bh, 096h, 020h, 0e0h, 00ah, 0aah
        db      " overdubbing "
        db      085h, 020h, 097h, 020h, 0d6h, 020h, 0d9h, 00ah, 081h, 020h, 082h, 020h, 0ach
        else
        db      "send "
        db      01bh, 07eh, 020h, 028h, 01bh, 04eh, 020h, 01bh, 045h, 029h, 020h, 01bh, 073h, 020h, 0d7h, 00ah
        db      0abh
        db      " overdubbing "
        db      085h, 020h, 098h, 020h, 0ceh, 020h, 0e0h, 00ah, 081h, 020h, 082h, 020h, 0b0h
        endif
        db      " real "
        if      FW_VERSION >= 312
        db      0afh, 02eh, 00ah, 000h, 01bh, 023h, 020h, 0b5h, 020h, 09ah, 020h, 0a4h, 020h, 0cdh, 020h, 031h
        db      02eh, 00ah, 000h, 01bh, 023h, 020h, 0b5h
        elseif  FW_VERSION = 311
        db      0afh, 02eh, 00ah, 000h, 01bh, 03ch, 020h, 0b5h, 020h, 095h, 020h, 0a5h, 020h, 0d4h, 020h, 031h
        db      02eh, 00ah, 000h, 01bh, 03ch, 020h, 0b5h
        else
        db      0ach, 02eh, 00ah, 000h, 01bh, 02ch, 020h, 0c7h, 020h, 094h, 020h, 0a4h, 020h, 0cah, 020h, 031h
        db      02eh, 00ah, 000h, 01bh, 02ch, 020h, 0c7h
        endif
        db      " pan "
        if      FW_VERSION >= 312
        db      0a4h, 020h, 0cdh, 020h, 031h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      0a5h, 020h, 0d4h, 020h, 031h, 02eh, 00ah, 000h
        else
        db      0a4h, 020h, 0cah, 020h, 031h, 02eh, 00ah, 000h
        endif
        db      "Delay "
        if      FW_VERSION >= 312
        db      0afh, 020h, 0a4h, 020h, 0cdh
        elseif  FW_VERSION = 311
        db      0afh, 020h, 0a5h, 020h, 0d4h
        else
        db      0ach, 020h, 0a4h, 020h, 0cah
        endif
        db      " 1 (1-1486 ms)."
        if      FW_VERSION >= 312
        db      00ah, 000h, 01bh, 089h, 020h, 0a4h, 020h, 0cdh, 020h, 031h, 02eh, 020h, 08ch, 020h, 085h
        db      " have an"
        db      00ah, 0ddh, 020h, 0e9h, 020h, 081h, 020h, 01bh
        db      "0 two "
        db      01bh, 0f8h, 020h, 01bh, 0f2h, 020h, 01bh, 046h, 00ah, 081h, 020h, 09ah, 020h, 099h, 020h, 0bah
        db      020h, 081h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 01bh, 0afh, 020h, 0a5h, 020h, 0d4h, 020h, 031h, 02eh, 020h, 08dh, 020h, 085h
        db      " have "
        db      01bh, 0ach, 00ah, 0d3h, 020h, 0eah, 020h, 081h, 020h, 01bh, 022h, 020h, 01bh, 0fah
        db      " delays even "
        db      01bh, 053h, 00ah, 081h, 020h, 095h, 020h, 096h, 020h, 0b9h, 020h, 081h
        else
        db      00ah, 000h, 01bh, 08fh, 020h, 0a4h, 020h, 0cah, 020h, 031h, 02eh, 020h, 08dh, 020h, 085h, 020h
        db      01bh, 0e4h, 020h, 01bh, 0c5h, 00ah, 0c9h, 020h, 0efh, 020h, 081h, 020h, 01bh
        db      "7 two "
        db      01bh, 0f8h, 020h, 01bh, 0f6h, 020h, 01bh, 059h, 00ah, 081h, 020h, 094h, 020h, 0a6h, 020h, 0b9h
        db      020h, 081h
        endif
        db      " way down "
        if      FW_VERSION >= 312
        db      0a4h, 020h, 087h, 00ah, 0cdh, 02eh, 00ah, 000h, 01bh, 023h, 020h, 0b5h, 020h, 09ah, 020h, 0a4h
        db      020h, 0cdh, 020h, 032h, 02eh, 00ah, 000h, 01bh, 023h, 020h, 0b5h
        elseif  FW_VERSION = 311
        db      0a5h, 020h, 088h, 00ah, 0d4h, 02eh, 00ah, 000h, 01bh, 03ch, 020h, 0b5h, 020h, 095h, 020h, 0a5h
        db      020h, 0d4h, 020h, 032h, 02eh, 00ah, 000h, 01bh, 03ch, 020h, 0b5h
        else
        db      0a4h, 020h, 086h, 00ah, 0cah, 02eh, 00ah, 000h, 01bh, 02ch, 020h, 0c7h, 020h, 094h, 020h, 0a4h
        db      020h, 0cah, 020h, 032h, 02eh, 00ah, 000h, 01bh, 02ch, 020h, 0c7h
        endif
        db      " pan "
        if      FW_VERSION >= 312
        db      0a4h, 020h, 0cdh, 020h, 032h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      0a5h, 020h, 0d4h, 020h, 032h, 02eh, 00ah, 000h
        else
        db      0a4h, 020h, 0cah, 020h, 032h, 02eh, 00ah, 000h
        endif
        db      "Delay "
        if      FW_VERSION >= 312
        db      0afh, 020h, 0a4h, 020h, 0cdh
        elseif  FW_VERSION = 311
        db      0afh, 020h, 0a5h, 020h, 0d4h
        else
        db      0ach, 020h, 0a4h, 020h, 0cah
        endif
        db      " 2 (1-1486 ms)."
        if      FW_VERSION >= 312
        db      00ah, 000h, 01bh, 089h, 020h, 0a4h, 020h, 0cdh, 020h, 032h, 02eh, 020h, 08ch, 020h, 085h
        db      " have an"
        db      00ah, 0ddh, 020h, 0e9h, 020h, 081h, 020h, 01bh
        db      "0 two "
        db      01bh, 0f8h, 020h, 01bh, 0f2h, 020h, 01bh, 046h, 00ah, 081h, 020h, 09ah, 020h, 099h, 020h, 0bah
        db      020h, 081h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 01bh, 0afh, 020h, 0a5h, 020h, 0d4h, 020h, 032h, 02eh, 020h, 08dh, 020h, 085h
        db      " have "
        db      01bh, 0ach, 00ah, 0d3h, 020h, 0eah, 020h, 081h, 020h, 01bh, 022h, 020h, 01bh, 0fah
        db      " delays even "
        db      01bh, 053h, 00ah, 081h, 020h, 095h, 020h, 096h, 020h, 0b9h, 020h, 081h
        else
        db      00ah, 000h, 01bh, 08fh, 020h, 0a4h, 020h, 0cah, 020h, 032h, 02eh, 020h, 08dh, 020h, 085h, 020h
        db      01bh, 0e4h, 020h, 01bh, 0c5h, 00ah, 0c9h, 020h, 0efh, 020h, 081h, 020h, 01bh
        db      "7 two "
        db      01bh, 0f8h, 020h, 01bh, 0f6h, 020h, 01bh, 059h, 00ah, 081h, 020h, 094h, 020h, 0a6h, 020h, 0b9h
        db      020h, 081h
        endif
        db      " way down "
        if      FW_VERSION >= 312
        db      0a4h, 020h, 087h, 00ah, 0cdh, 02eh, 00ah, 000h, 01bh, 023h, 020h, 0b5h, 020h, 09ah, 020h, 0a4h
        db      020h, 0cdh, 020h, 033h, 02eh, 00ah, 000h, 01bh, 023h, 020h, 0b5h
        elseif  FW_VERSION = 311
        db      0a5h, 020h, 088h, 00ah, 0d4h, 02eh, 00ah, 000h, 01bh, 03ch, 020h, 0b5h, 020h, 095h, 020h, 0a5h
        db      020h, 0d4h, 020h, 033h, 02eh, 00ah, 000h, 01bh, 03ch, 020h, 0b5h
        else
        db      0a4h, 020h, 086h, 00ah, 0cah, 02eh, 00ah, 000h, 01bh, 02ch, 020h, 0c7h, 020h, 094h, 020h, 0a4h
        db      020h, 0cah, 020h, 033h, 02eh, 00ah, 000h, 01bh, 02ch, 020h, 0c7h
        endif
        db      " pan "
        if      FW_VERSION >= 312
        db      0a4h, 020h, 0cdh, 020h, 033h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      0a5h, 020h, 0d4h, 020h, 033h, 02eh, 00ah, 000h
        else
        db      0a4h, 020h, 0cah, 020h, 033h, 02eh, 00ah, 000h
        endif
        db      "Delay "
        if      FW_VERSION >= 312
        db      0afh, 020h, 0a4h, 020h, 0cdh
        elseif  FW_VERSION = 311
        db      0afh, 020h, 0a5h, 020h, 0d4h
        else
        db      0ach, 020h, 0a4h, 020h, 0cah
        endif
        db      " 3 (1-1486 ms)."
        if      FW_VERSION >= 312
        db      00ah, 000h, 01bh, 089h, 020h, 0a4h, 020h, 0cdh, 020h, 033h, 02eh, 020h, 08ch, 020h, 085h
        db      " have an"
        db      00ah, 0ddh, 020h, 0e9h, 020h, 081h, 020h, 01bh
        db      "0 two "
        db      01bh, 0f8h, 020h, 01bh, 0f2h, 020h, 01bh, 046h, 00ah, 081h, 020h, 09ah, 020h, 099h, 020h, 0bah
        db      020h, 081h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 01bh, 0afh, 020h, 0a5h, 020h, 0d4h, 020h, 033h, 02eh, 020h, 08dh, 020h, 085h
        db      " have "
        db      01bh, 0ach, 00ah, 0d3h, 020h, 0eah, 020h, 081h, 020h, 01bh, 022h, 020h, 01bh, 0fah
        db      " delays even "
        db      01bh, 053h, 00ah, 081h, 020h, 095h, 020h, 096h, 020h, 0b9h, 020h, 081h
        else
        db      00ah, 000h, 01bh, 08fh, 020h, 0a4h, 020h, 0cah, 020h, 033h, 02eh, 020h, 08dh, 020h, 085h, 020h
        db      01bh, 0e4h, 020h, 01bh, 0c5h, 00ah, 0c9h, 020h, 0efh, 020h, 081h, 020h, 01bh
        db      "7 two "
        db      01bh, 0f8h, 020h, 01bh, 0f6h, 020h, 01bh, 059h, 00ah, 081h, 020h, 094h, 020h, 0a6h, 020h, 0b9h
        db      020h, 081h
        endif
        db      " way down "
        if      FW_VERSION >= 312
        db      0a4h, 020h, 087h, 00ah, 0cdh, 02eh, 00ah, 000h, 08eh, 020h, 01bh, 013h, 020h, 090h, 020h, 028h
        db      01bh, 03ah, 020h, 0feh, 029h, 02eh, 00ah
        db      "Fields "
        db      0e0h, 020h, 01bh, 0dch, 020h, 0fch, 020h, 084h, 020h, 081h, 020h, 08dh, 00ah, 090h, 02eh, 00ah
        db      000h, 089h, 020h, 031h, 036h, 02dh, 01bh, 083h, 020h, 0a1h, 020h, 0a4h, 020h, 087h, 020h, 090h
        db      02eh, 00ah, 01bh, 043h, 020h, 0c3h, 03ah, 020h, 08bh, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0c7h
        db      020h, 0c5h, 020h, 0a1h, 02ch, 00ah, 097h, 020h, 0d0h, 02eh, 00ah, 000h
        db      "Each "
        db      09eh, 020h, 081h, 020h, 036h, 034h, 020h, 086h, 020h, 098h, 020h, 01bh, 03fh, 020h, 028h, 033h
        db      035h, 02dh, 00ah, 039h, 038h, 029h, 020h, 01bh, 0b2h, 020h, 061h, 020h, 01bh, 0a4h, 020h, 08ah
        db      020h, 0cfh, 02eh, 00ah, 08eh, 020h, 061h, 020h, 098h, 020h, 083h, 020h, 0bbh, 020h, 01bh, 09fh
        db      020h, 0f7h, 020h, 061h, 00ah, 01bh, 025h, 02ch, 020h, 097h
        elseif  FW_VERSION = 311
        db      0a5h, 020h, 088h, 00ah, 0d4h, 02eh, 00ah, 000h, 092h, 020h, 061h, 020h, 083h, 020h, 01bh, 0a3h
        db      020h, 084h, 020h, 093h, 020h, 01bh, 0ach, 020h, 01bh, 008h, 02eh, 00ah, 000h, 08fh, 020h, 01bh
        db      01ah, 020h, 090h, 020h, 028h, 031h, 02dh, 032h, 034h, 029h, 02eh, 00ah, 01bh, 0e0h, 020h, 090h
        db      020h, 096h, 020h, 061h, 020h, 01bh, 01fh, 020h, 022h, 01bh
        db      "W kit,"
        db      022h, 00ah, 09fh, 020h, 061h, 020h, 01bh, 056h, 020h, 01bh, 00fh, 020h, 09eh, 020h, 081h, 020h
        db      036h, 034h, 00ah, 0c9h, 020h, 09eh, 020h, 09bh, 020h, 0f9h, 020h, 084h, 020h, 0a1h, 00ah, 08eh
        db      020h, 08ah, 020h, 01bh, 0fbh, 020h, 01bh, 0cfh
        db      ". All"
        db      00ah, 0c9h, 020h, 0edh
        db      " apply "
        db      0ffh, 020h, 084h, 020h, 081h, 00ah, 08ch, 020h, 090h, 02eh, 00ah, 000h, 08bh, 020h, 031h, 036h
        db      02dh, 01bh, 023h, 020h, 0abh, 020h, 0a5h, 020h, 088h, 020h, 090h, 02eh, 00ah, 01bh, 04bh, 020h
        db      0c7h, 03ah, 020h, 089h, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0ceh, 020h, 0d0h, 020h, 0abh, 02ch
        db      00ah, 09ch, 020h, 0ddh, 02eh, 00ah, 000h, 01bh, 0e0h, 020h, 09eh, 020h, 081h, 020h, 036h, 034h
        db      020h, 086h, 020h, 09bh, 020h, 0f9h, 020h, 028h, 033h, 035h, 02dh, 00ah, 039h, 038h, 029h, 020h
        db      01bh, 07bh, 020h, 061h, 020h, 01bh, 056h, 020h, 08ah, 020h, 0c4h, 02eh, 00ah, 08fh, 020h, 061h
        db      020h, 09bh, 020h, 083h, 020h, 0b4h, 020h, 01bh, 0d0h, 020h, 01bh, 036h, 020h, 061h, 00ah, 01bh
        db      033h, 02ch, 020h, 09ch
        else
        db      0a4h, 020h, 086h, 00ah, 0cah, 02eh, 00ah, 000h, 090h, 020h, 061h, 020h, 083h, 020h, 01bh, 082h
        db      020h, 084h, 020h, 092h, 020h, 01bh, 0c5h, 020h, 0fdh, 02eh, 00ah, 000h, 08fh, 020h, 01bh, 004h
        db      020h, 08ch, 020h, 028h, 031h, 02dh, 032h, 034h, 029h, 02eh, 00ah, 01bh, 0bch, 020h, 08ch, 020h
        db      0a6h, 020h, 061h, 020h, 01bh, 011h, 020h, 022h, 01bh, 05ch
        db      " kit,"
        db      022h, 00ah, 09eh, 020h, 061h, 020h, 01bh, 03eh, 020h, 01bh, 018h, 020h, 09dh, 020h, 081h, 020h
        db      036h, 034h, 00ah, 0d0h, 020h, 09dh, 020h, 097h, 020h, 0f1h, 020h, 084h, 020h, 0b2h, 00ah, 091h
        db      020h, 08bh, 020h, 01bh, 0e1h, 020h, 01bh, 0c0h
        db      ". All"
        db      00ah, 0d0h, 020h, 0e4h, 020h, 01bh, 0cdh, 020h, 01bh, 045h, 020h, 084h, 020h, 081h, 00ah, 08ah
        db      020h, 08ch, 02eh, 00ah, 000h, 089h, 020h, 031h, 036h, 02dh, 01bh, 013h, 020h, 0adh, 020h, 0a4h
        db      020h, 086h, 020h, 08ch, 02eh, 00ah, 01bh, 03ch, 020h, 0beh, 03ah, 020h, 088h, 020h, 02bh, 02fh
        db      02dh, 02ch, 020h, 0c3h, 020h, 0c4h, 020h, 0adh, 02ch, 00ah, 09ah, 020h, 0d4h, 02eh, 00ah, 000h
        db      01bh, 0bch, 020h, 09dh, 020h, 081h, 020h, 036h, 034h, 020h, 08eh, 020h, 097h, 020h, 0f1h, 020h
        db      028h, 033h, 035h, 02dh, 00ah, 039h, 038h, 029h, 020h, 01bh, 084h, 020h, 061h, 020h, 01bh, 03eh
        db      020h, 08bh, 020h, 0cdh, 02eh, 00ah, 08fh, 020h, 061h, 020h, 097h, 020h, 083h, 020h, 0b1h, 020h
        db      01bh, 0fbh, 020h, 01bh, 029h, 020h, 061h, 00ah, 01bh, 023h, 02ch, 020h, 09ah
        endif
        db      " assign "
        if      FW_VERSION >= 312
        db      01bh, 087h, 020h, 08ah, 020h, 0e0h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 035h, 020h, 0d6h, 020h
        db      08ah, 020h, 0a4h, 020h, 087h, 00ah, 098h, 020h, 083h, 02fh, 01bh, 025h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      01bh, 0c5h, 020h, 08ah, 020h, 08eh, 020h, 01bh, 050h, 00ah, 0edh, 02eh, 00ah, 000h, 08bh, 020h
        db      01bh, 026h, 020h, 0cdh, 020h, 08ah, 020h, 0a5h, 020h, 088h, 00ah, 09bh, 020h, 083h, 02fh, 01bh
        db      033h, 02eh, 00ah, 000h
        else
        db      01bh, 0a9h, 020h, 08bh, 020h, 091h, 020h, 01bh, 03fh, 00ah, 0e4h, 02eh, 00ah, 000h, 089h, 020h
        db      01bh, 010h, 020h, 0cch, 020h, 08bh, 020h, 0a4h, 020h, 086h, 00ah, 097h, 020h, 083h, 02fh, 01bh
        db      023h, 02eh, 00ah, 000h
        endif
        db      "NORMAL: 1 "
        if      FW_VERSION >= 312
        db      08ah, 020h, 01bh, 034h, 02eh, 00ah
        elseif  FW_VERSION = 311
        db      08ah, 020h, 01bh, 027h, 02eh, 00ah
        else
        db      08bh, 020h, 01bh, 015h, 02eh, 00ah
        endif
        db      "SIMULT: 2 "
        if      FW_VERSION >= 312
        db      01bh, 04fh, 020h, 0bdh, 020h, 0ach, 00ah, 01bh, 00fh, 02eh, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 06ch, 020h, 0a1h, 020h, 0b0h, 00ah, 01bh, 029h, 02eh, 00ah
        else
        db      01bh, 05dh, 020h, 0b2h, 020h, 0afh, 00ah, 01bh, 019h, 02eh, 00ah
        endif
        db      "VEL SW: 1 "
        if      FW_VERSION >= 312
        db      09eh, 020h, 033h, 020h, 0bdh, 020h, 01bh, 034h, 020h, 01bh, 07bh, 00ah, 0e9h, 020h, 092h, 02eh
        elseif  FW_VERSION = 311
        db      09eh, 020h, 033h, 020h, 0a1h, 020h, 01bh, 027h, 020h, 01bh, 07eh, 00ah, 0eah, 020h, 098h, 02eh
        else
        db      09dh, 020h, 033h, 020h, 0b2h, 020h, 01bh, 015h, 020h, 01bh, 06eh, 00ah, 0efh, 020h, 096h, 02eh
        endif
        db      00ah
        db      "DCY SW: 1 "
        if      FW_VERSION >= 312
        db      09eh, 020h, 033h, 020h, 0bdh, 020h, 01bh, 034h, 020h, 01bh, 07bh, 00ah, 0e9h, 020h, 0a9h, 020h
        db      0deh, 020h, 0ech, 020h, 0f5h, 020h, 0a0h, 02eh, 00ah, 000h, 01bh, 060h, 020h, 092h, 020h, 028h
        db      0adh, 020h, 0deh
        elseif  FW_VERSION = 311
        db      09eh, 020h, 033h, 020h, 0a1h, 020h, 01bh, 027h, 020h, 01bh, 07eh, 00ah, 0eah, 020h, 0adh, 020h
        db      0f2h, 020h, 01bh, 002h, 020h, 01bh, 00eh, 020h, 0a4h, 02eh, 00ah, 000h, 01bh, 078h, 020h, 098h
        db      020h, 028h, 0aah, 020h, 0f2h
        else
        db      09dh, 020h, 033h, 020h, 0b2h, 020h, 01bh, 015h, 020h, 01bh, 06eh, 00ah, 0efh, 020h, 0aah, 020h
        db      0e6h, 020h, 0f0h, 020h, 01bh, 000h, 020h, 0a1h, 02eh, 00ah, 000h, 01bh, 0c1h, 020h, 096h, 020h
        db      028h, 0abh, 020h, 0e6h
        endif
        db      " Var "
        if      FW_VERSION >= 312
        db      0f5h, 020h, 01bh, 046h, 020h, 01bh, 0c8h, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 00eh, 020h, 01bh, 053h, 020h, 01bh, 0e6h, 00ah
        else
        db      01bh, 000h, 020h, 01bh, 059h, 020h, 01bh, 0b4h, 00ah
        endif
        db      "= DCY SW) "
        if      FW_VERSION >= 312
        db      01bh, 078h, 020h, 087h, 020h, 0a0h
        elseif  FW_VERSION = 311
        db      01bh, 099h, 020h, 088h, 020h, 0a4h
        else
        db      01bh, 074h, 020h, 086h, 020h, 0a1h
        endif
        db      " but "
        if      FW_VERSION >= 312
        db      099h, 00ah
        elseif  FW_VERSION = 311
        db      096h, 00ah
        else
        db      0a6h, 00ah
        endif
        db      "less "
        if      FW_VERSION >= 312
        db      01bh, 028h, 020h, 0adh
        db      " equal "
        db      084h, 020h, 081h, 020h, 0a0h, 020h, 0e0h, 02ch, 00ah, 081h, 020h, 098h, 020h, 083h, 020h, 084h
        db      020h, 081h, 020h, 01bh, 016h, 020h, 085h, 020h, 0ach, 00ah, 01bh, 072h, 020h, 09eh, 020h, 081h
        db      020h, 01bh, 00ah, 020h, 0cch, 02eh, 00ah, 000h, 08ch, 020h, 098h, 020h, 083h, 020h, 085h, 020h
        db      0ach, 020h, 01bh, 072h, 020h, 09eh, 00ah, 081h, 020h, 01bh, 00ah, 020h, 0cch, 020h, 01bh, 046h
        db      020h, 092h, 020h, 028h, 0adh, 020h, 0deh
        elseif  FW_VERSION = 311
        db      01bh, 041h, 020h, 0aah, 020h, 01bh, 0eeh, 020h, 084h, 020h, 081h, 020h, 0a4h, 020h, 0edh, 02ch
        db      00ah, 081h, 020h, 09bh, 020h, 083h, 020h, 084h, 020h, 081h, 020h, 0dbh, 020h, 085h, 020h, 0b0h
        db      00ah, 01bh, 09ch, 020h, 09eh, 020h, 081h, 020h, 01bh, 00ah, 020h, 0d1h, 02eh, 00ah, 000h, 08dh
        db      020h, 09bh, 020h, 083h, 020h, 085h, 020h, 0b0h, 020h, 01bh, 09ch, 020h, 09eh, 00ah, 081h, 020h
        db      01bh, 00ah, 020h, 0d1h, 020h, 01bh, 053h, 020h, 098h, 020h, 028h, 0aah, 020h, 0f2h
        else
        db      01bh, 0bbh, 020h, 0abh, 020h, 01bh, 0ceh, 020h, 084h, 020h, 081h, 020h, 0a1h, 020h, 0e4h, 02ch
        db      00ah, 081h, 020h, 097h, 020h, 083h, 020h, 084h, 020h, 081h, 020h, 0d1h, 020h, 085h, 020h, 0afh
        db      00ah, 01bh, 067h, 020h, 09dh, 020h, 081h, 020h, 0ffh, 020h, 0d5h, 02eh, 00ah, 000h, 08dh, 020h
        db      097h, 020h, 083h, 020h, 085h, 020h, 0afh, 020h, 01bh, 067h, 020h, 09dh, 00ah, 081h, 020h, 0ffh
        db      020h, 0d5h, 020h, 01bh, 059h, 020h, 096h, 020h, 028h, 0abh, 020h, 0e6h
        endif
        db      " Var"
        if      FW_VERSION >= 312
        db      00ah, 0f5h, 020h, 01bh, 046h, 020h, 01bh, 0c8h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 00eh, 020h, 01bh, 053h, 020h, 01bh, 0e6h
        else
        db      00ah, 01bh, 000h, 020h, 01bh, 059h, 020h, 01bh, 0b4h
        endif
        db      " = DCY SW) "
        if      FW_VERSION >= 312
        db      01bh, 078h, 020h, 081h, 00ah, 0a0h, 020h, 0e9h, 020h, 081h, 020h, 01bh, 014h
        db      " but "
        db      099h
        elseif  FW_VERSION = 311
        db      01bh, 099h, 020h, 081h, 00ah, 0a4h, 020h, 0eah, 020h, 081h, 020h, 01bh
        db      "4 but "
        db      096h
        else
        db      01bh, 074h, 020h, 081h, 00ah, 0a1h, 020h, 0efh, 020h, 081h, 020h, 01bh
        db      "1 but "
        db      0a6h
        endif
        db      " less "
        if      FW_VERSION >= 312
        db      01bh, 028h, 020h, 0adh, 00ah
        db      "equal "
        db      084h, 020h, 081h, 020h, 0a0h, 020h, 01bh, 0b5h, 020h, 0e0h, 00ah, 0f1h, 02eh, 00ah, 000h, 01bh
        db      060h, 020h, 092h, 020h, 028h, 0adh, 020h, 0deh
        elseif  FW_VERSION = 311
        db      01bh, 041h, 020h, 0aah, 00ah, 01bh, 0eeh, 020h, 084h, 020h, 081h, 020h, 0a4h, 020h, 01bh, 0cah
        db      020h, 0edh, 00ah, 0f5h, 02eh, 00ah, 000h, 01bh, 078h, 020h, 098h, 020h, 028h, 0aah, 020h, 0f2h
        else
        db      01bh, 0bbh, 020h, 0abh, 00ah, 01bh, 0ceh, 020h, 084h, 020h, 081h, 020h, 0a1h, 020h, 01bh, 098h
        db      020h, 0e4h, 00ah, 0dch, 02eh, 00ah, 000h, 01bh, 0c1h, 020h, 096h, 020h, 028h, 0abh, 020h, 0e6h
        endif
        db      " Var "
        if      FW_VERSION >= 312
        db      0f5h, 020h, 01bh, 046h, 020h, 01bh, 0c8h, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 00eh, 020h, 01bh, 053h, 020h, 01bh, 0e6h, 00ah
        else
        db      01bh, 000h, 020h, 01bh, 059h, 020h, 01bh, 0b4h, 00ah
        endif
        db      "= DCY SW) "
        if      FW_VERSION >= 312
        db      01bh, 078h, 020h, 087h, 020h, 0a0h, 02ch, 020h, 081h, 020h, 098h, 00ah, 083h, 020h, 084h, 020h
        db      081h, 020h, 01bh, 016h, 020h, 085h, 020h, 0ach, 020h, 01bh, 072h, 00ah, 09eh, 020h, 081h, 020h
        db      01bh, 00ah, 020h, 0cch, 02eh, 00ah, 000h, 08ch, 020h, 098h, 020h, 083h, 020h, 085h, 020h, 0ach
        db      020h, 01bh, 072h, 020h, 09eh, 00ah, 081h, 020h, 01bh, 00ah, 020h, 0cch, 020h, 01bh, 046h, 020h
        db      092h, 020h, 028h, 0adh, 020h, 0deh
        elseif  FW_VERSION = 311
        db      01bh, 099h, 020h, 088h, 020h, 0a4h, 02ch, 020h, 081h, 020h, 09bh, 00ah, 083h, 020h, 084h, 020h
        db      081h, 020h, 0dbh, 020h, 085h, 020h, 0b0h, 020h, 01bh, 09ch, 00ah, 09eh, 020h, 081h, 020h, 01bh
        db      00ah, 020h, 0d1h, 02eh, 00ah, 000h, 08dh, 020h, 09bh, 020h, 083h, 020h, 085h, 020h, 0b0h, 020h
        db      01bh, 09ch, 020h, 09eh, 00ah, 081h, 020h, 01bh, 00ah, 020h, 0d1h, 020h, 01bh, 053h, 020h, 098h
        db      020h, 028h, 0aah, 020h, 0f2h
        else
        db      01bh, 074h, 020h, 086h, 020h, 0a1h, 02ch, 020h, 081h, 020h, 097h, 00ah, 083h, 020h, 084h, 020h
        db      081h, 020h, 0d1h, 020h, 085h, 020h, 0afh, 020h, 01bh, 067h, 00ah, 09dh, 020h, 081h, 020h, 0ffh
        db      020h, 0d5h, 02eh, 00ah, 000h, 08dh, 020h, 097h, 020h, 083h, 020h, 085h, 020h, 0afh, 020h, 01bh
        db      067h, 020h, 09dh, 00ah, 081h, 020h, 0ffh, 020h, 0d5h, 020h, 01bh, 059h, 020h, 096h, 020h, 028h
        db      0abh, 020h, 0e6h
        endif
        db      " Var"
        if      FW_VERSION >= 312
        db      00ah, 0f5h, 020h, 01bh, 046h, 020h, 01bh, 0c8h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 00eh, 020h, 01bh, 053h, 020h, 01bh, 0e6h
        else
        db      00ah, 01bh, 000h, 020h, 01bh, 059h, 020h, 01bh, 0b4h
        endif
        db      " = DCY SW) "
        if      FW_VERSION >= 312
        db      01bh, 078h, 020h, 081h, 00ah, 0a0h, 020h, 0e9h, 020h, 081h, 020h, 01bh, 014h, 02eh, 00ah, 000h
        db      089h, 020h, 0a9h, 020h, 090h, 020h, 028h, 031h, 02dh, 032h, 034h, 029h, 02eh, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 099h, 020h, 081h, 00ah, 0a4h, 020h, 0eah, 020h, 081h, 020h, 01bh, 034h, 02eh, 00ah, 000h
        db      08bh, 020h, 0adh, 020h, 090h, 020h, 028h, 031h, 02dh, 032h, 034h, 029h, 02eh, 00ah
        else
        db      01bh, 074h, 020h, 081h, 00ah, 0a1h, 020h, 0efh, 020h, 081h, 020h, 01bh, 031h, 02eh, 00ah, 000h
        db      089h, 020h, 0aah, 020h, 08ch, 020h, 028h, 031h, 02dh, 032h, 034h, 029h, 02eh, 00ah
        endif
        db      "All "
        if      FW_VERSION >= 312
        db      0a5h, 020h, 0e0h, 020h, 01bh, 0dch, 020h, 0fch, 020h, 084h, 020h, 087h, 00ah, 090h, 02eh, 00ah
        db      000h, 089h, 020h, 0a9h, 020h, 098h, 020h, 083h, 020h, 028h, 033h, 035h, 02dh, 039h, 038h, 029h
        db      02eh, 00ah
        elseif  FW_VERSION = 311
        db      0a3h, 020h, 0edh
        db      " apply "
        db      0ffh, 020h, 084h, 020h, 088h, 00ah, 090h, 02eh, 00ah, 000h, 08bh, 020h, 0adh, 020h, 09bh, 020h
        db      083h, 020h, 028h, 033h, 035h, 02dh, 039h, 038h, 029h, 02eh, 00ah
        else
        db      0a5h, 020h, 0e4h, 020h, 01bh, 0cdh, 020h, 01bh, 045h, 020h, 084h, 020h, 086h, 00ah, 08ch, 02eh
        db      00ah, 000h, 089h, 020h, 0aah, 020h, 097h, 020h, 083h, 020h, 028h, 033h, 035h, 02dh, 039h, 038h
        db      029h, 02eh, 00ah
        endif
        db      "All "
        if      FW_VERSION >= 312
        db      0a5h, 020h, 0e0h, 020h, 01bh, 0dch, 020h, 0fch, 020h, 084h, 020h, 087h, 020h, 098h, 00ah, 083h
        db      02eh, 020h, 089h, 020h, 01bh, 025h, 020h, 01bh, 035h, 020h, 0d6h, 020h, 084h, 00ah, 0f1h, 020h
        db      099h, 020h, 01bh, 073h, 020h, 084h, 020h, 081h, 020h, 01bh, 016h, 02eh, 00ah, 09fh, 020h, 061h
        db      020h, 01bh, 025h, 020h, 084h, 020h, 09bh, 020h, 081h, 020h, 098h, 020h, 083h, 02eh, 00ah, 000h
        db      089h, 020h, 09ah, 020h, 01bh, 001h, 020h, 01bh, 005h, 020h, 0afh, 020h, 0a4h, 020h, 081h, 00ah
        db      08dh, 020h, 098h, 020h, 083h, 02fh, 01bh, 025h, 02eh, 00ah, 01bh, 0a3h
        db      ": 0-5000 ms."
        db      00ah, 000h, 01bh, 0e0h, 020h, 081h, 020h, 01bh, 005h, 020h, 0afh, 020h, 09eh
        elseif  FW_VERSION = 311
        db      0a3h, 020h, 0edh
        db      " apply "
        db      0ffh, 020h, 084h, 020h, 088h, 020h, 09bh, 00ah, 083h, 02eh, 020h, 08bh, 020h, 01bh, 033h, 020h
        db      01bh, 026h, 020h, 0cdh, 020h, 084h, 00ah, 0f5h, 020h, 096h, 020h, 01bh, 00dh, 020h, 084h, 020h
        db      081h, 020h, 0dbh, 02eh, 00ah, 092h, 020h, 061h, 020h, 01bh, 033h, 020h, 084h, 020h, 093h, 020h
        db      081h, 020h, 09bh, 020h, 083h, 02eh, 00ah, 000h, 08bh, 020h, 095h, 020h, 01bh, 012h, 020h, 01bh
        db      00ch, 020h, 0afh, 020h, 0a5h, 020h, 081h, 00ah, 08ch, 020h, 09bh, 020h, 083h, 02fh, 01bh, 033h
        db      02eh, 00ah, 01bh, 095h
        db      ": 0-5000 ms."
        db      00ah, 000h, 01bh, 0f9h, 020h, 081h, 020h, 01bh, 00ch, 020h, 0afh, 020h, 09eh
        else
        db      0a5h, 020h, 0e4h, 020h, 01bh, 0cdh, 020h, 01bh, 045h, 020h, 084h, 020h, 086h, 020h, 097h, 00ah
        db      083h, 02eh, 020h, 089h, 020h, 01bh, 023h, 020h, 01bh, 010h, 020h, 0cch, 020h, 084h, 00ah, 0dch
        db      020h, 0a6h, 020h, 01bh, 012h, 020h, 084h, 020h, 081h, 020h, 0d1h, 02eh, 00ah, 090h, 020h, 061h
        db      020h, 01bh, 023h, 020h, 084h, 020h, 092h, 020h, 081h, 020h, 097h, 020h, 083h, 02eh, 00ah, 000h
        db      089h, 020h, 094h, 020h, 01bh, 00eh, 020h, 0fch, 020h, 0ach, 020h, 0a4h, 020h, 081h, 00ah, 08ah
        db      020h, 097h, 020h, 083h, 02fh, 01bh, 023h, 02eh, 00ah, 01bh
        db      "z: 0-5000 ms."
        db      00ah, 000h, 01bh, 0dbh, 020h, 081h, 020h, 0fch, 020h, 0ach, 020h, 09dh
        endif
        db      " softly-"
        if      FW_VERSION >= 312
        db      00ah, 0e6h, 020h, 0aah, 02eh, 020h, 01bh, 060h, 020h, 092h, 020h, 03dh, 020h, 031h, 02ch, 020h
        db      087h, 00ah
        elseif  FW_VERSION = 311
        db      00ah, 0f4h, 020h, 0aeh, 02eh, 020h, 01bh, 078h, 020h, 098h, 020h, 03dh, 020h, 031h, 02ch, 020h
        db      088h, 00ah
        else
        db      00ah, 0ech, 020h, 0a8h, 02eh, 020h, 01bh, 0c1h, 020h, 096h, 020h, 03dh, 020h, 031h, 02ch, 020h
        db      086h, 00ah
        endif
        db      "msec "
        if      FW_VERSION >= 312
        db      0a0h, 020h, 099h, 020h, 01bh, 0dah, 020h, 084h, 020h, 01bh, 005h, 020h, 0afh, 03bh, 020h, 01bh
        db      046h, 00ah, 092h, 020h, 03dh, 020h, 031h, 032h, 037h, 02ch, 020h, 01bh, 088h, 020h, 0afh, 020h
        db      099h, 020h, 01bh, 0dah, 02eh, 00ah, 01bh, 0bah, 020h, 0aeh, 020h, 01bh
        db      "d add "
        db      0afh, 00ah, 01bh, 049h, 02eh, 020h, 0a3h, 020h, 030h, 020h, 0a4h, 020h, 01bh, 088h, 020h, 0ddh
        db      02eh, 00ah, 000h, 01bh, 0f7h, 020h, 01bh, 05ah, 020h, 028h, 02dh, 032h, 034h, 030h, 020h, 084h
        elseif  FW_VERSION = 311
        db      0a4h, 020h, 096h, 020h, 01bh, 0ffh, 020h, 084h, 020h, 01bh, 00ch, 020h, 0afh, 03bh, 020h, 01bh
        db      053h, 00ah, 098h, 020h, 03dh, 020h, 031h, 032h, 037h, 02ch, 020h, 01bh, 09fh, 020h, 0afh, 020h
        db      096h, 020h, 01bh, 0ffh, 02eh, 00ah, 01bh, 0deh, 020h, 0ach, 020h, 01bh
        db      "Q add "
        db      0afh, 00ah, 01bh, 05eh, 02eh, 020h, 0a6h, 020h, 030h, 020h, 0a5h, 020h, 01bh, 09fh, 020h, 0d3h
        db      02eh, 00ah, 000h
        db      "Sets "
        db      01bh, 071h, 020h, 028h, 02dh, 032h, 034h, 030h, 020h, 084h
        else
        db      0a1h, 020h, 0a6h, 020h, 01bh, 0d3h, 020h, 084h, 020h, 0fch, 020h, 0ach, 03bh, 020h, 01bh, 059h
        db      00ah, 096h, 020h, 03dh, 020h, 031h, 032h, 037h, 02ch, 020h, 01bh, 097h, 020h, 0ach, 020h, 0a6h
        db      020h, 01bh, 0d3h, 02eh, 00ah, 01bh, 0beh, 020h, 0b0h, 020h, 01bh
        db      "F add "
        db      0ach, 00ah, 01bh, 054h, 02eh, 020h, 0a2h, 020h, 030h, 020h, 0a4h, 020h, 01bh, 097h, 020h, 0c9h
        db      02eh, 00ah, 000h
        db      "Sets "
        db      01bh, 063h, 020h, 028h, 02dh, 032h, 034h, 030h, 020h, 084h
        endif
        db      " 240 tenths "
        if      FW_VERSION >= 311
        db      09eh, 020h, 061h, 00ah
        else
        db      09dh, 020h, 061h, 00ah
        endif
        db      "semitone). "
        if      FW_VERSION >= 312
        db      09fh, 020h, 022h, 02eh, 022h, 020h, 084h
        elseif  FW_VERSION = 311
        db      092h, 020h, 022h, 02eh, 022h, 020h, 084h
        else
        db      090h, 020h, 022h, 02eh, 022h, 020h, 084h
        endif
        db      " toggle "
        if      FW_VERSION >= 312
        db      081h, 00ah, 083h, 020h, 01bh, 064h, 020h, 02bh, 020h, 091h, 020h, 02dh, 020h, 01bh, 0f0h, 02eh
        db      00ah, 000h, 089h, 020h, 09ah, 020h, 01bh, 001h, 020h, 0f5h, 020h, 0afh, 020h, 0a4h, 020h, 081h
        db      00ah, 08dh, 020h, 098h, 020h, 083h, 02fh, 01bh, 025h, 02eh, 00ah, 01bh, 0a3h
        db      ": 0-5000 ms."
        elseif  FW_VERSION = 311
        db      081h, 00ah, 083h, 020h, 01bh, 051h, 020h, 02bh, 020h, 08eh
        db      " - values."
        db      00ah, 000h, 08bh, 020h, 095h, 020h, 01bh, 012h, 020h, 01bh, 00eh, 020h, 0afh, 020h, 0a5h, 020h
        db      081h, 00ah, 08ch, 020h, 09bh, 020h, 083h, 02fh, 01bh, 033h, 02eh, 00ah, 01bh, 095h
        db      ": 0-5000 ms."
        else
        db      081h, 00ah, 083h, 020h, 01bh, 046h, 020h, 02bh, 020h, 091h
        db      " - values."
        db      00ah, 000h, 089h, 020h, 094h, 020h, 01bh, 00eh, 020h, 01bh, 000h, 020h, 0ach, 020h, 0a4h, 020h
        db      081h, 00ah, 08ah, 020h, 097h, 020h, 083h, 02fh, 01bh, 023h, 02eh, 00ah, 01bh
        db      "z: 0-5000 ms."
        endif
        db      00ah, 000h
        db      "Makes softly-"
        if      FW_VERSION >= 312
        db      0e6h, 020h, 0aah
        db      " begin later"
        db      00ah, 0aeh, 020h, 081h, 020h, 08ah, 02eh, 020h, 01bh, 060h, 020h, 092h, 020h, 03dh, 020h, 031h
        db      02ch, 020h, 087h, 00ah
        elseif  FW_VERSION = 311
        db      0f4h, 020h, 0aeh
        db      " begin later"
        db      00ah, 0ach, 020h, 081h, 020h, 08ah, 02eh, 020h, 01bh, 078h, 020h, 098h, 020h, 03dh, 020h, 031h
        db      02ch, 020h, 088h, 00ah
        else
        db      0ech, 020h, 0a8h
        db      " begin "
        db      01bh, 0dch, 00ah, 0b0h, 020h, 081h, 020h, 08bh, 02eh, 020h, 01bh, 0c1h, 020h, 096h, 020h, 03dh
        db      020h, 031h, 02ch, 020h, 086h, 00ah
        endif
        db      "msec "
        if      FW_VERSION >= 312
        db      0a0h, 020h, 099h, 020h, 01bh, 0dah, 020h, 084h
        elseif  FW_VERSION = 311
        db      0a4h, 020h, 096h, 020h, 01bh, 0ffh, 020h, 084h
        else
        db      0a1h, 020h, 0a6h, 020h, 01bh, 0d3h, 020h, 084h
        endif
        db      " SoftStart; "
        if      FW_VERSION >= 312
        db      01bh, 046h, 00ah, 092h, 020h, 03dh, 020h, 031h, 032h, 037h, 02ch, 020h, 01bh, 088h, 020h, 0afh
        db      020h, 099h, 020h, 01bh, 0dah, 02eh, 00ah, 01bh, 0bah, 020h, 0aeh, 020h, 01bh
        db      "d add "
        db      0afh, 00ah, 01bh, 049h, 02eh, 020h, 0a3h, 020h, 030h, 020h, 0a4h, 020h, 01bh, 088h, 020h, 0ddh
        elseif  FW_VERSION = 311
        db      01bh, 053h, 00ah, 098h, 020h, 03dh, 020h, 031h, 032h, 037h, 02ch, 020h, 01bh, 09fh, 020h, 0afh
        db      020h, 096h, 020h, 01bh, 0ffh, 02eh, 00ah, 01bh, 0deh, 020h, 0ach, 020h, 01bh
        db      "Q add "
        db      0afh, 00ah, 01bh, 05eh, 02eh, 020h, 0a6h, 020h, 030h, 020h, 0a5h, 020h, 01bh, 09fh, 020h, 0d3h
        else
        db      01bh, 059h, 00ah, 096h, 020h, 03dh, 020h, 031h, 032h, 037h, 02ch, 020h, 01bh, 097h, 020h, 0ach
        db      020h, 0a6h, 020h, 01bh, 0d3h, 02eh, 00ah, 01bh, 0beh, 020h, 0b0h, 020h, 01bh
        db      "F add "
        db      0ach, 00ah, 01bh, 054h, 02eh, 020h, 0a2h, 020h, 030h, 020h, 0a4h, 020h, 01bh, 097h, 020h, 0c9h
        endif
        db      02eh, 00ah, 000h
        db      "POLY: "
        if      FW_VERSION >= 312
        db      01bh, 08fh, 020h, 01bh
        db      "4 overlap "
        db      01bh, 018h, 00ah, 01bh
        db      "O voices"
        elseif  FW_VERSION = 311
        db      01bh, 0abh, 020h, 01bh
        db      "' overlap "
        db      01bh, 030h, 00ah, 01bh
        db      "l voices"
        else
        db      01bh, 091h, 020h, 01bh, 015h
        db      " overlap "
        db      01bh, 0d5h, 00ah, 01bh
        db      "] voices"
        endif
        db      00ah
        db      "MONO: "
        if      FW_VERSION >= 312
        db      01bh, 08fh, 020h, 01bh
        db      "4 restart "
        db      01bh, 093h
        db      " voice"
        db      00ah, 028h, 01bh, 088h
        elseif  FW_VERSION = 311
        db      01bh, 0abh, 020h, 01bh
        db      "' restart "
        db      01bh, 0e8h
        db      " voice"
        db      00ah, 028h, 01bh, 09fh
        else
        db      01bh, 091h, 020h, 01bh, 015h
        db      " restart same voice"
        db      00ah, 028h, 01bh, 097h
        endif
        db      " overlap)."
        db      00ah
        db      "NOTE "
        if      FW_VERSION >= 312
        db      01bh, 012h, 03ah, 020h, 0ach
        elseif  FW_VERSION = 311
        db      01bh, 032h, 03ah, 020h, 0b0h
        else
        db      01bh, 025h, 03ah, 020h, 0afh
        endif
        db      " stops "
        if      FW_VERSION >= 312
        db      0b6h, 020h, 01bh, 025h, 020h, 099h, 00ah
        elseif  FW_VERSION = 311
        db      0c1h, 020h, 01bh, 033h, 020h, 096h, 00ah
        else
        db      0bah, 020h, 01bh, 023h, 020h, 0a6h, 00ah
        endif
        db      "released ("
        if      FW_VERSION >= 312
        db      0adh, 020h, 0deh
        elseif  FW_VERSION = 311
        db      0aah, 020h, 0f2h
        else
        db      0abh, 020h, 0e6h
        endif
        db      " Off message "
        if      FW_VERSION >= 312
        db      099h, 00ah, 01bh
        db      "N over "
        db      086h, 02eh, 029h, 00ah, 000h, 01bh, 09bh, 03ah, 020h, 01bh, 001h, 020h, 0f5h, 020h, 01bh, 0e9h
        db      020h, 01bh, 056h, 020h, 0d5h, 00ah, 09eh, 020h, 08ah, 02eh, 00ah
        elseif  FW_VERSION = 311
        db      096h, 00ah, 01bh
        db      "] over "
        db      086h, 02eh, 029h, 00ah, 000h, 01bh, 0c9h, 03ah, 020h, 01bh, 012h, 020h, 01bh, 00eh
        db      " occurs "
        db      01bh, 04ch, 020h, 0d7h, 00ah, 09eh, 020h, 08ah, 02eh, 00ah
        else
        db      0a6h, 00ah, 01bh, 086h
        db      " over "
        db      08eh, 02eh, 029h, 00ah, 000h, 01bh, 0a1h, 03ah, 020h, 01bh, 00eh, 020h, 01bh, 000h, 020h, 01bh
        db      0f1h, 020h, 01bh, 034h, 020h, 0d3h, 00ah, 09dh, 020h, 08bh, 02eh, 00ah
        endif
        db      "END: "
        if      FW_VERSION >= 312
        db      0f5h, 020h, 01bh, 0e9h, 020h, 01bh, 056h, 020h, 01bh, 086h, 020h, 09eh, 020h, 08ah, 02eh, 00ah
        db      000h, 01bh, 0f7h, 020h, 081h, 020h, 01bh, 059h, 020h, 09eh, 020h, 0ddh, 020h, 092h, 020h, 01bh
        db      0b2h, 00ah, 0e9h, 020h, 09ah, 02eh, 020h, 030h, 020h, 03dh, 020h, 01bh, 088h, 020h, 0ddh, 020h
        db      028h, 0bdh
        db      " always"
        db      00ah, 0ach, 020h, 01bh
        db      "V full "
        db      09ah, 029h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      01bh, 00eh
        db      " occurs "
        db      01bh, 04ch, 020h, 01bh, 09bh, 020h, 09eh, 020h, 08ah, 02eh, 00ah, 000h
        db      "Sets "
        db      081h, 020h, 0f6h, 020h, 09eh, 020h, 0d3h, 020h, 098h, 020h, 01bh, 07bh, 00ah, 0eah, 020h, 095h
        db      ". 100 = greatest "
        db      0d3h, 020h, 028h, 01bh, 0c0h, 00ah, 01bh
        db      "n produce "
        db      01bh, 0c0h
        db      " volumes);"
        db      00ah, 030h, 020h, 03dh, 020h, 01bh, 09fh, 020h, 0d3h, 020h, 028h, 0a1h
        db      " always "
        db      0b0h, 020h, 01bh, 04ch, 00ah
        db      "full "
        db      095h, 029h, 02eh, 00ah, 000h
        else
        db      01bh, 000h, 020h, 01bh, 0f1h, 020h, 01bh, 034h, 020h, 01bh, 064h, 020h, 09dh, 020h, 08bh, 02eh
        db      00ah, 000h
        db      "Sets "
        db      081h, 020h, 0eah, 020h, 09dh, 020h, 0c9h, 020h, 096h, 020h, 01bh, 084h, 00ah, 0efh, 020h, 094h
        db      ". 100 = greatest "
        db      0c9h, 020h, 028h, 01bh, 09bh, 00ah, 01bh
        db      "X produce "
        db      01bh, 09bh
        db      " volumes);"
        db      00ah, 030h, 020h, 03dh, 020h, 01bh, 097h, 020h, 0c9h, 020h, 028h, 0b2h
        db      " always "
        db      0afh, 020h, 01bh, 034h, 00ah
        db      "full "
        db      094h, 029h, 02eh, 00ah, 000h
        endif
        db      "Whenever "
        if      FW_VERSION >= 312
        db      081h, 020h, 098h, 020h, 083h, 020h, 01bh, 056h, 020h, 081h
        elseif  FW_VERSION = 311
        db      081h, 020h, 09bh, 020h, 083h, 020h, 08ch, 020h, 01bh, 04ch, 00ah, 081h
        else
        db      081h, 020h, 097h, 020h, 083h, 020h, 08ah, 020h, 01bh, 034h, 00ah, 081h
        endif
        db      " top "
        if      FW_VERSION >= 312
        db      09eh, 00ah, 0beh, 020h, 01bh
        db      "4, any "
        db      01bh, 040h, 020h, 0bdh, 00ah, 0d6h, 020h, 084h, 020h, 087h, 020h, 098h, 020h, 083h, 020h, 085h
        db      020h, 096h, 00ah
        db      "silenced "
        db      01bh, 0b5h, 02eh, 00ah, 000h, 08ch, 020h, 099h, 020h, 081h
        elseif  FW_VERSION = 311
        db      09eh, 020h, 081h, 020h, 0cbh, 020h, 01bh
        db      "', any"
        db      00ah, 01bh, 054h, 020h, 0a1h, 020h, 0cdh, 020h, 084h, 020h, 088h, 020h, 09bh, 00ah, 083h, 020h
        db      085h, 020h, 097h
        db      " silenced "
        db      01bh, 0cah, 02eh, 00ah
        db      "For example, closed hi-hat could"
        db      00ah
        db      "silence open hi-hat."
        db      00ah, 000h, 08dh, 020h, 096h, 020h, 081h
        else
        db      09dh, 020h, 081h, 020h, 0c8h, 020h, 01bh, 015h
        db      ", any"
        db      00ah, 01bh, 048h, 020h, 0b2h, 020h, 0cch, 020h, 084h, 020h, 086h, 020h, 097h, 00ah, 083h, 020h
        db      085h, 020h, 098h
        db      " silenced "
        db      01bh, 098h, 02eh, 00ah
        db      "For example, closed hi-hat could"
        db      00ah
        db      "silence open hi-hat."
        db      00ah, 000h, 08dh, 020h, 0a6h, 020h, 081h
        endif
        db      " cutoff "
        if      FW_VERSION >= 312
        db      01bh, 02ah, 020h, 09eh, 020h, 081h, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 047h, 020h, 09eh, 020h, 081h, 00ah
        else
        db      01bh, 033h, 020h, 09dh, 020h, 081h, 00ah
        endif
        db      "lowpass "
        if      FW_VERSION >= 312
        db      01bh, 01fh, 02eh, 020h, 01bh, 0a3h, 020h, 099h
        elseif  FW_VERSION = 311
        db      01bh, 03bh, 02eh, 020h, 01bh, 095h, 020h, 096h
        else
        db      01bh, 02ah, 02eh, 020h, 01bh, 07ah, 020h, 0a6h
        endif
        db      " 0 (100 Hz) "
        db      084h, 00ah
        db      "100 (fully open)."
        if      FW_VERSION >= 312
        db      00ah, 000h, 08ch
        else
        db      00ah, 000h, 08dh
        endif
        db      " sets "
        if      FW_VERSION >= 312
        db      081h, 020h, 01bh, 059h, 020h, 09eh, 020h, 0ddh, 020h, 098h, 00ah, 092h, 020h, 01bh, 0b2h, 020h
        db      0e9h, 020h, 01bh, 01fh, 020h, 01bh, 02ah, 02eh, 020h, 031h, 030h, 030h, 020h, 03dh, 00ah
        elseif  FW_VERSION = 311
        db      081h, 020h, 0f6h, 020h, 09eh, 020h, 0d3h, 020h, 09bh, 00ah, 098h, 020h, 01bh, 07bh, 020h, 0eah
        db      020h, 01bh, 03bh, 020h, 01bh, 047h, 02eh, 020h, 031h, 030h, 030h, 020h, 03dh, 00ah
        else
        db      081h, 020h, 0eah, 020h, 09dh, 020h, 0c9h, 020h, 097h, 00ah, 096h, 020h, 01bh, 084h, 020h, 0efh
        db      020h, 01bh, 02ah, 020h, 01bh, 033h, 02eh, 020h, 031h, 030h, 030h, 020h, 03dh, 00ah
        endif
        db      "greatest "
        if      FW_VERSION >= 312
        db      0ddh
        db      " (higher "
        db      01bh, 0cdh, 00ah
        db      "produce higher "
        db      01bh, 0a6h, 029h, 03bh, 020h, 030h, 020h, 03dh, 020h, 01bh, 088h, 00ah, 0ddh, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      0d3h
        db      " (higher "
        db      01bh, 06eh, 00ah
        db      "produce higher "
        db      01bh, 0c3h, 029h, 03bh, 020h, 030h, 020h, 03dh, 020h, 01bh, 09fh, 00ah, 0d3h, 02eh, 00ah, 000h
        else
        db      0c9h, 020h, 028h, 01bh, 0e6h, 020h, 01bh, 058h, 00ah
        db      "produce "
        db      01bh, 0e6h, 020h, 01bh, 095h, 029h, 03bh, 020h, 030h, 020h, 03dh, 020h, 01bh, 097h, 00ah, 0c9h
        db      02eh, 00ah, 000h
        endif
        db      "Filter "
        if      FW_VERSION >= 312
        db      01bh, 0dbh, 020h, 01bh
        db      "V cutoff "
        db      01bh, 02ah, 02eh, 00ah, 030h, 020h, 03dh, 020h, 01bh, 088h, 020h, 01bh, 0dbh
        elseif  FW_VERSION = 311
        db      01bh, 0fch, 020h, 01bh
        db      "L cutoff "
        db      01bh, 047h, 02eh, 00ah, 030h, 020h, 03dh, 020h, 01bh, 09fh, 020h, 01bh, 0fch
        else
        db      01bh, 0ddh, 020h, 01bh
        db      "4 cutoff "
        db      01bh, 033h, 02eh, 00ah, 030h, 020h, 03dh, 020h, 01bh, 097h, 020h, 01bh, 0ddh
        endif
        db      "; 15 = highest."
        if      FW_VERSION >= 312
        db      00ah, 000h, 08ch, 020h, 099h, 020h, 081h, 020h, 01bh, 005h, 020h, 0afh, 020h, 09eh, 020h, 081h
        db      020h, 01bh, 01fh, 00ah, 01bh, 001h, 02eh, 020h, 01bh, 0a3h
        db      ": 0-5000 ms."
        db      00ah, 000h, 08ch, 020h, 099h, 020h, 081h, 020h, 0f5h, 020h, 0afh, 020h, 09eh, 020h, 081h, 020h
        db      01bh, 01fh, 00ah, 01bh, 001h, 02eh, 020h, 01bh, 0a3h
        db      ": 0-5000 ms."
        db      00ah, 000h, 08ch
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08dh, 020h, 096h, 020h, 081h, 020h, 01bh, 00ch, 020h, 0afh, 020h, 09eh, 020h, 081h
        db      020h, 01bh, 03bh, 00ah, 01bh, 012h, 02eh, 020h, 01bh, 095h
        db      ": 0-5000 ms."
        db      00ah, 000h, 08dh, 020h, 096h, 020h, 081h, 020h, 01bh, 00eh, 020h, 0afh, 020h, 09eh, 020h, 081h
        db      020h, 01bh, 03bh, 00ah, 01bh, 012h, 02eh, 020h, 01bh, 095h
        db      ": 0-5000 ms."
        db      00ah, 000h, 08dh
        else
        db      00ah, 000h, 08dh, 020h, 0a6h, 020h, 081h, 020h, 0fch, 020h, 0ach, 020h, 09dh, 020h, 081h, 020h
        db      01bh, 02ah, 00ah, 01bh, 00eh, 02eh, 020h, 01bh
        db      "z: 0-5000 ms."
        db      00ah, 000h, 08dh, 020h, 0a6h, 020h, 081h, 020h, 01bh, 000h, 020h, 0ach, 020h, 09dh, 020h, 081h
        db      020h, 01bh, 02ah, 00ah, 01bh, 00eh, 02eh, 020h, 01bh
        db      "z: 0-5000 ms."
        db      00ah, 000h, 08dh
        endif
        db      " sets "
        if      FW_VERSION >= 312
        db      081h, 020h, 01bh, 059h, 020h, 09eh, 020h, 0ddh, 020h, 081h, 00ah, 01bh, 001h, 020h, 01bh, 02dh
        db      020h, 01bh, 0b2h, 020h, 0e9h, 020h, 081h, 020h, 01bh, 01fh, 00ah, 01bh, 02ah, 02eh, 00ah, 000h
        db      09fh, 020h, 061h, 020h, 083h
        db      " key "
        db      084h, 020h, 09bh
        db      " an "
        db      01bh, 0aeh, 02eh, 00ah, 000h, 01bh, 0abh, 020h, 0bah, 020h, 090h, 020h, 0a5h, 020h, 0c0h, 020h
        db      0cch, 020h, 098h, 00ah, 09eh, 020h, 0cch, 020h, 090h, 020h, 084h, 020h, 0a8h, 020h, 098h, 020h
        db      09eh, 00ah, 0a8h, 020h, 090h, 02eh, 00ah, 000h, 01bh, 0abh, 020h, 0bah, 020h, 0a5h, 020h, 0c0h
        db      020h, 0cch, 020h, 090h
        db      " over"
        db      00ah, 0a8h, 020h, 090h, 02eh, 00ah, 000h, 0a3h, 020h, 090h, 020h, 083h, 020h, 084h, 020h, 01bh
        db      0cbh, 020h, 097h, 00ah, 08bh, 020h, 03ch, 01bh, 084h, 020h, 0f1h, 03eh, 02eh, 00ah, 000h, 089h
        db      020h, 0a1h, 020h, 0a4h, 020h, 087h, 020h, 090h, 02eh, 00ah, 01bh, 043h, 020h, 0c3h, 03ah, 020h
        db      08bh, 020h, 02bh, 02fh, 02dh, 020h, 028h, 0b0h, 020h, 01bh, 026h, 020h, 084h, 00ah, 01bh, 0ddh
        db      020h, 01bh, 09eh, 020h, 01bh
        db      "/). Type "
        db      0c5h, 020h, 0a1h, 02ch, 00ah, 097h, 020h, 0d0h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      081h, 020h, 0f6h, 020h, 09eh, 020h, 0d3h, 020h, 081h, 00ah, 01bh, 012h, 020h, 01bh, 049h, 020h
        db      01bh, 07bh, 020h, 0eah, 020h, 081h, 020h, 01bh, 03bh, 00ah, 01bh, 047h, 02eh, 00ah, 000h, 092h
        db      020h, 061h, 020h, 083h, 020h, 01bh, 0a3h, 020h, 084h, 020h, 093h, 020h, 01bh, 0ach, 020h, 01bh
        db      008h, 02eh, 00ah, 000h, 08dh, 020h, 0e9h
        db      " copies "
        db      0b9h, 020h, 090h, 020h, 0a3h, 00ah, 0b7h, 020h, 0d1h, 020h, 09bh, 020h, 09eh, 020h, 0d1h, 020h
        db      090h, 020h, 084h, 020h, 0a9h, 00ah, 09bh, 020h, 09eh, 020h, 0a9h, 020h, 090h, 02eh, 020h, 0a6h
        db      020h, 01bh, 074h, 00ah, 08eh, 020h, 0b8h, 020h, 090h, 020h, 08eh, 020h, 09bh, 00ah, 0f9h, 02ch
        db      020h, 09ch, 020h, 089h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 02eh, 00ah, 000h, 08dh, 020h
        db      0e9h
        db      " copies "
        db      0b9h, 020h, 0a3h, 020h, 0b7h, 020h, 0d1h, 00ah, 090h
        db      " over "
        db      0a9h, 020h, 090h, 02eh, 020h, 0a6h, 00ah, 01bh, 074h, 020h, 08eh, 020h, 0b8h, 020h, 090h, 020h
        db      0f9h, 02ch, 00ah, 09ch, 020h, 089h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 02eh, 00ah, 000h
        db      0a6h, 020h, 090h, 020h, 083h, 020h, 084h, 020h, 01bh, 0edh, 020h, 09ch, 00ah, 089h, 020h, 03ch
        db      01bh, 061h, 020h, 0f5h, 03eh, 02eh, 00ah, 000h, 08bh, 020h, 0abh, 020h, 0a5h, 020h, 088h, 020h
        db      090h, 02eh, 00ah, 01bh, 04bh, 020h, 0c7h, 03ah, 020h, 089h, 020h, 02bh, 02fh, 02dh, 020h, 028h
        db      0b2h, 020h, 01bh, 042h, 020h, 084h, 00ah, 01bh, 09ah, 020h, 01bh, 0b8h, 020h, 01bh
        db      "H). Type "
        db      0d0h, 020h, 0abh, 02ch, 00ah, 09ch, 020h, 0ddh, 02eh, 00ah, 000h
        else
        db      081h, 020h, 0eah, 020h, 09dh, 020h, 0c9h, 020h, 081h, 00ah, 01bh, 00eh, 020h, 01bh, 035h, 020h
        db      01bh, 084h, 020h, 0efh, 020h, 081h, 020h, 01bh, 02ah, 00ah, 01bh, 033h, 02eh, 00ah, 000h, 090h
        db      020h, 061h, 020h, 083h, 020h, 01bh, 082h, 020h, 084h, 020h, 092h, 020h, 01bh, 0c5h, 020h, 0fdh
        db      02eh, 00ah, 000h, 08dh, 020h, 0e2h
        db      " copies "
        db      0b9h, 020h, 08ch, 020h, 0a5h, 00ah, 0b4h, 020h, 0d5h, 020h, 097h, 020h, 09dh, 020h, 0d5h, 020h
        db      08ch, 020h, 084h, 020h, 0a7h, 00ah, 097h, 020h, 09dh, 020h, 0a7h, 020h, 08ch, 02eh, 020h, 0a2h
        db      020h, 01bh, 09eh, 00ah, 091h, 020h, 0c2h, 020h, 08ch, 020h, 091h, 020h, 097h, 00ah, 0f1h, 02ch
        db      020h, 09ah, 020h, 088h, 020h, 03ch, 01bh, 085h, 020h, 0dch, 03eh, 02eh, 00ah, 000h, 08dh, 020h
        db      0e2h
        db      " copies "
        db      0b9h, 020h, 0a5h, 020h, 0b4h, 020h, 0d5h, 00ah, 08ch
        db      " over "
        db      0a7h, 020h, 08ch, 02eh, 020h, 0a2h, 00ah, 01bh, 09eh, 020h, 091h, 020h, 0c2h, 020h, 08ch, 020h
        db      0f1h, 02ch, 00ah, 09ah, 020h, 088h, 020h, 03ch, 01bh, 085h, 020h, 0dch, 03eh, 02eh, 00ah, 000h
        db      0a2h, 020h, 08ch, 020h, 083h, 020h, 084h, 020h, 01bh, 0bah, 020h, 09ah, 00ah, 088h, 020h, 03ch
        db      01bh, 085h, 020h, 0dch, 03eh, 02eh, 00ah, 000h, 089h, 020h, 0adh, 020h, 0a4h, 020h, 086h, 020h
        db      08ch, 02eh, 00ah, 01bh, 03ch, 020h, 0beh, 03ah, 020h, 088h, 020h, 02bh, 02fh, 02dh, 020h, 028h
        db      0aeh, 020h, 01bh, 032h, 020h, 084h, 00ah, 01bh, 0cbh, 020h, 01bh, 09dh, 020h, 01bh
        db      "8). Type "
        db      0c4h, 020h, 0adh, 02ch, 00ah, 09ah, 020h, 0d4h, 02eh, 00ah, 000h
        endif
        db      "WARNING: PRESSING <"
        if      FW_VERSION >= 312
        db      01bh, 084h, 020h, 0f1h
        elseif  FW_VERSION = 311
        db      01bh, 061h, 020h, 0f5h
        else
        db      01bh, 085h, 020h, 0dch
        endif
        db      "> WILL"
        db      00ah
        db      "INITIALIZE "
        db      01bh
        if      FW_VERSION >= 312
        db      ". PROGRAMS! "
        db      09fh, 020h, 01bh, 0ebh, 00ah, 01bh, 058h, 020h, 084h
        db      " cancel."
        db      00ah, 000h
        db      "Sampling "
        db      0afh, 02eh, 020h, 01bh, 0bfh, 020h, 03dh, 020h, 030h, 02eh, 031h, 00ah, 01bh, 05fh, 020h, 028h
        db      01bh, 06bh, 020h, 022h, 02eh, 022h, 020h, 0e9h
        db      " keypad)."
        db      00ah, 000h, 01bh, 09dh
        db      " STEREO "
        db      0a4h, 020h, 01bh, 020h, 020h, 0aeh, 020h, 0d9h, 03bh, 020h, 01bh, 06bh, 00ah
        db      "MONO LFT "
        db      084h, 020h, 01bh, 05ch, 020h, 0fch, 020h, 01bh, 014h
        db      " analog"
        db      00ah, 01bh, 047h, 020h, 0adh, 020h, 01bh, 014h
        db      " side "
        db      09eh
        db      " digital "
        db      01bh, 047h, 03bh, 00ah, 01bh
        db      "k MONO RGT "
        db      084h, 020h, 01bh, 05ch, 020h, 01bh, 016h
        db      " side "
        db      09eh, 00ah
        db      "analog "
        db      0adh
        db      " digital "
        db      01bh, 047h, 02eh, 00ah, 000h
        db      "ON: Hear "
        db      081h, 020h, 01bh, 020h, 020h, 01bh, 047h, 020h, 0aeh, 020h, 081h, 00ah, 0d9h
        db      " mix."
        db      00ah, 01bh, 012h, 03ah, 020h, 01bh, 0c4h
        db      " won't."
        db      00ah, 000h, 089h, 020h, 01bh, 020h, 020h, 0afh, 02eh, 020h, 01bh, 0bfh, 020h, 03dh, 020h, 030h
        db      02eh, 031h, 00ah, 01bh, 05fh, 020h, 028h, 01bh, 06bh, 020h, 022h, 02eh, 022h, 020h, 0e9h
        db      " keypad)."
        db      00ah, 000h, 089h, 020h, 01bh, 066h, 020h, 0edh, 020h, 01bh, 052h, 020h, 096h, 020h, 01bh, 08ch
        db      020h, 01bh, 0b3h, 00ah
        elseif  FW_VERSION = 311
        db      "@ PROGRAMS! "
        db      092h, 020h, 01bh, 007h, 00ah, 0c2h, 020h, 084h, 020h, 0e8h, 02eh, 00ah, 000h, 08fh
        db      " ANALOG "
        db      0a5h, 020h, 01bh, 00ah
        db      " analog"
        db      00ah, 01bh, 01dh, 03bh, 020h, 093h
        db      " DIGITAL "
        db      084h, 020h, 01bh, 055h, 020h, 0b7h, 00ah, 081h, 020h, 01bh, 0dah, 020h, 01bh, 04ah, 02eh, 00ah
        db      000h, 01bh
        db      "p STEREO "
        db      0a5h, 020h, 01bh, 01dh, 020h, 0ach, 020h, 0e4h, 03bh, 020h, 01bh, 0c4h, 00ah
        db      "MONO LFT "
        db      084h, 020h, 01bh, 055h, 020h, 0ffh, 020h, 01bh
        db      "4 analog"
        db      00ah, 01bh, 04ah, 020h, 0aah, 020h, 01bh
        db      "4 side "
        db      09eh, 020h, 01bh, 0dah, 020h, 01bh, 04ah, 03bh, 00ah, 01bh, 0c4h
        db      " MONO RGT "
        db      084h, 020h, 01bh, 055h, 020h, 0dbh
        db      " side "
        db      09eh, 00ah
        db      "analog "
        db      0aah, 020h, 01bh, 0dah, 020h, 01bh, 04ah, 02eh, 00ah, 000h
        db      "ON: "
        db      01bh, 0a0h, 020h, 085h
        db      " hear "
        db      081h, 020h, 01bh, 01dh, 020h, 01bh, 04ah, 020h, 0ach, 00ah, 081h, 020h, 0e4h
        db      " mix."
        db      00ah, 01bh, 032h, 03ah, 020h, 01bh, 0a0h
        db      " won't."
        db      00ah, 000h, 08bh, 020h, 01bh, 01dh, 020h, 0afh
        db      ". Resolution = 0.1"
        db      00ah
        db      "second ("
        db      01bh, 0c4h, 020h, 022h, 02eh, 022h, 020h, 0eah
        db      " keypad)."
        db      00ah, 000h, 08bh, 020h, 01bh, 066h, 020h, 0ech, 020h, 01bh, 06fh, 020h, 097h, 020h, 01bh, 0aah
        db      020h, 01bh, 085h, 00ah
        else
        db      "/ PROGRAMS! "
        db      090h, 020h, 0feh, 00ah, 0b8h, 020h, 084h, 020h, 0dbh, 02eh, 00ah, 000h, 08fh
        db      " ANALOG "
        db      0a4h, 020h, 0ffh, 020h, 01bh, 0e5h, 00ah, 01bh, 00ch, 03bh, 020h, 092h
        db      " DIGITAL "
        db      084h, 020h, 01bh, 0eeh, 020h, 0b4h, 00ah, 081h, 020h, 01bh, 0c4h, 020h, 01bh, 052h, 02eh, 00ah
        db      000h, 01bh
        db      "_ STEREO "
        db      0a4h, 020h, 01bh, 00ch, 020h, 0b0h, 020h, 0ebh, 03bh, 020h, 01bh, 0bfh, 00ah
        db      "MONO LFT "
        db      084h, 020h, 01bh, 0eeh, 020h, 01bh, 045h, 020h, 01bh, 031h, 020h, 01bh, 0e5h, 00ah, 01bh, 052h
        db      020h, 0abh, 020h, 01bh
        db      "1 side "
        db      09dh, 020h, 01bh, 0c4h, 020h, 01bh, 052h, 03bh, 00ah, 01bh, 0bfh
        db      " MONO RGT "
        db      084h, 020h, 01bh, 0eeh, 020h, 0d1h
        db      " side "
        db      09dh, 00ah, 01bh, 0e5h, 020h, 0abh, 020h, 01bh, 0c4h, 020h, 01bh, 052h, 02eh, 00ah, 000h
        db      "ON: "
        db      01bh, 0aah, 020h, 085h
        db      " hear "
        db      081h, 020h, 01bh, 00ch, 020h, 01bh, 052h, 020h, 0b0h, 00ah, 081h, 020h, 0ebh
        db      " mix."
        db      00ah, 01bh, 025h, 03ah, 020h, 01bh, 0aah
        db      " won't."
        db      00ah, 000h, 089h, 020h, 01bh, 00ch, 020h, 0ach
        db      ". Resolution = 0.1"
        db      00ah, 01bh, 0edh, 020h, 028h, 01bh, 0bfh, 020h, 022h, 02eh, 022h, 020h, 0efh
        db      " keypad)."
        db      00ah, 000h, 089h, 020h, 01bh, 04eh, 020h, 0dfh, 020h, 01bh, 05eh, 020h, 098h, 020h, 01bh, 08ch
        db      020h, 01bh, 06bh, 00ah
        endif
        db      "<Rec "
        if      FW_VERSION >= 312
        db      01bh, 07dh, 03eh, 020h, 099h, 020h, 0b7h, 020h, 0a4h, 020h, 01bh, 020h, 020h, 084h, 00ah, 0d5h
        db      02eh, 020h, 01bh, 0d5h, 020h, 099h
        elseif  FW_VERSION = 311
        db      01bh, 083h, 03eh, 020h, 096h, 020h, 0bch, 020h, 0a5h, 020h, 01bh, 01dh, 020h, 084h, 00ah, 0d7h
        db      02eh, 020h, 01bh, 0bfh, 020h, 096h
        else
        db      01bh, 080h, 03eh, 020h, 0a6h, 020h, 0bdh, 020h, 0a4h, 020h, 01bh, 00ch, 020h, 084h, 00ah, 0d3h
        db      ". It "
        db      0a6h
        endif
        db      " indicated "
        if      FW_VERSION >= 312
        db      01bh, 09fh, 020h, 061h, 020h, 022h, 054h, 022h, 020h, 0e9h, 020h, 081h, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 0d0h, 020h, 061h, 020h, 022h, 054h, 022h, 020h, 0eah, 020h, 081h, 00ah
        else
        db      01bh, 0fbh, 020h, 061h, 020h, 022h, 054h, 022h, 020h, 0efh, 020h, 081h, 00ah
        endif
        db      "meter. "
        if      FW_VERSION >= 312
        db      0a3h, 020h, 030h, 020h, 0a4h, 020h, 01bh, 020h, 020h, 084h, 020h, 0d5h, 020h, 061h, 073h, 00ah
        elseif  FW_VERSION = 311
        db      0a6h, 020h, 030h, 020h, 0a5h, 020h, 01bh, 01dh, 020h, 084h, 020h, 0d7h, 020h, 061h, 073h, 00ah
        else
        db      0a2h, 020h, 030h, 020h, 0a4h, 020h, 01bh, 00ch, 020h, 084h, 020h, 0d3h, 020h, 061h, 073h, 00ah
        endif
        db      "soon as <Rec "
        if      FW_VERSION >= 312
        db      01bh, 07dh, 03eh, 020h, 099h, 020h, 0b7h, 02eh, 00ah, 000h, 089h, 020h, 083h, 020h, 09eh, 020h
        db      01bh, 085h, 020h, 084h, 020h, 096h, 00ah, 0ceh
        elseif  FW_VERSION = 311
        db      01bh, 083h, 03eh, 020h, 096h, 020h, 0bch, 02eh, 00ah, 000h, 08bh, 020h, 083h, 020h, 09eh, 020h
        db      01bh, 0a1h, 020h, 084h, 020h, 097h, 00ah, 0d6h
        else
        db      01bh, 080h, 03eh, 020h, 0a6h, 020h, 0bdh, 02eh, 00ah, 000h, 089h, 020h, 083h, 020h, 09dh, 020h
        db      01bh, 083h, 020h, 084h, 020h, 098h, 00ah, 0ceh
        endif
        db      " BEFORE "
        if      FW_VERSION >= 312
        db      081h, 020h, 01bh, 076h, 020h, 099h, 00ah, 01bh, 08ch
        elseif  FW_VERSION = 311
        db      081h, 020h, 01bh, 093h, 020h, 096h, 00ah, 01bh, 0aah
        else
        db      081h, 020h, 01bh, 06dh, 020h, 0a6h, 00ah, 01bh, 08ch
        endif
        db      ". (Prevents "
        if      FW_VERSION >= 312
        db      08ah, 027h, 073h, 020h, 01bh, 005h, 020h, 0c0h, 00ah
        elseif  FW_VERSION = 311
        db      08ah, 027h, 073h, 020h, 01bh, 00ch, 020h, 0b7h, 00ah
        else
        db      08bh, 027h, 073h, 020h, 0fch, 020h, 0b4h, 00ah
        endif
        db      "being cut "
        if      FW_VERSION >= 312
        db      01bh, 0d2h, 02eh, 029h, 00ah, 000h, 01bh, 0c4h, 020h, 01bh, 041h, 020h, 01bh, 00eh
        elseif  FW_VERSION = 311
        db      01bh, 0f2h
        db      ".) Try "
        db      022h, 031h, 022h, 020h, 084h, 020h, 0d7h, 02eh, 020h, 08bh, 00ah, 01bh, 00ch, 020h, 01bh, 02bh
        db      020h, 097h
        db      " trimmed later "
        db      0eah, 020h, 081h, 00ah, 022h
        db      "Edit "
        db      08ah, 022h, 020h, 0cbh, 02eh, 00ah, 000h, 01bh, 0a0h, 020h, 01bh, 01bh, 020h, 0f3h
        else
        db      01bh, 0e0h
        db      ".) Try "
        db      022h, 031h, 022h, 020h, 084h, 020h, 0d3h, 02eh, 020h, 089h, 00ah, 0fch, 020h, 01bh, 036h, 020h
        db      098h
        db      " trimmed "
        db      01bh, 0dch, 020h, 0efh, 020h, 081h, 00ah, 022h
        db      "Edit "
        db      08bh, 022h, 020h, 0c8h, 02eh, 00ah, 000h, 01bh, 0aah, 020h, 01bh, 01dh, 020h, 01bh, 01ah
        endif
        db      " explanation "
        if      FW_VERSION >= 312
        db      01bh, 028h, 020h, 0edh, 03fh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      01bh, 041h, 020h, 0ech, 03fh, 00ah, 000h
        else
        db      01bh, 0bbh, 020h, 0dfh, 03fh, 00ah, 000h
        endif
        db      "Sequence "
        if      FW_VERSION >= 312
        db      0b4h, 020h, 099h, 020h, 01bh, 010h, 020h, 084h
        elseif  FW_VERSION = 311
        db      0b1h, 020h, 096h, 020h, 0fah, 020h, 084h
        else
        db      0c5h, 020h, 0a6h, 020h, 0fbh, 020h, 084h
        endif
        db      " temporarily"
        db      00ah
        db      "store "
        if      FW_VERSION >= 312
        db      0c5h
        elseif  FW_VERSION = 311
        db      0d0h
        else
        db      0c4h
        endif
        db      " samples, "
        if      FW_VERSION >= 312
        db      0b1h
        else
        db      0b3h
        endif
        db      " requires"
        db      00ah
        db      "erasing "
        if      FW_VERSION >= 312
        db      0bah, 020h, 09ch, 020h, 091h, 020h, 01bh, 0e1h, 02eh, 00ah, 000h, 08eh, 020h, 081h, 020h, 08ah
        db      020h, 084h, 020h, 096h
        elseif  FW_VERSION = 311
        db      0b9h, 020h, 09dh, 020h, 08eh, 020h, 01bh, 0f6h, 02eh, 00ah, 000h, 08fh, 020h, 0b4h, 020h, 081h
        db      020h, 08ah, 020h, 084h, 020h, 097h
        else
        db      0b9h, 020h, 09ch, 020h, 091h, 020h, 01bh, 0cfh, 02eh, 00ah, 000h, 08fh, 020h, 0b1h, 020h, 081h
        db      020h, 08bh, 020h, 084h, 020h, 098h
        endif
        db      " edited. All"
        if      FW_VERSION >= 312
        db      00ah, 0e7h, 020h, 0e0h, 020h, 01bh, 0dch, 020h, 0fch, 020h, 084h, 020h, 087h, 020h, 08ah, 02eh
        db      00ah, 000h, 01bh, 0a7h, 020h, 01bh, 0d6h, 020h, 0e7h, 020h, 0feh, 020h, 081h
        elseif  FW_VERSION = 311
        db      00ah, 0e7h, 020h, 0edh
        db      " apply "
        db      0ffh, 020h, 084h, 020h, 088h, 020h, 08ah, 02eh, 00ah, 000h, 01bh, 088h, 020h, 01bh, 0feh, 020h
        db      0e7h, 020h, 01bh, 00fh, 020h, 081h
        else
        db      00ah, 0ddh, 020h, 0e4h, 020h, 01bh, 0cdh, 020h, 01bh, 045h, 020h, 084h, 020h, 086h, 020h, 08bh
        db      02eh, 00ah, 000h, 01bh, 077h, 020h, 01bh, 0e2h, 020h, 0ddh, 020h, 01bh, 018h, 020h, 081h
        endif
        db      " point "
        if      FW_VERSION >= 312
        db      0aeh, 020h, 081h, 00ah, 08ah, 020h, 01bh, 007h, 020h, 0ach
        elseif  FW_VERSION = 311
        db      0ach, 020h, 081h, 00ah, 08ah, 020h, 01bh, 025h, 020h, 0b0h
        else
        db      0b0h, 020h, 081h, 00ah, 08bh, 020h, 01bh, 00fh, 020h, 0afh
        endif
        db      " starts ("
        if      FW_VERSION >= 312
        db      01bh, 003h
        elseif  FW_VERSION = 311
        db      01bh, 017h
        else
        db      01bh, 001h
        endif
        db      ".Milli-"
        db      00ah
        db      "seconds."
        if      FW_VERSION >= 312
        db      01bh, 068h, 029h, 02eh, 00ah, 000h, 01bh, 0a7h, 020h, 01bh, 0d6h, 020h, 0e7h, 020h, 0feh, 020h
        db      081h, 020h, 0d5h, 020h, 09eh, 020h, 081h, 00ah, 01bh, 01ah
        db      " zone ("
        db      01bh, 003h, 02eh, 01bh, 029h, 02eh, 00ah, 01bh, 068h, 029h, 02eh, 00ah, 000h, 01bh, 0a7h, 020h
        db      01bh, 0d6h, 020h, 0e7h, 020h, 0feh, 020h, 081h
        elseif  FW_VERSION = 311
        db      01bh, 08ch, 029h, 02eh, 00ah, 000h, 01bh, 088h, 020h, 01bh, 0feh, 020h, 0e7h, 020h, 01bh, 00fh
        db      020h, 081h, 020h, 0d7h, 020h, 09eh, 020h, 081h, 00ah, 01bh
        db      "/ zone ("
        db      01bh, 017h, 02eh, 01bh, 043h, 02eh, 00ah, 01bh, 08ch, 029h, 02eh, 00ah, 000h, 01bh, 088h, 020h
        db      01bh, 0feh, 020h, 0e7h, 020h, 01bh, 00fh, 020h, 081h
        else
        db      01bh, 06ch, 029h, 02eh, 00ah, 000h, 01bh, 077h, 020h, 01bh, 0e2h, 020h, 0ddh, 020h, 01bh, 018h
        db      020h, 081h, 020h, 0d3h, 020h, 09dh, 020h, 081h, 00ah, 01bh
        db      "! zone ("
        db      01bh, 001h, 02eh, 01bh, 030h, 02eh, 00ah, 01bh, 06ch, 029h, 02eh, 00ah, 000h, 01bh, 077h, 020h
        db      01bh, 0e2h, 020h, 0ddh, 020h, 01bh, 018h, 020h, 081h
        endif
        db      " point "
        if      FW_VERSION >= 312
        db      0aeh, 020h, 081h, 00ah, 08ah, 020h, 01bh, 056h, 020h, 0b1h, 020h, 0ach
        elseif  FW_VERSION = 311
        db      0ach, 020h, 081h, 00ah, 08ah, 020h, 01bh, 04ch, 020h, 0b3h, 020h, 0b0h
        else
        db      0b0h, 020h, 081h, 00ah, 08bh, 020h, 01bh, 034h, 020h, 0b3h, 020h, 0afh
        endif
        db      " ends ("
        if      FW_VERSION >= 312
        db      01bh, 003h, 02eh, 00ah, 01bh, 029h, 02eh, 01bh, 068h, 029h, 02eh, 00ah, 000h, 01bh, 0a7h, 020h
        db      01bh, 0d6h, 020h, 0e7h, 020h, 0feh, 020h, 081h, 020h, 01bh, 086h, 020h, 09eh, 020h, 081h, 00ah
        db      01bh, 01ah
        db      " zone ("
        db      01bh, 003h, 02eh, 01bh, 029h, 02eh, 00ah, 01bh, 068h, 029h, 02eh, 00ah, 000h, 08eh, 020h, 0bbh
        db      020h, 0b1h, 020h, 01bh, 0cah, 020h, 09eh, 020h, 081h, 020h, 08ah, 00ah, 085h, 020h, 0ach, 020h
        db      0b6h
        elseif  FW_VERSION = 311
        db      01bh, 017h, 02eh, 00ah, 01bh, 043h, 02eh, 01bh, 08ch, 029h, 02eh, 00ah, 000h, 01bh, 088h, 020h
        db      01bh, 0feh, 020h, 0e7h, 020h, 01bh, 00fh, 020h, 081h, 020h, 01bh, 09bh, 020h, 09eh, 020h, 081h
        db      00ah, 01bh
        db      "/ zone ("
        db      01bh, 017h, 02eh, 01bh, 043h, 02eh, 00ah, 01bh, 08ch, 029h, 02eh, 00ah, 000h, 08fh, 020h, 0b4h
        db      020h, 0b3h, 020h, 01bh, 0d5h, 020h, 09eh, 020h, 081h, 020h, 08ah, 00ah, 085h, 020h, 0b0h, 020h
        db      0c1h
        else
        db      01bh, 001h, 02eh, 00ah, 01bh, 030h, 02eh, 01bh, 06ch, 029h, 02eh, 00ah, 000h, 01bh, 077h, 020h
        db      01bh, 0e2h, 020h, 0ddh, 020h, 01bh, 018h, 020h, 081h, 020h, 01bh, 064h, 020h, 09dh, 020h, 081h
        db      00ah, 01bh
        db      "! zone ("
        db      01bh, 001h, 02eh, 01bh, 030h, 02eh, 00ah, 01bh, 06ch, 029h, 02eh, 00ah, 000h, 08fh, 020h, 0b1h
        db      020h, 0b3h, 020h, 01bh, 0abh, 020h, 09dh, 020h, 081h, 020h, 08bh, 00ah, 085h, 020h, 0afh, 020h
        db      0bah
        endif
        db      " <Play X> "
        if      FW_VERSION >= 312
        db      099h, 020h, 0b7h, 02eh, 00ah, 000h, 089h, 020h, 08ah
        elseif  FW_VERSION = 311
        db      096h, 020h, 0bch, 02eh, 00ah, 000h, 08bh, 020h, 08ah
        else
        db      0a6h, 020h, 0bdh, 02eh, 00ah, 000h, 089h, 020h, 08bh
        endif
        db      "'s initial "
        if      FW_VERSION >= 312
        db      09ah
        elseif  FW_VERSION = 311
        db      095h
        else
        db      094h
        endif
        db      ", as a"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 0c3h, 020h, 09eh
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 0dbh, 020h, 09eh
        else
        db      00ah, 01bh, 0c2h, 020h, 09dh
        endif
        db      " full scale (0-200%). "
        if      FW_VERSION >= 312
        db      01bh, 09dh, 00ah, 0f1h, 020h, 084h
        elseif  FW_VERSION = 311
        db      01bh, 070h, 00ah, 0f5h, 020h, 084h
        else
        db      01bh, 05fh, 00ah, 0dch, 020h, 084h
        endif
        db      " achieve a "
        if      FW_VERSION >= 312
        db      01bh, 00ah, 020h, 09ah, 020h, 01bh, 066h, 02eh, 00ah, 000h, 089h, 020h, 08ah
        elseif  FW_VERSION = 311
        db      01bh, 00ah, 020h, 095h, 020h, 01bh, 066h, 00ah
        db      "(make quiet "
        db      0a1h
        db      " louder "
        db      08eh
        db      " loud"
        db      00ah, 0a1h
        db      " quieter)."
        db      00ah, 000h, 08bh, 020h, 08ah
        else
        db      0ffh, 020h, 094h, 020h, 01bh, 04eh, 00ah
        db      "(make quiet "
        db      0b2h
        db      " louder "
        db      091h
        db      " loud"
        db      00ah, 0b2h
        db      " quieter)."
        db      00ah, 000h, 089h, 020h, 08bh
        endif
        db      "'s initial "
        if      FW_VERSION >= 312
        db      01bh, 05ah, 020h, 028h, 02dh, 031h, 032h, 030h, 020h, 084h, 020h, 036h, 030h, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 071h, 020h, 028h, 02dh, 031h, 032h, 030h, 020h, 084h, 020h, 031h, 032h, 030h, 00ah
        else
        db      01bh, 063h, 020h, 028h, 02dh, 031h, 032h, 030h, 020h, 084h, 020h, 031h, 032h, 030h, 00ah
        endif
        db      "tenths "
        if      FW_VERSION >= 312
        db      09eh
        db      " a semitone)."
        db      00ah, 000h, 0fbh, 020h, 0b1h, 020h, 01bh, 01ah, 020h, 0cah, 020h, 085h, 00ah
        elseif  FW_VERSION = 311
        db      09eh
        db      " a semitone). "
        db      01bh, 070h, 020h, 0f5h, 020h, 084h
        db      " tune"
        db      00ah, 0a1h, 020h, 084h, 020h, 01bh, 09ah, 020h, 01bh, 00ah
        db      " pitch. "
        db      092h, 020h, 022h, 02eh, 022h, 00ah, 084h
        db      " toggle "
        db      081h, 020h, 0a4h, 020h, 01bh, 051h, 020h, 02bh, 020h, 08eh, 020h, 02dh, 02eh, 00ah, 000h, 01bh
        db      001h, 020h, 0b3h, 020h, 01bh, 02fh, 020h, 0d5h, 020h, 085h, 00ah
        else
        db      09dh
        db      " a semitone). "
        db      01bh, 05fh, 020h, 0dch, 020h, 084h
        db      " tune"
        db      00ah, 0b2h, 020h, 084h, 020h, 01bh, 0cbh, 020h, 0ffh
        db      " pitch. "
        db      090h, 020h, 022h, 02eh, 022h, 00ah, 084h
        db      " toggle "
        db      081h, 020h, 0a1h, 020h, 01bh, 046h, 020h, 02bh, 020h, 091h, 020h, 02dh, 02eh, 00ah, 000h, 01bh
        db      009h, 020h, 0b3h, 020h, 01bh, 021h, 020h, 0cbh, 020h, 085h, 00ah
        endif
        db      "occur "
        if      FW_VERSION >= 312
        db      0b6h, 020h, 03ch, 01bh, 084h, 03eh, 020h, 099h, 020h, 0b7h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      0c1h, 020h, 03ch, 01bh, 061h, 03eh, 020h, 096h, 020h, 0bch, 02eh, 00ah, 000h
        else
        db      0bah, 020h, 03ch, 01bh, 085h, 03eh, 020h, 0a6h, 020h, 0bdh, 02eh, 00ah, 000h
        endif
        db      "Higher "
        if      FW_VERSION >= 312
        db      01bh
        db      "v causes shorter "
        db      0cdh, 00ah, 084h, 020h, 081h, 020h, 0d5h, 020h, 09eh, 020h, 081h, 020h, 08ah
        elseif  FW_VERSION = 311
        db      01bh, 093h
        db      " causes shorter "
        db      0d4h, 00ah, 084h, 020h, 081h, 020h, 0d7h, 020h, 09eh, 020h, 081h, 020h, 08ah
        else
        db      01bh
        db      "m causes shorter "
        db      0cah, 00ah, 084h, 020h, 081h, 020h, 0d3h, 020h, 09dh, 020h, 081h, 020h, 08bh
        endif
        db      " but "
        db      01bh
        if      FW_VERSION >= 312
        db      "t cut"
        db      00ah, 01bh, 0d2h
        elseif  FW_VERSION = 311
        db      "+ cut"
        db      00ah, 01bh, 0f2h
        else
        db      "6 cut"
        db      00ah, 01bh, 0e0h
        endif
        db      " part "
        if      FW_VERSION >= 312
        db      09eh, 020h, 081h, 020h, 01bh, 005h
        db      "; lower "
        db      01bh, 076h, 00ah
        elseif  FW_VERSION = 311
        db      09eh, 020h, 081h, 020h, 01bh, 00ch, 03bh, 020h, 01bh, 0c0h, 020h, 01bh, 093h, 00ah
        else
        db      09dh, 020h, 081h, 020h, 0fch, 03bh, 020h, 01bh, 09bh, 020h, 01bh, 06dh, 00ah
        endif
        db      "does "
        db      081h
        db      " opposite. A good "
        if      FW_VERSION >= 312
        db      01bh, 096h, 00ah, 0a0h, 020h, 099h, 020h, 035h, 025h, 02eh, 00ah, 000h, 09fh, 020h, 02bh, 02fh
        db      02dh, 02ch, 020h, 0c7h, 020h, 081h, 020h, 0c5h, 020h, 0a1h, 02ch, 020h, 08bh, 00ah, 0d0h, 02ch
        db      020h, 097h, 020h, 08bh, 020h, 03ch, 01bh, 084h, 020h, 0f1h, 03eh, 02eh, 00ah, 000h, 08eh, 020h
        db      0bbh, 020h, 081h, 020h, 08ah, 020h, 084h, 020h, 096h, 020h, 0b8h, 02eh, 00ah, 000h, 09fh, 020h
        db      03ch, 01bh, 084h, 020h, 0f1h, 03eh, 020h, 084h, 020h, 0dah, 020h, 0bah, 020h, 0bdh, 020h, 0c0h
        db      00ah, 0b4h, 02eh, 00ah, 000h, 08ch, 020h, 098h, 020h, 083h, 020h, 085h, 020h, 0ach, 020h, 01bh
        db      "V full"
        elseif  FW_VERSION = 311
        db      01bh, 0b4h, 00ah, 0a4h, 020h, 096h, 020h, 035h, 025h, 02eh, 00ah, 000h, 08fh, 020h, 0b4h, 020h
        db      081h, 020h, 08ah, 020h, 084h, 020h, 097h
        db      " renamed,"
        db      00ah, 0a7h, 020h, 0aah, 020h, 01bh, 013h, 02eh, 00ah, 000h, 08fh, 020h, 0b4h, 020h, 081h, 020h
        db      08ah, 020h, 084h, 020h, 097h
        db      " renamed."
        db      00ah, 000h, 092h, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0ceh, 020h, 081h, 020h, 0d0h, 020h, 0abh
        db      02ch, 020h, 089h, 00ah, 0ddh, 02ch, 020h, 09ch, 020h, 089h, 020h, 03ch, 01bh, 061h, 020h, 0f5h
        db      03eh, 02eh, 00ah, 000h, 08fh, 020h, 0b4h, 020h, 081h, 020h, 08ah, 020h, 084h, 020h, 097h, 020h
        db      0a7h, 02eh, 00ah, 000h, 08fh, 020h, 0b4h, 020h, 081h, 020h, 08ah, 020h, 084h, 020h, 097h, 020h
        db      01bh, 013h, 02eh, 00ah, 000h, 092h, 020h, 03ch, 01bh, 061h, 020h, 0f5h, 03eh, 020h, 084h, 020h
        db      0e5h, 020h, 0b9h, 020h, 0a1h, 020h, 0b7h, 00ah, 0b1h, 02eh, 020h, 092h, 020h, 01bh, 007h, 020h
        db      0c2h, 020h, 084h, 020h, 0e8h, 02eh, 00ah, 000h, 08dh, 020h, 09bh, 020h, 083h, 020h, 085h, 020h
        db      0b0h, 020h, 01bh
        db      "L full"
        else
        db      01bh, 08dh, 00ah, 0a1h, 020h, 0a6h, 020h, 035h, 025h, 02eh, 00ah, 000h, 08fh, 020h, 0b1h, 020h
        db      081h, 020h, 08bh, 020h, 084h, 020h, 098h
        db      " renamed,"
        db      00ah, 0a3h, 020h, 0abh, 020h, 01bh, 008h, 02eh, 00ah, 000h, 08fh, 020h, 0b1h, 020h, 081h, 020h
        db      08bh, 020h, 084h, 020h, 098h
        db      " renamed."
        db      00ah, 000h, 090h, 020h, 02bh, 02fh, 02dh, 02ch, 020h, 0c3h, 020h, 081h, 020h, 0c4h, 020h, 0adh
        db      02ch, 020h, 088h, 00ah, 0d4h, 02ch, 020h, 09ah, 020h, 088h, 020h, 03ch, 01bh, 085h, 020h, 0dch
        db      03eh, 02eh, 00ah, 000h, 08fh, 020h, 0b1h, 020h, 081h, 020h, 08bh, 020h, 084h, 020h, 098h, 020h
        db      0a3h, 02eh, 00ah, 000h, 08fh, 020h, 0b1h, 020h, 081h, 020h, 08bh, 020h, 084h, 020h, 098h, 020h
        db      01bh, 008h, 02eh, 00ah, 000h, 090h, 020h, 03ch, 01bh, 085h, 020h, 0dch, 03eh, 020h, 084h, 020h
        db      0deh, 020h, 0b9h, 020h, 0b2h, 020h, 0b4h, 00ah, 0c5h, 02eh, 020h, 090h, 020h, 0feh, 020h, 0b8h
        db      020h, 084h, 020h, 0dbh, 02eh, 00ah, 000h, 08dh, 020h, 097h, 020h, 083h, 020h, 085h, 020h, 0afh
        db      020h, 01bh
        db      "4 full"
        endif
        db      00ah, 01bh
        if      FW_VERSION >= 312
        db      "f whenever a "
        db      01bh, 0eeh
        db      " appears "
        db      01bh, 056h, 020h, 081h, 00ah
        elseif  FW_VERSION = 311
        db      "f whenever a signal appears "
        db      01bh, 04ch, 020h, 081h, 00ah
        else
        db      "N whenever a "
        db      01bh, 0f0h
        db      " appears "
        db      01bh, 034h, 020h, 081h, 00ah
        endif
        db      "SYNC "
        if      FW_VERSION >= 312
        db      01bh, 047h, 02eh, 020h, 01bh, 09dh
        db      " SYNC IN LEVEL control"
        db      00ah, 084h
        elseif  FW_VERSION = 311
        db      01bh, 04ah, 02eh, 020h, 01bh, 070h, 020h, 081h
        db      " SYNC IN LEVEL"
        db      00ah, 01bh, 0d6h, 020h, 084h
        else
        db      01bh, 052h, 02eh, 020h, 01bh, 05fh, 020h, 081h
        db      " SYNC IN LEVEL"
        db      00ah, 01bh, 0afh, 020h, 084h
        endif
        db      " adjust sensitivity."
        if      FW_VERSION >= 312
        db      00ah, 000h, 08eh, 020h, 081h, 020h, 086h, 020h, 01bh, 047h, 020h, 0f6h, 020h, 0e2h, 020h, 01bh
        db      018h, 020h, 0a4h, 00ah, 01bh, 05ch
        db      " dump."
        db      00ah, 000h, 08eh, 020h, 081h, 020h, 086h, 020h, 0b5h, 020h, 0f6h, 020h, 0e2h, 020h, 01bh, 018h
        db      00ah, 0a4h, 020h, 01bh, 05ch
        db      " dump."
        db      00ah, 000h
        db      "Set "
        db      087h, 020h, 084h, 020h, 081h, 020h, 01bh, 093h, 020h, 086h, 020h, 094h, 020h, 061h, 073h, 00ah
        db      081h, 020h, 01bh, 000h
        db      " sampler."
        db      00ah, 000h, 08ch, 020h, 099h, 020h, 081h, 020h, 08ah, 020h, 083h, 020h, 0aeh, 020h, 081h, 00ah
        db      01bh, 000h
        db      " sampler "
        db      0edh, 020h, 085h, 020h, 096h, 020h, 01bh, 04eh, 00ah, 0b6h
        db      " <Send req> "
        db      099h, 020h, 0b7h, 02eh, 00ah, 000h, 08eh, 020h, 081h, 020h, 08ah, 020h, 084h, 020h, 096h, 020h
        db      01bh, 038h, 02ch, 020h, 097h, 020h, 08bh, 00ah, 03ch
        db      "Send>."
        db      00ah, 000h, 01bh, 060h, 020h, 061h, 020h, 0d9h, 020h, 08ah, 020h, 099h
        db      " being "
        db      01bh, 038h, 02ch, 020h, 09bh, 00ah, 0b1h
        db      " side "
        db      085h, 020h, 096h, 020h, 01bh, 038h, 02eh, 020h, 028h, 086h, 020h, 01bh, 05ch, 00ah
        db      "dump "
        db      0fch
        db      " supports mono transfers.)"
        db      00ah, 000h, 09fh, 020h, 061h, 020h, 01bh, 025h, 020h, 084h, 020h, 09bh, 020h, 081h, 020h, 098h
        db      020h, 028h, 091h, 00ah, 08ah, 029h, 020h, 084h, 020h, 096h, 020h, 0e6h, 020h, 01bh, 056h, 020h
        db      031h, 036h, 020h, 01bh, 0fah, 020h, 0d3h, 00ah, 081h, 020h, 031h, 036h, 020h, 01bh, 0f5h, 02eh
        db      020h, 09fh, 020h, 03ch, 01bh, 0d1h, 020h, 0e9h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08fh, 020h, 081h, 020h, 086h, 020h, 01bh, 04ah, 020h, 0ebh, 020h, 0cfh, 020h, 01bh
        db      030h, 020h, 0a5h, 00ah, 01bh
        db      "U dump."
        db      00ah, 000h, 08fh, 020h, 081h, 020h, 086h, 020h, 0b5h, 020h, 0ebh, 020h, 0cfh, 020h, 01bh, 030h
        db      00ah, 0a5h, 020h, 01bh
        db      "U dump."
        db      00ah, 000h
        db      "Set "
        db      088h, 020h, 084h, 020h, 081h, 020h, 01bh, 0e8h, 020h, 086h, 020h, 09ah, 020h, 061h, 073h, 00ah
        db      081h, 020h, 01bh, 011h
        db      " sampler."
        db      00ah, 000h, 08dh, 020h, 096h, 020h, 081h, 020h, 08ah, 020h, 083h, 020h, 0ach, 020h, 081h, 00ah
        db      01bh, 011h
        db      " sampler "
        db      0ech, 020h, 085h, 020h, 097h, 020h, 01bh, 05dh, 00ah, 0c1h
        db      " <Send req> "
        db      096h, 020h, 0bch, 02eh, 00ah, 000h, 08fh, 020h, 081h, 020h, 08ah, 020h, 084h, 020h, 097h, 020h
        db      01bh, 058h, 02ch, 020h, 09ch, 020h, 089h, 00ah, 03ch
        db      "Send>."
        db      00ah, 000h, 01bh
        db      "x a "
        db      0e4h, 020h, 08ah, 020h, 096h
        db      " being "
        db      01bh, 058h, 02ch, 020h, 093h, 00ah, 0b3h
        db      " side "
        db      085h, 020h, 097h, 020h, 01bh, 058h, 02eh, 020h, 028h, 086h, 020h, 01bh, 055h, 00ah
        db      "dump "
        db      0ffh
        db      " supports mono transfers.)"
        db      00ah, 000h, 092h, 020h, 061h, 020h, 01bh, 033h, 020h, 084h, 020h, 093h, 020h, 081h, 020h, 09bh
        db      020h, 028h, 08eh, 00ah, 08ah, 029h, 020h, 084h, 020h, 097h, 020h, 0f4h, 020h, 01bh, 04ch, 020h
        db      031h, 036h, 020h, 01bh, 0c7h, 020h, 0d8h, 00ah, 081h, 020h, 031h, 036h, 020h, 01bh, 0ddh, 02eh
        db      020h, 092h, 020h, 03ch, 01bh, 08fh, 020h, 0eah
        else
        db      00ah, 000h, 090h, 020h, 061h, 020h, 01bh, 023h, 020h, 084h, 020h, 092h, 020h, 081h, 020h, 097h
        db      020h, 028h, 091h, 00ah, 08bh, 029h, 020h, 084h, 020h, 098h, 020h, 0ech, 020h, 01bh, 034h, 020h
        db      031h, 036h, 020h, 01bh, 0a5h, 020h, 0e1h, 00ah, 081h, 020h, 031h, 036h, 020h, 01bh, 0b0h, 02eh
        db      020h, 090h, 020h, 03ch, 01bh, 072h, 020h, 0efh
        endif
        db      ", exit> "
        if      FW_VERSION >= 312
        db      084h, 00ah, 0dfh, 020h, 022h, 031h, 036h, 020h, 01bh, 0fah, 022h, 020h, 01bh, 051h, 02eh, 020h
        db      028h, 089h
        elseif  FW_VERSION = 311
        db      084h, 00ah, 0e2h, 020h, 022h, 031h, 036h, 020h, 01bh, 0c7h, 022h, 020h, 01bh, 050h, 02eh, 020h
        db      028h, 08bh
        else
        db      084h, 00ah, 0f7h, 020h, 022h, 031h, 036h, 020h, 01bh, 0a5h, 022h, 020h, 01bh, 03fh, 02eh, 020h
        db      028h, 089h
        endif
        db      " light "
        if      FW_VERSION >= 312
        db      085h, 00ah, 067h, 06fh, 020h, 0e9h, 02eh, 029h, 00ah, 000h
        db      "VELOCITY ("
        db      0cch, 020h, 08ah, 020h, 01bh, 034h, 020h, 01bh, 056h, 020h, 031h, 036h, 020h, 01bh, 0fah, 029h
        elseif  FW_VERSION = 311
        db      085h, 00ah, 067h, 06fh, 020h, 0eah, 02eh, 029h, 00ah, 000h, 01bh, 001h, 020h, 081h, 020h, 01bh
        db      01ch, 020h, 09eh, 020h, 081h, 020h, 022h
        db      "16 LEVELS"
        db      022h, 00ah, 01bh, 0a3h
        db      ": VELOCITY ("
        db      0d1h, 020h, 08ah, 020h, 01bh, 027h, 020h, 01bh, 04ch, 020h, 031h, 036h, 00ah, 01bh, 0c7h, 020h
        db      0b7h, 020h, 081h, 020h, 031h, 036h, 020h, 01bh, 0ddh, 029h, 020h, 0aah
        db      " NOTE VAR"
        db      00ah, 028h, 061h, 020h, 01bh, 03eh, 020h, 01bh, 057h, 020h, 01bh, 027h, 020h, 01bh
        db      "L 16 tunings,"
        else
        db      085h, 00ah, 067h, 06fh, 020h, 0efh, 02eh, 029h, 00ah, 000h, 01bh, 009h, 020h, 081h, 020h, 01bh
        db      003h, 020h, 09dh, 020h, 081h, 020h, 022h
        db      "16 LEVELS"
        db      022h, 00ah, 01bh, 082h
        db      ": VELOCITY ("
        db      0d5h, 020h, 08bh, 020h, 01bh, 015h, 020h, 01bh, 034h, 020h, 031h, 036h, 00ah, 01bh, 0a5h, 020h
        db      0b4h, 020h, 081h, 020h, 031h, 036h, 020h, 01bh, 0b0h, 029h, 020h, 0abh
        db      " NOTE VAR"
        db      00ah, 028h, 061h, 020h, 01bh, 044h, 020h, 01bh, 05ch, 020h, 01bh, 015h, 020h, 01bh
        db      "4 16 tunings,"
        endif
        db      00ah
        if      FW_VERSION >= 312
        db      "NOTE VAR ("
        db      0cch, 020h, 08ah, 020h, 01bh, 034h, 020h, 01bh, 056h, 020h, 031h, 036h, 00ah
        db      "tunings, attacks, "
        db      01bh, 01fh, 020h, 01bh, 0a6h, 020h, 0adh, 00ah
        db      "decays)."
        db      00ah, 000h
        elseif  FW_VERSION = 311
        db      "attacks, decays "
        db      0aah, 020h, 01bh, 03bh, 020h, 01bh, 0c3h, 029h, 02eh, 00ah, 000h
        else
        db      "attacks, decays "
        db      0abh, 020h, 01bh, 02ah, 020h, 01bh, 095h, 029h, 02eh, 00ah, 000h
        endif
        db      "When "
        db      022h
        db      "Param"
        db      022h
        db      " = NOTE VAR, "
        if      FW_VERSION >= 312
        db      087h, 020h, 09dh, 00ah, 01bh, 0c5h, 020h, 01bh, 0f9h
        db      ", DECAY, "
        db      0adh
        db      " ATTACK."
        db      00ah, 000h, 01bh, 060h, 020h, 01bh, 0f9h, 020h, 099h, 020h, 08dh, 02ch, 020h, 087h, 020h, 01bh
        db      053h, 00ah, 0b1h, 020h, 01bh, 025h, 020h, 028h, 034h, 02dh, 031h, 033h, 029h, 020h, 085h, 020h
        db      0ach, 020h, 081h, 020h, 08ah, 00ah, 0d3h, 020h, 01bh, 088h, 020h, 01bh, 05ah, 020h, 0a2h, 02eh
        db      00ah, 000h, 08eh, 020h, 0bbh, 020h, 081h, 020h, 08ah, 020h, 01bh, 033h, 020h, 084h, 020h, 096h
        db      00ah, 0b8h, 020h, 01bh, 09fh, 020h, 081h, 020h, 098h
        elseif  FW_VERSION = 311
        db      088h, 020h, 0a0h, 00ah, 01bh, 0eah, 020h, 081h, 020h, 0d3h, 020h, 084h, 020h, 097h
        db      " modified"
        db      00ah
        db      "(TUNING, DECAY, ATTACK "
        db      0aah
        db      " FILTER)."
        db      00ah, 000h, 01bh
        db      "x TUNING "
        db      096h, 020h, 08ch, 02ch, 020h, 088h, 020h, 0a0h, 00ah, 01bh, 06ah, 020h, 0b3h, 020h, 01bh, 033h
        db      020h, 028h, 034h, 02dh, 031h, 033h, 029h, 020h, 085h, 020h, 0b0h, 00ah, 081h, 020h, 08ah, 020h
        db      0d8h, 020h, 01bh, 09fh, 020h, 01bh, 071h, 020h, 0a2h, 02eh, 00ah, 000h, 08fh, 020h, 0b4h, 020h
        db      081h, 020h, 08ah, 020h, 01bh, 044h, 020h, 084h, 020h, 097h, 00ah, 0cch, 020h, 01bh, 0d0h, 020h
        db      081h, 020h, 09bh
        else
        db      086h, 020h, 0a0h, 00ah, 01bh, 0c8h, 020h, 081h, 020h, 0c9h, 020h, 084h, 020h, 098h
        db      " modified"
        db      00ah, 028h, 01bh, 0eah
        db      ", DECAY, ATTACK "
        db      0abh
        db      " FILTER)."
        db      00ah, 000h, 01bh, 0c1h, 020h, 01bh, 0eah, 020h, 0a6h, 020h, 08ah, 02ch, 020h, 086h, 020h, 0a0h
        db      00ah, 01bh, 056h, 020h, 0b3h, 020h, 01bh, 023h, 020h, 028h, 034h, 02dh, 031h, 033h, 029h, 020h
        db      085h, 020h, 0afh, 00ah, 081h, 020h, 08bh, 020h, 0e1h, 020h, 01bh, 097h, 020h, 01bh, 063h, 020h
        db      09bh, 02eh, 00ah, 000h, 08fh, 020h, 0b1h, 020h, 081h, 020h, 08bh, 020h, 01bh, 03ah, 020h, 084h
        db      020h, 098h, 00ah, 0c1h, 020h, 01bh, 0fbh, 020h, 081h, 020h, 097h
        endif
        db      " variation "
        if      FW_VERSION >= 312
        db      01bh, 0a5h, 03ah, 00ah
        db      "ATTACK, DECAY, "
        db      01bh, 0f9h, 020h, 0adh
        elseif  FW_VERSION = 311
        db      01bh, 0bbh, 03ah, 00ah
        db      "ATTACK, DECAY, TUNING "
        db      0aah
        else
        db      01bh, 099h, 03ah, 00ah
        db      "ATTACK, DECAY, "
        db      01bh, 0eah, 020h, 0abh
        endif
        db      " FILTER."
        if      FW_VERSION >= 312
        db      00ah, 000h, 089h, 020h, 0a0h, 020h, 0edh, 020h, 085h, 020h, 096h, 020h, 01bh, 038h, 020h, 0b6h
        db      020h, 081h, 00ah, 0deh
        elseif  FW_VERSION = 311
        db      00ah, 000h, 08bh, 020h, 0a4h, 020h, 0ech, 020h, 085h, 020h, 097h, 020h, 01bh, 058h, 020h, 0c1h
        db      020h, 081h, 00ah, 0f2h
        else
        db      00ah, 000h, 089h, 020h, 0a1h, 020h, 0dfh, 020h, 085h, 020h, 098h, 020h, 01bh, 089h, 020h, 0bah
        db      020h, 081h, 00ah, 0e6h
        endif
        db      " Var "
        if      FW_VERSION >= 312
        db      01bh, 0a5h, 020h, 099h, 020h, 01bh, 056h, 020h, 022h, 030h, 022h, 02eh, 00ah, 000h, 089h, 020h
        db      0a0h, 020h, 0edh, 020h, 085h, 020h, 096h, 020h, 01bh, 038h, 020h, 0b6h, 020h, 081h, 00ah, 0deh
        elseif  FW_VERSION = 311
        db      01bh, 0bbh, 020h, 096h, 020h, 01bh, 04ch, 020h, 022h, 030h, 022h, 02eh, 00ah, 000h, 08bh, 020h
        db      0a4h, 020h, 0ech, 020h, 085h, 020h, 097h, 020h, 01bh, 058h, 020h, 0c1h, 020h, 081h, 00ah, 0f2h
        else
        db      01bh, 099h, 020h, 0a6h, 020h, 01bh, 034h, 020h, 022h, 030h, 022h, 02eh, 00ah, 000h, 089h, 020h
        db      0a1h, 020h, 0dfh, 020h, 085h, 020h, 098h, 020h, 01bh, 089h, 020h, 0bah, 020h, 081h, 00ah, 0e6h
        endif
        db      " Var "
        if      FW_VERSION >= 312
        db      01bh, 0a5h, 020h, 099h, 020h, 01bh, 056h, 020h, 022h, 031h, 030h, 022h, 02eh, 00ah, 000h, 089h
        elseif  FW_VERSION = 311
        db      01bh, 0bbh, 020h, 096h, 020h, 01bh, 04ch, 020h, 022h, 031h, 030h, 022h, 02eh, 00ah, 000h, 00ah
        db      08bh
        else
        db      01bh, 099h, 020h, 0a6h, 020h, 01bh, 034h, 020h, 022h, 031h, 030h, 022h, 02eh, 00ah, 000h, 00ah
        db      089h
        endif
        db      " requested "
        if      FW_VERSION >= 312
        db      08fh, 020h, 01bh, 0a2h, 020h, 01bh, 031h, 020h, 01bh, 0d9h, 020h, 0e9h, 00ah, 081h, 020h, 095h
        db      02eh, 020h, 0abh
        db      " try "
        db      01bh, 019h, 02eh, 00ah, 000h, 08ch, 020h, 01bh, 004h, 020h, 028h, 0adh, 020h, 01bh, 054h, 020h
        db      095h, 020h, 01bh, 006h, 029h, 00ah, 0b9h, 020h, 081h, 020h, 01bh, 0bbh, 020h, 01bh, 0e5h, 020h
        db      028h, 035h, 031h, 032h, 020h, 0a4h, 00ah, 01bh, 054h, 020h, 095h, 020h, 01bh, 006h, 02ch, 020h
        db      032h, 032h, 034h, 020h, 0a4h
        elseif  FW_VERSION = 311
        db      091h, 020h, 01bh, 0a2h, 020h, 01bh, 01eh, 020h, 01bh, 084h, 020h, 0eah, 00ah, 081h, 020h, 094h
        db      02eh, 020h, 0a8h, 020h, 01bh, 0ebh, 020h, 0eeh, 02eh, 00ah, 000h, 08dh, 020h, 01bh, 020h, 020h
        db      028h, 0aah, 020h, 01bh, 06bh, 020h, 094h, 020h, 0fbh, 029h, 00ah, 0beh, 020h, 081h
        db      " maximum "
        db      01bh, 092h, 020h, 028h, 035h, 031h, 032h, 020h, 0a5h, 00ah, 01bh, 06bh, 020h, 094h, 020h, 0fbh
        db      02ch, 020h, 032h, 032h, 034h, 020h, 0a5h
        else
        db      093h
        db      " was "
        db      01bh
        db      "9 found "
        db      0efh, 00ah, 081h, 020h, 095h, 02eh, 020h, 09fh, 020h, 01bh, 0c6h, 020h, 0e3h, 02eh, 00ah, 000h
        db      08dh, 020h, 01bh, 016h, 020h, 028h, 0abh, 020h, 01bh, 040h, 020h, 095h, 020h, 0f2h, 029h, 00ah
        db      0cfh, 020h, 081h
        db      " maximum "
        db      01bh, 07fh, 020h, 028h, 035h, 031h, 032h, 020h, 0a4h, 00ah, 01bh, 040h, 020h, 095h, 020h, 0f2h
        db      02ch, 020h, 032h, 032h, 034h, 020h, 0a4h
        endif
        db      " 1.4MB"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 004h, 020h, 0adh, 020h, 031h, 031h, 032h, 020h, 0a4h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 020h, 020h, 0aah, 020h, 031h, 031h, 032h, 020h, 0a5h
        else
        db      00ah, 01bh, 016h, 020h, 0abh, 020h, 031h, 031h, 032h, 020h, 0a4h
        endif
        db      " 793KB "
        if      FW_VERSION >= 312
        db      01bh, 004h, 029h, 02eh, 020h, 01bh, 09dh, 00ah, 0a8h, 020h, 01bh, 004h, 020h, 028h, 0adh, 020h
        db      01bh, 006h, 029h, 020h, 0adh, 00ah, 0dah, 020h, 01bh, 0b8h, 020h, 01bh, 0e5h, 02eh, 00ah, 000h
        db      0d8h, 020h, 099h, 020h, 01bh, 031h, 020h, 01bh
        db      "] room "
        db      0e9h, 020h, 081h, 020h, 01bh, 004h, 00ah, 095h, 020h, 0adh, 020h, 01bh, 054h, 020h, 095h, 020h
        db      01bh, 006h, 020h, 084h, 020h, 01bh, 091h, 020h, 081h, 00ah, 08fh, 02eh, 00ah, 000h, 041h, 020h
        db      08fh
        db      " already exists "
        db      0d3h, 020h, 087h, 020h, 0a1h, 02eh, 00ah, 0abh, 020h, 09bh, 020h, 0a8h, 020h, 0a1h, 020h, 0adh
        db      020h, 0dah, 00ah, 081h, 020h, 0c2h, 020h, 08fh, 02eh, 00ah, 000h, 08ch, 020h, 08fh, 020h, 01bh
        db      009h, 020h, 096h, 020h, 0dch
        elseif  FW_VERSION = 311
        db      01bh, 020h, 029h, 02eh, 020h, 01bh, 070h, 00ah, 0a9h, 020h, 01bh, 020h, 020h, 028h, 0aah, 020h
        db      0fbh, 029h, 020h, 0aah, 00ah, 0e5h, 020h, 01bh, 06dh, 020h, 01bh, 092h, 02eh, 00ah, 000h, 0dah
        db      020h, 096h, 020h, 01bh, 01eh, 020h, 01bh
        db      "u room "
        db      0eah, 020h, 081h, 020h, 01bh, 020h, 00ah, 094h, 020h, 0aah, 020h, 01bh, 06bh, 020h, 094h, 020h
        db      0fbh, 020h, 084h, 020h, 01bh, 0a4h, 020h, 081h, 00ah, 091h, 02eh, 020h, 01bh
        db      "p a "
        db      094h, 020h, 0aah, 020h, 0fbh, 020h, 0d8h, 020h, 0f3h, 00ah, 01bh, 0e4h, 020h, 01bh, 081h, 02eh
        db      00ah, 000h, 041h, 020h, 091h
        db      " already exists "
        db      0d8h, 020h, 088h, 020h, 0abh, 02eh, 00ah, 0a8h, 020h, 093h, 020h, 0a9h, 020h, 0abh, 020h, 0aah
        db      020h, 0e5h, 00ah, 081h, 020h, 0bdh, 020h, 091h, 02eh, 00ah, 000h, 08dh, 020h, 091h, 020h, 01bh
        db      038h, 020h, 097h, 020h, 0e6h
        else
        db      01bh, 016h, 029h, 02eh, 020h, 01bh, 05fh, 00ah, 0a7h, 020h, 01bh, 016h, 020h, 028h, 0abh, 020h
        db      0f2h, 029h, 020h, 0abh, 00ah, 0deh, 020h, 01bh, 05bh, 020h, 01bh, 07fh, 02eh, 00ah, 000h, 0f4h
        db      020h, 0a6h, 020h, 01bh, 039h, 020h, 01bh
        db      "` room "
        db      0efh, 020h, 081h, 020h, 01bh, 016h, 00ah, 095h, 020h, 0abh, 020h, 01bh, 040h, 020h, 095h, 020h
        db      0f2h, 020h, 084h, 020h, 01bh, 0bdh, 020h, 081h, 00ah, 093h, 02eh, 020h, 01bh, 05fh, 020h, 061h
        db      020h, 095h, 020h, 0abh, 020h, 0f2h, 020h, 0e1h, 020h, 01bh, 01ah, 00ah, 01bh, 0c3h, 020h, 01bh
        db      079h, 02eh, 00ah, 000h, 041h, 020h, 093h
        db      " already "
        db      01bh, 0f3h, 020h, 0e1h, 020h, 086h, 020h, 0adh, 02eh, 00ah, 09fh, 020h, 092h, 020h, 0a7h, 020h
        db      0adh, 020h, 0abh, 020h, 0deh, 00ah, 081h, 020h, 0b6h, 020h, 093h, 02eh, 00ah, 000h, 08dh, 020h
        db      093h, 020h, 01bh, 04ah, 020h, 098h, 020h, 01bh, 014h
        endif
        db      " since "
        if      FW_VERSION >= 312
        db      0f1h, 00ah, 0b9h
        elseif  FW_VERSION = 311
        db      0f5h, 00ah, 0beh
        else
        db      0dch, 00ah, 0cfh
        endif
        db      " invalid "
        if      FW_VERSION >= 312
        db      0a5h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      0a3h
        db      ". Try loading a"
        db      00ah, 01bh, 01fh, 020h, 091h, 02eh, 00ah, 000h
        else
        db      0a5h
        db      ". Try loading a"
        db      00ah, 01bh, 011h, 020h, 093h, 02eh, 00ah, 000h
        endif
        db      "Source "
        if      FW_VERSION >= 312
        db      091h, 020h, 01bh, 008h, 020h, 01bh, 0b4h, 020h, 0e2h, 00ah, 0c9h
        elseif  FW_VERSION = 311
        db      08eh, 020h, 0b8h, 020h, 01bh, 079h, 020h, 0cfh, 00ah, 0c6h
        else
        db      091h, 020h, 0c2h, 020h, 01bh, 055h, 020h, 0d6h, 00ah, 0d9h
        endif
        db      " differently. Both "
        if      FW_VERSION >= 312
        db      01bh, 0b4h, 00ah, 01bh, 052h, 020h, 096h
        db      " high density (HD) "
        db      01bh, 0b4h, 00ah, 0c9h, 020h, 084h
        elseif  FW_VERSION = 311
        db      01bh, 079h, 00ah, 01bh, 06fh, 020h, 097h
        db      " double density (DD) "
        db      01bh, 079h, 00ah, 0c6h, 020h, 084h
        else
        db      01bh, 055h, 00ah, 01bh, 05eh, 020h, 098h
        db      " double density (DD) "
        db      01bh, 055h, 00ah, 0d9h, 020h, 084h
        endif
        db      " 1.44MB "
        if      FW_VERSION >= 312
        db      0e9h, 020h, 081h, 020h, 01bh, 069h, 033h, 030h, 030h, 030h, 02eh, 00ah, 000h
        db      "Sorry, "
        db      087h, 020h, 08fh, 020h, 028h, 0adh
        db      " possibly "
        db      081h, 00ah, 01bh, 0adh, 020h, 095h, 029h, 020h, 0b9h
        db      " damaged "
        db      0a5h, 02eh, 00ah
        db      "For safety, transfer any "
        db      01bh
        db      "0 good"
        db      00ah, 01bh, 0e5h, 020h, 0e9h, 020h, 087h, 020h, 095h, 020h, 084h, 020h, 0a8h, 020h, 095h, 00ah
        db      091h
        db      " stop "
        db      01bh, 018h, 020h, 087h, 020h, 095h, 02eh, 00ah, 000h, 0d8h, 020h, 099h, 020h, 01bh, 088h, 020h
        db      095h, 020h, 0aeh, 020h, 081h, 020h, 01bh, 011h, 020h, 01bh, 054h, 020h, 095h, 00ah, 01bh, 04ch
        db      02eh, 020h, 0abh, 020h, 0f2h, 020h, 061h, 020h, 095h, 02eh, 00ah, 000h, 0d8h, 020h, 099h, 020h
        db      01bh, 088h, 020h, 01bh, 004h, 020h, 095h, 020h, 0aeh, 020h, 081h, 020h, 01bh, 04ch, 02eh, 00ah
        db      0abh, 020h, 0f2h, 020h, 061h, 020h, 095h, 02eh, 00ah, 000h, 08ch, 020h, 095h, 020h, 099h, 020h
        db      01bh, 0a8h, 020h, 01bh, 031h, 020h, 0c9h, 02ch, 020h, 0adh, 00ah, 0c9h, 020h, 01bh, 09fh, 020h
        db      061h, 020h, 01bh, 071h, 020h, 0e5h
        db      " such"
        db      00ah, 061h, 073h, 020h, 081h
        db      " Akai S3000, "
        db      0adh
        db      " possibly bad."
        elseif  FW_VERSION = 311
        db      0eah, 020h, 081h, 020h, 01bh, 064h, 033h, 030h, 030h, 030h, 02eh, 00ah, 000h
        db      "Sorry, "
        db      088h, 020h, 091h, 020h, 028h, 0aah
        db      " possibly "
        db      081h, 00ah, 01bh, 0c8h, 020h, 094h, 029h, 020h, 0beh
        db      " damaged "
        db      0a3h, 02eh, 00ah
        db      "For safety, transfer any "
        db      01bh, 022h
        db      " good"
        db      00ah, 01bh, 092h, 020h, 0eah, 020h, 088h, 020h, 094h, 020h, 084h, 020h, 0a9h, 020h, 094h, 00ah
        db      08eh
        db      " stop "
        db      01bh, 030h, 020h, 088h, 020h, 094h, 02eh, 00ah, 000h, 00ah, 0dah, 020h, 096h, 020h, 01bh, 09fh
        db      020h, 094h, 020h, 0ach, 020h, 081h, 020h, 0efh, 020h, 01bh, 06bh, 020h, 094h, 00ah, 01bh, 065h
        db      02eh, 020h, 0a8h, 020h, 01bh, 009h, 020h, 061h, 020h, 094h, 02eh, 00ah, 000h, 00ah, 0dah, 020h
        db      096h, 020h, 01bh, 09fh, 020h, 01bh, 020h, 020h, 094h, 020h, 0ach, 020h, 081h, 020h, 01bh, 065h
        db      02eh, 00ah, 0a8h, 020h, 01bh, 009h, 020h, 061h, 020h, 094h, 02eh, 00ah, 000h, 08dh, 020h, 094h
        db      020h, 096h, 020h, 01bh, 05bh, 020h, 01bh, 01eh, 020h, 0c6h, 02ch, 020h, 0aah, 00ah, 0c6h, 020h
        db      01bh, 0d0h, 020h, 061h, 020h, 01bh, 01fh, 020h, 0cah
        db      " such"
        db      00ah, 061h, 073h, 020h, 081h
        db      " Akai S3000, "
        db      0aah
        db      " possibly bad."
        else
        db      0efh, 020h, 081h
        db      " MPC3000."
        db      00ah, 000h, 00ah, 08dh, 020h, 093h, 020h, 01bh, 084h, 020h, 01bh
        db      "| damaged! However,"
        db      00ah, 01bh, 037h, 020h, 01bh, 07fh, 020h, 0efh, 020h, 086h, 020h, 095h
        db      " may "
        db      098h
        db      " OK."
        db      00ah, 09fh, 020h, 01bh, 0bfh, 020h, 061h, 020h, 01bh, 011h, 020h, 095h, 02eh, 00ah, 000h, 00ah
        db      0f4h, 020h, 0a6h, 020h, 01bh, 097h, 020h, 095h, 020h, 0b0h, 020h, 081h
        db      " SCSI "
        db      01bh, 040h, 020h, 095h, 00ah, 01bh, 0a7h, 02eh, 020h, 09fh, 020h, 0fah, 020h, 061h, 020h, 095h
        db      02eh, 00ah, 000h, 00ah, 0f4h, 020h, 0a6h, 020h, 01bh, 097h, 020h, 01bh, 016h, 020h, 095h, 020h
        db      0b0h, 020h, 081h, 020h, 01bh, 0a7h, 02eh, 00ah, 09fh, 020h, 0fah, 020h, 061h, 020h, 095h, 02eh
        db      00ah, 000h, 08dh, 020h, 095h, 020h, 0a6h, 020h, 01bh
        db      "K bad, "
        db      01bh, 039h, 020h, 0d9h, 00ah, 0abh, 020h, 0d9h, 020h, 01bh, 0fbh, 020h, 061h, 020h, 01bh, 011h
        db      " device."
        endif
        db      00ah
        db      "Either "
        if      FW_VERSION >= 312
        db      0f4h, 020h, 0f1h, 020h, 0adh, 020h, 01bh
        db      "k a "
        db      01bh, 071h, 00ah, 095h, 02eh, 020h, 08ch, 020h, 01bh, 0a0h
        db      " could "
        db      01bh, 0beh
        db      " appear "
        db      01bh, 046h, 00ah
        db      "a CD-ROM "
        db      099h, 020h, 081h, 020h, 08dh, 020h, 01bh, 011h, 020h, 0e5h, 02eh, 00ah, 000h, 08ch, 020h, 095h
        db      020h, 099h
        db      " write protected. Reset "
        db      081h, 00ah, 095h
        elseif  FW_VERSION = 311
        db      01bh, 005h, 020h, 0f5h, 020h, 0aah, 020h, 01bh, 0c4h, 020h, 061h, 020h, 01bh, 01fh, 00ah, 094h
        db      02eh, 020h, 08dh, 020h, 01bh, 0b5h
        db      " could also appear "
        db      01bh, 053h, 00ah
        db      "a CD-ROM "
        db      096h, 020h, 081h, 020h, 08ch, 020h, 0efh, 020h, 0cah, 02eh, 00ah, 000h, 08bh, 020h, 01bh, 0a4h
        db      020h, 01bh, 07bh, 020h, 01bh, 0a9h
        db      " canceled "
        db      01bh, 003h, 020h, 081h, 00ah, 094h, 020h, 096h
        db      " write protected. "
        db      0a8h
        db      " reset"
        db      00ah, 081h, 020h, 094h
        else
        db      01bh, 0a6h, 020h, 0dch, 020h, 0abh, 020h, 01bh, 0bfh, 020h, 061h, 020h, 01bh, 011h, 00ah, 095h
        db      02eh, 00ah, 000h, 089h, 020h, 01bh, 0bdh, 020h, 01bh, 084h, 020h, 01bh
        db      "| canceled "
        db      01bh, 00dh, 020h, 081h, 00ah, 095h, 020h, 0a6h
        db      " write protected. "
        db      09fh
        db      " reset"
        db      00ah, 081h, 020h, 095h
        endif
        db      "'s write protect tab "
        if      FW_VERSION >= 312
        db      091h, 020h, 01bh, 091h, 00ah, 01bh, 019h, 02eh, 00ah, 000h, 041h, 020h, 095h, 020h, 01bh, 0a0h
        db      " occurred "
        db      0edh
        db      " indicates a"
        db      00ah, 01bh, 092h
        db      " bad "
        db      01bh, 04ch, 02eh, 020h, 01bh, 0d1h, 020h, 01bh, 0ach, 020h, 01bh, 0d2h, 020h, 091h, 00ah, 0e9h
        db      020h, 091h
        db      " try "
        db      01bh, 019h, 02eh, 020h, 01bh
        db      "` problem persists,"
        elseif  FW_VERSION = 311
        db      08eh, 020h, 01bh, 0a4h, 00ah, 0eeh, 02eh, 00ah, 000h, 041h, 020h, 094h, 020h, 01bh, 065h, 020h
        db      01bh, 0b5h
        db      " occurred "
        db      0ech, 00ah
        db      "indicates a fault "
        db      0ach, 020h, 081h
        db      " electronics."
        db      00ah, 01bh, 08fh, 020h, 01bh, 05fh, 020h, 01bh, 0f2h, 020h, 08eh, 020h, 0eah, 020h, 08eh, 020h
        db      01bh, 0ebh, 020h, 0eeh, 02eh, 00ah, 01bh
        db      "x problem still exists, please have"
        db      00ah, 081h
        db      " unit repaired "
        db      01bh
        db      "L your nearest"
        else
        db      091h, 020h, 01bh, 0bdh, 00ah, 0e3h, 02eh, 00ah, 000h, 041h, 020h, 095h, 020h, 01bh, 0a7h
        db      " error occurred "
        db      0dfh, 00ah
        db      "indicates a fault "
        db      0b0h, 020h, 081h
        db      " electronics."
        db      00ah, 01bh, 072h, 020h, 01bh, 0d7h, 020h, 01bh, 0e0h, 020h, 091h, 020h, 0efh, 020h, 091h, 020h
        db      01bh, 0c6h, 020h, 0e3h, 02eh, 00ah, 01bh, 0c1h
        db      " problem still "
        db      01bh, 0f3h
        db      ", please "
        db      01bh, 0e4h, 00ah, 081h
        db      " unit repaired "
        db      01bh
        db      "4 your nearest"
        endif
        db      00ah
        if      FW_VERSION >= 312
        db      "contact your service center."
        db      00ah, 000h, 08ch, 020h, 095h, 020h, 099h
        db      " unusable--a defect "
        db      01bh, 0a2h, 00ah, 01bh, 0d9h, 020h, 0aeh, 020h, 081h
        elseif  FW_VERSION = 311
        db      "service center."
        db      00ah, 000h, 08dh, 020h, 094h, 020h, 096h
        db      " unusable--a defect "
        db      01bh, 0a2h, 00ah, 01bh, 084h, 020h, 0ach, 020h, 081h
        else
        db      "service center."
        db      00ah, 000h, 08dh, 020h, 095h, 020h, 0a6h
        db      " unusable--a defect was"
        db      00ah
        db      "found "
        db      0b0h, 020h, 081h
        endif
        db      " area reserved "
        if      FW_VERSION >= 312
        db      0a4h, 020h, 081h, 020h, 08fh, 00ah
        elseif  FW_VERSION = 311
        db      0a5h, 020h, 081h, 020h, 091h, 00ah
        else
        db      0a4h, 020h, 081h, 020h, 093h, 00ah
        endif
        db      "directory. "
        if      FW_VERSION >= 312
        db      0abh, 020h, 0f2h, 020h, 0a8h, 020h, 095h, 00ah, 091h
        db      " try "
        db      01bh, 019h, 02eh, 00ah, 000h, 08ch, 020h, 095h, 020h, 0cah, 020h, 01bh, 0b2h, 020h, 01bh, 0f3h
        db      " cancelled"
        db      00ah, 0f9h, 020h, 061h, 020h, 01bh, 092h, 020h, 0cch, 02dh, 0afh, 020h, 01bh, 0a0h, 020h, 01bh
        db      0a2h, 00ah
        elseif  FW_VERSION = 311
        db      0a8h, 020h, 01bh, 009h, 020h, 0a9h, 020h, 094h, 00ah, 08eh, 020h, 01bh, 0ebh, 020h, 0eeh, 02eh
        db      00ah, 000h, 08dh, 020h, 094h, 020h, 0d5h, 020h, 01bh, 07bh, 020h, 01bh, 0a9h
        db      " cancelled"
        db      00ah, 01bh, 003h
        db      " a possible "
        db      0d1h, 02dh, 0afh, 020h, 01bh, 0b5h, 020h, 01bh, 0a2h, 00ah
        else
        db      09fh, 020h, 0fah, 020h, 0a7h, 020h, 095h, 00ah, 091h, 020h, 01bh, 0c6h, 020h, 0e3h, 02eh, 00ah
        db      000h, 08dh, 020h, 095h, 020h, 0cbh, 020h, 01bh, 084h, 020h, 01bh
        db      "| cancelled"
        db      00ah, 01bh, 00dh
        db      " a possible "
        db      0d5h, 02dh, 0ach
        db      " error was"
        db      00ah
        endif
        db      "detected. "
        if      FW_VERSION >= 312
        db      0abh
        db      " try "
        db      081h, 020h, 0cah, 00ah, 01bh, 019h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 0efh, 020h, 01bh, 0a2h
        db      " unable "
        elseif  FW_VERSION = 311
        db      0a8h, 020h, 01bh, 0ebh, 020h, 081h, 020h, 0d5h, 00ah, 0eeh, 02eh, 00ah, 000h, 08bh
        db      " system "
        db      01bh, 0a2h
        db      " unable "
        else
        db      09fh, 020h, 01bh, 0c6h, 020h, 081h, 020h, 0cbh, 00ah, 0e3h, 02eh, 00ah, 000h, 089h
        db      " system was unable "
        endif
        db      084h
        db      " access "
        if      FW_VERSION >= 312
        db      081h, 00ah, 01bh, 054h, 020h, 095h
        db      ". Be sure "
        db      081h, 020h, 01bh, 011h, 020h, 01bh, 04ch, 020h, 099h, 00ah, 01bh, 0e8h, 020h, 0e9h, 02ch, 020h
        db      01bh, 090h, 020h, 01bh, 02ch, 02ch, 020h, 091h, 00ah, 0c9h, 02eh, 00ah, 000h, 04eh, 06fh, 020h
        db      01bh, 011h, 020h, 0e5h, 020h, 01bh, 0a2h, 020h, 01bh, 0d9h
        db      ". Make sure "
        db      081h, 00ah, 01bh, 011h, 020h, 0e5h, 020h, 099h, 020h, 01bh, 02ch, 02ch, 020h, 01bh, 0ach, 020h
        db      099h, 020h, 0e9h, 00ah, 091h, 020h, 022h
        db      "AUTO"
        db      022h, 020h, 0adh, 020h, 081h, 020h, 01bh, 07fh, 020h, 01bh, 011h, 020h, 01bh, 0c2h, 00ah, 099h
        db      020h, 0eeh, 020h, 0aeh, 020h, 081h, 020h, 022h, 01bh, 011h
        db      " Status"
        db      022h, 020h, 0beh, 02eh, 00ah, 000h, 08ch, 020h, 095h, 020h, 099h, 020h, 01bh
        db      "1 an Akai S1000 "
        db      0adh, 020h, 053h, 033h, 030h, 030h, 030h, 00ah, 095h, 02ch, 020h, 0adh, 020h, 099h, 020h, 01bh
        db      031h, 020h, 0c9h, 02ch, 020h, 0c9h, 020h, 01bh, 09fh, 00ah, 061h, 020h, 01bh, 071h, 020h, 0e5h
        db      02ch, 020h, 0adh, 020h, 099h
        db      " bad."
        db      00ah, 000h
        db      "Hard "
        db      095h, 020h, 0f4h
        db      " failure. "
        db      0abh
        db      " check"
        db      00ah, 0edh, 020h, 081h, 020h, 01bh, 054h, 020h, 095h, 020h, 099h, 020h, 01bh, 0e8h, 020h, 0e9h
        db      020h, 091h, 00ah, 01bh, 090h, 020h, 01bh, 02ch, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      081h, 00ah, 01bh, 06bh, 020h, 094h
        db      ". Be "
        db      01bh, 0d4h, 020h, 081h, 020h, 0efh, 020h, 01bh, 065h, 020h, 096h, 00ah
        db      "turned "
        db      0eah, 02ch, 020h, 01bh, 037h, 020h, 01bh, 000h, 02ch, 020h, 08eh, 00ah, 0c6h, 02eh, 00ah, 000h
        db      04eh, 06fh, 020h, 0efh, 020h, 0cah, 020h, 01bh, 0a2h, 020h, 01bh, 084h, 02eh, 020h, 01bh, 0cdh
        db      020h, 01bh, 0d4h, 020h, 081h, 00ah, 0efh, 020h, 0cah, 020h, 096h, 020h, 01bh, 000h, 02ch, 020h
        db      01bh, 05fh, 020h, 096h, 020h, 0eah, 00ah, 08eh, 020h, 022h
        db      "AUTO"
        db      022h, 020h, 0aah, 020h, 081h, 020h, 01bh, 08dh, 020h, 0efh, 020h, 01bh, 0d2h, 00ah, 096h, 020h
        db      01bh, 018h, 020h, 0ach, 020h, 081h, 020h, 022h, 0efh
        db      " Status"
        db      022h, 020h, 0cbh, 02eh, 00ah, 000h, 08dh, 020h, 094h, 020h, 096h, 020h, 01bh, 01eh, 020h, 01bh
        db      0ach
        db      " Akai S1000 "
        db      0aah, 020h, 053h, 033h, 030h, 030h, 030h, 00ah, 094h, 02ch, 020h, 0aah, 020h, 096h, 020h, 01bh
        db      01eh, 020h, 0c6h, 02ch, 020h, 0c6h, 020h, 01bh, 0d0h, 00ah, 061h, 020h, 01bh, 01fh, 020h, 0cah
        db      02ch, 020h, 0aah, 020h, 096h
        db      " bad."
        db      00ah, 000h
        db      "Hard "
        db      094h, 020h, 01bh, 005h
        db      " failure. "
        db      0a8h
        db      " check"
        db      00ah, 0ech, 020h, 081h, 020h, 01bh, 06bh, 020h, 094h, 020h, 096h
        db      " turned "
        db      0eah, 020h, 08eh, 00ah, 01bh, 037h, 020h, 01bh, 000h, 02eh, 00ah, 000h
        else
        db      081h, 00ah, 01bh, 040h, 020h, 095h
        db      ". Be sure "
        db      081h
        db      " SCSI "
        db      01bh, 0a7h, 020h, 0a6h, 00ah, 01bh, 0ebh, 020h, 0efh, 02ch, 020h, 01bh, 090h, 020h, 01bh, 06ah
        db      02ch, 020h, 091h, 00ah, 0d9h, 02eh, 00ah, 000h
        endif
        db      "Can't "
        if      FW_VERSION >= 312
        db      01bh, 08dh
        db      " Edit "
        db      01bh, 0ech, 020h, 0e9h, 020h, 0f9h, 020h, 081h, 00ah
        db      "source "
        db      082h, 020h, 099h, 020h, 01bh, 0afh, 02eh, 00ah, 000h, 0d8h, 020h, 099h, 020h, 01bh, 031h, 020h
        db      01bh, 05dh, 020h, 082h, 020h, 0b4h, 00ah, 01bh, 081h, 020h, 084h, 020h, 01bh, 080h, 020h, 087h
        db      020h, 0cah, 02eh, 00ah, 0abh, 020h, 0dah, 020h, 01bh, 0b8h, 020h, 09ch, 02eh, 00ah, 000h, 08ch
        db      020h, 08fh, 020h, 01bh, 009h, 020h, 096h, 020h, 0dch, 020h, 0d3h, 020h, 087h, 00ah
        elseif  FW_VERSION = 311
        db      01bh, 086h
        db      " Edit Loop "
        db      0eah, 020h, 01bh, 003h, 020h, 081h, 00ah, 01bh, 074h, 020h, 082h, 020h, 096h
        db      " unused."
        db      00ah, 000h, 00ah, 0dah, 020h, 096h, 020h, 01bh, 01eh, 020h, 01bh, 075h, 020h, 082h, 020h, 0b1h
        db      00ah, 01bh, 09eh, 020h, 084h, 020h, 01bh, 091h, 020h, 088h, 020h, 0d5h, 02eh, 00ah, 0a8h, 020h
        db      0e5h, 020h, 01bh, 06dh, 020h, 09dh, 020h, 08eh, 020h, 01bh, 0ebh, 00ah, 0eeh, 02eh, 00ah, 000h
        db      00ah, 08dh, 020h, 091h, 020h, 01bh, 038h, 020h, 097h, 020h, 0e6h, 020h, 0d8h, 020h, 088h, 00ah
        else
        db      01bh, 081h
        db      " Edit "
        db      01bh, 0f5h, 020h, 0efh, 020h, 01bh, 00dh, 020h, 081h, 00ah, 01bh, 09eh, 020h, 082h, 020h, 0a6h
        db      020h, 01bh, 0fch, 02eh, 00ah, 000h, 00ah, 0f4h, 020h, 0a6h, 020h, 01bh, 039h, 020h, 01bh, 060h
        db      020h, 082h, 020h, 0c5h, 00ah, 01bh, 0d2h, 020h, 084h, 020h, 01bh, 068h, 020h, 086h, 020h, 0cbh
        db      02eh, 00ah, 09fh, 020h, 0deh, 020h, 01bh, 05bh, 020h, 09ch, 020h, 091h, 020h, 01bh, 0c6h, 00ah
        db      0e3h, 02eh, 00ah, 000h, 00ah, 08dh, 020h, 093h, 020h, 01bh, 04ah, 020h, 098h, 020h, 01bh, 014h
        db      020h, 0e1h, 020h, 086h, 00ah
        endif
        db      "version "
        if      FW_VERSION >= 312
        db      09eh, 020h, 081h, 020h, 01bh, 099h, 02eh, 00ah, 000h, 089h, 020h, 01bh, 095h, 020h, 01bh, 009h
        db      020h, 096h
        db      " made "
        db      0f9h, 020h, 081h, 00ah
        db      "resulting "
        db      082h
        db      " would exceed 999"
        db      00ah, 0ebh, 02eh, 00ah, 000h, 089h, 020h, 082h, 020h, 0f6h, 020h, 0e2h
        elseif  FW_VERSION = 311
        db      09eh, 020h, 081h
        db      " software."
        db      00ah, 000h, 00ah, 08bh, 020h, 01bh, 082h, 020h, 01bh, 038h, 020h, 097h
        db      " made "
        db      01bh, 003h, 020h, 081h, 00ah
        db      "resulting "
        db      082h
        db      " would exceed 999"
        db      00ah, 01bh, 004h, 02eh, 00ah, 000h, 08bh, 020h, 082h, 020h, 0ebh, 020h, 0cfh
        else
        db      09dh, 020h, 081h
        db      " software."
        db      00ah, 000h, 089h, 020h, 082h, 020h, 0f8h, 020h, 0d6h
        endif
        db      " copying "
        if      FW_VERSION >= 312
        db      0d1h
        elseif  FW_VERSION = 311
        db      0d9h
        else
        db      0e0h
        endif
        db      " may"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 031h, 020h, 096h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 01eh, 020h, 097h
        else
        db      00ah, 01bh, 039h, 020h, 098h
        endif
        db      " long "
        if      FW_VERSION >= 312
        db      01bh, 05dh, 020h, 084h
        elseif  FW_VERSION = 311
        db      01bh, 075h, 020h, 084h
        else
        db      01bh, 060h, 020h, 084h
        endif
        db      " accept "
        if      FW_VERSION >= 312
        db      081h, 020h, 01bh, 0adh, 00ah, 01bh, 095h, 02eh, 020h, 09fh, 020h, 03ch, 01bh, 084h, 020h, 0f1h
        db      03eh, 020h, 01bh, 046h, 020h, 0f6h, 020h, 01bh, 041h, 020h, 084h, 00ah
        db      "proceed anyway "
        db      01bh, 0f2h
        db      " though "
        db      01bh, 088h, 020h, 0aah, 00ah, 085h, 020h, 096h, 020h, 0a6h
        elseif  FW_VERSION = 311
        db      081h, 020h, 01bh, 0c8h, 00ah, 01bh, 082h, 02eh, 020h, 092h, 020h, 03ch, 01bh, 061h, 020h, 0f5h
        db      03eh, 020h, 01bh, 053h, 020h, 0ebh, 020h, 01bh, 01bh, 020h, 084h, 00ah
        db      "proceed anyway even though "
        db      01bh, 09fh, 020h, 0aeh, 00ah, 085h, 020h, 097h, 020h, 0a7h
        else
        db      081h, 020h, 01bh, 0efh, 00ah, 01bh, 088h, 02eh, 020h, 090h, 020h, 03ch, 01bh, 085h, 020h, 0dch
        db      03eh, 020h, 01bh, 059h, 020h, 0f8h, 020h, 01bh, 01dh, 020h, 084h, 00ah
        db      "proceed anyway "
        db      01bh, 0f6h
        db      " though "
        db      01bh, 097h, 020h, 0a8h, 00ah, 085h, 020h, 098h, 020h, 0a3h
        endif
        db      " past "
        if      FW_VERSION >= 312
        db      081h, 020h, 01bh, 086h, 02eh, 00ah, 000h, 04eh, 06fh, 020h, 0a5h
        elseif  FW_VERSION = 311
        db      081h, 020h, 01bh, 09bh, 02eh, 00ah, 000h, 04eh, 06fh, 020h, 0a3h
        else
        db      081h, 020h, 01bh, 064h, 02eh, 00ah, 000h, 04eh, 06fh, 020h, 0a5h
        endif
        db      " were "
        if      FW_VERSION >= 312
        db      0a6h
        elseif  FW_VERSION = 311
        db      0a7h
        else
        db      0a3h
        endif
        db      " since "
        if      FW_VERSION >= 312
        db      081h, 00ah, 01bh, 008h, 020h, 082h
        elseif  FW_VERSION = 311
        db      081h, 00ah, 0b8h, 020h, 082h
        else
        db      081h, 00ah, 0c2h, 020h, 082h
        endif
        db      " does "
        if      FW_VERSION >= 312
        db      01bh
        db      "1 exist."
        db      00ah, 01bh, 09dh, 020h, 081h
        elseif  FW_VERSION = 311
        db      01bh, 01eh
        db      " exist."
        db      00ah, 01bh, 070h, 020h, 081h
        else
        db      01bh
        db      "9 exist."
        db      00ah, 01bh, 05fh, 020h, 081h
        endif
        db      " Erase "
        if      FW_VERSION >= 312
        db      01bh, 09ah
        elseif  FW_VERSION = 311
        db      01bh, 01ch
        else
        db      01bh, 003h
        endif
        db      " 'Initialize' "
        db      084h, 00ah
        db      "make a "
        if      FW_VERSION >= 312
        db      0c5h, 020h, 082h, 02eh, 00ah, 000h, 08ch, 020h, 0bch, 020h, 0b9h, 020h, 01bh, 00eh, 020h, 01bh
        db      028h, 020h, 081h, 00ah, 01bh, 0bbh, 020h, 039h, 039h, 039h, 020h, 0ebh, 02eh, 00ah, 000h, 0d8h
        db      020h, 0e2h, 020h, 01bh, 088h
        db      " steps "
        db      0aeh, 020h, 087h, 020h, 0bch, 02eh, 00ah, 08eh
        db      " a non-zero repetition count "
        db      084h, 00ah
        elseif  FW_VERSION = 311
        db      0d0h, 020h, 082h, 02eh, 00ah, 000h, 08dh, 020h, 0bbh, 020h, 0beh, 020h, 0f3h, 020h, 01bh, 041h
        db      020h, 039h, 039h, 039h, 020h, 01bh, 004h, 02eh, 00ah
        db      "Try reducing "
        db      081h, 020h, 01bh, 0d7h, 020h, 01bh, 0f1h, 020h, 0aah, 00ah, 01bh, 0c1h, 020h, 01bh, 06dh, 020h
        db      01bh, 0f8h, 02eh, 00ah, 000h, 0dah, 020h, 0cfh, 020h, 01bh, 09fh, 020h, 01bh, 0f8h, 020h, 0ach
        db      020h, 088h, 020h, 0bbh, 02eh, 00ah, 08fh
        db      " a non-zero "
        db      01bh, 0d7h, 020h, 01bh, 0f1h, 020h, 084h, 00ah
        else
        db      0c4h, 020h, 082h, 02eh, 00ah, 000h, 08dh, 020h, 0b5h, 020h, 0cfh, 020h, 01bh, 01ah, 020h, 01bh
        db      0bbh, 020h, 039h, 039h, 039h, 020h, 01bh, 007h, 02eh, 00ah
        db      "Try reducing "
        db      081h, 020h, 01bh, 0c9h, 020h, 01bh, 0d8h, 020h, 0abh, 00ah, 01bh, 0a4h, 020h, 01bh, 05bh, 020h
        db      01bh, 0d1h, 02eh, 00ah, 000h, 0f4h, 020h, 0d6h, 020h, 01bh, 097h, 020h, 01bh, 0d1h, 020h, 0b0h
        db      020h, 086h, 020h, 0b5h, 02eh, 00ah, 08fh
        db      " a non-zero "
        db      01bh, 0c9h, 020h, 01bh, 0d8h, 020h, 084h, 00ah
        endif
        db      "add a "
        if      FW_VERSION >= 312
        db      0f3h, 02eh, 00ah, 000h, 089h, 020h, 082h, 020h, 0f6h, 020h, 0e2h, 020h, 01bh, 0aah, 020h, 084h
        db      020h, 01bh, 095h, 020h, 081h, 00ah, 0bch, 020h, 0d1h, 020h, 099h, 020h, 0cch, 020h, 09eh, 020h
        db      081h, 020h, 09ch, 020h, 0aeh, 00ah, 081h, 020h, 0bch, 02eh, 020h, 0abh, 020h, 09bh, 020h, 0a8h
        db      00ah, 082h, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      01bh, 006h, 02ch, 020h, 0aah, 020h, 01bh, 0bch, 020h, 0a9h, 020h, 0bbh, 02eh, 00ah, 000h, 08bh
        db      020h, 082h, 020h, 0ebh, 020h, 0cfh, 020h, 01bh, 0beh, 020h, 084h, 020h, 01bh, 082h, 020h, 081h
        db      00ah, 0bbh, 020h, 0d9h, 020h, 096h, 020h, 0d1h, 020h, 09eh, 020h, 081h, 020h, 09dh, 020h, 0ach
        db      00ah, 081h, 020h, 0bbh, 02eh, 020h, 0a8h, 020h, 093h, 020h, 0a9h, 00ah, 082h, 02eh, 00ah, 000h
        else
        db      0f9h, 02ch, 020h, 0abh
        db      " choose "
        db      0a7h, 020h, 0b5h, 02eh, 00ah, 000h, 089h, 020h, 082h, 020h, 0f8h, 020h, 0d6h
        db      " trying "
        db      084h, 020h, 01bh, 088h, 020h, 081h, 00ah, 0b5h, 020h, 0e0h, 020h, 0a6h, 020h, 0d5h, 020h, 09dh
        db      020h, 081h, 020h, 09ch, 020h, 0b0h, 00ah, 081h, 020h, 0b5h, 02eh, 020h, 09fh, 020h, 092h, 020h
        db      0a7h, 00ah, 082h, 02eh, 00ah, 000h
        endif
        db      "One "
        if      FW_VERSION >= 312
        db      0adh, 020h, 01bh, 00eh, 020h, 09eh, 020h, 081h, 020h, 09ch, 020h, 0aeh, 020h, 081h, 00ah, 0bch
        db      020h, 0f6h, 020h, 0e2h, 020h, 01bh, 0aah, 020h, 084h
        elseif  FW_VERSION = 311
        db      0aah, 020h, 0f3h, 020h, 09eh, 020h, 081h, 020h, 09dh, 020h, 0ach, 020h, 081h, 00ah, 0bbh, 020h
        db      0ebh, 020h, 0cfh, 020h, 01bh, 0beh, 020h, 084h
        else
        db      0abh, 020h, 01bh, 01ah, 020h, 09dh, 020h, 081h, 020h, 09ch, 020h, 0b0h, 020h, 081h, 00ah, 0b5h
        db      020h, 0f8h, 020h, 0d6h
        db      " trying "
        db      084h
        endif
        db      " convert "
        if      FW_VERSION >= 312
        db      099h, 00ah, 01bh, 0afh, 02eh, 020h, 0abh, 020h, 0dah
        db      " these "
        db      01bh, 0afh, 00ah, 09ch, 020h, 0c0h, 020h, 081h, 020h, 0bch, 02eh, 00ah, 000h, 08ch, 020h, 0bch
        db      020h, 01bh, 009h, 020h, 096h, 020h, 0e6h, 020h, 0f9h, 020h, 0f1h, 00ah, 0b9h, 020h, 01bh, 00eh
        db      020h, 01bh, 028h, 020h, 039h, 039h, 020h, 0c6h, 020h, 0b0h, 02eh, 00ah, 0abh
        elseif  FW_VERSION = 311
        db      096h, 020h, 01bh, 01eh, 00ah
        db      "being "
        db      0fah, 02eh, 020h, 0a8h, 020h, 0e5h
        db      " these unused"
        db      00ah, 09dh, 020h, 0b7h, 020h, 081h, 020h, 0bbh, 020h, 08eh, 020h, 01bh, 0ebh, 020h, 0eeh, 02eh
        db      00ah, 000h, 08dh, 020h, 0bbh, 020h, 01bh, 038h, 020h, 097h, 020h, 0f4h, 020h, 01bh, 003h, 020h
        db      0f5h, 00ah, 0beh, 020h, 0f3h, 020h, 01bh, 041h, 020h, 039h, 039h, 020h, 0c3h, 020h, 0b2h, 02eh
        db      00ah, 0a8h
        else
        db      0a6h, 020h, 01bh, 039h, 00ah
        db      "being "
        db      0fbh, 02eh, 020h, 09fh, 020h, 0deh
        db      " these "
        db      01bh, 0fch, 00ah, 09ch, 020h, 0b4h, 020h, 081h, 020h, 0b5h, 020h, 091h, 020h, 01bh, 0c6h, 020h
        db      0e3h, 02eh, 00ah, 000h, 08dh, 020h, 0b5h, 020h, 01bh, 04ah, 020h, 098h, 020h, 0ech, 020h, 01bh
        db      00dh, 020h, 0dch, 00ah, 0cfh, 020h, 01bh, 01ah, 020h, 01bh, 0bbh, 020h, 039h, 039h, 020h, 0bbh
        db      020h, 0aeh, 02eh, 00ah, 09fh
        endif
        db      " reduce "
        if      FW_VERSION >= 312
        db      081h, 020h, 083h, 020h, 09eh, 020h, 0b0h, 02eh, 00ah, 000h
        db      "Can't "
        db      0ach, 020h, 0f9h, 020h, 0bah, 020h, 081h, 020h, 09ch, 020h, 0aeh, 00ah, 087h, 020h, 0bch, 020h
        db      0e2h, 020h, 01bh, 0afh, 02eh, 00ah, 000h
        db      "An invalid "
        db      082h, 020h, 093h, 020h, 01bh, 0a2h, 00ah
        db      "detected. Save "
        db      081h, 020h, 082h, 020h, 084h, 020h, 061h, 020h, 0c5h, 00ah, 08fh, 020h, 091h
        db      " reload "
        db      0f1h, 02eh, 00ah, 000h, 0d8h, 020h, 099h, 020h, 01bh, 031h, 020h, 01bh, 05dh, 020h, 082h, 020h
        db      0b4h, 020h, 084h, 00ah, 0f0h, 020h, 087h, 020h, 08fh, 02eh, 00ah, 000h, 08ch, 020h, 08fh
        elseif  FW_VERSION = 311
        db      081h, 020h, 083h, 020h, 09eh, 020h, 0b2h, 02eh, 00ah, 000h
        db      "All "
        db      081h, 020h, 09dh, 020h, 0ach, 020h, 088h, 020h, 0bbh, 020h, 0cfh, 00ah
        db      "unused. "
        db      0a8h, 020h, 0e2h, 020h, 01bh, 06dh, 020h, 09dh, 00ah, 09fh, 020h, 0a3h, 02eh, 00ah, 000h, 041h
        db      020h, 082h, 020h, 099h, 020h, 096h
        db      " invalid. Check"
        db      00ah, 0ech, 020h, 081h, 020h, 01bh, 060h, 020h, 083h, 020h, 096h, 020h, 01bh, 01eh
        db      " past "
        db      081h, 020h, 01bh, 09bh, 00ah, 09eh, 020h, 081h, 020h, 082h, 020h, 08eh, 020h, 0ech, 020h, 081h
        db      " beat"
        db      00ah, 083h
        db      " doesn't exceed "
        db      081h, 020h, 0afh, 00ah, 0c5h, 020h, 0a5h, 020h, 081h
        db      " given "
        db      01bh, 060h, 02eh, 00ah, 000h, 0dah, 020h, 096h, 020h, 01bh, 01eh, 020h, 01bh, 075h, 020h, 082h
        db      020h, 0b1h, 020h, 084h, 00ah, 0dfh, 020h, 088h, 020h, 091h, 02eh, 00ah, 000h, 08dh, 020h, 091h
        else
        db      081h, 020h, 083h, 020h, 09dh, 020h, 0aeh, 02eh, 00ah, 000h
        db      "All "
        db      081h, 020h, 09ch, 020h, 0b0h, 020h, 086h, 020h, 0b5h, 020h, 0d6h, 00ah, 01bh, 0fch, 02eh, 020h
        db      09fh, 020h, 0f7h, 020h, 01bh, 05bh, 020h, 09ch, 00ah, 09eh, 020h, 0a5h, 02eh, 00ah, 000h, 041h
        db      020h, 082h, 020h, 099h, 020h, 0a6h
        db      " invalid. Check"
        db      00ah, 0dfh, 020h, 081h, 020h, 01bh, 053h, 020h, 083h, 020h, 0a6h, 020h, 01bh
        db      "9 past "
        db      081h, 020h, 01bh, 064h, 00ah, 09dh, 020h, 081h, 020h, 082h, 020h, 091h, 020h, 0dfh, 020h, 081h
        db      " beat"
        db      00ah, 083h
        db      " doesn't exceed "
        db      081h, 020h, 0ach, 00ah, 0bch, 020h, 0a4h, 020h, 081h
        db      " given "
        db      01bh, 053h, 02eh, 00ah, 000h, 0f4h, 020h, 0a6h, 020h, 01bh, 039h, 020h, 01bh, 060h, 020h, 082h
        db      020h, 0c5h, 020h, 084h, 00ah, 0f5h, 020h, 086h, 020h, 093h, 02eh, 00ah, 000h
        db      "Can't "
        db      01bh, 068h, 020h, 086h, 020h, 0cbh, 020h, 01bh, 00dh, 00ah, 081h, 020h, 08ah, 020h, 08bh, 020h
        db      0adh
        db      " already "
        db      01bh, 0f3h, 00ah, 0b0h, 020h, 0c5h, 02eh, 020h, 09fh, 020h, 0beh, 020h, 01bh, 04bh, 020h, 081h
        db      020h, 0c4h, 00ah, 0abh, 020h, 0b6h, 020h, 08bh, 020h, 091h, 020h, 01bh, 0c6h, 020h, 0e3h, 02eh
        db      00ah, 000h, 0f4h, 020h, 0a6h, 020h, 01bh, 039h, 020h, 01bh, 060h, 020h, 08bh, 020h, 0c5h, 020h
        db      084h, 00ah, 01bh, 068h, 020h, 086h, 020h, 0cbh, 02eh, 020h, 09fh, 020h, 0deh, 00ah, 0d5h, 020h
        db      0abh, 020h, 01bh, 01ah, 020h, 0b2h, 020h, 091h, 020h, 01bh, 0c6h, 020h, 0e3h, 02eh, 00ah, 01bh
        db      0aah
        db      " may "
        db      01bh, 01dh, 020h, 084h
        db      " install "
        db      01bh, 01ah, 020h, 0c5h, 02eh, 00ah, 000h
        db      "Can't "
        db      01bh, 068h, 020h, 086h, 020h, 0cbh, 020h, 01bh, 00dh, 020h, 0dch, 00ah
        db      "would cause "
        db      081h, 020h, 031h, 032h, 038h, 02dh, 08bh
        db      " limit "
        db      084h, 020h, 098h, 00ah, 01bh, 08ch, 02eh, 020h, 09fh, 020h, 0deh, 020h, 01bh, 05bh, 020h, 0b2h
        db      020h, 091h, 00ah, 01bh, 0c6h, 020h, 0e3h, 02eh, 00ah, 000h, 00ah, 08dh, 020h, 0c3h, 020h, 09dh
        db      020h, 093h, 020h, 01bh, 04ah, 020h, 098h, 020h, 01bh, 014h, 02eh, 00ah, 09fh, 020h, 092h, 020h
        db      0a7h, 020h, 093h, 02eh, 00ah, 000h, 00ah
        db      "Warning: "
        db      08dh, 020h, 085h, 020h, 0deh, 020h, 081h, 020h, 01bh, 0efh, 00ah, 082h, 02ch, 020h, 01bh, 0deh
        db      020h, 0b9h, 020h, 087h
        db      " names "
        db      091h, 00ah, 0d0h, 02eh, 00ah, 000h
        db      "Can't "
        db      0f5h, 020h, 086h, 020h, 093h, 020h, 01bh, 00dh, 020h, 0dch
        db      " was"
        db      00ah
        db      "created "
        db      0efh, 020h, 01bh, 0c5h
        db      " MPC "
        db      0e1h, 020h, 061h, 020h, 01bh, 0dch, 00ah, 01bh, 0cch
        db      " system version. "
        db      01bh, 0aah, 020h, 01bh, 05eh, 00ah
        db      "upgrade "
        db      081h, 020h, 01bh, 0cch
        db      " system "
        db      0b0h, 020h, 086h, 00ah
        db      "unit "
        db      0c6h
        db      " reading "
        db      086h, 020h, 093h, 02eh, 00ah, 000h, 08dh, 020h, 093h, 020h, 0a6h
        db      " internally corrupted "
        db      091h, 00ah, 01bh, 036h, 027h, 074h, 020h, 098h, 020h, 01bh, 014h, 03ah, 020h, 01bh, 0a9h, 020h
        db      01bh, 00ah, 020h, 0c3h, 020h, 049h, 044h, 00ah
        db      "doesn't match "
        db      01bh, 0a9h, 020h, 033h, 02dh, 01bh, 09dh, 020h, 0adh, 00ah
        db      "extension."
        db      00ah, 000h, 00ah, 09fh, 020h, 0fah, 020h, 081h, 020h, 095h, 020h, 09eh, 020h, 081h, 00ah, 093h
        db      03ah, 00ah
        db      "Then "
        db      088h, 020h, 03ch, 01bh, 01eh, 020h, 093h, 03eh, 02eh, 00ah, 00ah, 00ah, 03ch, 01bh, 01eh, 020h
        db      093h, 03eh, 00ah, 000h, 08dh
        db      " .ST2 "
        db      093h
        endif
        db      " does "
        if      FW_VERSION >= 312
        db      01bh
        db      "1 appear "
        db      084h, 020h, 096h
        db      " a true"
        db      00ah, 0b2h, 020h, 086h, 020h, 01bh, 03ch, 02eh, 00ah, 000h, 0b2h, 020h, 086h, 020h, 01bh
        db      "< formats "
        db      01bh, 030h, 020h, 01bh, 028h, 00ah, 030h, 020h, 0adh, 020h, 031h, 020h, 0e2h
        db      " unsupported "
        db      01bh, 09fh, 020h, 081h, 020h, 01bh, 069h, 02dh, 033h, 030h, 030h, 030h, 02eh, 00ah, 000h, 089h
        db      020h, 01bh, 069h, 02dh, 033h, 030h, 030h, 030h, 020h, 0fch
        db      " supports "
        db      0b2h, 00ah, 086h
        db      " Files written "
        db      01bh, 018h, 020h, 01bh, 0e3h
        db      " per"
        db      00ah
        db      "quarter-"
        db      098h, 020h, 01bh, 06eh, 02eh, 020h, 08ch, 020h, 08fh, 020h, 01bh, 0a2h, 00ah
        db      "written "
        db      01bh, 018h, 020h, 01bh, 0e3h
        db      " per "
        db      01bh
        db      "y frame"
        db      00ah, 01bh, 06eh, 02eh, 00ah, 000h, 0d8h, 020h, 01bh, 0a2h
        db      " an "
        db      01bh, 0c0h, 020h, 01bh, 0a0h, 020h, 01bh, 0aah, 020h, 084h, 00ah, 0f0h, 020h, 081h, 020h, 0b2h
        db      020h, 086h, 020h, 01bh, 03ch, 02eh, 00ah, 000h, 08ch, 020h, 0b2h, 020h, 086h, 020h, 01bh, 03ch
        db      020h, 0b9h, 00ah
        db      "unreadable "
        db      0a5h, 02eh, 00ah, 000h, 0d8h, 020h, 01bh, 0a2h
        db      " an "
        db      01bh, 0c0h, 020h, 01bh, 0a0h, 020h, 01bh, 0aah, 020h, 084h, 00ah, 01bh, 061h, 020h, 081h, 020h
        db      0b2h, 020h, 086h, 020h, 01bh, 03ch, 02eh, 00ah, 000h, 0d8h, 020h, 099h, 020h, 01bh, 088h, 020h
        db      01bh, 00eh, 020h, 082h, 020h, 0b4h, 00ah, 01bh, 081h, 02eh, 020h, 028h, 0b2h, 020h, 086h
        db      " Files "
        db      01bh, 074h, 00ah
        db      "take up "
        db      01bh, 00eh, 020h, 0b4h, 020h, 0aeh, 020h, 081h, 020h, 01bh, 069h, 02dh, 033h, 030h, 030h, 030h
        db      00ah, 01bh, 028h, 020h, 01bh, 0ddh, 020h, 08fh
        db      " size might suggest)."
        db      00ah
        db      "Deleting "
        db      01bh, 030h, 020h, 09ch
        db      " may help."
        db      00ah, 000h
        db      "Can't "
        db      01bh, 080h, 020h, 087h, 020h, 0cah, 020h, 0f9h, 00ah, 081h, 020h, 08dh, 020h, 08ah, 020h, 0a1h
        db      " already exists"
        db      00ah, 0aeh, 020h, 0b4h, 02eh, 020h, 0abh, 020h, 0c3h, 020h, 01bh, 0a8h, 020h, 081h, 020h, 0c5h
        db      00ah, 0adh, 020h, 0c2h, 020h, 08ah, 020h, 091h
        db      " try "
        db      01bh, 019h, 02eh, 00ah, 000h, 0d8h, 020h, 099h, 020h, 01bh, 031h, 020h, 01bh, 05dh, 020h, 08ah
        db      020h, 0b4h, 020h, 084h, 00ah, 01bh, 080h, 020h, 087h, 020h, 0cah, 02eh, 00ah, 000h
        db      "Can't "
        db      01bh, 080h, 020h, 087h, 020h, 0cah, 020h, 0f9h, 020h, 0f1h, 00ah
        db      "would cause "
        db      081h, 020h, 031h, 032h, 038h, 02dh, 08ah
        db      " limit "
        db      084h, 020h, 096h, 00ah, 01bh, 08ch, 02eh, 00ah, 000h, 08ch, 020h, 0c7h, 020h, 09eh, 020h, 08fh
        db      020h, 01bh, 009h, 020h, 096h, 020h, 0dch, 02eh, 00ah, 000h
        db      "Warning: "
        db      08ch, 020h, 085h, 020h, 0dah, 020h, 081h, 020h, 01bh, 0adh, 00ah, 082h, 021h, 00ah, 000h, 08ch
        db      020h, 08fh, 020h, 01bh, 0a2h
        db      " created "
        db      01bh, 09fh
        db      " a unit "
        db      0d3h, 020h, 061h, 00ah
        db      "later "
        db      01bh, 0efh, 020h, 01bh, 099h
        db      " version. "
        db      01bh, 0c4h, 020h, 01bh, 052h, 00ah
        db      "upgrade "
        db      081h, 020h, 01bh, 0efh, 020h, 0aeh, 020h, 087h
        db      " unit "
        db      0c8h, 00ah
        db      "reading "
        db      087h, 020h, 08fh, 02eh, 00ah, 000h, 08ch, 020h, 08fh, 020h, 099h
        db      " internally corrupted "
        db      091h, 00ah, 01bh
        db      "t't "
        db      096h, 020h, 0dch, 03ah, 020h, 01bh, 087h, 020h, 01bh, 021h, 020h, 0c7h, 020h, 049h, 044h, 00ah
        db      "doesn't match "
        db      01bh, 087h, 020h, 033h, 02dh, 01bh, 09eh, 020h, 0a1h, 00ah
        db      "extension."
        db      00ah, 000h, 08ch, 020h, 01bh
        db      "_ part "
        db      09eh
        db      " a 2 part "
        db      08ah, 020h, 08fh, 00ah, 01bh, 009h, 020h, 096h, 020h, 0dch, 020h, 01bh, 09fh
        db      " itself. "
        db      0abh, 00ah, 0e1h, 020h, 0f0h, 020h, 081h, 020h, 08fh
        db      " having "
        db      081h, 020h, 01bh, 093h, 00ah, 0a1h
        db      " ending "
        db      0aeh, 020h, 027h, 07bh, 031h, 07dh, 027h, 02eh, 00ah, 000h, 00ah, 0abh, 020h, 0f2h, 020h, 081h
        db      020h, 095h, 020h, 0a7h, 020h, 081h, 00ah, 08fh, 03ah, 00ah
        db      "Then "
        db      08bh, 020h, 03ch, 01bh, 062h, 020h, 08fh, 03eh, 02eh, 00ah, 00ah, 00ah, 03ch, 01bh, 062h, 020h
        db      08fh, 03eh, 00ah, 000h, 08ch
        db      " .ST2 "
        db      08fh
        db      " does "
        db      01bh
        db      "1 match "
        elseif  FW_VERSION = 311
        db      01bh, 01eh
        db      " appear "
        db      084h, 020h, 097h
        db      " a true"
        db      00ah, 0b6h, 020h, 086h, 020h, 01bh, 00bh, 02eh, 00ah, 000h, 0b6h, 020h, 086h, 020h, 01bh, 00bh
        db      " formats "
        db      01bh, 022h, 020h, 01bh, 041h, 00ah, 030h, 020h, 0aah, 020h, 031h, 020h, 0cfh
        db      " unsupported "
        db      01bh, 0d0h, 020h, 081h, 020h, 01bh, 064h, 02dh, 033h, 030h, 030h, 030h, 02eh, 00ah, 000h, 08bh
        db      020h, 01bh, 064h, 02dh, 033h, 030h, 030h, 030h, 020h, 0ffh
        db      " supports "
        db      0b6h, 00ah, 086h
        db      " Files written "
        db      01bh, 030h, 020h, 01bh, 0f3h
        db      " per"
        db      00ah
        db      "quarter-"
        db      09bh, 020h, 01bh, 08ah, 02eh, 020h, 08dh, 020h, 091h, 020h, 01bh, 0a2h, 00ah
        db      "written "
        db      01bh, 030h, 020h, 01bh, 0f3h
        db      " per "
        db      01bh, 087h
        db      " frame"
        db      00ah, 01bh, 08ah, 02eh, 00ah, 000h, 0dah, 020h, 01bh, 0a2h, 020h, 01bh, 0ach, 020h, 01bh, 0cbh
        db      020h, 01bh, 0b5h, 020h, 01bh, 0beh, 020h, 084h, 00ah, 0dfh, 020h, 081h, 020h, 0b6h, 020h, 086h
        db      020h, 01bh, 00bh, 02eh, 00ah, 000h, 08dh, 020h, 0b6h, 020h, 086h, 020h, 01bh, 00bh, 020h, 0beh
        db      00ah
        db      "unreadable "
        db      0a3h, 02eh, 00ah, 000h, 0dah, 020h, 01bh, 0a2h, 020h, 01bh, 0ach, 020h, 01bh, 0cbh, 020h, 01bh
        db      0b5h, 020h, 01bh, 0beh, 020h, 084h, 00ah, 01bh, 076h, 020h, 081h, 020h, 0b6h, 020h, 086h, 020h
        db      01bh, 00bh, 02eh, 00ah, 000h, 0dah, 020h, 096h, 020h, 01bh, 09fh, 020h, 0f3h, 020h, 082h, 020h
        db      0b1h, 00ah, 01bh, 09eh, 02eh, 020h, 028h, 0b6h, 020h, 086h
        db      " Files "
        db      01bh, 02bh, 00ah
        db      "take up "
        db      0f3h, 020h, 0b1h, 020h, 0ach, 020h, 081h, 020h, 01bh, 064h, 02dh, 033h, 030h, 030h, 030h, 00ah
        db      01bh, 041h, 020h, 01bh, 09ah, 020h, 091h, 020h, 01bh, 0b1h
        db      " might suggest)."
        db      00ah
        db      "Deleting "
        db      01bh, 022h, 020h, 09dh
        db      " may help."
        db      00ah, 000h
        db      "Can't "
        db      01bh, 091h, 020h, 088h, 020h, 0d5h, 020h, 01bh, 003h, 00ah, 081h, 020h, 08ch, 020h, 08ah, 020h
        db      0abh
        db      " already exists"
        db      00ah, 0ach, 020h, 0b1h, 02eh, 020h, 0a8h, 020h, 0c7h, 020h, 01bh, 05bh, 020h, 081h, 020h, 0d0h
        db      00ah, 0aah, 020h, 0bdh, 020h, 08ah, 020h, 08eh, 020h, 01bh, 0ebh, 020h, 0eeh, 02eh, 00ah, 000h
        db      0dah, 020h, 096h, 020h, 01bh, 01eh, 020h, 01bh, 075h, 020h, 08ah, 020h, 0b1h, 020h, 084h, 00ah
        db      01bh, 091h, 020h, 088h, 020h, 0d5h, 02eh, 020h, 0a8h, 020h, 0e5h, 00ah, 0d1h, 020h, 0aah, 020h
        db      0f3h, 020h, 0a1h, 020h, 08eh, 020h, 01bh, 0ebh, 020h, 0eeh, 02eh, 00ah, 01bh, 0a0h
        db      " may "
        db      01bh, 01bh, 020h, 084h
        db      " install "
        db      0f3h, 020h, 0b1h, 02eh, 00ah, 000h
        db      "Can't "
        db      01bh, 091h, 020h, 088h, 020h, 0d5h, 020h, 01bh, 003h, 020h, 0f5h, 00ah
        db      "would cause "
        db      081h, 020h, 031h, 032h, 038h, 02dh, 08ah
        db      " limit "
        db      084h, 020h, 097h, 00ah, 01bh, 0aah, 02eh, 020h, 0a8h, 020h, 0e5h, 020h, 01bh, 06dh, 020h, 0a1h
        db      020h, 08eh, 00ah, 01bh, 0ebh, 020h, 0eeh, 02eh, 00ah, 000h, 00ah, 08dh, 020h, 0ceh, 020h, 09eh
        db      020h, 091h, 020h, 01bh, 038h, 020h, 097h, 020h, 0e6h, 02eh, 00ah, 0a8h, 020h, 093h, 020h, 0a9h
        db      020h, 091h, 02eh, 00ah, 000h, 00ah
        db      "Warning: "
        db      08dh, 020h, 085h, 020h, 0e5h, 020h, 081h, 020h, 01bh, 0c8h, 00ah, 082h, 02ch, 020h, 01bh, 0f5h
        db      020h, 0b9h, 020h, 087h
        db      " names "
        db      08eh, 00ah, 0c9h, 02eh, 00ah, 000h
        db      "Can't "
        db      0dfh, 020h, 088h, 020h, 091h, 020h, 01bh, 003h, 020h, 0f5h, 020h, 01bh, 0a2h, 00ah
        db      "created "
        db      0eah, 020h, 01bh, 0ach, 020h, 01bh, 064h, 020h, 0d8h
        db      " a later"
        db      00ah, 01bh, 0f4h
        db      " system version. "
        db      01bh, 0a0h, 020h, 01bh, 06fh, 00ah
        db      "upgrade "
        db      081h, 020h, 01bh, 0f4h
        db      " system "
        db      0ach, 020h, 088h, 00ah
        db      "unit "
        db      0d2h
        db      " reading "
        db      088h, 020h, 091h, 02eh, 00ah, 000h, 08dh, 020h, 091h, 020h, 096h
        db      " internally corrupted "
        db      08eh, 00ah, 01bh, 02bh, 027h, 074h, 020h, 097h, 020h, 0e6h, 03ah, 020h, 01bh, 0c5h, 020h, 01bh
        db      016h, 020h, 0ceh, 020h, 049h, 044h, 00ah
        db      "doesn't match "
        db      01bh, 0c5h, 020h, 033h, 02dh, 01bh, 0b8h, 020h, 0abh, 00ah
        db      "extension."
        db      00ah, 000h, 00ah, 0a8h, 020h, 01bh, 009h, 020h, 081h, 020h, 094h, 020h, 09fh, 020h, 081h, 00ah
        db      091h, 03ah, 00ah
        db      "Then "
        db      089h, 020h, 03ch, 01bh, 0d9h, 020h, 091h, 03eh, 02eh, 00ah, 00ah, 00ah, 03ch, 01bh, 0d9h, 020h
        db      091h, 03eh, 00ah, 000h, 08dh
        db      " .ST2 "
        db      091h
        db      " does "
        db      01bh, 01eh
        db      " match "
        else
        db      01bh
        db      "9 match "
        endif
        db      081h
        db      " .ST1"
        if      FW_VERSION >= 312
        db      00ah, 08fh
        elseif  FW_VERSION = 311
        db      00ah, 091h
        else
        db      00ah, 093h
        endif
        db      " just "
        if      FW_VERSION >= 312
        db      0dch, 02ch, 020h, 01bh, 0f2h
        db      " though "
        db      081h, 020h, 08fh, 00ah, 0a1h, 020h, 099h, 020h, 01bh, 07fh, 02eh, 020h, 0abh, 020h, 0f2h, 020h
        db      081h, 020h, 095h, 00ah, 0a7h, 020h, 081h, 020h, 08fh, 020h, 09eh, 020h, 081h, 020h, 01bh, 093h
        db      020h, 0a1h, 00ah, 0edh
        elseif  FW_VERSION = 311
        db      0e6h
        db      ", even though "
        db      081h, 020h, 091h, 00ah, 0abh, 020h, 096h, 020h, 01bh, 08dh, 02eh, 020h, 0a8h, 020h, 01bh, 009h
        db      020h, 081h, 020h, 094h, 00ah, 09fh, 020h, 081h, 020h, 091h, 020h, 09eh, 020h, 081h, 020h, 01bh
        db      0e8h, 020h, 0abh, 00ah, 0ech
        else
        db      01bh, 014h, 02ch, 020h, 01bh, 0f6h
        db      " though "
        db      081h, 020h, 093h, 00ah, 0adh, 020h, 0a6h
        db      " correct. "
        db      09fh, 020h, 0fah, 020h, 081h, 020h, 095h, 00ah, 09eh, 020h, 081h, 020h, 093h, 020h, 09dh, 020h
        db      081h
        db      " same "
        db      0adh, 00ah, 0dfh
        endif
        db      " corresponds "
        db      084h, 020h, 081h
        db      " ST1 "
        if      FW_VERSION >= 312
        db      08fh
        elseif  FW_VERSION = 311
        db      091h
        else
        db      093h
        endif
        db      " just"
        if      FW_VERSION >= 312
        db      00ah, 0dch, 02eh, 00ah, 03ch, 01bh, 062h, 020h, 08fh, 03eh, 00ah, 000h, 08ch
        elseif  FW_VERSION = 311
        db      00ah, 0e6h, 02eh, 00ah, 03ch, 01bh, 0d9h, 020h, 091h, 03eh, 00ah, 000h, 00ah, 08dh
        else
        db      00ah, 01bh, 014h, 02eh, 00ah, 03ch, 01bh, 01eh, 020h, 093h, 03eh, 00ah, 000h, 00ah, 08dh
        endif
        db      " .ST2 "
        if      FW_VERSION >= 312
        db      08fh, 020h, 01bh, 009h, 020h, 096h, 020h, 0dch, 020h, 01bh, 09fh, 00ah
        elseif  FW_VERSION = 311
        db      091h, 020h, 01bh, 038h, 020h, 097h, 020h, 0e6h, 020h, 01bh, 0d0h, 00ah
        else
        db      093h, 020h, 01bh, 04ah, 020h, 098h, 020h, 01bh, 014h, 020h, 01bh, 0fbh, 00ah
        endif
        db      "itself. "
        if      FW_VERSION >= 312
        db      0abh, 020h, 0e1h, 020h, 0f2h, 020h, 081h, 020h, 095h, 00ah, 0a7h, 020h, 081h, 020h, 01bh, 01ch
        db      " .ST1 "
        db      08fh, 02eh, 00ah, 000h, 08ch, 020h, 01bh, 015h, 020h, 01bh, 009h, 020h, 096h, 020h, 01bh, 010h
        db      020h, 01bh, 0dfh
        db      " Edit"
        db      00ah, 01bh, 0ech, 020h, 099h, 020h, 0dbh, 02eh, 020h, 09fh
        elseif  FW_VERSION = 311
        db      0a8h, 020h, 0feh, 020h, 01bh, 009h, 020h, 081h, 020h, 094h, 00ah, 09fh, 020h, 081h, 020h, 01bh
        db      ", .ST1 "
        db      091h, 02eh, 00ah, 000h, 00ah, 08dh, 020h, 0e9h, 020h, 01bh, 038h, 020h, 097h, 020h, 0fah, 020h
        db      01bh, 096h
        db      " Edit"
        db      00ah
        db      "Loop "
        db      096h, 020h, 0deh, 02eh, 020h, 092h
        else
        db      09fh, 020h, 0f6h, 020h, 0fah, 020h, 081h, 020h, 095h, 00ah, 09eh, 020h, 081h, 020h, 01bh
        db      "& .ST1 "
        db      093h, 02eh, 00ah, 000h, 00ah, 08dh, 020h, 0e2h, 020h, 01bh, 04ah, 020h, 098h, 020h, 0fbh, 020h
        db      01bh
        db      "s Edit"
        db      00ah, 01bh, 0f5h, 020h, 0a6h, 020h, 0e8h, 02eh, 020h, 090h
        endif
        db      " <Exit> "
        db      084h
        db      " return"
        if      FW_VERSION >= 312
        db      00ah, 084h, 020h, 01bh, 007h, 020h, 0f6h
        elseif  FW_VERSION = 311
        db      00ah, 084h, 020h, 01bh, 025h, 020h, 0ebh
        else
        db      00ah, 084h, 020h, 01bh, 00fh, 020h, 0f8h
        endif
        db      " were."
        db      00ah, 000h, 00ah
        db      "Step xx "
        if      FW_VERSION >= 312
        db      0b9h, 020h, 061h, 020h, 082h, 020h, 0edh, 020h, 099h, 00ah
        elseif  FW_VERSION = 311
        db      0beh, 020h, 061h, 020h, 082h, 020h, 0ech, 020h, 096h, 00ah
        else
        db      0cfh, 020h, 061h, 020h, 082h, 020h, 0dfh, 020h, 0a6h, 00ah
        endif
        db      "empty. "
        if      FW_VERSION >= 312
        db      0abh, 020h, 01bh, 0c6h, 020h, 0f1h, 020h, 0d3h, 020h, 061h, 00ah, 082h, 020h, 0edh, 020h, 0b9h
        db      020h, 0a5h, 02eh, 00ah, 000h, 0d8h, 020h, 0e2h
        elseif  FW_VERSION = 311
        db      0a8h, 020h, 01bh, 0d8h, 020h, 0f5h, 020h, 0d8h, 020h, 061h, 00ah, 082h, 020h, 0ech, 020h, 0beh
        db      020h, 0a3h, 02eh, 00ah, 000h, 0dah, 020h, 0cfh
        else
        db      09fh, 020h, 01bh, 0b2h, 020h, 0dch, 020h, 0e1h, 020h, 061h, 00ah, 082h, 020h, 0dfh, 020h, 0cfh
        db      020h, 0a5h, 02eh, 00ah, 000h, 0f4h, 020h, 0d6h
        endif
        db      " too "
        if      FW_VERSION >= 312
        db      01bh, 0bdh, 020h, 0bfh, 020h, 0aeh, 020h, 081h, 00ah, 082h, 020h, 084h, 020h, 096h
        elseif  FW_VERSION = 311
        db      01bh, 0e3h, 020h, 0c0h, 020h, 0ach, 020h, 081h, 00ah, 082h, 020h, 084h, 020h, 097h
        else
        db      01bh, 0b8h, 020h, 0bfh, 020h, 0b0h, 020h, 081h, 00ah, 082h, 020h, 084h, 020h, 098h
        endif
        db      " processed "
        if      FW_VERSION >= 312
        db      01bh, 090h, 020h, 01bh, 056h, 00ah, 087h, 020h, 0c6h
        elseif  FW_VERSION = 311
        db      01bh, 037h, 020h, 01bh, 04ch, 00ah, 088h, 020h, 0c3h
        else
        db      01bh, 090h, 020h, 01bh, 034h, 00ah, 086h, 020h, 0bbh
        endif
        db      ". Reduce "
        if      FW_VERSION >= 312
        db      081h, 020h, 0c6h, 020h, 0adh, 020h, 01bh, 0e4h, 00ah
        elseif  FW_VERSION = 311
        db      081h, 020h, 0c3h, 020h, 0aah, 020h, 01bh, 0b9h, 00ah
        else
        db      081h, 020h, 0bbh, 020h, 0abh, 020h, 01bh, 09ah, 00ah
        endif
        db      "any "
        if      FW_VERSION >= 312
        db      0a5h, 020h, 0f6h
        elseif  FW_VERSION = 311
        db      0a3h, 020h, 0ebh
        else
        db      0a5h, 020h, 0f8h
        endif
        db      "'re "
        if      FW_VERSION >= 312
        db      01bh, 031h, 020h, 01bh, 018h
        db      ". (Try erasing"
        db      00ah, 0bah, 020h, 094h
        elseif  FW_VERSION = 311
        db      01bh, 01eh, 020h, 01bh
        db      "0. (Try erasing"
        db      00ah, 0b9h, 020h, 09ah
        else
        db      01bh, 039h, 020h, 01bh, 0d5h
        db      ". (Try erasing"
        db      00ah, 0b9h, 020h, 0a9h
        endif
        db      " pressure "
        if      FW_VERSION >= 312
        db      0ffh, 020h, 01bh, 046h, 020h, 0f6h, 027h, 072h, 065h, 00ah, 01bh, 031h, 020h, 01bh, 018h
        db      " them.)"
        db      00ah, 000h, 089h, 020h, 01bh, 000h, 020h, 01bh
        db      "u pulse rate "
        db      099h
        elseif  FW_VERSION = 311
        db      01bh, 015h, 020h, 01bh, 053h, 020h, 0ebh, 027h, 072h, 065h, 00ah, 01bh, 01eh, 020h, 01bh, 030h
        db      020h, 01bh, 0e9h, 02eh, 029h, 00ah, 000h, 08bh, 020h, 01bh, 011h, 020h, 01bh, 090h
        db      " pulse rate "
        db      096h
        else
        db      01bh, 002h, 020h, 01bh, 059h, 020h, 0f8h, 027h, 072h, 065h, 00ah, 01bh, 039h, 020h, 01bh, 0d5h
        db      020h, 01bh, 0b9h, 02eh, 029h, 00ah, 000h, 089h, 020h, 01bh, 04dh, 020h, 01bh
        db      "{ pulse rate "
        db      0a6h
        endif
        db      " too"
        db      00ah
        if      FW_VERSION <> 311
        db      "high. Make sure "
        db      081h
        else
        db      "high. "
        db      01bh, 0cdh, 020h, 01bh, 0d4h, 020h, 081h
        endif
        db      " proper Sync Input"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 0c8h, 020h, 099h, 020h, 08dh, 020h, 091h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 0e6h, 020h, 096h, 020h, 08ch, 020h, 08eh
        else
        db      00ah, 01bh, 0b4h, 020h, 0a6h, 020h, 08ah, 020h, 091h
        endif
        db      " check "
        db      081h
        db      " SYNC IN"
        db      00ah
        db      "LEVEL "
        if      FW_VERSION >= 312
        db      01bh, 03eh, 020h, 0e9h, 020h, 081h, 020h, 01bh, 094h
        elseif  FW_VERSION = 311
        db      01bh, 028h, 020h, 0eah, 020h, 081h, 020h, 01bh, 0adh
        else
        db      01bh, 01ch, 020h, 0efh, 020h, 081h, 020h, 01bh, 08eh
        endif
        db      " panel."
        if      FW_VERSION >= 312
        db      00ah, 000h, 0d8h, 020h, 099h, 020h, 01bh, 088h, 020h, 01bh, 00eh, 020h, 082h, 020h, 0b4h, 00ah
        db      01bh, 081h, 02eh, 020h, 0abh, 020h, 0dah, 020h, 01bh, 0b8h, 00ah, 09ch, 02eh, 00ah, 000h, 08ch
        db      020h, 082h, 020h, 0b9h, 020h, 01bh, 00eh, 020h, 01bh, 028h, 020h, 081h, 00ah, 01bh, 0bbh, 020h
        db      037h, 039h, 020h, 0afh, 020h, 0cbh, 020h, 0b0h, 02eh, 00ah, 0abh, 020h, 0dah, 020h, 01bh, 0b8h
        db      020h, 0ebh, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 0dah, 020h, 096h, 020h, 01bh, 09fh, 020h, 0f3h, 020h, 082h, 020h, 0b1h, 00ah, 01bh
        db      09eh, 02eh, 020h, 0a8h, 020h, 0e5h, 020h, 01bh, 06dh, 020h, 09dh, 00ah, 028h, 01bh, 085h
        db      " saving "
        db      01bh, 0e9h, 020h, 084h, 020h, 094h, 029h, 02eh, 00ah, 000h, 08dh, 020h, 082h, 020h, 0beh, 020h
        db      0f3h, 020h, 01bh, 041h, 020h, 037h, 039h, 00ah, 0afh, 020h, 0c5h, 020h, 0b2h, 02eh, 020h, 01bh
        db      070h, 020h, 081h, 00ah, 022h
        db      "Delete Bars"
        db      022h
        db      " edit "
        db      01bh, 008h, 020h, 084h
        db      " eliminate"
        db      00ah, 01bh, 06dh, 020h, 09eh, 020h, 01bh, 0e9h, 02eh, 00ah, 000h
        else
        db      00ah, 000h, 0f4h, 020h, 0a6h, 020h, 01bh, 097h, 020h, 01bh, 01ah, 020h, 082h, 020h, 0c5h, 00ah
        db      01bh, 0d2h, 02eh, 020h, 09fh, 020h, 0deh, 020h, 01bh, 05bh, 020h, 09ch, 00ah, 028h, 01bh, 06bh
        db      020h, 01bh, 0ech, 020h, 01bh, 0b9h, 020h, 084h, 020h, 095h, 029h, 02eh, 00ah, 000h, 08dh, 020h
        db      082h, 020h, 0cfh, 020h, 01bh, 01ah, 020h, 01bh, 0bbh, 020h, 037h, 039h, 00ah, 0ach, 020h, 0bch
        db      020h, 0aeh, 02eh, 020h, 01bh, 05fh, 020h, 081h, 00ah, 022h
        db      "Delete Bars"
        db      022h
        db      " edit "
        db      0fdh, 020h, 084h
        db      " eliminate"
        db      00ah, 01bh, 05bh, 020h, 09dh, 020h, 01bh, 0b9h, 02eh, 00ah, 000h
        endif
        db      "Sorry, "
        if      FW_VERSION >= 312
        db      087h, 020h, 082h, 020h, 0b9h
        elseif  FW_VERSION = 311
        db      088h, 020h, 082h, 020h, 0beh
        else
        db      086h, 020h, 082h, 020h, 0cfh
        endif
        db      " damaged"
        if      FW_VERSION <> 311
        db      00ah, 0a5h
        else
        db      00ah, 0a3h
        endif
        db      ". An attempt "
        if      FW_VERSION >= 312
        db      01bh, 0b2h, 020h, 01bh, 0f3h
        db      " made "
        elseif  FW_VERSION = 311
        db      01bh, 07bh, 020h, 01bh, 0a9h
        db      " made "
        else
        db      01bh, 084h, 020h, 01bh
        db      "| made "
        endif
        db      084h, 00ah
        db      "recover as much "
        if      FW_VERSION >= 312
        db      0a5h
        db      " as "
        db      01bh, 092h
        db      ", but"
        db      00ah, 01bh, 0b8h, 020h, 0a5h
        db      " may have "
        db      01bh, 0f3h
        db      " lost."
        elseif  FW_VERSION = 311
        db      0a3h
        db      " as possible, but"
        db      00ah, 01bh, 06dh, 020h, 0a3h
        db      " may have "
        db      01bh, 0a9h
        db      " lost."
        else
        db      0a5h
        db      " as possible, but"
        db      00ah, 01bh, 05bh, 020h, 0a5h
        db      " may "
        db      01bh, 0e4h, 020h, 01bh
        db      "| lost."
        endif
        db      00ah, 000h
        db      "Set "
        db      022h
        db      "Active "
        if      FW_VERSION >= 312
        db      088h, 020h, 01bh, 06fh, 020h, 094h, 022h, 00ah, 028h, 01bh, 0aeh, 020h, 032h, 020h, 0e9h, 020h
        db      086h, 020h, 0beh, 029h, 020h, 084h, 020h, 01bh, 013h, 00ah, 094h, 03bh, 020h, 0e9h
        elseif  FW_VERSION = 311
        db      087h, 020h, 01bh, 089h, 020h, 09ah, 022h, 00ah, 028h, 01bh, 008h, 020h, 032h, 020h, 0eah, 020h
        db      086h, 020h, 0cbh, 029h, 020h, 084h, 020h, 01bh, 01ah, 00ah, 09ah, 03bh, 020h, 0eah
        else
        db      087h, 020h, 01bh, 066h, 020h, 0a9h, 022h, 00ah, 028h, 0fdh, 020h, 032h, 020h, 0efh, 020h, 08eh
        db      020h, 0c8h, 029h, 020h, 084h, 020h, 01bh, 004h, 00ah, 0a9h, 03bh, 020h, 0efh
        endif
        db      " SOUNDS 1 "
        if      FW_VERSION >= 312
        db      0beh, 02ch, 020h, 09bh, 00ah, 01bh, 013h, 020h, 090h, 03bh, 020h, 0e9h, 020h, 01bh, 0ebh, 020h
        db      01bh, 058h, 02ch, 020h, 09bh, 00ah, 061h, 020h, 01bh, 050h, 020h, 088h, 02eh, 00ah, 000h, 04fh
        db      06eh, 020h, 01bh, 0ebh, 020h, 01bh, 058h, 02ch, 020h, 09bh, 020h, 01bh, 050h, 020h, 088h, 020h
        db      026h, 020h, 0feh, 00ah
        elseif  FW_VERSION = 311
        db      0cbh, 02ch, 020h, 093h, 00ah, 01bh, 01ah, 020h, 090h, 03bh, 020h, 0eah, 020h, 01bh, 007h, 020h
        db      0c2h, 02ch, 020h, 093h, 00ah, 061h, 020h, 01bh, 04eh, 020h, 087h, 02eh, 00ah, 000h, 04fh, 06eh
        db      020h, 01bh, 007h, 020h, 0c2h, 02ch, 020h, 093h, 020h, 01bh, 04eh, 020h, 087h, 020h, 026h, 020h
        db      01bh, 00fh, 00ah
        else
        db      0c8h, 02ch, 020h, 092h, 00ah, 01bh, 004h, 020h, 08ch, 03bh, 020h, 0efh, 020h, 0feh, 020h, 0b8h
        db      02ch, 020h, 092h, 00ah, 061h, 020h, 01bh, 049h, 020h, 087h, 02eh, 00ah, 000h, 04fh, 06eh, 020h
        db      0feh, 020h, 0b8h, 02ch, 020h, 092h, 020h, 01bh, 049h, 020h, 087h, 020h, 026h, 020h, 01bh, 018h
        db      00ah
        endif
        db      "Chn "
        if      FW_VERSION >= 312
        db      084h, 020h, 01bh, 013h
        elseif  FW_VERSION = 311
        db      084h, 020h, 01bh, 01ah
        else
        db      084h, 020h, 01bh, 004h
        endif
        db      " chan/port; "
        if      FW_VERSION >= 312
        db      01bh, 046h, 020h, 01bh, 018h
        db      " ext"
        elseif  FW_VERSION = 311
        db      01bh, 053h, 020h, 01bh
        db      "0 ext"
        else
        db      01bh, 059h, 020h, 01bh, 0d5h
        db      " ext"
        endif
        db      00ah
        db      "seqncr, "
        if      FW_VERSION >= 312
        db      0e9h, 020h, 086h, 020h, 032h, 020h, 0beh, 020h, 0feh, 020h, 01bh, 0fch, 020h, 01bh, 0edh, 00ah
        db      084h, 020h, 01bh, 012h, 020h, 084h
        elseif  FW_VERSION = 311
        db      0eah, 020h, 086h, 020h, 032h, 020h, 0cbh, 020h, 01bh, 00fh
        db      " Soft thru"
        db      00ah, 084h, 020h, 01bh, 032h, 020h, 084h
        else
        db      0efh, 020h, 08eh, 020h, 032h, 020h, 0c8h, 020h, 01bh, 018h, 020h, 01bh, 0ffh
        db      " thru"
        db      00ah, 084h, 020h, 01bh, 025h, 020h, 084h
        endif
        db      " avoid "
        if      FW_VERSION >= 311
        db      086h
        else
        db      08eh
        endif
        db      " feedback "
        if      FW_VERSION <> 311
        db      091h
        else
        db      08eh
        endif
        db      " Local"
        if      FW_VERSION >= 312
        db      00ah, 01bh, 051h, 020h, 084h, 020h, 01bh, 012h
        db      " so "
        db      01bh, 0f5h
        elseif  FW_VERSION = 311
        db      00ah, 01bh, 050h, 020h, 084h, 020h, 01bh
        db      "2 so "
        db      01bh, 0ddh
        else
        db      00ah, 01bh, 03fh, 020h, 084h, 020h, 01bh
        db      "% so "
        db      01bh, 0b0h
        endif
        db      " won't "
        if      FW_VERSION >= 312
        db      0ach, 020h, 0bdh, 02eh, 00ah, 000h, 01bh, 043h, 020h, 0dfh, 020h, 01bh, 044h, 020h, 0adh
        elseif  FW_VERSION = 311
        db      0b0h, 020h, 0a1h, 02eh, 00ah, 000h, 01bh, 04bh, 020h, 0e2h, 020h, 01bh, 039h, 020h, 0aah
        else
        db      0afh, 020h, 0b2h, 02eh, 00ah, 000h
        db      "Hard "
        db      095h, 020h, 01bh, 0a6h
        db      " failure. "
        db      09fh
        db      " check"
        db      00ah, 0dfh, 020h, 081h, 020h, 01bh, 040h, 020h, 095h, 020h, 0a6h, 020h, 01bh, 0ebh, 020h, 0efh
        db      020h, 091h, 00ah, 01bh, 090h, 020h, 01bh, 06ah, 02eh, 00ah, 000h, 01bh, 03ch, 020h, 0f7h, 020h
        db      01bh, 027h, 020h, 0abh
        endif
        db      " overdub modes "
        if      FW_VERSION >= 312
        db      01bh, 0dfh, 00ah, 01bh, 040h, 02ch, 020h, 0f6h, 020h, 01bh, 052h, 020h, 0e1h
        elseif  FW_VERSION = 311
        db      01bh, 096h, 00ah, 01bh, 054h, 02ch, 020h, 0ebh, 020h, 01bh, 06fh, 020h, 0feh
        else
        db      01bh, 073h, 00ah, 01bh, 048h, 02ch, 020h, 0f8h, 020h, 01bh, 05eh, 020h, 0f6h
        endif
        db      " enable "
        if      FW_VERSION >= 312
        db      022h, 01bh, 05eh, 00ah, 01bh, 07dh, 022h, 020h, 01bh, 051h, 020h, 028h, 087h, 020h, 01bh, 0b2h
        db      " now "
        db      01bh, 0f3h
        db      " done)."
        elseif  FW_VERSION = 311
        db      022h, 01bh, 077h, 00ah, 01bh, 083h, 022h, 020h, 01bh, 050h, 020h, 028h, 088h, 020h, 01bh
        db      "{ now "
        db      01bh, 0a9h
        db      " done)."
        else
        db      022h, 01bh, 062h, 00ah, 01bh, 080h, 022h, 020h, 01bh, 03fh, 020h, 028h, 086h, 020h, 01bh, 084h
        db      " now "
        db      01bh
        db      "| done)."
        endif
        db      00ah, 049h, 06eh, 020h, 081h
        db      " future, "
        if      FW_VERSION >= 312
        db      0dfh, 020h, 022h, 01bh, 05eh, 020h, 01bh, 07dh, 022h, 00ah, 01bh, 051h, 020h, 01bh, 09fh, 020h
        db      0f7h, 020h, 091h
        elseif  FW_VERSION = 311
        db      0e2h, 020h, 022h, 01bh, 077h, 020h, 01bh, 083h, 022h, 00ah, 01bh, 050h, 020h, 01bh, 0d0h, 020h
        db      01bh, 036h, 020h, 08eh
        else
        db      0f7h, 020h, 022h, 01bh, 062h, 020h, 01bh, 080h, 022h, 00ah, 01bh, 03fh, 020h, 01bh, 0fbh, 020h
        db      01bh, 029h, 020h, 091h
        endif
        db      " releasing RECORD"
        if      FW_VERSION >= 312
        db      00ah, 0adh
        elseif  FW_VERSION = 311
        db      00ah, 0aah
        else
        db      00ah, 0abh
        endif
        db      " OVERDUB "
        if      FW_VERSION >= 312
        db      0b6h
        elseif  FW_VERSION = 311
        db      0c1h
        else
        db      0bah
        endif
        db      " stopped."
        if      FW_VERSION >= 312
        db      00ah, 000h, 01bh, 043h, 020h, 0a2h, 020h, 09ch, 020h, 01bh, 0dfh, 020h, 01bh, 040h, 02ch, 020h
        db      0f6h, 00ah, 01bh, 052h, 020h, 0e1h
        elseif  FW_VERSION = 311
        db      00ah, 000h, 01bh, 04bh, 020h, 0a2h, 020h, 09dh, 020h, 01bh, 096h, 020h, 01bh, 054h, 02ch, 020h
        db      0ebh, 00ah, 01bh, 06fh, 020h, 0feh
        else
        db      00ah, 000h, 01bh, 03ch, 020h, 09bh, 020h, 09ch, 020h, 01bh, 073h, 020h, 01bh, 048h, 02ch, 020h
        db      0f8h, 00ah, 01bh, 05eh, 020h, 0f6h
        endif
        db      " disable "
        if      FW_VERSION >= 312
        db      022h, 01bh, 05eh, 020h, 01bh, 07dh, 022h, 020h, 01bh, 051h, 02eh, 00ah, 028h, 08ch, 020h, 01bh
        db      0b2h
        db      " now "
        db      01bh, 0f3h
        db      " done.) In "
        elseif  FW_VERSION = 311
        db      022h, 01bh, 077h, 020h, 01bh, 083h, 022h, 020h, 01bh, 050h, 02eh, 00ah, 028h, 08dh, 020h, 01bh
        db      "{ now "
        db      01bh, 0a9h
        db      " done.) In "
        else
        db      022h, 01bh, 062h, 020h, 01bh, 080h, 022h, 020h, 01bh, 03fh, 02eh, 00ah, 028h, 08dh, 020h, 01bh
        db      084h
        db      " now "
        db      01bh
        db      "| done.) In "
        endif
        db      081h, 00ah
        db      "future, disable "
        if      FW_VERSION >= 312
        db      022h, 01bh, 05eh, 020h, 01bh, 07dh, 022h, 020h, 01bh, 09fh, 00ah
        elseif  FW_VERSION = 311
        db      022h, 01bh, 077h, 020h, 01bh, 083h, 022h, 020h, 01bh, 0d0h, 00ah
        else
        db      022h, 01bh, 062h, 020h, 01bh, 080h, 022h, 020h, 01bh, 0fbh, 00ah
        endif
        db      "selecting "
        if      FW_VERSION >= 312
        db      0a8h, 020h, 082h, 020h, 028h, 01bh, 0dfh, 00ah
        elseif  FW_VERSION = 311
        db      0a9h, 020h, 082h, 020h, 028h, 01bh, 096h, 00ah
        else
        db      0a7h, 020h, 082h, 020h, 028h, 01bh, 073h, 00ah
        endif
        db      "stopped), "
        if      FW_VERSION >= 312
        db      097h, 020h, 081h
        elseif  FW_VERSION = 311
        db      09ch, 020h, 081h
        else
        db      09ah, 020h, 081h
        endif
        db      " original "
        if      FW_VERSION >= 312
        db      0cch, 02eh, 00ah, 000h
        elseif  FW_VERSION = 311
        db      0d1h, 02eh, 00ah, 000h, 08bh, 020h, 08ch, 020h, 01bh, 074h, 020h, 0efh, 020h, 0cah, 00ah, 01bh
        db      0a2h, 009h, 01bh, 01eh, 020h, 01bh, 084h, 02eh, 020h, 01bh, 0cdh, 020h, 01bh, 0d4h, 020h, 081h
        db      020h, 0efh, 00ah, 0cah, 020h, 096h, 020h, 01bh, 000h, 02ch, 020h, 01bh, 05fh, 020h, 096h, 020h
        db      0eah, 02ch, 020h, 08eh, 00ah, 081h, 009h
        db      "unit "
        db      083h, 020h, 096h, 020h, 01bh, 00fh, 020h, 01bh, 037h, 02eh, 00ah, 000h, 08bh, 020h, 08ch, 020h
        db      0b8h, 020h, 0efh, 020h, 0cah, 00ah, 01bh, 0a2h, 009h, 01bh, 01eh, 020h, 01bh, 084h, 02eh, 020h
        db      01bh, 0cdh, 020h, 01bh, 0d4h, 020h, 081h, 020h, 0efh, 00ah, 0cah, 020h, 096h, 020h, 01bh, 000h
        db      02ch, 020h, 01bh, 05fh, 020h, 096h, 020h, 0eah, 02ch, 020h, 08eh, 00ah, 081h, 009h
        db      "unit "
        db      083h, 020h, 096h, 020h, 01bh, 00fh, 020h, 01bh, 037h, 02eh, 00ah, 000h
        else
        db      0d5h, 02eh, 00ah, 000h
        endif
W_d4053:
        if      FW_VERSION >= 312
        db      07fh, 001h, 0c3h, 064h, 0c7h, 064h, 0d0h, 064h, 0d7h, 064h, 0dah, 064h, 0dfh, 064h, 0e4h, 064h
        db      0e9h, 064h, 0efh, 064h, 0f3h, 064h, 0f9h, 064h, 0ffh, 064h, 004h, 065h, 00dh, 065h, 014h, 065h
        db      019h
        db      "e!e%e.e7e?eDeGeLeQeTe[ebelereue{e"
        db      081h, 065h, 086h, 065h, 08dh, 065h, 093h, 065h, 097h, 065h, 09ch, 065h, 0a3h, 065h, 0aeh, 065h
        db      0b6h, 065h, 0beh, 065h, 0c4h, 065h, 0cbh, 065h, 0d0h, 065h, 0d3h, 065h, 0d6h, 065h, 0dbh, 065h
        db      0e3h, 065h, 0e9h, 065h, 0f2h, 065h, 0f8h, 065h, 0ffh, 065h, 006h, 066h, 00bh, 066h, 013h, 066h
        db      01ch
        db      "f%f)f.f3f:fAfHfMfTf]fdfmfqfwf|f"
        db      083h, 066h, 08dh, 066h, 097h, 066h, 0a1h, 066h, 0a5h, 066h, 0abh, 066h, 0b4h, 066h, 0bfh, 066h
        db      0c5h, 066h, 0cah, 066h, 0d1h, 066h, 0d6h, 066h, 0dfh, 066h, 0e5h, 066h, 0eeh, 066h, 0f7h, 066h
        db      0fdh, 066h, 004h, 067h, 00bh, 067h, 012h, 067h, 019h
        db      "g g%g+g1g7g;g@gEgLgSgZgfgigrgwg"
        db      081h, 067h, 086h, 067h, 08eh, 067h, 098h, 067h, 09dh, 067h, 0a0h, 067h, 0a7h, 067h, 0ach, 067h
        db      0b3h, 067h, 0b9h, 067h, 0bdh, 067h, 0c6h, 067h, 0ceh, 067h, 0d6h, 067h, 0dfh, 067h, 0e7h, 067h
        db      0ech, 067h, 0f5h, 067h, 0f9h, 067h, 002h, 068h, 00bh, 068h, 014h, 068h, 01ch
        db      "h$h+h2h<hBhNhUh"
        elseif  FW_VERSION = 311
        db      07fh, 001h, 0c6h, 06eh, 0cah, 06eh, 0d3h, 06eh, 0dah, 06eh, 0ddh, 06eh, 0e2h, 06eh, 0e7h, 06eh
        db      0edh, 06eh, 0f2h, 06eh, 0f8h, 06eh, 0feh, 06eh, 002h, 06fh, 00bh, 06fh, 010h, 06fh, 014h, 06fh
        db      01bh
        db      "o#o(o.o5o:oAoDoGoPoYoaofokouoxo"
        db      083h, 06fh, 089h, 06fh, 090h, 06fh, 097h, 06fh, 09ch, 06fh, 0a2h, 06fh, 0a6h, 06fh, 0ach, 06fh
        db      0b3h, 06fh, 0bah, 06fh, 0c2h, 06fh, 0c5h, 06fh, 0cah, 06fh, 0cdh, 06fh, 0d5h, 06fh, 0dbh, 06fh
        db      0e0h, 06fh, 0e5h, 06fh, 0ech, 06fh, 0f4h, 06fh, 0fah, 06fh, 0ffh, 06fh, 006h, 070h, 00fh, 070h
        db      014h
        db      "p p$p*p/p7p@pIpPpWp"
        else
        db      07fh, 001h
        db      "VdZdcdjdmdrdwd}d"
        db      083h, 064h, 087h, 064h, 090h, 064h, 096h, 064h, 09eh, 064h, 0a3h, 064h, 0a8h, 064h, 0afh, 064h
        db      0b5h, 064h, 0b9h, 064h, 0c0h, 064h, 0c5h, 064h, 0cch, 064h, 0d1h, 064h, 0dah, 064h, 0dfh, 064h
        db      0e2h, 064h, 0ebh, 064h, 0f0h, 064h, 0f7h, 064h, 001h, 065h, 004h, 065h, 00fh, 065h, 016h, 065h
        db      01ch, 065h, 022h
        db      "e(e/e3e8e;eCeIeQeYe"
        endif
        db      05ch
        if      FW_VERSION >= 312
        db      "hchmh|h"
        db      081h, 068h, 090h, 068h, 095h, 068h, 09ah, 068h, 09eh, 068h, 0a6h, 068h, 0abh, 068h, 0b3h, 068h
        db      0b9h, 068h, 0c7h, 068h, 0cdh, 068h, 0d3h, 068h, 0dbh, 068h, 0e6h, 068h, 0f4h, 068h, 0ffh, 068h
        db      006h, 069h, 00dh, 069h, 016h, 069h, 01fh
        db      "i(i/i3i7i<iAiFiSi]igiqi{i"
        db      07fh, 069h, 089h, 069h, 08fh, 069h, 093h, 069h, 099h, 069h, 0a3h, 069h, 0a9h, 069h, 0b3h, 069h
        db      0bah, 069h, 0c2h, 069h, 0c7h, 069h, 0cfh, 069h, 0d4h, 069h, 0dch, 069h, 0e1h, 069h, 0e8h, 069h
        db      0edh, 069h, 0f5h, 069h, 0fdh, 069h, 002h, 06ah, 00ah, 06ah, 00dh, 06ah, 014h
        db      "j j#j)j2jBjHjQjWj`jijtjyj~j"
        db      083h, 06ah, 08eh, 06ah, 093h, 06ah, 09eh, 06ah, 0a1h, 06ah, 0a8h, 06ah, 0afh, 06ah, 0b6h, 06ah
        db      0bdh, 06ah, 0c4h, 06ah, 0cbh, 06ah, 0d2h, 06ah, 0d9h, 06ah, 0e0h, 06ah, 0e3h, 06ah, 0eah, 06ah
        db      0efh, 06ah, 0f9h, 06ah, 001h, 06bh, 00bh, 06bh, 011h, 06bh, 01bh
        db      "k#k'k-k1k7kAkGkOkWkakikokskxk"
        db      082h, 06bh, 086h, 06bh, 08eh, 06bh, 094h, 06bh, 099h, 06bh, 0a3h, 06bh, 0a9h, 06bh, 0afh, 06bh
        db      0b7h, 06bh, 0bfh, 06bh, 0c7h, 06bh, 0d1h, 06bh, 0dbh, 06bh, 0e5h, 06bh, 0e8h, 06bh, 0f5h, 06bh
        db      0f9h, 06bh, 0fdh, 06bh, 000h, 06ch, 009h, 06ch, 00eh, 06ch, 017h
        db      "l l%l*l3l<lAlJlOlTlYlblglllul~l"
        db      084h, 06ch, 08bh, 06ch, 08fh, 06ch, 096h, 06ch, 099h, 06ch, 09fh, 06ch, 0a5h, 06ch, 0a9h, 06ch
        db      0afh, 06ch, 0b6h, 06ch, 0bdh, 06ch, 0c9h, 06ch, 0cfh, 06ch, 0d6h, 06ch, 0ddh, 06ch, 0e4h, 06ch
        db      0ebh, 06ch, 0f1h, 06ch, 0f8h, 06ch, 0ffh, 06ch, 006h, 06dh, 00ch, 06dh, 018h, 06dh, 01ch, 06dh
        db      022h
        db      "m(m4m8mCmHmPm[mcmkmpmum"
        db      080h, 06dh, 08bh, 06dh, 093h, 06dh, 09bh, 06dh, 0a6h, 06dh, 0aah, 06dh, 0b2h, 06dh, 0bah, 06dh
        db      0bfh, 06dh, 0c4h, 06dh, 0cch, 06dh, 0d4h, 06dh, 0dfh, 06dh, 0e4h, 06dh, 0efh, 06dh, 0f7h, 06dh
        db      0ffh, 06dh, 007h, 06eh, 00ch, 06eh, 010h, 06eh, 01ah
        db      "n n#n)n3n=nCnInSnYn_ninonyn"
        db      07fh, 06eh, 089h, 06eh, 08fh, 06eh, 095h, 06eh, 09bh, 06eh, 0a2h, 06eh, 0a9h, 06eh, 0b0h, 06eh
        db      0b7h, 06eh, 0beh, 06eh, 0c3h, 06eh, 0c8h, 06eh, 0cdh, 06eh, 0d4h, 06eh, 0dbh, 06eh, 0e2h, 06eh
        db      0e9h, 06eh, 0eeh, 06eh, 0f3h, 06eh, 0f8h, 06eh, 0fdh, 06eh, 004h, 06fh, 009h, 06fh, 010h, 06fh
        db      017h, 06fh, 01eh
        db      "o%o*o/o6othe", 0
        elseif  FW_VERSION = 311
        db      "pcpiptp~p"
        db      088h, 070h, 08fh, 070h, 098h, 070h, 0a4h, 070h, 0abh, 070h, 0b2h, 070h, 0bbh, 070h, 0c4h, 070h
        db      0c9h, 070h, 0cdh, 070h, 0d1h, 070h, 0d5h, 070h, 0dch, 070h, 0e3h, 070h, 0e9h, 070h, 0f3h, 070h
        db      0fch, 070h, 002h, 071h, 007h, 071h, 00ch, 071h, 012h, 071h, 018h, 071h, 01fh
        db      "q%q,q1q;qDqJqSqZqaqhqoqvq~q"
        db      081h, 071h, 085h, 071h, 08ah, 071h, 090h, 071h, 096h, 071h, 09bh, 071h, 0a0h, 071h, 0a5h, 071h
        db      0aah, 071h, 0afh, 071h, 0b6h, 071h, 0b9h, 071h, 0c0h, 071h, 0c9h, 071h, 0d2h, 071h, 0dah, 071h
        db      0dfh, 071h, 0e9h, 071h, 0f3h, 071h, 0f9h, 071h, 0ffh, 071h, 004h, 072h, 00eh, 072h, 016h
        db      "r r(r-r4r9r>rErLrSrXr_rerkrorxr"
        db      081h, 072h, 08ah, 072h, 092h, 072h, 09ah, 072h, 0a3h, 072h, 0ach, 072h, 0b4h, 072h, 0bch, 072h
        db      0c4h, 072h, 0cch, 072h, 0d1h, 072h, 0dah, 072h, 0e3h, 072h, 0e7h, 072h, 0f1h, 072h, 0f8h, 072h
        db      002h, 073h, 008h, 073h, 012h, 073h, 019h, 073h, 01fh
        db      "s)s/s4sCsRsVsdsrs}s"
        db      085h, 073h, 08bh, 073h, 096h, 073h, 09ah, 073h, 09eh, 073h, 0a3h, 073h, 0a8h, 073h, 0b1h, 073h
        db      0bah, 073h, 0c1h, 073h, 0c8h, 073h, 0cfh, 073h, 0d6h, 073h, 0ddh, 073h, 0e6h, 073h, 0edh, 073h
        db      0f1h, 073h, 0f5h, 073h, 0fah, 073h, 0ffh, 073h, 00ch, 074h, 016h
        db      "t t&t0t:tDtJtMtPtXt]tetjtrt~t"
        db      081h, 074h, 089h, 074h, 090h, 074h, 097h, 074h, 09ch, 074h, 0a1h, 074h, 0a6h, 074h, 0adh, 074h
        db      0b4h, 074h, 0bch, 074h, 0c5h, 074h, 0d5h, 074h, 0dbh, 074h, 0dfh, 074h, 0e2h, 074h, 0e8h, 074h
        db      0f1h, 074h, 0f5h, 074h, 0fbh, 074h, 001h, 075h, 00ah, 075h, 013h, 075h, 01eh
        db      "u)u.u9u>uIuNuRuYu`ugunuuu|u"
        db      083h, 075h, 086h, 075h, 08ch, 075h, 094h, 075h, 098h, 075h, 0a0h, 075h, 0a6h, 075h, 0b0h, 075h
        db      0bah, 075h, 0c0h, 075h, 0c6h, 075h, 0cbh, 075h, 0d1h, 075h, 0d7h, 075h, 0ddh, 075h, 0e2h, 075h
        db      0e8h, 075h, 0eeh, 075h, 0f6h, 075h, 0fch, 075h, 006h, 076h, 00eh, 076h, 016h, 076h, 01ch
        db      "v!v&v.v4v>vFvLvRv"
        db      05ch
        db      "vfvnvtvxv"
        db      080h, 076h, 08ah, 076h, 094h, 076h, 097h, 076h, 09bh, 076h, 0a8h, 076h, 0ach, 076h, 0b0h, 076h
        db      0b5h, 076h, 0beh, 076h, 0c3h, 076h, 0c8h, 076h, 0d1h, 076h, 0d6h, 076h, 0dfh, 076h, 0e8h, 076h
        db      0ebh, 076h, 0f0h, 076h, 0f9h, 076h, 002h, 077h, 007h, 077h, 00ch, 077h, 011h, 077h, 016h, 077h
        db      01fh
        db      "w%w+w1w8w>wEwLwSwZwawdwjwvw}w"
        db      089h, 077h, 08dh, 077h, 091h, 077h, 09dh, 077h, 0a4h, 077h, 0abh, 077h, 0b1h, 077h, 0bdh, 077h
        db      0c8h, 077h, 0d0h, 077h, 0d5h, 077h, 0ddh, 077h, 0e8h, 077h, 0ebh, 077h, 0f0h, 077h, 0f8h, 077h
        db      000h, 078h, 005h, 078h, 00dh, 078h, 015h
        db      "x x(x-x5x@xDxIxTx"
        db      05ch
        db      "xaxfxnxsxxx"
        db      080h, 078h, 085h, 078h, 090h, 078h, 095h, 078h, 09ah, 078h, 0a2h, 078h, 0a6h, 078h, 0aeh, 078h
        db      0b9h, 078h, 0bfh, 078h, 0c9h, 078h, 0d3h, 078h, 0d9h, 078h, 0ddh, 078h, 0e3h, 078h, 0edh, 078h
        db      0f7h, 078h, 0fdh, 078h, 007h, 079h, 00dh, 079h, 017h, 079h, 01bh
        db      "y%y/y3y9ythe", 0
        else
        db      "eaefeneseve{e"
        db      082h, 065h, 088h, 065h, 08dh, 065h, 092h, 065h, 09bh, 065h, 0a1h, 065h, 0a8h, 065h, 0ach, 065h
        db      0b1h, 065h, 0b7h, 065h, 0c1h, 065h, 0c9h, 065h, 0d0h, 065h, 0d7h, 065h, 0e0h, 065h, 0e9h, 065h
        db      0f5h, 065h, 0fah, 065h, 0feh, 065h, 005h, 066h, 00ch, 066h, 013h, 066h, 01ah
        db      "f!f'f1f:fEfNfWfcfifpfvf|f"
        db      080h, 066h, 084h, 066h, 08eh, 066h, 097h, 066h, 0a1h, 066h, 0aah, 066h, 0b1h, 066h, 0b4h, 066h
        db      0bbh, 066h, 0c2h, 066h, 0c7h, 066h, 0cch, 066h, 0d1h, 066h, 0d9h, 066h, 0dfh, 066h, 0e5h, 066h
        db      0eah, 066h, 0efh, 066h, 0f4h, 066h, 0fbh, 066h, 002h, 067h, 009h, 067h, 010h, 067h, 017h
        db      "g g)g,g6g>gHgRgXg]gcgigmgrgyg~g"
        db      085h, 067h, 08ch, 067h, 091h, 067h, 098h, 067h, 09eh, 067h, 0a6h, 067h, 0afh, 067h, 0b8h, 067h
        db      0c0h, 067h, 0c8h, 067h, 0d1h, 067h, 0d6h, 067h, 0deh, 067h, 0e6h, 067h, 0efh, 067h, 0f7h, 067h
        db      000h, 068h, 008h, 068h, 011h, 068h, 017h
        db      "h!h+h1h;hBhHhOhYh]hlhqh"
        db      080h, 068h, 085h, 068h, 08ah, 068h, 08fh, 068h, 097h, 068h, 0a5h, 068h, 0adh, 068h, 0b8h, 068h
        db      0bch, 068h, 0c7h, 068h, 0cbh, 068h, 0d9h, 068h, 0e0h, 068h, 0e9h, 068h, 0f2h, 068h, 0f9h, 068h
        db      000h, 069h, 007h, 069h, 00eh, 069h, 012h, 069h, 016h
        db      "i#i(i-i7i:iDiHiNiXi"
        db      05ch
        db      "ifilioiwi~i"
        db      083h, 069h, 088h, 069h, 08fh, 069h, 094h, 069h, 0a0h, 069h, 0a7h, 069h, 0ach, 069h, 0b4h, 069h
        db      0bch, 069h, 0c4h, 069h, 0c9h, 069h, 0d0h, 069h, 0d7h, 069h, 0dfh, 069h, 0e8h, 069h, 0eeh, 069h
        db      0f7h, 069h, 000h, 06ah, 006h, 06ah, 00ch, 06ah, 010h
        db      "j j&j1j<jGjJjOjTjYjdjijmjtj{j"
        db      082h, 06ah, 089h, 06ah, 08dh, 06ah, 093h, 06ah, 09bh, 06ah, 0a3h, 06ah, 0abh, 06ah, 0b5h, 06ah
        db      0bfh, 06ah, 0c5h, 06ah, 0cdh, 06ah, 0d7h, 06ah, 0e1h, 06ah, 0ebh, 06ah, 0f1h, 06ah, 0fbh, 06ah
        db      000h, 06bh, 006h, 06bh, 00eh, 06bh, 016h
        db      "k k&k0k6k<kAkFkKkQkWk]kbkfkskwkzk"
        db      083h, 06bh, 088h, 06bh, 08dh, 06bh, 092h, 06bh, 097h, 06bh, 09ch, 06bh, 0a5h, 06bh, 0aeh, 06bh
        db      0b3h, 06bh, 0bch, 06bh, 0c5h, 06bh, 0ceh, 06bh, 0d7h, 06bh, 0e0h, 06bh, 0e7h, 06bh, 0f3h, 06bh
        db      0f9h, 06bh, 0fch, 06bh, 008h, 06ch, 00fh, 06ch, 015h, 06ch, 01bh
        db      "l!l(l/l6l=lClOlUlalhlolul{l"
        db      07fh, 06ch, 083h, 06ch, 08bh, 06ch, 096h, 06ch, 09eh, 06ch, 0a3h, 06ch, 0abh, 06ch, 0b0h, 06ch
        db      0b8h, 06ch, 0c0h, 06ch, 0c8h, 06ch, 0cdh, 06ch, 0d5h, 06ch, 0ddh, 06ch, 0e5h, 06ch, 0eah, 06ch
        db      0efh, 06ch, 0fah, 06ch, 0ffh, 06ch, 004h, 06dh, 009h, 06dh, 014h, 06dh, 018h
        db      "m#m&m1m6m>mAmEmMmUm`memkmum{m"
        db      081h, 06dh, 087h, 06dh, 091h, 06dh, 097h, 06dh, 0a1h, 06dh, 0a7h, 06dh, 0b1h, 06dh, 0b7h, 06dh
        db      0bbh, 06dh, 0c1h, 06dh, 0c7h, 06dh, 0d1h, 06dh, 0d7h, 06dh, 0e1h, 06dh, 0e7h, 06dh, 0f1h, 06dh
        db      0fbh, 06dh, 005h, 06eh, 009h, 06eh, 013h, 06eh, 019h
        db      "n n%n,n3n:n?nFnMnTn[nbninpnwn~n"
        db      083h, 06eh, 08ah, 06eh, 091h, 06eh, 096h, 06eh, 09bh, 06eh, 0a2h, 06eh, 0a9h, 06eh, 0b0h, 06eh
        db      0b7h, 06eh, 0bah, 06eh, 0c1h, 06eh, 0c8h, 06eh, 0cdh
        db      "nthe", 0
        endif
        db      "sequence", 0
        db      "number", 0
        db      074h, 06fh, 000h
        db      "will", 0
        if      FW_VERSION >= 312
        db      "MIDI", 0
        elseif  FW_VERSION = 311
        db      "MIDI", 0
        db      "track", 0
        endif
        db      "this", 0
        if      FW_VERSION >= 312
        db      "track", 0
        db      054h, 068h, 065h, 000h
        db      "sound", 0
        db      "press", 0
        elseif  FW_VERSION = 311
        db      "press", 0
        db      "sound", 0
        db      054h, 068h, 065h, 000h
        db      "selected", 0
        else
        db      "track", 0
        db      "press", 0
        db      054h, 068h, 065h, 000h
        db      "selected", 0
        db      "sound", 0
        db      "program", 0
        endif
        db      "This", 0
        if      FW_VERSION >= 312
        db      "selected", 0
        db      "Select", 0
        elseif  FW_VERSION = 311
        db      061h, 06eh, 064h, 000h
        db      "Select", 0
        db      "program", 0
        else
        db      "MIDI", 0
        db      "Select", 0
        db      "Press", 0
        db      061h, 06eh, 064h, 000h
        db      "select", 0
        endif
        db      "file", 0
        if      FW_VERSION >= 312
        db      "program", 0
        db      061h, 06eh, 064h, 000h
        elseif  FW_VERSION = 311
        db      "Press", 0
        db      "select", 0
        db      "disk", 0
        db      "volume", 0
        db      069h, 073h, 000h, 062h, 065h, 000h
        else
        db      "volume", 0
        db      "disk", 0
        endif
        db      "velocity", 0
        if      FW_VERSION < 311
        db      "note", 0
        db      062h, 065h, 000h
        endif
        db      "location", 0
        if      FW_VERSION >= 312
        db      "channel", 0
        db      "disk", 0
        db      062h, 065h, 000h
        elseif  FW_VERSION = 311
        db      "channel", 0
        db      "note", 0
        endif
        db      "then", 0
        if      FW_VERSION >= 312
        db      "note", 0
        db      069h, 073h, 000h
        db      "volume", 0
        db      "select", 0
        elseif  FW_VERSION < 311
        db      "change", 0
        endif
        db      "sequences", 0
        if      FW_VERSION = 311
        db      06fh, 066h, 000h
        db      "containing", 0
        elseif  FW_VERSION < 311
        db      06fh, 066h, 000h
        db      "containing", 0
        db      "Please", 0
        endif
        db      "field", 0
        if      FW_VERSION >= 312
        db      06fh, 066h, 000h
        db      "Press", 0
        elseif  FW_VERSION = 311
        db      "sounds", 0
        db      "change", 0
        db      "data", 0
        endif
        db      "value", 0
        if      FW_VERSION >= 312
        db      "name", 0
        db      "change", 0
        db      "Enter", 0
        db      066h, 06fh, 072h, 000h
        db      "data", 0
        db      "copied", 0
        db      "containing", 0
        db      "another", 0
        db      "current", 0
        db      "notes", 0
        db      "Please", 0
        db      "play", 0
        db      06fh, 072h, 000h, 069h, 06eh, 000h
        db      "time", 0
        db      "changes", 0
        db      "which", 0
        db      "Standard", 0
        db      "event", 0
        db      "memory", 0
        db      "output", 0
        db      "when", 0
        db      "pressed", 0
        db      "affected", 0
        db      "contains", 0
        db      061h, 06ch, 06ch, 000h
        db      "here", 0
        db      "song", 0
        db      "sounds", 0
        db      "screen", 0
        db      "events", 0
        db      "from", 0
        db      "tracks", 0
        db      "existing", 0
        db      "rename", 0
        db      "keyboard", 0
        db      06eh, 065h, 077h, 000h
        db      "tempo", 0
        db      "type", 0
        db      "before", 0
        db      "formatted", 0
        elseif  FW_VERSION = 311
        db      066h, 06fh, 072h, 000h
        db      "Enter", 0
        db      "copied", 0
        db      "Please", 0
        db      "another", 0
        db      06fh, 072h, 000h
        db      "name", 0
        db      069h, 06eh, 000h
        db      "current", 0
        db      "notes", 0
        db      "time", 0
        db      "play", 0
        db      "memory", 0
        db      "changes", 0
        db      "which", 0
        db      "here", 0
        db      "output", 0
        db      "Standard", 0
        db      "from", 0
        db      "destination", 0
        db      061h, 06ch, 06ch, 000h
        db      "event", 0
        db      "song", 0
        db      "pressed", 0
        db      "existing", 0
        db      "contains", 0
        db      "tracks", 0
        db      "events", 0
        db      "when", 0
        db      "SCREEN", 0
        db      "tempo", 0
        db      "assignment", 0
        db      "signature", 0
        db      "formatted", 0
        db      "rename", 0
        db      "keyboard", 0
        db      "assignments", 0
        db      "device", 0
        db      "screen", 0
        db      "affected", 0
        db      "assigned", 0
        db      "type", 0
        db      061h, 072h, 065h, 000h, 06eh, 065h, 077h, 000h, 06fh, 06eh, 065h, 000h
        db      "before", 0
        db      "effect", 0
        db      "delay", 0
        else
        db      "Enter", 0
        db      "copied", 0
        db      066h, 06fh, 072h, 000h
        db      "data", 0
        db      069h, 073h, 000h
        db      "another", 0
        db      "notes", 0
        db      "channel", 0
        db      "current", 0
        db      06fh, 072h, 000h
        db      "time", 0
        db      "name", 0
        db      "changes", 0
        db      "play", 0
        db      069h, 06eh, 000h
        db      "here", 0
        db      "sounds", 0
        db      "which", 0
        db      "from", 0
        db      "song", 0
        db      "existing", 0
        db      "event", 0
        db      "SCREEN", 0
        db      061h, 06ch, 06ch, 000h
        db      "when", 0
        db      "tempo", 0
        db      "signature", 0
        db      "pressed", 0
        db      "rename", 0
        db      "events", 0
        db      "keyboard", 0
        db      "affected", 0
        db      "destination", 0
        db      "type", 0
        db      06eh, 065h, 077h, 000h
        db      "memory", 0
        db      "before", 0
        db      "output", 0
        db      "screen", 0
        db      "effect", 0
        db      "delay", 0
        endif
        db      "operation", 0
        if      FW_VERSION >= 312
        db      "signature", 0
        db      06fh, 06eh, 065h, 000h
        db      "delay", 0
        elseif  FW_VERSION < 311
        db      "assigned", 0
        db      "assignment", 0
        endif
        db      "recorded", 0
        if      FW_VERSION >= 312
        db      "assignment", 0
        elseif  FW_VERSION = 311
        db      "start", 0
        db      "with", 0
        db      "into", 0
        db      "There", 0
        db      "right", 0
        db      "region", 0
        else
        db      "contains", 0
        db      "assignments", 0
        db      "right", 0
        db      "region", 0
        db      "start", 0
        endif
        db      "ENTER", 0
        if      FW_VERSION >= 312
        db      "into", 0
        db      "region", 0
        db      "with", 0
        db      "position", 0
        db      "start", 0
        db      "assigned", 0
        db      "incoming", 0
        db      "There", 0
        elseif  FW_VERSION = 311
        db      "active", 0
        db      "load", 0
        db      "recording", 0
        db      "position", 0
        db      "enter", 0
        db      "incoming", 0
        else
        db      06fh, 06eh, 065h, 000h, 061h, 072h, 065h, 000h
        db      "recording", 0
        db      "incoming", 0
        db      "formatted", 0
        db      "position", 0
        db      "cancel", 0
        db      069h, 074h, 000h
        db      "fields", 0
        db      "delete", 0
        db      "that", 0
        db      "into", 0
        db      "with", 0
        db      "feature", 0
        db      "again", 0
        db      "below", 0
        db      "Tick", 0
        db      "Note", 0
        db      "Beat", 0
        db      "active", 0
        db      "tracks", 0
        db      "amount", 0
        endif
        db      "stereo", 0
        if      FW_VERSION >= 312
        db      "delete", 0
        db      "active", 0
        db      "loaded", 0
        db      "effect", 0
        db      "Note", 0
        db      "enter", 0
        db      "below", 0
        db      "first", 0
        db      061h, 072h, 065h, 000h
        db      "Beat", 0
        db      "Tick", 0
        db      "device", 0
        elseif  FW_VERSION = 311
        db      "delete", 0
        db      "loaded", 0
        db      "fields", 0
        db      "cancel", 0
        db      "feature", 0
        db      06fh, 06eh, 000h, 079h, 06fh, 075h, 000h
        db      "that", 0
        db      "below", 0
        db      "again", 0
        db      "SCSI", 0
        db      "Beat", 0
        db      "Tick", 0
        db      "Note", 0
        db      "more", 0
        endif
        db      "played", 0
        if      FW_VERSION >= 312
        db      "fields", 0
        db      "assignments", 0
        db      06fh, 06eh, 000h
        elseif  FW_VERSION = 311
        db      069h, 074h, 000h
        db      "amount", 0
        endif
        db      "duration", 0
        if      FW_VERSION >= 312
        db      "bars", 0
        db      "Variation", 0
        db      "that", 0
        db      "entered", 0
        db      "recording", 0
        db      "load", 0
        db      069h, 074h, 000h
        db      "insert", 0
        db      "step", 0
        db      "format", 0
        db      "decay", 0
        db      079h, 06fh, 075h, 000h
        db      "pressing", 0
        db      "shifted", 0
        db      "because", 0
        db      "settings", 0
        db      "Selects", 0
        db      "only", 0
        db      "inserted", 0
        db      073h, 065h, 074h, 000h
        db      "messages", 0
        elseif  FW_VERSION = 311
        db      "settings", 0
        db      "numbers", 0
        db      "used", 0
        db      "partition", 0
        db      "displayed", 0
        db      "saved", 0
        db      "first", 0
        db      "only", 0
        db      "connected", 0
        db      "Selects", 0
        db      "Variation", 0
        db      "because", 0
        db      "bars", 0
        db      "format", 0
        db      "step", 0
        db      "MAIN", 0
        db      "option", 0
        db      "insert", 0
        db      "normal", 0
        db      "File", 0
        db      "attack", 0
        db      "shown", 0
        db      "decay", 0
        db      073h, 065h, 074h, 000h
        db      "inserted", 0
        else
        db      "settings", 0
        db      06fh, 06eh, 000h
        db      "Variation", 0
        db      "numbers", 0
        db      "partition", 0
        db      "displayed", 0
        db      "There", 0
        db      "load", 0
        db      "first", 0
        db      "enter", 0
        db      079h, 06fh, 075h, 000h
        db      "step", 0
        db      "insert", 0
        db      "used", 0
        db      "attack", 0
        db      "option", 0
        db      "MAIN", 0
        db      "normal", 0
        db      "decay", 0
        db      "Seconds", 0
        db      "messages", 0
        db      "function", 0
        db      "desired", 0
        db      "shifted", 0
        db      "inserted", 0
        db      "bars", 0
        db      "deleted", 0
        db      "Selects", 0
        db      "internal", 0
        db      "changed", 0
        db      "sampling", 0
        db      "because", 0
        db      "envelope", 0
        db      "where", 0
        db      "currently", 0
        db      "different", 0
        db      "shown", 0
        db      "character", 0
        db      "loaded", 0
        db      "plays", 0
        db      "floppy", 0
        db      "specified", 0
        db      073h, 065h, 074h, 000h
        db      "simultaneously", 0
        db      "more", 0
        db      "initialization", 0
        db      "knob", 0
        db      "want", 0
        db      "Load", 0
        db      "entered", 0
        db      "automatically", 0
        db      "editing", 0
        db      "individual", 0
        db      070h, 061h, 064h, 000h
        db      "controller", 0
        db      04fh, 046h, 046h, 000h
        db      "corresponding", 0
        db      "record", 0
        db      "specific", 0
        db      "pressing", 0
        db      "filter", 0
        db      "Frames", 0
        db      "Stereo", 0
        db      "erased", 0
        db      042h, 061h, 072h, 000h, 041h, 04ch, 04ch, 000h
        db      "Milliseconds", 0
        db      "left", 0
        db      "keys", 0
        db      "frequency", 0
        db      061h, 074h, 000h
        db      "generator", 0
        db      063h, 061h, 06eh, 000h
        db      "other", 0
        db      "functions", 0
        db      06eh, 06fh, 074h, 000h
        db      "parameter", 0
        db      "range", 0
        db      054h, 06fh, 000h
        db      "ignored", 0
        db      "unique", 0
        db      "mode", 0
        db      "hard", 0
        db      "timing", 0
        db      "Data", 0
        db      "repetitions", 0
        db      "single", 0
        db      "only", 0
        db      "between", 0
        db      "outputs", 0
        db      "playing", 0
        db      "DRUM", 0
        db      "cannot", 0
        db      "either", 0
        db      "effects", 0
        endif
        db      "external", 0
        if      FW_VERSION >= 312
        db      "envelope", 0
        db      "changed", 0
        db      "Seconds", 0
        db      "floppy", 0
        db      "attack", 0
        db      "partition", 0
        db      "where", 0
        db      "destination", 0
        db      "cannot", 0
        db      "normal", 0
        db      "erased", 0
        db      "specified", 0
        db      "initialization", 0
        db      "more", 0
        db      "simultaneously", 0
        db      "used", 0
        db      "SCSI", 0
        db      04fh, 046h, 046h, 000h
        db      "desired", 0
        db      "left", 0
        db      "feature", 0
        db      "right", 0
        db      "automatically", 0
        db      "using", 0
        db      "again", 0
        db      "editing", 0
        db      "controller", 0
        db      "corresponding", 0
        db      "individual", 0
        db      "Frames", 0
        db      "filter", 0
        db      "sampling", 0
        db      "internal", 0
        db      "specific", 0
        db      "Stereo", 0
        db      042h, 061h, 072h, 000h, 070h, 061h, 064h, 000h
        db      "keys", 0
        db      "each", 0
        db      "than", 0
        db      "Milliseconds", 0
        db      "frequency", 0
        db      "displayed", 0
        db      "connected", 0
        db      "generator", 0
        db      041h, 04ch, 04ch, 000h
        db      "functions", 0
        db      "other", 0
        db      06eh, 06fh, 074h, 000h
        db      "range", 0
        db      "parameter", 0
        db      "plays", 0
        db      "currently", 0
        db      "single", 0
        db      "deleted", 0
        db      "sent", 0
        db      "outputs", 0
        db      "drum", 0
        db      "effects", 0
        db      "File", 0
        db      "timing", 0
        db      "knob", 0
        db      "numbers", 0
        db      "playing", 0
        db      "want", 0
        db      "ignored", 0
        db      054h, 06fh, 000h
        db      "record", 0
        db      "repetitions", 0
        db      069h, 066h, 000h
        db      "input", 0
        db      "SEQUENCE", 0
        db      "proportionately", 0
        db      "saved", 0
        db      "attached", 0
        db      "drive", 0
        db      "contents", 0
        db      "received", 0
        db      "additional", 0
        db      "DRUM", 0
        db      "mode", 0
        db      "must", 0
        db      "determines", 0
        db      "hard", 0
        db      "transposed", 0
        db      061h, 074h, 000h
        db      "Allows", 0
        db      "SCREEN", 0
        db      "amount", 0
        db      "tuning", 0
        db      "Choose", 0
        db      "sample", 0
        db      "enough", 0
        db      "Record", 0
        db      "second", 0
        db      049h, 066h, 000h
        db      "create", 0
        db      "Load", 0
        db      "secondary", 0
        db      "between", 0
        db      "replacing", 0
        db      "level", 0
        db      "Specifies", 0
        db      "Samples", 0
        db      04dh, 050h, 043h, 000h
        db      "Saves", 0
        db      075h, 073h, 065h, 000h
        db      "shows", 0
        db      "corrected", 0
        db      "times", 0
        db      "receive", 0
        db      "setting", 0
        db      "different", 0
        db      "instead", 0
        db      "shown", 0
        db      063h, 061h, 06eh, 000h
        db      "sync", 0
        db      "threshold", 0
        db      062h, 061h, 072h, 000h
        db      "exceeds", 0
        db      "SMPTE", 0
        db      "uses", 0
        db      "depending", 0
        db      "above", 0
        db      "ready", 0
        db      "whether", 0
        db      "correct", 0
        db      "perform", 0
        db      "available", 0
        db      "locations", 0
        db      "character", 0
        db      044h, 06fh, 000h
        db      "milliseconds", 0
        db      065h, 06eh, 064h, 000h, 069h, 074h, 073h, 000h, 06eh, 06fh, 000h
        db      "Feedback", 0
        db      "loop", 0
        db      "programs", 0
        db      "exceeded", 0
        db      "turn", 0
        db      "tick", 0
        db      "repeated", 0
        db      "properly", 0
        db      "save", 0
        db      "possible", 0
        db      "same", 0
        db      "back", 0
        db      "copy", 0
        db      "starting", 0
        db      "SOFT", 0
        db      "Data", 0
        db      "software", 0
        db      "function", 0
        db      "START", 0
        db      "EXCEPT", 0
        db      055h, 073h, 065h, 000h
        db      "letter", 0
        db      062h, 079h, 000h
        db      "error", 0
        db      "mixer", 0
        db      077h, 061h, 073h, 000h
        db      "Range", 0
        db      "unique", 0
        db      "slider", 0
        db      "frequencies", 0
        db      "These", 0
        db      "either", 0
        db      "MASTER", 0
        db      "trying", 0
        db      "Copies", 0
        db      "power", 0
        db      "entire", 0
        db      "option", 0
        db      "unused", 0
        db      "AFTER", 0
        db      "permanently", 0
        db      068h, 061h, 073h, 000h
        db      "after", 0
        db      "disks", 0
        db      "immediately", 0
        db      059h, 045h, 053h, 000h
        db      "partitions", 0
        db      "some", 0
        db      "Minutes", 0
        db      "Velocities", 0
        db      "maximum", 0
        db      "sustain", 0
        db      "many", 0
        db      "also", 0
        db      "Resolution", 0
        db      "unexpected", 0
        db      "General", 0
        db      "address", 0
        db      "percentage", 0
        db      059h, 06fh, 075h, 000h
        db      "selects", 0
        db      "replace", 0
        db      "jack", 0
        db      "Mode", 0
        db      "inserts", 0
        db      "portion", 0
        db      "initialize", 0
        db      "move", 0
        db      "velocities", 0
        db      "CORRECT", 0
        db      "section", 0
        db      "default", 0
        db      "Turn", 0
        db      06fh, 066h, 066h, 000h
        db      "Metronome", 0
        db      "audio", 0
        db      049h, 074h, 000h
        db      "three", 0
        db      "generated", 0
        db      "transpose", 0
        db      "found", 0
        db      "added", 0
        db      "resonance", 0
        db      "apply", 0
        db      "their", 0
        db      "metronome", 0
        db      "while", 0
        db      "Increases", 0
        db      "songs", 0
        db      "specifies", 0
        db      "ticks", 0
        db      "erase", 0
        db      "files", 0
        db      "Number", 0
        db      "choose", 0
        db      "turned", 0
        db      "occurs", 0
        db      "within", 0
        db      "MAIN", 0
        db      "Loop", 0
        db      "thru", 0
        db      "signal", 0
        db      "system", 0
        db      "values", 0
        db      "listed", 0
        db      "even", 0
        db      "been", 0
        db      "STEP", 0
        db      "pads", 0
        db      "called", 0
        db      "Sets", 0
        db      "delays", 0
        db      "TUNING", 0
        db      "levels", 0
        db      "allows", 0
        db      "Soft", 0
        db      "ONLY", 0
        db      "erases", 0
        db      "Insert", 0
        phase   6f3dh
        elseif  FW_VERSION = 311
        db      "envelope", 0
        db      "deleted", 0
        db      "shifted", 0
        db      "messages", 0
        db      "internal", 0
        db      "Seconds", 0
        db      "entered", 0
        db      "changed", 0
        db      "desired", 0
        db      "want", 0
        db      "function", 0
        db      "sampling", 0
        db      06eh, 06fh, 074h, 000h
        db      "different", 0
        db      "floppy", 0
        db      "specified", 0
        db      "other", 0
        db      "character", 0
        db      "erased", 0
        db      "where", 0
        db      "currently", 0
        db      "plays", 0
        db      "knob", 0
        db      "simultaneously", 0
        db      "initialization", 0
        db      063h, 061h, 06eh, 000h
        db      "corresponding", 0
        db      "automatically", 0
        db      "controller", 0
        db      "editing", 0
        db      "using", 0
        db      "individual", 0
        db      04fh, 046h, 046h, 000h, 070h, 061h, 064h, 000h
        db      "left", 0
        db      "each", 0
        db      "pressing", 0
        db      "properly", 0
        db      "cannot", 0
        db      "record", 0
        db      "Frames", 0
        db      "filter", 0
        db      "Stereo", 0
        db      "specific", 0
        db      "single", 0
        db      042h, 061h, 072h, 000h, 041h, 04ch, 04ch, 000h
        db      "than", 0
        db      "keys", 0
        db      "Milliseconds", 0
        db      "parameter", 0
        db      "replacing", 0
        db      "range", 0
        db      "frequency", 0
        db      "functions", 0
        db      "generator", 0
        db      "input", 0
        db      054h, 06fh, 000h, 061h, 074h, 000h
        db      "outputs", 0
        db      "DRUM", 0
        db      "effects", 0
        db      "mode", 0
        db      "between", 0
        db      "repetitions", 0
        db      069h, 066h, 000h
        db      "playing", 0
        db      "sample", 0
        db      "unique", 0
        db      "drum", 0
        db      "sent", 0
        db      "Data", 0
        db      "timing", 0
        db      "either", 0
        db      "ignored", 0
        db      "received", 0
        db      "proportionately", 0
        db      "power", 0
        db      062h, 061h, 072h, 000h, 044h, 06fh, 000h
        db      "shows", 0
        db      "contents", 0
        db      04dh, 050h, 043h, 000h
        db      "drive", 0
        db      "level", 0
        db      "attached", 0
        db      "SEQUENCE", 0
        db      "transposed", 0
        db      "determines", 0
        db      "hard", 0
        db      "additional", 0
        db      "some", 0
        db      "velocities", 0
        db      "must", 0
        db      055h, 073h, 065h, 000h
        db      "tuning", 0
        db      "Allows", 0
        db      "Choose", 0
        db      "source", 0
        db      "enough", 0
        db      "create", 0
        db      "Record", 0
        db      049h, 066h, 000h
        db      "disks", 0
        db      "whether", 0
        db      068h, 061h, 073h, 000h
        db      "setting", 0
        db      "above", 0
        db      "depending", 0
        db      "locations", 0
        db      "Saves", 0
        db      "space", 0
        db      "copy", 0
        db      "ready", 0
        db      "found", 0
        db      "after", 0
        db      "turn", 0
        db      "SMPTE", 0
        db      "These", 0
        db      "receive", 0
        db      "times", 0
        db      "corrected", 0
        db      "Samples", 0
        db      "correct", 0
        db      "mixer", 0
        db      "Turn", 0
        db      "sync", 0
        db      "perform", 0
        db      "files", 0
        db      "threshold", 0
        db      "PROGRAM", 0
        db      "Range", 0
        db      "while", 0
        db      "secondary", 0
        db      "Specifies", 0
        db      "exceeds", 0
        db      "their", 0
        db      065h, 06eh, 064h, 000h
        db      "instead", 0
        db      "metronome", 0
        db      "available", 0
        db      06eh, 06fh, 000h, 059h, 06fh, 075h, 000h
        db      "milliseconds", 0
        db      077h, 061h, 073h, 000h, 06bh, 065h, 079h, 000h
        db      "save", 0
        db      "distance", 0
        db      "loop", 0
        db      "tick", 0
        db      "channels", 0
        db      "been", 0
        db      "exceeded", 0
        db      "repeated", 0
        db      061h, 06eh, 000h
        db      "back", 0
        db      "programs", 0
        db      "Feedback", 0
        db      "uses", 0
        db      "size", 0
        db      "ONLY", 0
        db      "SOFT", 0
        db      "starting", 0
        db      "error", 0
        db      "audio", 0
        db      "AFTER", 0
        db      "letter", 0
        db      "erase", 0
        db      "allows", 0
        db      "slider", 0
        db      "choose", 0
        db      "MASTER", 0
        db      "trying", 0
        db      049h, 074h, 000h
        db      "lower", 0
        db      "eliminating", 0
        db      "EXCEPT", 0
        db      "frequencies", 0
        db      075h, 073h, 065h, 000h, 069h, 074h, 073h, 000h
        db      "permanently", 0
        db      "levels", 0
        db      "entire", 0
        db      "START", 0
        db      "immediately", 0
        db      "unexpected", 0
        db      "inserts", 0
        db      "Make", 0
        db      "contain", 0
        db      "parameters", 0
        db      062h, 079h, 000h
        db      "jack", 0
        db      "address", 0
        db      "CORRECT", 0
        db      "sure", 0
        db      "portion", 0
        db      "control", 0
        db      "repetition", 0
        db      "replace", 0
        db      "Load", 0
        db      "digital", 0
        db      "percentage", 0
        db      059h, 045h, 053h, 000h
        db      "pads", 0
        db      "Velocities", 0
        db      "General", 0
        db      "Each", 0
        db      "move", 0
        db      "Minutes", 0
        db      "many", 0
        db      "free", 0
        db      "section", 0
        db      "Mode", 0
        db      "partitions", 0
        db      "same", 0
        db      "them", 0
        db      "selects", 0
        db      074h, 072h, 079h, 000h
        db      "sustain", 0
        db      "initialize", 0
        db      "equal", 0
        db      "transpose", 0
        db      "generated", 0
        db      "count", 0
        db      06fh, 066h, 066h, 000h
        db      "ticks", 0
        db      "operating", 0
        db      "including", 0
        db      "songs", 0
        db      "Metronome", 0
        db      "steps", 0
        db      "Increases", 0
        db      074h, 077h, 06fh, 000h
        db      "modifying", 0
        db      "resonance", 0
        db      06fh, 075h, 074h, 000h
        db      "three", 0
        db      "added", 0
        phase   793fh
        else
        db      "level", 0
        db      "contents", 0
        db      "SEQUENCE", 0
        db      "shows", 0
        db      "input", 0
        db      062h, 061h, 072h, 000h
        db      "proportionately", 0
        db      "disks", 0
        db      "determines", 0
        db      "transposed", 0
        db      "velocities", 0
        db      069h, 066h, 000h
        db      "each", 0
        db      "some", 0
        db      "drum", 0
        db      "additional", 0
        db      "must", 0
        db      055h, 073h, 065h, 000h
        db      "enough", 0
        db      "Allows", 0
        db      "Record", 0
        db      "tuning", 0
        db      065h, 06eh, 064h, 000h
        db      "above", 0
        db      "receive", 0
        db      "instead", 0
        db      "perform", 0
        db      "corrected", 0
        db      "connected", 0
        db      "after", 0
        db      "Samples", 0
        db      "threshold", 0
        db      "depending", 0
        db      "secondary", 0
        db      "Saves", 0
        db      "Specifies", 0
        db      "Turn", 0
        db      "while", 0
        db      "exceeds", 0
        db      "setting", 0
        db      "locations", 0
        db      "These", 0
        db      "metronome", 0
        db      "space", 0
        db      "Range", 0
        db      "sync", 0
        db      "been", 0
        db      "uses", 0
        db      "mixer", 0
        db      "files", 0
        db      "ready", 0
        db      "turn", 0
        db      06bh, 065h, 079h, 000h
        db      "milliseconds", 0
        db      068h, 061h, 073h, 000h, 044h, 06fh, 000h
        db      "received", 0
        db      "tick", 0
        db      "copy", 0
        db      "sent", 0
        db      "loop", 0
        db      "SOFT", 0
        db      "exceeded", 0
        db      "starting", 0
        db      "back", 0
        db      "Feedback", 0
        db      "properly", 0
        db      "repeated", 0
        db      "distance", 0
        db      "programs", 0
        db      "allows", 0
        db      "frequencies", 0
        db      "audio", 0
        db      06eh, 06fh, 000h
        db      "immediately", 0
        db      "slider", 0
        db      "erase", 0
        db      "lower", 0
        db      "saved", 0
        db      "letter", 0
        db      "source", 0
        db      "EXCEPT", 0
        db      "MASTER", 0
        db      "START", 0
        db      "permanently", 0
        db      "AFTER", 0
        db      "eliminating", 0
        db      "levels", 0
        db      "format", 0
        db      "drive", 0
        db      "SMPTE", 0
        db      069h, 074h, 073h, 000h, 059h, 06fh, 075h, 000h
        db      "portion", 0
        db      "partitions", 0
        db      "contain", 0
        db      "move", 0
        db      "control", 0
        db      "pads", 0
        db      "whether", 0
        db      "replace", 0
        db      "section", 0
        db      "Mode", 0
        db      "Minutes", 0
        db      "inserts", 0
        db      "CORRECT", 0
        db      "many", 0
        db      "them", 0
        db      "initialize", 0
        db      "than", 0
        db      "Each", 0
        db      "save", 0
        db      "Velocities", 0
        db      075h, 073h, 065h, 000h
        db      "parameters", 0
        db      049h, 066h, 000h
        db      "percentage", 0
        db      "free", 0
        db      "digital", 0
        db      061h, 06eh, 000h, 074h, 072h, 079h, 000h
        db      "sustain", 0
        db      "selects", 0
        db      "repetition", 0
        db      "size", 0
        db      "their", 0
        db      "operating", 0
        db      "apply", 0
        db      "equal", 0
        db      "songs", 0
        db      "replacing", 0
        db      "steps", 0
        db      "available", 0
        db      "added", 0
        db      "specifies", 0
        db      "using", 0
        db      06fh, 075h, 074h, 000h
        db      "power", 0
        db      "count", 0
        db      "Metronome", 0
        db      "times", 0
        db      "Increases", 0
        db      "later", 0
        db      "resonance", 0
        db      "including", 0
        db      "transpose", 0
        db      06fh, 066h, 066h, 000h
        db      "modifying", 0
        db      "three", 0
        db      "called", 0
        db      "have", 0
        db      "analog", 0
        db      "higher", 0
        db      "erases", 0
        db      "STEP", 0
        db      "Number", 0
        db      "TUNING", 0
        db      "turned", 0
        db      "saving", 0
        db      "second", 0
        db      "sample", 0
        db      "entire", 0
        db      "signal", 0
        db      "occurs", 0
        db      "jack", 0
        db      "exists", 0
        db      "within", 0
        db      "Loop", 0
        db      "even", 0
        db      "Change", 0
        db      "delays", 0
        db      "Insert", 0
        db      "TIMING", 0
        db      062h, 079h, 000h
        db      "unused", 0
        db      "listed", 0
        db      "ONLY", 0
        db      "Soft", 0
        phase   6ed2h
        endif
far_d4dcd:
        push    bp
        mov     bp, sp
        push    ds
        push    es
        push    si
        push    di
        cld
        mov     ax, cs
        mov     es, ax
        if      FW_VERSION >= 312
        mov     si, 0ah
        elseif  FW_VERSION = 311
        mov     si, 8
        else
        mov     si, 2
        endif
br_d4ddc:
        mov     bx, si
        seges
        lodsb
        cmp     al, byte ptr [bp + 6]
        jnz     br_d4df3
        seges
        lodsb
        cmp     al, byte ptr [bp + 8]
        jnz     br_d4df3
        seges
        lodsb
        cmp     al, byte ptr [bp + 0ah]
        jz      br_d4e00
br_d4df3:
        mov     si, bx
        add     si, 5
        cmp     byte ptr es:[si], 0
        jz      br_d4e04
        jmp     br_d4ddc
br_d4e00:
        seges
        lodsw
        mov     si, ax
br_d4e04:
        mov     ax, es
        mov     ds, ax
        mov     ax, 8010h
        mov     es, ax
        mov     di, A_D4C3
        sub     cx, cx
br_d4e12:
        lodsb
        or      al, al
        jz      br_d4e6a
        test    al, 80h
        jnz     br_d4e42
        cmp     al, 1bh
        jz      br_d4e39
        cmp     al, 0ah
        jnz     br_d4e2f
        mov     al, 0dh
        stosb
        inc     cx
        cmp     cx, 118h
        jz      br_d4e6a
        mov     al, 0ah
br_d4e2f:
        stosb
        inc     cx
        cmp     cx, 118h
        jz      br_d4e6a
        jmp     br_d4e12
br_d4e39:
        lodsb
        sub     ah, ah
        add     ax, 80h
        jmp     br_d4e45
        db      090h
br_d4e42:
        and     ax, 7fh
br_d4e45:
        push    si
        if      FW_VERSION >= 311
        cmp     ax, word ptr cs:[W_d4053-80h]
        else
        cmp     ax, word ptr cs:[W_d4053-90h]
        endif
        ja      br_d4e67
        add     ax, ax
        mov     si, ax
        if      FW_VERSION >= 311
        mov     si, word ptr cs:[si + W_d4053-80h]
        else
        mov     si, word ptr cs:[si + W_d4053-90h]
        endif
loop_d4e56:
        lodsb
        or      al, al
        jz      br_d4e67
        stosb
        inc     cx
        cmp     cx, 118h
        jc      loop_d4e56
        pop     si
        jmp     br_d4e6a
        db      090h
br_d4e67:
        pop     si
        jmp     br_d4e12
br_d4e6a:
        sub     ax, ax
        stosb
        mov     ax, cx
        pop     di
        pop     si
        pop     es
        pop     ds
        pop     bp
        retf
        if      FW_VERSION >= 312
        db      0ffh
        phase   6
        elseif  FW_VERSION = 311
        db      0ffh
        phase   8
        else
        phase   0ah
        endif
L_d4e76:
        dw      tgt_d4ee2
        dw      tgt_d4eee
        dw      tgt_d4eef
        dw      tgt_d4f28
        dw      tgt_d4f2c
        dw      tgt_d4f32
        dw      tgt_d4f38
        dw      tgt_d4eee
        dw      tgt_d4eee
        dw      tgt_d4eee
        dw      tgt_d4eee
        dw      tgt_d4eee
        dw      tgt_d4eee
        dw      tgt_d4eee
        dw      tgt_d4eee
        dw      tgt_d4eee
isr_d4e96:
        sti
        push    ds
        push    es
        push    ax
        mov     ax, 8010h
        mov     ds, ax
        sub     ax, ax
        mov     es, ax
        pop     ax
        cmp     byte ptr es:[0fch], 0
        pop     es
        jnz     br_d4eb6
        pushf
        callf   dword ptr [W_7AC6]
        pop     ds
        retf    2
br_d4eb6:
        push    es
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    ax
        mov     byte ptr [B_7AAE], al
        mov     al, ah
        and     ax, 0fh
        shl     ax, 1
        mov     si, ax
        if      FW_VERSION >= 312
        call    word ptr cs:[word si + 6]
        elseif  FW_VERSION = 311
        call    word ptr cs:[word si + 8]
        else
        call    word ptr cs:[word si + 0ah]
        endif
        pop     ax
        mov     ah, byte ptr [B_7AC5]
        or      ah, ah
        jz      br_d4ed8
        stc
br_d4ed8:
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     es
        pop     ds
        retf    2
tgt_d4ee2:
        sub     ah, ah
        mov     byte ptr [B_7AC5], ah
        mov     byte ptr [B_7AC1], 1
        ret
tgt_d4eee:
        ret
tgt_d4eef:
        push    8
br_d4ef1:
        call    fn_d4f60
        push    es
        push    bx
        sub     ch, ch
        mov     cl, byte ptr [B_7AAE]
        push    cx
        push    dx
        push    ax
        mov     cl, byte ptr [W_7ACC]
        push    cx
        callf   SEG_D546:far_d555b
        add     sp, 0eh
        or      ax, ax
        jz      br_d4f1d
        push    ax
        callf   SEG_D5CA:far_d5d2d
        add     sp, 2
        mov     byte ptr [B_7AC5], al
        ret
br_d4f1d:
        mov     byte ptr [B_7AC1], 0
        mov     byte ptr [B_7AC5], 0
        ret
tgt_d4f28:
        push    0ah
        jmp     br_d4ef1
tgt_d4f2c:
        mov     byte ptr [B_7AC5], 1
        ret
tgt_d4f32:
        mov     byte ptr [B_7AC5], 1
        ret
tgt_d4f38:
        cmp     byte ptr [B_7AC1], 0
        jnz     br_d4f4e
        sub     ch, ch
        mov     cl, byte ptr [W_7ACC]
        push    cx
        callf   SEG_D546:far_d54db
        add     sp, 2
br_d4f4e:
        mov     byte ptr [B_7AC5], 0
        cmp     byte ptr [B_7AC1], 0
        jz      br_d4f5f
        mov     byte ptr [B_7AC5], 6
br_d4f5f:
        ret
fn_d4f60:
        mov     al, byte ptr [B_7ACE]
        mul     ch
        mov     dl, dh
        sub     dh, dh
        add     ax, dx
        mov     dl, byte ptr [B_7ACF]
        mul     dx
        sub     ch, ch
        add     ax, cx
        dec     ax
        sub     dx, dx
        add     ax, word ptr [W_7AD1]
        adc     dx, word ptr [W_7AD3]
        ret
far_d4f81:
        push    es
        mov     ax, 0
        mov     es, ax
        mov     ax, word ptr es:[100h]
        mov     word ptr [W_7AC6], ax
        mov     ax, word ptr es:[102h]
        mov     word ptr [W_7AC8], ax
        if      FW_VERSION >= 312
        mov     ax, 26h
        elseif  FW_VERSION = 311
        mov     ax, 28h
        else
        mov     ax, 2ah
        endif
        mov     word ptr es:[100h], ax
        mov     ax, SEG_D4E7
        mov     word ptr es:[102h], ax
        pop     es
        retf
        db      0b8h, 000h, 000h, 0cdh, 040h, 0cbh, 0ffh
TBL_d4fac:
        db      001h, 002h, 004h, 008h, 010h, 020h, 040h, 080h
        if      FW_VERSION >= 312
        phase   14h
        elseif  FW_VERSION = 311
        phase   16h
        else
        phase   8
        endif
far_d4fb4:
        mov     al, 0c0h
        out     0a2h, al
        in      al, 0a2h
        cmp     al, 0c0h
        jz      br_d4fc4
        mov     ax, 1
        jmp     br_d4fd2
        db      090h
br_d4fc4:
        mov     al, 7
        out     0a0h, al
        mov     al, 0
        out     0aah, al
        mov     al, 8
        out     0a2h, al
        sub     ax, ax
br_d4fd2:
        retf
far_d4fd3:
        push    ax
        mov     al, 80h
        out     0a2h, al
        pop     ax
        retf
fn_d4fda:
        push    cx
        sub     ax, ax
        mov     al, 10h
        out     0a4h, al
        mov     cx, 3e8h
loop_d4fe4:
        loop    loop_d4fe4
        mov     al, 0
        out     0a4h, al
        mov     cx, 3
        callf   0fb00h:far_fb47a
        in      al, 0aah
        or      al, al
        pop     cx
        ret
fn_d4ff8:
        push    cx
        push    dx
        mov     dx, 0c001h
        mov     al, 0
        out     dx, al
        mov     ax, es
        xor     dx, dx
        mov     cx, 4
loop_d5007:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_d5007
        add     ax, bx
        adc     dx, 0
        push    dx
        mov     dx, 0c004h
        out     dx, ax
        mov     dx, 0c006h
        pop     ax
        or      al, 30h
        out     dx, al
        pop     cx
        pop     ax
        push    ax
        dec     ax
        mov     dx, 0c002h
        out     dx, ax
        mov     ax, 44h
        jcxz    br_d502e
        mov     ax, 48h
br_d502e:
        mov     dx, 0c00ah
        out     dx, al
        mov     cl, 0feh
        mov     dx, 0c008h
        mov     bx, 0c00fh
        mov     ax, 14h
        mov     ch, 10h
        pushf
        cli
        out     dx, ax
        xchg    bx, dx
        in      al, dx
        and     al, cl
        out     dx, al
        xchg    dx, bx
        mov     al, ch
        out     dx, ax
        popf
        pop     cx
        ret
fn_d5050:
        mov     al, 0ffh
        out     0a8h, al
        call    fn_d4ff8
        mov     al, 0
        out     0b8h, al
        mov     al, cl
        out     0bch, al
        mov     al, ch
        out     0bah, al
        mov     al, 81h
        out     0a4h, al
        mov     cx, 0
loop_d506a:
        in      al, 0ach
        and     al, 0feh
        cmp     al, 0b0h
        jnz     br_d507a
        loop    loop_d506a
        mov     ax, 103h
        jmp     br_d50a1
        db      090h
br_d507a:
        in      al, 0a8h
        test    al, 8
        jz      br_d5092
loop_d5080:
        in      al, 0ach
        and     al, 0f0h
        cmp     al, 90h
        jnz     loop_d5080
        in      al, 0b0h
        test    al, 1
        jnz     br_d509e
        mov     al, 8
        out     0a8h, al
br_d5092:
        in      al, 0a8h
        test    al, 27h
        jz      br_d509e
        mov     ax, 103h
        jmp     br_d50a1
        db      090h
br_d509e:
        mov     ax, 0
br_d50a1:
        ret
far_d50a2:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    es
        mov     byte ptr [bp - 2], 0
        mov     byte ptr [bp - 4], 0
        mov     cx, 3
loop_d50b4:
        in      al, 0aah
        or      al, al
        jz      br_d50cb
        call    fn_d4fda
        jz      br_d50cb
        push    cs
        call    far_d4fb4
        loop    loop_d50b4
        mov     ax, 106h
        jmp     br_d51d0
br_d50cb:
        mov     al, 0ffh
        out     0a8h, al
        mov     al, 0
        out     0b0h, al
        in      al, 0a0h
        mov     bl, byte ptr [bp + 6]
        and     bx, 7
        if      FW_VERSION >= 311
        or      al, byte ptr cs:[word bx + TBL_d4fac-130h]
        else
        or      al, byte ptr cs:[word bx + TBL_d4fac-140h]
        endif
        out     0b6h, al
        mov     al, 11h
        out     0b8h, al
        mov     al, 30h
        out     0bah, al
        mov     al, 4
        out     0bch, al
        mov     al, 24h
        out     0a4h, al
        mov     cx, 1eh
loop_d50f5:
        loop    loop_d50f5
loop_d50f7:
        in      al, 0a8h
        or      al, al
        jnz     br_d5103
        in      al, 0ach
        test    al, 20h
        jnz     loop_d50f7
br_d5103:
        in      al, 0a8h
        cmp     al, 10h
        jz      br_d5120
        test    al, 4
        jz      br_d5113
        mov     ax, 101h
        jmp     near br_d51d0
br_d5113:
        mov     ax, 102h
        jmp     near br_d51d0
br_d5119:
        or      ax, ax
        jz      br_d5120
        jmp     near br_d51d0
br_d5120:
        in      al, 0aah
        test    al, 80h
        jnz     br_d512f
        test    al, 8
        jz      br_d512c
        jmp     br_d5120
br_d512c:
        jmp     near br_d51c0
br_d512f:
        and     al, 7
        mov     bl, al
        sub     bh, bh
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_d51d6]
tgt_d513c:
        mov     al, 0
        out     0b0h, al
        les     bx, dword ptr [bp + 0eh]
        mov     cx, word ptr [bp + 12h]
        mov     dx, 1
        call    fn_d5050
        jmp     br_d5119
tgt_d514e:
        mov     al, 1
        out     0b0h, al
        les     bx, dword ptr [bp + 0eh]
        mov     cx, word ptr [bp + 12h]
        mov     dx, 0
        call    fn_d5050
        jmp     br_d5119
tgt_d5160:
        mov     al, 2
        out     0b0h, al
        les     bx, dword ptr [bp + 8]
        mov     cx, word ptr [bp + 0ch]
        mov     dx, 1
        call    fn_d5050
        jmp     br_d5119
tgt_d5172:
        mov     al, 3
        out     0b0h, al
        push    ss
        pop     es
        lea     bx, [bp - 2]
        mov     cx, 1
        mov     dx, 0
        call    fn_d5050
        jmp     br_d5119
tgt_d5186:
        mov     al, 7
        out     0b0h, al
        push    ss
        pop     es
        lea     bx, [bp - 4]
        mov     cx, 1
        mov     dx, 0
        call    fn_d5050
        push    ax
        mov     al, 0c0h
        out     0a4h, al
        pop     ax
        jmp     near br_d5119
tgt_d51a1:
        mov     al, 6
        out     0b0h, al
        mov     byte ptr [bp - 6], 80h
        push    ss
        pop     es
        lea     bx, [bp - 6]
        mov     cx, 1
        mov     dx, 1
        call    fn_d5050
        jmp     near br_d5119
tgt_d51ba:
        mov     ax, 104h
        jmp     br_d51d0
        db      090h
br_d51c0:
        sub     ah, ah
        mov     al, byte ptr [bp - 2]
        cmp     byte ptr [bp - 4], 0
        jz      br_d51d0
        mov     al, byte ptr [bp - 4]
        mov     ah, 2
br_d51d0:
        pop     es
        add     sp, 6
        pop     bp
        retf
TBL_d51d6:
        dw      tgt_d513c
        dw      tgt_d514e
        dw      tgt_d5160
        dw      tgt_d5172
        dw      tgt_d51ba
        dw      tgt_d51ba
        dw      tgt_d51a1
        dw      tgt_d5186
        if      FW_VERSION >= 312
        phase   6
far_d51e6:
        push    si
        xor     si, si
loop_d51e9:
        push    word ptr [W_7ACC]
        callf   SEG_D5CA:far_d5db8
        add     sp, 2
        or      ax, ax
        jz      br_d51ff
        inc     si
        cmp     si, 3
        jl      loop_d51e9
br_d51ff:
        push    0
        push    word ptr [W_7ACC]
        elseif  FW_VERSION = 311
        phase   8
far_d51e6:
        push    si
        xor     si, si
loop_d51e9:
        push    word ptr [W_7ACC]
        callf   SEG_D5CA:far_d5db8
        add     sp, 2
        or      ax, ax
        jz      br_d51ff
        inc     si
        cmp     si, 3
        jl      loop_d51e9
br_d51ff:
        push    0
        push    word ptr [W_7ACC]
        else
        phase   0ah
L_de52a:
        push    bp
        mov     bp, sp
        xor     dx, dx
        cmp     word ptr [bp + 0ah], 0
        jnz     br_d525f
        push    word ptr [bp + 6]
        mov     al, byte ptr [W_7ACC]
        cbw
        push    ax
        endif
        callf   SEG_D546:far_d5502
        add     sp, 4
        mov     dx, ax
        if      FW_VERSION >= 311
        cmp     dx, 2
        jnz     br_d5224
        push    word ptr [W_7ACC]
        callf   SEG_D5CA:far_d5db8
        add     sp, 2
        mov     dx, ax
        jmp     br_d525f
br_d5224:
        or      dx, dx
        else
        or      ax, ax
        endif
        jnz     br_d525f
br_d5228:
        if      FW_VERSION >= 311
        push    word ptr [W_7ACC]
        else
        mov     al, byte ptr [W_7ACC]
        cbw
        push    ax
        endif
        callf   SEG_D546:far_d549d
        add     sp, 2
        mov     dx, ax
        or      dx, dx
        jz      br_d525f
        if      FW_VERSION >= 311
        push    word ptr [W_7ACC]
        callf   SEG_D5CA:far_d5db8
        else
        mov     al, byte ptr [W_7ACC]
        cbw
        push    ax
        callf   SEG_D546:L_de8dc
        endif
        add     sp, 2
        mov     dx, ax
        cmp     dx, 302h
        jz      br_d5253
        cmp     dx, 8
        jnz     br_d525f
br_d5253:
        push    2
        callf   SEG_B059:far_b059a
        add     sp, 2
        jmp     br_d5228
br_d525f:
        mov     byte ptr [B_7AC1], 1
        if      FW_VERSION >= 311
        push    dx
        callf   SEG_D5CA:far_d5d2d
        add     sp, 2
        pop     si
        retf
far_d526f:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     byte ptr [B_7AC1], 1
        else
        or      dx, dx
        jnz     L_de59a
        endif
        push    word ptr [bp + 8]
        if      FW_VERSION >= 311
        push    word ptr [bp + 6]
        endif
        nop
        push    cs
        call    fn_d5296
        if      FW_VERSION >= 311
        add     sp, 4
        mov     word ptr [bp - 2], ax
        push    ax
        callf   SEG_D5CA:far_d5d2d
        endif
        add     sp, 2
        if      FW_VERSION >= 311
        leave
        else
        mov     dx, ax
L_de59a:
        push    dx
        callf   0dee2h:far_d5d2d
        add     sp, 2
        pop     bp
        endif
        retf
fn_d5296:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 290h
        else
        sub     sp, 296h
        endif
        push    si
        push    di
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 228h], 0e9h
        mov     byte ptr [bp - 227h], 0
        mov     byte ptr [bp - 226h], 0
        else
        mov     al, byte ptr [W_7ACC]
        cbw
        push    ax
        callf   SEG_D546:fn_d569e
        add     sp, 2
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        cmp     word ptr [bp - 2], 0
        jg      L_de5d6
        jnz     L_de5cf
        cmp     word ptr [bp - 4], 0
        ja      L_de5d6
L_de5cf:
        mov     ax, 105h
        pop     di
        pop     si
        leave
        retf
L_de5d6:
        mov     byte ptr [bp - 22eh], 0e9h
        mov     byte ptr [bp - 22dh], 0
        mov     byte ptr [bp - 22ch], 0
        endif
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 225h]
        mov     si, 7124h
        elseif  FW_VERSION = 311
        lea     di, [bp - 225h]
        mov     si, 707ah
        else
        lea     di, [bp - 22bh]
        mov     si, 69d0h
        endif
        mov     cx, 4
        rep movsw
        movsb
        if      FW_VERSION < 311
        mov     word ptr [bp - 223h], 200h
        mov     byte ptr [bp - 221h], 10h
        mov     word ptr [bp - 220h], 1
        mov     byte ptr [bp - 21eh], 2
        endif
        mov     word ptr [bp - 21dh], 200h
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 21bh], 10h
        mov     word ptr [bp - 21ah], 1
        mov     byte ptr [bp - 218h], 2
        mov     word ptr [bp - 217h], 200h
        mov     byte ptr [bp - 213h], 0f8h
        mov     word ptr [bp - 210h], 10h
        mov     word ptr [bp - 20eh], 10h
        else
        mov     byte ptr [bp - 219h], 0f8h
        mov     word ptr [bp - 216h], 10h
        mov     word ptr [bp - 214h], 10h
        push    0
        push    word ptr [bp + 6]
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 0ch], ax
        cwd
        push    ax
        endif
        mov     ax, word ptr [bp + 6]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 215h], ax
        mov     word ptr [bp - 212h], 0bh
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        lea     di, [bp - 290h]
        else
        push    dx
        xor     dx, dx
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        mov     bx, word ptr [bp - 2]
        mov     cx, word ptr [bp - 4]
        sub     cx, ax
        sbb     bx, dx
        or      bx, bx
        jl      L_de65c
        jg      L_de659
        cmp     cx, 320h
        jbe     L_de65c
L_de659:
        inc     word ptr [bp - 0ch]
L_de65c:
        cmp     word ptr [bp - 0ch], 1ah
        jl      L_de667
        mov     word ptr [bp - 0ch], 1ah
L_de667:
        mov     ax, word ptr [bp + 6]
        mov     word ptr [bp - 21bh], ax
        mov     word ptr [bp - 218h], 0bh
        mov     word ptr [bp - 6], 0
        mov     word ptr [bp - 8], 0
        push    ss
        pop     es
        lea     di, [bp - 296h]
        endif
        xor     ax, ax
        mov     ah, al
        mov     cx, 34h
        rep stosw
        if      FW_VERSION >= 311
        mov     word ptr [bp - 6], 0
        lea     cx, [bp - 290h]
        mov     ax, word ptr [bp - 6]
        cmp     ax, word ptr [bp + 8]
        else
        mov     word ptr [bp - 0ah], 0
        lea     cx, [bp - 296h]
        mov     ax, word ptr [bp - 0ah]
        cmp     ax, word ptr [bp - 0ch]
        endif
        jge     br_d5346
loop_d531f:
        mov     bx, cx
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        else
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        endif
        mov     word ptr ss:[bx + 2], ax
        mov     word ptr ss:[bx], dx
        mov     ax, word ptr [bp + 6]
        if      FW_VERSION >= 311
        add     word ptr [bp - 4], ax
        adc     word ptr [bp - 2], 0
        else
        add     word ptr [bp - 8], ax
        adc     word ptr [bp - 6], 0
        endif
        add     cx, 4
        if      FW_VERSION >= 311
        inc     word ptr [bp - 6]
        mov     ax, word ptr [bp - 6]
        cmp     ax, word ptr [bp + 8]
        else
        inc     word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ah]
        cmp     ax, word ptr [bp - 0ch]
        endif
        jl      loop_d531f
br_d5346:
        if      FW_VERSION >= 311
        mov     word ptr [bp - 6], 0
        lea     ax, [bp - 290h]
        mov     word ptr [bp - 8], ax
        mov     ax, word ptr [bp - 6]
        cmp     ax, word ptr [bp + 8]
        else
        mov     word ptr [bp - 0ah], 0
        lea     ax, [bp - 296h]
        mov     word ptr [bp - 0eh], ax
        mov     ax, word ptr [bp - 0ah]
        cmp     ax, word ptr [bp - 0ch]
        endif
        jl      br_d535d
        jmp     br_d545a
br_d535d:
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 208h]
        else
        lea     di, [bp - 20eh]
        endif
        xor     ax, ax
        mov     ah, al
        mov     cx, 100h
        rep stosw
        push    20h
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 208h]
        else
        lea     ax, [bp - 20eh]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 228h]
        else
        lea     ax, [bp - 22eh]
        endif
        push    ax
        callf   0f800h:far_fa3be
        add     sp, 0ah
        push    68h
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 1c8h]
        else
        lea     ax, [bp - 1ceh]
        endif
        push    ax
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 290h]
        else
        lea     ax, [bp - 296h]
        endif
        push    ax
        callf   0f800h:far_fa3be
        add     sp, 0ah
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 0ch], 55h
        mov     byte ptr [bp - 0bh], 0aah
        mov     byte ptr [bp - 0ah], 55h
        mov     byte ptr [bp - 9], 0aah
        else
        mov     byte ptr [bp - 12h], 55h
        mov     byte ptr [bp - 11h], 0aah
        mov     byte ptr [bp - 10h], 55h
        mov     byte ptr [bp - 0fh], 0aah
        endif
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 208h]
        else
        lea     ax, [bp - 20eh]
        endif
        push    ax
        push    1
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 8]
        else
        mov     bx, word ptr [bp - 0eh]
        endif
        push    word ptr ss:[bx + 2]
        push    word ptr ss:[bx]
        if      FW_VERSION >= 311
        push    word ptr [W_7ACC]
        else
        mov     al, byte ptr [W_7ACC]
        cbw
        push    ax
        endif
        callf   SEG_D546:far_d567e
        add     sp, 0ch
        mov     dx, ax
        or      ax, ax
        jz      br_d53d0
        pop     di
        pop     si
        leave
        retf
br_d53d0:
        xor     si, si
        jmp     br_d543b
loop_d53d4:
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 208h]
        else
        lea     di, [bp - 20eh]
        endif
        xor     ax, ax
        mov     ah, al
        mov     cx, 100h
        rep stosw
        or      si, si
        jnz     br_d53fa
        if      FW_VERSION >= 311
        mov     byte ptr [bp - 208h], 0f8h
        lea     di, [bp - 207h]
        else
        mov     byte ptr [bp - 20eh], 0f8h
        lea     di, [bp - 20dh]
        endif
        mov     ax, 0ffh
        mov     ah, al
        mov     cx, 2
        rep stosw
br_d53fa:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 21ah]
        else
        mov     ax, word ptr [bp - 220h]
        endif
        cwd
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 8]
        else
        mov     bx, word ptr [bp - 0eh]
        endif
        mov     cx, word ptr ss:[bx + 2]
        mov     bx, word ptr ss:[bx]
        add     bx, ax
        adc     cx, dx
        mov     ax, si
        cwd
        add     bx, ax
        adc     cx, dx
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], cx
        mov     word ptr [bp - 4], bx
        else
        mov     word ptr [bp - 6], cx
        mov     word ptr [bp - 8], bx
        endif
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 208h]
        else
        lea     ax, [bp - 20eh]
        endif
        push    ax
        push    1
        push    cx
        push    bx
        if      FW_VERSION >= 311
        push    word ptr [W_7ACC]
        else
        mov     al, byte ptr [W_7ACC]
        cbw
        push    ax
        endif
        callf   SEG_D546:far_d567e
        add     sp, 0ch
        mov     dx, ax
        or      ax, ax
        jz      br_d543a
        pop     di
        pop     si
        leave
        retf
br_d543a:
        inc     si
br_d543b:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 212h]
        else
        mov     ax, word ptr [bp - 218h]
        endif
        shl     ax, 1
        add     ax, 20h
        cmp     ax, si
        jg      loop_d53d4
        if      FW_VERSION >= 311
        add     word ptr [bp - 8], 4
        inc     word ptr [bp - 6]
        mov     ax, word ptr [bp - 6]
        cmp     ax, word ptr [bp + 8]
        else
        mov     ax, word ptr [bp + 6]
        sub     word ptr [bp - 4], ax
        sbb     word ptr [bp - 2], 0
        xor     dx, dx
        cmp     dx, word ptr [bp - 2]
        jl      L_de7e8
        jg      L_de7e1
        cmp     ax, word ptr [bp - 4]
        jbe     L_de7e8
L_de7e1:
        mov     ax, word ptr [bp - 4]
        mov     word ptr [bp - 21bh], ax
L_de7e8:
        add     word ptr [bp - 0eh], 4
        inc     word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ah]
        cmp     ax, word ptr [bp - 0ch]
        endif
        jge     br_d545a
        jmp     br_d535d
br_d545a:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION <> 311
        phase   0
        else
        phase   2
        endif
fn_d5460:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 8]
        mov     byte ptr [B_7AAA], 12h
        mov     byte ptr [B_7AAB], 0
        mov     byte ptr [B_7AAC], 0
        mov     byte ptr [B_7AAD], 0
        mov     byte ptr [B_7AAE], dl
        mov     byte ptr [B_7AAF], 0
        push    dx
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    6
        push    ds
        push    word B_7AAA
        push    word ptr [bp + 6]
        if      FW_VERSION >= 311
        callf   SEG_D5CA:far_d5ca6
        else
        callf   0dee2h:L_dee2e
        endif
        add     sp, 0eh
        pop     bp
        retf
far_d549d:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 8
        endif
        mov     byte ptr [B_7AAA], 0
        mov     byte ptr [B_7AAB], 0
        mov     byte ptr [B_7AAC], 0
        mov     byte ptr [B_7AAD], 0
        mov     byte ptr [B_7AAE], 0
        mov     byte ptr [B_7AAF], 0
        if      FW_VERSION >= 311
        push    8
        push    ss
        lea     ax, [bp - 8]
        push    ax
        else
        push    0
        push    0
        push    0
        endif
        push    6
        push    ds
        push    word B_7AAA
        push    word ptr [bp + 6]
        if      FW_VERSION >= 311
        callf   SEG_D5CA:far_d5ca6
        else
        callf   0dee2h:L_dee2e
        endif
        add     sp, 0eh
        if      FW_VERSION >= 311
        leave
        else
        pop     bp
        endif
        retf
far_d54db:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 2
        endif
        push    si
        mov     si, word ptr [bp + 6]
        push    si
        push    cs
        call    far_d549d
        add     sp, 2
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], ax
        cmp     word ptr [bp - 2], 0
        else
        mov     dx, ax
        or      dx, dx
        endif
        jz      br_d54ff
        push    si
        if      FW_VERSION >= 311
        callf   SEG_D5CA:far_d5db8
        else
        nop
        push    cs
        call    L_de8dc
        endif
        add     sp, 2
        if      FW_VERSION < 311
        mov     dx, ax
        endif
br_d54ff:
        if      FW_VERSION < 311
        mov     ax, dx
        endif
        pop     si
        if      FW_VERSION < 311
        pop     bp
        retf
L_de89c:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 8]
        mov     byte ptr [B_7AAA], 3
        mov     byte ptr [B_7AAB], 0
        mov     byte ptr [B_7AAC], 0
        mov     byte ptr [B_7AAD], 0
        mov     al, dl
        and     al, 0ffh
        mov     byte ptr [B_7AAE], al
        mov     byte ptr [B_7AAF], 0
        push    dx
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    6
        push    ds
        push    word L_6E85_V308+1
        push    word ptr [bp + 6]
        callf   0de2fh:far_d50a2
        add     sp, 0eh
        pop     bp
        retf
L_de8dc:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    4
        push    word ptr [bp + 6]
        push    cs
        call    L_de89c
        add     sp, 8
        mov     dx, ax
        or      dx, dx
        jnz     L_de93e
        mov     al, byte ptr [bp - 4]
        mov     ah, 0
        mov     word ptr [bp - 6], ax
        and     ax, 0fh
        mov     dx, ax
        or      dx, dx
        jz      L_de910
        add     dx, 300h
        jmp     L_de933
L_de910:
        mov     ax, word ptr [bp - 6]
        and     ax, 70h
        cmp     ax, 70h
        jnz     L_de92a
        mov     al, byte ptr [bp - 2]
        mov     ah, 0
        and     ax, 0fh
        add     ax, 300h
        mov     dx, ax
        jmp     L_de933
L_de92a:
        cmp     byte ptr [bp - 4], 0
        jz      L_de933
        mov     dx, 3ffh
L_de933:
        cmp     dx, 306h
        jnz     L_de93e
        mov     byte ptr [B_7AC1], 1
L_de93e:
        mov     ax, dx
        endif
        leave
        retf
far_d5502:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 4
        push    di
        endif
        mov     dx, word ptr [bp + 8]
        if      FW_VERSION >= 311
        push    ss
        pop     es
        lea     di, [bp - 4]
        xor     ax, ax
        mov     ah, al
        mov     cx, 2
        rep stosw
        endif
        mov     byte ptr [B_7AAA], 4
        mov     byte ptr [B_7AAB], 0
        mov     byte ptr [B_7AAC], 0
        mov     ax, dx
        and     ax, 0ff00h
        shr     ax, 8
        mov     byte ptr [B_7AAD], al
        mov     al, dl
        and     al, 0ffh
        mov     byte ptr [B_7AAE], al
        mov     byte ptr [B_7AAF], 0
        push    0
        if      FW_VERSION >= 311
        push    ss
        lea     ax, [bp - 4]
        push    ax
        else
        push    0
        push    0
        endif
        push    6
        push    ds
        push    word B_7AAA
        push    word ptr [bp + 6]
        if      FW_VERSION >= 311
        callf   SEG_D4FA:far_d50a2
        else
        callf   0dee2h:L_dee2e
        endif
        add     sp, 0eh
        if      FW_VERSION >= 311
        pop     di
        leave
        else
        pop     bp
        endif
        retf
far_d555b:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        mov     si, word ptr [bp + 0ch]
        if      FW_VERSION < 311
        mov     word ptr [bp - 2], 1
        jmp     br_d55f2
loop_d5580:
        cmp     word ptr [bp - 2], si
        jbe     L_de9a4
        endif
        mov     word ptr [bp - 2], si
L_de9a4:
        mov     al, byte ptr [bp + 12h]
        mov     byte ptr [B_7AAA], al
        if      FW_VERSION >= 311
        mov     byte ptr [B_7AAF], 0
        test    byte ptr [B_F292], 1
        jz      br_d55f8
        jmp     br_d55f2
loop_d5580:
        mov     word ptr [bp - 2], 1
        cmp     si, word ptr [bp - 2]
        jnc     br_d558d
        mov     word ptr [bp - 2], si
br_d558d:
        endif
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        and     dx, 0
        and     ax, 1fh
        if      FW_VERSION >= 311
        cwd
        endif
        mov     byte ptr [B_7AAB], al
        mov     ax, word ptr [bp + 8]
        and     ax, 0ff00h
        xor     dx, dx
        mov     cl, 8
        if      FW_VERSION >= 311
        callf   0f800h:far_fa1cd
        else
        callf   0f800h:L_fa1db
        endif
        mov     byte ptr [B_7AAC], al
        mov     al, byte ptr [bp + 8]
        and     al, 0ffh
        mov     byte ptr [B_7AAD], al
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_7AAE], al
        if      FW_VERSION >= 311
        mov     ax, word ptr [W_7ABE]
        imul    word ptr [bp - 2]
        else
        mov     byte ptr [B_7AAF], 0
        mov     ax, word ptr [bp - 2]
        shl     ax, 9
        endif
        push    ax
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    6
        push    ds
        push    word B_7AAA
        push    di
        if      FW_VERSION >= 311
        callf   SEG_D5CA:far_d5ca6
        else
        callf   0dee2h:L_dee2e
        endif
        add     sp, 0eh
        mov     dx, ax
        or      dx, dx
        if      FW_VERSION >= 311
        jnz     br_d5658
        mov     ax, word ptr [W_7ABE]
        add     word ptr [bp + 0eh], ax
        sub     si, word ptr [bp - 2]
        else
        jnz     L_dea17
        endif
        mov     ax, word ptr [bp - 2]
        add     word ptr [bp + 8], ax
        adc     word ptr [bp + 0ah], 0
        if      FW_VERSION < 311
        sub     si, word ptr [bp - 2]
        shl     ax, 9
        add     word ptr [bp + 0eh], ax
        endif
br_d55f2:
        or      si, si
        jnz     loop_d5580
        if      FW_VERSION >= 311
        jmp     br_d5658
br_d55f8:
        cmp     byte ptr [B_7AC0], 5
        jnz     br_d560a
        mov     ax, si
        add     ax, 3
        shr     ax, 2
        mov     word ptr [bp - 2], ax
br_d560a:
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 8]
        and     dx, 0
        and     ax, 1fh
        cwd
        mov     byte ptr [B_7AAB], al
        mov     ax, word ptr [bp + 8]
        and     ax, 0ff00h
        xor     dx, dx
        mov     cl, 8
        callf   0f800h:far_fa1cd
        mov     byte ptr [B_7AAC], al
        mov     al, byte ptr [bp + 8]
        and     al, 0ffh
        mov     byte ptr [B_7AAD], al
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_7AAE], al
        mov     ax, word ptr [W_7ABE]
        imul    word ptr [bp - 2]
        push    ax
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    6
        push    ds
        push    word B_7AAA
        else
L_dea17:
        or      dx, dx
        jz      br_d5658
        endif
        push    di
        if      FW_VERSION >= 311
        callf   SEG_D5CA:far_d5ca6
        add     sp, 0eh
        else
        push    cs
        call    L_de8dc
        add     sp, 2
        endif
        mov     dx, ax
br_d5658:
        mov     ax, dx
        pop     di
        pop     si
        leave
        retf
far_d565e:
        push    bp
        mov     bp, sp
        push    8
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    far_d555b
        add     sp, 0eh
        pop     bp
        retf
far_d567e:
        push    bp
        mov     bp, sp
        push    0ah
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    far_d555b
        add     sp, 0eh
        pop     bp
        retf
fn_d569e:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        mov     byte ptr [B_7AAA], 25h
        mov     byte ptr [B_7AAB], 0
        mov     byte ptr [B_7AAC], 0
        mov     byte ptr [B_7AAD], 0
        mov     byte ptr [B_7AAE], 0
        mov     byte ptr [B_7AAF], 0
        mov     byte ptr [B_7AB0], 0
        mov     byte ptr [B_7AB1], 0
        mov     byte ptr [B_7AB2], 0
        mov     byte ptr [B_7AB3], 0
        push    8
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    0ah
        push    ds
        push    word B_7AAA
        push    word ptr [bp + 6]
        if      FW_VERSION >= 311
        callf   SEG_D5CA:far_d5ca6
        else
        callf   0dee2h:L_dee2e
        endif
        add     sp, 0eh
        or      ax, ax
        jz      br_d56fa
        xor     dx, dx
        xor     ax, ax
        pop     si
        leave
        retf
br_d56fa:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp - 2]
        mov     ah, 0
        shl     ax, 8
        mov     dl, byte ptr [bp - 1]
        mov     dh, 0
        add     ax, dx
        mov     word ptr [W_7ABE], ax
        else
        cmp     byte ptr [bp - 4], 0
        jnz     L_deadf
        cmp     byte ptr [bp - 3], 0
        jnz     L_deadf
        cmp     byte ptr [bp - 2], 2
        jnz     L_deadf
        cmp     byte ptr [bp - 1], 0
        jz      L_deae6
L_deadf:
        xor     dx, dx
        xor     ax, ax
        pop     si
        leave
        retf
L_deae6:
        endif
        mov     word ptr [bp - 0ah], 0
        mov     word ptr [bp - 0ch], 0
        xor     si, si
loop_d5718:
        mov     cl, 8
        mov     dx, word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ch]
        callf   0f800h:far_fa1ac
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        mov     al, byte ptr [bp+si - 8]
        mov     ah, 0
        cwd
        or      word ptr [bp - 0ch], ax
        or      word ptr [bp - 0ah], dx
        inc     si
        cmp     si, 4
        jl      loop_d5718
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 0ch]
        or      ax, word ptr [bp - 0ah]
        jz      br_d574d
        add     word ptr [bp - 0ch], 1
        adc     word ptr [bp - 0ah], 0
br_d574d:
        endif
        mov     dx, word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ch]
        if      FW_VERSION >= 311
        pop     si
        leave
        retf
far_d5756:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        xor     si, si
loop_d5763:
        push    di
        push    cs
        call    fn_d569e
        add     sp, 2
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        or      ax, dx
        jnz     br_d577d
        xor     dx, dx
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_d577d:
        cmp     word ptr [W_7ABE], 200h
        jz      br_d5793
        cmp     word ptr [W_7ABE], 800h
        jz      br_d5793
        inc     si
        cmp     si, 4
        jl      loop_d5763
br_d5793:
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        pop     di
        else
        add     ax, 1
        adc     dx, 0
        endif
        pop     si
        leave
        retf
fn_d579d:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 24h
        else
        sub     sp, 16h
        endif
        push    si
        push    di
        push    ss
        pop     es
        if      FW_VERSION >= 311
        lea     di, [bp - 24h]
        else
        lea     di, [bp - 16h]
        endif
        xor     ax, ax
        mov     ah, al
        if      FW_VERSION >= 311
        mov     cx, 12h
        else
        mov     cx, 0bh
        endif
        rep stosw
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 24h]
        else
        lea     ax, [bp - 16h]
        endif
        push    ax
        if      FW_VERSION >= 311
        push    23h
        push    word ptr [W_7ACC]
        else
        push    15h
        mov     al, byte ptr [W_7ACC]
        cbw
        push    ax
        endif
        push    cs
        call    fn_d5460
        add     sp, 8
        or      ax, ax
        jz      br_d57cf
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_d57cf:
        xor     si, si
loop_d57d1:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jnz     br_d57e1
        mov     ax, 1
        pop     di
        pop     si
        leave
        retf
br_d57e1:
        if      FW_VERSION >= 311
        mov     al, byte ptr [bp+si - 1ch]
        else
        mov     al, byte ptr [bp+si - 0eh]
        endif
        les     bx, dword ptr [bp + 6]
        cmp     al, byte ptr es:[bx]
        jz      br_d57f2
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_d57f2:
        inc     word ptr [bp + 6]
        inc     si
        if      FW_VERSION >= 311
        cmp     si, 24h
        else
        cmp     si, 16h
        endif
        jl      loop_d57d1
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
far_d5801:
        if      FW_VERSION < 311
        push    bp
        mov     bp, sp
        sub     sp, 18h
        endif
        push    si
        push    di
        if      FW_VERSION >= 311
        mov     byte ptr [B_7AD0], 0
        mov     byte ptr [B_7ACA], 0
        else
        mov     byte ptr [B_7AD0], 0
        endif
        push    0
        nop
        push    cs
        call    far_d5b6a
        add     sp, 2
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        callf   SEG_D4FA:far_d4fb4
        or      ax, ax
        jz      br_d5830
        mov     ax, 1
        pop     di
        pop     si
        if      FW_VERSION < 311
        leave
        endif
        retf
br_d5830:
        if      FW_VERSION >= 311
        mov     di, 0ffffh
        mov     word ptr [W_7ACC], 0
        cmp     byte ptr [B_8435], 0
        jz      br_d587e
        mov     al, byte ptr [B_8435]
        cbw
        dec     ax
        mov     word ptr [W_7ACC], ax
        jmp     br_d587e
loop_d584a:
        push    word ptr [W_7ACC]
        else
        xor     di, di
        mov     word ptr [bp - 2], 0
        jmp     near L_dec4c
L_debc6:
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        push    15h
        push    word ptr [bp - 2]
        endif
        push    cs
        if      FW_VERSION >= 311
        call    far_d549d
        else
        call    fn_d5460
        add     sp, 8
        mov     si, ax
        or      si, si
        jnz     br_d5885
        push    word ptr [bp - 2]
        push    cs
        call    L_de8dc
        endif
        add     sp, 2
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     dx, ax
        cmp     ax, 302h
        jz      br_d5885
        jg      L_debfb
        endif
        or      ax, ax
        jz      br_d5885
        if      FW_VERSION >= 311
        cmp     si, 2
        else
        cmp     ax, 300h
        jz      br_d5885
        jmp     L_dec00
L_debfb:
        cmp     ax, 306h
        jz      br_d5885
L_dec00:
        dec     word ptr [bp - 2]
        jmp     L_dec49
br_d5885:
        cmp     si, 101h
        jz      L_dec49
        or      si, si
        endif
        jz      br_d5865
        cmp     si, 8
        jnz     br_d586d
        if      FW_VERSION >= 311
br_d5865:
        or      di, di
        jge     br_d586d
        mov     di, word ptr [W_7ACC]
br_d586d:
        cmp     byte ptr [B_8435], 0
        jz      br_d587a
        mov     word ptr [W_7ACC], 6
br_d587a:
        inc     word ptr [W_7ACC]
br_d587e:
        cmp     word ptr [W_7ACC], 7
        jc      loop_d584a
br_d5885:
        cmp     word ptr [W_7ACC], 7
        jnz     br_d58a5
        or      di, di
        jl      br_d589a
        mov     word ptr [W_7ACC], di
        endif
        mov     ax, 6
        pop     di
        pop     si
        if      FW_VERSION < 311
        leave
        endif
        retf
        if      FW_VERSION >= 311
br_d589a:
        callf   SEG_D4FA:far_d4fd3
        else
br_d586d:
        cmp     si, 302h
        jnz     L_dec28
        mov     ax, 6
        pop     di
        pop     si
        leave
        retf
L_dec28:
        inc     di
        mov     ax, di
        cmp     ax, 3
        jle     L_dec3c
        callf   0de2fh:far_d4fd3
        mov     ax, 3
        pop     di
        pop     si
        leave
        retf
L_dec3c:
        callf   0de2fh:far_d4fd3
        callf   0de2fh:far_d4fb4
        dec     word ptr [bp - 2]
L_dec49:
        inc     word ptr [bp - 2]
L_dec4c:
        cmp     word ptr [bp - 2], 7
        jge     br_d5865
        jmp     near L_debc6
br_d5865:
        cmp     word ptr [bp - 2], 7
        jnz     L_dec67
        callf   0de2fh:far_d4fd3
        endif
        mov     ax, 2
        pop     di
        pop     si
        if      FW_VERSION < 311
        leave
        endif
        retf
        if      FW_VERSION >= 311
br_d58a5:
        push    word ptr [W_7ACC]
        push    cs
        call    far_d5756
        add     sp, 2
        cmp     word ptr [W_7ABE], 200h
        jnz     br_d58bf
        mov     byte ptr [B_7AC0], 0
        jmp     br_d58d9
br_d58bf:
        cmp     word ptr [W_7ABE], 800h
        jnz     br_d58ce
        mov     byte ptr [B_7AC0], 5
        jmp     br_d58d9
br_d58ce:
        callf   SEG_D4FA:far_d4fd3
        mov     ax, 2
        pop     di
        pop     si
        retf
br_d58d9:
        else
L_dec67:
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [W_7ACC], al
        endif
        nop
        push    cs
        call    fn_d5953
        mov     si, ax
        if      FW_VERSION >= 311
        or      si, si
        jz      br_d58ec
        cmp     si, 5
        jz      br_d58ec
        else
        or      ax, ax
        jz      br_d5905
        endif
        pop     di
        pop     si
        if      FW_VERSION < 311
        leave
        endif
        retf
        if      FW_VERSION >= 312
br_d58ec:
        mov     byte ptr [B_F292], 0
        push    ds
        push    word STR_712E
        push    cs
        call    fn_d579d
        add     sp, 4
        or      ax, ax
        jz      br_d5905
        mov     byte ptr [B_F292], 1
        elseif  FW_VERSION = 311
br_d58ec:
        mov     byte ptr [B_F292], 0
        push    ds
        push    word STR_7084_V311
        push    cs
        call    fn_d579d
        add     sp, 4
        or      ax, ax
        jz      br_d5905
        mov     byte ptr [B_F292], 1
        endif
br_d5905:
        cmp     byte ptr [B_7AC2], 0
        jnz     br_d5916
        callf   SEG_D4E7:far_d4f81
        mov     byte ptr [B_7AC2], 1
br_d5916:
        push    1
        nop
        push    cs
        call    far_d5b6a
        add     sp, 2
        if      FW_VERSION >= 311
        mov     ax, si
        pop     di
        pop     si
        retf
fn_d5925:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 0ah]
        mov     cx, word ptr [bp + 0ch]
        xor     dx, dx
        jmp     br_d5946
loop_d5933:
        les     bx, dword ptr [bp + 6]
        add     word ptr [bp + 6], 2
        cmp     word ptr es:[bx], dx
        jz      br_d5944
        endif
        xor     ax, ax
        if      FW_VERSION >= 312
        pop     si
        pop     bp
        retf
br_d5944:
        add     dx, si
br_d5946:
        mov     ax, cx
        dec     cx
        or      ax, ax
        jnz     loop_d5933
        mov     ax, 1
        pop     si
        pop     bp
        retf
fn_d5953:
        push    bp
        mov     bp, sp
        sub     sp, 100eh
        push    si
        push    di
        mov     byte ptr [B_7ACA], 0
        push    ss
        lea     ax, [bp - 100eh]
        push    ax
        push    1
        push    0
        push    0
        push    word ptr [W_7ACC]
        push    cs
        call    far_d565e
        add     sp, 0ch
        mov     dx, ax
        or      ax, ax
        jz      br_d5996
        cmp     dx, 302h
        jnz     br_d598b
        mov     ax, 6
        pop     di
        pop     si
        leave
        retf
br_d598b:
        or      dx, dx
        jz      br_d5996
        mov     ax, 4
        pop     di
        pop     si
        leave
        retf
br_d5996:
        cmp     byte ptr [bp - 0e12h], 55h
        jnz     br_d59f9
        cmp     byte ptr [bp - 0e11h], 0aah
        jnz     br_d59f9
        mov     byte ptr [B_7ACA], 1
        mov     di, 40h
        mov     word ptr [bp - 4], 0
        mov     cx, TBL_7AD5
loop_d59b4:
        mov     ax, word ptr [bp+di - 100ch]
        mov     dx, word ptr [bp+di - 100eh]
        mov     bx, cx
        mov     word ptr [bx + 2], ax
        mov     word ptr [bx], dx
        cmp     word ptr [bp - 4], 0
        jz      br_d59d0
        mov     ax, word ptr [bx]
        or      ax, word ptr [bx + 2]
        jz      br_d59df
br_d59d0:
        add     di, 4
        add     cx, 4
        inc     word ptr [bp - 4]
        cmp     cx, 7b3dh
        jnz     loop_d59b4
br_d59df:
        mov     al, byte ptr [bp - 4]
        mov     byte ptr [B_7AD0], al
        mov     al, byte ptr [bp - 0ff6h]
        mov     byte ptr [B_7ACF], al
        mov     al, byte ptr [bp - 0ff4h]
        mov     byte ptr [B_7ACE], al
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_d59f9:
        push    61h
        push    word 0d05h
        push    ss
        lea     ax, [bp - 100ch]
        push    ax
        push    cs
        call    fn_d5925
        add     sp, 8
        or      ax, ax
        jnz     br_d5a16
        mov     ax, 5
        pop     di
        pop     si
        leave
        retf
br_d5a16:
        mov     byte ptr [B_7ACF], 10h
        mov     byte ptr [B_7ACE], 10h
        cmp     byte ptr [B_7AC0], 5
        jnz     br_d5a2c
        mov     ax, 8
        jmp     br_d5a2f
br_d5a2c:
        mov     ax, 22h
br_d5a2f:
        mov     word ptr [bp - 0ah], ax
        push    ss
        lea     ax, [bp - 100eh]
        push    ax
        push    1
        push    0
        push    word ptr [bp - 0ah]
        push    word ptr [W_7ACC]
        push    cs
        call    far_d565e
        add     sp, 0ch
        mov     dx, ax
        or      ax, ax
        jz      br_d5a6a
        cmp     dx, 302h
        jnz     br_d5a5d
        mov     ax, 6
        pop     di
        pop     si
        leave
        retf
br_d5a5d:
        cmp     dx, 300h
        jz      br_d5a6a
        mov     ax, 4
        pop     di
        pop     si
        leave
        retf
br_d5a6a:
        push    7fh
        push    word 270fh
        push    ss
        lea     ax, [bp - 100eh]
        push    ax
        push    cs
        call    fn_d5925
        add     sp, 8
        or      ax, ax
        jz      br_d5a8a
        mov     byte ptr [B_7ACA], 2
        mov     di, 100h
        jmp     br_d5ab1
br_d5a8a:
        push    7fh
        push    word 270fh
        push    ss
        lea     ax, [bp - 0c0eh]
        push    ax
        push    cs
        call    fn_d5925
        add     sp, 8
        or      ax, ax
        jz      br_d5aaa
        mov     byte ptr [B_7ACA], 3
        mov     di, 500h
        jmp     br_d5ab1
br_d5aaa:
        mov     ax, 5
        pop     di
        pop     si
        leave
        retf
br_d5ab1:
        lea     ax, [bp - 100eh]
        mov     bx, di
        add     bx, ax
        mov     si, bx
        cmp     byte ptr ss:[bx], 0
        jz      br_d5ac7
        cmp     byte ptr ss:[si], 12h
        jbe     br_d5ace
br_d5ac7:
        mov     ax, 5
        pop     di
        pop     si
        leave
        retf
br_d5ace:
        mov     al, byte ptr ss:[si]
        mov     byte ptr [B_7AD0], al
        add     di, 2
        mov     word ptr [TBL_7AD7], 0
        mov     word ptr [TBL_7AD5], 0
        cmp     byte ptr [B_7AC0], 5
        jnz     br_d5aef
        mov     ax, 4
        jmp     br_d5af2
br_d5aef:
        mov     ax, 10h
br_d5af2:
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 1
        mov     word ptr [bp - 0ch], TBL_7AD5
        mov     word ptr [bp - 0eh], 7ad9h
        jmp     br_d5b49
loop_d5b0b:
        mov     ax, word ptr [bp+di - 100eh]
        mov     word ptr [bp - 6], ax
        mov     bx, word ptr [bp - 6]
        xor     cx, cx
        mov     ax, word ptr [bp - 8]
        xor     dx, dx
        callf   0f800h:far_fa0c8
        mov     bx, word ptr [bp - 0ch]
        mov     cx, word ptr [bx + 2]
        mov     bx, word ptr [bx]
        add     bx, ax
        adc     cx, dx
        mov     si, word ptr [bp - 0eh]
        mov     word ptr [si + 2], cx
        mov     word ptr [si], bx
        mov     ax, word ptr [bp - 6]
        add     word ptr [bp - 2], ax
        add     di, 2
        add     word ptr [bp - 0ch], 4
        add     word ptr [bp - 0eh], 4
        inc     word ptr [bp - 4]
br_d5b49:
        mov     al, byte ptr [B_7AD0]
        mov     ah, 0
        cmp     ax, word ptr [bp - 4]
        jnc     loop_d5b0b
        mov     ax, word ptr [bp+di - 100eh]
        cmp     ax, word ptr [bp - 2]
        jz      br_d5b63
        mov     ax, 5
        pop     di
        pop     si
        leave
        retf
br_d5b63:
        mov     ax, 5
        elseif  FW_VERSION = 311
        pop     si
        pop     bp
        retf
br_d5944:
        add     dx, si
br_d5946:
        mov     ax, cx
        dec     cx
        or      ax, ax
        jnz     loop_d5933
        mov     ax, 1
        pop     si
        pop     bp
        retf
fn_d5953:
        push    bp
        mov     bp, sp
        sub     sp, 100eh
        push    si
        push    di
        mov     byte ptr [B_7ACA], 0
        push    ss
        lea     ax, [bp - 100eh]
        push    ax
        push    1
        push    0
        push    0
        push    word ptr [W_7ACC]
        push    cs
        call    far_d565e
        add     sp, 0ch
        mov     dx, ax
        or      ax, ax
        jz      br_d5996
        cmp     dx, 302h
        jnz     br_d598b
        mov     ax, 6
        pop     di
        pop     si
        leave
        retf
br_d598b:
        or      dx, dx
        jz      br_d5996
        mov     ax, 4
        pop     di
        pop     si
        leave
        retf
br_d5996:
        cmp     byte ptr [bp - 0e12h], 55h
        jnz     br_d59f9
        cmp     byte ptr [bp - 0e11h], 0aah
        jnz     br_d59f9
        mov     byte ptr [B_7ACA], 1
        mov     di, 40h
        mov     word ptr [bp - 4], 0
        mov     cx, TBL_7AD5
loop_d59b4:
        mov     ax, word ptr [bp+di - 100ch]
        mov     dx, word ptr [bp+di - 100eh]
        mov     bx, cx
        mov     word ptr [bx + 2], ax
        mov     word ptr [bx], dx
        cmp     word ptr [bp - 4], 0
        jz      br_d59d0
        mov     ax, word ptr [bx]
        or      ax, word ptr [bx + 2]
        jz      br_d59df
br_d59d0:
        add     di, 4
        add     cx, 4
        inc     word ptr [bp - 4]
        cmp     cx, 7a85h
        jnz     loop_d59b4
br_d59df:
        mov     al, byte ptr [bp - 4]
        mov     byte ptr [B_7AD0], al
        mov     al, byte ptr [bp - 0ff6h]
        mov     byte ptr [B_7ACF], al
        mov     al, byte ptr [bp - 0ff4h]
        mov     byte ptr [B_7ACE], al
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_d59f9:
        push    61h
        push    word 0d05h
        push    ss
        lea     ax, [bp - 100ch]
        push    ax
        push    cs
        call    fn_d5925
        add     sp, 8
        or      ax, ax
        jnz     br_d5a16
        mov     ax, 5
        pop     di
        pop     si
        leave
        retf
br_d5a16:
        mov     byte ptr [B_7ACF], 10h
        mov     byte ptr [B_7ACE], 10h
        cmp     byte ptr [B_7AC0], 5
        jnz     br_d5a2c
        mov     ax, 8
        jmp     br_d5a2f
br_d5a2c:
        mov     ax, 22h
br_d5a2f:
        mov     word ptr [bp - 0ah], ax
        push    ss
        lea     ax, [bp - 100eh]
        push    ax
        push    1
        push    0
        push    word ptr [bp - 0ah]
        push    word ptr [W_7ACC]
        push    cs
        call    far_d565e
        add     sp, 0ch
        mov     dx, ax
        or      ax, ax
        jz      br_d5a6a
        cmp     dx, 302h
        jnz     br_d5a5d
        mov     ax, 6
        pop     di
        pop     si
        leave
        retf
br_d5a5d:
        cmp     dx, 300h
        jz      br_d5a6a
        mov     ax, 4
        pop     di
        pop     si
        leave
        retf
br_d5a6a:
        push    7fh
        push    word 270fh
        push    ss
        lea     ax, [bp - 100eh]
        push    ax
        push    cs
        call    fn_d5925
        add     sp, 8
        or      ax, ax
        jz      br_d5a8a
        mov     byte ptr [B_7ACA], 2
        mov     di, 100h
        jmp     br_d5ab1
br_d5a8a:
        push    7fh
        push    word 270fh
        push    ss
        lea     ax, [bp - 0c0eh]
        push    ax
        push    cs
        call    fn_d5925
        add     sp, 8
        or      ax, ax
        jz      br_d5aaa
        mov     byte ptr [B_7ACA], 3
        mov     di, 500h
        jmp     br_d5ab1
br_d5aaa:
        mov     ax, 5
        pop     di
        pop     si
        leave
        retf
br_d5ab1:
        lea     ax, [bp - 100eh]
        mov     bx, di
        add     bx, ax
        mov     si, bx
        cmp     byte ptr ss:[bx], 0
        jz      br_d5ac7
        cmp     byte ptr ss:[si], 12h
        jbe     br_d5ace
br_d5ac7:
        mov     ax, 5
        pop     di
        pop     si
        leave
        retf
br_d5ace:
        mov     al, byte ptr ss:[si]
        mov     byte ptr [B_7AD0], al
        add     di, 2
        mov     word ptr [TBL_7AD7], 0
        mov     word ptr [TBL_7AD5], 0
        cmp     byte ptr [B_7AC0], 5
        jnz     br_d5aef
        mov     ax, 4
        jmp     br_d5af2
br_d5aef:
        mov     ax, 10h
br_d5af2:
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 1
        mov     word ptr [bp - 0ch], TBL_7AD5
        mov     word ptr [bp - 0eh], 7a21h
        jmp     br_d5b49
loop_d5b0b:
        mov     ax, word ptr [bp+di - 100eh]
        mov     word ptr [bp - 6], ax
        mov     bx, word ptr [bp - 6]
        xor     cx, cx
        mov     ax, word ptr [bp - 8]
        xor     dx, dx
        callf   0f800h:far_fa0c8
        mov     bx, word ptr [bp - 0ch]
        mov     cx, word ptr [bx + 2]
        mov     bx, word ptr [bx]
        add     bx, ax
        adc     cx, dx
        mov     si, word ptr [bp - 0eh]
        mov     word ptr [si + 2], cx
        mov     word ptr [si], bx
        mov     ax, word ptr [bp - 6]
        add     word ptr [bp - 2], ax
        add     di, 2
        add     word ptr [bp - 0ch], 4
        add     word ptr [bp - 0eh], 4
        inc     word ptr [bp - 4]
br_d5b49:
        mov     al, byte ptr [B_7AD0]
        mov     ah, 0
        cmp     ax, word ptr [bp - 4]
        jnc     loop_d5b0b
        mov     ax, word ptr [bp+di - 100eh]
        cmp     ax, word ptr [bp - 2]
        jz      br_d5b63
        mov     ax, 5
        pop     di
        pop     si
        leave
        retf
br_d5b63:
        mov     ax, 5
        endif
        pop     di
        pop     si
        leave
        retf
far_d5b6a:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     al, byte ptr [B_7AD0]
        if      FW_VERSION >= 311
        mov     ah, 0
        else
        cbw
        endif
        mov     word ptr [bp - 2], ax
        cmp     ax, word ptr [bp + 6]
        jnc     br_d5b80
        mov     word ptr [bp + 6], ax
br_d5b80:
        xor     ax, ax
        mov     dl, byte ptr [bp + 6]
        mov     es, ax
        mov     byte ptr es:[0fch], dl
        cmp     word ptr [bp + 6], 0
        jz      br_d5ba8
        mov     bx, word ptr [bp + 6]
        dec     bx
        shl     bx, 2
        mov     ax, word ptr [bx + TBL_7AD7]
        mov     dx, word ptr [bx + TBL_7AD5]
        mov     word ptr [W_7AD3], ax
        mov     word ptr [W_7AD1], dx
br_d5ba8:
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [B_7AC3], al
        if      FW_VERSION >= 311
        mov     byte ptr [B_7ACB], 0
        endif
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_cab48
        add     sp, 2
        mov     ax, word ptr [bp + 6]
        if      FW_VERSION < 311
        leave
        retf
fn_d5953:
        push    bp
        mov     bp, sp
        sub     sp, 202h
        push    si
L_decf8:
        push    ss
        lea     ax, [bp - 202h]
        push    ax
        push    1
        push    0
        push    0
        mov     al, byte ptr [W_7ACC]
        cbw
        push    ax
        push    cs
        call    far_d565e
        add     sp, 0ch
        mov     dx, ax
        cmp     ax, 306h
        jz      L_decf8
        cmp     dx, 302h
        jnz     L_ded23
        mov     ax, 6
        pop     si
        leave
        retf
L_ded23:
        or      dx, dx
        jz      L_ded2d
        mov     ax, 4
        pop     si
        leave
        retf
L_ded2d:
        cmp     byte ptr [bp - 6], 55h
        jz      L_ded3f
        cmp     byte ptr [bp - 5], 0aah
        jz      L_ded3f
        mov     ax, 5
        pop     si
        leave
        retf
L_ded3f:
        mov     si, 40h
        mov     word ptr [bp - 2], 0
        mov     cx, 6eabh
L_ded4a:
        mov     ax, word ptr [bp+si - 200h]
        mov     dx, word ptr [bp+si - 202h]
        mov     bx, cx
        mov     word ptr [bx + 2], ax
        mov     word ptr [bx], dx
        cmp     word ptr [bp - 2], 0
        jz      L_ded66
        mov     ax, word ptr [bx]
        or      ax, word ptr [bx + 2]
        jz      L_ded75
L_ded66:
        add     si, 4
        add     cx, 4
        inc     word ptr [bp - 2]
        cmp     cx, 6f13h
        jnz     L_ded4a
L_ded75:
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_7AD0], al
        mov     al, byte ptr [bp - 1eah]
        mov     byte ptr [B_7ACF], al
        mov     al, byte ptr [bp - 1e8h]
        mov     byte ptr [B_7ACE], al
        xor     ax, ax
        pop     si
        endif
        leave
        retf
far_d5bc3:
        cmp     byte ptr [B_7AC3], 0
        jz      br_d5be7
        push    cs
        call    fn_d5953
        cmp     byte ptr [B_7AC1], 0
        jz      br_d5bda
        mov     byte ptr [B_7AC3], 1
br_d5bda:
        mov     al, byte ptr [B_7AC3]
        if      FW_VERSION >= 311
        mov     ah, 0
        else
        cbw
        endif
        push    ax
        push    cs
        call    far_d5b6a
        add     sp, 2
br_d5be7:
        retf
far_d5be8:
        if      FW_VERSION >= 311
        push    si
        push    di
        endif
        mov     byte ptr [B_7AC4], 2
        mov     al, byte ptr [B_8434]
        cbw
        mov     dx, 0ah
        imul    dx
        push    ax
        push    0
        callf   SEG_B057:far_b0570
        add     sp, 4
        if      FW_VERSION < 311
        jmp     br_d5c2e
L_dedcd:
        push    cs
        call    far_d5801
        mov     byte ptr [B_7AC4], al
        or      al, al
        jnz     L_dede6
        endif
        push    0
        if      FW_VERSION >= 311
        callf   SEG_B057:far_b0580
        else
        callf   SEG_B057:far_b058d
        endif
        add     sp, 2
        if      FW_VERSION >= 311
        add     ax, 5
        mov     di, ax
        jmp     br_d5c73
loop_d5c14:
        else
        mov     ax, 1
        retf
L_dede6:
        endif
        callf   SEG_D7B2:far_d7b2c
        or      ax, ax
        jz      br_d5c2e
        callf   SEG_D79E:far_d79ee
        cmp     ax, 75h
        jnz     br_d5c2e
        mov     byte ptr [B_7AC4], 2
        jmp     br_d5c83
br_d5c2e:
        if      FW_VERSION >= 311
        mov     ax, di
        sub     ax, si
        cmp     ax, 5
        jl      br_d5c73
        mov     di, si
        push    cs
        call    far_d5801
        mov     byte ptr [B_7AC4], al
        cmp     byte ptr [B_7AC4], 0
        jz      br_d5c4e
        cmp     byte ptr [B_7ACA], 0
        jz      br_d5c5e
br_d5c4e:
        push    0
        callf   SEG_B057:far_b058d
        add     sp, 2
        mov     ax, 1
        pop     di
        pop     si
        retf
br_d5c5e:
        cmp     byte ptr [B_8435], 0
        jz      br_d5c73
        cmp     byte ptr [B_7AC4], 4
        jz      br_d5c83
        cmp     byte ptr [B_7AC4], 5
        jz      br_d5c83
br_d5c73:
        endif
        push    0
        callf   SEG_B057:far_b0580
        add     sp, 2
        if      FW_VERSION >= 311
        mov     si, ax
        endif
        or      ax, ax
        if      FW_VERSION >= 311
        jnz     loop_d5c14
        else
        jnz     L_dedcd
        endif
br_d5c83:
        push    0
        callf   SEG_B057:far_b058d
        add     sp, 2
        cmp     byte ptr [B_7AC4], 6
        jnz     br_d5c99
        mov     byte ptr [B_7AC4], 2
br_d5c99:
        mov     al, byte ptr [B_7AC4]
        if      FW_VERSION >= 311
        mov     ah, 0
        else
        cbw
        endif
        neg     ax
        sbb     ax, ax
        inc     ax
        if      FW_VERSION >= 311
        pop     di
        pop     si
        endif
        retf
        if      FW_VERSION >= 312
        phase   6
far_d5ca6:
        elseif  FW_VERSION = 311
        phase   8
far_d5ca6:
        else
        phase   0eh
L_dee2e:
        endif
        push    bp
        mov     bp, sp
        push    si
        push    di
        if      FW_VERSION >= 311
        cmp     byte ptr [B_7AC0], 5
        jnz     br_d5cb7
        mov     ax, 32h
        jmp     br_d5cba
br_d5cb7:
        mov     ax, 2
br_d5cba:
        mov     di, ax
        jmp     br_d5d23
        else
        mov     si, word ptr [bp + 6]
        mov     di, word ptr [bp + 0ch]
        mov     dx, 0ffffh
        jmp     L_dee80
        endif
loop_d5cbe:
        if      FW_VERSION >= 311
        push    2
        else
        push    1
        endif
        callf   SEG_B059:far_b059a
        add     sp, 2
loop_d5cc8:
        push    word ptr [bp + 12h]
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        if      FW_VERSION >= 311
        push    word ptr [bp + 0ch]
        else
        push    di
        endif
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        if      FW_VERSION >= 311
        push    word ptr [bp + 6]
        else
        push    si
        endif
        callf   SEG_D4FA:far_d50a2
        add     sp, 0eh
        if      FW_VERSION >= 311
        mov     si, ax
        else
        mov     dx, ax
        endif
        cmp     ax, 8
        jz      loop_d5cbe
        if      FW_VERSION >= 311
        cmp     si, 2
        jnz     br_d5d18
        push    word ptr [bp + 6]
        nop
        push    cs
        call    far_d5db8
        else
        cmp     dx, 2
        jnz     L_dee78
        push    si
        callf   SEG_D546:L_de8dc
        endif
        add     sp, 2
        mov     dx, ax
        if      FW_VERSION >= 311
        cmp     dx, 302h
        jz      br_d5d0a
        cmp     dx, 306h
        jnz     br_d5d16
br_d5d0a:
        push    1
        callf   SEG_B059:far_b059a
        add     sp, 2
        jmp     br_d5d22
br_d5d16:
        mov     si, dx
br_d5d18:
        cmp     si, 301h
        jnz     br_d5d27
        xor     si, si
        jmp     br_d5d27
br_d5d22:
        dec     di
br_d5d23:
        or      di, di
        jnz     loop_d5cc8
br_d5d27:
        mov     ax, si
        else
L_dee78:
        cmp     dx, 301h
        jnz     L_dee80
        xor     dx, dx
L_dee80:
        cmp     dx, 0ffffh
        jz      loop_d5cc8
        mov     ax, dx
        endif
        pop     di
        pop     si
        pop     bp
        retf
far_d5d2d:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 6]
        xor     dx, dx
        or      ax, ax
        jz      br_d5da2
        mov     bx, ax
        cmp     bx, 302h
        jz      tgt_d5d7d
        jg      br_d5d6d
        cmp     bx, 104h
        jz      tgt_d5d96
        jg      br_d5d5f
        cmp     bx, 101h
        jz      tgt_d5d7d
        cmp     bx, 102h
        if      FW_VERSION >= 311
        jz      tgt_d5d82
        else
        jz      L_deee0
        endif
        cmp     bx, 103h
        if      FW_VERSION >= 311
        jz      tgt_d5d87
        else
        jz      L_deee0
        endif
        jmp     tgt_d5d9f
br_d5d5f:
        cmp     bx, 106h
        jz      tgt_d5d7d
        cmp     bx, 301h
        jz      br_d5d9b
        jmp     tgt_d5d9f
br_d5d6d:
        sub     bx, 303h
        cmp     bx, 8
        ja      tgt_d5d9f
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_d5da6]
tgt_d5d7d:
        mov     dx, 0ff80h
        jmp     br_d5da2
        if      FW_VERSION >= 311
tgt_d5d82:
        else
L_deee0:
        endif
        mov     dx, 0ff20h
        jmp     br_d5da2
tgt_d5d87:
        mov     dx, 0ff10h
        jmp     br_d5da2
tgt_d5d8c:
        mov     dx, 0ff03h
        jmp     br_d5da2
tgt_d5d91:
        mov     dx, 0ff02h
        jmp     br_d5da2
tgt_d5d96:
        mov     dx, 0ff01h
        jmp     br_d5da2
br_d5d9b:
        xor     dx, dx
        jmp     br_d5da2
tgt_d5d9f:
        mov     dx, 0ff50h
br_d5da2:
        mov     ax, dx
        pop     bp
        retf
TBL_d5da6:
        dw      tgt_d5d87
        if      FW_VERSION >= 311
        dw      tgt_d5d82
        else
        dw      L_deee0
        endif
        dw      tgt_d5d96
        dw      tgt_d5d91
        dw      tgt_d5d8c
        dw      tgt_d5d9f
        dw      tgt_d5d9f
        dw      tgt_d5d9f
        dw      tgt_d5d7d
        if      FW_VERSION >= 312
far_d5db8:
        push    bp
        mov     bp, sp
        sub     sp, 20h
        mov     byte ptr [bp - 6], 3
        mov     byte ptr [bp - 5], 0
        mov     byte ptr [bp - 4], 0
        mov     byte ptr [bp - 3], 0
        mov     byte ptr [bp - 2], 18h
        mov     byte ptr [bp - 1], 0
        mov     byte ptr [B_7AA7], 0
        mov     byte ptr [B_7AA6], 0
        push    18h
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        push    6
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    word ptr [bp + 6]
        callf   SEG_D4FA:far_d50a2
        add     sp, 0eh
        mov     dx, ax
        or      dx, dx
        jnz     br_d5e40
        mov     al, byte ptr [bp - 20h]
        mov     ah, 0
        mov     word ptr [bp - 8], ax
        and     ax, 70h
        cmp     ax, 70h
        jnz     br_d5e27
        mov     al, byte ptr [bp - 1eh]
        mov     ah, 0
        and     ax, 0fh
        mov     dx, ax
        mov     al, byte ptr [bp - 14h]
        mov     byte ptr [B_7AA7], al
        mov     al, byte ptr [bp - 13h]
        mov     byte ptr [B_7AA6], al
        jmp     br_d5e2d
br_d5e27:
        mov     dx, word ptr [bp - 8]
        and     dx, 0fh
br_d5e2d:
        or      dx, dx
        jz      br_d5e40
        add     dx, 300h
        cmp     dx, 306h
        jnz     br_d5e40
        mov     byte ptr [B_7AC1], 1
br_d5e40:
        mov     word ptr [W_7AA8], dx
        mov     ax, dx
        leave
        retf
        phase   8
        elseif  FW_VERSION = 311
far_d5db8:
        push    bp
        mov     bp, sp
        sub     sp, 20h
        mov     byte ptr [bp - 6], 3
        mov     byte ptr [bp - 5], 0
        mov     byte ptr [bp - 4], 0
        mov     byte ptr [bp - 3], 0
        mov     byte ptr [bp - 2], 18h
        mov     byte ptr [bp - 1], 0
        mov     byte ptr [B_7AA7], 0
        mov     byte ptr [B_7AA6], 0
        push    18h
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        push    6
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    word ptr [bp + 6]
        callf   SEG_D4FA:far_d50a2
        add     sp, 0eh
        mov     dx, ax
        or      dx, dx
        jnz     br_d5e40
        mov     al, byte ptr [bp - 20h]
        mov     ah, 0
        mov     word ptr [bp - 8], ax
        and     ax, 70h
        cmp     ax, 70h
        jnz     br_d5e27
        mov     al, byte ptr [bp - 1eh]
        mov     ah, 0
        and     ax, 0fh
        mov     dx, ax
        mov     al, byte ptr [bp - 14h]
        mov     byte ptr [B_7AA7], al
        mov     al, byte ptr [bp - 13h]
        mov     byte ptr [B_7AA6], al
        jmp     br_d5e2d
br_d5e27:
        mov     dx, word ptr [bp - 8]
        and     dx, 0fh
br_d5e2d:
        or      dx, dx
        jz      br_d5e40
        add     dx, 300h
        cmp     dx, 306h
        jnz     br_d5e40
        mov     byte ptr [B_7AC1], 1
br_d5e40:
        mov     word ptr [W_7AA8], dx
        mov     ax, dx
        leave
        retf
        phase   0ah
        else
        phase   6
        endif
fn_d5e48:
        callf   0fb00h:far_fb14d
        mov     dx, 8010h
        mov     ds, dx
        mov     es, dx
        add     word ptr [W_D627], 4e20h
        adc     word ptr [W_D629], 0
        callf   SEG_CDDA:far_cddaa
        inc     word ptr [W_D4B2]
        dec     word ptr [W_7384]
        callf   0fb00h:far_fb57c
        cmp     byte ptr [B_CEBF], 0
        jz      br_d5e7d
        mov     al, 50h
        mov     byte ptr [B_D4BE], al
br_d5e7d:
        mov     dx, 0e8h
        in      ax, dx
        and     ax, 1800h
        mov     al, ah
        cmp     ah, byte ptr [B_A5BF]
        jz      br_d5e8f
        call    fn_d5e9e
br_d5e8f:
        int     42h
        cli
        mov     dx, 0c010h
        mov     al, 60h
        out     dx, al
        callf   0fb00h:far_fb18a
        iret
fn_d5e9e:
        mov     bl, byte ptr [B_A5BF]
        mov     byte ptr [B_A5BF], al
        mov     ah, al
        shr     ah, 4
        shr     al, 3
        and     al, 1
        mov     bh, bl
        shr     bh, 4
        shr     bl, 3
        and     bl, 1
        cmp     bl, al
        push    ax
        push    bx
        jz      br_d5ece
        mov     al, byte ptr [B_826D]
        ja      br_d5ecb
        call    fn_d5ee3
        jmp     br_d5ece
        db      090h
br_d5ecb:
        call    fn_d5f43
br_d5ece:
        pop     bx
        pop     ax
        cmp     bh, ah
        jz      br_d5ee2
        mov     al, byte ptr [B_826E]
        ja      br_d5edf
        call    fn_d5ee3
        jmp     br_d5ee2
        db      090h
br_d5edf:
        call    fn_d5f43
br_d5ee2:
        ret
fn_d5ee3:
        mov     bl, al
        mov     bh, 0
        mov     al, byte ptr cs:[bx + TBL_d5f94]
        test    al, 80h
        jnz     br_d5ef4
        call    fn_d5f63
br_d5ef3:
        ret
br_d5ef4:
        and     al, 7fh
        add     bx, bx
        if      FW_VERSION >= 312
        call    word ptr cs:[bx +TBL_d5f9f]
        elseif  FW_VERSION = 311
        call    word ptr cs:[bx +TBL_d5f9f]
        else
        call    word ptr cs:[bx +TBL_d5f9f]
        endif
        jmp     br_d5ef3
tgt_d5eff:
        or      byte ptr [B_A5C6], 2
        cmp     byte ptr [B_A5C2], 10h
        jnz     br_d5f21
        mov     al, 57h
        jmp     br_d5f21
        db      090h
tgt_d5f10:
        and     byte ptr [B_A5C6], 0fdh
        jmp     br_d5f21
        db      090h
tgt_d5f18:
        test    byte ptr [B_A5C2], 15h
        jz      br_d5f21
        mov     al, 58h
br_d5f21:
        if      FW_VERSION >= 311
        callf   SEG_DD59:far_dd592
        else
        callf   SEG_DD59:L_e5c00
        endif
        ret
tgt_d5f27:
        or      byte ptr [B_A5C6], 2
        cmp     byte ptr [B_A5C2], 4
        jnz     br_d5f3d
        mov     al, 56h
        jmp     br_d5f3d
        db      090h
tgt_d5f38:
        and     byte ptr [B_A5C6], 0fdh
br_d5f3d:
        if      FW_VERSION >= 311
        callf   SEG_DD59:far_dd592
        else
        callf   SEG_DD59:L_e5c00
        endif
        ret
fn_d5f43:
        mov     bl, al
        mov     bh, 0
        mov     al, byte ptr cs:[bx + TBL_d5fb5]
        or      al, al
        jz      br_d5f57
        test    al, 80h
        jnz     br_d5f58
        call    fn_d5f63
br_d5f57:
        ret
br_d5f58:
        and     al, 7fh
        add     bx, bx
        if      FW_VERSION >= 312
        call    word ptr cs:[bx +TBL_d5fc0]
        elseif  FW_VERSION = 311
        call    word ptr cs:[bx +TBL_d5fc0]
        else
        call    word ptr cs:[bx +TBL_d5fc0]
        endif
        jmp     br_d5f57
fn_d5f63:
        mov     cl, al
        mov     bx, A_12C6
        callf   0fb00h:far_fb672
        ret
tgt_d5f6e:
        mov     byte ptr [B_A5C8], 1
        jmp     fn_d5f63
tgt_d5f75:
        mov     byte ptr [B_A5C8], 0
        jmp     fn_d5f63
tgt_d5f7c:
        mov     byte ptr [B_A5C7], 1
        jmp     fn_d5f63
tgt_d5f83:
        mov     byte ptr [B_A5C7], 0
        jmp     fn_d5f63
tgt_d5f8a:
        mov     bx, word ptr [W_D4B2]
        mov     word ptr [W_D5E3], bx
        jmp     fn_d5f63
TBL_d5f94:
        db      0d9h, 0dah, 0c5h, 0d2h, 02bh, 02dh, 0d6h, 0d7h, 07bh, 07dh, 0d4h
TBL_d5f9f:
        dw      tgt_d5f18
        dw      tgt_d5f18
        dw      tgt_d5f7c
        dw      tgt_d5f6e
        dw      0
        dw      0
        dw      tgt_d5eff
        dw      tgt_d5f27
        dw      0
        dw      0
        dw      tgt_d5f8a
TBL_d5fb5:
        db      000h, 000h, 0e5h, 0f2h, 000h, 000h, 0f6h, 0f7h, 000h, 000h, 000h
TBL_d5fc0:
        dw      0
        dw      0
        dw      tgt_d5f83
        dw      tgt_d5f75
        dw      0
        dw      0
        dw      tgt_d5f10
        dw      tgt_d5f38
far_d5fd0:
        pushf
        cli
        mov     dx, 0c033h
        mov     al, 0
        out     dx, al
        mov     dx, 0c030h
        in      al, dx
        mov     bl, al
        in      al, dx
        mov     bh, al
        mov     ax, 4e20h
        sub     ax, bx
        cmp     ax, 3e8h
        ja      br_d6003
        push    ax
        mov     dx, 0c011h
        in      al, dx
        push    ax
        mov     al, 0feh
        out     dx, al
        mov     dx, 0c010h
        mov     al, 0c7h
        out     dx, al
        sti
        nop
        pop     ax
        mov     dx, 0c011h
        cli
        out     dx, al
        pop     ax
br_d6003:
        mov     bx, word ptr [W_D627]
        mov     cx, word ptr [W_D629]
        add     bx, ax
        adc     cx, 0
        popf
        mov     dx, cx
        mov     ax, bx
        retf
        db      "cba789xyzuH456FKJLG", 0
        db      "123USlsOd.0"
        db      00dh, 06bh, 041h, 05eh, 074h, 042h, 02bh, 045h, 052h, 054h, 043h, 03ch, 021h, 03eh, 04dh, 02dh
        db      05bh
        db      "{/}]VWXYZi", 0
        db      000h, 000h, 000h, 000h, 000h
TBL_d6056:
        if      FW_VERSION >= 311
        db      "Jfgtuwxv", 0
        else
        db      "Jfgtuwx", 0
        endif
TBL_d605f:
        if      FW_VERSION >= 311
        db      "hervwppj"
        else
        db      "hervwpp"
        endif
        db      00ch, 00dh, 00eh, 00fh, 008h, 009h, 00ah, 00bh, 004h, 005h, 006h, 007h, 000h, 001h, 002h, 003h
        if      FW_VERSION >= 312
        phase   67h
        elseif  FW_VERSION = 311
        phase   69h
        else
        phase   63h
        endif
far_d6077:
        callf   0fb00h:far_fb14d
        mov     ax, 8010h
        mov     ds, ax
        mov     word ptr [W_9462], 0
        in      al, 0d2h
        test    al, 2
        jnz     br_d6097
        inc     word ptr [W_9462]
        mov     dx, 0d0h
        call    fn_d6115
br_d6097:
        in      al, 0c2h
        test    al, 2
        jnz     br_d60aa
        inc     word ptr [W_9462]
        mov     si, 0
        mov     dx, 0c0h
        call    fn_d64d7
br_d60aa:
        in      al, 0cah
        test    al, 2
        jnz     br_d60bd
        inc     word ptr [W_9462]
        mov     dx, 0c8h
        mov     si, 2
        call    fn_d64d7
br_d60bd:
        cli
        and     byte ptr [TBL_943B], 0fbh
        mov     al, byte ptr [TBL_943B]
        mov     dx, 0c6h
        out     dx, al
        and     byte ptr [B_943C], 0fbh
        mov     al, byte ptr [B_943C]
        mov     dx, 0ceh
        out     dx, al
        and     byte ptr [B_943D], 0fbh
        mov     al, byte ptr [B_943D]
        mov     dx, 0d6h
        out     dx, al
        mov     al, 65h
        mov     dx, 0c010h
        out     dx, al
        mov     al, 0c7h
        out     dx, al
        or      byte ptr [TBL_943B], 4
        mov     al, byte ptr [TBL_943B]
        mov     dx, 0c6h
        out     dx, al
        or      byte ptr [B_943C], 4
        mov     al, byte ptr [B_943C]
        mov     dx, 0ceh
        out     dx, al
        or      byte ptr [B_943D], 4
        mov     al, byte ptr [B_943D]
        mov     dx, 0d6h
        out     dx, al
        callf   0fb00h:far_fb18a
        iret
fn_d6115:
        mov     bx, word ptr [W_713C]
        if      FW_VERSION >= 311
        cmp     bx, A_011D
        else
        cmp     bx, tgt_d612d
        endif
        in      al, dx
        jz      tgt_d612d
        test    al, 80h
        jz      br_d612b
        inc     word ptr [W_9458]
        if      FW_VERSION >= 312
        mov     bx, A_011D
        else
        mov     bx, tgt_d612d
        endif
br_d612b:
        jmp     bx
tgt_d612d:
        mov     byte ptr [B_713E], al
        cmp     al, 90h
        jnz     br_d613a
        mov     bx, tgt_d6158
        jmp     br_d64d2
br_d613a:
        cmp     al, 0a0h
        jnz     br_d6144
        mov     bx, tgt_d628c
        jmp     br_d64d2
br_d6144:
        cmp     al, 0b0h
        jnz     br_d614e
        mov     bx, tgt_d626d
        jmp     br_d64d2
br_d614e:
        cmp     al, 0e0h
        jnz     br_d6155
        mov     bx, tgt_d6494
br_d6155:
        jmp     br_d64d2
tgt_d6158:
        cmp     al, 10h
        jnc     br_d617d
        if      FW_VERSION >= 312
        mov     bx, 57h
        elseif  FW_VERSION = 311
        mov     bx, 59h
        else
        mov     bx, 53h
        endif
        segcs
        xlat
        mov     byte ptr [B_7142], al
        add     al, byte ptr [B_D4B5]
        mov     byte ptr [B_D4BF], al
        sub     ah, ah
        push    ax
        callf   SEG_DAB0:far_dab06
        pop     bx
        mov     byte ptr [B_713F], al
        mov     bx, tgt_d6186
        jmp     br_d64d2
br_d617d:
        mov     byte ptr [B_713F], al
        mov     bx, tgt_d62e2
        jmp     br_d64d2
tgt_d6186:
        or      al, al
        jnz     br_d61b1
        mov     byte ptr [B_713E], 80h
        mov     byte ptr [B_7140], 40h
        cmp     byte ptr [B_D4AB], 0
        jz      br_d61a3
        mov     cl, byte ptr [B_9781]
        mov     byte ptr [B_713F], cl
br_d61a3:
        mov     bl, byte ptr [B_713F]
        xor     bh, bh
        mov     byte ptr [bx + TBL_966E], 0
        jmp     br_d64b1
br_d61b1:
        cmp     byte ptr [B_D4AA], 0
        jz      br_d61ba
        mov     al, 7fh
br_d61ba:
        mov     byte ptr [B_7141], 40h
        cmp     byte ptr [B_D4AB], 0
        jz      br_d6226
        mov     bl, byte ptr [B_7142]
        mov     cl, byte ptr [B_9781]
        mov     byte ptr [B_713F], cl
        cmp     byte ptr [B_7FC7], 0
        jz      br_d621d
        cmp     byte ptr [B_9780], 0
        jz      br_d6205
        push    ax
        mov     al, bl
        inc     al
        shl     al, 3
        dec     al
        push    word ptr [B_9780]
        push    ax
        callf   SEG_DA7E:far_da7e0
        add     sp, 4
        mov     byte ptr [B_7141], al
        mov     al, byte ptr [B_9780]
        or      byte ptr [B_713E], al
        pop     ax
        jmp     br_d6226
        db      090h
br_d6205:
        add     bl, 0dh
        sub     bl, byte ptr [B_E426]
        mov     bh, bl
        shl     bl, 2
        add     bl, bh
        add     bl, 4
        mov     byte ptr [B_7141], bl
        jmp     br_d6226
        db      090h
br_d621d:
        inc     bl
        shl     bl, 3
        dec     bl
        mov     al, bl
br_d6226:
        mov     bl, byte ptr [B_713F]
        sub     bh, bh
        mov     byte ptr [B_9781], bl
        mov     byte ptr [B_7140], al
        mov     al, byte ptr [B_7141]
        mov     byte ptr [bx + TBL_95EE], al
        mov     bx, 6ach
        mov     cl, byte ptr [B_713E]
        callf   SEG_DAC6:far_dac9a
        mov     cl, byte ptr [B_713F]
        callf   SEG_DAC6:far_dac9a
        mov     cl, byte ptr [B_7140]
        callf   SEG_DAC6:far_dac9a
        mov     cl, byte ptr [B_7141]
        callf   SEG_DAC6:far_dac9a
        mov     bx, tgt_d612d
        jmp     br_d64d2
fn_d6267:
        mov     byte ptr [B_7140], al
        jmp     br_d64b1
tgt_d626d:
        mov     bx, tgt_d6273
        jmp     br_d64d2
tgt_d6273:
        push    word ptr [B_977E]
        push    ax
        if      FW_VERSION >= 311
        mov     byte ptr [B_977C], al
        endif
        callf   SEG_DA7E:far_da7e0
        add     sp, 4
        mov     byte ptr [B_977D], al
        mov     bx, tgt_d612d
        jmp     br_d64d2
tgt_d628c:
        if      FW_VERSION >= 312
        mov     bx, 57h
        elseif  FW_VERSION = 311
        mov     bx, 59h
        else
        mov     bx, 53h
        endif
        segcs
        xlat
        mov     byte ptr [B_7142], al
        add     al, byte ptr [B_D4B5]
        sub     ah, ah
        push    ax
        callf   SEG_DAB0:far_dab06
        pop     bx
        mov     byte ptr [B_713F], al
        mov     bx, tgt_d62aa
        jmp     br_d64d2
tgt_d62aa:
        test    byte ptr [B_D4AA], 0ffh
        jz      br_d62b3
        mov     al, 7fh
br_d62b3:
        cmp     byte ptr [B_D4AB], 0
        jz      br_d62d2
        cmp     byte ptr [B_7FC7], 0
        jnz     br_d62cb
        mov     al, byte ptr [B_7142]
        inc     al
        shl     al, 3
        dec     al
br_d62cb:
        mov     bl, byte ptr [B_9781]
        jmp     br_d62d6
        db      090h
br_d62d2:
        mov     bl, byte ptr [B_713F]
br_d62d6:
        xor     bh, bh
        mov     byte ptr [bx + TBL_966E], al
        mov     bx, tgt_d612d
        jmp     br_d64d2
tgt_d62e2:
        mov     byte ptr [B_A5C8], 0
        mov     byte ptr [B_A5C7], 0
        mov     byte ptr [B_A571], 0
        or      al, al
        mov     al, byte ptr [B_713F]
        jnz     br_d62fb
        jmp     br_d641a
br_d62fb:
        mov     ah, 1
        mov     byte ptr [B_7143], ah
        and     al, 7fh
        sub     al, 40h
        jc      br_d6358
        mov     ch, al
        if      FW_VERSION >= 312
        mov     bx, 6
        elseif  FW_VERSION = 311
        mov     bx, 8
        else
        mov     bx, 4
        endif
        segcs
        xlat
        or      al, al
        jz      br_d6358
        cmp     byte ptr [B_7B5D], 0
        jz      br_d631c
        jmp     br_d647e
br_d631c:
        cmp     al, 54h
        jnz     br_d632b
        mov     dx, word ptr [W_D4B2]
        mov     word ptr [W_D5E3], dx
        jmp     br_d647e
br_d632b:
        cmp     al, 61h
        jnz     br_d6343
        xor     byte ptr [B_D4AC], 1
        push    ax
        mov     ah, 0
        jz      br_d633b
        mov     ah, 1
br_d633b:
        mov     al, 0fh
        int     46h
        pop     ax
        jmp     loop_d648e
br_d6343:
        cmp     al, 63h
        jnz     br_d635b
        xor     byte ptr [B_D4AA], 1
        push    ax
        mov     ah, 0
        jz      br_d6353
        mov     ah, 1
br_d6353:
        mov     al, 0dh
        int     46h
        pop     ax
br_d6358:
        jmp     loop_d648e
br_d635b:
        cmp     al, 52h
        jnz     br_d637f
        cmp     byte ptr [B_A5C1], 0
        jz      br_d6399
        cmp     byte ptr [B_7FE3], 0
        jz      br_d6399
        mov     byte ptr [B_A5C8], 1
        mov     byte ptr [B_A571], 1
        or      byte ptr [B_955C], 40h
        jmp     br_d647e
br_d637f:
        cmp     al, 45h
        jnz     br_d639c
        cmp     byte ptr [B_A5C1], 0
        jz      br_d6399
        mov     byte ptr [B_A5C7], 1
        mov     byte ptr [B_A571], 1
        or      byte ptr [B_955C], 40h
br_d6399:
        jmp     br_d647e
br_d639c:
        cmp     al, 2bh
        jz      br_d63c4
        cmp     al, 2dh
        jz      br_d63c4
        cmp     al, 21h
        jz      br_d63c4
        cmp     al, 5eh
        jz      br_d63c4
        cmp     al, 3eh
        jz      br_d63c4
        cmp     al, 3ch
        jz      br_d63c4
        cmp     al, 5bh
        jz      br_d63c4
        cmp     al, 7bh
        jz      br_d63c4
        cmp     al, 7dh
        jz      br_d63c4
        cmp     al, 5dh
        jnz     br_d63d3
br_d63c4:
        mov     byte ptr [B_D4BC], al
        mov     dl, 4
        push    ax
        callf   0fb00h:far_fb38c
        pop     ax
        jmp     near br_d647e
br_d63d3:
        mov     cl, al
        cmp     al, 69h
        jz      br_d63de
        cmp     ch, 34h
        jnc     br_d63e1
br_d63de:
        jmp     near loop_d6480
br_d63e1:
        cmp     al, 59h
        jz      br_d63e9
        cmp     al, 5ah
        jnz     br_d63f1
br_d63e9:
        or      byte ptr [B_A5C6], 1
        if      FW_VERSION >= 311
        jmp     br_d6412
        else
        jmp     L_df4cf
        endif
        db      090h
br_d63f1:
        cmp     al, 56h
        jnz     br_d63fd
        or      byte ptr [B_A5C4], 1
        if      FW_VERSION >= 311
        jmp     br_d6412
        else
        jmp     L_df4cf
        endif
        db      090h
br_d63fd:
        cmp     al, 57h
        if      FW_VERSION >= 311
        jnz     br_d6409
        else
        jnz     L_df4cf
        endif
        or      byte ptr [B_A5C4], 2
        if      FW_VERSION >= 311
        jmp     br_d6412
        db      090h
br_d6409:
        cmp     al, 58h
        jnz     br_d6412
        mov     byte ptr [B_A5C5], 1
br_d6412:
        callf   SEG_DD59:far_dd592
        else
L_df4cf:
        callf   SEG_DD59:L_e5c00
        endif
        jmp     loop_d648e
        db      090h
br_d641a:
        xor     ah, ah
        mov     byte ptr [B_7143], ah
        mov     byte ptr [B_D4BC], ah
        mov     dl, 4
        push    ax
        callf   0fb00h:far_fb4a2
        pop     ax
        mov     bx, 0ffffh
loop_d6430:
        inc     bx
        mov     ah, byte ptr cs:[word bx + TBL_d6056-1d0h]
        or      ah, ah
        jz      loop_d648e
        cmp     al, ah
        jnz     loop_d6430
        mov     cl, byte ptr cs:[word bx + TBL_d605f-1d0h]
        cmp     al, 74h
        jc      loop_d6480
        mov     al, cl
        if      FW_VERSION >= 311
        cmp     al, 6ah
        jnz     br_d6455
        mov     byte ptr [B_A5C5], 0
        jmp     br_d6476
        db      090h
br_d6455:
        endif
        cmp     al, 70h
        jnz     br_d6461
        and     byte ptr [B_A5C6], 0feh
        jmp     br_d6476
        db      090h
br_d6461:
        cmp     al, 76h
        jnz     br_d646d
        and     byte ptr [B_A5C4], 0feh
        jmp     br_d6476
        db      090h
br_d646d:
        cmp     al, 77h
        jnz     br_d6476
        and     byte ptr [B_A5C4], 0fdh
br_d6476:
        if      FW_VERSION >= 311
        callf   SEG_DD59:far_dd592
        else
        callf   SEG_DD59:L_e5d36
        endif
        jmp     loop_d648e
        db      090h
br_d647e:
        mov     cl, al
loop_d6480:
        mov     bx, A_12C6
        callf   SEG_DAC6:far_dac6a
        jns     loop_d648e
        inc     word ptr [W_945C]
loop_d648e:
        mov     bx, tgt_d612d
        jmp     br_d64d2
        db      090h
tgt_d6494:
        mov     byte ptr [B_713F], al
        mov     bx, tgt_d649d
        jmp     br_d64d2
        db      090h
tgt_d649d:
        cmp     al, byte ptr [B_713F]
        jnz     loop_d648e
        mov     cl, 2bh
        or      al, al
        jz      loop_d6480
        mov     cl, 2dh
        cmp     al, 7fh
        jnz     loop_d648e
        jmp     loop_d6480
br_d64b1:
        mov     bx, 6ach
        mov     cl, byte ptr [B_713E]
        callf   SEG_DAC6:far_dac9a
        mov     cl, byte ptr [B_713F]
        callf   SEG_DAC6:far_dac9a
        mov     cl, byte ptr [B_7140]
        callf   SEG_DAC6:far_dac9a
        mov     bx, tgt_d612d
br_d64d2:
        mov     word ptr [W_713C], bx
        ret
fn_d64d7:
        in      al, dx
        test    al, 80h
        jz      br_d6517
        cmp     al, 0f8h
        jc      br_d64e3
        jmp     br_d6555
        db      090h
br_d64e3:
        shr     si, 1
        mov     cl, byte ptr [si + TBL_7150]
        test    cl, cl
        jz      br_d6503
        mov     byte ptr [si + TBL_7150], 0
        shr     cl, 1
        inc     cl
        sub     ch, ch
        push    ax
        if      FW_VERSION >= 312
        call    fn_d693e
        else
        call    fn_d693e-1d0h
        endif
        pop     ax
        if      FW_VERSION >= 312
        call    fn_d699c
        else
        call    fn_d699c-1d0h
        endif
        jmp     br_d6526
        db      090h
br_d6503:
        shl     si, 1
        mov     bx, word ptr [si + TBL_7144]
        shr     si, 1
        cmp     bx, br_d662d
        jnz     br_d6526
        if      FW_VERSION >= 312
        call    fn_d699c
        else
        call    fn_d699c-1d0h
        endif
        jmp     br_d6526
        db      090h
br_d6517:
        mov     bx, word ptr [si + TBL_7144]
        shr     si, 1
        jmp     bx
tgt_d651f:
        test    al, 80h
        jnz     br_d6526
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
br_d6526:
        mov     bl, al
        and     bl, 0f0h
        mov     byte ptr [si + TBL_7148], al
        shr     bl, 3
        and     bx, 0eh
        jmp     word ptr cs:[bx + TBL_d653a]
TBL_d653a:
        dw      tgt_d661d
        dw      tgt_d65d7
        dw      tgt_d6613
        dw      tgt_d65fd
        dw      tgt_d65e7
        dw      tgt_d65f7
        dw      tgt_d6603
        dw      tgt_d654a
tgt_d654a:
        mov     bx, tgt_d651f
        shl     si, 1
        mov     word ptr [si + TBL_7144], bx
        shr     si, 1
br_d6555:
        mov     di, ax
        and     di, 0fh
        shl     di, 1
        jmp     word ptr cs:[di + TBL_d6561]
TBL_d6561:
        dw      tgt_d6581
        dw      tgt_d6587
        dw      tgt_d65a5
        dw      tgt_d65ab
        dw      tgt_d65d6
        dw      tgt_d65d6
        dw      tgt_d65c9
        dw      tgt_d65d6
        dw      tgt_d65b1
        dw      tgt_d65d6
        dw      tgt_d65b7
        dw      tgt_d65bd
        dw      tgt_d65c3
        dw      tgt_d65d6
        dw      tgt_d65d6
        dw      tgt_d65d6
tgt_d6581:
        mov     bx, tgt_d67e0
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d6587:
        if      FW_VERSION >= 311
        cmp     byte ptr [B_7FD3], 0
        jz      br_d65a2
        endif
        cmp     byte ptr [B_7FD1], 1
        if      FW_VERSION >= 311
        jnz     br_d65a2
        mov     ax, si
        inc     al
        cmp     al, byte ptr [B_7FCF]
        endif
        jnz     br_d65a2
        mov     bx, tgt_d6831
br_d65a2:
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d65a5:
        mov     bx, tgt_d6662
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d65ab:
        mov     bx, tgt_d6693
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d65b1:
        callf   SEG_EB71:far_eb71a-0e0h
        ret
tgt_d65b7:
        callf   SEG_EB71:far_eb739
        ret
tgt_d65bd:
        callf   SEG_EB71:far_eb769
        ret
tgt_d65c3:
        callf   SEG_EB71:far_eb799
        ret
tgt_d65c9:
        test    byte ptr [B_8074], 1
        jz      tgt_d65d6
        mov     cx, 1
        if      FW_VERSION >= 312
        jmp     br_d6906
        else
        jmp     br_d6906-1d0h
        endif
tgt_d65d6:
        ret
tgt_d65d7:
        mov     bx, tgt_d651f
        test    byte ptr [TBL_7FEB], 1
        jz      br_d65e4
        mov     bx, tgt_d66dc
br_d65e4:
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d65e7:
        mov     bx, tgt_d651f
        test    byte ptr [B_7FEC], 1
        jz      br_d65f4
        mov     bx, tgt_d66d2
br_d65f4:
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d65f7:
        if      FW_VERSION >= 312
        mov     bx, tgt_d67ae
        jmp     br_d6937
        elseif  FW_VERSION = 311
        mov     bx, 7a0h
        jmp     br_d6937-1d0h
        else
        mov     bx, 764h
        jmp     br_d6937-1d0h
        endif
tgt_d65fd:
        mov     bx, tgt_d6732
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d6603:
        mov     bx, tgt_d651f
        test    byte ptr [B_7FED], 1
        jz      br_d662a
        mov     bx, tgt_d68d5
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d6613:
        mov     bx, tgt_d651f
        test    byte ptr [B_7FEF], 1
        jz      br_d662a
tgt_d661d:
        mov     bx, tgt_d651f
        test    byte ptr [TBL_7FEB], 1
        jz      br_d662a
        mov     bx, tgt_d671b
br_d662a:
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
br_d662d:
        if      FW_VERSION >= 312
        mov     bx, L_d6744
        else
        mov     bx, 734h
        endif
        or      si, si
        jz      br_d6637
        mov     bx, 0d31h
br_d6637:
        mov     cl, al
        callf   SEG_DAC6:far_dac9a
        jns     br_d665c
        push    es
        mov     ax, SEG_A8EC
        mov     es, ax
        callf   0fb00h:far_fb6de
        pop     es
        mov     cl, 0f9h
        callf   SEG_DAC6:far_dac9a
        if      FW_VERSION >= 312
        call    fn_d699c
        else
        call    fn_d699c-1d0h
        endif
        mov     bx, tgt_d651f
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
br_d665c:
        mov     bx, br_d662d
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d6662:
        mov     byte ptr [si + TBL_7148], al
        mov     bx, tgt_d666c
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d666c:
        cmp     byte ptr [B_7FD1], 0
        jnz     br_d66cc
        if      FW_VERSION >= 311
        cmp     byte ptr [B_7FD3], 0
        jz      br_d66cc
        endif
        cmp     byte ptr [B_7FD4], 0
        jz      br_d66cc
        mov     ah, al
        mov     al, byte ptr [si + TBL_7148]
        shl     al, 1
        shr     ax, 1
        mov     word ptr [W_D5E5], ax
        mov     al, 6eh
        jmp     br_d66a6
        db      090h
tgt_d6693:
        cmp     byte ptr [B_7FD1], 0
        jnz     br_d66cc
        cmp     byte ptr [B_7FD4], 0
        jz      br_d66cc
        mov     byte ptr [B_D4B1], al
        mov     al, 6dh
br_d66a6:
        mov     bx, A_12C6
        cmp     byte ptr [B_A5C2], 0
        jnz     br_d66cc
        push    ax
        mov     cl, byte ptr [B_D4C2]
        callf   SEG_DAC6:far_dac6a
        jns     br_d66c0
        inc     word ptr [W_945C]
br_d66c0:
        pop     cx
        callf   SEG_DAC6:far_dac6a
        jns     br_d66cc
        inc     word ptr [W_945C]
br_d66cc:
        mov     bx, tgt_d651f
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d66d2:
        mov     byte ptr [si + TBL_714A], al
        mov     cx, 2
        if      FW_VERSION >= 312
        jmp     br_d6906
        else
        jmp     br_d6906-1d0h
        endif
tgt_d66dc:
        or      byte ptr [si + TBL_7148], 90h
        mov     byte ptr [si + TBL_714A], al
        mov     bx, tgt_d66eb
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d66eb:
        or      al, al
        jz      br_d6708
        test    byte ptr [B_817F], 0ffh
        jz      br_d66f9
        mov     al, byte ptr [B_8180]
br_d66f9:
        mov     byte ptr [si + TBL_714C], al
        mov     byte ptr [si + TBL_714E], 40h
        mov     cx, 4
        jmp     br_d6715
        db      090h
br_d6708:
        and     byte ptr [si + TBL_7148], 0efh
        mov     byte ptr [si + TBL_714C], 40h
        mov     cx, 3
br_d6715:
        mov     bx, tgt_d66dc
        if      FW_VERSION >= 312
        jmp     br_d6906
        else
        jmp     br_d6906-1d0h
        endif
tgt_d671b:
        mov     byte ptr [si + TBL_714A], al
        mov     bx, tgt_d6725
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
tgt_d6725:
        mov     byte ptr [si + TBL_714C], al
        mov     bx, tgt_d671b
        mov     cx, 3
        if      FW_VERSION >= 312
        jmp     br_d6906
        else
        jmp     br_d6906-1d0h
        endif
tgt_d6732:
        mov     byte ptr [si + TBL_714A], al
        if      FW_VERSION >= 312
        mov     bx, tgt_d673c
        jmp     br_d6937
        elseif  FW_VERSION = 311
        mov     bx, 72eh
        jmp     br_d6937-1d0h
        phase   8feh
        else
        mov     bx, 6f5h
        jmp     br_d6937-1d0h
        phase   8c5h
        endif
tgt_d673c:
        mov     byte ptr [si + TBL_714C], al
        mov     bl, byte ptr [si + TBL_714A]
L_d6744:
        xor     bh, bh
        test    byte ptr [bx + TBL_7FF4], 1
        jz      br_d67a8
        cmp     bl, byte ptr [B_83C9]
        jnz     br_d675a
        cmp     byte ptr [B_96EE], 0
        jnz     br_d677f
br_d675a:
        test    al, 3fh
        jz      br_d6772
        cmp     al, 7fh
        jz      br_d6772
        mov     cl, byte ptr [bx + TBL_96FA]
        sub     cl, al
        jns     br_d676c
        neg     cl
br_d676c:
        if      FW_VERSION >= 312
        cmp     cl, byte ptr [bx +TBL_807E]
        elseif  FW_VERSION = 311
        cmp     cl, byte ptr [bx +TBL_7FC6_V311]
        else
        cmp     cl, byte ptr [bx +TBL_7454_V308]
        endif
        jl      br_d67a8
br_d6772:
        mov     byte ptr [bx + TBL_96FA], al
        if      FW_VERSION >= 312
        mov     bx, tgt_d6732
        else
        mov     bx, A_0722
        endif
        mov     cx, 3
        jmp     br_d6906
br_d677f:
        cmp     byte ptr [B_8188], 0
        jz      br_d6795
        mov     bl, byte ptr [si + TBL_7148]
        and     bl, 0fh
        inc     bl
        cmp     byte ptr [B_8188], bl
        jnz     br_d67a8
br_d6795:
        push    word ptr [B_977E]
        push    ax
        if      FW_VERSION >= 311
        mov     byte ptr [B_977C], al
        endif
        callf   SEG_DA7E:far_da7e0
        add     sp, 4
        mov     byte ptr [B_977D], al
br_d67a8:
        if      FW_VERSION >= 312
        mov     bx, tgt_d6732
        else
        mov     bx, A_0722
        endif
        jmp     br_d6937
tgt_d67ae:
        mov     byte ptr [B_956B], al
        test    byte ptr [B_7FEE], 1
        jz      br_d67dd
        test    al, al
        jz      br_d67d0
        cmp     al, 7fh
        jz      br_d67d0
        mov     cl, byte ptr [B_977A]
        sub     cl, al
        jns     br_d67ca
        neg     cl
br_d67ca:
        cmp     cl, byte ptr [B_8078]
        jl      br_d67dd
br_d67d0:
        mov     byte ptr [B_977A], al
        mov     byte ptr [si + TBL_714A], al
        mov     cx, 2
        jmp     br_d6906
br_d67dd:
        jmp     br_d6937
        if      FW_VERSION = 311
        phase   7d2h
        elseif  FW_VERSION < 311
        phase   796h
        endif
tgt_d67e0:
        add     byte ptr [si + TBL_7150], 2
        mov     bl, byte ptr [si + TBL_7150]
        cmp     bl, 6
        jnc     br_d67fa
        sub     bh, bh
        if      FW_VERSION >= 312
        mov     byte ptr [bx+si + 7148h], al
        elseif  FW_VERSION = 311
        mov     byte ptr [bx+si + 709eh], al
        else
        mov     byte ptr [bx+si + 69e6h], al
        endif
        mov     bx, tgt_d67e0
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
br_d67fa:
        cmp     byte ptr [si + TBL_714A], 7fh
        jz      br_d6816
        cmp     byte ptr [si + TBL_714A], 7eh
        jnz     br_d6813
        cmp     byte ptr [B_9447], 0
        jnz     br_d6821
        cmp     al, 4
        jz      br_d6816
br_d6813:
        jmp     br_d6821
        db      090h
br_d6816:
        mov     byte ptr [si + TBL_7150], 0
        mov     bx, tgt_d651f
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
br_d6821:
        mov     byte ptr [si + TBL_7150], 0
        mov     cx, 3
        push    ax
        if      FW_VERSION >= 312
        call    fn_d693e
        else
        call    fn_d693e-1d0h
        endif
        pop     ax
        jmp     br_d662d
tgt_d6831:
        cmp     byte ptr [B_D5EE], 0
        jnz     br_d684b
        test    al, 0f0h
        jz      br_d683f
        if      FW_VERSION >= 311
        jmp     near br_d68cf
        else
        jmp     br_d68cf
        db      090h
        endif
br_d683f:
        and     al, 0fh
        mov     byte ptr [TBL_D5EF], al
        dec     byte ptr [B_D5EE]
        if      FW_VERSION >= 311
        jmp     near br_d68cf
        else
        jmp     br_d68cf
        db      090h
        endif
br_d684b:
        jg      br_d687d
        test    al, 0f0h
        jz      br_d6870
        mov     bl, al
        shr     bl, 4
        neg     bl
        cmp     bl, byte ptr [B_D5EE]
        jz      br_d6866
        mov     byte ptr [B_D5EE], 0
        jmp     br_d68cf
        db      090h
br_d6866:
        if      FW_VERSION >= 312
        call    fn_d6963
        else
        call    fn_d6963-1d0h
        endif
        dec     byte ptr [B_D5EE]
        jmp     br_d68cf
        db      090h
br_d6870:
        callf   SEG_DC8A:far_dc8ae
        mov     byte ptr [B_D5EE], 1
        jmp     br_d68cf
        db      090h
br_d687d:
        mov     bl, al
        shr     bl, 4
        if      FW_VERSION >= 311
        and     byte ptr [B_D5EE], 7
        endif
        cmp     bl, byte ptr [B_D5EE]
        jz      br_d68b8
        if      FW_VERSION >= 311
        cmp     byte ptr [B_D60A], 0ah
        jl      br_d68cf
        mov     dl, byte ptr [B_D5EE]
        mov     cl, bl
        sub     cl, byte ptr [B_D5EE]
        and     cx, 7
loop_d68a1:
        and     dl, 3
        jnz     br_d68b0
        add     word ptr [W_D635], 1
        adc     word ptr [W_D637], 0
br_d68b0:
        inc     dl
        loop    loop_d68a1
        else
        test    byte ptr [B_D5EE], 3
        pushf
        endif
        mov     byte ptr [B_D5EE], bl
        if      FW_VERSION < 311
        inc     byte ptr [B_D5EE]
        call    fn_d6963-1d0h
        popf
        jnz     br_d68cf
        callf   SEG_DC8A:far_dc8ae
        jmp     br_d68cf
        db      090h
        endif
br_d68b8:
        inc     byte ptr [B_D5EE]
        if      FW_VERSION >= 312
        cmp     byte ptr [B_D60A], 0ah
        jge     br_d68c6
        call    fn_d6963
        elseif  FW_VERSION = 311
        cmp     byte ptr [B_D60A], 0ah
        jge     br_d68c6
        call    fn_d6963-1d0h
        else
        call    fn_d6963-1d0h
        endif
br_d68c6:
        test    al, 30h
        jnz     br_d68cf
        callf   SEG_DC8A:far_dc8ae
br_d68cf:
        mov     bx, tgt_d651f
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
        db      090h
tgt_d68d5:
        mov     byte ptr [si + TBL_714A], al
        mov     bx, tgt_d68df
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
        db      090h
tgt_d68df:
        if      FW_VERSION <> 311
        mov     bx, tgt_d68d5
        else
        mov     bx, A_08C5
        endif
        mov     byte ptr [si + TBL_714C], al
        cmp     al, 40h
        jz      br_d68fa
        mov     cl, byte ptr [B_977B]
        sub     cl, al
        jns     br_d68f4
        neg     cl
br_d68f4:
        cmp     cl, byte ptr [B_8077]
        jl      br_d6903
br_d68fa:
        mov     byte ptr [B_977B], al
        mov     cx, 3
        if      FW_VERSION >= 312
        jmp     br_d6906
        else
        jmp     br_d6906-1d0h
        endif
        db      090h
br_d6903:
        if      FW_VERSION >= 312
        jmp     br_d6937
        else
        jmp     br_d6937-1d0h
        endif
        db      090h
        if      FW_VERSION = 311
        phase   0ac8h
        elseif  FW_VERSION < 311
        phase   0a71h
        endif
br_d6906:
        call    fn_d693e
        call    fn_d699c
        cmp     byte ptr [B_A5C1], 0
        jnz     br_d6937
        push    si
        push    bx
        push    es
        mov     dl, 2
        callf   0fb00h:far_fb4a2
        mov     ax, ds
        mov     es, ax
        mov     bx, B_D613
        mov     al, byte ptr [B_A5C1]
        mov     byte ptr [bx], al
        mov     byte ptr [bx + 1], 0
        xor     cx, cx
        callf   0fb00h:far_fb3a9
        pop     es
        pop     bx
        pop     si
br_d6937:
        shl     si, 1
        mov     word ptr [si + TBL_7144], bx
        ret
fn_d693e:
        lea     di, [si + TBL_7148]
        push    bx
        if      FW_VERSION >= 312
        mov     bx, L_d6744
        else
        mov     bx, 734h
        endif
        or      si, si
        jz      loop_d694d
        mov     bx, 0d31h
loop_d694d:
        push    cx
        mov     cl, byte ptr [di]
        add     di, 2
        callf   SEG_DAC6:far_dac9a
        jns     br_d695e
        inc     word ptr [W_945A]
br_d695e:
        pop     cx
        loop    loop_d694d
        pop     bx
        ret
fn_d6963:
        mov     ah, al
        mov     bl, al
        shr     bl, 5
        sub     bh, bh
        test    al, 10h
        jnz     br_d697a
        and     ah, 0fh
        mov     byte ptr [bx + TBL_D5EF], ah
        jmp     br_d6986
        db      090h
br_d697a:
        cmp     bx, 3
        jz      br_d6986
        shl     ah, 4
        or      byte ptr [bx + TBL_D5EF], ah
br_d6986:
        ret
fn_d6987:
        push    es
        push    si
        xor     ax, ax
        mov     es, ax
        cld
        xor     si, si
loop_d6990:
        seges
        lodsw
        test    byte ptr [B_7143], 1
        jnz     loop_d6990
        pop     si
        pop     es
        retf
fn_d699c:
        inc     byte ptr [si + TBL_9784]
        cmp     byte ptr [B_9447], 0
        jz      br_d69c9
        push    ax
        push    bx
        push    cx
        xor     bx, bx
        mov     bl, byte ptr [B_83C2]
        dec     bl
        cmp     si, bx
        jnz     br_d69c6
        mov     bx, A_12C6
        mov     cl, 50h
        callf   SEG_DAC6:far_dac6a
        jns     br_d69c6
        inc     word ptr [W_945C]
br_d69c6:
        pop     cx
        pop     bx
        pop     ax
br_d69c9:
        ret
        if      FW_VERSION >= 312
        phase   0ah
        elseif  FW_VERSION < 311
        db      0ffh
        endif
far_d69ca:
        callf   0fb00h:far_fb14d
        mov     ax, 8010h
        mov     ds, ax
        sub     di, di
        test    byte ptr [TBL_943B], 2
        jz      br_d69f3
        or      di, 10h
        mov     dx, 0c2h
        in      al, dx
        and     al, 1
        jz      br_d69f3
        mov     dx, 0c6h
        mov     si, 0
        mov     ch, 1
        call    fn_d6af2
br_d69f3:
        test    byte ptr [B_943C], 2
        jz      br_d6a10
        or      di, 20h
        mov     dx, 0cah
        in      al, dx
        and     al, 1
        jz      br_d6a10
        mov     dx, 0ceh
        mov     si, 2
        mov     ch, 2
        call    fn_d6af2
br_d6a10:
        test    byte ptr [B_943D], 2
        jz      br_d6a2d
        or      di, 40h
        mov     dx, 0d2h
        in      al, dx
        and     al, 1
        jz      br_d6a2d
        mov     dx, 0d6h
        mov     si, 4
        mov     ch, 4
        call    fn_d6af2
br_d6a2d:
        test    byte ptr [B_943E], 2
        jz      br_d6a4b
        or      di, 80h
        mov     dx, 0dah
        in      al, dx
        test    al, 1
        jz      br_d6a4b
        mov     dx, 0deh
        mov     si, 6
        mov     ch, 8
        call    fn_d6af2
br_d6a4b:
        push    cs
        if      FW_VERSION >= 312
        call    fn_d7b4e+1170h
        else
        call    fn_d7b4e
        endif
        or      ax, ax
        jnz     br_d6a5a
        mov     dl, 2
        callf   0fb00h:far_fb4a2
br_d6a5a:
        cli
        and     byte ptr [TBL_943B], 0fdh
        mov     al, byte ptr [TBL_943B]
        mov     dx, 0c6h
        out     dx, al
        and     byte ptr [B_943C], 0fdh
        mov     al, byte ptr [B_943C]
        mov     dx, 0ceh
        out     dx, al
        and     byte ptr [B_943D], 0fdh
        mov     al, byte ptr [B_943D]
        mov     dx, 0d6h
        out     dx, al
        and     byte ptr [B_943E], 0fdh
        mov     al, byte ptr [B_943E]
        mov     dx, 0deh
        out     dx, al
        mov     al, 64h
        mov     dx, 0c010h
        out     dx, al
        mov     al, 0c4h
        out     dx, al
        test    di, 100h
        jz      br_d6aa6
        or      byte ptr [TBL_943B], 2
        mov     al, byte ptr [TBL_943B]
        mov     dx, 0c6h
        out     dx, al
br_d6aa6:
        test    di, 200h
        jz      br_d6ab8
        or      byte ptr [B_943C], 2
        mov     al, byte ptr [B_943C]
        mov     dx, 0ceh
        out     dx, al
br_d6ab8:
        test    di, 400h
        jz      br_d6aca
        or      byte ptr [B_943D], 2
        mov     al, byte ptr [B_943D]
        mov     dx, 0d6h
        out     dx, al
br_d6aca:
        test    di, 800h
        jz      br_d6adc
        or      byte ptr [B_943E], 2
        mov     al, byte ptr [B_943E]
        mov     dx, 0deh
        out     dx, al
br_d6adc:
        callf   0fb00h:far_fb18a
        iret
        if      FW_VERSION >= 312
L_d6ae2:
        db      02eh, 013h, 030h, 019h, 032h, 01fh, 034h, 025h
L_d6aea:
        db      066h, 012h, 07eh, 012h, 096h, 012h, 0aeh, 012h
        elseif  FW_VERSION = 311
        db      02eh, 013h, 030h, 019h, 032h, 01fh, 034h, 025h, 066h, 012h, 07eh, 012h, 096h, 012h, 0aeh, 012h
        else
        db      02eh, 013h, 030h, 019h, 032h, 01fh, 034h, 025h, 064h, 012h, 074h, 012h, 084h, 012h, 094h, 012h
        endif
fn_d6af2:
        mov     ax, 8010h
        mov     es, ax
        if      FW_VERSION >= 312
        mov     bx, word ptr cs:[si + L_d6aea]
        elseif  FW_VERSION = 311
        mov     bx, word ptr cs:[si + 12ch]
        else
        mov     bx, word ptr cs:[si + 126h]
        endif
        callf   0fb00h:far_fb71b
        jns     br_d6b1a
        test    byte ptr [B_9782], ch
        jz      br_d6b2b
        mov     ax, SEG_A8EC
        mov     es, ax
        if      FW_VERSION >= 312
        mov     bx, word ptr cs:[si + L_d6ae2]
        elseif  FW_VERSION = 311
        mov     bx, word ptr cs:[si + 124h]
        else
        mov     bx, word ptr cs:[si + 11eh]
        endif
        callf   0fb00h:far_fb71b
        js      br_d6b25
br_d6b1a:
        or      di, cx
        mov     al, cl
        sub     dx, 6
        out     dx, al
        jmp     br_d6b2b
        db      090h
br_d6b25:
        not     ch
        and     byte ptr [B_9782], ch
br_d6b2b:
        ret
        if      FW_VERSION >= 312
        phase   0ch
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   8
        endif
far_d6b2c:
        callf   0fb00h:far_fb14d
        mov     ax, 8010h
        mov     ds, ax
        test    byte ptr [B_9569], 0ffh
        jz      br_d6b40
        jmp     br_d6cfd
br_d6b40:
        cmp     byte ptr [B_7FD3], 0
        jz      br_d6b4e
        cmp     byte ptr [B_7FD1], 2
        jge     br_d6b68
br_d6b4e:
        jmp     br_d6d25
        db      090h
TBL_d6b52:
        dw      tgt_d6b8b
        dw      tgt_d6bef
        dw      tgt_d6c75
        dw      tgt_d6c83
        dw      tgt_d6d19
        dw      tgt_d6d19
        dw      tgt_d6ca8
        dw      tgt_d6d19
        dw      tgt_d6d19
        dw      tgt_d6d19
        dw      tgt_d6d19
br_d6b68:
        les     bx, dword ptr [W_D641]
        mov     word ptr [W_D645], bx
        mov     word ptr [W_D647], es
        callf   SEG_D5E4:far_d5fd0
        mov     word ptr [W_D641], ax
        mov     word ptr [W_D643], dx
        mov     bl, byte ptr [B_D60A]
        xor     bh, bh
        jmp     word ptr cs:[word bx + TBL_d6b52]
tgt_d6b8b:
        cmp     byte ptr [B_901B], 0
        jge     br_d6b9a
        mov     byte ptr [B_D60A], 0eh
        jmp     tgt_d6d19
br_d6b9a:
        test    byte ptr [B_A5C2], 15h
        jz      br_d6ba9
        mov     byte ptr [B_D60A], 0eh
        jmp     tgt_d6d19
br_d6ba9:
        sub     ax, ax
        mov     word ptr [W_D635], ax
        mov     word ptr [W_D637], ax
        mov     word ptr [W_D60C], ax
        mov     byte ptr [TBL_A5CA], al
        mov     ah, 0
        mov     al, 4
        int     46h
        mov     byte ptr [B_A5C9], 0
        mov     ah, 0
        mov     al, 3
        int     46h
        cmp     byte ptr [B_7FD1], 2
        jnz     br_d6bdc
        mov     byte ptr [B_A573], 0fh
        mov     byte ptr [B_D60A], 2
        jmp     tgt_d6d19
br_d6bdc:
        mov     word ptr [W_D60C], 1
        mov     byte ptr [B_D60A], 0ah
        callf   SEG_DD59:far_dd6e7
        jmp     tgt_d6d19
tgt_d6bef:
        dec     byte ptr [B_A573]
        jle     br_d6bf8
        jmp     tgt_d6d19
br_d6bf8:
        mov     byte ptr [B_A573], 0
        mov     ax, word ptr [W_D641]
        mov     dx, word ptr [W_D643]
        sub     ax, word ptr [W_D645]
        sbb     dx, word ptr [W_D647]
        jnz     br_d6c1b
        cmp     ax, 9c40h
        ja      br_d6c1b
        mov     byte ptr [B_D60A], 0eh
        jmp     tgt_d6d19
br_d6c1b:
        call    fn_d6d3b
        jnc     br_d6c43
        mov     byte ptr [B_D60A], 4
        mov     ax, word ptr [W_8A8F]
        mov     word ptr [W_D635], ax
        mov     ax, word ptr [W_8A91]
        mov     word ptr [W_D637], ax
        add     word ptr [W_D635], 1
        adc     word ptr [W_D637], 0
        callf   SEG_DD59:far_dd6e7
        jmp     tgt_d6d19
br_d6c43:
        mov     si, A_D603
        callf   SEG_EB63:far_eb63c
        add     ax, 1
        adc     dx, 0
        mov     word ptr [W_D635], ax
        mov     word ptr [W_D637], dx
        mov     word ptr [W_D60C], 1
        mov     byte ptr [B_D60A], 0ah
        mov     byte ptr [B_956C], 0c8h
        mov     cl, 40h
        mov     bx, A_12C6
        callf   SEG_DAC6:far_dac6a
        jmp     near tgt_d6d19
tgt_d6c75:
        call    fn_d6d3b
        jc      br_d6c98
        mov     word ptr [W_D60C], 1
        jmp     near tgt_d6d19
tgt_d6c83:
        call    fn_d6d3b
        jc      br_d6c98
        mov     word ptr [W_D60C], 1
        mov     byte ptr [B_D60A], 8
        callf   SEG_DD59:far_dd6ec
br_d6c98:
        test    word ptr [W_D627], 36h
        jnz     br_d6ca5
        mov     byte ptr [B_D4BE], 50h
br_d6ca5:
        jmp     tgt_d6d19
        db      090h
tgt_d6ca8:
        cmp     byte ptr [B_7FD1], 2
        jnz     br_d6cf5
        mov     ax, word ptr [W_D641]
        mov     dx, word ptr [W_D643]
        sub     ax, word ptr [W_D645]
        sbb     dx, word ptr [W_D647]
        jnz     br_d6cd2
        cmp     ax, 9c40h
        ja      br_d6cd2
        mov     byte ptr [B_D60A], 0eh
        callf   SEG_DD59:far_dd6dd
        jmp     tgt_d6d19
        db      090h
br_d6cd2:
        sub     cx, cx
        mov     bl, byte ptr [B_7FCB]
        sub     bh, bh
        shl     bx, 2
br_d6cdd:
        sub     ax, word ptr [bx + 5e4h]
        sbb     dx, word ptr [bx + 5e6h]
        jle     br_d6cea
        inc     cx
        jmp     br_d6cdd
br_d6cea:
        jcxz    br_d6cf5
        add     word ptr [W_D635], cx
        adc     word ptr [W_D637], 0
br_d6cf5:
        callf   SEG_DE51:far_de51c
        jmp     tgt_d6d19
        db      090h
br_d6cfd:
        sti
        mov     dl, 3
        callf   0fb00h:far_fb38c
        jz      tgt_d6d19
        or      byte ptr [B_9457], 2
        mov     dx, 0c011h
        in      ax, dx
        or      ax, 40h
        out     dx, ax
        mov     byte ptr [B_D4BE], 50h
tgt_d6d19:
        mov     ax, word ptr [W_D60C]
        add     word ptr [W_D635], ax
        adc     word ptr [W_D637], 0
br_d6d25:
        mov     dx, 50h
        in      al, dx
        callf   SEG_EB7C:far_eb837
        cli
        mov     al, 66h
        mov     dx, 0c010h
        out     dx, al
        callf   0fb00h:far_fb18a
        iret
fn_d6d3b:
        in      al, 50h
        mov     ah, al
        and     ax, 300fh
        shr     ah, 4
        aad
        mov     byte ptr [B_D604], al
        in      al, 52h
        mov     ah, al
        and     ax, 700fh
        shr     ah, 4
        aad
        mov     byte ptr [B_D605], al
        in      al, 54h
        mov     ah, al
        and     ax, 700fh
        shr     ah, 4
        aad
        mov     byte ptr [B_D606], al
        in      al, 56h
        mov     ah, al
        and     ax, 700fh
        shr     ah, 4
        aad
        mov     byte ptr [B_D607], al
        cmp     al, byte ptr [B_8A97]
        jnz     br_d6d96
        mov     al, byte ptr [B_D606]
        cmp     al, byte ptr [B_8A96]
        jnz     br_d6d96
        mov     al, byte ptr [B_D605]
        cmp     al, byte ptr [B_8A95]
        jnz     br_d6d96
        mov     al, byte ptr [B_D604]
        cmp     al, byte ptr [B_8A94]
br_d6d96:
        ret
        db      0ffh
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   4
        endif
far_d6d98:
        callf   0fb00h:far_fb14d
        mov     ax, 8010h
        mov     ds, ax
        mov     es, ax
        inc     word ptr [W_D64B]
        cmp     byte ptr [B_D60A], 0
        jnz     br_d6db2
        jmp     br_d6e1c
        db      090h
br_d6db2:
        mov     bl, byte ptr [B_7FD1]
        cmp     bl, 2
        jz      br_d6dca
        cmp     bl, 1
        jz      br_d6dca
        cmp     byte ptr [B_D609], 0
        jz      br_d6dca
        jmp     br_d6e1c
        db      090h
br_d6dca:
        callf   SEG_D5E4:far_d5fd0
        mov     word ptr [W_D63D], bx
        mov     word ptr [W_D63F], cx
        cmp     byte ptr [B_956C], 0
        jz      br_d6de5
        dec     byte ptr [B_956C]
        jmp     br_d6e1c
        db      090h
br_d6de5:
        sub     bx, word ptr [W_D641]
        sbb     cx, word ptr [W_D643]
        cmp     byte ptr [B_7FD1], 4
        jnz     br_d6dfc
        cmp     cx, 3dh
        jnc     br_d6e01
        jmp     br_d6e1c
        db      090h
br_d6dfc:
        cmp     cx, 6
        jc      br_d6e1c
br_d6e01:
        cmp     byte ptr [B_D60A], 0eh
        mov     byte ptr [B_D60A], 0
        jz      br_d6e17
        callf   SEG_DD59:far_dd6dd
        mov     byte ptr [B_D4BE], 50h
br_d6e17:
        mov     byte ptr [B_D5EE], 0
br_d6e1c:
        add     word ptr [W_8820], 1
        cmp     byte ptr [B_D613], 6
        jge     br_d6e61
        cmp     byte ptr [B_D60A], 10h
        jnz     br_d6e59
        cmp     byte ptr [B_D609], 0
        jnz     br_d6e45
        mov     byte ptr [B_D609], 4
        add     word ptr [W_D639], 1
        adc     word ptr [W_D63B], 0
br_d6e45:
        test    word ptr [W_D64B], 3fh
        jnz     br_d6e52
        mov     byte ptr [B_D4BE], 50h
br_d6e52:
        dec     byte ptr [B_D609]
        jmp     br_d709b
br_d6e59:
        mov     byte ptr [B_D609], 0
        jmp     br_d709b
br_d6e61:
        add     word ptr [W_9041], 1
        adc     word ptr [W_9043], 0
        add     word ptr [W_9045], 1
        adc     word ptr [W_9047], 0
        if      FW_VERSION >= 311
        sub     dx, dx
        endif
        mov     ax, word ptr [W_D5F3]
        mov     bx, word ptr [W_D5F5]
        mov     cx, word ptr [W_D5F7]
        add     ax, word ptr [W_D64D]
        adc     bx, word ptr [W_D64F]
        adc     cx, 0
        cmp     cx, word ptr [W_D62F]
        jc      br_d6ebc
        ja      br_d6ea3
        cmp     bx, word ptr [W_D62D]
        jc      br_d6ebc
        ja      br_d6ea3
        cmp     ax, word ptr [TBL_D62B]
        jc      br_d6ebc
br_d6ea3:
        if      FW_VERSION >= 311
        mov     dx, 1
        endif
        add     word ptr [W_D5F9], 1
        adc     word ptr [W_D5FB], 0
        sub     ax, word ptr [TBL_D62B]
        sbb     bx, word ptr [W_D62D]
        sbb     cx, word ptr [W_D62F]
br_d6ebc:
        mov     word ptr [W_D5F3], ax
        mov     word ptr [W_D5F5], bx
        mov     word ptr [W_D5F7], cx
        if      FW_VERSION >= 312
        mov     al, byte ptr [B_8436]
        or      al, al
        jnz     br_d6ed6
        mov     byte ptr [B_7152], 0ffh
        jmp     br_d6fb8
br_d6ed6:
        mov     byte ptr [B_715E], al
        cmp     byte ptr [B_7152], 0ffh
        jnz     br_d6ee9
        or      dx, dx
        jz      br_d6f0f
        mov     byte ptr [B_7152], 0
br_d6ee9:
        mov     ax, word ptr [W_D5F5]
        mov     bx, word ptr [W_D5F7]
        mov     cx, 0
loop_d6ef3:
        inc     cx
        sub     ax, word ptr [W_7154]
        sbb     bx, 0
        jnc     loop_d6ef3
        and     cx, 3
        mov     byte ptr [B_7153], cl
br_d6f04:
        mov     al, byte ptr [B_7152]
        and     al, 3
        cmp     al, byte ptr [B_7153]
        jnz     br_d6f12
br_d6f0f:
        jmp     near br_d6fb8
br_d6f12:
        cmp     byte ptr [B_7152], 0
        jnz     br_d6f8c
        push    ds
        mov     ax, 715fh
        push    ax
        push    ds
        mov     ax, W_D5F3
        push    ax
        callf   SEG_EB15:far_eb17e
        add     sp, 8
        mov     al, byte ptr [B_7160]
        mov     ah, al
        and     al, 0fh
        mov     byte ptr [TBL_7156], al
        shr     ah, 4
        or      ah, 10h
        mov     byte ptr [B_7157], ah
        mov     al, byte ptr [B_7161]
        mov     ah, al
        and     al, 0fh
        or      al, 20h
        mov     byte ptr [B_7158], al
        shr     ah, 4
        or      ah, 30h
        mov     byte ptr [B_7159], ah
        mov     al, byte ptr [B_7162]
        mov     ah, al
        and     al, 0fh
        or      al, 40h
        mov     byte ptr [B_715A], al
        shr     ah, 4
        or      ah, 50h
        mov     byte ptr [B_715B], ah
        mov     al, byte ptr [B_7163]
        mov     ah, al
        and     al, 0fh
        or      al, 60h
        mov     byte ptr [B_715C], al
        shr     ah, 4
        mov     bl, byte ptr [B_7FCB]
        sub     bh, bh
        or      ah, byte ptr cs:[bx + TBL_d75f8]
        or      ah, 70h
        mov     byte ptr [B_715D], ah
br_d6f8c:
        mov     cl, 0f1h
        mov     bl, byte ptr [B_715E]
        xor     bh, bh
        callf   SEG_DD18:far_dd212
        mov     bl, byte ptr [B_7152]
        xor     bh, bh
        mov     cl, byte ptr [bx + TBL_7156]
        mov     bl, byte ptr [B_715E]
        callf   SEG_DD18:far_dd212
        inc     byte ptr [B_7152]
        and     byte ptr [B_7152], 7
        jmp     near br_d6f04
br_d6fb8:
        elseif  FW_VERSION = 311
        mov     al, byte ptr [B_8436]
        or      al, al
        jnz     br_d6ed6
        mov     byte ptr [B_7152], 0ffh
        jmp     br_d6fb8
br_d6ed6:
        mov     byte ptr [B_715E], al
        cmp     byte ptr [B_7152], 0ffh
        jnz     br_d6ee9
        or      dx, dx
        jz      br_d6f0f
        mov     byte ptr [B_7152], 0
br_d6ee9:
        mov     ax, word ptr [W_D5F5]
        mov     bx, word ptr [W_D5F7]
        mov     cx, 0
loop_d6ef3:
        inc     cx
        sub     ax, word ptr [W_7154]
        sbb     bx, 0
        jnc     loop_d6ef3
        and     cx, 3
        mov     byte ptr [B_7153], cl
br_d6f04:
        mov     al, byte ptr [B_7152]
        and     al, 3
        cmp     al, byte ptr [B_7153]
        jnz     br_d6f12
br_d6f0f:
        jmp     near br_d6fb8
br_d6f12:
        cmp     byte ptr [B_7152], 0
        jnz     br_d6f8c
        push    ds
        mov     ax, 70b5h
        push    ax
        push    ds
        mov     ax, W_D5F3
        push    ax
        callf   SEG_EB15:far_eb17e
        add     sp, 8
        mov     al, byte ptr [B_7160]
        mov     ah, al
        and     al, 0fh
        mov     byte ptr [TBL_7156], al
        shr     ah, 4
        or      ah, 10h
        mov     byte ptr [B_7157], ah
        mov     al, byte ptr [B_7161]
        mov     ah, al
        and     al, 0fh
        or      al, 20h
        mov     byte ptr [B_7158], al
        shr     ah, 4
        or      ah, 30h
        mov     byte ptr [B_7159], ah
        mov     al, byte ptr [B_7162]
        mov     ah, al
        and     al, 0fh
        or      al, 40h
        mov     byte ptr [B_715A], al
        shr     ah, 4
        or      ah, 50h
        mov     byte ptr [B_715B], ah
        mov     al, byte ptr [B_7163]
        mov     ah, al
        and     al, 0fh
        or      al, 60h
        mov     byte ptr [B_715C], al
        shr     ah, 4
        mov     bl, byte ptr [B_7FCB]
        sub     bh, bh
        or      ah, byte ptr cs:[bx + TBL_d75f8]
        or      ah, 70h
        mov     byte ptr [B_715D], ah
br_d6f8c:
        mov     cl, 0f1h
        mov     bl, byte ptr [B_715E]
        xor     bh, bh
        callf   SEG_DD18:far_dd212
        mov     bl, byte ptr [B_7152]
        xor     bh, bh
        mov     cl, byte ptr [bx + TBL_7156]
        mov     bl, byte ptr [B_715E]
        callf   SEG_DD18:far_dd212
        inc     byte ptr [B_7152]
        and     byte ptr [B_7152], 7
        jmp     near br_d6f04
br_d6fb8:
        endif
        cmp     byte ptr [B_D609], 0
        jnz     br_d6fd6
        mov     bl, byte ptr [B_7FD1]
        sub     bh, bh
        mov     al, byte ptr [bx + TBL_0F7F]
        mov     byte ptr [B_D609], al
        add     word ptr [W_D639], 1
        adc     word ptr [W_D63B], 0
br_d6fd6:
        dec     byte ptr [B_D609]
        sub     word ptr [TBL_882A], 1
        jz      br_d6fe9
        sbb     word ptr [TBL_882C], 0
        jmp     near br_d709b
br_d6fe9:
        cmp     word ptr [TBL_882C], 0
        jz      br_d6ff3
        jmp     near br_d709b
br_d6ff3:
        mov     bx, word ptr [W_8826]
        cmp     byte ptr [B_D612], 0
        jnz     br_d7001
        jmp     short br_d707d
        db      090h
br_d7001:
        cmp     byte ptr [B_D60A], 0
        jz      br_d7019
        cmp     byte ptr [B_7FD1], 2
        jz      br_d7019
        cmp     byte ptr [B_7FD1], 1
        jz      br_d7019
        jmp     br_d707d
        db      090h
br_d7019:
        mov     ax, word ptr [bx + 4]
        or      ax, ax
        jnz     br_d7075
        cmp     byte ptr [B_8800], 0
        jnz     br_d704b
        test    byte ptr [B_901C], 1
        jnz     br_d7031
        jmp     br_d709b
        db      090h
br_d7031:
        mov     ax, word ptr [TBL_882E]
        mov     word ptr [W_D610], ax
        callf   SEG_DCC6:far_dcca0
        push    word ptr [W_903B]
        push    word ptr [W_9039]
        mov     bx, word ptr [W_8822]
        jmp     br_d7085
        db      090h
br_d704b:
        mov     bl, byte ptr [B_8804]
        sub     bh, bh
        test    byte ptr [bx + TBL_A79A], 1
        jnz     br_d705b
        jmp     br_d709b
        db      090h
br_d705b:
        mov     ax, word ptr [W_87EE]
        mov     word ptr [W_D610], ax
        callf   SEG_DCC6:far_dcca0
        push    word ptr [W_87F8]
        push    word ptr [W_87F6]
        mov     bx, word ptr [W_8822]
        jmp     br_d7085
        db      090h
br_d7075:
        mov     word ptr [W_D610], ax
        if      FW_VERSION >= 311
        callf   SEG_DCC6:far_dcca0
        else
        db      09ah, 03ah
        phase   1f0h
        db      000h, 02eh, 0e5h
        endif
br_d707d:
        push    word ptr [bx + 2]
        push    word ptr [bx]
        add     bx, 6
br_d7085:
        mov     word ptr [W_8826], bx
        mov     ax, word ptr [bx]
        mov     dx, word ptr [bx + 2]
        pop     bx
        sub     ax, bx
        pop     bx
        sbb     dx, bx
        mov     word ptr [TBL_882A], ax
        mov     word ptr [TBL_882C], dx
br_d709b:
        mov     ax, word ptr [W_D655]
        mov     dx, 0c031h
        out     dx, al
        mov     al, ah
        out     dx, al
        sti
        if      FW_VERSION >= 311
        cmp     byte ptr [B_8A9E], 0
        jle     br_d70b9
        cmp     byte ptr [B_8A9D], 2
        jl      br_d70be
        mov     byte ptr [B_8A9E], 0ffh
br_d70b9:
        mov     byte ptr [B_8A9D], 0
br_d70be:
        endif
        mov     al, byte ptr [B_A5C3]
        and     al, 3fh
        mov     bl, byte ptr [B_D613]
        cmp     bl, 0
        jnz     br_d70e3
        cmp     al, bl
        jnz     br_d70d3
        jmp     br_d71f3
br_d70d3:
        mov     cx, word ptr [W_903D]
        mov     word ptr [W_A576], cx
        mov     cx, word ptr [W_903F]
        mov     word ptr [W_A578], cx
br_d70e3:
        cmp     byte ptr [B_8800], 0
        jz      br_d7123
        mov     cx, word ptr [W_9045]
        cmp     cx, word ptr [W_87FA]
        jnz     br_d7120
        mov     cx, word ptr [W_9047]
        cmp     cx, word ptr [W_87FC]
        jnz     br_d7120
        push    bx
        mov     bl, byte ptr [B_8804]
        xor     bh, bh
        test    byte ptr [bx + TBL_A79A], 1
        pop     bx
        jnz     br_d7110
        jmp     br_d71eb
br_d7110:
        mov     cx, word ptr [W_87F6]
        mov     word ptr [W_9045], cx
        mov     cx, word ptr [W_87F8]
        mov     word ptr [W_9047], cx
br_d7120:
        jmp     near br_d71e0
br_d7123:
        mov     cx, word ptr [W_9045]
        cmp     cx, word ptr [W_A576]
        jnz     br_d716a
        mov     cx, word ptr [W_9047]
        cmp     cx, word ptr [W_A578]
        jnz     br_d716a
        cmp     byte ptr [B_8A9E], 0
        jle     br_d716d
        mov     cx, word ptr [W_A57A]
        mov     word ptr [W_A576], cx
        mov     cx, word ptr [W_A57C]
        mov     word ptr [W_A578], cx
        mov     word ptr [W_9045], 0
        mov     word ptr [W_9047], 0
        mov     word ptr [W_9041], 0
        mov     word ptr [W_9043], 0
        if      FW_VERSION >= 311
        inc     byte ptr [B_8A9D]
        else
        mov     byte ptr [B_8A9E], 0ffh
        endif
br_d716a:
        jmp     br_d71e0
        db      090h
br_d716d:
        test    byte ptr [B_901C], 1
        jz      br_d71b7
        mov     cx, word ptr [W_9039]
        mov     word ptr [W_9045], cx
        mov     cx, word ptr [W_903B]
        mov     word ptr [W_9047], cx
        cmp     word ptr [W_904D], 1
        jnz     br_d71a1
        cmp     al, 8
        jnz     br_d71e0
        mov     byte ptr [B_A5C2], 10h
        mov     al, 0ah
        mov     byte ptr [B_A5C3], al
        callf   SEG_DD59:far_dd8ff
        jmp     br_d71e0
        db      090h
br_d71a1:
        cmp     al, 8
        jc      br_d71e0
        mov     byte ptr [B_A5C2], 1
        mov     al, 6
        mov     byte ptr [B_A5C3], al
        callf   SEG_DD59:far_dd8ff
        jmp     br_d71e0
        db      090h
br_d71b7:
        cmp     al, 8
        jnz     br_d71eb
        cmp     word ptr [W_904B], 3e7h
        jnc     br_d71eb
        mov     cx, word ptr [W_9059]
        add     word ptr [W_903D], cx
        adc     word ptr [W_903F], 0
        mov     cx, word ptr [W_903D]
        mov     word ptr [W_A576], cx
        mov     cx, word ptr [W_903F]
        mov     word ptr [W_A578], cx
br_d71e0:
        cmp     al, 0
        jz      br_d71f0
        cmp     byte ptr [B_9457], 0
        jz      br_d71f3
br_d71eb:
        callf   SEG_DD59:far_dd6dd
br_d71f0:
        jmp     br_d754b
br_d71f3:
        sub     bh, bh
        jmp     word ptr cs:[bx + TBL_d71fa]
TBL_d71fa:
        dw      tgt_d724c
        dw      tgt_d7206
        dw      tgt_d7231
        dw      tgt_d739d
        dw      tgt_d745e
        dw      tgt_d74d6
tgt_d7206:
        callf   SEG_D7B3:far_d7b38
        or      ax, ax
        jz      br_d7217
        callf   SEG_D78B:far_d7903
        jmp     br_d7221
        db      090h
br_d7217:
        cmp     byte ptr [B_A5C9], 0
        jz      br_d722e
        jmp     br_d7571
br_d7221:
        mov     byte ptr [B_A5C9], 0
        push    ax
        mov     ah, 0
        mov     al, 3
        int     46h
        pop     ax
br_d722e:
        jmp     br_d7267
        db      090h
tgt_d7231:
        cmp     al, 0
        ja      br_d7243
        mov     byte ptr [B_D613], 0
        mov     word ptr [W_881E], 0
        jmp     br_d7571
br_d7243:
        dec     word ptr [W_881E]
        jz      br_d72c4
        jmp     br_d7571
tgt_d724c:
        cmp     al, 0
        jnz     br_d7253
        jmp     br_d7571
br_d7253:
        cmp     byte ptr [B_A5C9], 0
        jz      br_d7267
        callf   SEG_D78B:far_d7903
        mov     byte ptr [B_D613], 2
        jmp     br_d7571
br_d7267:
        cmp     byte ptr [B_9560], 0
        jz      br_d729d
        cmp     byte ptr [B_8270], 2
        jz      br_d729d
        cmp     al, 8
        jz      br_d727d
        cmp     al, 0ah
        jnz     br_d729d
br_d727d:
        mov     bx, word ptr [W_9045]
        cmp     bx, word ptr [W_8271]
        jnz     br_d7291
        mov     bx, word ptr [W_9047]
        cmp     bx, word ptr [W_8273]
        jz      br_d729d
br_d7291:
        mov     byte ptr [B_A5BE], al
        push    ax
        mov     dl, 5
        callf   0fb00h:far_fb38c
        pop     ax
br_d729d:
        cmp     byte ptr [TBL_A5CA], 0
        jz      br_d72c4
        cmp     byte ptr [B_8186], 0
        jz      br_d72af
        cmp     al, 6
        jz      br_d72c4
br_d72af:
        callf   SEG_D974:far_d9748
        mov     byte ptr [B_D613], 4
        mov     bx, word ptr [W_9059]
        mov     word ptr [W_881E], bx
        jmp     br_d7571
br_d72c4:
        cmp     byte ptr [B_A5BE], 0
        jz      br_d72d0
        mov     al, 6
        jmp     br_d7319
        db      090h
br_d72d0:
        mov     bx, word ptr [W_9045]
        cmp     byte ptr [B_8800], 0
        jz      br_d72ee
        cmp     bx, word ptr [W_87FA]
        jnz     br_d7301
        mov     bx, word ptr [W_9047]
        cmp     bx, word ptr [W_87FC]
        jnz     br_d7301
        jmp     br_d71eb
br_d72ee:
        cmp     bx, word ptr [W_A576]
        jnz     br_d7301
        mov     bx, word ptr [W_9047]
        cmp     bx, word ptr [W_A578]
        jnz     br_d7301
        jmp     br_d71eb
br_d7301:
        cmp     al, 8
        jz      br_d7309
        cmp     al, 0ah
        jnz     br_d7319
br_d7309:
        mov     bx, word ptr [W_9045]
        mov     word ptr [W_8279], bx
        mov     bx, word ptr [W_9047]
        mov     word ptr [W_827B], bx
br_d7319:
        mov     byte ptr [B_D613], al
        if      FW_VERSION >= 311
        mov     byte ptr [B_7152], 0ffh
        mov     ax, word ptr [W_D62D]
        mov     bx, word ptr [W_D62F]
        shr     bx, 1
        rcr     ax, 1
        shr     bx, 1
        rcr     ax, 1
        mov     word ptr [W_7154], ax
        endif
        mov     ax, word ptr [W_9041]
        mov     dx, word ptr [W_9043]
        cmp     byte ptr [B_7FD1], 4
        jnz     br_d7359
        mov     bx, 60h
        div     bx
        mov     word ptr [W_D639], ax
        mov     word ptr [W_D63B], dx
        add     word ptr [W_D635], ax
        adc     word ptr [W_D637], 0
        jmp     br_d7376
        db      090h
br_d7359:
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        mov     word ptr [W_D639], ax
        mov     word ptr [W_D63B], dx
        cmp     byte ptr [B_D608], 0
        jz      br_d7376
        mov     word ptr [W_D635], ax
        mov     word ptr [W_D637], dx
br_d7376:
        mov     byte ptr [B_D608], 0
        mov     ax, word ptr [W_9041]
        mov     word ptr [W_D64B], ax
        mov     byte ptr [B_D5ED], 0
        mov     bl, byte ptr [B_7FD1]
        sub     bh, bh
        mov     al, byte ptr [bx + TBL_0F7F]
        dec     al
        mov     byte ptr [B_D609], al
        mov     byte ptr [B_A574], 1
        jmp     br_d7571
tgt_d739d:
        cmp     byte ptr [B_9560], 0
        jz      br_d73fe
        cmp     byte ptr [B_8270], 2
        jz      br_d73fe
        cmp     byte ptr [B_901B], 0
        jnz     br_d73fe
        cmp     byte ptr [B_A5BE], 0
        jz      br_d73fe
        mov     bx, word ptr [W_9045]
        mov     dx, word ptr [W_9047]
        add     bx, 1
        adc     dx, 0
        cmp     bx, word ptr [W_A576]
        jnz     br_d73d7
        cmp     dx, word ptr [W_A578]
        jnz     br_d73d7
        sub     bx, bx
        sub     dx, dx
br_d73d7:
        cmp     bx, word ptr [W_8271]
        jnz     br_d7402
        cmp     dx, word ptr [W_8273]
        jnz     br_d7402
        mov     byte ptr [B_A5BE], 0
        mov     dl, 7
        cmp     al, 8
        jnz     br_d73f0
        mov     dl, 6
br_d73f0:
        mov     byte ptr [B_D613], al
        push    ax
        mov     ah, 1
        mov     al, dl
        int     46h
        pop     ax
        jmp     br_d7448
        db      090h
br_d73fe:
        cmp     al, 6
        jnz     br_d7405
br_d7402:
        jmp     br_d7571
br_d7405:
        cmp     al, 0
        jnz     br_d740c
        jmp     br_d754b
br_d740c:
        cmp     al, 8
        jnz     br_d742a
        cmp     byte ptr [B_9560], 0
        jz      br_d7448
        cmp     byte ptr [B_8270], 2
        jz      br_d7448
        mov     byte ptr [B_A5BE], al
        mov     dl, 5
        callf   0fb00h:far_fb38c
        mov     al, 6
br_d742a:
        cmp     al, 0ah
        jnz     br_d7458
        cmp     byte ptr [B_9560], 0
        jz      br_d7448
        cmp     byte ptr [B_8270], 2
        jz      br_d7448
        mov     byte ptr [B_A5BE], al
        mov     dl, 5
        callf   0fb00h:far_fb38c
        mov     al, 6
br_d7448:
        mov     bx, word ptr [W_9045]
        mov     word ptr [W_8279], bx
        mov     bx, word ptr [W_9047]
        mov     word ptr [W_827B], bx
br_d7458:
        mov     byte ptr [B_D613], al
        jmp     br_d7571
tgt_d745e:
        cmp     byte ptr [B_9560], 0
        jz      br_d74ae
        cmp     byte ptr [B_8270], 1
        jz      br_d74ae
        mov     bx, word ptr [W_9045]
        mov     dx, word ptr [W_9047]
        add     bx, 1
        adc     dx, 0
        cmp     bx, word ptr [W_A576]
        jnz     br_d748a
        cmp     dx, word ptr [W_A578]
        jnz     br_d748a
        sub     bx, bx
        sub     dx, dx
br_d748a:
        cmp     bx, word ptr [W_8275]
        jnz     br_d74ae
        cmp     dx, word ptr [W_8277]
        jnz     br_d74ae
        mov     al, 6
        mov     byte ptr [B_D613], al
        mov     byte ptr [B_A5C3], al
        mov     byte ptr [B_A5C2], 1
        push    ax
        mov     ah, 0
        mov     al, 6
        int     46h
        pop     ax
        jmp     br_d74bc
        db      090h
br_d74ae:
        cmp     al, 8
        jnz     br_d74b5
        jmp     near br_d7571
br_d74b5:
        cmp     al, 0
        jnz     br_d74bc
        jmp     near br_d754b
br_d74bc:
        cmp     al, 6
        jnz     br_d74d0
        mov     bx, word ptr [W_9045]
        mov     word ptr [W_827D], bx
        mov     bx, word ptr [W_9047]
        mov     word ptr [W_827F], bx
br_d74d0:
        mov     byte ptr [B_D613], al
        jmp     near br_d7571
tgt_d74d6:
        cmp     al, 0ah
        jnz     br_d752a
        cmp     byte ptr [B_9560], 0
        jz      br_d7548
        cmp     byte ptr [B_8270], 1
        jz      br_d7548
        mov     bx, word ptr [W_9045]
        mov     dx, word ptr [W_9047]
        add     bx, 1
        adc     dx, 0
        cmp     bx, word ptr [W_A576]
        jnz     br_d7506
        cmp     dx, word ptr [W_A578]
        jnz     br_d7506
        sub     bx, bx
        sub     dx, dx
br_d7506:
        cmp     bx, word ptr [W_8275]
        jnz     br_d7548
        cmp     dx, word ptr [W_8277]
        jnz     br_d7548
        mov     al, 6
        mov     byte ptr [B_D613], al
        mov     byte ptr [B_A5C3], al
        mov     byte ptr [B_A5C2], 1
        push    ax
        mov     ah, 0
        mov     al, 7
        int     46h
        pop     ax
        jmp     br_d7545
        db      090h
br_d752a:
        cmp     al, 0
        jnz     br_d7531
        jmp     br_d754b
        db      090h
br_d7531:
        cmp     al, 6
        jnz     br_d7545
        mov     bx, word ptr [W_9045]
        mov     word ptr [W_827D], bx
        mov     bx, word ptr [W_9047]
        mov     word ptr [W_827F], bx
br_d7545:
        mov     byte ptr [B_D613], al
br_d7548:
        jmp     br_d7571
        db      090h
br_d754b:
        cmp     byte ptr [B_D613], 8
        jl      br_d7562
        mov     bx, word ptr [W_9045]
        mov     word ptr [W_827D], bx
        mov     bx, word ptr [W_9047]
        mov     word ptr [W_827F], bx
br_d7562:
        mov     byte ptr [B_A5C3], 0
        mov     byte ptr [B_D613], 0
        mov     byte ptr [B_A5BE], 0
br_d7571:
        mov     ax, word ptr [W_9045]
        mov     word ptr [W_D617], ax
        if      FW_VERSION < 311
        nop
        endif
        mov     ax, word ptr [W_9047]
        mov     word ptr [W_D619], ax
        if      FW_VERSION < 311
        nop
        endif
        cli
        mov     dl, 2
        callf   0fb00h:far_fb4a2
        mov     bx, B_D613
        xor     cx, cx
        callf   0fb00h:far_fb3a9
        jz      br_d759d
        cmp     byte ptr [B_D613], 0
        jz      br_d759d
        or      byte ptr [B_9457], 1
br_d759d:
        cmp     byte ptr [B_D60B], 0
        jz      br_d75be
        mov     ax, 1a0ah
        cmp     byte ptr [B_D613], 6
        jc      br_d75b8
        test    word ptr [W_D64B], 2
        jnz     br_d75b8
        shr     ax, 1
br_d75b8:
        out     0f4h, al
        mov     al, ah
        out     0f4h, al
br_d75be:
        test    word ptr [W_D64B], 3
        jnz     br_d75e8
        cmp     byte ptr [B_D5ED], 0
        jnz     br_d75e8
        cmp     byte ptr [B_D5EC], 0
        jle     br_d75db
        dec     byte ptr [B_D5EC]
        jmp     br_d75e8
        db      090h
br_d75db:
        mov     cl, 0f8h
        mov     bl, byte ptr [B_7FD0]
        xor     bh, bh
        callf   SEG_DD18:far_dd212
br_d75e8:
        cli
        mov     al, 61h
        mov     dx, 0c010h
        out     dx, al
        mov     al, 0c4h
        out     dx, al
        callf   0fb00h:far_fb18a
        iret
        if      FW_VERSION >= 312
TBL_d75f8:
        db      000h, 002h, 006h, 004h
        phase   0ch
        elseif  FW_VERSION = 311
TBL_d75f8:
        db      000h, 002h, 006h, 004h
        phase   0eh
        else
        phase   2
        endif
isr_d75fc:
        callf   0fb00h:far_fb14d
        sti
        mov     ax, 8010h
        mov     ds, ax
        mov     es, ax
        call    fn_d7625
        cli
        mov     al, 61h
        mov     dx, 0c010h
        out     dx, al
        callf   0fb00h:far_fb18a
        iret
TBL_d7619:
        db      018h, 019h, 01eh, 01eh
TBL_d761d:
        db      009h, 002h, 0f4h, 001h, 0a1h, 001h, 0a1h, 001h
fn_d7625:
        test    byte ptr [B_D5FE], 1
        jnz     br_d766b
        test    byte ptr [B_D5FD], 1
        jnz     br_d7636
        jmp     near br_d76f9
br_d7636:
        mov     byte ptr [B_716F], 0
        mov     dx, 0f6h
        mov     al, 90h
        out     dx, al
        mov     byte ptr [B_716E], 0
        mov     dx, 0c033h
        mov     ax, 74h
        mov     bl, byte ptr [B_7FCB]
        mov     bh, 0
        shl     bx, 1
        mov     ax, word ptr cs:[word bx + TBL_d761d]
        mov     dx, 0c031h
        out     dx, al
        mov     al, ah
        out     dx, al
        inc     byte ptr [B_D5FE]
        inc     byte ptr [B_716F]
        call    fn_d76fa
br_d766b:
        test    byte ptr [B_716F], 1
        jz      br_d76a4
        cmp     byte ptr [B_716F], 3
        jnz     br_d7687
        mov     dx, 0f6h
        mov     al, 90h
        out     dx, al
        mov     byte ptr [B_D5FE], 0
        jmp     br_d76f9
        db      090h
br_d7687:
        xor     byte ptr [B_716E], 1
        jz      br_d7697
        mov     dx, 0f4h
        mov     al, 1
        out     dx, al
        jmp     br_d769d
        db      090h
br_d7697:
        mov     dx, 0f6h
        mov     al, 90h
        out     dx, al
br_d769d:
        inc     byte ptr [B_716F]
        jmp     br_d76f9
        db      090h
br_d76a4:
        mov     si, word ptr [W_7172]
        mov     ax, word ptr [W_7170]
        test    word ptr [si], ax
        jz      br_d76c5
        xor     byte ptr [B_716E], 1
        jz      br_d76bf
        mov     dx, 0f4h
        mov     al, 1
        out     dx, al
        jmp     br_d76c5
        db      090h
br_d76bf:
        mov     dx, 0f6h
        mov     al, 90h
        out     dx, al
br_d76c5:
        shl     word ptr [W_7170], 1
        jnz     br_d76f5
        mov     word ptr [W_7170], 1
        if      FW_VERSION >= 312
        cmp     si, 716ch
        elseif  FW_VERSION = 311
        cmp     si, 70c2h
        else
        cmp     si, 69f8h
        endif
        jnz     br_d76ee
        cmp     byte ptr [B_D5FD], 0
        jnz     br_d76e5
        inc     byte ptr [B_716F]
        jmp     br_d76f9
        db      090h
br_d76e5:
        call    fn_d7747
        call    fn_d76fa
        jmp     br_d76f5
        db      090h
br_d76ee:
        add     si, 2
        mov     word ptr [W_7172], si
br_d76f5:
        dec     byte ptr [B_716F]
br_d76f9:
        ret
fn_d76fa:
        mov     si, TBL_D5FF
        cmp     byte ptr [B_7FCB], 3
        jnz     br_d7719
        cmp     byte ptr [si + 1], 0
        jnz     br_d7719
        cmp     byte ptr [si], 1
        ja      br_d7719
        mov     al, byte ptr [si + 2]
        aam
        jz      br_d7719
        mov     byte ptr [si], 2
br_d7719:
        mov     di, A_7164
        lodsb
        aam
        cmp     byte ptr [B_7FCB], 3
        jnz     br_d7729
        or      ah, 4
br_d7729:
        stosw
        lodsb
        aam
        stosw
        lodsb
        aam
        stosw
        lodsb
        aam
        stosw
        mov     ax, 0bffch
        stosw
        mov     word ptr [W_7172], A_7164
        mov     word ptr [W_7170], 1
        ret
fn_d7747:
        mov     si, TBL_D5FF
        mov     bl, byte ptr [B_7FCB]
        mov     bh, 0
        mov     al, byte ptr cs:[word bx + TBL_d7619]
        inc     byte ptr [si]
        cmp     byte ptr [si], al
        jc      br_d777d
        sub     al, al
        mov     byte ptr [si], al
        inc     si
        inc     byte ptr [si]
        cmp     byte ptr [si], 3ch
        jc      br_d777d
        mov     byte ptr [si], al
        inc     si
        inc     byte ptr [si]
        cmp     byte ptr [si], 3ch
        jc      br_d777d
        mov     byte ptr [si], al
        inc     si
        inc     byte ptr [si]
        cmp     byte ptr [si], 18h
        jc      br_d777d
        mov     byte ptr [si], al
br_d777d:
        ret
far_d777e:
        push    es
        xor     ax, ax
        mov     es, ax
        mov     byte ptr [B_D5FD], al
        mov     byte ptr [B_D5FE], al
        mov     dx, 0c011h
        in      al, dx
        mov     byte ptr [B_7178], al
        or      al, 79h
        out     dx, al
        mov     ax, word ptr es:[24h]
        mov     word ptr [W_7174], ax
        mov     ax, word ptr es:[26h]
        mov     word ptr [W_7176], ax
        pushf
        cli
        if      FW_VERSION >= 312
        mov     ax, 0ch
        elseif  FW_VERSION = 311
        mov     ax, 0eh
        else
        mov     ax, 2
        endif
        mov     word ptr es:[24h], ax
        mov     ax, cs
        mov     word ptr es:[26h], ax
        popf
        pop     es
        retf
far_d77b3:
        push    es
        xor     ax, ax
        mov     es, ax
        pushf
        cli
        mov     ax, word ptr [W_7174]
        mov     word ptr es:[24h], ax
        mov     ax, word ptr [W_7176]
        mov     word ptr es:[26h], ax
        popf
        mov     dx, 0c010h
        sub     al, al
        out     dx, al
        mov     dx, 0c011h
        mov     al, byte ptr [B_7178]
        out     dx, al
        pop     es
        retf
fn_d77d8:
        pushf
        cli
        mov     dx, 50h
        mov     ax, 0
        call    fn_d77fe
        mov     bx, ax
        mov     ax, 0ffffh
        call    fn_d77fe
        mov     ah, bl
        popf
        cmp     ax, 0ffh
        jz      br_d77f9
        mov     ax, 1
        jmp     br_d77fc
        db      090h
br_d77f9:
        mov     ax, 0
br_d77fc:
        ret
        db      090h
fn_d77fe:
        out     dx, ax
        in      ax, dx
        ret
far_d7801:
        call    fn_d77d8
        retf
        if      FW_VERSION >= 312
        phase   5
        elseif  FW_VERSION = 311
        phase   7
        else
        phase   0bh
        endif
far_d7805:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     dx, word ptr [bp + 0ch]
        mov     word ptr [bp - 2], 0
        or      si, si
        jge     br_d7823
        neg     si
        mov     word ptr [bp - 2], 1
br_d7823:
        les     bx, dword ptr [bp + 8]
        add     bx, dx
        mov     byte ptr es:[bx], 0
        mov     cx, dx
        mov     di, word ptr [bp + 8]
        add     di, dx
        jmp     br_d7851
loop_d7835:
        mov     ax, si
        mov     bx, 0ah
        cwd
        idiv    bx
        add     dl, 30h
        mov     es, word ptr [bp + 0ah]
        mov     byte ptr es:[di], dl
        mov     ax, si
        cwd
        idiv    bx
        mov     si, ax
        or      ax, ax
        jz      br_d7855
br_d7851:
        dec     di
        dec     cx
        jge     loop_d7835
br_d7855:
        cmp     byte ptr [bp + 0eh], 20h
        jnz     br_d786f
        cmp     word ptr [bp - 2], 0
        jz      br_d789a
        dec     cx
        jl      br_d789a
        les     bx, dword ptr [bp + 8]
        add     bx, cx
        mov     byte ptr es:[bx], 2dh
        jmp     br_d789a
br_d786f:
        cmp     word ptr [bp - 2], 0
        jz      br_d789a
        mov     si, word ptr [bp + 8]
        add     si, cx
        jmp     br_d7885
loop_d787c:
        mov     es, word ptr [bp + 0ah]
        mov     al, byte ptr [bp + 0eh]
        mov     byte ptr es:[si], al
br_d7885:
        dec     si
        dec     cx
        mov     ax, cx
        cmp     ax, 1
        jge     loop_d787c
        dec     cx
        jl      br_d789a
        les     bx, dword ptr [bp + 8]
        add     bx, cx
        mov     byte ptr es:[bx], 2dh
br_d789a:
        mov     si, word ptr [bp + 8]
        add     si, cx
        jmp     br_d78aa
loop_d78a1:
        mov     es, word ptr [bp + 0ah]
        mov     al, byte ptr [bp + 0eh]
        mov     byte ptr es:[si], al
br_d78aa:
        dec     si
        dec     cx
        jge     loop_d78a1
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   2
        elseif  FW_VERSION = 311
        phase   4
        else
        phase   8
        endif
far_d78b2:
        xor     ax, ax
        pushf
        cli
        mov     word ptr [W_12C8], ax
        mov     word ptr [W_12CA], ax
        mov     word ptr [W_12CC], ax
        mov     byte ptr [B_D4BE], 0
        popf
        retf
far_d78c6:
        push    es
        mov     ax, SEG_A8EC
        mov     es, ax
        xor     ax, ax
        pushf
        cli
        mov     word ptr es:[1330h], ax
        mov     word ptr es:[1332h], ax
        mov     word ptr es:[1334h], ax
        mov     word ptr es:[1932h], ax
        mov     word ptr es:[1934h], ax
        mov     word ptr es:[1936h], ax
        mov     word ptr es:[1f34h], ax
        mov     word ptr es:[1f36h], ax
        mov     word ptr es:[1f38h], ax
        mov     word ptr es:[2536h], ax
        mov     word ptr es:[2538h], ax
        mov     word ptr es:[253ah], ax
        popf
        pop     es
        retf
far_d7903:
        push    es
        mov     ax, SEG_A8EC
        mov     es, ax
        xor     ax, ax
        pushf
        cli
        mov     word ptr es:[6aeh], ax
        mov     word ptr es:[6b0h], ax
        mov     word ptr es:[6b2h], ax
        mov     word ptr es:[736h], ax
        mov     word ptr es:[738h], ax
        mov     word ptr es:[73ah], ax
        mov     word ptr es:[0d33h], ax
        mov     word ptr es:[0d35h], ax
        mov     word ptr es:[0d37h], ax
        mov     word ptr [TBL_9784], ax
        popf
        pop     es
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   0eh
        endif
far_d7938:
        push    bp
        mov     bp, sp
        push    es
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        and     al, 0f8h
        cmp     al, 90h
        jnz     br_d796a
        if      FW_VERSION >= 311
        mov     al, byte ptr es:[bx + 2]
        cmp     byte ptr [B_717A], 0
        jz      br_d795d
        push    es
        push    bx
        callf   SEG_CB8A:far_cc641
        add     sp, 4
br_d795d:
        mov     byte ptr [B_D4C0], al
        else
        mov     cl, byte ptr es:[bx + 2]
        mov     byte ptr [B_D4C0], cl
        endif
        mov     bx, A_12C6
        mov     cl, 44h
        callf   SEG_DAC6:far_dac6a
br_d796a:
        pop     es
        pop     bp
        retf
        if      FW_VERSION >= 312
far_d796d:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [B_717A], al
        pop     bp
        retf
        phase   8
        elseif  FW_VERSION = 311
far_d796d:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [B_717A], al
        pop     bp
        retf
        phase   0ah
        else
        db      0ffh
        phase   4
        endif
far_d7978:
        pushf
        cli
        or      byte ptr [TBL_943B], 4
        mov     al, byte ptr [TBL_943B]
        mov     dx, 0c6h
        out     dx, al
        or      byte ptr [B_943C], 4
        mov     al, byte ptr [B_943C]
        mov     dx, 0ceh
        out     dx, al
        popf
        retf
fn_d7994:
        pushf
        cli
        and     byte ptr [TBL_943B], 0fbh
        mov     al, byte ptr [TBL_943B]
        mov     dx, 0c6h
        out     dx, al
        and     byte ptr [B_943C], 0fbh
        mov     al, byte ptr [B_943C]
        mov     dx, 0ceh
        out     dx, al
        popf
        retf
far_d79b0:
        push    bp
        mov     bp, sp
        cmp     byte ptr [bp + 6], 1
        jnz     br_d79bf
        mov     dx, 0c4h
        jmp     br_d79e0
        db      090h
br_d79bf:
        cmp     byte ptr [bp + 6], 2
        jnz     br_d79cb
        mov     dx, 0cch
        jmp     br_d79e0
        db      090h
br_d79cb:
        cmp     byte ptr [bp + 6], 3
        jnz     br_d79d7
        mov     dx, 0d4h
        jmp     br_d79e0
        db      090h
br_d79d7:
        cmp     byte ptr [bp + 6], 4
        jnz     br_d79eb
        mov     dx, 0dch
br_d79e0:
        mov     al, 0
        cmp     byte ptr [bp + 8], 2
        jnz     br_d79ea
        mov     al, 0
br_d79ea:
        out     dx, al
br_d79eb:
        pop     bp
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   0eh
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   0ah
        endif
far_d79ee:
        push    es
        mov     ax, ds
        mov     es, ax
        mov     bx, A_12C6
loop_d79f6:
        test    word ptr es:[bx + 2], 0ffffh
        jz      loop_d79f6
        callf   0fb00h:far_fb71b
        js      loop_d79f6
        mov     al, cl
        pop     es
        retf
far_d7a09:
        push    bp
        mov     bp, sp
        push    es
        mov     ax, ds
        mov     es, ax
        mov     bx, A_12C6
        mov     dx, 1
loop_d7a17:
        test    word ptr es:[bx + 2], 0ffffh
        jnz     br_d7a2f
        mov     cl, byte ptr [B_D4BE]
        or      cl, cl
        jz      loop_d7a17
        mov     byte ptr [B_D4BE], 0
        jmp     br_d7a56
        db      090h
br_d7a2f:
        callf   0fb00h:far_fb71b
        js      loop_d7a17
        jnz     br_d7a56
        mov     ch, cl
loop_d7a3a:
        pushf
        cli
        callf   0fb00h:far_fb71b
        cmp     cl, ch
        jnz     br_d7a4e
        popf
        inc     dx
        or      ax, ax
        jz      loop_d7a3a
        jmp     br_d7a56
        db      090h
br_d7a4e:
        callf   0fb00h:far_fb6af
        popf
        mov     cl, ch
br_d7a56:
        mov     al, cl
        xor     ah, ah
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx], dx
        pop     es
        pop     bp
        retf
far_d7a63:
        push    bp
        mov     bp, sp
        push    es
        mov     ax, ds
        mov     es, ax
        mov     bx, A_12C6
        mov     cl, byte ptr [bp + 6]
        callf   0fb00h:far_fb672
        pop     es
        pop     bp
        retf
far_d7a79:
        push    es
        mov     ax, ds
        mov     es, ax
        mov     bx, A_12C6
loop_d7a81:
        callf   0fb00h:far_fb71b
        js      br_d7aa1
        cmp     cl, 78h
        jz      loop_d7a81
        cmp     cl, 79h
        jz      loop_d7a81
        cmp     cl, 7ah
        jz      loop_d7a81
        cmp     cl, 75h
        jz      loop_d7a81
        callf   0fb00h:far_fb6af
br_d7aa1:
        pop     es
        retf
far_d7aa3:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        push    es
        mov     ax, ds
        mov     es, ax
        mov     bx, 12d6h
        mov     ax, 0ffffh
        test    word ptr es:[bx + 2], 0ffffh
        jz      br_d7ac6
        callf   0fb00h:far_fb71b
        js      br_d7ac6
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], cl
br_d7ac6:
        pop     es
        pop     bp
        retf
far_d7ac9:
        push    bp
        mov     bp, sp
        push    es
        mov     ax, ds
        mov     es, ax
        mov     bx, 12d6h
        mov     cl, byte ptr [bp + 6]
        callf   0fb00h:far_fb6af
        pop     es
        pop     bp
        retf
far_d7adf:
        push    bp
        mov     bp, sp
        push    es
        mov     ax, ds
        mov     es, ax
        mov     bx, 12d6h
        mov     cl, byte ptr [bp + 6]
        callf   0fb00h:far_fb672
        pop     es
        pop     bp
        retf
fn_d7af5:
        push    bp
        mov     bp, sp
        endif
        jmp     br_d7b0d
loop_d7afa:
        les     bx, dword ptr [bp + 6]
        inc     word ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        cbw
        push    ax
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
br_d7b0d:
        callf   SEG_D79E:far_d79ee
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], al
        cmp     al, 0dh
        jnz     loop_d7afa
        mov     byte ptr es:[bx], 0
        push    0ah
        callf   SEG_B1AA:far_b1ae0
        add     sp, 2
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   0ch
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   6
        endif
far_d7b2c:
        push    es
        mov     ax, 8010h
        mov     es, ax
        if      FW_VERSION >= 311
        mov     ax, word ptr es:[12c8h]
        else
        mov     ax, word ptr es:[12a6h]
        endif
        pop     es
        retf
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   2
        endif
far_d7b38:
        push    es
        mov     ax, SEG_A8EC
        mov     es, ax
        mov     ax, word ptr es:[6aeh]
        add     ax, word ptr es:[736h]
        add     ax, word ptr es:[0d33h]
        pop     es
        retf
        if      FW_VERSION = 311
        phase   1d10h
        elseif  FW_VERSION < 311
        phase   1b28h
        endif
fn_d7b4e:
        push    es
        mov     ax, SEG_A8EC
        mov     es, ax
        mov     ax, word ptr es:[1330h]
        add     ax, word ptr es:[1932h]
        add     ax, word ptr es:[1f34h]
        add     ax, word ptr es:[2536h]
        pop     es
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   0ah
        elseif  FW_VERSION = 311
        phase   0ch
        else
        phase   4
        endif
far_d7b6a:
        push    bp
        mov     bp, sp
        push    es
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        and     al, 0f8h
        cmp     al, 90h
        jnz     br_d7b8c
        mov     cl, byte ptr es:[bx + 2]
        mov     byte ptr [B_D4C1], cl
        mov     bx, A_12C6
        mov     cl, 4eh
        callf   SEG_DAC6:far_dac6a
br_d7b8c:
        pop     es
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   0fh
        elseif  FW_VERSION = 311
        phase   1
        else
        phase   9
        endif
far_d7b8f:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        mov     ah, byte ptr [bp + 8]
        endif
        mov     al, byte ptr [bp + 6]
        if      FW_VERSION >= 311
        int     46h
        else
        push    ax
        mov     al, byte ptr [bp + 8]
        push    ax
        callf   0b89eh:L_b89eb
        add     sp, 4
        endif
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   0ch
        elseif  FW_VERSION < 311
        phase   0eh
        endif
far_d7b9c:
        push    bp
        mov     bp, sp
        sub     sp, 2
        callf   SEG_DEAB:far_deabe
        callf   SEG_DEAB:far_deb3f
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_d7bf4
        add     sp, 4
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jge     br_d7bcb
        callf   SEG_DEAB:far_deabe
        callf   SEG_DEAB:far_deb3f
br_d7bcb:
        if      FW_VERSION < 311
        push    0
        push    0ffffh
        callf   0d266h:L_d2667
        add     sp, 4
        push    0
        callf   0d266h:L_d280a
        add     sp, 2
        endif
        mov     byte ptr [B_D4C2], 4dh
        callf   SEG_E344:far_e39b5
        push    1
        push    1
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        mov     byte ptr [B_8805], 0
        callf   SEG_DEEA:far_deeab
        mov     ax, word ptr [bp - 2]
        leave
        retf
fn_d7bf4:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 68h
        else
        sub     sp, 28h
        endif
        push    si
        push    di
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jge     br_d7c1f
        pop     di
        pop     si
        leave
        retf
br_d7c1f:
        push    6
        push    word ptr [bp - 2]
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_d7c3b
        pop     di
        pop     si
        leave
        retf
br_d7c3b:
        mov     ax, word ptr [bp - 24h]
        mov     dx, word ptr [bp - 26h]
        mov     word ptr [bp - 0ch], ax
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 6], 0
        xor     si, si
        push    word ptr [W_8C3B]
        push    word ptr [W_8C39]
        push    word ptr [W_8C3F]
        push    word ptr [W_8C3D]
        callf   SEG_DA9B:far_daa07
        add     sp, 8
        cmp     dx, word ptr [bp - 0ch]
        jg      br_d7c75
        jnz     br_d7c72
        cmp     ax, word ptr [bp - 0eh]
        ja      br_d7c75
br_d7c72:
        mov     si, 1
br_d7c75:
        if      FW_VERSION < 311
        push    0
        push    0ffffh
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        mov     al, byte ptr [bp - 27h]
        mov     ah, 0
        mov     word ptr [bp - 4], ax
        cmp     ax, 2
        jle     br_d7c89
        or      si, si
        jnz     br_d7c89
        jmp     near br_d7d33
br_d7c89:
        push    word ptr [W_8C3B]
        push    word ptr [W_8C39]
        callf   SEG_DA9B:far_daa59
        add     sp, 4
        mov     word ptr [W_8C37], dx
        mov     word ptr [W_8C35], ax
br_d7ca0:
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 68h]
        push    ax
        push    ss
        endif
        lea     ax, [bp - 6]
        push    ax
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    0
        mov     al, byte ptr [bp - 27h]
        mov     ah, 0
        push    ax
        push    word ptr [bp - 2]
        callf   SEG_D838:far_d85fa
        if      FW_VERSION >= 311
        add     sp, 12h
        else
        add     sp, 0eh
        endif
        mov     si, ax
        cmp     si, 0ffeah
        jz      br_d7cce
        cmp     si, 0fffdh
        jnz     br_d7ce7
br_d7cce:
        push    word ptr [W_8C37]
        push    word ptr [W_8C35]
        callf   SEG_DA9B:far_daa3c
        add     sp, 4
        mov     word ptr [W_8C33], dx
        mov     word ptr [W_8C31], ax
        jmp     br_d7d27
br_d7ce7:
        or      si, si
        jz      br_d7cf1
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_d7cf1:
        if      FW_VERSION >= 311
        cmp     word ptr [bp - 4], 2
        jg      br_d7d07
        push    ss
        lea     ax, [bp - 68h]
        push    ax
        push    word ptr [bp - 6]
        callf   SEG_E546:far_e546f
        add     sp, 6
br_d7d07:
        endif
        push    word ptr [bp - 8]
        push    word ptr [bp - 0ah]
        push    word ptr [W_8C37]
        push    word ptr [W_8C35]
        callf   SEG_DA9B:far_da9b8
        add     sp, 8
        mov     word ptr [W_8C37], dx
        mov     word ptr [W_8C35], ax
        if      FW_VERSION >= 311
        jmp     near br_d7ca0
        else
        jmp     br_d7ca0
        endif
br_d7d27:
        cmp     si, 0fffdh
        jz      br_d7d94
        mov     word ptr [bp - 6], 0
        jmp     br_d7d94
br_d7d33:
        cmp     word ptr [bp - 4], 3
        jnz     br_d7d8d
        mov     ax, word ptr [bp - 0ch]
        mov     dx, word ptr [bp - 0eh]
        add     dx, 0ffffh
        adc     ax, 0ffffh
        push    ax
        push    dx
        push    word ptr [W_8C3B]
        push    word ptr [W_8C39]
        callf   SEG_DA9B:far_da9e4
        add     sp, 8
        mov     word ptr [W_8C33], dx
        mov     word ptr [W_8C31], ax
        push    word ptr [bp - 0ch]
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 2]
        push    word ptr [W_8C3B]
        push    word ptr [W_8C39]
        callf   SEG_DA9B:far_daa59
        add     sp, 4
        push    dx
        push    ax
        push    4
        callf   SEG_CADB:far_cadb4
        add     sp, 0ch
        mov     si, ax
        or      ax, ax
        jz      br_d7d94
        pop     di
        pop     si
        leave
        retf
br_d7d8d:
        mov     ax, 0ffe0h
        pop     di
        pop     si
        leave
        retf
br_d7d94:
        les     bx, dword ptr [W_8C31]
        mov     byte ptr es:[bx], 0ffh
        mov     ax, word ptr [bp - 0ch]
        mov     dx, word ptr [bp - 0eh]
        add     dx, 6
        adc     ax, 0
        push    ax
        push    dx
        push    word ptr [bp - 2]
        callf   SEG_CAA9:far_cace7
        add     sp, 6
br_d7db5:
        push    ss
        pop     es
        lea     di, [bp - 28h]
        xor     ax, ax
        mov     ah, al
        mov     cx, 0ah
        rep stosw
        push    1
        push    word ptr [bp - 2]
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_d7ddf
        pop     di
        pop     si
        leave
        retf
br_d7ddf:
        cmp     byte ptr [bp - 28h], 0
        jnz     br_d7de8
        jmp     br_d7f55
br_d7de8:
        mov     al, byte ptr [bp - 28h]
        mov     byte ptr [bp - 11h], al
        cmp     byte ptr [bp - 28h], 0fah
        jc      br_d7df8
        mov     byte ptr [bp - 11h], 0fah
br_d7df8:
        push    3
        push    word ptr [bp - 2]
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_d7e14
        pop     di
        pop     si
        leave
        retf
br_d7e14:
        mov     al, byte ptr [bp - 28h]
        add     al, 0ffh
        mov     byte ptr [bp - 0fh], al
        cmp     byte ptr [bp - 0fh], 14h
        jc      br_d7e26
        mov     byte ptr [bp - 0fh], 13h
br_d7e26:
        mov     al, byte ptr [bp - 0fh]
        mov     ah, 0
        mov     si, ax
        mov     dl, byte ptr [bp - 27h]
        mov     bx, ax
        mov     byte ptr [bx + TBL_A79B], dl
        mov     al, byte ptr [bp - 26h]
        mov     byte ptr [si + TBL_A787], al
        cmp     word ptr [bp - 4], 2
        jge     br_d7e46
        jmp     near br_d7ed5
br_d7e46:
        push    10h
        push    word ptr [bp - 2]
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_d7e62
        pop     di
        pop     si
        leave
        retf
br_d7e62:
        xor     di, di
        mov     al, byte ptr [bp - 0fh]
        mov     ah, 0
        mov     si, ax
        mov     dx, 11h
        imul    dx
        mov     word ptr [bp - 14h], ax
        mov     ax, si
        mov     dx, 5
        imul    dx
loop_d7e7a:
        mov     bx, word ptr [bp - 14h]
        add     bx, di
        mov     al, byte ptr [bp+di - 28h]
        mov     byte ptr [bx + TBL_A633], al
        inc     di
        cmp     di, 10h
        jl      loop_d7e7a
        push    5
        push    word ptr [bp - 2]
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_d7ea8
        pop     di
        pop     si
        leave
        retf
br_d7ea8:
        xor     di, di
        mov     al, byte ptr [bp - 0fh]
        mov     ah, 0
        mov     si, ax
        mov     dx, 5
        imul    dx
        mov     cx, ax
        mov     ax, si
        mov     dx, 11h
        imul    dx
        mov     word ptr [bp - 14h], ax
loop_d7ec2:
        mov     bx, cx
        add     bx, di
        mov     al, byte ptr [bp+di - 28h]
        mov     byte ptr [bx + TBL_A5CF], al
        inc     di
        cmp     di, 5
        jl      loop_d7ec2
        jmp     br_d7ef9
br_d7ed5:
        xor     di, di
        mov     ax, si
        mov     dx, 5
        imul    dx
        mov     cx, ax
        mov     ax, si
        mov     dx, 11h
        imul    dx
        mov     word ptr [bp - 14h], ax
loop_d7eea:
        mov     bx, cx
        add     bx, di
        mov     byte ptr [bx + TBL_A5CF], 0
        inc     di
        cmp     di, 5
        jl      loop_d7eea
br_d7ef9:
        mov     byte ptr [bp - 10h], 0
        jmp     br_d7f48
loop_d7eff:
        push    2
        push    word ptr [bp - 2]
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_d7f1b
        pop     di
        pop     si
        leave
        retf
br_d7f1b:
        mov     al, byte ptr [bp - 0fh]
        mov     ah, 0
        mov     dx, 1f4h
        imul    dx
        mov     dl, byte ptr [bp - 10h]
        mov     dh, 0
        shl     dx, 1
        add     ax, dx
        mov     si, ax
        mov     dl, byte ptr [bp - 28h]
        mov     bx, ax
        mov     byte ptr [bx + TBL_A7AF], dl
        mov     al, byte ptr [bp - 27h]
        mov     byte ptr [si + TBL_A7B0], al
        mov     al, byte ptr [bp - 10h]
        inc     al
        mov     byte ptr [bp - 10h], al
br_d7f48:
        mov     al, byte ptr [bp - 11h]
        dec     byte ptr [bp - 11h]
        or      al, al
        jnz     loop_d7eff
        jmp     br_d7db5
br_d7f55:
        cmp     word ptr [bp - 4], 1
        jg      br_d7f60
        callf   SEG_E65B:far_e66a4
br_d7f60:
        if      FW_VERSION < 311
        cmp     word ptr [bp - 4], 2
        jg      L_e0e72
        mov     di, 1
        jmp     L_e0e6d
L_e0e63:
        push    di
        callf   SEG_E546:far_e546f
        add     sp, 2
        inc     di
L_e0e6d:
        cmp     di, 63h
        jle     L_e0e63
L_e0e72:
        endif
        mov     ax, word ptr [bp - 6]
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   7
        else
        phase   9
        endif
far_d7f67:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     dx, ax
        or      ax, ax
        jge     br_d7f8d
        leave
        retf
br_d7f8d:
        push    dx
        nop
        push    cs
        call    fn_d7fd0
        add     sp, 2
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      br_d7fb7
        push    word 6c2h
        push    ds
        push    word A_7D87
        callf   SEG_DA72:far_da72a
        add     sp, 6
        or      ax, ax
        jz      br_d7fc6
        callf   SEG_B20F:far_b20fd
        jmp     br_d7fc6
br_d7fb7:
        push    word 6c2h
        push    ds
        push    word A_7D87
        callf   SEG_DA72:far_da76f
        add     sp, 6
br_d7fc6:
        callf   SEG_BA17:far_ba2a4
        mov     ax, word ptr [bp - 2]
        leave
        retf
fn_d7fd0:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        mov     si, word ptr [bp + 6]
        push    2
        push    si
        push    ss
        lea     ax, [bp - 4]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jz      br_d7ff3
        pop     si
        leave
        retf
br_d7ff3:
        cmp     byte ptr [bp - 4], 8
        jz      br_d7fff
        mov     ax, 0fff7h
        pop     si
        leave
        retf
br_d7fff:
        cmp     byte ptr [bp - 3], 0
        jnz     br_d8011
        push    si
        nop
        push    cs
        call    fn_d8063
        add     sp, 2
        pop     si
        leave
        retf
br_d8011:
        cmp     byte ptr [bp - 3], 1
        jz      br_d801d
        mov     ax, 0ffe0h
        pop     si
        leave
        retf
br_d801d:
        push    2
        push    si
        push    ss
        lea     ax, [bp - 2]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jz      br_d8036
        pop     si
        leave
        retf
br_d8036:
        cmp     word ptr [bp - 2], 6c2h
        jz      br_d804e
        mov     ax, word ptr [bp - 2]
        add     ax, 15h
        cmp     ax, 6c2h
        jz      br_d804e
        mov     ax, 0fff7h
        pop     si
        leave
        retf
br_d804e:
        push    word ptr [bp - 2]
        push    si
        push    ds
        push    word A_7D87
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        pop     si
        leave
        retf
fn_d8063:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        push    2
        push    si
        push    ss
        lea     ax, [bp - 6]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jz      br_d8088
        pop     di
        pop     si
        leave
        retf
br_d8088:
        cmp     word ptr [bp - 6], 742h
        jle     br_d8094
        mov     word ptr [bp - 6], 742h
br_d8094:
        mov     ax, SEG_A28F
        mov     di, 0
        push    ax
        xor     ax, ax
        pop     es
        mov     ah, al
        mov     cx, 2400h
        rep stosw
        push    word ptr [bp - 6]
        push    si
        push    word SEG_A28F
        push    word 0
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jz      br_d80c1
        pop     di
        pop     si
        leave
        retf
br_d80c1:
        mov     word ptr [bp - 2], SEG_A28F
        mov     word ptr [bp - 4], 0
        les     bx, dword ptr [bp - 4]
        mov     ax, word ptr es:[bx]
        mov     word ptr [W_7FC8], ax
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [B_7FCA], al
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [B_7FCB], al
        mov     al, byte ptr es:[bx + 4]
        mov     byte ptr [B_7FCC], al
        mov     al, byte ptr es:[bx + 5]
        mov     byte ptr [B_7FCD], al
        mov     ax, SEG_A28F
        mov     si, 0
        add     si, 6
        push    ds
        pop     es
        mov     di, TBL_7FD5
        mov     cx, 6
        push    ds
        mov     ds, ax
        rep movsw
        pop     ds
        mov     es, word ptr [bp - 2]
        mov     al, byte ptr es:[bx + 13h]
        mov     byte ptr [B_7FE1], al
        mov     al, byte ptr es:[bx + 14h]
        mov     byte ptr [B_7FE2], al
        mov     al, byte ptr es:[bx + 15h]
        mov     byte ptr [B_7FE3], al
        mov     ax, word ptr [bp - 2]
        mov     si, word ptr [bp - 4]
        add     si, 17h
        push    ds
        pop     es
        mov     di, A_7D87
        mov     cx, 120h
        push    ds
        mov     ds, ax
        rep movsw
        pop     ds
        mov     es, word ptr [bp - 2]
        mov     al, byte ptr es:[bx + 25ah]
        mov     byte ptr [B_7FCE], al
        mov     al, byte ptr es:[bx + 25bh]
        mov     byte ptr [B_7FCF], al
        mov     al, byte ptr es:[bx + 25ch]
        mov     byte ptr [B_7FD0], al
        mov     al, byte ptr es:[bx + 25eh]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_717C]
        mov     byte ptr [B_7FD1], al
        mov     bx, word ptr [bp - 4]
        mov     al, byte ptr es:[bx + 25fh]
        mov     byte ptr [B_7FD2], al
        mov     al, byte ptr es:[bx + 260h]
        mov     byte ptr [B_7FE4], al
        mov     al, byte ptr es:[bx + 261h]
        mov     byte ptr [B_7FE5], al
        mov     al, byte ptr es:[bx + 262h]
        mov     byte ptr [B_7FE6], al
        mov     al, byte ptr es:[bx + 263h]
        mov     byte ptr [B_7FE9], al
        mov     al, byte ptr es:[bx + 264h]
        mov     byte ptr [B_7FEA], al
        mov     ax, word ptr [bp - 2]
        mov     si, word ptr [bp - 4]
        add     si, 266h
        push    ds
        pop     es
        mov     di, TBL_7FEB
        mov     cx, 44h
        push    ds
        mov     ds, ax
        rep movsw
        movsb
        pop     ds
        mov     ax, word ptr [bp - 2]
        mov     si, word ptr [bp - 4]
        add     si, 2efh
        push    ds
        pop     es
        if      FW_VERSION >= 312
        mov     di, 8075h
        elseif  FW_VERSION = 311
        mov     di, 7fbdh
        else
        mov     di, 744bh
        endif
        mov     cx, 44h
        push    ds
        mov     ds, ax
        rep movsw
        movsb
        pop     ds
        mov     ax, word ptr [bp - 2]
        mov     si, word ptr [bp - 4]
        add     si, 378h
        push    ds
        pop     es
        mov     di, A_80FF
        mov     cx, 40h
        push    ds
        mov     ds, ax
        rep movsw
        pop     ds
        mov     es, word ptr [bp - 2]
        mov     al, byte ptr es:[bx + 3f8h]
        mov     byte ptr [B_817F], al
        mov     al, byte ptr es:[bx + 3f9h]
        mov     byte ptr [B_8180], al
        mov     al, byte ptr es:[bx + 3fah]
        mov     byte ptr [B_8183], al
        mov     al, byte ptr es:[bx + 3fdh]
        mov     byte ptr [B_8185], al
        mov     ax, word ptr [bp - 2]
        mov     si, word ptr [bp - 4]
        add     si, 4a2h
        push    ds
        pop     es
        if      FW_VERSION >= 312
        mov     di, 81cah
        elseif  FW_VERSION = 311
        mov     di, 8112h
        else
        mov     di, 75a0h
        endif
        mov     cx, 50h
        push    ds
        mov     ds, ax
        rep movsw
        pop     ds
        mov     es, word ptr [bp - 2]
        mov     al, byte ptr es:[bx + 542h]
        mov     byte ptr [B_826A], al
        mov     al, byte ptr es:[bx + 543h]
        mov     byte ptr [B_826B], al
        mov     al, byte ptr es:[bx + 544h]
        mov     byte ptr [B_826C], al
        mov     al, byte ptr es:[bx + 545h]
        mov     byte ptr [B_826D], al
        mov     al, byte ptr es:[bx + 546h]
        mov     byte ptr [B_826E], al
        mov     ax, word ptr es:[bx + 54ah]
        mov     dx, word ptr es:[bx + 548h]
        mov     word ptr [W_8273], ax
        mov     word ptr [W_8271], dx
        mov     ax, word ptr es:[bx + 54eh]
        mov     dx, word ptr es:[bx + 54ch]
        mov     word ptr [W_8277], ax
        mov     word ptr [W_8275], dx
        mov     ax, word ptr es:[bx + 552h]
        mov     dx, word ptr es:[bx + 550h]
        mov     word ptr [W_827B], ax
        mov     word ptr [W_8279], dx
        mov     ax, word ptr es:[bx + 556h]
        mov     dx, word ptr es:[bx + 554h]
        mov     word ptr [W_827F], ax
        mov     word ptr [W_827D], dx
        mov     al, byte ptr es:[bx + 558h]
        mov     byte ptr [B_83B6], al
        mov     al, byte ptr es:[bx + 559h]
        mov     byte ptr [B_83B7], al
        mov     al, byte ptr es:[bx + 5fdh]
        mov     byte ptr [B_83B8], al
        mov     al, byte ptr es:[bx + 5ffh]
        mov     byte ptr [B_83BB], al
        mov     al, byte ptr es:[bx + 5feh]
        mov     byte ptr [B_83BC], al
        mov     ax, word ptr es:[bx + 602h]
        mov     word ptr [W_83BE], ax
        mov     ax, word ptr es:[bx + 600h]
        mov     word ptr [W_83C0], ax
        mov     al, byte ptr es:[bx + 604h]
        mov     byte ptr [B_83BD], al
        mov     al, byte ptr es:[bx + 688h]
        mov     byte ptr [B_83C2], al
        mov     al, byte ptr es:[bx + 689h]
        mov     byte ptr [B_83C3], al
        mov     al, byte ptr es:[bx + 68ah]
        mov     byte ptr [B_83C4], al
        mov     al, byte ptr es:[bx + 68bh]
        mov     byte ptr [B_83C5], al
        mov     al, byte ptr es:[bx + 68ch]
        mov     byte ptr [B_83C6], al
        mov     al, byte ptr es:[bx + 68dh]
        mov     byte ptr [B_83C7], al
        mov     al, byte ptr es:[bx + 68eh]
        mov     byte ptr [B_83C8], al
        mov     al, byte ptr es:[bx + 698h]
        mov     byte ptr [B_83C9], al
        mov     al, byte ptr es:[bx + 699h]
        mov     byte ptr [B_7FC7], al
        mov     ax, word ptr es:[bx + 69ah]
        mov     word ptr [W_8281], ax
        mov     ax, word ptr es:[bx + 69ch]
        mov     word ptr [W_8283], ax
        mov     ax, word ptr es:[bx + 69eh]
        mov     word ptr [W_8285], ax
        mov     ax, word ptr [bp - 2]
        mov     si, word ptr [bp - 4]
        add     si, 6a0h
        push    ds
        pop     es
        mov     di, TBL_82EE
        mov     cx, 32h
        push    ds
        mov     ds, ax
        rep movsw
        pop     ds
        mov     es, word ptr [bp - 2]
        mov     al, byte ptr es:[bx + 704h]
        mov     byte ptr [B_8287], al
        mov     al, byte ptr es:[bx + 705h]
        mov     byte ptr [B_8288], al
        mov     al, byte ptr es:[bx + 706h]
        mov     byte ptr [B_8289], al
        mov     al, byte ptr es:[bx + 707h]
        mov     byte ptr [B_83CA], al
        mov     al, byte ptr es:[bx + 708h]
        mov     byte ptr [B_83CB], al
        mov     al, byte ptr es:[bx + 709h]
        mov     byte ptr [B_83CC], al
        mov     ax, word ptr es:[bx + 70ah]
        mov     word ptr [W_83CD], ax
        mov     al, byte ptr es:[bx + 73eh]
        mov     byte ptr [B_83CF], al
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   8
        else
        phase   0ah
        endif
far_d8388:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        mov     di, word ptr [bp + 0ah]
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        mov     byte ptr [B_F2AC], 0
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jge     br_d83ba
        pop     di
        pop     si
        leave
        retf
br_d83ba:
        mov     word ptr [W_F2A9], si
        push    2
        push    si
        push    ss
        lea     ax, [bp - 2]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jz      br_d83d8
        pop     di
        pop     si
        leave
        retf
br_d83d8:
        mov     al, byte ptr [bp - 2]
        cbw
        cmp     ax, di
        jz      br_d83ff
        cmp     di, 4
        jnz     br_d83eb
        cmp     byte ptr [bp - 2], 3
        jz      br_d83fb
br_d83eb:
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        mov     ax, 0ffe0h
        pop     di
        pop     si
        leave
        retf
br_d83fb:
        mov     byte ptr [bp - 2], 4
br_d83ff:
        mov     al, byte ptr [bp - 1]
        mov     byte ptr [B_F2AB], al
        cbw
        les     bx, dword ptr [bp + 0ch]
        mov     word ptr es:[bx], ax
        cmp     byte ptr [bp - 2], 3
        jnz     br_d8425
        cmp     byte ptr [B_F2AB], 3
        jl      br_d8425
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_F2AC], al
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_d8425:
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        mov     dx, ax
        or      ax, ax
        jz      br_d8438
        pop     di
        pop     si
        leave
        retf
br_d8438:
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_F2AC], al
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
far_d8444:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 46h
        else
        sub     sp, 6
        endif
        push    si
        push    di
        mov     di, word ptr [bp + 0ah]
        mov     word ptr [bp - 6], 0
        push    ds
        push    word TBL_F294
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        xor     si, si
loop_d8468:
        cmp     byte ptr [si + TBL_F294], 2eh
        jz      br_d8475
        cmp     word ptr [bp - 6], 1
        jnz     br_d847f
br_d8475:
        mov     byte ptr [si + TBL_F294], 20h
        mov     word ptr [bp - 6], 1
br_d847f:
        inc     si
        cmp     si, 10h
        jl      loop_d8468
        mov     byte ptr [B_F2A4], 0
        cmp     byte ptr [B_F2AC], 3
        jnz     br_d849e
        cmp     byte ptr [B_F2AB], 3
        jl      br_d849e
        mov     si, word ptr [W_F2A9]
        jmp     br_d84c0
br_d849e:
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jge     br_d84c0
        pop     di
        pop     si
        leave
        retf
br_d84c0:
        mov     al, byte ptr [B_8A9F]
        cbw
        mov     word ptr [bp - 4], ax
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    di
        callf   SEG_E1E1:far_e1e11
        add     sp, 2
        if      FW_VERSION >= 311
        push    ss
        lea     ax, [bp - 46h]
        push    ax
        endif
        push    si
        push    di
        nop
        push    cs
        call    fn_d8549
        if      FW_VERSION >= 311
        add     sp, 8
        else
        add     sp, 4
        endif
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      br_d8501
        mov     di, word ptr [bp - 4]
br_d8501:
        push    di
        callf   SEG_E344:far_e392e
        add     sp, 2
        cmp     byte ptr [B_F2AB], 2
        jg      br_d851f
        if      FW_VERSION >= 311
        push    ss
        lea     ax, [bp - 46h]
        push    ax
        endif
        push    di
        callf   SEG_E546:far_e546f
        if      FW_VERSION >= 311
        add     sp, 6
        else
        add     sp, 2
        endif
br_d851f:
        push    1
        push    di
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        callf   SEG_DEEA:far_deeab
        or      byte ptr [B_955B], 40h
        or      byte ptr [B_955C], 80h
        mov     byte ptr [B_F2AC], 0
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
fn_d8549:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        mov     si, word ptr [bp + 8]
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_E259:far_e259f
        add     sp, 2
        or      ax, ax
        jnz     br_d8569
        mov     ax, 0fffeh
        pop     si
        leave
        retf
br_d8569:
        cmp     byte ptr [B_F2AC], 3
        jnz     br_d8585
        cmp     byte ptr [B_F2AB], 3
        jl      br_d8585
        mov     al, byte ptr [B_F2AC]
        mov     byte ptr [bp - 8], al
        mov     al, byte ptr [B_F2AB]
        mov     byte ptr [bp - 7], al
        jmp     br_d859e
br_d8585:
        push    2
        push    si
        push    ss
        lea     ax, [bp - 8]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      dx, dx
        jz      br_d859e
        pop     si
        leave
        retf
br_d859e:
        cmp     byte ptr [bp - 8], 3
        jz      br_d85aa
        mov     ax, 0ffdfh
        pop     si
        leave
        retf
br_d85aa:
        mov     al, byte ptr [bp - 7]
        mov     byte ptr [B_F2AB], al
        cmp     byte ptr [bp - 7], 1
        jl      br_d85bc
        cmp     byte ptr [bp - 7], 3
        jle     br_d85c2
br_d85bc:
        mov     ax, 0ffe0h
        pop     si
        leave
        retf
br_d85c2:
        if      FW_VERSION >= 311
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        endif
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    1
        mov     al, byte ptr [B_F2AB]
        cbw
        push    ax
        push    si
        nop
        push    cs
        call    far_d85fa
        if      FW_VERSION >= 311
        add     sp, 12h
        else
        add     sp, 0eh
        endif
        mov     dx, ax
        or      dx, dx
        jz      br_d85eb
        pop     si
        leave
        retf
br_d85eb:
        les     bx, dword ptr [W_8C35]
        mov     al, byte ptr [bp + 6]
        mov     byte ptr es:[bx], al
        xor     ax, ax
        pop     si
        leave
        retf
far_d85fa:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 22h
        else
        sub     sp, 20h
        endif
        push    si
        push    di
        les     bx, dword ptr [bp + 10h]
        mov     word ptr es:[bx], 0
        cmp     word ptr [bp + 8], 3
        jnz     br_d8615
        mov     si, 151h
        jmp     br_d8618
br_d8615:
        mov     si, 0cah
br_d8618:
        push    1
        push    word ptr [bp + 6]
        push    ds
        push    word TBL_F779
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     cx, ax
        or      cx, cx
        jz      br_d8633
        pop     di
        pop     si
        leave
        retf
br_d8633:
        cmp     byte ptr [TBL_F779], 0ffh
        jnz     br_d8641
        mov     ax, 0ffeah
        pop     di
        pop     si
        leave
        retf
br_d8641:
        mov     ax, si
        dec     ax
        push    ax
        push    word ptr [bp + 6]
        push    ds
        push    word TBL_F77A
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     cx, ax
        or      cx, cx
        jz      br_d865e
        pop     di
        pop     si
        leave
        retf
br_d865e:
        cmp     word ptr [bp + 8], 3
        jnz     br_d869b
        if      FW_VERSION >= 311
        mov     word ptr [bp - 1ah], ds
        mov     word ptr [bp - 1ch], TBL_F779
        les     bx, dword ptr [bp - 1ch]
        else
        mov     word ptr [bp - 18h], ds
        mov     word ptr [bp - 1ah], TBL_F779
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     ax, word ptr es:[bx + 3]
        mov     dx, word ptr es:[bx + 1]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        mov     al, byte ptr es:[bx + 150h]
        cbw
        mov     word ptr [bp - 12h], ax
        mov     al, byte ptr es:[bx + 14fh]
        cbw
        if      FW_VERSION >= 311
        mov     word ptr [bp - 14h], ax
        else
        mov     si, ax
        endif
        mov     al, byte ptr es:[bx]
        cbw
        les     bx, dword ptr [bp + 10h]
        mov     word ptr es:[bx], ax
        jmp     br_d86ec
br_d869b:
        if      FW_VERSION >= 311
        mov     word ptr [bp - 16h], ds
        mov     word ptr [bp - 18h], TBL_F779
        les     bx, dword ptr [bp - 18h]
        else
        mov     word ptr [bp - 14h], ds
        mov     word ptr [bp - 16h], TBL_F779
        les     bx, dword ptr [bp - 16h]
        endif
        mov     ax, word ptr es:[bx + 3]
        mov     dx, word ptr es:[bx + 1]
        and     dx, 0ffffh
        and     ax, 0ffh
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        mov     al, byte ptr es:[bx + 0c9h]
        cbw
        mov     word ptr [bp - 12h], ax
        mov     al, byte ptr es:[bx + 0c8h]
        cbw
        if      FW_VERSION >= 311
        mov     word ptr [bp - 14h], ax
        else
        mov     si, ax
        endif
        mov     al, byte ptr es:[bx]
        cbw
        les     bx, dword ptr [bp + 10h]
        mov     word ptr es:[bx], ax
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 16h]
        mov     si, word ptr [bp - 18h]
        add     si, 87h
        les     di, dword ptr [bp + 14h]
        mov     cx, 20h
        push    ds
        mov     ds, ax
        rep movsw
        pop     ds
        endif
br_d86ec:
        cmp     word ptr [bp + 8], 1
        jnz     br_d870d
        mov     ax, word ptr [bp - 12h]
        mov     dx, 15h
        imul    dx
        cwd
        mov     bx, word ptr [bp - 0eh]
        mov     cx, word ptr [bp - 10h]
        add     cx, ax
        adc     bx, dx
        mov     word ptr [bp - 6], bx
        mov     word ptr [bp - 8], cx
        jmp     br_d8726
br_d870d:
        mov     ax, word ptr [bp - 12h]
        mov     dx, 18h
        imul    dx
        mov     dx, word ptr [bp - 0eh]
        mov     bx, word ptr [bp - 10h]
        add     bx, ax
        adc     dx, 0
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], bx
br_d8726:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 14h]
        else
        mov     ax, si
        endif
        mov     dx, 6
        imul    dx
        if      FW_VERSION >= 311
        mov     word ptr [bp - 22h], ax
        else
        mov     word ptr [bp - 20h], ax
        endif
        add     word ptr [bp - 8], ax
        adc     word ptr [bp - 6], 0
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        add     dx, 151h
        adc     ax, 0
        les     bx, dword ptr [bp + 0ch]
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
        mov     ax, word ptr [bp - 12h]
        mov     dx, 18h
        imul    dx
        if      FW_VERSION >= 311
        add     ax, word ptr [bp - 22h]
        else
        add     ax, word ptr [bp - 20h]
        endif
        add     word ptr es:[bx], ax
        adc     word ptr es:[bx + 2], 0
        and     byte ptr [B_901C], 0fdh
        and     byte ptr [B_8C42], 0fdh
        mov     al, 0
        mov     byte ptr [B_8802], al
        mov     byte ptr [B_8AA0], al
        callf   SEG_E2CE:far_e2ce3
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        les     bx, dword ptr [bp + 0ch]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        add     dx, 64h
        adc     ax, 0
        cmp     ax, word ptr [bp - 2]
        jl      br_d87a2
        jg      br_d879b
        cmp     dx, word ptr [bp - 4]
        jbe     br_d87a2
br_d879b:
        mov     ax, 0fffdh
        pop     di
        pop     si
        leave
        retf
br_d87a2:
        les     bx, dword ptr [bp + 0ch]
        push    word ptr es:[bx + 2]
        push    word ptr es:[bx]
        push    word ptr [W_8C33]
        push    word ptr [W_8C31]
        callf   SEG_DA9B:far_da9e4
        add     sp, 8
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    word ptr [W_8C37]
        push    word ptr [W_8C35]
        push    word ptr [W_8C33]
        push    word ptr [W_8C31]
        callf   SEG_DA9B:far_daa07
        add     sp, 8
        add     ax, 1
        adc     dx, 0
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        push    dx
        push    ax
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        push    word ptr [W_8C33]
        push    word ptr [W_8C31]
        callf   SEG_DA25:far_da25f
        add     sp, 0ch
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        mov     word ptr [W_8C33], ax
        mov     word ptr [W_8C31], dx
        cmp     word ptr [bp + 8], 3
        jnz     br_d8828
        les     di, dword ptr [W_8C35]
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 1ah]
        mov     si, word ptr [bp - 1ch]
        else
        mov     ax, word ptr [bp - 18h]
        mov     si, word ptr [bp - 1ah]
        endif
        mov     cx, 0a8h
        push    ds
        mov     ds, ax
        rep movsw
        movsb
        pop     ds
        jmp     br_d89e0
br_d8828:
        mov     ax, word ptr [W_8C37]
        mov     dx, word ptr [W_8C35]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 1ah], ax
        mov     word ptr [bp - 1ch], dx
        les     bx, dword ptr [bp - 18h]
        else
        mov     word ptr [bp - 18h], ax
        mov     word ptr [bp - 1ah], dx
        les     bx, dword ptr [bp - 16h]
        endif
        mov     al, byte ptr es:[bx]
        les     bx, dword ptr [W_8C35]
        mov     byte ptr es:[bx], al
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 18h]
        else
        les     bx, dword ptr [bp - 16h]
        endif
        mov     ax, word ptr es:[bx + 3]
        mov     dx, word ptr es:[bx + 1]
        and     dx, 0ffffh
        and     ax, 0ffh
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     word ptr es:[bx + 3], ax
        mov     word ptr es:[bx + 1], dx
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 18h]
        else
        les     bx, dword ptr [bp - 16h]
        endif
        mov     ax, word ptr es:[bx + 6]
        mov     dx, word ptr es:[bx + 4]
        and     dx, 0ffffh
        and     ax, 0ffh
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     word ptr es:[bx + 7], ax
        mov     word ptr es:[bx + 5], dx
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 1ah]
        mov     si, word ptr [bp - 1ch]
        else
        mov     ax, word ptr [bp - 18h]
        mov     si, word ptr [bp - 1ah]
        endif
        add     si, 9
        if      FW_VERSION >= 311
        les     di, dword ptr [bp - 18h]
        else
        les     di, dword ptr [bp - 16h]
        endif
        add     di, 7
        mov     dx, 10h
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        sub     dx, cx
        jnc     br_d88ae
        add     cx, dx
        xor     dx, dx
br_d88ae:
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     cx, dx
        xor     ax, ax
        rep stosb
        pop     ds
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     byte ptr es:[bx + 19h], 0
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 18h]
        else
        les     bx, dword ptr [bp - 16h]
        endif
        mov     al, byte ptr es:[bx + 17h]
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     byte ptr es:[bx + 1ah], al
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 18h]
        else
        les     bx, dword ptr [bp - 16h]
        endif
        mov     ax, word ptr es:[bx + 18h]
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     word ptr es:[bx + 1bh], ax
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 18h]
        else
        les     bx, dword ptr [bp - 16h]
        endif
        mov     ax, word ptr es:[bx + 1ah]
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     word ptr es:[bx + 1dh], ax
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 18h]
        else
        les     bx, dword ptr [bp - 16h]
        endif
        mov     ax, word ptr es:[bx + 1eh]
        mov     dx, word ptr es:[bx + 1ch]
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     word ptr es:[bx + 21h], ax
        mov     word ptr es:[bx + 1fh], dx
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 18h]
        else
        les     bx, dword ptr [bp - 16h]
        endif
        mov     ax, word ptr es:[bx + 20h]
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     word ptr es:[bx + 23h], ax
        if      FW_VERSION >= 311
        mov     di, word ptr [bp - 1ch]
        else
        mov     di, word ptr [bp - 1ah]
        endif
        add     di, 25h
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 16h]
        mov     si, word ptr [bp - 18h]
        else
        mov     ax, word ptr [bp - 14h]
        mov     si, word ptr [bp - 16h]
        endif
        add     si, 22h
        mov     cx, 2
        push    ds
        mov     ds, ax
        rep movsw
        movsb
        pop     ds
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 18h]
        else
        les     bx, dword ptr [bp - 16h]
        endif
        mov     al, byte ptr es:[bx + 0c7h]
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     byte ptr es:[bx + 14eh], al
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 18h]
        else
        les     bx, dword ptr [bp - 16h]
        endif
        mov     al, byte ptr es:[bx + 0c8h]
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     byte ptr es:[bx + 14fh], al
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 18h]
        else
        les     bx, dword ptr [bp - 16h]
        endif
        mov     al, byte ptr es:[bx + 0c9h]
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     byte ptr es:[bx + 150h], al
        xor     si, si
        if      FW_VERSION >= 311
        mov     di, word ptr [bp - 1ch]
        else
        mov     di, word ptr [bp - 1ah]
        endif
        add     di, 2ah
loop_d8964:
        if      FW_VERSION >= 311
        push    word ptr [bp - 1ah]
        else
        push    word ptr [bp - 18h]
        endif
        push    di
        callf   SEG_CB18:far_cb3de
        add     sp, 4
        add     di, 4
        inc     si
        cmp     si, 40h
        jl      loop_d8964
        xor     si, si
        if      FW_VERSION >= 311
        mov     cx, word ptr [bp - 18h]
        else
        mov     cx, word ptr [bp - 16h]
        endif
loop_d897e:
        xor     di, di
        or      si, si
        jz      br_d8989
        mov     di, si
        add     di, 2
br_d8989:
        mov     al, byte ptr [di + TBL_83D1]
        cbw
        add     ax, 0ffddh
        mov     di, ax
        if      FW_VERSION >= 311
        mov     es, word ptr [bp - 16h]
        else
        mov     es, word ptr [bp - 14h]
        endif
        mov     bx, cx
        mov     al, byte ptr es:[bx + 27h]
        cbw
        mov     dx, 19h
        imul    dx
        mov     bx, 20h
        cwd
        idiv    bx
        mov     dx, di
        shl     dx, 2
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        add     bx, dx
        mov     byte ptr es:[bx + 2ah], al
        if      FW_VERSION >= 311
        mov     es, word ptr [bp - 16h]
        else
        mov     es, word ptr [bp - 14h]
        endif
        mov     bx, cx
        mov     al, byte ptr es:[bx + 47h]
        cbw
        mov     dx, 19h
        imul    dx
        mov     bx, 20h
        cwd
        idiv    bx
        mov     dx, di
        shl     dx, 2
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        add     bx, dx
        mov     byte ptr es:[bx + 2bh], al
        inc     cx
        inc     si
        cmp     si, 20h
        jl      loop_d897e
br_d89e0:
        cmp     word ptr [bp + 0ah], 1
        jnz     br_d8a3b
        mov     ax, word ptr [W_8C37]
        mov     dx, word ptr [W_8C35]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 1ah], ax
        mov     word ptr [bp - 1ch], dx
        else
        mov     word ptr [bp - 18h], ax
        mov     word ptr [bp - 1ah], dx
        endif
        mov     si, word ptr [W_8C35]
        add     si, 9
        push    ds
        pop     es
        mov     di, TBL_F294
        mov     dx, 10h
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        sub     dx, cx
        jnc     br_d8a24
        add     cx, dx
        xor     dx, dx
br_d8a24:
        shr     cx, 1
        rep movsw
        adc     cx, cx
        rep movsb
        mov     cx, dx
        xor     ax, ax
        rep stosb
        pop     ds
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 1ch]
        else
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     byte ptr es:[bx + 19h], 0
br_d8a3b:
        mov     ax, word ptr [W_8C37]
        mov     dx, word ptr [W_8C35]
        add     dx, 151h
        adc     ax, 0
        if      FW_VERSION >= 311
        mov     word ptr [bp - 1eh], ax
        mov     word ptr [bp - 20h], dx
        else
        mov     word ptr [bp - 1ch], ax
        mov     word ptr [bp - 1eh], dx
        endif
        cmp     word ptr [bp + 8], 1
        jnz     br_d8ab9
        jmp     br_d8aaf
loop_d8a57:
        push    15h
        push    word ptr [bp + 6]
        push    ds
        push    word TBL_F779
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     cx, ax
        or      cx, cx
        jz      br_d8a72
        pop     di
        pop     si
        leave
        retf
br_d8a72:
        if      FW_VERSION >= 311
        les     di, dword ptr [bp - 20h]
        else
        les     di, dword ptr [bp - 1eh]
        endif
        mov     si, TBL_F779
        mov     cx, 0ah
        rep movsw
        movsb
        if      FW_VERSION >= 311
        mov     bx, word ptr [bp - 20h]
        else
        mov     bx, word ptr [bp - 1eh]
        endif
        push    word ptr es:[bx + 3]
        nop
        push    cs
        call    fn_d8b37
        add     sp, 2
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 20h]
        else
        les     bx, dword ptr [bp - 1eh]
        endif
        mov     word ptr es:[bx + 3], ax
        mov     byte ptr es:[bx + 15h], 64h
        mov     byte ptr es:[bx + 16h], 0
        mov     byte ptr es:[bx + 17h], 0
        if      FW_VERSION >= 311
        add     word ptr [bp - 20h], 18h
        else
        add     word ptr [bp - 1eh], 18h
        endif
        sub     word ptr [bp - 8], 15h
        sbb     word ptr [bp - 6], 0
br_d8aaf:
        mov     ax, word ptr [bp - 12h]
        dec     word ptr [bp - 12h]
        or      ax, ax
        jnz     loop_d8a57
br_d8ab9:
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        push    word ptr [bp + 6]
        if      FW_VERSION < 311
        push    word ptr [bp - 1ch]
        endif
        push    word ptr [bp - 1eh]
        if      FW_VERSION >= 311
        push    word ptr [bp - 20h]
        endif
        callf   SEG_DA9B:far_daa59
        add     sp, 4
        push    dx
        push    ax
        push    4
        callf   SEG_CADB:far_cadb4
        add     sp, 0ch
        mov     cx, ax
        mov     ax, word ptr [W_8C37]
        mov     dx, word ptr [W_8C35]
        if      FW_VERSION >= 311
        mov     word ptr [bp - 1ah], ax
        mov     word ptr [bp - 1ch], dx
        les     bx, dword ptr [bp - 1ch]
        else
        mov     word ptr [bp - 18h], ax
        mov     word ptr [bp - 1ah], dx
        les     bx, dword ptr [bp - 1ah]
        endif
        mov     al, byte ptr es:[bx + 150h]
        cbw
        mov     word ptr [bp - 12h], ax
        mov     ax, word ptr [W_8C37]
        add     dx, 151h
        adc     ax, 0
        if      FW_VERSION >= 311
        mov     word ptr [bp - 1eh], ax
        mov     word ptr [bp - 20h], dx
        else
        mov     word ptr [bp - 1ch], ax
        mov     word ptr [bp - 1eh], dx
        endif
        cmp     word ptr [bp + 8], 2
        jg      br_d8b31
        jmp     br_d8b27
loop_d8b0f:
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp - 20h]
        else
        les     bx, dword ptr [bp - 1eh]
        endif
        test    byte ptr es:[bx + 2], 4
        jz      br_d8b23
        mov     byte ptr es:[bx + 3], 0ffh
        mov     byte ptr es:[bx + 4], 0ffh
br_d8b23:
        if      FW_VERSION >= 311
        add     word ptr [bp - 20h], 18h
        else
        add     word ptr [bp - 1eh], 18h
        endif
br_d8b27:
        mov     ax, word ptr [bp - 12h]
        dec     word ptr [bp - 12h]
        or      ax, ax
        jnz     loop_d8b0f
br_d8b31:
        mov     ax, cx
        pop     di
        pop     si
        leave
        retf
fn_d8b37:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     bx, word ptr [bp + 6]
        mov     byte ptr [bp - 2], 0
        mov     dx, 1
        xor     cx, cx
loop_d8b49:
        test    dx, bx
        jnz     br_d8b5d
        mov     al, byte ptr [bp - 2]
        inc     al
        mov     byte ptr [bp - 2], al
        shl     dx, 1
        inc     cx
        cmp     cx, 10h
        jl      loop_d8b49
br_d8b5d:
        shl     dx, 1
        mov     al, byte ptr [bp - 2]
        inc     al
        mov     byte ptr [bp - 1], al
        inc     cx
        jmp     br_d8b79
loop_d8b6a:
        test    dx, bx
        jnz     br_d8b7e
        mov     al, byte ptr [bp - 1]
        inc     al
        mov     byte ptr [bp - 1], al
        shl     dx, 1
        inc     cx
br_d8b79:
        cmp     cx, 10h
        jl      loop_d8b6a
br_d8b7e:
        cmp     cx, 10h
        jnz     br_d8b87
        mov     byte ptr [bp - 1], 0ffh
br_d8b87:
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        shl     ax, 8
        mov     bx, ax
        mov     al, byte ptr [bp - 2]
        mov     ah, 0
        or      bx, ax
        mov     ax, bx
        leave
        retf
        if      FW_VERSION >= 312
        phase   0ch
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   5
        endif
far_d8b9c:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 312
        sub     sp, 28h
        else
        sub     sp, 18h
        endif
        push    si
        push    di
        if      FW_VERSION >= 312
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    L_d9571
        add     sp, 4
        mov     word ptr [bp - 4], ax
        cmp     word ptr [bp - 4], 2
        jnz     L_d8bc2
        mov     ax, 0ffdch
        pop     di
        pop     si
        leave
        retf
L_d8bc2:
        endif
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 28h]
        else
        lea     ax, [bp - 18h]
        endif
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 28h]
        else
        lea     ax, [bp - 18h]
        endif
        push    ax
        push    ds
        if      FW_VERSION >= 312
        push    word STR_7184
        elseif  FW_VERSION = 311
        push    word STR_7184
        else
        push    word STR_7184
        endif
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jge     br_d8c14
        pop     di
        pop     si
        leave
        retf
br_d8c14:
        push    2
        push    si
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 6]
        else
        lea     ax, [bp - 2]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        if      FW_VERSION >= 312
        mov     word ptr [bp - 2], ax
        else
        mov     di, ax
        endif
        or      ax, ax
        jz      br_d8c3b
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        if      FW_VERSION >= 312
        mov     ax, word ptr [bp - 2]
        else
        mov     ax, di
        endif
        pop     di
        pop     si
        leave
        retf
br_d8c3b:
        if      FW_VERSION >= 312
        cmp     byte ptr [bp - 6], 1
        else
        cmp     byte ptr [bp - 2], 1
        endif
        jz      br_d8c51
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        mov     ax, 0ffdfh
        pop     di
        pop     si
        leave
        retf
br_d8c51:
        inc     byte ptr [B_956A]
        push    1
        callf   SEG_DA3F:far_da3fa
        add     sp, 2
        if      FW_VERSION >= 312
        mov     al, byte ptr [bp - 5]
        mov     ah, 0
        and     ax, 7fh
        mov     word ptr [bp - 10h], ax
        cmp     ax, 1
        jg      L_d8c87
        mov     al, byte ptr [bp - 5]
        elseif  FW_VERSION = 311
        cmp     byte ptr [bp - 1], 2
        jnc     L_d8c87
        mov     al, byte ptr [bp - 1]
        else
        cmp     byte ptr [bp - 1], 2
        jnc     br_d94ce
        mov     al, byte ptr [bp - 1]
        endif
        push    ax
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_d91df
        add     sp, 8
        if      FW_VERSION >= 312
        mov     word ptr [bp - 2], ax
        else
        mov     di, ax
        endif
        jmp     br_d8cb8
L_d8c87:
        if      FW_VERSION >= 312
        cmp     word ptr [bp - 10h], 2
        endif
br_d94ce:
        if      FW_VERSION >= 312
        jnz     L_d8ca8
        push    word ptr [bp - 4]
        mov     al, byte ptr [bp - 5]
        push    ax
        elseif  FW_VERSION = 311
        cmp     byte ptr [bp - 1], 2
        jnz     L_d8ca8
        else
        cmp     byte ptr [bp - 1], 2
        jnz     br_d94e7
        endif
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_d8f33
        if      FW_VERSION >= 312
        add     sp, 0ah
        mov     word ptr [bp - 2], ax
        else
        add     sp, 6
        mov     di, ax
        endif
        jmp     br_d8cb8
L_d8ca8:
        if      FW_VERSION >= 312
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        endif
br_d94e7:
        mov     ax, 0ffe0h
        pop     di
        pop     si
        leave
        retf
br_d8cb8:
        push    0
        callf   SEG_DA3F:far_da3fa
        add     sp, 2
        if      FW_VERSION < 312
        callf   SEG_D78B:far_d7903
        endif
        dec     byte ptr [B_956A]
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        if      FW_VERSION >= 312
        cmp     word ptr [bp - 2], 0
        jz      L_d8cdc
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
L_d8cdc:
        push    ss
        pop     es
        lea     di, [bp - 28h]
        push    es
        mov     es, word ptr [bp + 8]
        push    di
        mov     di, word ptr [bp + 6]
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        mov     ax, word ptr [bp + 8]
        mov     si, word ptr [bp + 6]
        pop     di
        pop     es
        push    ds
        mov     ds, ax
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        nop
        push    cs
        call    L_d970c
        add     sp, 4
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        nop
        push    cs
        call    L_d9639
        add     sp, 4
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        callf   SEG_CC84:far_cd551
        add     sp, 4
        mov     di, ax
        cmp     word ptr [bp - 4], 1
        jz      L_d8d3a
        jmp     L_d8f27
L_d8d3a:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    L_d95df
        add     sp, 4
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
L_d8d52:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    L_d96ab
        add     sp, 4
        mov     si, ax
        cmp     ax, 78h
        jz      L_d8d7a
        push    1
        push    0
        push    di
        callf   SEG_CC84:far_cd353
        add     sp, 6
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
L_d8d7a:
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        push    ss
        lea     ax, [bp - 28h]
        push    ax
        push    ds
        push    word STR_7194
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        push    0
        callf   SEG_CAD0:far_cad00
        add     sp, 2
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_CAA9:far_caade
        add     sp, 4
        mov     si, ax
        or      ax, ax
        jge     L_d8de1
        cmp     si, 0fd00h
        jz      L_d8d52
        push    0
        push    0
        push    di
        callf   SEG_CC84:far_cd353
        add     sp, 6
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
L_d8de1:
        push    2
        push    si
        push    ss
        lea     ax, [bp - 6]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      L_d8e15
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        push    1
        push    0
        push    di
        callf   SEG_CC84:far_cd353
        add     sp, 6
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
L_d8e15:
        cmp     byte ptr [bp - 6], 1
        jz      L_d8e38
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        push    1
        push    0
        push    di
        callf   SEG_CC84:far_cd353
        add     sp, 6
        mov     ax, 0ffdfh
        pop     di
        pop     si
        leave
        retf
L_d8e38:
        mov     al, byte ptr [bp - 5]
        mov     ah, 0
        and     ax, 7fh
        cmp     ax, 2
        jz      L_d8e62
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        push    1
        push    0
        push    di
        callf   SEG_CC84:far_cd353
        add     sp, 6
        mov     ax, 0ffe0h
        pop     di
        pop     si
        leave
        retf
L_d8e62:
        push    24h
        push    si
        push    ds
        push    word TBL_F779
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      L_d8e95
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        push    1
        push    0
        push    di
        callf   SEG_CC84:far_cd353
        add     sp, 6
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
L_d8e95:
        endif
        mov     ax, di
        if      FW_VERSION >= 312
        mov     dx, 24h
        imul    dx
        mov     word ptr [bp - 12h], ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        mov     ax, word ptr es:[bx + 4822h]
        mov     dx, word ptr es:[bx + 4820h]
        add     dx, 0c00h
        adc     ax, 8
        mov     word ptr [bp - 8], ax
        mov     word ptr [bp - 0ah], dx
        mov     bx, word ptr [bp - 12h]
        mov     ax, SEG_A28F
        mov     es, ax
        mov     al, byte ptr es:[bx + 4813h]
        mov     ah, 0
        inc     ax
        cwd
        mov     cx, SEG_A28F
        mov     es, cx
        push    ax
        push    dx
        mov     dx, word ptr es:[bx + 481eh]
        mov     ax, word ptr es:[bx + 481ch]
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        add     ax, 0f400h
        adc     dx, 0fff7h
        mov     word ptr [bp - 0ch], dx
        mov     word ptr [bp - 0eh], ax
        push    dx
        push    ax
        push    word ptr [bp - 8]
        push    word ptr [bp - 0ah]
        push    si
        nop
        push    cs
        call    far_d938a
        add     sp, 0ah
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jge     L_d8f27
        push    si
        callf   SEG_CAA9:far_cab20
        add     sp, 2
        push    1
        push    0
        push    di
        callf   SEG_CC84:far_cd353
        add     sp, 6
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
L_d8f27:
        callf   SEG_D78B:far_d7903
        mov     ax, word ptr [bp - 2]
        endif
        pop     di
        pop     si
        leave
        retf
fn_d8f33:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 312
        sub     sp, 40h
        else
        sub     sp, 42h
        endif
        push    si
        push    di
        if      FW_VERSION >= 312
        mov     di, word ptr [bp + 0ah]
        endif
        push    24h
        if      FW_VERSION >= 312
        push    di
        else
        push    word ptr [bp + 0ah]
        endif
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 2ah]
        else
        lea     ax, [bp - 2ch]
        endif
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_d8f58
        pop     di
        pop     si
        leave
        retf
br_d8f58:
        if      FW_VERSION < 312
        mov     word ptr [bp - 4], 0
        endif
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 40h]
        else
        lea     ax, [bp - 42h]
        endif
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        if      FW_VERSION >= 312
        push    ss
        lea     ax, [bp - 40h]
        push    ax
        nop
        push    cs
        call    L_d970c
        add     sp, 4
        push    ss
        lea     ax, [bp - 40h]
        push    ax
        nop
        push    cs
        call    L_d9639
        add     sp, 4
        mov     al, byte ptr [bp - 17h]
        else
        xor     si, si
loop_d954e:
        lea     ax, [bp - 42h]
        mov     bx, si
        add     bx, ax
        mov     di, bx
        cmp     byte ptr ss:[bx], 2eh
        jz      br_d9563
        cmp     word ptr [bp - 4], 1
        jnz     br_d956c
br_d9563:
        mov     byte ptr ss:[di], 20h
        mov     word ptr [bp - 4], 1
br_d956c:
        inc     si
        cmp     si, 10h
        jl      loop_d954e
        mov     byte ptr [bp - 32h], 0
        mov     al, byte ptr [bp - 19h]
        endif
        mov     ah, 0
        push    ax
        if      FW_VERSION >= 312
        push    word ptr [bp - 0ch]
        endif
        push    word ptr [bp - 0eh]
        if      FW_VERSION < 312
        push    word ptr [bp - 10h]
        endif
        push    ss
        if      FW_VERSION >= 312
        lea     ax, [bp - 40h]
        else
        lea     ax, [bp - 42h]
        endif
        push    ax
        callf   SEG_CC84:far_cce4b
        add     sp, 0ah
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jge     br_d8fab
        neg     ax
        pop     di
        pop     si
        leave
        retf
br_d8fab:
        if      FW_VERSION >= 312
        cmp     byte ptr [bp - 17h], 0
        else
        cmp     byte ptr [bp - 19h], 0
        endif
        jnz     br_d8fbf
        if      FW_VERSION >= 312
        mov     ax, word ptr [bp - 0ch]
        mov     dx, word ptr [bp - 0eh]
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 6], dx
        else
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        endif
        jmp     br_d8fd5
br_d8fbf:
        if      FW_VERSION >= 312
        cmp     byte ptr [bp - 17h], 1
        else
        cmp     byte ptr [bp - 19h], 1
        endif
        jnz     br_d8fd5
        if      FW_VERSION >= 312
        mov     ax, word ptr [bp - 0ch]
        mov     dx, word ptr [bp - 0eh]
        else
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        endif
        shl     dx, 1
        rcl     ax, 1
        if      FW_VERSION >= 312
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 6], dx
        else
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        endif
br_d8fd5:
        if      FW_VERSION >= 312
        cmp     word ptr [bp + 0eh], 1
        jnz     L_d8fe5
        mov     word ptr [bp - 4], 8
        mov     word ptr [bp - 6], 0c00h
L_d8fe5:
        test    byte ptr [bp + 0ch], 80h
        jz      L_d902e
        push    word ptr [bp - 4]
        endif
        push    word ptr [bp - 6]
        if      FW_VERSION < 312
        push    word ptr [bp - 8]
        endif
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        push    word ptr es:[bx + 4822h]
        push    word ptr es:[bx + 4820h]
        if      FW_VERSION >= 312
        push    di
        nop
        push    cs
        call    far_d938a
        add     sp, 0ah
        mov     si, ax
        or      ax, ax
        jz      br_d9071
        push    1
        push    0
        push    word ptr [bp - 2]
        callf   SEG_CC84:far_cd353
        add     sp, 6
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
L_d902e:
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        push    word ptr es:[bx + 4822h]
        push    word ptr es:[bx + 4820h]
        push    di
        else
        push    word ptr [bp + 0ah]
        endif
        nop
        push    cs
        call    fn_d9129
        add     sp, 0ah
        mov     si, ax
        or      ax, ax
        jz      br_d9071
        if      FW_VERSION >= 311
        push    1
        endif
        push    0
        push    word ptr [bp - 2]
        callf   SEG_CC84:far_cd353
        if      FW_VERSION >= 311
        add     sp, 6
        else
        add     sp, 4
        endif
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
br_d9071:
        mov     ax, SEG_A28F
        push    ax
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        add     ax, 4800h
        push    ss
        pop     es
        if      FW_VERSION >= 312
        lea     di, [bp - 40h]
        else
        lea     di, [bp - 42h]
        endif
        push    ax
        xor     ax, ax
        mov     cx, 0ffffh
        repne scasb
        not     cx
        sub     di, cx
        shr     cx, 1
        pop     si
        mov     ax, ds
        pop     ds
        push    ax
        xchg    si, di
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        rep movsw
        adc     cx, cx
        rep movsb
        pop     ds
        mov     ax, word ptr [bp - 2]
        mov     dx, 24h
        imul    dx
        mov     si, ax
        mov     dx, SEG_A28F
        if      FW_VERSION >= 312
        mov     bl, byte ptr [bp - 19h]
        else
        mov     bl, byte ptr [bp - 1bh]
        endif
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx + 4811h], al
        if      FW_VERSION >= 312
        test    byte ptr [bp + 0ch], 80h
        jz      L_d90ec
        cmp     byte ptr [bp - 18h], 99h
        jge     L_d90da
        endif
        mov     ax, SEG_A28F
        if      FW_VERSION >= 312
        mov     es, ax
        mov     byte ptr es:[si + 4812h], 88h
        jmp     L_d90f9
L_d90da:
        mov     ax, SEG_A28F
        mov     dl, byte ptr [bp - 18h]
        add     dl, 0efh
        else
        mov     dl, byte ptr [bp - 1ah]
        endif
        mov     es, ax
        mov     byte ptr es:[si + 4812h], dl
        if      FW_VERSION >= 312
        jmp     L_d90f9
L_d90ec:
        endif
        mov     ax, SEG_A28F
        if      FW_VERSION >= 312
        mov     dl, byte ptr [bp - 18h]
        mov     es, ax
        mov     byte ptr es:[si + 4812h], dl
L_d90f9:
        mov     ax, SEG_A28F
        mov     dx, word ptr [bp - 14h]
        mov     bx, word ptr [bp - 16h]
        else
        mov     dx, word ptr [bp - 16h]
        mov     bx, word ptr [bp - 18h]
        endif
        mov     es, ax
        mov     word ptr es:[si + 4816h], dx
        mov     word ptr es:[si + 4814h], bx
        mov     ax, SEG_A28F
        if      FW_VERSION >= 312
        mov     dx, word ptr [bp - 10h]
        mov     bx, word ptr [bp - 12h]
        else
        mov     dx, word ptr [bp - 12h]
        mov     bx, word ptr [bp - 14h]
        endif
        mov     es, ax
        mov     word ptr es:[si + 481ah], dx
        mov     word ptr es:[si + 4818h], bx
        if      FW_VERSION < 311
        push    0
        push    word ptr [bp - 2]
        callf   0d266h:L_d2774
        add     sp, 4
        endif
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_d9129:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        mov     ax, word ptr [bp + 0eh]
        mov     dx, word ptr [bp + 0ch]
        shl     dx, 1
        rcl     ax, 1
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     si, 4800h
        jmp     br_d91c8
loop_d9153:
        xor     ax, ax
        cmp     ax, word ptr [bp - 6]
        jl      br_d9164
        jg      br_d9161
        cmp     si, word ptr [bp - 8]
        jbe     br_d9164
br_d9161:
        mov     si, word ptr [bp - 8]
br_d9164:
        push    0
        push    2
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   0f800h:far_fa0fe
        mov     bx, word ptr [bp + 0ah]
        mov     cx, word ptr [bp + 8]
        add     cx, ax
        adc     bx, dx
        mov     word ptr [bp - 0ah], bx
        mov     word ptr [bp - 0ch], cx
        push    si
        push    di
        push    word SEG_A28F
        push    word 0
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jz      br_d919d
        pop     di
        pop     si
        leave
        retf
br_d919d:
        push    0
        mov     ax, si
        shr     ax, 1
        push    0
        push    ax
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        push    word SEG_A28F
        push    word 0
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        add     word ptr [bp - 4], si
        adc     word ptr [bp - 2], 0
        sub     word ptr [bp - 8], si
        sbb     word ptr [bp - 6], 0
br_d91c8:
        cmp     word ptr [bp - 6], 0
        jg      loop_d9153
        jnz     br_d91d9
        cmp     word ptr [bp - 8], 0
        jbe     br_d91d9
        jmp     near loop_d9153
br_d91d9:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_d91df:
        push    bp
        mov     bp, sp
        sub     sp, 3eh
        push    si
        push    di
        push    1dh
        push    word ptr [bp + 0ah]
        push    ss
        lea     ax, [bp - 3eh]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_d9203
        pop     di
        pop     si
        leave
        retf
br_d9203:
        cmp     byte ptr [bp + 0ch], 1
        jnz     br_d9225
        push    8
        push    word ptr [bp + 0ah]
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     si, ax
        or      ax, ax
        jz      br_d9225
        pop     di
        pop     si
        leave
        retf
br_d9225:
        mov     word ptr [bp - 2], 0
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        xor     si, si
loop_d923f:
        lea     ax, [bp - 20h]
        mov     bx, si
        add     bx, ax
        mov     di, bx
        cmp     byte ptr ss:[bx], 2eh
        jz      br_d9254
        cmp     word ptr [bp - 2], 1
        jnz     br_d925d
br_d9254:
        mov     byte ptr ss:[di], 20h
        mov     word ptr [bp - 2], 1
br_d925d:
        inc     si
        cmp     si, 10h
        jl      loop_d923f
        mov     byte ptr [bp - 10h], 0
        push    0
        push    word ptr [bp - 2bh]
        push    word ptr [bp - 2dh]
        push    ss
        lea     ax, [bp - 20h]
        push    ax
        callf   SEG_CC84:far_cce4b
        add     sp, 0ah
        mov     di, ax
        or      di, di
        jge     br_d9288
        neg     ax
        pop     di
        pop     si
        leave
        retf
br_d9288:
        mov     ax, word ptr [bp - 29h]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 28h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    ax
        mov     ax, di
        mov     bx, 24h
        push    dx
        imul    bx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        pop     ax
        mov     word ptr es:[bx + 4816h], ax
        pop     ax
        mov     word ptr es:[bx + 4814h], ax
        mov     ax, word ptr [bp - 27h]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 28h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    ax
        mov     ax, di
        mov     bx, 24h
        push    dx
        imul    bx
        mov     si, ax
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        pop     ax
        mov     word ptr es:[bx + 481ah], ax
        pop     ax
        mov     word ptr es:[bx + 4818h], ax
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[si + 4813h], 0
        cmp     byte ptr [bp + 0ch], 1
        jnz     br_d9329
        mov     ax, SEG_A28F
        mov     dl, byte ptr [bp - 0ah]
        mov     es, ax
        mov     byte ptr es:[si + 4811h], dl
        if      FW_VERSION >= 312
        cmp     word ptr [bp - 9], 0ff99h
        jge     L_d9317
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[si + 4812h], 88h
        jmp     br_d933f
L_d9317:
        endif
        mov     ax, SEG_A28F
        mov     dl, byte ptr [bp - 9]
        add     dl, 0efh
        mov     es, ax
        mov     byte ptr es:[si + 4812h], dl
        jmp     br_d933f
br_d9329:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[si + 4811h], 64h
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[si + 4812h], 0efh
br_d933f:
        push    di
        callf   SEG_CC84:far_cd5d8
        add     sp, 2
        push    word ptr [bp - 2bh]
        push    word ptr [bp - 2dh]
        mov     ax, di
        mov     dx, 24h
        imul    dx
        mov     dx, SEG_A28F
        mov     bx, ax
        mov     es, dx
        push    word ptr es:[bx + 4822h]
        push    word ptr es:[bx + 4820h]
        push    word ptr [bp + 0ah]
        nop
        push    cs
        call    far_d938a
        add     sp, 0ah
        mov     si, ax
        or      ax, ax
        jge     br_d9384
        if      FW_VERSION >= 311
        push    1
        endif
        push    0
        push    di
        callf   SEG_CC84:far_cd353
        if      FW_VERSION >= 311
        add     sp, 6
        else
        add     sp, 4
        endif
br_d9384:
        mov     ax, si
        pop     di
        pop     si
        leave
        retf
far_d938a:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        push    1
        callf   SEG_B18E:far_b1941
        add     sp, 2
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        push    0
        push    2
        mov     cx, word ptr [bp + 0eh]
        mov     bx, word ptr [bp + 0ch]
        xor     dx, dx
        mov     ax, 3
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        mov     si, 3600h
        jmp     br_d943d
loop_d93cf:
        xor     ax, ax
        cmp     ax, word ptr [bp - 6]
        jl      br_d93e0
        jg      br_d93dd
        cmp     si, word ptr [bp - 8]
        jbe     br_d93e0
br_d93dd:
        mov     si, word ptr [bp - 8]
br_d93e0:
        push    0
        push    3
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   0f800h:far_fa0fe
        shl     ax, 1
        rcl     dx, 1
        mov     bx, word ptr [bp + 0ah]
        mov     cx, word ptr [bp + 8]
        add     cx, ax
        adc     bx, dx
        mov     word ptr [bp - 0ah], bx
        mov     word ptr [bp - 0ch], cx
        push    0
        push    3
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   0f800h:far_fa10d
        mov     dx, ax
        push    si
        push    ax
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        push    di
        nop
        push    cs
        call    fn_d9451
        add     sp, 0ah
        mov     dx, ax
        or      ax, ax
        jz      br_d942f
        pop     di
        pop     si
        leave
        retf
br_d942f:
        add     word ptr [bp - 4], si
        adc     word ptr [bp - 2], 0
        sub     word ptr [bp - 8], si
        sbb     word ptr [bp - 6], 0
br_d943d:
        cmp     word ptr [bp - 6], 0
        jg      loop_d93cf
        jnz     br_d944b
        cmp     word ptr [bp - 8], 0
        ja      loop_d93cf
br_d944b:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
fn_d9451:
        push    bp
        mov     bp, sp
        sub     sp, 12h
        push    si
        push    di
        mov     word ptr [bp - 2], 1200h
        push    word ptr [bp + 0eh]
        push    word ptr [bp + 6]
        mov     ax, 1200h
        add     ax, 0
        push    word SEG_A28F
        push    ax
        callf   SEG_CAD0:far_cad6d
        add     sp, 8
        mov     dx, ax
        or      dx, dx
        jge     br_d9480
        pop     di
        pop     si
        leave
        retf
br_d9480:
        xor     di, di
        mov     si, word ptr [bp - 2]
        mov     ax, word ptr [bp - 2]
        add     ax, word ptr [bp + 0eh]
        mov     word ptr [bp - 12h], ax
        jmp     br_d9500
loop_d9490:
        mov     ax, SEG_A28F
        mov     es, ax
        mov     al, byte ptr es:[word si + 1]
        mov     ah, 0
        mov     dx, ax
        shl     ax, 4
        mov     cx, ax
        mov     ax, SEG_A28F
        mov     es, ax
        mov     al, byte ptr es:[word si]
        mov     ah, 0
        mov     word ptr [bp - 8], ax
        mov     ax, dx
        and     ax, 0f0h
        mov     word ptr [bp - 0ah], ax
        mov     ax, SEG_A28F
        mov     es, ax
        mov     al, byte ptr es:[word si + 2]
        mov     ah, 0
        mov     word ptr [bp - 0ch], ax
        mov     ax, SEG_A28F
        mov     es, ax
        mov     byte ptr es:[word di], cl
        mov     ax, SEG_A28F
        mov     dl, byte ptr [bp - 8]
        mov     es, ax
        mov     byte ptr es:[word di + 1], dl
        mov     ax, SEG_A28F
        mov     dl, byte ptr [bp - 0ah]
        mov     es, ax
        mov     byte ptr es:[word di + 2], dl
        mov     ax, SEG_A28F
        mov     dl, byte ptr [bp - 0ch]
        mov     es, ax
        mov     byte ptr es:[word di + 3], dl
        add     di, 4
        add     si, 3
br_d9500:
        cmp     word ptr [bp - 12h], si
        jg      loop_d9490
        mov     ax, si
        sub     ax, word ptr [bp - 2]
        mov     bx, 3
        cwd
        idiv    bx
        shl     ax, 1
        cwd
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        mov     word ptr [bp - 4], SEG_A28F
        mov     word ptr [bp - 6], 0
        xor     si, si
        jmp     br_d9540
loop_d9527:
        les     bx, dword ptr [bp - 6]
        push    word ptr es:[bx]
        callf   SEG_B16D:timing_calc_rate
        add     sp, 2
        les     bx, dword ptr [bp - 6]
        mov     word ptr es:[bx], ax
        add     word ptr [bp - 6], 2
        inc     si
br_d9540:
        mov     ax, si
        cwd
        cmp     dx, word ptr [bp - 0eh]
        jl      loop_d9527
        jnz     br_d954f
        cmp     ax, word ptr [bp - 10h]
        jc      loop_d9527
br_d954f:
        push    0
        push    word ptr [bp - 0eh]
        push    word ptr [bp - 10h]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word SEG_A28F
        push    word 0
        callf   SEG_CB56:far_cb566
        add     sp, 0eh
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
L_d9571:
        push    bp
        mov     bp, sp
        push    si
        push    di
        xor     cx, cx
        mov     dx, 1
        mov     si, word ptr [bp + 6]
        inc     si
        mov     di, 1
        add     di, word ptr [bp + 6]
        add     di, 2
        jmp     L_d95a1
L_d958a:
        mov     es, word ptr [bp + 8]
        cmp     byte ptr es:[si], 7bh
        jnz     L_d959e
        cmp     byte ptr es:[di], 7dh
        jnz     L_d959e
        mov     cx, 1
        jmp     L_d95a6
L_d959e:
        inc     si
        inc     di
        inc     dx
L_d95a1:
        cmp     dx, 0eh
        jl      L_d958a
L_d95a6:
        or      cx, cx
        jnz     L_d95b0
        xor     ax, ax
        pop     di
        pop     si
        pop     bp
        retf
L_d95b0:
        mov     bx, dx
        mov     es, word ptr [bp + 8]
        add     bx, word ptr [bp + 6]
        mov     si, bx
        cmp     byte ptr es:[bx + 1], 31h
        jnz     L_d95c8
        mov     ax, 1
        pop     di
        pop     si
        pop     bp
        retf
L_d95c8:
        mov     es, word ptr [bp + 8]
        cmp     byte ptr es:[si + 1], 32h
        jnz     L_d95d9
        mov     ax, 2
        pop     di
        pop     si
        pop     bp
        retf
L_d95d9:
        xor     ax, ax
        pop     di
        pop     si
        pop     bp
        retf
L_d95df:
        push    bp
        mov     bp, sp
        push    si
        push    di
        xor     cx, cx
        mov     dx, 1
        mov     si, word ptr [bp + 6]
        inc     si
        mov     di, 1
        add     di, word ptr [bp + 6]
        add     di, 2
        jmp     L_d960f
L_d95f8:
        mov     es, word ptr [bp + 8]
        cmp     byte ptr es:[si], 7bh
        jnz     L_d960c
        cmp     byte ptr es:[di], 7dh
        jnz     L_d960c
        mov     cx, 1
        jmp     L_d9614
L_d960c:
        inc     si
        inc     di
        inc     dx
L_d960f:
        cmp     dx, 0eh
        jl      L_d95f8
L_d9614:
        or      cx, cx
        jz      L_d9635
        mov     bx, dx
        mov     es, word ptr [bp + 8]
        add     bx, word ptr [bp + 6]
        mov     si, bx
        cmp     byte ptr es:[bx + 1], 31h
        jnz     L_d9635
        cmp     byte ptr es:[si + 2], 7dh
        jnz     L_d9635
        mov     byte ptr es:[si + 1], 32h
L_d9635:
        pop     di
        pop     si
        pop     bp
        retf
L_d9639:
        push    bp
        mov     bp, sp
        push    si
        push    di
        xor     cx, cx
        mov     dx, 1
        mov     si, word ptr [bp + 6]
        inc     si
        mov     di, 1
        add     di, word ptr [bp + 6]
        add     di, 2
        jmp     L_d9669
L_d9652:
        mov     es, word ptr [bp + 8]
        cmp     byte ptr es:[si], 7bh
        jnz     L_d9666
        cmp     byte ptr es:[di], 7dh
        jnz     L_d9666
        mov     cx, 1
        jmp     L_d966e
L_d9666:
        inc     si
        inc     di
        inc     dx
L_d9669:
        cmp     dx, 0eh
        jl      L_d9652
L_d966e:
        or      cx, cx
        jz      L_d96a7
        mov     bx, dx
        mov     es, word ptr [bp + 8]
        add     bx, word ptr [bp + 6]
        mov     si, bx
        cmp     byte ptr es:[bx + 1], 31h
        jz      L_d968a
        cmp     byte ptr es:[si + 1], 32h
        jnz     L_d96a7
L_d968a:
        les     bx, dword ptr [bp + 6]
        add     bx, dx
        mov     byte ptr es:[bx], 20h
        mov     bx, dx
        add     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 1], 20h
        mov     bx, dx
        add     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 2], 20h
L_d96a7:
        pop     di
        pop     si
        pop     bp
        retf
L_d96ab:
        push    bp
        mov     bp, sp
        sub     sp, 18h
        callf   SEG_B1AA:far_b1af9
        push    25h
        push    3
        push    66h
        callf   SEG_B3B9:far_b3cdb
        add     sp, 6
        push    6
        push    3
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_B52D:far_b6beb
        add     sp, 8
        push    ss
        lea     ax, [bp - 18h]
        push    ax
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B702:far_b90dd
        push    1
        callf   SEG_EBCC:far_ebda4
        add     sp, 2
        mov     word ptr [bp - 2], ax
        callf   SEG_B1AA:far_b1aff
        mov     ax, word ptr [bp - 2]
        leave
        retf
L_d970c:
        push    bp
        mov     bp, sp
        push    si
        xor     cx, cx
        xor     dx, dx
        mov     si, word ptr [bp + 6]
L_d9717:
        mov     es, word ptr [bp + 8]
        cmp     byte ptr es:[si], 2eh
        jz      L_d972b
        cmp     byte ptr es:[si], 20h
        jz      L_d972b
        cmp     cx, 1
        jnz     L_d9735
L_d972b:
        mov     es, word ptr [bp + 8]
        mov     byte ptr es:[si], 20h
        mov     cx, 1
L_d9735:
        inc     si
        inc     dx
        cmp     dx, 10h
        jl      L_d9717
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx + 10h], 0
        pop     si
        pop     bp
        retf
        endif
        db      0ffh
        if      FW_VERSION >= 312
        phase   8
        else
        phase   0eh
        endif
far_d9748:
        mov     ax, word ptr [W_9053]
        mov     word ptr [W_8818], ax
        mov     al, byte ptr [B_9052]
        mov     byte ptr [B_8817], al
        mov     byte ptr [B_D4BE], 50h
        retf
        if      FW_VERSION >= 312
        phase   0ah
        else
        phase   0
        endif
far_d975a:
        test    bx, bx
        jnz     br_d977c
        cmp     cx, dx
        ja      br_d9775
        push    ax
        mov     ax, dx
        sub     dx, dx
        div     cx
        mov     bx, ax
        pop     ax
        div     cx
        mov     cx, dx
        mov     dx, bx
        sub     bx, bx
        retf
br_d9775:
        div     cx
        mov     cx, dx
        mov     dx, bx
        retf
br_d977c:
        push    bp
        push    di
        push    si
        mov     si, cx
        mov     di, bx
        sub     bx, bx
        sub     bp, bp
        mov     cx, 20h
loop_d978a:
        shl     ax, 1
        rcl     dx, 1
        rcl     bp, 1
        rcl     bx, 1
        sub     bp, si
        sbb     bx, di
        js      br_d97ac
loop_d9798:
        inc     ax
        loop    loop_d978a
        jmp     br_d97b2
        db      090h
loop_d979e:
        shl     ax, 1
        rcl     dx, 1
        rcl     bp, 1
        rcl     bx, 1
        add     bp, si
        adc     bx, di
        jns     loop_d9798
br_d97ac:
        loop    loop_d979e
        add     bp, si
        adc     bx, di
br_d97b2:
        mov     cx, bp
        pop     si
        pop     di
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   8
        else
        phase   0eh
        endif
TBL_d97b8:
        dw      tgt_d995b
        dw      tgt_d97e4
        dw      tgt_d995b
        dw      tgt_d97de
        dw      tgt_d987a
        dw      tgt_d98b6
        dw      tgt_d98dd
        dw      tgt_d98d4
        dw      tgt_d98bc
far_d97ca:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp + 6]
        cmp     bx, 9
        jc      br_d97d7
        pop     bp
        retf
br_d97d7:
        shl     bx, 1
        jmp     word ptr cs:[word bx + TBL_d97b8]
tgt_d97de:
        mov     bx, B_8C41
        jmp     br_d97f0
        db      090h
tgt_d97e4:
        mov     bx, B_901B
        cmp     byte ptr [bx], 0
        jge     br_d97f0
        sub     ax, ax
        pop     bp
        retf
br_d97f0:
        push    si
        push    di
        push    word ptr [bx + 14h]
        push    word ptr [bx + 12h]
        lds     di, dword ptr [bp + 8]
        sub     cx, cx
        les     si, dword ptr [bx + 12h]
        call    fn_d995d
loop_d9803:
        mov     word ptr [bx + 12h], si
        mov     word ptr [bx + 14h], dx
        mov     byte ptr [di], al
        inc     di
        inc     cx
        call    fn_d995d
        test    al, 80h
        jnz     br_d9819
        cmp     cx, word ptr [bp + 0ch]
        jc      loop_d9803
br_d9819:
        mov     si, cx
        cmp     byte ptr [bx], 0
        jnz     br_d9823
        jmp     br_d9871
        db      090h
br_d9823:
        test    byte ptr [bx + 1], 80h
        jnz     br_d9830
        cmp     byte ptr [B_8800], 0
        jnz     br_d9871
br_d9830:
        lds     di, dword ptr [bp + 8]
        mov     al, byte ptr [di]
        and     al, 0f8h
        cmp     al, 0a8h
        jnz     br_d985f
        mov     ax, word ptr [di + 1]
        shl     al, 1
        shr     ax, 1
        push    ax
        push    word ptr [bx + 1]
        callf   SEG_E56A:far_e56a0
        add     sp, 2
        pop     ax
        cmp     ax, word ptr [bx + 32h]
        pop     ax
        pop     dx
        jnz     br_d9874
        mov     word ptr [bx + 1ch], dx
        mov     word ptr [bx + 1ah], ax
        jmp     br_d9874
        db      090h
br_d985f:
        cmp     al, 0f8h
        jnz     br_d9871
        xor     ax, ax
        push    ax
        push    word ptr [bx + 1]
        callf   SEG_E56A:far_e56a0
        add     sp, 4
br_d9871:
        add     sp, 4
br_d9874:
        mov     ax, si
        pop     di
        pop     si
        pop     bp
        retf
tgt_d987a:
        push    ds
        push    es
        push    si
        push    di
        mov     ax, SEG_A8EC
        mov     es, ax
        mov     si, 0
        lds     di, dword ptr [bp + 8]
        sub     cx, cx
        cli
        call    fn_d9980
        jnz     br_d98ad
loop_d9891:
        mov     word ptr es:[si + 2], dx
        mov     word ptr es:[si + 6], bx
        sti
        mov     byte ptr [di], al
        inc     di
        inc     cx
        cli
        call    fn_d9980
        jnz     br_d98ad
        test    al, 80h
        jnz     br_d98ad
        cmp     cx, word ptr [bp + 0ch]
        jc      loop_d9891
br_d98ad:
        sti
        mov     ax, cx
        pop     di
        pop     si
        pop     es
        pop     ds
        pop     bp
        retf
tgt_d98b6:
        mov     ax, 6ach
        jmp     br_d98bf
        db      090h
tgt_d98bc:
        mov     ax, 2b36h
br_d98bf:
        push    ds
        push    es
        push    si
        push    di
        mov     si, ax
        mov     ax, SEG_A8EC
        mov     es, ax
        mov     cx, word ptr [bp + 0ch]
        mov     dx, word ptr es:[si + 2]
        jmp     br_d9907
        db      090h
tgt_d98d4:
        mov     ax, 0d31h
        mov     bx, 1
        jmp     br_d98e3
        db      090h
tgt_d98dd:
        mov     ax, 734h
        mov     bx, 0
br_d98e3:
        push    ds
        push    es
        push    si
        push    di
        mov     si, ax
        mov     ax, SEG_A8EC
        mov     es, ax
        cmp     byte ptr [bx + TBL_9784], 0
        mov     cx, word ptr [bp + 0ch]
        mov     dx, word ptr es:[si + 2]
        jnz     br_d9903
        cmp     dx, cx
        jnc     br_d9907
        jmp     br_d9952
        db      090h
br_d9903:
        dec     byte ptr [bx + TBL_9784]
br_d9907:
        or      dx, dx
        jz      br_d9952
        lds     di, dword ptr [bp + 8]
        mov     bx, word ptr es:[si + 6]
        or      bx, bx
        jnz     br_d9919
        mov     bx, word ptr es:[si]
br_d9919:
        dec     bx
        mov     al, byte ptr es:[bx+si + 8]
loop_d991e:
        mov     byte ptr [di], al
        inc     di
        mov     word ptr es:[si + 6], bx
        dec     cx
        dec     word ptr es:[si + 2]
        dec     dx
        jz      br_d9952
        or      bx, bx
        jnz     br_d9934
        mov     bx, word ptr es:[si]
br_d9934:
        dec     bx
        mov     al, byte ptr es:[bx+si + 8]
        or      al, al
        js      br_d9941
        or      cx, cx
        jnz     loop_d991e
br_d9941:
        cmp     al, 0f9h
        jnz     br_d9952
        mov     word ptr es:[si + 6], bx
        dec     word ptr es:[si + 2]
        xor     ax, ax
        jmp     br_d9957
        db      090h
br_d9952:
        mov     ax, word ptr [bp + 0ch]
        sub     ax, cx
br_d9957:
        pop     di
        pop     si
        pop     es
        pop     ds
tgt_d995b:
        pop     bp
        retf
fn_d995d:
        mov     al, byte ptr es:[si]
        mov     dx, es
        inc     si
        jnz     br_d996b
        add     dx, 1000h
        mov     es, dx
br_d996b:
        cmp     dx, word ptr [bx + 8]
        jc      br_d997f
        jnz     br_d9977
        cmp     si, word ptr [bx + 6]
        jc      br_d997f
br_d9977:
        mov     dx, word ptr [bx + 0ch]
        mov     es, dx
        mov     si, word ptr [bx + 0ah]
br_d997f:
        ret
fn_d9980:
        mov     dx, word ptr es:[si + 2]
        or      dx, dx
        jz      br_d999c
        mov     bx, word ptr es:[si + 6]
        or      bx, bx
        jnz     br_d9993
        mov     bx, word ptr es:[si]
br_d9993:
        dec     bx
        mov     al, byte ptr es:[bx+si + 8]
        dec     dx
        xor     ah, ah
        ret
br_d999c:
        mov     ax, 0ffffh
        or      ax, ax
        ret
far_d99a2:
        push    bp
        mov     bp, sp
        push    es
        push    ds
        push    si
        push    di
        lds     bx, dword ptr [bp + 6]
        push    word ptr [bx + 14h]
        push    word ptr [bx + 12h]
        les     si, dword ptr [bx + 12h]
        call    fn_d995d
        sub     cx, cx
        les     di, dword ptr [bp + 0ah]
loop_d99bd:
        mov     word ptr [bx + 12h], si
        mov     word ptr [bx + 14h], dx
        mov     byte ptr es:[di], al
        inc     di
        inc     cx
        push    es
        mov     es, dx
        call    fn_d995d
        pop     es
        test    al, 80h
        jnz     br_d99d8
        cmp     cx, word ptr [bp + 0eh]
        jc      loop_d99bd
br_d99d8:
        pop     word ptr [bx + 12h]
        pop     word ptr [bx + 14h]
        mov     ax, cx
        pop     di
        pop     si
        pop     ds
        pop     es
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   6
        else
        phase   0ch
        endif
far_d99e6:
        push    es
        push    ax
        push    di
        push    dx
        push    bx
        mov     bl, al
        les     di, dword ptr [W_9031]
        call    fn_d9a02
        mov     word ptr [W_9031], di
        mov     word ptr [W_9033], dx
        pop     bx
        pop     dx
        pop     di
        pop     ax
        pop     es
        retf
fn_d9a02:
        push    es
        push    di
        mov     byte ptr es:[di], bl
        mov     dx, es
        inc     di
        jnz     br_d9a12
        add     dx, 1000h
        mov     es, dx
br_d9a12:
        cmp     dx, word ptr [W_9023]
        jc      br_d9a2a
        jnz     br_d9a20
        cmp     di, word ptr [W_9021]
        jc      br_d9a2a
br_d9a20:
        mov     dx, word ptr [W_9027]
        mov     es, dx
        mov     di, word ptr [W_9025]
br_d9a2a:
        cmp     di, word ptr [W_902D]
        jnz     br_d9a3e
        cmp     dx, word ptr [W_902F]
        jnz     br_d9a3e
        pop     di
        pop     es
        mov     dx, es
        xor     ax, ax
        dec     ax
        ret
br_d9a3e:
        add     sp, 4
        xor     ax, ax
        ret
fn_d9a44:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        cmp     ax, word ptr [W_9027]
        jnz     br_d9a69
        cmp     dx, word ptr [W_9025]
        jnz     br_d9a69
        mov     ax, word ptr [W_9023]
        mov     dx, word ptr [W_9021]
        mov     word ptr [bp + 8], ax
        mov     word ptr [bp + 6], dx
br_d9a69:
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     ax, word ptr [bp - 4]
        dec     word ptr [bp - 4]
        or      ax, ax
        jnz     br_d9a84
        sub     word ptr [bp - 2], 1000h
br_d9a84:
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        leave
        retf
fn_d9a8c:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        cmp     byte ptr [B_901B], 0
        jz      br_d9aa1
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_d9aa1:
        mov     ax, word ptr [bp + 0ah]
        dec     ax
        mov     word ptr [bp - 2], ax
        mov     di, word ptr [bp + 6]
        add     di, word ptr [bp - 2]
        jmp     br_d9ad9
loop_d9ab0:
        push    word ptr [W_902F]
        push    word ptr [W_902D]
        push    cs
        call    fn_d9a44
        add     sp, 4
        mov     word ptr [W_902F], dx
        mov     word ptr [W_902D], ax
        les     bx, dword ptr [W_902D]
        push    es
        mov     es, word ptr [bp + 8]
        mov     al, byte ptr es:[di]
        pop     es
        mov     byte ptr es:[bx], al
        dec     di
        dec     word ptr [bp - 2]
br_d9ad9:
        cmp     word ptr [bp - 2], 0
        jge     loop_d9ab0
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        and     ax, 0f8h
        cmp     ax, 0a8h
        jz      br_d9af6
        cmp     ax, 0f8h
        jz      br_d9b3f
        jmp     br_d9b67
br_d9af6:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        shl     ax, 8
        mov     dl, byte ptr es:[bx + 1]
        mov     dh, 0
        shl     dx, 1
        or      ax, dx
        sar     ax, 1
        mov     si, ax
        push    0
        push    0
        push    word ptr [W_902F]
        push    word ptr [W_902D]
        push    ax
        mov     al, byte ptr [B_901C]
        push    ax
        callf   SEG_E56A:far_e56a0
        add     sp, 0ch
        cmp     si, word ptr [W_904D]
        jnz     br_d9b67
        mov     ax, word ptr [W_902F]
        mov     dx, word ptr [W_902D]
        mov     word ptr [W_9037], ax
        mov     word ptr [W_9035], dx
        jmp     br_d9b67
br_d9b3f:
        push    0
        push    0
        push    word ptr [W_902F]
        push    word ptr [W_902D]
        push    0
        mov     al, byte ptr [B_901C]
        push    ax
        callf   SEG_E56A:far_e56a0
        add     sp, 0ch
        mov     ax, word ptr [W_902F]
        mov     dx, word ptr [W_902D]
        mov     word ptr [W_902B], ax
        mov     word ptr [W_9029], dx
br_d9b67:
        mov     ax, word ptr [bp + 0ah]
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   0eh
        elseif  FW_VERSION = 311
        phase   4
        else
L_e2574:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        push    di
        cmp     byte ptr [B_901B], 0
        jz      L_e2589
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
L_e2589:
        xor     si, si
        mov     di, word ptr [bp + 6]
        cmp     si, word ptr [bp + 0ah]
        jge     L_e25ca
L_e2593:
        push    word ptr [W_9033]
        push    word ptr [W_9031]
        push    cs
        call    fn_d9a44
        add     sp, 4
        mov     word ptr [W_9033], dx
        mov     word ptr [W_9031], ax
        les     bx, dword ptr [W_9031]
        mov     al, byte ptr es:[bx]
        mov     es, word ptr [bp + 8]
        mov     byte ptr es:[di], al
        inc     di
        mov     ax, si
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, ax
        test    byte ptr es:[bx], 80h
        jnz     L_e25ca
        cmp     si, word ptr [bp + 0ah]
        jl      L_e2593
L_e25ca:
        mov     word ptr [bp - 2], si
        xor     si, si
        mov     di, word ptr [bp + 6]
        mov     cx, word ptr [bp + 6]
        mov     ax, word ptr [bp - 2]
        dec     ax
        add     cx, ax
        jmp     L_e25f1
L_e25dd:
        mov     es, word ptr [bp + 8]
        mov     dl, byte ptr es:[di]
        mov     bx, cx
        mov     al, byte ptr es:[bx]
        mov     byte ptr es:[di], al
        mov     byte ptr es:[bx], dl
        inc     di
        dec     cx
        inc     si
L_e25f1:
        mov     ax, word ptr [bp - 2]
        cwd
        sub     ax, dx
        sar     ax, 1
        cmp     ax, si
        jg      L_e25dd
        mov     ax, word ptr [bp - 2]
        pop     di
        pop     si
        leave
        retf
        phase   4
        endif
far_d9b6e:
        push    bp
        mov     bp, sp
        push    ds
        push    es
        push    si
        push    di
        mov     ax, word ptr [bp + 0ch]
        cmp     byte ptr [bp + 6], 8
        jz      br_d9b9a
        cmp     byte ptr [B_901B], 0
        jnz     br_d9b91
        cmp     byte ptr [bp + 6], 1
        jz      br_d9bdc
        cmp     byte ptr [bp + 6], 4
        jz      br_d9b94
br_d9b91:
        jmp     br_d9cad
br_d9b94:
        mov     di, 0
        jmp     br_d9b9d
        db      090h
br_d9b9a:
        mov     di, 2b36h
br_d9b9d:
        mov     ax, SEG_A8EC
        mov     es, ax
        lds     si, dword ptr [bp + 8]
        mov     cx, word ptr [bp + 0ch]
        mov     dx, word ptr es:[di]
        mov     bx, word ptr es:[di + 2]
        add     bx, cx
        cmp     bx, dx
        jbe     br_d9bba
        sub     ax, ax
        jmp     br_d9cad
br_d9bba:
        mov     word ptr es:[di + 2], bx
        mov     bx, word ptr es:[di + 4]
loop_d9bc2:
        mov     al, byte ptr [si]
        inc     si
        or      bx, bx
        jnz     br_d9bcb
        mov     bx, dx
br_d9bcb:
        dec     bx
        mov     byte ptr es:[bx+di + 8], al
        loop    loop_d9bc2
        mov     word ptr es:[di + 4], bx
        mov     ax, word ptr [bp + 0ch]
        jmp     br_d9cad
br_d9bdc:
        les     si, dword ptr [bp + 8]
        mov     al, byte ptr es:[si]
        and     al, 0f8h
        cmp     al, 0a8h
        jnz     br_d9c20
        mov     ax, word ptr es:[si + 1]
        shl     al, 1
        shr     ax, 1
        push    word ptr [W_9033]
        push    word ptr [W_9031]
        push    ax
        push    word ptr [B_901C]
        callf   SEG_E56A:far_e56a0
        add     sp, 2
        pop     ax
        cmp     ax, word ptr [W_904D]
        jnz     br_d9c1a
        mov     dx, word ptr [W_9033]
        mov     ax, word ptr [W_9031]
        mov     word ptr [W_9037], dx
        mov     word ptr [W_9035], ax
br_d9c1a:
        add     sp, 4
        jmp     br_d9c3b
        db      090h
br_d9c20:
        cmp     al, 0f8h
        jnz     br_d9c3b
        push    word ptr [W_9033]
        push    word ptr [W_9031]
        sub     ax, ax
        push    ax
        push    word ptr [B_901C]
        callf   SEG_E56A:far_e56a0
        add     sp, 8
br_d9c3b:
        push    es
        mov     cx, word ptr [bp + 0ch]
        les     di, dword ptr [W_9031]
        pop     ds
loop_d9c44:
        mov     bl, byte ptr [si]
        inc     si
        mov     byte ptr es:[di], bl
        mov     dx, es
        inc     di
        jnz     br_d9c55
        add     dx, 1000h
        mov     es, dx
br_d9c55:
        push    ds
        mov     ax, 8010h
        mov     ds, ax
        cmp     dx, word ptr [W_9023]
        jc      br_d9c73
        jnz     br_d9c69
        cmp     di, word ptr [W_9021]
        jc      br_d9c73
br_d9c69:
        mov     dx, word ptr [W_9027]
        mov     es, dx
        mov     di, word ptr [W_9025]
br_d9c73:
        cmp     di, word ptr [W_902D]
        jnz     br_d9c8a
        cmp     dx, word ptr [W_902F]
        jnz     br_d9c8a
        or      byte ptr [B_9457], 4
        sub     ax, ax
        pop     ds
        jmp     br_d9cad
        db      090h
br_d9c8a:
        pop     ds
        loop    loop_d9c44
        les     si, dword ptr [bp + 8]
        cmp     byte ptr [si], 0ffh
        mov     ax, 8010h
        mov     ds, ax
        jnz     br_d9ca2
        mov     word ptr [W_9029], di
        mov     word ptr [W_902B], dx
br_d9ca2:
        mov     word ptr [W_9031], di
        mov     word ptr [W_9033], dx
        mov     ax, word ptr [bp + 0ch]
br_d9cad:
        pop     di
        pop     si
        pop     es
        pop     ds
        pop     bp
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   4
        else
        phase   0ah
        endif
far_d9cb4:
        push    bp
        mov     bp, sp
        mov     ax, 1fh
        out     60h, ax
        mov     ax, word ptr [W_71A8]
        out     66h, ax
        mov     ax, word ptr [W_71AA]
        out     64h, ax
        mov     ax, word ptr [W_71AC]
        out     62h, ax
        mov     ax, 11fh
        out     60h, ax
        mov     ax, word ptr [W_71B2]
        out     66h, ax
        mov     ax, word ptr [W_71B4]
        out     64h, ax
        mov     ax, 1000h
        out     62h, ax
        mov     ax, 21fh
        out     60h, ax
        mov     ax, word ptr [W_71AE]
        out     64h, ax
        mov     ax, word ptr [W_71B0]
        out     62h, ax
        mov     ax, 41fh
        out     60h, ax
        mov     ax, 0ffffh
        out     64h, ax
        mov     ax, 2e1h
        out     62h, ax
        mov     ax, 61fh
        out     60h, ax
        mov     ax, 7ff0h
        out     64h, ax
        mov     ax, 147h
        out     62h, ax
        mov     ax, 51fh
        out     60h, ax
        mov     ax, 3fffh
        out     64h, ax
        mov     ax, 0ffffh
        out     62h, ax
        mov     ax, 31fh
        out     60h, ax
        mov     ax, 0
        out     64h, ax
        mov     ax, 0
        out     62h, ax
        mov     ax, 71fh
        out     60h, ax
        mov     ax, 0
        out     64h, ax
        cmp     word ptr [bp + 6], 2
        jnz     br_d9d42
        mov     ax, 5000h
        out     62h, ax
        jmp     br_d9d47
        db      090h
br_d9d42:
        mov     ax, 5050h
        out     62h, ax
br_d9d47:
        cmp     word ptr [bp + 6], 2
        jz      br_d9d50
        jmp     near br_d9e09
br_d9d50:
        mov     ax, 1fh
        out     60h, ax
        mov     ax, word ptr [W_71B6]
        out     66h, ax
        mov     ax, word ptr [W_71B8]
        out     64h, ax
        mov     ax, word ptr [W_71BA]
        out     62h, ax
        mov     ax, 11fh
        out     60h, ax
        mov     ax, word ptr [W_71C0]
        out     66h, ax
        mov     ax, word ptr [W_71C2]
        out     64h, ax
        mov     ax, 1000h
        out     62h, ax
        mov     ax, 21fh
        out     60h, ax
        mov     ax, word ptr [W_71BC]
        out     64h, ax
        mov     ax, word ptr [W_71BE]
        out     62h, ax
        mov     ax, 3
        out     60h, ax
        mov     ax, word ptr [W_71C4]
        out     66h, ax
        mov     ax, word ptr [W_71C6]
        out     64h, ax
        mov     ax, word ptr [W_71C8]
        out     62h, ax
        mov     ax, 103h
        out     60h, ax
        mov     ax, word ptr [W_71CE]
        out     66h, ax
        mov     ax, word ptr [W_71D0]
        out     64h, ax
        mov     ax, 1000h
        out     62h, ax
        mov     ax, 203h
        out     60h, ax
        mov     ax, word ptr [W_71CA]
        out     64h, ax
        mov     ax, word ptr [W_71CC]
        out     62h, ax
        mov     ax, 403h
        out     60h, ax
        mov     ax, 0ffffh
        out     64h, ax
        mov     ax, 2e1h
        out     62h, ax
        mov     ax, 603h
        out     60h, ax
        mov     ax, 7ff0h
        out     64h, ax
        mov     ax, 147h
        out     62h, ax
        mov     ax, 503h
        out     60h, ax
        mov     ax, 3fffh
        out     64h, ax
        mov     ax, 0ffffh
        out     62h, ax
        mov     ax, 703h
        out     60h, ax
        mov     ax, 50h
        out     62h, ax
        mov     ax, 0
        out     64h, ax
        mov     ax, 303h
        out     60h, ax
        mov     ax, 0
        out     64h, ax
        mov     ax, 0
        out     62h, ax
br_d9e09:
        in      al, 68h
        mov     ah, 1
        and     ax, 0ff7fh
        out     68h, ax
loop_d9e12:
        in      al, 68h
        test    al, 80h
        jnz     loop_d9e12
        pop     bp
        retf
far_d9e1a:
        callf   SEG_C2E5:far_c46ab
        mov     ax, 0
        out     68h, ax
        mov     cl, 0ch
        call    fn_da207
        in      al, 0fch
        and     al, 0cfh
        or      al, 80h
        out     0fch, al
        in      al, 80h
        and     al, 0f9h
        out     80h, al
        if      FW_VERSION >= 311
        mov     ax, 21fh
        out     60h, ax
        mov     ax, 0ffffh
        out     64h, ax
        mov     ax, 0ffffh
        out     62h, ax
        mov     ax, 203h
        out     60h, ax
        mov     ax, 0ffffh
        out     64h, ax
        mov     ax, 0ffffh
        out     62h, ax
        callf   SEG_CDCC:far_cdcc2
        endif
        retf
far_d9e5b:
        mov     ax, 0
        out     60h, ax
        in      ax, 64h
        mov     dx, ax
        in      ax, 66h
        mov     bx, ax
        in      ax, 62h
        mov     cx, 0ch
loop_d9e6d:
        clc
        rcr     dx, 1
        rcr     ax, 1
        loop    loop_d9e6d
        mov     cl, 4
        shl     bl, cl
        or      dl, bl
        retf
far_d9e7b:
        push    bp
        mov     bp, sp
        les     bx, dword ptr [bp + 6]
        mov     ax, es
        mov     cx, 4
        shl     ax, cl
        mov     dx, es
        mov     cx, 0ch
        shr     dx, cl
        add     bx, ax
        adc     dx, 0
        mov     word ptr [W_71A2], bx
        mov     word ptr [W_71A4], dx
        mov     ax, word ptr [bp + 0ah]
        shr     ax, 1
        dec     ax
        mov     word ptr [W_71A6], ax
        pop     bp
        retf
far_d9ea7:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 0eh]
        mov     dx, word ptr [bp + 10h]
        and     dx, 1ffh
        ror     ax, 4
        push    ax
        and     ax, 0f000h
        mov     word ptr [W_71D2], ax
        pop     ax
        and     ax, 0fffh
        ror     dx, 4
        or      ah, dh
        mov     word ptr [W_71D4], ax
        xchg    dx, ax
        cbw
        mov     word ptr [W_71D6], ax
        mov     ax, word ptr [W_71D6]
        or      ax, 100h
        mov     word ptr [W_71A8], ax
        mov     ax, word ptr [W_71D4]
        mov     word ptr [W_71AA], ax
        mov     word ptr [W_71AE], ax
        mov     ax, word ptr [W_71D2]
        mov     word ptr [W_71AC], ax
        or      ax, word ptr [W_71D6]
        mov     word ptr [W_71B0], ax
        mov     ax, word ptr [bp + 6]
        mov     dx, word ptr [bp + 8]
        and     dx, 1ffh
        ror     ax, 4
        push    ax
        and     ax, 0f000h
        mov     word ptr [W_71D2], ax
        pop     ax
        and     ax, 0fffh
        ror     dx, 4
        or      ah, dh
        mov     word ptr [W_71D4], ax
        xchg    dx, ax
        cbw
        mov     word ptr [W_71D6], ax
        mov     ax, word ptr [W_71D6]
        or      ax, 100h
        mov     word ptr [W_71B6], ax
        mov     ax, word ptr [W_71D4]
        mov     word ptr [W_71B8], ax
        mov     word ptr [W_71BC], ax
        mov     ax, word ptr [W_71D2]
        mov     word ptr [W_71BA], ax
        or      ax, word ptr [W_71D6]
        mov     word ptr [W_71BE], ax
        mov     ax, word ptr [bp + 6]
        mov     dx, word ptr [bp + 8]
        mov     bx, word ptr [bp + 12h]
        mov     cx, word ptr [bp + 14h]
        shl     bx, 1
        rcl     cx, 1
        add     ax, bx
        adc     dx, cx
        mov     cx, 4
loop_d9f49:
        clc
        rcr     dx, 1
        rcr     ax, 1
        loop    loop_d9f49
        or      dx, 110h
        mov     word ptr [W_71B2], dx
        mov     word ptr [W_71B4], ax
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 0ch]
        add     ax, word ptr [bp + 12h]
        adc     dx, word ptr [bp + 14h]
        mov     cx, 4
loop_d9f6a:
        clc
        rcr     dx, 1
        rcr     ax, 1
        loop    loop_d9f6a
        or      dx, 110h
        mov     word ptr [W_71CE], dx
        mov     word ptr [W_71D0], ax
        mov     ax, word ptr [bp + 0ah]
        mov     dx, word ptr [bp + 0ch]
        and     dx, 1ffh
        ror     ax, 4
        push    ax
        and     ax, 0f000h
        mov     word ptr [W_71D2], ax
        pop     ax
        and     ax, 0fffh
        ror     dx, 4
        or      ah, dh
        mov     word ptr [W_71D4], ax
        xchg    dx, ax
        cbw
        mov     word ptr [W_71D6], ax
        mov     ax, word ptr [W_71D6]
        and     ax, 0fh
        or      ax, 100h
        mov     word ptr [W_71C4], ax
        mov     ax, word ptr [W_71D4]
        mov     word ptr [W_71C6], ax
        mov     word ptr [W_71CA], ax
        mov     ax, word ptr [W_71D2]
        mov     word ptr [W_71C8], ax
        or      ax, word ptr [W_71D6]
        mov     word ptr [W_71CC], ax
        mov     ax, word ptr [bp + 6]
        mov     dx, word ptr [bp + 8]
        add     ax, word ptr [bp + 12h]
        adc     dx, word ptr [bp + 14h]
        mov     cx, 4
loop_d9fd2:
        clc
        rcr     dx, 1
        rcr     ax, 1
        loop    loop_d9fd2
        or      dx, 110h
        mov     word ptr [W_71C2], ax
        mov     word ptr [W_71C0], dx
        pop     bp
        retf
far_d9fe6:
        push    bp
        mov     bp, sp
        mov     dx, 0c001h
        mov     al, 3
        out     dx, al
        mov     ax, word ptr [W_71A2]
        mov     dx, 0c004h
        out     dx, ax
        mov     ax, word ptr [W_71A4]
        or      al, 30h
        mov     dx, 0c006h
        out     dx, al
        mov     ax, word ptr [W_71A6]
        mov     dx, 0c002h
        out     dx, ax
        mov     dx, 0c00ah
        mov     al, 59h
        out     dx, al
        mov     cl, 0f7h
        call    fn_da222
        cmp     word ptr [bp + 6], 2
        jz      br_da060
        mov     ax, 0
        out     60h, ax
        mov     ax, word ptr [W_71A8]
        out     66h, ax
        mov     ax, word ptr [W_71AA]
        out     64h, ax
        mov     ax, word ptr [W_71AC]
        out     62h, ax
        mov     ax, 100h
        out     60h, ax
        mov     ax, word ptr [W_71B2]
        out     66h, ax
        mov     ax, word ptr [W_71B4]
        out     64h, ax
        mov     ax, 1000h
        out     62h, ax
        mov     ax, 200h
        out     60h, ax
        mov     ax, word ptr [W_71AE]
        out     64h, ax
        mov     ax, word ptr [W_71B0]
        out     62h, ax
        mov     ax, 700h
        out     60h, ax
        mov     ax, 0
        out     6ch, ax
        mov     ax, 40h
        out     68h, ax
        jmp     near loop_da0e7
br_da060:
        mov     ax, 0
        out     60h, ax
        mov     ax, word ptr [W_71B6]
        out     66h, ax
        mov     ax, word ptr [W_71B8]
        out     64h, ax
        mov     ax, word ptr [W_71BA]
        out     62h, ax
        mov     ax, 100h
        out     60h, ax
        mov     ax, word ptr [W_71C0]
        out     66h, ax
        mov     ax, word ptr [W_71C2]
        out     64h, ax
        mov     ax, 1000h
        out     62h, ax
        mov     ax, 200h
        out     60h, ax
        mov     ax, word ptr [W_71BC]
        out     64h, ax
        mov     ax, word ptr [W_71BE]
        out     62h, ax
        mov     ax, 700h
        out     60h, ax
        mov     ax, 0
        out     6ch, ax
        mov     ax, 10h
        out     60h, ax
        mov     ax, word ptr [W_71C4]
        out     66h, ax
        mov     ax, word ptr [W_71C6]
        out     64h, ax
        mov     ax, word ptr [W_71C8]
        out     62h, ax
        mov     ax, 110h
        out     60h, ax
        mov     ax, word ptr [W_71CE]
        out     66h, ax
        mov     ax, word ptr [W_71D0]
        out     64h, ax
        mov     ax, 1000h
        out     62h, ax
        mov     ax, 210h
        out     60h, ax
        mov     ax, word ptr [W_71CA]
        out     64h, ax
        mov     ax, word ptr [W_71CC]
        out     62h, ax
        mov     ax, 710h
        out     60h, ax
        mov     ax, 0
        out     6ch, ax
        mov     ax, 58h
        out     68h, ax
loop_da0e7:
        in      al, 68h
        test    al, 80h
        jnz     loop_da0e7
        pop     bp
        retf
fn_da0ef:
        push    bx
        push    dx
        mov     bx, word ptr [W_D4B2]
loop_da0f5:
        mov     dx, word ptr [W_D4B2]
        sub     dx, bx
        cmp     dx, ax
        jle     loop_da0f5
        pop     dx
        pop     bx
        ret
far_da102:
        push    bp
        mov     bp, sp
        mov     ax, 0
        out     68h, ax
        mov     cl, 0ch
        call    fn_da207
        in      al, 0fch
        and     al, 0cfh
        out     0fch, al
        cmp     word ptr [bp + 6], 0
        jz      br_da199
        in      al, 80h
        and     al, 60h
        cmp     al, 40h
        jz      br_da143
        mov     al, 30h
        out     80h, al
        mov     ax, 2
        call    fn_da0ef
        mov     al, 70h
        out     80h, al
        mov     ax, 5
        call    fn_da0ef
        in      al, 84h
        test    al, 40h
        jz      br_da143
        mov     ax, 1
        jmp     near br_da205
br_da143:
        mov     dx, 0c001h
        mov     al, 2
        out     dx, al
        mov     ax, word ptr [W_71A2]
        mov     dx, 0c004h
        out     dx, ax
        mov     ax, word ptr [W_71A4]
        or      al, 30h
        mov     dx, 0c006h
        out     dx, al
        mov     ax, word ptr [W_71A6]
        mov     dx, 0c002h
        out     dx, ax
        mov     dx, 0c00ah
        mov     al, 55h
        out     dx, al
        mov     cl, 0fbh
        call    fn_da222
        in      al, 80h
        and     al, 0f9h
        cmp     word ptr [bp + 8], 0
        jnz     br_da17a
        or      al, 2
        jmp     br_da187
        db      090h
br_da17a:
        cmp     word ptr [bp + 8], 1
        jnz     br_da185
        or      al, 4
        jmp     br_da187
        db      090h
br_da185:
        or      al, 6
br_da187:
        out     80h, al
        and     al, 9fh
        or      al, 40h
        out     80h, al
        callf   SEG_C2E5:far_c46ab
        sub     ax, ax
        jmp     br_da205
        db      090h
br_da199:
        in      al, 0fch
        and     al, 0cfh
        or      al, 80h
        out     0fch, al
        in      al, 0fah
        and     al, 0efh
        out     0fah, al
        in      al, 0fch
        and     al, 4fh
        out     0fch, al
        mov     al, 0
        out     80h, al
        mov     ax, 0ah
        call    fn_da0ef
        in      al, 0fah
        and     al, 0efh
        out     0fah, al
        in      al, 0fch
        cmp     word ptr [bp + 8], 0
        jnz     br_da1ca
        or      al, 10h
        jmp     br_da1d7
        db      090h
br_da1ca:
        cmp     word ptr [bp + 8], 1
        jnz     br_da1d5
        or      al, 20h
        jmp     br_da1d7
        db      090h
br_da1d5:
        or      al, 30h
br_da1d7:
        or      al, 40h
        out     0fch, al
        mov     dx, 0c001h
        mov     al, 2
        out     dx, al
        mov     ax, word ptr [W_71A2]
        mov     dx, 0c004h
        out     dx, ax
        mov     ax, word ptr [W_71A4]
        or      al, 30h
        mov     dx, 0c006h
        out     dx, al
        mov     ax, word ptr [W_71A6]
        mov     dx, 0c002h
        out     dx, ax
        mov     dx, 0c00ah
        mov     al, 55h
        out     dx, al
        mov     cl, 0fbh
        call    fn_da222
        sub     ax, ax
br_da205:
        pop     bp
        retf
fn_da207:
        mov     dx, 0c008h
        mov     bx, 0c00fh
        mov     ax, 14h
        mov     ch, 10h
        pushf
        cli
        out     dx, ax
        xchg    bx, dx
        in      al, dx
        or      al, cl
        out     dx, al
        xchg    dx, bx
        mov     al, ch
        out     dx, ax
        popf
        ret
fn_da222:
        mov     dx, 0c008h
        mov     bx, 0c00fh
        mov     ax, 14h
        mov     ch, 10h
        pushf
        cli
        out     dx, ax
        xchg    bx, dx
        in      al, dx
        and     al, cl
        out     dx, al
        xchg    dx, bx
        mov     al, ch
        out     dx, ax
        popf
        ret
        if      FW_VERSION >= 312
        db      0ffh
        phase   0eh
        elseif  FW_VERSION = 311
        db      0ffh
        phase   4
        else
        phase   0
        endif
far_da23e:
        push    bp
        mov     bp, sp
        cld
        jmp     br_da249
        db      090h
far_da245:
        push    bp
        mov     bp, sp
        std
br_da249:
        push    di
        push    si
        push    ds
        push    es
        mov     cx, word ptr [bp + 0eh]
        les     di, dword ptr [bp + 0ah]
        lds     si, dword ptr [bp + 6]
        rep movsb
        cld
        pop     es
        pop     ds
        pop     si
        pop     di
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   0fh
        elseif  FW_VERSION = 311
        phase   5
        else
        phase   1
        endif
far_da25f:
        push    bp
        mov     bp, sp
        sub     sp, 4
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0fff0h
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DA9B:far_daa59
        add     sp, 4
        mov     word ptr [bp + 8], dx
        mov     word ptr [bp + 6], ax
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        callf   SEG_DA9B:far_daa59
        add     sp, 4
        mov     word ptr [bp + 0ch], dx
        mov     word ptr [bp + 0ah], ax
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        cmp     ax, word ptr [bp + 0ch]
        jbe     br_da2a5
        jmp     br_da3e7
br_da2a5:
        jc      br_da2af
        cmp     dx, word ptr [bp + 0ah]
        jc      br_da2af
        jmp     br_da3e7
br_da2af:
        add     word ptr [bp + 6], 0fff0h
        adc     word ptr [bp + 8], 0f001h
        add     word ptr [bp + 0ah], 0fff0h
        adc     word ptr [bp + 0ch], 0f001h
        jmp     near br_da359
br_da2c4:
        mov     ax, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        cmp     ax, word ptr [bp - 2]
        jg      br_da2e2
        jl      br_da2d6
        cmp     dx, word ptr [bp - 4]
        jnc     br_da2e2
br_da2d6:
        mov     ax, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
br_da2e2:
        push    word ptr [bp - 4]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DA23:far_da245
        add     sp, 0ah
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        neg     ax
        neg     dx
        sbb     ax, 0
        push    ax
        push    dx
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DA9B:far_da9b8
        add     sp, 8
        add     ax, 0fff0h
        adc     dx, 0f001h
        mov     word ptr [bp + 8], dx
        mov     word ptr [bp + 6], ax
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        neg     ax
        neg     dx
        sbb     ax, 0
        push    ax
        push    dx
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        callf   SEG_DA9B:far_da9b8
        add     sp, 8
        add     ax, 0fff0h
        adc     dx, 0f001h
        mov     word ptr [bp + 0ch], dx
        mov     word ptr [bp + 0ah], ax
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        sub     word ptr [bp + 0eh], dx
        sbb     word ptr [bp + 10h], ax
br_da359:
        cmp     word ptr [bp + 10h], 0
        jle     br_da362
        jmp     near br_da2c4
br_da362:
        jz      br_da367
        jmp     near br_da3f8
br_da367:
        cmp     word ptr [bp + 0eh], 0
        jbe     br_da370
        jmp     near br_da2c4
br_da370:
        leave
        retf
loop_da372:
        mov     ax, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        cmp     ax, word ptr [bp - 2]
        jg      br_da390
        jl      br_da384
        cmp     dx, word ptr [bp - 4]
        jnc     br_da390
br_da384:
        mov     ax, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
br_da390:
        push    word ptr [bp - 4]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DA23:far_da23e
        add     sp, 0ah
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DA9B:far_da9b8
        add     sp, 8
        mov     word ptr [bp + 8], dx
        mov     word ptr [bp + 6], ax
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        callf   SEG_DA9B:far_da9b8
        add     sp, 8
        mov     word ptr [bp + 0ch], dx
        mov     word ptr [bp + 0ah], ax
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        sub     word ptr [bp + 0eh], dx
        sbb     word ptr [bp + 10h], ax
br_da3e7:
        cmp     word ptr [bp + 10h], 0
        jg      loop_da372
        jnz     br_da3f8
        cmp     word ptr [bp + 0eh], 0
        jbe     br_da3f8
        jmp     near loop_da372
br_da3f8:
        leave
        retf
        if      FW_VERSION >= 312
        phase   0ah
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   0ch
        endif
far_da3fa:
        push    bp
        mov     bp, sp
        pop     bp
        retf
far_da3ff:
        push    bp
        mov     bp, sp
        push    di
        les     di, dword ptr [bp + 6]
        xor     ax, ax
        mov     ah, al
        mov     cx, 3
        rep stosw
        if      FW_VERSION >= 311
        stosb
        endif
        pop     di
        pop     bp
        retf
far_da413:
        push    bp
        mov     bp, sp
        mov     cl, byte ptr [bp + 0ah]
        mov     dx, 1
        les     bx, dword ptr [bp + 6]
        mov     bl, byte ptr es:[bx + 1]
        test    cl, 80h
        jz      br_da42b
        inc     dx
        mov     bl, cl
br_da42b:
        mov     al, bl
        mov     ah, 0
        and     ax, 60h
        cmp     ax, 40h
        jz      br_da438
        inc     dx
br_da438:
        mov     ax, dx
        pop     bp
        retf
far_da43c:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [bp - 4]
        test    byte ptr es:[bx], 80h
        jz      br_da46a
        mov     al, byte ptr es:[bx]
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], al
        mov     byte ptr es:[bx + 1], al
        inc     word ptr [bp - 4]
        jmp     br_da474
br_da46a:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 1]
        mov     byte ptr es:[bx], al
br_da474:
        les     bx, dword ptr [bp + 6]
        push    es
        les     si, dword ptr [bp - 4]
        mov     al, byte ptr es:[si]
        pop     es
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 3], al
        else
        mov     byte ptr es:[bx + 2], al
        endif
        inc     word ptr [bp - 4]
        mov     es, word ptr [bp + 8]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        and     ax, 60h
        cmp     ax, 40h
        jz      br_da4ad
        if      FW_VERSION >= 311
        mov     word ptr es:[bx + 5], 2
        else
        mov     word ptr es:[bx + 4], 2
        endif
        push    es
        les     si, dword ptr [bp - 4]
        mov     al, byte ptr es:[si]
        pop     es
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 4], al
        else
        mov     byte ptr es:[bx + 3], al
        endif
        inc     word ptr [bp - 4]
        jmp     br_da4b6
br_da4ad:
        les     bx, dword ptr [bp + 6]
        if      FW_VERSION >= 311
        mov     word ptr es:[bx + 5], 1
        else
        mov     word ptr es:[bx + 4], 1
        endif
br_da4b6:
        mov     ax, word ptr [bp - 4]
        xor     dx, dx
        sub     ax, word ptr [bp + 0ah]
        sbb     dx, 0
        pop     si
        leave
        retf
far_da4c4:
        push    bp
        mov     bp, sp
        push    si
        mov     dl, byte ptr [bp + 0ah]
        or      dl, dl
        jz      br_da4e2
        les     bx, dword ptr [bp + 6]
        push    es
        mov     si, word ptr [bp + 6]
        mov     al, dl
        mov     byte ptr es:[si], al
        pop     es
        mov     byte ptr es:[bx + 1], al
        jmp     br_da4ec
br_da4e2:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 1]
        mov     byte ptr es:[bx], al
br_da4ec:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr [bp + 0ch]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 3], al
        else
        mov     byte ptr es:[bx + 2], al
        endif
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        and     ax, 60h
        cmp     ax, 40h
        jz      br_da513
        if      FW_VERSION >= 311
        mov     word ptr es:[bx + 5], 2
        else
        mov     word ptr es:[bx + 4], 2
        endif
        mov     al, byte ptr [bp + 0eh]
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 4], al
        else
        mov     byte ptr es:[bx + 3], al
        endif
        pop     si
        pop     bp
        retf
br_da513:
        les     bx, dword ptr [bp + 6]
        if      FW_VERSION >= 311
        mov     word ptr es:[bx + 5], 1
        else
        mov     word ptr es:[bx + 4], 1
        endif
        pop     si
        pop     bp
        retf
far_da51f:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        les     bx, dword ptr [bp + 6]
        if      FW_VERSION >= 311
        mov     al, byte ptr es:[bx + 2]
        else
        mov     al, byte ptr es:[bx + 1]
        endif
        cmp     al, byte ptr es:[bx]
        jz      br_da556
        mov     al, byte ptr es:[bx]
        les     bx, dword ptr [bp + 0ah]
        mov     byte ptr es:[bx], al
        inc     word ptr [bp - 4]
        if      FW_VERSION < 311
br_da556:
        endif
        les     bx, dword ptr [bp + 6]
        push    es
        mov     si, word ptr [bp + 6]
        if      FW_VERSION < 311
        mov     al, byte ptr es:[si]
        endif
        pop     es
        if      FW_VERSION >= 311
        mov     byte ptr es:[bx + 2], al
br_da556:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 3]
        else
        mov     byte ptr es:[bx + 1], al
        mov     es, word ptr [bp + 8]
        mov     al, byte ptr es:[bx + 2]
        endif
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx], al
        inc     word ptr [bp - 4]
        les     bx, dword ptr [bp + 6]
        if      FW_VERSION >= 311
        cmp     word ptr es:[bx + 5], 2
        else
        cmp     word ptr es:[bx + 4], 2
        endif
        jnz     br_da57d
        if      FW_VERSION >= 311
        mov     al, byte ptr es:[bx + 4]
        else
        mov     al, byte ptr es:[bx + 3]
        endif
        les     bx, dword ptr [bp - 4]
        mov     byte ptr es:[bx], al
        inc     word ptr [bp - 4]
br_da57d:
        mov     ax, word ptr [bp - 4]
        xor     dx, dx
        sub     ax, word ptr [bp + 0ah]
        sbb     dx, 0
        pop     si
        leave
        retf
far_da58b:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        push    si
        endif
        les     bx, dword ptr [bp + 6]
        if      FW_VERSION >= 311
        push    es
        mov     si, word ptr [bp + 6]
        mov     al, byte ptr es:[si]
        pop     es
        mov     byte ptr es:[bx + 2], al
        else
        mov     al, byte ptr es:[bx]
        endif
        les     bx, dword ptr [bp + 0ah]
        mov     byte ptr es:[bx], al
        les     bx, dword ptr [bp + 6]
        if      FW_VERSION >= 311
        mov     al, byte ptr es:[bx + 3]
        else
        mov     al, byte ptr es:[bx + 2]
        endif
        les     bx, dword ptr [bp + 0eh]
        mov     byte ptr es:[bx], al
        les     bx, dword ptr [bp + 6]
        if      FW_VERSION >= 311
        cmp     word ptr es:[bx + 5], 2
        else
        cmp     word ptr es:[bx + 4], 2
        endif
        jnz     br_da5c7
        if      FW_VERSION >= 311
        mov     al, byte ptr es:[bx + 4]
        else
        mov     al, byte ptr es:[bx + 3]
        endif
        les     bx, dword ptr [bp + 12h]
        mov     byte ptr es:[bx], al
        jmp     br_da5ce
br_da5c7:
        les     bx, dword ptr [bp + 12h]
        mov     byte ptr es:[bx], 0
br_da5ce:
        les     bx, dword ptr [bp + 6]
        if      FW_VERSION >= 311
        mov     ax, word ptr es:[bx + 5]
        pop     si
        else
        mov     ax, word ptr es:[bx + 4]
        endif
        pop     bp
        retf
        if      FW_VERSION >= 311
far_da5d8:
        else
        phase   1
L_e3041:
        endif
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 312
        les     bx, dword ptr [bp + 6]
        mov     dl, byte ptr es:[bx]
        and     dl, 0f0h
        cmp     dl, 80h
        jz      br_da5f5
        cmp     dl, 90h
        jnz     br_da5fa
        cmp     byte ptr es:[bx + 4], 0
        jnz     br_da5fa
br_da5f5:
        mov     ax, 1
        pop     bp
        retf
br_da5fa:
        xor     ax, ax
        pop     bp
        retf
        phase   0eh
far_da5fe:
        push    bp
        mov     bp, sp
        sub     sp, 2
        elseif  FW_VERSION = 311
        les     bx, dword ptr [bp + 6]
        mov     dl, byte ptr es:[bx]
        and     dl, 0f0h
        cmp     dl, 80h
        jz      br_da5f5
        cmp     dl, 90h
        jnz     br_da5fa
        cmp     byte ptr es:[bx + 4], 0
        jnz     br_da5fa
br_da5f5:
        mov     ax, 1
        pop     bp
        retf
br_da5fa:
        xor     ax, ax
        pop     bp
        retf
        phase   4
far_da5fe:
        push    bp
        mov     bp, sp
        sub     sp, 2
        endif
        push    word ptr [bp + 6]
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], ax
        cmp     ax, 23h
        jl      br_da629
        endif
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bl, byte ptr [bp + 8]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx], al
        if      FW_VERSION >= 311
br_da629:
        leave
        else
        pop     bp
        endif
        retf
far_da62b:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 2
        endif
        push    word ptr [bp + 6]
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], ax
        cmp     ax, 23h
        jl      br_da657
        endif
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bl, byte ptr [bp + 8]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx + 1], al
        if      FW_VERSION >= 311
br_da657:
        leave
        else
        pop     bp
        endif
        retf
far_da659:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 2
        endif
        push    word ptr [bp + 6]
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        if      FW_VERSION >= 311
        mov     word ptr [bp - 2], ax
        cmp     ax, 23h
        jl      br_da685
        endif
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bl, byte ptr [bp + 8]
        mov     es, dx
        xchg    bx, ax
        mov     byte ptr es:[bx + 2], al
        if      FW_VERSION >= 311
br_da685:
        leave
        else
        pop     bp
        endif
        retf
        if      FW_VERSION >= 311
far_da687:
        else
L_e30a9:
        endif
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 6
        else
        sub     sp, 4
        endif
        push    word ptr [bp + 6]
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        if      FW_VERSION >= 311
        mov     word ptr [bp - 6], ax
        cmp     ax, 23h
        jl      br_da6bf
        endif
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        les     bx, dword ptr [bp - 4]
        mov     al, byte ptr es:[bx + 3]
        and     al, 80h
        or      al, byte ptr [bp + 8]
        mov     byte ptr es:[bx + 3], al
br_da6bf:
        leave
        retf
far_da6c1:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 6]
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        pop     bp
        retf
far_da6e3:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 6]
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbb70
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 1]
        mov     ah, 0
        pop     bp
        retf
far_da706:
        push    bp
        mov     bp, sp
        push    word ptr [bp + 6]
        callf   SEG_DAB0:far_dab06
        add     sp, 2
        push    ax
        callf   SEG_CB8A:far_cbbd4
        add     sp, 2
        mov     bx, ax
        mov     es, dx
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        pop     bp
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   0ah
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   4
        endif
far_da72a:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        push    es
        mov     ax, 0f400h
        mov     es, ax
        cld
        mov     si, 0
        mov     cx, word ptr [bp + 0ah]
        mov     bl, cl
loop_da73f:
        mov     al, byte ptr es:[si]
        add     bl, al
        inc     si
        inc     si
        dec     cx
        jnz     loop_da73f
        mov     ax, 1
        mov     bh, byte ptr es:[si]
        cmp     bh, bl
        jnz     br_da769
        mov     si, 0
        lds     di, dword ptr [bp + 6]
        mov     cx, word ptr [bp + 0ah]
loop_da75c:
        mov     al, byte ptr es:[si]
        mov     byte ptr [di], al
        inc     di
        inc     si
        inc     si
        dec     cx
        jnz     loop_da75c
        xor     ax, ax
br_da769:
        pop     es
        pop     ds
        pop     di
        pop     si
        pop     bp
        retf
far_da76f:
        push    bp
        mov     bp, sp
        push    si
        push    di
        push    ds
        push    es
        lds     si, dword ptr [bp + 6]
        mov     di, 0
        mov     cx, word ptr [bp + 0ah]
        mov     ax, 0f400h
        mov     es, ax
        mov     bl, cl
        cld
loop_da787:
        mov     al, byte ptr [si]
        mov     byte ptr es:[di], al
        add     bl, al
        inc     di
        inc     di
        inc     si
        dec     cx
        jnz     loop_da787
        mov     byte ptr es:[di], bl
        pop     es
        pop     ds
        pop     di
        pop     si
        pop     bp
        retf
far_da79d:
        push    es
        mov     ax, 0f400h
        mov     es, ax
        cmp     byte ptr es:[3feh], 0aah
        jnz     br_da7b1
        mov     byte ptr es:[3feh], 44h
br_da7b1:
        pop     es
        retf
fn_da7b3:
        callf   SEG_E931:far_e931c
loop_da7b8:
        push    14h
        callf   SEG_B059:far_b059a
        add     sp, 2
        cmp     byte ptr [B_D4B4], 0
        jz      loop_da7b8
        push    word 6c2h
        push    ds
        push    word A_7D87
        callf   SEG_DA72:far_da76f
        add     sp, 6
        mov     byte ptr [B_D4B4], 0
        jmp     loop_da7b8
fn_da7df:
        retf
        if      FW_VERSION >= 312
        phase   0
        elseif  FW_VERSION = 311
        phase   6
        else
        phase   0ah
        endif
far_da7e0:
        push    bp
        mov     bp, sp
        mov     al, byte ptr [bp + 8]
        cbw
        mov     bx, ax
        cmp     bx, 3
        ja      br_da859
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_da86f]
tgt_da7f5:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr es:[bx + 12h]
        cbw
        cwd
        sub     ax, dx
        sar     ax, 1
        add     ax, 40h
        mov     cx, ax
        mov     al, byte ptr es:[bx + 13h]
        cbw
        cwd
        sub     ax, dx
        mov     dx, ax
        sar     dx, 1
        add     dx, 40h
        jmp     br_da859
tgt_da819:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr es:[bx + 14h]
        cbw
        mov     cx, ax
        mov     al, byte ptr es:[bx + 15h]
        cbw
        mov     dx, ax
        jmp     br_da859
tgt_da82d:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr es:[bx + 16h]
        cbw
        mov     cx, ax
        mov     al, byte ptr es:[bx + 17h]
        cbw
        mov     dx, ax
        jmp     br_da859
tgt_da841:
        les     bx, dword ptr [FP_E40C]
        mov     al, byte ptr es:[bx + 18h]
        cbw
        add     ax, 32h
        mov     cx, ax
        mov     al, byte ptr es:[bx + 19h]
        cbw
        add     ax, 32h
        mov     dx, ax
br_da859:
        mov     al, byte ptr [bp + 6]
        cbw
        push    ax
        mov     ax, dx
        sub     ax, cx
        pop     dx
        imul    dx
        mov     bx, 7fh
        cwd
        idiv    bx
        add     al, cl
        pop     bp
        retf
TBL_da86f:
        dw      tgt_da7f5
        dw      tgt_da819
        dw      tgt_da82d
        dw      tgt_da841
fn_da877:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 6]
        cmp     si, 1
        ja      br_da888
        mov     ax, si
        pop     si
        pop     bp
        retf
br_da888:
        mov     bx, si
        shr     bx, 1
        xor     cx, cx
loop_da88e:
        mov     ax, si
        xor     dx, dx
        div     bx
        add     ax, bx
        shr     ax, 1
        mov     bx, ax
        inc     cx
        cmp     cx, 9
        jc      loop_da88e
        mov     ax, bx
        pop     si
        pop     bp
        retf
far_da8a5:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        cmp     word ptr [bp + 8], 0
        jz      br_da8bf
        mov     ax, dx
        shl     ax, 1
        push    ax
        push    cs
        call    fn_da877
        add     sp, 2
        pop     bp
        retf
br_da8bf:
        mov     ax, dx
        imul    dx
        inc     ax
        cwd
        sub     ax, dx
        sar     ax, 1
        pop     bp
        retf
far_da8cb:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [W_F2B0], ax
        mov     word ptr [W_F2AE], dx
        pop     bp
        retf
far_da8dd:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 6]
        mov     cx, word ptr [bp + 8]
        mov     ax, word ptr [W_F2AE]
        or      ax, word ptr [W_F2B0]
        jnz     br_da8f3
        xor     ax, ax
        pop     bp
        retf
br_da8f3:
        or      cx, cx
        jz      br_da92f
        les     bx, dword ptr [W_F2AE]
        mov     al, byte ptr es:[bx]
        cbw
        mov     bx, ax
        cmp     bx, 3
        ja      br_da95c
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_da968]
tgt_da90d:
        mov     ax, dx
        cwd
        sub     ax, dx
        mov     dx, ax
        sar     dx, 1
        add     dx, 40h
        jmp     br_da95c
tgt_da91b:
        push    cx
        push    dx
        push    cs
        call    far_da8a5
        add     sp, 4
        mov     dx, ax
        jmp     br_da95c
tgt_da928:
        add     dx, 32h
        jmp     br_da95c
fn_da92d:
        jmp     br_da95c
br_da92f:
        les     bx, dword ptr [W_F2AE]
        mov     al, byte ptr es:[bx]
        cbw
        mov     bx, ax
        cmp     bx, 3
        ja      br_da95c
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_da960]
tgt_da945:
        shl     dx, 1
        add     dx, 0ff80h
        jmp     br_da95c
tgt_da94c:
        push    cx
        push    dx
        push    cs
        call    far_da8a5
        add     sp, 4
        mov     dx, ax
        jmp     br_da95c
tgt_da959:
        add     dx, 0ffceh
br_da95c:
        mov     ax, dx
        pop     bp
        retf
TBL_da960:
        dw      tgt_da945
        dw      tgt_da94c
        dw      tgt_da94c
        dw      tgt_da959
TBL_da968:
        dw      tgt_da90d
        dw      tgt_da91b
        dw      tgt_da91b
        dw      tgt_da928
far_da970:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [W_F2AE]
        or      ax, word ptr [W_F2B0]
        jnz     br_da97e
        pop     bp
        retf
br_da97e:
        les     bx, dword ptr [W_F2AE]
        mov     al, byte ptr es:[bx]
        cbw
        mov     bx, ax
        cmp     bx, 3
        ja      br_da9a1
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_da9b0]
tgt_da994:
        mov     dx, 4
        mov     cx, 7ch
        jmp     br_da9a1
tgt_da99c:
        xor     dx, dx
        mov     cx, 64h
br_da9a1:
        push    cx
        push    dx
        push    word ptr [bp + 6]
        callf   SEG_B05A:far_b1206
        add     sp, 6
        pop     bp
        retf
TBL_da9b0:
        dw      tgt_da994
        dw      tgt_da99c
        dw      tgt_da99c
        dw      tgt_da99c
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   2
        endif
far_da9b8:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 8]
        xor     bx, bx
        mov     cx, 4
loop_da9c3:
        shl     dx, 1
        rcl     bx, 1
        loop    loop_da9c3
        add     dx, word ptr [bp + 6]
        adc     bx, 0
        add     dx, word ptr [bp + 0ah]
        adc     bx, word ptr [bp + 0ch]
        mov     ax, dx
        and     ax, 0fh
        mov     cl, 4
loop_da9dc:
        shr     bx, 1
        rcr     dx, 1
        loop    loop_da9dc
        pop     bp
        retf
far_da9e4:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 8]
        xor     dx, dx
        mov     cx, 4
loop_da9ef:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_da9ef
        add     ax, word ptr [bp + 6]
        adc     dx, 0
        add     ax, word ptr [bp + 0ah]
        adc     dx, word ptr [bp + 0ch]
        mov     cl, 4
        ror     dx, cl
        pop     bp
        retf
far_daa07:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 0ch]
        xor     dx, dx
        mov     cx, 4
loop_daa12:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_daa12
        add     ax, word ptr [bp + 0ah]
        adc     dx, 0
        push    ax
        push    dx
        mov     ax, word ptr [bp + 8]
        xor     dx, dx
        mov     cx, 4
loop_daa28:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_daa28
        add     ax, word ptr [bp + 6]
        adc     dx, 0
        pop     bx
        pop     cx
        sub     ax, cx
        sbb     dx, bx
        pop     bp
        retf
far_daa3c:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 8]
        xor     dx, dx
        mov     cx, 4
loop_daa47:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_daa47
        add     ax, word ptr [bp + 6]
        adc     dx, 0
        mov     cl, 4
        ror     dx, cl
        pop     bp
        retf
far_daa59:
        push    bp
        mov     bp, sp
        mov     dx, word ptr [bp + 8]
        xor     bx, bx
        mov     cx, 4
loop_daa64:
        shl     dx, 1
        rcl     bx, 1
        loop    loop_daa64
        add     dx, word ptr [bp + 6]
        adc     bx, 0
        mov     ax, dx
        and     ax, 0fh
        mov     cl, 4
loop_daa77:
        shr     bx, 1
        rcr     dx, 1
        loop    loop_daa77
        pop     bp
        retf
fn_daa7f:
        mov     ax, ds
        retf
        if      FW_VERSION >= 312
        phase   2
        elseif  FW_VERSION = 311
        phase   8
        else
        phase   0ch
        endif
far_daa82:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 6]
        shl     al, 1
        shr     ax, 1
        pop     bp
        retf
far_daa8e:
        push    bp
        mov     bp, sp
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx]
        shl     al, 1
        shr     ax, 1
        pop     bp
        retf
far_daa9d:
        push    bp
        mov     bp, sp
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx]
        add     bx, 2
        shl     al, 1
        shl     ax, 1
        mov     dl, byte ptr es:[bx]
        shr     dl, 1
        rcr     ax, 1
        shr     dl, 1
        rcr     ax, 1
        xor     dh, dh
        pop     bp
        retf
far_daabc:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 6]
        shl     ax, 1
        shr     al, 1
        pop     bp
        retf
far_daac8:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 6]
        mov     dx, word ptr [bp + 8]
        shl     ax, 1
        rcl     dx, 1
        shl     ah, 1
        rcl     dx, 1
        shr     al, 1
        shr     ah, 1
        xor     dh, dh
        and     dl, 7fh
        pop     bp
        retf
far_daae4:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 6]
        xchg    al, ah
        shl     al, 1
        shl     ax, 1
        xor     ax, 8000h
        pop     bp
        retf
far_daaf5:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 6]
        xor     ax, 8000h
        shr     ax, 1
        shr     al, 1
        xchg    al, ah
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   6
        elseif  FW_VERSION = 311
        phase   0ch
        else
        phase   0
        endif
far_dab06:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 6]
        cmp     si, 40h
        jnc     br_dab31
        cmp     byte ptr [B_8189], 0
        jz      br_dab21
        mov     al, byte ptr [si + TBL_818A]
        cbw
        pop     si
        pop     bp
        retf
br_dab21:
        les     bx, dword ptr [FP_E40C]
        add     bx, si
        mov     al, byte ptr es:[bx + 73eh]
        mov     ah, 0
        pop     si
        pop     bp
        retf
br_dab31:
        mov     ax, 23h
        pop     si
        pop     bp
        retf
far_dab37:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     di, word ptr [bp + 6]
        cmp     di, 23h
        jge     br_dab4b
        mov     ax, 0ffffh
        pop     di
        pop     si
        pop     bp
        retf
br_dab4b:
        xor     si, si
loop_dab4d:
        push    si
        push    cs
        call    far_dab06
        add     sp, 2
        cmp     ax, di
        jnz     br_dab5f
        mov     ax, si
        pop     di
        pop     si
        pop     bp
        retf
br_dab5f:
        inc     si
        cmp     si, 40h
        jl      loop_dab4d
        mov     ax, 0ffffh
        pop     di
        pop     si
        pop     bp
        retf
far_dab6c:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 6]
        mov     dx, word ptr [bp + 8]
        cmp     dx, 22h
        jge     br_dab7e
        mov     dx, 22h
br_dab7e:
        cmp     dx, 62h
        jle     br_dab86
        mov     dx, 62h
br_dab86:
        cmp     si, 40h
        jnc     br_daba4
        cmp     byte ptr [B_8189], 0
        jz      br_dab99
        mov     byte ptr [si + TBL_818A], dl
        pop     si
        pop     bp
        retf
br_dab99:
        les     bx, dword ptr [FP_E40C]
        add     bx, si
        mov     byte ptr es:[bx + 73eh], dl
br_daba4:
        pop     si
        pop     bp
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   2
        endif
far_daba8:
        push    bp
        mov     bp, sp
        add     sp, 0fff4h
        push    es
        push    ds
        push    di
        push    si
        mov     cx, 6
        sub     ax, ax
        sub     di, di
loop_dabb9:
        mov     word ptr [bp+di - 0ch], ax
        add     di, 2
        loop    loop_dabb9
        mov     dx, 30h
        clc
loop_dabc5:
        lds     bx, dword ptr [bp + 6]
        adc     word ptr [bx], 0
        dec     dx
        jns     br_dabd6
        pop     si
        pop     di
        pop     ds
        pop     es
        mov     sp, bp
        pop     bp
        retf
br_dabd6:
        mov     cx, 6
        clc
loop_dabda:
        rcl     word ptr [bx], 1
        inc     bx
        inc     bx
        loop    loop_dabda
        lds     bx, dword ptr [bp + 6]
        add     bx, 6
        les     si, dword ptr [bp + 0ah]
        sub     di, di
        mov     cx, 3
        clc
loop_dabef:
        mov     ax, word ptr [bx+di]
        sbb     ax, word ptr es:[si]
        mov     word ptr [bp+di - 0ch], ax
        inc     si
        inc     si
        inc     di
        inc     di
        loop    loop_dabef
        cmc
        jnc     loop_dabc5
        mov     di, 0
        mov     cx, 3
loop_dac06:
        mov     ax, word ptr [bp+di - 0ch]
        mov     word ptr [bx+di], ax
        inc     di
        inc     di
        loop    loop_dac06
        jmp     loop_dabc5
        db      0ffh
fn_dac12:
        push    bp
        mov     bp, sp
        push    es
        mov     ax, word ptr [bp + 8]
        mov     es, ax
        mov     bx, word ptr [bp + 6]
        mov     ax, word ptr es:[bx]
        mov     dx, word ptr es:[bx + 2]
        pop     es
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   2
        endif
far_dac28:
        push    bp
        mov     bp, sp
        push    ds
        mov     cx, word ptr [bp + 6]
        mov     ax, SEG_9751
        mov     ds, ax
        mov     word ptr [0], cx
        mov     ax, 0b3d0h
        xor     dx, dx
        div     cx
        mov     word ptr [2], ax
        pop     ds
        pop     bp
        retf
far_dac45:
        push    bp
        mov     bp, sp
        push    ds
        mov     cx, word ptr [bp + 6]
        sub     ax, ax
        sub     dx, dx
        mov     bx, SEG_9751
        mov     ds, bx
        cmp     cx, word ptr [2]
        jge     br_dac66
        mov     ax, word ptr [0]
        mul     cx
        add     ax, 4
        mov     dx, SEG_9751
br_dac66:
        pop     ds
        pop     bp
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   0ah
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   4
        endif
far_dac6a:
        push    si
        push    bx
        pushf
        mov     ax, word ptr [bx]
        cli
        mov     si, word ptr [bx + 2]
        cmp     si, ax
        jnc     br_dac91
        inc     si
        mov     word ptr [bx + 2], si
        mov     si, word ptr [bx + 4]
        or      si, si
        jnz     br_dac84
        mov     si, ax
br_dac84:
        dec     si
        mov     word ptr [bx + 4], si
        mov     byte ptr [bx+si + 8], cl
        popf
        xor     ax, ax
        jmp     br_dac97
        db      090h
br_dac91:
        popf
        mov     ax, 0ffffh
        or      ax, ax
br_dac97:
        pop     bx
        pop     si
        retf
far_dac9a:
        push    es
        push    si
        push    bx
        pushf
        mov     ax, SEG_A8EC
        mov     es, ax
        mov     ax, word ptr es:[bx]
        cli
        mov     si, word ptr es:[bx + 2]
        cmp     si, ax
        jnc     br_daccd
        inc     si
        mov     word ptr es:[bx + 2], si
        mov     si, word ptr es:[bx + 4]
        or      si, si
        jnz     br_dacbe
        mov     si, ax
br_dacbe:
        dec     si
        mov     word ptr es:[bx + 4], si
        mov     byte ptr es:[bx+si + 8], cl
        popf
        xor     ax, ax
        jmp     br_dacd3
        db      090h
br_daccd:
        popf
        mov     ax, 0ffffh
        or      ax, ax
br_dacd3:
        pop     bx
        pop     si
        pop     es
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   2
        endif
far_dacd8:
        mov     cl, byte ptr [B_8808]
        sub     ch, ch
        mov     bl, byte ptr [B_7FE1]
        sub     bh, bh
        mov     ax, cx
        sub     ax, bx
br_dace8:
        cmp     ax, cx
        jc      br_dacf0
        sub     ax, cx
        jmp     br_dace8
br_dacf0:
        mov     word ptr [W_8810], ax
        add     ax, cx
        mov     bx, word ptr [W_880C]
        shr     bx, 1
        sub     ax, bx
        shr     cx, 1
br_dacff:
        cmp     ax, cx
        jc      br_dad07
        sub     ax, cx
        jmp     br_dacff
br_dad07:
        mov     word ptr [W_880E], ax
        sub     al, al
        mov     cx, word ptr [W_8810]
        or      cx, cx
        jz      br_dad1a
        cmp     cx, word ptr [W_880C]
        jnz     br_dad1c
br_dad1a:
        inc     al
br_dad1c:
        mov     byte ptr [B_8807], al
        retf
        if      FW_VERSION >= 312
        phase   0
        elseif  FW_VERSION = 311
        phase   6
        else
        phase   0ah
        endif
far_dad20:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    3
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_D97B:far_d99a2
        add     sp, 0ah
        cmp     byte ptr [bp - 4], 0a8h
        jz      br_dad45
        xor     ax, ax
        leave
        retf
br_dad45:
        cmp     word ptr [bp - 3], 1
        jz      br_dad4f
        xor     ax, ax
        leave
        retf
br_dad4f:
        mov     ax, 1
        leave
        retf
        if      FW_VERSION >= 312
        phase   4
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   0eh
        endif
far_dad54:
        push    bp
        mov     bp, sp
        cmp     word ptr [W_8814], 0
        jz      br_dad85
        mov     ax, word ptr [W_8814]
        shl     ax, 1
        shr     al, 1
        sub     sp, 6
        mov     bx, sp
        mov     byte ptr [bp - 6], 88h
        mov     word ptr [bp - 5], ax
        mov     word ptr [W_8814], 0
        push    3
        push    ss
        push    bx
        push    word ptr [bp + 6]
        push    cs
        call    far_dea12
        add     sp, 0eh
br_dad85:
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   7
        elseif  FW_VERSION = 311
        phase   0dh
        else
        phase   1
        endif
far_dad87:
        jmp     br_dadce
loop_dad89:
        mov     al, byte ptr [TBL_F77A]
        mov     byte ptr [TBL_F779], al
        mov     al, byte ptr [B_8A9B]
        mov     byte ptr [TBL_F77A], al
        mov     al, byte ptr [TBL_F779]
        mov     ah, 0
        cmp     ax, 80h
        jz      br_dadaa
        cmp     ax, 90h
        jnz     br_dadb5
        inc     byte ptr [B_956D]
        jmp     br_dadb5
br_dadaa:
        cmp     byte ptr [B_956D], 0
        jbe     br_dadb5
        dec     byte ptr [B_956D]
br_dadb5:
        cmp     byte ptr [B_F77B], 23h
        jc      br_dadce
        push    1
        mov     ax, dx
        inc     ax
        push    ax
        push    ds
        push    word TBL_F779
        callf   SEG_DCEA:far_dcead
        add     sp, 8
br_dadce:
        push    word 63fh
        push    ds
        push    word TBL_F77A
        push    5
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jnz     loop_dad89
        retf
        if      FW_VERSION >= 312
        phase   6
        elseif  FW_VERSION = 311
        phase   0ch
        else
        phase   0
        endif
far_dade6:
        push    bp
        mov     bp, sp
        sub     sp, 6
        cmp     byte ptr [B_901B], 0
        jnz     br_dae34
        mov     byte ptr [B_901B], 1
        mov     ax, word ptr [W_902F]
        mov     dx, word ptr [W_902D]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     ax, word ptr [W_9055]
        mov     word ptr [bp - 6], ax
        push    ds
        push    word B_901B
        callf   SEG_DDA7:far_dda74
        add     sp, 4
        callf   SEG_DE41:far_de41c
        mov     ax, word ptr [bp - 6]
        mov     word ptr [W_9055], ax
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [W_902F], ax
        mov     word ptr [W_902D], dx
        mov     byte ptr [B_901B], 0
br_dae34:
        leave
        retf
        if      FW_VERSION >= 312
        phase   6
        elseif  FW_VERSION = 311
        phase   0ch
        else
        phase   0
        endif
far_dae36:
        push    bp
        mov     bp, sp
        sub     sp, 4
        push    si
        push    di
        callf   SEG_DBE6:far_dc29e
        xor     di, di
        jmp     br_daf4e
br_dae48:
        mov     ax, word ptr [W_902F]
        mov     dx, word ptr [W_902D]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    word 640h
        push    ds
        push    word TBL_F779
        push    1
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        mov     si, ax
        mov     al, byte ptr [TBL_F779]
        mov     ah, 0
        and     ax, 0f8h
        cmp     ax, 0f0h
        jz      br_daee6
        jg      br_dae84
        cmp     ax, 88h
        jz      br_dae8c
        cmp     ax, 0a8h
        jz      br_dae9e
        jmp     near br_daf27
br_dae84:
        cmp     ax, 0f8h
        jz      br_daec6
        jmp     near br_daf27
br_dae8c:
        push    ds
        push    word TBL_F77A
        callf   SEG_DAA8:far_daa8e
        add     sp, 4
        mov     word ptr [W_9055], ax
        jmp     near br_daf4e
br_dae9e:
        mov     al, byte ptr [B_F77D]
        mov     ah, 0
        push    ax
        mov     al, byte ptr [B_F77C]
        mov     ah, 0
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E723:far_e723d
        add     sp, 8
        push    si
        push    ds
        push    word TBL_F779
        callf   SEG_E7D8:far_e7d89
        add     sp, 6
        jmp     near br_daf4e
br_daec6:
        mov     ax, word ptr [bp - 2]
        mov     dx, word ptr [bp - 4]
        mov     word ptr [W_902F], ax
        mov     word ptr [W_902D], dx
        push    0
        push    si
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dbe67
        add     sp, 8
        pop     di
        pop     si
        leave
        retf
br_daee6:
        push    ds
        push    word TBL_F779
        callf   SEG_DE4C:far_de4c2
        add     sp, 4
        cmp     ax, 7
        jnz     br_daf27
        or      di, di
        jnz     br_daf18
        mov     al, byte ptr [TBL_F77A]
        cmp     al, byte ptr [B_8A9C]
        jnz     br_daf18
        push    0
        push    si
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dbe67
        add     sp, 8
        mov     di, 1
        jmp     br_daf4e
br_daf18:
        push    si
        push    ds
        push    word TBL_F779
        callf   SEG_E7D8:far_e7d89
        add     sp, 6
        jmp     br_daf4e
br_daf27:
        mov     al, byte ptr [TBL_F77A]
        cmp     al, byte ptr [B_8A9C]
        jnz     br_daf41
        push    0
        push    si
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dbe67
        add     sp, 8
        jmp     br_daf4e
br_daf41:
        push    si
        push    ds
        push    word TBL_F779
        callf   SEG_E7D8:far_e7d89
        add     sp, 6
br_daf4e:
        cmp     word ptr [W_9055], 0
        jnz     br_daf58
        jmp     br_dae48
br_daf58:
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   0ch
        elseif  FW_VERSION = 311
        phase   2
        else
        phase   6
        endif
far_daf5c:
        callf   SEG_DBE6:far_dc2b6
        callf   SEG_E2CE:far_e2ce3
        mov     word ptr [W_96F8], dx
        mov     word ptr [W_96F6], ax
        or      dx, dx
        jg      br_daf93
        jl      br_daf78
        cmp     ax, 64h
        jnc     br_daf93
br_daf78:
        or      byte ptr [B_9457], 4
        jmp     br_dafaa
loop_daf7f:
        cmp     byte ptr [TBL_F779], 0ffh
        jz      br_daf93
        push    dx
        push    ds
        push    word TBL_F779
        callf   SEG_E7D8:far_e7d89
        add     sp, 6
br_daf93:
        push    1
        push    word 640h
        push    ds
        push    word TBL_F779
        callf   SEG_DBE6:far_dc2bf
        add     sp, 8
        mov     dx, ax
        or      ax, ax
        jnz     loop_daf7f
br_dafaa:
        callf   SEG_DBE6:far_dc29e
        retf
        if      FW_VERSION >= 312
        phase   0
        elseif  FW_VERSION = 311
        phase   6
        else
        phase   0ah
        endif
far_dafb0:
        push    bp
        mov     bp, sp
        push    word ptr [W_9031]
        push    word ptr [W_9033]
        mov     bx, word ptr [bp + 6]
        shl     bx, 2
        mov     ax, word ptr [bx + TBL_A067]
        mov     word ptr [W_9031], ax
        mov     ax, word ptr [bx + TBL_A069]
        mov     word ptr [W_9033], ax
        mov     al, byte ptr [bp + 8]
        cmp     al, 0
        jge     br_dafe1
        push    es
        push    di
        les     di, dword ptr [W_9031]
        mov     al, byte ptr es:[di]
        pop     di
        pop     es
br_dafe1:
        callf   SEG_D99E:far_d99e6
        mov     dx, word ptr [bp + 0ah]
        or      dx, dx
        jnz     br_dafee
        inc     dx
br_dafee:
        mov     al, dl
        and     al, 7fh
        callf   SEG_D99E:far_d99e6
        shl     dx, 1
        mov     al, dh
        and     al, 7fh
        callf   SEG_D99E:far_d99e6
        pop     word ptr [W_9033]
        pop     word ptr [W_9031]
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   0ch
        elseif  FW_VERSION = 311
        phase   2
        else
        phase   6
        endif
far_db00c:
        push    di
        nop
        push    cs
        call    far_db034
        callf   SEG_DE27:far_de3fa
        push    ds
        pop     es
        mov     di, TBL_9831
        xor     ax, ax
        mov     ah, al
        mov     cx, 200h
        rep stosw
        mov     di, TBL_981B
        mov     ax, 0ffffh
        mov     ah, al
        mov     cx, 0ah
        rep stosw
        pop     di
        retf
far_db034:
        push    si
        push    di
        cmp     byte ptr [B_A570], 0
        jz      br_db04f
        push    ds
        pop     es
        mov     di, TBL_A4E7
        mov     ax, 0ffffh
        mov     ah, al
        mov     cx, 40h
        rep stosw
        pop     di
        pop     si
        retf
br_db04f:
        cmp     byte ptr [B_901B], 0
        jnz     br_db09f
        xor     si, si
        mov     di, TBL_A4E7
        mov     dx, TBL_A267
loop_db05e:
        cmp     byte ptr [di], 0ffh
        jz      br_db08a
        cmp     byte ptr [di], 0feh
        jnz     br_db082
        test    byte ptr [si + TBL_9FE7], 80h
        jz      br_db08a
        mov     byte ptr [si + TBL_A367], 40h
        mov     bx, dx
        mov     ax, word ptr [W_8820]
        mov     word ptr [bx], ax
        and     byte ptr [si + TBL_9FE7], 7fh
        jmp     br_db08a
br_db082:
        mov     al, 0ffh
        mov     byte ptr [si + TBL_A367], al
        mov     byte ptr [di], al
br_db08a:
        inc     di
        add     dx, 2
        inc     si
        cmp     di, B_A567
        jnz     loop_db05e
        mov     byte ptr [B_880B], 1
        callf   SEG_DCA3:far_dca3e
br_db09f:
        pop     di
        pop     si
        retf
        if      FW_VERSION >= 312
        phase   2
        elseif  FW_VERSION = 311
        phase   8
        else
        phase   0ch
        endif
far_db0a2:
        push    bp
        mov     bp, sp
        les     bx, dword ptr [bp + 6]
        dec     word ptr es:[bx + 3ah]
        inc     word ptr es:[bx + 34h]
        mov     al, byte ptr es:[bx + 36h]
        inc     al
        mov     byte ptr es:[bx + 36h], al
        mov     ah, 0
        cmp     ax, word ptr es:[bx + 40h]
        jl      br_db0e6
        mov     byte ptr es:[bx + 36h], 0
        mov     al, byte ptr es:[bx + 37h]
        inc     al
        mov     byte ptr es:[bx + 37h], al
        cmp     al, byte ptr es:[bx + 3ch]
        jbe     br_db0e6
        mov     byte ptr es:[bx + 37h], 1
        mov     word ptr es:[bx + 34h], 0
        inc     word ptr es:[bx + 38h]
br_db0e6:
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   2
        endif
far_db0e8:
        push    di
        callf   SEG_DE27:far_de341
        push    ds
        pop     es
        mov     di, TBL_A4E7
        mov     ax, 0ffffh
        mov     ah, al
        mov     cx, 40h
        rep stosw
        mov     di, TBL_A367
        mov     ah, al
        mov     cx, 40h
        rep stosw
        mov     di, TBL_9F67
        mov     ah, al
        mov     cx, 40h
        rep stosw
        pop     di
        retf
        if      FW_VERSION >= 312
        phase   3
        elseif  FW_VERSION = 311
        phase   9
        else
        phase   0dh
        endif
far_db113:
        push    bp
        mov     bp, sp
        push    si
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0a0h
        ja      br_db134
        cmp     byte ptr es:[bx + 2], 23h
        jnc     br_db12a
        if      FW_VERSION >= 311
        jmp     br_db213
        else
        jmp     near br_db213
        endif
br_db12a:
        cmp     byte ptr es:[bx + 2], 62h
        jbe     br_db134
        if      FW_VERSION >= 311
        jmp     br_db213
        else
        jmp     near br_db213
        endif
br_db134:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        cmp     ax, 0a0h
        if      FW_VERSION >= 311
        jnz     br_db144
        jmp     near br_db1e2
br_db144:
        else
        jz      br_db1e2
        endif
        jg      br_db153
        cmp     ax, 80h
        jz      br_db1a4
        cmp     ax, 90h
        jz      br_db15b
        jmp     near br_db200
br_db153:
        cmp     ax, 0d0h
        jz      br_db1be
        jmp     near br_db200
br_db15b:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        push    ax
        cmp     byte ptr [B_817F], 0
        jz      br_db171
        mov     al, byte ptr [B_8180]
        jmp     br_db178
br_db171:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 3]
br_db178:
        pop     bx
        mov     byte ptr [bx + TBL_966E], al
        if      FW_VERSION >= 311
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     bx, ax
        mov     byte ptr [bx + TBL_95EE], 40h
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        push    ax
        callf   SEG_DAB0:far_dab37
        add     sp, 2
        mov     byte ptr [B_D4BF], al
        endif
        jmp     br_db200
br_db1a4:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     bx, ax
        mov     byte ptr [bx + TBL_966E], 0
        mov     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 3], 40h
        jmp     br_db200
br_db1be:
        mov     al, byte ptr [B_817F]
        cbw
        or      ax, ax
        jnz     br_db213
        mov     si, 23h
        jmp     br_db1da
loop_db1cb:
        cmp     byte ptr [si + TBL_966E], 0
        jz      br_db1d9
        mov     al, byte ptr [B_956B]
        mov     byte ptr [si + TBL_966E], al
br_db1d9:
        inc     si
br_db1da:
        cmp     si, 62h
        jle     loop_db1cb
        pop     si
        pop     bp
        retf
br_db1e2:
        mov     al, byte ptr [B_817F]
        cbw
        or      ax, ax
        jnz     br_db213
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     dl, byte ptr es:[bx + 3]
        mov     bx, ax
        mov     byte ptr [bx + TBL_966E], dl
        pop     si
        pop     bp
        retf
br_db200:
        push    2
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DCEA:far_dcead
        add     sp, 8
br_db213:
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   6
        elseif  FW_VERSION = 311
        phase   0ch
        else
        phase   8
        endif
far_db216:
        push    si
        xor     dx, dx
        xor     si, si
loop_db21b:
        mov     al, byte ptr [si + TBL_956E]
        cbw
        or      dx, ax
        inc     si
        cmp     si, 80h
        jl      loop_db21b
        mov     si, 23h
        jmp     br_db236
loop_db22e:
        mov     al, byte ptr [si + TBL_966E]
        cbw
        or      dx, ax
        inc     si
br_db236:
        cmp     si, 62h
        jle     loop_db22e
        mov     ax, dx
        pop     si
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   0
        elseif  FW_VERSION = 311
        phase   6
        else
        phase   2
        endif
far_db240:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 8]
        shl     ax, 1
        shr     al, 1
        sub     sp, 6
        mov     bx, sp
        mov     byte ptr [bp - 6], 0a8h
        mov     word ptr [bp - 5], ax
        mov     al, byte ptr [B_9057]
        mov     ah, byte ptr [B_9058]
        mov     byte ptr [bp - 3], al
        mov     byte ptr [bp - 2], ah
        push    5
        push    ss
        push    bx
        push    word ptr [bp + 6]
        if      FW_VERSION >= 311
        callf   SEG_DEA1:far_dea12-3cc0h
        else
        callf   SEG_DEA1:far_dea12-3900h
        endif
        add     sp, 0eh
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   4
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   6
        endif
far_db274:
        push    si
        mov     si, 6
        jmp     br_db2ec
loop_db27a:
        cmp     byte ptr [TBL_F77A], 0f6h
        jnz     br_db29d
        cmp     byte ptr [B_A570], 0
        jnz     loop_db2d5
        mov     byte ptr [TBL_F779], 0e8h
        inc     bx
        push    bx
        push    ds
        push    word TBL_F779
        nop
        push    cs
        call    fn_db2f3
        add     sp, 6
        jmp     loop_db2d5
br_db29d:
        cmp     byte ptr [B_8188], 0
        jz      br_db2bf
        mov     al, byte ptr [B_A570]
        cbw
        or      ax, ax
        jnz     br_db2bf
        mov     al, byte ptr [TBL_F77A]
        mov     ah, 0
        and     ax, 0fh
        push    ax
        mov     al, byte ptr [B_8188]
        cbw
        dec     ax
        pop     dx
        cmp     dx, ax
        jnz     loop_db2d5
br_db2bf:
        mov     al, byte ptr [TBL_F77A]
        and     al, 0f0h
        mov     byte ptr [TBL_F779], al
        inc     bx
        push    bx
        push    ds
        push    word TBL_F779
        nop
        push    cs
        call    fn_db366
        add     sp, 6
loop_db2d5:
        push    word 63fh
        push    ds
        push    word TBL_F77A
        push    si
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        mov     bx, ax
        or      ax, ax
        jnz     loop_db27a
        inc     si
br_db2ec:
        cmp     si, 7
        jle     loop_db2d5
        pop     si
        retf
fn_db2f3:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     dx, word ptr [bp + 0ah]
        mov     al, byte ptr [B_96EE]
        cbw
        mov     cx, ax
        cmp     byte ptr [B_A570], 0
        jz      br_db336
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 1]
        mov     ah, 0
        and     ax, 0fh
        mov     word ptr [bp - 2], ax
        mov     al, byte ptr [bp - 2]
        inc     al
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr es:[bx + 1]
        cmp     al, byte ptr [B_826F]
        jnz     br_db330
        mov     ax, 1
        jmp     br_db332
br_db330:
        xor     ax, ax
br_db332:
        mov     cx, ax
        jmp     br_db340
br_db336:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr [B_8A9B]
        mov     byte ptr es:[bx + 1], al
br_db340:
        or      cx, cx
        jz      br_db355
        push    dx
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DB11:far_db113
        add     sp, 6
        leave
        retf
br_db355:
        push    dx
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DD13:far_dd133
        add     sp, 6
        leave
        retf
fn_db366:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     di, word ptr [bp + 0ah]
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        cmp     ax, 0d0h
        jnz     br_db381
        jmp     br_db454
br_db381:
        jg      br_db39b
        cmp     ax, 80h
        jnz     br_db38b
        jmp     near br_db419
br_db38b:
        cmp     ax, 90h
        jz      br_db3ae
        cmp     ax, 0b0h
        jnz     br_db398
        jmp     br_db487
br_db398:
        jmp     br_db579
br_db39b:
        cmp     ax, 0e0h
        jnz     br_db3a3
        jmp     near br_db461
br_db3a3:
        cmp     ax, 0f0h
        jnz     br_db3ab
        jmp     br_db479
br_db3ab:
        jmp     br_db579
br_db3ae:
        mov     al, byte ptr [B_A5C0]
        cbw
        or      ax, ax
        jnz     br_db3c4
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_D7B6:far_d7b6a
        add     sp, 4
br_db3c4:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     word ptr [bp - 2], ax
        mov     bx, ax
        cmp     byte ptr [bx + TBL_956E], 0
        jz      br_db40a
        mov     byte ptr [bp - 8], 80h
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr es:[bx + 1]
        mov     byte ptr [bp - 7], al
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [bp - 6], al
        mov     byte ptr [bp - 5], 40h
        push    4
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    cs
        call    fn_db2f3
        add     sp, 6
        mov     bx, word ptr [bp - 2]
        mov     byte ptr [bx + TBL_9787], 0ffh
        jmp     br_db579
br_db40a:
        mov     bx, word ptr [bp - 2]
        mov     byte ptr [bx + TBL_956E], 1
        inc     byte ptr [B_956D]
        jmp     br_db579
br_db419:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     word ptr [bp - 2], ax
        cmp     byte ptr [B_9786], 0
        jz      br_db43b
        mov     al, byte ptr es:[bx + 3]
        mov     bx, word ptr [bp - 2]
        mov     byte ptr [bx + TBL_9787], al
        pop     di
        pop     si
        leave
        retf
br_db43b:
        mov     bx, word ptr [bp - 2]
        mov     byte ptr [bx + TBL_956E], 0
        cmp     byte ptr [B_956D], 0
        ja      br_db44d
        jmp     br_db579
br_db44d:
        dec     byte ptr [B_956D]
        jmp     br_db579
br_db454:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [B_A56D], al
        jmp     br_db579
br_db461:
        les     bx, dword ptr [bp + 6]
        cmp     word ptr es:[bx + 2], 4000h
        jz      br_db471
        mov     ax, 1
        jmp     br_db473
br_db471:
        xor     ax, ax
br_db473:
        mov     byte ptr [B_A56C], al
        jmp     br_db579
br_db479:
        cmp     byte ptr [B_7FF0], 0
        jz      br_db483
        jmp     br_db579
br_db483:
        pop     di
        pop     si
        leave
        retf
br_db487:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        cmp     ax, 7
        jnz     br_db498
        jmp     br_db56d
br_db498:
        jg      br_db4b5
        cmp     ax, 1
        jnz     br_db4a2
        jmp     near br_db549
br_db4a2:
        cmp     ax, 2
        jnz     br_db4aa
        jmp     near br_db555
br_db4aa:
        cmp     ax, 4
        jnz     br_db4b2
        jmp     near br_db561
br_db4b2:
        jmp     near br_db579
br_db4b5:
        cmp     ax, 0bh
        jnz     br_db4bd
        jmp     near br_db574
br_db4bd:
        cmp     ax, 40h
        jz      br_db4c5
        jmp     near br_db579
br_db4c5:
        mov     al, byte ptr [B_8185]
        cbw
        or      ax, ax
        jnz     br_db4d0
        jmp     near br_db579
br_db4d0:
        cmp     byte ptr [B_A570], 0
        jz      br_db4da
        jmp     near br_db579
br_db4da:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx + 3], 0
        jz      br_db4ed
        mov     byte ptr [B_9786], 1
        pop     di
        pop     si
        leave
        retf
br_db4ed:
        cmp     byte ptr [B_9786], 0
        jnz     br_db4f7
        jmp     near br_db587
br_db4f7:
        mov     byte ptr [B_9786], 0
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 80h
        mov     word ptr [bp - 4], 0
        mov     si, TBL_9787
loop_db50b:
        cmp     byte ptr [si], 0ffh
        jz      br_db53b
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr [bp - 4]
        mov     byte ptr es:[bx + 2], al
        mov     al, byte ptr [si]
        mov     byte ptr es:[bx + 3], al
        push    di
        push    word ptr [bp + 8]
        push    bx
        push    cs
        call    fn_db2f3
        add     sp, 6
        mov     byte ptr [si], 0ffh
        mov     bx, word ptr [bp - 4]
        mov     byte ptr [bx + TBL_956E], 0
        dec     byte ptr [B_956D]
br_db53b:
        inc     si
        inc     word ptr [bp - 4]
        cmp     si, TBL_9807
        jnz     loop_db50b
        pop     di
        pop     si
        leave
        retf
br_db549:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [B_A56B], al
        jmp     br_db579
br_db555:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [B_A56A], al
        jmp     br_db579
br_db561:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [B_A569], al
        jmp     br_db579
br_db56d:
        mov     byte ptr [B_A568], 1
        jmp     br_db579
br_db574:
        mov     byte ptr [B_A567], 1
br_db579:
        push    di
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    fn_db2f3
        add     sp, 6
br_db587:
        pop     di
        pop     si
        leave
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   0ch
        elseif  FW_VERSION = 311
        phase   2
        else
        phase   0eh
        endif
far_db58c:
        if      FW_VERSION >= 311
        cmp     byte ptr [B_8437], 0
        jz      br_db598
        callf   SEG_DBAF:far_dbe39
br_db598:
        endif
        push    si
        push    di
        mov     di, word ptr [B_955C]
        and     di, 0ffh
        jnz     br_db5a7
        jmp     br_dba7d
br_db5a7:
        mov     byte ptr [B_955C], 0
        test    di, 1
        jnz     br_db5b5
        jmp     br_db687
br_db5b5:
        mov     bx, 8
loop_db5b8:
        sub     bx, 2
        jl      br_db5f0
        mov     ax, word ptr [bx + TBL_9553]
        cmp     ax, 0
        jz      loop_db5b8
        mov     word ptr [W_71E8], bx
        mov     word ptr [W_71D8], ax
        cmp     byte ptr [B_96EE], 0
        jz      br_db5f0
        cmp     byte ptr [B_E422], 1
        jnz     br_db5f0
        cmp     byte ptr [B_A5C1], 8
        jc      br_db5f0
        cmp     byte ptr [B_E425], 0
        jz      br_db5f0
        test    byte ptr [B_7FF1], 1
        jnz     br_db5f3
br_db5f0:
        jmp     near br_db67d
br_db5f3:
        mov     word ptr [W_71E0], 1
        mov     si, 0
        mov     byte ptr [B_7200], 1
br_db601:
        mov     ax, word ptr [W_71D8]
        test    word ptr [W_71E0], ax
        jnz     br_db60d
        jmp     br_db671
        db      090h
br_db60d:
        mov     ax, word ptr [W_71E8]
        shl     ax, 3
        add     ax, si
        mov     byte ptr [B_7201], al
        push    ax
        callf   SEG_DA5F:far_da6c1
        add     sp, 2
        and     al, 7fh
        mov     byte ptr [B_7202], al
        mov     al, byte ptr [B_7202]
        test    al, al
        jz      br_db641
        cmp     al, 7fh
        jz      br_db641
        mov     cl, byte ptr [si + TBL_71EA]
        sub     cl, al
        jns     br_db63b
        neg     cl
br_db63b:
        cmp     cl, byte ptr [B_807B]
        jl      br_db671
br_db641:
        mov     byte ptr [si + TBL_71EA], al
        mov     al, byte ptr [B_8A9B]
        mov     byte ptr [B_71FB], al
        mov     cx, 9
        mov     ax, A_71FA
        mov     bx, B_901B
        push    cx
        push    ds
        push    ax
        push    ds
        push    bx
        callf   SEG_DCC2:far_dcc2e
        add     sp, 0ah
        mov     byte ptr [B_71FB], 0
        mov     bl, byte ptr [B_8A9B]
        sub     bh, bh
        or      byte ptr [bx + TBL_90C1], 2
br_db671:
        shl     word ptr [W_71E0], 1
        inc     si
        cmp     si, 10h
        jge     br_db67d
        jmp     short br_db601
br_db67d:
        mov     bx, word ptr [W_71E8]
        mov     word ptr [bx + TBL_9553], 0
br_db687:
        test    di, 2
        jnz     br_db690
        jmp     br_db762
br_db690:
        mov     bx, 8
loop_db693:
        sub     bx, 2
        jl      br_db6cb
        mov     ax, word ptr [bx + TBL_954B]
        cmp     ax, 0
        jz      loop_db693
        mov     word ptr [W_71E8], bx
        mov     word ptr [W_71D8], ax
        cmp     byte ptr [B_96EE], 0
        jz      br_db6cb
        cmp     byte ptr [B_E422], 1
        jnz     br_db6cb
        cmp     byte ptr [B_A5C1], 8
        jc      br_db6cb
        cmp     byte ptr [B_E425], 0
        jz      br_db6cb
        test    byte ptr [B_7FF2], 1
        jnz     br_db6ce
br_db6cb:
        jmp     near br_db758
br_db6ce:
        mov     word ptr [W_71E0], 1
        mov     si, 0
        mov     byte ptr [B_7200], 2
br_db6dc:
        mov     ax, word ptr [W_71D8]
        test    word ptr [W_71E0], ax
        jnz     br_db6e8
        jmp     br_db74c
        db      090h
br_db6e8:
        mov     ax, word ptr [W_71E8]
        shl     ax, 3
        add     ax, si
        mov     byte ptr [B_7201], al
        push    ax
        callf   SEG_DA5F:far_da6e3
        add     sp, 2
        and     al, 7fh
        mov     byte ptr [B_7202], al
        mov     al, byte ptr [B_7202]
        test    al, al
        jz      br_db71c
        cmp     al, 7fh
        jz      br_db71c
        mov     cl, byte ptr [si + TBL_71EA]
        sub     cl, al
        jns     br_db716
        neg     cl
br_db716:
        cmp     cl, byte ptr [B_807C]
        jl      br_db74c
br_db71c:
        mov     byte ptr [si + TBL_71EA], al
        mov     al, byte ptr [B_8A9B]
        mov     byte ptr [B_71FB], al
        mov     cx, 9
        mov     ax, A_71FA
        mov     bx, B_901B
        push    cx
        push    ds
        push    ax
        push    ds
        push    bx
        callf   SEG_DCC2:far_dcc2e
        add     sp, 0ah
        mov     byte ptr [B_71FB], 0
        mov     bl, byte ptr [B_8A9B]
        sub     bh, bh
        or      byte ptr [bx + TBL_90C1], 2
br_db74c:
        shl     word ptr [W_71E0], 1
        inc     si
        cmp     si, 10h
        jge     br_db758
        jmp     short br_db6dc
br_db758:
        mov     bx, word ptr [W_71E8]
        mov     word ptr [bx + TBL_954B], 0
br_db762:
        test    di, 4
        jnz     br_db76b
        jmp     br_db83d
br_db76b:
        mov     bx, 8
loop_db76e:
        sub     bx, 2
        jl      br_db7a6
        mov     ax, word ptr [bx + TBL_9543]
        cmp     ax, 0
        jz      loop_db76e
        mov     word ptr [W_71E8], bx
        mov     word ptr [W_71D8], ax
        cmp     byte ptr [B_96EE], 0
        jz      br_db7a6
        cmp     byte ptr [B_E423], 1
        jnz     br_db7a6
        cmp     byte ptr [B_A5C1], 8
        jc      br_db7a6
        cmp     byte ptr [B_E425], 0
        jz      br_db7a6
        test    byte ptr [B_7FF3], 1
        jnz     br_db7a9
br_db7a6:
        jmp     near br_db833
br_db7a9:
        mov     word ptr [W_71E0], 1
        mov     si, 0
        mov     byte ptr [B_7200], 3
br_db7b7:
        mov     ax, word ptr [W_71D8]
        test    word ptr [W_71E0], ax
        jnz     br_db7c3
        jmp     br_db827
        db      090h
br_db7c3:
        mov     ax, word ptr [W_71E8]
        shl     ax, 3
        add     ax, si
        mov     byte ptr [B_7201], al
        push    ax
        callf   SEG_DA5F:far_da706
        add     sp, 2
        and     al, 7fh
        mov     byte ptr [B_7202], al
        mov     al, byte ptr [B_7202]
        test    al, al
        jz      br_db7f7
        cmp     al, 7fh
        jz      br_db7f7
        mov     cl, byte ptr [si + TBL_71EA]
        sub     cl, al
        jns     br_db7f1
        neg     cl
br_db7f1:
        cmp     cl, byte ptr [B_807D]
        jl      br_db827
br_db7f7:
        mov     byte ptr [si + TBL_71EA], al
        mov     al, byte ptr [B_8A9B]
        mov     byte ptr [B_71FB], al
        mov     cx, 9
        mov     ax, A_71FA
        mov     bx, B_901B
        push    cx
        push    ds
        push    ax
        push    ds
        push    bx
        callf   SEG_DCC2:far_dcc2e
        add     sp, 0ah
        mov     byte ptr [B_71FB], 0
        mov     bl, byte ptr [B_8A9B]
        sub     bh, bh
        or      byte ptr [bx + TBL_90C1], 2
br_db827:
        shl     word ptr [W_71E0], 1
        inc     si
        cmp     si, 10h
        jge     br_db833
        jmp     short br_db7b7
br_db833:
        mov     bx, word ptr [W_71E8]
        mov     word ptr [bx + TBL_9543], 0
br_db83d:
        test    di, 10h
        jz      br_db8c2
        mov     cx, 40h
loop_db846:
        push    cx
        mov     al, cl
        dec     al
        mov     ah, 0ffh
        push    ax
        push    4
        push    ds
        if      FW_VERSION >= 312
        push    word P_71FA+0bh
        elseif  FW_VERSION = 311
        push    word P_71FA+0bh
        else
        push    word P_71FA+0bh
        endif
        mov     byte ptr [B_7207], 7bh
        callf   SEG_DCE1:far_dce14
        mov     byte ptr [B_7207], 40h
        callf   SEG_DCE1:far_dce14
        add     sp, 8
        pop     cx
        mov     bx, cx
        mov     byte ptr [bx + TBL_A57E], 0
        loop    loop_db846
        mov     byte ptr [B_7209], 80h
        mov     byte ptr [B_720A], 0
        mov     byte ptr [B_720C], 40h
        mov     cx, 80h
loop_db887:
        push    cx
        mov     bx, cx
        dec     bx
        mov     byte ptr [bx + TBL_966E], 0
        mov     byte ptr [bx + TBL_956E], 0
        mov     byte ptr [B_720B], bl
        mov     cx, 40h
loop_db89c:
        push    cx
        mov     al, cl
        dec     al
        mov     ah, 0ffh
        push    ax
        push    4
        push    ds
        push    word B_7209
        callf   SEG_DCE1:far_dce14
        add     sp, 8
        pop     cx
        loop    loop_db89c
        callf   SEG_DE41:far_de41c
        callf   SEG_DD18:far_dd1f5
        pop     cx
        loop    loop_db887
br_db8c2:
        test    di, 20h
        jz      br_db8f5
        mov     byte ptr [B_7209], 0f2h
        mov     ax, word ptr [W_D4AF]
        shl     ax, 1
        shr     al, 1
        and     ah, 7fh
        mov     byte ptr [B_720A], al
        mov     byte ptr [B_720B], ah
        push    word ptr [B_7FD0]
        push    3
        push    ds
        push    word B_7209
        callf   SEG_DD18:far_dd1c5
        add     sp, 8
        mov     byte ptr [B_96F0], 0
br_db8f5:
        test    di, 40h
        jz      br_db912
        mov     si, TBL_956E
        mov     bx, 7fh
        call    fn_dba91
        mov     si, TBL_966E
        mov     bx, 62h
        call    fn_dba91
        mov     byte ptr [B_956D], 0
br_db912:
        test    di, 80h
        jnz     br_db91b
        jmp     br_dba7d
br_db91b:
        xor     si, si
        sub     ch, ch
        mov     cl, byte ptr [B_955B]
        mov     di, cx
        mov     byte ptr [B_955B], 0
        push    es
        test    di, 40h
        jnz     br_db934
        jmp     br_db971
        db      090h
br_db934:
        mov     cx, 64h
        mov     bx, 0
loop_db93a:
        mov     al, byte ptr [bx + TBL_90C1]
        and     al, 3
        cmp     al, 2
        jnz     br_db96e
        mov     al, byte ptr [bx + TBL_91ED]
        cmp     al, 0
        jz      br_db96e
        dec     al
        mov     byte ptr [B_7209], 0c0h
        mov     byte ptr [B_720B], al
        mov     byte ptr [B_720A], bl
        push    bx
        push    cx
        push    0
        push    3
        push    ds
        push    word B_7209
        callf   SEG_DCF8:far_dcf84
        add     sp, 8
        pop     cx
        pop     bx
br_db96e:
        inc     bx
        loop    loop_db93a
br_db971:
        pop     es
        mov     ah, 0ffh
        mov     al, byte ptr [B_9445]
        mov     si, ax
        test    di, 1
        jnz     br_db982
        jmp     br_db9a6
        db      090h
br_db982:
        mov     byte ptr [B_7209], 0b0h
        mov     byte ptr [B_720A], 0
        mov     byte ptr [B_720B], 7ch
        mov     byte ptr [B_720C], 0
        push    0
        push    4
        push    ds
        push    word B_7209
        callf   SEG_DCF8:far_dcf84
        add     sp, 8
br_db9a6:
        test    di, 2
        jnz     br_db9af
        jmp     br_db9d3
        db      090h
br_db9af:
        mov     byte ptr [B_7209], 0b0h
        mov     byte ptr [B_720A], 0
        mov     byte ptr [B_720B], 7dh
        mov     byte ptr [B_720C], 0
        push    0
        push    4
        push    ds
        push    word B_7209
        callf   SEG_DCF8:far_dcf84
        add     sp, 8
br_db9d3:
        test    di, 4
        jnz     br_db9dc
        jmp     br_dba00
        db      090h
br_db9dc:
        mov     byte ptr [B_7209], 0b0h
        mov     byte ptr [B_720A], 0
        mov     byte ptr [B_720B], 7eh
        mov     byte ptr [B_720C], 0
        push    0
        push    4
        push    ds
        push    word B_7209
        callf   SEG_DCF8:far_dcf84
        add     sp, 8
br_dba00:
        test    di, 8
        jnz     br_dba09
        jmp     br_dba2d
        db      090h
br_dba09:
        mov     byte ptr [B_7209], 0b0h
        mov     byte ptr [B_720A], 0
        mov     byte ptr [B_720B], 7fh
        mov     byte ptr [B_720C], 0
        push    0
        push    4
        push    ds
        push    word B_7209
        callf   SEG_DCF8:far_dcf84
        add     sp, 8
br_dba2d:
        test    di, 10h
        jnz     br_dba36
        jmp     br_dba5f
        db      090h
br_dba36:
        mov     byte ptr [B_7209], 0c0h
        mov     al, byte ptr [B_8A9B]
        mov     byte ptr [B_720A], al
        callf   SEG_DCF8:far_dd0fb
        mov     ah, 0ffh
        push    0
        push    ax
        mov     al, byte ptr [B_9444]
        mov     byte ptr [B_720B], al
        push    3
        push    ds
        push    word B_7209
        callf   SEG_DCF8:far_dcfb5
        add     sp, 0ah
br_dba5f:
        test    di, 20h
        jnz     br_dba68
        jmp     br_dba7d
        db      090h
br_dba68:
        mov     byte ptr [B_7209], 0f6h
        push    0
        push    1
        push    ds
        push    word B_7209
        callf   SEG_DCF8:far_dcf84
        add     sp, 8
br_dba7d:
        callf   SEG_DE41:far_de41c
        pop     di
        pop     si
        retf
fn_dba85:
        push    si
        mov     si, TBL_956E
        mov     bx, 7fh
        call    fn_dba91
        pop     si
        retf
fn_dba91:
        push    bp
loop_dba92:
        cmp     byte ptr [bx+si], 0
        jz      br_dbac9
        sub     sp, 4
        mov     bp, sp
        mov     byte ptr [bp], 80h
        mov     al, byte ptr [B_8A9B]
        mov     byte ptr [bp + 1], al
        mov     byte ptr [bp + 2], bl
        mov     byte ptr [bp + 3], 40h
        push    bx
        callf   SEG_DCF8:far_dd0fb
        push    ax
        push    4
        push    ss
        push    bp
        callf   SEG_DCE1:far_dce14
        add     sp, 8
        pop     bx
        add     sp, 4
        mov     al, byte ptr [B_A571]
        mov     byte ptr [bx+si], al
br_dbac9:
        dec     bx
        jge     loop_dba92
        mov     byte ptr [B_A571], 0
        pop     bp
        ret
fn_dbad3:
        cmp     byte ptr [B_96EE], 0
        jz      br_dbaf0
        mov     al, byte ptr [B_8A9B]
        mov     byte ptr [bx + 1], al
        push    0
        push    cx
        push    ds
        push    bx
        callf   SEG_DCF8:far_dcf84
        add     sp, 8
        jmp     br_dbafa
        db      090h
br_dbaf0:
        push    ds
        push    bx
        callf   SEG_CB77:far_cb772
        add     sp, 4
br_dbafa:
        ret
        if      FW_VERSION >= 312
        phase   0bh
fn_dbafb:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     byte ptr [B_F2B2], 0
        mov     byte ptr [B_8437], 0
        mov     byte ptr [B_D4B4], 1
        cmp     byte ptr [B_8800], 0
        jz      br_dbb1c
        mov     ax, 47h
        jmp     br_dbb1f
br_dbb1c:
        mov     ax, 4dh
br_dbb1f:
        mov     word ptr [bp - 2], ax
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        push    0ff89h
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        leave
        retf
far_dbb3a:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     word ptr [bp - 2], 0
        mov     al, byte ptr [bp + 6]
        cbw
        cmp     ax, 5ah
        jnz     br_dbb51
        jmp     near br_dbc06
br_dbb51:
        jg      br_dbb67
        sub     ax, 56h
        mov     bx, ax
        cmp     bx, 3
        jbe     br_dbb60
        jmp     br_dbc3b
br_dbb60:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_dbc4f]
br_dbb67:
        cmp     ax, 76h
        jz      br_dbbac
        jg      br_dbb7e
        cmp     ax, 6ah
        jz      br_dbbcf
        cmp     ax, 70h
        jnz     br_dbb7b
        jmp     near br_dbc36
br_dbb7b:
        jmp     near br_dbc3b
br_dbb7e:
        cmp     ax, 77h
        jz      br_dbbbc
        jmp     near br_dbc3b
tgt_dbb86:
        or      byte ptr [B_F2B2], 10h
        cmp     byte ptr [B_A5C1], 8
        jl      br_dbb9a
        mov     word ptr [bp - 2], 87h
        jmp     near br_dbc3b
br_dbb9a:
        test    byte ptr [B_F2B2], 2
        jnz     br_dbba4
        jmp     near br_dbc3b
br_dbba4:
        mov     word ptr [bp - 2], 86h
        jmp     near br_dbc3b
br_dbbac:
        and     byte ptr [B_F2B2], 0efh
        jmp     near br_dbc3b
tgt_dbbb4:
        or      byte ptr [B_F2B2], 8
        jmp     near br_dbc3b
br_dbbbc:
        and     byte ptr [B_F2B2], 0f7h
        jmp     short br_dbc3b
tgt_dbbc3:
        or      byte ptr [B_F2B2], 4
        mov     word ptr [bp - 2], 83h
        jmp     br_dbc3b
br_dbbcf:
        and     byte ptr [B_F2B2], 0fbh
        jmp     br_dbc3b
tgt_dbbd6:
        or      byte ptr [B_F2B2], 2
        test    byte ptr [B_F2B2], 8
        jz      br_dbbe4
        jmp     br_dbc3b
br_dbbe4:
        test    byte ptr [B_F2B2], 4
        jz      br_dbbf1
        push    cs
        call    fn_dbafb
        jmp     br_dbc3b
br_dbbf1:
        test    byte ptr [B_F2B2], 10h
        jz      br_dbbff
        mov     word ptr [bp - 2], 84h
        jmp     br_dbc3b
br_dbbff:
        mov     word ptr [bp - 2], 82h
        jmp     br_dbc3b
br_dbc06:
        or      byte ptr [B_F2B2], 1
        test    byte ptr [B_F2B2], 8
        jz      br_dbc14
        jmp     br_dbc3b
br_dbc14:
        test    byte ptr [B_F2B2], 4
        jz      br_dbc21
        push    cs
        call    fn_dbafb
        jmp     br_dbc3b
br_dbc21:
        test    byte ptr [B_F2B2], 10h
        jz      br_dbc2f
        mov     word ptr [bp - 2], 85h
        jmp     br_dbc3b
br_dbc2f:
        mov     word ptr [bp - 2], 81h
        jmp     br_dbc3b
br_dbc36:
        and     byte ptr [B_F2B2], 0fch
br_dbc3b:
        cmp     word ptr [bp - 2], 0
        jz      br_dbc4d
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_D79E:far_d7adf
        add     sp, 2
br_dbc4d:
        leave
        retf
TBL_dbc4f:
        dw      tgt_dbb86
        dw      tgt_dbbb4
        dw      tgt_dbbc3
        dw      tgt_dbbd6
fn_dbc57:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_D79E:far_d7aa3
        add     sp, 4
        or      ax, ax
        jge     br_dbc74
        xor     ax, ax
        pop     si
        leave
        retf
br_dbc74:
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0f0h
        mov     byte ptr es:[bx + 1], 7fh
        mov     byte ptr es:[bx + 2], 7fh
        mov     byte ptr es:[bx + 3], 6
        mov     si, 4
br_dbc8d:
        test    byte ptr [bp - 1], 80h
        jnz     br_dbc96
        jmp     br_dbdf8
br_dbc96:
        cmp     si, 2bh
        jl      br_dbc9e
        jmp     br_dbe18
br_dbc9e:
        mov     al, byte ptr [bp - 1]
        push    ax
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        sub     ax, 80h
        mov     bx, ax
        cmp     bx, 8
        jbe     br_dbcbc
        jmp     br_dbe18
br_dbcbc:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_dbe27]
tgt_dbcc3:
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word W_D5F3
        callf   SEG_EB15:far_eb17e
        add     sp, 8
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 44h
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 6
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 1
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 2]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 3]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 4]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 5]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx], al
        inc     si
        jmp     br_dbe18
tgt_dbd31:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 44h
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 6
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 1
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [B_8A97]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [B_8A96]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [B_8A95]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [B_8A94]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [TBL_8A93]
        mov     byte ptr es:[bx], al
        inc     si
        cmp     byte ptr [bp - 1], 81h
        jnz     br_dbd9d
        push    0ff82h
        callf   SEG_D79E:far_d7ac9
        add     sp, 2
        jmp     short br_dbe18
br_dbd9d:
        push    0ff84h
        callf   SEG_D79E:far_d7ac9
        add     sp, 2
        jmp     br_dbe18
tgt_dbda9:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 3
        inc     si
        jmp     br_dbe18
tgt_dbdb5:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 1
        inc     si
        jmp     br_dbe18
tgt_dbdc1:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 6
        inc     si
        jmp     br_dbe18
tgt_dbdcd:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 7
        inc     si
        jmp     br_dbe18
tgt_dbdd9:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 0dh
        inc     si
loop_dbde3:
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_D79E:far_d7aa3
        add     sp, 4
        or      ax, ax
        jge     loop_dbde3
        jmp     br_dbe18
fn_dbdf6:
        jmp     br_dbe18
br_dbdf8:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 1]
        mov     byte ptr es:[bx], al
        inc     si
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_D79E:far_d7aa3
        add     sp, 4
        or      ax, ax
        jl      br_dbe18
        jmp     br_dbc8d
br_dbe18:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 0f7h
        inc     si
        mov     ax, si
        pop     si
        leave
        retf
TBL_dbe27:
        dw      tgt_dbcc3
        dw      tgt_dbd31
        dw      tgt_dbda9
        dw      tgt_dbdb5
        dw      tgt_dbdc1
        dw      tgt_dbd31
        dw      tgt_dbdc1
        dw      tgt_dbdcd
        dw      tgt_dbdd9
far_dbe39:
        push    bp
        mov     bp, sp
        sub     sp, 3ch
        jmp     br_dbe53
loop_dbe41:
        mov     al, byte ptr [B_8438]
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        callf   SEG_DD18:far_dd1c5
        add     sp, 8
br_dbe53:
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        push    cs
        call    fn_dbc57
        add     sp, 4
        mov     dx, ax
        or      ax, ax
        jnz     loop_dbe41
        leave
        retf
        phase   7
        elseif  FW_VERSION = 311
        phase   1
fn_dbafb:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     byte ptr [B_F2B2], 0
        mov     byte ptr [B_8437], 0
        mov     byte ptr [B_D4B4], 1
        cmp     byte ptr [B_8800], 0
        jz      br_dbb1c
        mov     ax, 47h
        jmp     br_dbb1f
br_dbb1c:
        mov     ax, 4dh
br_dbb1f:
        mov     word ptr [bp - 2], ax
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        push    0ff89h
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        leave
        retf
far_dbb3a:
        push    bp
        mov     bp, sp
        sub     sp, 2
        mov     word ptr [bp - 2], 0
        mov     al, byte ptr [bp + 6]
        cbw
        cmp     ax, 5ah
        jnz     br_dbb51
        jmp     near br_dbc06
br_dbb51:
        jg      br_dbb67
        sub     ax, 56h
        mov     bx, ax
        cmp     bx, 3
        jbe     br_dbb60
        jmp     br_dbc3b
br_dbb60:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_dbc4f]
br_dbb67:
        cmp     ax, 76h
        jz      br_dbbac
        jg      br_dbb7e
        cmp     ax, 6ah
        jz      br_dbbcf
        cmp     ax, 70h
        jnz     br_dbb7b
        jmp     near br_dbc36
br_dbb7b:
        jmp     near br_dbc3b
br_dbb7e:
        cmp     ax, 77h
        jz      br_dbbbc
        jmp     near br_dbc3b
tgt_dbb86:
        or      byte ptr [B_F2B2], 10h
        cmp     byte ptr [B_A5C1], 8
        jl      br_dbb9a
        mov     word ptr [bp - 2], 87h
        jmp     near br_dbc3b
br_dbb9a:
        test    byte ptr [B_F2B2], 2
        jnz     br_dbba4
        jmp     near br_dbc3b
br_dbba4:
        mov     word ptr [bp - 2], 86h
        jmp     near br_dbc3b
br_dbbac:
        and     byte ptr [B_F2B2], 0efh
        jmp     near br_dbc3b
tgt_dbbb4:
        or      byte ptr [B_F2B2], 8
        jmp     near br_dbc3b
br_dbbbc:
        and     byte ptr [B_F2B2], 0f7h
        jmp     short br_dbc3b
tgt_dbbc3:
        or      byte ptr [B_F2B2], 4
        mov     word ptr [bp - 2], 83h
        jmp     br_dbc3b
br_dbbcf:
        and     byte ptr [B_F2B2], 0fbh
        jmp     br_dbc3b
tgt_dbbd6:
        or      byte ptr [B_F2B2], 2
        test    byte ptr [B_F2B2], 8
        jz      br_dbbe4
        jmp     br_dbc3b
br_dbbe4:
        test    byte ptr [B_F2B2], 4
        jz      br_dbbf1
        push    cs
        call    fn_dbafb
        jmp     br_dbc3b
br_dbbf1:
        test    byte ptr [B_F2B2], 10h
        jz      br_dbbff
        mov     word ptr [bp - 2], 84h
        jmp     br_dbc3b
br_dbbff:
        mov     word ptr [bp - 2], 82h
        jmp     br_dbc3b
br_dbc06:
        or      byte ptr [B_F2B2], 1
        test    byte ptr [B_F2B2], 8
        jz      br_dbc14
        jmp     br_dbc3b
br_dbc14:
        test    byte ptr [B_F2B2], 4
        jz      br_dbc21
        push    cs
        call    fn_dbafb
        jmp     br_dbc3b
br_dbc21:
        test    byte ptr [B_F2B2], 10h
        jz      br_dbc2f
        mov     word ptr [bp - 2], 85h
        jmp     br_dbc3b
br_dbc2f:
        mov     word ptr [bp - 2], 81h
        jmp     br_dbc3b
br_dbc36:
        and     byte ptr [B_F2B2], 0fch
br_dbc3b:
        cmp     word ptr [bp - 2], 0
        jz      br_dbc4d
        mov     al, byte ptr [bp - 2]
        push    ax
        callf   SEG_D79E:far_d7adf
        add     sp, 2
br_dbc4d:
        leave
        retf
TBL_dbc4f:
        dw      tgt_dbb86
        dw      tgt_dbbb4
        dw      tgt_dbbc3
        dw      tgt_dbbd6
fn_dbc57:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_D79E:far_d7aa3
        add     sp, 4
        or      ax, ax
        jge     br_dbc74
        xor     ax, ax
        pop     si
        leave
        retf
br_dbc74:
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0f0h
        mov     byte ptr es:[bx + 1], 7fh
        mov     byte ptr es:[bx + 2], 7fh
        mov     byte ptr es:[bx + 3], 6
        mov     si, 4
br_dbc8d:
        test    byte ptr [bp - 1], 80h
        jnz     br_dbc96
        jmp     br_dbdf8
br_dbc96:
        cmp     si, 2bh
        jl      br_dbc9e
        jmp     br_dbe18
br_dbc9e:
        mov     al, byte ptr [bp - 1]
        push    ax
        callf   SEG_D79E:far_d7a63
        add     sp, 2
        mov     al, byte ptr [bp - 1]
        mov     ah, 0
        sub     ax, 80h
        mov     bx, ax
        cmp     bx, 8
        jbe     br_dbcbc
        jmp     br_dbe18
br_dbcbc:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_dbe27]
tgt_dbcc3:
        push    ss
        lea     ax, [bp - 6]
        push    ax
        push    ds
        push    word W_D5F3
        callf   SEG_EB15:far_eb17e
        add     sp, 8
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 44h
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 6
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 1
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 2]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 3]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 4]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 5]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 6]
        mov     byte ptr es:[bx], al
        inc     si
        jmp     br_dbe18
tgt_dbd31:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 44h
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 6
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 1
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [B_8A97]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [B_8A96]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [B_8A95]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [B_8A94]
        mov     byte ptr es:[bx], al
        inc     si
        mov     bx, word ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [TBL_8A93]
        mov     byte ptr es:[bx], al
        inc     si
        cmp     byte ptr [bp - 1], 81h
        jnz     br_dbd9d
        push    0ff82h
        callf   SEG_D79E:far_d7ac9
        add     sp, 2
        jmp     short br_dbe18
br_dbd9d:
        push    0ff84h
        callf   SEG_D79E:far_d7ac9
        add     sp, 2
        jmp     br_dbe18
tgt_dbda9:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 3
        inc     si
        jmp     br_dbe18
tgt_dbdb5:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 1
        inc     si
        jmp     br_dbe18
tgt_dbdc1:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 6
        inc     si
        jmp     br_dbe18
tgt_dbdcd:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 7
        inc     si
        jmp     br_dbe18
tgt_dbdd9:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 0dh
        inc     si
loop_dbde3:
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_D79E:far_d7aa3
        add     sp, 4
        or      ax, ax
        jge     loop_dbde3
        jmp     br_dbe18
fn_dbdf6:
        jmp     br_dbe18
br_dbdf8:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     al, byte ptr [bp - 1]
        mov     byte ptr es:[bx], al
        inc     si
        push    ss
        lea     ax, [bp - 1]
        push    ax
        callf   SEG_D79E:far_d7aa3
        add     sp, 4
        or      ax, ax
        jl      br_dbe18
        jmp     br_dbc8d
br_dbe18:
        les     bx, dword ptr [bp + 6]
        add     bx, si
        mov     byte ptr es:[bx], 0f7h
        inc     si
        mov     ax, si
        pop     si
        leave
        retf
TBL_dbe27:
        dw      tgt_dbcc3
        dw      tgt_dbd31
        dw      tgt_dbda9
        dw      tgt_dbdb5
        dw      tgt_dbdc1
        dw      tgt_dbd31
        dw      tgt_dbdc1
        dw      tgt_dbdcd
        dw      tgt_dbdd9
far_dbe39:
        push    bp
        mov     bp, sp
        sub     sp, 3ch
        jmp     br_dbe53
loop_dbe41:
        mov     al, byte ptr [B_8438]
        push    ax
        push    dx
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        callf   SEG_DD18:far_dd1c5
        add     sp, 8
br_dbe53:
        push    ss
        lea     ax, [bp - 3ch]
        push    ax
        push    cs
        call    fn_dbc57
        add     sp, 4
        mov     dx, ax
        or      ax, ax
        jnz     loop_dbe41
        leave
        retf
        phase   0dh
        else
        phase   1
        endif
far_dbe67:
        push    bp
        mov     bp, sp
        sub     sp, 6
        push    si
        push    di
        mov     si, word ptr [bp + 0ah]
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0ffh
        jnz     br_dbe84
        mov     byte ptr [B_F743], 0
        pop     di
        pop     si
        leave
        retf
br_dbe84:
        cmp     word ptr [W_9053], 3e7h
        jle     br_dbe90
        pop     di
        pop     si
        leave
        retf
br_dbe90:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DE4C:far_de4c2
        add     sp, 4
        mov     word ptr [bp - 2], ax
        mov     bx, word ptr [bp - 2]
        cmp     bx, 0ch
        jbe     br_dbeac
        jmp     br_dc01d
br_dbeac:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_dc021]
tgt_dbeb3:
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 2]
        mov     dx, word ptr es:[bx]
        mov     word ptr [W_F4FC], ax
        mov     word ptr [W_F4FA], dx
        pop     di
        pop     si
        leave
        retf
tgt_dbec8:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        and     ax, 7fh
        mov     di, ax
        cmp     word ptr [bp + 0ch], 0
        jz      br_dbee9
        mov     al, byte ptr es:[bx + 3]
        cmp     al, byte ptr [di + TBL_F47A]
        jg      br_dbee9
        jmp     br_dc01d
br_dbee9:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        and     al, 3
        mov     byte ptr [di + TBL_F2BA], al
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [di + TBL_F47A], al
        mov     al, byte ptr es:[bx + 4]
        mov     byte ptr [di + TBL_F3FA], al
        mov     al, byte ptr es:[bx + 5]
        mov     byte ptr [di + TBL_F37A], al
        mov     al, byte ptr es:[bx + 6]
        mov     byte ptr [di + TBL_F2FA], al
        mov     byte ptr [B_D4BD], 1
        pop     di
        pop     si
        leave
        retf
tgt_dbf1e:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        and     ax, 7fh
        mov     dl, byte ptr es:[bx + 3]
        mov     bx, ax
        mov     byte ptr [bx + TBL_F4FE], dl
        pop     di
        pop     si
        leave
        retf
tgt_dbf38:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        and     ax, 7fh
        mov     dl, byte ptr es:[bx + 3]
        mov     bx, ax
        mov     byte ptr [bx + TBL_F57E], dl
        pop     di
        pop     si
        leave
        retf
tgt_dbf52:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [B_F5FE], al
        pop     di
        pop     si
        leave
        retf
tgt_dbf60:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [B_F5FF], al
        pop     di
        pop     si
        leave
        retf
tgt_dbf6e:
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 2]
        mov     word ptr [W_F600], ax
        pop     di
        pop     si
        leave
        retf
tgt_dbf7c:
        mov     ax, word ptr [W_D4A8]
        mov     dx, word ptr [W_D4A6]
        mov     word ptr [bp - 4], ax
        mov     word ptr [bp - 6], dx
        xor     dx, dx
        cmp     dx, si
        jge     br_dbfa6
loop_dbf8f:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        les     bx, dword ptr [bp - 6]
        mov     byte ptr es:[bx], al
        inc     word ptr [bp + 6]
        inc     word ptr [bp - 6]
        inc     dx
        cmp     dx, si
        jl      loop_dbf8f
br_dbfa6:
        mov     word ptr [W_F2B4], si
        pop     di
        pop     si
        leave
        retf
tgt_dbfae:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        and     ax, 3fh
        mov     dl, byte ptr es:[bx + 8]
        mov     bx, ax
        mov     byte ptr [bx + TBL_F602], dl
        pop     di
        pop     si
        leave
        retf
tgt_dbfc8:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        and     ax, 3fh
        mov     dl, byte ptr es:[bx + 8]
        mov     bx, ax
        mov     byte ptr [bx + TBL_F642], dl
        pop     di
        pop     si
        leave
        retf
tgt_dbfe2:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        and     ax, 3fh
        mov     dl, byte ptr es:[bx + 8]
        mov     bx, ax
        mov     byte ptr [bx + TBL_F682], dl
        pop     di
        pop     si
        leave
        retf
tgt_dbffc:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        and     ax, 3fh
        shl     ax, 1
        mov     dx, word ptr es:[bx + 8]
        mov     bx, ax
        mov     word ptr [bx + TBL_F6C2], dx
        pop     di
        pop     si
        leave
        retf
tgt_dc018:
        mov     byte ptr [B_F742], 0
br_dc01d:
        pop     di
        pop     si
        leave
        retf
TBL_dc021:
        dw      tgt_dbeb3
        dw      tgt_dbec8
        dw      tgt_dbf1e
        dw      tgt_dbf38
        dw      tgt_dbf52
        dw      tgt_dbf60
        dw      tgt_dbf6e
        dw      tgt_dbf7c
        dw      tgt_dbfae
        dw      tgt_dbfc8
        dw      tgt_dbfe2
        dw      tgt_dbffc
        dw      tgt_dc018
far_dc03b:
        push    bp
        mov     bp, sp
        push    si
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0ffh
        jnz     br_dc050
        mov     byte ptr [B_F743], 0ffh
        pop     si
        pop     bp
        retf
br_dc050:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DE4C:far_de4c2
        add     sp, 4
        mov     bx, ax
        cmp     bx, 0ch
        jbe     br_dc068
        jmp     br_dc142
br_dc068:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_dc145]
tgt_dc06f:
        mov     word ptr [W_F4FC], 0ffffh
        mov     word ptr [W_F4FA], 0ffffh
        pop     si
        pop     bp
        retf
tgt_dc07e:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        and     ax, 7fh
        mov     si, ax
        mov     byte ptr [si + TBL_F47A], 0ffh
        pop     si
        pop     bp
        retf
tgt_dc094:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        and     ax, 7fh
        mov     bx, ax
        mov     byte ptr [bx + TBL_F4FE], 0ffh
        pop     si
        pop     bp
        retf
tgt_dc0aa:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        and     ax, 7fh
        mov     bx, ax
        mov     byte ptr [bx + TBL_F57E], 0ffh
        pop     si
        pop     bp
        retf
tgt_dc0c0:
        mov     byte ptr [B_F5FE], 0ffh
        pop     si
        pop     bp
        retf
tgt_dc0c8:
        mov     byte ptr [B_F5FF], 0ffh
        pop     si
        pop     bp
        retf
tgt_dc0d0:
        mov     word ptr [W_F600], 0ffffh
        pop     si
        pop     bp
        retf
tgt_dc0d9:
        mov     word ptr [W_F2B4], 0
        pop     si
        pop     bp
        retf
tgt_dc0e2:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        and     ax, 3fh
        mov     bx, ax
        mov     byte ptr [bx + TBL_F602], 0ffh
        pop     si
        pop     bp
        retf
tgt_dc0f8:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        and     ax, 3fh
        mov     bx, ax
        mov     byte ptr [bx + TBL_F642], 0ffh
        pop     si
        pop     bp
        retf
tgt_dc10e:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        and     ax, 3fh
        mov     bx, ax
        mov     byte ptr [bx + TBL_F682], 0ffh
        pop     si
        pop     bp
        retf
tgt_dc124:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 7]
        mov     ah, 0
        and     ax, 3fh
        shl     ax, 1
        mov     bx, ax
        mov     word ptr [bx + TBL_F6C2], 0ffffh
        pop     si
        pop     bp
        retf
tgt_dc13d:
        mov     byte ptr [B_F742], 0ffh
br_dc142:
        pop     si
        pop     bp
        retf
TBL_dc145:
        dw      tgt_dc06f
        dw      tgt_dc07e
        dw      tgt_dc094
        dw      tgt_dc0aa
        dw      tgt_dc0c0
        dw      tgt_dc0c8
        dw      tgt_dc0d0
        dw      tgt_dc0d9
        dw      tgt_dc0e2
        dw      tgt_dc0f8
        dw      tgt_dc10e
        dw      tgt_dc124
        dw      tgt_dc13d
far_dc15f:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        mov     word ptr [bp - 0ch], ax
        and     byte ptr es:[bx], 0f0h
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        cmp     ax, 80h
        jz      br_dc187
        cmp     ax, 90h
        jz      br_dc1f6
        jmp     br_dc280
br_dc187:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        and     ax, 7fh
        mov     si, ax
        cmp     byte ptr [B_96EE], 0
        jz      br_dc1a3
        mov     byte ptr [si + TBL_966E], 0
        jmp     br_dc1ae
br_dc1a3:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [si + TBL_F3FA], al
br_dc1ae:
        cmp     byte ptr [B_7FE4], 0
        jz      br_dc1e4
        mov     bx, si
        shl     bx, 1
        mov     dx, word ptr [W_8820]
        sub     dx, word ptr [bx + TBL_A3E7]
        cmp     dx, 1
        jge     br_dc1c9
        mov     dx, 1
br_dc1c9:
        push    dx
        callf   SEG_DAA8:far_daabc
        add     sp, 2
        mov     dx, ax
        mov     byte ptr [si + TBL_F37A], dl
        sar     ax, 8
        mov     byte ptr [si + TBL_F2FA], al
        mov     byte ptr [B_D4BD], 1
br_dc1e4:
        cmp     byte ptr [si + TBL_F47A], 0ffh
        jnz     br_dc1ee
        jmp     near br_dc292
br_dc1ee:
        mov     byte ptr [B_D4BD], 1
        jmp     near br_dc292
br_dc1f6:
        mov     al, byte ptr [bp - 0ch]
        or      al, 98h
        mov     byte ptr [bp - 0ah], al
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 1]
        mov     byte ptr [bp - 9], al
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [bp - 8], al
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [bp - 7], al
        mov     al, byte ptr es:[bx + 4]
        mov     byte ptr [bp - 6], al
        mov     al, byte ptr [bp - 8]
        mov     ah, 0
        and     ax, 7fh
        shl     ax, 1
        mov     dx, word ptr [W_8820]
        mov     bx, ax
        mov     word ptr [bx + TBL_A3E7], dx
        mov     al, byte ptr [B_8809]
        mov     ah, 0
        add     ax, 0fffch
        mov     dx, ax
        or      dx, dx
        jg      br_dc242
        mov     dx, 14h
br_dc242:
        mov     byte ptr [bp - 5], dl
        mov     byte ptr [bp - 4], 0
        cmp     byte ptr [B_96EE], 0
        jz      br_dc26e
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        push    ax
        cmp     byte ptr [B_817F], 0
        jz      br_dc266
        mov     al, byte ptr [B_8180]
        jmp     br_dc269
br_dc266:
        mov     al, byte ptr [bp - 7]
br_dc269:
        pop     bx
        mov     byte ptr [bx + TBL_966E], al
br_dc26e:
        push    0
        push    7
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    cs
        call    far_dbe67
        add     sp, 8
        jmp     br_dc292
br_dc280:
        push    0
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    cs
        call    far_dbe67
        add     sp, 8
br_dc292:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr [bp - 0ch]
        mov     byte ptr es:[bx], al
        pop     si
        leave
        retf
far_dc29e:
        push    di
        push    ds
        pop     es
        mov     di, TBL_F47A
        mov     ax, 0ffffh
        mov     ah, al
        mov     cx, 165h
        rep stosw
        mov     word ptr [W_F2B4], 0
        pop     di
        retf
far_dc2b6:
        xor     ax, ax
        mov     word ptr [W_F2B6], ax
        mov     word ptr [W_F2B8], ax
        retf
far_dc2bf:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     cl, byte ptr [bp + 0ch]
loop_dc2ca:
        mov     bx, word ptr [W_F2B8]
        cmp     bx, 0dh
        jbe     br_dc2d6
        jmp     br_dc837
br_dc2d6:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_dc845]
tgt_dc2dd:
        inc     word ptr [W_F2B8]
        cmp     word ptr [W_F4FC], 0ffffh
        jnz     br_dc2ef
        cmp     word ptr [W_F4FA], 0ffffh
        jz      loop_dc2ca
br_dc2ef:
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr [W_F4FC]
        mov     dx, word ptr [W_F4FA]
        mov     word ptr es:[bx + 2], ax
        mov     word ptr es:[bx], dx
        mov     ax, 4
        pop     di
        pop     si
        leave
        retf
tgt_dc307:
        mov     al, cl
        cbw
        or      ax, ax
        jnz     br_dc374
        cmp     byte ptr [B_7FE9], 1
        jnz     br_dc31c
        cmp     byte ptr [B_7FEA], 4
        jz      br_dc32a
br_dc31c:
        cmp     byte ptr [B_7FE9], 2
        jnz     br_dc374
        cmp     byte ptr [B_7FEA], 4
        jz      br_dc374
br_dc32a:
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     loop_dc2ca
loop_dc336:
        mov     bx, word ptr [W_F2B6]
        cmp     byte ptr [bx + TBL_F4FE], 0ffh
        jz      br_dc370
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0a0h
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [W_F2B6]
        mov     byte ptr es:[bx + 2], al
        mov     bx, word ptr [W_F2B6]
        mov     al, byte ptr [bx + TBL_F4FE]
        mov     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 3], al
        inc     word ptr [W_F2B6]
        mov     ax, 4
        pop     di
        pop     si
        leave
        retf
br_dc370:
        inc     word ptr [W_F2B6]
br_dc374:
        cmp     word ptr [W_F2B6], 80h
        jl      loop_dc336
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     near loop_dc2ca
tgt_dc389:
        mov     al, byte ptr [B_7FEA]
        mov     ah, 0
        mov     si, ax
        jmp     br_dc3f1
loop_dc392:
        mov     bx, word ptr [W_F2B6]
        cmp     byte ptr [bx + TBL_F57E], 0ffh
        jz      br_dc3ed
        mov     dx, word ptr [W_F2B6]
        add     dx, 9
        or      cl, cl
        jnz     br_dc3be
        cmp     byte ptr [B_7FE9], 1
        jnz     br_dc3b3
        cmp     si, dx
        jz      br_dc3ed
br_dc3b3:
        cmp     byte ptr [B_7FE9], 2
        jnz     br_dc3be
        cmp     si, dx
        jnz     br_dc3ed
br_dc3be:
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0b0h
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [W_F2B6]
        mov     byte ptr es:[bx + 2], al
        mov     bx, word ptr [W_F2B6]
        mov     al, byte ptr [bx + TBL_F57E]
        mov     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 3], al
        inc     word ptr [W_F2B6]
        mov     ax, 4
        pop     di
        pop     si
        leave
        retf
br_dc3ed:
        inc     word ptr [W_F2B6]
br_dc3f1:
        cmp     word ptr [W_F2B6], 80h
        jl      loop_dc392
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     loop_dc2ca
tgt_dc406:
        inc     word ptr [W_F2B8]
        mov     al, cl
        cbw
        or      ax, ax
        jnz     br_dc433
        cmp     byte ptr [B_7FE9], 1
        jnz     br_dc422
        cmp     byte ptr [B_7FEA], 1
        jnz     br_dc422
        jmp     loop_dc2ca
br_dc422:
        cmp     byte ptr [B_7FE9], 2
        jnz     br_dc433
        cmp     byte ptr [B_7FEA], 1
        jz      br_dc433
        jmp     loop_dc2ca
br_dc433:
        cmp     byte ptr [B_F5FE], 0ffh
        jnz     br_dc43d
        jmp     loop_dc2ca
br_dc43d:
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0c0h
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [B_F5FE]
        mov     byte ptr es:[bx + 2], al
        mov     ax, 3
        pop     di
        pop     si
        leave
        retf
tgt_dc459:
        inc     word ptr [W_F2B8]
        mov     al, cl
        cbw
        or      ax, ax
        jnz     br_dc486
        cmp     byte ptr [B_7FE9], 1
        jnz     br_dc475
        cmp     byte ptr [B_7FEA], 3
        jnz     br_dc475
        jmp     loop_dc2ca
br_dc475:
        cmp     byte ptr [B_7FE9], 2
        jnz     br_dc486
        cmp     byte ptr [B_7FEA], 3
        jz      br_dc486
        jmp     loop_dc2ca
br_dc486:
        cmp     byte ptr [B_F5FF], 0ffh
        jnz     br_dc490
        jmp     loop_dc2ca
br_dc490:
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0d0h
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [B_F5FF]
        mov     byte ptr es:[bx + 2], al
        mov     ax, 3
        pop     di
        pop     si
        leave
        retf
tgt_dc4ac:
        inc     word ptr [W_F2B8]
        mov     al, cl
        cbw
        or      ax, ax
        jnz     br_dc4d9
        cmp     byte ptr [B_7FE9], 1
        jnz     br_dc4c8
        cmp     byte ptr [B_7FEA], 2
        jnz     br_dc4c8
        jmp     loop_dc2ca
br_dc4c8:
        cmp     byte ptr [B_7FE9], 2
        jnz     br_dc4d9
        cmp     byte ptr [B_7FEA], 2
        jz      br_dc4d9
        jmp     loop_dc2ca
br_dc4d9:
        cmp     word ptr [W_F600], 0ffffh
        jnz     br_dc4e3
        jmp     loop_dc2ca
br_dc4e3:
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0e0h
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr es:[bx + 1], al
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        add     dx, 2
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     bx, word ptr [bp - 4]
        mov     ax, word ptr [W_F600]
        mov     word ptr es:[bx], ax
        mov     ax, 4
        pop     di
        pop     si
        leave
        retf
tgt_dc510:
        inc     word ptr [W_F2B8]
        mov     al, cl
        cbw
        or      ax, ax
        jnz     br_dc53d
        cmp     byte ptr [B_7FE9], 1
        jnz     br_dc52c
        cmp     byte ptr [B_7FEA], 5
        jnz     br_dc52c
        jmp     loop_dc2ca
br_dc52c:
        cmp     byte ptr [B_7FE9], 2
        jnz     br_dc53d
        cmp     byte ptr [B_7FEA], 5
        jz      br_dc53d
        jmp     loop_dc2ca
br_dc53d:
        cmp     word ptr [W_F2B4], 0
        jnz     br_dc547
        jmp     loop_dc2ca
br_dc547:
        mov     ax, word ptr [W_D4A8]
        mov     dx, word ptr [W_D4A6]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        mov     ax, word ptr [W_F2B4]
        cmp     ax, word ptr [bp + 0ah]
        jge     br_dc55f
        mov     word ptr [bp + 0ah], ax
br_dc55f:
        xor     dx, dx
        mov     di, word ptr [bp + 6]
        cmp     dx, word ptr [bp + 0ah]
        jge     br_dc581
loop_dc569:
        mov     es, word ptr [bp + 8]
        push    es
        les     bx, dword ptr [bp - 8]
        mov     al, byte ptr es:[bx]
        pop     es
        mov     byte ptr es:[di], al
        inc     word ptr [bp - 8]
        inc     di
        inc     dx
        cmp     dx, word ptr [bp + 0ah]
        jl      loop_dc569
br_dc581:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr es:[bx + 1], al
        mov     ax, word ptr [W_F2B4]
        pop     di
        pop     si
        leave
        retf
tgt_dc592:
        mov     al, cl
        cbw
        or      ax, ax
        jnz     br_dc608
        cmp     byte ptr [B_7FE9], 1
        jnz     br_dc5a7
        cmp     byte ptr [B_7FEA], 6
        jz      br_dc5b5
br_dc5a7:
        cmp     byte ptr [B_7FE9], 2
        jnz     br_dc608
        cmp     byte ptr [B_7FEA], 6
        jz      br_dc608
br_dc5b5:
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     loop_dc2ca
loop_dc5c2:
        mov     bx, word ptr [W_F2B6]
        cmp     byte ptr [bx + TBL_F602], 0ffh
        jz      br_dc604
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_dc887
        add     sp, 4
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx + 6], 1
        mov     al, byte ptr [W_F2B6]
        mov     byte ptr es:[bx + 7], al
        mov     bx, word ptr [W_F2B6]
        mov     al, byte ptr [bx + TBL_F602]
        mov     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 8], al
        inc     word ptr [W_F2B6]
        mov     ax, 9
        pop     di
        pop     si
        leave
        retf
br_dc604:
        inc     word ptr [W_F2B6]
br_dc608:
        cmp     word ptr [W_F2B6], 40h
        jl      loop_dc5c2
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     loop_dc2ca
tgt_dc61c:
        mov     al, cl
        cbw
        or      ax, ax
        jnz     br_dc692
        cmp     byte ptr [B_7FE9], 1
        jnz     br_dc631
        cmp     byte ptr [B_7FEA], 7
        jz      br_dc63f
br_dc631:
        cmp     byte ptr [B_7FE9], 2
        jnz     br_dc692
        cmp     byte ptr [B_7FEA], 7
        jz      br_dc692
br_dc63f:
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     loop_dc2ca
loop_dc64c:
        mov     bx, word ptr [W_F2B6]
        cmp     byte ptr [bx + TBL_F642], 0ffh
        jz      br_dc68e
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_dc887
        add     sp, 4
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx + 6], 2
        mov     al, byte ptr [W_F2B6]
        mov     byte ptr es:[bx + 7], al
        mov     bx, word ptr [W_F2B6]
        mov     al, byte ptr [bx + TBL_F642]
        mov     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 8], al
        inc     word ptr [W_F2B6]
        mov     ax, 9
        pop     di
        pop     si
        leave
        retf
br_dc68e:
        inc     word ptr [W_F2B6]
br_dc692:
        cmp     word ptr [W_F2B6], 40h
        jl      loop_dc64c
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     loop_dc2ca
tgt_dc6a6:
        mov     al, cl
        cbw
        or      ax, ax
        jnz     br_dc71c
        cmp     byte ptr [B_7FE9], 1
        jnz     br_dc6bb
        cmp     byte ptr [B_7FEA], 8
        jz      br_dc6c9
br_dc6bb:
        cmp     byte ptr [B_7FE9], 2
        jnz     br_dc71c
        cmp     byte ptr [B_7FEA], 8
        jz      br_dc71c
br_dc6c9:
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     loop_dc2ca
loop_dc6d6:
        mov     bx, word ptr [W_F2B6]
        cmp     byte ptr [bx + TBL_F682], 0ffh
        jz      br_dc718
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        nop
        push    cs
        call    fn_dc887
        add     sp, 4
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx + 6], 3
        mov     al, byte ptr [W_F2B6]
        mov     byte ptr es:[bx + 7], al
        mov     bx, word ptr [W_F2B6]
        mov     al, byte ptr [bx + TBL_F682]
        mov     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 8], al
        inc     word ptr [W_F2B6]
        mov     ax, 9
        pop     di
        pop     si
        leave
        retf
br_dc718:
        inc     word ptr [W_F2B6]
br_dc71c:
        cmp     word ptr [W_F2B6], 40h
        jl      loop_dc6d6
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     loop_dc2ca
tgt_dc730:
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     loop_dc2ca
tgt_dc73d:
        mov     al, cl
        cbw
        or      ax, ax
        jz      br_dc747
        jmp     near br_dc7e3
br_dc747:
        cmp     byte ptr [B_7FE9], 1
        jnz     br_dc755
        cmp     byte ptr [B_7FEA], 0
        jz      br_dc766
br_dc755:
        cmp     byte ptr [B_7FE9], 2
        jz      br_dc75f
        jmp     near br_dc7e3
br_dc75f:
        cmp     byte ptr [B_7FEA], 0
        jz      br_dc7e3
br_dc766:
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     loop_dc2ca
loop_dc773:
        mov     bx, word ptr [W_F2B6]
        cmp     byte ptr [bx + TBL_F47A], 0ffh
        jz      br_dc7df
        mov     al, 98h
        or      al, byte ptr [bx + TBL_F2BA]
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], al
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr es:[bx + 1], al
        mov     al, byte ptr [W_F2B6]
        mov     byte ptr es:[bx + 2], al
        mov     bx, word ptr [W_F2B6]
        mov     al, byte ptr [bx + TBL_F47A]
        mov     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 3], al
        mov     bx, word ptr [W_F2B6]
        mov     al, byte ptr [bx + TBL_F3FA]
        mov     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 4], al
        mov     bx, word ptr [W_F2B6]
        mov     al, byte ptr [bx + TBL_F37A]
        mov     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 5], al
        mov     bx, word ptr [W_F2B6]
        mov     al, byte ptr [bx + TBL_F2FA]
        mov     bx, word ptr [bp + 6]
        mov     byte ptr es:[bx + 6], al
        inc     word ptr [W_F2B6]
        mov     ax, 7
        pop     di
        pop     si
        leave
        retf
br_dc7df:
        inc     word ptr [W_F2B6]
br_dc7e3:
        cmp     word ptr [W_F2B6], 80h
        jl      loop_dc773
        mov     word ptr [W_F2B6], 0
        inc     word ptr [W_F2B8]
        jmp     loop_dc2ca
tgt_dc7f8:
        inc     word ptr [W_F2B8]
        cmp     byte ptr [B_F742], 0ffh
        jnz     br_dc806
        jmp     loop_dc2ca
br_dc806:
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0e8h
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr es:[bx + 1], al
        mov     ax, 2
        pop     di
        pop     si
        leave
        retf
tgt_dc81b:
        inc     word ptr [W_F2B8]
        cmp     byte ptr [B_F743], 0ffh
        jnz     br_dc829
        jmp     loop_dc2ca
br_dc829:
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0ffh
        mov     ax, 1
        pop     di
        pop     si
        leave
        retf
br_dc837:
        xor     ax, ax
        mov     word ptr [W_F2B6], ax
        mov     word ptr [W_F2B8], ax
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
TBL_dc845:
        dw      tgt_dc2dd
        dw      tgt_dc307
        dw      tgt_dc389
        dw      tgt_dc406
        dw      tgt_dc459
        dw      tgt_dc4ac
        dw      tgt_dc510
        dw      tgt_dc592
        dw      tgt_dc61c
        dw      tgt_dc6a6
        dw      tgt_dc730
        dw      tgt_dc73d
        dw      tgt_dc7f8
        dw      tgt_dc81b
far_dc861:
        push    bp
        mov     bp, sp
        sub     sp, 0ah
        push    si
        mov     si, word ptr [bp + 6]
        push    cs
        call    far_dc2b6
        jmp     br_dc881
loop_dc871:
        push    0
        push    0ah
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        push    cs
        call    far_dc2bf
        add     sp, 8
br_dc881:
        dec     si
        jg      loop_dc871
        pop     si
        leave
        retf
fn_dc887:
        push    bp
        mov     bp, sp
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx], 0f0h
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr es:[bx + 1], al
        mov     byte ptr es:[bx + 2], 47h
        mov     byte ptr es:[bx + 3], 0
        mov     byte ptr es:[bx + 4], 44h
        mov     byte ptr es:[bx + 5], 45h
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   0eh
        elseif  FW_VERSION = 311
        phase   4
        else
        phase   8
        endif
far_dc8ae:
        push    si
        les     bx, dword ptr [W_D641]
        mov     word ptr [W_D645], bx
        mov     word ptr [W_D647], es
        callf   SEG_D5E4:far_d5fd0
        mov     word ptr [W_D641], bx
        mov     word ptr [W_D643], cx
        mov     bl, byte ptr [B_D60A]
        xor     bh, bh
        jmp     word ptr cs:[word bx + TBL_dc8d3]
TBL_dc8d3:
        dw      tgt_dc8e9
        dw      tgt_dca0d
        dw      tgt_dc9c9
        dw      tgt_dc9d7
        dw      tgt_dca0d
        dw      tgt_dca0d
        dw      tgt_dc9fb
        dw      tgt_dca0d
        dw      tgt_dc9fb
        dw      tgt_dca07
        dw      tgt_dc9fb
tgt_dc8e9:
        cmp     byte ptr [B_7FD1], 1
        jnz     br_dc90e
        cmp     byte ptr [B_901B], 0
        jge     br_dc8ff
        mov     byte ptr [B_D60A], 0eh
        jmp     tgt_dca0d
br_dc8ff:
        test    byte ptr [B_A5C2], 15h
        jz      br_dc90e
        mov     byte ptr [B_D60A], 0eh
        jmp     tgt_dca0d
br_dc90e:
        sub     ax, ax
        mov     word ptr [W_D60C], ax
        mov     byte ptr [TBL_A5CA], al
        mov     ah, 0
        mov     al, 4
        int     46h
        mov     byte ptr [B_A5C9], 0
        mov     ah, 0
        mov     al, 3
        int     46h
        cmp     byte ptr [B_7FD1], 1
        jnz     br_dc98a
        call    fn_dca1b
        jnc     br_dc94c
        mov     byte ptr [B_D60A], 4
        mov     ax, word ptr [W_8A8F]
        mov     word ptr [W_D635], ax
        mov     ax, word ptr [W_8A91]
        mov     word ptr [W_D637], ax
        callf   SEG_DD59:far_dd6e7
        jmp     near tgt_dca0d
br_dc94c:
        mov     si, B_D5EE
        callf   SEG_EB63:far_eb63c
        add     ax, 2
        adc     dx, 0
        mov     word ptr [W_D635], ax
        mov     word ptr [W_D637], dx
        mov     ax, word ptr [TBL_D5EF]
        mov     word ptr [B_D604], ax
        mov     ax, word ptr [W_D5F1]
        mov     word ptr [B_D606], ax
        mov     word ptr [W_D60C], 1
        mov     byte ptr [B_D60A], 0ah
        mov     byte ptr [B_956C], 0c8h
        mov     cl, 40h
        mov     bx, A_12C6
        callf   SEG_DAC6:far_dac6a
        jmp     near tgt_dca0d
br_dc98a:
        mov     word ptr [W_D60C], 1
        cmp     byte ptr [B_D5EB], 0
        jnz     br_dc9ad
        mov     byte ptr [B_D60A], 10h
        sub     ax, ax
        mov     word ptr [W_D635], ax
        mov     word ptr [W_D637], ax
        mov     word ptr [W_D639], ax
        mov     word ptr [W_D63B], ax
        jmp     tgt_dca0d
        db      090h
br_dc9ad:
        mov     byte ptr [B_D60A], 12h
        cmp     byte ptr [B_D5EB], 2
        jz      br_dc9c1
        callf   SEG_DD59:far_dd6e7
        jmp     tgt_dca0d
        db      090h
br_dc9c1:
        callf   SEG_DD59:far_dd6e2
        jmp     tgt_dca0d
        db      090h
tgt_dc9c9:
        call    fn_dca1b
        jc      br_dc9f8
        mov     word ptr [W_D60C], 1
        jmp     tgt_dca0d
        db      090h
tgt_dc9d7:
        mov     ax, word ptr [TBL_D5EF]
        mov     word ptr [B_D604], ax
        mov     ax, word ptr [W_D5F1]
        mov     word ptr [B_D606], ax
        call    fn_dca1b
        jc      br_dc9f8
        mov     word ptr [W_D60C], 1
        mov     byte ptr [B_D60A], 8
        callf   SEG_DD59:far_dd6ec
br_dc9f8:
        jmp     tgt_dca0d
        db      090h
tgt_dc9fb:
        cmp     byte ptr [B_D5ED], 0
        jnz     tgt_dca0d
        callf   SEG_DE51:far_de51c
tgt_dca07:
        mov     word ptr [W_D60C], 1
tgt_dca0d:
        mov     ax, word ptr [W_D60C]
        add     word ptr [W_D635], ax
        adc     word ptr [W_D637], 0
        pop     si
        retf
fn_dca1b:
        mov     al, byte ptr [B_D5F2]
        cmp     al, byte ptr [B_8A97]
        jnz     br_dca3d
        mov     al, byte ptr [W_D5F1]
        cmp     al, byte ptr [B_8A96]
        jnz     br_dca3d
        mov     al, byte ptr [B_D5F0]
        cmp     al, byte ptr [B_8A95]
        jnz     br_dca3d
        mov     al, byte ptr [TBL_D5EF]
        cmp     al, byte ptr [B_8A94]
br_dca3d:
        ret
        if      FW_VERSION >= 312
        phase   0eh
        elseif  FW_VERSION = 311
        phase   4
        else
        phase   8
        endif
far_dca3e:
        push    es
        push    di
        push    si
        cmp     byte ptr [B_A570], 0
        jnz     br_dca6c
        cmp     byte ptr [B_901B], 0
        jnz     br_dca6c
        cmp     byte ptr [B_880B], 0
        jz      br_dca6c
        mov     byte ptr [B_880B], 0
        mov     ax, ds
        mov     es, ax
        std
        if      FW_VERSION >= 312
        mov     di, 0a566h
        elseif  FW_VERSION = 311
        mov     di, 0a4aeh
        else
        mov     di, 9f7bh
        endif
        mov     cx, 80h
br_dca66:
        mov     al, 0ffh
        repe scasb
        jnz     br_dca71
br_dca6c:
        cld
        pop     si
        pop     di
        pop     es
        retf
br_dca71:
        mov     bx, cx
        cmp     byte ptr [bx + TBL_A4E7], 0feh
        jnz     br_dca7d
        jmp     near br_dcb3e
br_dca7d:
        cmp     byte ptr [bx + TBL_A4E7], 0fdh
        jnz     br_dca8c
        mov     byte ptr [bx + TBL_A4E7], 0ffh
        jmp     br_dcb8d
br_dca8c:
        mov     byte ptr [bx + TBL_9F67], 0ffh
        cmp     word ptr [W_8814], 0
        jz      br_dcab8
        mov     al, 88h
        callf   SEG_D99E:far_d99e6
        mov     ax, word ptr [W_8814]
        shl     ax, 1
        shr     al, 1
        callf   SEG_D99E:far_d99e6
        mov     al, ah
        callf   SEG_D99E:far_d99e6
        mov     word ptr [W_8814], 0
br_dcab8:
        mov     al, byte ptr [bx + TBL_9FE7]
        and     al, 7
        or      al, 98h
        callf   SEG_D99E:far_d99e6
        mov     al, byte ptr [B_8A9B]
        cbw
        mov     si, ax
        or      byte ptr [si + TBL_90C1], 2
        callf   SEG_D99E:far_d99e6
        mov     al, bl
        callf   SEG_D99E:far_d99e6
        mov     al, byte ptr [bx + TBL_A4E7]
        callf   SEG_D99E:far_d99e6
        test    byte ptr [bx + TBL_9FE7], 80h
        jnz     br_dcb07
        mov     al, byte ptr [bx + TBL_A367]
        callf   SEG_D99E:far_d99e6
        mov     byte ptr [bx + TBL_A4E7], 0ffh
        mov     byte ptr [bx + TBL_A367], 0ffh
        shl     bx, 1
        call    fn_dcc08
        jmp     near br_dca66
br_dcb07:
        mov     byte ptr [bx + TBL_A4E7], 0feh
        mov     dl, byte ptr [bx + TBL_A367]
        shl     bx, 2
        mov     ax, word ptr [W_9031]
        mov     word ptr [bx + TBL_A067], ax
        mov     ax, word ptr [W_9033]
        mov     word ptr [bx + TBL_A069], ax
        mov     al, dl
        callf   SEG_D99E:far_d99e6
        mov     al, 17h
        callf   SEG_D99E:far_d99e6
        mov     al, 0
        callf   SEG_D99E:far_d99e6
        mov     byte ptr [B_96F5], 1
        jmp     br_dca66
br_dcb3e:
        mov     dl, byte ptr [bx + TBL_A367]
        test    byte ptr [bx + TBL_9FE7], 80h
        jz      br_dcb4c
        jmp     br_dcb81
        db      090h
br_dcb4c:
        mov     byte ptr [bx + TBL_A4E7], 0ffh
        mov     byte ptr [bx + TBL_A367], 0ffh
        push    word ptr [W_9031]
        push    word ptr [W_9033]
        shl     bx, 2
        mov     ax, word ptr [bx + TBL_A067]
        mov     word ptr [W_9031], ax
        mov     ax, word ptr [bx + TBL_A069]
        mov     word ptr [W_9033], ax
        mov     al, dl
        callf   SEG_D99E:far_d99e6
        call    fn_dcc08
        pop     word ptr [W_9033]
        pop     word ptr [W_9031]
br_dcb81:
        mov     bx, cx
        cmp     byte ptr [bx + TBL_9F67], 0ffh
        jnz     br_dcb8d
        jmp     br_dca66
br_dcb8d:
        cmp     word ptr [W_8814], 0
        jz      br_dcbb9
        mov     byte ptr [B_96F5], 1
        mov     al, 88h
        callf   SEG_D99E:far_d99e6
        mov     ax, word ptr [W_8814]
        shl     ax, 1
        shr     al, 1
        callf   SEG_D99E:far_d99e6
        mov     al, ah
        callf   SEG_D99E:far_d99e6
        mov     word ptr [W_8814], 0
br_dcbb9:
        mov     al, byte ptr [bx + TBL_9D67]
        and     al, 7
        or      al, 98h
        callf   SEG_D99E:far_d99e6
        mov     al, byte ptr [B_8A9B]
        callf   SEG_D99E:far_d99e6
        mov     al, bl
        callf   SEG_D99E:far_d99e6
        mov     al, byte ptr [bx + TBL_9F67]
        callf   SEG_D99E:far_d99e6
        mov     al, byte ptr [bx + TBL_9EE7]
        callf   SEG_D99E:far_d99e6
        mov     byte ptr [bx + TBL_9F67], 0ffh
        shl     bx, 1
        mov     al, byte ptr [bx + TBL_9DE7]
        callf   SEG_D99E:far_d99e6
        mov     al, byte ptr [bx + TBL_9DE8]
        callf   SEG_D99E:far_d99e6
        mov     byte ptr [B_96F5], 1
        jmp     br_dca66
fn_dcc08:
        mov     dx, word ptr [bx + TBL_A267]
        sub     dx, word ptr [bx + TBL_A3E7]
        jnz     br_dcc13
        inc     dx
br_dcc13:
        mov     al, dl
        and     al, 7fh
        callf   SEG_D99E:far_d99e6
        shl     dx, 1
        mov     al, dh
        and     al, 7fh
        callf   SEG_D99E:far_d99e6
        mov     byte ptr [B_96F5], 1
        ret
        db      0ffh
        if      FW_VERSION >= 312
        phase   0eh
        elseif  FW_VERSION = 311
        phase   4
        else
        phase   8
        endif
far_dcc2e:
        push    bp
        mov     bp, sp
        lds     bx, dword ptr [bp + 6]
        cmp     byte ptr [bx], 0
        jnz     br_dcc66
        push    ds
        push    si
        push    di
        mov     di, 1
        cmp     byte ptr [B_880A], 0
        jz      br_dcc49
        mov     di, 4
br_dcc49:
        push    di
        callf   SEG_DAD5:far_dad54
        add     sp, 2
        lds     si, dword ptr [bp + 0ah]
        push    word ptr [bp + 0eh]
        push    ds
        push    si
        push    di
        if      FW_VERSION >= 311
        callf   SEG_DEA1:far_dea12-3cc0h
        else
        callf   SEG_DEA1:far_dea12-3900h
        endif
        add     sp, 8
        pop     di
        pop     si
        pop     ds
br_dcc66:
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   2
        endif
far_dcc68:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 6]
        mul     word ptr [W_D651]
        shl     ax, 1
        rcl     dx, 1
        shl     ax, 1
        rcl     dx, 1
        shl     ax, 1
        rcl     dx, 1
        shl     ax, 1
        rcl     dx, 1
        shl     ax, 1
        adc     dx, 0
        cmp     dx, 0bb8h
        jbe     br_dcc93
        mov     dx, 0bb8h
        jmp     br_dcc9c
        db      090h
br_dcc93:
        cmp     dx, 12ch
        jnc     br_dcc9c
        mov     dx, 12ch
br_dcc9c:
        mov     ax, dx
        pop     bp
        retf
far_dcca0:
        push    word ptr [W_D610]
        push    cs
        call    far_dcc68
        add     sp, 2
        push    ax
        callf   SEG_EB13:far_eb13c
        add     sp, 2
        mov     word ptr [W_D64D], ax
        mov     word ptr [W_D64F], dx
        mov     word ptr [W_D657], dx
        mov     word ptr [W_D655], dx
        retf
        if      FW_VERSION >= 312
        phase   4
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   0eh
        endif
far_dccc4:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        cmp     byte ptr [B_8800], 0
        jnz     br_dccdd
        cmp     byte ptr [B_8A9E], 0
        jnz     br_dccdd
        mov     ax, 0ffffh
        leave
        retf
br_dccdd:
        test    byte ptr [B_901B], 1
        jnz     br_dcce9
        mov     ax, 0ffffh
        leave
        retf
br_dcce9:
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_E259:far_e259f
        add     sp, 2
        or      ax, ax
        jz      br_dcd21
        mov     word ptr [W_901F], 0
        mov     word ptr [W_901D], 0
        mov     byte ptr [B_901B], 0ffh
        mov     word ptr [W_904B], 0
        mov     word ptr [W_903F], 0
        mov     word ptr [W_903D], 0
        mov     ax, 0ffffh
        leave
        retf
br_dcd21:
        and     byte ptr [B_901C], 0fdh
        mov     ax, word ptr [W_8C37]
        mov     dx, word ptr [W_8C35]
        mov     word ptr [W_901F], ax
        mov     word ptr [W_901D], dx
        push    ax
        push    dx
        callf   SEG_E259:far_e26cc
        add     sp, 4
        cwd
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        les     bx, dword ptr [W_8C35]
        mov     ax, word ptr es:[bx + 3]
        mov     dx, word ptr es:[bx + 1]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        mov     ax, word ptr es:[bx + 7]
        mov     dx, word ptr es:[bx + 5]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        add     dx, word ptr [bp - 0ch]
        adc     ax, word ptr [bp - 0ah]
        push    ax
        push    dx
        push    word ptr [W_901F]
        push    word ptr [W_901D]
        callf   SEG_DA9B:far_da9e4
        add     sp, 8
        mov     word ptr [W_9033], dx
        mov     word ptr [W_9031], ax
        mov     word ptr [W_902B], dx
        mov     word ptr [W_9029], ax
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        push    word ptr [W_901F]
        push    word ptr [W_901D]
        callf   SEG_DA9B:far_da9e4
        add     sp, 8
        mov     word ptr [W_9027], dx
        mov     word ptr [W_9025], ax
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    dx
        push    ax
        callf   SEG_DA9B:far_da9e4
        add     sp, 8
        mov     word ptr [W_9023], dx
        mov     word ptr [W_9021], ax
        mov     ax, word ptr [W_9033]
        mov     dx, word ptr [W_9031]
        mov     word ptr [W_902F], ax
        mov     word ptr [W_902D], dx
        mov     dx, word ptr [W_9031]
        cmp     ax, word ptr [W_9023]
        jnz     br_dcdeb
        cmp     dx, word ptr [W_9021]
        jnz     br_dcdeb
        mov     ax, word ptr [W_9027]
        mov     dx, word ptr [W_9025]
        mov     word ptr [W_902F], ax
        mov     word ptr [W_902D], dx
br_dcdeb:
        xor     ax, ax
        mov     word ptr [W_9055], ax
        mov     word ptr [W_8814], ax
        mov     byte ptr [B_901B], 1
        push    ds
        push    word B_901B
        callf   SEG_E344:far_e3478
        add     sp, 4
        mov     al, byte ptr [B_8A9C]
        mov     byte ptr [B_8A9B], al
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [B_8A9F], al
        xor     ax, ax
        leave
        retf
        if      FW_VERSION >= 312
        phase   4
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   0eh
        endif
far_dce14:
        push    bp
        mov     bp, sp
        push    es
        push    si
        push    di
        les     si, dword ptr [bp + 6]
        mov     al, byte ptr es:[si + 1]
        push    ax
        mov     ax, word ptr [bp + 0ch]
        test    al, 80h
        jz      br_dce2f
        xchg    al, ah
br_dce2b:
        test    al, 80h
        jnz     br_dcea3
br_dce2f:
        mov     bl, al
        and     bx, 3fh
        mov     byte ptr [bx + TBL_A57E], 1
        mov     al, ah
        mov     ah, 0ffh
        push    ax
        mov     bh, bl
        and     bl, 0fh
        shr     bh, 4
        inc     bh
        mov     cx, word ptr [bp + 0ah]
        mov     al, byte ptr es:[si]
        and     al, 0f8h
        cmp     al, 0f0h
        jnz     br_dce6f
        add     si, cx
        mov     byte ptr es:[si], 0f7h
        sub     si, cx
        mov     byte ptr es:[si + 1], 0f0h
        cmp     byte ptr es:[si + 2], 47h
        jnz     br_dce8d
        mov     byte ptr es:[si + 3], bl
        jmp     br_dce8d
        db      090h
br_dce6f:
        cmp     al, 0e8h
        jnz     br_dce7c
        mov     byte ptr es:[si + 1], 0f6h
        dec     cx
        jmp     br_dce8d
        db      090h
br_dce7c:
        mov     al, byte ptr es:[si]
        and     al, 0f0h
        cmp     al, 90h
        jnz     br_dce86
        dec     cx
br_dce86:
        add     al, bl
        mov     byte ptr es:[si + 1], al
        dec     cx
br_dce8d:
        mov     al, bh
        sub     ah, ah
        push    ax
        push    cx
        mov     ax, si
        inc     ax
        push    es
        push    ax
        callf   SEG_DD25:far_dd270
        add     sp, 8
        pop     ax
        jmp     short br_dce2b
br_dcea3:
        pop     ax
        mov     byte ptr es:[si + 1], al
        pop     di
        pop     si
        pop     es
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   0dh
        elseif  FW_VERSION = 311
        phase   3
        else
        phase   7
        endif
far_dcead:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    si
        mov     si, word ptr [bp + 0ah]
        if      FW_VERSION >= 311
        cmp     byte ptr [B_A5C7], 0
        jnz     br_dcec5
        cmp     byte ptr [B_A5C8], 0
        jz      br_dcee1
br_dcec5:
        endif
        mov     al, byte ptr [B_A5C0]
        cbw
        or      ax, ax
        if      FW_VERSION >= 311
        jz      br_dced0
        jmp     near br_dcf81
br_dced0:
        else
        jnz     L_e5547
        endif
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_D793:far_d7938
        add     sp, 4
        if      FW_VERSION >= 311
        pop     si
        leave
        retf
        else
L_e5547:
        cmp     byte ptr [B_A5C7], 0
        jz      L_e5551
        jmp     near br_dcf81
L_e5551:
        cmp     byte ptr [B_A5C8], 0
        jz      br_dcee1
        jmp     near br_dcf81
        endif
br_dcee1:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 90h
        if      FW_VERSION >= 311
        jnz     br_dcf1a
        else
        jnz     L_e5594
        endif
        cmp     byte ptr [B_D4AB], 0
        jz      br_dcef8
        cmp     byte ptr [B_7FC7], 0
        if      FW_VERSION >= 311
        jnz     br_dcf1a
        else
        jnz     L_e5594
        endif
br_dcef8:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     word ptr [bp - 2], ax
        mov     al, byte ptr [B_977F]
        cbw
        cmp     ax, word ptr [bp - 2]
        if      FW_VERSION >= 311
        jnz     br_dcf1a
        else
        jnz     L_e5594
        endif
        mov     al, byte ptr [B_977E]
        or      byte ptr es:[bx], al
        mov     al, byte ptr [B_977D]
        mov     byte ptr es:[bx + 4], al
        if      FW_VERSION >= 311
br_dcf1a:
        mov     al, byte ptr [B_A5C0]
        cbw
        or      ax, ax
        jnz     br_dcf30
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_D793:far_d7938
        add     sp, 4
br_dcf30:
        else
L_e5594:
        endif
        mov     al, byte ptr [B_96EE]
        cbw
        or      ax, ax
        jnz     br_dcf52
        mov     al, byte ptr [B_A570]
        cbw
        or      ax, ax
        jnz     br_dcf52
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx + 1], 0
        mov     byte ptr [TBL_9125], 0ffh
        mov     byte ptr [TBL_90C1], 4
br_dcf52:
        push    word ptr [bp + 0ch]
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DCF8:far_dcf84
        add     sp, 8
        cmp     byte ptr [B_96EE], 0
        jnz     br_dcf72
        cmp     byte ptr [B_A570], 0
        jz      br_dcf81
br_dcf72:
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DDFD:far_ddfd9
        add     sp, 6
br_dcf81:
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   4
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   8
        endif
far_dcf84:
        push    bp
        mov     bp, sp
        push    es
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 1]
        push    cs
        call    far_dd0fb
        nop
        if      FW_VERSION >= 311
        mov     cl, byte ptr es:[bx]
        and     cl, 0f8h
        cmp     cl, 0c0h
        jnz     br_dcfa1
        mov     ah, 80h
br_dcfa1:
        endif
        push    word ptr [bp + 0ch]
        push    ax
        push    word ptr [bp + 0ah]
        push    es
        push    bx
        push    cs
        call    far_dcfb5
        nop
        add     sp, 0ah
        pop     es
        pop     bp
        retf
far_dcfb5:
        push    bp
        mov     bp, sp
        sub     sp, 2
        push    es
        push    si
        push    di
        les     di, dword ptr [bp + 6]
        push    word ptr es:[di]
        push    word ptr es:[di + 2]
        mov     al, byte ptr es:[di + 2]
        sub     ah, ah
        mov     si, ax
        mov     bl, byte ptr es:[di + 1]
        and     byte ptr es:[di + 1], 7fh
        test    bl, 80h
        jnz     br_dcfe8
        and     bx, 7fh
        mov     dl, byte ptr [bx + TBL_9251]
        jmp     br_dcfef
        db      090h
br_dcfe8:
        and     bx, 7fh
        mov     dl, byte ptr [bx + TBL_8E77]
br_dcfef:
        mov     cl, byte ptr es:[di]
        and     cl, 0f0h
        cmp     cl, 90h
        ja      br_dd018
        mov     al, byte ptr es:[di + 3]
        mul     dl
        add     ax, 32h
        cmp     ax, 3200h
        jc      br_dd010
        mov     byte ptr es:[di + 3], 7fh
        jmp     br_dd018
        db      090h
br_dd010:
        mov     dl, 64h
        div     dl
        mov     byte ptr es:[di + 3], al
br_dd018:
        cmp     word ptr [bp + 0eh], 0
        jnz     br_dd031
        mov     word ptr [bp - 2], 4
        test    word ptr [bp + 0ch], 40h
        jz      br_dd05a
        or      word ptr [bp - 2], 1
        jmp     br_dd05a
        db      090h
br_dd031:
        cmp     word ptr [bp + 0eh], 1
        jnz     br_dd04a
        mov     word ptr [bp - 2], 3
        test    word ptr [bp + 0ch], 40h
        jz      br_dd05a
        or      word ptr [bp - 2], 4
        jmp     br_dd05a
        db      090h
br_dd04a:
        mov     word ptr [bp - 2], 0ch
        test    word ptr [bp + 0ch], 40h
        jz      br_dd05a
        or      word ptr [bp - 2], 1
br_dd05a:
        test    word ptr [bp - 2], 1
        jz      br_dd06f
        test    word ptr [bp - 2], 2
        jz      br_dd072
        cmp     byte ptr [B_8184], 0
        jnz     br_dd072
br_dd06f:
        jmp     br_dd0c4
        db      090h
br_dd072:
        cmp     byte ptr [B_D4AC], 0
        jz      br_dd098
        cmp     cl, 90h
        jnz     br_dd098
        mov     ax, si
        cmp     al, byte ptr [B_977F]
        jnz     br_dd098
        mov     al, byte ptr es:[di]
        and     al, 3
        cmp     al, byte ptr [B_977E]
        jnz     br_dd098
        mov     al, byte ptr [B_977D]
        mov     byte ptr es:[di + 4], al
br_dd098:
        cmp     cl, 0c0h
        jnz     br_dd0a4
        cmp     byte ptr [B_8182], 0
        jz      br_dd0c4
br_dd0a4:
        cmp     cl, 0b0h
        jnz     br_dd0b5
        cmp     si, 7
        jnz     br_dd0b5
        cmp     byte ptr [B_8181], 0
        jz      br_dd0c4
br_dd0b5:
        push    word ptr [bp + 0ah]
        push    es
        push    di
        push    8
        callf   SEG_D9B6:far_d9b6e
        add     sp, 8
br_dd0c4:
        test    word ptr [bp - 2], 4
        jz      br_dd0ec
        test    word ptr [bp - 2], 8
        jz      br_dd0dc
        cmp     byte ptr [B_8183], 0
        jnz     br_dd0dc
        jmp     br_dd0ec
        db      090h
br_dd0dc:
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    es
        push    di
        callf   SEG_DCE1:far_dce14
        add     sp, 8
br_dd0ec:
        pop     word ptr es:[di + 2]
        pop     word ptr es:[di]
        pop     di
        pop     si
        pop     es
        add     sp, 2
        pop     bp
        retf
far_dd0fb:
        push    bx
        mov     bl, al
        test    bl, 80h
        jnz     br_dd115
        and     bx, 7fh
        mov     al, byte ptr [bx + TBL_9125]
        mov     ah, byte ptr [bx + TBL_9189]
        mov     bl, byte ptr [bx + TBL_90C1]
        jmp     br_dd124
        db      090h
br_dd115:
        and     bx, 7fh
        mov     al, byte ptr [bx + TBL_8D4B]
        mov     ah, byte ptr [bx + TBL_8DAF]
        mov     bl, byte ptr [bx + TBL_8CE7]
br_dd124:
        and     ax, 0bfbfh
        and     bl, 4
        shl     bl, 4
        mov     bh, bl
        or      ax, bx
        pop     bx
        retf
        if      FW_VERSION >= 312
        phase   3
        elseif  FW_VERSION = 311
        phase   9
        else
        phase   0ah
        endif
far_dd133:
        push    bp
        mov     bp, sp
        push    si
        mov     si, word ptr [bp + 0ah]
        cmp     byte ptr [B_A5C7], 0
        jnz     br_dd188
        cmp     byte ptr [B_A5C8], 0
        jnz     br_dd188
        cmp     byte ptr [B_D5DE], 74h
        jz      br_dd188
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DDFD:far_ddfd9
        add     sp, 6
        mov     al, byte ptr [B_955D]
        cbw
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_905D]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DEA5:far_dea54
        add     sp, 6
        push    2
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DCF8:far_dcf84
        add     sp, 8
br_dd188:
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 311
        db      0ffh
        endif
TBL_dd18c:
        db      02eh, 013h, 030h, 019h, 032h, 01fh, 034h, 025h
TBL_dd194:
        if      FW_VERSION >= 311
        db      066h, 012h, 07eh, 012h, 096h, 012h, 0aeh, 012h
        else
        db      064h, 012h, 074h, 012h, 084h, 012h, 094h, 012h
        endif
TBL_dd19c:
        db      0c6h, 000h, 0ceh, 000h, 0d6h, 000h, 0deh, 000h
fn_dd1a4:
        push    bp
        mov     bp, sp
        cmp     byte ptr [B_9457], 0
        jnz     br_dd1c3
        mov     bx, word ptr [bp + 8]
        dec     bx
        js      br_dd1c3
        shl     bx, 1
        if      FW_VERSION >= 312
        mov     bx, word ptr cs:[word bx + 0ch]
        else
        mov     bx, word ptr cs:[word bx + 2]
        endif
        mov     cl, byte ptr [bp + 6]
        callf   SEG_DAC6:far_dac9a
br_dd1c3:
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   45h
        else
        phase   3bh
        endif
far_dd1c5:
        push    bp
        mov     bp, sp
        cmp     byte ptr [B_9457], 0
        jnz     br_dd1f3
        mov     bl, byte ptr [bp + 0ch]
        dec     bl
        js      br_dd1f3
        sub     bh, bh
        shl     bx, 1
        if      FW_VERSION >= 312
        mov     bx, word ptr cs:[word bx + TBL_dd18c-50h]
        else
        mov     bx, word ptr cs:[word bx + TBL_dd18c-60h]
        endif
        push    ds
        push    si
        lds     si, dword ptr [bp + 6]
loop_dd1e4:
        mov     cl, byte ptr [si]
        inc     si
        callf   SEG_DAC6:far_dac9a
        dec     word ptr [bp + 0ah]
        jnz     loop_dd1e4
        pop     si
        pop     ds
br_dd1f3:
        pop     bp
        retf
far_dd1f5:
        test    byte ptr [TBL_943B], 2
        jnz     far_dd1f5
        test    byte ptr [B_943C], 2
        jnz     far_dd1f5
        test    byte ptr [B_943D], 2
        jnz     far_dd1f5
        test    byte ptr [B_943E], 2
        jnz     far_dd1f5
        retf
far_dd212:
        cmp     byte ptr [B_9457], 0
        jnz     br_dd240
        sub     bh, bh
        dec     bx
        js      br_dd240
        shl     bx, 1
        push    bx
        if      FW_VERSION >= 312
        mov     bx, word ptr cs:[word bx + TBL_dd194-50h]
        else
        mov     bx, word ptr cs:[word bx + TBL_dd194-60h]
        endif
        callf   SEG_DAC6:far_dac6a
        pop     bx
        if      FW_VERSION >= 312
        mov     dx, word ptr cs:[word bx + TBL_dd19c-50h]
        else
        mov     dx, word ptr cs:[word bx + TBL_dd19c-60h]
        endif
        shr     bx, 1
        pushf
        cli
        or      byte ptr [bx + TBL_943B], 2
        mov     al, byte ptr [bx + TBL_943B]
        out     dx, al
        popf
br_dd240:
        retf
fn_dd241:
        push    bp
        mov     bp, sp
        mov     bl, byte ptr [bp + 8]
        mov     cl, byte ptr [bp + 6]
        push    cs
        call    far_dd212
        pop     bp
        retf
TBL_dd250:
        db      001h, 000h, 002h, 000h, 004h, 000h, 008h, 000h, 010h, 000h, 020h, 000h, 040h, 000h, 080h, 000h
        db      000h, 001h, 000h, 002h, 000h, 004h, 000h, 008h, 000h, 010h, 000h, 020h, 000h, 040h, 000h, 080h
        if      FW_VERSION >= 312
        phase   20h
        else
        phase   26h
        endif
far_dd270:
        push    bp
        mov     bp, sp
        push    es
        push    si
        mov     dx, word ptr [bp + 0ch]
        dec     dx
        jns     br_dd27e
        jmp     br_dd3bd
br_dd27e:
        les     si, dword ptr [bp + 6]
        mov     al, byte ptr es:[si]
        mov     ah, al
        and     ah, 0f0h
        cmp     ah, 90h
        jz      br_dd291
        jmp     near br_dd332
br_dd291:
        mov     cl, byte ptr es:[si + 1]
        sub     ch, ch
        shl     cx, 1
        xchg    dl, dh
        add     cx, dx
        mov     bx, ax
        and     bx, 0fh
        shl     bx, 1
        if      FW_VERSION >= 312
        mov     dx, word ptr cs:[word bx + TBL_dd250-0d0h]
        else
        mov     dx, word ptr cs:[word bx + TBL_dd250-0c0h]
        endif
        mov     bx, cx
        test    word ptr [bx + TBL_9831], dx
        jnz     br_dd2b8
        or      word ptr [bx + TBL_9831], dx
        jmp     br_dd3ad
br_dd2b8:
        mov     dx, word ptr [bp + 0ch]
        dec     dx
        shl     dx, 4
        mov     ax, word ptr es:[si]
        and     ax, 0ff0fh
        or      ax, dx
        mov     cx, word ptr [W_982F]
        sub     bx, bx
loop_dd2cd:
        cmp     word ptr [bx + TBL_981B], ax
        jz      br_dd318
        add     bx, 2
        loop    loop_dd2cd
        mov     cx, word ptr [W_982F]
        sub     bx, bx
loop_dd2de:
        cmp     word ptr [bx + TBL_981B], 0ffffh
        jz      br_dd325
        add     bx, 2
        loop    loop_dd2de
        mov     cx, word ptr [bp + 0ch]
        mov     al, byte ptr es:[si]
        and     al, 0fh
        or      al, 80h
        mov     ah, byte ptr es:[si + 1]
        push    bp
        sub     sp, 4
        mov     bp, sp
        mov     byte ptr [bp], al
        mov     byte ptr [bp + 1], ah
        mov     byte ptr [bp + 2], 40h
        push    cx
        push    3
        push    bp
        callf   SEG_DD18:far_dd1c5
        add     sp, 0ah
        pop     bp
        jmp     near br_dd3ad
br_dd318:
        inc     byte ptr [bx + TBL_9807]
        jnz     br_dd322
        dec     byte ptr [bx + TBL_9807]
br_dd322:
        jmp     near br_dd3ad
br_dd325:
        mov     word ptr [bx + TBL_9807], 2
        mov     word ptr [bx + TBL_981B], ax
        jmp     short br_dd3ad
        db      090h
br_dd332:
        cmp     ah, 80h
        jnz     br_dd3ad
        mov     dx, word ptr [bp + 0ch]
        dec     dx
        shl     dx, 4
        mov     ax, word ptr es:[si]
        and     ax, 0ff0fh
        or      ax, dx
        mov     cx, word ptr [W_982F]
        sub     bx, bx
loop_dd34c:
        cmp     word ptr [bx + TBL_981B], ax
        jz      br_dd35a
        add     bx, 2
        loop    loop_dd34c
        jmp     br_dd388
        db      090h
br_dd35a:
        inc     byte ptr [bx + TBL_9808]
        mov     ax, word ptr [bx + TBL_9807]
        cmp     ah, al
        jc      br_dd3bd
        mov     word ptr [bx + TBL_981B], 0ffffh
        mov     cl, ah
        sub     ch, ch
        push    cx
br_dd371:
        pop     cx
        dec     cx
        jcxz    br_dd388
        push    cx
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    es
        push    si
        callf   SEG_DD18:far_dd1c5
        add     sp, 8
        jmp     br_dd371
br_dd388:
        mov     cl, byte ptr es:[si + 1]
        sub     ch, ch
        shl     cx, 1
        mov     dx, word ptr [bp + 0ch]
        dec     dx
        xchg    dl, dh
        add     cx, dx
        mov     bl, byte ptr es:[si]
        and     bx, 0fh
        shl     bx, 1
        if      FW_VERSION >= 312
        mov     dx, word ptr cs:[word bx + TBL_dd250-0d0h]
        else
        mov     dx, word ptr cs:[word bx + TBL_dd250-0c0h]
        endif
        mov     bx, cx
        not     dx
        and     word ptr [bx + TBL_9831], dx
br_dd3ad:
        push    word ptr [bp + 0ch]
        push    word ptr [bp + 0ah]
        push    es
        push    si
        callf   SEG_DD18:far_dd1c5
        add     sp, 8
br_dd3bd:
        pop     si
        pop     es
        pop     bp
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   2
        else
        phase   8
        endif
far_dd3c2:
        cmp     byte ptr [B_A570], 0
        jnz     br_dd404
        cmp     byte ptr [B_901B], 0
        jnz     br_dd404
        mov     bl, byte ptr [B_F77B]
        sub     bh, bh
        mov     byte ptr [B_880B], 1
        mov     ax, word ptr [B_F77C]
        cmp     byte ptr [bx + TBL_A4E7], 0ffh
        jnz     br_dd3ea
        mov     byte ptr [bx + TBL_A4E7], 0fdh
br_dd3ea:
        mov     byte ptr [bx + TBL_9F67], al
        mov     byte ptr [bx + TBL_9EE7], ah
        mov     al, byte ptr [TBL_F779]
        and     al, 7
        mov     byte ptr [bx + TBL_9D67], al
        shl     bx, 1
        mov     ax, word ptr [B_F77E]
        mov     word ptr [bx + TBL_9DE7], ax
br_dd404:
        retf
        if      FW_VERSION >= 312
        phase   5
        else
        phase   0bh
        endif
far_dd405:
        push    bp
        mov     bp, sp
        sub     sp, 0ah
        push    si
        push    di
        mov     word ptr [bp - 2], 23h
        if      FW_VERSION >= 312
        mov     si, 9611h
        elseif  FW_VERSION = 311
        mov     si, 9559h
        else
        mov     si, 9027h
        endif
        mov     di, 46h
br_dd418:
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_966E]
        cbw
        mov     cx, ax
        or      ax, ax
        jnz     br_dd429
        jmp     near br_dd4c4
br_dd429:
        xor     dx, dx
        cmp     byte ptr [B_D4AB], 0
        jz      br_dd439
        cmp     byte ptr [B_7FC7], 0
        jnz     br_dd44d
br_dd439:
        mov     al, byte ptr [B_977F]
        cbw
        cmp     ax, word ptr [bp - 2]
        jnz     br_dd44d
        mov     al, byte ptr [B_977D]
        mov     byte ptr [si], al
        mov     al, byte ptr [B_977E]
        cbw
        mov     dx, ax
br_dd44d:
        cmp     byte ptr [B_A5C1], 8
        jl      br_dd47c
        mov     bx, word ptr [bp - 2]
        mov     byte ptr [bx + TBL_9FE7], dl
        mov     byte ptr [bx + TBL_A4E7], cl
        mov     word ptr [di + TBL_A3E7], 0
        mov     al, byte ptr [si]
        mov     byte ptr [bx + TBL_A367], al
        mov     al, byte ptr [B_8809]
        mov     ah, 0
        add     ax, 0fffch
        mov     word ptr [di + TBL_A267], ax
        mov     byte ptr [B_880B], 1
br_dd47c:
        mov     al, 98h
        or      al, dl
        mov     byte ptr [bp - 0ah], al
        mov     al, byte ptr [B_8A9B]
        mov     byte ptr [bp - 9], al
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [bp - 8], al
        mov     byte ptr [bp - 7], cl
        mov     al, byte ptr [si]
        mov     byte ptr [bp - 6], al
        mov     al, byte ptr [B_8809]
        mov     ah, 0
        add     ax, 0fffch
        mov     dx, ax
        cmp     dx, 1
        jg      br_dd4a9
        mov     dx, 1
br_dd4a9:
        push    dx
        callf   SEG_DAA8:far_daabc
        add     sp, 2
        mov     word ptr [bp - 5], ax
        push    7
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        callf   SEG_DD9B:far_dd9ba
        add     sp, 6
br_dd4c4:
        if      FW_VERSION < 311
        cmp     byte ptr [B_CEC6_V308], 0
        jnz     L_e5b26
        mov     byte ptr [B_CEC6_V308], 1
L_e5b26:
        endif
        inc     si
        add     di, 2
        inc     word ptr [bp - 2]
        if      FW_VERSION >= 312
        cmp     si, 9651h
        elseif  FW_VERSION = 311
        cmp     si, 9599h
        else
        cmp     si, 9067h
        endif
        jz      br_dd4d4
        jmp     near br_dd418
br_dd4d4:
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   0ah
        endif
far_dd4d8:
        push    bp
        mov     bp, sp
        sub     sp, 0ah
        push    si
        mov     word ptr [bp - 2], 0
        xor     si, si
br_dd4e6:
        mov     bx, word ptr [bp - 2]
        cmp     byte ptr [bx + TBL_956E], 0
        jnz     br_dd4f3
        jmp     near br_dd580
br_dd4f3:
        mov     al, byte ptr [B_956B]
        cbw
        mov     dx, ax
        or      ax, ax
        jnz     br_dd500
        mov     dx, 40h
br_dd500:
        cmp     byte ptr [B_817F], 0
        jz      br_dd50d
        mov     al, byte ptr [B_8180]
        cbw
        mov     dx, ax
br_dd50d:
        cmp     byte ptr [B_A5C1], 8
        jl      br_dd546
        mov     bx, word ptr [bp - 2]
        mov     byte ptr [bx + TBL_9FE7], 0
        mov     byte ptr [bx + TBL_A4E7], dl
        mov     word ptr [si + TBL_A3E7], 0
        mov     byte ptr [bx + TBL_A367], 40h
        mov     al, byte ptr [B_8809]
        mov     ah, 0
        add     ax, 0fffch
        mov     cx, ax
        cmp     cx, 1
        jg      br_dd53d
        mov     cx, 1
br_dd53d:
        mov     word ptr [si + TBL_A267], cx
        mov     byte ptr [B_880B], 1
br_dd546:
        mov     byte ptr [bp - 0ah], 98h
        mov     al, byte ptr [B_8A9B]
        mov     byte ptr [bp - 9], al
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [bp - 8], al
        mov     byte ptr [bp - 7], dl
        mov     byte ptr [bp - 6], 40h
        mov     al, byte ptr [B_8809]
        mov     ah, 0
        add     ax, 0fffch
        push    ax
        callf   SEG_DAA8:far_daabc
        add     sp, 2
        mov     word ptr [bp - 5], ax
        push    7
        push    ss
        lea     ax, [bp - 0ah]
        push    ax
        callf   SEG_DD9B:far_dd9ba
        add     sp, 6
br_dd580:
        if      FW_VERSION < 311
        cmp     byte ptr [B_CEC6_V308], 0
        jnz     L_e5bee
        mov     byte ptr [B_CEC6_V308], 1
L_e5bee:
        endif
        add     si, 2
        inc     word ptr [bp - 2]
        cmp     si, 100h
        jz      br_dd58f
        jmp     near br_dd4e6
br_dd58f:
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   2
far_dd592:
        cmp     byte ptr [B_8437], 0
        jnz     br_dd59c
        jmp     br_dd5a4
        db      090h
br_dd59c:
        push    ax
        callf   SEG_DBAF:far_dbb3a
        pop     ax
        retf
br_dd5a4:
        elseif  FW_VERSION = 311
        phase   8
far_dd592:
        cmp     byte ptr [B_8437], 0
        jnz     br_dd59c
        jmp     br_dd5a4
        db      090h
br_dd59c:
        push    ax
        callf   SEG_DBAF:far_dbb3a
        pop     ax
        retf
br_dd5a4:
        else
        phase   0
L_e5c00:
        endif
        push    cx
        push    dx
        push    cs
        if      FW_VERSION >= 311
        call    fn_dd6f4
        else
        call    L_e5d36
        endif
        nop
        if      FW_VERSION >= 311
        cmp     al, 4dh
        jnz     br_dd5c5
        push    ax
        push    bp
        mov     bp, sp
        mov     word ptr [bp + 2], 88h
        pop     bp
        callf   SEG_D79E:far_d7adf
        pop     ax
        mov     ax, 4dh
        jmp     br_dd6d0
br_dd5c5:
        endif
        cmp     al, 24h
        jnz     br_dd5cc
        jmp     br_dd6d0
br_dd5cc:
        mov     bl, al
        sub     bl, 55h
        jc      br_dd5d8
        cmp     bl, 6
        jc      br_dd5db
br_dd5d8:
        jmp     br_dd6da
br_dd5db:
        sub     bh, bh
        shl     bx, 1
        sub     cx, cx
        jmp     word ptr cs:[word bx + TBL_dd5e6]
TBL_dd5e6:
        dw      tgt_dd5f2
        dw      tgt_dd5f7
        dw      tgt_dd5f7
        dw      tgt_dd608
        dw      tgt_dd633
        dw      tgt_dd677
tgt_dd5f2:
        mov     al, 23h
        jmp     br_dd6d0
tgt_dd5f7:
        cmp     byte ptr [B_A570], 0
        jz      br_dd603
        sub     ah, ah
        jmp     near br_dd6b3
br_dd603:
        mov     ah, 4dh
        jmp     near br_dd6b3
tgt_dd608:
        mov     byte ptr [B_D5EB], 0
        mov     bx, word ptr [W_9041]
        mov     cx, word ptr [W_9043]
        and     bx, 0fffch
        add     bx, 4
        adc     cx, 0
        mov     word ptr [W_D5E7], bx
        mov     word ptr [W_D5E9], cx
        mov     byte ptr [B_D5ED], 0
        mov     cx, 0fch
        sub     ah, ah
        jmp     near br_dd6b3
tgt_dd633:
        mov     byte ptr [B_D5ED], 1
        neg     byte ptr [B_D5EC]
        mov     cx, 0fbh
        cmp     byte ptr [B_D60A], 10h
        jc      br_dd674
        cmp     byte ptr [TBL_A5CA], 0
        jnz     br_dd654
        cmp     byte ptr [B_A5C9], 0
        jz      br_dd65c
br_dd654:
        mov     byte ptr [B_D608], 1
        jmp     br_dd6ab
        db      090h
br_dd65c:
        mov     bx, word ptr [W_9041]
        mov     dx, word ptr [W_9043]
        shr     dx, 1
        rcr     bx, 1
        shr     dx, 1
        rcr     bx, 1
        mov     word ptr [W_D635], bx
        mov     word ptr [W_D637], dx
br_dd674:
        jmp     br_dd6ab
        db      090h
tgt_dd677:
        mov     byte ptr [B_D5ED], 1
        mov     byte ptr [B_D5EC], 0
        mov     cx, 0fah
        cmp     byte ptr [B_D60A], 10h
        jc      br_dd6ab
        cmp     byte ptr [TBL_A5CA], 0
        jnz     br_dd699
        cmp     byte ptr [B_A5C9], 0
        jz      br_dd6a1
br_dd699:
        mov     byte ptr [B_D608], 1
        jmp     br_dd6ab
        db      090h
br_dd6a1:
        sub     bx, bx
        mov     word ptr [W_D635], bx
        mov     word ptr [W_D637], bx
br_dd6ab:
        mov     word ptr [W_D4AF], 0ffffh
        mov     ah, 51h
br_dd6b3:
        push    ax
        jcxz    br_dd6bf
        mov     bl, byte ptr [B_7FD0]
        callf   SEG_DD18:far_dd212
br_dd6bf:
        pop     ax
br_dd6c0:
        push    ax
        test    ah, ah
        jz      br_dd6cf
        mov     cl, ah
        mov     bx, A_12C6
        callf   SEG_DAC6:far_dac6a
br_dd6cf:
        pop     ax
br_dd6d0:
        mov     cl, al
        mov     bx, A_12C6
        callf   SEG_DAC6:far_dac6a
br_dd6da:
        pop     dx
        pop     cx
        retf
far_dd6dd:
        mov     al, 58h
        if      FW_VERSION >= 311
        jmp     br_dd5a4
        else
        jmp     L_e5c00
        endif
far_dd6e2:
        mov     al, 59h
        if      FW_VERSION >= 311
        jmp     br_dd5a4
        else
        jmp     L_e5c00
        endif
far_dd6e7:
        mov     al, 5ah
        if      FW_VERSION >= 311
        jmp     br_dd5a4
        else
        jmp     L_e5c00
        endif
far_dd6ec:
        push    cx
        push    dx
        mov     ah, 51h
        mov     al, 5ah
        jmp     br_dd6c0
        if      FW_VERSION >= 311
fn_dd6f4:
        else
L_e5d36:
        endif
        mov     ah, byte ptr [B_A5C2]
        and     ah, 3fh
        cmp     ah, 0
        jz      br_dd703
        if      FW_VERSION >= 311
        jmp     short br_dd780
        else
        jmp     br_dd780
        endif
        db      090h
br_dd703:
        cmp     byte ptr [B_A5C1], 0
        jnz     br_dd77d
        cmp     byte ptr [B_956A], 0
        jnz     br_dd77d
        cmp     al, 5ah
        jnz     br_dd722
        call    fn_dd957
        jc      br_dd77d
        mov     byte ptr [B_A5C2], 41h
        jmp     br_dd8ee
br_dd722:
        cmp     al, 59h
        jnz     br_dd749
        if      FW_VERSION >= 311
        cmp     byte ptr [B_A5C5], 0
        jz      br_dd73c
        mov     byte ptr [B_8437], 1
        mov     byte ptr [B_D4B4], 1
        mov     al, 4dh
        jmp     br_dd8fe
br_dd73c:
        endif
        call    fn_dd957
        jc      br_dd77d
        mov     byte ptr [B_A5C2], 1
        jmp     br_dd8ee
br_dd749:
        cmp     al, 56h
        jnz     br_dd75c
        test    byte ptr [B_A5C0], 0ffh
        jnz     br_dd77d
        mov     byte ptr [B_A5C2], 2
        jmp     br_dd8ee
br_dd75c:
        cmp     al, 57h
        jnz     br_dd776
        test    byte ptr [B_A5C0], 0ffh
        jnz     br_dd77d
        cmp     byte ptr [B_A570], 0
        jnz     br_dd77d
        mov     byte ptr [B_A5C2], 8
        jmp     br_dd8ee
br_dd776:
        cmp     al, 58h
        jnz     br_dd77d
        mov     al, 55h
        retf
br_dd77d:
        jmp     br_dd8fc
br_dd780:
        cmp     ah, 1
        jz      br_dd788
        jmp     near br_dd807
br_dd788:
        cmp     al, 58h
        jnz     br_dd799
        mov     byte ptr [B_A5C2], 0
        mov     byte ptr [B_A5C3], 0
        jmp     br_dd8ee
br_dd799:
        cmp     al, 56h
        jnz     br_dd7b3
        cmp     byte ptr [B_A5C6], 0
        jz      br_dd801
        cmp     byte ptr [B_901B], 0
        jnz     br_dd804
        mov     byte ptr [B_A5C2], 4
        jmp     br_dd8ee
br_dd7b3:
        cmp     al, 57h
        jnz     br_dd7d4
        cmp     byte ptr [B_A5C6], 0
        jz      br_dd801
        cmp     byte ptr [B_A570], 0
        jnz     br_dd801
        cmp     byte ptr [B_901B], 0
        jnz     br_dd804
        mov     byte ptr [B_A5C2], 10h
        jmp     br_dd8ee
br_dd7d4:
        cmp     al, 59h
        jnz     br_dd801
        cmp     byte ptr [B_A5C4], 0
        jz      br_dd801
        cmp     byte ptr [B_901B], 0
        jnz     br_dd804
        test    byte ptr [B_A5C4], 2
        jnz     br_dd7f7
        mov     al, 56h
        mov     byte ptr [B_A5C2], 4
        jmp     br_dd8ee
br_dd7f7:
        mov     al, 57h
        mov     byte ptr [B_A5C2], 10h
        jmp     br_dd8ee
br_dd801:
        jmp     br_dd8fc
br_dd804:
        jmp     br_dd8f6
br_dd807:
        cmp     ah, 2
        jnz     br_dd842
        cmp     al, 5ah
        jnz     br_dd81d
        call    fn_dd957
        jc      br_dd83f
        mov     byte ptr [B_A5C2], 44h
        jmp     br_dd8ee
br_dd81d:
        cmp     al, 59h
        jnz     br_dd82e
        call    fn_dd957
        jc      br_dd83f
        mov     byte ptr [B_A5C2], 4
        jmp     near br_dd8ee
br_dd82e:
        cmp     al, 76h
        jnz     br_dd83f
        mov     byte ptr [B_A5C2], 0
        mov     byte ptr [B_A5C3], 0
        jmp     near br_dd8ee
br_dd83f:
        jmp     near br_dd8fc
br_dd842:
        cmp     ah, 4
        jnz     br_dd881
        cmp     al, 58h
        jnz     br_dd858
        mov     byte ptr [B_A5C2], 0
        mov     byte ptr [B_A5C3], 0
        jmp     near br_dd8ee
br_dd858:
        cmp     al, 56h
        jnz     br_dd864
        mov     byte ptr [B_A5C2], 1
        jmp     near br_dd8ee
br_dd864:
        cmp     al, 57h
        jnz     br_dd87e
        test    byte ptr [B_A5C6], 0ffh
        jz      br_dd87e
        cmp     byte ptr [B_A570], 0
        jnz     br_dd87e
        mov     byte ptr [B_A5C2], 10h
        jmp     br_dd8ee
        db      090h
br_dd87e:
        jmp     short br_dd8fc
        db      090h
br_dd881:
        cmp     ah, 8
        jnz     br_dd8bc
        cmp     al, 5ah
        jnz     br_dd897
        call    fn_dd957
        jc      br_dd8b9
        mov     byte ptr [B_A5C2], 50h
        jmp     br_dd8ee
        db      090h
br_dd897:
        cmp     al, 59h
        jnz     br_dd8a8
        call    fn_dd957
        jc      br_dd8b9
        mov     byte ptr [B_A5C2], 10h
        jmp     br_dd8ee
        db      090h
br_dd8a8:
        cmp     al, 77h
        jnz     br_dd8b9
        mov     byte ptr [B_A5C2], 0
        mov     byte ptr [B_A5C3], 0
        jmp     br_dd8ee
        db      090h
br_dd8b9:
        jmp     br_dd8fc
        db      090h
br_dd8bc:
        cmp     ah, 10h
        jnz     br_dd8fc
        cmp     al, 58h
        jnz     br_dd8d2
        mov     byte ptr [B_A5C2], 0
        mov     byte ptr [B_A5C3], 0
        jmp     br_dd8ee
        db      090h
br_dd8d2:
        cmp     al, 57h
        jnz     br_dd8de
        mov     byte ptr [B_A5C2], 1
        jmp     br_dd8ee
        db      090h
br_dd8de:
        cmp     al, 56h
        jnz     br_dd8fc
        test    byte ptr [B_A5C6], 0ffh
        jz      br_dd8fc
        mov     byte ptr [B_A5C2], 4
br_dd8ee:
        push    cs
        call    far_dd8ff
        nop
        jmp     br_dd8fe
        db      090h
br_dd8f6:
        mov     ax, 24h
        jmp     br_dd8fe
        db      090h
br_dd8fc:
        xor     ax, ax
br_dd8fe:
        retf
far_dd8ff:
        push    bx
        push    ax
        test    byte ptr [B_A5C2], 15h
        mov     ah, 0
        jz      br_dd90c
        mov     ah, 1
br_dd90c:
        mov     al, 8
        int     46h
        test    byte ptr [B_A5C2], 6
        mov     ah, 0
        jz      br_dd91b
        mov     ah, 1
br_dd91b:
        mov     al, 6
        int     46h
        mov     al, 6
        int     46h
        test    byte ptr [B_A5C2], 18h
        mov     ah, 0
        jz      br_dd92e
        mov     ah, 1
br_dd92e:
        mov     al, 7
        int     46h
        test    byte ptr [B_A5C2], 3fh
        jnz     br_dd954
        cmp     byte ptr [B_D60A], 0
        jz      br_dd954
        cmp     byte ptr [B_D60A], 10h
        jl      br_dd94f
        mov     byte ptr [B_D60A], 10h
        jmp     br_dd954
        db      090h
br_dd94f:
        mov     byte ptr [B_D60A], 0eh
br_dd954:
        pop     ax
        pop     bx
        retf
fn_dd957:
        cmp     byte ptr [B_9455], 0
        jnz     br_dd96e
        cmp     byte ptr [B_8800], 0
        jnz     br_dd96c
        cmp     byte ptr [B_901B], 0ffh
        jz      br_dd96e
br_dd96c:
        clc
        ret
br_dd96e:
        stc
        ret
far_dd970:
        push    ax
        push    bx
        mov     bl, byte ptr [B_A5C2]
        mov     al, bl
        and     al, 3fh
        cmp     al, 0
        jnz     br_dd983
        mov     ah, 0
        jmp     br_dd9a3
        db      090h
br_dd983:
        cmp     al, 1
        jnz     br_dd98c
        mov     ah, 6
        jmp     br_dd99b
        db      090h
br_dd98c:
        cmp     al, 4
        jnz     br_dd995
        mov     ah, 8
        jmp     br_dd99b
        db      090h
br_dd995:
        cmp     al, 10h
        jnz     br_dd9b6
        mov     ah, 0ah
br_dd99b:
        test    bl, 40h
        jz      br_dd9a3
        or      ah, 40h
br_dd9a3:
        mov     byte ptr [B_A5C3], ah
        mov     byte ptr [B_D5EB], 0
        cmp     ah, 0
        jz      br_dd9b6
        mov     byte ptr [B_A575], 0
br_dd9b6:
        pop     bx
        pop     ax
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   0ah
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   6
        endif
far_dd9ba:
        push    bp
        mov     bp, sp
        push    es
        push    si
        push    di
        les     si, dword ptr [bp + 6]
        mov     bx, word ptr es:[si + 1]
        push    bx
        cmp     word ptr [bp + 0ah], 0
        jnz     br_dd9d1
        jmp     near br_dda69
br_dd9d1:
        sub     bh, bh
        shl     bl, 1
        jc      br_dd9f5
        shr     bl, 1
        test    byte ptr [bx + TBL_90C1], 4
        jnz     br_dd9f5
        mov     bl, byte ptr [B_955D]
        sub     bh, bh
        mov     al, byte ptr [bx + TBL_905D]
        push    ax
        push    es
        push    si
        callf   SEG_DEA5:far_dea54
        add     sp, 6
br_dd9f5:
        mov     al, byte ptr es:[si]
        and     al, 0f8h
        cmp     al, 98h
        jnz     br_dda0b
        push    es
        push    si
        callf   SEG_DE27:far_de278
        add     sp, 4
        jmp     br_dda69
        db      090h
br_dda0b:
        cmp     al, 0f8h
        jnz     br_dda12
        jmp     br_dda69
        db      090h
br_dda12:
        cmp     al, 0f0h
        jnz     br_dda52
        cmp     byte ptr es:[si + 2], 47h
        jnz     br_dda52
        cmp     byte ptr es:[si + 5], 45h
        jz      br_dda2b
        cmp     byte ptr es:[si + 5], 46h
        jnz     br_dda52
br_dda2b:
        mov     al, byte ptr es:[si + 6]
        cmp     al, 1
        jz      br_dda37
        cmp     al, 2
        jnz     br_dda41
br_dda37:
        cmp     byte ptr [B_E422], 1
        jnz     br_dda69
        jmp     br_dda52
        db      090h
br_dda41:
        cmp     al, 3
        jnz     br_dda4f
        cmp     byte ptr [B_E423], 1
        jnz     br_dda69
        jmp     br_dda52
        db      090h
br_dda4f:
        jmp     br_dda69
        db      090h
br_dda52:
        push    ax
        push    bp
        mov     bp, sp
        mov     word ptr [bp + 2], 0
        pop     bp
        push    word ptr [bp + 0ah]
        push    es
        push    si
        callf   SEG_DCF8:far_dcf84
        add     sp, 8
br_dda69:
        pop     bx
        mov     word ptr es:[si + 1], bx
        pop     di
        pop     si
        pop     es
        pop     bp
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   4
        elseif  FW_VERSION = 311
        phase   0ah
        else
        phase   0
        endif
far_dda74:
        push    bp
        mov     bp, sp
        push    es
        push    si
        push    di
br_dda7a:
        lds     di, dword ptr [bp + 6]
        cmp     byte ptr [di], 0
        jl      br_dda88
        cmp     word ptr [di + 3ah], 0
        jz      br_dda8b
br_dda88:
        jmp     br_ddf72
br_dda8b:
        mov     dx, word ptr [di + 14h]
        mov     ax, word ptr [di + 12h]
        mov     word ptr [W_7210], dx
        mov     word ptr [W_720E], ax
        push    word 640h
        push    ds
        push    word TBL_F779
        push    word ptr [di + 2eh]
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        mov     si, ax
        sub     ah, ah
        mov     al, byte ptr [TBL_F779]
        and     ax, 0f8h
        mov     word ptr [W_7212], ax
        jmp     br_dddab
br_ddaba:
        mov     ax, word ptr [TBL_F77A]
        shl     al, 1
        shr     ax, 1
        mov     word ptr [di + 3ah], ax
        les     bx, dword ptr [di + 12h]
        mov     al, byte ptr es:[bx]
        and     al, 0f8h
        cmp     al, 88h
        jnz     br_ddaec
        push    word 640h
        push    ds
        push    word TBL_F779
        push    word ptr [di + 2eh]
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        mov     ax, word ptr [TBL_F77A]
        shl     al, 1
        shr     ax, 1
        add     word ptr [di + 3ah], ax
br_ddaec:
        jmp     br_dda7a
br_ddaee:
        sub     ah, ah
        mov     al, byte ptr [B_F77D]
        push    ax
        mov     al, byte ptr [B_F77C]
        push    ax
        push    ds
        push    di
        callf   SEG_E723:far_e723d
        add     sp, 8
        push    si
        push    ds
        mov     ax, TBL_F779
        push    ax
        push    ds
        push    di
        callf   SEG_DCC2:far_dcc2e
        add     sp, 0ah
        jmp     near br_dda7a
br_ddb15:
        test    byte ptr [di + 1], 80h
        jz      br_ddb1e
        jmp     br_ddd80
br_ddb1e:
        cmp     byte ptr [B_A5C0], 0
        jz      br_ddb35
        mov     dx, word ptr [W_7210]
        mov     ax, word ptr [W_720E]
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        jmp     br_ddf72
br_ddb35:
        cmp     byte ptr [B_8A9E], 0
        jle     br_ddbab
        cmp     byte ptr [di], 2
        jnz     br_ddb5c
        mov     dx, word ptr [di + 10h]
        mov     ax, word ptr [di + 0eh]
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        mov     dx, word ptr [di + 18h]
        mov     ax, word ptr [di + 16h]
        mov     word ptr [di + 10h], dx
        mov     word ptr [di + 0eh], ax
        mov     byte ptr [di], 0
br_ddb5c:
        mov     word ptr [di + 38h], 1
        cmp     byte ptr [B_956D], 0
        jz      br_ddb72
        or      byte ptr [B_955C], 40h
        callf   SEG_DB58:far_db58c
br_ddb72:
        mov     al, byte ptr [B_8A9E]
        sub     ah, ah
        push    ax
        callf   SEG_DCCC:far_dccc4
        add     sp, 2
        or      byte ptr [B_955B], 40h
        or      byte ptr [B_955C], 80h
        callf   SEG_DB58:far_db58c
        cmp     byte ptr [B_8C41], 1
        jnz     br_ddba4
        push    1
        push    ds
        push    word B_8C41
        callf   SEG_DEEE:far_deee8
        add     sp, 6
br_ddba4:
        if      FW_VERSION >= 311
        inc     byte ptr [B_8A9D]
        endif
        jmp     br_dda7a
br_ddbab:
        cmp     byte ptr [B_8800], 0
        jnz     br_ddbb5
        jmp     br_ddc85
br_ddbb5:
        sub     ah, ah
        mov     al, byte ptr [B_8804]
        dec     ax
        mov     di, ax
        cmp     byte ptr [B_8801], 0
        jnz     br_ddbda
        mov     dx, word ptr [W_7210]
        mov     ax, word ptr [W_720E]
        mov     word ptr [W_902F], dx
        mov     word ptr [W_902D], ax
        push    cs
        call    far_ddf77
        nop
        jmp     br_ddf72
br_ddbda:
        dec     byte ptr [B_8801]
        jz      br_ddbe3
        jmp     near br_ddc73
br_ddbe3:
        mov     ax, di
        mov     dx, ax
        mov     cl, 5
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        shl     ax, 1
        mov     bx, ax
        inc     byte ptr [B_8803]
        sub     ah, ah
        mov     al, byte ptr [B_8803]
        shl     ax, 1
        push    bx
        add     bx, ax
        mov     al, byte ptr [bx + TBL_A7B0]
        pop     bx
        mov     byte ptr [B_8801], al
        cmp     byte ptr [B_8801], 0
        jnz     br_ddc54
        cmp     byte ptr [di + TBL_A79B], 0
        jz      br_ddc3e
        mov     al, byte ptr [di + TBL_A787]
        dec     al
        mov     byte ptr [B_8803], al
        sub     ah, ah
        shl     ax, 1
        push    bx
        add     bx, ax
        mov     al, byte ptr [bx + TBL_A7B0]
        pop     bx
        mov     byte ptr [B_8801], al
        mov     ax, word ptr [W_A5CB]
        mov     word ptr [W_9053], ax
        jmp     br_ddc54
        db      090h
br_ddc3e:
        mov     dx, word ptr [W_7210]
        mov     ax, word ptr [W_720E]
        mov     word ptr [W_902F], dx
        mov     word ptr [W_902D], ax
        push    cs
        call    far_ddf77
        nop
        jmp     br_ddf72
br_ddc54:
        mov     al, byte ptr [B_8803]
        sub     ah, ah
        shl     ax, 1
        add     bx, ax
        mov     al, byte ptr [bx + TBL_A7AF]
        sub     ah, ah
        push    ax
        callf   SEG_DCCC:far_dccc4
        add     sp, 2
        test    ax, ax
        jz      br_ddc73
        jmp     near br_ddbe3
br_ddc73:
        or      byte ptr [B_955B], 40h
        or      byte ptr [B_955C], 80h
        callf   SEG_DB58:far_db58c
        jmp     br_dda7a
br_ddc85:
        test    byte ptr [di + 1], 1
        jnz     br_ddc8e
        jmp     near br_ddd15
br_ddc8e:
        sub     al, al
        mov     byte ptr [B_A567], al
        mov     byte ptr [B_A568], al
        cmp     word ptr [di + 30h], 1
        jz      br_ddca2
        cmp     word ptr [di + 32h], 1
        jz      br_ddcac
br_ddca2:
        callf   SEG_DE95:far_de95a
        mov     byte ptr [TBL_F779], 0ffh
br_ddcac:
        push    si
        push    ds
        mov     ax, TBL_F779
        push    ax
        push    ds
        push    di
        callf   SEG_DCC2:far_dcc2e
        add     sp, 0ah
        cmp     word ptr [di + 32h], 1
        jnz     br_ddcd6
        mov     word ptr [di + 38h], 1
        cmp     byte ptr [B_A5C1], 8
        jnz     br_ddcd3
        mov     byte ptr [B_A5C1], 0ah
br_ddcd3:
        jmp     br_dda7a
br_ddcd6:
        cmp     byte ptr [di], 0
        jnz     br_ddcea
        mov     byte ptr [di], 2
        mov     dx, word ptr [di + 14h]
        mov     ax, word ptr [di + 12h]
        mov     word ptr [di + 10h], dx
        mov     word ptr [di + 0eh], ax
br_ddcea:
        mov     dx, word ptr [di + 1ch]
        mov     ax, word ptr [di + 1ah]
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        mov     ax, word ptr [di + 32h]
        mov     word ptr [di + 38h], ax
        cmp     byte ptr [B_A5C1], 8
        jc      br_ddd12
        mov     byte ptr [B_A5C1], 6
        mov     byte ptr [B_8A9E], 0ffh
        mov     byte ptr [B_D4BE], 50h
br_ddd12:
        jmp     br_dda7a
br_ddd15:
        callf   SEG_DE95:far_de95a
        mov     byte ptr [TBL_F779], 0ffh
        mov     dx, word ptr [W_7210]
        mov     ax, word ptr [W_720E]
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        cmp     byte ptr [di], 0
        jnz     br_ddd78
        cmp     byte ptr [B_A5C1], 8
        jnz     br_ddd78
        cmp     word ptr [di + 38h], 3e7h
        jg      br_ddd78
        mov     ax, word ptr [di + 38h]
        mov     word ptr [di + 30h], ax
        mov     si, TBL_F779
        mov     byte ptr [si], 0a8h
        shl     ax, 1
        shr     al, 1
        mov     byte ptr [si + 1], al
        mov     byte ptr [si + 2], ah
        mov     al, byte ptr [di + 3ch]
        mov     byte ptr [si + 3], al
        mov     al, byte ptr [di + 3dh]
        mov     byte ptr [si + 4], al
        push    5
        push    ds
        push    si
        push    ds
        push    di
        callf   SEG_DCC2:far_dcc2e
        add     sp, 0ah
        mov     ax, word ptr [di + 3eh]
        mov     word ptr [di + 3ah], ax
        jmp     br_ddf72
br_ddd78:
        push    cs
        call    far_ddf77
        nop
        jmp     br_ddf72
br_ddd80:
        test    byte ptr [di + 1], 1
        jz      br_ddd9b
        mov     dx, word ptr [di + 1ch]
        mov     ax, word ptr [di + 1ah]
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        mov     ax, word ptr [di + 32h]
        mov     word ptr [di + 38h], ax
        jmp     br_dda7a
br_ddd9b:
        mov     dx, word ptr [W_7210]
        mov     ax, word ptr [W_720E]
        mov     word ptr [di + 14h], dx
        mov     word ptr [di + 12h], ax
        jmp     br_ddf72
br_dddab:
        cmp     ax, 88h
        jnz     br_dddb3
        jmp     br_ddaba
br_dddb3:
        cmp     ax, 0a8h
        jnz     br_dddbb
        jmp     br_ddaee
br_dddbb:
        cmp     ax, 0f8h
        jnz     br_dddc3
        jmp     br_ddb15
br_dddc3:
        test    byte ptr [di + 1], 80h
        jz      br_dddcc
        jmp     br_ddf3d
br_dddcc:
        cmp     byte ptr [B_A5C1], 8
        jnz     br_ddde6
        cmp     byte ptr [B_A570], 0
        jnz     br_ddde3
        mov     al, byte ptr [TBL_F77A]
        cmp     al, byte ptr [B_8A9B]
        jnz     br_ddde6
        if      FW_VERSION < 311
        mov     byte ptr [0cec6h], 1
        endif
br_ddde3:
        jmp     br_dda7a
br_ddde6:
        mov     word ptr [W_7214], 1
        cmp     byte ptr [B_A5C1], 0ah
        jz      br_dddf6
        jmp     br_ddf13
br_dddf6:
        mov     al, byte ptr [TBL_F77A]
        cmp     al, byte ptr [B_8A9B]
        jz      br_dde02
        jmp     br_ddf13
br_dde02:
        mov     ax, word ptr [W_7212]
        sub     ah, ah
        jmp     br_ddef4
br_dde0a:
        cmp     byte ptr [B_A5C7], 0
        jz      br_dde3d
        cmp     byte ptr [B_96EE], 0
        jz      br_dde2c
        mov     al, byte ptr [B_F77B]
        sub     ah, ah
        mov     bx, ax
        cmp     byte ptr [bx + TBL_966E], 0
        jz      br_dde29
        if      FW_VERSION < 311
        mov     byte ptr [0cec6h], 1
        endif
        jmp     br_dda7a
br_dde29:
        jmp     br_dde3d
        db      090h
br_dde2c:
        mov     al, byte ptr [B_F77B]
        sub     ah, ah
        mov     bx, ax
        cmp     byte ptr [bx + TBL_956E], 0
        jz      br_dde3d
        if      FW_VERSION < 311
        mov     byte ptr [0cec6h], 1
        endif
        jmp     br_dda7a
br_dde3d:
        cmp     byte ptr [B_D4AC], 0
        jz      br_dde66
        cmp     byte ptr [B_96EE], 0
        jz      br_dde66
        mov     bl, byte ptr [B_F77B]
        cmp     bl, byte ptr [B_977F]
        jnz     br_dde66
        mov     al, byte ptr [TBL_F779]
        and     al, 3
        cmp     al, byte ptr [B_977E]
        jnz     br_dde66
        if      FW_VERSION >= 311
        mov     al, byte ptr [B_977D]
        else
        mov     byte ptr [0cec6h], 1
        mov     al, byte ptr [9192h]
        endif
        mov     byte ptr [B_F77D], al
br_dde66:
        cmp     byte ptr [B_8807], 0
        jz      br_dde8f
        callf   SEG_DD3C:far_dd3c2
        mov     word ptr [W_7214], 0
        jmp     near br_ddf13
br_dde7b:
        cmp     byte ptr [B_A56D], 2
        jl      br_dde8f
        jmp     br_dda7a
br_dde85:
        cmp     byte ptr [B_A56C], 0
        jz      br_dde8f
        jmp     br_dda7a
br_dde8f:
        jmp     near br_ddf13
br_dde92:
        mov     al, byte ptr [B_F77B]
        sub     ah, ah
        jmp     br_ddee4
        db      090h
tgt_dde9a:
        cmp     byte ptr [B_A56B], 0
        jz      tgt_ddef1
        jmp     br_dda7a
tgt_ddea4:
        cmp     byte ptr [B_A56A], 0
        jz      tgt_ddef1
        jmp     br_dda7a
tgt_ddeae:
        cmp     byte ptr [B_A569], 0
        jz      tgt_ddef1
        jmp     br_dda7a
tgt_ddeb8:
        cmp     byte ptr [B_A568], 0
        jz      tgt_ddef1
        jmp     br_dda7a
tgt_ddec2:
        cmp     byte ptr [B_A567], 0
        jz      tgt_ddef1
        jmp     br_dda7a
TBL_ddecc:
        dw      tgt_ddef1
        dw      tgt_dde9a
        dw      tgt_ddea4
        dw      tgt_ddef1
        dw      tgt_ddeae
        dw      tgt_ddef1
        dw      tgt_ddef1
        dw      tgt_ddeb8
        dw      tgt_ddef1
        dw      tgt_ddef1
        dw      tgt_ddef1
        dw      tgt_ddec2
br_ddee4:
        cmp     ax, 0ch
        jnc     tgt_ddef1
        xchg    bx, ax
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_ddecc]
tgt_ddef1:
        jmp     br_ddf13
        db      090h
br_ddef4:
        cmp     ax, 98h
        jnz     br_ddefc
        jmp     br_dde0a
br_ddefc:
        cmp     ax, 0b0h
        jnz     br_ddf03
        jmp     br_dde92
br_ddf03:
        cmp     ax, 0d0h
        jnz     br_ddf0b
        jmp     near br_dde7b
br_ddf0b:
        cmp     ax, 0e0h
        jnz     br_ddf13
        jmp     near br_dde85
br_ddf13:
        cmp     word ptr [W_7214], 0
        jz      br_ddf2a
        push    si
        push    ds
        mov     ax, TBL_F779
        push    ax
        push    ds
        push    di
        callf   SEG_DCC2:far_dcc2e
        add     sp, 0ah
br_ddf2a:
        cmp     byte ptr [B_A56E], 0
        jz      br_ddf47
        mov     al, byte ptr [TBL_F77A]
        cmp     al, byte ptr [B_8A9B]
        jz      br_ddf47
        jmp     br_dda7a
br_ddf3d:
        cmp     byte ptr [B_A56E], 0
        jz      br_ddf47
        jmp     br_dda7a
br_ddf47:
        mov     al, byte ptr [TBL_F77A]
        sub     ah, ah
        mov     bx, ax
        test    byte ptr [bx+di + 0a6h], 1
        jz      br_ddf58
        jmp     br_dda7a
br_ddf58:
        mov     al, byte ptr [di + 1]
        and     al, 80h
        or      byte ptr [TBL_F77A], al
        push    si
        push    ds
        mov     ax, TBL_F779
        push    ax
        callf   SEG_DD9B:far_dd9ba
        add     sp, 6
        jmp     br_dda7a
br_ddf72:
        pop     di
        pop     si
        pop     es
        pop     bp
        retf
far_ddf77:
        push    bp
        push    si
        push    di
        callf   SEG_DB00:far_db00c
        mov     di, 0
loop_ddf82:
        sub     sp, 2
        mov     bp, sp
        push    4
        mov     ax, di
        shl     ax, 1
        shl     ax, 1
        if      FW_VERSION >= 312
        add     ax, 7216h
        elseif  FW_VERSION = 311
        add     ax, 715eh
        else
        add     ax, 6a92h
        endif
        push    ds
        push    ax
        sub     si, si
loop_ddf96:
        cmp     byte ptr [si + TBL_A57E], 0
        jz      br_ddfa9
        mov     ax, si
        mov     ah, 0ffh
        mov     word ptr [bp], ax
        callf   SEG_DCE1:far_dce14
br_ddfa9:
        inc     si
        cmp     si, 40h
        jl      loop_ddf96
        add     sp, 8
        inc     di
        cmp     di, 3
        jl      loop_ddf82
        mov     bx, es
        mov     ax, ds
        mov     es, ax
        mov     di, TBL_A57E
        mov     cx, 40h
        cld
        sub     ax, ax
        rep stosb
        mov     es, bx
        mov     byte ptr [B_8A9E], 0
        callf   SEG_D974:far_d9748
        pop     di
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   9
        elseif  FW_VERSION = 311
        phase   0fh
        else
        phase   5
        endif
far_ddfd9:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     dx, word ptr [bp + 0ah]
        cmp     byte ptr [B_A5C0], 0
        jz      br_de008
        cmp     word ptr [W_93F5], 1
        jnz     br_ddff5
        jmp     br_de273
br_ddff5:
        push    dx
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_DBE6:far_dc15f
        add     sp, 6
        pop     di
        pop     si
        leave
        retf
br_de008:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        mov     ah, 0
        and     ax, 0f8h
        mov     bx, ax
        cmp     byte ptr [B_A5C1], 8
        jge     br_de01f
        jmp     br_de273
br_de01f:
        cmp     byte ptr [B_A570], 0
        jnz     br_de029
        jmp     br_de172
br_de029:
        cmp     ax, 80h
        jnz     br_de031
        jmp     br_de10d
br_de031:
        cmp     ax, 90h
        jz      br_de039
        jmp     br_de25b
br_de039:
        mov     word ptr [bp - 2], 0
loop_de03e:
        mov     al, byte ptr [B_A56F]
        mov     ah, 0
        mov     bx, ax
        cmp     byte ptr [bx + TBL_A4E7], 0ffh
        jz      br_de066
        mov     al, byte ptr [B_A56F]
        inc     al
        mov     byte ptr [B_A56F], al
        cmp     al, 1eh
        jc      br_de05d
        mov     byte ptr [B_A56F], 0
br_de05d:
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 1eh
        jl      loop_de03e
br_de066:
        cmp     word ptr [bp - 2], 1eh
        jl      br_de06f
        if      FW_VERSION >= 311
        jmp     br_de273
        else
        jmp     near L_e6745
        endif
br_de06f:
        mov     al, byte ptr [B_A56F]
        mov     ah, 0
        mov     di, ax
        shl     ax, 1
        mov     dx, word ptr [W_8820]
        mov     bx, ax
        mov     word ptr [bx + TBL_A3E7], dx
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [di + TBL_A4E7], al
        mov     al, byte ptr es:[bx + 1]
        mov     byte ptr [di + TBL_A367], al
        mov     al, 98h
        or      al, byte ptr es:[bx]
        mov     byte ptr [bp - 8], al
        mov     al, byte ptr es:[bx + 1]
        mov     byte ptr [bp - 7], al
        mov     al, byte ptr es:[bx + 2]
        mov     byte ptr [bp - 6], al
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [bp - 5], al
        push    1
        callf   SEG_DAD5:far_dad54
        add     sp, 2
        push    4
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    1
        callf   SEG_D9B6:far_d9b6e
        add     sp, 8
        mov     al, byte ptr [B_A56F]
        mov     ah, 0
        shl     ax, 2
        mov     dx, word ptr [W_9033]
        mov     bx, word ptr [W_9031]
        mov     si, ax
        mov     word ptr [si + TBL_A069], dx
        mov     word ptr [si + TBL_A067], bx
        mov     byte ptr [bp - 8], 40h
        mov     byte ptr [bp - 7], 14h
        mov     byte ptr [bp - 6], 0
        push    3
        push    ss
        lea     ax, [bp - 8]
        push    ax
        push    1
        callf   SEG_D9B6:far_d9b6e
        add     sp, 8
        if      FW_VERSION >= 311
        mov     byte ptr [B_96F5], 1
        else
        mov     byte ptr [B_96F5], 1
L_e6745:
        cmp     byte ptr [B_CEC6_V308], 0
        jz      L_e674f
        jmp     br_de273
L_e674f:
        mov     byte ptr [B_CEC6_V308], 1
        endif
        pop     di
        pop     si
        leave
        retf
br_de10d:
        mov     word ptr [bp - 2], 0
loop_de112:
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_A4E7]
        les     bx, dword ptr [bp + 6]
        cmp     al, byte ptr es:[bx + 2]
        jnz     br_de132
        mov     bx, word ptr [bp - 2]
        mov     al, byte ptr [bx + TBL_A367]
        mov     bx, word ptr [bp + 6]
        cmp     al, byte ptr es:[bx + 1]
        jz      br_de13b
br_de132:
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 1eh
        jl      loop_de112
br_de13b:
        cmp     word ptr [bp - 2], 1eh
        jl      br_de144
        jmp     br_de273
br_de144:
        mov     dx, 40h
        mov     bx, word ptr [bp - 2]
        shl     bx, 1
        mov     ax, word ptr [W_8820]
        sub     ax, word ptr [bx + TBL_A3E7]
        push    ax
        push    dx
        push    word ptr [bp - 2]
        callf   SEG_DAFB:far_dafb0
        add     sp, 6
        mov     bx, word ptr [bp - 2]
        mov     byte ptr [bx + TBL_A4E7], 0ffh
        mov     al, byte ptr [bp - 2]
        mov     byte ptr [B_A56F], al
        pop     di
        pop     si
        leave
        retf
br_de172:
        mov     ax, bx
        cmp     ax, 80h
        jz      br_de1c5
        cmp     ax, 90h
        jz      br_de181
        jmp     br_de25b
br_de181:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     di, ax
        cmp     byte ptr [di + TBL_A4E7], 0feh
        if      FW_VERSION >= 311
        jnz     br_de196
        jmp     br_de273
br_de196:
        else
        jz      L_e6809
        endif
        mov     byte ptr [B_880B], 1
        mov     al, byte ptr es:[bx]
        and     al, 7
        or      al, 80h
        mov     byte ptr [di + TBL_9FE7], al
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [di + TBL_A4E7], al
        mov     al, byte ptr es:[bx + 4]
        mov     byte ptr [di + TBL_A367], al
        mov     bx, di
        shl     bx, 1
        mov     ax, word ptr [W_8820]
        mov     word ptr [bx + TBL_A3E7], ax
        if      FW_VERSION < 311
L_e6809:
        cmp     byte ptr [B_CEC6_V308], 0
        jz      L_e6813
        jmp     near br_de273
L_e6813:
        mov     byte ptr [B_CEC6_V308], 1
        endif
        pop     di
        pop     si
        leave
        retf
br_de1c5:
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 2]
        mov     ah, 0
        mov     di, ax
        cmp     byte ptr [di + TBL_A4E7], 0feh
        jnz     br_de221
        mov     bx, di
        shl     bx, 1
        mov     ax, word ptr [W_8820]
        sub     ax, word ptr [bx + TBL_A3E7]
        mov     word ptr [bp - 4], ax
        mov     dx, 0ffffh
        mov     al, byte ptr [B_96EE]
        cbw
        or      ax, ax
        jnz     br_de1fb
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr es:[bx + 3]
        mov     ah, 0
        mov     dx, ax
br_de1fb:
        push    word ptr [bp - 4]
        push    dx
        push    di
        callf   SEG_DAFB:far_dafb0
        add     sp, 6
        cmp     byte ptr [di + TBL_9F67], 0ffh
        jnz     br_de218
        mov     byte ptr [di + TBL_A4E7], 0ffh
        pop     di
        pop     si
        leave
        retf
br_de218:
        mov     byte ptr [di + TBL_A4E7], 0fdh
        pop     di
        pop     si
        leave
        retf
br_de221:
        cmp     byte ptr [di + TBL_A4E7], 0ffh
        jz      br_de273
        test    byte ptr [di + TBL_9FE7], 80h
        jz      br_de273
        mov     byte ptr [B_880B], 1
        and     byte ptr [di + TBL_9FE7], 7fh
        mov     al, byte ptr [B_96EE]
        cbw
        or      ax, ax
        jnz     br_de24c
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx + 3]
        mov     byte ptr [di + TBL_A367], al
br_de24c:
        mov     bx, di
        shl     bx, 1
        mov     ax, word ptr [W_8820]
        mov     word ptr [bx + TBL_A267], ax
        pop     di
        pop     si
        leave
        retf
br_de25b:
        push    dx
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    ds
        push    word B_901B
        callf   SEG_DCC2:far_dcc2e
        add     sp, 0ah
        mov     byte ptr [B_96F5], 1
br_de273:
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        db      0ffh
        phase   8
        elseif  FW_VERSION = 311
        db      0ffh
        phase   0eh
        else
        phase   0eh
        endif
far_de278:
        push    bp
        mov     bp, sp
        push    es
        push    di
        cmp     word ptr [W_9D65], 0
        jg      br_de290
        mov     word ptr [W_9D61], 1
        mov     bx, 0
        jmp     br_de2b5
        db      090h
br_de290:
        mov     bx, word ptr [W_9D61]
        mov     di, TBL_9CFD
        mov     cx, bx
        sub     ax, ax
loop_de29b:
        cmp     word ptr [di], ax
        jz      br_de2b3
        add     di, 2
        loop    loop_de29b
        cmp     bx, 32h
        jc      br_de2ac
        jmp     near br_de33d
br_de2ac:
        inc     word ptr [W_9D61]
        jmp     br_de2b5
        db      090h
br_de2b3:
        sub     bx, cx
br_de2b5:
        les     di, dword ptr [bp + 6]
        mov     al, byte ptr es:[di + 1]
        callf   SEG_DCF8:far_dd0fb
        mov     byte ptr [bx + TBL_9C67], al
        mov     byte ptr [bx + TBL_9C35], ah
        mov     al, byte ptr es:[di + 2]
        mov     byte ptr [bx + TBL_9CCB], al
        mov     al, byte ptr es:[di + 4]
        mov     byte ptr [bx + TBL_9C99], al
        shl     bx, 1
        mov     cl, byte ptr es:[di + 5]
        shl     cl, 1
        mov     ch, byte ptr es:[di + 6]
        shr     cx, 1
        cmp     word ptr [W_9D65], 0
        jnz     br_de2fd
        mov     word ptr [W_9D65], cx
        mov     word ptr [W_9D63], cx
        mov     word ptr [bx + TBL_9CFD], cx
        jmp     br_de327
        db      090h
br_de2fd:
        cmp     cx, word ptr [W_9D63]
        jl      br_de312
        add     cx, word ptr [W_9D65]
        sub     cx, word ptr [W_9D63]
        mov     word ptr [bx + TBL_9CFD], cx
        jmp     br_de327
        db      090h
br_de312:
        mov     ax, cx
        sub     ax, word ptr [W_9D63]
        add     word ptr [W_9D65], ax
        mov     word ptr [W_9D63], cx
        mov     ax, word ptr [W_9D65]
        mov     word ptr [bx + TBL_9CFD], ax
br_de327:
        and     byte ptr es:[di], 0f7h
        push    0
        push    5
        push    es
        push    di
        callf   SEG_DCF8:far_dcf84
        add     sp, 8
        or      byte ptr es:[di], 8
br_de33d:
        pop     di
        pop     es
        pop     bp
        retf
far_de341:
        push    es
        push    di
        cld
        mov     ax, ds
        mov     es, ax
        mov     ax, 0
        mov     di, TBL_9CFD
        mov     cx, 32h
        rep stosw
        mov     word ptr [W_9D65], ax
        mov     word ptr [W_9D63], ax
        mov     word ptr [W_9D61], 1
        pop     di
        pop     es
        retf
far_de362:
        cmp     word ptr [W_9D63], 0
        jg      br_de36a
        retf
br_de36a:
        dec     word ptr [W_9D63]
        jz      br_de371
        retf
br_de371:
        push    si
        mov     dx, word ptr [W_9D65]
        mov     cx, word ptr [W_9D61]
        mov     si, 0ffffh
        mov     bx, 0fffeh
loop_de380:
        add     bx, 2
        mov     ax, word ptr [bx + TBL_9CFD]
        test    ax, ax
        jz      br_de3a5
        sub     ax, dx
        jg      br_de39b
        mov     word ptr [bx + TBL_9CFD], 0
        call    fn_de3b8
        jmp     br_de3a5
        db      090h
br_de39b:
        mov     word ptr [bx + TBL_9CFD], ax
        cmp     ax, si
        jnc     br_de3a5
        mov     si, ax
br_de3a5:
        loop    loop_de380
        cmp     si, 0ffffh
        jnz     br_de3ae
        sub     si, si
br_de3ae:
        mov     word ptr [W_9D63], si
        mov     word ptr [W_9D65], si
        pop     si
        retf
fn_de3b8:
        push    ax
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    es
        shr     bx, 1
        mov     byte ptr [B_9C31], 80h
        mov     byte ptr [B_9C32], 0
        mov     al, byte ptr [bx + TBL_9CCB]
        mov     byte ptr [B_9C33], al
        mov     al, byte ptr [bx + TBL_9C99]
        mov     byte ptr [B_9C34], al
        mov     al, byte ptr [bx + TBL_9C67]
        mov     ah, byte ptr [bx + TBL_9C35]
        push    0
        push    ax
        push    4
        push    ds
        push    word B_9C31
        callf   SEG_DCF8:far_dcfb5
        add     sp, 0ah
        pop     es
        pop     di
        pop     si
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret
far_de3fa:
        cmp     word ptr [W_9D65], 0
        jz      br_de41a
        mov     cx, word ptr [W_9D61]
        sub     bx, bx
loop_de407:
        cmp     word ptr [bx + TBL_9CFD], 0
        jz      br_de411
        call    fn_de3b8
br_de411:
        add     bx, 2
        loop    loop_de407
        push    cs
        call    far_de341
br_de41a:
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   0ch
        else
        phase   2
        endif
far_de41c:
        push    es
        cmp     byte ptr [B_9457], 0
        jz      br_de427
        jmp     near br_de4bf
br_de427:
        push    bp
        sub     sp, 0ah
        mov     bp, sp
br_de42d:
        push    0ah
        push    ss
        push    bp
        push    8
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        or      ax, ax
        jz      br_de44b
        push    ss
        push    bp
        callf   SEG_CB77:far_cb772
        add     sp, 4
        jmp     br_de42d
br_de44b:
        add     sp, 0ah
        pop     bp
        mov     ax, SEG_A8EC
        mov     es, ax
        pushf
        cli
        test    word ptr es:[1330h], 0ffffh
        jz      br_de470
        or      byte ptr [B_9782], 1
        or      byte ptr [TBL_943B], 2
        mov     al, byte ptr [TBL_943B]
        mov     dx, 0c6h
        out     dx, al
br_de470:
        test    word ptr es:[1932h], 0ffffh
        jz      br_de48a
        or      byte ptr [B_9782], 2
        or      byte ptr [B_943C], 2
        mov     al, byte ptr [B_943C]
        mov     dx, 0ceh
        out     dx, al
br_de48a:
        test    word ptr es:[1f34h], 0ffffh
        jz      br_de4a4
        or      byte ptr [B_9782], 4
        or      byte ptr [B_943D], 2
        mov     al, byte ptr [B_943D]
        mov     dx, 0d6h
        out     dx, al
br_de4a4:
        test    word ptr es:[2536h], 0ffffh
        jz      br_de4be
        or      byte ptr [B_9782], 8
        or      byte ptr [B_943E], 2
        mov     al, byte ptr [B_943E]
        mov     dx, 0deh
        out     dx, al
br_de4be:
        popf
br_de4bf:
        pop     es
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   2
        else
        phase   8
        endif
far_de4c2:
        push    bp
        mov     bp, sp
        push    ds
        lds     bx, dword ptr [bp + 6]
        mov     al, byte ptr [bx]
        jmp     br_de4d4
        db      090h, 0c5h, 05eh, 006h, 08ah, 007h, 04bh
br_de4d4:
        and     al, 0f8h
        jns     br_de50b
        cmp     al, 98h
        jz      br_de4e8
        cmp     al, 0b8h
        jz      br_de510
        cmp     al, 0e8h
        jz      br_de515
        test    al, 8
        jnz     br_de50b
br_de4e8:
        mov     cl, 4
        shr     al, cl
        and     al, 7
        cmp     al, 7
        jnz     br_de517
        cmp     byte ptr [bx + 2], 47h
        jnz     br_de517
        cmp     byte ptr [bx + 5], 45h
        jz      br_de504
        cmp     byte ptr [bx + 5], 46h
        jnz     br_de517
br_de504:
        add     al, byte ptr [bx + 6]
        cmp     al, 0ch
        jc      br_de517
br_de50b:
        mov     al, 0dh
        jmp     br_de517
        db      090h
br_de510:
        xor     al, al
        jmp     br_de517
        db      090h
br_de515:
        mov     al, 0ch
br_de517:
        xor     ah, ah
        pop     ds
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   0ch
        else
        phase   2
        endif
far_de51c:
        cmp     byte ptr [B_7FD1], 2
        jz      br_de52a
        cmp     byte ptr [B_7FD1], 1
        jnz     br_de52d
br_de52a:
        jmp     br_de622
br_de52d:
        mov     ax, word ptr [W_D635]
        mov     dx, word ptr [W_D637]
        sub     ax, word ptr [W_D639]
        sbb     dx, word ptr [W_D63B]
        rcl     dx, 1
        pushf
        rcr     dx, 1
        or      dx, dx
        jnz     br_de54e
        cmp     ax, 1
        ja      br_de54e
        popf
        jmp     br_de581
        db      090h
br_de54e:
        popf
        pushf
        jnc     br_de55f
        not     ax
        not     dx
        add     ax, 1
        adc     dx, 0
        jmp     br_de565
        db      090h
br_de55f:
        sub     ax, 1
        sbb     dx, 0
br_de565:
        mov     bx, 10h
        or      dx, dx
        jnz     br_de576
        test    ax, 0fff0h
        jnz     br_de576
        and     ax, 0fh
        mov     bx, ax
br_de576:
        dec     bx
        shl     bx, 1
        mov     bx, word ptr cs:[bx + TBL_de74c]
        jmp     br_de6b3
br_de581:
        rcr     al, 1
        cmc
        pushf
        jc      br_de5a6
        mov     ax, word ptr [W_D63D]
        mov     dx, word ptr [W_D63F]
        sub     ax, word ptr [W_D645]
        sbb     dx, word ptr [W_D647]
        add     ax, word ptr [W_D60E]
        adc     dx, 0
        jns     br_de5cb
        sub     ax, ax
        sub     dx, dx
        jmp     br_de5cb
        db      090h
br_de5a6:
        mov     ax, word ptr [W_D641]
        mov     dx, word ptr [W_D643]
        sub     ax, word ptr [W_D63D]
        sbb     dx, word ptr [W_D63F]
        sub     ax, word ptr [W_D60E]
        sbb     dx, 0
        jns     br_de5cb
        not     ax
        not     dx
        add     ax, 1
        adc     dx, 0
        popf
        cmc
        pushf
br_de5cb:
        mov     di, word ptr [W_D641]
        mov     si, word ptr [W_D643]
        sub     di, word ptr [W_D645]
        sbb     si, word ptr [W_D647]
        mov     word ptr [W_D623], ax
        mov     word ptr [W_D625], dx
        mov     word ptr [W_D61F], di
        mov     word ptr [W_D621], si
        call    fn_de745
        jnc     br_de604
        mov     cx, 10h
loop_de5f2:
        or      si, si
        jz      br_de600
        shr     dx, 1
        rcr     ax, 1
        shr     si, 1
        rcr     di, 1
        loop    loop_de5f2
br_de600:
        or      di, di
        jnz     br_de60a
br_de604:
        mov     ax, 0ffffh
        jmp     br_de610
        db      090h
br_de60a:
        mov     dx, ax
        xor     ax, ax
        div     di
br_de610:
        mov     cl, 4
        shr     ah, cl
        mov     bl, ah
        xor     bh, bh
        shl     bx, 1
        mov     bx, word ptr cs:[bx + TBL_de76c]
        jmp     near br_de6b3
br_de622:
        mov     ax, word ptr [W_D641]
        mov     dx, word ptr [W_D643]
        sub     ax, word ptr [W_D63D]
        sbb     dx, word ptr [W_D63F]
        add     ax, word ptr [W_D5F5]
        adc     dx, word ptr [W_D5F7]
        mov     di, word ptr [W_D631]
        mov     si, word ptr [W_D633]
        mov     cx, word ptr [W_D5F9]
        mov     bx, word ptr [W_D5FB]
br_de649:
        call    fn_de745
        jc      br_de65a
        sub     ax, di
        sbb     dx, si
        add     cx, 1
        adc     bx, 0
        jmp     br_de649
br_de65a:
        mov     di, ax
        mov     si, dx
        mov     ax, word ptr [W_D635]
        mov     dx, word ptr [W_D637]
        sub     ax, cx
        sbb     dx, bx
        rcl     dx, 1
        pushf
        rcr     dx, 1
        or      dx, dx
        jnz     br_de677
        cmp     ax, 1
        jbe     br_de67a
br_de677:
        jmp     br_de54e
br_de67a:
        popf
        rcr     al, 1
        cmc
        pushf
        jc      br_de696
        mov     ax, word ptr [W_D631]
        mov     dx, word ptr [W_D633]
        sub     ax, di
        sbb     dx, si
        add     ax, word ptr [W_D60E]
        adc     dx, 0
        jmp     br_de6b0
        db      090h
br_de696:
        mov     ax, di
        mov     dx, si
        sub     ax, word ptr [W_D60E]
        sbb     dx, 0
        jns     br_de6b0
        not     ax
        not     dx
        add     ax, 1
        adc     dx, 0
        popf
        cmc
        pushf
br_de6b0:
        jmp     br_de5cb
br_de6b3:
        cmp     byte ptr [B_7FD1], 2
        jz      br_de6c1
        cmp     byte ptr [B_7FD1], 1
        jnz     br_de6c7
br_de6c1:
        mov     ax, word ptr [W_D657]
        jmp     br_de6fd
        db      090h
br_de6c7:
        mov     ax, word ptr [W_D641]
        mov     dx, word ptr [W_D643]
        sub     ax, word ptr [W_D645]
        sbb     dx, word ptr [W_D647]
        mov     cl, byte ptr [B_7FD1]
        xor     ch, ch
        mov     si, cx
        shl     si, 1
        mov     cx, word ptr cs:[si + TBL_de739]
        div     cx
        cmp     ax, 0c350h
        jbe     br_de6f2
        mov     ax, 0c350h
        jmp     br_de6fa
        db      090h
br_de6f2:
        cmp     ax, 0df3h
        jnc     br_de6fa
        mov     ax, 0df3h
br_de6fa:
        mov     word ptr [W_D657], ax
br_de6fd:
        mov     di, ax
        xor     si, si
        mul     bx
        mov     al, ah
        mov     ah, dl
        mov     dl, dh
        xor     dh, dh
        popf
        jnc     br_de721
        add     di, ax
        adc     si, dx
        xor     dx, dx
        mov     ax, 0c350h
        call    fn_de745
        ja      br_de734
        mov     di, ax
        jmp     br_de734
        db      090h
br_de721:
        sub     di, ax
        sbb     si, dx
        mov     dx, 0
        mov     ax, 0df3h
        js      br_de732
        call    fn_de745
        jc      br_de734
br_de732:
        mov     di, ax
br_de734:
        mov     word ptr [W_D655], di
        retf
TBL_de739:
        db      004h, 000h, 001h, 000h, 001h, 000h, 004h, 000h, 060h, 000h, 001h, 000h
fn_de745:
        cmp     dx, si
        jnz     br_de74b
        cmp     ax, di
br_de74b:
        ret
TBL_de74c:
        db      000h, 001h, 040h, 001h, 080h, 001h, 0c0h, 001h, 000h, 002h, 040h, 002h, 080h, 002h, 0c0h, 002h
        db      000h, 003h, 040h, 003h, 080h, 003h, 0c0h, 003h, 000h, 004h, 040h, 004h, 080h, 004h, 0c0h, 004h
TBL_de76c:
        db      002h, 000h, 004h, 000h, 006h, 000h, 008h, 000h, 00ah, 000h, 00ch, 000h, 00eh, 000h, 010h, 000h
        db      020h, 000h, 040h, 000h, 060h, 000h, 080h, 000h, 0a0h, 000h, 0c0h, 000h, 0e0h, 000h, 000h, 001h
        if      FW_VERSION >= 312
        phase   0ch
        else
        phase   2
        endif
far_de78c:
        cmp     byte ptr [B_D60A], 0
        jz      br_de7a8
        cmp     byte ptr [B_7FD3], 0
        jz      br_de7a8
        cmp     byte ptr [B_7FD1], 2
        jz      br_de7a8
        cmp     byte ptr [B_7FD1], 1
        jnz     br_de7ad
br_de7a8:
        callf   SEG_DCC6:far_dcca0
br_de7ad:
        retf
far_de7ae:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        mov     si, word ptr [bp + 6]
        mov     di, word ptr [bp + 0ah]
        cmp     word ptr [bp + 8], 0
        jnz     br_de7c5
        jmp     near br_de86c
br_de7c5:
        and     di, 3
        mov     ax, si
        mov     bx, 0ah
        xor     dx, dx
        div     bx
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], ax
        mov     ax, si
        xor     dx, dx
        xor     cx, cx
        mov     bx, word ptr [bp - 4]
        push    ax
        push    dx
        mov     ax, 0ah
        callf   0f800h:far_fa0c8
        pop     bx
        pop     cx
        sub     cx, ax
        sbb     bx, dx
        mov     word ptr [bp - 6], bx
        mov     word ptr [bp - 8], cx
        mov     cx, word ptr [bp - 2]
        mov     bx, word ptr [bp - 4]
        xor     dx, dx
        mov     ax, 3e8h
        callf   0f800h:far_fa0c8
        push    ax
        push    dx
        push    0
        push    8
        mov     cx, word ptr [bp - 6]
        mov     bx, word ptr [bp - 8]
        xor     dx, dx
        mov     ax, 3e8h
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        pop     bx
        pop     cx
        add     cx, ax
        adc     bx, dx
        mov     si, di
        shl     si, 1
        mov     ax, word ptr [si + TBL_7222]
        cwd
        xchg    bx, cx
        callf   0f800h:far_fa0c8
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    0
        push    0ah
        mov     bx, di
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_722A]
        cwd
        push    dx
        push    ax
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        callf   0f800h:far_fa0fe
        add     ax, 5
        adc     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        pop     di
        pop     si
        leave
        retf
br_de86c:
        push    0
        push    0ah
        push    0
        push    si
        push    word 773h
        push    word 5940h
        callf   0f800h:far_fa0fe
        add     ax, 5
        adc     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        pop     di
        pop     si
        leave
        retf
far_de88f:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        push    di
        mov     di, word ptr [bp + 0ah]
        cmp     word ptr [bp + 8], 0
        jnz     br_de8a3
        jmp     near br_de935
br_de8a3:
        and     di, 3
        mov     bx, di
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_7222]
        cwd
        push    dx
        push    ax
        mov     bx, word ptr [bp + 6]
        xor     cx, cx
        mov     si, di
        shl     si, 1
        mov     ax, word ptr [si + TBL_722A]
        cwd
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        add     ax, 5
        adc     dx, 0
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    0
        push    64h
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        push    0
        push    64h
        mov     cx, word ptr [bp - 2]
        mov     bx, word ptr [bp - 4]
        xor     dx, dx
        mov     ax, 64h
        callf   0f800h:far_fa0c8
        push    ax
        push    dx
        mov     dx, word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ch]
        pop     bx
        pop     cx
        sub     ax, cx
        sbb     dx, bx
        mov     cl, 3
        callf   0f800h:far_fa1ac
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        mov     cx, word ptr [bp - 2]
        mov     bx, word ptr [bp - 4]
        xor     dx, dx
        mov     ax, 0ah
        callf   0f800h:far_fa0c8
        add     ax, word ptr [bp - 8]
        pop     di
        pop     si
        leave
        retf
br_de935:
        push    0
        push    0ah
        push    0
        push    word ptr [bp + 6]
        push    word 773h
        push    word 5940h
        callf   0f800h:far_fa0fe
        add     ax, 5
        adc     dx, 0
        push    dx
        push    ax
        callf   0f800h:far_fa0fe
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   0ah
        else
        phase   0
        endif
far_de95a:
        push    di
        mov     al, byte ptr [B_901B]
        or      al, byte ptr [B_A570]
        jnz     br_de9df
        test    byte ptr [B_880A], 1
        jnz     br_de97a
        cmp     byte ptr [B_A574], 0
        jz      br_de977
        callf   SEG_DB00:far_db034
br_de977:
        jmp     br_de9df
        db      090h
br_de97a:
        mov     di, word ptr [W_8814]
        mov     ax, word ptr [W_8812]
        mov     word ptr [W_8814], ax
        callf   SEG_DCA3:far_dca3e
br_de989:
        push    word 640h
        push    ds
        push    word TBL_F779
        push    4
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        or      ax, ax
        jz      br_de9db
        push    ax
        cmp     byte ptr [TBL_F779], 88h
        jnz     br_de9c1
        mov     ax, word ptr [TBL_F77A]
        shl     al, 1
        shr     ax, 1
        add     ax, word ptr [W_8814]
        mov     word ptr [W_8814], 0
        shl     ax, 1
        shr     al, 1
        mov     word ptr [TBL_F77A], ax
        jmp     br_de9cb
        db      090h
br_de9c1:
        push    1
        callf   SEG_DAD5:far_dad54
        add     sp, 2
br_de9cb:
        push    ds
        push    word TBL_F779
        push    1
        callf   SEG_D9B6:far_d9b6e
        add     sp, 8
        jmp     br_de989
br_de9db:
        add     word ptr [W_8814], di
br_de9df:
        mov     byte ptr [B_A574], 0
        mov     byte ptr [B_880A], 0
        pop     di
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   0ch
        else
        phase   2
        endif
far_de9ec:
        push    es
        mov     ax, SEG_A8EC
        mov     es, ax
        pushf
        cli
        mov     ax, word ptr es:[1330h]
        add     ax, word ptr es:[1932h]
        add     ax, word ptr es:[1f34h]
        add     ax, word ptr es:[2536h]
        jz      br_dea0e
        callf   0fb00h:far_fb45f
br_dea0e:
        popf
        pop     es
        retf
        db      0ffh
        if      FW_VERSION >= 312
        phase   3cc2h
        elseif  FW_VERSION = 311
        phase   3cc8h
        else
        phase   3908h
        endif
far_dea12:
        push    bp
        mov     bp, sp
        push    es
        push    di
        les     di, dword ptr [bp + 8]
        push    word ptr [bp + 0ch]
        push    es
        push    di
        push    word ptr [bp + 6]
        callf   SEG_D9B6:far_d9b6e
        add     sp, 8
        test    ax, ax
        jnz     br_dea50
        cmp     word ptr [bp + 6], 4
        jnz     br_dea50
        callf   SEG_DE95:far_de95a
        mov     byte ptr [B_880A], 2
        les     di, dword ptr [bp + 8]
        push    word ptr [bp + 0ch]
        push    es
        push    di
        push    1
        callf   SEG_D9B6:far_d9b6e
        add     sp, 8
br_dea50:
        pop     di
        pop     es
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   4
        else
        phase   0ah
        endif
far_dea54:
        push    bp
        mov     bp, sp
        push    es
        les     bx, dword ptr [bp + 6]
        mov     al, byte ptr es:[bx]
        and     al, 0f8h
        cmp     al, 98h
        jz      br_dea70
        cmp     al, 90h
        jz      br_dea70
        cmp     al, 80h
        jz      br_dea70
        cmp     al, 0a0h
        jnz     br_dea92
br_dea70:
        mov     al, byte ptr [bp + 0ah]
        or      al, al
        jz      br_dea7d
        cmp     al, byte ptr es:[bx + 1]
        jnz     br_dea92
br_dea7d:
        mov     al, byte ptr [B_955E]
        add     byte ptr es:[bx + 2], al
        jns     br_dea92
        or      al, al
        mov     al, 0
        js      br_dea8e
        mov     al, 7fh
br_dea8e:
        mov     byte ptr es:[bx + 2], al
br_dea92:
        pop     es
        pop     bp
        retf
        db      0ffh
fn_dea96:
        mov     ax, 8010h
        mov     ds, ax
        mov     cx, 8
        callf   0fb00h:far_fb47a
br_deaa3:
        mov     cl, byte ptr [B_D4BC]
        or      cl, cl
        jz      br_deabd
        mov     bx, A_12C6
        callf   SEG_DAC6:far_dac6a
        mov     cx, 1
        callf   0fb00h:far_fb47a
        jmp     br_deaa3
br_deabd:
        retf
        if      FW_VERSION >= 312
        phase   0eh
        else
        phase   4
        endif
far_deabe:
        mov     ax, word ptr [W_8C3D]
        or      ax, word ptr [W_8C3F]
        jnz     br_deacc
        callf   0fb93h:far_fb932
br_deacc:
        mov     ax, word ptr [W_8C3B]
        mov     dx, word ptr [W_8C39]
        mov     word ptr [W_8C33], ax
        mov     word ptr [W_8C31], dx
        les     bx, dword ptr [W_8C39]
        mov     byte ptr es:[bx], 0ffh
        xor     ax, ax
        xor     dx, dx
        mov     word ptr [W_8C45], ax
        mov     word ptr [W_8C43], dx
        mov     word ptr [W_901F], ax
        mov     word ptr [W_901D], dx
        mov     al, 0ffh
        mov     byte ptr [B_8C41], al
        mov     byte ptr [B_901B], al
        mov     byte ptr [B_901C], 0
        mov     byte ptr [B_8C42], 80h
        mov     word ptr [W_9049], 1
        mov     word ptr [W_8C6F], 3
        mov     al, 0
        mov     byte ptr [B_8802], al
        mov     byte ptr [B_8AA0], al
        callf   SEG_E2CE:far_e2ce3
        mov     word ptr [W_96F8], dx
        mov     word ptr [W_96F6], ax
        cmp     word ptr [W_8285], 0
        jz      br_deb3e
        mov     ax, word ptr [W_8285]
        mov     word ptr [W_8A98], ax
        mov     word ptr [W_D610], 1000h
        callf   SEG_E707:far_e70e6
br_deb3e:
        retf
far_deb3f:
        push    di
        push    ds
        pop     es
        mov     di, TBL_A7AF
        xor     ax, ax
        mov     ah, al
        mov     cx, 1388h
        rep stosw
        mov     di, TBL_A79B
        mov     ah, al
        mov     cx, 0ah
        rep stosw
        mov     di, TBL_A787
        mov     ax, 1
        mov     ah, al
        mov     cx, 0ah
        rep stosw
        mov     di, TBL_A5CF
        xor     ax, ax
        mov     ah, al
        mov     cx, 32h
        rep stosw
        callf   SEG_E65B:far_e66a4
        pop     di
        retf
        if      FW_VERSION >= 312
        phase   8
        else
        phase   0eh
        endif
far_deb78:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     ax, word ptr [bp + 0ah]
        cmp     ax, word ptr [bp + 0ch]
        jnz     br_deb8b
        jmp     br_dec8a
br_deb8b:
        cmp     byte ptr [B_901B], 0
        jge     br_deb95
        jmp     br_dec8a
br_deb95:
        mov     ax, word ptr [W_9053]
        mov     dx, word ptr [W_9051]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        callf   SEG_E734:far_e7644
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        push    0
        push    word ptr [bp + 6]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        push    word ptr [W_9480]
        push    word ptr [W_947E]
        push    ds
        push    word B_901B
        callf   SEG_E3D1:far_e3d12
        add     sp, 8
        inc     byte ptr [B_956A]
        xor     si, si
        jmp     near br_dec65
br_debdb:
        push    word 640h
        push    ds
        push    word TBL_F779
        push    1
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        mov     di, ax
        mov     al, byte ptr [TBL_F779]
        mov     ah, 0
        and     ax, 0f8h
        cmp     ax, 88h
        jz      br_dec07
        cmp     ax, 98h
        jz      br_dec2d
        cmp     ax, 0f8h
        jz      br_dec49
        jmp     br_dec4c
br_dec07:
        push    word ptr [TBL_F77A]
        callf   SEG_DAA8:far_daa82
        add     sp, 2
        cwd
        sub     word ptr [bp - 8], ax
        sbb     word ptr [bp - 6], dx
        cmp     word ptr [bp - 6], 0
        jg      br_dec4c
        jnz     br_dec28
        cmp     word ptr [bp - 8], 0
        ja      br_dec4c
br_dec28:
        mov     si, 1
        jmp     br_dec4c
br_dec2d:
        mov     al, byte ptr [TBL_F77A]
        mov     ah, 0
        cmp     ax, word ptr [bp + 8]
        jnz     br_dec4c
        mov     al, byte ptr [B_F77B]
        mov     ah, 0
        cmp     ax, word ptr [bp + 0ah]
        jnz     br_dec4c
        mov     al, byte ptr [bp + 0ch]
        mov     byte ptr [B_F77B], al
        jmp     br_dec4c
br_dec49:
        mov     si, 1
br_dec4c:
        push    1
        callf   SEG_DAD5:far_dad54
        add     sp, 2
        push    di
        push    ds
        push    word TBL_F779
        push    1
        callf   SEG_D9B6:far_d9b6e
        add     sp, 8
br_dec65:
        or      si, si
        jnz     br_dec6c
        jmp     near br_debdb
br_dec6c:
        if      FW_VERSION < 311
        push    1
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   0d266h:L_d2667
        add     sp, 4
        endif
        mov     word ptr [W_9053], 0
        mov     word ptr [W_9051], 0
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   SEG_E561:far_e5612
        add     sp, 4
        dec     byte ptr [B_956A]
br_dec8a:
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   0eh
        elseif  FW_VERSION = 311
        phase   4
        else
        phase   3
        endif
fn_dec8e:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 10h
        else
        sub     sp, 8
        endif
        mov     ax, ds
        cmp     word ptr [bp + 8], ax
        jz      br_dec9e
        jmp     near br_ded3c
br_dec9e:
        cmp     word ptr [bp + 6], B_901B
        jz      br_deca8
        jmp     near br_ded3c
br_deca8:
        dec     word ptr [W_880E]
        jge     br_decb7
        mov     al, byte ptr [B_8809]
        mov     ah, 0
        dec     ax
        mov     word ptr [W_880E], ax
br_decb7:
        dec     word ptr [W_8810]
        jge     br_decc6
        mov     al, byte ptr [B_8808]
        mov     ah, 0
        dec     ax
        mov     word ptr [W_8810], ax
br_decc6:
        cmp     word ptr [W_8810], 0
        jz      br_decd6
        mov     ax, word ptr [W_8810]
        cmp     ax, word ptr [W_880C]
        jnz     br_decdb
br_decd6:
        mov     ax, 1
        jmp     br_decdd
br_decdb:
        xor     ax, ax
br_decdd:
        mov     byte ptr [B_8807], al
        dec     word ptr [W_8814]
        mov     word ptr [bp - 6], ds
        mov     word ptr [bp - 8], W_D5F5
        mov     word ptr [bp - 2], ds
        mov     word ptr [bp - 4], W_D5F9
        mov     ax, word ptr [W_D657]
        les     bx, dword ptr [bp - 8]
        sub     word ptr es:[bx], ax
        mov     ax, word ptr es:[bx]
        sbb     word ptr es:[bx + 2], 0
        mov     dx, word ptr es:[bx + 2]
        or      dx, dx
        jg      br_ded30
        jl      br_ded13
        or      ax, ax
        jnc     br_ded30
br_ded13:
        les     bx, dword ptr [bp - 4]
        sub     word ptr es:[bx], 1
        sbb     word ptr es:[bx + 2], 0
        les     bx, dword ptr [bp - 8]
        mov     ax, word ptr [W_D633]
        mov     dx, word ptr [W_D631]
        add     word ptr es:[bx], dx
        adc     word ptr es:[bx + 2], ax
br_ded30:
        mov     word ptr [TBL_882C], 0
        mov     word ptr [TBL_882A], 0
br_ded3c:
        les     bx, dword ptr [bp + 6]
        sub     word ptr es:[bx + 26h], 1
        sbb     word ptr es:[bx + 28h], 0
        sub     word ptr es:[bx + 2ah], 1
        sbb     word ptr es:[bx + 2ch], 0
        inc     word ptr es:[bx + 3ah]
        dec     word ptr es:[bx + 34h]
        mov     al, byte ptr es:[bx + 36h]
        dec     byte ptr es:[bx + 36h]
        or      al, al
        if      FW_VERSION >= 311
        jz      br_ded6a
        jmp     near br_dee1b
br_ded6a:
        cmp     byte ptr es:[bx + 37h], 1
        jnz     br_dedeb
        test    byte ptr es:[bx + 1], 2
        jz      br_dedeb
        mov     ax, word ptr es:[bx + 38h]
        dec     ax
        push    ax
        push    0
        callf   SEG_E56A:far_e570d
        add     sp, 4
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        mov     ax, word ptr [W_902F]
        mov     dx, word ptr [W_902D]
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        mov     word ptr [W_902F], ax
        mov     word ptr [W_902D], dx
        push    word 640h
        push    ds
        push    word TBL_F779
        push    1
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        mov     al, byte ptr [TBL_F779]
        mov     ah, 0
        and     ax, 0f8h
        cmp     ax, 0a8h
        jnz     br_dedde
        mov     al, byte ptr [B_F77D]
        mov     ah, 0
        push    ax
        mov     al, byte ptr [B_F77C]
        mov     ah, 0
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_E723:far_e723d
        add     sp, 8
br_dedde:
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        mov     word ptr [W_902F], ax
        mov     word ptr [W_902D], dx
br_dedeb:
        les     bx, dword ptr [bp + 6]
        else
        jnz     br_dee1b
        endif
        mov     al, byte ptr es:[bx + 40h]
        add     al, 0ffh
        mov     byte ptr es:[bx + 36h], al
        mov     al, byte ptr es:[bx + 37h]
        add     al, 0ffh
        mov     byte ptr es:[bx + 37h], al
        or      al, al
        jnz     br_dee1b
        mov     al, byte ptr es:[bx + 3ch]
        mov     byte ptr es:[bx + 37h], al
        mov     ax, word ptr es:[bx + 3eh]
        dec     ax
        mov     word ptr es:[bx + 34h], ax
        dec     word ptr es:[bx + 38h]
br_dee1b:
        leave
        retf
far_dee1d:
        cmp     byte ptr [B_901B], 0
        jz      br_dee27
        xor     ax, ax
        retf
br_dee27:
        cmp     word ptr [W_8814], 0
        jnz     br_dee3e
        push    word ptr [W_9053]
        push    word ptr [W_9051]
        callf   SEG_E561:far_e5612
        add     sp, 4
br_dee3e:
        cmp     word ptr [W_9053], 1
        jnz     br_dee51
        cmp     word ptr [W_9051], 100h
        jnz     br_dee51
        mov     ax, 1
        retf
br_dee51:
        cmp     word ptr [W_8814], 0
        jnz     br_dee7d
        push    ds
        push    word B_901B
        push    cs
        call    fn_dec8e
        add     sp, 4
        push    word ptr [W_9053]
        push    word ptr [W_9051]
        callf   SEG_E561:far_e5612
        add     sp, 4
        cmp     word ptr [W_9055], 0
        jnz     br_dee7d
        xor     ax, ax
        retf
br_dee7d:
        cmp     word ptr [W_8814], 0
        jz      br_deea8
        jmp     br_dee91
loop_dee86:
        push    ds
        push    word B_901B
        push    cs
        call    fn_dec8e
        add     sp, 4
br_dee91:
        cmp     word ptr [W_8814], 0
        jnz     loop_dee86
        push    word ptr [W_9053]
        push    word ptr [W_9051]
        callf   SEG_E561:far_e5612
        add     sp, 4
br_deea8:
        xor     ax, ax
        retf
        if      FW_VERSION >= 312
        phase   0bh
        elseif  FW_VERSION = 311
        phase   1
        else
        phase   9
        endif
far_deeab:
        cmp     byte ptr [B_8805], 0
        jnz     br_deec0
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        jmp     br_deed8
br_deec0:
        push    1
        mov     al, byte ptr [B_83CF]
        cbw
        push    ax
        push    ds
        push    word B_8C41
        callf   SEG_E51B:far_e51be
        add     sp, 8
        callf   SEG_E561:far_e562e
br_deed8:
        mov     al, byte ptr [B_8805]
        cbw
        push    ax
        push    1
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        retf
        if      FW_VERSION >= 312
        phase   8
        elseif  FW_VERSION = 311
        phase   0eh
        else
        phase   6
        endif
far_deee8:
        push    bp
        mov     bp, sp
        push    si
        push    di
        mov     si, word ptr [bp + 0ah]
        les     bx, dword ptr [bp + 6]
        mov     byte ptr es:[bx + 36h], 0
        mov     byte ptr es:[bx + 37h], 1
        xor     ax, ax
        xor     dx, dx
        mov     word ptr es:[bx + 2ch], ax
        mov     word ptr es:[bx + 2ah], dx
        mov     word ptr es:[bx + 28h], ax
        mov     word ptr es:[bx + 26h], dx
        mov     word ptr es:[bx + 34h], 0
        push    si
        push    word ptr [bp + 8]
        push    bx
        callf   SEG_E3F2:far_e3f2c
        add     sp, 6
        mov     si, ax
        mov     ax, ds
        cmp     word ptr [bp + 8], ax
        jz      br_def30
        jmp     near br_defdb
br_def30:
        cmp     word ptr [bp + 6], B_901B
        jz      br_def3a
        jmp     near br_defdb
br_def3a:
        push    ds
        pop     es
        mov     di, W_D5F3
        xor     ax, ax
        mov     ah, al
        mov     cx, 5
        rep stosw
        mov     al, byte ptr [B_8800]
        mov     ah, 0
        or      ax, ax
        jnz     br_def5a
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jge     br_def74
br_def5a:
        cmp     byte ptr [B_8800], 0
        jz      br_defbd
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        mov     dx, 1f4h
        imul    dx
        mov     bx, ax
        cmp     byte ptr [bx + TBL_A5BC], 0
        jz      br_defbd
br_def74:
        push    si
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_E718:far_e7189
        add     sp, 6
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx + 2ch], dx
        mov     word ptr es:[bx + 2ah], ax
        mov     word ptr es:[bx + 28h], dx
        mov     word ptr es:[bx + 26h], ax
        push    ds
        push    word W_D5F3
        push    word ptr es:[bx + 2ch]
        push    word ptr es:[bx + 2ah]
        callf   SEG_EB86:far_eb86b
        add     sp, 8
        les     bx, dword ptr [bp + 6]
        push    word ptr es:[bx + 2ch]
        push    word ptr es:[bx + 2ah]
        callf   SEG_E707:far_e7073
        add     sp, 4
br_defbd:
        callf   SEG_DACD:far_dacd8
        mov     byte ptr [B_880A], 0
        mov     word ptr [W_8814], 0
        mov     word ptr [W_8812], 0
        mov     word ptr [W_881A], 1
        jmp     br_df004
br_defdb:
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jl      br_df004
        push    si
        push    word ptr [bp + 8]
        push    bx
        callf   SEG_E718:far_e7189
        add     sp, 6
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx + 2ch], dx
        mov     word ptr es:[bx + 2ah], ax
        mov     word ptr es:[bx + 28h], dx
        mov     word ptr es:[bx + 26h], ax
br_df004:
        les     bx, dword ptr [bp + 6]
        mov     word ptr es:[bx + 38h], si
        mov     word ptr es:[bx + 3ah], 0
        pop     di
        pop     si
        pop     bp
        retf
        if      FW_VERSION >= 312
        phase   5
        elseif  FW_VERSION = 311
        phase   0bh
        else
        phase   3
        endif
far_df015:
        cmp     byte ptr [B_901B], 0
        jge     br_df02b
        mov     al, byte ptr [B_8800]
        mov     ah, 0
        or      ax, ax
        jnz     br_df02b
        callf   SEG_E6FE:far_e6fef
        retf
br_df02b:
        cmp     byte ptr [B_A5C3], 0
        jz      br_df035
        jmp     br_df149
br_df035:
        callf   SEG_E2CE:far_e2ce3
        mov     word ptr [W_96F8], dx
        mov     word ptr [W_96F6], ax
        cmp     word ptr [W_96F8], 0
        jg      br_df05d
        jl      br_df052
        cmp     word ptr [W_96F6], 190h
        jnc     br_df05d
br_df052:
        or      byte ptr [B_9457], 4
        callf   SEG_E6FE:far_e6fef
        retf
br_df05d:
        mov     al, byte ptr [B_7FD1]
        cbw
        mov     dx, ax
        cmp     byte ptr [B_7FD3], 0
        jnz     br_df06c
        xor     dx, dx
br_df06c:
        mov     ax, dx
        cmp     ax, 1
        jz      br_df080
        cmp     ax, 2
        jz      br_df080
        cmp     ax, 4
        jz      br_df0c9
        jmp     near br_df11f
br_df080:
        mov     al, byte ptr [B_D60A]
        cbw
        or      ax, ax
        jz      br_df093
        cmp     ax, 4
        jz      br_df0a6
        cmp     ax, 8
        jz      br_df0be
        retf
br_df093:
        push    1
        push    word 100h
        callf   SEG_E561:far_e5612
        add     sp, 4
        callf   SEG_DD59:far_dd970
        retf
br_df0a6:
        push    1
        push    word 100h
        callf   SEG_E561:far_e5612
        add     sp, 4
        callf   SEG_D974:far_d9748
        mov     byte ptr [B_D60A], 6
        retf
br_df0be:
        callf   SEG_DD59:far_dd970
        mov     byte ptr [B_D60A], 0ch
        retf
br_df0c9:
        cmp     byte ptr [B_7FD2], 0
        jz      br_df0f4
        cmp     byte ptr [B_D60A], 0
        jz      br_df0f4
        mov     ax, word ptr [W_9053]
        xor     dx, dx
        add     dx, 100h
        adc     ax, 0
        push    ax
        push    dx
        callf   SEG_E561:far_e5612
        add     sp, 4
        mov     byte ptr [B_D608], 1
        jmp     br_df101
br_df0f4:
        push    1
        push    word 100h
        callf   SEG_E561:far_e5612
        add     sp, 4
br_df101:
        callf   SEG_DD59:far_dd970
        cmp     byte ptr [B_D60A], 0ah
        jnz     br_df112
        mov     byte ptr [B_D60A], 0ch
br_df112:
        cmp     byte ptr [B_D60A], 12h
        jnz     br_df149
        mov     byte ptr [B_D60A], 14h
        retf
br_df11f:
        push    1
        push    word 100h
        callf   SEG_E561:far_e5612
        add     sp, 4
        callf   SEG_DD59:far_dd970
        cmp     byte ptr [B_D60A], 0ah
        jnz     br_df13d
        mov     byte ptr [B_D60A], 0ch
br_df13d:
        cmp     byte ptr [B_D60A], 12h
        jnz     br_df149
        mov     byte ptr [B_D60A], 14h
br_df149:
        retf
        if      FW_VERSION >= 312
        phase   0ah
        elseif  FW_VERSION = 311
        phase   0
        else
        phase   8
        endif
far_df14a:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 311
        sub     sp, 10h
        push    si
        else
        sub     sp, 0eh
        endif
        push    di
        if      FW_VERSION >= 312
        test    byte ptr [bp + 6], 80h
        jnz     br_df15b
        jmp     near br_df216
br_df15b:
        mov     al, byte ptr [bp + 6]
        cbw
        and     ax, 0fh
        mov     si, ax
        cmp     si, 0ah
        jl      br_df16c
        jmp     near br_df210
br_df16c:
        mov     al, byte ptr [B_96EF]
        cbw
        or      ax, ax
        jz      br_df177
        jmp     near br_df210
br_df177:
        callf   SEG_B1AA:far_b1af9
        callf   SEG_B1AA:far_b1acc
        mov     word ptr [bp - 4], ax
        push    0
        callf   SEG_B1AA:far_b1ab2
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     si, 8
        jge     br_df1d0
        mov     bx, si
        shl     bx, 2
        push    word ptr [bx + TBL_7234]
        push    word ptr [bx + TBL_7232]
        push    ds
        push    word STR_72C2
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        jmp     br_df1e5
br_df1d0:
        mov     bx, si
        shl     bx, 2
        push    word ptr [bx + TBL_7234]
        push    word ptr [bx + TBL_7232]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_df1e5:
        xor     si, si
loop_df1e7:
        callf   SEG_D7B2:far_d7b2c
        or      ax, ax
        jnz     br_df1fa
        push    1
        callf   SEG_B059:far_b059a
        add     sp, 2
br_df1fa:
        inc     si
        cmp     si, 0ah
        jl      loop_df1e7
        callf   SEG_B1AA:far_b1aff
        push    word ptr [bp - 4]
        callf   SEG_B1AA:far_b1ab2
        add     sp, 2
br_df210:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_df216:
        elseif  FW_VERSION = 311
        test    byte ptr [bp + 6], 80h
        jnz     br_df15b
        jmp     near br_df216
br_df15b:
        mov     al, byte ptr [bp + 6]
        cbw
        and     ax, 0fh
        mov     si, ax
        cmp     si, 0ah
        jl      br_df16c
        jmp     near br_df210
br_df16c:
        mov     al, byte ptr [B_96EF]
        cbw
        or      ax, ax
        jz      br_df177
        jmp     near br_df210
br_df177:
        callf   SEG_B1AA:far_b1af9
        callf   SEG_B1AA:far_b1acc
        mov     word ptr [bp - 4], ax
        push    0
        callf   SEG_B1AA:far_b1ab2
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    28h
        callf   SEG_B1F9:far_b1f96
        add     sp, 2
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        cmp     si, 8
        jge     br_df1d0
        mov     bx, si
        shl     bx, 2
        push    word ptr [bx + TBL_7234]
        push    word ptr [bx + TBL_7232]
        push    ds
        push    word STR_720A_V311
        callf   SEG_B1B5:far_b1d48
        add     sp, 8
        jmp     br_df1e5
br_df1d0:
        mov     bx, si
        shl     bx, 2
        push    word ptr [bx + TBL_7234]
        push    word ptr [bx + TBL_7232]
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
br_df1e5:
        xor     si, si
loop_df1e7:
        callf   SEG_D7B2:far_d7b2c
        or      ax, ax
        jnz     br_df1fa
        push    1
        callf   SEG_B059:far_b059a
        add     sp, 2
br_df1fa:
        inc     si
        cmp     si, 0ah
        jl      loop_df1e7
        callf   SEG_B1AA:far_b1aff
        push    word ptr [bp - 4]
        callf   SEG_B1AA:far_b1ab2
        add     sp, 2
br_df210:
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_df216:
        endif
        mov     al, byte ptr [bp + 6]
        cbw
        cmp     ax, 59h
        jnz     br_df222
        jmp     br_df460
br_df222:
        jg      br_df27a
        cmp     ax, 51h
        jnz     br_df22c
        jmp     br_df3d8
br_df22c:
        jg      br_df266
        cmp     ax, 43h
        jnz     br_df236
        jmp     br_df805
br_df236:
        jg      br_df253
        cmp     ax, 23h
        jnz     br_df240
        jmp     br_df6c2
br_df240:
        cmp     ax, 24h
        jnz     br_df248
        jmp     br_df44f
br_df248:
        cmp     ax, 40h
        jnz     br_df250
        jmp     br_df569
br_df250:
        jmp     tgt_df975
br_df253:
        cmp     ax, 45h
        jnz     br_df25b
        jmp     br_df889
br_df25b:
        cmp     ax, 50h
        jnz     br_df263
        jmp     near br_df304
br_df263:
        jmp     tgt_df975
br_df266:
        sub     ax, 52h
        mov     bx, ax
        cmp     bx, 6
        jbe     br_df273
        jmp     tgt_df975
br_df273:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_df9c5]
br_df27a:
        sub     ax, 5ah
        mov     bx, ax
        cmp     bx, 23h
        jbe     br_df287
        jmp     tgt_df975
br_df287:
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_df97d]
tgt_df28e:
        mov     byte ptr [bp + 6], 0
        callf   SEG_EBC0:far_ebc0b
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      br_df2e3
        cmp     byte ptr [B_901B], 0
        jge     br_df2bc
        mov     al, byte ptr [B_8A9F]
        cbw
        push    ax
        callf   SEG_E15E:far_e15e2
        add     sp, 2
        mov     byte ptr [B_D4BE], 50h
        mov     byte ptr [B_8A9E], 0ffh
br_df2bc:
        push    0
        push    0
        push    0
        push    word ptr [bp - 2]
        callf   SEG_DE78:far_de88f
        add     sp, 6
        push    ax
        callf   SEG_E707:far_e710e
        add     sp, 4
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        jmp     tgt_df975
br_df2e3:
        cmp     byte ptr [B_D4C2], 47h
        jz      br_df2ef
        mov     byte ptr [B_D4C2], 4dh
br_df2ef:
        mov     al, byte ptr [B_D5DE]
        cmp     al, byte ptr [B_D4C2]
        jnz     br_df2fb
        jmp     tgt_df975
br_df2fb:
        mov     al, byte ptr [B_D4C2]
        mov     byte ptr [bp + 6], al
        jmp     tgt_df975
br_df304:
        cmp     byte ptr [B_9447], 0
        jz      br_df30e
        jmp     tgt_df975
br_df30e:
        cmp     byte ptr [B_D5DE], 4ch
        jnz     br_df324
        cmp     byte ptr [B_D5DD], 5
        jnz     br_df324
        callf   SEG_C2E5:far_c41b2
        jmp     near br_df3d1
br_df324:
        test    byte ptr [B_A5C2], 15h
        jz      br_df337
        push    1
        callf   SEG_EA92:far_ea926
        add     sp, 2
        jmp     br_df351
br_df337:
        push    word ptr [W_9047]
        push    word ptr [W_9045]
        callf   SEG_E707:far_e7073
        add     sp, 4
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
br_df351:
        cmp     byte ptr [B_D5DE], 47h
        jnz     br_df372
        mov     al, byte ptr [B_A5CE]
        mov     ah, 0
        mov     dl, byte ptr [B_8803]
        mov     dh, 0
        inc     dx
        cmp     ax, dx
        jz      br_df372
        cmp     byte ptr [B_A5C2], 0
        jz      br_df372
        jmp     tgt_df975
br_df372:
        cmp     byte ptr [B_8A9E], 0
        jge     br_df394
        cmp     byte ptr [B_D5DE], 4dh
        jnz     br_df383
        jmp     tgt_df975
br_df383:
        cmp     byte ptr [B_A570], 0
        jz      br_df394
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
br_df394:
        cmp     byte ptr [B_D5DE], 4ah
        jnz     br_df3af
        cmp     byte ptr [B_D5DD], 1
        jnz     br_df3a5
        jmp     tgt_df975
br_df3a5:
        cmp     byte ptr [B_D5DD], 2
        jnz     br_df3af
        jmp     tgt_df975
br_df3af:
        cmp     byte ptr [B_D5DE], 4ch
        jnz     br_df3c0
        cmp     byte ptr [B_D5DD], 1
        jnz     br_df3c0
        jmp     tgt_df975
br_df3c0:
        cmp     byte ptr [B_D5DE], 73h
        jnz     br_df3d1
        cmp     byte ptr [B_D5DD], 3
        jnz     br_df3d1
        jmp     tgt_df975
br_df3d1:
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
br_df3d8:
        callf   SEG_E7C9:far_e7c91
        cmp     byte ptr [B_D5DE], 4bh
        jnz     br_df3f9
        cmp     byte ptr [B_D5DD], 0ah
        jl      br_df3f9
        cmp     byte ptr [B_D5DD], 0fh
        jg      br_df3f9
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
br_df3f9:
        cmp     byte ptr [B_D5DE], 53h
        jnz     br_df40a
        cmp     byte ptr [B_D5DD], 0
        jnz     br_df40a
        jmp     tgt_df975
br_df40a:
        cmp     byte ptr [B_D4C2], 53h
        jnz     br_df416
        mov     byte ptr [B_D4C2], 4dh
br_df416:
        mov     al, byte ptr [B_D4C2]
        mov     byte ptr [bp + 6], al
        jmp     tgt_df975
tgt_df41f:
        callf   SEG_E7C9:far_e7c91
        nop
        push    cs
        call    fn_dfab9
        or      ax, ax
        jg      br_df43c
        callf   SEG_DF01:far_df015
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
br_df43c:
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
tgt_df443:
        callf   SEG_E7C9:far_e7c91
        mov     byte ptr [bp + 6], 57h
        jmp     tgt_df975
br_df44f:
        cmp     byte ptr [B_D5DE], 4dh
        jnz     br_df459
        jmp     tgt_df975
br_df459:
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
br_df460:
        callf   SEG_E7C9:far_e7c91
        nop
        push    cs
        call    fn_dfab9
        or      ax, ax
        jz      br_df47a
        callf   SEG_E6FE:far_e6fef
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
br_df47a:
        callf   SEG_E2CE:far_e2ce3
        mov     word ptr [W_96F8], dx
        mov     word ptr [W_96F6], ax
        cmp     word ptr [W_96F8], 0
        jg      br_df4a8
        jl      br_df497
        cmp     word ptr [W_96F6], 190h
        jnc     br_df4a8
br_df497:
        or      byte ptr [B_9457], 4
        callf   SEG_E6FE:far_e6fef
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
br_df4a8:
        cmp     byte ptr [TBL_A5CA], 0
        jz      br_df4eb
        mov     al, byte ptr [B_8186]
        cbw
        or      ax, ax
        jz      br_df4c7
        mov     al, byte ptr [B_A5C2]
        cbw
        test    ax, 1
        jnz     br_df4eb
        cmp     byte ptr [B_8186], 0
        jz      br_df4eb
br_df4c7:
        push    word ptr [W_9053]
        push    ds
        push    word B_901B
        callf   SEG_DEEE:far_deee8
        add     sp, 6
        callf   SEG_E561:far_e562e
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e6890
        else
        callf   SEG_E682:L_ef4d3
        endif
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
br_df4eb:
        cmp     byte ptr [B_8800], 0
        jz      br_df520
        mov     ax, word ptr [W_9053]
        cmp     ax, word ptr [W_87FE]
        jle     br_df545
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        mov     bx, ax
        cmp     byte ptr [bx + TBL_A79A], 0
        jz      br_df545
        push    word ptr [W_A5CB]
        push    ds
        push    word B_901B
        callf   SEG_DEEE:far_deee8
        add     sp, 6
        callf   SEG_E561:far_e562e
        jmp     br_df545
br_df520:
        mov     ax, word ptr [W_9053]
        cmp     ax, word ptr [W_904B]
        jle     br_df545
        test    byte ptr [B_901C], 1
        jz      br_df545
        push    word ptr [W_904D]
        push    ds
        push    word B_901B
        callf   SEG_DEEE:far_deee8
        add     sp, 6
        callf   SEG_E561:far_e562e
br_df545:
        callf   SEG_DD59:far_dd970
        cmp     byte ptr [B_D60A], 12h
        jnz     br_df556
        mov     byte ptr [B_D60A], 14h
br_df556:
        cmp     byte ptr [B_D60A], 0ah
        jnz     br_df562
        mov     byte ptr [B_D60A], 0ch
br_df562:
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
br_df569:
        push    ds
        push    word B_901B
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
        cmp     byte ptr [B_7FD0], 0
        jz      br_df588
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0ah], 0
        mov     word ptr [bp - 0ch], 17h
        else
        mov     word ptr [bp - 8], 0
        mov     word ptr [bp - 0ah], 17h
        endif
        jmp     br_df592
br_df588:
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0ah], 0
        mov     word ptr [bp - 0ch], 8
        else
        mov     word ptr [bp - 8], 0
        mov     word ptr [bp - 0ah], 8
        endif
br_df592:
        push    ss
        if      FW_VERSION >= 311
        lea     ax, [bp - 8]
        else
        lea     ax, [bp - 6]
        endif
        push    ax
        callf   SEG_E56A:far_e57bd
        if      FW_VERSION >= 311
        add     ax, word ptr [bp - 0ch]
        adc     dx, word ptr [bp - 0ah]
        else
        add     ax, word ptr [bp - 0ah]
        adc     dx, word ptr [bp - 8]
        endif
        push    dx
        push    ax
        callf   SEG_EB22:far_eb228
        add     sp, 8
        or      ax, ax
        jz      br_df5b3
        jmp     near br_df66e
br_df5b3:
        cmp     byte ptr [B_7FD0], 0
        jz      br_df5fb
        push    0
        push    18h
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 6]
        mov     dx, word ptr [bp - 8]
        else
        mov     ax, word ptr [bp - 4]
        mov     dx, word ptr [bp - 6]
        endif
        add     dx, 18h
        adc     ax, 0
        push    ax
        push    dx
        callf   0f800h:far_fa0fe
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 18h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        if      FW_VERSION >= 311
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        else
        mov     word ptr [bp - 4], dx
        mov     word ptr [bp - 6], ax
        endif
        push    dx
        push    ax
        nop
        push    cs
        call    far_df9d3
        add     sp, 4
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e682b
        else
        callf   SEG_E682:L_ef4d3
        endif
        callf   SEG_E682:far_e68b0
        jmp     br_df609
br_df5fb:
        if      FW_VERSION < 311
        push    word ptr [bp - 4]
        endif
        push    word ptr [bp - 6]
        if      FW_VERSION >= 311
        push    word ptr [bp - 8]
        endif
        nop
        push    cs
        call    far_df9d3
        add     sp, 4
br_df609:
        callf   SEG_E56A:far_e57bd
        mov     bx, word ptr [W_D5FB]
        mov     cx, word ptr [W_D5F9]
        sub     cx, ax
        sbb     bx, dx
        if      FW_VERSION >= 311
        mov     word ptr [bp - 0eh], bx
        else
        mov     word ptr [bp - 0ch], bx
        endif
        mov     ax, bx
        if      FW_VERSION >= 311
        mov     word ptr [bp - 10h], cx
        else
        mov     word ptr [bp - 0eh], cx
        endif
        mov     dx, cx
        or      ax, ax
        jl      br_df662
        jnz     br_df62f
        cmp     dx, 3
        jc      br_df662
br_df62f:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 0eh]
        mov     dx, word ptr [bp - 10h]
        cmp     ax, word ptr [bp - 0ah]
        else
        mov     ax, word ptr [bp - 0ch]
        mov     dx, word ptr [bp - 0eh]
        cmp     ax, word ptr [bp - 8]
        endif
        jl      br_df64d
        jg      br_df641
        if      FW_VERSION >= 311
        cmp     dx, word ptr [bp - 0ch]
        else
        cmp     dx, word ptr [bp - 0ah]
        endif
        jbe     br_df64d
br_df641:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 0ah]
        mov     dx, word ptr [bp - 0ch]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        else
        mov     ax, word ptr [bp - 8]
        mov     dx, word ptr [bp - 0ah]
        mov     word ptr [bp - 0ch], ax
        mov     word ptr [bp - 0eh], dx
        endif
br_df64d:
        if      FW_VERSION >= 311
        mov     ax, word ptr [bp - 10h]
        else
        mov     ax, word ptr [bp - 0eh]
        endif
        add     ax, 2
        mov     bx, 3
        cwd
        idiv    bx
        push    ax
        callf   SEG_B059:far_b059a
        add     sp, 2
br_df662:
        cmp     byte ptr [B_D60A], 0ah
        jnz     br_df66e
        callf   SEG_DD59:far_dd6e2
br_df66e:
        mov     byte ptr [B_956C], 0
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
tgt_df67a:
        cmp     byte ptr [B_A575], 0
        jnz     br_df6b6
loop_df681:
        cmp     byte ptr [B_A5C1], 0
        jnz     loop_df681
        inc     byte ptr [B_956A]
        callf   SEG_E7C9:far_e7c91
        push    word ptr [W_D5E9]
        push    word ptr [W_D5E7]
        nop
        push    cs
        call    far_df9d3
        add     sp, 4
        push    ds
        push    word B_901B
        callf   SEG_E344:far_e37be
        add     sp, 4
        mov     byte ptr [B_A575], 1
        dec     byte ptr [B_956A]
br_df6b6:
        mov     byte ptr [B_A574], 0
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
br_df6c2:
        cmp     byte ptr [B_7FD0], 0
        jz      br_df6fd
        push    0
        push    18h
        push    word ptr [W_9043]
        push    word ptr [W_9041]
        callf   0f800h:far_fa105
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 18h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        nop
        push    cs
        call    far_df9d3
        add     sp, 4
        mov     word ptr [W_D4AF], 0ffffh
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e682b
        else
        callf   SEG_E682:L_ef4d3
        endif
br_df6fd:
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
tgt_df704:
        mov     byte ptr [bp + 6], 0
        nop
        push    cs
        call    fn_dfab9
        or      ax, ax
        jle     br_df714
        jmp     tgt_df975
br_df714:
        cmp     byte ptr [B_A5C3], 0
        jz      br_df71e
        jmp     tgt_df975
br_df71e:
        mov     al, byte ptr [B_A5C0]
        cbw
        or      ax, ax
        jz      br_df729
        jmp     tgt_df975
br_df729:
        mov     ax, word ptr [W_D5E5]
        cwd
        push    ax
        push    dx
        xor     dx, dx
        mov     ax, 18h
        pop     cx
        pop     bx
        callf   0f800h:far_fa0c8
        push    dx
        push    ax
        nop
        push    cs
        call    far_df9d3
        add     sp, 4
        if      FW_VERSION >= 311
        callf   SEG_E682:far_e682b
        else
        callf   SEG_E682:L_ef4d3
        endif
        cmp     byte ptr [B_D5DE], 47h
        jz      br_df754
        jmp     tgt_df975
br_df754:
        mov     byte ptr [bp + 6], 50h
        jmp     tgt_df975
tgt_df75b:
        cmp     byte ptr [B_D5DE], 4dh
        jz      br_df769
        cmp     byte ptr [B_D5DE], 47h
        jnz     br_df773
br_df769:
        cmp     byte ptr [B_A5C3], 0
        jnz     br_df773
        jmp     tgt_df975
br_df773:
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
tgt_df77a:
        cmp     byte ptr [B_956D], 0
        jz      br_df78a
        callf   SEG_E3B7:far_e3b75
        dec     byte ptr [B_956A]
br_df78a:
        mov     al, byte ptr [B_D4B5]
        add     al, 10h
        mov     byte ptr [B_D4B5], al
        cmp     al, 40h
        jl      br_df79b
        mov     byte ptr [B_D4B5], 0
br_df79b:
        push    0
        push    9
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    0
        push    0ah
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    0
        push    0bh
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    0
        push    0ch
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        push    1
        mov     al, byte ptr [B_D4B5]
        cbw
        mov     bx, 10h
        cwd
        idiv    bx
        add     ax, 9
        push    ax
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        cmp     byte ptr [B_D5DE], 4ah
        jnz     br_df7fe
        cmp     byte ptr [B_D5DD], 1
        jnz     br_df7f4
        jmp     tgt_df975
br_df7f4:
        cmp     byte ptr [B_D5DD], 2
        jnz     br_df7fe
        jmp     tgt_df975
br_df7fe:
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
br_df805:
        mov     al, byte ptr [TBL_A5CA]
        cbw
        neg     ax
        sbb     ax, ax
        inc     ax
        mov     byte ptr [TBL_A5CA], al
        cbw
        push    ax
        push    4
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
tgt_df824:
        mov     al, byte ptr [B_A5C9]
        cbw
        neg     ax
        sbb     ax, ax
        inc     ax
        mov     byte ptr [B_A5C9], al
        cbw
        push    ax
        push    3
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
tgt_df843:
        cmp     byte ptr [B_A5C2], 0
        jnz     br_df84d
        jmp     tgt_df975
br_df84d:
        cmp     byte ptr [B_7FE3], 0
        jz      br_df865
        cmp     byte ptr [B_D5DE], 4dh
        jnz     br_df85e
        jmp     tgt_df975
br_df85e:
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
br_df865:
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
tgt_df86c:
        cmp     byte ptr [B_A5C2], 0
        jz      br_df878
        or      byte ptr [B_955C], 40h
br_df878:
        cmp     byte ptr [B_D5DE], 4dh
        jnz     br_df882
        jmp     tgt_df975
br_df882:
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
br_df889:
        cmp     byte ptr [B_A5C2], 0
        jnz     br_df893
        jmp     tgt_df975
br_df893:
        push    ds
        pop     es
        mov     di, TBL_956E
        xor     ax, ax
        mov     ah, al
        mov     cx, 40h
        rep stosw
        cmp     byte ptr [B_D5DE], 4dh
        jnz     br_df8ab
        jmp     tgt_df975
br_df8ab:
        mov     byte ptr [bp + 6], 0
        jmp     near tgt_df975
tgt_df8b2:
        cmp     byte ptr [B_A5C2], 0
        jz      br_df8be
        or      byte ptr [B_955C], 40h
br_df8be:
        cmp     byte ptr [B_D5DE], 4dh
        jnz     br_df8c8
        jmp     near tgt_df975
br_df8c8:
        mov     byte ptr [bp + 6], 0
        jmp     near tgt_df975
tgt_df8cf:
        push    ds
        pop     es
        mov     di, TBL_966E
        xor     ax, ax
        mov     ah, al
        mov     cx, 40h
        rep stosw
        cmp     byte ptr [B_D4AB], 0
        jnz     br_df8e7
        jmp     near tgt_df975
br_df8e7:
        mov     byte ptr [B_D4AB], 0
        push    ax
        push    0eh
        callf   SEG_D7B8:far_d7b8f
        add     sp, 4
        mov     byte ptr [bp + 6], 0
        jmp     short tgt_df975
tgt_df8fd:
        cmp     byte ptr [B_D5DE], 53h
        jnz     br_df906
        jmp     tgt_df975
br_df906:
        cmp     byte ptr [B_D5DE], 4dh
        jz      br_df922
        cmp     byte ptr [B_D5DE], 47h
        jz      br_df922
        cmp     byte ptr [B_D5DE], 2fh
        jz      br_df922
        cmp     byte ptr [B_A570], 0
        jz      br_df971
br_df922:
        cmp     byte ptr [B_A5C1], 0
        jz      br_df92e
        callf   SEG_E6FE:far_e6fef
br_df92e:
        callf   SEG_E7C9:far_e7c91
        cmp     byte ptr [B_8800], 0
        jz      br_df949
        nop
        push    cs
        call    fn_dfab9
        or      ax, ax
        jz      br_df949
        mov     byte ptr [bp + 6], 0
        jmp     tgt_df975
br_df949:
        mov     al, byte ptr [B_7FE8]
        cbw
        push    ax
        mov     al, byte ptr [bp + 6]
        push    ax
        callf   SEG_E409:far_e4094
        add     sp, 4
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
        cmp     byte ptr [B_D5DE], 47h
        jnz     br_df971
        mov     byte ptr [bp + 6], 50h
        jmp     tgt_df975
br_df971:
        mov     byte ptr [bp + 6], 0
tgt_df975:
        mov     al, byte ptr [bp + 6]
        cbw
        pop     di
        if      FW_VERSION >= 311
        pop     si
        endif
        leave
        retf
TBL_df97d:
        dw      tgt_df41f
        dw      tgt_df8fd
        dw      tgt_df975
        dw      tgt_df8fd
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df8cf
        dw      tgt_df975
        dw      tgt_df77a
        dw      tgt_df8b2
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df824
        dw      tgt_df975
        dw      tgt_df75b
        dw      tgt_df704
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df86c
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df975
        dw      tgt_df8fd
        dw      tgt_df975
        dw      tgt_df8fd
TBL_df9c5:
        dw      tgt_df843
        dw      tgt_df975
        dw      tgt_df28e
        dw      tgt_df975
        dw      tgt_df443
        dw      tgt_df443
        dw      tgt_df67a
far_df9d3:
        push    bp
        mov     bp, sp
        sub     sp, 4
        cmp     byte ptr [B_901B], 0
        jge     br_df9e3
        jmp     br_dfab7
br_df9e3:
        cmp     byte ptr [B_8800], 0
        jz      br_dfa00
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        mov     dx, 1f4h
        imul    dx
        mov     bx, ax
        cmp     byte ptr [bx + TBL_A5BC], 0
        jnz     br_dfa00
        jmp     near br_dfab7
br_dfa00:
        push    ss
        lea     ax, [bp - 4]
        push    ax
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        push    ds
        push    word B_901B
        callf   SEG_EADF:far_eadf4
        add     sp, 0ch
        mov     word ptr [W_9053], 0
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   SEG_E561:far_e5612
        add     sp, 4
        cmp     byte ptr [B_8800], 0
        jz      br_dfa5e
        mov     ax, word ptr [W_9053]
        cmp     ax, word ptr [W_87FE]
        jle     br_dfa92
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        mov     bx, ax
        cmp     byte ptr [bx + TBL_A79A], 0
        jz      br_dfa92
        push    1
        push    ds
        push    word B_901B
        callf   SEG_DEEE:far_deee8
        add     sp, 6
        callf   SEG_E561:far_e562e
        jmp     br_dfa92
br_dfa5e:
        mov     ax, word ptr [W_9053]
        cmp     ax, word ptr [W_904B]
        jle     br_dfa92
        test    byte ptr [B_901C], 1
        jz      br_dfa85
        push    word ptr [W_904D]
        push    ds
        push    word B_901B
        callf   SEG_DEEE:far_deee8
        add     sp, 6
        callf   SEG_E561:far_e562e
        jmp     br_dfa92
br_dfa85:
        mov     ax, word ptr [W_9043]
        mov     dx, word ptr [W_9041]
        mov     word ptr [bp + 8], ax
        mov     word ptr [bp + 6], dx
br_dfa92:
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        mov     word ptr [W_9043], ax
        mov     word ptr [W_9041], dx
        push    ds
        push    word W_D5F3
        push    ax
        push    dx
        callf   SEG_EB86:far_eb86b
        add     sp, 8
        push    0
        callf   SEG_EA92:far_ea926
        add     sp, 2
br_dfab7:
        leave
        retf
fn_dfab9:
        push    bp
        mov     bp, sp
        sub     sp, 2
        cmp     byte ptr [B_A5C1], 0
        jz      br_dfacb
        mov     ax, 1
        leave
        retf
br_dfacb:
        cmp     byte ptr [B_8800], 0
        jnz     br_dfad5
        jmp     br_dfbb9
br_dfad5:
        mov     al, byte ptr [B_8804]
        mov     ah, 0
        dec     ax
        push    ax
        callf   SEG_E603:far_e603d
        add     sp, 2
        cmp     ax, 3e7h
        jle     br_dfb0f
        callf   SEG_E6FE:far_e6fef
        callf   SEG_B1AA:far_b1af9
        push    0fff3h
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, 0
        mov     byte ptr [B_8802], al
        mov     byte ptr [B_9456], al
        callf   SEG_B1AA:far_b1aff
        mov     ax, 1
        leave
        retf
br_dfb0f:
        callf   SEG_E60A:far_e60a8
        mov     word ptr [bp - 2], ax
        or      ax, ax
        jz      br_dfb7d
        callf   SEG_E6FE:far_e6fef
        callf   SEG_B1AA:far_b1af9
        push    2bh
        push    3
        push    66h
        callf   SEG_B3B9:far_b3cdb
        add     sp, 6
        push    5
        push    2
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    word ptr [bp - 2]
        push    ds
        if      FW_VERSION >= 312
        push    word STR_72D9
        elseif  FW_VERSION = 311
        push    word STR_7221_V311
        else
        push    word L_6AA6_V308+8
        endif
        callf   SEG_B1B5:far_b1d48
        add     sp, 6
        push    0
        push    7
        callf   SEG_B1AA:far_b1ad0
        add     sp, 4
        push    ds
        push    word STR_72DD
        callf   SEG_B1AA:far_b1b05
        add     sp, 4
        callf   SEG_B3B9:far_b3dda
        mov     al, 0
        mov     byte ptr [B_8802], al
        mov     byte ptr [B_9456], al
        callf   SEG_B1AA:far_b1aff
        mov     ax, 1
        leave
        retf
br_dfb7d:
        push    ds
        push    word B_901B
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
        cmp     byte ptr [B_9456], 0
        jz      br_dfbb9
        callf   SEG_E6FE:far_e6fef
        callf   SEG_B1AA:far_b1af9
        mov     al, byte ptr [B_9456]
        cbw
        push    ax
        callf   SEG_B3B9:far_b3b9f
        add     sp, 2
        mov     al, 0
        mov     byte ptr [B_8802], al
        mov     byte ptr [B_9456], al
        callf   SEG_B1AA:far_b1aff
        mov     ax, 1
        leave
        retf
br_dfbb9:
        cmp     byte ptr [B_901B], 0
        jge     br_dfbfe
        cmp     byte ptr [B_8800], 0
        jz      br_dfbf4
        mov     al, byte ptr [B_8803]
        push    ax
        callf   SEG_E56A:far_e5796
        add     sp, 2
        mov     dx, ax
        cmp     dx, word ptr [W_87FE]
        jg      br_dfbef
        push    ax
        push    ds
        push    word B_901B
        callf   SEG_DEEE:far_deee8
        add     sp, 6
        callf   SEG_E561:far_e562e
        jmp     br_dfbfe
br_dfbef:
        mov     ax, 0ffffh
        leave
        retf
br_dfbf4:
        callf   SEG_E6FE:far_e6fef
        mov     ax, 1
        leave
        retf
br_dfbfe:
        xor     ax, ax
        leave
        retf
        if      FW_VERSION >= 312
        phase   2
        elseif  FW_VERSION = 311
        phase   8
        else
        phase   0ah
        endif
far_dfc02:
        push    bp
        mov     bp, sp
        sub     sp, 0ch
        push    si
        mov     si, word ptr [bp + 6]
        mov     al, byte ptr [B_8A9F]
        cbw
        cmp     ax, si
        jnz     br_dfc27
        cmp     byte ptr [B_901B], 0
        jnz     br_dfc27
        push    ds
        push    word B_901B
        callf   SEG_E003:far_e0031
        add     sp, 4
br_dfc27:
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        push    1
        push    si
        push    ds
        push    word B_8C41
        callf   SEG_E51B:far_e51be
        add     sp, 8
        or      ax, ax
        jz      br_dfc4d
        xor     dx, dx
        xor     ax, ax
        pop     si
        leave
        retf
br_dfc4d:
        push    word ptr [bp + 8]
        push    ds
        push    word B_8C41
        callf   SEG_DEEE:far_deee8
        add     sp, 6
        mov     ax, word ptr [W_8C55]
        mov     dx, word ptr [W_8C53]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 4], dx
        push    word ptr [bp + 0ah]
        push    ds
        push    word B_8C41
        callf   SEG_DEEE:far_deee8
        add     sp, 6
        if      FW_VERSION <> 311
        mov     ax, word ptr [W_8C55]
        else
        db      0a1h, 09dh
        phase   80h
        db      08bh
        endif
        mov     dx, word ptr [W_8C53]
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        cmp     ax, word ptr [bp - 2]
        ja      br_dfccd
        jc      br_dfc91
        cmp     dx, word ptr [bp - 4]
        jnc     br_dfccd
br_dfc91:
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [W_8C49]
        push    word ptr [W_8C47]
        callf   SEG_DA9B:far_daa07
        add     sp, 8
        push    ax
        push    dx
        push    word ptr [W_8C4D]
        push    word ptr [W_8C4B]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        callf   SEG_DA9B:far_daa07
        add     sp, 8
        pop     bx
        pop     cx
        add     cx, ax
        adc     bx, dx
        mov     word ptr [bp - 0ah], bx
        mov     word ptr [bp - 0ch], cx
        jmp     br_dfce7
br_dfccd:
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        callf   SEG_DA9B:far_daa07
        add     sp, 8
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
br_dfce7:
        mov     al, byte ptr [B_8A9F]
        cbw
        cmp     ax, si
        jnz     br_dfcfe
        push    1
        push    si
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
br_dfcfe:
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        mov     dx, word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ch]
        pop     si
        leave
        retf
far_dfd13:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        mov     si, word ptr [bp + 8]
        push    ds
        push    word B_8C41
        callf   SEG_E003:far_e0031
        add     sp, 4
        callf   SEG_E734:far_e7644
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        push    1
        push    word ptr [bp + 6]
        push    ds
        push    word B_901B
        callf   SEG_E51B:far_e51be
        add     sp, 8
        or      ax, ax
        jz      br_dfd52
        xor     dx, dx
        xor     ax, ax
        pop     di
        pop     si
        leave
        retf
br_dfd52:
        push    word ptr [W_9480]
        push    word ptr [W_947E]
        push    ds
        push    word B_901B
        callf   SEG_E3D1:far_e3d12
        add     sp, 8
        inc     byte ptr [B_956A]
        mov     word ptr [bp - 6], 0
        mov     word ptr [bp - 8], 0
        jmp     br_dfdd9
loop_dfd76:
        push    word 640h
        push    ds
        push    word TBL_F779
        push    1
        callf   SEG_D97B:far_d97ca
        add     sp, 8
        mov     di, ax
        mov     al, byte ptr [TBL_F779]
        mov     ah, 0
        and     ax, 0f8h
        cmp     ax, 88h
        jz      br_dfda2
        cmp     ax, 0a8h
        jz      br_dfdd0
        cmp     ax, 0f8h
        jz      br_dfdb7
        jmp     br_dfdc3
br_dfda2:
        push    word ptr [TBL_F77A]
        callf   SEG_DAA8:far_daa82
        add     sp, 2
        cwd
        sub     word ptr [bp - 4], ax
        sbb     word ptr [bp - 2], dx
        jmp     br_dfdd0
br_dfdb7:
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        jmp     br_dfdd0
br_dfdc3:
        or      si, si
        jz      br_dfdd0
        mov     al, byte ptr [TBL_F77A]
        mov     ah, 0
        cmp     ax, si
        jnz     br_dfdd9
br_dfdd0:
        mov     ax, di
        cwd
        add     word ptr [bp - 8], ax
        adc     word ptr [bp - 6], dx
br_dfdd9:
        cmp     word ptr [bp - 2], 0
        jg      loop_dfd76
        jnz     br_dfde7
        cmp     word ptr [bp - 4], 0
        ja      loop_dfd76
br_dfde7:
        dec     byte ptr [B_956A]
        mov     dx, word ptr [bp - 6]
        mov     ax, word ptr [bp - 8]
        pop     di
        pop     si
        leave
        retf
        if      FW_VERSION >= 312
        phase   5
        elseif  FW_VERSION = 311
        phase   0bh
        else
        phase   0dh
        endif
far_dfdf5:
        push    bp
        mov     bp, sp
        sub     sp, 10h
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        mov     word ptr [bp - 0eh], ax
        mov     word ptr [bp - 10h], dx
        les     bx, dword ptr [bp + 6]
        cmp     byte ptr es:[bx], 0
        jge     br_dfe22
        mov     ax, word ptr [W_9563]
        inc     ax
        cmp     ax, word ptr [bp - 0eh]
        jz      br_dfe1e
        mov     ax, 1
        jmp     br_dfe20
br_dfe1e:
        xor     ax, ax
br_dfe20:
        leave
        retf
br_dfe22:
        les     bx, dword ptr [bp + 6]
        mov     ax, word ptr es:[bx + 30h]
        add     ax, word ptr [W_9563]
        inc     ax
        xor     dx, dx
        add     dx, 100h
        adc     ax, 0
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 0ch], dx
        mov     ax, word ptr [bp + 0ch]
        mov     dx, word ptr [bp + 0ah]
        cmp     ax, word ptr [bp - 0ah]
        jl      br_dfe54
        jg      br_dfe4f
        cmp     dx, word ptr [bp - 0ch]
        jbe     br_dfe54
br_dfe4f:
        mov     ax, 1
        leave
        retf
br_dfe54:
        push    word ptr [bp + 8]
        push    word ptr [bp + 6]
        callf   SEG_E5A9:far_e5a99
        add     sp, 4
        mov     ax, ds
        cmp     word ptr [bp + 8], ax
        jnz     br_dfe81
        cmp     word ptr [bp + 6], B_901B
        jnz     br_dfe81
        cmp     byte ptr [B_8800], 0
        jz      br_dfe81
        mov     word ptr [bp - 6], ds
        if      FW_VERSION >= 312
        mov     word ptr [bp - 8], 86b2h
        elseif  FW_VERSION = 311
        mov     word ptr [bp - 8], 85fah
        else
        mov     word ptr [bp - 8], 7a88h
        endif
        jmp     br_dfe97
br_dfe81:
        mov     ax, word ptr [bp + 8]
        mov     dx, word ptr [bp + 6]
        add     dx, 29eh
        mov     word ptr [bp - 6], ax
        mov     word ptr [bp - 8], dx
        jmp     br_dfe97
loop_dfe93:
        add     word ptr [bp - 8], 4
br_dfe97:
        les     bx, dword ptr [bp - 8]
        mov     ax, word ptr es:[bx]
        cmp     ax, word ptr [bp - 0eh]
        jbe     loop_dfe93
        sub     word ptr [bp - 8], 4
        les     bx, dword ptr [bp - 8]
        mov     al, byte ptr es:[bx + 2]
        cbw
        mov     word ptr [bp - 2], ax
        mov     al, byte ptr es:[bx + 3]
        cbw
        push    ax
        mov     ax, 180h
        cwd
        pop     bx
        idiv    bx
        mov     word ptr [bp - 4], ax
        cmp     byte ptr [bp - 0fh], 1
        jge     br_dfecc
        mov     ax, 1
        leave
        retf
br_dfecc:
        mov     al, byte ptr [bp - 0fh]
        cbw
        cmp     ax, word ptr [bp - 2]
        jle     br_dfeda
        mov     ax, 1
        leave
        retf
br_dfeda:
        mov     al, byte ptr [bp - 10h]
        cbw
        cmp     ax, word ptr [bp - 4]
        jl      br_dfee8
        mov     ax, 1
        leave
        retf
br_dfee8:
        xor     ax, ax
        leave
        retf
        if      FW_VERSION >= 312
        phase   0ch
        elseif  FW_VERSION = 311
        phase   2
        else
        phase   4
        endif
far_dfeec:
        push    bp
        mov     bp, sp
        sub     sp, 8
        push    si
        push    di
        cmp     byte ptr [B_8800], 0
        jz      br_dff04
        mov     dx, word ptr [W_87F8]
        mov     ax, word ptr [W_87F6]
        jmp     br_dff0b
br_dff04:
        mov     dx, word ptr [W_903B]
        mov     ax, word ptr [W_9039]
br_dff0b:
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        xor     di, di
        mov     al, byte ptr [B_8455]
        mov     ah, 0
        mov     dx, 6
        imul    dx
        mov     word ptr [bp - 6], ax
        mov     al, byte ptr [B_8A88]
        mov     ah, 0
        mov     dx, 6
        imul    dx
        mov     word ptr [bp - 8], ax
br_dff2d:
        cmp     byte ptr [B_8800], 0
        jz      br_dff94
        mov     bx, word ptr [bp - 6]
        mov     ax, word ptr [W_87FC]
        mov     dx, word ptr [W_87FA]
        mov     word ptr [bx + TBL_8458], ax
        mov     word ptr [bx + TBL_8456], dx
        mov     word ptr [bx + TBL_845A], 0
        xor     cx, cx
        mov     si, TBL_8456
        jmp     br_dff57
loop_dff53:
        add     si, 6
        inc     cx
br_dff57:
        mov     ax, word ptr [si + 2]
        mov     dx, word ptr [si]
        cmp     ax, word ptr [bp - 2]
        jc      loop_dff53
        ja      br_dff68
        cmp     dx, word ptr [bp - 4]
        jbe     loop_dff53
br_dff68:
        mov     ax, cx
        mov     dx, 6
        imul    dx
        mov     dx, ax
        add     ax, TBL_8456
        mov     word ptr [W_8828], ds
        mov     word ptr [W_8826], ax
        mov     bx, dx
        mov     ax, word ptr [bx + TBL_8458]
        mov     dx, word ptr [bx + TBL_8456]
        sub     dx, word ptr [bp - 4]
        sbb     ax, word ptr [bp - 2]
        mov     word ptr [TBL_882C], ax
        mov     word ptr [TBL_882A], dx
        jmp     br_dfff2
br_dff94:
        mov     bx, word ptr [bp - 8]
        mov     ax, word ptr [W_903F]
        mov     dx, word ptr [W_903D]
        mov     word ptr [bx + TBL_8832], ax
        mov     word ptr [bx + TBL_8830], dx
        mov     word ptr [bx + TBL_8834], 0
        xor     cx, cx
        mov     si, TBL_8830
        jmp     br_dffb7
loop_dffb3:
        add     si, 6
        inc     cx
br_dffb7:
        mov     ax, word ptr [si + 2]
        mov     dx, word ptr [si]
        cmp     ax, word ptr [bp - 2]
        jc      loop_dffb3
        ja      br_dffc8
        cmp     dx, word ptr [bp - 4]
        jbe     loop_dffb3
br_dffc8:
        mov     ax, cx
        mov     dx, 6
        imul    dx
        mov     dx, ax
        add     ax, TBL_8830
        mov     word ptr [W_8828], ds
        mov     word ptr [W_8826], ax
        mov     bx, dx
        mov     ax, word ptr [bx + TBL_8832]
        mov     dx, word ptr [bx + TBL_8830]
        sub     dx, word ptr [bp - 4]
        sbb     ax, word ptr [bp - 2]
        mov     word ptr [TBL_882C], ax
        mov     word ptr [TBL_882A], dx
br_dfff2:
