; one source v1.12/v2.12/v2.14; v2.14 page 10000h.
; FW_VERSION: conditional. RUN_ macro: per-version multi-page code.

        if      FW_VERSION >= 212

        db      06eh, 020h, 081h
        db      " DRUM "
        endif
        if      FW_VERSION = 212
        db      084h, 02ch, 020h, 08bh, 020h, 081h, 020h, 0a5h, 020h, 085h, 00ah, 094h
        db      " sampled "
        db      0d0h, 02eh, 020h, 01bh
        db      "S a "
        db      08eh, 020h, 01bh, 041h, 020h, 0a6h, 00ah, 01bh, 01eh, 020h, 0a5h
        db      ", its "
        db      0b3h, 020h, 088h, 020h, 094h, 020h, 097h, 02eh, 00ah
        db      "Once "
        db      0b2h, 02ch, 020h, 093h, 020h, 03ch, 01bh
        db      "z>. WARNING:"
        endif
        if      FW_VERSION >= 214
        db      084h, 02ch, 020h, 08bh, 020h, 081h, 020h, 0a6h, 020h, 085h, 00ah, 094h
        db      " sampled "
        db      0cch, 02eh, 020h, 01bh
        db      "U a "
        db      08fh, 020h, 01bh, 04ah, 020h, 0a8h, 00ah, 01bh, 017h, 020h, 0a6h
        db      ", its "
        db      0b3h, 020h, 088h, 020h, 094h, 020h, 098h, 02eh, 00ah
        db      "Once "
        db      0b1h, 02ch, 020h, 091h, 020h, 03ch, 0dfh
        db      ">. WARNING:"
        endif
        if      FW_VERSION >= 212
        db      00ah
        db      "WHEN YOU PRESS <"
        endif
        if      FW_VERSION = 212
        db      01bh, 07ah, 03eh, 02ch, 020h, 01bh, 058h, 020h, 0bdh, 00ah
        db      "MEMORY WILL BE ERASED!"
        db      00ah, 000h, 083h, 020h, 08ah, 020h, 081h, 020h, 0b3h, 020h, 01bh, 04ah, 020h, 085h, 020h, 081h
        db      020h, 08eh, 00ah, 0c5h, 020h, 01bh, 0a5h
        db      " sampled.  "
        db      01bh, 07fh, 020h, 09ch, 00ah, 0eeh, 02ch, 020h, 093h, 020h, 027h, 02bh, 027h, 020h, 0b4h, 020h
        db      027h, 02dh, 027h, 02ch, 020h, 0f9h, 020h, 081h, 020h, 0ech, 00ah, 0b3h, 020h, 01bh, 01ah, 020h
        db      081h, 020h, 01bh, 09ah, 020h, 01bh, 054h, 02ch, 020h, 0bah, 020h, 093h, 00ah, 01bh, 00ch, 02eh
        db      020h, 0a8h, 020h, 098h
        db      " knob "
        db      0f8h, 020h, 01bh, 004h, 020h, 094h, 020h, 099h, 00ah, 085h
        db      " add "
        db      01bh, 00fh, 020h, 01bh, 018h, 02eh, 00ah, 000h, 0c7h, 020h, 0dfh, 020h, 081h, 020h, 01bh, 040h
        db      020h, 087h, 020h, 091h, 00ah
        db      "seconds "
        db      0aeh
        db      " your "
        db      0dbh, 02eh, 00ah, 000h, 0c7h, 020h, 0dfh, 020h, 081h, 020h, 087h, 020h, 091h, 020h, 0bch, 00ah
        db      085h, 020h, 094h, 020h, 0d5h
        db      " BEFORE "
        db      081h, 020h, 01bh, 0d8h, 020h, 08ah, 00ah, 01bh, 0fdh, 02eh, 020h, 020h, 083h, 020h, 088h
        db      " prevent "
        db      081h, 00ah, 01bh, 0e4h, 020h, 0afh, 020h, 01bh, 0a5h
        db      " cutoff. A good"
        db      00ah, 01bh, 025h, 020h, 0d8h, 020h, 08ah, 020h, 031h, 030h, 020h, 0bch, 02eh, 020h, 0a8h, 00ah
        db      01bh, 0e4h
        endif
        if      FW_VERSION >= 214
        db      0dfh, 03eh, 02ch, 020h, 01bh, 053h, 020h, 0bfh, 00ah
        db      "MEMORY "
        db      01bh, 0eah
        db      " BE ERASED!"
        db      00ah, 000h, 083h, 020h, 08ah, 020h, 081h, 020h, 0b3h, 020h, 01bh, 050h, 020h, 085h, 020h, 081h
        db      020h, 08fh, 00ah, 0cah, 020h, 01bh, 0a2h
        db      " sampled.  "
        db      01bh, 082h, 020h, 09eh, 00ah, 0e7h, 02ch, 020h, 091h, 020h, 027h, 02bh, 027h, 020h, 0b5h, 020h
        db      027h, 02dh, 027h, 02ch, 020h, 0ffh, 020h, 081h, 020h, 0eah, 00ah, 0b3h, 020h, 01bh, 01eh, 020h
        db      081h, 020h, 01bh, 0a7h, 020h, 01bh, 058h, 02ch, 020h, 0b4h, 020h, 091h, 00ah, 01bh, 013h, 02eh
        db      020h, 0a3h, 020h, 096h
        db      " knob "
        db      0fbh, 020h, 01bh, 009h, 020h, 094h, 020h, 099h, 00ah, 085h
        db      " add "
        db      01bh, 00fh, 020h, 01bh, 020h, 02eh, 00ah, 000h, 0c1h, 020h, 0e0h, 020h, 081h, 020h, 01bh, 049h
        db      020h, 087h, 020h, 092h, 00ah
        db      "seconds "
        db      0ach
        db      " your "
        db      0dah, 02eh, 00ah, 000h, 0c1h, 020h, 0e0h, 020h, 081h, 020h, 087h, 020h, 092h, 020h, 0c0h, 00ah
        db      085h, 020h, 094h, 020h, 0d7h
        db      " BEFORE "
        db      081h, 020h, 01bh, 0dah, 020h, 08ah, 00ah
        db      "exceeded.  "
        db      083h, 020h, 088h
        db      " prevent "
        db      081h, 00ah, 01bh, 0f1h, 020h, 0afh, 020h, 01bh, 0a2h
        db      " cutoff. A good"
        db      00ah, 01bh, 026h, 020h, 0d4h, 020h, 08ah, 020h, 031h, 030h, 020h, 0c0h, 02eh, 020h, 0a3h, 00ah
        db      01bh, 0f1h
        endif
        if      FW_VERSION >= 212
        db      " can "
        db      094h
        db      " later trimmed "
        endif
        if      FW_VERSION = 212
        db      01bh, 01ah, 020h, 081h, 00ah, 022h, 01bh, 0b9h, 020h, 0f7h, 02fh, 01bh, 001h, 022h, 020h, 01bh
        db      05ch, 02eh, 00ah, 000h, 0bfh
        db      " YES "
        db      01bh, 080h, 020h, 0cbh, 020h, 01bh, 006h, 020h, 085h
        db      " hear "
        db      081h, 00ah, 01bh, 023h, 020h, 0efh, 020h, 0a6h, 020h, 081h, 020h, 01bh, 05eh, 020h, 01bh, 0b0h
        db      03bh, 020h, 0b4h, 020h, 04eh, 04fh, 00ah, 01bh, 080h, 020h, 0cbh
        db      " don't."
        db      00ah, 000h, 083h, 020h, 0c0h, 020h, 081h, 020h, 01bh, 001h, 020h, 091h, 020h, 061h, 020h, 0dbh
        endif
        if      FW_VERSION >= 214
        db      01bh, 01eh, 020h, 081h, 00ah, 022h, 01bh, 0c8h, 020h, 0f1h, 02fh, 01bh, 007h, 022h, 020h, 01bh
        db      027h, 02eh, 00ah, 000h, 0bdh
        db      " YES "
        db      01bh, 083h, 020h, 0beh, 020h, 0fch, 020h, 085h
        db      " hear "
        db      081h, 00ah, 01bh, 029h, 020h, 0f2h, 020h, 0a8h, 020h, 081h, 020h, 01bh, 062h, 020h, 01bh, 0c5h
        db      03bh, 020h, 0b5h, 020h, 04eh, 04fh, 00ah, 01bh, 083h, 020h, 0beh
        db      " don't."
        db      00ah, 000h, 083h, 020h, 0c5h, 020h, 081h, 020h, 01bh, 007h, 020h, 092h, 020h, 061h, 020h, 0dah
        endif
        if      FW_VERSION >= 212
        db      020h, 085h, 020h, 094h, 00ah
        db      "faded "
        endif
        if      FW_VERSION = 212
        db      01bh, 0b6h
        db      " so "
        db      01bh, 01eh, 020h, 081h, 020h, 08eh
        db      " does "
        db      0edh, 00ah
        db      "abruptly stop "
        db      01bh, 090h, 020h, 081h, 020h, 01bh, 001h, 020h, 091h, 020h, 081h, 020h, 0dbh, 00ah, 01bh, 0e3h
        db      02eh, 020h, 083h, 020h, 0a9h, 020h, 0cah, 020h, 081h, 00ah, 01bh, 0d7h, 020h, 01bh, 090h, 020h
        db      086h, 020h, 081h, 020h, 01bh
        db      "i STARTS; "
        db      081h, 00ah, 01bh, 069h, 020h, 01bh, 026h, 020h, 01bh, 0e7h, 020h, 01bh, 090h, 020h, 081h, 020h
        db      01bh, 001h, 020h, 091h, 020h, 081h, 00ah, 0dbh, 02eh, 020h, 083h, 020h, 0f8h, 020h, 01bh, 004h
        db      020h, 094h, 020h, 0aah
        db      " later."
        db      00ah, 000h, 083h, 020h, 01bh, 000h, 020h, 081h, 020h, 01bh, 05fh, 020h, 01bh, 02ah, 020h, 0aeh
        db      00ah, 01bh, 023h, 02eh, 020h, 020h, 0a8h, 020h, 01bh, 02fh, 020h, 08ah, 020h, 030h, 020h, 085h
        db      020h, 039h, 039h, 02eh, 00ah, 0e2h, 020h, 08ah, 020h, 01bh, 004h, 020h, 061h, 020h, 033h, 020h
        db      01bh, 003h, 020h, 01bh, 02fh, 00ah
        db      "switch next "
        db      085h, 020h, 081h, 020h, 01bh, 023h, 020h, 0efh, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h
        db      020h, 01bh, 02ah, 020h, 086h
        db      " must "
        db      094h, 00ah, 01bh, 0fdh, 020h, 01bh, 0f2h
        db      " <Ready> "
        db      08ah, 020h, 09eh, 020h, 0aeh, 00ah, 01bh, 023h, 020h, 085h, 020h, 0f7h
        db      ", as a "
        db      01bh, 0c4h, 020h, 091h, 00ah
        db      "full "
        db      01bh, 0edh, 020h, 01bh
        db      "*. It "
        db      08ah, 020h, 01bh, 0d4h, 020h, 01bh, 046h, 00ah, 081h, 020h, 01bh
        db      "* meter "
        db      01bh
        db      "k a 'T'. "
        db      0c7h, 020h, 061h, 020h, 027h, 030h, 027h, 00ah, 0aeh, 020h, 01bh, 023h, 020h, 085h, 020h, 0f7h
        db      " immediately "
        db      01bh, 0f2h, 00ah
        db      "<Ready> "
        db      08ah, 020h, 09eh, 02eh, 00ah, 000h, 0bfh, 020h, 081h, 020h, 08eh, 020h, 085h, 020h, 094h
        db      " edited "
        db      01bh, 06bh, 00ah, 01bh, 070h, 020h, 081h, 020h, 0a5h, 020h, 085h, 020h, 086h, 020h, 0eeh, 020h
        db      08ah, 00ah, 01bh
        db      "J.  All "
        db      01bh, 011h, 020h, 0adh, 020h, 0b6h, 00ah, 088h, 020h, 0aah, 020h, 085h
        db      " reflect "
        db      081h, 020h, 01bh, 0cfh, 00ah, 089h, 020h, 0a5h, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h
        db      020h, 0b3h, 020h, 091h, 020h, 081h, 020h, 08eh, 00ah, 01bh, 0c6h, 020h, 0a6h, 020h, 081h, 020h
        db      089h, 020h, 0a5h, 02eh, 020h, 020h, 0a8h, 00ah, 0b3h, 020h, 0f8h, 020h, 094h, 020h, 0aah, 020h
        db      01bh, 06bh, 020h, 0f3h, 020h, 02bh, 020h, 0b4h, 00ah, 02dh, 02ch, 020h, 01bh, 0eeh, 020h, 081h
        db      020h, 0ech, 020h, 0b3h, 02ch, 020h, 0bah, 020h, 0f3h, 00ah, 01bh, 00ch, 02eh, 00ah, 000h, 022h
        db      "Double "
        db      0c1h, 022h, 020h, 0c0h, 020h, 0ebh, 020h, 0a5h, 020h, 085h, 00ah, 0c8h
        db      " cause "
        db      0b8h, 020h, 0a5h, 020h, 085h, 00ah, 0c1h, 020h, 01bh, 091h, 020h, 081h, 020h, 01bh, 013h, 020h
        db      01bh, 00eh, 02eh, 020h, 020h, 01bh, 07fh, 00ah
        db      "enable "
        db      08fh, 02ch, 020h, 08bh, 020h, 081h
        db      " additional"
        db      00ah, 0a5h, 020h, 0a6h, 020h, 081h, 020h, 022h
        db      "Also "
        db      01bh, 00eh, 022h, 020h, 084h, 02eh, 020h, 020h, 01bh, 07fh, 00ah, 01bh, 0cch, 020h, 085h, 020h
        db      01bh, 039h, 02ch, 020h, 08bh, 020h, 022h
        db      "NONE"
        db      022h, 020h, 0a6h, 020h, 08fh, 00ah, 084h, 02eh, 00ah, 000h, 01bh, 053h, 020h, 0b2h, 020h, 085h
        db      020h, 01bh, 081h, 02ch, 020h, 081h
        db      " ALSO PLAYS "
        db      0a5h, 020h, 08ah, 00ah, 01bh, 026h, 020h, 01bh, 036h, 020h, 0a3h, 020h, 081h, 020h, 01bh, 013h
        db      020h, 0a5h, 00ah, 01bh, 00eh, 02eh, 020h, 020h, 01bh
        db      "S VELSW "
        db      08ah, 020h, 0b2h, 020h, 085h
        endif
        if      FW_VERSION >= 214
        db      01bh, 0b0h
        db      " so "
        db      01bh, 017h, 020h, 081h, 020h, 08fh
        db      " does "
        db      0efh, 00ah
        db      "abruptly stop "
        db      01bh, 090h, 020h, 081h, 020h, 01bh, 007h, 020h, 092h, 020h, 081h, 020h, 0dah, 00ah
        db      "period. "
        db      083h, 020h, 0a9h, 020h, 0cbh, 020h, 081h, 00ah, 01bh, 0d0h, 020h, 01bh, 090h, 020h, 086h, 020h
        db      081h, 020h, 01bh
        db      "r STARTS; "
        db      081h, 00ah, 01bh, 072h, 020h, 01bh, 02ah, 020h, 01bh, 0fch, 020h, 01bh, 090h, 020h, 081h, 020h
        db      01bh, 007h, 020h, 092h, 020h, 081h, 00ah, 0dah, 02eh, 020h, 083h, 020h, 0fbh, 020h, 01bh, 009h
        db      020h, 094h, 020h, 0abh
        db      " later."
        db      00ah, 000h, 083h, 020h, 01bh, 006h, 020h, 081h, 020h, 01bh, 064h, 020h, 01bh, 031h, 020h, 0ach
        db      00ah, 01bh, 029h, 02eh, 020h, 020h, 0a3h, 020h, 01bh, 030h, 020h, 08ah, 020h, 030h, 020h, 085h
        db      020h, 039h, 039h, 02eh, 00ah, 0e2h, 020h, 08ah, 020h, 01bh, 009h, 020h, 061h, 020h, 033h, 020h
        db      01bh, 005h, 020h, 01bh, 030h, 00ah
        db      "switch next "
        db      085h, 020h, 081h, 020h, 01bh, 029h, 020h, 0f2h, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h
        db      020h, 01bh, 031h, 020h, 086h
        db      " must "
        db      094h, 00ah
        db      "exceeded "
        db      01bh, 0c3h
        db      " <Ready> "
        db      08ah, 020h, 09dh, 020h, 0ach, 00ah, 01bh, 029h, 020h, 085h, 020h, 0f1h
        db      ", as a "
        db      01bh, 0cdh, 020h, 092h, 00ah
        db      "full "
        db      01bh, 0f7h, 020h, 01bh
        db      "1. It "
        db      08ah, 020h, 01bh, 0d2h, 020h, 01bh, 036h, 00ah, 081h, 020h, 01bh
        db      "1 meter "
        db      01bh, 07ch
        db      " a 'T'. "
        db      0c1h, 020h, 061h, 020h, 027h, 030h, 027h, 00ah, 0ach, 020h, 01bh, 029h, 020h, 085h, 020h, 0f1h
        db      " immediately "
        db      01bh, 0c3h, 00ah
        db      "<Ready> "
        db      08ah, 020h, 09dh, 02eh, 00ah, 000h, 0bdh, 020h, 081h, 020h, 08fh, 020h, 085h, 020h, 094h
        db      " edited "
        db      01bh, 07ch, 00ah, 01bh, 07ah, 020h, 081h, 020h, 0a6h, 020h, 085h, 020h, 086h, 020h, 0e7h, 020h
        db      08ah, 00ah, 01bh
        db      "P.  All "
        db      01bh, 014h, 020h, 0a7h, 020h, 0b6h, 00ah, 088h, 020h, 0abh, 020h, 085h
        db      " reflect "
        db      081h, 020h, 01bh, 0e2h, 00ah, 089h, 020h, 0a6h, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h
        db      020h, 0b3h, 020h, 092h, 020h, 081h, 020h, 08fh, 00ah, 01bh, 0d5h, 020h, 0a8h, 020h, 081h, 020h
        db      089h, 020h, 0a6h, 02eh, 020h, 020h, 0a3h, 00ah, 0b3h, 020h, 0fbh, 020h, 094h, 020h, 0abh, 020h
        db      01bh, 07ch, 020h, 0f6h, 020h, 02bh, 020h, 0b5h, 00ah, 02dh, 02ch, 020h, 01bh, 0ffh, 020h, 081h
        db      020h, 0eah, 020h, 0b3h, 02ch, 020h, 0b4h, 020h, 0f6h, 00ah, 01bh, 013h, 02eh, 00ah, 000h, 022h
        db      "Double "
        db      0c4h, 022h, 020h, 0c5h, 020h, 0f0h, 020h, 0a6h, 020h, 085h, 00ah, 0cdh
        db      " cause "
        db      0b9h, 020h, 0a6h, 020h, 085h, 00ah, 0c4h, 020h, 01bh, 08dh, 020h, 081h, 020h, 01bh, 001h, 020h
        db      01bh, 010h, 02eh, 020h, 020h, 01bh, 082h, 00ah
        db      "enable "
        db      090h, 02ch, 020h, 08bh, 020h, 081h
        db      " additional"
        db      00ah, 0a6h, 020h, 0a8h, 020h, 081h, 020h, 022h
        db      "Also "
        db      01bh, 010h, 022h, 020h, 084h, 02eh, 020h, 020h, 01bh, 082h, 00ah, 01bh, 0dfh, 020h, 085h, 020h
        db      01bh, 043h, 02ch, 020h, 08bh, 020h, 022h
        db      "NONE"
        db      022h, 020h, 0a8h, 020h, 090h, 00ah, 084h, 02eh, 00ah, 000h, 01bh, 055h, 020h, 0b1h, 020h, 085h
        db      020h, 01bh, 084h, 02ch, 020h, 081h
        db      " ALSO PLAYS "
        db      0a6h, 020h, 08ah, 00ah, 01bh, 02ah, 020h, 01bh, 044h, 020h, 0a4h, 020h, 081h, 020h, 01bh, 001h
        db      020h, 0a6h, 00ah, 01bh, 010h, 02eh, 020h, 020h, 01bh
        db      "U VELSW "
        db      08ah, 020h, 0b1h, 020h, 085h
        endif
        if      FW_VERSION >= 212
        db      " ON, "
        db      081h, 00ah
        db      "ALSO PLAYS "
        endif
        if      FW_VERSION = 212
        db      0a5h, 020h, 08ah, 020h, 01bh, 036h, 020h, 01bh, 01ch, 020h, 01bh, 080h, 020h, 081h, 00ah, 0a2h
        db      020h, 091h, 020h, 081h
        db      " primary "
        db      0a5h, 020h, 08ah
        db      " higher"
        db      00ah, 01bh, 0dbh, 020h, 081h, 020h, 0a9h, 020h, 0a6h, 020h, 081h
        db      " IF OVER "
        db      084h, 02eh, 00ah, 000h, 083h, 020h, 01bh, 000h, 020h, 081h, 020h, 0a2h, 020h, 0d8h, 020h, 086h
        db      00ah, 0a5h, 020h, 0d9h
        db      " must exceed "
        db      0a6h
        db      " order "
        db      085h, 020h, 081h, 00ah, 0c1h, 020h, 081h
        db      " ALSO PLAYS "
        db      0a5h, 020h, 028h, 01bh, 080h
        db      " VELSW "
        db      08ah, 00ah, 0b2h, 020h, 085h
        endif
        if      FW_VERSION >= 214
        db      0a6h, 020h, 08ah, 020h, 01bh, 044h, 020h, 01bh, 01ch, 020h, 01bh, 083h, 020h, 081h, 00ah, 0a2h
        db      020h, 092h, 020h, 081h
        db      " primary "
        db      0a6h, 020h, 08ah
        db      " higher"
        db      00ah, 01bh, 0aeh, 020h, 081h, 020h, 0a9h, 020h, 0a8h, 020h, 081h
        db      " IF OVER "
        db      084h, 02eh, 00ah, 000h, 083h, 020h, 01bh, 006h, 020h, 081h, 020h, 0a2h, 020h, 0d4h, 020h, 086h
        db      00ah, 0a6h, 020h, 0dch
        db      " must exceed "
        db      0a8h
        db      " order "
        db      085h, 020h, 081h, 00ah, 0c4h, 020h, 081h
        db      " ALSO PLAYS "
        db      0a6h, 020h, 028h, 01bh, 083h
        db      " VELSW "
        db      08ah, 00ah, 0b1h, 020h, 085h
        endif
        if      FW_VERSION >= 212
        db      " ON)."
        db      00ah, 000h, 083h, 020h, 08ah, 020h, 081h, 020h, 022h
        db      "initial "
        endif
        if      FW_VERSION = 212
        db      0e6h, 022h, 020h, 0aeh, 020h, 081h, 00ah, 08eh, 02ch, 020h, 086h
        db      " affects "
        db      0beh, 020h, 01bh, 037h, 02eh, 00ah, 083h
        endif
        if      FW_VERSION >= 214
        db      0eeh, 022h, 020h, 0ach, 020h, 081h, 00ah, 08fh, 02ch, 020h, 086h
        db      " affects "
        db      0c2h, 020h, 01bh, 045h, 02eh, 00ah, 083h
        endif
        if      FW_VERSION >= 212
        db      " serves as a way "
        db      085h
        db      " balance "
        endif
        if      FW_VERSION = 212
        db      081h, 00ah, 09fh, 020h, 0a6h, 020h, 081h
        db      " assignable "
        db      01bh, 0b0h, 020h, 01bh, 037h, 02eh, 00ah, 0a8h, 020h, 01bh, 02fh, 020h, 08ah, 020h, 031h, 020h
        db      085h, 020h, 032h, 030h, 030h, 025h, 02ch, 020h, 031h, 030h, 030h, 025h, 020h, 03dh, 020h, 01bh
        db      039h, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h, 020h, 022h
        db      "initial "
        db      01bh, 05ah, 022h, 020h, 0a9h, 02eh, 00ah, 0a8h, 020h, 01bh, 05ah, 020h, 0a1h, 020h, 0a6h, 020h
        endif
        if      FW_VERSION >= 214
        db      081h, 00ah, 09fh, 020h, 0a8h, 020h, 081h
        db      " assignable "
        db      01bh, 0c5h, 020h, 01bh, 045h, 02eh, 00ah, 0a3h, 020h, 01bh, 030h, 020h, 08ah, 020h, 031h, 020h
        db      085h, 020h, 032h, 030h, 030h, 025h, 02ch, 020h, 031h, 030h, 030h, 025h, 020h, 03dh, 020h, 01bh
        db      043h, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h, 020h, 022h
        db      "initial "
        db      01bh, 066h, 022h, 020h, 0a9h, 02eh, 00ah, 0a3h, 020h, 01bh, 066h, 020h, 0a1h, 020h, 0a8h, 020h
        endif
        if      FW_VERSION >= 212
        db      081h
        db      " TUNE DRUMS"
        endif
        if      FW_VERSION = 212
        db      00ah, 0adh, 020h, 09dh, 020h, 081h
        db      " individual "
        db      0c2h, 020h, 01bh, 06ch, 00ah, 0a6h, 020h, 081h, 020h, 01bh, 0bbh
        db      " EDIT "
        db      0adh, 020h, 0b0h, 020h, 01bh, 0c8h, 020h, 085h, 00ah, 08fh, 020h, 0a9h, 020h, 085h
        db      " produce "
        db      081h, 020h, 01bh, 0dfh, 00ah, 01bh, 05ah, 020h, 0aeh, 020h, 01bh, 019h, 020h, 0c2h, 02eh, 00ah
        db      000h, 083h, 020h, 08ah, 020h, 081h, 020h, 0f7h
        db      " address "
        db      091h, 020h, 081h, 00ah, 089h, 020h, 08eh, 02ch, 020h, 0a6h, 020h, 0bch, 02eh, 00ah, 049h, 074h
        endif
        if      FW_VERSION >= 214
        db      00ah, 0a7h, 020h, 09ch, 020h, 081h
        db      " individual "
        db      0c3h, 020h, 01bh, 07eh, 00ah, 0a8h, 020h, 081h, 020h, 01bh, 0cbh
        db      " EDIT "
        db      0a7h, 020h, 0b0h, 020h, 01bh, 0d8h, 020h, 085h, 00ah, 090h, 020h, 0a9h, 020h, 085h
        db      " produce "
        db      081h, 020h, 01bh, 0f0h, 00ah, 01bh, 066h, 020h, 0ach, 020h, 01bh, 016h, 020h, 0c3h, 02eh, 00ah
        db      000h, 083h, 020h, 08ah, 020h, 081h, 020h, 0f1h
        db      " address "
        db      092h, 020h, 081h, 00ah, 089h, 020h, 08fh, 02ch, 020h, 0a8h, 020h, 0c0h, 02eh, 00ah, 049h, 074h
        endif
        if      FW_VERSION >= 212
        db      020h, 08ah
        db      " sometimes "
        endif
        if      FW_VERSION = 212
        db      01bh, 0f5h, 020h, 085h
        db      " trim "
        db      081h, 00ah, 0f7h, 020h, 091h, 020h, 081h, 020h, 08eh
        db      " so "
        db      081h, 020h, 01bh, 0e4h, 020h, 088h, 00ah, 094h
        db      " faster. "
        db      0a8h, 020h, 01bh, 022h, 020h, 0f4h, 020h, 0ddh, 00ah, 081h, 020h, 0f7h, 020h, 08ah, 020h, 01bh
        db      08dh
        db      " unless <Cutoff"
        db      00ah, 01bh, 0e7h, 03eh, 020h, 08ah, 020h, 09eh, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h
        db      020h, 01bh, 001h
        db      " address "
        db      091h, 020h, 081h, 020h, 089h, 00ah, 08eh, 02ch, 020h, 0a6h, 020h, 0bch, 02eh, 020h, 083h
        endif
        if      FW_VERSION >= 214
        db      01bh, 0ech, 020h, 085h
        db      " trim "
        db      081h, 00ah, 0f1h, 020h, 092h, 020h, 081h, 020h, 08fh
        db      " so "
        db      081h, 020h, 01bh, 0f1h, 020h, 088h, 00ah, 094h
        db      " faster. "
        db      0a3h, 020h, 01bh, 023h, 020h, 0fah, 020h, 0d8h, 00ah, 081h, 020h, 0f1h, 020h, 08ah, 020h, 01bh
        db      093h
        db      " unless <Cutoff"
        db      00ah, 01bh, 0fch, 03eh, 020h, 08ah, 020h, 09dh, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h
        db      020h, 01bh, 007h
        db      " address "
        db      092h, 020h, 081h, 020h, 089h, 00ah, 08fh, 02ch, 020h, 0a8h, 020h, 0c0h, 02eh, 020h, 083h
        endif
        if      FW_VERSION >= 212
        db      " can "
        db      094h, 00ah, 099h, 020h, 085h
        db      " shorten "
        db      081h
        db      " length "
        endif
        if      FW_VERSION = 212
        db      091h, 020h, 061h, 020h, 08eh, 02eh, 00ah, 0a8h, 020h, 01bh, 022h, 020h, 0f4h, 020h, 091h, 020h
        db      081h, 020h, 08eh, 020h, 01bh, 02eh, 00ah, 081h, 020h, 01bh, 001h, 020h, 08ah, 020h, 01bh, 08dh
        db      " unless <Cutoff"
        db      00ah, 01bh, 0e7h, 03eh, 020h, 08ah, 020h, 09eh, 02eh, 00ah, 000h, 0c9h, 020h, 03ch, 0a7h, 03eh
        db      020h, 085h, 020h, 0e7h, 020h, 081h, 020h, 01bh, 022h, 00ah, 0f4h, 020h, 091h, 020h, 081h, 020h
        db      08eh, 020h, 0ddh, 020h, 081h, 020h, 0f7h, 00ah, 0b4h, 020h, 01bh, 02eh, 020h, 081h, 020h, 01bh
        db      001h, 020h, 028h, 01bh, 080h, 020h, 01bh, 067h, 020h, 01bh, 041h, 029h, 020h, 085h, 00ah, 01bh
        db      043h, 020h, 0bbh, 02eh, 020h, 020h, 0c9h, 020h, 03ch, 01bh, 009h, 03eh, 020h, 085h, 020h, 01bh
        db      0e0h, 00ah, 081h
        db      " deletion "
        db      09dh, 020h, 01bh, 05bh, 020h, 085h, 020h, 081h, 00ah, 01bh, 021h, 020h, 0adh, 02eh, 00ah, 03ch
        db      0a7h, 03eh, 020h, 020h, 03ch, 01bh, 009h, 03eh, 00ah, 000h, 0c9h, 020h, 03ch, 0a7h, 03eh, 020h
        endif
        if      FW_VERSION >= 214
        db      092h, 020h, 061h, 020h, 08fh, 02eh, 00ah, 0a3h, 020h, 01bh, 023h, 020h, 0fah, 020h, 092h, 020h
        db      081h, 020h, 08fh, 020h, 01bh, 032h, 00ah, 081h, 020h, 01bh, 007h, 020h, 08ah, 020h, 01bh, 093h
        db      " unless <Cutoff"
        db      00ah, 01bh, 0fch, 03eh, 020h, 08ah, 020h, 09dh, 02eh, 00ah, 000h, 0bch, 020h, 03ch, 0aah, 03eh
        db      020h, 085h, 020h, 0edh, 020h, 081h, 020h, 01bh, 023h, 00ah, 0fah, 020h, 092h, 020h, 081h, 020h
        db      08fh, 020h, 0d8h, 020h, 081h, 020h, 0f1h, 00ah, 0b5h, 020h, 01bh, 032h, 020h, 081h, 020h, 01bh
        db      007h, 020h, 028h, 01bh, 083h, 020h, 01bh, 081h, 020h, 01bh, 04ah, 029h, 020h, 085h, 00ah, 01bh
        db      041h, 020h, 0b8h, 02eh, 020h, 020h, 0bch, 020h, 03ch, 01bh, 011h, 03eh, 020h, 085h, 020h, 01bh
        db      0e8h, 00ah, 081h
        db      " deletion "
        db      09ch, 020h, 01bh, 065h, 020h, 085h, 020h, 081h, 00ah, 01bh, 02bh, 020h, 0a7h, 02eh, 00ah, 03ch
        db      0aah, 03eh, 020h, 020h, 03ch, 01bh, 011h, 03eh, 00ah, 000h, 0bch, 020h, 03ch, 0aah, 03eh, 020h
        endif
        if      FW_VERSION >= 212
        db      085h
        db      " reverse "
        endif
        if      FW_VERSION = 212
        db      081h, 020h, 08eh, 00ah, 0a6h, 020h, 0bbh, 02eh, 020h, 020h, 028h, 083h, 020h, 088h
        db      " affect "
        db      0beh, 00ah, 01bh, 011h, 020h, 09fh, 020h, 086h, 020h, 01bh, 0a8h, 020h, 08fh, 020h, 08eh, 02eh
        db      029h, 00ah, 0c9h, 020h, 03ch, 01bh, 009h, 03eh, 020h, 085h, 020h, 01bh, 05bh, 020h, 085h, 020h
        db      081h, 00ah, 01bh, 021h, 020h, 0adh, 02eh, 00ah, 03ch, 0a7h, 03eh, 020h, 020h, 03ch, 01bh, 009h
        db      03eh, 00ah, 000h, 0c9h, 020h, 03ch, 0a7h, 03eh, 020h, 085h, 020h, 0e7h, 020h, 081h, 020h, 01bh
        db      094h, 00ah, 08eh, 02eh, 020h, 020h, 0a8h, 020h, 08eh
        db      " won't "
        db      094h, 020h, 01bh, 0b7h, 020h, 01bh, 080h, 00ah, 0eeh, 020h, 08ah, 020h, 01bh, 004h, 020h, 0e9h
        db      020h, 0d0h, 020h, 0b8h, 020h, 0a5h, 02eh, 00ah, 00ah, 00ah, 03ch, 0a7h, 03eh, 020h, 020h, 03ch
        db      01bh, 009h, 03eh, 00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 0f6h, 020h, 081h, 020h, 01bh, 060h
        db      020h, 091h, 020h, 0eah, 00ah, 01bh, 0bch, 020h, 086h, 020h, 081h, 020h, 08eh, 020h, 088h
        endif
        if      FW_VERSION >= 214
        db      081h, 020h, 08fh, 00ah, 0a8h, 020h, 0b8h, 02eh, 020h, 020h, 028h, 083h, 020h, 088h
        db      " affect "
        db      0c2h, 00ah, 01bh, 014h, 020h, 09fh, 020h, 086h, 020h, 01bh, 085h, 020h, 090h, 020h, 08fh, 02eh
        db      029h, 00ah, 0bch, 020h, 03ch, 01bh, 011h, 03eh, 020h, 085h, 020h, 01bh, 065h, 020h, 085h, 020h
        db      081h, 00ah, 01bh, 02bh, 020h, 0a7h, 02eh, 00ah, 03ch, 0aah, 03eh, 020h, 020h, 03ch, 01bh, 011h
        db      03eh, 00ah, 000h, 0bch, 020h, 03ch, 0aah, 03eh, 020h, 085h, 020h, 0edh, 020h, 081h, 020h, 01bh
        db      0a9h, 00ah, 08fh, 02eh, 020h, 020h, 0a3h, 020h, 08fh
        db      " won't "
        db      094h, 020h, 01bh, 0ceh, 020h, 01bh, 083h, 00ah, 0e7h, 020h, 08ah, 020h, 01bh, 009h, 020h, 0ech
        db      020h, 0cch, 020h, 0b9h, 020h, 0a6h, 02eh, 00ah, 00ah, 00ah, 03ch, 0aah, 03eh, 020h, 020h, 03ch
        db      01bh, 011h, 03eh, 00ah, 000h, 083h, 020h, 084h
        db      " controls "
        db      081h, 020h, 01bh, 063h, 020h, 092h, 020h, 0e1h, 00ah, 01bh, 0b4h, 020h, 086h, 020h, 081h, 020h
        db      08fh, 020h, 088h
        endif
        if      FW_VERSION >= 212
        db      " rise "
        db      0afh, 00ah
        db      "silence "
        endif
        if      FW_VERSION = 212
        db      085h, 020h, 081h, 020h, 0d2h, 020h, 0a2h, 020h, 01bh, 02ah, 02ch, 00ah
        db      "measured "
        db      0a6h, 020h, 0bch, 02eh, 00ah, 000h, 083h, 020h, 0c0h, 020h, 081h, 020h, 01bh, 001h, 020h, 091h
        db      020h, 061h, 020h, 0dbh, 020h, 085h, 020h, 094h, 00ah
        db      "faded "
        db      01bh, 0b6h
        db      " so "
        db      01bh, 01eh, 020h, 081h, 020h, 08eh
        db      " does "
        db      0edh, 00ah
        db      "abruptly stop "
        db      01bh, 090h, 020h, 081h, 020h, 01bh, 001h, 020h, 091h, 020h, 081h, 020h, 0dbh, 00ah, 01bh, 0e3h
        db      02eh, 020h, 083h, 020h, 0a9h, 020h, 0cah, 020h, 081h, 00ah, 01bh, 0d7h, 020h, 01bh, 090h, 020h
        phase   4ef0h
        db      086h, 020h, 081h, 020h, 01bh
        db      "i STARTS; "
        db      081h, 00ah, 01bh, 069h, 020h, 01bh, 026h, 020h, 01bh, 0e7h, 020h, 01bh, 090h, 020h, 081h, 020h
        db      01bh, 001h, 020h, 091h, 020h, 081h, 00ah, 0dbh, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 0c0h
        db      020h, 081h, 020h, 0e1h, 020h, 0c2h, 00ah, 0a2h, 020h, 085h, 020h, 01bh, 08ch, 020h, 081h, 020h
        db      01bh, 07ch, 020h, 084h, 02eh, 00ah
        db      "Full "
        db      0a2h, 020h, 028h, 031h, 032h, 037h, 029h, 020h, 01bh, 042h, 020h, 01bh, 0e1h, 020h, 01bh, 096h
        db      020h, 01bh, 046h, 00ah, 081h, 020h, 01bh, 07ch, 020h, 084h
        endif
        if      FW_VERSION >= 214
        db      085h, 020h, 081h, 020h, 0d2h, 020h, 0a2h, 020h, 01bh, 031h, 02ch, 00ah
        db      "measured "
        db      0a8h, 020h, 0c0h, 02eh, 00ah, 000h, 083h, 020h, 0c5h, 020h, 081h, 020h, 01bh, 007h, 020h, 092h
        db      020h, 061h, 020h, 0dah, 020h, 085h, 020h, 094h, 00ah
        db      "faded "
        db      01bh, 0b0h
        db      " so "
        db      01bh, 017h, 020h, 081h, 020h, 08fh
        db      " does "
        db      0efh, 00ah
        db      "abruptly stop "
        db      01bh, 090h, 020h, 081h, 020h, 01bh, 007h, 020h, 092h, 020h, 081h, 020h, 0dah, 00ah
        db      "period. "
        db      083h, 020h, 0a9h, 020h, 0cbh, 020h, 081h, 00ah, 01bh, 0d0h, 020h, 01bh, 090h, 020h, 086h, 020h
        db      081h, 020h, 01bh
        db      "r STARTS; "
        db      081h, 00ah, 01bh, 072h, 020h, 01bh, 02ah, 020h, 01bh, 0fch, 020h, 01bh, 090h, 020h, 081h, 020h
        db      01bh, 007h, 020h, 092h, 020h, 081h, 00ah, 0dah, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 0c5h
        db      020h, 081h, 020h, 0e5h, 020h, 0c3h, 00ah, 0a2h, 020h, 085h, 020h, 01bh, 08eh, 020h, 081h, 020h
        db      01bh, 069h, 020h, 084h, 02eh, 00ah
        db      "Full "
        db      0a2h, 020h, 028h, 031h, 032h, 037h, 029h, 020h, 01bh, 040h, 020h, 01bh, 0eeh, 020h, 01bh, 0ach
        db      020h, 01bh, 036h, 00ah, 081h, 020h, 01bh, 069h, 020h, 084h
        endif
        if      FW_VERSION >= 212
        db      "; lowest "
        db      0a2h, 020h, 028h, 031h, 029h, 00ah
        db      "adds "
        endif
        if      FW_VERSION = 212
        db      081h, 020h, 01bh, 027h, 020h, 0f2h, 020h, 091h, 020h, 08fh, 020h, 084h, 00ah, 085h, 020h, 081h
        db      020h, 01bh, 07ch, 020h, 084h, 02eh, 020h, 020h, 01bh, 0f8h, 020h, 01bh, 002h, 00ah, 08ah, 020h
        db      01bh, 0c8h, 020h, 01bh, 057h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 0c0h, 020h, 081h, 020h
        db      0e1h, 020h, 0c2h, 00ah, 0a2h, 020h, 085h, 020h, 01bh, 08ch, 020h, 081h, 020h, 01bh, 0deh, 020h
        db      084h, 02eh, 00ah
        db      "Full "
        db      0a2h, 020h, 028h, 031h, 032h, 037h, 029h, 020h, 01bh, 042h, 020h, 01bh, 0e1h, 020h, 01bh, 096h
        db      020h, 01bh, 046h, 00ah, 081h, 020h, 01bh, 0deh, 020h, 084h
        endif
        if      FW_VERSION >= 214
        db      081h, 020h, 01bh, 025h, 020h, 0f5h, 020h, 092h, 020h, 090h, 020h, 084h, 00ah, 085h, 020h, 081h
        db      020h, 01bh, 069h, 020h, 084h
        db      ".  Anything "
        db      01bh, 00ah, 00ah, 08ah, 020h, 01bh, 0d8h, 020h, 01bh, 05dh, 02eh, 00ah, 000h, 083h, 020h, 084h
        db      020h, 0c5h, 020h, 081h, 020h, 0e5h, 020h, 0c3h, 00ah, 0a2h, 020h, 085h, 020h, 01bh, 08eh, 020h
        db      081h, 020h, 01bh, 0ebh, 020h, 084h, 02eh, 00ah
        db      "Full "
        db      0a2h, 020h, 028h, 031h, 032h, 037h, 029h, 020h, 01bh, 040h, 020h, 01bh, 0eeh, 020h, 01bh, 0ach
        db      020h, 01bh, 036h, 00ah, 081h, 020h, 01bh, 0ebh, 020h, 084h
        endif
        if      FW_VERSION >= 212
        db      "; lowest "
        db      0a2h, 020h, 028h, 031h, 029h, 00ah
        db      "adds "
        endif
        if      FW_VERSION = 212
        db      081h, 020h, 01bh, 027h, 020h, 0f2h, 020h, 091h, 020h, 08fh, 020h, 084h, 00ah, 085h, 020h, 081h
        db      020h, 01bh, 0deh, 020h, 084h, 02eh, 020h, 020h, 01bh, 0f8h, 020h, 01bh, 002h, 00ah, 08ah, 020h
        db      01bh, 0c8h, 020h, 01bh, 057h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 0c0h, 020h, 081h, 020h
        db      0e1h, 020h, 0c2h, 00ah, 0a2h, 020h, 085h, 020h, 01bh, 08ch, 020h, 081h, 020h, 0e6h, 020h, 01bh
        db      02ah, 02eh, 00ah, 041h, 020h, 0a9h, 020h, 091h
        db      " 100 provides maximum"
        db      00ah, 01bh, 08bh, 020h, 028h, 01bh, 039h, 029h, 03bh, 020h, 061h, 020h, 0a9h, 020h, 091h, 020h
        db      027h, 030h, 027h, 00ah
        db      "provides "
        db      01bh, 0e1h, 020h, 01bh, 08bh, 020h, 028h, 0beh, 020h, 0d9h, 020h, 0c1h, 00ah
        db      "FULL "
        db      0e6h
        db      "); 50 gives a "
        db      01bh, 075h, 020h, 01bh, 02fh, 00ah, 0afh
        endif
        if      FW_VERSION >= 214
        db      081h, 020h, 01bh, 025h, 020h, 0f5h, 020h, 092h, 020h, 090h, 020h, 084h, 00ah, 085h, 020h, 081h
        db      020h, 01bh, 0ebh, 020h, 084h
        db      ".  Anything "
        db      01bh, 00ah, 00ah, 08ah, 020h, 01bh, 0d8h, 020h, 01bh, 05dh, 02eh, 00ah, 000h, 083h, 020h, 084h
        db      020h, 0c5h, 020h, 081h, 020h, 0e5h, 020h, 0c3h, 00ah, 0a2h, 020h, 085h, 020h, 01bh, 08eh, 020h
        db      081h, 020h, 0eeh, 020h, 01bh, 031h, 02eh, 00ah, 041h, 020h, 0a9h, 020h, 092h
        db      " 100 provides maximum"
        db      00ah, 01bh, 089h, 020h, 028h, 01bh
        db      "C); a "
        db      0a9h, 020h, 092h, 020h, 027h, 030h, 027h, 00ah
        db      "provides "
        db      01bh, 0eeh, 020h, 01bh, 089h, 020h, 028h, 0c2h, 020h, 0dch, 020h, 0c4h, 00ah
        db      "FULL "
        db      0eeh
        db      "); 50 gives a "
        db      01bh, 07bh, 020h, 01bh, 030h, 00ah, 0afh
        endif
        if      FW_VERSION >= 212
        db      " half "
        db      085h
        db      " full "
        endif
        if      FW_VERSION = 212
        db      0e6h, 02eh, 00ah, 000h, 0c9h, 020h, 03ch, 0a7h, 03eh, 020h, 085h, 020h, 0e7h, 020h, 081h, 020h
        db      01bh, 022h, 00ah, 0f4h, 020h, 091h, 020h, 081h, 020h, 08eh, 020h, 0ddh, 020h, 081h, 020h, 0f7h
        db      00ah, 0b4h, 020h, 01bh, 02eh, 020h, 081h, 020h, 01bh, 001h, 020h, 028h, 01bh, 080h, 020h, 01bh
        db      067h, 020h, 01bh, 041h, 029h, 020h, 085h, 00ah, 01bh, 043h, 020h, 0bbh, 02eh, 020h, 020h, 0c9h
        db      020h, 03ch, 01bh, 009h, 03eh, 020h, 085h, 020h, 01bh, 0e0h, 00ah, 081h
        db      " deletion "
        db      09dh, 020h, 01bh, 05bh, 020h, 085h, 020h, 081h, 00ah, 01bh, 021h, 020h, 0adh, 02eh, 00ah, 000h
        db      0c9h, 020h, 03ch, 0a7h, 03eh, 020h, 085h
        db      " reverse "
        db      081h, 020h, 08eh, 00ah, 0a6h, 020h, 0bbh, 02eh, 020h, 020h, 028h, 083h, 020h, 088h
        db      " affect "
        db      0beh, 00ah, 01bh, 011h, 020h, 09fh, 020h, 086h, 020h, 01bh, 0a8h, 020h, 08fh, 020h, 08eh, 02eh
        db      029h, 00ah, 0c9h, 020h, 03ch, 01bh, 009h, 03eh, 020h, 085h, 020h, 01bh, 05bh, 020h, 085h, 020h
        db      081h, 00ah, 01bh, 021h, 020h, 0adh, 02eh, 00ah, 000h, 0c9h, 020h, 03ch, 0a7h, 03eh, 020h, 085h
        db      020h, 0e7h, 020h, 081h, 020h, 01bh, 094h, 00ah, 08eh, 02eh, 020h, 020h, 0a8h, 020h, 08eh
        db      " won't "
        db      094h, 020h, 01bh, 0b7h, 020h, 01bh, 080h, 00ah, 0eeh, 020h, 08ah, 020h, 01bh, 004h, 020h, 0e9h
        db      020h, 0d0h, 020h, 0b8h, 020h, 0a5h, 02eh, 00ah, 000h, 083h, 020h, 08ah
        db      " a tune "
        db      0a9h, 020h, 0aeh, 020h, 0ebh, 020h, 091h, 020h, 081h, 00ah, 09fh
        endif
        if      FW_VERSION >= 214
        db      0eeh, 02eh, 00ah, 000h, 0bch, 020h, 03ch, 0aah, 03eh, 020h, 085h, 020h, 0edh, 020h, 081h, 020h
        db      01bh, 023h, 00ah, 0fah, 020h, 092h, 020h, 081h, 020h, 08fh, 020h, 0d8h, 020h, 081h, 020h, 0f1h
        db      00ah, 0b5h, 020h, 01bh, 032h, 020h, 081h, 020h, 01bh, 007h, 020h, 028h, 01bh, 083h, 020h, 01bh
        db      081h, 020h, 01bh, 04ah, 029h, 020h, 085h, 00ah, 01bh, 041h, 020h, 0b8h, 02eh, 020h, 020h, 0bch
        db      020h, 03ch, 01bh, 011h, 03eh, 020h, 085h, 020h, 01bh, 0e8h, 00ah, 081h
        db      " deletion "
        db      09ch, 020h, 01bh, 065h, 020h, 085h, 020h, 081h, 00ah, 01bh, 02bh, 020h, 0a7h, 02eh, 00ah, 000h
        db      0bch, 020h, 03ch, 0aah, 03eh, 020h, 085h
        db      " reverse "
        db      081h, 020h, 08fh, 00ah, 0a8h, 020h, 0b8h, 02eh, 020h, 020h, 028h, 083h, 020h, 088h
        db      " affect "
        db      0c2h, 00ah, 01bh, 014h, 020h, 09fh, 020h, 086h, 020h, 01bh, 085h, 020h, 090h, 020h, 08fh, 02eh
        db      029h, 00ah, 0bch, 020h, 03ch, 01bh, 011h, 03eh, 020h, 085h, 020h, 01bh, 065h, 020h, 085h, 020h
        db      081h, 00ah, 01bh, 02bh, 020h, 0a7h, 02eh, 00ah, 000h, 0bch, 020h, 03ch, 0aah, 03eh, 020h, 085h
        db      020h, 0edh, 020h, 081h, 020h, 01bh, 0a9h, 00ah, 08fh, 02eh, 020h, 020h, 0a3h, 020h, 08fh
        db      " won't "
        db      094h, 020h, 01bh, 0ceh, 020h, 01bh, 083h, 00ah, 0e7h, 020h, 08ah, 020h, 01bh, 009h, 020h, 0ech
        db      020h, 0cch, 020h, 0b9h, 020h, 0a6h, 02eh, 00ah, 000h, 083h, 020h, 08ah
        db      " a tune "
        db      0a9h, 020h, 0ach, 020h, 0f0h, 020h, 092h, 020h, 081h, 00ah, 09fh
        endif
        if      FW_VERSION >= 212
        db      ".  Range "
        db      08ah, 020h, 02dh, 031h, 032h, 030h, 020h, 028h, 02dh, 031h, 032h, 02eh, 030h, 020h, 031h, 02fh
        db      032h, 00ah, 01bh, 04ch, 029h, 020h, 085h, 020h, 02bh, 036h, 030h, 020h, 028h, 02bh, 036h, 02eh
        endif
        if      FW_VERSION = 212
        db      030h, 020h, 031h, 02fh, 032h, 020h, 01bh, 04ch, 029h, 020h, 0a6h, 00ah, 01bh, 0c0h, 020h, 091h
        db      020h, 031h, 02fh, 031h, 030h, 020h, 091h, 020h, 0ebh
        db      " half "
        db      0fch, 02eh, 020h, 01bh, 07fh, 00ah, 09ch, 020h, 0afh, 020h, 02bh, 020h, 085h
        endif
        if      FW_VERSION >= 214
        db      030h, 020h, 031h, 02fh, 032h, 020h, 01bh, 04ch, 029h, 020h, 0a8h, 00ah, 01bh, 0b9h, 020h, 092h
        db      020h, 031h, 02fh, 031h, 030h, 020h, 092h, 020h, 0f0h
        db      " half "
        db      0feh, 02eh, 020h, 01bh, 082h, 00ah, 09eh, 020h, 0afh, 020h, 02bh, 020h, 085h
        endif
        if      FW_VERSION >= 212
        db      " -, turn "
        db      081h
        db      " DATA"
        db      00ah
        db      "CONTROL "
        endif
        if      FW_VERSION = 212
        db      085h, 020h, 081h, 020h, 01bh, 084h
        db      " past zero."
        db      00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 042h, 020h, 032h, 020h, 0deh, 03ah, 020h, 0bdh, 00ah
        db      028h, 081h, 020h, 01bh, 05ah, 020h, 0a1h, 020h, 0ceh, 020h, 081h, 00ah, 0d2h, 020h, 082h, 020h
        db      0b0h, 020h, 099h, 029h, 020h, 09dh, 020h, 01bh, 062h, 00ah, 028h, 061h, 020h, 0f1h, 020h, 0b2h
        db      020h, 091h, 020h, 01bh, 05ah, 020h, 0a1h, 020h, 0aeh, 00ah, 0beh, 020h, 092h, 020h, 08ah, 020h
        endif
        if      FW_VERSION >= 214
        db      085h, 020h, 081h, 020h, 01bh, 08ch
        db      " past zero."
        db      00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 040h, 020h, 032h, 020h, 0deh, 03ah, 020h, 0bfh, 00ah
        db      028h, 081h, 020h, 01bh, 066h, 020h, 0a1h, 020h, 0d0h, 020h, 081h, 00ah, 0d2h, 020h, 082h, 020h
        db      0b0h, 020h, 099h, 029h, 020h, 09ch, 020h, 01bh, 060h, 00ah, 028h, 061h, 020h, 0f4h, 020h, 0b1h
        db      020h, 092h, 020h, 01bh, 066h, 020h, 0a1h, 020h, 0ach, 00ah, 0c2h, 020h, 093h, 020h, 08ah, 020h
        endif
        if      FW_VERSION >= 212
        db      099h
        db      ").Using "
        endif
        if      FW_VERSION = 212
        db      0bdh, 00ah, 0c0h, 020h, 081h, 020h, 01bh, 06ch, 020h, 085h, 020h, 09ch, 020h, 0a3h, 020h, 081h
        db      00ah, 082h, 020h, 08ah, 020h, 0aah, 02eh, 00ah, 000h, 083h, 020h, 08ah
        db      " a separate mono "
        db      0f6h, 020h, 099h, 020h, 0aeh, 00ah, 061h, 06eh, 020h, 01bh, 068h, 020h, 01bh, 0e5h, 020h, 01bh
        db      0b0h, 02ch, 020h, 01bh
        db      "U like "
        db      081h, 020h, 01bh, 068h, 00ah, 0f6h, 020h, 01bh
        db      "F a console.  "
        db      0a8h, 020h, 0b5h
        db      " goes"
        db      00ah, 085h, 020h, 081h, 020h, 01bh, 068h, 020h, 01bh, 0e5h, 020h, 0b5h
        db      " jack.  "
        db      0a8h, 00ah, 0a1h, 020h, 0f8h, 020h, 094h, 020h, 0aah, 020h, 0a6h, 020h, 081h, 020h, 01bh, 04fh
        endif
        if      FW_VERSION >= 214
        db      0bfh, 00ah, 0c5h, 020h, 081h, 020h, 01bh, 07eh, 020h, 085h, 020h, 09eh, 020h, 0a4h, 020h, 081h
        db      00ah, 082h, 020h, 08ah, 020h, 0abh, 02eh, 00ah, 000h, 083h, 020h, 08ah
        db      " a separate mono "
        db      0f7h, 020h, 099h, 020h, 0ach, 00ah, 061h, 06eh, 020h, 01bh
        db      "q send "
        db      01bh, 0c5h, 02ch, 020h, 01bh
        db      "V like "
        db      081h, 020h, 01bh, 071h, 00ah, 0f7h, 020h, 01bh
        db      "6 a console.  "
        db      0a3h, 020h, 0b7h
        db      " goes"
        db      00ah, 085h, 020h, 081h, 020h, 01bh
        db      "q send "
        db      0b7h
        db      " jack.  "
        db      0a3h, 00ah, 0a1h, 020h, 0fbh, 020h, 094h, 020h, 0abh, 020h, 0a8h, 020h, 081h, 020h, 01bh, 05ch
        endif
        if      FW_VERSION >= 212
        db      00ah
        db      "way as "
        db      081h
        db      " Stereo "
        endif
        if      FW_VERSION = 212
        db      0f6h, 02ch, 020h, 01bh, 098h
        db      " there"
        db      00ah, 0b0h, 020h, 01bh, 0e1h
        db      " pans."
        db      00ah, 000h, 083h, 020h, 01bh, 0f6h, 020h, 086h, 020h, 091h, 020h, 081h
        db      " 8 separate"
        db      00ah, 01bh, 037h, 020h, 081h, 020h, 0a5h, 020h, 088h, 020h, 0c1h, 020h, 01bh, 0bfh, 02eh, 00ah
        db      01bh, 07fh
        db      " assign "
        db      081h, 020h, 0a5h, 020h, 085h
        db      " an "
        db      0b5h, 02ch, 020h, 01bh, 016h, 00ah, 031h, 02dh, 038h, 020h, 085h, 020h, 08bh, 020h, 01bh, 037h
        db      020h, 031h, 02dh, 038h, 02ch, 020h, 0b4h, 020h, 030h, 020h, 01bh, 080h, 020h, 01bh, 0e1h, 00ah
        db      0b5h, 020h, 08ah, 020h, 01bh
        db      "@.  Each "
        db      0b5h, 020h, 0f8h, 00ah, 0c1h, 020h, 01bh, 067h, 020h, 0b4h, 020h, 0beh, 020h, 091h, 020h, 081h
        db      020h, 033h, 032h, 020h, 09fh, 02eh, 020h, 020h, 0a8h, 00ah, 0a1h, 020h, 0b0h, 020h, 01bh, 059h
        db      020h, 0a6h, 020h, 081h, 020h, 01bh, 0dah, 020h, 08dh, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h
        db      09ah, 020h, 086h, 020h, 091h, 020h, 081h
        db      " two"
        db      00ah, 0c3h, 020h, 0efh, 020h, 01bh, 093h, 020h, 088h, 020h, 094h, 020h, 099h, 020h, 085h, 00ah
        db      0f5h, 020h, 098h, 020h, 0afh, 020h, 081h, 020h, 0cch, 00ah, 01bh, 007h, 02eh, 00ah, 000h, 083h
        db      020h, 084h, 020h, 09ah, 020h, 086h, 020h, 091h, 020h, 081h
        db      " four"
        db      00ah, 0c3h, 020h, 01bh, 0b6h, 020h, 01bh, 093h, 020h, 088h, 020h, 094h, 020h, 099h, 020h, 085h
        db      020h, 01bh, 0e5h, 00ah, 098h, 020h, 085h, 020h, 081h, 020h, 0cch, 020h, 01bh, 007h, 02eh, 00ah
        db      000h, 01bh, 044h, 020h, 081h
        db      " STANDARD "
        db      01bh, 0a0h, 020h, 0a3h, 020h, 01bh, 00ah, 00ah, 085h
        db      " units supporting "
        db      081h, 020h, 0c3h
        endif
        if      FW_VERSION >= 214
        db      0f7h, 02ch, 020h, 01bh, 098h
        db      " there"
        db      00ah, 0b0h, 020h, 01bh, 0eeh
        db      " pans."
        db      00ah, 000h, 083h
        db      " controls "
        db      086h, 020h, 092h, 020h, 081h
        db      " 8 separate"
        db      00ah, 01bh, 045h, 020h, 081h, 020h, 0a6h, 020h, 088h, 020h, 0c4h, 020h, 01bh, 0adh, 02eh, 00ah
        db      01bh, 082h
        db      " assign "
        db      081h, 020h, 0a6h, 020h, 085h
        db      " an "
        db      0b7h, 02ch, 020h, 01bh, 01fh, 00ah, 031h, 02dh, 038h, 020h, 085h, 020h, 08bh, 020h, 01bh, 045h
        db      020h, 031h, 02dh, 038h, 02ch, 020h, 0b5h, 020h, 030h, 020h, 01bh, 083h, 020h, 01bh, 0eeh, 00ah
        db      0b7h, 020h, 08ah, 020h, 01bh, 049h, 02eh, 020h, 020h, 01bh, 0edh, 020h, 0b7h, 020h, 0fbh, 00ah
        db      0c4h, 020h, 01bh, 081h, 020h, 0b5h, 020h, 0c2h, 020h, 092h, 020h, 081h, 020h, 033h, 032h, 020h
        db      09fh, 02eh, 020h, 020h, 0a3h, 00ah, 0a1h, 020h, 0b0h, 020h, 01bh, 05fh, 020h, 0a8h, 020h, 081h
        db      020h, 01bh, 0d1h, 020h, 08dh, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 09bh, 020h, 086h, 020h
        db      092h, 020h, 081h
        db      " two"
        db      00ah, 0c8h, 020h, 0f2h, 020h, 01bh, 09ch, 020h, 088h, 020h, 094h, 020h, 099h, 020h, 085h, 00ah
        db      0f8h, 020h, 096h, 020h, 0afh, 020h, 081h, 020h, 0cfh, 00ah, 01bh, 004h, 02eh, 00ah, 000h, 083h
        db      020h, 084h, 020h, 09bh, 020h, 086h, 020h, 092h, 020h, 081h
        db      " four"
        db      00ah, 0c8h, 020h, 01bh, 0b0h, 020h, 01bh, 09ch, 020h, 088h, 020h, 094h, 020h, 099h, 020h, 085h
        db      " send"
        db      00ah, 096h, 020h, 085h, 020h, 081h, 020h, 0cfh, 020h, 01bh, 004h, 02eh, 00ah, 000h, 01bh, 02dh
        db      020h, 081h
        db      " STANDARD "
        db      01bh, 021h, 020h, 0a4h, 020h, 0e6h, 00ah, 085h
        db      " units supporting "
        db      081h, 020h, 0c8h
        endif
        if      FW_VERSION >= 212
        db      " Sample"
        db      00ah
        db      "Dump Standard.  "
        endif
        if      FW_VERSION = 212
        db      01bh, 044h, 020h, 081h, 020h, 053h, 039h, 030h, 030h, 020h, 01bh, 0a0h, 00ah, 0a3h
        db      " communicating "
        db      0f0h, 020h, 081h
        db      " Akai S900"
        db      00ah, 01bh, 007h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 08ah, 020h, 099h, 020h, 085h, 020h
        db      08bh, 020h, 081h, 020h, 0a5h, 00ah, 086h, 020h, 088h, 020h, 094h, 020h, 01bh, 04eh, 020h, 0d0h
        db      02eh, 020h, 020h, 01bh, 044h, 020h, 02bh, 02ch, 020h, 02dh, 00ah, 0b4h, 020h, 081h, 020h, 098h
        db      " knob "
        db      085h, 020h, 08bh, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 099h, 020h, 081h, 020h, 08eh
        db      020h, 086h, 020h, 08ah, 00ah, 0c5h, 020h, 0e9h, 020h, 0d0h, 020h, 081h, 020h, 0a5h, 00ah, 097h
        db      020h, 085h, 020h, 081h, 020h, 01bh, 084h, 02eh, 020h, 01bh
        db      "S a "
        db      0dbh
        db      " dump"
        db      00ah, 08ah, 020h, 01bh, 04eh, 02ch, 020h, 08fh, 020h, 08eh, 020h, 088h, 020h, 094h, 00ah
        db      "replaced "
        db      01bh, 06bh, 020h, 081h, 020h, 0ech, 020h, 08eh, 020h, 01bh, 04eh, 02eh, 00ah, 000h, 083h, 020h
        db      084h, 020h, 08ah, 020h, 099h, 020h, 085h, 020h, 08bh, 020h, 086h, 020h, 0ffh, 00ah, 095h, 020h
        db      081h, 020h, 022h
        db      "dump request"
        db      022h, 020h, 01bh, 0c2h, 020h, 088h, 00ah, 094h, 020h, 01bh, 03ch, 020h, 01bh, 046h, 02eh, 020h
        db      083h, 020h, 087h, 020h, 01bh, 038h, 020h, 01bh, 09bh, 00ah, 081h, 020h, 0f5h, 020h, 095h, 020h
        db      091h, 020h, 081h, 020h, 01bh, 007h, 00ah, 086h, 020h, 088h, 020h, 094h
        db      " sending "
        db      081h, 020h, 0dbh
        endif
        if      FW_VERSION >= 214
        db      01bh, 02dh, 020h, 081h, 020h, 053h, 039h, 030h, 030h, 020h, 01bh, 021h, 00ah, 0a4h
        db      " communicating "
        db      0f3h, 020h, 081h
        db      " Akai S900"
        db      00ah, 01bh, 004h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 08ah, 020h, 099h, 020h, 085h, 020h
        db      08bh, 020h, 081h, 020h, 0a6h, 00ah, 086h, 020h, 088h, 020h, 094h, 020h, 01bh, 051h, 020h, 0cch
        db      02eh, 020h, 020h, 01bh, 02dh, 020h, 02bh, 02ch, 020h, 02dh, 00ah, 0b5h, 020h, 081h, 020h, 096h
        db      " knob "
        db      085h, 020h, 08bh, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 096h, 020h, 081h, 020h, 08fh
        db      020h, 086h, 020h, 08ah, 00ah, 0cah, 020h, 0ech, 020h, 0cch, 020h, 081h, 020h, 0a6h, 00ah, 098h
        db      020h, 085h, 020h, 081h, 020h, 01bh, 08ch, 02eh, 020h, 01bh
        db      "U a "
        db      0dah
        db      " dump"
        db      00ah, 08ah, 020h, 01bh, 051h, 02ch, 020h, 090h, 020h, 08fh, 020h, 088h, 020h, 094h, 00ah
        db      "replaced "
        db      01bh, 07ch, 020h, 081h, 020h, 0eah, 020h, 08fh, 020h, 01bh, 051h, 02eh, 00ah, 000h, 083h, 020h
        db      084h, 020h, 08ah, 020h, 099h, 020h, 085h, 020h, 08bh, 020h, 086h, 020h, 01bh, 003h, 00ah, 095h
        db      020h, 081h, 020h, 022h
        db      "dump request"
        db      022h, 020h, 01bh, 0c4h, 020h, 088h, 00ah, 094h, 020h, 01bh, 046h, 020h, 01bh, 036h, 02eh, 020h
        db      083h, 020h, 087h, 020h, 01bh, 04bh, 020h, 01bh, 09dh, 00ah, 081h, 020h, 0f8h, 020h, 095h, 020h
        db      092h, 020h, 081h, 020h, 01bh, 004h, 00ah, 086h, 020h, 088h, 020h, 094h
        db      " sending "
        db      081h, 020h, 0dah
        endif
        if      FW_VERSION >= 212
        db      " dump."
        db      00ah, 000h, 083h, 020h, 084h, 020h, 08ah, 020h, 099h, 020h, 085h, 020h, 08bh, 020h, 086h, 00ah
        endif
        if      FW_VERSION = 212
        db      0dbh, 020h, 088h, 020h, 094h, 020h, 01bh, 03ch, 020h, 0afh, 020h, 081h, 020h, 0cch, 00ah, 01bh
        db      007h, 02eh, 020h, 01bh, 082h, 020h, 08fh, 020h, 087h, 020h, 085h, 020h, 081h, 020h, 087h, 00ah
        db      091h, 020h, 081h, 020h, 0dbh, 020h, 028h, 0a6h, 020h, 081h, 020h, 0cch, 020h, 01bh, 007h, 029h
        db      00ah, 086h, 020h, 0cbh, 020h, 01bh, 006h, 020h, 0eeh, 020h, 085h, 020h, 01bh, 0e5h, 02eh, 00ah
        db      000h, 083h, 020h, 084h, 020h, 08ah, 020h, 099h, 020h, 085h, 020h, 0b2h, 020h, 081h, 020h, 0ffh
        db      00ah, 095h, 020h, 01bh, 0bch, 020h, 086h, 020h, 081h, 020h, 0dbh
        db      " dump "
        db      088h, 00ah, 094h, 020h, 01bh, 03ch, 02eh, 020h, 083h, 020h, 01bh, 038h, 020h, 01bh, 09bh, 020h
        db      081h, 020h, 0cch, 00ah, 01bh, 007h, 027h, 073h, 020h, 0ffh, 020h, 0f5h, 020h, 095h, 02eh, 00ah
        db      000h, 083h, 020h, 084h, 020h, 08ah, 020h, 099h, 020h, 085h, 020h, 08bh, 020h, 081h, 020h, 0a5h
        db      00ah, 0c4h, 020h, 081h, 020h, 08eh, 020h, 086h, 020h, 088h, 020h, 094h, 00ah, 01bh, 03ch, 020h
        db      0a3h
        db      " <Send> "
        db      08ah, 020h, 09eh, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h, 020h, 08eh, 020h, 086h, 020h
        db      088h, 020h, 094h, 020h, 01bh, 03ch, 00ah, 0a3h
        db      " <Send> "
        db      08ah, 020h, 09eh, 02eh, 020h, 01bh, 07fh, 020h, 08bh, 020h, 061h, 00ah, 01bh, 00dh, 020h, 08eh
        db      02ch, 020h, 09ch, 020h, 081h
        db      " DRUM "
        db      084h, 02ch, 00ah, 085h, 020h, 081h, 020h, 01bh, 084h, 02eh, 00ah, 000h, 0a8h, 020h, 089h, 020h
        db      0a5h, 020h, 088h, 020h, 08eh, 02ch, 020h, 01bh, 026h, 00ah, 01bh, 090h
        db      " full "
        db      01bh, 075h, 020h, 01bh, 02ah, 02ch, 020h, 01bh, 091h, 020h, 061h, 00ah, 01bh, 0edh, 020h, 08ah
        endif
        if      FW_VERSION >= 214
        db      0dah, 020h, 088h, 020h, 094h, 020h, 01bh, 046h, 020h, 0afh, 020h, 081h, 020h, 0cfh, 00ah, 01bh
        db      004h, 02eh, 020h, 01bh, 086h, 020h, 090h, 020h, 087h, 020h, 085h, 020h, 081h, 020h, 087h, 00ah
        db      092h, 020h, 081h, 020h, 0dah, 020h, 028h, 0a8h, 020h, 081h, 020h, 0cfh, 020h, 01bh, 004h, 029h
        db      00ah, 086h, 020h, 0beh, 020h, 0fch, 020h, 0e7h, 020h, 085h
        db      " send."
        db      00ah, 000h, 083h, 020h, 084h, 020h, 08ah, 020h, 099h, 020h, 085h, 020h, 0b1h, 020h, 081h, 020h
        db      01bh, 003h, 00ah, 095h, 020h, 01bh, 0b4h, 020h, 086h, 020h, 081h, 020h, 0dah
        db      " dump "
        db      088h, 00ah, 094h, 020h, 01bh, 046h, 02eh, 020h, 083h, 020h, 01bh, 04bh, 020h, 01bh, 09dh, 020h
        db      081h, 020h, 0cfh, 00ah, 01bh, 004h, 027h, 073h, 020h, 01bh, 003h, 020h, 0f8h, 020h, 095h, 02eh
        db      00ah, 000h, 083h, 020h, 084h, 020h, 08ah, 020h, 099h, 020h, 085h, 020h, 08bh, 020h, 081h, 020h
        db      0a6h, 00ah, 0c7h, 020h, 081h, 020h, 08fh, 020h, 086h, 020h, 088h, 020h, 094h, 00ah, 01bh, 046h
        db      020h, 0a4h
        db      " <Send> "
        db      08ah, 020h, 09dh, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h, 020h, 08fh, 020h, 086h, 020h
        db      088h, 020h, 094h, 020h, 01bh, 046h, 00ah, 0a4h
        db      " <Send> "
        db      08ah, 020h, 09dh, 02eh, 020h, 01bh, 082h, 020h, 08bh, 020h, 061h, 00ah, 01bh, 015h, 020h, 08fh
        db      02ch, 020h, 09eh, 020h, 081h
        db      " DRUM "
        db      084h, 02ch, 00ah, 085h, 020h, 081h, 020h, 01bh, 08ch, 02eh, 00ah, 000h, 0a3h, 020h, 089h, 020h
        db      0a6h, 020h, 088h, 020h, 08fh, 02ch, 020h, 01bh, 02ah, 00ah, 01bh, 090h
        db      " full "
        db      01bh, 07bh, 020h, 01bh, 031h, 02ch, 020h, 01bh, 08dh, 020h, 061h, 00ah, 01bh, 0f7h, 020h, 08ah
        endif
        if      FW_VERSION >= 212
        db      " applied "
        db      085h, 020h, 081h
        db      " SYNC "
        endif
        if      FW_VERSION = 212
        db      0efh, 02ch, 00ah
        db      "but "
        db      01bh, 01ch, 020h, 01bh, 047h, 020h, 08fh, 020h, 0adh, 020h, 08ah
        db      " showing."
        db      00ah, 01bh, 044h, 020h, 081h
        db      " SYNC INPUT LEVEL "
        db      01bh, 0b5h, 020h, 085h, 00ah
        db      "adjust "
        db      01bh, 0a1h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 042h, 020h, 032h, 020h, 0deh, 03ah
        db      020h, 0bdh, 00ah, 028h, 081h, 020h, 0f6h, 020h, 0a1h, 020h, 0ceh, 020h, 01bh, 019h, 00ah, 082h
        db      020h, 08dh, 020h, 0b0h, 020h, 099h, 029h, 020h, 09dh, 020h, 01bh
        db      "b (a"
        db      00ah, 0f1h, 020h, 0b2h, 020h, 091h, 020h, 0f6h, 020h, 0a1h, 020h, 01bh, 01bh, 020h, 0a6h, 00ah
        db      081h, 020h, 01bh, 0dah, 020h, 08dh, 020h, 08ah, 020h, 099h
        db      ").Using "
        db      0bdh, 00ah, 0c0h, 020h, 081h, 020h, 0a5h, 020h, 01bh, 0b0h, 020h, 085h, 020h, 09ch, 020h, 0a3h
        db      020h, 081h, 00ah, 082h, 020h, 08ah, 020h, 0aah, 02eh, 00ah, 000h, 01bh, 053h, 020h, 08fh, 020h
        db      084h, 020h, 08ah, 020h, 0b2h, 020h, 085h
        db      " YES, "
        db      01bh, 067h, 00ah, 0d1h, 020h, 01bh, 01eh, 020h, 0b0h
        db      " made "
        db      0a6h, 020h, 081h, 020h, 01bh, 05eh, 00ah, 0f6h, 020h, 01bh, 047h, 020h, 0e3h, 020h, 0b4h, 020h
        db      01bh, 095h, 00ah, 088h, 020h, 094h, 020h, 0d5h, 020h, 0d0h, 020h, 081h, 020h, 082h, 020h, 0a6h
        endif
        if      FW_VERSION >= 214
        db      0f2h, 02ch, 00ah
        db      "but "
        db      01bh, 01ch, 020h, 01bh, 054h, 020h, 090h, 020h, 0a7h, 020h, 08ah
        db      " showing."
        db      00ah, 01bh, 02dh, 020h, 081h
        db      " SYNC INPUT LEVEL "
        db      01bh, 0c2h, 020h, 085h, 00ah
        db      "adjust "
        db      01bh, 0a6h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 040h, 020h, 032h, 020h, 0deh, 03ah
        db      020h, 0bfh, 00ah, 028h, 081h, 020h, 0f7h, 020h, 0a1h, 020h, 0d0h, 020h, 01bh, 016h, 00ah, 082h
        db      020h, 08dh, 020h, 0b0h, 020h, 099h, 029h, 020h, 09ch, 020h, 01bh, 060h, 020h, 028h, 061h, 00ah
        db      0f4h, 020h, 0b1h, 020h, 092h, 020h, 0f7h, 020h, 0a1h, 020h, 01bh, 00eh, 020h, 0a8h, 00ah, 081h
        db      020h, 01bh, 0d1h, 020h, 08dh, 020h, 08ah, 020h, 099h
        db      ").Using "
        db      0bfh, 00ah, 0c5h, 020h, 081h, 020h, 0a6h, 020h, 01bh, 0c5h, 020h, 085h, 020h, 09eh, 020h, 0a4h
        db      020h, 081h, 00ah, 082h, 020h, 08ah, 020h, 0abh, 02eh, 00ah, 000h, 01bh, 055h, 020h, 090h, 020h
        db      084h, 020h, 08ah, 020h, 0b1h, 020h, 085h
        db      " YES, "
        db      01bh, 081h, 00ah, 0d3h, 020h, 01bh, 017h, 020h, 0b0h
        db      " made "
        db      0a8h, 020h, 081h, 020h, 01bh, 062h, 00ah, 0f7h, 020h, 01bh, 054h, 020h, 0e3h, 020h, 0b5h, 020h
        db      01bh, 0a5h, 00ah, 088h, 020h, 094h, 020h, 0d7h, 020h, 0cch, 020h, 081h, 020h, 082h, 020h, 0a8h
        endif
        if      FW_VERSION >= 212
        db      00ah
        db      "real "
        endif
        if      FW_VERSION = 212
        db      0eah, 02ch, 020h, 01bh
        db      "U like an "
        db      01bh, 0cah, 00ah, 0f6h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 042h, 020h, 032h, 020h
        db      0deh, 03ah, 020h, 0bdh, 00ah, 028h, 081h, 020h, 01bh, 068h, 020h, 0f6h, 020h, 0a1h, 020h, 0ceh
        db      020h, 01bh, 019h, 00ah, 082h, 020h, 08dh, 020h, 0b0h, 020h, 099h, 029h, 020h, 09dh, 020h, 01bh
        db      "b (a"
        db      00ah, 0f1h, 020h, 0b2h, 020h, 091h, 020h, 01bh, 068h, 020h, 0f6h, 020h, 0a1h, 00ah, 01bh, 01bh
        db      020h, 0a6h, 020h, 081h, 020h, 01bh, 0dah, 020h, 08dh, 020h, 08ah, 020h, 099h
        db      ").  Using"
        db      00ah, 0bdh, 020h, 0c0h, 020h, 081h, 020h, 01bh, 068h, 020h, 01bh, 0b0h, 020h, 085h, 020h, 09ch
        db      00ah, 0a3h, 020h, 081h, 020h, 082h, 020h, 08ah, 020h, 0aah, 02eh, 00ah, 000h, 01bh, 053h, 020h
        db      08fh, 020h, 084h, 020h, 08ah, 020h, 0b2h, 020h, 085h
        db      " YES, "
        db      01bh, 067h, 00ah, 0d1h, 020h, 01bh, 01eh, 020h, 0b0h
        db      " made "
        db      0a6h, 020h, 081h, 020h, 01bh, 068h, 00ah, 0f6h, 020h, 01bh, 047h, 020h, 0e3h, 020h, 0b4h, 020h
        db      01bh, 095h, 00ah, 088h, 020h, 094h, 020h, 0d5h, 020h, 0d0h, 020h, 081h, 020h, 082h, 020h, 0a6h
        endif
        if      FW_VERSION >= 214
        db      0e1h, 02ch, 020h, 01bh
        db      "V like an "
        db      01bh, 0d7h, 00ah, 0f7h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 040h, 020h, 032h, 020h
        db      0deh, 03ah, 020h, 0bfh, 00ah, 028h, 081h, 020h, 01bh, 071h, 020h, 0f7h, 020h, 0a1h, 020h, 0d0h
        db      020h, 01bh, 016h, 00ah, 082h, 020h, 08dh, 020h, 0b0h, 020h, 099h, 029h, 020h, 09ch, 020h, 01bh
        db      060h, 020h, 028h, 061h, 00ah, 0f4h, 020h, 0b1h, 020h, 092h, 020h, 01bh, 071h, 020h, 0f7h, 020h
        db      0a1h, 00ah, 01bh, 00eh, 020h, 0a8h, 020h, 081h, 020h, 01bh, 0d1h, 020h, 08dh, 020h, 08ah, 020h
        db      099h
        db      ").  Using"
        db      00ah, 0bfh, 020h, 0c5h, 020h, 081h, 020h, 01bh, 071h, 020h, 01bh, 0c5h, 020h, 085h, 020h, 09eh
        db      00ah, 0a4h, 020h, 081h, 020h, 082h, 020h, 08ah, 020h, 0abh, 02eh, 00ah, 000h, 01bh, 055h, 020h
        db      090h, 020h, 084h, 020h, 08ah, 020h, 0b1h, 020h, 085h
        db      " YES, "
        db      01bh, 081h, 00ah, 0d3h, 020h, 01bh, 017h, 020h, 0b0h
        db      " made "
        db      0a8h, 020h, 081h, 020h, 01bh, 071h, 00ah, 0f7h, 020h, 01bh, 054h, 020h, 0e3h, 020h, 0b5h, 020h
        db      01bh, 0a5h, 00ah, 088h, 020h, 094h, 020h, 0d7h, 020h, 0cch, 020h, 081h, 020h, 082h, 020h, 0a8h
        endif
        if      FW_VERSION >= 212
        db      00ah
        db      "real "
        endif
        if      FW_VERSION = 212
        db      0eah, 02ch, 020h, 01bh
        db      "U like an "
        db      01bh, 0cah, 00ah, 0f6h, 02eh, 00ah, 000h
        db      "Depending "
        db      01bh, 046h, 020h, 081h, 020h, 0a9h, 020h, 091h, 020h, 081h
        endif
        if      FW_VERSION >= 214
        db      0e1h, 02ch, 020h, 01bh
        db      "V like an "
        db      01bh, 0d7h, 00ah, 0f7h, 02eh, 00ah, 000h
        db      "Depending "
        db      01bh, 036h, 020h, 081h, 020h, 0a9h, 020h, 092h, 020h, 081h
        endif
        if      FW_VERSION >= 212
        db      " HIHAT"
        db      00ah
        db      "SLIDER, "
        endif
        if      FW_VERSION = 212
        db      0ebh, 020h, 091h
        db      " 3 hihat "
        db      01bh, 03dh, 020h, 088h, 00ah, 0c1h
        db      ": CLOSED, "
        db      01bh, 0f0h, 020h, 0b4h
        db      " OPEN. "
        db      01bh, 01dh, 00ah, 0b6h, 020h, 0b2h, 020h, 081h
        db      " 3 ranges "
        db      091h, 020h, 081h, 020h, 031h, 032h, 037h, 020h, 0fch, 00ah
        endif
        if      FW_VERSION >= 214
        db      0f0h, 020h, 092h
        db      " 3 hihat "
        db      01bh, 03ch, 020h, 088h, 00ah, 0c4h
        db      ": CLOSED, "
        db      01bh, 0f9h, 020h, 0b5h
        db      " OPEN. "
        db      01bh, 01ah, 00ah, 0b6h, 020h, 0b1h, 020h, 081h
        db      " 3 ranges "
        db      092h, 020h, 081h, 020h, 031h, 032h, 037h, 020h, 0feh, 00ah
        endif
        if      FW_VERSION >= 212
        db      "slider "
        db      01bh
        endif
        if      FW_VERSION = 212
        db      "k 2 dividing thresholds:"
        endif
        if      FW_VERSION >= 214
        db      "| 2 dividing thresholds:"
        endif
        if      FW_VERSION >= 212
        db      00ah
        db      "CLOSED/"
        endif
        if      FW_VERSION = 212
        db      01bh, 0f0h, 020h, 09dh, 020h, 01bh, 0f0h
        endif
        if      FW_VERSION >= 214
        db      01bh, 0f9h, 020h, 09ch, 020h, 01bh, 0f9h
        endif
        if      FW_VERSION >= 212
        db      "/OPEN."
        db      00ah, 000h, 083h, 020h, 08ah, 020h, 081h
        db      " MIDI Controller "
        endif
        if      FW_VERSION = 212
        db      087h, 020h, 028h, 020h, 030h, 00ah, 02dh, 020h, 031h, 032h, 037h, 020h, 029h, 020h, 01bh, 0bch
        endif
        if      FW_VERSION >= 214
        db      087h, 020h, 028h, 020h, 030h, 00ah, 02dh, 020h, 031h, 032h, 037h, 020h, 029h, 020h, 01bh, 0b4h
        endif
        if      FW_VERSION >= 212
        db      020h, 086h, 020h, 081h
        db      " HiHat decay"
        db      00ah
        db      "slider "
        endif
        if      FW_VERSION = 212
        db      098h, 020h, 08ah, 020h, 01bh, 03ch, 020h, 09dh, 020h, 01bh, 04eh, 02eh, 00ah
        db      "Normally "
        db      08fh, 020h, 01bh, 038h, 020h, 094h, 020h, 0b2h, 020h, 085h, 020h, 032h, 030h, 02eh, 020h, 020h
        db      01bh, 07fh, 00ah, 01bh, 0b5h, 020h, 0eeh, 020h, 0afh, 020h, 061h, 020h, 0cdh
        db      " moduation"
        db      00ah, 01bh, 00bh, 020h, 0b2h, 020h, 0eeh, 020h, 085h, 020h, 031h, 02eh, 00ah, 000h, 083h, 020h
        db      09ah, 020h, 081h, 020h, 0a4h, 020h, 091h, 020h, 081h, 020h, 022h, 031h, 036h, 00ah
        endif
        if      FW_VERSION >= 214
        db      096h, 020h, 08ah, 020h, 01bh, 046h, 020h, 09ch, 020h, 01bh, 051h, 02eh, 00ah
        db      "Normally "
        db      090h, 020h, 01bh, 04bh, 020h, 094h, 020h, 0b1h, 020h, 085h, 020h, 032h, 030h, 02eh, 020h, 020h
        db      01bh, 082h, 00ah, 01bh, 0c2h, 020h, 0e7h, 020h, 0afh, 020h, 061h, 020h, 0ceh
        db      " moduation"
        db      00ah, 0f9h, 020h, 0b1h, 020h, 0e7h, 020h, 085h, 020h, 031h, 02eh, 00ah, 000h, 083h, 020h, 09bh
        db      020h, 081h, 020h, 0a5h, 020h, 092h, 020h, 081h, 020h, 022h, 031h, 036h, 00ah
        endif
        if      FW_VERSION >= 212
        db      "LEVELS"
        db      022h
        db      " key.  "
        endif
        if      FW_VERSION = 212
        db      0a8h, 020h, 0deh, 020h, 0b0h, 020h, 022h, 031h, 036h, 00ah
        db      "VOLUMES"
        db      022h, 020h, 028h, 061h, 020h, 0f1h, 020h, 0a5h, 020h, 01bh, 00eh, 020h, 01bh, 090h, 020h, 031h
        endif
        if      FW_VERSION >= 214
        db      0a3h, 020h, 0deh, 020h, 0b0h, 020h, 022h, 031h, 036h, 00ah
        db      "VOLUMES"
        db      022h, 020h, 028h, 061h, 020h, 0f4h, 020h, 0a6h, 020h, 01bh, 010h, 020h, 01bh, 090h, 020h, 031h
        endif
        if      FW_VERSION >= 212
        db      036h, 00ah
        db      "fixed "
        db      01bh
        endif
        if      FW_VERSION = 212
        db      "u levels "
        endif
        if      FW_VERSION >= 214
        db      "{ levels "
        endif
        if      FW_VERSION >= 212
        db      0afh, 020h, 081h
        db      " 16 pads)"
        endif
        if      FW_VERSION = 212
        db      00ah, 0b4h, 020h, 022h
        db      "16 TUNINGS"
        db      022h, 020h, 028h, 061h, 020h, 0f1h, 020h, 0a5h, 020h, 01bh, 00eh, 00ah, 01bh, 090h, 020h, 031h
        db      036h, 020h, 01bh, 06ch, 020h, 0afh, 020h, 081h
        db      " 16 pads)."
        db      00ah, 000h, 0bfh, 020h, 0ebh, 020h, 091h, 020h, 081h, 020h, 097h, 020h, 0deh, 020h, 01bh, 06bh
        db      00ah, 01bh, 0eeh, 020h, 061h, 020h, 087h, 02eh, 00ah, 000h, 01bh, 07fh
        db      " remotely "
        db      0c1h, 020h, 081h, 020h, 01bh, 08ah, 020h, 09fh, 00ah, 0afh, 020h, 081h, 020h, 0ffh, 020h, 0cdh
        db      02ch, 020h, 08bh, 020h, 061h, 00ah, 022h, 09fh, 022h, 020h, 08ch, 020h, 09dh, 020h, 0b2h, 020h
        db      08fh, 020h, 084h, 020h, 085h, 00ah
        db      "ON.  "
        db      01bh, 07fh, 020h, 0f5h, 020h, 01bh, 046h, 020h, 01bh, 01ch, 020h, 081h, 020h, 09fh, 00ah, 095h
        db      " (OMNI "
        db      01bh, 0fch, 029h, 02ch, 020h, 08bh, 020h, 061h, 00ah, 022h
        db      "non-"
        db      09fh, 022h, 020h, 08ch, 020h, 0a6h, 020h, 081h
        db      " PLAY/"
        db      01bh, 0ech, 00ah, 0adh, 02eh, 00ah, 000h, 01bh, 07fh
        db      " decide "
        db      086h, 020h, 0e1h, 020h, 0ffh, 020h, 0c2h, 00ah
        db      "numbers "
        db      0c1h, 020h, 086h, 020h, 09fh, 02ch, 020h, 0b2h, 020h, 081h, 00ah, 022h
        db      "Incoming "
        db      0c2h, 022h, 020h, 085h, 020h, 081h, 020h, 0c2h, 020h, 087h, 020h, 0cbh, 00ah, 01bh, 006h, 020h
        db      085h, 020h, 0b2h, 020h, 028h, 0b4h, 020h, 093h, 020h, 061h, 020h, 0cdh
        db      " key),"
        db      00ah, 0bah, 020h, 08bh, 020h, 081h, 020h, 0a5h, 020h, 0cbh, 020h, 01bh, 006h, 020h, 0eeh, 020h
        db      085h, 00ah, 0c1h, 020h, 0a6h, 020h, 081h, 020h, 022h
        db      "Plays"
        db      022h, 020h, 084h, 02eh, 00ah, 000h, 083h, 020h, 09ah, 020h, 086h, 020h, 0a5h, 020h, 098h, 020h
        db      08ah, 020h, 01bh, 03ch, 00ah, 01bh, 0b6h, 020h, 01bh, 0bch, 020h, 0c3h, 02eh, 020h, 020h, 022h
        endif
        if      FW_VERSION >= 214
        db      00ah, 0b5h, 020h, 022h
        db      "16 TUNINGS"
        db      022h, 020h, 028h, 061h, 020h, 0f4h, 020h, 0a6h, 020h, 01bh, 010h, 00ah, 01bh, 090h, 020h, 031h
        db      036h, 020h, 01bh, 07eh, 020h, 0afh, 020h, 081h
        db      " 16 pads)."
        db      00ah, 000h, 0bdh, 020h, 0f0h, 020h, 092h, 020h, 081h, 020h, 098h, 020h, 0deh, 020h, 01bh, 07ch
        db      00ah, 01bh, 0ffh, 020h, 061h, 020h, 087h, 02eh, 00ah, 000h, 01bh, 082h
        db      " remotely "
        db      0c4h, 020h, 081h, 020h, 01bh, 087h, 020h, 09fh, 00ah, 0afh, 020h, 081h, 020h, 01bh, 003h, 020h
        db      0ceh, 02ch, 020h, 08bh, 020h, 061h, 00ah, 022h, 09fh, 022h, 020h, 08eh, 020h, 09ch, 020h, 0b1h
        db      020h, 090h, 020h, 084h, 020h, 085h, 00ah
        db      "ON.  "
        db      01bh, 082h, 020h, 0f8h, 020h, 01bh, 036h, 020h, 01bh, 01ch, 020h, 081h, 020h, 09fh, 00ah, 095h
        db      " (OMNI off), "
        db      08bh, 020h, 061h, 00ah, 022h
        db      "non-"
        db      09fh, 022h, 020h, 08eh, 020h, 0a8h, 020h, 081h
        db      " PLAY/"
        db      01bh, 0f3h, 00ah, 0a7h, 02eh, 00ah, 000h, 01bh, 082h
        db      " decide "
        db      086h, 020h, 0e5h, 020h, 01bh, 003h, 020h, 0c3h, 00ah
        db      "numbers "
        db      0c4h, 020h, 086h, 020h, 09fh, 02ch, 020h, 0b1h, 020h, 081h, 00ah, 022h
        db      "Incoming "
        db      0c3h, 022h, 020h, 085h, 020h, 081h, 020h, 0c3h, 020h, 087h, 020h, 0beh, 00ah, 0fch, 020h, 085h
        db      020h, 0b1h, 020h, 028h, 0b5h, 020h, 091h, 020h, 061h, 020h, 0ceh
        db      " key),"
        db      00ah, 0b4h, 020h, 08bh, 020h, 081h, 020h, 0a6h, 020h, 0beh, 020h, 0fch, 020h, 0e7h, 020h, 085h
        db      00ah, 0c4h, 020h, 0a8h, 020h, 081h, 020h, 022h
        db      "Plays"
        db      022h, 020h, 084h, 02eh, 00ah, 000h, 083h, 020h, 09bh, 020h, 086h, 020h, 0a6h, 020h, 096h, 020h
        db      08ah, 020h, 01bh, 046h, 00ah, 01bh, 0b0h, 020h, 01bh, 0b4h, 020h, 0c8h, 02eh, 020h, 020h, 022h
        endif
        if      FW_VERSION >= 212
        db      "NONE"
        db      022h
        db      " sends nothing,"
        endif
        if      FW_VERSION = 212
        db      00ah, 09dh, 020h, 08ah
        db      " best "
        db      0aeh
        db      " fastest "
        db      01bh, 02ch, 03bh, 00ah, 022h
        db      "NOTES "
        db      01bh, 0ebh, 022h
        db      " sends "
        db      01bh, 0b6h, 020h, 0c2h
        db      " commands"
        db      00ah, 0a3h, 020h, 09fh, 020h, 0c1h, 020h, 0a6h, 020h, 092h, 03bh, 020h, 09dh, 00ah, 022h, 01bh
        db      0e8h
        db      "/MIX/TUNE"
        db      022h, 020h, 01bh, 004h
        db      " sends "
        db      0d1h, 020h, 0a6h, 00ah, 081h, 020h, 01bh, 05eh, 020h, 01bh, 0b0h, 02ch, 020h, 01bh, 068h, 020h
        db      01bh, 0b0h, 02ch, 020h, 0b4h, 020h, 01bh, 06ch, 02eh, 00ah, 000h, 01bh, 01dh, 020h, 032h, 020h
        db      0b6h, 020h, 0b0h, 020h, 099h, 020h, 0a3h, 020h, 01bh, 0c3h, 00ah, 0cch
        db      " synths "
        db      0afh, 020h, 081h, 020h, 01bh, 08ah, 00ah, 09fh, 020h, 085h, 020h, 0b2h, 020h, 086h, 020h, 09fh
        db      020h, 0c1h, 020h, 086h, 00ah, 0c2h
        db      " numbers.  "
        db      01bh, 082h, 020h, 081h, 020h, 022h
        db      "Outgoing "
        db      0a5h, 022h, 00ah, 084h, 020h, 085h, 020h, 081h, 020h, 0a5h, 020h, 0cbh, 020h, 01bh, 006h, 020h
        db      085h, 020h, 0b2h, 02ch, 00ah, 0bah, 020h, 08bh, 020h, 081h, 020h, 0c2h, 020h, 087h, 020h, 0cbh
        db      020h, 01bh, 006h, 00ah, 0eeh, 020h, 085h, 020h, 0c1h, 020h, 0a6h, 020h, 081h, 020h, 022h
        db      "Plays "
        db      0c2h, 022h, 020h, 084h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 000h, 020h, 081h, 020h
        db      0ffh, 020h, 0f5h, 00ah, 095h, 020h, 0aeh, 020h, 081h, 020h, 01bh, 08ah, 020h, 09fh
        db      ".  Any"
        db      00ah, 08ch, 020h, 0b2h, 020h, 085h, 020h, 08fh, 020h, 095h, 020h, 08ah, 020h, 061h, 020h, 022h
        db      09fh, 022h, 00ah, 08ch, 02eh, 020h, 020h, 01bh, 07fh, 020h, 0c1h, 020h, 081h, 020h, 09fh, 020h
        db      0afh, 020h, 061h, 06eh, 00ah, 0cch
        db      " source "
        db      01bh, 046h, 020h, 08fh, 020h, 095h, 020h, 01bh, 01ch, 02ch, 00ah, 08bh, 020h, 061h, 020h, 022h
        db      "non-"
        db      09fh, 022h, 020h, 08ch, 020h, 0a6h, 020h, 081h, 00ah
        db      "PLAY/"
        db      01bh, 0ech, 020h, 0adh, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 09ah, 020h, 086h, 020h, 091h
        endif
        if      FW_VERSION >= 214
        db      00ah, 09ch, 020h, 08ah
        db      " best "
        db      0ach
        db      " fastest "
        db      01bh, 034h, 03bh, 00ah, 022h
        db      "NOTES "
        db      01bh, 0e9h, 022h
        db      " sends "
        db      01bh, 0b0h, 020h, 0c3h
        db      " commands"
        db      00ah, 0a4h, 020h, 09fh, 020h, 0c4h, 020h, 0a8h, 020h, 093h, 03bh, 020h, 09ch, 00ah, 022h, 01bh
        db      0f8h
        db      "/MIX/TUNE"
        db      022h, 020h, 01bh, 009h
        db      " sends "
        db      0d3h, 020h, 0a8h, 00ah, 081h, 020h, 01bh, 062h, 020h, 01bh, 0c5h, 02ch, 020h, 01bh, 071h, 020h
        db      01bh, 0c5h, 02ch, 020h, 0b5h, 020h, 01bh, 07eh, 02eh, 00ah, 000h, 01bh, 01ah, 020h, 032h, 020h
        db      0b6h, 020h, 0b0h, 020h, 099h, 020h, 0a4h, 020h, 01bh, 0bbh, 00ah, 0cfh
        db      " synths "
        db      0afh, 020h, 081h, 020h, 01bh, 087h, 00ah, 09fh, 020h, 085h, 020h, 0b1h, 020h, 086h, 020h, 09fh
        db      020h, 0c4h, 020h, 086h, 00ah, 0c3h
        db      " numbers.  "
        db      01bh, 086h, 020h, 081h, 020h, 022h
        db      "Outgoing "
        db      0a6h, 022h, 00ah, 084h, 020h, 085h, 020h, 081h, 020h, 0a6h, 020h, 0beh, 020h, 0fch, 020h, 085h
        db      020h, 0b1h, 02ch, 00ah, 0b4h, 020h, 08bh, 020h, 081h, 020h, 0c3h, 020h, 087h, 020h, 0beh, 020h
        db      0fch, 00ah, 0e7h, 020h, 085h, 020h, 0c4h, 020h, 0a8h, 020h, 081h, 020h, 022h
        db      "Plays "
        db      0c3h, 022h, 020h, 084h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 006h, 020h, 081h, 020h
        db      01bh, 003h, 020h, 0f8h, 00ah, 095h, 020h, 0ach, 020h, 081h, 020h, 01bh, 087h, 020h, 09fh
        db      ".  Any"
        db      00ah, 08eh, 020h, 0b1h, 020h, 085h, 020h, 090h, 020h, 095h, 020h, 08ah, 020h, 061h, 020h, 022h
        db      09fh, 022h, 00ah, 08eh, 02eh, 020h, 020h, 01bh, 082h, 020h, 0c4h, 020h, 081h, 020h, 09fh, 020h
        db      0afh, 020h, 061h, 06eh, 00ah, 0cfh
        db      " source "
        db      01bh, 036h, 020h, 090h, 020h, 095h, 020h, 01bh, 01ch, 02ch, 00ah, 08bh, 020h, 061h, 020h, 022h
        db      "non-"
        db      09fh, 022h, 020h, 08eh, 020h, 0a8h, 020h, 081h, 00ah
        db      "PLAY/"
        db      01bh, 0f3h, 020h, 0a7h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 09bh, 020h, 086h, 020h, 092h
        endif
        if      FW_VERSION >= 212
        db      020h, 081h, 00ah
        db      "MPC60's 2 "
        endif
        if      FW_VERSION = 212
        db      0ffh
        db      " inputs "
        db      08ah, 020h, 01bh, 00ah, 020h, 085h, 00ah, 081h, 020h, 0b5h, 020h, 091h, 020h, 081h
        db      " ME-35T."
        db      00ah, 000h, 083h, 020h, 084h, 020h, 08bh, 020h, 086h, 020h, 091h, 020h, 081h
        db      " MPC60's"
        db      00ah, 034h, 020h, 0ffh, 020h, 01bh, 037h, 020h, 08ah, 020h, 01bh, 00ah, 020h, 085h, 020h, 081h
        db      00ah, 0efh, 020h, 091h, 020h, 081h
        endif
        if      FW_VERSION >= 214
        db      01bh, 003h
        db      " inputs "
        db      08ah, 020h, 0e6h, 020h, 085h, 00ah, 081h, 020h, 0b7h, 020h, 092h, 020h, 081h
        db      " ME-35T."
        db      00ah, 000h, 083h, 020h, 084h, 020h, 08bh, 020h, 086h, 020h, 092h, 020h, 081h
        db      " MPC60's"
        db      00ah, 034h, 020h, 01bh, 003h, 020h, 01bh, 045h, 020h, 08ah, 020h, 0e6h, 020h, 085h, 020h, 081h
        db      00ah, 0f2h, 020h, 092h, 020h, 081h
        endif
        if      FW_VERSION >= 212
        db      " ME-35T."
        db      00ah, 000h
        db      "Two ME-35T units "
        endif
        if      FW_VERSION = 212
        db      0f8h, 020h, 094h, 020h, 01bh, 00ah, 020h, 01bh, 090h, 00ah, 01bh, 0f2h, 02eh, 020h, 083h, 020h
        db      084h, 020h, 09ah, 020h, 086h
        db      " unit"
        db      00ah, 08ah, 020h, 0c5h, 020h, 01bh, 0a5h
        db      " edited. All "
        db      01bh, 011h, 00ah, 0b6h, 020h, 0a6h, 020h, 08fh, 020h, 0adh
        db      " refer "
        db      085h, 020h, 081h, 020h, 098h, 00ah, 0a6h, 020h, 081h, 020h, 089h
        db      " unit."
        db      00ah, 000h, 083h, 020h, 01bh, 038h, 020h, 094h, 020h, 0b2h, 020h, 085h, 020h, 081h, 020h, 01bh
        db      04fh, 020h, 095h, 00ah, 061h, 073h, 020h, 081h, 020h, 089h
        endif
        if      FW_VERSION >= 214
        db      0fbh, 020h, 094h, 020h, 0e6h, 020h, 01bh, 090h, 00ah, 01bh, 0c3h, 02eh, 020h, 083h, 020h, 084h
        db      020h, 09bh, 020h, 086h
        db      " unit"
        db      00ah, 08ah, 020h, 0cah, 020h, 01bh, 0a2h
        db      " edited. All "
        db      01bh, 014h, 00ah, 0b6h, 020h, 0a8h, 020h, 090h, 020h, 0a7h
        db      " refer "
        db      085h, 020h, 081h, 020h, 096h, 00ah, 0a8h, 020h, 081h, 020h, 089h
        db      " unit."
        db      00ah, 000h, 083h, 020h, 01bh, 04bh, 020h, 094h, 020h, 0b1h, 020h, 085h, 020h, 081h, 020h, 01bh
        db      05ch, 020h, 095h, 00ah, 061h, 073h, 020h, 081h, 020h, 089h
        endif
        if      FW_VERSION >= 212
        db      " ME-35T unit, "
        db      086h, 020h, 08ah, 00ah
        db      "normally "
        endif
        if      FW_VERSION = 212
        db      0b2h, 020h, 085h, 020h, 027h, 031h, 027h, 02eh, 00ah, 000h, 01bh, 082h, 020h, 08fh, 020h, 084h
        db      020h, 085h, 020h, 081h, 020h, 0efh, 020h, 087h, 00ah, 028h, 031h, 02dh, 038h, 029h, 020h, 0cbh
        db      020h, 01bh, 006h, 020h, 085h, 020h, 01bh, 0b9h, 02eh, 020h, 0a8h, 020h, 0b6h, 00ah
        db      "below "
        db      01bh, 0aah, 020h, 098h, 020h, 0aeh, 020h, 081h, 020h, 089h, 00ah, 0efh, 020h, 01bh, 01ch, 02eh
        db      00ah, 000h, 01bh, 082h, 020h, 08fh, 020h, 084h, 020h, 085h, 020h, 081h, 020h, 0c2h, 020h, 087h
        db      020h, 0cbh, 00ah, 01bh, 006h, 020h, 081h, 020h, 089h, 020h, 0efh, 020h, 085h, 020h, 0c1h, 02eh
        db      020h, 0a8h, 00ah, 0a5h, 020h, 0c5h, 020h, 01bh, 04ah, 020h, 085h, 020h, 081h, 00ah, 097h, 020h
        db      0c2h, 020h, 087h, 020h, 08ah, 020h, 01bh, 06eh, 020h, 085h, 020h, 081h, 00ah, 01bh, 02dh, 020h
        db      0aeh, 020h, 01bh, 03fh, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 000h, 020h, 081h, 020h
        db      01bh, 075h, 020h, 01bh, 0a1h, 00ah, 091h, 020h, 081h, 020h, 089h, 020h, 0efh, 02eh, 020h, 01bh
        db      082h, 020h, 0eeh
        db      " so "
        db      01bh, 01eh, 020h, 061h, 00ah
        db      "hard "
        db      01bh, 0f1h, 020h, 091h, 020h, 081h, 020h, 0efh
        endif
        if      FW_VERSION >= 214
        db      0b1h, 020h, 085h, 020h, 027h, 031h, 027h, 02eh, 00ah, 000h, 01bh, 086h, 020h, 090h, 020h, 084h
        db      020h, 085h, 020h, 081h, 020h, 0f2h, 020h, 087h, 00ah, 028h, 031h, 02dh, 038h, 029h, 020h, 0beh
        db      020h, 0fch, 020h, 085h, 020h, 01bh, 0c8h, 02eh, 020h, 0a3h, 020h, 0b6h, 00ah
        db      "below "
        db      01bh, 0b5h, 020h, 096h, 020h, 0ach, 020h, 081h, 020h, 089h, 00ah, 0f2h, 020h, 01bh, 01ch, 02eh
        db      00ah, 000h, 01bh, 086h, 020h, 090h, 020h, 084h, 020h, 085h, 020h, 081h, 020h, 0c3h, 020h, 087h
        db      020h, 0beh, 00ah, 0fch, 020h, 081h, 020h, 089h, 020h, 0f2h, 020h, 085h, 020h, 0c4h, 02eh, 020h
        db      0a3h, 00ah, 0a6h, 020h, 0cah, 020h, 01bh, 050h, 020h, 085h, 020h, 081h, 00ah, 098h, 020h, 0c3h
        db      020h, 087h, 020h, 08ah, 020h, 01bh, 076h, 020h, 085h, 020h, 081h, 00ah, 01bh, 033h, 020h, 0ach
        db      020h, 01bh, 039h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 01bh, 006h, 020h, 081h, 020h, 01bh
        db      07bh, 020h, 01bh, 0a6h, 00ah, 092h, 020h, 081h, 020h, 089h, 020h, 0f2h, 02eh, 020h, 01bh, 086h
        db      020h, 0e7h
        db      " so "
        db      01bh, 017h, 020h, 061h, 00ah, 01bh, 0b3h, 020h, 01bh, 0f2h, 020h, 092h, 020h, 081h, 020h, 0f2h
        endif
        if      FW_VERSION >= 212
        db      " pad causes "
        db      081h, 00ah
        db      "OVERLOAD light "
        endif
        if      FW_VERSION = 212
        db      01bh, 046h, 020h, 081h
        endif
        if      FW_VERSION >= 214
        db      01bh, 036h, 020h, 081h
        endif
        if      FW_VERSION >= 212
        db      " ME-35T "
        db      085h
        db      " go "
        endif
        if      FW_VERSION = 212
        db      01bh, 046h, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h
        db      " trigger "
        db      01bh, 0d8h
        db      ".  Any"
        db      00ah, 0d9h, 020h, 0f0h, 020h, 061h, 020h, 0a2h, 020h, 01bh, 02ah, 020h, 01bh, 09fh, 020h, 01bh
        db      0dbh, 00ah, 08fh, 020h, 087h, 020h, 028h, 030h, 02dh, 039h, 039h, 029h, 020h, 088h, 020h, 0edh
        db      020h, 094h, 020h, 01bh, 03ch, 00ah, 0afh, 020h, 081h
        db      " ME-35T."
        db      00ah, 000h, 083h, 020h, 01bh, 000h, 020h, 081h, 020h, 01bh, 060h, 020h, 091h, 020h, 0eah
        db      " taken "
        db      01bh, 06bh, 00ah, 081h
        endif
        if      FW_VERSION >= 214
        db      01bh, 036h, 02eh, 00ah, 000h, 083h, 020h, 08ah, 020h, 081h
        db      " trigger "
        db      01bh, 0dah
        db      ".  Any"
        db      00ah, 0dch, 020h, 0f3h, 020h, 061h, 020h, 0a2h, 020h, 01bh, 031h, 020h, 01bh, 0a1h, 020h, 01bh
        db      0aeh, 00ah, 090h, 020h, 087h, 020h, 028h, 030h, 02dh, 039h, 039h, 029h, 020h, 088h, 020h, 0efh
        db      020h, 094h, 020h, 01bh, 046h, 00ah, 0afh, 020h, 081h
        db      " ME-35T."
        db      00ah, 000h, 083h, 020h, 01bh, 006h, 020h, 081h, 020h, 01bh, 063h, 020h, 092h, 020h, 0e1h
        db      " taken "
        db      01bh, 07ch, 00ah, 081h
        endif
        if      FW_VERSION >= 212
        db      " ME-35T "
        db      085h
        db      " measure "
        endif
        if      FW_VERSION = 212
        db      081h, 020h, 0a2h, 020h, 091h, 00ah, 081h, 020h, 01bh, 0f1h, 02ch, 020h, 0a6h, 020h, 0bch
        db      ".  A longer"
        db      00ah, 0a9h, 020h, 01bh, 0ffh, 020h, 01bh
        db      "V accurate"
        db      00ah, 01bh, 08bh
        db      "; a shorter "
        db      0ebh, 020h, 01bh, 0ffh, 00ah
        db      "faster "
        db      01bh, 0feh
        db      ". A good "
        db      01bh, 025h, 020h, 0d8h, 00ah, 08ah
        db      " 4 ms."
        db      00ah, 000h, 083h, 020h, 01bh, 000h, 020h, 061h, 020h, 01bh, 0e3h, 020h, 091h, 020h, 0eah, 020h
        db      028h, 0a6h, 00ah, 0bch, 029h, 020h, 01bh, 02eh, 020h, 01bh, 019h, 020h, 01bh, 0f1h, 020h, 0a6h
        db      00ah, 086h, 020h, 01bh, 0e1h, 020h, 01bh, 011h
        endif
        if      FW_VERSION >= 214
        db      081h, 020h, 0a2h, 020h, 092h, 00ah, 081h, 020h, 01bh, 0f2h, 02ch, 020h, 0a8h, 020h, 0c0h
        db      ".  A longer"
        db      00ah, 0a9h
        db      " produces "
        db      01bh
        db      "Z accurate"
        db      00ah, 01bh, 089h
        db      "; a shorter "
        db      0f0h
        db      " produces"
        db      00ah
        db      "faster response. A good "
        db      01bh, 026h, 020h, 0d4h, 00ah, 08ah
        db      " 4 ms."
        db      00ah, 000h, 083h, 020h, 01bh, 006h
        db      " a period "
        db      092h, 020h, 0e1h, 020h, 028h, 0a8h, 00ah, 0c0h, 029h, 020h, 01bh, 032h, 020h, 01bh, 016h, 020h
        db      01bh, 0f2h, 020h, 0a8h, 00ah, 086h, 020h, 01bh, 0eeh, 020h, 01bh, 014h
        endif
        if      FW_VERSION >= 212
        db      " strikes "
        db      0b0h
        db      " recognized,"
        db      00ah, 085h
        db      " prevent bounce. "
        endif
        if      FW_VERSION = 212
        db      01bh, 082h
        db      " long "
        db      0aeh, 020h, 01bh, 0e1h, 00ah
        db      "bounce; short "
        db      0aeh
        db      " fast rolls."
        db      00ah, 000h, 083h, 020h, 01bh, 000h, 020h, 081h, 020h, 01bh, 060h, 020h, 091h, 020h, 0eah, 020h
        db      01bh, 002h, 00ah, 081h, 020h, 01bh, 0e8h, 020h, 01bh, 046h, 020h, 09dh, 020h, 081h, 020h, 01bh
        db      0e8h, 020h, 01bh, 081h, 02eh, 00ah, 000h
        db      "One "
        db      091h, 020h, 038h, 020h, 0a2h, 020h, 01bh, 0feh
        db      " curves "
        db      0f8h, 00ah, 094h, 020h, 089h, 020h, 0dfh, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 09ah, 020h
        db      081h, 020h, 0ffh, 020h, 095h, 00ah, 01bh, 0bch, 020h, 086h, 020h, 081h, 020h, 089h, 020h, 0efh
        db      020h, 088h, 00ah, 01bh, 0e5h
        db      " its "
        db      0d9h
        endif
        if      FW_VERSION >= 214
        db      01bh, 086h
        db      " long "
        db      0ach, 020h, 01bh, 0eeh, 00ah
        db      "bounce; short "
        db      0ach
        db      " fast rolls."
        db      00ah, 000h, 083h, 020h, 01bh, 006h, 020h, 081h, 020h, 01bh, 063h, 020h, 092h, 020h, 0e1h, 020h
        db      01bh, 00ah, 00ah, 081h, 020h, 01bh, 0f8h, 020h, 01bh, 036h, 020h, 09ch, 020h, 081h, 020h, 01bh
        db      0f8h, 020h, 01bh, 084h, 02eh, 00ah, 000h
        db      "One "
        db      092h, 020h, 038h, 020h, 0a2h
        db      " response curves "
        db      0fbh, 00ah, 094h, 020h, 089h, 020h, 0e0h, 02eh, 00ah, 000h, 083h, 020h, 084h, 020h, 09bh, 020h
        db      081h, 020h, 01bh, 003h, 020h, 095h, 00ah, 01bh, 0b4h, 020h, 086h, 020h, 081h, 020h, 089h, 020h
        db      0f2h, 020h, 088h, 00ah
        db      "send its "
        db      0dch
        endif
        if      FW_VERSION >= 212
        db      ".  In "
        db      081h
        db      " MPC60, "
        endif
        if      FW_VERSION = 212
        db      08fh, 00ah, 01bh, 038h, 020h, 01bh, 026h, 020h, 094h, 020h, 0b2h, 020h, 085h, 020h, 081h, 020h
        db      01bh, 04fh, 00ah, 095h
        endif
        if      FW_VERSION >= 214
        db      090h, 00ah, 01bh, 04bh, 020h, 01bh, 02ah, 020h, 094h, 020h, 0b1h, 020h, 085h, 020h, 081h, 020h
        db      01bh, 05ch, 00ah, 095h
        endif
        if      FW_VERSION >= 212
        db      " as "
        db      081h
        db      " MIDI DRUMS CHANNEL"
        endif
        if      FW_VERSION = 212
        db      00ah
        db      "(usually "
        db      095h, 020h, 031h, 036h, 029h, 02eh, 00ah, 000h, 00ah, 0a8h
        endif
        if      FW_VERSION >= 214
        db      00ah, 028h, 01bh, 0b7h, 020h, 095h, 020h, 031h, 036h, 029h, 02eh, 00ah, 000h, 00ah, 0a3h
        endif
        if      FW_VERSION >= 212
        db      " requested "
        db      08dh
        db      " was "
        endif
        if      FW_VERSION = 212
        db      0edh
        db      " found "
        db      01bh, 046h, 00ah, 081h, 020h, 090h, 02eh, 020h, 020h, 09bh, 020h, 01bh, 0bdh, 020h, 0fdh, 02eh
        db      00ah, 000h, 00ah, 0a8h, 020h, 090h, 020h, 01bh, 0d3h, 020h, 08ah
        db      " full.  "
        db      09bh, 00ah, 01bh, 0a8h, 020h, 0b8h, 020h, 090h, 020h, 0b4h, 020h, 0e7h, 020h, 061h, 020h, 08dh
        db      00ah, 0afh, 020h, 08fh, 020h, 090h, 02eh, 00ah, 000h, 00ah, 0e2h, 020h, 08ah, 020h, 0edh, 020h
        db      01bh, 0a4h
        db      " room "
        db      01bh, 046h, 020h, 081h, 020h, 090h, 00ah, 085h, 020h, 01bh, 043h, 020h, 081h, 020h, 08dh, 02eh
        db      020h, 020h, 01bh
        db      "D a "
        db      090h, 020h, 0f0h, 00ah, 01bh
        db      "V free "
        db      01bh, 0d5h, 02eh, 00ah, 000h, 00ah, 041h, 020h, 08dh
        db      " already "
        db      01bh, 041h, 020h, 0f0h, 020h, 08fh, 020h, 0b3h, 02eh, 00ah, 09bh, 020h, 08bh, 020h, 0b8h, 020h
        db      0b3h, 020h, 0b4h, 020h, 0e7h, 00ah, 081h, 020h, 0b7h, 020h, 08dh, 02eh, 00ah, 000h, 00ah, 083h
        db      020h, 08dh, 020h, 0fah, 020h, 094h, 020h, 0e9h, 020h, 01bh, 089h, 00ah
        db      "since "
        db      0eeh, 020h, 0d6h
        db      " invalid "
        db      098h
        endif
        if      FW_VERSION >= 214
        db      0efh
        db      " found "
        db      01bh, 036h, 00ah, 081h, 020h, 08ch, 02eh, 020h, 020h, 09ah, 020h, 01bh, 0cah, 020h, 01bh, 002h
        db      02eh, 00ah, 000h, 00ah, 0a3h, 020h, 08ch, 020h, 01bh, 0dch, 020h, 08ah
        db      " full.  "
        db      09ah, 00ah, 01bh, 085h, 020h, 0b9h, 020h, 08ch, 020h, 0b5h, 020h, 0edh, 020h, 061h, 020h, 08dh
        db      00ah, 0afh, 020h, 090h, 020h, 08ch, 02eh, 00ah, 000h, 00ah, 0e2h, 020h, 08ah, 020h, 0efh, 020h
        db      01bh, 09ah
        db      " room "
        db      01bh, 036h, 020h, 081h, 020h, 08ch, 00ah, 085h, 020h, 01bh, 041h, 020h, 081h, 020h, 08dh, 02eh
        db      020h, 020h, 01bh, 02dh, 020h, 061h, 020h, 08ch, 020h, 0f3h, 00ah, 01bh
        db      "Z free "
        db      01bh, 0d6h, 02eh, 00ah, 000h, 00ah, 041h, 020h, 08dh
        db      " already "
        db      01bh, 04ah, 020h, 0f3h, 020h, 090h, 020h, 0b3h, 02eh, 00ah, 09ah, 020h, 08bh, 020h, 0b9h, 020h
        db      0b3h, 020h, 0b5h, 020h, 0edh, 00ah, 081h, 020h, 0bbh, 020h, 08dh, 02eh, 00ah, 000h, 00ah, 083h
        db      020h, 08dh, 020h, 01bh, 000h, 020h, 094h, 020h, 0ech, 020h, 01bh, 02ch, 00ah
        db      "since "
        db      0e7h, 020h, 0d6h
        db      " invalid "
        db      096h
        endif
        if      FW_VERSION >= 212
        db      ".  Try"
        db      00ah
        db      "loading a "
        endif
        if      FW_VERSION = 212
        db      01bh, 00dh, 020h, 08dh, 02eh, 00ah, 000h, 0a8h
        db      " source "
        db      09dh, 020h, 01bh, 031h, 020h, 01bh, 0c9h, 020h, 0b0h, 00ah, 0d3h
        db      " differently.  "
        db      01bh, 044h, 020h, 08fh, 020h, 090h, 00ah, 0feh, 020h, 0a4h, 020h, 085h, 020h, 0feh, 020h, 01bh
        db      0c9h, 020h, 0d3h, 00ah, 01bh, 046h, 020h, 081h
        db      " MPC60 "
        db      0b4h
        db      " ASQ10."
        db      00ah, 000h, 00ah, 083h, 020h, 090h, 020h, 01bh, 042h, 020h, 01bh
        db      "Q damaged! However,"
        db      00ah, 01bh, 011h
        db      " files "
        db      01bh, 046h, 020h, 08fh, 020h, 090h, 020h, 0f8h, 020h, 094h, 00ah
        db      "undamaged.  "
        db      09bh, 020h, 01bh, 0a8h, 020h, 061h, 020h, 01bh, 00dh, 00ah, 090h, 02eh, 00ah, 000h, 00ah, 0e2h
        db      020h, 08ah, 020h, 01bh, 0e1h, 020h, 090h, 020h, 0a6h, 020h, 081h
        db      " drive.  "
        db      09bh, 00ah, 0e8h, 020h, 061h, 020h, 090h, 02eh, 00ah, 000h, 00ah, 083h, 020h, 090h, 020h, 08ah
        db      020h, 01bh, 033h, 020h, 0edh, 020h, 0d3h, 020h, 0b4h, 00ah, 08ah
        db      " bad.  Either "
        db      01bh, 0a0h, 020h, 0eeh, 020h, 0b4h, 020h, 01bh, 0a8h, 020h, 061h, 00ah, 01bh, 00dh, 020h, 090h
        db      02eh, 00ah, 000h, 00ah, 0a8h, 020h, 090h, 020h, 08ah
        db      " write protected.  "
        db      09bh, 00ah, 01bh, 0cch, 020h, 081h, 020h, 090h
        db      "'s write protect tab."
        db      00ah, 000h, 041h, 020h, 090h
        db      " drive error occurred "
        db      086h, 00ah, 0e5h
        db      " a fault "
        db      0a6h, 020h, 081h
        endif
        if      FW_VERSION >= 214
        db      01bh, 015h, 020h, 08dh, 02eh, 00ah, 000h, 0a3h
        db      " source "
        db      09ch, 020h, 01bh, 03fh, 020h, 01bh, 0d4h, 020h, 0b0h, 00ah, 0c9h
        db      " differently.  "
        db      01bh, 02dh, 020h, 090h, 020h, 08ch, 00ah, 01bh, 00bh, 020h, 0a5h, 020h, 085h, 020h, 01bh, 00bh
        db      020h, 01bh, 0d4h, 020h, 0c9h, 00ah, 01bh, 036h, 020h, 081h
        db      " MPC60 "
        db      0b5h
        db      " ASQ10."
        db      00ah, 000h, 00ah, 083h, 020h, 08ch, 020h, 01bh, 040h, 020h, 01bh
        db      "W damaged! However,"
        db      00ah, 01bh, 014h
        db      " files "
        db      01bh, 036h, 020h, 090h, 020h, 08ch, 020h, 0fbh, 020h, 094h, 00ah
        db      "undamaged.  "
        db      09ah, 020h, 01bh, 085h, 020h, 061h, 020h, 01bh, 015h, 00ah, 08ch, 02eh, 00ah, 000h, 00ah, 0e2h
        db      020h, 08ah, 020h, 01bh, 0eeh, 020h, 08ch, 020h, 0a8h, 020h, 081h, 020h, 01bh, 09eh, 02eh, 020h
        db      020h, 09ah, 00ah, 0ebh, 020h, 061h, 020h, 08ch, 02eh, 00ah, 000h, 00ah, 083h, 020h, 08ch, 020h
        db      08ah, 020h, 01bh, 048h, 020h, 0efh, 020h, 0c9h, 020h, 0b5h, 00ah, 08ah
        db      " bad.  Either "
        db      01bh, 021h, 020h, 0e7h, 020h, 0b5h, 020h, 01bh, 085h, 020h, 061h, 00ah, 01bh, 015h, 020h, 08ch
        db      02eh, 00ah, 000h, 00ah, 0a3h, 020h, 08ch, 020h, 08ah
        db      " write protected.  "
        db      09ah, 00ah, 01bh, 0dfh, 020h, 081h, 020h, 08ch
        db      "'s write protect tab."
        db      00ah, 000h, 041h, 020h, 08ch, 020h, 01bh, 09eh
        db      " error occurred "
        db      086h, 00ah, 0e8h
        db      " a fault "
        db      0a8h, 020h, 081h
        endif
        if      FW_VERSION >= 212
        db      " electronics."
        db      00ah
        db      "Turn "
        endif
        if      FW_VERSION = 212
        db      01bh, 0ceh, 020h, 01bh, 0fch, 020h, 09dh, 020h, 01bh, 046h, 020h, 09dh, 020h, 01bh, 0bdh, 020h
        db      0fdh, 02eh, 00ah, 01bh
        db      "S problem still "
        db      01bh
        db      "A, please "
        db      01bh, 0efh, 00ah, 081h
        endif
        if      FW_VERSION >= 214
        db      01bh, 0dbh
        db      " off "
        db      09ch, 020h, 01bh, 036h, 020h, 09ch, 020h, 01bh, 0cah, 020h, 01bh, 002h, 02eh, 00ah, 01bh
        db      "U problem still "
        db      01bh
        db      "J, please "
        db      01bh, 0fah, 00ah, 081h
        endif
        if      FW_VERSION >= 212
        db      " unit repaired "
        db      01bh, 090h
        db      " your nearest"
        db      00ah
        db      "service center."
        endif
        if      FW_VERSION = 212
        db      00ah, 000h, 083h, 020h, 090h, 020h, 08ah
        endif
        if      FW_VERSION >= 214
        db      00ah, 000h, 083h, 020h, 08ch, 020h, 08ah
        endif
        if      FW_VERSION >= 212
        db      " unusable since a defect"
        db      00ah
        db      "was found "
        endif
        if      FW_VERSION = 212
        db      0a6h, 020h, 081h
        db      " area reserved "
        db      0aeh, 020h, 081h, 00ah, 08dh, 020h, 01bh, 0d3h, 02eh, 020h, 020h, 09bh, 020h, 0e8h, 020h, 0b8h
        db      00ah, 090h, 020h, 09dh, 020h, 01bh, 0bdh, 020h, 0fdh, 02eh, 00ah, 000h, 083h, 020h, 090h, 020h
        db      01bh, 02ch, 020h, 01bh, 042h, 020h, 01bh
        db      "Q cancelled"
        db      00ah, 01bh, 0b3h, 020h, 061h, 020h, 01bh, 085h, 020h, 0ebh, 02dh, 0eah
        endif
        if      FW_VERSION >= 214
        db      0a8h, 020h, 081h
        db      " area reserved "
        db      0ach, 020h, 081h, 00ah, 08dh, 020h, 01bh, 0dch, 02eh, 020h, 020h, 09ah, 020h, 0ebh, 020h, 0b9h
        db      00ah, 08ch, 020h, 09ch, 020h, 01bh, 0cah, 020h, 01bh, 002h, 02eh, 00ah, 000h, 083h, 020h, 08ch
        db      020h, 01bh, 034h, 020h, 01bh, 040h, 020h, 01bh
        db      "W cancelled"
        db      00ah, 01bh, 0b6h, 020h, 061h, 020h, 01bh, 08bh, 020h, 0f0h, 02dh, 0e1h
        endif
        if      FW_VERSION >= 212
        db      " error was"
        db      00ah
        db      "detected.  "
        endif
        if      FW_VERSION = 212
        db      09bh, 020h, 01bh, 0bdh, 020h, 081h, 020h, 01bh, 02ch, 00ah, 0fdh, 02eh, 00ah, 000h, 00ah, 0e2h
        db      020h, 08ah, 020h, 0edh, 020h, 01bh, 0a4h, 020h, 082h, 020h, 0bbh, 00ah, 01bh, 078h, 020h, 085h
        db      020h, 01bh, 0bah, 020h, 08fh, 020h, 01bh, 02ch, 02eh, 00ah, 09bh, 020h, 0e7h, 020h, 01bh, 086h
        db      020h, 092h, 020h, 09dh, 020h, 01bh, 0bdh, 00ah, 0fdh, 02eh, 00ah, 000h, 00ah, 083h, 020h, 08dh
        db      020h, 0fah, 020h, 094h, 020h, 0e9h, 020h, 0f0h, 020h, 08fh, 00ah
        db      "version "
        db      091h, 020h, 081h
        db      " software."
        db      00ah, 000h, 00ah, 0a8h, 020h, 0feh, 020h, 0fah, 020h, 094h
        db      " done "
        db      01bh, 0b3h, 020h, 081h, 00ah, 098h, 020h, 0afh, 020h, 061h, 020h, 027h, 09fh, 027h, 020h, 08ch
        db      020h, 0fah, 020h, 094h, 00ah, 0a0h, 020h, 085h
        db      " a 'non-"
        db      09fh, 027h, 020h, 08ch, 020h, 028h, 0b4h
        endif
        if      FW_VERSION >= 214
        db      09ah, 020h, 01bh, 0cah, 020h, 081h, 020h, 01bh, 034h, 00ah, 01bh, 002h, 02eh, 00ah, 000h, 0a3h
        db      " system was unable "
        db      085h
        db      " successfully"
        db      00ah
        db      "access "
        db      081h, 020h, 01bh, 0b3h, 020h, 08ch
        db      ". Be "
        db      01bh, 0f4h, 020h, 081h, 00ah
        db      "SCSI "
        db      01bh, 09eh, 020h, 08ah, 020h, 01bh, 02ch, 020h, 0e6h, 02ch, 00ah, 01bh, 0fdh, 020h, 01bh, 036h
        db      02ch, 020h, 09ch, 020h, 0c9h, 02eh, 00ah, 000h, 00ah, 0e2h, 020h, 08ah, 020h, 0efh, 020h, 01bh
        db      09ah, 020h, 082h, 020h, 0b8h, 00ah, 01bh, 067h, 020h, 085h, 020h, 01bh, 0cch, 020h, 090h, 020h
        db      01bh, 034h, 02eh, 00ah, 09ah, 020h, 0edh, 020h, 01bh, 094h, 020h, 093h, 020h, 09ch, 020h, 01bh
        db      0cah, 00ah, 01bh, 002h, 02eh, 00ah, 000h, 00ah, 083h, 020h, 08dh, 020h, 01bh, 000h, 020h, 094h
        db      020h, 0ech, 020h, 0f3h, 020h, 090h, 00ah
        db      "version "
        db      092h, 020h, 081h
        db      " software."
        db      00ah, 000h, 00ah, 0a3h, 020h, 01bh, 00bh, 020h, 01bh, 000h, 020h, 094h
        db      " done "
        db      01bh, 0b6h, 020h, 081h, 00ah, 096h, 020h, 0afh, 020h, 061h, 020h, 027h, 09fh, 027h, 020h, 08eh
        db      020h, 01bh, 000h, 020h, 094h, 00ah, 0a0h, 020h, 085h
        db      " a 'non-"
        db      09fh, 027h, 020h, 08eh, 020h, 028h, 0b5h
        endif
        if      FW_VERSION >= 212
        db      " vice"
        db      00ah
        db      "versa.)"
        endif
        if      FW_VERSION = 212
        db      00ah, 000h, 0a8h, 020h, 082h, 020h, 0cbh, 020h, 0b0h
        db      " copying "
        db      0d0h, 020h, 0f8h, 00ah, 0edh, 020h, 094h
        db      " long "
        db      01bh, 0a4h, 020h, 085h
        db      " accept "
        db      081h, 020h, 01bh, 027h, 00ah, 0feh
        db      ".  Do "
        db      0cbh, 020h, 01bh, 006h, 020h, 085h
        endif
        if      FW_VERSION >= 214
        db      00ah, 000h, 0a3h, 020h, 082h, 020h, 0beh, 020h, 0b0h
        db      " copying "
        db      0cch, 020h, 0fbh, 00ah, 0efh, 020h, 094h
        db      " long "
        db      01bh, 09ah, 020h, 085h
        db      " accept "
        db      081h, 020h, 01bh, 025h, 00ah, 01bh, 00bh
        db      ".  Do "
        db      0beh, 020h, 0fch, 020h, 085h
        endif
        if      FW_VERSION >= 212
        db      " proceed anyway"
        db      00ah
        db      "even though "
        endif
        if      FW_VERSION = 212
        db      01bh, 0e1h, 020h, 0d9h, 020h, 088h, 020h, 094h, 020h, 0a0h, 00ah
        db      "past "
        db      081h, 020h, 01bh, 001h, 03fh, 00ah, 00ah, 03ch, 01bh, 07ah, 03eh, 00ah, 000h, 04eh, 06fh, 020h
        db      098h
        endif
        if      FW_VERSION >= 214
        db      01bh, 0eeh, 020h, 0dch, 020h, 088h, 020h, 094h, 020h, 0a0h, 00ah
        db      "past "
        db      081h, 020h, 01bh, 007h, 03fh, 00ah, 00ah, 03ch, 0dfh, 03eh, 00ah, 000h, 04eh, 06fh, 020h, 096h
        endif
        if      FW_VERSION >= 212
        db      " was "
        db      0a0h
        db      " since "
        endif
        if      FW_VERSION = 212
        db      081h, 00ah, 01bh, 031h, 020h, 082h
        db      " does "
        db      0edh, 00ah
        db      "exist.  "
        db      0bfh, 020h, 081h, 020h, 082h, 020h, 085h, 020h, 094h, 00ah, 01bh
        db      "v via "
        endif
        if      FW_VERSION >= 214
        db      081h, 00ah, 01bh, 03fh, 020h, 082h
        db      " does "
        db      0efh, 00ah
        db      "exist.  "
        db      0bdh, 020h, 081h, 020h, 082h, 020h, 085h, 020h, 094h, 00ah, 01bh
        db      "x via "
        endif
        if      FW_VERSION >= 212
        db      081h
        db      " Main Screen.  Then"
        endif
        if      FW_VERSION = 212
        db      00ah, 01bh, 0a8h, 020h, 081h
        db      " Edit "
        db      0a4h
        db      " 'Create "
        db      0ech, 00ah, 082h, 027h, 020h, 085h
        db      " make a "
        db      0ech, 020h, 082h, 02eh, 00ah, 000h, 00ah, 083h, 020h, 0cfh, 020h, 0d6h, 020h, 01bh, 056h, 020h
        db      01bh, 0dbh, 020h, 039h, 039h, 039h, 020h, 01bh, 014h, 02eh, 00ah
        endif
        if      FW_VERSION >= 214
        db      00ah, 01bh, 085h, 020h, 081h
        db      " Edit "
        db      0a5h
        db      " 'Create "
        db      0eah, 00ah, 082h, 027h, 020h, 085h
        db      " make a "
        db      0eah, 020h, 082h, 02eh, 00ah, 000h, 00ah, 083h, 020h, 0d1h, 020h, 0d6h, 020h, 01bh, 05ah, 020h
        db      01bh, 0aeh, 020h, 039h, 039h, 039h, 020h, 01bh, 018h, 02eh, 00ah
        endif
        if      FW_VERSION >= 212
        db      "Try reducing "
        db      081h
        db      " repetition counts "
        endif
        if      FW_VERSION = 212
        db      0b4h, 00ah, 01bh, 0a2h, 020h, 01bh, 086h, 020h, 01bh, 04ch, 02eh, 00ah, 000h, 00ah, 0e2h, 020h
        db      0b0h, 020h, 01bh, 0e1h, 020h, 01bh, 04ch, 020h, 0a6h, 020h, 08fh, 020h, 0cfh, 02eh, 00ah, 0bfh
        endif
        if      FW_VERSION >= 214
        db      0b5h, 00ah, 01bh, 0a3h, 020h, 01bh, 094h, 020h, 01bh, 04ch, 02eh, 00ah, 000h, 00ah, 0e2h, 020h
        db      0b0h, 020h, 01bh, 0eeh, 020h, 01bh, 04ch, 020h, 0a8h, 020h, 090h, 020h, 0d1h, 02eh, 00ah, 0bdh
        endif
        if      FW_VERSION >= 212
        db      " a non-zero repetetion count "
        db      085h, 00ah
        db      "add a "
        endif
        if      FW_VERSION = 212
        db      0fch, 02ch, 020h, 0b4h
        db      " choose "
        db      0b8h, 020h, 0cfh, 02eh, 00ah, 000h, 00ah, 0a8h, 020h, 082h, 020h, 0cbh, 020h, 0b0h
        db      " trying "
        db      085h, 020h, 0feh, 00ah, 081h, 020h, 0cfh, 020h, 0d0h, 020h, 08ah, 020h, 0ebh, 020h, 091h, 020h
        db      081h, 020h, 092h, 00ah, 0a6h, 020h, 081h, 020h, 0cfh, 02eh, 020h, 020h, 09bh, 020h, 08bh, 020h
        db      0b8h, 00ah, 082h, 020h, 087h, 02eh, 00ah, 000h, 00ah
        db      "One "
        db      0b4h, 020h, 01bh, 056h, 020h, 091h, 020h, 081h, 020h, 092h, 020h, 0a6h, 020h, 081h, 00ah, 0cfh
        db      020h, 0cbh, 020h, 0b0h
        endif
        if      FW_VERSION >= 214
        db      0feh, 02ch, 020h, 0b5h
        db      " choose "
        db      0b9h, 020h, 0d1h, 02eh, 00ah, 000h, 00ah, 0a3h, 020h, 082h, 020h, 0beh, 020h, 0b0h
        db      " trying "
        db      085h, 020h, 01bh, 00bh, 00ah, 081h, 020h, 0d1h, 020h, 0cch, 020h, 08ah, 020h, 0f0h, 020h, 092h
        db      020h, 081h, 020h, 093h, 00ah, 0a8h, 020h, 081h, 020h, 0d1h, 02eh, 020h, 020h, 09ah, 020h, 08bh
        db      020h, 0b9h, 00ah, 082h, 020h, 087h, 02eh, 00ah, 000h, 00ah
        db      "One "
        db      0b5h, 020h, 01bh, 05ah, 020h, 092h, 020h, 081h, 020h, 093h, 020h, 0a8h, 020h, 081h, 00ah, 0d1h
        db      020h, 0beh, 020h, 0b0h
        endif
        if      FW_VERSION >= 212
        db      " trying "
        db      085h
        db      " convert "
        endif
        if      FW_VERSION = 212
        db      08ah, 020h, 0edh, 00ah, 01bh, 0a5h, 020h, 099h, 02eh, 020h, 020h, 09bh, 020h, 0e7h, 020h, 01bh
        db      07eh, 00ah, 01bh, 022h, 020h, 092h, 020h, 0afh, 020h, 081h, 020h, 0cfh, 020h, 09dh, 020h, 01bh
        db      0bdh, 00ah, 0fdh, 02eh, 00ah, 000h, 00ah, 0e2h, 020h, 0b0h
        db      " too "
        db      01bh, 083h, 020h, 0ach, 020h, 0d1h, 00ah, 0ceh, 020h, 08fh, 020h, 0cfh, 020h, 085h, 020h, 094h
        db      020h, 01bh, 089h, 00ah, 01bh, 0d2h
        db      ".  Some "
        db      0ach, 020h, 0d1h, 020h, 0f8h, 00ah, 01bh, 0efh, 020h, 01bh
        db      "Q lost."
        endif
        if      FW_VERSION >= 214
        db      08ah, 020h, 0efh, 00ah, 01bh, 0a2h, 020h, 099h, 02eh, 020h, 020h, 09ah, 020h, 0edh, 020h, 01bh
        db      075h, 00ah, 01bh, 023h, 020h, 093h, 020h, 0afh, 020h, 081h, 020h, 0d1h, 020h, 09ch, 020h, 01bh
        db      0cah, 00ah, 01bh, 002h, 02eh, 00ah, 000h, 00ah, 0e2h, 020h, 0b0h
        db      " too "
        db      01bh, 08ah, 020h, 0aeh, 020h, 0d3h, 00ah, 0d0h, 020h, 090h, 020h, 0d1h, 020h, 085h, 020h, 094h
        db      020h, 01bh, 02ch, 00ah, 01bh, 0e3h
        db      ".  Some "
        db      0aeh, 020h, 0d3h, 020h, 0fbh, 00ah, 01bh, 0fah, 020h, 01bh
        db      "W lost."
        endif
        if      FW_VERSION >= 212
        db      00ah, 000h, 00ah
        db      "All "
        endif
        if      FW_VERSION = 212
        db      081h, 020h, 092h, 020h, 0a6h, 020h, 08fh, 020h, 0cfh, 020h, 0b0h, 00ah, 01bh, 022h, 02eh, 020h
        db      020h, 09bh, 020h, 01bh, 016h, 020h, 01bh, 086h, 020h, 092h, 00ah, 0c4h
        db      " valid "
        db      098h, 02eh, 00ah, 000h, 041h, 020h, 082h, 020h, 0abh, 020h, 08ah
        db      " invalid.  Check"
        db      00ah, 01bh, 01eh, 020h, 081h, 020h, 01bh, 029h, 020h, 087h, 020h, 08ah, 020h, 0edh
        db      " past "
        db      081h, 00ah, 01bh, 001h, 020h, 091h, 020h, 081h, 020h, 082h
        db      ".  See "
        db      01bh, 01eh, 020h, 081h, 00ah
        endif
        if      FW_VERSION >= 214
        db      081h, 020h, 093h, 020h, 0a8h, 020h, 090h, 020h, 0d1h, 020h, 0b0h, 00ah, 01bh, 023h, 02eh, 020h
        db      020h, 09ah, 020h, 01bh, 01fh, 020h, 01bh, 094h, 020h, 093h, 00ah, 0c7h
        db      " valid "
        db      096h, 02eh, 00ah, 000h, 041h, 020h, 082h, 020h, 0adh, 020h, 08ah
        db      " invalid.  Check"
        db      00ah, 01bh, 017h, 020h, 081h, 020h, 01bh, 02eh, 020h, 087h, 020h, 08ah, 020h, 0efh
        db      " past "
        db      081h, 00ah, 01bh, 007h, 020h, 092h, 020h, 081h, 020h, 082h
        db      ".  See "
        db      01bh, 017h, 020h, 081h, 00ah
        endif
        if      FW_VERSION >= 212
        db      "beat "
        db      087h
        db      " doesn't exceed "
        endif
        if      FW_VERSION = 212
        db      081h, 020h, 087h, 00ah, 091h
        db      " beats per measure "
        db      01bh, 0d4h, 020h, 01bh, 06bh, 020h, 081h, 00ah, 0eah, 020h, 0e4h, 020h, 0aeh, 020h, 081h
        db      " given "
        db      01bh, 029h, 02eh, 00ah, 000h, 0e2h, 020h, 08ah, 020h, 0edh, 020h, 01bh, 0a4h, 020h, 082h, 020h
        db      0bbh, 020h, 085h, 00ah, 01bh, 052h, 020h, 08fh, 020h, 08dh, 02eh, 00ah, 000h, 00ah, 0a8h, 020h
        db      089h, 020h, 08eh, 020h, 0b3h
        db      " already"
        db      00ah, 01bh, 041h, 02eh, 020h, 020h, 09bh
        db      " rename "
        db      081h, 020h, 08eh, 020h, 09dh, 00ah, 01bh, 0bdh, 020h, 0fdh, 02eh, 00ah, 000h, 00ah, 0e2h, 020h
        db      08ah, 020h, 0edh, 020h, 0bbh, 020h, 085h
        db      " hold "
        db      01bh, 067h, 020h, 01bh, 056h, 00ah, 01bh, 03dh, 02eh, 020h, 020h, 09bh, 020h, 0e7h, 020h, 01bh
        db      086h, 020h, 01bh, 03dh, 020h, 09dh, 00ah, 01bh, 0bdh, 020h, 0fdh, 02eh, 00ah, 000h, 00ah, 083h
        db      020h, 0f9h, 020h, 091h, 020h, 08dh, 020h, 0fah, 020h, 094h, 020h, 0e9h, 02eh, 00ah, 09bh, 020h
        db      08bh, 020h, 0b8h, 020h, 08dh, 02eh, 00ah, 000h, 00ah
        db      "Warning: "
        db      083h, 020h, 088h, 020h, 0e7h, 020h, 081h, 020h, 01bh, 027h, 00ah, 082h, 02ch, 020h, 01bh, 0d9h
        db      020h, 0beh, 020h, 08ch
        db      " names"
        db      00ah, 09dh, 020h, 01bh, 034h, 02eh, 00ah, 00ah, 00ah, 03ch, 0a7h, 03eh, 00ah, 000h, 0a8h
        db      " conversion "
        db      0fah, 020h, 094h
        db      " done "
        db      01bh, 0b3h, 020h, 061h, 00ah, 027h, 09fh, 027h, 020h, 08ch, 020h, 0fah, 020h, 094h
        endif
        if      FW_VERSION >= 214
        db      081h, 020h, 087h, 00ah, 092h
        db      " beats per measure "
        db      01bh, 0d2h, 020h, 01bh, 07ch, 020h, 081h, 00ah, 0e1h, 020h, 0e9h, 020h, 0ach, 020h, 081h, 020h
        db      01bh, 0ddh, 020h, 01bh, 02eh, 02eh, 00ah, 000h, 0e2h, 020h, 08ah, 020h, 0efh, 020h, 01bh, 09ah
        db      020h, 082h, 020h, 0b8h, 020h, 085h, 00ah, 01bh, 03ah, 020h, 090h, 020h, 08dh, 02eh, 00ah, 000h
        db      00ah, 0a3h, 020h, 089h, 020h, 08fh, 020h, 0b3h
        db      " already"
        db      00ah, 01bh, 04ah, 02eh, 020h, 020h, 09ah
        db      " rename "
        db      081h, 020h, 08fh, 020h, 09ch, 00ah, 01bh, 0cah, 020h, 01bh, 002h, 02eh, 00ah, 000h, 00ah, 0e2h
        db      020h, 08ah, 020h, 0efh, 020h, 0b8h, 020h, 085h
        db      " hold "
        db      01bh, 081h, 020h, 01bh, 05ah, 00ah, 01bh, 03ch, 02eh, 020h, 020h, 09ah, 020h, 0edh, 020h, 01bh
        db      094h, 020h, 01bh, 03ch, 020h, 09ch, 00ah, 01bh, 0cah, 020h, 01bh, 002h, 02eh, 00ah, 000h, 00ah
        db      0a3h, 020h, 08fh, 020h, 0b8h
        db      " expansion "
        db      01bh, 027h, 020h, 08ah, 00ah
        db      "required "
        db      085h, 020h, 01bh, 03ah, 020h, 090h, 020h, 08dh, 02eh, 00ah, 000h, 00ah, 083h, 020h, 0ffh, 020h
        db      092h, 020h, 08dh, 020h, 01bh, 000h, 020h, 094h, 020h, 0ech, 02eh, 00ah, 09ah, 020h, 08bh, 020h
        db      0b9h, 020h, 08dh, 02eh, 00ah, 000h, 00ah
        db      "Warning: "
        db      083h, 020h, 088h, 020h, 0edh, 020h, 081h, 020h, 01bh, 025h, 00ah, 082h, 02ch, 020h, 01bh, 0e0h
        db      020h, 0c2h, 020h, 08eh
        db      " names"
        db      00ah, 09ch, 020h, 01bh, 038h, 02eh, 00ah, 00ah, 00ah, 03ch, 0aah, 03eh, 00ah, 000h, 0a3h
        db      " conversion "
        db      01bh, 000h, 020h, 094h
        db      " done "
        db      01bh, 0b6h, 020h, 061h, 00ah, 027h, 09fh, 027h, 020h, 08eh, 020h, 01bh, 000h, 020h, 094h
        endif
        if      FW_VERSION >= 212
        db      " appended onto a"
        db      00ah
        db      "'non-"
        endif
        if      FW_VERSION = 212
        db      09fh, 027h, 020h, 08ch, 020h, 028h, 0b4h
        endif
        if      FW_VERSION >= 214
        db      09fh, 027h, 020h, 08eh, 020h, 028h, 0b5h
        endif
        if      FW_VERSION >= 212
        db      " vice versa):"
        db      00ah
        db      "Track xx "
        db      08ah
        db      " mismatched "
        endif
        if      FW_VERSION = 212
        db      01bh, 002h, 020h, 082h, 00ah, 079h, 079h, 020h, 09dh
        db      " zz. "
        db      09bh, 020h, 01bh, 09bh, 020h, 081h, 020h, 095h, 00ah, 01bh, 034h, 020h, 091h, 020h, 01bh, 07eh
        db      020h, 0dah, 02eh, 00ah, 000h, 00ah, 0a8h, 020h, 08dh, 020h, 088h, 020h, 0edh
        db      " fit "
        db      01bh, 046h, 020h, 08fh, 020h, 090h, 02eh, 00ah, 09bh, 020h, 0e8h, 020h, 061h, 020h, 01bh, 04bh
        db      020h, 0d3h, 020h, 090h, 00ah, 09dh, 020h, 01bh, 0bdh, 020h, 0fdh, 02eh, 00ah, 000h, 00ah, 083h
        db      020h, 08dh, 020h, 08ah
        db      " larger "
        db      01bh, 0dbh, 020h, 0ebh, 020h, 090h, 00ah, 088h
        db      " hold.  "
        db      09bh
        db      " prepare 2 "
        db      01bh, 04bh, 00ah, 0d3h, 020h, 01bh, 0c9h, 02ch, 020h, 0e8h, 020h, 081h, 020h, 01bh, 013h, 02ch
        db      00ah, 0bah, 020h, 093h, 020h, 03ch, 01bh
        db      "5 1st "
        db      01bh, 0f3h, 03eh, 02eh, 00ah, 00ah, 03ch, 01bh
        db      "5 1st "
        db      01bh, 0f3h, 03eh, 00ah, 000h, 00ah, 0a8h, 020h, 01bh, 013h, 020h, 01bh, 0f3h, 020h, 091h, 020h
        db      081h, 020h, 08dh, 020h, 01bh, 042h, 020h, 01bh, 051h, 00ah, 01bh, 01bh, 020h, 085h, 020h, 081h
        db      020h, 01bh, 013h, 020h, 090h, 02eh, 020h, 020h, 09bh, 00ah, 0e8h, 020h, 081h
        db      " second "
        db      0d3h, 020h, 01bh, 04bh, 00ah, 090h, 02ch, 020h, 0bah, 020h, 093h, 020h, 03ch, 01bh
        db      "5 2nd "
        db      01bh, 0f3h, 03eh, 02eh, 00ah, 00ah, 03ch, 01bh
        db      "5 2nd "
        db      01bh, 0f3h, 03eh, 00ah, 000h, 00ah, 083h, 020h, 090h, 020h, 08ah, 020h, 0edh, 020h, 01bh, 04bh
        db      02eh, 020h, 020h, 09bh, 020h, 0e8h, 00ah, 061h, 020h, 01bh, 04bh, 020h, 0d3h, 020h, 090h, 02eh
        db      00ah, 000h, 00ah, 09bh, 020h, 0e8h, 020h, 081h, 020h, 090h, 020h, 0c4h, 020h, 081h, 00ah, 08dh
        endif
        if      FW_VERSION >= 214
        db      01bh, 00ah, 020h, 082h, 00ah, 079h, 079h, 020h, 09ch
        db      " zz. "
        db      09ah, 020h, 01bh, 09dh, 020h, 081h, 020h, 095h, 00ah, 01bh, 038h, 020h, 092h, 020h, 01bh, 075h
        db      020h, 0dbh, 02eh, 00ah, 000h, 00ah, 0a3h, 020h, 08dh, 020h, 088h, 020h, 0efh
        db      " fit "
        db      01bh, 036h, 020h, 090h, 020h, 08ch, 02eh, 00ah, 09ah, 020h, 0ebh, 020h, 061h, 020h, 01bh, 052h
        db      020h, 0c9h, 020h, 08ch, 00ah, 09ch, 020h, 01bh, 0cah, 020h, 01bh, 002h, 02eh, 00ah, 000h, 00ah
        db      083h, 020h, 08dh, 020h, 08ah
        db      " larger "
        db      01bh, 0aeh, 020h, 0f0h, 020h, 08ch, 00ah, 088h
        db      " hold.  "
        db      09ah
        db      " prepare 2 "
        db      01bh, 052h, 00ah, 0c9h, 020h, 01bh, 0d4h, 02ch, 020h, 0ebh, 020h, 081h, 020h, 01bh, 001h, 02ch
        db      00ah, 0b4h, 020h, 091h, 020h, 03ch, 01bh
        db      "/ 1st "
        db      01bh, 0f5h, 03eh, 02eh, 00ah, 00ah, 03ch, 01bh
        db      "/ 1st "
        db      01bh, 0f5h, 03eh, 00ah, 000h, 00ah, 0a3h, 020h, 01bh, 001h, 020h, 01bh, 0f5h, 020h, 092h, 020h
        db      081h, 020h, 08dh, 020h, 01bh, 040h, 020h, 01bh, 057h, 00ah, 01bh, 00eh, 020h, 085h, 020h, 081h
        db      020h, 01bh, 001h, 020h, 08ch, 02eh, 020h, 020h, 09ah, 00ah, 0ebh, 020h, 081h
        db      " second "
        db      0c9h, 020h, 01bh, 052h, 00ah, 08ch, 02ch, 020h, 0b4h, 020h, 091h, 020h, 03ch, 01bh
        db      "/ 2nd "
        db      01bh, 0f5h, 03eh, 02eh, 00ah, 00ah, 03ch, 01bh
        db      "/ 2nd "
        db      01bh, 0f5h, 03eh, 00ah, 000h, 00ah, 083h, 020h, 08ch, 020h, 08ah, 020h, 0efh, 020h, 01bh, 052h
        db      02eh, 020h, 020h, 09ah, 020h, 0ebh, 00ah, 061h, 020h, 01bh, 052h, 020h, 0c9h, 020h, 08ch, 02eh
        db      00ah, 000h, 00ah, 09ah, 020h, 0ebh, 020h, 081h, 020h, 08ch, 020h, 0c7h, 020h, 081h, 00ah, 08dh
        endif
        if      FW_VERSION >= 212
        db      03ah, 00ah
        db      "Then "
        endif
        if      FW_VERSION = 212
        db      093h, 020h, 03ch, 01bh, 03ah, 020h, 08dh, 03eh, 02eh, 00ah, 00ah, 00ah, 03ch, 01bh, 03ah, 020h
        endif
        if      FW_VERSION >= 214
        db      091h, 020h, 03ch, 01bh, 042h, 020h, 08dh, 03eh, 02eh, 00ah, 00ah, 00ah, 03ch, 01bh, 042h, 020h
        endif
        if      FW_VERSION >= 212
        db      08dh, 03eh, 00ah, 000h, 083h
        db      " .ST2 "
        db      08dh
        db      " does "
        endif
        if      FW_VERSION = 212
        db      0edh, 020h, 01bh, 09bh, 020h, 081h
        db      " .ST1"
        db      00ah, 08dh, 020h, 01bh, 055h, 020h, 0e9h
        endif
        if      FW_VERSION >= 214
        db      0efh, 020h, 01bh, 09dh, 020h, 081h
        db      " .ST1"
        db      00ah, 08dh, 020h, 01bh, 056h, 020h, 0ech
        endif
        if      FW_VERSION >= 212
        db      ", even though "
        db      081h, 00ah
        db      "filename "
        endif
        if      FW_VERSION = 212
        db      08ah, 020h, 01bh, 005h, 02eh, 020h, 020h, 09bh, 020h, 0e8h, 00ah, 081h, 020h, 090h, 020h, 0c4h
        db      020h, 081h, 020h, 08dh, 020h, 091h, 020h, 081h, 00ah, 01bh, 04fh, 020h, 0b3h, 020h, 086h, 020h
        db      01bh, 03eh, 020h, 085h, 020h, 081h
        db      " ST1"
        db      00ah, 08dh, 020h, 01bh, 055h, 020h, 0e9h, 02eh, 00ah, 03ch, 01bh, 03ah, 020h, 08dh, 03eh, 00ah
        endif
        if      FW_VERSION >= 214
        db      08ah, 020h, 01bh, 008h, 02eh, 020h, 020h, 09ah, 020h, 0ebh, 00ah, 081h, 020h, 08ch, 020h, 0c7h
        db      020h, 081h, 020h, 08dh, 020h, 092h, 020h, 081h, 00ah, 01bh, 05ch, 020h, 0b3h, 020h, 086h, 020h
        db      01bh, 03dh, 020h, 085h, 020h, 081h
        db      " ST1"
        db      00ah, 08dh, 020h, 01bh, 056h, 020h, 0ech, 02eh, 00ah, 03ch, 01bh, 042h, 020h, 08dh, 03eh, 00ah
        endif
        if      FW_VERSION >= 212
        db      000h, 00ah, 083h
        db      " .ST2 "
        endif
        if      FW_VERSION = 212
        db      08dh, 020h, 0fah, 020h, 094h, 020h, 0e9h, 020h, 01bh, 06bh, 00ah
        db      "itself.  "
        db      09bh, 020h, 01bh, 013h, 020h, 0e8h, 020h, 081h, 020h, 090h, 00ah, 0c4h, 020h, 081h
        db      " corresponding .ST1"
        db      00ah, 08dh, 02eh, 00ah, 000h, 00ah, 083h, 020h, 0a4h, 020h, 0fah, 020h, 094h, 020h, 099h, 020h
        db      01bh, 047h, 00ah
        db      "Edit Loop "
        db      08ah, 020h, 0dch, 02eh, 020h, 020h, 0c9h, 020h, 03ch, 01bh, 009h, 03eh, 00ah, 085h, 020h, 01bh
        db      05bh, 020h, 085h, 020h, 01bh, 048h, 020h, 0cbh
        db      " were."
        db      00ah, 000h, 00ah, 0a8h
        endif
        if      FW_VERSION >= 214
        db      08dh, 020h, 01bh, 000h, 020h, 094h, 020h, 0ech, 020h, 01bh, 07ch, 00ah
        db      "itself.  "
        db      09ah, 020h, 01bh, 001h, 020h, 0ebh, 020h, 081h, 020h, 08ch, 00ah, 0c7h, 020h, 081h
        db      " corresponding .ST1"
        db      00ah, 08dh, 02eh, 00ah, 000h, 00ah, 083h, 020h, 0a5h, 020h, 01bh, 000h, 020h, 094h, 020h, 099h
        db      020h, 01bh, 054h, 00ah
        db      "Edit Loop "
        db      08ah, 020h, 0ddh, 02eh, 020h, 020h, 0bch, 020h, 03ch, 01bh, 011h, 03eh, 00ah, 085h, 020h, 01bh
        db      065h, 020h, 085h, 020h, 01bh, 04eh, 020h, 0beh
        db      " were."
        db      00ah, 000h, 00ah, 0a3h
        endif
        if      FW_VERSION >= 212
        db      " Sound Memory Expansion Option "
        db      08ah, 00ah
        db      "required "
        endif
        if      FW_VERSION = 212
        db      0ddh, 020h, 08fh, 020h, 0f9h, 020h, 091h, 020h, 08dh
        db      " can"
        db      00ah, 094h, 020h, 0e9h
        db      ".  See your Akai dealer "
        db      0aeh, 00ah, 01bh
        db      "V information."
        db      00ah, 000h, 00ah
        endif
        if      FW_VERSION >= 214
        db      0d8h, 020h, 090h, 020h, 0ffh, 020h, 092h, 020h, 08dh
        db      " can"
        db      00ah, 094h, 020h, 0ech
        db      ".  See your Akai dealer "
        db      0ach, 00ah, 01bh, 05ah, 020h, 01bh, 0a8h, 02eh, 00ah, 000h, 00ah
        endif
        if      FW_VERSION >= 212
        db      "Step xx "
        db      0d6h, 020h, 061h, 020h, 082h, 020h, 086h, 020h, 08ah, 00ah
        db      "empty.  "
        endif
        if      FW_VERSION = 212
        db      09bh, 020h, 01bh, 032h, 020h, 0eeh, 020h, 0f0h, 020h, 061h, 00ah, 082h, 020h, 086h, 020h, 08ah
        db      020h, 0c5h, 020h, 0a6h, 020h, 01bh, 0a8h, 02eh, 00ah, 000h, 0e2h, 020h, 0b0h
        db      " too "
        db      01bh, 083h, 020h, 0d7h, 020h, 0a6h, 020h, 081h, 00ah, 082h, 020h, 085h, 020h, 094h, 020h, 01bh
        db      0d2h, 020h, 01bh, 089h, 020h, 01bh, 090h, 00ah, 08fh, 020h, 0ach
        db      ".  Reduce "
        db      081h, 020h, 0ach, 020h, 0b4h, 020h, 01bh, 07bh, 00ah, 01bh, 067h, 020h, 098h, 020h, 0cbh
        db      "'re "
        db      0edh, 020h, 01bh, 01ah
        endif
        if      FW_VERSION >= 214
        db      09ah, 020h, 01bh, 037h, 020h, 0e7h, 020h, 0f3h, 020h, 061h, 00ah, 082h, 020h, 086h, 020h, 08ah
        db      020h, 0cah, 020h, 0a8h, 020h, 01bh, 085h, 02eh, 00ah, 000h, 0e2h, 020h, 0b0h
        db      " too "
        db      01bh, 08ah, 020h, 0d9h, 020h, 0a8h, 020h, 081h, 00ah, 082h, 020h, 085h, 020h, 094h, 020h, 01bh
        db      0e3h, 020h, 01bh, 02ch, 020h, 01bh, 090h, 00ah, 090h, 020h, 0aeh
        db      ".  Reduce "
        db      081h, 020h, 0aeh, 020h, 0b5h, 020h, 01bh, 06ah, 00ah, 01bh, 081h, 020h, 096h, 020h, 0beh
        db      "'re "
        db      0efh, 020h, 01bh, 01eh
        endif
        if      FW_VERSION >= 212
        db      ".  (Try"
        db      00ah
        db      "erasing "
        endif
        if      FW_VERSION = 212
        db      0beh, 020h, 095h
        db      " pressure "
        db      01bh, 0f7h, 02ch, 00ah, 01bh, 080h, 020h, 0cbh
        db      "'re "
        db      0edh, 020h, 01bh, 01ah
        db      " them.)"
        db      00ah, 000h, 0a8h, 020h, 0cch, 020h, 01bh, 015h
        endif
        if      FW_VERSION >= 214
        db      0c2h, 020h, 095h
        db      " pressure messages,"
        db      00ah, 01bh, 083h, 020h, 0beh
        db      "'re "
        db      0efh, 020h, 01bh, 01eh
        db      " them.)"
        db      00ah, 000h, 0a3h, 020h, 0cfh, 020h, 01bh, 019h
        endif
        if      FW_VERSION >= 212
        db      " pulse rate "
        db      08ah
        db      " too"
        db      00ah
        endif
        if      FW_VERSION = 212
        db      "high.  Make sure "
        db      081h
        endif
        if      FW_VERSION >= 214
        db      "high.  Make "
        db      01bh, 0f4h, 020h, 081h
        endif
        if      FW_VERSION >= 212
        db      " proper Sync"
        db      00ah
        db      "Input Mode "
        db      08ah, 020h, 089h
        db      ".  Check "
        db      081h, 00ah
        db      "Sync-In Level adjustment "
        endif
        if      FW_VERSION = 212
        db      01bh, 046h, 020h, 081h, 00ah
        db      "back panel."
        db      00ah, 000h, 0e2h, 020h, 08ah, 020h, 01bh, 0e1h, 020h, 01bh, 056h, 020h, 0bbh, 020h, 01bh, 0d5h
        endif
        if      FW_VERSION >= 214
        db      01bh, 036h, 020h, 081h, 00ah
        db      "back panel."
        db      00ah, 000h, 0e2h, 020h, 08ah, 020h, 01bh, 0eeh, 020h, 01bh, 05ah, 020h, 0b8h, 020h, 01bh, 0d6h
        endif
        if      FW_VERSION >= 212
        db      " avail-"
        db      00ah
        db      "able "
        endif
        if      FW_VERSION = 212
        db      0aeh, 020h, 082h, 020h, 098h, 02eh, 020h, 020h, 09bh, 020h, 0e7h, 00ah, 01bh, 086h, 020h, 092h
        db      020h, 028h, 01bh, 02eh, 020h, 01bh, 09eh
        db      " them "
        db      085h, 00ah, 090h, 029h, 020h, 085h
        endif
        if      FW_VERSION >= 214
        db      0ach, 020h, 082h, 020h, 096h, 02eh, 020h, 020h, 09ah, 020h, 0edh, 00ah, 01bh, 094h, 020h, 093h
        db      020h, 028h, 01bh, 032h, 020h, 01bh, 09fh
        db      " them "
        db      085h, 00ah, 08ch, 029h, 020h, 085h
        endif
        if      FW_VERSION >= 212
        db      " make "
        db      01bh
        endif
        if      FW_VERSION = 212
        db      "V room."
        endif
        if      FW_VERSION >= 214
        db      "Z room."
        endif
        if      FW_VERSION >= 212
        db      00ah, 000h, 083h, 020h, 082h, 020h, 0d6h
        db      " too "
        endif
        if      FW_VERSION = 212
        db      01bh, 083h, 020h, 028h, 038h, 030h, 020h, 0b4h, 00ah, 01bh, 056h, 029h, 020h, 0eah, 020h, 0e4h
        db      020h, 0d1h, 02eh, 020h, 020h, 01bh, 044h, 020h, 081h, 00ah
        db      "'Delete Bars' "
        db      01bh, 0b9h, 020h, 01bh, 05ch, 020h, 085h
        db      " eliminate"
        db      00ah, 01bh, 086h, 020h, 091h, 020h, 01bh, 07eh, 02eh, 00ah, 000h
        db      "Sorry, but "
        db      08fh, 020h, 082h, 020h, 0d6h, 00ah
        db      "damaged "
        db      098h
        db      ".  An attempt "
        db      01bh, 042h, 020h, 01bh, 051h, 00ah
        endif
        if      FW_VERSION >= 214
        db      01bh, 08ah, 020h, 028h, 038h, 030h, 020h, 0b5h, 00ah, 01bh, 05ah, 029h, 020h, 0e1h, 020h, 0e9h
        db      020h, 0d3h, 02eh, 020h, 020h, 01bh, 02dh, 020h, 081h, 00ah
        db      "'Delete Bars' "
        db      01bh, 0c8h, 020h, 01bh, 027h, 020h, 085h
        db      " eliminate"
        db      00ah, 01bh, 094h, 020h, 092h, 020h, 01bh, 075h, 02eh, 00ah, 000h
        db      "Sorry, but "
        db      090h, 020h, 082h, 020h, 0d6h, 00ah
        db      "damaged "
        db      096h
        db      ".  An attempt "
        db      01bh, 040h, 020h, 01bh, 057h, 00ah
        endif
        if      FW_VERSION >= 212
        db      "made "
        db      085h
        db      " recover as much "
        endif
        if      FW_VERSION = 212
        db      098h, 020h, 061h, 073h, 00ah, 01bh, 085h
        db      ", but "
        db      01bh, 086h, 020h, 098h, 020h, 0f8h, 020h, 01bh, 0efh, 00ah, 01bh
        db      "Q lost."
        db      00ah, 000h
W_d2afa:
        db      07fh, 001h, 0fbh, 065h, 0ffh, 065h, 008h, 066h, 00dh, 066h, 013h, 066h, 016h, 066h, 01ch
        db      "f#f(f1f4f;fAfFfLfQfVfYfcfiflftf~f"
        db      088h, 066h, 08dh, 066h, 092h, 066h, 09ah, 066h, 0a1h, 066h, 0a8h, 066h, 0ach, 066h, 0b4h, 066h
        db      0bah, 066h, 0c1h, 066h, 0cah, 066h, 0d3h, 066h, 0d8h, 066h, 0e1h, 066h, 0e6h, 066h, 0e9h, 066h
        db      0f1h, 066h, 0f5h, 066h, 0fdh, 066h, 005h, 067h, 00eh, 067h, 014h, 067h, 01bh, 067h, 01fh
        db      "g$g(g2g6g;g>gEgLgUg]gcghgog|g"
        db      085h, 067h, 089h, 067h, 090h, 067h, 097h, 067h, 09ch, 067h, 0a1h, 067h, 0a6h, 067h, 0b1h, 067h
        db      0bbh, 067h, 0c5h, 067h, 0cbh, 067h, 0d9h, 067h, 0dfh, 067h, 0eah, 067h, 0eeh, 067h, 0f7h, 067h
        db      000h, 068h, 007h, 068h, 00ch, 068h, 011h, 068h, 019h
        db      "h!h+h5h>hGhNhThZhahhhohvh~h"
        db      083h, 068h, 08ch, 068h, 095h, 068h, 09bh, 068h, 0a5h, 068h, 0afh, 068h, 0b9h, 068h, 0c0h, 068h
        db      0c7h, 068h, 0ceh, 068h, 0d5h, 068h, 0dah, 068h, 0deh, 068h, 0e2h, 068h, 0e6h, 068h, 0e9h, 068h
        db      0efh, 068h, 0f4h, 068h, 0fbh, 068h, 004h, 069h, 00dh, 069h, 015h, 069h, 01dh
        db      "i#i)i-i2i9i@iEiKiPiUiZi^ifioiti|i"
        db      081h, 069h, 089h, 069h, 090h, 069h, 097h, 069h, 0a1h, 069h, 0a7h, 069h, 0adh, 069h, 0b7h, 069h
        db      0bdh, 069h, 0c9h, 069h, 0d0h, 069h, 0d6h, 069h, 0e0h, 069h, 0e6h, 069h, 0ebh, 069h, 0f0h, 069h
        db      0f6h, 069h, 0fch, 069h, 007h, 06ah, 00ch, 06ah, 012h, 06ah, 018h, 06ah, 01dh
        db      "j#j(j3j:jCjJjSj"
        db      05ch
        db      "jejljsj|j"
        db      080h, 06ah, 086h, 06ah, 090h, 06ah, 09ah, 06ah, 0a0h, 06ah, 0a6h, 06ah, 0ach, 06ah, 0b4h, 06ah
        db      0c0h, 06ah, 0c8h, 06ah, 0cfh, 06ah, 0dbh, 06ah, 0e0h, 06ah, 0e7h, 06ah, 0efh, 06ah, 0f6h, 06ah
        db      0fdh, 06ah, 002h, 06bh, 00eh, 06bh, 013h, 06bh, 01ah
        db      "k&k2k:kAkEkJkNkSkVk"
        db      05ch
        db      "kbkkktkzk"
        db      080h, 06bh, 086h, 06bh, 08fh, 06bh, 094h, 06bh, 09fh, 06bh, 0a4h, 06bh, 0a9h, 06bh, 0ach, 06bh
        db      0b1h, 06bh, 0b6h, 06bh, 0bbh, 06bh, 0cah, 06bh, 0ceh, 06bh, 0d5h, 06bh, 0dch, 06bh, 0e3h, 06bh
        db      0eah, 06bh, 0f1h, 06bh, 0f8h, 06bh, 0ffh, 06bh, 006h, 06ch, 00dh, 06ch, 014h, 06ch, 01ch
        db      "l$l,l6l:l?lGlQlTl"
        db      05ch
        db      "ldljlplzl"
        db      082h, 06ch, 088h, 06ch, 090h, 06ch, 096h, 06ch, 09eh, 06ch, 0a6h, 06ch, 0aah, 06ch, 0b4h, 06ch
        db      0beh, 06ch, 0c6h, 06ch, 0cch, 06ch, 0d2h, 06ch, 0dah, 06ch, 0e0h, 06ch, 0e3h, 06ch, 0e6h, 06ch
        db      0eah, 06ch, 0eeh, 06ch, 0f3h, 06ch, 0f8h, 06ch, 001h, 06dh, 006h, 06dh, 00fh, 06dh, 018h
        db      "m!m*m3m<mEmNmSmVm_mfmlmrm~m"
        db      085h, 06dh, 08ch, 06dh, 093h, 06dh, 099h, 06dh, 0a0h, 06dh, 0a6h, 06dh, 0ach, 06dh, 0b3h, 06dh
        db      0bah, 06dh, 0c0h, 06dh, 0c7h, 06dh, 0d3h, 06dh, 0dfh, 06dh, 0e5h, 06dh, 0ech, 06dh, 0f2h, 06dh
        db      0feh, 06dh, 005h, 06eh, 009h, 06eh, 014h, 06eh, 01ch
        db      "n$n(n3n8nCnGnOnWn_ndnlnpnxn"
        db      080h, 06eh, 085h, 06eh, 08dh, 06eh, 092h, 06eh, 097h, 06eh, 09bh, 06eh, 0a3h, 06eh, 0abh, 06eh
        db      0b6h, 06eh, 0bbh, 06eh, 0c3h, 06eh, 0cbh, 06eh, 0d6h, 06eh, 0deh, 06eh, 0e8h, 06eh, 0eeh, 06eh
        db      0f4h, 06eh, 0fah, 06eh, 004h, 06fh, 00ah, 06fh, 010h, 06fh, 01ah
        db      "o o&o0o6o@oJoToZo`ofopozo~o"
        db      083h, 06fh, 08ah, 06fh, 091h, 06fh, 098h, 06fh, 09fh, 06fh, 0a6h, 06fh, 0a9h, 06fh, 0aeh, 06fh
        db      0b5h, 06fh, 0bch, 06fh, 0c1h, 06fh, 0c8h, 06fh, 0cdh, 06fh, 0d2h, 06fh, 0d9h, 06fh, 0deh, 06fh
        db      0e3h, 06fh, 0eah, 06fh, 0f1h, 06fh, 0f8h, 06fh, 0fdh, 06fh, 004h, 070h, 00bh, 070h, 010h, 070h
        db      015h, 070h, 01ch
        db      "p#p,p5p>pGpPpYp]pfpopthe", 0
        endif
        if      FW_VERSION >= 214
        db      096h, 020h, 061h, 073h, 00ah, 01bh, 08bh
        db      ", but "
        db      01bh, 094h, 020h, 096h, 020h, 0fbh, 020h, 01bh, 0fah, 00ah, 01bh
        db      "W lost."
        db      00ah, 000h
        db      "FORMATTING "
        db      01bh, 0eah, 020h, 01bh, 0e1h
        db      " THE ENTIRE HARD"
        db      00ah
        db      "DISK! "
        db      0a3h, 020h, 08ch, 020h, 088h, 020h, 094h
        db      " divided "
        db      0cch, 00ah, 027h, 01bh, 0c0h, 027h, 020h, 092h
        db      " less "
        db      01bh, 0aeh
        db      " 30 megabytes"
        db      00ah, 01bh, 016h, 02eh, 020h, 0bch, 020h, 03ch, 0dfh, 03eh, 020h, 085h
        db      " go "
        db      085h, 020h, 081h
        db      " next"
        db      00ah, 0a7h, 02eh, 00ah, 00ah, 03ch, 0dfh, 03eh, 00ah, 000h, 0c1h, 020h, 087h, 020h, 092h, 020h
        db      01bh, 0c0h, 03ah, 020h, 020h, 020h, 028h, 041h, 02dh, 020h, 029h, 00ah, 028h, 01bh, 0edh
        db      " partition "
        db      088h, 020h, 094h
        db      "    mbytes, "
        db      0ach, 00ah
        db      "a total "
        db      092h
        db      "     mbytes. "
        db      01bh, 055h, 020h, 0beh
        db      " can't"
        db      00ah
        db      "decide, "
        db      01bh, 085h, 020h, 081h, 020h, 0d4h, 020h, 01bh, 0ddh, 02eh, 020h, 0bch, 00ah, 03ch, 0dfh, 03eh
        db      020h, 085h
        db      " go "
        db      085h, 020h, 081h
        db      " next "
        db      0a7h, 02eh, 029h, 00ah, 00ah, 03ch, 0dfh, 03eh, 00ah, 000h, 0bch, 020h, 03ch, 0dfh, 03eh, 020h
        db      085h, 020h, 0f1h, 020h, 01bh, 05bh, 02eh, 00ah
        db      "THIS "
        db      01bh, 0eah, 020h, 01bh, 0e1h
        db      " ANY DATA ON THE HARD"
        db      00ah
        db      "DISK!"
        db      00ah, 00ah, 00ah, 00ah, 03ch, 0dfh, 03eh, 00ah, 000h
        db      "Are "
        db      0beh, 020h, 01bh, 0f4h, 020h, 0beh, 020h, 0fch, 020h, 085h, 020h, 01bh, 021h, 020h, 0e7h, 03fh
        db      00ah
        db      "THIS "
        db      01bh, 0eah
        db      " DESTROY EVERYTHING ON THE"
        db      00ah
        db      "HARD DISK! THIS IS THE LAST WARNING"
        db      00ah
        db      "SCREEN!"
        db      00ah, 00ah, 00ah
        db      "<Format "
        db      0e7h, 03eh, 00ah, 000h
        db      "Hard "
        db      08ch, 020h, 01bh
        db      "! failure. "
        db      09ah, 00ah
        db      "check "
        db      01bh, 017h, 020h, 081h, 020h, 01bh, 0b3h, 020h, 08ch, 020h, 08ah, 020h, 01bh, 02ch, 00ah, 0e6h
        db      020h, 09ch, 020h, 01bh, 0fdh, 020h, 01bh
        db      "6. Refer "
        db      085h, 00ah, 081h
        db      " SCSI "
        db      01bh, 0b3h, 020h, 08ch, 020h, 01bh
        db      "' installation"
        db      00ah
        db      "instructions "
        db      0ach, 020h, 01bh, 0c1h, 020h, 01bh, 0a8h, 02eh, 00ah, 000h
W_d2afa:
        db      07fh, 001h, 00ah, 06ah, 00eh, 06ah, 017h, 06ah, 01ch, 06ah, 022h
        db      "j%j+j2j7j@jCjJjOjTjZj`jejkjnjxj{j"
        db      083h, 06ah, 088h, 06ah, 092h, 06ah, 09ch, 06ah, 0a1h, 06ah, 0a8h, 06ah, 0b0h, 06ah, 0b4h, 06ah
        db      0bch, 06ah, 0c3h, 06ah, 0c9h, 06ah, 0d0h, 06ah, 0d9h, 06ah, 0e2h, 06ah, 0e6h, 06ah, 0ebh, 06ah
        db      0f4h, 06ah, 0f9h, 06ah, 000h, 06bh, 003h, 06bh, 00bh, 06bh, 013h, 06bh, 01bh, 06bh, 01fh
        db      "k(k.k3k7k;kEkJkOkRkYk`kgkokuk~k"
        db      084h, 06bh, 08bh, 06bh, 08fh, 06bh, 098h, 06bh, 0a5h, 06bh, 0abh, 06bh, 0afh, 06bh, 0b4h, 06bh
        db      0b9h, 06bh, 0c0h, 06bh, 0cah, 06bh, 0d5h, 06bh, 0dah, 06bh, 0e4h, 06bh, 0eeh, 06bh, 0f9h, 06bh
        db      0feh, 06bh, 00ch, 06ch, 015h, 06ch, 01eh
        db      "l%l*l2l:l@lJlSl"
        db      05ch
        db      "lcljlqlxl~l"
        db      085h, 06ch, 08dh, 06ch, 095h, 06ch, 09ah, 06ch, 09fh, 06ch, 0a5h, 06ch, 0afh, 06ch, 0b8h, 06ch
        db      0c1h, 06ch, 0cbh, 06ch, 0ceh, 06ch, 0d8h, 06ch, 0e2h, 06ch, 0e6h, 06ch, 0edh, 06ch, 0f4h, 06ch
        db      0fbh, 06ch, 002h, 06dh, 006h, 06dh, 00ah, 06dh, 010h, 06dh, 016h, 06dh, 01bh, 06dh, 022h
        db      "m+m4m:mBmHmPmTmYm`memjmqmwm}m"
        db      082h, 06dh, 08ah, 06dh, 093h, 06dh, 098h, 06dh, 09ch, 06dh, 0a4h, 06dh, 0a9h, 06dh, 0b1h, 06dh
        db      0b6h, 06dh, 0bdh, 06dh, 0c4h, 06dh, 0cah, 06dh, 0d6h, 06dh, 0dch, 06dh, 0e3h, 06dh, 0edh, 06dh
        db      0f3h, 06dh, 0f9h, 06dh, 003h, 06eh, 008h, 06eh, 00dh, 06eh, 012h, 06eh, 017h, 06eh, 01dh
        db      "n(n-n3n9n?nJnQnXn_nhnonxn"
        db      07fh, 06eh, 088h, 06eh, 091h, 06eh, 098h, 06eh, 0a1h, 06eh, 0aah, 06eh, 0aeh, 06eh, 0b2h, 06eh
        db      0b7h, 06eh, 0bdh, 06eh, 0c3h, 06eh, 0c9h, 06eh, 0cfh, 06eh, 0d9h, 06eh, 0e3h, 06eh, 0e6h, 06eh
        db      0eeh, 06eh, 0fah, 06eh, 006h, 06fh, 00bh, 06fh, 010h, 06fh, 017h
        db      "o#o/o;o?oDoIoPoWo_odoloso{o"
        db      082h, 06fh, 089h, 06fh, 08fh, 06fh, 098h, 06fh, 09eh, 06fh, 0a4h, 06fh, 0adh, 06fh, 0b6h, 06fh
        db      0bch, 06fh, 0c0h, 06fh, 0c6h, 06fh, 0c9h, 06fh, 0ceh, 06fh, 0d3h, 06fh, 0d8h, 06fh, 0e3h, 06fh
        db      0e8h, 06fh, 0f3h, 06fh, 0f8h, 06fh, 007h, 070h, 00eh, 070h, 015h, 070h, 01ch
        db      "p#p*p1p8p?pFpPpVp"
        db      05ch
        db      "pbphplptp|p"
        db      082h, 070h, 08ah, 070h, 08fh, 070h, 097h, 070h, 09fh, 070h, 0a9h, 070h, 0afh, 070h, 0b5h, 070h
        db      0bfh, 070h, 0c7h, 070h, 0cfh, 070h, 0d9h, 070h, 0e1h, 070h, 0e4h, 070h, 0ech, 070h, 0f4h, 070h
        db      0feh, 070h, 006h, 071h, 00ah, 071h, 00dh, 071h, 010h, 071h, 014h, 071h, 018h, 071h, 01ch
        db      "q%q.q7q<qEqJqSq"
        db      05ch
        db      "qeqhqqqvq"
        db      07fh, 071h, 084h, 071h, 08bh, 071h, 091h, 071h, 098h, 071h, 09fh, 071h, 0a5h, 071h, 0ach, 071h
        db      0b8h, 071h, 0beh, 071h, 0c4h, 071h, 0cah, 071h, 0d1h, 071h, 0d8h, 071h, 0deh, 071h, 0e4h, 071h
        db      0f0h, 071h, 0fch, 071h, 008h, 072h, 014h, 072h, 01bh
        db      "r'r-r3r:rArIrNrVrZrbrjrortr|r"
        db      084h, 072h, 08ch, 072h, 094h, 072h, 09fh, 072h, 0a7h, 072h, 0afh, 072h, 0b4h, 072h, 0b8h, 072h
        db      0c0h, 072h, 0c5h, 072h, 0d0h, 072h, 0d8h, 072h, 0e0h, 072h, 0e5h, 072h, 0edh, 072h, 0f1h, 072h
        db      0f6h, 072h, 001h, 073h, 006h, 073h, 011h, 073h, 015h, 073h, 01ah, 073h, 022h
        db      "s-s5s@sFsJsTsZs`sjspszs"
        db      080h, 073h, 08ah, 073h, 094h, 073h, 09ah, 073h, 0a4h, 073h, 0aah, 073h, 0b0h, 073h, 0b6h, 073h
        db      0c0h, 073h, 0c6h, 073h, 0cch, 073h, 0d6h, 073h, 0dch, 073h, 0e2h, 073h, 0ech, 073h, 0f3h, 073h
        db      0fah, 073h, 0ffh, 073h, 004h, 074h, 00bh, 074h, 012h, 074h, 017h, 074h, 01ah, 074h, 01fh
        db      "t&t-t4t;t@tEtLtStXt_tdtitntut|tthe", 0
        endif
        if      FW_VERSION >= 212
        db      "sequence", 0
        db      "This", 0
        db      "field", 0
        db      074h, 06fh, 000h
        db      "which", 0
        db      "number", 0
        db      "will", 0
        db      "selected", 0
        db      069h, 073h, 000h
        db      "select", 0
        endif
        if      FW_VERSION = 212
        db      "track", 0
        db      "file", 0
        endif
        if      FW_VERSION >= 214
        db      "disk", 0
        db      "file", 0
        db      "track", 0
        endif
        if      FW_VERSION >= 212
        db      "sound", 0
        db      "this", 0
        endif
        if      FW_VERSION = 212
        db      "disk", 0
        endif
        if      FW_VERSION >= 214
        db      "press", 0
        endif
        if      FW_VERSION >= 212
        db      06fh, 066h, 000h
        db      "sequences", 0
        endif
        if      FW_VERSION = 212
        db      "press", 0
        endif
        if      FW_VERSION >= 212
        db      062h, 065h, 000h
        db      "channel", 0
        endif
        if      FW_VERSION >= 214
        db      "data", 0
        endif
        if      FW_VERSION >= 212
        db      "specifies", 0
        db      "displayed", 0
        endif
        if      FW_VERSION = 212
        db      "data", 0
        db      "used", 0
        db      "selects", 0
        db      "Please", 0
        db      "change", 0
        endif
        if      FW_VERSION >= 214
        db      "used", 0
        db      "Please", 0
        db      "selects", 0
        endif
        if      FW_VERSION >= 212
        db      061h, 06eh, 064h, 000h
        db      "pressed", 0
        endif
        if      FW_VERSION >= 214
        db      "change", 0
        endif
        if      FW_VERSION >= 212
        db      "drums", 0
        db      "copied", 0
        db      "settings", 0
        db      "velocity", 0
        endif
        if      FW_VERSION >= 214
        db      054h, 068h, 065h, 000h
        endif
        if      FW_VERSION >= 212
        db      "when", 0
        db      "function", 0
        db      "drum", 0
        endif
        if      FW_VERSION = 212
        db      069h, 06eh, 000h
        db      "Execute", 0
        db      054h, 068h, 065h, 000h
        db      "setting", 0
        db      "changed", 0
        endif
        if      FW_VERSION >= 214
        db      "screen", 0
        db      069h, 06eh, 000h
        db      "setting", 0
        db      "Execute", 0
        db      "changed", 0
        db      066h, 06fh, 072h, 000h
        endif
        if      FW_VERSION >= 212
        db      "location", 0
        db      "tempo", 0
        endif
        if      FW_VERSION = 212
        db      "screen", 0
        db      066h, 06fh, 072h, 000h
        db      "from", 0
        db      061h, 072h, 065h, 000h
        db      "specified", 0
        db      073h, 065h, 074h, 000h
        db      "name", 0
        db      06fh, 072h, 000h
        db      "output", 0
        db      "fields", 0
        db      "existing", 0
        endif
        if      FW_VERSION >= 214
        db      "from", 0
        db      061h, 072h, 065h, 000h, 073h, 065h, 074h, 000h
        db      "specified", 0
        db      "name", 0
        db      "then", 0
        db      06fh, 072h, 000h
        db      "fields", 0
        db      "output", 0
        db      "memory", 0
        endif
        if      FW_VERSION >= 212
        db      "another", 0
        db      "event", 0
        endif
        if      FW_VERSION = 212
        db      "then", 0
        db      "memory", 0
        db      "milliseconds", 0
        db      "SEQUENCE", 0
        db      061h, 06ch, 06ch, 000h
        db      "Select", 0
        db      "allows", 0
        db      "play", 0
        db      "note", 0
        db      "Midi", 0
        db      "containing", 0
        db      "currently", 0
        db      "character", 0
        db      "Enter", 0
        db      "automatically", 0
        db      "Press", 0
        db      "determines", 0
        db      079h, 06fh, 075h, 000h
        db      "external", 0
        db      "keyboard", 0
        endif
        if      FW_VERSION >= 214
        db      "existing", 0
        db      "Press", 0
        db      "Select", 0
        db      079h, 06fh, 075h, 000h
        db      "SEQUENCE", 0
        db      "milliseconds", 0
        db      "Enter", 0
        db      061h, 06ch, 06ch, 000h
        db      "note", 0
        db      "play", 0
        db      "allows", 0
        db      "character", 0
        db      "containing", 0
        db      "Midi", 0
        db      "formatted", 0
        db      "currently", 0
        db      "determines", 0
        db      "into", 0
        db      "automatically", 0
        db      "keyboard", 0
        db      "external", 0
        endif
        if      FW_VERSION >= 212
        db      "within", 0
        db      "song", 0
        endif
        if      FW_VERSION = 212
        db      "into", 0
        db      "changes", 0
        db      "current", 0
        db      "formatted", 0
        db      "metronome", 0
        db      "recorded", 0
        db      "contains", 0
        db      "events", 0
        db      "value", 0
        db      "notes", 0
        db      "tracks", 0
        db      "sample", 0
        db      "active", 0
        db      "before", 0
        db      "options", 0
        db      "here", 0
        db      "inserted", 0
        db      "incoming", 0
        endif
        if      FW_VERSION >= 214
        db      "current", 0
        db      "changes", 0
        db      "value", 0
        db      "metronome", 0
        db      "contains", 0
        db      "recorded", 0
        db      "before", 0
        db      "events", 0
        db      "sample", 0
        db      "tracks", 0
        db      "notes", 0
        db      "active", 0
        db      "options", 0
        db      "Proceed", 0
        db      "here", 0
        db      "time", 0
        endif
        if      FW_VERSION >= 212
        db      "There", 0
        db      "recording", 0
        endif
        if      FW_VERSION = 212
        db      "signature", 0
        db      "indicates", 0
        db      "volume", 0
        db      "delete", 0
        endif
        if      FW_VERSION >= 214
        db      "inserted", 0
        db      "incoming", 0
        db      "connected", 0
        db      069h, 074h, 000h
        db      "indicates", 0
        db      "signature", 0
        db      06eh, 065h, 077h, 000h
        endif
        if      FW_VERSION >= 212
        db      "insert", 0
        db      "loaded", 0
        endif
        if      FW_VERSION = 212
        db      "time", 0
        db      06fh, 06eh, 065h, 000h, 06eh, 065h, 077h, 000h, 06eh, 06fh, 074h, 000h, 069h, 074h, 000h
        endif
        if      FW_VERSION >= 214
        db      "delete", 0
        db      "volume", 0
        db      06eh, 06fh, 074h, 000h, 06fh, 06eh, 065h, 000h
        db      "start", 0
        endif
        if      FW_VERSION >= 212
        db      "input", 0
        db      "with", 0
        db      "single", 0
        db      "contents", 0
        db      "pressing", 0
        endif
        if      FW_VERSION = 212
        db      "portion", 0
        db      "receive", 0
        db      "mixer", 0
        db      "start", 0
        db      06dh, 061h, 079h, 000h
        db      "type", 0
        db      "cannot", 0
        endif
        if      FW_VERSION >= 214
        db      "mixer", 0
        db      "receive", 0
        db      "wheel", 0
        db      "portion", 0
        db      06dh, 061h, 079h, 000h
        db      "want", 0
        endif
        if      FW_VERSION >= 212
        db      "erased", 0
        db      "step", 0
        endif
        if      FW_VERSION = 212
        db      "again", 0
        db      "copy", 0
        db      "midi", 0
        endif
        if      FW_VERSION >= 214
        db      "type", 0
        db      "cannot", 0
        db      "first", 0
        db      "again", 0
        db      "midi", 0
        db      "sampler", 0
        db      "position", 0
        endif
        if      FW_VERSION >= 212
        db      "sets", 0
        db      065h, 06eh, 064h, 000h
        endif
        if      FW_VERSION = 212
        db      "between", 0
        db      "position", 0
        db      "also", 0
        db      "correct", 0
        db      "want", 0
        db      "sampler", 0
        db      "Frames", 0
        db      "Cancel", 0
        db      "connected", 0
        db      "wheel", 0
        db      "ENTER", 0
        db      "different", 0
        db      "plays", 0
        db      "punctuation", 0
        db      "timing", 0
        db      "other", 0
        db      "functions", 0
        db      "first", 0
        endif
        if      FW_VERSION >= 214
        db      "correct", 0
        db      "also", 0
        db      "between", 0
        db      "copy", 0
        db      "Frames", 0
        db      "timing", 0
        db      "saved", 0
        db      "punctuation", 0
        db      "plays", 0
        db      "Cancel", 0
        db      "functions", 0
        db      "ENTER", 0
        db      "other", 0
        db      "different", 0
        db      "each", 0
        db      "that", 0
        endif
        if      FW_VERSION >= 212
        db      "bars", 0
        db      "sync", 0
        endif
        if      FW_VERSION = 212
        db      "enter", 0
        db      "SMPTE", 0
        db      "characters", 0
        db      "each", 0
        db      "using", 0
        db      "saved", 0
        db      "only", 0
        db      "These", 0
        db      "that", 0
        db      "assignment", 0
        db      "Change", 0
        db      "previous", 0
        db      "unused", 0
        db      "sampling", 0
        db      "VELOCITY", 0
        db      "starting", 0
        db      "always", 0
        db      "entire", 0
        db      "DURATION", 0
        db      062h, 061h, 072h, 000h
        db      "level", 0
        db      "determine", 0
        db      "operation", 0
        db      "right", 0
        db      "after", 0
        db      "range", 0
        db      "whether", 0
        db      "destination", 0
        db      "replace", 0
        db      "either", 0
        db      "assignments", 0
        db      "Save", 0
        db      "played", 0
        db      "outputs", 0
        db      "should", 0
        db      "normal", 0
        db      "Load", 0
        db      "repetitions", 0
        db      "sent", 0
        endif
        if      FW_VERSION >= 214
        db      "These", 0
        db      "assignment", 0
        db      "only", 0
        db      "SMPTE", 0
        db      "using", 0
        db      "enter", 0
        db      "characters", 0
        db      "format", 0
        db      "Change", 0
        db      "unused", 0
        db      "DURATION", 0
        db      "entire", 0
        db      "starting", 0
        db      "option", 0
        db      "VELOCITY", 0
        db      "sampling", 0
        db      "always", 0
        db      "previous", 0
        db      "properly", 0
        db      055h, 073h, 065h, 000h, 062h, 061h, 072h, 000h
        db      "Save", 0
        db      "range", 0
        db      "level", 0
        db      "after", 0
        db      "right", 0
        db      "operation", 0
        db      "determine", 0
        db      06fh, 06eh, 000h
        db      "replace", 0
        db      "assignments", 0
        db      "convenience", 0
        db      "load", 0
        db      "Beat", 0
        endif
        if      FW_VERSION >= 212
        db      "sounds", 0
        db      "corresponds", 0
        endif
        if      FW_VERSION = 212
        db      "convenience", 0
        db      "desired", 0
        db      "exists", 0
        endif
        if      FW_VERSION >= 214
        db      "repetitions", 0
        db      "destination", 0
        endif
        if      FW_VERSION >= 212
        db      068h, 061h, 073h, 000h
        db      "save", 0
        endif
        if      FW_VERSION = 212
        db      055h, 073h, 065h, 000h
        db      "Beat", 0
        db      06fh, 06eh, 000h
        db      "while", 0
        db      "where", 0
        db      "channels", 0
        db      "assigned", 0
        db      "blank", 0
        db      "steps", 0
        db      "types", 0
        db      "received", 0
        db      "same", 0
        db      "correspond", 0
        db      "been", 0
        db      "load", 0
        db      049h, 066h, 000h
        db      "keys", 0
        db      "just", 0
        db      "more", 0
        db      "proportionally", 0
        db      041h, 04ch, 04ch, 000h
        db      "stored", 0
        db      "tuning", 0
        db      "return", 0
        db      "option", 0
        db      "region", 0
        db      "stereo", 0
        db      "record", 0
        db      "amount", 0
        db      "cursor", 0
        db      "MASTER", 0
        db      "softkey", 0
        db      "entered", 0
        db      "specify", 0
        db      "transpose", 0
        db      061h, 06eh, 079h, 000h
        endif
        if      FW_VERSION >= 214
        db      "Load", 0
        db      "normal", 0
        db      "played", 0
        db      "outputs", 0
        db      "sent", 0
        db      "whether", 0
        db      "either", 0
        db      "desired", 0
        db      "exists", 0
        db      "should", 0
        db      "steps", 0
        db      "channels", 0
        db      "where", 0
        db      "types", 0
        db      "assigned", 0
        db      "received", 0
        db      "blank", 0
        db      041h, 04ch, 04ch, 000h
        db      "while", 0
        db      049h, 066h, 000h
        db      "just", 0
        db      "been", 0
        db      "keys", 0
        db      "correspond", 0
        db      "more", 0
        db      "formatting", 0
        db      "same", 0
        db      "proportionally", 0
        db      "region", 0
        db      "stored", 0
        db      "MASTER", 0
        db      "cursor", 0
        db      "stereo", 0
        db      "amount", 0
        db      "record", 0
        db      "return", 0
        db      "tuning", 0
        db      "available", 0
        db      "CLOCK", 0
        db      "START", 0
        db      "erase", 0
        db      "clock", 0
        db      042h, 041h, 052h, 000h
        db      "default", 0
        db      "removed", 0
        db      "Clock", 0
        db      "entered", 0
        endif
        if      FW_VERSION >= 212
        db      "echo", 0
        db      "fadeout", 0
        endif
        if      FW_VERSION = 212
        db      "corrected", 0
        db      062h, 079h, 000h
        db      "tunings", 0
        db      "default", 0
        db      "shown", 0
        db      "Clock", 0
        db      "selecting", 0
        db      "removed", 0
        db      "CLOCK", 0
        db      "triplet", 0
        db      "clock", 0
        db      "dynamic", 0
        db      "created", 0
        db      042h, 041h, 052h, 000h
        db      "available", 0
        db      "generated", 0
        db      "Proceed", 0
        db      "erase", 0
        db      "START", 0
        db      "display", 0
        db      "these", 0
        db      054h, 06fh, 000h, 069h, 066h, 000h, 04fh, 046h, 046h, 000h, 053h, 065h, 074h, 000h
        db      "many", 0
        db      "left", 0
        db      "possible", 0
        db      "some", 0
        db      "changing", 0
        db      "addition", 0
        db      "properly", 0
        db      "internal", 0
        db      "dynamics", 0
        db      "modulate", 0
        db      "retained", 0
        endif
        if      FW_VERSION >= 214
        db      "softkey", 0
        db      "generated", 0
        db      "these", 0
        db      "shown", 0
        db      "transpose", 0
        db      "created", 0
        db      "display", 0
        db      "selecting", 0
        db      "dynamic", 0
        db      062h, 079h, 000h
        db      "specify", 0
        db      "tunings", 0
        db      "corrected", 0
        db      "triplet", 0
        db      061h, 06eh, 079h, 000h, 054h, 06fh, 000h, 069h, 066h, 000h, 04fh, 046h, 046h, 000h, 075h, 073h
        db      065h, 000h, 053h, 065h, 074h, 000h
        db      "internal", 0
        db      "changing", 0
        db      "dynamics", 0
        db      "many", 0
        db      "possible", 0
        db      "left", 0
        db      "whenever", 0
        db      "modulate", 0
        db      "addition", 0
        db      061h, 074h, 000h
        endif
        if      FW_VERSION >= 212
        db      "softkeys", 0
        db      "mode", 0
        endif
        if      FW_VERSION = 212
        db      061h, 074h, 000h
        db      "whenever", 0
        db      "Minute", 0
        db      "jacks", 0
        db      "above", 0
        db      "overdubbing", 0
        db      "effect", 0
        db      "errors", 0
        db      "except", 0
        db      "shows", 0
        db      "letter", 0
        db      "match", 0
        db      "Erase", 0
        db      "Insert", 0
        db      "saving", 0
        db      "lower", 0
        db      "format", 0
        db      "sensitivity", 0
        db      "eliminating", 0
        db      "Tempo", 0
        db      "enough", 0
        db      "being", 0
        db      "permanently", 0
        db      "EXCEPT", 0
        db      075h, 073h, 065h, 000h
        db      "recordings", 0
        db      "contain", 0
        db      "editing", 0
        db      050h, 065h, 072h, 000h
        db      "controller", 0
        db      "wish", 0
        db      "transposed", 0
        db      06dh, 069h, 078h, 000h
        db      "sustain", 0
        db      "quickly", 0
        db      "because", 0
        db      "BEAT", 0
        db      "control", 0
        db      06fh, 075h, 074h, 000h
        db      "deleted", 0
        db      "example", 0
        db      "edit", 0
        db      "perform", 0
        db      "STEP", 0
        db      "over", 0
        db      074h, 072h, 079h, 000h
        db      "Program", 0
        db      "through", 0
        db      "increments", 0
        db      "loop", 0
        db      "message", 0
        db      "playing", 0
        db      "percentage", 0
        db      "Choices", 0
        db      "contained", 0
        db      "AFTER", 0
        db      "added", 0
        db      "disks", 0
        db      "automated", 0
        db      "songs", 0
        db      "reset", 0
        db      "replacing", 0
        db      "power", 0
        db      "newly", 0
        db      "beginning", 0
        db      "Beats", 0
        db      "processed", 0
        db      "directory", 0
        db      "indicated", 0
        db      "space", 0
        db      "Wheel", 0
        db      "point", 0
        db      "threshold", 0
        db      "including", 0
        db      053h, 045h, 054h, 000h
        db      "than", 0
        db      "erases", 0
        db      "frames", 0
        db      "ATTACK", 0
        db      "actual", 0
        db      "cancel", 0
        db      06eh, 06fh, 000h
        db      "Move", 0
        db      "period", 0
        db      "attack", 0
        db      "send", 0
        db      "button", 0
        db      "ends", 0
        db      "NOTE", 0
        db      "moving", 0
        db      "port", 0
        db      "ONLY", 0
        db      "RECORD", 0
        db      "signal", 0
        db      "typing", 0
        db      "have", 0
        db      "MEDIUM", 0
        db      "strike", 0
        db      "once", 0
        db      "part", 0
        db      "during", 0
        db      "useful", 0
        db      "controls", 0
        db      "messages", 0
        db      "Anything", 0
        db      "Pressing", 0
        db      "Sequence", 0
        db      "duration", 0
        db      06fh, 066h, 066h, 000h
        db      "exceeded", 0
        db      "response", 0
        db      "produces", 0
        phase   7078h
        endif
        if      FW_VERSION >= 214
        db      "retained", 0
        db      "some", 0
        db      "Insert", 0
        db      "shows", 0
        db      "Minute", 0
        db      "except", 0
        db      "Erase", 0
        db      "enough", 0
        db      "PERMANENTLY", 0
        db      "jacks", 0
        db      "match", 0
        db      "drive", 0
        db      "saving", 0
        db      "EXCEPT", 0
        db      "lower", 0
        db      "being", 0
        db      "eliminating", 0
        db      "permanently", 0
        db      "overdubbing", 0
        db      "sensitivity", 0
        db      "letter", 0
        db      "information", 0
        db      "above", 0
        db      "Tempo", 0
        db      "errors", 0
        db      "effect", 0
        db      "through", 0
        db      "than", 0
        db      "quickly", 0
        db      06fh, 075h, 074h, 000h
        db      "sustain", 0
        db      "Choices", 0
        db      "hard", 0
        db      "over", 0
        db      "contain", 0
        db      "because", 0
        db      "usually", 0
        db      "example", 0
        db      "increments", 0
        db      "editing", 0
        db      "playing", 0
        db      "BEAT", 0
        db      050h, 065h, 072h, 000h
        db      "Program", 0
        db      "wish", 0
        db      "partitions", 0
        db      "further", 0
        db      "control", 0
        db      "once", 0
        db      "message", 0
        db      06dh, 069h, 078h, 000h
        db      "loop", 0
        db      "recordings", 0
        db      "edit", 0
        db      "controller", 0
        db      074h, 072h, 079h, 000h
        db      "STEP", 0
        db      "perform", 0
        db      "percentage", 0
        db      "deleted", 0
        db      "transposed", 0
        db      "point", 0
        db      053h, 045h, 054h, 000h
        db      "indicated", 0
        db      "Wheel", 0
        db      "disks", 0
        db      "contained", 0
        db      "space", 0
        db      "automated", 0
        db      "added", 0
        db      "replacing", 0
        db      "threshold", 0
        db      "power", 0
        db      "directory", 0
        db      "given", 0
        db      "AFTER", 0
        db      "reset", 0
        db      "including", 0
        db      "ERASE", 0
        db      "newly", 0
        db      "processed", 0
        db      "Beats", 0
        db      "songs", 0
        db      "beginning", 0
        db      "moving", 0
        db      "cancel", 0
        db      "ONLY", 0
        db      "WILL", 0
        db      "ATTACK", 0
        db      "useful", 0
        db      "Each", 0
        db      06eh, 06fh, 000h
        db      "port", 0
        db      "actual", 0
        db      "attack", 0
        db      "strike", 0
        db      "RECORD", 0
        db      "sure", 0
        db      "part", 0
        db      "frames", 0
        db      "signal", 0
        db      "NOTE", 0
        db      "MEDIUM", 0
        db      "have", 0
        db      "Move", 0
        db      "ends", 0
        db      "turned", 0
        db      "erases", 0
        db      "typing", 0
        phase   7483h
        endif
        if      FW_VERSION >= 212
        RUN_FAR_D3873
        endif
        if      FW_VERSION = 212
        phase   0fh
        endif
        if      FW_VERSION >= 214
        phase   0ah
        endif
far_d391a:
        push    bp
        mov     bp, sp
        if      FW_VERSION < 212
        add     sp, 0fffch
        endif
        cmp     byte ptr [B_53AB], 0
        jz      br_d3936
        cmp     byte ptr [B_4E7A], 6
        jz      br_d3936
        cmp     byte ptr [B_4E7A], 5
        jz      br_d3936
br_d3932:
        mov     sp, bp
        pop     bp
        retf
br_d3936:
        callf   SEG_E85C:far_e8607
        jmp     br_d3932
far_d393d:
        push    bp
        mov     bp, sp
        add     sp, 0fff4h
        push    di
        push    si
        cmp     word ptr [bp + 8], 0
        jnz     br_d394e
        jmp     br_d3a1e
br_d394e:
        and.w   word ptr [bp + 0ah], 3
        mov     ax, word ptr [bp + 6]
        mov     cx, 0ah
        sub     dx, dx
        div     cx
        sub     dx, dx
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        mov     ax, word ptr [bp + 6]
        sub     dx, dx
        mov     bx, dx
        mov     cx, ax
        push    bx
        push    cx
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        push    ax
        xchg    dx, ax
        mov     bx, 0ah
        mul     bx
        mov     cx, ax
        pop     ax
        mul     bx
        add     dx, cx
        pop     cx
        pop     bx
        sub     cx, ax
        sbb     bx, dx
        mov     dx, bx
        mov     ax, cx
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        push    ax
        xchg    dx, ax
        mov     bx, 3e8h
        mul     bx
        mov     cx, ax
        pop     ax
        mul     bx
        add     dx, cx
        mov     bx, 0
        mov     cx, 8
        callf   SEG_F26A:far_f26a7
        mov     di, dx
        mov     si, ax
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        push    ax
        xchg    dx, ax
        mov     bx, 3e8h
        mul     bx
        mov     cx, ax
        pop     ax
        mul     bx
        add     dx, cx
        add     si, ax
        adc     di, dx
        mov     dx, di
        mov     ax, si
        push    dx
        push    ax
        mov     bx, word ptr [bp + 0ah]
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_3578]
        cwd
        mov     di, dx
        mov     si, ax
        pop     ax
        pop     dx
        push    ax
        push    dx
        mul     di
        mov     di, ax
        pop     ax
        mul     si
        add     di, ax
        pop     ax
        mul     si
        add     dx, di
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    dx
        push    ax
        mov     ax, word ptr [bx + TBL_3580]
        cwd
        mov     bx, dx
        mov     cx, ax
        pop     ax
        pop     dx
        callf   SEG_F26A:far_f26a7
        add     ax, 5
        adc     dx, 0
        mov     bx, 0
        mov     cx, 0ah
        callf   SEG_F26A:far_f26a7
br_d3a18:
        pop     si
        pop     di
        mov     sp, bp
        pop     bp
        retf
br_d3a1e:
        mov     ax, word ptr [bp + 6]
        sub     dx, dx
        mov     bx, dx
        mov     cx, ax
        mov     dx, 4a8h
        mov     ax, 17c8h
        callf   SEG_F26A:far_f2701
        add     ax, 5
        adc     dx, 0
        mov     bx, 0
        mov     cx, 0ah
        callf   SEG_F26A:far_f2701
        jmp     br_d3a18
far_d3a45:
        push    bp
        mov     bp, sp
        add     sp, 0fff4h
        cmp     word ptr [bp + 8], 0
        jnz     br_d3a54
        jmp     near br_d3afe
br_d3a54:
        and.w   word ptr [bp + 0ah], 3
        mov     bx, word ptr [bp + 0ah]
        shl     bx, 1
        mov     ax, word ptr [bp + 6]
        mov     bx, word ptr [bx + TBL_3580]
        mul     bx
        push    dx
        push    ax
        mov     bx, word ptr [bp + 0ah]
        shl     bx, 1
        mov     ax, word ptr [bx + TBL_3578]
        cwd
        mov     bx, dx
        mov     cx, ax
        pop     ax
        pop     dx
        callf   SEG_F26A:far_f26a7
        add     ax, 5
        adc     dx, 0
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        mov     bx, 0
        mov     cx, 64h
        callf   SEG_F26A:far_f26a7
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        push    ax
        xchg    dx, ax
        mov     bx, 64h
        mul     bx
        mov     cx, ax
        pop     ax
        mul     bx
        add     dx, cx
        mov     bx, word ptr [bp - 0ah]
        mov     cx, word ptr [bp - 0ch]
        sub     cx, ax
        sbb     bx, dx
        mov     dx, bx
        mov     ax, cx
        push    ax
        xchg    dx, ax
        mov     bx, 8
        mul     bx
        mov     cx, ax
        pop     ax
        mul     bx
        add     dx, cx
        mov     bx, 0
        mov     cx, 64h
        callf   SEG_F26A:far_f26a7
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        push    dx
        push    ax
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        push    ax
        xchg    dx, ax
        mov     bx, 0ah
        mul     bx
        mov     cx, ax
        pop     ax
        mul     bx
        add     dx, cx
        mov     bx, dx
        mov     cx, ax
        pop     ax
        pop     dx
        add     cx, ax
        adc     bx, dx
        mov     dx, bx
        mov     ax, cx
br_d3afa:
        mov     sp, bp
        pop     bp
        retf
br_d3afe:
        mov     ax, word ptr [bp + 6]
        sub     dx, dx
        mov     bx, dx
        mov     cx, ax
        mov     dx, 4a8h
        mov     ax, 17c8h
        callf   SEG_F26A:far_f2701
        add     ax, 5
        adc     dx, 0
        mov     bx, 0
        mov     cx, 0ah
        callf   SEG_F26A:far_f2701
        jmp     br_d3afa
        if      FW_VERSION < 212
        phase   2
        elseif  FW_VERSION = 212
        phase   0ah
        else
        phase   5
        endif
far_d3b25:
        push    cx
        push    dx
        callf   SEG_D3B2:far_d3c5a
        mov     bl, al
        sub     bl, 55h
        jc      br_d3b38
        cmp     bl, 6
        jc      br_d3b3b
br_d3b38:
        jmp     br_d3c3a
br_d3b3b:
        sub     bh, bh
        shl     bx, 1
        sub     cx, cx
        jmp     word ptr cs:[word bx + TBL_d3b46]
TBL_d3b46:
        dw      tgt_d3b52
        dw      tgt_d3b57
        dw      tgt_d3b57
        dw      tgt_d3b68
        dw      tgt_d3b93
        dw      tgt_d3bd7
tgt_d3b52:
        mov     al, 23h
        jmp     br_d3c30
tgt_d3b57:
        if      FW_VERSION >= 212
        cmp     byte ptr [B_7E63], 0
        jz      br_d3b63
        sub     ah, ah
        jmp     near br_d3c13
br_d3b63:
        endif
        mov     ah, 4dh
        jmp     near br_d3c13
tgt_d3b68:
        mov     byte ptr [B_53CC], 0
        mov     bx, word ptr [W_94CC]
        mov     cx, word ptr [W_94CE]
        if      FW_VERSION < 212
        and.w   bx, 0fffch
        add     bx, 8
        else
        and     bx, 0fffch
        add     bx, 4
        endif
        adc     cx, 0
        mov     word ptr [W_53CD], bx
        mov     word ptr [W_53CF], cx
        mov     byte ptr [B_53CA], 0
        mov     cx, 0fch
        sub     ah, ah
        jmp     near br_d3c13
tgt_d3b93:
        mov     byte ptr [B_53CA], 1
        neg     byte ptr [B_53CB]
        mov     cx, 0fbh
        cmp     byte ptr [B_53AB], 10h
        jc      br_d3bd4
        cmp     byte ptr [B_7E0A], 0
        jnz     br_d3bb4
        cmp     byte ptr [B_7E0B], 0
        jz      br_d3bbc
br_d3bb4:
        mov     byte ptr [B_53AF], 1
        jmp     br_d3c0b
        db      090h
br_d3bbc:
        mov     bx, word ptr [W_94CC]
        mov     dx, word ptr [W_94CE]
        shr     dx, 1
        rcr     bx, 1
        shr     dx, 1
        rcr     bx, 1
        mov     word ptr [W_5381], bx
        mov     word ptr [W_5383], dx
br_d3bd4:
        jmp     br_d3c0b
        db      090h
tgt_d3bd7:
        mov     byte ptr [B_53CA], 1
        mov     byte ptr [B_53CB], 0
        mov     cx, 0fah
        cmp     byte ptr [B_53AB], 10h
        jc      br_d3c0b
        cmp     byte ptr [B_7E0A], 0
        jnz     br_d3bf9
        cmp     byte ptr [B_7E0B], 0
        jz      br_d3c01
br_d3bf9:
        mov     byte ptr [B_53AF], 1
        jmp     br_d3c0b
        db      090h
br_d3c01:
        sub     bx, bx
        mov     word ptr [W_5381], bx
        mov     word ptr [W_5383], bx
br_d3c0b:
        mov     word ptr [W_5509], 0ffffh
        mov     ah, 51h
br_d3c13:
        push    ax
        jcxz    br_d3c1f
        mov     bl, byte ptr [B_4E78]
        callf SEG_0519:far_05204
br_d3c1f:
        pop     ax
br_d3c20:
        push    ax
        test    ah, ah
        jz      br_d3c2f
        mov     cl, ah
        mov     bx, A_4BF0
        if      FW_VERSION < 212
        callf   SEG_EF1E:far_ef210
        else
        callf   SEG_EF1E:far_ef1e0
        endif
br_d3c2f:
        pop     ax
br_d3c30:
        mov     cl, al
        mov     bx, A_4BF0
        if      FW_VERSION < 212
        callf   SEG_EF1E:far_ef210
        else
        callf   SEG_EF1E:far_ef1e0
        endif
br_d3c3a:
        pop     dx
        pop     cx
        retf
far_d3c3d:
        mov     al, 58h
        jmpf    SEG_D3B2:far_d3b25
far_d3c44:
        mov     al, 59h
        jmpf    SEG_D3B2:far_d3b25
far_d3c4b:
        mov     al, 5ah
        jmpf    SEG_D3B2:far_d3b25
far_d3c52:
        push    cx
        push    dx
        mov     ah, 51h
        mov     al, 5ah
        jmp     br_d3c20
far_d3c5a:
        mov     ah, byte ptr [B_7E10]
        and     ah, 3fh
        cmp     ah, 0
        jz      br_d3c69
        jmp     br_d3cd0
        db      090h
br_d3c69:
        cmp     byte ptr [B_7E11], 0
        jnz     br_d3ccd
        cmp     byte ptr [B_8CCB], 0
        jnz     br_d3ccd
        cmp     al, 5ah
        jnz     br_d3c88
        call    fn_d3e9d
        jc      br_d3ccd
        mov     byte ptr [B_7E10], 41h
        jmp     br_d3e3e
br_d3c88:
        cmp     al, 59h
        jnz     br_d3c99
        call    fn_d3e9d
        jc      br_d3ccd
        mov     byte ptr [B_7E10], 1
        jmp     br_d3e3e
br_d3c99:
        cmp     al, 56h
        jnz     br_d3cac
        test    byte ptr [B_7E12], 0ffh
        jnz     br_d3ccd
        mov     byte ptr [B_7E10], 2
        jmp     br_d3e3e
br_d3cac:
        cmp     al, 57h
        jnz     br_d3cc6
        test    byte ptr [B_7E12], 0ffh
        if      FW_VERSION < 212
        else
        jnz     br_d3ccd
        cmp     byte ptr [B_7E63], 0
        endif
        jnz     br_d3ccd
        mov     byte ptr [B_7E10], 8
        jmp     br_d3e3e
br_d3cc6:
        cmp     al, 58h
        jnz     br_d3ccd
        mov     al, 55h
        retf
br_d3ccd:
        jmp     br_d3e44
br_d3cd0:
        cmp     ah, 1
        jz      br_d3cd8
        if      FW_VERSION < 212
        jmp     short br_d3d57
        db      090h
        else
        jmp     near br_d3d57
        endif
br_d3cd8:
        cmp     al, 58h
        jnz     br_d3ce9
        mov     byte ptr [B_7E10], 0
        mov     byte ptr [B_7E0F], 0
        jmp     br_d3e3e
br_d3ce9:
        cmp     al, 56h
        jnz     br_d3d03
        cmp     byte ptr [B_94A6], 0
        jnz     br_d3d24
        cmp     byte ptr [B_7E0E], 0
        jz      br_d3d24
        mov     byte ptr [B_7E10], 4
        jmp     br_d3e3e
br_d3d03:
        cmp     al, 57h
        jnz     br_d3d27
        cmp     byte ptr [B_94A6], 0
        jnz     br_d3d24
        cmp     byte ptr [B_7E0E], 0
        jz      br_d3d24
        if      FW_VERSION >= 212
        cmp     byte ptr [B_7E63], 0
        jnz     br_d3d24
        endif
        mov     byte ptr [B_7E10], 10h
        jmp     br_d3e3e
br_d3d24:
        jmp     br_d3e44
br_d3d27:
        cmp     al, 59h
        jnz     br_d3d54
        cmp     byte ptr [B_94A6], 0
        jnz     br_d3d54
        cmp     byte ptr [B_7E62], 0
        jz      br_d3d54
        test    byte ptr [B_7E62], 2
        jnz     br_d3d4a
        mov     al, 56h
        mov     byte ptr [B_7E10], 4
        jmp     br_d3e3e
br_d3d4a:
        mov     al, 57h
        mov     byte ptr [B_7E10], 10h
        jmp     br_d3e3e
br_d3d54:
        jmp     br_d3e44
br_d3d57:
        cmp     ah, 2
        jnz     br_d3d92
        cmp     al, 5ah
        jnz     br_d3d6d
        call    fn_d3e9d
        jc      br_d3d8f
        mov     byte ptr [B_7E10], 44h
        jmp     br_d3e3e
br_d3d6d:
        cmp     al, 59h
        jnz     br_d3d7e
        call    fn_d3e9d
        jc      br_d3d8f
        mov     byte ptr [B_7E10], 4
        jmp     near br_d3e3e
br_d3d7e:
        cmp     al, 76h
        jnz     br_d3d8f
        mov     byte ptr [B_7E10], 0
        mov     byte ptr [B_7E0F], 0
        jmp     near br_d3e3e
br_d3d8f:
        jmp     near br_d3e44
br_d3d92:
        cmp     ah, 4
        jnz     br_d3dd1
        cmp     al, 58h
        jnz     br_d3da8
        mov     byte ptr [B_7E10], 0
        mov     byte ptr [B_7E0F], 0
        jmp     near br_d3e3e
br_d3da8:
        cmp     al, 56h
        jnz     br_d3db4
        mov     byte ptr [B_7E10], 1
        jmp     near br_d3e3e
br_d3db4:
        cmp     al, 57h
        jnz     br_d3dce
        test    byte ptr [B_7E0E], 0ffh
        jz      br_d3dce
        if      FW_VERSION >= 212
        cmp     byte ptr [B_7E63], 0
        jnz     br_d3dce
        endif
        mov     byte ptr [B_7E10], 10h
        jmp     br_d3e3e
        db      090h
br_d3dce:
        jmp     br_d3e44
        db      090h
br_d3dd1:
        cmp     ah, 8
        jnz     br_d3e0c
        cmp     al, 5ah
        jnz     br_d3de7
        call    fn_d3e9d
        jc      br_d3e09
        mov     byte ptr [B_7E10], 50h
        jmp     br_d3e3e
        db      090h
br_d3de7:
        cmp     al, 59h
        jnz     br_d3df8
        call    fn_d3e9d
        jc      br_d3e09
        mov     byte ptr [B_7E10], 10h
        jmp     br_d3e3e
        db      090h
br_d3df8:
        cmp     al, 77h
        jnz     br_d3e09
        mov     byte ptr [B_7E10], 0
        mov     byte ptr [B_7E0F], 0
        jmp     br_d3e3e
        db      090h
br_d3e09:
        jmp     br_d3e44
        db      090h
br_d3e0c:
        cmp     ah, 10h
        jnz     br_d3e44
        cmp     al, 58h
        jnz     br_d3e22
        mov     byte ptr [B_7E10], 0
        mov     byte ptr [B_7E0F], 0
        jmp     br_d3e3e
        db      090h
br_d3e22:
        cmp     al, 57h
        jnz     br_d3e2e
        mov     byte ptr [B_7E10], 1
        jmp     br_d3e3e
        db      090h
br_d3e2e:
        cmp     al, 56h
        jnz     br_d3e44
        test    byte ptr [B_7E0E], 0ffh
        jz      br_d3e44
        mov     byte ptr [B_7E10], 4
br_d3e3e:
        callf   SEG_D3B2:far_d3e47
        retf
br_d3e44:
        xor     ax, ax
        retf
far_d3e47:
        push    bx
        mov     dx, word ptr [W_0FB3]
        mov     cx, word ptr [W_0FB5]
        mov     bx, word ptr [W_0FB1]
        test    byte ptr [B_7E10], 15h
        jz      br_d3e5e
        add     dx, 10h
br_d3e5e:
        test    byte ptr [B_7E10], 6
        jz      br_d3e68
        add     cx, 10h
br_d3e68:
        test    byte ptr [B_7E10], 18h
        jz      br_d3e72
        add     bx, 10h
br_d3e72:
        out     dx, al
        mov     dx, cx
        out     dx, al
        mov     dx, bx
        out     dx, al
        test    byte ptr [B_7E10], 3fh
        jnz     br_d3e9b
        cmp     byte ptr [B_53AB], 0
        jz      br_d3e9b
        cmp     byte ptr [B_53AB], 10h
        jl      br_d3e96
        mov     byte ptr [B_53AB], 10h
        jmp     br_d3e9b
        db      090h
br_d3e96:
        mov     byte ptr [B_53AB], 0eh
br_d3e9b:
        pop     bx
        retf
fn_d3e9d:
        cmp     byte ptr [B_8D7A], 0
        jnz     br_d3eb4
        cmp     byte ptr [B_A06E], 0
        jnz     br_d3eb2
        cmp     byte ptr [B_94A6], 0ffh
        jz      br_d3eb4
br_d3eb2:
        clc
        ret
br_d3eb4:
        stc
        ret
far_d3eb6:
        push    ax
        push    bx
        mov     bl, byte ptr [B_7E10]
        mov     al, bl
        and     al, 3fh
        cmp     al, 0
        jnz     br_d3ec9
        mov     ah, 0
        jmp     br_d3ee9
        db      090h
br_d3ec9:
        cmp     al, 1
        jnz     br_d3ed2
        mov     ah, 6
        jmp     br_d3ee1
        db      090h
br_d3ed2:
        cmp     al, 4
        jnz     br_d3edb
        mov     ah, 8
        jmp     br_d3ee1
        db      090h
br_d3edb:
        cmp     al, 10h
        jnz     br_d3ef2
        mov     ah, 0ah
br_d3ee1:
        test    bl, 40h
        jz      br_d3ee9
        or      ah, 40h
br_d3ee9:
        mov     byte ptr [B_7E0F], ah
        mov     byte ptr [B_53CC], 0
br_d3ef2:
        pop     bx
        pop     ax
        retf
        if      FW_VERSION < 212
        phase   2
        elseif  FW_VERSION = 212
        phase   0ah
        else
        phase   5
        endif
far_d3ef5:
        push    bp
        mov     bp, sp
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr [bx]
        jmp     br_d3f06
        db      090h, 08bh, 05eh, 006h, 08ah, 007h, 04bh
br_d3f06:
        and     al, 0f8h
        jns     br_d3f39
        cmp     al, 98h
        jz      br_d3f16
        cmp     al, 0b8h
        jz      br_d3f3e
        test    al, 8
        jnz     br_d3f39
br_d3f16:
        mov     cl, 4
        shr     al, cl
        and     al, 7
        cmp     al, 7
        jnz     br_d3f40
        cmp     byte ptr [bx + 2], 47h
        jnz     br_d3f40
        cmp     byte ptr [bx + 5], 45h
        jz      br_d3f32
        cmp     byte ptr [bx + 5], 46h
        jnz     br_d3f40
br_d3f32:
        add     al, byte ptr [bx + 6]
        cmp     al, 0ch
        jc      br_d3f40
br_d3f39:
        mov     al, 0ch
        jmp     br_d3f40
        db      090h
br_d3f3e:
        xor     al, al
br_d3f40:
        xor     ah, ah
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   1
        elseif  FW_VERSION = 212
        phase   9
        else
        phase   4
        endif
far_d3f44:
        push    bp
        mov     bp, sp
        add     sp, 0fffch
        cmp     byte ptr [B_A06E], 0
        jz      br_d3f7c
        if      FW_VERSION < 212
        callf   0d911h:tgt_c0738
        else
        cmp     word ptr [bp + 6], B_94A6
        jnz     br_d3f7c
        mov     ax, B_94A6
        push    ax
        callf   SEG_D724:far_d7241
        add     sp, 2
        endif
        mov     al, byte ptr [B_A06A]
        sub     ah, ah
        mov     bx, ax
        if      FW_VERSION < 212
        mov     al, byte ptr [bx +TBL_7C25]
        else
        mov     al, byte ptr [bx + TBL_7C25]
        endif
        sub     ah, ah
        mov     word ptr [bp - 2], ax
        mov     ax, word ptr [W_7E08]
        mov     word ptr [bp - 4], ax
        jmp     br_d3fa4
br_d3f7c:
        if      FW_VERSION < 212
        cmp     byte ptr [B_94A6], 0
        else
        mov     bx, word ptr [bp + 6]
        cmp     byte ptr [bx], 0
        endif
        jge     br_d3f88
br_d3f84:
        mov     sp, bp
        pop     bp
        retf
br_d3f88:
        if      FW_VERSION < 212
        callf   0d911h:far_d7268
        mov     al, byte ptr [B_94A7]
        else
        push    bx
        callf   SEG_D724:far_d7241
        add     sp, 2
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr [bx + 1]
        endif
        cbw
        and     ax, 1
        mov     word ptr [bp - 2], ax
        if      FW_VERSION < 212
        mov     ax, word ptr [W_94D8]
        else
        mov     ax, word ptr [bx + 32h]
        endif
        mov     word ptr [bp - 4], ax
br_d3fa4:
        if      FW_VERSION >= 212
        push    word ptr [bp + 0ch]
        endif
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        if      FW_VERSION < 212
        push    word ptr [bp + 6]
        endif
        mov     ax, 1
        push    ax
        if      FW_VERSION < 212
        callf   0d4d4h:far_d3ff5
        add     sp, 8
        mov     word ptr [bp + 8], dx
        mov     word ptr [bp + 6], ax
        else
        push    word ptr [bp + 6]
        callf   SEG_D3F4:far_d3ff5
        add     sp, 0ah
        mov     word ptr [bp + 0ah], dx
        mov     word ptr [bp + 8], ax
        endif
        cmp     word ptr [bp - 2], 0
        jz      br_d3ff3
br_d3fc8:
        if      FW_VERSION < 212
        cmp     word ptr [bp + 8], 0
        jnz     br_d3fd2
        cmp     word ptr [bp + 6], 0
        else
        cmp     word ptr [bp + 0ah], 0
        jnz     br_d3fd2
        cmp     word ptr [bp + 8], 0
        endif
br_d3fd2:
        jz      br_d3ff3
        if      FW_VERSION >= 212
        push    word ptr [bp + 0ch]
        endif
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        if      FW_VERSION < 212
        push    word ptr [bp + 6]
        push    word ptr [bp - 4]
        callf   0d4d4h:far_d3ff5
        add     sp, 8
        mov     word ptr [bp + 8], dx
        mov     word ptr [bp + 6], ax
        else
        push    word ptr [bp - 4]
        push    word ptr [bp + 6]
        callf   SEG_D3F4:far_d3ff5
        add     sp, 0ah
        mov     word ptr [bp + 0ah], dx
        mov     word ptr [bp + 8], ax
        endif
        jmp     br_d3fc8
br_d3ff3:
        jmp     br_d3f84
far_d3ff5:
        push    bp
        mov     bp, sp
        add     sp, 0ffe8h
        cmp     byte ptr [B_A06E], 0
        jz      br_d4015
        if      FW_VERSION < 212
        else
        cmp     word ptr [bp + 6], B_94A6
        jnz     br_d4015
        endif
        mov     word ptr [bp - 16h], TBL_A081
        mov     word ptr [bp - 18h], W_A06F
        jmp     br_d4027
br_d4015:
        if      FW_VERSION < 212
        mov     word ptr [bp - 16h], 4cc6h
        mov     word ptr [bp - 18h], 5205h
        else
        mov     ax, word ptr [bp + 6]
        add     ax, 236h
        mov     word ptr [bp - 16h], ax
        mov     ax, word ptr [bp + 6]
        add     ax, 30h
        mov     word ptr [bp - 18h], ax
        endif
br_d4027:
        mov     ax, word ptr [bp - 16h]
        mov     word ptr [bp - 14h], ax
        add     word ptr [bp - 14h], 4
br_d4031:
        if      FW_VERSION < 212
        mov     ax, word ptr [bp + 6]
        else
        mov     ax, word ptr [bp + 8]
        endif
        mov     bx, word ptr [bp - 14h]
        cmp     ax, word ptr [bx]
        jc      br_d4041
        add     word ptr [bp - 14h], 4
        jmp     br_d4031
br_d4041:
        add     word ptr [bp - 14h], 0fffch
        if      FW_VERSION < 212
        mov     ax, word ptr [bp + 6]
        else
        mov     ax, word ptr [bp + 8]
        endif
        mov     word ptr [bp - 0ah], ax
        mov     word ptr [bp - 12h], 0
br_d4050:
        cmp     word ptr [bp - 12h], 0
        jz      br_d4059
        jmp     near br_d40e5
br_d4059:
        mov     bx, word ptr [bp - 14h]
        mov     al, byte ptr [bx + 3]
        cbw
        mov     cx, ax
        mov     ax, 180h
        cwd
        idiv    cx
        mov     word ptr [bp - 6], ax
        mov     al, byte ptr [bx + 2]
        cbw
        imul    word ptr [bp - 6]
        cwd
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        add     word ptr [bp - 14h], 4
        mov     bx, word ptr [bp - 14h]
        mov     ax, word ptr [bx]
        mov     word ptr [bp - 0ch], ax
        mov     cx, 0ffffh
        cmp     ax, cx
        jnz     br_d409a
        mov     bx, word ptr [bp - 18h]
        mov     ax, word ptr [bx]
        inc     ax
        mov     word ptr [bp - 0ch], ax
        mov     word ptr [bp - 12h], 0ffffh
br_d409a:
        mov     ax, word ptr [bp - 0ch]
        sub     ax, word ptr [bp - 0ah]
        mov     word ptr [bp - 8], ax
        mov     bx, word ptr [bp - 14h]
        mov     ax, word ptr [bx]
        mov     word ptr [bp - 0ah], ax
        jmp     br_d40dc
loop_d40ad:
        if      FW_VERSION < 212
        mov     dx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp + 8]
        else
        mov     dx, word ptr [bp + 0ch]
        mov     ax, word ptr [bp + 0ah]
        endif
        cmp     dx, word ptr [bp - 2]
        jl      br_d40bf
        jnz     br_d40c1
        cmp     ax, word ptr [bp - 4]
        jnc     br_d40c1
br_d40bf:
        jmp     br_d40d2
br_d40c1:
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        if      FW_VERSION < 212
        sub     word ptr [bp + 8], ax
        sbb     word ptr [bp + 0ah], dx
        inc     word ptr [bp + 6]
        else
        sub     word ptr [bp + 0ah], ax
        sbb     word ptr [bp + 0ch], dx
        inc     word ptr [bp + 8]
        endif
        jmp     br_d40d9
br_d40d2:
        mov     word ptr [bp - 12h], 1
        jmp     br_d40e2
br_d40d9:
        dec     word ptr [bp - 8]
br_d40dc:
        cmp     word ptr [bp - 8], 0
        jg      loop_d40ad
br_d40e2:
        jmp     near br_d4050
br_d40e5:
        cmp     word ptr [bp - 12h], 1
        jnz     br_d4125
        mov     ax, word ptr [bp - 6]
        cwd
        mov     bx, dx
        mov     cx, ax
        if      FW_VERSION < 212
        mov     dx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp + 8]
        else
        mov     dx, word ptr [bp + 0ch]
        mov     ax, word ptr [bp + 0ah]
        endif
        callf   SEG_F26A:far_f26a7
        mov     word ptr [bp - 0eh], ax
        inc     word ptr [bp - 0eh]
        imul    word ptr [bp - 6]
        cwd
        if      FW_VERSION < 212
        mov     bx, word ptr [bp + 0ah]
        mov     cx, word ptr [bp + 8]
        else
        mov     bx, word ptr [bp + 0ch]
        mov     cx, word ptr [bp + 0ah]
        endif
        sub     cx, ax
        sbb     bx, dx
        mov     dx, bx
        mov     ax, cx
        mov     word ptr [bp - 10h], ax
        if      FW_VERSION < 212
        mov     word ptr [bp + 0ah], 0
        mov     word ptr [bp + 8], 0
        else
        mov     word ptr [bp + 0ch], 0
        mov     word ptr [bp + 0ah], 0
        endif
        jmp     br_d412f
br_d4125:
        mov     word ptr [bp - 0eh], 1
        mov     word ptr [bp - 10h], 0
br_d412f:
        mov     ax, word ptr [bp - 10h]
        if      FW_VERSION < 212
        mov     bx, word ptr [bp + 0ch]
        else
        mov     bx, word ptr [bp + 0eh]
        endif
        mov     byte ptr [bx], al
        mov     ax, word ptr [bp - 0eh]
        if      FW_VERSION < 212
        mov     bx, word ptr [bp + 0ch]
        mov     byte ptr [bx + 1], al
        mov     bx, word ptr [bp + 0ch]
        mov     ax, word ptr [bp + 6]
        mov     word ptr [bx + 2], ax
        mov     dx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp + 8]
        else
        mov     bx, word ptr [bp + 0eh]
        mov     byte ptr [bx + 1], al
        mov     bx, word ptr [bp + 0eh]
        mov     ax, word ptr [bp + 8]
        mov     word ptr [bx + 2], ax
        mov     dx, word ptr [bp + 0ch]
        mov     ax, word ptr [bp + 0ah]
        endif
        mov     sp, bp
        pop     bp
        retf
        if      FW_VERSION < 212
        phase   5
        elseif  FW_VERSION = 212
        phase   8
        else
        phase   3
        endif
far_d4153:
        push    bp
        mov     bp, sp
        if      FW_VERSION < 212
        add     sp, 0fff6h
        mov     bx, word ptr [bp + 0ah]
        else
        add     sp, 0fff8h
        mov     bx, word ptr [bp + 0ch]
        endif
        mov     word ptr [bx + 2], 0
        mov     word ptr [bx], 0
        if      FW_VERSION < 212
        mov     ax, 4cc6h
        cmp     byte ptr [B_A06E], 0
        jz      br_d4180
        mov     ax, 576ch
br_d4180:
        mov     word ptr [bp - 0ah], ax
        mov     bx, ax
        else
        cmp     byte ptr [B_A06E], 0
        jz      br_d418b
        cmp     word ptr [bp + 6], B_94A6
        jnz     br_d418b
        cmp     byte ptr [B_A06C], 0
        jnz     br_d4184
        mov     ax, word ptr [bp + 6]
        add     ax, 3ch
br_d4180:
        mov     sp, bp
        pop     bp
        retf
br_d4184:
        mov     word ptr [bp - 8], TBL_A081
        jmp     br_d41a4
br_d418b:
        mov     bx, word ptr [bp + 6]
        test    byte ptr [bx + 1], 2
        jnz     br_d419b
        add     bx, 3ch
        mov     ax, bx
        jmp     br_d4180
br_d419b:
        mov     ax, word ptr [bp + 6]
        add     ax, 236h
        mov     word ptr [bp - 8], ax
br_d41a4:
        mov     bx, word ptr [bp - 8]
        endif
        mov     ax, word ptr [bx]
        mov     word ptr [bp - 2], ax
        mov     word ptr [bp - 6], 0
br_d41b1:
        cmp     word ptr [bp - 6], 0
        jz      br_d41ba
        jmp     near br_d4239
br_d41ba:
        if      FW_VERSION < 212
        add     word ptr [bp - 0ah], 4
        mov     bx, word ptr [bp - 0ah]
        else
        add     word ptr [bp - 8], 4
        mov     bx, word ptr [bp - 8]
        endif
        mov     ax, word ptr [bx]
        mov     word ptr [bp - 4], ax
        if      FW_VERSION < 212
        mov     cx, word ptr [bp + 8]
        else
        mov     cx, word ptr [bp + 0ah]
        endif
        cmp     cx, ax
        jnc     br_d41d5
        mov     word ptr [bp - 4], cx
        mov     word ptr [bp - 6], 1
br_d41d5:
        if      FW_VERSION < 212
        add     word ptr [bp - 0ah], 0fffch
        mov     bx, word ptr [bp - 0ah]
        else
        add     word ptr [bp - 8], 0fffch
        mov     bx, word ptr [bp - 8]
        endif
        mov     al, byte ptr [bx + 2]
        cbw
        cwd
        push    ax
        xchg    dx, ax
        mov     bx, 180h
        mul     bx
        mov     cx, ax
        pop     ax
        mul     bx
        add     dx, cx
        push    dx
        push    ax
        if      FW_VERSION < 212
        mov     bx, word ptr [bp - 0ah]
        else
        mov     bx, word ptr [bp - 8]
        endif
        mov     al, byte ptr [bx + 3]
        cbw
        cwd
        mov     bx, dx
        mov     cx, ax
        pop     ax
        pop     dx
        callf   SEG_F26A:far_f26a7
        push    dx
        push    ax
        mov     ax, word ptr [bp - 4]
        sub     ax, word ptr [bp - 2]
        sub     dx, dx
        mov     bx, dx
        mov     cx, ax
        pop     ax
        pop     dx
        push    ax
        push    dx
        mul     bx
        mov     bx, ax
        pop     ax
        mul     cx
        add     bx, ax
        pop     ax
        mul     cx
        add     dx, bx
        if      FW_VERSION < 212
        mov     bx, word ptr [bp + 0ah]
        else
        mov     bx, word ptr [bp + 0ch]
        endif
        add     word ptr [bx], ax
        adc     word ptr [bx + 2], dx
        mov     ax, word ptr [bp - 4]
        mov     word ptr [bp - 2], ax
        if      FW_VERSION < 212
        add     word ptr [bp - 0ah], 4
        else
        add     word ptr [bp - 8], 4
        endif
        jmp     near br_d41b1
br_d4239:
        if      FW_VERSION < 212
        add     word ptr [bp - 0ah], 0fffch
        mov     bx, word ptr [bp - 0ah]
        else
        add     word ptr [bp - 8], 0fffch
        mov     bx, word ptr [bp - 8]
        endif
        mov     al, byte ptr [bx + 3]
        cbw
        mov     cx, ax
        mov     ax, 180h
        cwd
        idiv    cx
        push    ax
        if      FW_VERSION < 212
        mov     al, byte ptr [bp + 7]
        else
        mov     al, byte ptr [bp + 9]
        endif
        cbw
        mov     cx, ax
        dec     cx
        pop     ax
        imul    cx
        mov     cx, ax
        if      FW_VERSION < 212
        mov     al, byte ptr [bp + 6]
        else
        mov     al, byte ptr [bp + 8]
        endif
        cbw
        add     cx, ax
        mov     ax, cx
        cwd
        if      FW_VERSION < 212
        mov     bx, word ptr [bp + 0ah]
        else
        mov     bx, word ptr [bp + 0ch]
        endif
        add     word ptr [bx], ax
        adc     word ptr [bx + 2], dx
        if      FW_VERSION < 212
        mov     ax, word ptr [bp - 0ah]
        add     ax, 2
        mov     sp, bp
        pop     bp
        retf
        phase   6
        else
        mov     ax, word ptr [bp - 8]
        add     ax, 2
        jmp     br_d4180
        endif
        if      FW_VERSION = 212
        phase   8
        endif
        if      FW_VERSION >= 214
        phase   3
        endif
far_d4273:
        push    bp
        mov     bp, sp
        add     sp, 0fffeh
        mov     ax, 0ff3eh
        push    ax
        callf   SEG_F25A:far_f25bb
        add     sp, 2
        and     ax, 0fff7h
        mov     word ptr [bp - 2], ax
        add     ax, 8
        push    ax
        mov     ax, 0ff3eh
        push    ax
        callf   SEG_F25A:far_f25d0
        add     sp, 4
        mov     ax, word ptr [bp + 6]
        mov     byte ptr [B_4E7A], al
        mov     ax, word ptr [bp + 6]
        jmp     near br_d4361
tgt_d42a7:
        mov     ax, 5
        push    ax
        mov     ax, 206h
        push    ax
        callf   SEG_F25A:far_f25c4
        add     sp, 4
        mov     ax, 2
        push    ax
        mov     ax, 206h
        push    ax
        callf   SEG_F25A:far_f25c4
        add     sp, 4
        jmp     near br_d436e
tgt_d42ca:
        mov     ax, 4
        push    ax
        mov     ax, 206h
        push    ax
        callf   SEG_F25A:far_f25c4
        add     sp, 4
        mov     ax, 2
        push    ax
        mov     ax, 206h
        push    ax
        callf   SEG_F25A:far_f25c4
        add     sp, 4
        jmp     near br_d436e
tgt_d42ed:
        mov     sp, bp
        pop     bp
        retf
tgt_d42f1:
        mov     ax, 180h
        push    ax
        callf   SEG_F25A:far_f25af
        add     sp, 2
        mov     ax, 9
        push    ax
        mov     ax, 206h
        push    ax
        callf   SEG_F25A:far_f25c4
        add     sp, 4
        mov     ax, 5
        push    ax
        mov     ax, 206h
        push    ax
        callf   SEG_F25A:far_f25c4
        add     sp, 4
        mov     ax, 3
        push    ax
        mov     ax, 206h
        push    ax
        callf   SEG_F25A:far_f25c4
        add     sp, 4
        jmp     br_d436e
tgt_d432f:
        mov     ax, 4
        push    ax
        mov     ax, 206h
        push    ax
        callf   SEG_F25A:far_f25c4
        add     sp, 4
        mov     ax, 3
        push    ax
        mov     ax, 206h
        push    ax
        callf   SEG_F25A:far_f25c4
        add     sp, 4
        jmp     br_d436e
TBL_d4351:
        dw      tgt_d42ed
        dw      tgt_d42a7
        dw      tgt_d42ca
        dw      tgt_d42ed
        dw      tgt_d42ed
        dw      tgt_d42ed
        dw      tgt_d42f1
        dw      tgt_d432f
br_d4361:
        cmp     ax, 8
        jnc     br_d436e
        xchg    bx, ax
        shl     bx, 1
        jmp     word ptr cs:[bx + TBL_d4351]
br_d436e:
        xor     ax, ax
        push    ax
        mov     ax, 180h
        push    ax
        callf   SEG_F25A:far_f25c4
        add     sp, 4
        push    word ptr [bp - 2]
        mov     ax, 0ff3eh
        push    ax
        callf   SEG_F25A:far_f25d0
        add     sp, 4
        jmp     near tgt_d42ed
far_d438f:
        push    bp
        mov     bp, sp
        mov     ax, word ptr [bp + 6]
        add     ax, 0ah
        push    ax
        mov     ax, 206h
        push    ax
        callf   SEG_F25A:far_f25c4
        add     sp, 4
        mov     ax, word ptr [bp + 6]
        mov     byte ptr [B_4E79], al
        mov     sp, bp
        pop     bp
        retf
TBL_d43af:
        db      018h, 019h, 01eh, 01eh
        if      FW_VERSION < 212
        phase   6
far_d43b3:
        mov     al, byte ptr [si + 2]
        elseif  FW_VERSION = 212
        phase   8
        else
        phase   13h
        endif
        if      FW_VERSION >= 212
far_d43b3:
        mov     al, byte ptr [si + 3]
        endif
        sub     ah, ah
        mov     bx, 3ch
        mul     bx
        if      FW_VERSION < 212
        mov     bl, byte ptr [si + 1]
        else
        mov     bl, byte ptr [si + 2]
        endif
        sub     bh, bh
        add     ax, bx
        push    ax
        if      FW_VERSION < 212
        mov     al, byte ptr [si + 3]
        else
        mov     al, byte ptr [si + 4]
        endif
        sub     ah, ah
        mov     bx, 0e10h
        mul     bx
        pop     bx
        add     ax, bx
        adc     dx, 0
        mov     bl, byte ptr [B_4C1F]
        sub     bh, bh
        if      FW_VERSION < 214
        mov     bl, byte ptr cs:[word bx + TBL_d43af-140h]
        else
        mov     bl, byte ptr cs:[word bx + TBL_d43af-130h]
        endif
        push    ax
        mov     ax, dx
        mul     bx
        mov     cx, ax
        pop     ax
        mul     bx
        add     dx, cx
        if      FW_VERSION < 212
        mov     bl, byte ptr [si]
        else
        mov     bl, byte ptr [si + 1]
        endif
        sub     bh, bh
        add     ax, bx
        adc     dx, 0
        cmp     byte ptr [B_4C1F], 3
        jnz     br_d442a
        mov     bx, ax
        if      FW_VERSION < 212
        mov     al, byte ptr [si + 3]
        else
        mov     al, byte ptr [si + 4]
        endif
        mov     cl, 6ch
        mul     cl
        push    ax
        if      FW_VERSION < 212
        mov     al, byte ptr [si + 2]
        else
        mov     al, byte ptr [si + 3]
        endif
        aam
        xchg    al, ah
        shl     al, 1
        mov     cl, al
        shl     al, 1
        shl     al, 1
        shl     al, 1
        add     al, cl
        shl     ah, 1
        add     al, ah
        sub     ah, ah
        pop     cx
        add     ax, cx
        sub     bx, ax
        sbb     dx, 0
        mov     ax, bx
br_d442a:
        retf
far_d442b:
        push    bp
        mov     bp, sp
        push    si
        if      FW_VERSION >= 212
        push    di
        endif
        mov     si, word ptr [bp + 6]
        callf   SEG_D43A:far_d43b3
        if      FW_VERSION < 212
        mov     si, word ptr [bp + 8]
        mov     word ptr [si], ax
        mov     word ptr [si + 2], dx
        else
        mov     di, word ptr [bp + 8]
        mov     word ptr [di + 6], ax
        mov     word ptr [di + 8], dx
        mov     word ptr [di], 0
        mov     al, byte ptr [si]
        sub     ah, ah
        sub     dx, dx
        push    ax
        push    dx
        mov     bl, byte ptr [B_4C1F]
        sub     bh, bh
        shl     bx, 2
        mul     word ptr [bx + TBL_1035]
        mov     cx, ax
        pop     ax
        mul     word ptr [bx + TBL_1033]
        add     cx, ax
        pop     ax
        mul     word ptr [bx + TBL_1033]
        add     dx, cx
        mov     bx, 0
        mov     cx, 64h
        callf   SEG_F26A:far_f2701
        mov     word ptr [di + 4], dx
        mov     word ptr [di + 2], ax
        pop     di
        endif
        pop     si
        pop     bp
        retf
        if      FW_VERSION < 214
        phase   4
        else
        phase   0fh
        endif
far_d447f:
        push    bp
        mov     bp, sp
        if      FW_VERSION < 212
        add     sp, 0ffc6h
        else
        add     sp, 0ffbah
        endif
        push    di
        push    si
        cmp     byte ptr [B_4C2E], 0
        jnz     br_d4491
        jmp     br_d461f
br_d4491:
        cmp     byte ptr [B_A06E], 0
        jz      br_d44cb
        mov     al, byte ptr [B_A419]
        sub     ah, ah
        if      FW_VERSION < 212
        mov     word ptr [bp - 2ch], ax
        mov     al, byte ptr [B_A06A]
        sub     ah, ah
        mov     bx, ax
        mov     al, byte ptr [bx +TBL_7C25]
        sub     ah, ah
        mov     word ptr [bp - 2eh], ax
        else
        mov     word ptr [bp - 3ah], ax
        endif
        mov     dx, word ptr [W_A073]
        mov     ax, word ptr [W_A071]
        if      FW_VERSION < 212
        mov     word ptr [bp - 32h], dx
        mov     word ptr [bp - 34h], ax
        else
        mov     word ptr [bp - 3eh], dx
        mov     word ptr [bp - 40h], ax
        endif
        mov     dx, word ptr [W_A077]
        mov     ax, word ptr [W_A075]
        if      FW_VERSION < 212
        mov     word ptr [bp - 36h], dx
        mov     word ptr [bp - 38h], ax
        else
        mov     word ptr [bp - 42h], dx
        mov     word ptr [bp - 44h], ax
        endif
        mov     dx, word ptr [W_A07F]
        mov     ax, word ptr [W_A07D]
        if      FW_VERSION < 212
        mov     word ptr [bp - 30h], ax
        mov     word ptr [bp - 3ah], 58ach
        else
        mov     word ptr [bp - 3ch], ax
        mov     word ptr [bp - 46h], TBL_A1C1
        endif
        jmp     br_d44f8
br_d44cb:
        mov     al, byte ptr [B_9F92]
        sub     ah, ah
        if      FW_VERSION < 212
        mov     word ptr [bp - 2ch], ax
        mov     al, byte ptr [B_94A7]
        cbw
        and     ax, 1
        mov     word ptr [bp - 2eh], ax
        mov     dx, word ptr [W_94CA]
        mov     ax, word ptr [W_94C8]
        mov     word ptr [bp - 32h], dx
        mov     word ptr [bp - 34h], ax
        else
        mov     word ptr [bp - 3ah], ax
        mov     dx, word ptr [W_94CA]
        mov     ax, word ptr [W_94C8]
        mov     word ptr [bp - 3eh], dx
        mov     word ptr [bp - 40h], ax
        endif
        mov     dx, word ptr [W_94C6]
        mov     ax, word ptr [W_94C4]
        if      FW_VERSION < 212
        mov     word ptr [bp - 36h], dx
        mov     word ptr [bp - 38h], ax
        mov     ax, word ptr [W_9D38]
        mov     word ptr [bp - 30h], ax
        mov     word ptr [bp - 3ah], 4e0ch
br_d44f8:
        mov     word ptr [bp - 22h], 1000h
        mov     dx, 0
        mov     ax, 0
        mov     word ptr [bp - 1ah], 0
        mov     word ptr [bp - 1ch], 0
        mov     word ptr [bp - 1eh], dx
        mov     word ptr [bp - 20h], ax
        mov     ax, word ptr [bp - 2ch]
        else
        mov     word ptr [bp - 42h], dx
        mov     word ptr [bp - 44h], ax
        mov     ax, word ptr [W_9D38]
        mov     word ptr [bp - 3ch], ax
        mov     word ptr [bp - 46h], TBL_9D3A
br_d44f8:
        mov     ax, word ptr [bp - 3ah]
        endif
        mov     dx, ax
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     si, ax
        if      FW_VERSION < 212
        mov     bx, word ptr [bp - 3ah]
        mov     dx, word ptr [bp - 32h]
        mov     ax, word ptr [bp - 34h]
        mov     word ptr [bx+si + 2], dx
        mov     word ptr [bx+si], ax
        mov     word ptr [bp - 2ah], 1
        mov     word ptr [bp - 28h], 0
        mov     word ptr [bp - 0ah], 0
        mov     word ptr [bp - 0ch], 0
L_d52c1:
        cmp     word ptr [bp - 2ah], 0
        jge     L_d52ca
        jmp     L_d5427
L_d52ca:
        cmp     word ptr [bp - 2ah], 0
        jnz     L_d52dc
        mov     dx, word ptr [bp - 36h]
        mov     ax, word ptr [bp - 38h]
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
L_d52dc:
        mov     ax, word ptr [bp - 28h]
        mov     word ptr [bp - 26h], ax
        jmp     L_d5419
L_d52e5:
        else
        mov     bx, word ptr [bp - 46h]
        mov     dx, word ptr [bp - 3eh]
        mov     ax, word ptr [bp - 40h]
        mov     word ptr [bx+si + 2], dx
        mov     word ptr [bx+si], ax
        mov     dx, word ptr [bp + 8]
        mov     ax, word ptr [bp + 6]
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        cmp     dx, word ptr [bp - 42h]
        jc      br_d452b
        jnz     br_d452d
        cmp     ax, word ptr [bp - 44h]
        ja      br_d452d
br_d452b:
        jmp     br_d4539
br_d452d:
        mov     dx, word ptr [bp - 42h]
        mov     ax, word ptr [bp - 44h]
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
br_d4539:
        lea     ax, [bp - 26h]
        push    ax
        mov     ax, 1000h
        push    ax
        mov     dx, 0
        mov     ax, 0
        push    dx
        push    ax
        xor     ax, ax
        push    ax
        push    word ptr [bp - 46h]
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        callf   SEG_D447:far_d4717
        add     sp, 10h
        mov     word ptr [bp - 38h], ax
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        sub     word ptr [bp + 6], ax
        sbb     word ptr [bp + 8], dx
        mov     dx, word ptr [bp - 3eh]
        mov     ax, word ptr [bp - 40h]
        sub     ax, word ptr [bp - 44h]
        sbb     dx, word ptr [bp - 42h]
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        mov     dx, word ptr [bp + 8]
        mov     ax, word ptr [bp + 6]
        mov     bx, word ptr [bp - 6]
        mov     cx, word ptr [bp - 8]
        callf   SEG_F26A:far_f2701
        mov     word ptr [bp - 12h], ax
        mov     dx, word ptr [bp + 8]
        mov     ax, word ptr [bp + 6]
        mov     bx, word ptr [bp - 6]
        mov     cx, word ptr [bp - 8]
        callf   SEG_F26A:far_f26f9
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        lea     ax, [bp - 2eh]
        push    ax
        push    word ptr [bp - 3ch]
        push    word ptr [bp - 42h]
        push    word ptr [bp - 44h]
        push    word ptr [bp - 38h]
        push    word ptr [bp - 46h]
        push    word ptr [bp - 0ah]
        push    word ptr [bp - 0ch]
        callf   SEG_D447:far_d4717
        add     sp, 10h
        cmp     word ptr [bp - 12h], 0
        jz      br_d460d
        lea     ax, [bp - 36h]
        push    ax
        push    word ptr [bp - 3ch]
        push    word ptr [bp - 42h]
        push    word ptr [bp - 44h]
        push    word ptr [bp - 38h]
        push    word ptr [bp - 46h]
        push    word ptr [bp - 6]
        push    word ptr [bp - 8]
        callf   SEG_D447:far_d4717
        add     sp, 10h
br_d45f1:
        mov     ax, word ptr [bp - 12h]
        dec     word ptr [bp - 12h]
        test    ax, ax
        jz      br_d460d
        lea     ax, [bp - 36h]
        push    ax
        lea     ax, [bp - 2eh]
        push    ax
        callf   SEG_EF3A:far_ef3ad
        add     sp, 4
        jmp     br_d45f1
br_d460d:
        lea     ax, [bp - 2eh]
        push    ax
        lea     ax, [bp - 26h]
        push    ax
        callf   SEG_EF3A:far_ef3ad
        add     sp, 4
        jmp     br_d4671
br_d461f:
        cmp     byte ptr [B_4E73], 0
        jz      br_d464b
        endif

RUN_BR_D464B macro   {GLOBALSYMBOLS}

        mov     ax, word ptr [W_5365]
        sub     dx, dx
        shl     ax, 1
        rcl     dx, 1
        if      FW_VERSION >= 212
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        lea     ax, [bp - 26h]
        push    ax
        lea     ax, [bp - 10h]
        else
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        lea     ax, [bp - 20h]
        push    ax
        lea     ax, [bp - 8]
        endif
        push    ax
        lea     ax, [bp + 6]
        push    ax
        callf   SEG_EF35:far_ef352
        add     sp, 6
        if      FW_VERSION >= 212
        jmp     br_d4671
br_d464b:
        push    word ptr [W_5367]
        callf   SEG_E866:far_e8672
        add     sp, 2
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        lea     ax, [bp - 26h]
        push    ax
        lea     ax, [bp - 10h]
        push    ax
        lea     ax, [bp + 6]
        push    ax
        callf   SEG_EF35:far_ef352
        add     sp, 6
br_d4671:
        cmp     byte ptr [B_4E73], 0
        jz      br_d46b9
        lea     ax, [bp - 1ah]
        push    ax
        else
L_d544c:
        push    word ptr [bp + 0ah]
        endif
        mov     ax, W_5385
        push    ax
        if      FW_VERSION >= 212
        lea     ax, [bp - 26h]
        else
        lea     ax, [bp - 20h]
        endif
        push    ax
        callf   SEG_EF24:far_ef24d
        if      FW_VERSION >= 212
        add     sp, 6
        mov     bx, word ptr [bp + 0ah]
        mov     word ptr [bx], 0
        mov     bx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp - 16h]
        mov     word ptr [bx + 2], ax
        mov     bx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp - 14h]
        mov     word ptr [bx + 4], ax
        mov     bx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp - 1ah]
        mov     word ptr [bx + 6], ax
        mov     bx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp - 18h]
        mov     word ptr [bx + 8], ax
        jmp     br_d46ff
br_d46b9:
        xor     ax, ax
        mov     word ptr [bp - 1ch], 0
        mov     word ptr [bp - 1eh], ax
        mov     ax, TBL_5389
        push    ax
        lea     ax, [bp - 26h]
        push    ax
        callf   SEG_EF3D:far_ef3d0
        add     sp, 4
        mov     bx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp - 20h]
        mov     word ptr [bx], ax
        mov     bx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp - 1eh]
        mov     word ptr [bx + 2], ax
        mov     bx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp - 1ch]
        mov     word ptr [bx + 4], ax
        mov     bx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp - 26h]
        mov     word ptr [bx + 6], ax
        mov     bx, word ptr [bp + 0ah]
        mov     ax, word ptr [bp - 24h]
        mov     word ptr [bx + 8], ax
br_d46ff:
        push    word ptr [bp + 0ah]
        mov     ax, A_9F97
        push    ax
        push    word ptr [bp + 0ah]
        callf   SEG_E8C4:far_e8c45
        endif
        add     sp, 6
        pop     si
        pop     di
        mov     sp, bp
        pop     bp
        retf
        endm
        if      FW_VERSION >= 212
        RUN_BR_D464B
far_d4717:
        push    bp
        mov     bp, sp
        add     sp, 0ffe6h
        push    di
        push    si
        mov     dx, word ptr [bp + 10h]
        mov     ax, word ptr [bp + 0eh]
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        mov     dx, 0
        mov     ax, 0
        mov     bx, word ptr [bp + 14h]
        mov     word ptr [bx + 6], 0
        mov     word ptr [bx + 4], 0
        mov     bx, word ptr [bp + 14h]
        mov     word ptr [bx + 2], dx
        mov     word ptr [bx], ax
        cmp     word ptr [bp + 8], 0
        jnz     br_d4750
        cmp     word ptr [bp + 6], 0
br_d4750:
        jnz     br_d475b
        mov     ax, word ptr [bp + 0ch]
br_d4755:
        pop     si
        pop     di
        mov     sp, bp
        pop     bp
        retf
br_d475b:
        jmp     br_d483d
br_d475e:
        cmp     byte ptr [B_4E73], 0
        jz      br_d4793
        endif
        mov     ax, word ptr [W_5365]
        sub     dx, dx
        mov     cx, 0ch
        jcxz    br_d4775
loop_d476f:
        shl     ax, 1
        rcl     dx, 1
        loop    loop_d476f
br_d4775:
        push    dx
        push    ax
        if      FW_VERSION >= 212
        mov     ax, word ptr [bp + 12h]
        else
        mov     ax, word ptr [bp - 22h]
        endif
        sub     dx, dx
        mov     bx, dx
        mov     cx, ax
        pop     ax
        pop     dx
        callf   SEG_F26A:far_f2701
        shl     ax, 1
        rcl     dx, 1
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        if      FW_VERSION < 212
        mov     ax, word ptr [bp - 26h]
        else
        jmp     br_d47b0
br_d4793:
        push    word ptr [bp + 12h]
        callf   SEG_E85C:far_e85cf
        add     sp, 2
        mov     word ptr [bp - 1ah], ax
        push    ax
        callf   SEG_E866:far_e8672
        add     sp, 2
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
br_d47b0:
        mov     dx, word ptr [bp - 0eh]
        mov     ax, word ptr [bp - 10h]
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        mov     ax, word ptr [bp + 0ch]
        endif
        mov     dx, ax
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     si, ax
        if      FW_VERSION >= 212
        mov     bx, word ptr [bp + 0ah]
        else
        mov     bx, word ptr [bp - 3ah]
        endif
        mov     dx, word ptr [bx+si + 2]
        mov     ax, word ptr [bx+si]
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        if      FW_VERSION < 212
        mov     ax, word ptr [bp - 22h]
        mov     word ptr [bp - 24h], ax
        endif
        add     si, bx
        mov     di, si
        mov     ax, word ptr [di + 4]
        if      FW_VERSION >= 212
        mov     word ptr [bp + 12h], ax
        else
        mov     word ptr [bp - 22h], ax
        cmp     word ptr [bp - 2ah], 0
        jnz     L_d5362
        mov     dx, word ptr [bp - 32h]
        mov     ax, word ptr [bp - 34h]
        cmp     dx, word ptr [bp - 0eh]
        ja      L_d5354
        jnz     L_d5356
        cmp     ax, word ptr [bp - 10h]
        jbe     L_d5356
L_d5354:
        jmp     L_d5362
L_d5356:
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        mov     ax, word ptr [bp - 30h]
        mov     word ptr [bp - 22h], ax
L_d5362:
        cmp     word ptr [bp - 2ah], 1
        jnz     L_d5399
        mov     dx, word ptr [bp - 36h]
        mov     ax, word ptr [bp - 38h]
        cmp     dx, word ptr [bp - 0eh]
        ja      L_d537a
        jnz     L_d537c
        cmp     ax, word ptr [bp - 10h]
        jc      L_d537c
L_d537a:
        jmp     L_d5399
L_d537c:
        mov     word ptr [bp - 0eh], dx
        mov     word ptr [bp - 10h], ax
        mov     ax, word ptr [bp - 24h]
        mov     word ptr [bp - 30h], ax
        mov     word ptr [bp - 22h], ax
        mov     ax, word ptr [bp - 26h]
        dec     word ptr [bp - 26h]
        mov     word ptr [bp - 28h], ax
        mov     word ptr [bp - 2ah], 0
L_d5399:
        endif
        mov     dx, word ptr [bp - 0eh]
        mov     ax, word ptr [bp - 10h]
        sub     ax, word ptr [bp - 0ch]
        sbb     dx, word ptr [bp - 0ah]
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        mov     bx, word ptr [bp + 8]
        mov     cx, word ptr [bp + 6]
        cmp     bx, dx
        ja      br_d4803
        jnz     br_d4805
        cmp     cx, ax
        jc      br_d4805
br_d4803:
        jmp     br_d480b
br_d4805:
        mov     word ptr [bp - 2], bx
        mov     word ptr [bp - 4], cx
br_d480b:
        lea     ax, [bp - 18h]
        push    ax
        lea     ax, [bp - 8]
        push    ax
        lea     ax, [bp - 4]
        push    ax
        callf   SEG_EF35:far_ef352
        add     sp, 6
        lea     ax, [bp - 18h]
        push    ax
        if      FW_VERSION < 212
        lea     ax, [bp - 20h]
        push    ax
        callf   SEG_EF3A:far_ef3ad
        add     sp, 4
        mov     dx, word ptr [bp - 0eh]
        mov     ax, word ptr [bp - 10h]
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        sub     word ptr [bp + 6], ax
        sbb     word ptr [bp + 8], dx
        else
        push    word ptr [bp + 14h]
        callf   SEG_EF3A:far_ef3ad
        add     sp, 4
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        sub     word ptr [bp + 6], ax
        sbb     word ptr [bp + 8], dx
        inc     word ptr [bp + 0ch]
br_d483d:
        endif
        cmp     word ptr [bp + 8], 0
        ja      br_d484b
        jnz     br_d484e
        cmp     word ptr [bp + 6], 0
        jbe     br_d484e
br_d484b:
        jmp     br_d475e
br_d484e:
        if      FW_VERSION < 212
        mov     word ptr [bp - 2ah], 0ffffh
        jmp     L_d5424
br_d475e:
        inc     word ptr [bp - 26h]
L_d5419:
        mov     ax, word ptr [bp - 26h]
        cmp     ax, word ptr [bp - 2ch]
        jg      L_d5424
        jmp     L_d52e5
L_d5424:
        jmp     L_d52c1
L_d5427:
        jmp     L_d544c
br_d461f:
        RUN_BR_D464B
        phase   5
        endif

RUN_FAR_DF05C macro   {GLOBALSYMBOLS}
far_df05c:
        push    bp
        mov     bp, sp
        add     sp, 0fffah
        mov     word ptr [bp - 4], 0
        mov     word ptr [bp - 6], 0
        mov     word ptr [bp - 2], 0
loop_df071:
        mov     ax, word ptr [bp - 2]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 0ffh
        jnz     br_df095
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        add     word ptr [bp - 6], ax
        adc     word ptr [bp - 4], dx
br_df095:
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 50h
        jl      loop_df071
        mov     dx, word ptr [bp - 4]
        mov     ax, word ptr [bp - 6]
        mov     sp, bp
        pop     bp
        retf
far_df0a8:
        push    bp
        mov     bp, sp
        add     sp, 0fffah
        mov     word ptr [bp - 2], 0
        mov     word ptr [bp - 4], 0
        mov     word ptr [bp - 6], 0
loop_df0bd:
        mov     ax, word ptr [bp - 6]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 1
        jnz     br_df0e1
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        add     word ptr [bp - 4], ax
        adc     word ptr [bp - 2], dx
br_df0e1:
        inc     word ptr [bp - 6]
        cmp     word ptr [bp - 6], 50h
        jl      loop_df0bd
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        mov     sp, bp
        pop     bp
        retf
far_df0f4:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 212
        cmp     word ptr [bp + 6], W_0022
        else
        cmp     word ptr [bp + 6], 22h
        endif
        jc      br_df103
        xor     ax, ax
br_df0ff:
        mov     sp, bp
        pop     bp
        retf
br_df103:
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        cmp     byte ptr [bx + TBL_A656], 0
        jnz     br_df121
        xor     ax, ax
        jmp     br_df0ff
br_df121:
        mov     ax, word ptr [bx + TBL_A66C]
        mov     dx, word ptr [bx + TBL_A66E]
        mov     bx, 0
        mov     cx, 28h
        callf   SEG_F26A:far_f26a7
        jmp     br_df0ff
        if      FW_VERSION >= 212
        phase   6
        else
        phase   0fh
        endif
far_df136:
        push    bp
        mov     bp, sp
        add     sp, 0ffeeh
        if      FW_VERSION >= 212
        cmp     word ptr [bp + 6], W_0022
        else
        cmp     word ptr [bp + 6], 22h
        endif
        jc      br_df146
br_df142:
        mov     sp, bp
        pop     bp
        retf
br_df146:
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_A667]
        cbw
        cmp     ax, word ptr [bp + 6]
        jz      br_df165
        jmp     br_df142
br_df165:
        mov     ax, 0ffffh
        mov     word ptr [bp - 10h], 0ffffh
        mov     word ptr [bp - 12h], ax
        mov     word ptr [bp - 0eh], 0
        if      FW_VERSION >= 212
loop_df175:
        else
L_d557e:
        endif
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_AE90]
        cbw
        cmp     ax, word ptr [bp + 6]
        jnz     br_df196
        mov     ax, word ptr [bp - 0eh]
        mov     word ptr [bp - 12h], ax
        if      FW_VERSION >= 212
        jmp     br_df19f
br_df196:
        inc     word ptr [bp - 0eh]
        cmp     word ptr [bp - 0eh], 50h
        jl      loop_df175
br_df19f:
        cmp     word ptr [bp - 12h], 0
        jge     br_df1a7
        jmp     br_df142
br_df1a7:
        mov     word ptr [bp - 0eh], 0
loop_df1ac:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        else
br_df196:
        endif
        cmp     byte ptr [bx + TBL_AE8F], 0
        jnz     br_df1d2
        cmp     word ptr [bp - 10h], 0
        jge     br_df1d0
        mov     ax, word ptr [bp - 0eh]
        mov     word ptr [bp - 10h], ax
        jmp     br_df1d2
br_df1d0:
        jmp     br_df1db
br_df1d2:
        inc     word ptr [bp - 0eh]
        cmp     word ptr [bp - 0eh], 50h
        if      FW_VERSION >= 212
        jl      loop_df1ac
        else
        jl      L_d557e
        endif
br_df1db:
        cmp     word ptr [bp - 0eh], 50h
        if      FW_VERSION >= 212
        jnz     br_df1e4
        jmp     near br_df142
br_df1e4:
        else
        jnz     L_d55c5
        jmp     short br_df142
L_d55c5:
        cmp     word ptr [bp - 12h], 0
        jge     L_d55ce
        jmp     near br_df142
L_d55ce:
        endif

        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        endm
        if      FW_VERSION < 212
        RUN_FAR_DF05C
        mov     ax, word ptr [bx + TBL_A674]
        mov     dx, word ptr [bx + TBL_A676]
        sub     ax, word ptr [bx +TBL_A668]
        sbb     dx, word ptr [bx +TBL_A66A]
        endif

RUN_BR_DF271 macro   {GLOBALSYMBOLS}
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        or      dx, ax
        jz      br_df271
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     byte ptr [bx + TBL_AE8F], 0ffh
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     ax, word ptr [bx + TBL_A668]
        mov     dx, word ptr [bx + TBL_A66A]
        else
        mov     ax, word ptr [bx +TBL_A668]
        mov     dx, word ptr [bx +TBL_A66A]
        endif
        push    dx
        push    ax
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE93], dx
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], ax
        else
        mov     word ptr [bx +TBL_AE91], ax
        endif
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        mov     word ptr [bx + TBL_AE97], dx
        mov     word ptr [bx + TBL_AE95], ax
br_df271:
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_A67A]
        mov     bx, 28h
        imul    bx
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        push    dx
        push    ax
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        mov     cx, word ptr [bx + TBL_A66C]
        mov     bx, word ptr [bx + TBL_A66E]
        pop     ax
        pop     dx
        sub     cx, ax
        sbb     bx, dx
        mov     dx, bx
        mov     ax, cx
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        or      dx, ax
        jz      br_df331
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     byte ptr [bx + TBL_AE8F], 0ffh
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     ax, word ptr [bx + TBL_A668]
        mov     dx, word ptr [bx + TBL_A66A]
        else
        mov     ax, word ptr [bx +TBL_A668]
        mov     dx, word ptr [bx +TBL_A66A]
        endif
        add     ax, word ptr [bp - 0ch]
        adc     dx, word ptr [bp - 0ah]
        push    dx
        push    ax
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE93], dx
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], ax
        else
        mov     word ptr [bx +TBL_AE91], ax
        endif
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     dx, word ptr [bp - 6]
        mov     ax, word ptr [bp - 8]
        mov     word ptr [bx + TBL_AE97], dx
        mov     word ptr [bx + TBL_AE95], ax
br_df331:
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        push    dx
        push    ax
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        pop     ax
        pop     dx
        if      FW_VERSION >= 212
        add     word ptr [bx + TBL_A668], ax
        adc     word ptr [bx + TBL_A66A], dx
        else
        add     word ptr [bx +TBL_A668], ax
        adc     word ptr [bx +TBL_A66A], dx
        endif
        mov     dx, word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ch]
        sub     ax, word ptr [bp - 4]
        sbb     dx, word ptr [bp - 2]
        mov     word ptr [bx + TBL_A66E], dx
        mov     word ptr [bx + TBL_A66C], ax
        mov     ax, word ptr [bx + TBL_A678]
        sub     word ptr [bx + TBL_A67A], ax
        mov     word ptr [bx + TBL_A678], 0
        if      FW_VERSION >= 212
        mov     ax, word ptr [bx + TBL_A668]
        mov     dx, word ptr [bx + TBL_A66A]
        else
        mov     ax, word ptr [bx +TBL_A668]
        mov     dx, word ptr [bx +TBL_A66A]
        endif
        push    dx
        push    ax
        mov     ax, word ptr [bp - 12h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE93], dx
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], ax
        else
        mov     word ptr [bx +TBL_AE91], ax
        endif
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_A66C]
        mov     dx, word ptr [bx + TBL_A66E]
        push    dx
        push    ax
        mov     ax, word ptr [bp - 12h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE97], dx
        mov     word ptr [bx + TBL_AE95], ax
        jmp     br_df142
        if      FW_VERSION >= 212
        phase   4
        else
        phase   5
        endif
far_df3d4:
        push    bp
        mov     bp, sp
        add     sp, 0ffech
        if      FW_VERSION >= 212
        callf   SEG_EF96:far_ef966
        else
        callf   0e3b8h:far_ef966
        endif
        mov     word ptr [bp - 0eh], 0
br_df3e4:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 0
        jnz     br_df401
        mov     ax, 0fffeh
br_df3fd:
        mov     sp, bp
        pop     bp
        retf
br_df401:
        cmp     byte ptr [bx + TBL_AE8F], 0ffh
        jz      br_df40b
        jmp     br_df859
br_df40b:
        mov     ax, word ptr [bp - 0eh]
        inc     ax
        mov     word ptr [bp - 10h], ax
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 0ffh
        jz      br_df428
        jmp     br_df582
br_df428:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     ax, word ptr [bx + TBL_AE91]
        else
        mov     ax, word ptr [bx +TBL_AE91]
        endif
        mov     dx, word ptr [bx + TBL_AE93]
        push    dx
        push    ax
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE93], dx
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], ax
        else
        mov     word ptr [bx +TBL_AE91], ax
        endif
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        push    dx
        push    ax
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        add     word ptr [bx + TBL_AE95], ax
        adc     word ptr [bx + TBL_AE97], dx
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        sub     ax, word ptr [bp + 8]
        sbb     dx, word ptr [bp + 0ah]
        mov     word ptr [bp - 0ah], dx
        mov     word ptr [bp - 0ch], ax
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     byte ptr [bx + TBL_AE8F], 0
        mov     word ptr [bx + TBL_AE93], 0ffffh
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], 0ffffh
        else
        mov     word ptr [bx +TBL_AE91], 0ffffh
        endif
        mov     word ptr [bx + TBL_AE97], 0
        mov     word ptr [bx + TBL_AE95], 0
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        cmp     dx, word ptr [bp + 0ah]
        jc      br_df4ef
        jnz     br_df4f2
        cmp     ax, word ptr [bp + 8]
        jnc     br_df4f2
br_df4ef:
        jmp     near br_df57f
br_df4f2:
        mov     byte ptr [bx + TBL_AE8F], 1
        mov     al, byte ptr [bp + 6]
        mov     byte ptr [bx + TBL_AE90], al
        cmp     word ptr [bp - 0ah], 0
        jnz     br_df508
        cmp     word ptr [bp - 0ch], 0
br_df508:
        jz      br_df579
        mov     dx, word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ch]
        sub     word ptr [bx + TBL_AE95], ax
        sbb     word ptr [bx + TBL_AE97], dx
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     byte ptr [bx + TBL_AE8F], 0ffh
        mov     byte ptr [bx + TBL_AE90], 0ffh
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     ax, word ptr [bx + TBL_AE91]
        else
        mov     ax, word ptr [bx +TBL_AE91]
        endif
        mov     dx, word ptr [bx + TBL_AE93]
        add     ax, word ptr [bx + TBL_AE95]
        adc     dx, word ptr [bx + TBL_AE97]
        push    dx
        push    ax
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE93], dx
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], ax
        else
        mov     word ptr [bx +TBL_AE91], ax
        endif
        mov     dx, word ptr [bp - 0ah]
        mov     ax, word ptr [bp - 0ch]
        mov     word ptr [bx + TBL_AE97], dx
        mov     word ptr [bx + TBL_AE95], ax
br_df579:
        mov     ax, word ptr [bp - 10h]
        jmp     br_df3fd
br_df57f:
        jmp     br_df859
br_df582:
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 1
        jz      br_df59b
        jmp     br_df859
br_df59b:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        mov     word ptr [bp - 6], dx
        mov     word ptr [bp - 8], ax
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        mov     word ptr [bp - 2], dx
        mov     word ptr [bp - 4], ax
        mov     ax, word ptr [bp - 10h]
        inc     ax
        mov     word ptr [bp - 12h], ax
br_df5dc:
        mov     ax, word ptr [bp - 12h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 1
        jnz     br_df614
        mov     ax, word ptr [bp - 12h]
        inc     word ptr [bp - 12h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        add     word ptr [bp - 4], ax
        adc     word ptr [bp - 2], dx
        jmp     br_df5dc
br_df614:
        push    word ptr [bp - 2]
        push    word ptr [bp - 4]
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        push    word ptr [bx + TBL_AE93]
        if      FW_VERSION >= 212
        push    word ptr [bx + TBL_AE91]
        else
        push    word ptr [bx +TBL_AE91]
        endif
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        push    word ptr [bx + TBL_AE93]
        if      FW_VERSION >= 212
        push    word ptr [bx + TBL_AE91]
        callf   SEG_EF82:far_ef826
        else
        push    word ptr [bx +TBL_AE91]
        callf   0e3a5h:far_ef826
        endif
        add     sp, 0ch
br_df650:
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        cmp     byte ptr [bx + TBL_AE8F], 1
        jz      br_df669
        jmp     br_df7f4
br_df669:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     byte ptr [bx + TBL_AE8F], 1
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_AE90]
        push    ax
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        mov     byte ptr [bx + TBL_AE90], al
        mov     byte ptr [bp - 13h], al
        mov     ax, word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     ax, word ptr [bx + TBL_AE91]
        else
        mov     ax, word ptr [bx +TBL_AE91]
        endif
        mov     dx, word ptr [bx + TBL_AE93]
        sub     ax, word ptr [bp - 8]
        sbb     dx, word ptr [bp - 6]
        push    dx
        push    ax
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE93], dx
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], ax
        else
        mov     word ptr [bx +TBL_AE91], ax
        endif
        mov     dx, word ptr [bp - 6]
        mov     ax, word ptr [bp - 8]
        push    dx
        push    ax
        mov     al, byte ptr [bp - 13h]
        cbw
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        pop     ax
        pop     dx
        endm
        if      FW_VERSION < 212
        RUN_BR_DF271
        sub     word ptr [bx +TBL_A668], ax
        sbb     word ptr [bx +TBL_A66A], dx
        mov     dx, word ptr [bp - 6]
        mov     ax, word ptr [bp - 8]
        push    dx
        push    ax
        mov     al, byte ptr [bp - 13h]
        cbw
        RUN_AFTER_BR_C7AC4_2
        pop     dx
        sub     word ptr [bx +TBL_A6D6_V112], ax
        sbb     word ptr [bx +TBL_A6D8_V112], dx
        endif

RUN_BR_DF732 macro   {GLOBALSYMBOLS}
        mov     dx, word ptr [bp - 6]
        mov     ax, word ptr [bp - 8]
        push    dx
        push    ax
        mov     al, byte ptr [bp - 13h]
        cbw
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        pop     ax
        pop     dx
        sub     word ptr [bx + TBL_A674], ax
        sbb     word ptr [bx + TBL_A676], dx
        mov     al, byte ptr [bp - 13h]
        mov     byte ptr [bp - 14h], al
br_df732:
        mov     al, byte ptr [bp - 14h]
        cbw
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_A667]
        cmp     al, byte ptr [bp - 13h]
        if      FW_VERSION >= 212
        jz      br_df7b9
        else
        jnz     L_d5b69
        jmp     near br_df7b9
L_d5b69:
        endif
        mov     al, byte ptr [bp - 14h]
        cbw
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_A667]
        mov     byte ptr [bp - 14h], al
        mov     dx, word ptr [bp - 6]
        mov     ax, word ptr [bp - 8]
        push    dx
        push    ax
        mov     al, byte ptr [bp - 14h]
        cbw
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        pop     ax
        pop     dx
        endm
        if      FW_VERSION < 212
        RUN_BR_DF732
        sub     word ptr [bx +TBL_A668], ax
        sbb     word ptr [bx +TBL_A66A], dx
        mov     dx, word ptr [bp - 6]
        mov     ax, word ptr [bp - 8]
        push    dx
        push    ax
        mov     al, byte ptr [bp - 14h]
        cbw
        endif

RUN_AFTER_L_D5B69 macro   {GLOBALSYMBOLS}
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        pop     ax
        endm
        if      FW_VERSION < 212
        RUN_AFTER_L_D5B69
        pop     dx
        sub     word ptr [bx +TBL_A6D6_V112], ax
        sbb     word ptr [bx +TBL_A6D8_V112], dx
        endif

RUN_BR_DF7B9 macro   {GLOBALSYMBOLS}
        mov     dx, word ptr [bp - 6]
        mov     ax, word ptr [bp - 8]
        push    dx
        push    ax
        mov     al, byte ptr [bp - 14h]
        cbw
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        pop     ax
        pop     dx
        sub     word ptr [bx + TBL_A674], ax
        sbb     word ptr [bx + TBL_A676], dx
        jmp     near br_df732
br_df7b9:
        mov     ax, word ptr [bp - 10h]
        inc     word ptr [bp - 10h]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_AE95]
        mov     dx, word ptr [bx + TBL_AE97]
        push    dx
        push    ax
        mov     ax, word ptr [bp - 0eh]
        inc     word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE97], dx
        mov     word ptr [bx + TBL_AE95], ax
        jmp     br_df650
br_df7f4:
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     byte ptr [bx + TBL_AE8F], 0ffh
        mov     byte ptr [bx + TBL_AE90], 0ffh
        mov     ax, word ptr [bp - 0eh]
        dec     ax
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     ax, word ptr [bx + TBL_AE91]
        else
        mov     ax, word ptr [bx +TBL_AE91]
        endif
        mov     dx, word ptr [bx + TBL_AE93]
        add     ax, word ptr [bx + TBL_AE95]
        adc     dx, word ptr [bx + TBL_AE97]
        push    dx
        push    ax
        mov     ax, word ptr [bp - 0eh]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        pop     ax
        pop     dx
        mov     word ptr [bx + TBL_AE93], dx
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], ax
        else
        mov     word ptr [bx +TBL_AE91], ax
        endif
        mov     dx, word ptr [bp - 6]
        mov     ax, word ptr [bp - 8]
        mov     word ptr [bx + TBL_AE97], dx
        mov     word ptr [bx + TBL_AE95], ax
        dec     word ptr [bp - 0eh]
br_df859:
        inc     word ptr [bp - 0eh]
        cmp     word ptr [bp - 0eh], 50h
        jge     br_df865
        jmp     br_df3e4
br_df865:
        jmp     br_df3fd
        phase   8
        endm
        if      FW_VERSION < 212
        RUN_BR_DF7B9
L_d5ca8:
        push    bp
        mov     bp, sp
        add     sp, 0fffeh
        cmp     word ptr [bp + 6], 22h
        jc      L_d5cb8
L_d5cb4:
        mov     sp, bp
        pop     bp
        retf
L_d5cb8:
        cmp     word ptr [bp + 0ah], 0
        jl      L_d5d0b
        endif

RUN_AFTER_L_D5CB8 macro   {GLOBALSYMBOLS}
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_A66C]
        mov     dx, word ptr [bx + TBL_A66E]
        mov     bx, 0
        mov     cx, 28h
        callf   SEG_F26A:far_f26a7
        endm
        if      FW_VERSION < 212
        RUN_AFTER_L_D5CB8
        mov     word ptr [bp - 2], ax
        mov     cx, word ptr [bp + 0ah]
        cmp     cx, ax
        jle     L_d5cf1
        mov     word ptr [bp + 0ah], ax
L_d5cf1:
        RUN_AFTER_L_D2B61_2
        mov     ax, word ptr [bp + 0ah]
        mov     word ptr [bx + TBL_A67A], ax
L_d5d0b:
        cmp     word ptr [bp + 8], 0
        jl      L_d5d3c
        endif

RUN_AFTER_L_D5D0B macro   {GLOBALSYMBOLS}
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_A67A]
        endm
        if      FW_VERSION < 212
        RUN_AFTER_L_D5D0B
        mov     word ptr [bp - 2], ax
        mov     cx, word ptr [bp + 8]
        cmp     cx, ax
        jle     L_d5d35
        mov     word ptr [bp + 8], ax
L_d5d35:
        mov     ax, word ptr [bp + 8]
        mov     word ptr [bx + TBL_A678], ax
L_d5d3c:
        cmp     word ptr [bp + 0ch], 0
        jl      L_d5d5c
        RUN_AFTER_BR_C7CE4
        mov     ax, word ptr [bp + 0ch]
        mov     word ptr [bx + TBL_A67C], ax
L_d5d5c:
        cmp     word ptr [bp + 0eh], 0
        jl      L_d5d91
        endif

RUN_AFTER_L_D5D5C macro   {GLOBALSYMBOLS}
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        mov     ax, word ptr [bx + TBL_A67A]
        sub     ax, word ptr [bx + TBL_A678]
        endm
        if      FW_VERSION < 212
        RUN_AFTER_L_D5D5C
        mov     word ptr [bp - 2], ax
        mov     cx, word ptr [bp + 0eh]
        cmp     cx, ax
        jle     L_d5d8a
        mov     word ptr [bp + 0eh], ax
L_d5d8a:
        mov     ax, word ptr [bp + 0eh]
        mov     word ptr [bx +TBL_A6E4_V112], ax
L_d5d91:
        push    word ptr [bp + 6]
        callf   0e36ch:L_e36c4
        add     sp, 2
        jmp     L_d5cb4
        phase   0fh
        endif

RUN_FAR_DF8B4 macro   {GLOBALSYMBOLS}
far_df8b4:
        push    bp
        mov     bp, sp
        add     sp, 0fffeh
        mov     word ptr [bp - 2], 0
loop_df8bf:
        mov     ax, 10h
        push    ax
        mov     ax, word ptr [bp - 2]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        if      FW_VERSION >= 212
        add     ax, TBL_A656
        else
        add     ax, 0a6bch
        endif
        push    ax
        push    word ptr [bp + 6]
        callf   SEG_F276:far_f276b
        add     sp, 6
        test    ax, ax
        jnz     br_df8ee
        mov     ax, word ptr [bp - 2]
br_df8ea:
        mov     sp, bp
        pop     bp
        retf
br_df8ee:
        inc     word ptr [bp - 2]
        if      FW_VERSION >= 212
        cmp     word ptr [bp - 2], W_0022
        else
        cmp     word ptr [bp - 2], 22h
        endif
        jl      loop_df8bf
        mov     ax, 0fffch
        jmp     br_df8ea
        if      FW_VERSION >= 212
        phase   0ch
        else
        phase   7
        endif
far_df8fc:
        push    bp
        mov     bp, sp
        add     sp, 0fffch
        xor     ax, ax
        push    ax
        mov     ax, 7d6h
        push    ax
        if      FW_VERSION >= 212
        mov     ax, TBL_A656
        else
        mov     ax, 0a6bch
        endif
        push    ax
        callf   SEG_F25D:far_f25dc
        add     sp, 6
        xor     ax, ax
        push    ax
        mov     ax, 32ah
        push    ax
        if      FW_VERSION >= 212
        mov     ax, TBL_AE8F
        push    ax
        callf   SEG_F25D:far_f25dc
        add     sp, 6
        mov     ax, 0ffffh
        push    ax
        mov     ax, W_0022
        push    ax
        mov     ax, TBL_AE2C
        else
        mov     ax, 0aef4h
        endif
        push    ax
        callf   SEG_F25D:far_f25dc
        add     sp, 6
        mov     ax, 0ffffh
        push    ax
        endm
        if      FW_VERSION < 212
        RUN_FAR_DF8B4
        mov     ax, 3
        push    ax
        mov     ax, 0aeb4h
        push    ax
        callf   SEG_F25D:far_f25dc
        add     sp, 6
        mov     ax, 0ffffh
        push    ax
        mov     ax, 22h
        push    ax
        mov     ax, 0ae92h

        push    ax
        callf   SEG_F25D:far_f25dc
        add     sp, 6
        mov     ax, 0ffffh
        push    ax
        endif

RUN_BR_DF9EA macro   {GLOBALSYMBOLS}
        mov     ax, 10h
        push    ax
        if      FW_VERSION >= 212
        mov     ax, TBL_AE4F
        else
        mov     ax, 0aeb8h
        endif
        push    ax
        callf   SEG_F25D:far_f25dc
        add     sp, 6
        xor     ax, ax
        push    ax
        mov     ax, 41h
        push    ax
        mov     ax, TBL_B1B9
        push    ax
        callf   SEG_F25D:far_f25dc
        add     sp, 6
        mov     word ptr [W_B1F9], 0ffffh
        mov     word ptr [W_B1FB], 0
        mov     word ptr [W_B1FD], 0
        if      FW_VERSION >= 212
        callf   SEG_EF94:far_ef944
        else
        callf   0e3b7h:far_ef944
        endif
        mov     word ptr [bp - 4], 5550h
        mov     ax, 1
        push    ax
        lea     ax, [bp - 4]
        push    ax
        mov     dx, 0fh
        mov     ax, 0ffffh
        push    dx
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_EFBF:far_efbf1
        else
        callf   0e3e3h:far_efbf1
        endif
        add     sp, 8
        mov     word ptr [bp - 4], 0
        mov     ax, 1
        push    ax
        lea     ax, [bp - 4]
        push    ax
        mov     dx, 7
        mov     ax, 0ffffh
        push    dx
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_EFBF:far_efbf1
        else
        callf   0e3e3h:far_efbf1
        endif
        add     sp, 8
        mov     ax, 1
        push    ax
        lea     ax, [bp - 4]
        push    ax
        mov     dx, 0fh
        mov     ax, 0ffffh
        push    dx
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_EF8C:far_ef8c5
        else
        callf   0e3afh:far_ef8c5
        endif
        add     sp, 8
        mov     ax, word ptr [bp - 4]
        xor     ax, 5550h
        test    ax, 0fff0h
        jz      br_df9ea
        if      FW_VERSION >= 212
        mov     byte ptr [B_AE4E], 0
        else
        mov     byte ptr [B_AEB7_V112], 0
        endif
        mov     word ptr [TBL_AE97], 8
        mov     word ptr [TBL_AE95], 0
        jmp     br_df9fb
br_df9ea:
        if      FW_VERSION >= 212
        mov     byte ptr [B_AE4E], 1
        else
        mov     byte ptr [B_AEB7_V112], 1
        endif
        mov     word ptr [TBL_AE97], 10h
        mov     word ptr [TBL_AE95], 0
br_df9fb:
        mov     byte ptr [TBL_AE8F], 0ffh
        mov     byte ptr [TBL_AE90], 0ffh
        mov     word ptr [TBL_AE93], 0
        if      FW_VERSION >= 212
        mov     word ptr [TBL_AE91], 0
        else
        mov     word ptr [TBL_AE91], 0
        endif
        mov     word ptr [bp - 2], 1
loop_dfa16:
        mov     ax, word ptr [bp - 2]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     byte ptr [bx + TBL_AE90], 0ffh
        mov     ax, word ptr [bp - 2]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        mov     bx, ax
        mov     word ptr [bx + TBL_AE93], 0ffffh
        if      FW_VERSION >= 212
        mov     word ptr [bx + TBL_AE91], 0ffffh
        else
        mov     word ptr [bx +TBL_AE91], 0ffffh
        endif
        inc     word ptr [bp - 2]
        cmp     word ptr [bp - 2], 50h
        jle     loop_dfa16
        xor     ax, ax
        push    ax
        mov     ax, 0ffffh
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_D485:far_d49f3
        else
        callf   0dc48h:far_d49f3
        endif
        add     sp, 4
        callf   SEG_E016:far_e016f
        mov     sp, bp
        pop     bp
        retf
        endm
        if      FW_VERSION < 212
        RUN_BR_DF9EA
        phase   5
        endif

RUN_FAR_DFBE6 macro   {GLOBALSYMBOLS}
far_dfbe6:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 212
        add     sp, 0fffah
        else
        add     sp, 0fff0h
        endif
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr [bx]
        sub     ah, ah
        jmp     br_dfe79
br_dfbf6:
        push    word ptr [bp + 6]
        if      FW_VERSION >= 212
        callf   SEG_0579:far_0579f
        else
        callf   4f2h:far_0579f
        endif
        add     sp, 2
        jmp     br_dfe91
br_dfc04:
        push    word ptr [bp + 6]
        if      FW_VERSION >= 212
        callf   SEG_0579:far_0583f
        else
        callf   4f2h:far_0583f
        endif
        add     sp, 2
        jmp     br_dfe91
br_dfc12:
        mov     bx, word ptr [bp + 6]
        cmp     byte ptr [bx + 2], 47h
        jz      br_dfc1e
        if      FW_VERSION >= 212
        jmp     br_dfe91
        else
L_d5f9a:
        mov     sp, bp
        pop     bp
        retf
        endif
br_dfc1e:
        cmp     byte ptr [bx + 5], 45h
        jz      br_dfc2d
        cmp     byte ptr [bx + 5], 46h
        jz      br_dfc2d
        if      FW_VERSION >= 212
        jmp     br_dfe91
        else
        jmp     L_d5f9a
        endif
br_dfc2d:
        mov     al, byte ptr [bx + 7]
        and     al, 1fh
        mov     byte ptr [bp - 1], al
        mov     al, byte ptr [bx + 6]
        sub     ah, ah
        jmp     br_dfe57
br_dfc3d:
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr [bx + 8]
        mov     byte ptr [bp - 2], al
        cmp     byte ptr [bp - 1], 0
        jz      br_dfc6b
        mov     ax, 0ffffh
        push    ax
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [bx + TBL_AE2E]
        else
        mov     al, byte ptr [bx +TBL_AE94_V112]
        endif
        cbw
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_EF72:far_ef727
        else
        callf   0e35ch:far_ef727
        endif
        add     sp, 6
        jmp     br_dfcad
br_dfc6b:
        mov     ax, 0ffffh
        push    ax
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        mov     al, byte ptr [TBL_AE2C]
        cbw
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_EF72:far_ef727
        else
        callf   0e35ch:far_ef727
        endif
        add     sp, 6
        mov     ax, 0ffffh
        push    ax
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [B_AE2D]
        else
        mov     al, byte ptr [B_AE93_V112]
        endif
        cbw
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_EF72:far_ef727
        else
        callf   0e35ch:far_ef727
        endif
        add     sp, 6
        mov     ax, 0ffffh
        push    ax
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [TBL_AE2E]
        else
        mov     al, byte ptr [TBL_AE94_V112]
        endif
        cbw
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_EF72:far_ef727
        else
        callf   0e35ch:far_ef727
        endif
        add     sp, 6
br_dfcad:
        if      FW_VERSION >= 212
        mov     al, byte ptr [bp - 2]
        cbw
        push    ax
        mov     ax, 1
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_F022:far_f0225
        add     sp, 6
        endif
        jmp     br_dfe77
br_dfcc6:
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr [bx + 8]
        mov     byte ptr [bp - 3], al
        cmp     byte ptr [bp - 1], 0
        jz      br_dfcf1
        cbw
        push    ax
        mov     ax, 0ffffh
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [bx + TBL_AE2E]
        else
        mov     al, byte ptr [bx +TBL_AE94_V112]
        endif
        cbw
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_EF72:far_ef727
        else
        callf   0e35ch:far_ef727
        endif
        add     sp, 6
        jmp     br_dfd33
br_dfcf1:
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        mov     ax, 0ffffh
        push    ax
        mov     al, byte ptr [TBL_AE2C]
        cbw
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_EF72:far_ef727
        else
        callf   0e35ch:far_ef727
        endif
        add     sp, 6
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        mov     ax, 0ffffh
        push    ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [B_AE2D]
        else
        mov     al, byte ptr [B_AE93_V112]
        endif
        cbw
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_EF72:far_ef727
        else
        callf   0e35ch:far_ef727
        endif
        add     sp, 6
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        mov     ax, 0ffffh
        push    ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [TBL_AE2E]
        else
        mov     al, byte ptr [TBL_AE94_V112]
        endif
        cbw
        push    ax
        if      FW_VERSION >= 212
        callf   SEG_EF72:far_ef727
        else
        callf   0e35ch:far_ef727
        endif
        add     sp, 6
br_dfd33:
        if      FW_VERSION >= 212
        mov     al, byte ptr [bp - 3]
        cbw
        push    ax
        mov     ax, 2
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_F022:far_f0225
        add     sp, 6
        endif
        jmp     br_dfe77
br_dfd4c:
        mov     bx, word ptr [bp + 6]
        mov     al, byte ptr [bx + 8]
        mov     byte ptr [bp - 4], al
        cmp     byte ptr [bp - 1], 0
        jz      br_dfd73
        cbw
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [bx + TBL_AE2E]
        else
        mov     al, byte ptr [bx +TBL_AE94_V112]
        endif
        cbw
        push    ax
        callf   SEG_DFBE:far_dfe95
        add     sp, 4
        jmp     br_dfda9
br_dfd73:
        mov     al, byte ptr [bp - 4]
        cbw
        push    ax
        mov     al, byte ptr [TBL_AE2C]
        cbw
        push    ax
        callf   SEG_DFBE:far_dfe95
        add     sp, 4
        mov     al, byte ptr [bp - 4]
        cbw
        push    ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [B_AE2D]
        else
        mov     al, byte ptr [B_AE93_V112]
        endif
        cbw
        push    ax
        callf   SEG_DFBE:far_dfe95
        add     sp, 4
        mov     al, byte ptr [bp - 4]
        cbw
        push    ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [TBL_AE2E]
        else
        mov     al, byte ptr [TBL_AE94_V112]
        endif
        cbw
        push    ax
        callf   SEG_DFBE:far_dfe95
        add     sp, 4
br_dfda9:
        if      FW_VERSION >= 212
        mov     al, byte ptr [bp - 4]
        cbw
        push    ax
        mov     ax, 3
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_F022:far_f0225
        add     sp, 6
        endif
        jmp     near br_dfe77
br_dfdc2:
        mov     bx, word ptr [bp + 6]
        push    word ptr [bx + 8]
        if      FW_VERSION >= 212
        callf   SEG_DA91:far_da912
        add     sp, 2
        add     ax, 0e000h
        else
        callf   0de85h:far_da912
        add     sp, 2
        add     ax, 0e96ah
        endif
        mov     cx, 14h
        cwd
        idiv    cx
        mov     word ptr [bp - 6], ax
        if      FW_VERSION >= 212
        cmp     word ptr [bp - 6], 0ff88h
        jge     br_dfde7
        mov     word ptr [bp - 6], 0ff88h
br_dfde7:
        cmp     word ptr [bp - 6], 3ch
        jle     br_dfdf2
        mov     word ptr [bp - 6], 3ch
br_dfdf2:
        else
        cmp     word ptr [bp - 6], 0
        jge     br_dfde7
        mov     word ptr [bp - 6], 0
br_dfde7:
        cmp     word ptr [bp - 6], 0b4h
        jle     br_dfdf2
        mov     word ptr [bp - 6], 0b4h
br_dfdf2:
        mov     bx, word ptr [bp - 6]
        shl     bx, 1
        mov     ax, word ptr [bx +TBL_3B38_V112]
        mov     word ptr [bp - 8], ax
        endif
        cmp     byte ptr [bp - 1], 0
        jz      br_dfe11
        if      FW_VERSION >= 212
        push    word ptr [bp - 6]
        else
        push    ax
        endif
        mov     al, byte ptr [bp - 1]
        cbw
        mov     bx, ax
        if      FW_VERSION >= 212
        mov     al, byte ptr [bx + TBL_AE2E]
        else
        mov     al, byte ptr [bx +TBL_AE94_V112]
        endif
        cbw
        push    ax
        callf   SEG_DFBE:far_dfec3
        add     sp, 4
        jmp     br_dfe41
br_dfe11:
        if      FW_VERSION >= 212
        push    word ptr [bp - 6]
        else
        push    word ptr [bp - 8]
        endif
        mov     al, byte ptr [TBL_AE2C]
        cbw
        push    ax
        callf   SEG_DFBE:far_dfec3
        add     sp, 4
        if      FW_VERSION >= 212
        push    word ptr [bp - 6]
        mov     al, byte ptr [B_AE2D]
        else
        push    word ptr [bp - 8]
        mov     al, byte ptr [B_AE93_V112]
        endif
        cbw
        push    ax
        callf   SEG_DFBE:far_dfec3
        add     sp, 4
        if      FW_VERSION >= 212
        push    word ptr [bp - 6]
        mov     al, byte ptr [TBL_AE2E]
        else
        push    word ptr [bp - 8]
        mov     al, byte ptr [TBL_AE94_V112]
        endif
        cbw
        push    ax
        callf   SEG_DFBE:far_dfec3
        add     sp, 4
br_dfe41:
        if      FW_VERSION >= 212
        push    word ptr [bp - 6]
        mov     ax, 4
        push    ax
        mov     al, byte ptr [bp - 1]
        cbw
        push    ax
        callf   SEG_F022:far_f0225
        add     sp, 6
        endif
        jmp     br_dfe77
br_dfe57:
        cmp     ax, 1
        jnz     br_dfe5f
        jmp     br_dfc3d
br_dfe5f:
        cmp     ax, 2
        jnz     br_dfe67
        jmp     br_dfcc6
br_dfe67:
        cmp     ax, 3
        jnz     br_dfe6f
        jmp     br_dfd4c
br_dfe6f:
        cmp     ax, 4
        jnz     br_dfe77
        jmp     near br_dfdc2
br_dfe77:
        jmp     br_dfe91
br_dfe79:
        cmp     ax, 90h
        jnz     br_dfe81
        jmp     br_dfbf6
br_dfe81:
        cmp     ax, 0b0h
        jnz     br_dfe89
        jmp     br_dfc04
br_dfe89:
        cmp     ax, 0f0h
        jnz     br_dfe91
        jmp     br_dfc12
br_dfe91:
        if      FW_VERSION >= 212
        mov     sp, bp
        pop     bp
        retf
        else
        jmp     L_d5f9a
        endif
far_dfe95:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 212
        cmp     word ptr [bp + 6], W_0022
        else
        cmp     word ptr [bp + 6], 22h
        endif
        jbe     br_dfea2
br_dfe9e:
        mov     sp, bp
        pop     bp
        retf
br_dfea2:
        mov     al, byte ptr [bp + 8]
        cbw
        shl     ax, 1
        push    ax
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        pop     ax
        mov     byte ptr [bx + TBL_A68F], al
        jmp     br_dfe9e
far_dfec3:
        push    bp
        mov     bp, sp
        if      FW_VERSION >= 212
        cmp     word ptr [bp + 6], W_0022
        else
        cmp     word ptr [bp + 6], 22h
        endif
        jbe     br_dfed0
br_dfecc:
        mov     sp, bp
        pop     bp
        retf
br_dfed0:
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        mov     ax, word ptr [bp + 8]
        endm
        if      FW_VERSION < 212
        RUN_FAR_DFBE6
        mov     word ptr [bx +TBL_A6E6_V112], ax
        push    word ptr [bp + 6]
        callf   0e36ch:L_e36c4
        add     sp, 2
        jmp     br_dfecc
L_d622a:

        push    bp
        mov     bp, sp
        add     sp, 0fffeh
        mov     word ptr [bp - 2], 0
        jmp     L_d6248
L_d6237:
        mov     bx, word ptr [bp - 2]
        shl     bx, 1
        mov     ax, word ptr [bx +TBL_3B38_V112]
        cmp     ax, word ptr [bp + 6]
        jge     L_d624f
        inc     word ptr [bp - 2]
L_d6248:
        cmp     word ptr [bp - 2], 0b4h
        jc      L_d6237
L_d624f:
        mov     ax, word ptr [bp - 2]
        mov     dx, ax
        shl     ax, 1
        shl     ax, 1
        add     ax, dx
        shl     ax, 1
        shl     ax, 1
        add     ax, 16a0h
        mov     sp, bp
        pop     bp
        retf
        phase   5
        endif

RUN_FAR_DFEEC macro   {GLOBALSYMBOLS}
far_dfeec:
        push    bp
        mov     bp, sp
        add     sp, 0fffeh
        if      FW_VERSION >= 212
        cmp     word ptr [bp + 6], W_0022
        else
        cmp     word ptr [bp + 6], 22h
        endif
        jnc     br_dff16
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        cmp     byte ptr [bx + TBL_A656], 0
        jz      br_dff16
        xor     ax, ax
        jmp     br_dff19
br_dff16:
        mov     ax, 1
br_dff19:
        mov     word ptr [bp - 2], ax
        cmp     word ptr [bp - 2], 0
        jz      br_dff33
        if      FW_VERSION >= 212
        mov     ax, STR_UNUSED_3
        else
        mov     ax, 3ca2h
        endif
        push    ax
        push    word ptr [bp + 8]
        if      FW_VERSION >= 212
        callf   SEG_F263:far_f263a
        else
        callf   0e96ch:far_f263a
        endif
        add     sp, 4
        jmp     br_dff57
br_dff33:
        mov     ax, 11h
        push    ax
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        if      FW_VERSION >= 212
        add     ax, TBL_A656
        else
        add     ax, 0a6bch
        endif
        push    ax
        push    word ptr [bp + 8]
        callf   SEG_F265:far_f2657
        add     sp, 6
br_dff57:
        mov     ax, word ptr [bp - 2]
        mov     sp, bp
        pop     bp
        retf
        endm
        if      FW_VERSION < 212
        RUN_FAR_DFEEC
        phase   7
far_dff5e:
        push    bp
        mov     bp, sp
        cmp     word ptr [bp + 6], 22h
        jc      L_d62e6
        xor     ax, ax
L_d62e2:
        mov     sp, bp
        pop     bp
        retf
L_d62e6:
        callf   0e3b7h:far_ef944
        push    word ptr [bp + 0ah]
        push    word ptr [bp + 8]
        RUN_AFTER_BR_C7CE4_2
        push    word ptr [bx +TBL_A6D8_V112]
        push    word ptr [bx +TBL_A6D6_V112]
        callf   0e3afh:far_ef8c5
        add     sp, 8
        callf   SEG_E016:far_e016f
        mov     ax, word ptr [bp + 0ah]
        sub     dx, dx
        push    dx
        endif

RUN_AFTER_L_D62E6 macro   {GLOBALSYMBOLS}
        push    ax
        mov     ax, word ptr [bp + 6]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        endm
        if      FW_VERSION < 212
        RUN_AFTER_L_D62E6
        pop     ax
        pop     dx
        add     word ptr [bx +TBL_A6D6_V112], ax
        adc     word ptr [bx +TBL_A6D8_V112], dx
        jmp     L_d62e2
        phase   0fh
L_d633f:
        push    bp
        mov     bp, sp
        add     sp, 0fffeh
        push    word ptr [bp + 8]
        callf   SEG_DF8B:far_df8b4
        add     sp, 2
        xor     cx, cx
        cmp     ax, cx
        jl      L_d635d
        mov     ax, 0ffffh
br_dffcc:
        mov     sp, bp
        pop     bp
        retf
L_d635d:
        cmp     word ptr [bp + 6], 22h
        jnc     br_e0076
        RUN_AFTER_BR_C7CE4_4
        endif

RUN_LOOP_E000F macro   {GLOBALSYMBOLS}
        mov     bx, ax
        cmp     byte ptr [bx + TBL_A656], 0
        jz      br_e0076
        mov     ax, word ptr [bp + 6]
        mov     word ptr [bp - 2], ax
loop_e000f:
        mov     ax, 10h
        push    ax
        push    word ptr [bp + 8]
        mov     ax, word ptr [bp - 2]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        if      FW_VERSION >= 212
        add     ax, TBL_A656
        else
        add     ax, 0a6bch
        endif
        push    ax
        callf   SEG_F265:far_f2657
        add     sp, 6
        mov     ax, 1
        push    ax
        push    word ptr [bp - 2]
        if      FW_VERSION >= 212
        callf   SEG_D485:far_d49f3
        else
        callf   0dc48h:far_d49f3
        endif
        add     sp, 4
        mov     ax, word ptr [bp - 2]
        mov     dx, ax
        mov     cl, 4
        shl     ax, cl
        sub     ax, dx
        shl     ax, 1
        shl     ax, 1
        sub     ax, dx
        mov     bx, ax
        mov     al, byte ptr [bx + TBL_A667]
        cbw
        mov     word ptr [bp - 2], ax
        cmp     ax, word ptr [bp + 6]
        jnz     loop_e000f
        if      FW_VERSION >= 212
        mov     ax, 1
        push    ax
        push    word ptr [bp + 6]
        callf   SEG_D485:far_d49f3
        add     sp, 4
        endif
        xor     ax, ax
        jmp     near br_dffcc
br_e0076:
        mov     ax, 0fffbh
        jmp     near br_dffcc
        if      FW_VERSION >= 212
        phase   0ch
far_e007c:

        push    bp
        mov     bp, sp
        push    di
        push    si
        mov     dx, 0ff28h
        in      ax, dx
        push    ax
        mov     ax, 0f1h
        out     dx, ax
        callf   SEG_EF94:far_ef944
        mov     dx, word ptr [bp + 8]
        mov     bx, word ptr [bp + 6]
        mov     cx, 0ch
loop_e0098:
        shl     bx, 1
        rcl     dx, 1
        loop    loop_e0098
        mov     di, word ptr [bp + 0ch]
        mov     si, word ptr [bp + 0ah]
        mov     cx, 0ch
loop_e00a7:
        shl     si, 1
        rcl     di, 1
        loop    loop_e00a7
br_e00ad:
        mov     ax, dx
        out     0, ax
        mov     ax, 11h
        pushf
        cli
        out     2, ax
        out     2, ax
        popf
        mov     ax, bx
        out     0, ax
        mov     ax, 1
        out     2, ax
        mov     ax, 300h
        out     2, ax
        in      ax, 0
        in      ax, 2
        push    ax
        mov     ax, di
        out     0, ax
        mov     ax, 11h
        pushf
        cli
        out     2, ax
        out     2, ax
        popf
        mov     ax, si
        out     0, ax
        mov     ax, 1
        out     2, ax
        mov     ax, 300h
        out     2, ax
        in      ax, 0
        in      ax, 2
        push    ax
        mov     ax, dx
        out     0, ax
        mov     ax, 11h
        pushf
        cli
        out     2, ax
        out     2, ax
        popf
        mov     ax, bx
        out     0, ax
        mov     ax, 1
        out     2, ax
        pop     ax
        out     0, ax
        mov     ax, 200h
        out     2, ax
        mov     ax, di
        out     0, ax
        mov     ax, 11h
        pushf
        cli
        out     2, ax
        out     2, ax
        popf
        mov     ax, si
        out     0, ax
        mov     ax, 1
        out     2, ax
        pop     ax
        out     0, ax
        mov     ax, 200h
        out     2, ax
        add     bx, 1000h
        adc     dx, 0
        sub     si, 1000h
        sbb     di, 0
        sub     word ptr [bp + 0eh], 2
        sbb     word ptr [bp + 10h], 0
        mov     ax, word ptr [bp + 0eh]
        or      ax, word ptr [bp + 10h]
        jz      br_e0161
        mov     ax, word ptr [bp + 10h]
        cmp     ax, 0
        jz      br_e0156
        jmp     near br_e00ad
br_e0156:
        mov     ax, word ptr [bp + 0eh]
        cmp     ax, 1
        jz      br_e0161
        jmp     near br_e00ad
br_e0161:
        callf   SEG_E016:far_e016f
        pop     ax
        mov     dx, 0ff28h
        out     dx, ax
        pop     si
        pop     di
        pop     bp
        retf
        phase   0fh
        else
        phase   1
        endif
far_e016f:
        pushf
        cli
        mov     cx, 10h
        mov     ax, 0ffffh
        out     0, ax
        mov     ax, 50h
loop_e017c:
        out     2, ax
        inc     ax
        loop    loop_e017c
        mov     ax, 0
        out     0, ax
        mov     cx, 10h
        mov     ax, 40h
loop_e018c:
        out     2, ax
        inc     ax
        loop    loop_e018c
        mov     ax, 1000h
        out     0, ax
        mov     cx, 10h
        mov     ax, 20h
loop_e019c:
        out     2, ax
        inc     ax
        loop    loop_e019c
        popf
        retf
        endm
