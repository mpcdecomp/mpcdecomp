; The disk's three data files, blocks 4-8: a program, the overall
; settings, a sample.  Raw bytes.

tone_prgrm:
        db      "TONE PRGRM      "
        db      00h, 00h, 0f8h, 0aah, 00h, 00h, 0ffh, 01h
        db      14 dup (0)
        db      7fh, 18h, 80h, 00h, 50h, 63h, 1eh, 0ah, 32h, 00h, 00h, 1eh, 00h, 00h, 63h, 40h
        db      2ah, 00h, 04h, 0ffh, 00h, 00h, 32h, 00h
        db      "TONE      "
        db      14h, 14h, 14h, 14h, 40h, 00h, 3eh, 0abh, 00h, 00h, 63h, 00h
        db      "2 SAMPLE  "
        db      10 dup (0)
        db      63h, 00h, 00h, 00h
tone_prgrm_end:
        TOBLOCK 5
overall_se:
        db      "TONE PRGRM      "
        db      00h, 00h, 00h, 00h, 01h, 00h, 3ch, 00h, 40h, 00h, 00h, 80h, 00h, 01h, 3ch, 0f7h
        db      50h, 46h, 1ch, 07h, 0c0h, 03h, 00h, 00h
overall_se_end:
        TOBLOCK 6
tone_sample:
        db      "TONE            "
        db      08h, 07h, 00h, 00h, 0fdh, 2dh, 0c0h, 03h, 00h, 00h, 4ch, 00h, 08h, 07h, 00h, 00h
        db      00h, 00h, 00h, 00h, 2dh, 00h, 00h, 00h, 62h, 0a0h, 00h, 4eh
        db      11 dup (0)
        db      0c0h, 00h, 00h, 00h, 00h, 0c8h, 11h, 4fh, 23h, 0ch, 34h, 0c8h, 43h, 30h, 52h, 1eh
        db      5fh, 1eh, 6ah, 0dh, 73h, 0b9h, 79h, 0fh, 7eh, 0edh, 7fh, 44h, 7fh, 23h, 7ch, 0ach
        db      76h, 0dfh, 6eh, 0d0h, 64h, 0e1h, 58h, 37h, 4bh, 15h, 3ch, 0c1h, 2bh, 0aeh, 1ah, 0f4h
        db      08h, 16h, 0f7h, 6bh, 0e5h, 49h, 0d4h, 0f3h, 0c3h, 0d1h, 0b4h, 26h, 0a7h, 36h, 9bh, 36h
        db      91h, 68h, 89h, 0efh, 83h, 0cch, 80h, 22h, 80h, 0fh, 82h, 53h, 86h, 0eh, 8dh, 0ech
        db      95h, 0ebh, 0a0h, 0c8h, 0adh, 3fh, 0bch, 0fah, 0cbh, 0b7h, 0dch, 2eh, 0eeh, 0fbh, 0ffh, 0c7h
        db      11h, 4fh, 23h, 0ch, 34h, 0c8h, 43h, 30h, 52h, 1dh, 5fh, 1eh, 6ah, 0fdh, 72h, 0a9h
        db      79h, 0fh, 7eh, 0ddh, 7fh, 44h, 7fh, 23h, 7ch, 0ach, 76h, 0dfh, 6eh, 0d0h, 64h, 0e1h
        db      58h, 37h, 4bh, 15h, 3ch, 0c1h, 2bh, 0aeh, 1ah, 0f4h, 08h, 16h, 0f7h, 7bh, 0e5h, 49h
        db      0d4h, 0f3h, 0c3h, 0d1h, 0b4h, 26h, 0a7h, 36h, 9bh, 36h, 91h, 68h, 89h, 0efh, 83h, 0cdh
        db      80h, 22h, 80h, 0fh, 82h, 53h, 86h, 0eh, 8dh, 0ech, 95h, 0ebh, 0a0h, 0b8h, 0adh, 2fh
        db      0bch, 0fbh, 0cbh, 0b7h, 0dch, 2eh, 0eeh, 0fbh, 0ffh, 0c8h, 11h, 4fh, 23h, 0ch, 34h, 0c8h
        db      43h, 3fh, 52h, 1dh, 5fh, 1eh, 6ah, 0fdh, 72h, 0b9h, 79h, 0fh, 7eh, 0edh, 7fh, 44h
        db      7fh, 23h, 7ch, 0abh, 76h, 0dfh, 6eh, 0d0h, 64h, 0e1h, 58h, 47h, 4bh, 15h, 3ch, 0c1h
        db      2bh, 0aeh, 1ah, 0f4h, 08h, 26h, 0f7h, 7bh, 0e5h, 49h, 0d4h, 0f3h, 0c3h, 0d1h, 0b4h, 26h
        db      0a7h, 36h, 9bh, 36h, 91h, 68h, 89h, 0efh, 83h, 0cdh, 80h, 22h, 80h, 0fh, 82h, 54h
        db      86h, 0feh, 8ch, 0ech, 95h, 0ebh, 0a0h, 0b8h, 0adh, 2fh, 0bch, 0eah, 0cbh, 0b6h, 0dch, 2eh
        db      0eeh, 0fah, 0ffh, 0c7h, 11h, 3fh, 23h, 0bh, 34h, 0c8h, 43h, 3fh, 52h, 0dh, 5fh, 0dh
        db      6ah, 0fdh, 72h, 0a9h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 23h, 7ch, 0ach, 76h, 0dfh
        db      6eh, 0d0h, 64h, 0e1h
        db      "XGK%<"
        db      0d1h, 2bh, 0afh, 1ah, 04h, 09h, 26h, 0f7h, 7ch, 0e5h, 59h, 0d4h, 04h, 0c4h, 0d1h, 0b4h
        db      36h, 0a7h, 36h, 9bh, 46h, 91h, 68h, 89h, 0efh, 83h, 0cdh, 80h, 22h, 80h, 0fh, 82h
        db      53h, 86h, 0feh, 8ch, 0ech, 95h, 0ebh, 0a0h, 0b8h, 0adh, 2eh, 0bch, 0eah, 0cbh, 0a6h, 0dch
        db      2dh, 0eeh, 0fah, 0ffh, 0b7h, 11h, 3fh, 23h, 0fbh, 33h, 0b8h, 43h, 3fh, 52h, 0dh, 5fh
        db      0eh, 6ah, 0fdh, 72h, 0a9h, 79h, 0ffh, 7dh, 0ddh, 7fh, 44h, 7fh, 23h, 7ch, 0ach, 76h
        db      0dfh, 6eh, 0d0h, 64h, 0f2h
        db      "XGK&<"
        db      0d1h, 2bh, 0bfh, 1ah, 04h, 09h, 27h, 0f7h, 7ch, 0e5h, 59h, 0d4h, 04h, 0c4h, 0e1h, 0b4h
        db      36h, 0a7h, 46h, 9bh, 46h, 91h, 68h, 89h, 0efh, 83h, 0cdh, 80h, 22h, 80h, 0fh, 82h
        db      53h, 86h, 0feh, 8ch, 0ech, 95h, 0ebh, 0a0h, 0b8h, 0adh, 2eh, 0bch, 0eah, 0cbh, 0a6h, 0dch
        db      2dh, 0eeh, 0eah, 0ffh, 0b7h, 11h, 3eh, 23h, 0fbh, 33h, 0b8h, 43h, 3fh, 52h, 0dh, 5fh
        db      0dh, 6ah, 0fdh, 72h, 0a9h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 23h, 7ch, 0ach, 76h
        db      0dfh, 6eh, 0e0h, 64h, 0f2h
        db      "XGK&<"
        db      0d1h, 2bh, 0bfh, 1ah, 04h, 09h, 27h, 0f7h, 8ch, 0e5h, 59h, 0d4h, 04h, 0c4h, 0e1h, 0b4h
        db      36h, 0a7h, 46h, 9bh, 46h, 91h, 68h, 89h, 0efh, 83h, 0cdh, 80h, 22h, 80h, 0fh, 82h
        db      44h, 86h, 0feh, 8ch, 0ech, 95h, 0ebh, 0a0h, 0b8h, 0adh, 2eh, 0bch, 0eah, 0cbh, 0a6h, 0dch
        db      1dh, 0eeh, 0eah, 0ffh, 0b7h, 11h, 3eh, 23h, 0fbh, 33h, 0b8h, 43h, 2fh, 52h, 0dh, 5fh
        db      0dh, 6ah, 0fdh, 72h, 0a9h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 23h, 7ch, 0ach, 76h
        db      0dfh, 6eh, 0e0h, 64h, 0f2h
        db      "XGK&<"
        db      0d1h, 2bh, 0bfh, 1ah, 04h, 09h, 37h, 0f7h, 8ch, 0e5h, 59h, 0d4h, 04h, 0c4h, 0e1h, 0b4h
        db      36h, 0a7h, 46h, 9bh, 46h, 91h, 68h, 89h, 0efh, 83h, 0cdh, 80h, 22h, 80h, 0fh, 82h
        db      43h, 86h, 0feh, 8ch, 0ech, 95h, 0dbh, 0a0h, 0b8h, 0adh, 1eh, 0bch, 0eah, 0cbh, 0a6h, 0dch
        db      1dh, 0eeh, 0eah, 0ffh, 0b7h, 11h, 2eh, 23h, 0fbh, 33h, 0b8h, 43h, 2fh, 52h, 0dh, 5fh
        db      0dh, 6ah, 0fdh, 72h, 0a9h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 23h, 7ch, 0abh, 76h
        db      0dfh, 6eh, 0e0h, 64h, 0f2h
        db      "XWK6<"
        db      0e1h, 2bh, 0bfh, 1ah, 14h, 09h, 37h, 0f7h, 8ch, 0e5h, 69h, 0d4h, 14h, 0c4h, 0e1h, 0b4h
        db      36h, 0a7h, 46h, 9bh, 46h, 91h, 78h, 89h, 0efh, 83h, 0cdh, 80h, 22h, 80h, 0fh, 82h
        db      44h, 86h, 0feh, 8ch, 0ech, 95h, 0dbh, 0a0h, 0a8h, 0adh, 1eh, 0bch, 0dah, 0cbh, 96h, 0dch
        db      1dh, 0eeh, 0eah, 0ffh, 0a7h, 11h, 2eh, 23h, 0ebh, 33h, 0a7h, 43h, 2fh, 52h, 0fdh, 5eh
        db      0fdh, 69h, 0edh, 72h, 0a8h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 23h, 7ch, 0ach, 76h
        db      0efh, 6eh, 0e0h, 64h, 0f2h
        db      "XWK6<"
        db      0e1h, 2bh, 0cfh, 1ah, 14h, 09h, 37h, 0f7h, 8ch, 0e5h, 69h, 0d4h, 14h, 0c4h, 0f2h, 0b4h
        db      46h, 0a7h, 47h, 9bh, 46h, 91h, 78h, 89h, 0efh, 83h, 0cdh, 80h, 22h, 80h, 0fh, 82h
        db      43h, 86h, 0feh, 8ch, 0dch, 95h, 0dbh, 0a0h, 0a8h, 0adh, 1eh, 0bch, 0dah, 0cbh, 96h, 0dch
        db      0dh, 0eeh, 0dah, 0ffh, 0a7h, 11h, 1eh, 23h, 0ebh, 33h, 0a7h, 43h, 1fh, 52h, 0fdh, 5eh
        db      0fdh, 69h, 0edh, 72h, 0a8h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 23h, 7ch, 0bch, 76h
        db      0efh, 6eh, 0e0h, 64h, 02h
        db      "YXK6<"
        db      0e2h, 2bh, 0cfh, 1ah, 15h, 09h, 47h, 0f7h, 9ch, 0e5h, 6ah, 0d4h, 14h, 0c4h, 0f2h, 0b4h
        db      46h, 0a7h, 57h, 9bh, 56h, 91h, 78h, 89h, 0efh, 83h, 0cdh, 80h, 22h, 80h, 0ffh, 81h
        db      43h, 86h, 0fdh, 8ch, 0dbh, 95h, 0dbh, 0a0h, 0a7h, 0adh, 1eh, 0bch, 0dah, 0cbh, 96h, 0dch
        db      0dh, 0eeh, 0d9h, 0ffh, 0a6h, 11h, 1eh, 23h, 0ebh, 33h, 0a7h, 43h, 1fh, 52h, 0fdh, 5eh
        db      0fdh, 69h, 0edh, 72h, 98h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 23h, 7ch, 0bch, 76h
        db      0efh, 6eh, 0f0h, 64h, 02h
        db      "YXK6<"
        db      0f2h, 2bh, 0cfh, 1ah, 25h, 09h, 47h, 0f7h, 9ch, 0e5h, 7ah, 0d4h, 24h, 0c4h, 0f2h, 0b4h
        db      46h, 0a7h, 57h, 9bh, 56h, 91h, 78h, 89h, 0ffh, 83h, 0ddh, 80h, 22h, 80h, 0fh, 82h
        db      43h, 86h, 0feh, 8ch, 0dch, 95h, 0dbh, 0a0h, 0a7h, 0adh, 0eh, 0bch, 0c9h, 0cbh, 95h, 0dch
        db      0dh, 0eeh, 0d9h, 0ffh, 96h, 11h, 1eh, 23h, 0dah, 33h, 0a7h, 43h, 1eh, 52h, 0fch, 5eh
        db      0fdh, 69h, 0ech, 72h, 98h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 33h, 7ch, 0bch, 76h
        db      0efh, 6eh, 0f0h, 64h, 02h
        db      "YXKF<"
        db      0f2h, 2bh, 0c0h, 1ah, 25h, 09h, 48h, 0f7h, 9dh, 0e5h, 7ah, 0d4h, 25h, 0c4h, 0f2h, 0b4h
        db      47h, 0a7h, 57h, 9bh, 57h, 91h, 79h, 89h, 0f0h, 83h, 0ddh, 80h, 22h, 80h, 0fh, 82h
        db      43h, 86h, 0fdh, 8ch, 0dbh, 95h, 0dah, 0a0h, 0a7h, 0adh, 0eh, 0bch, 0c9h, 0cbh, 85h, 0dch
        db      0ch, 0eeh, 0c9h, 0ffh, 96h, 11h, 1dh, 23h, 0dah, 33h, 97h, 43h, 1eh, 52h, 0ech, 5eh
        db      0fdh, 69h, 0ech, 72h, 98h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 33h, 7ch, 0bch, 76h
        db      0efh, 6eh, 0f1h, 64h, 02h
        db      "YhKF<"
        db      0f2h, 2bh, 0d0h, 1ah, 25h, 09h, 48h, 0f7h, 0adh, 0e5h, 7ah, 0d4h, 25h, 0c4h, 0f2h, 0b4h
        db      47h, 0a7h, 57h, 9bh, 57h, 91h, 79h, 89h, 0f0h, 83h, 0ddh, 80h, 22h, 80h, 0ffh, 81h
        db      43h, 86h, 0fdh, 8ch, 0dbh, 95h, 0cah, 0a0h, 97h, 0adh, 0dh, 0bch, 0c9h, 0cbh, 85h, 0dch
        db      0fch, 0edh, 0c9h, 0ffh, 96h, 11h, 1dh, 23h, 0dah, 33h, 96h, 43h, 1eh, 52h, 0fch, 5eh
        db      0fdh, 69h, 0ech, 72h, 98h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 33h, 7ch, 0bch, 76h
        db      0e0h, 6eh, 0f1h, 64h, 02h
        db      "YhKG<"
        db      0f2h, 2bh, 0d0h, 1ah, 26h, 09h, 48h, 0f7h, 0adh, 0e5h, 7ah, 0d4h, 25h, 0c4h, 0f3h, 0b4h
        db      47h, 0a7h, 57h, 9bh, 57h, 91h, 79h, 89h, 0e0h, 83h, 0cdh, 80h, 22h, 80h, 0ffh, 81h
        db      43h, 86h, 0edh, 8ch, 0dbh, 95h, 0cah, 0a0h, 97h, 0adh, 0dh, 0bch, 0c9h, 0cbh, 85h, 0dch
        db      0fch, 0edh, 0c9h, 0ffh, 96h, 11h, 0dh, 23h, 0dah, 33h, 96h, 43h, 1eh, 52h, 0ech, 5eh
        db      0fch, 69h, 0ech, 72h, 98h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 33h, 7ch, 0bch, 76h
        db      0e0h, 6eh, 0f1h, 64h, 02h
        db      "YhKG<"
        db      0f2h, 2bh, 0d0h, 1ah, 26h, 09h, 58h, 0f7h, 0adh, 0e5h, 7ah, 0d4h, 25h, 0c4h, 03h, 0b5h
        db      57h, 0a7h, 58h, 9bh, 57h, 91h, 79h, 89h, 0f0h, 83h, 0ddh, 80h, 23h, 80h, 0ffh, 81h
        db      44h, 86h, 0eeh, 8ch, 0dbh, 95h, 0cah, 0a0h, 97h, 0adh, 0dh, 0bch, 0c9h, 0cbh, 85h, 0dch
        db      0fch, 0edh, 0c9h, 0ffh, 95h, 11h, 0dh, 23h, 0d9h, 33h, 96h, 43h, 0dh, 52h, 0ebh, 5eh
        db      0ech, 69h, 0ech, 72h, 98h, 79h, 0feh, 7dh, 0dch, 7fh, 44h, 7fh, 33h, 7ch, 0bch, 76h
        db      0efh, 6eh, 0f1h, 64h, 02h
        db      "YhKG<"
        db      0f2h, 2bh, 0d0h, 1ah, 26h, 09h, 58h, 0f7h, 0adh, 0e5h, 7bh, 0d4h, 26h, 0c4h, 03h, 0b5h
        db      58h, 0a7h, 58h, 9bh, 57h, 91h, 79h, 89h, 0f0h, 83h, 0deh, 80h, 23h, 80h, 0ffh, 81h
        db      43h, 86h, 0edh, 8ch, 0dbh, 95h, 0cah, 0a0h, 97h, 0adh, 0dh, 0bch, 0c9h, 0cbh, 85h, 0dch
        db      0fch, 0edh, 0c8h, 0ffh, 95h, 11h, 0dh, 23h, 0d9h, 33h, 96h, 43h, 0dh, 52h, 0ech, 5eh
        db      0ech, 69h, 0ech, 72h, 98h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 33h, 7ch, 0bch, 76h
        db      0e0h, 6eh, 0f1h, 64h, 13h
        db      "YiKG<"
        db      03h, 2ch, 0d1h, 1ah, 36h, 09h, 58h, 0f7h, 0aeh, 0e5h, 8bh, 0d4h, 26h, 0c4h, 03h, 0b5h
        db      58h, 0a7h, 58h, 9bh, 57h, 91h, 79h, 89h, 0f0h, 83h, 0cdh, 80h, 22h, 80h, 0ffh, 81h
        db      43h, 86h, 0edh, 8ch, 0cbh, 95h, 0cah, 0a0h, 97h, 0adh, 0fdh, 0bbh, 0b9h, 0cbh, 74h, 0dch
        db      0fbh, 0edh, 0b8h, 0ffh, 85h, 11h, 0ch, 23h, 0c9h, 33h, 96h, 43h, 0dh, 52h, 0ebh, 5eh
        db      0ech, 69h, 0ech, 72h, 98h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 33h, 7ch, 0bch, 76h
        db      0f0h, 6eh, 01h, 65h, 13h
        db      "YyKW<"
        db      03h, 2ch, 0e1h, 1ah, 36h, 09h, 59h, 0f7h, 0beh, 0e5h, 8bh, 0d4h, 36h, 0c4h, 03h, 0b5h
        db      58h, 0a7h, 58h, 9bh, 57h, 91h, 79h, 89h, 0e0h, 83h, 0cdh, 80h, 22h, 80h, 0ffh, 81h
        db      33h, 86h, 0edh, 8ch, 0cbh, 95h, 0bah, 0a0h, 86h, 0adh, 0fdh, 0bbh, 0b8h, 0cbh, 74h, 0dch
        db      0ebh, 0edh, 0b8h, 0ffh, 85h, 11h, 0ch, 23h, 0c9h, 33h, 96h, 43h, 0dh, 52h, 0ebh, 5eh
        db      0ech, 69h, 0ech, 72h, 98h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 33h, 7ch, 0cch, 76h
        db      0f0h, 6eh, 01h, 65h, 13h
        db      "YyKW<"
        db      03h, 2ch, 0e1h, 1ah, 36h, 09h, 69h, 0f7h, 0beh, 0e5h, 8bh, 0d4h, 36h, 0c4h, 03h, 0b5h
        db      58h, 0a7h, 68h, 9bh, 57h, 91h, 89h, 89h, 0f0h, 83h, 0ddh, 80h, 22h, 80h, 0ffh, 81h
        db      43h, 86h, 0edh, 8ch, 0cbh, 95h, 0bah, 0a0h, 86h, 0adh, 0fdh, 0bbh, 0b8h, 0cbh, 74h, 0dch
        db      0ebh, 0edh, 0b8h, 0ffh, 85h, 11h, 0fch, 22h, 0c9h, 33h, 86h, 43h, 0dh, 52h, 0ebh, 5eh
        db      0ech, 69h, 0dch, 72h, 98h, 79h, 0feh, 7dh, 0ddh, 7fh, 44h, 7fh, 34h, 7ch, 0bch, 76h
        db      0f0h, 6eh, 01h, 65h, 13h
        db      "YyKX<"
        db      03h, 2ch, 0e1h, 1ah, 37h, 09h, 69h, 0f7h, 0beh, 0e5h, 8bh, 0d4h, 36h, 0c4h, 13h, 0b5h
        db      58h, 0a7h, 68h, 9bh, 67h, 91h, 89h, 89h, 0f0h, 83h, 0ddh, 80h, 22h, 80h, 0ffh, 81h
        db      33h, 86h, 0edh, 8ch, 0cah, 95h, 0b9h, 0a0h, 86h, 0adh, 0fch, 0bbh, 0b8h, 0cbh, 74h, 0dch
        db      0ebh, 0edh, 0b7h, 0ffh, 11h, 22h
        db      "3CR^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1ah, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 83h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CR^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1ah, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 83h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1ah, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 83h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1ah, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 83h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1ah, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 83h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1ah, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 83h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1ah, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 83h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1ah, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 83h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1ah, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 83h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1ah, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 83h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1ah, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 83h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1bh, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 84h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1bh, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 84h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|voeYK<,"
        db      1bh, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 84h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|voeYK<,"
        db      1bh, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 84h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|vneYK<,"
        db      1bh, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 84h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|voeYK<,"
        db      1bh, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 84h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|voeYK<,"
        db      1bh, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 84h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|voeYK<,"
        db      1bh, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 84h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh, 11h, 22h
        db      "3CQ^iry}"
        db      7fh, 7fh
        db      "|voeYK<,"
        db      1bh, 09h, 0f7h, 0e5h, 0d4h, 0c4h, 0b5h, 0a7h, 9bh, 91h, 89h, 84h, 80h, 80h, 81h, 86h
        db      8ch, 95h, 0a0h, 0adh, 0bbh, 0cbh, 0dch, 0edh, 0ffh
tone_sample_end:
