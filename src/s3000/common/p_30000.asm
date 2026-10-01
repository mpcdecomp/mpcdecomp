; from RAM 30000h in S3000XL v2.0

        mov     bx, 0
        if      (XL = 0) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        call    fn_315d1
        else
        call    fn_315d1+A_0B30
        endif
        mov     cx, 1ffdh
        mov     si, A_3310
        mov     dl, 19h
        push    cs
        if      (XL = 0) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        call    far_28a80
        call    fn_31623
        else
        call    far_28a80+A_0B30
        call    fn_31623+A_0B30
        endif
br_30015:
        if      (XL = 0) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        call    fn_2f3d4
        else
        call    fn_2f3d4+A_0B30
        endif
br_30018:
        ret
        if      ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 150))
        phase   A_B8E5
        elseif  (XL = 0) && (MODEL = 3200)
fn_33168:
        push    ax
        callf   0f7ch:far_10c40
        mov     ah, al
        callf   0f7ch:far_10c40
        pop     ax
        retf
fn_33177:
        pushf
        push    ax
        mov     al, byte ptr cs:[776eh]
        inc     byte ptr cs:[776eh]
        and     al, 0fh
        jnz     br_3318b
        callf   0f7ch:far_10c40
br_3318b:
        pop     ax
        popf
        ret
fn_3318e:
        add     byte ptr [6ea0h], ch
        ja      br_331c2
        inc     byte ptr [776eh]
        and     al, 0ffh
        jnz     br_331a4
        push    cs
        call    fn_2eb3c
        mov     ah, 42h
        int     5
br_331a4:
        ret
        endif
fn_30019:
        mov     al, byte ptr [A_8526]
fn_3001c:
        mov     bp, ds
        mov     bx, 6000h
        mov     ds, bx
        mov     bx, 6000h
        xlat
        mov     ah, 40h
        mul     ah
        mov     si, 2000h
        add     si, ax
        mov     bx, word ptr [si + 0ch]
        mov     al, byte ptr [si + 18h]
        if      (XL = 0) && (MODEL = 3200)
br_331c2:
        endif
        ret
fn_30037:
        call    fn_30019
        sub     ax, ax
        mov     byte ptr [si + 18h], al
        call    fn_30050
        mov     bx, word ptr [si + 0eh]
        call    fn_30050
        mov     ds, bp
        and     byte ptr [A_859C], 0f5h
        ret
fn_30050:
        mov     di, 0
        sub     ax, ax
br_30055:
        add     bx, bx
        mov     dx, word ptr [bx+di]
        mov     word ptr [bx+di], ax
        cmp     dx, 0ffffh
        jz      br_30064
        mov     bx, dx
        jmp     br_30055
br_30064:
        ret
far_30065:
        call    fn_30037
        jmp     far_2f694
fn_3006b:
        call    fn_3008b
        mov     al, 0
        jc      br_30074
        inc     al
br_30074:
        mov     byte ptr [A_859E], al
        retf
far_30078:
        call    fn_3007c
        retf
fn_3007c:
        call    fn_3008b
        jc      br_3008a
        mov     byte ptr [A_8526], dh
fn_30085:
        and     byte ptr [A_859C], 0f5h
br_3008a:
        ret
fn_3008b:
        mov     dl, byte ptr [A_8524]
        or      dl, dl
        jz      br_300bc
        push    es
        mov     ax, 6000h
        mov     es, ax
        mov     bx, 6000h
        sub     dh, dh
loop_3009e:
        mov     al, byte ptr es:[bx]
        mov     ah, 40h
        mul     ah
        mov     di, 2000h
        add     di, ax
        mov     si, A_84E0
        mov     cx, 0ch
        repe cmpsb
        jz      br_300be
        inc     bx
        inc     dh
        dec     dl
        jnz     loop_3009e
        pop     es
br_300bc:
        stc
        ret
br_300be:
        pop     es
        clc
        ret
fn_300c1:
        push    es
        mov     ax, 6000h
        mov     es, ax
        push    di
        mov     di, word ptr [di]
        mov     si, 0
        mov     bx, word ptr [A_854C]
        add     bx, bx
br_300d3:
        mov     ax, word ptr es:[bx+si]
        or      ax, ax
        jz      br_300df
        add     bx, 2
        jmp     br_300d3
br_300df:
        add     si, bx
        shr     bx, 1
        mov     word ptr [A_854C], bx
        mov     word ptr es:[di], bx
        pop     di
        mov     word ptr [di], si
        mov     word ptr es:[si], 0ffffh
        pop     es
        ret
far_300f4:
        call    fn_3007c
        jc      br_300fc
        call    fn_30037
br_300fc:
        call    fn_2f6f7
        cmp     byte ptr [A_8524], 0ffh
        jbe     br_30111
        mov     word ptr [A_7FA3], A_6126
        jmpf    SEG_MAIN:far_1c6d0
br_30111:
        mov     di, A_857D
        call    fn_2f84e
        cmp     ax, word ptr [A_8522]
        jbe     br_3014e
        mov     ax, word ptr [A_8522]
        mov     dl, ah
        sub     dh, dh
        inc     dx
        sub     ax, dx
        jz      br_30143
        jc      br_30143
        add     ax, ax
        mov     word ptr [A_852C], ax
        mov     word ptr [A_852A], 0
        cmp     byte ptr [A_8612], 0
        jz      br_3014e
        inc     byte ptr [A_8612]
        jmp     br_3014e
br_30143:
        mov     word ptr [A_7FA3], A_6147
        jmpf    SEG_MAIN:far_1c6d0
br_3014e:
        call    fn_301af
        mov     si, A_84E0
        mov     byte ptr [si + 18h], 1
        sub     ax, ax
        mov     word ptr [si + 10h], ax
        mov     word ptr [si + 12h], ax
        cmp     byte ptr [A_8612], 0
        jnz     br_3019e
        mov     word ptr [si + 22h], ax
        mov     word ptr [si + 1ch], ax
        mov     word ptr [si + 1eh], ax
        mov     al, byte ptr [A_7300]
        mov     byte ptr [si + 19h], al
        mov     ax, 0ac44h
        test    byte ptr [A_7377], 1
        jz      br_30183
        mov     ax, word ptr [A_79E2]
br_30183:
        mov     word ptr [si + 1ah], ax
        mov     word ptr [si + 20h], A_0800_3
        push    si
        mov     bx, A_85A1
        mov     si, A_8508
        mov     cx, A_0016_2
loop_30195:
        mov     al, byte ptr [bx]
        mov     byte ptr [si], al
        inc     bx
        inc     si
        loop    loop_30195
        pop     si
br_3019e:
        mov     cx, 40h
        rep movsb
        mov     ax, 0
        mov     es, ax
        or      byte ptr [A_7F9B], 8
        clc
        retf
fn_301af:
        mov     ax, 6000h
        mov     es, ax
        mov     di, 2000h
        sub     al, al
br_301b9:
        cmp     byte ptr es:[di + 18h], 0
        jz      br_301c7
        inc     al
        add     di, 40h
        jmp     br_301b9
br_301c7:
        mov     word ptr [A_8528], di
        mov     ax, di
        add     ax, 0ch
        mov     word ptr [A_8546], ax
        add     ax, 2
        mov     word ptr [A_8548], ax
        mov     word ptr [A_854C], 1
        ret
far_301e0:
        mov     cl, byte ptr [A_8612]
        mov     ax, word ptr [A_852E]
        mov     dx, word ptr [A_8530]
        mov     si, word ptr [A_8528]
        push    ds
        mov     bx, 6000h
        mov     ds, bx
        cmp     cl, 2
        jz      br_3021d
        mov     word ptr [si + 14h], ax
        mov     word ptr [si + 16h], dx
        sub     ax, 2
        sbb     dx, 0
        cmp     cl, 3
        jnz     br_30217
        mov     bp, ax
        mov     bx, dx
        sub     bp, word ptr [si + 24h]
        sbb     bx, word ptr [si + 26h]
        jnc     br_3021d
br_30217:
        mov     word ptr [si + 24h], ax
        mov     word ptr [si + 26h], dx
br_3021d:
        mov     di, A_84E0
        mov     cx, 40h
        rep movsb
        pop     ds
        mov     di, A_8587
        call    fn_2f9bd
        mov     al, 8
        not     al
        and     byte ptr [A_7F9B], al
        retf
fn_30235:
        push    cs
        call    far_30391
        mov     cx, ax
        sub     cx, word ptr [A_855C]
        jcxz    br_30286
        mov     bx, word ptr [A_860D]
        mov     dl, byte ptr [A_8611]
        mov     bp, word ptr [A_860F]
        mov     si, ax
        xchg    word ptr [A_855C], si
        push    ds
        mov     ax, 7000h
        add     si, si
        jnc     br_3025e
        add     ah, 10h
br_3025e:
        mov     ds, ax
loop_30260:
        mov     ax, word ptr [si]
        call    bx
        add     si, 2
        jnc     br_30277
        mov     ax, ds
        add     ah, 10h
        cmp     ah, 80h
        jz      br_30275
        mov     ah, 70h
br_30275:
        mov     ds, ax
br_30277:
        loop    loop_30260
        pop     ds
        mov     word ptr [A_860D], bx
        mov     byte ptr [A_8611], dl
        mov     word ptr [A_860F], bp
br_30286:
        retf
fn_30287:
        or      ax, ax
        jz      br_3029d
        cmp     ax, bp
        pushf
        mov     bp, ax
        dec     bp
        popf
        jnz     br_3029d
        dec     dl
        jnz     br_3029d
        mov     dl, 19h
        mov     bx, A_B58E
br_3029d:
        ret
fn_3029e:
        or      ax, ax
        jz      br_302b5
        cmp     ax, bp
        pushf
        mov     bp, ax
        dec     bp
        popf
        jz      br_302b4
        dec     dl
        jnz     br_302b4
loop_302af:
        mov     dl, 32h
        mov     bx, A_B577
br_302b4:
        ret
br_302b5:
        mov     dl, 0ah
        mov     bx, A_B5B1
        mov     byte ptr es:[A_B98C], 0
        ret
fn_302c1:
        cmp     ax, 200h
        jnz     br_302cb
        inc     byte ptr es:[A_B98C]
br_302cb:
        dec     dl
        jnz     br_302d9
        cmp     byte ptr es:[A_B98C], 6
        jc      loop_302af
        jmp     br_302da
br_302d9:
        ret
br_302da:
        pop     ax
        mov     ax, ds
        pop     ds
        sub     ax, 7000h
        add     si, 2
        jnc     br_302e9
        xor     ah, 10h
br_302e9:
        shl     ah, 4
        rcr     si, 1
        mov     word ptr [A_8550], si
        mov     word ptr [A_855C], si
        mov     byte ptr [A_8611], 0ffh
        retf
far_302fc:
        push    cs
        call    far_30391
        and     ax, 0ffe0h
        mov     cx, ax
        sub     cx, word ptr [A_855C]
        shr     cx, 5
        if      XL
        jcxz    br_30310
        jmp     br_30313
br_30310:
        jmp     near br_30390
br_30313:
        else
        jcxz    br_30390
        endif
        add     word ptr [A_855E], cx
        mov     si, ax
        xchg    word ptr [A_855C], si
        push    es
        mov     ax, 7000h
        add     si, si
        jnc     br_30328
        add     ah, 10h
br_30328:
        mov     es, ax
loop_3032a:
        mov     ax, word ptr es:[si]
        or      ax, ax
        jns     br_30333
        neg     ax
br_30333:
        cmp     ax, word ptr [A_8560]
        jbe     br_3033c
        mov     word ptr [A_8560], ax
br_3033c:
        mov     ax, word ptr es:[si + 2]
        or      ax, ax
        jns     br_30346
        neg     ax
br_30346:
        cmp     ax, word ptr [A_8560]
        jbe     br_3034f
        mov     word ptr [A_8560], ax
br_3034f:
        add     si, 40h
        jnc     br_30362
        mov     ax, es
        add     ah, 10h
        cmp     ah, 80h
        jz      br_30360
        mov     ah, 70h
br_30360:
        mov     es, ax
br_30362:
        loop    loop_3032a
        pop     es
        cmp     word ptr [A_855E], 3eh
        jc      br_30390
        mov     ax, word ptr [A_8560]
        or      ax, ax
        jns     br_30374
        dec     ax
br_30374:
        callf   SEG_INT_01:far_2710c
        sub     al, al
        sub     dh, dh
        shr     dl, 1
        inc     dl
        if      XL
        push    cs
        call    far_2ac66
        else
        callf   A_24D1_2:far_1fc17
        endif
far_30385:
        sub     ax, ax
        mov     word ptr [A_855E], ax
        mov     word ptr [A_8560], ax
        mov     word ptr [A_8562], ax
br_30390:
        retf
far_30391:
        mov     dx, 0c001h
        mov     al, 2
        out     dx, al
        mov     dx, 0c004h
        pushf
        cli
        in      ax, dx
        mov     cx, ax
        mov     dx, 0c006h
        in      al, dx
        popf
        and     al, 0fh
        cmp     al, byte ptr [A_860A]
        jz      br_303e6
        or      cx, cx
        js      br_303e6
        cmp     cx, 64h
        jc      br_303e6
        mov     ah, al
        xchg    byte ptr [A_860A], ah
        mov     dx, 0c001h
        mov     al, 6
        out     dx, al
        mov     dx, 0c006h
        mov     al, ah
        if      XL
        cmp     al, 8
        jc      br_303cc
        add     al, 10h
br_303cc:
        else
        add     al, byte ptr [A_87A1]
        endif
        out     dx, al
        mov     dx, 0c001h
        mov     al, 7
        out     dx, al
        mov     dx, 0c006h
        mov     al, ah
        if      XL
        cmp     al, 8
        jc      br_303de
        add     al, 10h
br_303de:
        else
        add     al, byte ptr [A_87A1]
        endif
        out     dx, al
        cmp     cx, 0fff0h
        jc      br_303e6
        sub     cx, cx
br_303e6:
        mov     ax, cx
        cmp     byte ptr [A_860A], 7
        clc
        jz      br_303f1
        stc
br_303f1:
        rcr     ax, 1
        retf
fn_303f4:
        mov     dx, 0c001h
        mov     al, 0
        out     dx, al
        mov     dx, 0c004h
        in      ax, dx
        mov     cx, ax
        mov     dx, 0c006h
        in      al, dx
        and     al, 0fh
        cmp     al, byte ptr [A_860B]
        jz      br_3042b
        mov     ah, al
        xchg    byte ptr [A_860B], ah
        mov     dx, 0c001h
        mov     al, 4
        out     dx, al
        mov     dx, 0c006h
        mov     al, ah
        if      XL
        cmp     al, 8
        jc      br_30423
        add     al, 10h
br_30423:
        else
        add     al, byte ptr [A_87A1]
        endif
        out     dx, al
        cmp     cx, 0fff0h
        jc      br_3042b
        sub     cx, cx
br_3042b:
        mov     ax, cx
        cmp     byte ptr [A_860B], 7
        clc
        jz      br_30436
        stc
br_30436:
        rcr     ax, 1
        retf
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      080h, 03eh, 012h, 086h, 000h, 074h, 00ah, 08bh, 02eh, 0f4h, 084h, 08bh, 01eh, 0f6h, 084h, 0ebh
        db      006h, 0bfh, 07dh, 085h, 0e8h, 0feh, 0f3h, 089h, 02eh, 02ah, 085h, 089h, 01eh, 02ch, 085h, 0b9h
        elseif  (XL) && (FW_VERSION = 150)
        db      080h, 03eh, 0f2h, 085h, 000h, 074h, 00ah, 08bh, 02eh, 0d4h, 084h, 08bh, 01eh, 0d6h, 084h, 0ebh
        db      006h, 0bfh, 05dh, 085h, 0e8h, 0feh, 0f3h, 089h, 02eh, 00ah, 085h, 089h, 01eh, 00ch, 085h, 0b9h
        elseif  (XL) && (MODEL = 3200)
        db      080h, 03eh, 0a2h, 086h, 000h, 074h, 00ah, 08bh, 02eh, 084h, 085h, 08bh, 01eh, 086h, 085h, 0ebh
        db      006h, 0bfh, 00dh, 086h, 0e8h, 002h, 0f4h, 089h, 02eh, 0bah, 085h, 089h, 01eh, 0bch, 085h, 0b9h
        elseif  (XL) && (FW_VERSION < 150)
        db      080h, 03eh, 052h, 085h, 000h, 074h, 00ah, 08bh, 02eh, 034h, 084h, 08bh, 01eh, 036h, 084h, 0ebh
        db      006h, 0bfh, 0bdh, 084h, 0e8h, 0feh, 0f3h, 089h, 02eh, 06ah, 084h, 089h, 01eh, 06ch, 084h, 0b9h
        elseif  (XL = 0) && (FW_VERSION >= 200)
        db      080h, 03eh, 040h, 07fh, 000h, 074h, 00ah, 08bh, 02eh, 024h, 07eh, 08bh, 01eh, 026h, 07eh, 0ebh
        db      006h, 0bfh, 0adh, 07eh, 0e8h, 05dh, 0f4h, 089h, 02eh, 05ah, 07eh, 089h, 01eh, 05ch, 07eh, 0b9h
        elseif  (XL = 0) && (FW_VERSION = 150)
        db      080h, 03eh, 090h, 07eh, 000h, 074h, 00ah, 08bh, 02eh, 074h, 07dh, 08bh, 01eh, 076h, 07dh, 0ebh
        db      006h, 0bfh, 0fdh, 07dh, 0e8h, 05dh, 0f4h, 089h, 02eh, 0aah, 07dh, 089h, 01eh, 0ach, 07dh, 0b9h
        else
        db      080h, 03eh, 020h, 077h, 000h, 074h, 00ah, 08bh, 02eh, 004h, 076h, 08bh, 01eh, 006h, 076h, 0ebh
        db      006h, 0bfh, 08dh, 076h, 0e8h, 01fh, 0f4h, 089h, 02eh, 03ah, 076h, 089h, 01eh, 03ch, 076h, 0b9h
        endif
        db      0e6h, 000h, 08bh, 0c3h, 02bh, 0d2h, 0f7h, 0f1h, 095h, 0f7h, 0f1h, 00bh, 0d2h, 074h, 006h, 005h
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      001h, 000h, 083h, 0d5h, 000h, 0a3h, 054h, 085h, 089h, 02eh, 056h, 085h, 0a3h, 058h, 085h, 089h
        db      02eh, 05ah, 085h, 02bh, 0c0h, 0a3h, 02eh, 085h, 0a3h, 030h, 085h, 0a3h, 032h, 085h, 0a3h, 034h
        db      085h, 0a3h, 052h, 085h, 0a2h, 04ah, 085h, 0a2h, 04bh, 085h, 0e9h, 0efh, 0feh
        elseif  (XL) && (FW_VERSION = 150)
        db      001h, 000h, 083h, 0d5h, 000h, 0a3h, 034h, 085h, 089h, 02eh, 036h, 085h, 0a3h, 038h, 085h, 089h
        db      02eh, 03ah, 085h, 02bh, 0c0h, 0a3h, 00eh, 085h, 0a3h, 010h, 085h, 0a3h, 012h, 085h, 0a3h, 014h
        db      085h, 0a3h, 032h, 085h, 0a2h, 02ah, 085h, 0a2h, 02bh, 085h, 0e9h, 0efh, 0feh
        elseif  (XL) && (MODEL = 3200)
        db      001h, 000h, 083h, 0d5h, 000h, 0a3h, 0e4h, 085h, 089h, 02eh, 0e6h, 085h, 0a3h, 0e8h, 085h, 089h
        db      02eh, 0eah, 085h, 02bh, 0c0h, 0a3h, 0beh, 085h, 0a3h, 0c0h, 085h, 0a3h, 0c2h, 085h, 0a3h, 0c4h
        db      085h, 0a3h, 0e2h, 085h, 0a2h, 0dah, 085h, 0a2h, 0dbh, 085h, 0e9h, 0efh, 0feh
        elseif  (XL) && (FW_VERSION < 150)
        db      001h, 000h, 083h, 0d5h, 000h, 0a3h, 094h, 084h, 089h, 02eh, 096h, 084h, 0a3h, 098h, 084h, 089h
        db      02eh, 09ah, 084h, 02bh, 0c0h, 0a3h, 06eh, 084h, 0a3h, 070h, 084h, 0a3h, 072h, 084h, 0a3h, 074h
        db      084h, 0a3h, 092h, 084h, 0a2h, 08ah, 084h, 0a2h, 08bh, 084h, 0e9h, 0efh, 0feh
        elseif  (XL = 0) && (FW_VERSION >= 200)
        db      001h, 000h, 083h, 0d5h, 000h, 0a3h, 084h, 07eh, 089h, 02eh, 086h, 07eh, 0a3h, 088h, 07eh, 089h
        db      02eh, 08ah, 07eh, 02bh, 0c0h, 0a3h, 05eh, 07eh, 0a3h, 060h, 07eh, 0a3h, 062h, 07eh, 0a3h, 064h
        db      07eh, 0a3h, 082h, 07eh, 0a2h, 07ah, 07eh, 0a2h, 07bh, 07eh, 0e9h, 0f5h, 0feh
        elseif  (XL = 0) && (FW_VERSION = 150)
        db      001h, 000h, 083h, 0d5h, 000h, 0a3h, 0d4h, 07dh, 089h, 02eh, 0d6h, 07dh, 0a3h, 0d8h, 07dh, 089h
        db      02eh, 0dah, 07dh, 02bh, 0c0h, 0a3h, 0aeh, 07dh, 0a3h, 0b0h, 07dh, 0a3h, 0b2h, 07dh, 0a3h, 0b4h
        db      07dh, 0a3h, 0d2h, 07dh, 0a2h, 0cah, 07dh, 0a2h, 0cbh, 07dh, 0e9h, 0f5h, 0feh
        else
        db      001h, 000h, 083h, 0d5h, 000h, 0a3h, 064h, 076h, 089h, 02eh, 066h, 076h, 0a3h, 068h, 076h, 089h
        db      02eh, 06ah, 076h, 02bh, 0c0h, 0a3h, 03eh, 076h, 0a3h, 040h, 076h, 0a3h, 042h, 076h, 0a3h, 044h
        db      076h, 0a3h, 062h, 076h, 0a2h, 05ah, 076h, 0a2h, 05bh, 076h, 0e9h, 0f5h, 0feh
        endif
far_30496:
        call    fn_305b8
        push    cs
        call    far_30391
        and     al, 80h
        mov     bx, ax
        sub     bx, word ptr [A_855C]
        add     bx, bx
        or      bh, bh
        jnz     br_304ac
        retf
br_304ac:
        mov     si, ax
        xchg    word ptr [A_855C], si
        push    es
        mov     ax, 7000h
        add     si, si
        jnc     br_304bd
        add     ah, 10h
br_304bd:
        mov     es, ax
        if      (XL) && (FW_VERSION < 150)
        phase   2b2fh
        endif
br_304bf:
        mov     cx, 4
        sub     ax, ax
loop_304c4:
        mov     dx, word ptr es:[si]
        or      dx, dx
        jns     br_304cd
        neg     dx
br_304cd:
        cmp     dx, ax
        jbe     br_304d3
        mov     ax, dx
br_304d3:
        mov     dx, word ptr es:[si + 0eh]
        or      dx, dx
        jns     br_304dd
        neg     dx
br_304dd:
        cmp     dx, ax
        jbe     br_304e3
        mov     ax, dx
br_304e3:
        add     si, 20h
        jnc     br_304f6
        mov     dx, es
        add     dh, 10h
        cmp     dh, 80h
        jz      br_304f4
        if      (XL) && (FW_VERSION < 150)
far_2e762:
        endif
        mov     dh, 70h
br_304f4:
        mov     es, dx
br_304f6:
        loop    loop_304c4
        or      ax, ax
        jns     br_304fd
        dec     ax
br_304fd:
        push    bx
        callf   SEG_INT_01:far_2710c
        pop     bx
        shr     dl, 1
        inc     dl
        mov     di, word ptr [A_8552]
        push    ds
        mov     ax, 5000h
        mov     ds, ax
        mov     byte ptr [di], dl
        pop     ds
        inc     di
        mov     word ptr [A_8552], di
        test    byte ptr [A_854B], 1
        jnz     br_30537
        test    byte ptr [A_854A], 1
        jz      br_3052c
        add     di, 8000h
br_3052c:
        cmp     di, 8000h
        jc      br_30537
        mov     byte ptr [A_854B], 1
br_30537:
        sub     dh, dh
        add     word ptr [A_8560], dx
        adc     word ptr [A_8562], 0
        inc     word ptr [A_855E]
        mov     ax, word ptr [A_8532]
        mov     dx, word ptr [A_8534]
        add     ax, 80h
        adc     dx, 0
        mov     word ptr [A_8532], ax
        mov     word ptr [A_8534], dx
        sub     ax, word ptr [A_852A]
        sbb     dx, word ptr [A_852C]
        jc      br_3056b
        or      byte ptr [A_854B], 4
        pop     es
        retf
br_3056b:
        dec     bh
        jz      br_30572
        jmp     near br_304bf
br_30572:
        pop     es
        mov     bp, word ptr [A_8532]
        mov     bx, word ptr [A_8534]
        sub     bp, word ptr [A_8558]
        sbb     bx, word ptr [A_855A]
        jnc     br_30586
        retf
br_30586:
        mov     ax, word ptr [A_8560]
        mov     dx, word ptr [A_8562]
        mov     cx, word ptr [A_855E]
        div     cx
        mov     dl, al
loop_30595:
        push    dx
        push    bp
        push    bx
        callf   SEG_MAIN:far_1d660
        pop     bx
        pop     bp
        pop     dx
        mov     ax, word ptr [A_8554]
        mov     cx, word ptr [A_8556]
        add     word ptr [A_8558], ax
        adc     word ptr [A_855A], cx
        sub     bp, ax
        sbb     bx, cx
        jnc     loop_30595
        if      (XL = 0) || ((XL) && (FW_VERSION >= 150))
        jmp     far_30385
        else
        jmp     far_30385-8bf0h
        phase   0b818h
        endif
fn_305b8:
        if      (XL) || (MODEL = 3000)
        cmp     byte ptr [A_861D], 1
        jnz     fn_305cd
        endif
        if      XL
        push    cs
        call    far_254a6
        elseif  (XL = 0) && (MODEL = 3000)
        callf   A_24D1_2:far_115e1
        else
        callf   0f7ch:far_254a6
        endif
        sub     al, al
        xchg    byte ptr [A_72AE], al
        cmp     al, 47h
        jnz     br_305e0
        if      (XL) || (MODEL = 3000)
fn_305cd:
        else
fn_30706:
        endif
        or      byte ptr [A_854F], 10h
        mov     ax, word ptr [A_852E]
        mov     dx, word ptr [A_8530]
        mov     word ptr [A_852A], ax
        mov     word ptr [A_852C], dx
br_305e0:
        ret
fn_305e1:
        mov     al, 47h
fn_305e3:
        cmp     al, byte ptr [A_8619]
        jnz     br_305ee
        mov     byte ptr [A_8619], 0
br_305ee:
        ret
far_305ef:
        call    fn_30019
        mov     ds, bp
        or      al, al
        jnz     br_305f9
        retf
br_305f9:
        push    si
        call    fn_3008b
        pop     di
        jc      br_30609
        mov     bx, A_1629
        if      XL
        callf   SEG_MAIN:far_1d752
        retf
        else
        jmpf    A_24D1_2:far_1d760
        endif
br_30609:
        push    es
        mov     ax, 6000h
        mov     es, ax
        mov     si, A_84E0
        mov     cx, 0ch
        rep movsb
        pop     es
        jmp     far_2f694
fn_3061b:
        call    fn_30671
        call    fn_3063b
        mov     dx, ax
        mov     ax, cx
        mov     cx, 4
loop_30628:
        add     dx, dx
        adc     ax, ax
        loop    loop_30628
        mov     bx, 6
        mov     dx, 182h
        call    fn_3158f
        call    fn_315b7
        retf
fn_3063b:
        mov     bp, 0ac44h
        div     bp
        push    ax
        sub     ax, ax
        div     bp
        mov     cx, ax
        sub     ax, ax
        div     bp
        pop     dx
        mov     dh, dl
        mov     al, ah
        mov     ah, cl
        mov     dl, ch
        mov     cx, dx
        mov     bx, ax
        mov     bp, 0f42h
        div     bp
        mov     bp, word ptr [A_84FE]
        imul    bp
        mov     al, ah
        mov     ah, dl
        mov     dl, dh
        sar     dh, 7
        add     ax, bx
        adc     cx, dx
        ret
fn_30671:
        mov     ax, 51ebh
        imul    word ptr [A_84FC]
        mov     cx, 3
loop_3067b:
        add     ax, ax
        adc     dx, dx
        loop    loop_3067b
        mov     ax, dx
        mov     cx, word ptr [A_84FA]
        shr     cx, 1
        imul    cx
        add     ax, ax
        adc     dx, dx
        add     cx, cx
        mov     ax, dx
        cwd
        add     ax, cx
        adc     dx, 0
        ret
        if      XL
far_3069a:
        else
far_3418f:
        endif
        test    byte ptr [A_854F], 4
        if      (XL) || ((XL = 0) && (FW_VERSION >= 200))
        jnz     br_306d6
        else
        jnz     br_306e2
        endif
        cmp     byte ptr [A_854F], 0
        jz      br_306d5
        if      (XL) || (MODEL = 3000)
        cmp     byte ptr [A_8612], 0
        jnz     br_306d5
        endif
        if      XL
        cmp     byte ptr [A_74B9], 8
        jnz     br_306bb
        cmp     byte ptr [A_74BA], 15h
br_306bb:
        else
        cmp     word ptr [A_6EC6], A_0F04
        endif
        jnz     br_306d5
        cmp     byte ptr [A_85AA], 4
        jnz     br_306d5
        cmp     al, 0fch
        jnz     br_306cc
        call    fn_30706
        retf
br_306cc:
        cmp     al, 0fah
        jnz     br_306d5
        and     byte ptr [A_854F], 0bfh
br_306d5:
        retf
        if      (XL) || ((XL = 0) && (FW_VERSION >= 200))
br_306d6:
        endif
        if      XL
        cmp     byte ptr [A_74B9], 8
        jnz     br_306e2
        cmp     byte ptr [A_74BA], 16h
        endif
        if      (XL) || ((XL = 0) && (FW_VERSION < 200))
br_306e2:
        endif
        if      XL = 0
        cmp     word ptr [A_6EC6], A_1004
        endif
        jnz     br_30705
        cmp     byte ptr [A_8511], 4
        jnz     br_30705
        cmp     al, 0fch
        jnz     br_306f5
        if      (XL = 0) || (MODEL = 3000)
        callf   SEG_MAIN:far_1f174
        else
        push    cs
        call    far_2f2d7
        endif
        retf
br_306f5:
        test    byte ptr [A_854F], 40h
        jz      br_30705
        cmp     al, 0fah
        jnz     br_30705
        and     byte ptr [A_854F], 0bfh
        if      (XL = 0) && (MODEL = 3200)
        retf
        endif
br_30705:
        retf
        if      (XL) || (MODEL = 3000)
fn_30706:
        push    ax
        mov     al, byte ptr [A_854F]
        and     al, 0ah
        cmp     al, 2
        jnz     br_30713
        call    fn_305cd
br_30713:
        pop     ax
        ret
        endif
far_30715:
        if      (XL) || (MODEL = 3000)
        cmp     byte ptr [A_8612], 0
        jnz     br_30783
        endif
        mov     cx, word ptr [A_74B9]
        if      XL
        cmp     cl, 8
        else
        cmp     cl, 4
        endif
        jnz     br_30783
        test    byte ptr [A_854F], 4
        jnz     br_30750
        cmp     byte ptr [A_854F], 0
        jz      br_30783
        cmp     ch, A_0015
        jnz     br_30783
        mov     cl, byte ptr [A_85AA]
        cmp     cl, 2
        jz      br_30746
        cmp     cl, 3
        jnz     br_30783
br_30746:
        cmp     al, byte ptr [A_85A8]
        jnz     br_30783
        if      (XL = 0) && (MODEL = 3200)
        push    ax
        endif
        call    fn_30706
        if      (XL = 0) && (MODEL = 3200)
        pop     ax
        endif
        retf
br_30750:
        cmp     ch, A_0018
        jz      br_3076f
        cmp     ch, A_0016_3
        jnz     br_30783
        mov     cl, byte ptr [A_8511]
        cmp     cl, 2
        jz      br_30768
        cmp     cl, 3
        jnz     br_30783
br_30768:
        cmp     al, byte ptr [A_850F]
        jz      br_3077c
        retf
br_3076f:
        test    byte ptr [A_859F], 10h
        jnz     br_30783
        cmp     al, byte ptr [A_860C]
        jnz     br_30783
br_3077c:
        push    ax
        if      (XL = 0) || (MODEL = 3000)
        callf   SEG_MAIN:far_1f174
        else
        push    cs
        call    far_2f2d7
        endif
        pop     ax
br_30783:
        retf
far_30784:
        mov     cx, word ptr [A_74B9]
        if      XL
        cmp     cl, 8
        else
        cmp     cl, 4
        endif
        jnz     br_307ea
        cmp     ch, A_0018
        jz      br_30802
        test    byte ptr [A_854F], 40h
        jz      br_307ea
        test    byte ptr [A_854F], 4
        jnz     br_307c6
        cmp     ch, A_0015
        jnz     br_307ea
        cmp     dl, byte ptr [A_85A9]
        jnz     br_307ea
        cmp     al, byte ptr [A_85A8]
        jnz     br_307ea
        mov     cl, byte ptr [A_85AA]
        cmp     cl, 2
        jz      br_307e5
        cmp     cl, 3
        jnz     br_307ea
        push    ax
        push    dx
        mov     ax, word ptr [A_85B1]
        jmp     br_307f0
br_307c6:
        cmp     ch, A_0016_3
        jnz     br_307ea
        cmp     dl, byte ptr [A_8510]
        jnz     br_307ea
        cmp     al, byte ptr [A_850F]
        jnz     br_307ea
        mov     cl, byte ptr [A_8511]
        cmp     cl, 3
        jz      br_307eb
        cmp     cl, 2
        jnz     br_307ea
br_307e5:
        and     byte ptr [A_854F], 0bfh
br_307ea:
        retf
br_307eb:
        push    ax
        push    dx
        mov     ax, word ptr [A_8518]
br_307f0:
        call    fn_3086c
        push    cs
        call    far_2583b
        mov     byte ptr [A_85F3], al
        mov     byte ptr [A_859F], 2
        pop     dx
        pop     ax
        retf
br_30802:
        test    byte ptr [A_859F], 10h
        jnz     br_3083f
        push    ax
        push    dx
        mov     bl, dl
        mov     bh, al
        push    cs
        call    far_2583b
        push    ax
        push    ds
        mov     ax, A_F700
        mov     ds, ax
        mov     cx, word ptr [16h]
        mov     si, 80h
        sub     bp, bp
loop_30823:
        mov     dx, word ptr [si + 1eh]
        or      dl, dl
        jz      br_30834
        cmp     bl, byte ptr [si + 12h]
        jnz     br_30834
        cmp     bh, byte ptr [si + 16h]
        jz      br_30840
br_30834:
        inc     bp
        add.w   si, 20h
        loop    loop_30823
        pop     ds
        pop     ax
        pop     dx
        pop     ax
br_3083f:
        retf
br_30840:
        pop     ds
        mov     byte ptr [A_860C], bh
        mov     byte ptr [A_8526], dh
        mov     word ptr [A_84A4], bp
        call    fn_30881
        call    fn_30019
        mov     ax, word ptr [si + 38h]
        mov     ds, bp
        call    fn_3086c
        pop     ax
        mov     byte ptr [A_85F3], al
        if      (XL = 0) || (MODEL = 3000)
        callf   SEG_MAIN:far_1f16d
        else
        push    cs
        call    far_1f16d
        endif
        mov     byte ptr [A_85F2], 2
        pop     dx
        pop     ax
        retf
fn_3086c:
        if      (XL) || (MODEL = 3000)
        shl     ax, 1
        else
        shl     ax, 2
        endif
        mov     dx, A_FA00
        mul     dx
        add     ax, ax
        jnc     br_30878
        inc     dx
br_30878:
        mov     word ptr [A_85F4], dx
        ret
far_3087d:
        call    fn_30881
        retf
fn_30881:
        push    ds
        mov     ax, A_F700
        mov     ds, ax
        mov     al, byte ptr [si + 14h]
        mov     ah, byte ptr [si + 15h]
        mov     bx, word ptr [si + 18h]
        mov     cx, word ptr [si + 1ah]
        pop     ds
        mov     byte ptr [A_85FB], al
        mov     byte ptr [A_85FA], ah
        mov     word ptr [A_85F6], bx
        mov     word ptr [A_85F8], cx
        ret
fn_308a4:
        mov     al, byte ptr [A_85B8]
        dec     al
        jz      br_308ae
        mov     byte ptr [A_85B8], al
br_308ae:
        jmp     br_308bc
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0a0h, 0b8h, 085h, 0feh, 0c0h, 03ch, 00fh, 077h, 003h, 0a2h, 0b8h, 085h
        elseif  (XL) && (FW_VERSION = 150)
        db      0a0h, 098h, 085h, 0feh, 0c0h, 03ch, 00fh, 077h, 003h, 0a2h, 098h, 085h
        elseif  (XL) && (MODEL = 3200)
        db      0a0h, 048h, 086h, 0feh, 0c0h, 03ch, 00fh, 077h, 003h, 0a2h, 048h, 086h
        elseif  (XL) && (FW_VERSION < 150)
        db      0a0h, 0f8h, 084h, 0feh, 0c0h, 03ch, 00fh, 077h, 003h, 0a2h, 0f8h, 084h
        elseif  (XL = 0) && (FW_VERSION >= 200)
        db      0a0h, 0e6h, 07eh, 0feh, 0c0h, 03ch, 00fh, 077h, 003h, 0a2h, 0e6h, 07eh
        elseif  (XL = 0) && (FW_VERSION = 150)
        db      0a0h, 036h, 07eh, 0feh, 0c0h, 03ch, 00fh, 077h, 003h, 0a2h, 036h, 07eh
        else
        db      0a0h, 0c6h, 076h, 0feh, 0c0h, 03ch, 00fh, 077h, 003h, 0a2h, 0c6h, 076h
        endif
br_308bc:
        push    cs
        call    fn_2f9d8
        callf   A_24D1_2:far_2533b
        retf
fn_308c6:
        mov     dx, 4000h
        sub     ax, ax
        cmp     byte ptr [A_8524], 0
        jz      br_308f0
        call    fn_30671
        shr     dx, 1
        rcr     ax, 1
        mov     cx, ax
        mov     ax, 5622h
        div     cx
        push    ax
        sub     ax, ax
        div     cx
        mov     dx, ax
        pop     ax
        shr     ax, 1
        rcr     dx, 1
        shr     ax, 1
        rcr     dx, 1
br_308f0:
        mov     cl, byte ptr [A_85B8]
        sub     ch, ch
        jcxz    br_308fe
loop_308f8:
        add     dx, dx
        adc     ax, ax
        loop    loop_308f8
br_308fe:
        mov     di, A_8584
        mov     cx, 3ch
        call    fn_3090f
        call    fn_3090f
        call    fn_2e3df
        stosb
        ret
fn_3090f:
        sub     dx, dx
        div     cx
        push    ax
        push    cx
        mov     al, dl
        call    fn_2e3df
        stosb
        pop     cx
        pop     ax
        ret
br_3091e:
        mov     di, A_8587
        call    fn_2f7fa
        sub     cl, cl
        mov     ax, word ptr [A_84F4]
        mov     dx, word ptr [A_84F6]
        push    ax
        push    dx
        sub     ax, bp
        sbb     dx, bx
        pop     dx
        pop     ax
        jnc     br_3093d
        mov     bp, ax
        mov     bx, dx
        inc     cl
br_3093d:
        mov     di, A_8587
        call    fn_2f941
        mov     word ptr [A_8587], 0
        call    fn_308c6
        cmp     byte ptr [A_8524], 0
        jnz     br_30954
        retf
br_30954:
        mov     ax, word ptr [A_84F4]
        mov     dx, word ptr [A_84F6]
        mov     cx, 7
loop_3095e:
        shr     dx, 1
        rcr     ax, 1
        loop    loop_3095e
        mov     word ptr [A_856C], ax
        mov     word ptr [A_856E], dx
        sub     ch, ch
br_3096d:
        or      dx, dx
        jz      br_30979
        shr     dx, 1
        rcr     ax, 1
        inc     cl
        jmp     br_3096d
br_30979:
        mov     al, byte ptr [A_85B8]
        sub     al, 1
        add     al, byte ptr [A_84F9]
        cmp     al, cl
        jbe     br_30988
        mov     al, cl
br_30988:
        xchg    byte ptr [A_8572], al
        cmp     al, byte ptr [A_8572]
        jz      br_30997
        and     byte ptr [A_859C], 0f7h
br_30997:
        mov     di, A_8587
        call    fn_2f7fa
        mov     cx, 7
loop_309a0:
        shr     bx, 1
        rcr     bp, 1
        loop    loop_309a0
        push    bp
        push    bx
        mov     dx, 1
        mov     cl, 7
        add     cl, byte ptr [A_8572]
        shl     dx, cl
        sub     ax, ax
        sub     ax, word ptr [A_84F4]
        sbb     dx, word ptr [A_84F6]
        jnc     br_309d8
        mov     ax, 8000h
        sub     dx, dx
        mov     cl, byte ptr [A_8572]
        sub     ch, ch
        jcxz    br_309d2
loop_309cc:
        add     ax, ax
        adc     dx, dx
        loop    loop_309cc
br_309d2:
        sub     bp, ax
        sbb     bx, dx
        jnc     br_309de
br_309d8:
        sub     bp, bp
        sub     bx, bx
        jmp     br_30a16
br_309de:
        mov     di, word ptr [A_84F4]
        mov     si, word ptr [A_84F6]
        mov     cx, 7
loop_309e9:
        shr     si, 1
        rcr     di, 1
        loop    loop_309e9
        sub     di, ax
        sbb     si, dx
        sub     di, ax
        sbb     si, dx
        test    di, 3ffh
        jz      br_30a08
        and     di, 0fc00h
        add     di, 400h
        adc     si, 0
br_30a08:
        mov     ax, bp
        mov     dx, bx
        sub     ax, di
        sbb     dx, si
        jc      br_30a16
        mov     bp, di
        mov     bx, si
br_30a16:
        and     bp, 0fc00h
        pop     si
        pop     di
        test    byte ptr [A_859C], 8
        jz      br_30a50
        mov     ax, word ptr [A_8568]
        mov     dx, word ptr [A_856A]
        cmp     bp, ax
        jnz     br_30a32
        cmp     bx, dx
        jz      br_30a74
br_30a32:
        sub     di, ax
        sbb     si, dx
        jc      br_30a50
        mov     cl, byte ptr [A_8572]
        sub     ch, ch
        jcxz    br_30a46
loop_30a40:
        shr     si, 1
        rcr     di, 1
        loop    loop_30a40
br_30a46:
        or      si, si
        jnz     br_30a50
        cmp     di, 0fd4eh
        jc      br_30a74
br_30a50:
        mov     word ptr [A_8568], bp
        mov     word ptr [A_856A], bx
        test    byte ptr [A_859C], 1
        jz      br_30a77
        if      XL = 0
        mov     byte ptr [A_75B2], A_0024_3
        endif
        or      byte ptr [A_854F], 8
        if      XL
        mov     al, 24h
        endif
        callf   SEG_MAIN:far_1f7c3
        pushf
        and     byte ptr [A_854F], 0f7h
        popf
        jc      br_30a77
br_30a74:
        call    fn_30a7d
br_30a77:
        call    fn_30b82
        jmp     br_2fe57
fn_30a7d:
        mov     di, A_8587
        call    fn_2f7fa
        sub     dx, dx
        mov     ax, bp
        mov     cx, 7
loop_30a8a:
        shr     bx, 1
        rcr     ax, 1
        rcr     dx, 1
        loop    loop_30a8a
        sub     ax, word ptr [A_8568]
        sbb     bx, word ptr [A_856A]
        mov     cl, byte ptr [A_8572]
        sub     ch, ch
        jcxz    br_30aaa
loop_30aa2:
        shr     bx, 1
        rcr     ax, 1
        rcr     dx, 1
        loop    loop_30aa2
br_30aaa:
        mov     di, A_91B0
        or      bx, bx
        jnz     br_30b1f
        mov     cl, byte ptr [A_85B8]
        sub     cl, 1
        add     cl, byte ptr [A_84F9]
        sub     cl, byte ptr [A_8572]
        add     cl, 6
        sub     ch, ch
        sub     bx, bx
        mov     bp, 2dfh
        jcxz    br_30ad2
loop_30acc:
        add     bp, bp
        adc     bx, bx
        loop    loop_30acc
br_30ad2:
        mov     word ptr [A_85C2], bp
        mov     word ptr [A_85C4], bx
        mov     bp, 1
        mov     cx, bp
        xchg    bx, cx
        jcxz    br_30af0
br_30ae3:
        cmp     cx, 10h
        jbe     br_30aee
        shr     cx, 1
        add     bp, bp
        jmp     br_30ae3
br_30aee:
        mov     bx, cx
br_30af0:
        push    ds
        mov     cx, 5000h
        mov     ds, cx
        mov     cx, 0f0h
        mov     si, ax
loop_30afb:
        add     dx, word ptr es:[A_85C2]
        adc     ax, word ptr es:[A_85C4]
        jc      br_30b1e
        push    ax
        push    cx
        mov     cx, bx
        sub     al, al
loop_30b0d:
        cmp     al, byte ptr [si]
        jnc     br_30b13
        mov     al, byte ptr [si]
br_30b13:
        add     si, bp
        loop    loop_30b0d
        stosb
        pop     cx
        pop     ax
        mov     si, ax
        loop    loop_30afb
br_30b1e:
        pop     ds
br_30b1f:
        mov     cx, A_92A0
        sub     cx, di
        jcxz    br_30b2a
        sub     al, al
        rep stosb
br_30b2a:
        mov     di, A_91B0
        mov     si, A_8B98
loop_30b30:
        mov     dx, 2100h
br_30b33:
        mov     cx, 8
        sub     al, al
        push    di
loop_30b39:
        ror     dl, 1
        jc      br_30b43
        cmp     al, byte ptr [di]
        jnc     br_30b43
        mov     al, byte ptr [di]
br_30b43:
        inc     di
        loop    loop_30b39
        pop     di
        cmp     al, 21h
        jbe     br_30b4d
        mov     al, 21h
br_30b4d:
        mov     cl, dh
        sub     cl, al
        sub     dh, cl
        jcxz    br_30b60
loop_30b55:
        mov     byte ptr [si], dl
        add     si, 1eh
        loop    loop_30b55
        or      dh, dh
        jz      br_30b71
br_30b60:
        mov     cx, 8
        push    di
loop_30b64:
        scasb
        ja      br_30b6a
        or      dl, 1
br_30b6a:
        ror     dl, 1
        loop    loop_30b64
        pop     di
        jmp     br_30b33
br_30b71:
        sub     si, 3ddh
        add     di, 8
        cmp     di, A_92A0
        jc      loop_30b30
        call    fn_2acf3
        ret
fn_30b82:
        mov     bx, A_1870
        callf   SEG_MAIN:far_1f7cf
        mov     bx, A_69AE
        callf   SEG_MAIN:far_1f7cf
        mov     bx, A_69B1
        callf   SEG_MAIN:far_1f7cf
        cmp     byte ptr [A_8524], 0
        jnz     br_30ba2
        ret
br_30ba2:
        call    fn_30bd7
        call    fn_30be6
        mov     si, A_85CA
        call    fn_30bfe
        mov     byte ptr [A_85EC], bh
        jc      br_30bc7
        push    bx
        call    fn_30bc8
        pop     bx
fn_30bb9:
        mov     byte ptr [A_85EC], bh
        mov     bl, 0fh
        mov     dx, 1224h
        callf   SEG_MAIN:far_1f7d5
br_30bc7:
        ret
fn_30bc8:
        mov     byte ptr [A_85EC], bh
        mov     bl, 0eh
        mov     dx, 1212h
        callf   SEG_MAIN:far_1f7d5
        ret
fn_30bd7:
        mov     si, A_8500
        call    fn_30bfe
        mov     byte ptr [A_85EA], bh
        mov     bl, 0ch
        jnc     fn_30bf5
        ret
fn_30be6:
        mov     si, A_8504_2
        call    fn_30bfe
        mov     byte ptr [A_85EB], bh
        mov     bl, 0dh
        jnc     fn_30bf5
        ret
fn_30bf5:
        mov     dx, 2412h
        callf   SEG_MAIN:far_1f7d5
        ret
fn_30bfe:
        push    si
        mov     di, A_8587
        call    fn_2f7fa
        pop     si
        mov     ax, word ptr [si]
        mov     dx, word ptr [si + 2]
        sub     ax, bp
        sbb     dx, bx
        jc      br_30c3e
        mov     cl, 5
        add     cl, byte ptr [A_85B8]
        sub     cl, 1
        add     cl, byte ptr [A_84F9]
        sub     ch, ch
loop_30c20:
        shr     dx, 1
        rcr     ax, 1
        loop    loop_30c20
        or      dx, dx
        jnz     br_30c3a
        mov     dx, 592ah
        mul     dx
        mov     ax, dx
        cmp     ax, 0efh
        ja      br_30c3a
        mov     bh, al
        clc
        ret
br_30c3a:
        mov     bh, 0feh
        stc
        ret
br_30c3e:
        mov     bh, 0ffh
        stc
        ret
far_30c42:
        if      XL
        mov     al, 26h
        callf   SEG_MAIN:far_1f7c3
        else
        call    fn_2fa57
        endif
        jnc     br_30c4c
        retf
br_30c4c:
        push    si
        push    bx
        mov     bx, A_1694
        callf   SEG_MAIN:far_1d76b
        mov     di, A_8587
        call    fn_2f9bd
        pop     bx
        pop     si
        push    ds
        mov     ax, 6000h
        mov     ds, ax
        mov     ax, word ptr [si + 14h]
        mov     dx, word ptr [si + 16h]
        sub     ax, 2
        sbb     dx, 0
        mov     di, ax
        mov     bp, dx
        sub     di, word ptr [si + 24h]
        sbb     bp, word ptr [si + 26h]
        jnc     br_30c82
        mov     word ptr [si + 24h], ax
        mov     word ptr [si + 26h], dx
br_30c82:
        sub     ax, ax
        sub     dx, dx
        xchg    word ptr [si + 20h], ax
        xchg    word ptr [si + 22h], dx
        mov     di, word ptr [si + 24h]
        mov     bp, word ptr [si + 26h]
        sub     word ptr [si + 24h], ax
        sbb     word ptr [si + 26h], dx
        add     ax, word ptr [si + 10h]
        adc     dx, word ptr [si + 12h]
        add     di, word ptr [si + 10h]
        adc     bp, word ptr [si + 12h]
        mov     cx, dx
        and     dx, 1
        mov     word ptr [si + 10h], ax
        mov     word ptr [si + 12h], dx
        mov     ax, word ptr [si + 24h]
        mov     dx, word ptr [si + 26h]
        add     ax, 2
        adc     dx, 0
        mov     word ptr [si + 14h], ax
        mov     word ptr [si + 16h], dx
        shr     cx, 1
        shr     bp, 1
        jcxz    br_30cd5
loop_30cc7:
        add     bx, bx
        add     bx, 0
        sub     ax, ax
        xchg    word ptr [bx], ax
        mov     bx, ax
        dec     bp
        loop    loop_30cc7
br_30cd5:
        mov     word ptr [si + 0ch], bx
        call    fn_30dc9
        pop     ds
        mov     ax, word ptr [A_8500]
        mov     dx, word ptr [A_8502]
        mov     bp, ax
        or      bp, dx
        pushf
        mov     bp, word ptr [A_8504_2]
        mov     bx, word ptr [A_8506]
        mov     cx, 7
loop_30cf3:
        shr     dx, 1
        rcr     ax, 1
        shr     bx, 1
        rcr     bp, 1
        loop    loop_30cf3
        mov     word ptr [A_8568], ax
        mov     word ptr [A_856A], dx
        mov     word ptr [A_856C], bp
        mov     word ptr [A_856E], bx
        sub     bp, ax
        sbb     bx, dx
        mov     word ptr [A_8534], bx
        popf
        jz      br_30d80
        add     bp, bp
        adc     bx, bx
        or      bp, bp
        jz      br_30d20
        inc     bx
br_30d20:
        mov     byte ptr [A_85BA], bl
        sub     al, al
        mov     byte ptr [A_8572], al
        mov     byte ptr [A_854A], al
        or      byte ptr [A_854F], 8
br_30d31:
        if      XL
        mov     al, 24h
        else
        mov     byte ptr [A_75B2], A_0024_3
        endif
        callf   SEG_MAIN:far_1f7c3
        jc      br_30d6f
        inc     word ptr [A_856A]
loop_30d3e:
        mov     cl, byte ptr [A_854A]
        sub     ch, ch
        shr     cx, 3
        inc     cx
        mov     bx, word ptr [A_8528]
        add     bx, 0eh
        push    ds
        mov     ax, 6000h
        mov     ds, ax
loop_30d55:
        mov     bx, word ptr [bx]
        add     bx, bx
        add     bx, 0
        loop    loop_30d55
        pop     ds
        mov     word ptr [A_8548], bx
        mov     byte ptr [A_854B], 0bh
        if      XL
        mov     al, 23h
        else
        mov     byte ptr [A_75B2], A_0023_2
        endif
        callf   SEG_MAIN:far_1f7c3
br_30d6f:
        jc      br_30dc3
        mov     al, byte ptr [A_854A]
        cmp     al, byte ptr [A_85BA]
        jnc     br_30d80
        test    al, 1
        jnz     loop_30d3e
        jmp     br_30d31
br_30d80:
        mov     bx, word ptr [A_84EE]
        mov     bp, word ptr [A_8534]
        shr     bp, 2
        push    ds
        mov     ax, 6000h
        mov     ds, ax
        call    fn_30dc9
        pop     ds
        or      byte ptr [A_854F], 8
        or      byte ptr [A_854B], 8
        if      XL
        mov     al, 1eh
        else
        mov     byte ptr [A_75B2], A_001E
        endif
        callf   SEG_MAIN:far_1f7c3
        and     byte ptr [A_854F], 0f7h
        and     byte ptr [A_859C], 0f5h
        if      XL
        mov     al, 27h
        callf   SEG_MAIN:far_1f7c3
        else
        push    cs
        call    far_2fa1e
        endif
        callf   SEG_MAIN:far_1f7d9
        callf   A_24D1_2:far_2533b
        clc
        retf
br_30dc3:
        mov     byte ptr [A_859C], 0
        retf
fn_30dc9:
        mov     cx, bp
        jcxz    br_30dd6
loop_30dcd:
        add     bx, bx
        add     bx, 0
        mov     bx, word ptr [bx]
        loop    loop_30dcd
br_30dd6:
        mov     si, bx
        add     si, si
        add     si, 0
        call    fn_30050
        mov     word ptr [si], 0ffffh
        ret
far_30de5:
        cmp     byte ptr [A_8524], 0
        jnz     br_30ded
        retf
br_30ded:
        call    fn_3008b
        jc      br_30dfb
        mov     bx, A_1629
        if      XL
        callf   SEG_MAIN:far_1d752
        retf
        else
        jmpf    A_24D1_2:far_1d760
        endif
br_30dfb:
        cmp     byte ptr [A_8524], 0ffh
        jbe     br_30e0d
        mov     word ptr [A_7FA3], A_6126
        jmpf    SEG_MAIN:far_1c6d0
br_30e0d:
        mov     ax, word ptr [A_84F4]
        mov     dx, word ptr [A_84F6]
        push    ax
        push    dx
        mov     bp, word ptr [A_84F0]
        and     bp, 1ffh
        add     ax, bp
        adc     dx, 0
        shr     dx, 1
        rcr     ax, 1
        or      ax, ax
        jz      br_30e2c
        inc     dx
br_30e2c:
        mov     word ptr [A_85BF], dx
        pop     dx
        pop     ax
        and     al, 80h
        shr     dx, 1
        rcr     ax, 1
        or      al, ah
        or      al, dl
        jz      br_30e40
        inc     dh
br_30e40:
        mov     byte ptr [A_85C1], dh
        mov     al, dh
        sub     ah, ah
        add     ax, word ptr [A_85BF]
        cmp     ax, word ptr [A_8522]
        jbe     br_30e5d
        mov     word ptr [A_7FA3], A_6147
        jmpf    SEG_MAIN:far_1c6d0
br_30e5d:
        mov     bx, A_1694
        callf   SEG_MAIN:far_1d76b
        call    fn_301af
        push    di
        mov     si, A_84E0
        mov     cx, 40h
        rep movsb
        pop     di
        mov     ax, word ptr [A_84F0]
        and     ax, 1ffh
        mov     word ptr es:[di + 10h], ax
        mov     word ptr es:[di + 12h], 0
        mov     ax, 0
        mov     es, ax
        sub     ax, ax
        mov     word ptr [A_85BB], ax
        mov     word ptr [A_85BD], ax
loop_30e8f:
        mov     di, A_8548
        call    fn_300c1
        mov     byte ptr [A_854E], 0
loop_30e9a:
        call    fn_30f07
        jnz     br_30efa
        call    fn_30fae
        jnz     br_30efa
        add     byte ptr [A_854E], 40h
        jnz     loop_30e9a
        dec     byte ptr [A_85C1]
        jnz     loop_30e8f
        mov     ax, word ptr [A_84F0]
        mov     dx, word ptr [A_84F2]
        add     ax, ax
        adc     dx, dx
        mov     word ptr [A_85BB], ax
        mov     word ptr [A_85BD], dx
loop_30ec3:
        mov     di, A_8546
        call    fn_300c1
        mov     byte ptr [A_854E], 0
loop_30ece:
        call    fn_30f01
        jnz     br_30efa
        call    fn_30fae
        jnz     br_30efa
        add     byte ptr [A_854E], 40h
        jnz     loop_30ece
        dec     word ptr [A_85BF]
        jnz     loop_30ec3
        push    cs
        call    far_2f694
        push    cs
        call    far_2f6ee
        call    fn_3007c
        push    cs
        call    far_2fa1e
        callf   SEG_MAIN:far_1f7d9
        retf
br_30efa:
        mov     byte ptr [A_859C], 0
        stc
        retf
fn_30f01:
        mov     bx, word ptr [A_84EC]
        jmp     br_30f0b
fn_30f07:
        mov     bx, word ptr [A_84EE]
br_30f0b:
        mov     ax, word ptr [A_854C]
        push    ax
        mov     al, byte ptr [A_854E]
        push    ax
        mov     ax, word ptr [A_85BB]
        mov     cx, word ptr [A_85BD]
        inc     word ptr [A_85BD]
        shr     cx, 1
        rcr     ax, 1
        shr     cx, 1
        rcr     ax, 1
        mov     byte ptr [A_854E], ah
        call    fn_2f521
        sub     bp, bp
        mov     dl, ah
        sub     dh, dh
        mov     ax, 100h
        sub     ax, dx
        cmp     ax, 40h
        jc      br_30f42
        mov     ax, 40h
        jmp     br_30f71
br_30f42:
        push    ax
        call    fn_30f7d
        pop     ax
        jnz     br_30f74
        mov     dh, al
        mov     al, 40h
        sub     al, dh
        sub     dl, dl
        shl     dx, 2
        mov     bp, dx
        mov     bx, word ptr [A_854C]
        add     bx, bx
        add     bx, 0
        push    ds
        mov     dx, 6000h
        mov     ds, dx
        mov     bx, word ptr [bx]
        pop     ds
        mov     word ptr [A_854C], bx
        mov     byte ptr [A_854E], 0
br_30f71:
        call    fn_30f7d
br_30f74:
        pop     ax
        mov     byte ptr [A_854E], al
        pop     ax
        mov     word ptr [A_854C], ax
        ret
fn_30f7d:
        push    cs
        call    fn_2f538
        mov     bl, 5
        mov     al, 0
        or      byte ptr [A_7F9B], 20h
        call    fn_2f5f2
        call    fn_2ebf0
        mov     ax, 8
        callf   SEG_MAIN:far_1f7af
loop_30f98:
        callf   SEG_MAIN:far_1f7b3
        in      al, 8
        test    al, 10h
        jz      loop_30f98
        callf   SEG_MAIN:far_1f7bf
        pushf
        call    fn_2ebf8
        popf
        ret
fn_30fae:
        mov     ax, 40h
        push    cs
        call    fn_2f538
        sub     bp, bp
        mov     bl, 5
        mov     al, 0
        or      byte ptr [A_7F9B], 40h
        call    fn_2f5f2
        call    fn_2ebf0
        mov     ax, 0ah
        callf   SEG_MAIN:far_1f7af
loop_30fce:
        callf   SEG_MAIN:far_1f7b3
        in      al, 8
        test    al, 10h
        jz      loop_30fce
        callf   SEG_MAIN:far_1f7bf
        pushf
        call    fn_2ebf8
        popf
        ret
far_30fe4:
        if      XL
        cmp     byte ptr [A_74B9], 8
        jnz     br_30ff0
        cmp     byte ptr [A_74BA], 17h
br_30ff0:
        else
        cmp     word ptr [A_6EC6], A_1104
        endif
        jnz     loop_3105a
        test    byte ptr [A_854F], 4
        jnz     loop_3105a
        push    cs
        call    far_2583b
        mov     ah, al
        sub     al, byte ptr [A_85ED]
        mov     byte ptr [A_85ED], ah
        sub     ah, ah
        add     word ptr [A_85EE], ax
        mov     ax, word ptr [A_85EE]
        mov     cx, ax
        and     ah, 7fh
        cmp     ax, 1f4h
        jc      loop_3105a
        and     cx, 8000h
        xor     ch, 80h
        mov     word ptr [A_85EE], cx
        jnz     br_3105b
        mov     si, A_8500
        call    fn_30bfe
        jc      br_31037
        mov     bx, A_69A8
        callf   SEG_MAIN:far_1f7cf
br_31037:
        mov     si, A_8504_2
        call    fn_30bfe
        jc      br_31047
        mov     bx, A_69AB
        callf   SEG_MAIN:far_1f7cf
br_31047:
        mov     si, A_85CA
        call    fn_30bfe
        jc      loop_3105a
        call    fn_30bb9
        mov     bx, A_69AE
        callf   SEG_MAIN:far_1f7cf
loop_3105a:
        retf
br_3105b:
        call    fn_30bd7
        call    fn_30be6
        mov     si, A_85CA
        call    fn_30bfe
        jc      loop_3105a
        call    fn_30bc8
        mov     bx, A_69B1
        callf   SEG_MAIN:far_1f7cf
        retf
far_31075:
        push    ds
        mov     ax, A_F700
        mov     ds, ax
        mov     si, 80h
        mov     cx, word ptr [16h]
loop_31082:
        mov     al, byte ptr [si + 17h]
        inc     al
        mov     byte ptr [si + 1dh], al
        mov     byte ptr [si + 1ch], 0
        push    si
        push    cx
        mov     di, A_84E0
        mov     cx, 0ch
        rep movsb
        mov     ax, 0
        mov     ds, ax
        call    fn_3008b
        pop     cx
        pop     si
        mov     ax, A_F700
        mov     ds, ax
        jnc     br_310ad
        sub     dx, dx
        jmp     br_310af
br_310ad:
        mov     dl, 1
br_310af:
        mov     word ptr [si + 1eh], dx
        add.w   si, 20h
        loop    loop_31082
        pop     ds
        and     byte ptr [A_859C], 0fdh
        retf
fn_310bf:
        push    cs
        call    far_2583b
        mov     byte ptr [A_85F3], al
        push    es
        mov     ax, A_F700
        mov     es, ax
        mov     al, byte ptr es:[di + 0bh]
        mov     byte ptr [A_8526], al
        mov     al, byte ptr es:[di + 9]
        mov     ah, byte ptr es:[di + 0ah]
        mov     word ptr [A_85FA], ax
        call    fn_2e2c3
        pop     es
        push    cx
        push    ax
        push    dx
        mov     di, A_84C5
        call    fn_2e2c3
        mov     ch, byte ptr cs:[A_9642]
        sub     bx, bx
        add     al, ch
        adc     ah, bl
        adc     dx, bx
        pop     di
        pop     bp
        pop     bx
        push    ax
        shr     cl, 4
        shr     bl, 4
        mov     al, cl
        sub     al, bl
        aas
        mov     cl, al
        pop     ax
        sbb     ax, bp
        sbb     dx, di
        shl     cl, 4
        push    cx
        push    ax
        push    dx
        and     byte ptr [A_859C], 0f5h
        call    fn_2fa57
        pop     dx
        pop     ax
        pop     cx
        call    fn_2f7fd
        call    fn_3115b
        add     bp, word ptr [A_8500]
        adc     bx, word ptr [A_8502]
        mov     word ptr [A_85FD], bp
        mov     word ptr [A_85FF], bx
        mov     bp, word ptr [A_8504_2]
        mov     bx, word ptr [A_8506]
        sub     bp, word ptr [A_85FD]
        sbb     bx, word ptr [A_85FF]
        jc      br_3115a
        call    fn_311a2
        cmp     bx, 2
        jc      br_3115a
        mov     word ptr [A_85F4], A_07A5
        mov     byte ptr [A_85F2], 82h
br_3115a:
        ret
fn_3115b:
        push    bp
        push    bp
        push    bx
        call    fn_30671
        call    fn_3063b
        pop     bx
        pop     bp
        mov     di, ax
        mul     bp
        mov     si, dx
        mov     ax, bp
        sub     bp, bp
        mul     cx
        add     si, ax
        adc     bp, dx
        mov     ax, di
        mov     di, bx
        mov     bx, 0
        adc     bx, bx
        mul     di
        add     si, ax
        adc     bp, dx
        adc     bx, 0
        mov     ax, cx
        mul     di
        add     bp, ax
        adc     bx, dx
        mov     cx, 8
loop_31193:
        add     si, si
        adc     bp, bp
        adc     bx, bx
        loop    loop_31193
        pop     ax
        or      ax, 0fffeh
        and     bp, ax
        ret
fn_311a2:
        ret
far_311a3:
        mov     byte ptr [A_8612], 1
        sub     di, di
        push    es
        mov     ax, 7000h
        mov     es, ax
        mov     ax, 3e7h
        mov     cx, 3e8h
loop_311b6:
        stosw
        dec     ax
        loop    loop_311b6
        mov     ax, 200h
        mov     cx, 0ah
        rep stosw
        pop     es
        mov     word ptr [A_8550], di
        mov     si, A_69BD
        mov     di, A_69CB
        mov     word ptr [A_8601], di
        mov     cx, 7
        rep movsb
        and     byte ptr [A_859C], 0f7h
        call    fn_311e2
        call    fn_31211
        retf
fn_311e2:
        mov     dx, 0a01h
        mov     bx, 2
        mov     cx, 4000h
        call    fn_311f4
        mov     bx, 8002h
        mov     cx, 4001h
fn_311f4:
        mov     ax, dx
        out     80h, ax
        mov     ax, cx
        out     82h, ax
        mov     ax, bx
        out     84h, ax
        inc     dl
        mov     ax, dx
        out     80h, ax
        mov     ax, cx
        out     82h, ax
        mov     ax, bx
        out     84h, ax
        inc     dl
        ret
fn_31211:
        mov     ax, 0a00h
        out     80h, ax
        in      ax, 84h
        and     ah, 0fh
        cmp     ax, 400h
        jc      br_3122a
        cmp     ax, 0c00h
        jnc     fn_31211
        cmp     ax, 800h
        jc      fn_31211
br_3122a:
        ret
far_3122b:
        if      XL = 0
        call    br_3139e
        endif
        call    fn_2ec5d
        mov     bl, 3
        mov     bh, 59h
        call    fn_31301
        mov     bx, 0
        sub     ax, ax
        call    fn_315ed
        mov     ax, 1000h
        mov     bx, 2
        call    fn_315a9
        mov     ax, 1800h
        call    fn_315d1
        mov     bx, 6
        mov     ax, 1000h
        call    fn_315ed
        mov     bx, 14h
        mov     ax, 3e8h
        call    fn_315ed
        mov     bx, 2ah
        mov     ax, 8000h
        call    fn_315ed
        mov     si, A_328C
        mov     cx, A_183D
        if      XL
        cmp     byte ptr [A_8430], 0
        jnz     br_31277
        mov     cx, 1c3dh
br_31277:
        endif
        mov     dl, 0
        call    fn_3140c
        push    cs
        call    far_28a80
        mov     si, A_32E4
        mov     cx, 1efdh
        mov     dl, 17h
        call    fn_3140c
        push    cs
        call    far_28a80
        call    fn_31623
        mov     bx, 40h
        cmp     byte ptr [A_7300], 0
        jz      br_312ca
        mov     si, A_32B8
        mov     cx, A_183D
        if      XL
        cmp     byte ptr [A_8430], 0
        jnz     br_312ac
        mov     cx, 1c3dh
br_312ac:
        endif
        mov     dl, 10h
        call    fn_3140c
        push    cs
        call    far_28a80
        mov     si, A_3310
        mov     cx, 1efdh
        mov     dl, 19h
        call    fn_3140c
        push    cs
        call    far_28a80
        call    fn_31623
        mov     bx, 58h
br_312ca:
        call    fn_2ec52
        retf
far_312ce:
        mov     bl, 2
        mov     bh, 55h
        call    fn_31301
        mov     byte ptr [A_860A], 7
        retf
fn_312db:
        mov     dx, 0c001h
        mov     al, bl
        out     dx, al
        mov     dx, 0c006h
        mov     al, 7
        if      XL
        cmp     al, 8
        jc      br_312ec
        add     al, 10h
br_312ec:
        else
        add     al, byte ptr [A_87A1]
        endif
        out     dx, al
        sub     ax, ax
        mov     dx, 0c004h
        out     dx, ax
        mov     dx, 0c002h
        mov     ax, 7fffh
        out     dx, ax
        mov     dx, 0c00ah
        mov     al, bh
        out     dx, al
        ret
fn_31301:
        call    fn_312db
        mov     dx, 0c001h
        mov     al, bl
        add     al, 4
        out     dx, al
        mov     dx, 0c006h
        mov     al, 8
        if      XL
        cmp     al, 8
        jc      br_31317
        add     al, 10h
br_31317:
        else
        add     al, byte ptr [A_87A1]
        endif
        out     dx, al
        ret
fn_31319:
        call    fn_2ec5d
        mov     bl, 3
        mov     bh, 49h
        call    fn_312db
        mov     cx, A_183D
        if      XL
        cmp     byte ptr [A_8430], 0
        jnz     br_31330
        mov     cx, 1c3dh
br_31330:
        endif
        mov     si, A_328C
        cmp     byte ptr [A_8612], 0
        jz      br_3133d
        mov     si, A_333C
br_3133d:
        mov     dl, 0
        call    fn_3140c
        push    cs
        call    far_28a80
        mov     dl, 10h
        call    fn_3140c
        cmp     byte ptr [A_8612], 0
        jz      br_31362
        push    cs
        call    far_28a80
        mov     ax, 10h
        out     80h, ax
        mov     ax, 800h
        out     84h, ax
        jmp     br_31369
br_31362:
        mov     si, A_32B8
        push    cs
        call    far_28a80
br_31369:
        if      XL
        mov     cx, 1c3dh
        endif
        mov     dl, 17h
        call    fn_3140c
        push    cs
        call    far_28a71
        test    byte ptr [A_859F], 10h
        jnz     br_31383
        cmp     byte ptr [A_84F9], 0
        jz      br_3139e
br_31383:
        mov     dl, 8
        call    fn_3140c
        push    cs
        call    far_28a80
        mov     dl, 18h
        call    fn_3140c
        push    cs
        call    far_28a80
        mov     dl, 19h
        call    fn_3140c
        push    cs
        call    far_28a71
br_3139e:
        if      XL = 0
        or      byte ptr [A_7DBC], 80h
        mov     bx, 10h
        call    fn_2d90b
        ret
fn_2d90b:
        push    ds
        mov     ax, A_2DF3
        mov     ds, ax
        sub     ch, ch
        mov     cl, 1
        call    fn_2d92d
        mov     cl, 3
        call    fn_2d92d
        mov     cl, 5
        call    fn_2d92d
        mov     cl, 7
        call    fn_2d92d
        mov     word ptr [A_547E], bx
        pop     ds
        ret
fn_2d92d:
        mov     ax, A_01BC
        mul     cx
        mov     di, A_A9F0
        add     di, ax
        test    byte ptr [di + A_014D], 1
        jz      br_2d948
        mov     ah, 1
        mov     al, cl
        out     80h, ax
        mov     ax, bx
        out     86h, ax
br_2d948:
        endif
        ret
fn_3139f:
        call    fn_2ec5d
        mov     dl, 0
        call    fn_3142b
        mov     dl, 10h
        call    fn_3142b
        mov     dl, 17h
        call    fn_3142b
        push    cs
        call    far_28a71
        if      (XL = 0) && (MODEL = 3200)
        push    ds
        mov     ax, 347eh
        mov     ds, ax
        mov     di, 0e8c6h
        test    byte ptr [di + 1a5h], 4
        pop     ds
        jz      br_34554
        endif
        mov     dl, 19h
        call    fn_3142b
        push    cs
        call    far_28a71
        mov     dl, 8
        call    fn_3142b
        mov     dl, 18h
        call    fn_3142b
        if      (XL = 0) && (MODEL = 3200)
br_34554:
        endif
        if      XL = 0
        and     byte ptr [A_7DBC], 7fh
        sub     bx, bx
        call    fn_2d90b
        endif
        retf
far_313c9:
        cmp     byte ptr [A_8524], 0
        jz      br_313f0
        mov     si, A_6AC1
        mov     cx, 6
loop_313d6:
        mov     dl, byte ptr [si]
        inc     si
        call    fn_3140c
        push    cs
        call    far_28a71
        if      XL
        mov     bl, dl
        sub     ax, ax
        callf   SEG_INT_01:far_2df6a
        endif
        loop    loop_313d6
        mov     byte ptr [A_7F44], 1
        if      XL = 0
        callf   A_24D1_2:far_1fc4d
        endif
br_313f0:
        retf
far_313f1:
        cmp     byte ptr [A_7F44], 0
        jz      br_3140b
        mov     si, A_6AC1
        mov     cx, 6
loop_313fe:
        mov     dl, byte ptr [si]
        inc     si
        call    fn_31412
        loop    loop_313fe
        mov     byte ptr [A_7F44], 0
        if      XL = 0
        callf   A_24D1_2:far_1fc4d
        endif
br_3140b:
        retf
fn_3140c:
        mov     dh, 4
        call    fn_2d9d5
        ret
fn_31412:
        push    ds
        mov     ax, A_3A60
        mov     ds, ax
        mov     ax, A_01BC
        sub     dh, dh
        mul     dx
        mov     di, A_A9F0
        add     di, ax
        and     byte ptr [di + A_014D], 0fbh
        pop     ds
        ret
fn_3142b:
        cmp     byte ptr [A_7F44], 0
        jnz     br_31437
        push    dx
        call    fn_31412
        pop     dx
br_31437:
        ret
        db      007h, 006h, 003h, 002h, 005h, 004h, 001h, 000h, 00fh, 00fh, 007h, 006h, 00fh, 00fh
far_31446:
        if      XL
        cmp     dl, 4
        jbe     br_3144d
        mov     dl, 4
br_3144d:
        push    ax
        mov     bx, A_6790
        mov     al, cl
        xlat
        mov     cl, al
        sub     ch, 1
        jnc     br_3145d
        sub     cx, cx
br_3145d:
        pop     ax
        push    cx
        endif
        mov     cx, ax
        sub     dl, 1
        jnc     br_31468
        sub     dx, dx
br_31468:
        mov     bl, dl
        add     bl, bl
        sub     bh, bh
        add     bx, A_C728
        mov     bx, word ptr cs:[bx]
        push    bx
        mov     bx, A_6790
        mov     al, dh
        xlat
        mov     ah, al
        sub     al, al
        shr     ax, 1
        sub     si, si
        cmp     dl, 4
        jbe     br_31492
        mov     si, ax
        cmp     dl, 5
        jnz     br_31492
        sub     ax, ax
br_31492:
        neg     ah
        pop     dx
        mov     al, dl
        push    ax
        mov     al, dh
        push    ax
        mov     ax, cx
        xlat
        mov     dx, 8080h
        add     dl, al
        not     al
        add     dh, al
        mov     di, dx
        mov     al, ah
        xlat
        mov     cl, al
        mov     al, dl
        mul     cl
        mov     dl, ah
        mov     al, dh
        mul     cl
        mov     dh, ah
        mov     ax, dx
        mov     cx, dx
        mov     bx, 20h
        mov     dx, 782h
        test    byte ptr [A_8614], 2
        jz      br_314d7
        cmp     byte ptr [A_7300], 0
        if      XL
        jnz     br_314d5
        jmp     near br_31563
br_314d5:
        else
        jz      br_31563
        endif
        jmp     br_314e1
br_314d7:
        cmp     byte ptr [A_84F9], 0
        if      XL
        jnz     br_314e1
        jmp     near br_31563
        else
        jz      br_31563
        endif
br_314e1:
        sub     al, al
        sub     ch, ch
        xchg    cx, ax
        call    fn_315b7
        mov     ax, cx
        call    fn_3158f
        mov     bx, 22h
        mov     dl, 84h
        pop     ax
        mov     cx, di
        cmp     al, 0fh
        jnz     br_31506
        mov     ch, al
        mov     al, cl
        neg     ah
        mul     ah
        neg     ah
        mov     al, ch
br_31506:
        call    fn_315b7
        pop     ax
        mov     cx, di
        cmp     al, 0fh
        jnz     br_3151c
        mov     cl, al
        mov     al, ch
        neg     ah
        mul     ah
        neg     ah
        mov     al, cl
br_3151c:
        call    fn_3158f
        mov     bx, 2ah
        mov     dx, A_02E4
        mov     cx, di
        mov     ax, si
        mov     al, ch
        mul     ah
        mov     al, ah
        shr     al, 3
        mov     ah, 80h
        call    fn_3158f
        mov     ax, si
        mov     al, cl
        mul     ah
        mov     al, ah
        shr     al, 3
        mov     ah, 80h
        call    fn_315b7
        if      XL
        pop     dx
        mov     al, ch
        mul     dl
        shr     ax, 1
        and     al, 0fch
        or      al, dh
        call    fn_315fd
        mov     al, cl
        mul     dl
        shr     ax, 1
        and     al, 0fch
        or      al, dh
        call    fn_31610
        endif
        retf
br_31563:
        call    fn_3158f
        mov     bx, 22h
        mov     dl, 84h
        pop     ax
        pop     ax
        call    fn_3158f
        mov     bx, 2ah
        mov     dx, A_02E4
        mov     ax, si
        mov     al, ah
        shr     al, 3
        mov     ah, 80h
        call    fn_3158f
        if      XL
        pop     dx
        mov     ah, dl
        mov     al, 0
        shr     ax, 1
        or      al, dh
        call    fn_315fd
        endif
        retf
fn_3158f:
        test    byte ptr [A_8614], 1
        jnz     fn_315a9
fn_31596:
        push    dx
        push    ax
        mov     ah, dh
        mov     al, 17h
        push    dx
        and     dx, 0e0h
        out     dx, ax
        pop     dx
        pop     ax
        sub     dh, dh
        out     dx, ax
        pop     dx
        ret
fn_315a9:
        push    dx
        push    ds
        mov     dx, A_3A60
        mov     ds, dx
        mov     word ptr [bx + A_32E4], ax
        pop     ds
        pop     dx
        ret
fn_315b7:
        test    byte ptr [A_8614], 1
        jnz     fn_315d1
fn_315be:
        push    dx
        push    ax
        mov     ah, dh
        mov     al, 19h
        push    dx
        and     dx, 0e0h
        out     dx, ax
        pop     dx
        pop     ax
        sub     dh, dh
        out     dx, ax
        pop     dx
        ret
fn_315d1:
        push    dx
        push    ds
        mov     dx, A_3A60
        mov     ds, dx
        mov     word ptr [bx + A_3310], ax
        pop     ds
        pop     dx
        ret
fn_315df:
        call    fn_31596
        cmp     byte ptr [A_85DC], 0
        jz      br_315ec
        call    fn_315be
br_315ec:
        ret
fn_315ed:
        push    ds
        mov     dx, A_3A60
        mov     ds, dx
        mov     word ptr [bx + A_32E4], ax
        mov     word ptr [bx + A_3310], ax
        pop     ds
        ret
        if      XL
fn_315fd:
        test    byte ptr [A_8614], 1
        jnz     br_3160c
        mov     bl, 17h
        callf   SEG_INT_01:far_2df6a
        ret
br_3160c:
        mov     word ptr [A_861E], ax
        ret
fn_31610:
        test    byte ptr [A_8614], 1
        jnz     br_3161f
        mov     bl, 19h
        callf   SEG_INT_01:far_2df6a
        ret
br_3161f:
        mov     word ptr [A_8620], ax
        ret
        endif
fn_31623:
        push    ds
        mov     ax, A_3A60
        mov     ds, ax
        mov     ah, 1
        mov     al, dl
        out     A_00E0, ax
        mov     ax, word ptr [si + 24h]
        out     A_00E2, ax
        mov     ax, word ptr [si + 26h]
        out     A_00E4, ax
        mov     ah, 2
        mov     al, dl
        out     A_00E0, ax
        mov     ax, word ptr [si + 28h]
        out     A_00E2, ax
        mov     ax, word ptr [si + 2ah]
        out     A_00E4, ax
        pop     ds
        mov     ah, 4
        mov     al, dl
        out     A_00E0, ax
        mov     ax, 7fffh
        out     A_00E4, ax
        if      XL
        mov     bl, dl
        mov     ax, word ptr [A_861E]
        cmp     bl, 17h
        jz      br_31662
        mov     ax, word ptr [A_8620]
br_31662:
        callf   SEG_INT_01:far_2df6a
        endif
        ret
far_31668:
        mov     dx, 0c001h
        mov     al, 2
        out     dx, al
        mov     dx, 0c004h
loop_31671:
        in      ax, dx
        cmp     ax, 2
        jc      loop_31671
        mov     ax, bp
        out     88h, ax
        retf
far_3167c:
        sub     ax, ax
        out     88h, ax
        mov     byte ptr [A_8619], al
        mov     byte ptr [A_7285], al
        mov     byte ptr [A_7284], al
        mov     byte ptr [A_85B9], al
        mov     byte ptr [A_859F], al
        mov     byte ptr [A_854F], al
        mov     byte ptr [A_8605], al
        cmp     byte ptr [A_84B8], al
        jz      br_316a2
        cmp     byte ptr [A_8606], 2
        jz      br_316a5
br_316a2:
        mov     byte ptr [A_8606], al
br_316a5:
        mov     byte ptr [A_85FC], al
        mov     word ptr [A_8603], ax
        mov     word ptr [A_85EE], 1f4h
        push    cs
        call    fn_3139f
        retf
far_316b6:
        cmp     byte ptr [A_854F], 0
        if      (XL) || (MODEL = 3200) || ((XL = 0) && (FW_VERSION >= 200))
        jz      br_316c3
        else
        jz      br_31749
        endif
        cmp     byte ptr [A_851B], 5
        cmc
        if      (XL) || (MODEL = 3200) || ((XL = 0) && (FW_VERSION >= 200))
br_316c3:
        retf
        endif
        if      (XL) && (MODEL = 3000)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  MODEL = 3200
        db      000h, 000h, 000h
        endif
        if      XL
far_316d0:
        mov     cx, 0c0h
        mov     di, A_6AD0
        push    ds
        mov     ax, A_3A60
        mov     ds, ax
        rep movsb
        pop     ds
        call    fn_316e3
        retf
fn_316e3:
        push    word ptr [A_8630]
        mov     byte ptr [A_8630], 0
loop_316ec:
        push    cs
        call    fn_31704
        push    cs
        call    far_31734
        inc     byte ptr [A_8630]
        cmp     byte ptr [A_8630], 20h
        jnz     loop_316ec
        pop     word ptr [A_8630]
        ret
fn_31704:
        cmp     byte ptr [A_8630], 0
        jz      br_31733
        push    cs
        call    fn_3174a
        mov     al, byte ptr [bx]
        cmp     al, 80h
        jnz     br_3171a
        mov     ax, 4000h
        jmp     br_31720
br_3171a:
        cbw
        mov     cx, 28fh
        imul    cx
br_31720:
        and     ax, 0fffch
        mov     cl, byte ptr [bx + 1]
        cmp     cl, 2
        jnz     br_3172d
        inc     cl
br_3172d:
        or      al, cl
        mov     dx, 82h
        out     dx, ax
br_31733:
        retf
far_31734:
        cmp     byte ptr [A_8630], 0
        jz      br_31749
        push    cs
        call    fn_3174a
        mov     ax, word ptr [bx + 2]
        dec     ax
        neg     ax
        mov     dx, 84h
        out     dx, ax
        endif
        if      (XL) || ((XL = 0) && (FW_VERSION = 150))
br_31749:
        retf
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      000h, 000h, 000h, 000h, 000h
        endif
        if      (XL) || (MODEL = 3000)
fn_3174a:
        mov     al, byte ptr [A_8630]
        mov     ah, 0ah
        out     80h, ax
        mov     bx, A_6AD0
        mov     al, byte ptr [A_8630]
        sub     ah, ah
        mov     cx, 6
        mul     cx
        add     bx, ax
        retf
        endif
        if      XL
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 026h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0adh, 080h, 03eh, 024h, 080h, 000h, 074h, 003h, 035h, 020h, 020h, 08ah, 00eh, 06fh, 074h, 080h
        elseif  (XL) && (FW_VERSION = 150)
        db      0adh, 080h, 03eh, 014h, 080h, 000h, 074h, 003h, 035h, 020h, 020h, 08ah, 00eh, 05fh, 074h, 080h
        elseif  (XL) && (MODEL = 3200)
        db      0adh, 080h, 03eh, 054h, 080h, 000h, 074h, 003h, 035h, 020h, 020h, 08ah, 00eh, 09fh, 074h, 080h
        elseif  (XL) && (FW_VERSION < 150)
        db      0adh, 080h, 03eh, 074h, 07fh, 000h, 074h, 003h, 035h, 020h, 020h, 08ah, 00eh, 0beh, 073h, 080h
        endif
        if      XL
        db      0f9h, 010h, 07dh, 005h, 0d3h, 0e8h, 0d1h, 0e8h, 0c3h, 080h, 0e9h, 010h, 026h, 0ach, 0d2h, 0e8h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0d0h, 0e8h, 0c3h, 006h, 0b8h, 060h, 03ah, 08eh, 0c0h, 0a1h, 06ah, 074h, 03bh, 006h, 068h, 074h
        db      07dh, 040h, 0a1h, 06ah, 074h, 0b9h, 018h, 000h, 0f7h, 0e1h, 005h, 0aah, 062h, 08bh, 0f0h, 026h
        elseif  (XL) && (FW_VERSION = 150)
        db      0d0h, 0e8h, 0c3h, 006h, 0b8h, 04fh, 03ah, 08eh, 0c0h, 0a1h, 05ah, 074h, 03bh, 006h, 058h, 074h
        db      07dh, 040h, 0a1h, 05ah, 074h, 0b9h, 018h, 000h, 0f7h, 0e1h, 005h, 0aah, 062h, 08bh, 0f0h, 026h
        elseif  (XL) && (MODEL = 3200)
        db      0d0h, 0e8h, 0c3h, 006h, 0b8h, 0d9h, 03ah, 08eh, 0c0h, 0a1h, 09ah, 074h, 03bh, 006h, 098h, 074h
        db      07dh, 040h, 0a1h, 09ah, 074h, 0b9h, 018h, 000h, 0f7h, 0e1h, 005h, 0aah, 062h, 08bh, 0f0h, 026h
        elseif  (XL) && (FW_VERSION < 150)
        db      0d0h, 0e8h, 0c3h, 006h, 0b8h, 0ebh, 037h, 08eh, 0c0h, 0a1h, 0b9h, 073h, 03bh, 006h, 0b7h, 073h
        db      07dh, 040h, 0a1h, 0b9h, 073h, 0b9h, 018h, 000h, 0f7h, 0e1h, 005h, 08ah, 062h, 08bh, 0f0h, 026h
        endif
        if      XL
        db      080h, 07ch, 010h, 000h, 074h, 00bh, 083h, 0c6h, 00ch, 0e8h, 0b3h, 0ffh, 073h, 003h, 007h, 0f9h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0cbh, 08bh, 01eh, 06ah, 074h, 03bh, 01eh, 095h, 06bh, 075h, 009h, 0a0h, 063h, 074h, 03ah, 006h
        db      094h, 06bh, 074h, 02fh, 0ffh, 006h, 06ah, 074h, 08bh, 01eh, 06ah, 074h, 03bh, 01eh, 068h, 074h
        db      07eh, 0c0h, 0a0h, 063h, 074h, 03ah, 006h, 061h, 074h, 07ch, 005h, 0c6h, 006h, 063h, 074h, 0ffh
        db      0feh, 006h, 063h, 074h, 0c7h, 006h, 06ah, 074h, 000h, 000h, 006h, 09ah
        elseif  (XL) && (FW_VERSION = 150)
        db      0cbh, 08bh, 01eh, 05ah, 074h, 03bh, 01eh, 085h, 06bh, 075h, 009h, 0a0h, 053h, 074h, 03ah, 006h
        db      084h, 06bh, 074h, 02fh, 0ffh, 006h, 05ah, 074h, 08bh, 01eh, 05ah, 074h, 03bh, 01eh, 058h, 074h
        db      07eh, 0c0h, 0a0h, 053h, 074h, 03ah, 006h, 051h, 074h, 07ch, 005h, 0c6h, 006h, 053h, 074h, 0ffh
        db      0feh, 006h, 053h, 074h, 0c7h, 006h, 05ah, 074h, 000h, 000h, 006h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0cbh, 08bh, 01eh, 09ah, 074h, 03bh, 01eh, 0c5h, 06bh, 075h, 009h, 0a0h, 093h, 074h, 03ah, 006h
        db      0c4h, 06bh, 074h, 02fh, 0ffh, 006h, 09ah, 074h, 08bh, 01eh, 09ah, 074h, 03bh, 01eh, 098h, 074h
        db      07eh, 0c0h, 0a0h, 093h, 074h, 03ah, 006h, 091h, 074h, 07ch, 005h, 0c6h, 006h, 093h, 074h, 0ffh
        db      0feh, 006h, 093h, 074h, 0c7h, 006h, 09ah, 074h, 000h, 000h, 006h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0cbh, 08bh, 01eh, 0b9h, 073h, 03bh, 01eh, 0c5h, 06ah, 075h, 009h, 0a0h, 0b2h, 073h, 03ah, 006h
        db      0c4h, 06ah, 074h, 02fh, 0ffh, 006h, 0b9h, 073h, 08bh, 01eh, 0b9h, 073h, 03bh, 01eh, 0b7h, 073h
        db      07eh, 0c0h, 0a0h, 0b2h, 073h, 03ah, 006h, 0b0h, 073h, 07ch, 005h, 0c6h, 006h, 0b2h, 073h, 0ffh
        db      0feh, 006h, 0b2h, 073h, 0c7h, 006h, 0b9h, 073h, 000h, 000h, 006h, 09ah
        elseif  (XL = 0) && (FW_VERSION >= 200)
fn_2dc17:
        add     byte ptr [bx+si], al
        add     byte ptr [bx+si], al
        add     byte ptr [bx+si], al
        add     byte ptr [bx+si], al
        add     byte ptr [80adh], ah
        db      03eh, 0d3h, 078h, 000h
        jz      br_2dc2c
        xor     ax, 2020h
br_2dc2c:
        mov     cl, byte ptr [6e7ch]
        cmp     cl, 10h
        jge     br_2dc3a
        shr     ax, cl
        shr     ax, 1
        ret
br_2dc3a:
        sub     cl, 10h
        seges
        lodsb
        shr     al, cl
        shr     al, 1
        ret
        db      006h, 0b8h, 0f3h, 02dh, 08eh, 0c0h, 0a1h, 077h, 06eh, 03bh, 006h, 075h, 06eh, 07dh, 040h, 0a1h
        db      077h, 06eh, 0b9h, 018h, 000h, 0f7h, 0e1h, 005h, 07ah, 07ch, 08bh, 0f0h, 026h, 080h, 07ch, 010h
        db      000h, 074h, 00bh, 083h, 0c6h, 00ch, 0e8h, 0b3h, 0ffh, 073h, 003h, 007h, 0f9h, 0cbh, 08bh, 01eh
        db      077h, 06eh, 03bh, 01eh, 0a5h, 06bh, 075h, 009h, 0a0h, 070h, 06eh, 03ah, 006h, 0a4h, 06bh, 074h
        db      02fh, 0ffh, 006h, 077h, 06eh, 08bh, 01eh, 077h, 06eh, 03bh, 01eh, 075h, 06eh, 07eh, 0c0h, 0a0h
        db      070h, 06eh, 03ah, 006h, 06eh, 06eh, 07ch, 005h, 0c6h, 006h, 070h, 06eh, 0ffh, 0feh, 006h, 070h
        db      06eh, 0c7h, 006h, 077h, 06eh, 000h, 000h, 006h, 09ah
        elseif  (XL = 0) && (FW_VERSION = 150)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 026h, 0adh, 080h, 03eh, 0d3h, 078h, 000h
        db      074h, 003h, 035h, 020h, 020h, 08ah, 00eh, 07ch, 06eh, 080h, 0f9h, 010h, 07dh, 005h, 0d3h, 0e8h
        db      0d1h, 0e8h, 0c3h, 080h, 0e9h, 010h, 026h, 0ach, 0d2h, 0e8h, 0d0h, 0e8h, 0c3h, 006h, 0b8h, 026h
        db      038h, 08eh, 0c0h, 0a1h, 077h, 06eh, 03bh, 006h, 075h, 06eh, 07dh, 040h, 0a1h, 077h, 06eh, 0b9h
        db      018h, 000h, 0f7h, 0e1h, 005h, 07ah, 07ch, 08bh, 0f0h, 026h, 080h, 07ch, 010h, 000h, 074h, 00bh
        db      083h, 0c6h, 00ch, 0e8h, 0b3h, 0ffh, 073h, 003h, 007h, 0f9h, 0cbh, 08bh, 01eh, 077h, 06eh, 03bh
        db      01eh, 0a5h, 06bh, 075h, 009h, 0a0h, 070h, 06eh, 03ah, 006h, 0a4h, 06bh, 074h, 02fh, 0ffh, 006h
        db      077h, 06eh, 08bh, 01eh, 077h, 06eh, 03bh, 01eh, 075h, 06eh, 07eh, 0c0h, 0a0h, 070h, 06eh, 03ah
        db      006h, 06eh, 06eh, 07ch, 005h, 0c6h, 006h, 070h, 06eh, 0ffh, 0feh, 006h, 070h, 06eh, 0c7h, 006h
        db      077h, 06eh, 000h, 000h, 006h, 09ah
        endif
        if      (XL) || (MODEL = 3000)
        dw      far_1f97e, SEG_MAIN
        db      007h, 0ebh, 09fh, 007h, 0f8h, 0cbh
fn_31807:
        push    es
        mov     di, A_3A60
        mov     es, di
        mov     di, A_62AA
        sub     ax, ax
        mov     cx, 17e8h
        rep stosw
        pop     es
        ret
fn_31819:
        push    es
        mov     cx, 5000h
        mov     es, cx
        xor     di, di
        mov     cx, 4b0h
        rep stosw
        pop     es
        ret
fn_31828:
        mov     word ptr [A_6B95], 0
br_3182e:
        mov     ax, word ptr [A_6B99]
        mov     es, ax
        mov     di, A_7494
        mov     si, word ptr [A_6B9B]
        cmp     byte ptr es:[si + 10h], 0
        jz      br_3184c
        mov     cx, 0ch
loop_31844:
        seges
        lodsb
        cmp     al, byte ptr [di]
        jz      br_318aa
        loop    loop_31844
br_3184c:
        cmp     word ptr [A_6B91], 0
        jnz     br_31856
        jmp     br_31926
br_31856:
        dec     word ptr [A_6B91]
        mov     dx, 0c000h
        mov     es, dx
        mov     si, 2
        xor     bh, bh
        mov     bl, byte ptr [A_6B94]
        shl     bl, 1
        mov     ax, word ptr es:[bx+si]
        xor     dx, dx
        mov     cx, 18h
        div     cx
        inc     word ptr [A_6B95]
        cmp     byte ptr [A_7F51], 2
        jnz     br_31889
        mov     ax, word ptr [A_7468]
        cmp     word ptr [A_6B95], ax
        jl      br_31899
        ret
br_31889:
        cmp     word ptr [A_6B95], ax
        jl      br_31899
        inc     byte ptr [A_6B94]
        mov     word ptr [A_6B95], 0
br_31899:
        add     word ptr [A_6B9B], 18h
        jz      br_318a2
        jnc     br_318a8
br_318a2:
        add     word ptr [A_6B99], 1000h
br_318a8:
        jmp     short br_3182e
br_318aa:
        mov     bx, si
        mov     dx, cx
loop_318ae:
        inc     di
        cmp     di, word ptr [A_6B9F]
        jz      br_318d0
        seges
        lodsb
        cmp     al, byte ptr [di]
        jnz     br_318bf
        loop    loop_318ae
        jmp     br_3184c
br_318bf:
        mov     di, A_7494
        mov     si, bx
        mov     cx, dx
        loop    br_318ca
        jmp     br_318cd
br_318ca:
        jmp     near loop_31844
br_318cd:
        jmp     near br_3184c
br_318d0:
        mov     si, word ptr [A_6B9B]
        mov     dx, word ptr [A_6B99]
        mov     es, dx
        mov     di, bp
        push    ds
        mov     cx, 5000h
        mov     ds, cx
        mov     cx, 18h
loop_318e5:
        mov     al, byte ptr es:[si]
        mov     byte ptr [di], al
        inc     di
        inc     si
        jnz     br_318f5
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_318f5:
        loop    loop_318e5
        pop     ds
        mov     bp, di
        mov     si, A_7DA0
        mov     bx, word ptr [A_6B9D]
        mov     al, byte ptr [A_6B93]
        mov     byte ptr [bx+si], al
        mov     si, A_7E04
        mov     al, byte ptr [A_6B94]
        mov     byte ptr [bx+si], al
        mov     si, A_7E68
        shl     bx, 1
        mov     ax, word ptr [A_6B95]
        mov     word ptr [bx+si], ax
        inc     word ptr [A_6B9D]
        cmp     word ptr [A_6B9D], 64h
        jz      br_31926
        jmp     br_3184c
br_31926:
        ret
far_31927:
        mov     word ptr [A_6B9D], 0
        call    fn_31807
        call    fn_31819
        mov     si, A_7494
        mov     cx, si
br_31938:
        lodsb
        cmp     al, 0ah
        jz      br_31940
        inc     cx
        jmp     br_31938
br_31940:
        mov     word ptr [A_6B9F], cx
        mov     bp, 0
        push    es
        mov     word ptr [A_6B99], 0c000h
        mov     word ptr [A_6B9B], 0d6h
        mov     cx, 0c000h
        mov     es, cx
        mov     si, 0
        mov     ax, word ptr es:[si]
        mov     word ptr [A_6B91], ax
        mov     al, byte ptr [A_737D]
        mov     byte ptr [A_6B93], al
        mov     byte ptr [A_6B94], 0
        call    fn_31828
        cmp     word ptr [A_6B9D], 64h
        jz      br_319c8
        mov     al, byte ptr [A_7FB9]
        cmp     byte ptr [A_6B94], al
        jle     br_319c8
        mov     al, byte ptr [A_7463]
        push    ax
        mov     al, byte ptr [A_6B94]
loop_31987:
        mov     byte ptr [A_7463], al
        mov     byte ptr [A_7F51], 2
        push    bp
        callf   SEG_MAIN:far_1f97e
        pop     bp
        mov     word ptr [A_6B99], A_3A60
        mov     word ptr [A_6B9B], A_62AA
        mov     ax, word ptr [A_7468]
        mov     word ptr [A_6B91], ax
        call    fn_31828
        cmp     word ptr [A_6B9D], 64h
        jz      br_319bf
        inc     byte ptr [A_6B94]
        mov     al, byte ptr [A_6B94]
        cmp     al, byte ptr [A_7461]
        jl      loop_31987
br_319bf:
        pop     ax
        mov     byte ptr [A_7463], al
        mov     byte ptr [A_7F51], 1
br_319c8:
        mov     si, 0
        mov     di, A_62AA
        mov     cx, A_3A60
        mov     es, cx
        push    ds
        mov     cx, 5000h
        mov     ds, cx
        mov     cx, 960h
        rep movsb
        pop     ds
        pop     es
        retf
far_319e1:
        mov     cx, 18h
        mul     cx
        mov     bx, ax
        push    es
        mov     word ptr [A_6B99], 0c000h
        mov     word ptr [A_6B9B], 0d6h
        mov     cx, 0c000h
        mov     es, cx
        mov     si, 2
        xor     ch, ch
        mov     cl, byte ptr [A_7463]
        cmp     cl, 0
        jz      br_31a1a
loop_31a08:
        seges
        lodsw
        add     word ptr [A_6B9B], ax
        jz      br_31a12
        jnc     br_31a18
br_31a12:
        add     word ptr [A_6B99], 1000h
br_31a18:
        loop    loop_31a08
br_31a1a:
        mov     si, word ptr [A_6B9B]
        add     si, bx
        jz      br_31a24
        jnc     br_31a2a
br_31a24:
        add     word ptr [A_6B99], 1000h
br_31a2a:
        mov     dx, word ptr [A_6B99]
        mov     es, dx
        call    fn_31a55
        cmp     byte ptr [A_6B90], 1
        jnz     br_31a4f
        mov     dx, A_3A60
        mov     es, dx
        mov     si, A_62AA
        mov     ax, word ptr [A_6B97]
        mov     dx, 18h
        mul     dx
        add     si, ax
        call    fn_31a55
br_31a4f:
        pop     es
        retf
far_31a51:
        call    fn_31a55
        retf
fn_31a55:
        add     si, 0ch
        mov     ax, word ptr es:[si]
        mov     bx, 1
        mov     cl, byte ptr [A_746F]
        cmp     cl, 10h
        jge     br_31a6f
        shl     bx, cl
        xor     ax, bx
        mov     word ptr es:[si], ax
        ret
br_31a6f:
        sub     cl, 10h
        inc     si
        inc     si
        mov     al, byte ptr es:[si]
        shl     bl, cl
        xor     al, bl
        mov     byte ptr es:[si], al
        ret
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      000h, 0c7h, 006h, 0ffh, 086h, 000h, 0c0h, 0c7h, 006h, 001h, 087h, 000h, 0d0h, 0c7h, 006h, 003h
        db      087h, 000h, 0e0h, 0c6h, 006h, 0c3h, 086h, 000h, 0c6h, 006h, 051h, 07fh, 000h, 0c6h, 006h, 0aeh
        db      072h, 000h, 0b0h, 00dh, 09ah, 020h, 0fch, 0f6h, 00fh, 0e8h, 083h, 024h, 03ch, 001h, 074h, 002h
        db      0ebh, 04dh, 0e8h, 00ah, 001h, 0bbh, 01ch, 0ceh, 0e8h, 09fh, 020h, 0beh, 0beh, 0b9h, 0b3h, 019h
        db      0b7h, 019h, 0e8h, 0cdh, 00ch, 0c7h, 006h, 090h, 086h, 000h, 000h, 0c6h, 006h, 094h, 086h, 000h
        db      0c6h, 006h, 095h, 086h, 000h, 0e8h, 0e9h, 091h, 0e8h, 05ah, 00ah, 0e8h, 03ah, 00ah, 0a1h, 090h
        db      086h, 0e8h, 09ch, 00ah, 0ffh, 016h, 029h, 087h, 0bbh, 0d0h, 0ddh, 0e8h, 06ch, 020h, 0e8h, 0d0h
        db      091h, 0c6h, 006h, 0b0h, 086h, 001h, 0c6h, 006h, 0f1h, 07fh, 001h, 08ch, 0d8h, 08eh, 0c0h, 0cbh
        db      0c6h, 006h, 0c3h, 086h, 000h, 0c6h, 006h, 0b0h, 086h, 000h, 0c6h, 006h, 064h, 07fh, 000h, 0c6h
        db      006h, 0abh, 083h, 000h, 0bbh, 013h, 0ceh, 0e8h, 040h, 020h, 0c6h, 006h, 0aeh, 072h, 0c7h, 08ch
        elseif  (XL) && (FW_VERSION = 150)
        db      000h, 0c7h, 006h, 0dfh, 086h, 000h, 0c0h, 0c7h, 006h, 0e1h, 086h, 000h, 0d0h, 0c7h, 006h, 0e3h
        db      086h, 000h, 0e0h, 0c6h, 006h, 0a3h, 086h, 000h, 0c6h, 006h, 041h, 07fh, 000h, 0c6h, 006h, 09eh
        db      072h, 000h, 0b0h, 00dh, 09ah, 030h, 0fbh, 0f4h, 00fh, 0e8h, 083h, 024h, 03ch, 001h, 074h, 002h
        db      0ebh, 04dh, 0e8h, 00ah, 001h, 0bbh, 01ch, 0ceh, 0e8h, 09fh, 020h, 0beh, 09eh, 0b9h, 0b3h, 019h
        db      0b7h, 019h, 0e8h, 0cdh, 00ch, 0c7h, 006h, 070h, 086h, 000h, 000h, 0c6h, 006h, 074h, 086h, 000h
        db      0c6h, 006h, 075h, 086h, 000h, 0e8h, 0e9h, 091h, 0e8h, 05ah, 00ah, 0e8h, 03ah, 00ah, 0a1h, 070h
        db      086h, 0e8h, 09ch, 00ah, 0ffh, 016h, 009h, 087h, 0bbh, 0d0h, 0ddh, 0e8h, 06ch, 020h, 0e8h, 0d0h
        db      091h, 0c6h, 006h, 090h, 086h, 001h, 0c6h, 006h, 0e1h, 07fh, 001h, 08ch, 0d8h, 08eh, 0c0h, 0cbh
        db      0c6h, 006h, 0a3h, 086h, 000h, 0c6h, 006h, 090h, 086h, 000h, 0c6h, 006h, 054h, 07fh, 000h, 0c6h
        db      006h, 09bh, 083h, 000h, 0bbh, 013h, 0ceh, 0e8h, 040h, 020h, 0c6h, 006h, 09eh, 072h, 0c7h, 08ch
        elseif  (XL) && (MODEL = 3200)
        db      000h, 0c7h, 006h, 08fh, 087h, 000h, 0c0h, 0c7h, 006h, 091h, 087h, 000h, 0d0h, 0c7h, 006h, 093h
        db      087h, 000h, 0e0h, 0c6h, 006h, 053h, 087h, 000h, 0c6h, 006h, 081h, 07fh, 000h, 0c6h, 006h, 0deh
        db      072h, 000h, 0b0h, 00dh, 09ah, 0b0h, 0fch, 0ffh, 00fh, 0e8h, 083h, 024h, 03ch, 001h, 074h, 002h
        db      0ebh, 04dh, 0e8h, 00ah, 001h, 0bbh, 0ech, 0d3h, 0e8h, 09fh, 020h, 0beh, 04eh, 0bah, 0b3h, 019h
        db      0b7h, 019h, 0e8h, 0cdh, 00ch, 0c7h, 006h, 020h, 087h, 000h, 000h, 0c6h, 006h, 024h, 087h, 000h
        db      0c6h, 006h, 025h, 087h, 000h, 0e8h, 069h, 08ch, 0e8h, 05ah, 00ah, 0e8h, 03ah, 00ah, 0a1h, 020h
        db      087h, 0e8h, 09ch, 00ah, 0ffh, 016h, 0b9h, 087h, 0bbh, 0a0h, 0e3h, 0e8h, 06ch, 020h, 0e8h, 050h
        db      08ch, 0c6h, 006h, 040h, 087h, 001h, 0c6h, 006h, 021h, 080h, 001h, 08ch, 0d8h, 08eh, 0c0h, 0cbh
        db      0c6h, 006h, 053h, 087h, 000h, 0c6h, 006h, 040h, 087h, 000h, 0c6h, 006h, 094h, 07fh, 000h, 0c6h
        db      006h, 0dbh, 083h, 000h, 0bbh, 0e3h, 0d3h, 0e8h, 040h, 020h, 0c6h, 006h, 0deh, 072h, 0c7h, 08ch
        elseif  (XL) && (FW_VERSION < 150)
        db      000h, 0c7h, 006h, 03fh, 086h, 000h, 0c0h, 0c7h, 006h, 041h, 086h, 000h, 0d0h, 0c7h, 006h, 043h
        db      086h, 000h, 0e0h, 0c6h, 006h, 003h, 086h, 000h, 0c6h, 006h, 0a1h, 07eh, 000h, 0c6h, 006h, 0feh
        db      071h, 000h, 0b0h, 00dh, 09ah, 0a0h, 0f7h, 0e4h, 00fh, 0e8h, 087h, 024h, 03ch, 001h, 074h, 002h
        db      0ebh, 04dh, 0e8h, 00ah, 001h, 0bbh, 08ch, 0cdh, 0e8h, 0a3h, 020h, 0beh, 09eh, 0b8h, 0b3h, 019h
        db      0b7h, 019h, 0e8h, 0cdh, 00ch, 0c7h, 006h, 0d0h, 085h, 000h, 000h, 0c6h, 006h, 0d4h, 085h, 000h
        db      0c6h, 006h, 0d5h, 085h, 000h, 0e8h, 0e9h, 091h, 0e8h, 05ah, 00ah, 0e8h, 03ah, 00ah, 0a1h, 0d0h
        db      085h, 0e8h, 09ch, 00ah, 0ffh, 016h, 069h, 086h, 0bbh, 044h, 0ddh, 0e8h, 070h, 020h, 0e8h, 0d0h
        db      091h, 0c6h, 006h, 0f0h, 085h, 001h, 0c6h, 006h, 041h, 07fh, 001h, 08ch, 0d8h, 08eh, 0c0h, 0cbh
        db      0c6h, 006h, 003h, 086h, 000h, 0c6h, 006h, 0f0h, 085h, 000h, 0c6h, 006h, 0b4h, 07eh, 000h, 0c6h
        db      006h, 0fbh, 082h, 000h, 0bbh, 083h, 0cdh, 0e8h, 044h, 020h, 0c6h, 006h, 0feh, 071h, 0c7h, 08ch
        endif
        if      XL
        db      0d8h, 08eh, 0c0h, 0cbh, 08ch, 040h, 01bh, 009h, 08dh, 040h, 001h, 037h, 0ffh, 083h, 081h, 092h
        db      058h, 002h, 002h, 092h, 058h, 002h, 003h, 092h, 058h, 002h, 004h, 092h, 058h, 002h, 005h, 092h
        db      058h, 002h, 006h, 092h, 058h, 002h, 007h, 092h, 058h, 002h, 008h, 092h, 058h, 002h, 009h, 092h
        db      058h, 002h, 00ah, 085h, 08ah, 005h, 003h
        db      "Roland  CD-ROM"
        db      084h, 092h, 05ch, 000h, 000h, 092h, 05ch, 000h, 00ch, 093h, 00dh, 000h, 000h, 093h, 00dh, 05bh
        db      000h, 08ah, 00ah, 00fh
        db      "[[ Volume ]]"
        db      092h, 062h, 000h, 017h, 092h, 062h, 000h, 021h, 093h, 00bh, 000h, 017h, 093h, 00bh, 062h, 017h
        db      093h, 00bh, 015h, 017h, 092h, 006h, 063h, 01bh, 093h, 028h, 069h, 006h, 092h, 00ah, 069h, 006h
        db      092h, 00ah, 069h, 00eh, 092h, 00ah, 069h, 016h, 092h, 00ah, 069h, 01eh, 092h, 00ah, 069h, 026h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      092h, 00ah, 069h, 02eh, 092h, 0f0h, 000h, 036h, 0ffh, 0c3h, 0e8h, 037h, 020h, 0d0h, 0ceh, 0f9h
        db      0ceh, 0feh, 0ceh, 005h, 0efh, 003h, 0cfh, 005h, 0cfh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 005h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0efh, 005h, 0efh, 005h, 0efh, 065h, 0cfh, 036h, 0cfh, 0d0h, 0ddh, 0c3h, 08bh, 01eh, 090h, 086h
        db      003h, 0c3h, 079h, 002h, 02bh, 0c0h, 03bh, 006h, 092h, 086h, 072h, 004h, 0a1h, 092h, 086h, 048h
        db      0a3h, 090h, 086h, 03bh, 0c3h, 074h, 00dh, 0e8h, 081h, 009h, 0c6h, 006h, 094h, 086h, 000h, 0c6h
        db      006h, 095h, 086h, 000h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 0d2h, 0b8h, 001h, 000h, 0ebh, 0cdh, 0ebh
        db      06fh, 006h, 0a1h, 090h, 086h, 024h, 07fh, 0feh, 0c0h, 0b3h, 002h, 0b7h, 019h, 0e8h, 0aah, 00bh
        db      08ch, 0d8h, 08eh, 0c0h, 0beh, 0c4h, 0bch, 0b3h, 019h, 0b7h, 019h, 0e8h, 05fh, 00bh, 0e8h, 0e4h
        elseif  (XL) && (FW_VERSION = 150)
        db      0efh, 005h, 0efh, 005h, 0efh, 065h, 0cfh, 036h, 0cfh, 0d0h, 0ddh, 0c3h, 08bh, 01eh, 070h, 086h
        db      003h, 0c3h, 079h, 002h, 02bh, 0c0h, 03bh, 006h, 072h, 086h, 072h, 004h, 0a1h, 072h, 086h, 048h
        db      0a3h, 070h, 086h, 03bh, 0c3h, 074h, 00dh, 0e8h, 081h, 009h, 0c6h, 006h, 074h, 086h, 000h, 0c6h
        db      006h, 075h, 086h, 000h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 0d2h, 0b8h, 001h, 000h, 0ebh, 0cdh, 0ebh
        db      06fh, 006h, 0a1h, 070h, 086h, 024h, 07fh, 0feh, 0c0h, 0b3h, 002h, 0b7h, 019h, 0e8h, 0aah, 00bh
        db      08ch, 0d8h, 08eh, 0c0h, 0beh, 0a4h, 0bch, 0b3h, 019h, 0b7h, 019h, 0e8h, 05fh, 00bh, 0e8h, 0e4h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      000h, 0bbh, 02dh, 0cfh, 0e8h, 01eh, 01fh, 007h, 0c3h, 08ch, 060h, 04ch, 009h, 08dh, 060h, 016h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      018h, 0ffh, 0b0h, 00dh, 0e8h, 05fh, 023h, 02bh, 0c0h, 0a0h, 094h, 086h, 08ah, 026h, 095h, 086h
        db      050h, 0c6h, 006h, 095h, 086h, 000h, 0a2h, 094h, 086h, 050h, 0e8h, 06ah, 001h, 058h, 072h, 008h
        db      0feh, 0c0h, 03ah, 006h, 096h, 086h, 075h, 0eeh, 058h, 0a2h, 094h, 086h, 088h, 026h, 095h, 086h
        db      0c3h, 0c7h, 006h, 0fbh, 086h, 036h, 0cfh, 0c7h, 006h, 0fdh, 086h, 0aeh, 0ceh, 0e9h, 02bh, 011h
        elseif  (XL) && (FW_VERSION = 150)
        db      018h, 0ffh, 0b0h, 00dh, 0e8h, 05fh, 023h, 02bh, 0c0h, 0a0h, 074h, 086h, 08ah, 026h, 075h, 086h
        db      050h, 0c6h, 006h, 075h, 086h, 000h, 0a2h, 074h, 086h, 050h, 0e8h, 06ah, 001h, 058h, 072h, 008h
        db      0feh, 0c0h, 03ah, 006h, 076h, 086h, 075h, 0eeh, 058h, 0a2h, 074h, 086h, 088h, 026h, 075h, 086h
        db      0c3h, 0c7h, 006h, 0dbh, 086h, 036h, 0cfh, 0c7h, 006h, 0ddh, 086h, 0aeh, 0ceh, 0e9h, 02bh, 011h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0e8h, 071h, 01fh, 096h, 0cfh, 0f4h, 0cfh, 0f9h, 0cfh, 0feh, 0cfh, 005h, 0efh, 009h, 0d0h, 005h
        db      0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 0ach, 0d0h, 001h, 0d0h, 0d0h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0ddh, 0c3h, 0d0h, 0e4h, 072h, 03bh, 080h, 03eh, 095h, 086h, 005h, 074h, 01dh, 002h, 006h, 095h
        db      086h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 03ah, 006h, 096h, 086h, 072h, 009h, 0a0h, 096h, 086h
        db      03ch, 000h, 074h, 002h, 0feh, 0c8h, 0a2h, 095h, 086h, 0c3h, 002h, 006h, 094h, 086h, 08ah, 026h
        db      096h, 086h, 080h, 0ech, 005h, 03ah, 0c4h, 072h, 004h, 08ah, 0c4h, 0feh, 0c8h, 0a2h, 094h, 086h
        db      0c3h, 080h, 03eh, 095h, 086h, 000h, 074h, 00ch, 002h, 006h, 095h, 086h, 079h, 002h, 02ah, 0c0h
        db      0a2h, 095h, 086h, 0c3h, 002h, 006h, 094h, 086h, 079h, 002h, 02ah, 0c0h, 0a2h, 094h, 086h, 0c3h
        elseif  (XL) && (FW_VERSION = 150)
        db      0ddh, 0c3h, 0d0h, 0e4h, 072h, 03bh, 080h, 03eh, 075h, 086h, 005h, 074h, 01dh, 002h, 006h, 075h
        db      086h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 03ah, 006h, 076h, 086h, 072h, 009h, 0a0h, 076h, 086h
        db      03ch, 000h, 074h, 002h, 0feh, 0c8h, 0a2h, 075h, 086h, 0c3h, 002h, 006h, 074h, 086h, 08ah, 026h
        db      076h, 086h, 080h, 0ech, 005h, 03ah, 0c4h, 072h, 004h, 08ah, 0c4h, 0feh, 0c8h, 0a2h, 074h, 086h
        db      0c3h, 080h, 03eh, 075h, 086h, 000h, 074h, 00ch, 002h, 006h, 075h, 086h, 079h, 002h, 02ah, 0c0h
        db      0a2h, 075h, 086h, 0c3h, 002h, 006h, 074h, 086h, 079h, 002h, 02ah, 0c0h, 0a2h, 074h, 086h, 0c3h
        elseif  (XL) && (MODEL = 3200)
        db      092h, 00ah, 069h, 02eh, 092h, 0f0h, 000h, 036h, 0ffh, 0c3h, 0e8h, 037h, 020h, 0a0h, 0d4h, 0c9h
        db      0d4h, 0ceh, 0d4h, 0d5h, 0f4h, 0d3h, 0d4h, 0d5h, 0d4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h
        db      0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 035h, 0d5h, 006h, 0d5h, 0a0h, 0e3h, 0c3h, 08bh, 01eh, 020h, 087h
        db      003h, 0c3h, 079h, 002h, 02bh, 0c0h, 03bh, 006h, 022h, 087h, 072h, 004h, 0a1h, 022h, 087h, 048h
        db      0a3h, 020h, 087h, 03bh, 0c3h, 074h, 00dh, 0e8h, 081h, 009h, 0c6h, 006h, 024h, 087h, 000h, 0c6h
        db      006h, 025h, 087h, 000h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 0d2h, 0b8h, 001h, 000h, 0ebh, 0cdh, 0ebh
        db      06fh, 006h, 0a1h, 020h, 087h, 024h, 07fh, 0feh, 0c0h, 0b3h, 002h, 0b7h, 019h, 0e8h, 0aah, 00bh
        db      08ch, 0d8h, 08eh, 0c0h, 0beh, 054h, 0bdh, 0b3h, 019h, 0b7h, 019h, 0e8h, 05fh, 00bh, 0e8h, 0e4h
        db      000h, 0bbh, 0fdh, 0d4h, 0e8h, 01eh, 01fh, 007h, 0c3h, 08ch, 060h, 04ch, 009h, 08dh, 060h, 016h
        db      018h, 0ffh, 0b0h, 00dh, 0e8h, 05fh, 023h, 02bh, 0c0h, 0a0h, 024h, 087h, 08ah, 026h, 025h, 087h
        db      050h, 0c6h, 006h, 025h, 087h, 000h, 0a2h, 024h, 087h, 050h, 0e8h, 06ah, 001h, 058h, 072h, 008h
        db      0feh, 0c0h, 03ah, 006h, 026h, 087h, 075h, 0eeh, 058h, 0a2h, 024h, 087h, 088h, 026h, 025h, 087h
        db      0c3h, 0c7h, 006h, 08bh, 087h, 006h, 0d5h, 0c7h, 006h, 08dh, 087h, 07eh, 0d4h, 0e9h, 02bh, 011h
        db      0e8h, 071h, 01fh, 066h, 0d5h, 0c4h, 0d5h, 0c9h, 0d5h, 0ceh, 0d5h, 0d5h, 0f4h, 0d9h, 0d5h, 0d5h
        db      0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 07ch, 0d6h, 0d1h, 0d5h, 0a0h
        db      0e3h, 0c3h, 0d0h, 0e4h, 072h, 03bh, 080h, 03eh, 025h, 087h, 005h, 074h, 01dh, 002h, 006h, 025h
        db      087h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 03ah, 006h, 026h, 087h, 072h, 009h, 0a0h, 026h, 087h
        db      03ch, 000h, 074h, 002h, 0feh, 0c8h, 0a2h, 025h, 087h, 0c3h, 002h, 006h, 024h, 087h, 08ah, 026h
        db      026h, 087h, 080h, 0ech, 005h, 03ah, 0c4h, 072h, 004h, 08ah, 0c4h, 0feh, 0c8h, 0a2h, 024h, 087h
        db      0c3h, 080h, 03eh, 025h, 087h, 000h, 074h, 00ch, 002h, 006h, 025h, 087h, 079h, 002h, 02ah, 0c0h
        db      0a2h, 025h, 087h, 0c3h, 002h, 006h, 024h, 087h, 079h, 002h, 02ah, 0c0h, 0a2h, 024h, 087h, 0c3h
        elseif  (XL) && (FW_VERSION < 150)
        db      092h, 00ah, 069h, 02eh, 092h, 0f0h, 000h, 036h, 0ffh, 0c3h, 0e8h, 03bh, 020h, 040h, 0ceh, 069h
        db      0ceh, 06eh, 0ceh, 079h, 0eeh, 073h, 0ceh, 075h, 0ceh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h
        db      0eeh, 079h, 0eeh, 079h, 0eeh, 0d5h, 0ceh, 0a6h, 0ceh, 044h, 0ddh, 0c3h, 08bh, 01eh, 0d0h, 085h
        db      003h, 0c3h, 079h, 002h, 02bh, 0c0h, 03bh, 006h, 0d2h, 085h, 072h, 004h, 0a1h, 0d2h, 085h, 048h
        db      0a3h, 0d0h, 085h, 03bh, 0c3h, 074h, 00dh, 0e8h, 081h, 009h, 0c6h, 006h, 0d4h, 085h, 000h, 0c6h
        db      006h, 0d5h, 085h, 000h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 0d2h, 0b8h, 001h, 000h, 0ebh, 0cdh, 0ebh
        db      06fh, 006h, 0a1h, 0d0h, 085h, 024h, 07fh, 0feh, 0c0h, 0b3h, 002h, 0b7h, 019h, 0e8h, 0aah, 00bh
        db      08ch, 0d8h, 08eh, 0c0h, 0beh, 0a4h, 0bbh, 0b3h, 019h, 0b7h, 019h, 0e8h, 05fh, 00bh, 0e8h, 0e4h
        db      000h, 0bbh, 09dh, 0ceh, 0e8h, 022h, 01fh, 007h, 0c3h, 08ch, 060h, 04ch, 009h, 08dh, 060h, 016h
        db      018h, 0ffh, 0b0h, 00dh, 0e8h, 063h, 023h, 02bh, 0c0h, 0a0h, 0d4h, 085h, 08ah, 026h, 0d5h, 085h
        db      050h, 0c6h, 006h, 0d5h, 085h, 000h, 0a2h, 0d4h, 085h, 050h, 0e8h, 06ah, 001h, 058h, 072h, 008h
        db      0feh, 0c0h, 03ah, 006h, 0d6h, 085h, 075h, 0eeh, 058h, 0a2h, 0d4h, 085h, 088h, 026h, 0d5h, 085h
        db      0c3h, 0c7h, 006h, 03bh, 086h, 0a6h, 0ceh, 0c7h, 006h, 03dh, 086h, 01eh, 0ceh, 0e9h, 02fh, 011h
        db      0e8h, 075h, 01fh, 006h, 0cfh, 064h, 0cfh, 069h, 0cfh, 06eh, 0cfh, 079h, 0eeh, 079h, 0cfh, 079h
        db      0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 01ch, 0d0h, 071h, 0cfh, 044h
        db      0ddh, 0c3h, 0d0h, 0e4h, 072h, 03bh, 080h, 03eh, 0d5h, 085h, 005h, 074h, 01dh, 002h, 006h, 0d5h
        db      085h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 03ah, 006h, 0d6h, 085h, 072h, 009h, 0a0h, 0d6h, 085h
        db      03ch, 000h, 074h, 002h, 0feh, 0c8h, 0a2h, 0d5h, 085h, 0c3h, 002h, 006h, 0d4h, 085h, 08ah, 026h
        db      0d6h, 085h, 080h, 0ech, 005h, 03ah, 0c4h, 072h, 004h, 08ah, 0c4h, 0feh, 0c8h, 0a2h, 0d4h, 085h
        db      0c3h, 080h, 03eh, 0d5h, 085h, 000h, 074h, 00ch, 002h, 006h, 0d5h, 085h, 079h, 002h, 02ah, 0c0h
        db      0a2h, 0d5h, 085h, 0c3h, 002h, 006h, 0d4h, 085h, 079h, 002h, 02ah, 0c0h, 0a2h, 0d4h, 085h, 0c3h
        endif
        if      XL
        db      0b8h, 0ffh, 0ffh, 0ebh, 09dh, 0b8h, 001h, 000h, 0ebh, 098h, 0e9h, 0adh, 0feh, 0b0h, 00dh, 0e8h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      094h, 022h, 0e9h, 0b2h, 000h, 006h, 0bbh, 0d0h, 0ddh, 0e8h, 039h, 01eh, 0e8h, 005h, 000h, 0e8h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      058h, 000h, 007h, 0c3h, 0bfh, 0c0h, 0bdh, 0a0h, 094h, 086h, 02ah, 0e4h, 0d1h, 0e0h, 003h, 0f8h
        elseif  (XL) && (FW_VERSION = 150)
        db      058h, 000h, 007h, 0c3h, 0bfh, 0a0h, 0bdh, 0a0h, 074h, 086h, 02ah, 0e4h, 0d1h, 0e0h, 003h, 0f8h
        elseif  (XL) && (MODEL = 3200)
        db      094h, 022h, 0e9h, 0b2h, 000h, 006h, 0bbh, 0a0h, 0e3h, 0e8h, 039h, 01eh, 0e8h, 005h, 000h, 0e8h
        db      058h, 000h, 007h, 0c3h, 0bfh, 050h, 0beh, 0a0h, 024h, 087h, 02ah, 0e4h, 0d1h, 0e0h, 003h, 0f8h
        elseif  (XL) && (FW_VERSION < 150)
        db      098h, 022h, 0e9h, 0b2h, 000h, 006h, 0bbh, 044h, 0ddh, 0e8h, 03dh, 01eh, 0e8h, 005h, 000h, 0e8h
        db      058h, 000h, 007h, 0c3h, 0bfh, 0a0h, 0bch, 0a0h, 0d4h, 085h, 02ah, 0e4h, 0d1h, 0e0h, 003h, 0f8h
        endif
        if      XL
        db      0b9h, 006h, 000h, 0b3h, 078h, 0b7h, 002h, 08bh, 005h, 047h, 047h, 03dh, 0ffh, 0ffh, 074h, 01ah
        db      051h, 0b9h, 020h, 000h, 0f7h, 0e1h, 005h, 004h, 080h, 08bh, 0f0h, 0b8h, 000h, 0c0h, 08eh, 0c0h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0e8h, 03ah, 00ah, 080h, 0c7h, 008h, 059h, 0e2h, 0deh, 0c3h, 08ch, 0c8h, 08eh, 0c0h, 0beh, 05eh
        db      0d0h, 0e8h, 029h, 00ah, 080h, 0c7h, 008h, 0e2h, 0f1h, 0c3h, 020h, 020h, 020h, 020h, 020h, 020h
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 0bbh, 089h, 0d0h, 0e8h, 0d5h, 01dh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0a0h, 095h, 086h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 0b4h, 005h, 0f6h, 0e4h, 005h, 08eh, 0d0h
        elseif  (XL) && (FW_VERSION = 150)
        db      0a0h, 075h, 086h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 0b4h, 005h, 0f6h, 0e4h, 005h, 08eh, 0d0h
        elseif  (XL) && (MODEL = 3200)
        db      0e8h, 03ah, 00ah, 080h, 0c7h, 008h, 059h, 0e2h, 0deh, 0c3h, 08ch, 0c8h, 08eh, 0c0h, 0beh, 02eh
        db      0d6h, 0e8h, 029h, 00ah, 080h, 0c7h, 008h, 0e2h, 0f1h, 0c3h, 020h, 020h, 020h, 020h, 020h, 020h
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 0bbh, 059h, 0d6h, 0e8h, 0d5h, 01dh
        db      0a0h, 025h, 087h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 0b4h, 005h, 0f6h, 0e4h, 005h, 05eh, 0d6h
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      08bh, 0d8h, 0e9h, 0c0h, 01dh, 08ch, 060h, 04eh, 009h, 0ffh, 08dh, 060h, 074h, 001h, 0ffh, 08dh
        elseif  (XL) && (FW_VERSION < 150)
        db      0e8h, 03ah, 00ah, 080h, 0c7h, 008h, 059h, 0e2h, 0deh, 0c3h, 08ch, 0c8h, 08eh, 0c0h, 0beh, 0ceh
        db      0cfh, 0e8h, 029h, 00ah, 080h, 0c7h, 008h, 0e2h, 0f1h, 0c3h, 020h, 020h, 020h, 020h, 020h, 020h
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 0bbh, 0f9h, 0cfh, 0e8h, 0d9h, 01dh
        db      0a0h, 0d5h, 085h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 0b4h, 005h, 0f6h, 0e4h, 005h, 0feh, 0cfh
        db      08bh, 0d8h, 0e9h, 0c4h, 01dh, 08ch, 060h, 04eh, 009h, 0ffh, 08dh, 060h, 074h, 001h, 0ffh, 08dh
        endif
        if      XL
        db      060h, 074h, 009h, 0ffh, 08dh, 060h, 074h, 011h, 0ffh, 08dh, 060h, 074h, 019h, 0ffh, 08dh, 060h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      074h, 021h, 0ffh, 08dh, 060h, 074h, 029h, 0ffh, 0c7h, 006h, 0fbh, 086h, 001h, 0d0h, 0c7h, 006h
        db      0fdh, 086h, 074h, 0cfh, 0e9h, 0e4h, 00fh, 0bbh, 006h, 0e1h, 0e8h, 088h, 01dh, 0c6h, 006h, 0c2h
        db      086h, 000h, 0a0h, 094h, 086h, 002h, 006h, 095h, 086h, 02ah, 0e4h, 0d1h, 0e0h, 005h, 0c0h, 0bdh
        db      08bh, 0f8h, 08bh, 005h, 0e8h, 0cah, 007h, 0beh, 0c4h, 0beh, 0e8h, 08ch, 009h, 0e8h, 0bch, 008h
        db      0beh, 01dh, 0efh, 0bfh, 0c0h, 0b9h, 0e8h, 02dh, 00ah, 0beh, 0c4h, 0beh, 0bfh, 0c3h, 0b9h, 0e8h
        db      03bh, 00ah, 0e8h, 059h, 006h, 073h, 002h, 0f8h, 0c3h, 0e8h, 048h, 001h, 0beh, 0c0h, 0b9h, 0e8h
        db      041h, 01ah, 0a3h, 09bh, 086h, 0a3h, 099h, 086h, 0beh, 0c0h, 0bfh, 0b1h, 000h, 02ah, 0edh, 08bh
        elseif  (XL) && (FW_VERSION = 150)
        db      074h, 021h, 0ffh, 08dh, 060h, 074h, 029h, 0ffh, 0c7h, 006h, 0dbh, 086h, 001h, 0d0h, 0c7h, 006h
        db      0ddh, 086h, 074h, 0cfh, 0e9h, 0e4h, 00fh, 0bbh, 006h, 0e1h, 0e8h, 088h, 01dh, 0c6h, 006h, 0a2h
        db      086h, 000h, 0a0h, 074h, 086h, 002h, 006h, 075h, 086h, 02ah, 0e4h, 0d1h, 0e0h, 005h, 0a0h, 0bdh
        db      08bh, 0f8h, 08bh, 005h, 0e8h, 0cah, 007h, 0beh, 0a4h, 0beh, 0e8h, 08ch, 009h, 0e8h, 0bch, 008h
        db      0beh, 01dh, 0efh, 0bfh, 0a0h, 0b9h, 0e8h, 02dh, 00ah, 0beh, 0a4h, 0beh, 0bfh, 0a3h, 0b9h, 0e8h
        db      03bh, 00ah, 0e8h, 059h, 006h, 073h, 002h, 0f8h, 0c3h, 0e8h, 048h, 001h, 0beh, 0a0h, 0b9h, 0e8h
        db      041h, 01ah, 0a3h, 07bh, 086h, 0a3h, 079h, 086h, 0beh, 0a0h, 0bfh, 0b1h, 000h, 02ah, 0edh, 08bh
        elseif  (XL) && (MODEL = 3200)
        db      074h, 021h, 0ffh, 08dh, 060h, 074h, 029h, 0ffh, 0c7h, 006h, 08bh, 087h, 0d1h, 0d5h, 0c7h, 006h
        db      08dh, 087h, 044h, 0d5h, 0e9h, 0e4h, 00fh, 0bbh, 0d6h, 0e6h, 0e8h, 088h, 01dh, 0c6h, 006h, 052h
        db      087h, 000h, 0a0h, 024h, 087h, 002h, 006h, 025h, 087h, 02ah, 0e4h, 0d1h, 0e0h, 005h, 050h, 0beh
        db      08bh, 0f8h, 08bh, 005h, 0e8h, 0cah, 007h, 0beh, 054h, 0bfh, 0e8h, 08ch, 009h, 0e8h, 0bch, 008h
        db      0beh, 0edh, 0f4h, 0bfh, 050h, 0bah, 0e8h, 02dh, 00ah, 0beh, 054h, 0bfh, 0bfh, 053h, 0bah, 0e8h
        db      03bh, 00ah, 0e8h, 059h, 006h, 073h, 002h, 0f8h, 0c3h, 0e8h, 048h, 001h, 0beh, 050h, 0bah, 0e8h
        db      041h, 01ah, 0a3h, 02bh, 087h, 0a3h, 029h, 087h, 0beh, 050h, 0c0h, 0b1h, 000h, 02ah, 0edh, 08bh
        elseif  (XL) && (FW_VERSION < 150)
        db      074h, 021h, 0ffh, 08dh, 060h, 074h, 029h, 0ffh, 0c7h, 006h, 03bh, 086h, 071h, 0cfh, 0c7h, 006h
        db      03dh, 086h, 0e4h, 0ceh, 0e9h, 0e8h, 00fh, 0bbh, 07ah, 0e0h, 0e8h, 08ch, 01dh, 0c6h, 006h, 002h
        db      086h, 000h, 0a0h, 0d4h, 085h, 002h, 006h, 0d5h, 085h, 02ah, 0e4h, 0d1h, 0e0h, 005h, 0a0h, 0bch
        db      08bh, 0f8h, 08bh, 005h, 0e8h, 0cah, 007h, 0beh, 0a4h, 0bdh, 0e8h, 08ch, 009h, 0e8h, 0bch, 008h
        db      0beh, 091h, 0eeh, 0bfh, 0a0h, 0b8h, 0e8h, 02dh, 00ah, 0beh, 0a4h, 0bdh, 0bfh, 0a3h, 0b8h, 0e8h
        db      03bh, 00ah, 0e8h, 059h, 006h, 073h, 002h, 0f8h, 0c3h, 0e8h, 048h, 001h, 0beh, 0a0h, 0b8h, 0e8h
        db      045h, 01ah, 0a3h, 0ddh, 085h, 0a3h, 0dbh, 085h, 0beh, 0a0h, 0beh, 0b1h, 000h, 02ah, 0edh, 08bh
        endif
        if      XL
        db      004h, 03dh, 0ffh, 0ffh, 075h, 00ch, 046h, 046h, 0feh, 0c1h, 080h, 0f9h, 058h, 075h, 0f0h, 0e9h
        db      0bdh, 000h
        db      "VPQQ"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0e8h, 08ah, 007h, 0beh, 0ddh, 0efh, 0bfh, 0c0h, 0bah, 0e8h, 0e4h, 009h, 059h, 08ah, 0c1h, 004h
        db      015h, 088h, 045h, 003h, 0e8h, 046h, 001h, 0beh, 0d0h, 0c0h, 0bfh, 0e2h, 0bah, 0e8h, 048h, 002h
        db      072h, 07ah, 080h, 03eh, 0d2h, 0c0h, 000h, 075h, 00fh, 0c6h, 006h, 044h, 0bbh, 001h, 0b0h, 03ch
        db      02ah, 006h, 0c2h, 0bbh, 028h, 006h, 0f1h, 0bah, 0beh, 0e0h, 0c0h, 0bfh, 0fah, 0bah, 0e8h, 027h
        db      002h, 072h, 059h, 080h, 03eh, 0e2h, 0c0h, 000h, 075h, 00fh, 0c6h, 006h, 045h, 0bbh, 001h, 0b0h
        db      03ch, 02ah, 006h, 0c2h, 0bbh, 028h, 006h, 009h, 0bbh, 0beh, 0f0h, 0c0h, 0bfh, 012h, 0bbh, 0e8h
        db      006h, 002h, 072h, 038h, 080h, 03eh, 0f2h, 0c0h, 000h, 075h, 00fh, 0c6h, 006h, 046h, 0bbh, 001h
        db      0b0h, 03ch, 02ah, 006h, 0c2h, 0bbh, 028h, 006h, 021h, 0bbh, 0beh, 000h, 0c1h, 0bfh, 02ah, 0bbh
        db      0e8h, 0e5h, 001h, 072h, 017h, 080h, 03eh, 002h, 0c1h, 000h, 075h, 00fh, 0c6h, 006h, 047h, 0bbh
        db      001h, 0b0h, 03ch, 02ah, 006h, 0c2h, 0bbh, 028h, 006h, 039h, 0bbh, 0f8h
        elseif  (XL) && (FW_VERSION = 150)
        db      0e8h, 08ah, 007h, 0beh, 0ddh, 0efh, 0bfh, 0a0h, 0bah, 0e8h, 0e4h, 009h, 059h, 08ah, 0c1h, 004h
        db      015h, 088h, 045h, 003h, 0e8h, 046h, 001h, 0beh, 0b0h, 0c0h, 0bfh, 0c2h, 0bah, 0e8h, 048h, 002h
        db      072h, 07ah, 080h, 03eh, 0b2h, 0c0h, 000h, 075h, 00fh, 0c6h, 006h, 024h, 0bbh, 001h, 0b0h, 03ch
        db      02ah, 006h, 0a2h, 0bbh, 028h, 006h, 0d1h, 0bah, 0beh, 0c0h, 0c0h, 0bfh, 0dah, 0bah, 0e8h, 027h
        db      002h, 072h, 059h, 080h, 03eh, 0c2h, 0c0h, 000h, 075h, 00fh, 0c6h, 006h, 025h, 0bbh, 001h, 0b0h
        db      03ch, 02ah, 006h, 0a2h, 0bbh, 028h, 006h, 0e9h, 0bah, 0beh, 0d0h, 0c0h, 0bfh, 0f2h, 0bah, 0e8h
        db      006h, 002h, 072h, 038h, 080h, 03eh, 0d2h, 0c0h, 000h, 075h, 00fh, 0c6h, 006h, 026h, 0bbh, 001h
        db      0b0h, 03ch, 02ah, 006h, 0a2h, 0bbh, 028h, 006h, 001h, 0bbh, 0beh, 0e0h, 0c0h, 0bfh, 00ah, 0bbh
        db      0e8h, 0e5h, 001h, 072h, 017h, 080h, 03eh, 0e2h, 0c0h, 000h, 075h, 00fh, 0c6h, 006h, 027h, 0bbh
        db      001h, 0b0h, 03ch, 02ah, 006h, 0a2h, 0bbh, 028h, 006h, 019h, 0bbh, 0f8h
        elseif  (XL) && (MODEL = 3200)
        db      0e8h, 08ah, 007h, 0beh, 0adh, 0f5h, 0bfh, 050h, 0bbh, 0e8h, 0e4h, 009h, 059h, 08ah, 0c1h, 004h
        db      015h, 088h, 045h, 003h, 0e8h, 046h, 001h, 0beh, 060h, 0c1h, 0bfh, 072h, 0bbh, 0e8h, 048h, 002h
        db      072h, 07ah, 080h, 03eh, 062h, 0c1h, 000h, 075h, 00fh, 0c6h, 006h, 0d4h, 0bbh, 001h, 0b0h, 03ch
        db      02ah, 006h, 052h, 0bch, 028h, 006h, 081h, 0bbh, 0beh, 070h, 0c1h, 0bfh, 08ah, 0bbh, 0e8h, 027h
        db      002h, 072h, 059h, 080h, 03eh, 072h, 0c1h, 000h, 075h, 00fh, 0c6h, 006h, 0d5h, 0bbh, 001h, 0b0h
        db      03ch, 02ah, 006h, 052h, 0bch, 028h, 006h, 099h, 0bbh, 0beh, 080h, 0c1h, 0bfh, 0a2h, 0bbh, 0e8h
        db      006h, 002h, 072h, 038h, 080h, 03eh, 082h, 0c1h, 000h, 075h, 00fh, 0c6h, 006h, 0d6h, 0bbh, 001h
        db      0b0h, 03ch, 02ah, 006h, 052h, 0bch, 028h, 006h, 0b1h, 0bbh, 0beh, 090h, 0c1h, 0bfh, 0bah, 0bbh
        db      0e8h, 0e5h, 001h, 072h, 017h, 080h, 03eh, 092h, 0c1h, 000h, 075h, 00fh, 0c6h, 006h, 0d7h, 0bbh
        db      001h, 0b0h, 03ch, 02ah, 006h, 052h, 0bch, 028h, 006h, 0c9h, 0bbh, 0f8h
        elseif  (XL) && (FW_VERSION < 150)
        db      0e8h, 08ah, 007h, 0beh, 051h, 0efh, 0bfh, 0a0h, 0b9h, 0e8h, 0e4h, 009h, 059h, 08ah, 0c1h, 004h
        db      015h, 088h, 045h, 003h, 0e8h, 046h, 001h, 0beh, 0b0h, 0bfh, 0bfh, 0c2h, 0b9h, 0e8h, 048h, 002h
        db      072h, 07ah, 080h, 03eh, 0b2h, 0bfh, 000h, 075h, 00fh, 0c6h, 006h, 024h, 0bah, 001h, 0b0h, 03ch
        db      02ah, 006h, 0a2h, 0bah, 028h, 006h, 0d1h, 0b9h, 0beh, 0c0h, 0bfh, 0bfh, 0dah, 0b9h, 0e8h, 027h
        db      002h, 072h, 059h, 080h, 03eh, 0c2h, 0bfh, 000h, 075h, 00fh, 0c6h, 006h, 025h, 0bah, 001h, 0b0h
        db      03ch, 02ah, 006h, 0a2h, 0bah, 028h, 006h, 0e9h, 0b9h, 0beh, 0d0h, 0bfh, 0bfh, 0f2h, 0b9h, 0e8h
        db      006h, 002h, 072h, 038h, 080h, 03eh, 0d2h, 0bfh, 000h, 075h, 00fh, 0c6h, 006h, 026h, 0bah, 001h
        db      0b0h, 03ch, 02ah, 006h, 0a2h, 0bah, 028h, 006h, 001h, 0bah, 0beh, 0e0h, 0bfh, 0bfh, 00ah, 0bah
        db      0e8h, 0e5h, 001h, 072h, 017h, 080h, 03eh, 0e2h, 0bfh, 000h, 075h, 00fh, 0c6h, 006h, 027h, 0bah
        db      001h, 0b0h, 03ch, 02ah, 006h, 0a2h, 0bah, 028h, 006h, 019h, 0bah, 0f8h
        endif
        if      XL
        db      "YX^rJ"
        db      0feh, 0c5h, 046h, 046h, 0feh, 0c1h, 080h, 0f9h, 058h, 074h, 00ah, 03bh, 004h, 074h, 0f3h, 0e8h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      04ch, 000h, 0e9h, 033h, 0ffh, 0e8h, 046h, 000h, 006h, 08eh, 006h, 09bh, 086h, 026h, 088h, 02eh
        elseif  (XL) && (FW_VERSION = 150)
        db      04ch, 000h, 0e9h, 033h, 0ffh, 0e8h, 046h, 000h, 006h, 08eh, 006h, 07bh, 086h, 026h, 088h, 02eh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      02ah, 000h, 080h, 0fdh, 000h, 075h, 008h, 0bdh, 042h, 02eh, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      04ch, 000h, 0e9h, 033h, 0ffh, 0e8h, 046h, 000h, 006h, 08eh, 006h, 02bh, 087h, 026h, 088h, 02eh
        db      02ah, 000h, 080h, 0fdh, 000h, 075h, 008h, 0bdh, 068h, 02eh, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      04ch, 000h, 0e9h, 033h, 0ffh, 0e8h, 046h, 000h, 006h, 08eh, 006h, 0ddh, 085h, 026h, 088h, 02eh
        db      02ah, 000h, 080h, 0fdh, 000h, 075h, 008h, 0bdh, 0c0h, 02dh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      007h, 0bdh, 013h, 029h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      007h, 0bdh, 039h, 029h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      007h, 0bdh, 0a3h, 028h, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0bdh, 089h, 052h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0bdh, 0e6h, 052h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0bdh, 0f3h, 051h, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0bdh, 03ch, 02ch, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0bdh, 062h, 02ch, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0bdh, 0bah, 02bh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        db      0f8h, 0c3h, 0feh, 0c5h, 046h, 046h, 0feh, 0c1h, 080h, 0f9h, 058h, 074h, 004h, 03bh, 004h, 074h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0f3h, 0e8h, 0b9h, 0ffh, 0f9h, 0c3h, 006h, 08ah, 0c1h, 004h, 014h, 0a2h, 0c4h, 0bah, 056h, 051h
        db      0beh, 0c0h, 0bah, 0e8h, 00eh, 019h, 08eh, 006h, 099h, 086h, 026h, 0a3h, 001h, 000h, 0a3h, 099h
        db      086h, 059h, 05eh, 007h, 0c3h, 0beh, 0c0h, 0beh, 0bfh, 0c0h, 0b9h, 0a0h, 094h, 086h, 002h, 006h
        db      095h, 086h, 024h, 07fh, 088h, 045h, 00fh, 08ah, 044h, 018h, 004h, 002h, 03ch, 004h, 072h, 002h
        db      0b0h, 004h, 08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 082h, 0d2h, 0a2h, 00bh, 0bah, 08ah, 044h
        db      01ah, 08ah, 064h, 019h, 0e8h, 076h, 002h, 0a2h, 001h, 0bah, 088h, 026h, 002h, 0bah, 0c3h, 0e8h
        db      0f4h, 000h, 00ch, 018h, 0beh, 0c0h, 0c0h, 0bfh, 0c0h, 0bah, 0beh, 0c0h, 0c0h, 0bfh, 0c0h, 0bah
        elseif  (XL) && (FW_VERSION = 150)
        db      0f3h, 0e8h, 0b9h, 0ffh, 0f9h, 0c3h, 006h, 08ah, 0c1h, 004h, 014h, 0a2h, 0a4h, 0bah, 056h, 051h
        db      0beh, 0a0h, 0bah, 0e8h, 00eh, 019h, 08eh, 006h, 079h, 086h, 026h, 0a3h, 001h, 000h, 0a3h, 079h
        db      086h, 059h, 05eh, 007h, 0c3h, 0beh, 0a0h, 0beh, 0bfh, 0a0h, 0b9h, 0a0h, 074h, 086h, 002h, 006h
        db      075h, 086h, 024h, 07fh, 088h, 045h, 00fh, 08ah, 044h, 018h, 004h, 002h, 03ch, 004h, 072h, 002h
        db      0b0h, 004h, 08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 082h, 0d2h, 0a2h, 0ebh, 0b9h, 08ah, 044h
        db      01ah, 08ah, 064h, 019h, 0e8h, 076h, 002h, 0a2h, 0e1h, 0b9h, 088h, 026h, 0e2h, 0b9h, 0c3h, 0e8h
        db      0f4h, 000h, 00ch, 018h, 0beh, 0a0h, 0c0h, 0bfh, 0a0h, 0bah, 0beh, 0a0h, 0c0h, 0bfh, 0a0h, 0bah
        elseif  (XL) && (MODEL = 3200)
        db      0f3h, 0e8h, 0b9h, 0ffh, 0f9h, 0c3h, 006h, 08ah, 0c1h, 004h, 014h, 0a2h, 054h, 0bbh, 056h, 051h
        db      0beh, 050h, 0bbh, 0e8h, 00eh, 019h, 08eh, 006h, 029h, 087h, 026h, 0a3h, 001h, 000h, 0a3h, 029h
        db      087h, 059h, 05eh, 007h, 0c3h, 0beh, 050h, 0bfh, 0bfh, 050h, 0bah, 0a0h, 024h, 087h, 002h, 006h
        db      025h, 087h, 024h, 07fh, 088h, 045h, 00fh, 08ah, 044h, 018h, 004h, 002h, 03ch, 004h, 072h, 002h
        db      0b0h, 004h, 08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 052h, 0d8h, 0a2h, 09bh, 0bah, 08ah, 044h
        db      01ah, 08ah, 064h, 019h, 0e8h, 076h, 002h, 0a2h, 091h, 0bah, 088h, 026h, 092h, 0bah, 0c3h, 0e8h
        db      0f4h, 000h, 00ch, 018h, 0beh, 050h, 0c1h, 0bfh, 050h, 0bbh, 0beh, 050h, 0c1h, 0bfh, 050h, 0bbh
        elseif  (XL) && (FW_VERSION < 150)
        db      0f3h, 0e8h, 0b9h, 0ffh, 0f9h, 0c3h, 006h, 08ah, 0c1h, 004h, 014h, 0a2h, 0a4h, 0b9h, 056h, 051h
        db      0beh, 0a0h, 0b9h, 0e8h, 012h, 019h, 08eh, 006h, 0dbh, 085h, 026h, 0a3h, 001h, 000h, 0a3h, 0dbh
        db      085h, 059h, 05eh, 007h, 0c3h, 0beh, 0a0h, 0bdh, 0bfh, 0a0h, 0b8h, 0a0h, 0d4h, 085h, 002h, 006h
        db      0d5h, 085h, 024h, 07fh, 088h, 045h, 00fh, 08ah, 044h, 018h, 004h, 002h, 03ch, 004h, 072h, 002h
        db      0b0h, 004h, 08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 0f2h, 0d1h, 0a2h, 0ebh, 0b8h, 08ah, 044h
        db      01ah, 08ah, 064h, 019h, 0e8h, 076h, 002h, 0a2h, 0e1h, 0b8h, 088h, 026h, 0e2h, 0b8h, 0c3h, 0e8h
        db      0f4h, 000h, 00ch, 018h, 0beh, 0a0h, 0bfh, 0bfh, 0a0h, 0b9h, 0beh, 0a0h, 0bfh, 0bfh, 0a0h, 0b9h
        endif
        if      XL
        db      08ah, 044h, 067h, 0e8h, 080h, 002h, 088h, 045h, 00ch, 08ah, 044h, 069h, 0e8h, 005h, 003h, 03ch
        db      000h, 075h, 006h, 08ah, 044h, 068h, 0e8h, 0fbh, 002h, 088h, 045h, 00dh, 08ah, 044h, 066h, 0e8h
        db      080h, 003h, 088h, 045h, 00eh, 08ah, 044h, 06ah, 0e8h, 0e9h, 002h, 088h, 045h, 00fh, 08ah, 044h
        db      056h, 0e8h, 052h, 002h, 088h, 045h, 014h, 08ah, 044h, 057h, 0e8h, 0d7h, 002h, 088h, 045h, 015h
        db      08ah, 044h, 055h, 0e8h, 05ch, 003h, 088h, 045h, 016h, 08ah, 044h, 059h, 0e8h, 0c5h, 002h, 088h
        db      045h, 017h, 08ah, 044h, 062h, 0e8h, 023h, 002h, 0f6h, 0d8h, 088h, 045h, 010h, 080h, 07ch, 04bh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      000h, 074h, 003h, 0e9h, 089h, 000h, 08ah, 044h, 04ch, 002h, 006h, 0d6h, 0beh, 03ch, 080h, 072h
        elseif  (XL) && (FW_VERSION = 150)
        db      000h, 074h, 003h, 0e9h, 089h, 000h, 08ah, 044h, 04ch, 002h, 006h, 0b6h, 0beh, 03ch, 080h, 072h
        elseif  (XL) && (MODEL = 3200)
        db      000h, 074h, 003h, 0e9h, 089h, 000h, 08ah, 044h, 04ch, 002h, 006h, 066h, 0bfh, 03ch, 080h, 072h
        elseif  (XL) && (FW_VERSION < 150)
        db      000h, 074h, 003h, 0e9h, 089h, 000h, 08ah, 044h, 04ch, 002h, 006h, 0b6h, 0bdh, 03ch, 080h, 072h
        endif
        if      XL
        db      002h, 0b0h, 07fh, 0c0h, 0e8h, 002h, 004h, 044h, 088h, 045h, 007h, 08ah, 044h, 04fh, 0e8h, 0fah
        db      001h, 088h, 085h, 097h, 000h, 08ah, 044h, 053h, 0e8h, 017h, 003h, 088h, 085h, 09ch, 000h, 08ah
        db      044h, 054h, 0e8h, 00dh, 003h, 088h, 085h, 09eh, 000h, 08ah, 044h, 055h, 0e8h, 003h, 003h, 088h
        db      045h, 016h, 08ah, 044h, 052h, 0e8h, 0fah, 002h, 088h, 085h, 09fh, 000h, 08ah, 044h, 056h, 0e8h
        db      0d4h, 001h, 088h, 045h, 014h, 08ah, 044h, 057h, 0e8h, 059h, 002h, 088h, 085h, 09dh, 000h, 08ah
        db      044h, 058h, 0e8h, 04fh, 002h, 088h, 045h, 015h, 08ah, 044h, 059h, 0e8h, 046h, 002h, 088h, 045h
        db      017h, 08ah, 044h, 05ah, 0e8h, 0a4h, 001h, 088h, 085h, 099h, 000h, 08ah, 044h, 051h, 0e8h, 09ah
        db      001h, 088h, 045h, 01ch, 08ah, 044h, 050h, 0e8h, 091h, 001h, 0f6h, 0d8h, 088h, 045h, 018h, 08ah
        db      044h, 02eh, 08ah, 064h, 02dh, 0e8h, 065h, 001h, 088h, 045h, 005h, 088h, 065h, 006h, 0c3h, 08bh
        db      004h, 03dh, 000h, 020h, 072h, 001h, 0c3h, 050h, 08ah, 044h, 006h, 08ah, 064h, 005h, 0e8h, 04ch
        db      001h, 088h, 045h, 00eh, 088h, 065h, 00fh, 08ah, 044h, 007h, 088h, 045h, 00ch, 08ah, 044h, 009h
        db      088h, 045h, 00dh, 08ah, 044h, 004h, 0a8h, 080h, 075h, 006h, 03ch, 021h, 072h, 002h, 0b0h, 000h
        db      0b4h, 032h, 0f6h, 0ech, 0b3h, 020h, 0f6h, 0fbh, 088h, 045h, 012h, 058h, 057h, 050h, 0e8h, 069h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      004h, 058h, 0e8h, 00fh, 005h, 05fh, 0beh, 0c4h, 0c3h, 0e8h, 052h, 007h, 0beh, 09dh, 0f0h, 0bfh
        db      0c0h, 0bbh, 0e8h, 032h, 007h, 0beh, 0c4h, 0c9h, 0bfh, 0c3h, 0bbh, 0e8h, 040h, 007h, 0e8h, 057h
        db      003h, 073h, 002h, 0f8h, 0c3h, 0beh, 0c4h, 0c3h, 0e8h, 015h, 006h, 0beh, 0c0h, 0c9h, 0bfh, 0c0h
        elseif  (XL) && (FW_VERSION = 150)
        db      004h, 058h, 0e8h, 00fh, 005h, 05fh, 0beh, 0a4h, 0c3h, 0e8h, 052h, 007h, 0beh, 09dh, 0f0h, 0bfh
        db      0a0h, 0bbh, 0e8h, 032h, 007h, 0beh, 0a4h, 0c9h, 0bfh, 0a3h, 0bbh, 0e8h, 040h, 007h, 0e8h, 057h
        db      003h, 073h, 002h, 0f8h, 0c3h, 0beh, 0a4h, 0c3h, 0e8h, 015h, 006h, 0beh, 0a0h, 0c9h, 0bfh, 0a0h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0bbh, 08bh, 044h, 019h, 08bh, 054h, 01bh, 083h, 0e2h, 00fh, 0bdh, 0fdh, 02ah, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      004h, 058h, 0e8h, 00fh, 005h, 05fh, 0beh, 054h, 0c4h, 0e8h, 052h, 007h, 0beh, 06dh, 0f6h, 0bfh
        db      050h, 0bch, 0e8h, 032h, 007h, 0beh, 054h, 0cah, 0bfh, 053h, 0bch, 0e8h, 040h, 007h, 0e8h, 057h
        db      003h, 073h, 002h, 0f8h, 0c3h, 0beh, 054h, 0c4h, 0e8h, 015h, 006h, 0beh, 050h, 0cah, 0bfh, 050h
        db      0bch, 08bh, 044h, 019h, 08bh, 054h, 01bh, 083h, 0e2h, 00fh, 0bdh, 023h, 02bh, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      004h, 058h, 0e8h, 00fh, 005h, 05fh, 0beh, 0a4h, 0c2h, 0e8h, 052h, 007h, 0beh, 011h, 0f0h, 0bfh
        db      0a0h, 0bah, 0e8h, 032h, 007h, 0beh, 0a4h, 0c8h, 0bfh, 0a3h, 0bah, 0e8h, 040h, 007h, 0e8h, 057h
        db      003h, 073h, 002h, 0f8h, 0c3h, 0beh, 0a4h, 0c2h, 0e8h, 015h, 006h, 0beh, 0a0h, 0c8h, 0bfh, 0a0h
        db      0bah, 08bh, 044h, 019h, 08bh, 054h, 01bh, 083h, 0e2h, 00fh, 0bdh, 07bh, 02ah, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      073h, 00bh, 0e8h, 0a6h, 014h, 0e8h, 007h, 004h, 0e8h, 0e7h, 003h, 0f9h, 0c3h, 08bh, 044h, 019h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      08ah, 054h, 01bh, 083h, 0e2h, 00fh, 005h, 001h, 000h, 083h, 0d2h, 000h, 0a3h, 09dh, 086h, 089h
        db      045h, 01ah, 089h, 045h, 026h, 089h, 045h, 022h, 089h, 016h, 09fh, 086h, 089h, 055h, 01ch, 089h
        elseif  (XL) && (FW_VERSION = 150)
        db      08ah, 054h, 01bh, 083h, 0e2h, 00fh, 005h, 001h, 000h, 083h, 0d2h, 000h, 0a3h, 07dh, 086h, 089h
        db      045h, 01ah, 089h, 045h, 026h, 089h, 045h, 022h, 089h, 016h, 07fh, 086h, 089h, 055h, 01ch, 089h
        elseif  (XL) && (MODEL = 3200)
        db      08ah, 054h, 01bh, 083h, 0e2h, 00fh, 005h, 001h, 000h, 083h, 0d2h, 000h, 0a3h, 02dh, 087h, 089h
        db      045h, 01ah, 089h, 045h, 026h, 089h, 045h, 022h, 089h, 016h, 02fh, 087h, 089h, 055h, 01ch, 089h
        elseif  (XL) && (FW_VERSION < 150)
        db      073h, 00bh, 0e8h, 0aah, 014h, 0e8h, 007h, 004h, 0e8h, 0e7h, 003h, 0f9h, 0c3h, 08bh, 044h, 019h
        db      08ah, 054h, 01bh, 083h, 0e2h, 00fh, 005h, 001h, 000h, 083h, 0d2h, 000h, 0a3h, 0dfh, 085h, 089h
        db      045h, 01ah, 089h, 045h, 026h, 089h, 045h, 022h, 089h, 016h, 0e1h, 085h, 089h, 055h, 01ch, 089h
        endif
        if      XL
        db      055h, 028h, 089h, 055h, 024h, 08bh, 044h, 011h, 089h, 045h, 01eh, 0c7h, 045h, 02ah, 000h, 000h
        db      08bh, 044h, 019h, 08bh, 054h, 01bh, 083h, 0e2h, 00fh, 08bh, 05ch, 017h, 083h, 0e3h, 00fh, 02bh
        db      044h, 015h, 01bh, 0d3h, 089h, 045h, 02ch, 089h, 055h, 02eh, 08ah, 044h, 02dh, 088h, 045h, 002h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      08ah, 05ch, 02ch, 080h, 0e3h, 007h, 02ah, 0ffh, 0d1h, 0e3h, 02eh, 08bh, 097h, 0e0h, 0d4h, 089h
        elseif  (XL) && (MODEL = 3200)
        db      08ah, 05ch, 02ch, 080h, 0e3h, 007h, 02ah, 0ffh, 0d1h, 0e3h, 02eh, 08bh, 097h, 0b0h, 0dah, 089h
        elseif  (XL) && (FW_VERSION < 150)
        db      08ah, 05ch, 02ch, 080h, 0e3h, 007h, 02ah, 0ffh, 0d1h, 0e3h, 02eh, 08bh, 097h, 050h, 0d4h, 089h
        endif
        if      XL
        db      095h, 08ah, 000h, 09ah
        dw      far_196f0, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      089h, 055h, 014h, 0a1h, 03dh, 073h, 089h, 045h, 016h, 0a3h, 0a1h, 086h, 0a1h, 03fh, 073h, 089h
        db      045h, 018h, 0a3h, 0a3h, 086h, 0e8h, 01eh, 002h, 08ah, 01eh, 0e4h, 0c9h, 02ah, 0ffh, 02eh, 08ah
        db      087h, 0d9h, 0d4h, 0a2h, 0d3h, 0bbh, 0beh, 0c0h, 0bbh, 0e8h, 08eh, 016h, 050h, 0bdh, 013h, 029h
        elseif  (XL) && (FW_VERSION = 150)
        db      089h, 055h, 014h, 0a1h, 02dh, 073h, 089h, 045h, 016h, 0a3h, 081h, 086h, 0a1h, 02fh, 073h, 089h
        db      045h, 018h, 0a3h, 083h, 086h, 0e8h, 01eh, 002h, 08ah, 01eh, 0c4h, 0c9h, 02ah, 0ffh, 02eh, 08ah
        db      087h, 0d9h, 0d4h, 0a2h, 0b3h, 0bbh, 0beh, 0a0h, 0bbh, 0e8h, 08eh, 016h, 050h, 0bdh, 013h, 029h
        elseif  (XL) && (MODEL = 3200)
        db      089h, 055h, 014h, 0a1h, 06dh, 073h, 089h, 045h, 016h, 0a3h, 031h, 087h, 0a1h, 06fh, 073h, 089h
        db      045h, 018h, 0a3h, 033h, 087h, 0e8h, 01eh, 002h, 08ah, 01eh, 074h, 0cah, 02ah, 0ffh, 02eh, 08ah
        db      087h, 0a9h, 0dah, 0a2h, 063h, 0bch, 0beh, 050h, 0bch, 0e8h, 08eh, 016h, 050h, 0bdh, 039h, 029h
        elseif  (XL) && (FW_VERSION < 150)
        db      089h, 055h, 014h, 0a1h, 08dh, 072h, 089h, 045h, 016h, 0a3h, 0e3h, 085h, 0a1h, 08fh, 072h, 089h
        db      045h, 018h, 0a3h, 0e5h, 085h, 0e8h, 01eh, 002h, 08ah, 01eh, 0c4h, 0c8h, 02ah, 0ffh, 02eh, 08ah
        db      087h, 049h, 0d4h, 0a2h, 0b3h, 0bah, 0beh, 0a0h, 0bah, 0e8h, 092h, 016h, 050h, 0bdh, 0a3h, 028h
        endif
        if      XL
        db      09ah
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      058h, 00eh, 0e8h, 0dah, 043h, 0bdh, 089h, 052h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      058h, 00eh, 0e8h, 05dh, 03eh, 0bdh, 0e6h, 052h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      058h, 00eh, 0e8h, 0eeh, 043h, 0bdh, 0f3h, 051h, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0bdh, 03ch, 02ch, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0bdh, 062h, 02ch, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0bdh, 0bah, 02bh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        db      0f8h, 0c3h, 000h, 000h, 002h, 001h, 000h, 002h, 000h, 080h, 0bbh, 044h, 0ach, 0c0h, 05dh, 022h
        db      056h, 030h, 075h, 000h, 07dh, 080h, 03eh, 098h, 03ah, 050h, 0b4h, 07fh, 0f6h, 0ech, 02bh, 0d2h
        db      0bbh, 032h, 000h, 0f7h, 0fbh, 098h, 05bh, 02ah, 0dbh, 003h, 0c3h, 0c3h, 053h, 0b4h, 063h, 0f6h
        db      0e4h, 0b3h, 07fh, 0f6h, 0f3h, 05bh, 0c3h, 053h, 0b4h, 032h, 0f6h, 0ech, 0b3h, 03fh, 0f6h, 0fbh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      05bh, 0c3h, 053h, 08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 025h, 0d5h, 05bh, 0c3h, 000h, 00ah
        elseif  (XL) && (MODEL = 3200)
        db      05bh, 0c3h, 053h, 08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 0f5h, 0dah, 05bh, 0c3h, 000h, 00ah
        elseif  (XL) && (FW_VERSION < 150)
        db      05bh, 0c3h, 053h, 08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 095h, 0d4h, 05bh, 0c3h, 000h, 00ah
        endif
        if      XL
        db      014h, 01eh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      "!$(-24679<<=>?@ABCDEFFGGGHHHIIJJJKKLLLM"
        phase   200h
far_32260:
        dec     bp
        dec     si
        dec     si
        dec     si
        dec     di
        dec     di
        push    ax
        push    ax
        push    ax
        push    cx
        push    cx
        push    dx
        push    dx
        push    dx
        push    bx
        push    bx
        push    bx
        push    sp
        push    sp
        push    bp
        push    bp
        push    bp
        push    si
        push    si
        push    di
        push    di
        push    di
        pop     ax
        pop     ax
        pop     cx
        pop     cx
        pop     dx
        pop     dx
        pop     dx
        pop     bx
        pop     bx
        pop     sp
        pop     sp
        pop     sp
        pop     bp
        pop     bp
        pop     si
        pop     si
        pop     si
        pop     di
        pop     di
        pusha
        pusha
        pusha
        popa
        popa
        bound   sp, [bp+si + 62h]
        db      21h dup (063h)
        db      053h, 08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 0b3h, 0d5h, 05bh, 0c3h, 000h, 000h, 000h, 000h
        db      000h, 01eh
        elseif  ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 200))
        db      "!$(-24679<<=>?@ABCDEFFGGGHHHIIJJJKKLLLMMNNNOOPPPQQRRRSSSTTUUUVVWWWXXYYZZZ[["
        db      05ch, 05ch, 05ch
        db      "]]^^^__```aabbbcccccccccccccccccccccccccccccccccS"
        endif
        if      (XL) && (FW_VERSION = 150)
        db      08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 0b3h, 0d5h, 05bh, 0c3h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (MODEL = 3200)
        db      08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 083h, 0dbh, 05bh, 0c3h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (FW_VERSION < 150)
        db      08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 023h, 0d5h, 05bh, 0c3h, 000h, 000h, 000h, 000h, 000h
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 200))
        db      01eh
        endif
        if      XL
        db      "#(*,.022343456777788899::;;<<<===>>>???@@@AAABBBCCCDDDEEEFFFGGHHIIJJKKLLMMNNOOPPPQQRRRSSTTUUUVVWWWXXYYYZZ["
        db      05ch
        db      "]^^_`abccccccccccS"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 041h, 0d6h, 05bh, 0c3h, 000h, 01eh
        elseif  (XL) && (MODEL = 3200)
        db      08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 011h, 0dch, 05bh, 0c3h, 000h, 01eh
        elseif  (XL) && (FW_VERSION < 150)
        db      08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 0b1h, 0d5h, 05bh, 0c3h, 000h, 01eh
        endif
        if      XL
        db      "(-247:<?ABCDEFGHIJKLMMNNOOPPPQQRRRSSTTTUUUVVVWWWWWXXXYYYYYZZZZZZ[[["
        db      05ch, 05ch, 05ch, 05dh, 05dh, 05dh, 05dh, 05eh, 05eh, 05eh, 05eh
        db      "^^^^^^_^_____```````aaaaaabbbbbccccccccccccccccccc"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0a1h, 0dch, 0c3h, 050h, 0e8h, 01dh, 000h, 058h, 0bbh, 000h, 0d0h, 0d1h, 0e0h, 073h, 003h, 0bbh
        elseif  (XL) && (FW_VERSION = 150)
        db      0a1h, 0bch, 0c3h, 050h, 0e8h, 01dh, 000h, 058h, 0bbh, 000h, 0d0h, 0d1h, 0e0h, 073h, 003h, 0bbh
        elseif  (XL) && (MODEL = 3200)
        db      0a1h, 06ch, 0c4h, 050h, 0e8h, 01dh, 000h, 058h, 0bbh, 000h, 0d0h, 0d1h, 0e0h, 073h, 003h, 0bbh
        elseif  (XL) && (FW_VERSION < 150)
        db      0a1h, 0bch, 0c2h, 050h, 0e8h, 01dh, 000h, 058h, 0bbh, 000h, 0d0h, 0d1h, 0e0h, 073h, 003h, 0bbh
        endif
        if      XL
        db      000h, 0e0h, 006h, 08eh, 0c3h, 08bh, 0d8h, 026h, 08bh, 007h, 007h, 03dh, 0f8h, 0ffh, 072h, 0e3h
        db      0e8h, 041h, 003h, 0c3h, 02dh, 002h, 000h, 0bah, 012h, 000h, 0f7h, 0e2h, 005h, 0ach, 015h, 083h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0d2h, 000h, 050h, 025h, 00fh, 000h, 0a2h, 0a5h, 07fh, 058h, 0b9h, 004h, 000h, 0d1h, 0eah, 0d1h
        db      0d8h, 0e2h, 0fah, 0a3h, 0abh, 07fh, 0b9h, 000h, 024h, 051h, 0bah, 000h, 0f0h, 0b8h, 000h, 000h
        elseif  (XL) && (FW_VERSION = 150)
        db      0d2h, 000h, 050h, 025h, 00fh, 000h, 0a2h, 095h, 07fh, 058h, 0b9h, 004h, 000h, 0d1h, 0eah, 0d1h
        db      0d8h, 0e2h, 0fah, 0a3h, 09bh, 07fh, 0b9h, 000h, 024h, 051h, 0bah, 000h, 0f0h, 0b8h, 000h, 000h
        elseif  (XL) && (MODEL = 3200)
        db      0d2h, 000h, 050h, 025h, 00fh, 000h, 0a2h, 0d5h, 07fh, 058h, 0b9h, 004h, 000h, 0d1h, 0eah, 0d1h
        db      0d8h, 0e2h, 0fah, 0a3h, 0dbh, 07fh, 0b9h, 000h, 024h, 051h, 0bah, 000h, 0f0h, 0b8h, 000h, 000h
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      08ch, 0dbh, 08eh, 0c3h, 0e8h, 070h, 01bh, 059h, 0d1h, 0e9h, 051h, 0bah, 000h, 0f0h, 0beh, 000h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      000h, 0a1h, 0a1h, 086h, 0a3h, 072h, 077h, 0a1h, 0a3h, 086h, 02ah, 0e4h, 0a3h, 074h, 077h, 00eh
        db      0e8h, 098h, 03ch, 059h, 0a1h, 0a1h, 086h, 08bh, 016h, 0a3h, 086h, 003h, 0c1h, 083h, 0d2h, 000h
        db      0a3h, 0a1h, 086h, 089h, 016h, 0a3h, 086h, 0c3h, 0b3h, 003h, 0bdh, 0c3h, 0bbh, 0ebh, 005h, 0b3h
        db      001h, 0bdh, 0c3h, 0b9h, 006h, 0bah, 04eh, 004h, 0b8h, 000h, 090h, 08eh, 0c0h, 0bfh, 003h, 000h
        elseif  (XL) && (FW_VERSION = 150)
        db      000h, 0a1h, 081h, 086h, 0a3h, 062h, 077h, 0a1h, 083h, 086h, 02ah, 0e4h, 0a3h, 064h, 077h, 00eh
        db      0e8h, 098h, 03ch, 059h, 0a1h, 081h, 086h, 08bh, 016h, 083h, 086h, 003h, 0c1h, 083h, 0d2h, 000h
        db      0a3h, 081h, 086h, 089h, 016h, 083h, 086h, 0c3h, 0b3h, 003h, 0bdh, 0a3h, 0bbh, 0ebh, 005h, 0b3h
        db      001h, 0bdh, 0a3h, 0b9h, 006h, 0bah, 04eh, 004h, 0b8h, 000h, 090h, 08eh, 0c0h, 0bfh, 003h, 000h
        elseif  (XL) && (MODEL = 3200)
        db      000h, 0a1h, 031h, 087h, 0a3h, 0a2h, 077h, 0a1h, 033h, 087h, 02ah, 0e4h, 0a3h, 0a4h, 077h, 00eh
        db      0e8h, 01bh, 037h, 059h, 0a1h, 031h, 087h, 08bh, 016h, 033h, 087h, 003h, 0c1h, 083h, 0d2h, 000h
        db      0a3h, 031h, 087h, 089h, 016h, 033h, 087h, 0c3h, 0b3h, 003h, 0bdh, 053h, 0bch, 0ebh, 005h, 0b3h
        db      001h, 0bdh, 053h, 0bah, 006h, 0bah, 04eh, 004h, 0b8h, 000h, 090h, 08eh, 0c0h, 0bfh, 003h, 000h
        elseif  (XL) && (FW_VERSION < 150)
        db      0d2h, 000h, 050h, 025h, 00fh, 000h, 0a2h, 0f5h, 07eh, 058h, 0b9h, 004h, 000h, 0d1h, 0eah, 0d1h
        db      0d8h, 0e2h, 0fah, 0a3h, 0fbh, 07eh, 0b9h, 000h, 024h, 051h, 0bah, 000h, 0f0h, 0b8h, 000h, 000h
        db      08ch, 0dbh, 08eh, 0c3h, 0e8h, 074h, 01bh, 059h, 0d1h, 0e9h, 051h, 0bah, 000h, 0f0h, 0beh, 000h
        db      000h, 0a1h, 0e3h, 085h, 0a3h, 0c2h, 076h, 0a1h, 0e5h, 085h, 02ah, 0e4h, 0a3h, 0c4h, 076h, 00eh
        db      0e8h, 0d9h, 03ch, 059h, 0a1h, 0e3h, 085h, 08bh, 016h, 0e5h, 085h, 003h, 0c1h, 083h, 0d2h, 000h
        db      0a3h, 0e3h, 085h, 089h, 016h, 0e5h, 085h, 0c3h, 0b3h, 003h, 0bdh, 0a3h, 0bah, 0ebh, 005h, 0b3h
        db      001h, 0bdh, 0a3h, 0b8h, 006h, 0bah, 04eh, 004h, 0b8h, 000h, 090h, 08eh, 0c0h, 0bfh, 003h, 000h
        endif
        if      XL
        db      08bh, 0f5h, 026h, 038h, 01eh, 000h, 000h, 075h, 008h, 0b9h, 00ch, 000h, 0fch, 0f3h, 0a6h, 074h
        db      00dh, 08ch, 0c0h, 005h, 00ch, 000h, 08eh, 0c0h, 04ah, 075h, 0e2h, 0f8h, 007h, 0c3h, 0f9h, 007h
        db      0c3h, 006h, 0bbh, 06ch, 008h, 0b9h, 000h, 080h, 0bah, 000h, 0c0h, 0b8h, 000h, 000h, 0e8h, 06eh
        db      003h, 0b8h, 000h, 0c0h, 08eh, 0c0h, 0beh, 000h, 000h, 0bfh, 000h, 000h, 026h, 08bh, 004h, 03dh
        db      0ffh, 0ffh, 075h, 006h, 081h, 0c6h, 000h, 001h, 0ebh, 00fh, 0b9h, 080h, 000h, 026h, 08bh, 004h
        db      026h, 089h, 005h
        db      "FFGG"
        db      0e2h, 0f4h, 081h, 0feh, 000h, 080h, 075h, 0ddh, 0b8h, 000h, 000h, 026h, 089h, 005h, 0beh, 000h
        db      000h, 026h, 08bh, 004h, 03dh, 000h, 000h, 074h, 032h, 056h, 083h, 0c6h, 020h, 08bh, 0feh, 0b9h
        db      040h, 000h, 0b2h, 000h, 026h, 08bh, 004h, 03dh, 0ffh, 0ffh, 074h, 007h, 026h, 089h, 005h, 047h
        db      047h, 0feh, 0c2h, 046h, 046h, 0e2h, 0edh, 026h, 088h, 014h, 0b8h, 0ffh, 0ffh, 026h, 089h, 005h
        db      05eh, 081h, 0c6h, 000h, 001h, 081h, 0feh, 000h, 080h, 075h, 0c6h, 007h, 0c3h, 0bbh, 00ch, 005h
        db      0b9h, 000h, 040h, 0bah, 000h, 0c0h, 0b8h, 000h, 000h, 0e8h, 0ech, 002h, 0b8h, 000h, 0c0h, 0bbh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      000h, 040h, 0e8h, 0beh, 001h, 089h, 01eh, 092h, 086h, 0c3h, 0bbh, 02ch, 005h, 0b9h, 000h, 080h
        elseif  (XL) && (FW_VERSION = 150)
        db      000h, 040h, 0e8h, 0beh, 001h, 089h, 01eh, 072h, 086h, 0c3h, 0bbh, 02ch, 005h, 0b9h, 000h, 080h
        elseif  (XL) && (MODEL = 3200)
        db      000h, 040h, 0e8h, 0beh, 001h, 089h, 01eh, 022h, 087h, 0c3h, 0bbh, 02ch, 005h, 0b9h, 000h, 080h
        elseif  (XL) && (FW_VERSION < 150)
        db      000h, 040h, 0e8h, 0beh, 001h, 089h, 01eh, 0d2h, 085h, 0c3h, 0bbh, 02ch, 005h, 0b9h, 000h, 080h
        endif
        if      XL
        db      0bah, 000h, 0c0h, 0b8h, 000h, 080h, 0e8h, 0cfh, 002h, 0b8h, 000h, 0c8h, 0bbh, 000h, 080h, 0e8h
        db      0a1h, 001h, 0c3h, 006h, 02bh, 0d2h, 0bbh, 010h, 000h, 0f7h, 0f3h, 052h, 005h, 06ch, 006h, 08bh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0d8h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0c0h, 0c3h, 0e8h, 0abh, 002h, 058h, 0b4h, 020h
        db      0f6h, 0e4h, 0beh, 0c0h, 0c3h, 08bh, 0feh, 003h, 0f0h, 08ch, 0d8h, 08eh, 0c0h, 0fch, 0b9h, 020h
        elseif  (XL) && (FW_VERSION = 150)
        db      0d8h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0a0h, 0c3h, 0e8h, 0abh, 002h, 058h, 0b4h, 020h
        db      0f6h, 0e4h, 0beh, 0a0h, 0c3h, 08bh, 0feh, 003h, 0f0h, 08ch, 0d8h, 08eh, 0c0h, 0fch, 0b9h, 020h
        elseif  (XL) && (MODEL = 3200)
        db      0d8h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 050h, 0c4h, 0e8h, 0abh, 002h, 058h, 0b4h, 020h
        db      0f6h, 0e4h, 0beh, 050h, 0c4h, 08bh, 0feh, 003h, 0f0h, 08ch, 0d8h, 08eh, 0c0h, 0fch, 0b9h, 020h
        elseif  (XL) && (FW_VERSION < 150)
        db      0d8h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0a0h, 0c2h, 0e8h, 0abh, 002h, 058h, 0b4h, 020h
        db      0f6h, 0e4h, 0beh, 0a0h, 0c2h, 08bh, 0feh, 003h, 0f0h, 08ch, 0d8h, 08eh, 0c0h, 0fch, 0b9h, 020h
        endif
        if      XL
        db      000h, 0f3h, 0a4h, 007h, 0c3h, 005h, 0ach, 008h, 08bh, 0d8h, 0b9h, 000h, 002h, 0bah, 000h, 000h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0b8h, 0c0h, 0bch, 0e8h, 082h, 002h, 0beh, 0c0h, 0bdh, 08bh, 0feh, 0b9h, 020h, 000h, 0b2h, 000h
        elseif  (XL) && (FW_VERSION = 150)
        db      0b8h, 0a0h, 0bch, 0e8h, 082h, 002h, 0beh, 0a0h, 0bdh, 08bh, 0feh, 0b9h, 020h, 000h, 0b2h, 000h
        elseif  (XL) && (MODEL = 3200)
        db      0b8h, 050h, 0bdh, 0e8h, 082h, 002h, 0beh, 050h, 0beh, 08bh, 0feh, 0b9h, 020h, 000h, 0b2h, 000h
        elseif  (XL) && (FW_VERSION < 150)
        db      0b8h, 0a0h, 0bbh, 0e8h, 082h, 002h, 0beh, 0a0h, 0bch, 08bh, 0feh, 0b9h, 020h, 000h, 0b2h, 000h
        endif
        if      XL
        db      08bh, 004h, 03dh, 0ffh, 0ffh, 074h, 006h, 089h, 005h, 047h, 047h, 0feh, 0c2h, 046h, 046h, 0e2h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0efh, 088h, 016h, 096h, 086h, 0b8h, 0ffh, 0ffh, 089h, 005h, 0c3h, 005h, 0ach, 00ah, 08bh, 0d8h
        db      0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0c0h, 0beh, 0e8h, 04ch, 002h, 0c3h, 050h, 0c1h, 0e8h
        db      002h, 005h, 0ach, 00eh, 08bh, 0d8h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0c0h, 0c0h, 0e8h
        db      036h, 002h, 058h, 024h, 003h, 0b4h, 080h, 0f6h, 0e4h, 0bfh, 0c0h, 0c0h, 08bh, 0f7h, 003h, 0f0h
        elseif  (XL) && (FW_VERSION = 150)
        db      0efh, 088h, 016h, 076h, 086h, 0b8h, 0ffh, 0ffh, 089h, 005h, 0c3h, 005h, 0ach, 00ah, 08bh, 0d8h
        db      0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0a0h, 0beh, 0e8h, 04ch, 002h, 0c3h, 050h, 0c1h, 0e8h
        db      002h, 005h, 0ach, 00eh, 08bh, 0d8h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0a0h, 0c0h, 0e8h
        db      036h, 002h, 058h, 024h, 003h, 0b4h, 080h, 0f6h, 0e4h, 0bfh, 0a0h, 0c0h, 08bh, 0f7h, 003h, 0f0h
        elseif  (XL) && (MODEL = 3200)
        db      0efh, 088h, 016h, 026h, 087h, 0b8h, 0ffh, 0ffh, 089h, 005h, 0c3h, 005h, 0ach, 00ah, 08bh, 0d8h
        db      0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 050h, 0bfh, 0e8h, 04ch, 002h, 0c3h, 050h, 0c1h, 0e8h
        db      002h, 005h, 0ach, 00eh, 08bh, 0d8h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 050h, 0c1h, 0e8h
        db      036h, 002h, 058h, 024h, 003h, 0b4h, 080h, 0f6h, 0e4h, 0bfh, 050h, 0c1h, 08bh, 0f7h, 003h, 0f0h
        elseif  (XL) && (FW_VERSION < 150)
        db      0efh, 088h, 016h, 0d6h, 085h, 0b8h, 0ffh, 0ffh, 089h, 005h, 0c3h, 005h, 0ach, 00ah, 08bh, 0d8h
        db      0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0a0h, 0bdh, 0e8h, 04ch, 002h, 0c3h, 050h, 0c1h, 0e8h
        db      002h, 005h, 0ach, 00eh, 08bh, 0d8h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0a0h, 0bfh, 0e8h
        db      036h, 002h, 058h, 024h, 003h, 0b4h, 080h, 0f6h, 0e4h, 0bfh, 0a0h, 0bfh, 08bh, 0f7h, 003h, 0f0h
        endif
        if      XL
        db      006h, 08ch, 0d8h, 08eh, 0c0h, 0b9h, 080h, 000h, 0fch, 0f3h, 0a4h, 007h, 0c3h, 08ch, 0dbh, 08eh
        db      0c3h, 02bh, 0d2h, 0bbh, 020h, 000h, 0f7h, 0f3h, 052h, 0bbh, 003h, 000h, 0f7h, 0e3h, 005h, 0ach
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      012h, 08bh, 0d8h, 0b9h, 000h, 006h, 0bah, 000h, 000h, 0b8h, 0c0h, 0c9h, 0e8h, 0f9h, 001h, 058h
        db      0b4h, 030h, 0f6h, 0e4h, 0beh, 0c0h, 0c9h, 08bh, 0feh, 003h, 0f0h, 08ch, 0d8h, 08eh, 0c0h, 0fch
        elseif  (XL) && (FW_VERSION = 150)
        db      012h, 08bh, 0d8h, 0b9h, 000h, 006h, 0bah, 000h, 000h, 0b8h, 0a0h, 0c9h, 0e8h, 0f9h, 001h, 058h
        db      0b4h, 030h, 0f6h, 0e4h, 0beh, 0a0h, 0c9h, 08bh, 0feh, 003h, 0f0h, 08ch, 0d8h, 08eh, 0c0h, 0fch
        elseif  (XL) && (MODEL = 3200)
        db      012h, 08bh, 0d8h, 0b9h, 000h, 006h, 0bah, 000h, 000h, 0b8h, 050h, 0cah, 0e8h, 0f9h, 001h, 058h
        db      0b4h, 030h, 0f6h, 0e4h, 0beh, 050h, 0cah, 08bh, 0feh, 003h, 0f0h, 08ch, 0d8h, 08eh, 0c0h, 0fch
        elseif  (XL) && (FW_VERSION < 150)
        db      012h, 08bh, 0d8h, 0b9h, 000h, 006h, 0bah, 000h, 000h, 0b8h, 0a0h, 0c8h, 0e8h, 0f9h, 001h, 058h
        db      0b4h, 030h, 0f6h, 0e4h, 0beh, 0a0h, 0c8h, 08bh, 0feh, 003h, 0f0h, 08ch, 0d8h, 08eh, 0c0h, 0fch
        endif
        if      XL
        db      0b9h, 030h, 000h, 0f3h, 0a4h, 0c3h, 0bbh, 06ch, 005h, 0b9h, 000h, 080h, 0bah, 000h, 0e0h, 0b8h
        db      000h, 000h, 0e8h, 0d3h, 001h, 0b8h, 000h, 0e0h, 0e8h, 040h, 000h, 0bbh, 0ach, 005h, 0b9h, 000h
        db      080h, 0bah, 000h, 0e0h, 0b8h, 000h, 080h, 0e8h, 0beh, 001h, 0b8h, 000h, 0e8h, 0e8h, 02bh, 000h
        db      0bbh, 0ech, 005h, 0b9h, 000h, 080h, 0bah, 000h, 0f0h, 0b8h, 000h, 000h, 0e8h, 0a9h, 001h, 0b8h
        db      000h, 0f0h, 0e8h, 016h, 000h, 0bbh, 02ch, 005h, 0b9h, 000h, 080h, 0bah, 000h, 0f0h, 0b8h, 000h
        db      080h, 0e8h, 094h, 001h, 0b8h, 000h, 0f8h, 0e8h, 001h, 000h, 0c3h, 006h, 08eh, 0c0h, 0beh, 000h
        db      000h, 08bh, 0feh, 026h, 08ah, 004h, 03ch, 0feh, 075h, 005h, 083h, 0c6h, 020h, 0ebh, 00fh, 0b9h
        db      010h, 000h, 026h, 08bh, 004h, 026h, 089h, 005h
        db      "FFGG"
        db      0e2h, 0f4h, 081h, 0feh, 000h, 080h, 075h, 0dfh, 007h, 0c3h, 0bbh, 004h, 004h, 0b9h, 000h, 080h
        db      0bah, 000h, 0d0h, 0b8h, 000h, 000h, 0e8h, 053h, 001h, 0bbh, 044h, 004h, 0b9h, 000h, 080h, 0bah
        db      000h, 0d0h, 0b8h, 000h, 080h, 0e8h, 044h, 001h, 0bbh, 084h, 004h, 0b9h, 000h, 080h, 0bah, 000h
        db      0e0h, 0b8h, 000h, 000h, 0e8h, 035h, 001h, 0bbh, 0c4h, 004h, 0b9h, 000h, 080h, 0bah, 000h, 0e0h
        db      0b8h, 000h, 080h, 0e8h, 026h, 001h, 0c3h, 006h, 08eh, 0c0h, 0beh, 000h, 000h, 08bh, 0feh, 02bh
        db      0dbh, 026h, 08bh, 004h, 03dh, 0feh, 000h, 075h, 005h, 083h, 0c6h, 020h, 0ebh, 014h, 0b9h, 010h
        db      000h, 02bh, 0d2h, 026h, 08bh, 004h, 026h, 089h, 005h, 00bh, 0d0h
        db      "FFGG"
        db      0e2h, 0f2h, 043h, 00bh, 0d2h, 074h, 004h, 03bh, 0f3h, 075h, 0d7h, 04bh, 007h, 0c3h, 056h, 0bbh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      02dh, 0dah, 0e8h, 02fh, 014h, 05eh, 08ch, 0d8h, 08eh, 0c0h, 0b3h, 060h, 0b7h, 038h, 0e8h, 05bh
        db      000h, 0c3h, 0bbh, 04dh, 0dah, 0e9h, 01ch, 014h, 08ah, 003h
        elseif  (XL) && (MODEL = 3200)
        db      0fdh, 0dfh, 0e8h, 02fh, 014h, 05eh, 08ch, 0d8h, 08eh, 0c0h, 0b3h, 060h, 0b7h, 038h, 0e8h, 05bh
        db      000h, 0c3h, 0bbh, 01dh, 0e0h, 0e9h, 01ch, 014h, 08ah, 003h
        elseif  (XL) && (FW_VERSION < 150)
        db      09dh, 0d9h, 0e8h, 033h, 014h, 05eh, 08ch, 0d8h, 08eh, 0c0h, 0b3h, 060h, 0b7h, 038h, 0e8h, 05bh
        db      000h, 0c3h, 0bbh, 0bdh, 0d9h, 0e9h, 020h, 014h, 08ah, 003h
        endif
        if      XL
        db      "8loading sample:             "
        db      0ffh, 08ah, 003h, 038h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0ffh, 056h, 0bbh, 0eah, 0edh, 0e8h, 0d5h, 013h, 05eh, 08ch, 0d8h, 08eh, 0c0h, 0b3h, 063h, 0b7h
        elseif  (XL) && (MODEL = 3200)
        db      0ffh, 056h, 0bbh, 0bah, 0f3h, 0e8h, 0d5h, 013h, 05eh, 08ch, 0d8h, 08eh, 0c0h, 0b3h, 063h, 0b7h
        elseif  (XL) && (FW_VERSION < 150)
        db      0ffh, 056h, 0bbh, 05eh, 0edh, 0e8h, 0d9h, 013h, 05eh, 08ch, 0d8h, 08eh, 0c0h, 0b3h, 063h, 0b7h
        endif
        if      XL
        db      038h, 0e8h, 001h, 000h, 0c3h
        db      "WVPSQR"
        db      006h, 0b0h, 08ah, 0e8h, 020h, 000h, 08ah, 0c3h, 0e8h, 01bh, 000h, 08ah, 0c7h, 0e8h, 016h, 000h
        db      0b9h, 00ch, 000h, 026h, 08ah, 004h, 024h, 07fh, 046h, 0e8h, 00ah, 000h, 0e2h, 0f5h, 007h, 05ah
        db      059h, 05bh, 058h, 05eh, 05fh, 0c3h
        db      "PSVQ"
        endif
        if      (XL) && (MODEL = 3000)
        db      006h, 01eh, 00eh, 0e8h, 061h, 084h, 01fh, 007h, 059h, 05eh, 05bh, 058h, 0c3h, 050h, 0b0h, 08ah
        elseif  (XL) && (MODEL = 3200)
        db      006h, 01eh, 00eh, 0e8h, 0e1h, 07eh, 01fh, 007h, 059h, 05eh, 05bh, 058h, 0c3h, 050h, 0b0h, 08ah
        endif
        if      XL
        db      0e8h, 0e9h, 0ffh, 08ah, 0c3h, 0e8h, 0e4h, 0ffh, 08ah, 0c7h, 0e8h, 0dfh, 0ffh, 058h, 02ah, 0e4h
        db      0b1h, 064h, 0f6h, 0f1h, 08ah, 0d8h, 00ch, 030h, 03ch, 030h, 075h, 002h, 0b0h, 020h, 0e8h, 0cbh
        db      0ffh, 08ah, 0c4h, 02ah, 0e4h, 0b1h, 00ah, 0f6h, 0f1h, 080h, 0fbh, 000h, 075h, 008h, 00ch, 030h
        db      03ch, 030h, 075h, 002h, 0b0h, 020h, 0e8h, 0b3h, 0ffh, 08ah, 0c4h, 00ch, 030h, 0e8h, 0ach, 0ffh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0c3h, 053h, 083h, 0e3h, 00fh, 088h, 01eh, 0a5h, 07fh, 05bh, 0c1h, 0ebh, 004h, 089h, 01eh, 0abh
        elseif  (XL) && (FW_VERSION = 150)
        db      0c3h, 053h, 083h, 0e3h, 00fh, 088h, 01eh, 095h, 07fh, 05bh, 0c1h, 0ebh, 004h, 089h, 01eh, 09bh
        elseif  (XL) && (MODEL = 3200)
        db      0c3h, 053h, 083h, 0e3h, 00fh, 088h, 01eh, 0d5h, 07fh, 05bh, 0c1h, 0ebh, 004h, 089h, 01eh, 0dbh
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      07fh, 08ch, 0dbh, 08eh, 0c3h, 0e8h, 071h, 017h, 0c3h, 057h, 01eh, 006h, 051h, 08ch, 0d8h, 08eh
        elseif  (XL) && (FW_VERSION < 150)
        db      0c3h, 053h, 083h, 0e3h, 00fh, 088h, 01eh, 0f5h, 07eh, 05bh, 0c1h, 0ebh, 004h, 089h, 01eh, 0fbh
        db      07eh, 08ch, 0dbh, 08eh, 0c3h, 0e8h, 075h, 017h, 0c3h, 057h, 01eh, 006h, 051h, 08ch, 0d8h, 08eh
        endif
        if      XL
        db      0c0h, 08ch, 0c8h, 08eh, 0d8h, 0fch, 0b9h, 0c0h, 000h, 0f3h, 0a4h, 059h, 007h, 01fh, 05fh, 0c3h
        db      051h, 0b9h, 00ch, 000h, 08ah, 004h, 0e8h, 008h, 000h, 088h, 005h, 046h, 047h, 0e2h, 0f5h, 059h
        db      0c3h, 0b4h, 027h, 03ch, 02dh, 074h, 044h, 0b4h, 02eh, 03ch, 028h, 074h, 03eh, 0b4h, 026h, 03ch
        db      02bh, 074h, 038h, 0b4h, 025h, 03ch, 023h, 074h, 032h, 0b4h, 00ah, 03ch, 020h, 074h, 02ch, 03ch
        db      030h, 072h, 028h, 03ch, 03ah, 073h, 006h, 02ch, 030h, 08ah, 0e0h, 0ebh, 01eh, 03ch, 041h, 072h
        db      01ah, 03ch, 05bh, 073h, 008h, 02ch, 041h, 004h, 00bh, 08ah, 0e0h, 0ebh, 00eh, 03ch, 061h, 072h
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      00ah, 03ch, 07bh, 073h, 006h, 02ch, 061h, 004h, 00bh, 08ah, 0e0h, 08ah, 0c4h, 0c3h, 000h, 0c7h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      006h, 0ffh, 086h, 000h, 0c0h, 0c7h, 006h, 001h, 087h, 0c0h, 0c2h, 0c7h, 006h, 003h, 087h, 000h
        db      0cdh, 0c6h, 006h, 0c3h, 086h, 000h, 0c6h, 006h, 051h, 07fh, 000h, 0c6h, 006h, 0aeh, 072h, 000h
        elseif  (XL) && (FW_VERSION = 150)
        db      006h, 0dfh, 086h, 000h, 0c0h, 0c7h, 006h, 0e1h, 086h, 0c0h, 0c2h, 0c7h, 006h, 0e3h, 086h, 000h
        db      0cdh, 0c6h, 006h, 0a3h, 086h, 000h, 0c6h, 006h, 041h, 07fh, 000h, 0c6h, 006h, 09eh, 072h, 000h
        elseif  (XL) && (MODEL = 3200)
        db      006h, 08fh, 087h, 000h, 0c0h, 0c7h, 006h, 091h, 087h, 0c0h, 0c2h, 0c7h, 006h, 093h, 087h, 000h
        db      0cdh, 0c6h, 006h, 053h, 087h, 000h, 0c6h, 006h, 081h, 07fh, 000h, 0c6h, 006h, 0deh, 072h, 000h
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      0b0h, 00dh, 0e8h, 0e4h, 016h, 0e8h, 065h, 016h, 03ch, 002h, 074h, 002h, 0ebh, 050h, 0e8h, 0ech
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      001h, 0bbh, 010h, 0dch, 0e8h, 081h, 012h, 0beh, 0beh, 0b9h, 0b3h, 019h, 0b7h, 019h, 0b9h, 004h
        db      000h, 0e8h, 034h, 012h, 0c7h, 006h, 0b1h, 086h, 000h, 000h, 0c7h, 006h, 0b3h, 086h, 063h, 000h
        db      0c6h, 006h, 0b5h, 086h, 000h, 0c6h, 006h, 0b6h, 086h, 000h, 0e8h, 0c2h, 083h, 0e8h, 08ch, 00fh
        db      0e8h, 0f6h, 00fh, 0ffh, 016h, 029h, 087h, 0bbh, 0d0h, 0ddh, 0e8h, 04bh, 012h, 0e8h, 0afh, 083h
        db      0c6h, 006h, 0b0h, 086h, 001h, 0c6h, 006h, 0f1h, 07fh, 001h, 08ch, 0d8h, 08eh, 0c0h, 0cbh, 083h
        elseif  (XL) && (FW_VERSION = 150)
        db      001h, 0bbh, 010h, 0dch, 0e8h, 081h, 012h, 0beh, 09eh, 0b9h, 0b3h, 019h, 0b7h, 019h, 0b9h, 004h
        db      000h, 0e8h, 034h, 012h, 0c7h, 006h, 091h, 086h, 000h, 000h, 0c7h, 006h, 093h, 086h, 063h, 000h
        db      0c6h, 006h, 095h, 086h, 000h, 0c6h, 006h, 096h, 086h, 000h, 0e8h, 0c2h, 083h, 0e8h, 08ch, 00fh
        db      0e8h, 0f6h, 00fh, 0ffh, 016h, 009h, 087h, 0bbh, 0d0h, 0ddh, 0e8h, 04bh, 012h, 0e8h, 0afh, 083h
        db      0c6h, 006h, 090h, 086h, 001h, 0c6h, 006h, 0e1h, 07fh, 001h, 08ch, 0d8h, 08eh, 0c0h, 0cbh, 083h
        elseif  (XL) && (MODEL = 3200)
        db      001h, 0bbh, 0e0h, 0e1h, 0e8h, 081h, 012h, 0beh, 04eh, 0bah, 0b3h, 019h, 0b7h, 019h, 0b9h, 004h
        db      000h, 0e8h, 034h, 012h, 0c7h, 006h, 041h, 087h, 000h, 000h, 0c7h, 006h, 043h, 087h, 063h, 000h
        db      0c6h, 006h, 045h, 087h, 000h, 0c6h, 006h, 046h, 087h, 000h, 0e8h, 042h, 07eh, 0e8h, 08ch, 00fh
        db      0e8h, 0f6h, 00fh, 0ffh, 016h, 0b9h, 087h, 0bbh, 0a0h, 0e3h, 0e8h, 04bh, 012h, 0e8h, 02fh, 07eh
        db      0c6h, 006h, 040h, 087h, 001h, 0c6h, 006h, 021h, 080h, 001h, 08ch, 0d8h, 08eh, 0c0h, 0cbh, 083h
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      081h, 092h, 058h, 002h, 002h, 092h, 058h, 002h, 003h, 092h, 058h, 002h, 004h, 092h, 058h, 002h
        db      005h, 092h, 058h, 002h, 006h, 092h, 058h, 002h, 007h, 092h, 058h, 002h, 008h, 092h, 058h, 002h
        db      009h, 092h, 058h, 002h, 00ah, 085h, 08ah, 005h, 003h
        elseif  (XL) && (FW_VERSION < 150)
        db      00ah, 03ch, 07bh, 073h, 006h, 02ch, 061h, 004h, 00bh, 08ah, 0e0h, 08ah, 0c4h, 0c3h, 000h, 089h
        db      026h, 0f8h, 085h, 0c7h, 006h, 03fh, 086h, 000h, 0c0h, 0c7h, 006h, 041h, 086h, 0c0h, 0c2h, 0c7h
        db      006h, 043h, 086h, 000h, 0cdh, 0c6h, 006h, 003h, 086h, 000h, 0c6h, 006h, 0a1h, 07eh, 000h, 0c6h
        db      006h, 0feh, 071h, 000h, 0b0h, 00dh, 0e8h, 0e4h, 016h, 0e8h, 065h, 016h, 03ch, 002h, 074h, 002h
        db      0ebh, 050h, 0e8h, 0ech, 001h, 0bbh, 084h, 0dbh, 0e8h, 081h, 012h, 0beh, 09eh, 0b8h, 0b3h, 019h
        db      0b7h, 019h, 0b9h, 004h, 000h, 0e8h, 034h, 012h, 0c7h, 006h, 0f1h, 085h, 000h, 000h, 0c7h, 006h
        db      0f3h, 085h, 063h, 000h, 0c6h, 006h, 0f5h, 085h, 000h, 0c6h, 006h, 0f6h, 085h, 000h, 0e8h, 0beh
        db      083h, 0e8h, 08ch, 00fh, 0e8h, 0f6h, 00fh, 0ffh, 016h, 069h, 086h, 0bbh, 044h, 0ddh, 0e8h, 04bh
        db      012h, 0e8h, 0abh, 083h, 0c6h, 006h, 0f0h, 085h, 001h, 0c6h, 006h, 041h, 07fh, 001h, 08ch, 0d8h
        db      08eh, 0c0h, 0cbh, 083h, 081h, 092h, 058h, 002h, 002h, 092h, 058h, 002h, 003h, 092h, 058h, 002h
        db      004h, 092h, 058h, 002h, 005h, 092h, 058h, 002h, 006h, 092h, 058h, 002h, 007h, 092h, 058h, 002h
        db      008h, 092h, 058h, 002h, 009h, 092h, 058h, 002h, 00ah, 085h, 08ah, 005h, 003h
        endif
        if      XL
        db      " EMU3   CD-ROM"
        db      084h, 092h, 05ch, 000h, 000h, 092h, 05ch, 000h, 00ch, 093h, 00dh, 000h, 000h, 093h, 00dh, 05bh
        db      000h, 08ah, 00ah, 00fh
        db      "[[ Volume ]]"
        db      092h, 07ah, 000h, 017h, 092h, 07ah, 000h, 021h, 093h, 00bh, 000h, 017h, 093h, 00bh, 07ah, 017h
        db      093h, 00bh, 015h, 017h, 092h, 006h, 07bh, 01bh, 093h, 028h, 081h, 006h, 092h, 009h, 081h, 006h
        db      092h, 009h, 081h, 00eh, 092h, 009h, 081h, 016h, 092h, 009h, 081h, 01eh, 092h, 009h, 081h, 026h
        db      092h, 009h, 081h, 02eh, 092h, 0f0h, 000h, 036h, 0ffh, 0c3h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        phase   0dca2h
        endif
        if      XL
far_329b2:
        mov     word ptr [A_86B8], sp
        cmp     byte ptr [A_86B0], 0
        jnz     br_329bf
        stc
        retf
br_329bf:
        sub     ax, ax
        xchg    byte ptr [A_7285], al
        cmp     al, 0
        jz      br_329d3
        cbw
        mov     bx, 1
        call    word ptr [A_871F]
        jmp     br_32a3e
br_329d3:
        sub     ax, ax
        xchg    byte ptr [A_7284], al
        or      al, al
        jz      br_32a03
        mov     bx, word ptr [A_8721]
        cmp     al, 0fbh
        jz      br_329ff
        mov     bx, word ptr [A_8723]
        cmp     al, 5
        jz      br_329ff
        mov     bx, word ptr [A_8725]
        cmp     al, 0ffh
        jz      br_329ff
        mov     bx, word ptr [A_8727]
        cmp     al, 1
        jz      br_329ff
        jmp     br_32a03
br_329ff:
        call    bx
        jmp     br_32a3e
br_32a03:
        mov     al, byte ptr [A_72AE]
        cmp     al, 0c0h
        jnc     br_32a55
        mov     byte ptr [A_72AE], 0
        or      al, al
        jz      br_32a47
        cmp     al, 40h
        jc      br_32a47
        cmp     al, 48h
        jnc     br_32a47
        cmp     byte ptr [A_86C3], 0
        jz      br_32a30
        push    ax
        mov     al, 0dh
        mov     bp, A_B7EF
        callf   SEG_MAIN:far_1fbaa
        pop     ax
        jmp     br_32a3e
br_32a30:
        sub     al, 40h
        shl     al, 1
        mov     bl, al
        sub     bh, bh
        mov     ax, word ptr [bx - A_78D5]
        call    ax
br_32a3e:
        call    word ptr [A_8729]
        mov     byte ptr [A_86C3], 0
br_32a47:
        call    fn_2acc0
loop_32a4a:
        mov     byte ptr [A_72AE], 0
        mov     ax, ds
        mov     es, ax
        clc
        retf
br_32a55:
        cmp     al, 0c4h
        jz      loop_32a4a
        cmp     al, 0c3h
        jz      loop_32a4a
        mov     bx, A_DD9C
        call    fn_33b59
        mov     al, 83h
        push    cs
        call    far_2ac28
        mov     al, 81h
        push    cs
        call    far_2ac28
        mov     byte ptr [A_7FF1], 0
        mov     byte ptr [A_86B0], 0
        mov     ax, ds
        mov     es, ax
        mov     byte ptr [A_83AB], 0
        stc
        retf
br_32a84:
        mov     byte ptr [A_86C3], 0
        mov     byte ptr [A_86B0], 0
        mov     byte ptr [A_7F64], 0
        mov     byte ptr [A_83AB], 0
        mov     bx, A_DDA5
        call    fn_33b59
        mov     byte ptr [A_72AE], 0c7h
        mov     ax, ds
        mov     es, ax
        jmpf    SEG_MAIN:far_1fbad
        db      08ch, 060h, 01bh, 009h, 08dh, 060h, 001h, 037h, 0ffh, 08ch, 040h, 01bh, 009h, 08dh, 040h, 001h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      037h, 0ffh, 0e8h, 037h, 011h, 028h, 0deh, 051h, 0deh, 056h, 0deh, 005h, 0efh, 05bh, 0deh, 05dh
        db      0deh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 0c1h, 0deh, 092h
        db      0deh, 0d0h, 0ddh, 0c3h, 08ah, 003h, 038h
        elseif  (XL) && (MODEL = 3200)
        db      037h, 0ffh, 0e8h, 037h, 011h, 0f8h, 0e3h, 021h, 0e4h, 026h, 0e4h, 0d5h, 0f4h, 02bh, 0e4h, 02dh
        db      0e4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 091h, 0e4h, 062h
        db      0e4h, 0a0h, 0e3h, 0c3h, 08ah, 003h, 038h
        elseif  (XL) && (FW_VERSION < 150)
        db      037h, 0ffh, 0e8h, 037h, 011h, 09ch, 0ddh, 0c5h, 0ddh, 0cah, 0ddh, 079h, 0eeh, 0cfh, 0ddh, 0d1h
        db      0ddh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 035h, 0deh, 006h
        db      0deh, 044h, 0ddh, 0c3h, 08ah, 003h, 038h
        endif
        if      XL
        db      27h dup (020h)
        db      08ah, 0d5h
        db      "8 GO "
        db      092h, 01bh, 0d3h, 037h, 092h, 01bh, 0d3h, 03fh, 093h, 009h, 0d3h, 037h, 093h, 009h, 0edh, 037h
        db      08ah, 0bah
        db      "8CLR"
        db      092h, 01bh, 0b5h, 037h, 092h, 01bh, 0b5h, 03fh, 093h, 009h, 0b5h, 037h, 093h, 009h, 0cfh, 037h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0ffh, 08bh, 01eh, 0b1h, 086h, 003h, 0c3h, 079h, 002h, 02bh, 0c0h, 03bh, 006h, 0b3h, 086h, 072h
        db      004h, 0a1h, 0b3h, 086h, 048h, 0a3h, 0b1h, 086h, 03bh, 0c3h, 074h, 00dh, 0e8h, 0a4h, 00dh, 0c6h
        db      006h, 0b5h, 086h, 000h, 0c6h, 006h, 0b6h, 086h, 000h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 0d2h, 0b8h
        db      001h, 000h, 0ebh, 0cdh, 0ebh, 073h, 006h, 08bh, 01eh, 005h, 087h, 08ah, 047h, 011h, 0b3h, 002h
        db      0b7h, 019h, 0e8h, 0eeh, 00fh, 08ch, 0d8h, 08eh, 0c0h, 08bh, 036h, 005h, 087h, 0b3h, 019h, 0b7h
        elseif  (XL) && (FW_VERSION = 150)
        db      0ffh, 08bh, 01eh, 091h, 086h, 003h, 0c3h, 079h, 002h, 02bh, 0c0h, 03bh, 006h, 093h, 086h, 072h
        db      004h, 0a1h, 093h, 086h, 048h, 0a3h, 091h, 086h, 03bh, 0c3h, 074h, 00dh, 0e8h, 0a4h, 00dh, 0c6h
        db      006h, 095h, 086h, 000h, 0c6h, 006h, 096h, 086h, 000h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 0d2h, 0b8h
        db      001h, 000h, 0ebh, 0cdh, 0ebh, 073h, 006h, 08bh, 01eh, 0e5h, 086h, 08ah, 047h, 011h, 0b3h, 002h
        db      0b7h, 019h, 0e8h, 0eeh, 00fh, 08ch, 0d8h, 08eh, 0c0h, 08bh, 036h, 0e5h, 086h, 0b3h, 019h, 0b7h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      019h, 0b9h, 010h, 000h, 0e8h, 08bh, 00fh, 0e8h, 0f0h, 000h, 0bbh, 089h, 0deh, 0e8h, 0c2h, 00fh
        elseif  (XL) && (MODEL = 3200)
        db      0ffh, 08bh, 01eh, 041h, 087h, 003h, 0c3h, 079h, 002h, 02bh, 0c0h, 03bh, 006h, 043h, 087h, 072h
        db      004h, 0a1h, 043h, 087h, 048h, 0a3h, 041h, 087h, 03bh, 0c3h, 074h, 00dh, 0e8h, 0a4h, 00dh, 0c6h
        db      006h, 045h, 087h, 000h, 0c6h, 006h, 046h, 087h, 000h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 0d2h, 0b8h
        db      001h, 000h, 0ebh, 0cdh, 0ebh, 073h, 006h, 08bh, 01eh, 095h, 087h, 08ah, 047h, 011h, 0b3h, 002h
        db      0b7h, 019h, 0e8h, 0eeh, 00fh, 08ch, 0d8h, 08eh, 0c0h, 08bh, 036h, 095h, 087h, 0b3h, 019h, 0b7h
        db      019h, 0b9h, 010h, 000h, 0e8h, 08bh, 00fh, 0e8h, 0f0h, 000h, 0bbh, 059h, 0e4h, 0e8h, 0c2h, 00fh
        elseif  (XL) && (FW_VERSION < 150)
        db      0ffh, 08bh, 01eh, 0f1h, 085h, 003h, 0c3h, 079h, 002h, 02bh, 0c0h, 03bh, 006h, 0f3h, 085h, 072h
        db      004h, 0a1h, 0f3h, 085h, 048h, 0a3h, 0f1h, 085h, 03bh, 0c3h, 074h, 00dh, 0e8h, 0a4h, 00dh, 0c6h
        db      006h, 0f5h, 085h, 000h, 0c6h, 006h, 0f6h, 085h, 000h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 0d2h, 0b8h
        db      001h, 000h, 0ebh, 0cdh, 0ebh, 073h, 006h, 08bh, 01eh, 045h, 086h, 08ah, 047h, 011h, 0b3h, 002h
        db      0b7h, 019h, 0e8h, 0eeh, 00fh, 08ch, 0d8h, 08eh, 0c0h, 08bh, 036h, 045h, 086h, 0b3h, 019h, 0b7h
        db      019h, 0b9h, 010h, 000h, 0e8h, 08bh, 00fh, 0e8h, 0f0h, 000h, 0bbh, 0fdh, 0ddh, 0e8h, 0c2h, 00fh
        endif
        if      XL
        db      007h, 0c3h, 08ch, 060h, 064h, 009h, 08dh, 060h, 016h, 018h, 0ffh, 0b0h, 00dh, 0e8h, 003h, 014h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      02bh, 0c0h, 0a0h, 0b5h, 086h, 08ah, 026h, 0b6h, 086h, 050h, 0c6h, 006h, 0b6h, 086h, 000h, 0a2h
        db      0b5h, 086h, 050h, 0e8h, 0f6h, 002h, 058h, 072h, 008h, 0feh, 0c0h, 03ah, 006h, 0b7h, 086h, 075h
        db      0eeh, 058h, 0a2h, 0b5h, 086h, 088h, 026h, 0b6h, 086h, 0c3h, 0c7h, 006h, 0fbh, 086h, 092h, 0deh
        db      0c7h, 006h, 0fdh, 086h, 0aeh, 0ddh, 0e9h, 0cfh, 001h, 0e8h, 015h, 010h, 0f2h, 0deh, 05ch, 0dfh
        elseif  (XL) && (FW_VERSION = 150)
        db      02bh, 0c0h, 0a0h, 095h, 086h, 08ah, 026h, 096h, 086h, 050h, 0c6h, 006h, 096h, 086h, 000h, 0a2h
        db      095h, 086h, 050h, 0e8h, 0f6h, 002h, 058h, 072h, 008h, 0feh, 0c0h, 03ah, 006h, 097h, 086h, 075h
        db      0eeh, 058h, 0a2h, 095h, 086h, 088h, 026h, 096h, 086h, 0c3h, 0c7h, 006h, 0dbh, 086h, 092h, 0deh
        db      0c7h, 006h, 0ddh, 086h, 0aeh, 0ddh, 0e9h, 0cfh, 001h, 0e8h, 015h, 010h, 0f2h, 0deh, 05ch, 0dfh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      061h, 0dfh, 066h, 0dfh, 005h, 0efh, 071h, 0dfh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh
        db      005h, 0efh, 005h, 0efh, 091h, 0e0h, 0a3h, 0e1h, 0d0h, 0ddh, 0c3h, 0d0h, 0e4h, 072h, 03fh, 080h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      03eh, 0b6h, 086h, 005h, 074h, 01dh, 002h, 006h, 0b6h, 086h, 03ch, 006h, 072h, 002h, 0b0h, 005h
        db      03ah, 006h, 0b7h, 086h, 072h, 009h, 0a0h, 0b7h, 086h, 03ch, 000h, 074h, 002h, 0feh, 0c8h, 0a2h
        db      0b6h, 086h, 0c3h, 002h, 006h, 0b5h, 086h, 073h, 002h, 0b0h, 0ffh, 08ah, 026h, 0b7h, 086h, 080h
        db      0ech, 005h, 03ah, 0c4h, 072h, 004h, 08ah, 0c4h, 0feh, 0c8h, 0a2h, 0b5h, 086h, 0c3h, 0f6h, 0d8h
        db      080h, 03eh, 0b6h, 086h, 000h, 074h, 00fh, 08ah, 026h, 0b6h, 086h, 02ah, 0e0h, 073h, 002h, 02ah
        db      0e4h, 088h, 026h, 0b6h, 086h, 0c3h, 08ah, 026h, 0b5h, 086h, 02ah, 0e0h, 073h, 002h, 02ah, 0e4h
        db      088h, 026h, 0b5h, 086h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 091h, 0b8h, 001h, 000h, 0ebh, 08ch, 0e9h
        elseif  (XL) && (FW_VERSION = 150)
        db      03eh, 096h, 086h, 005h, 074h, 01dh, 002h, 006h, 096h, 086h, 03ch, 006h, 072h, 002h, 0b0h, 005h
        db      03ah, 006h, 097h, 086h, 072h, 009h, 0a0h, 097h, 086h, 03ch, 000h, 074h, 002h, 0feh, 0c8h, 0a2h
        db      096h, 086h, 0c3h, 002h, 006h, 095h, 086h, 073h, 002h, 0b0h, 0ffh, 08ah, 026h, 097h, 086h, 080h
        db      0ech, 005h, 03ah, 0c4h, 072h, 004h, 08ah, 0c4h, 0feh, 0c8h, 0a2h, 095h, 086h, 0c3h, 0f6h, 0d8h
        db      080h, 03eh, 096h, 086h, 000h, 074h, 00fh, 08ah, 026h, 096h, 086h, 02ah, 0e0h, 073h, 002h, 02ah
        db      0e4h, 088h, 026h, 096h, 086h, 0c3h, 08ah, 026h, 095h, 086h, 02ah, 0e0h, 073h, 002h, 02ah, 0e4h
        db      088h, 026h, 095h, 086h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 091h, 0b8h, 001h, 000h, 0ebh, 08ch, 0e9h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      045h, 0feh, 0b0h, 00dh, 0e8h, 02ch, 013h, 0e9h, 032h, 002h, 006h, 0bbh, 0d0h, 0ddh, 0e8h, 0d1h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      00eh, 0e8h, 005h, 000h, 0e8h, 0d4h, 000h, 007h, 0c3h, 08eh, 006h, 0ffh, 086h, 0bfh, 006h, 000h
        db      0b3h, 08ch, 0b7h, 002h, 0a0h, 0b5h, 086h, 02ah, 0e4h, 0c1h, 0e0h, 002h, 003h, 006h, 0cdh, 086h
        elseif  (XL) && (FW_VERSION = 150)
        db      00eh, 0e8h, 005h, 000h, 0e8h, 0d4h, 000h, 007h, 0c3h, 08eh, 006h, 0dfh, 086h, 0bfh, 006h, 000h
        db      0b3h, 08ch, 0b7h, 002h, 0a0h, 095h, 086h, 02ah, 0e4h, 0c1h, 0e0h, 002h, 003h, 006h, 0adh, 086h
        elseif  (XL) && (MODEL = 3200)
        db      02bh, 0c0h, 0a0h, 045h, 087h, 08ah, 026h, 046h, 087h, 050h, 0c6h, 006h, 046h, 087h, 000h, 0a2h
        db      045h, 087h, 050h, 0e8h, 0f6h, 002h, 058h, 072h, 008h, 0feh, 0c0h, 03ah, 006h, 047h, 087h, 075h
        db      0eeh, 058h, 0a2h, 045h, 087h, 088h, 026h, 046h, 087h, 0c3h, 0c7h, 006h, 08bh, 087h, 062h, 0e4h
        db      0c7h, 006h, 08dh, 087h, 07eh, 0e3h, 0e9h, 0cfh, 001h, 0e8h, 015h, 010h, 0c2h, 0e4h, 02ch, 0e5h
        db      031h, 0e5h, 036h, 0e5h, 0d5h, 0f4h, 041h, 0e5h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h
        db      0d5h, 0f4h, 0d5h, 0f4h, 061h, 0e6h, 073h, 0e7h, 0a0h, 0e3h, 0c3h, 0d0h, 0e4h, 072h, 03fh, 080h
        db      03eh, 046h, 087h, 005h, 074h, 01dh, 002h, 006h, 046h, 087h, 03ch, 006h, 072h, 002h, 0b0h, 005h
        db      03ah, 006h, 047h, 087h, 072h, 009h, 0a0h, 047h, 087h, 03ch, 000h, 074h, 002h, 0feh, 0c8h, 0a2h
        db      046h, 087h, 0c3h, 002h, 006h, 045h, 087h, 073h, 002h, 0b0h, 0ffh, 08ah, 026h, 047h, 087h, 080h
        db      0ech, 005h, 03ah, 0c4h, 072h, 004h, 08ah, 0c4h, 0feh, 0c8h, 0a2h, 045h, 087h, 0c3h, 0f6h, 0d8h
        db      080h, 03eh, 046h, 087h, 000h, 074h, 00fh, 08ah, 026h, 046h, 087h, 02ah, 0e0h, 073h, 002h, 02ah
        db      0e4h, 088h, 026h, 046h, 087h, 0c3h, 08ah, 026h, 045h, 087h, 02ah, 0e0h, 073h, 002h, 02ah, 0e4h
        db      088h, 026h, 045h, 087h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 091h, 0b8h, 001h, 000h, 0ebh, 08ch, 0e9h
        db      045h, 0feh, 0b0h, 00dh, 0e8h, 02ch, 013h, 0e9h, 032h, 002h, 006h, 0bbh, 0a0h, 0e3h, 0e8h, 0d1h
        db      00eh, 0e8h, 005h, 000h, 0e8h, 0d4h, 000h, 007h, 0c3h, 08eh, 006h, 08fh, 087h, 0bfh, 006h, 000h
        db      0b3h, 08ch, 0b7h, 002h, 0a0h, 045h, 087h, 02ah, 0e4h, 0c1h, 0e0h, 002h, 003h, 006h, 05dh, 087h
        elseif  (XL) && (FW_VERSION < 150)
        db      02bh, 0c0h, 0a0h, 0f5h, 085h, 08ah, 026h, 0f6h, 085h, 050h, 0c6h, 006h, 0f6h, 085h, 000h, 0a2h
        db      0f5h, 085h, 050h, 0e8h, 0f6h, 002h, 058h, 072h, 008h, 0feh, 0c0h, 03ah, 006h, 0f7h, 085h, 075h
        db      0eeh, 058h, 0a2h, 0f5h, 085h, 088h, 026h, 0f6h, 085h, 0c3h, 0c7h, 006h, 03bh, 086h, 006h, 0deh
        db      0c7h, 006h, 03dh, 086h, 022h, 0ddh, 0e9h, 0cfh, 001h, 0e8h, 015h, 010h, 066h, 0deh, 0d0h, 0deh
        db      0d5h, 0deh, 0dah, 0deh, 079h, 0eeh, 0e5h, 0deh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh
        db      079h, 0eeh, 079h, 0eeh, 005h, 0e0h, 017h, 0e1h, 044h, 0ddh, 0c3h, 0d0h, 0e4h, 072h, 03fh, 080h
        db      03eh, 0f6h, 085h, 005h, 074h, 01dh, 002h, 006h, 0f6h, 085h, 03ch, 006h, 072h, 002h, 0b0h, 005h
        db      03ah, 006h, 0f7h, 085h, 072h, 009h, 0a0h, 0f7h, 085h, 03ch, 000h, 074h, 002h, 0feh, 0c8h, 0a2h
        db      0f6h, 085h, 0c3h, 002h, 006h, 0f5h, 085h, 073h, 002h, 0b0h, 0ffh, 08ah, 026h, 0f7h, 085h, 080h
        db      0ech, 005h, 03ah, 0c4h, 072h, 004h, 08ah, 0c4h, 0feh, 0c8h, 0a2h, 0f5h, 085h, 0c3h, 0f6h, 0d8h
        db      080h, 03eh, 0f6h, 085h, 000h, 074h, 00fh, 08ah, 026h, 0f6h, 085h, 02ah, 0e0h, 073h, 002h, 02ah
        db      0e4h, 088h, 026h, 0f6h, 085h, 0c3h, 08ah, 026h, 0f5h, 085h, 02ah, 0e0h, 073h, 002h, 02ah, 0e4h
        db      088h, 026h, 0f5h, 085h, 0c3h, 0b8h, 0ffh, 0ffh, 0ebh, 091h, 0b8h, 001h, 000h, 0ebh, 08ch, 0e9h
        db      045h, 0feh, 0b0h, 00dh, 0e8h, 02ch, 013h, 0e9h, 032h, 002h, 006h, 0bbh, 044h, 0ddh, 0e8h, 0d1h
        db      00eh, 0e8h, 005h, 000h, 0e8h, 0d4h, 000h, 007h, 0c3h, 08eh, 006h, 03fh, 086h, 0bfh, 006h, 000h
        db      0b3h, 08ch, 0b7h, 002h, 0a0h, 0f5h, 085h, 02ah, 0e4h, 0c1h, 0e0h, 002h, 003h, 006h, 00dh, 086h
        endif
        if      XL
        db      08bh, 0f0h, 026h, 08bh, 004h, 026h, 08bh, 054h, 002h, 026h, 08bh, 04ch, 004h, 083h, 0c6h, 004h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      02bh, 0c8h, 074h, 035h, 02bh, 006h, 0d3h, 086h, 01bh, 016h, 0d5h, 086h, 057h, 056h, 006h, 053h
        db      0b9h, 000h, 004h, 0e8h, 018h, 00dh, 05bh, 080h, 03eh, 019h, 087h, 000h, 075h, 00ah, 08eh, 006h
        db      001h, 087h, 0b9h, 010h, 000h, 0e8h, 03ah, 00eh, 007h, 05eh, 05fh, 080h, 03eh, 019h, 087h, 000h
        db      075h, 045h, 080h, 0c7h, 008h, 04fh, 075h, 0bah, 0c3h, 0a0h, 0b7h, 086h, 02ah, 0e4h, 0c1h, 0e0h
        db      002h, 003h, 006h, 0cdh, 086h, 03bh, 0f0h
        elseif  (XL) && (FW_VERSION = 150)
        db      02bh, 0c8h, 074h, 035h, 02bh, 006h, 0b3h, 086h, 01bh, 016h, 0b5h, 086h, 057h, 056h, 006h, 053h
        db      0b9h, 000h, 004h, 0e8h, 018h, 00dh, 05bh, 080h, 03eh, 0f9h, 086h, 000h, 075h, 00ah, 08eh, 006h
        db      0e1h, 086h, 0b9h, 010h, 000h, 0e8h, 03ah, 00eh, 007h, 05eh, 05fh, 080h, 03eh, 0f9h, 086h, 000h
        db      075h, 045h, 080h, 0c7h, 008h, 04fh, 075h, 0bah, 0c3h, 0a0h, 097h, 086h, 02ah, 0e4h, 0c1h, 0e0h
        db      002h, 003h, 006h, 0adh, 086h, 03bh, 0f0h
        elseif  (XL) && (MODEL = 3200)
        db      02bh, 0c8h, 074h, 035h, 02bh, 006h, 063h, 087h, 01bh, 016h, 065h, 087h, 057h, 056h, 006h, 053h
        db      0b9h, 000h, 004h, 0e8h, 018h, 00dh, 05bh, 080h, 03eh, 0a9h, 087h, 000h, 075h, 00ah, 08eh, 006h
        db      091h, 087h, 0b9h, 010h, 000h, 0e8h, 03ah, 00eh, 007h, 05eh, 05fh, 080h, 03eh, 0a9h, 087h, 000h
        db      075h, 045h, 080h, 0c7h, 008h, 04fh, 075h, 0bah, 0c3h, 0a0h, 047h, 087h, 02ah, 0e4h, 0c1h, 0e0h
        db      002h, 003h, 006h, 05dh, 087h, 03bh, 0f0h
        elseif  (XL) && (FW_VERSION < 150)
        db      02bh, 0c8h, 074h, 035h, 02bh, 006h, 013h, 086h, 01bh, 016h, 015h, 086h, 057h, 056h, 006h, 053h
        db      0b9h, 000h, 004h, 0e8h, 018h, 00dh, 05bh, 080h, 03eh, 059h, 086h, 000h, 075h, 00ah, 08eh, 006h
        db      041h, 086h, 0b9h, 010h, 000h, 0e8h, 03ah, 00eh, 007h, 05eh, 05fh, 080h, 03eh, 059h, 086h, 000h
        db      075h, 045h, 080h, 0c7h, 008h, 04fh, 075h, 0bah, 0c3h, 0a0h, 0f7h, 085h, 02ah, 0e4h, 0c1h, 0e0h
        db      002h, 003h, 006h, 00dh, 086h, 03bh, 0f0h
        endif
        if      XL
        db      "t.WV"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      006h, 053h, 08ch, 0c8h, 08eh, 0c0h, 0beh, 042h, 0e0h, 0b9h, 00dh, 000h, 0e8h, 008h, 00eh, 080h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0c3h, 04eh, 0b8h, 006h, 000h, 02bh, 0c7h, 002h, 006h, 0b5h, 086h, 0e8h, 04ah, 00eh, 05bh, 007h
        elseif  (XL) && (FW_VERSION = 150)
        db      0c3h, 04eh, 0b8h, 006h, 000h, 02bh, 0c7h, 002h, 006h, 095h, 086h, 0e8h, 04ah, 00eh, 05bh, 007h
        elseif  (XL) && (MODEL = 3200)
        db      006h, 053h, 08ch, 0c8h, 08eh, 0c0h, 0beh, 012h, 0e6h, 0b9h, 00dh, 000h, 0e8h, 008h, 00eh, 080h
        db      0c3h, 04eh, 0b8h, 006h, 000h, 02bh, 0c7h, 002h, 006h, 045h, 087h, 0e8h, 04ah, 00eh, 05bh, 007h
        elseif  (XL) && (FW_VERSION < 150)
        db      006h, 053h, 08ch, 0c8h, 08eh, 0c0h, 0beh, 0b6h, 0dfh, 0b9h, 00dh, 000h, 0e8h, 008h, 00eh, 080h
        db      0c3h, 04eh, 0b8h, 006h, 000h, 02bh, 0c7h, 002h, 006h, 0f5h, 085h, 0e8h, 04ah, 00eh, 05bh, 007h
        endif
        if      XL
        db      05eh, 05fh, 080h, 0c7h, 008h, 04fh, 074h, 003h, 0e9h, 07ch, 0ffh, 0c3h, 08ch, 0c8h, 08eh, 0c0h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0b9h, 010h, 000h, 0beh, 032h, 0e0h, 0e8h, 0deh, 00dh, 080h, 0c7h, 008h, 04fh, 075h, 0f1h, 0c3h
        elseif  (XL) && (MODEL = 3200)
        db      0b9h, 010h, 000h, 0beh, 002h, 0e6h, 0e8h, 0deh, 00dh, 080h, 0c7h, 008h, 04fh, 075h, 0f1h, 0c3h
        elseif  (XL) && (FW_VERSION < 150)
        db      0b9h, 010h, 000h, 0beh, 0a6h, 0dfh, 0e8h, 0deh, 00dh, 080h, 0c7h, 008h, 04fh, 075h, 0f1h, 0c3h
        endif
        if      XL
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h
        db      02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 02ah, 020h, 020h, 020h, 020h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0bbh, 06eh, 0e0h, 0e8h, 0f1h, 00dh, 0a0h, 0b6h, 086h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 0b4h
        elseif  (XL) && (FW_VERSION = 150)
        db      0bbh, 06eh, 0e0h, 0e8h, 0f1h, 00dh, 0a0h, 096h, 086h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 0b4h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      005h, 0f6h, 0e4h, 005h, 073h, 0e0h, 08bh, 0d8h, 0e8h, 0dch, 00dh, 0c3h, 08ch, 060h, 060h, 009h
        elseif  (XL) && (MODEL = 3200)
        db      0bbh, 03eh, 0e6h, 0e8h, 0f1h, 00dh, 0a0h, 046h, 087h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 0b4h
        db      005h, 0f6h, 0e4h, 005h, 043h, 0e6h, 08bh, 0d8h, 0e8h, 0dch, 00dh, 0c3h, 08ch, 060h, 060h, 009h
        elseif  (XL) && (FW_VERSION < 150)
        db      0bbh, 0e2h, 0dfh, 0e8h, 0f1h, 00dh, 0a0h, 0f6h, 085h, 03ch, 006h, 072h, 002h, 0b0h, 005h, 0b4h
        db      005h, 0f6h, 0e4h, 005h, 0e7h, 0dfh, 08bh, 0d8h, 0e8h, 0dch, 00dh, 0c3h, 08ch, 060h, 060h, 009h
        endif
        if      XL
        db      0ffh, 08dh, 060h, 08ah, 001h, 0ffh, 08dh, 060h, 08ah, 009h, 0ffh, 08dh, 060h, 08ah, 011h, 0ffh
        db      08dh, 060h, 08ah, 019h, 0ffh, 08dh, 060h, 08ah, 021h, 0ffh, 08dh, 060h, 08ah, 029h, 0ffh, 0c7h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      006h, 0fbh, 086h, 069h, 0dfh, 0c7h, 006h, 0fdh, 086h, 0d0h, 0deh, 0ebh, 000h, 0e8h, 046h, 00eh
        elseif  (XL) && (FW_VERSION = 150)
        db      006h, 0dbh, 086h, 069h, 0dfh, 0c7h, 006h, 0ddh, 086h, 0d0h, 0deh, 0ebh, 000h, 0e8h, 046h, 00eh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh
        db      005h, 0efh, 005h, 0efh, 005h, 0efh, 005h, 0efh, 09fh, 0e1h, 04bh, 0e1h, 0c1h, 0e0h, 0c3h, 08ah
        elseif  (XL) && (MODEL = 3200)
        db      006h, 08bh, 087h, 039h, 0e5h, 0c7h, 006h, 08dh, 087h, 0a0h, 0e4h, 0ebh, 000h, 0e8h, 046h, 00eh
        db      0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h
        db      0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 0d5h, 0f4h, 06fh, 0e7h, 01bh, 0e7h, 091h, 0e6h, 0c3h, 08ah
        elseif  (XL) && (FW_VERSION < 150)
        db      006h, 03bh, 086h, 0ddh, 0deh, 0c7h, 006h, 03dh, 086h, 044h, 0deh, 0ebh, 000h, 0e8h, 046h, 00eh
        db      079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh
        db      079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 079h, 0eeh, 013h, 0e1h, 0bfh, 0e0h, 035h, 0e0h, 0c3h, 08ah
        endif
        if      XL
        db      0b3h, 037h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 08ah, 0b3h, 039h, 020h
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 08ah, 003h
        db      "8CLEAR MEM THEN LOAD ?? confirm  NO  YES"
        db      0ffh, 08ah, 0b3h, 037h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 08ah, 0b3h
        db      039h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 08ah, 003h, 038h
        db      27h dup (020h)
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0ffh, 0bdh, 088h, 0d6h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0ffh, 0bdh, 0f8h, 0d7h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0ffh, 0bdh, 028h, 0d3h, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0c6h, 006h, 081h, 073h, 001h, 0bdh, 0b1h, 02dh, 09ah
        elseif  (XL) && (FW_VERSION = 150)
        db      0c6h, 006h, 071h, 073h, 001h, 0bdh, 0b1h, 02dh, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0c6h, 006h, 0b1h, 073h, 001h, 0bdh, 0d7h, 02dh, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0c6h, 006h, 0d1h, 072h, 001h, 0bdh, 02fh, 02dh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0bdh, 0e2h, 02eh, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0bdh, 008h, 02fh, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0bdh, 060h, 02eh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0e8h, 00eh, 000h, 0c6h, 006h, 081h, 073h, 000h, 0bdh, 013h, 029h, 09ah
        elseif  (XL) && (FW_VERSION = 150)
        db      0e8h, 00eh, 000h, 0c6h, 006h, 071h, 073h, 000h, 0bdh, 013h, 029h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0e8h, 00eh, 000h, 0c6h, 006h, 0b1h, 073h, 000h, 0bdh, 039h, 029h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0e8h, 00eh, 000h, 0c6h, 006h, 0d1h, 072h, 000h, 0bdh, 0a3h, 028h, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0c3h, 0bbh, 092h, 0e1h, 0e8h, 0cah, 00ch, 0ffh, 016h, 0fbh, 086h, 080h, 03eh, 0c2h, 086h, 000h
        db      074h, 003h, 0e9h, 033h, 007h, 0ffh, 016h, 0fdh, 086h, 0c3h, 08ah, 000h, 01dh, 020h, 092h, 00ah
        db      000h, 021h, 093h, 00bh, 000h, 017h, 0ffh, 0ffh, 026h, 0fdh, 086h, 0bbh, 006h, 0e1h, 0e8h, 0a0h
        db      00ch, 0c7h, 006h, 0beh, 086h, 000h, 000h, 0c7h, 006h, 0c0h, 086h, 000h, 000h, 0c6h, 006h, 0c2h
        db      086h, 000h, 08eh, 006h, 0ffh, 086h, 0a0h, 0b5h, 086h, 002h, 006h, 0b6h, 086h, 02ah, 0e4h, 0c1h
        db      0e0h, 002h, 003h, 006h, 0cdh, 086h, 08bh, 0f0h, 026h, 08bh, 004h, 026h, 08bh, 054h, 002h, 026h
        elseif  (XL) && (FW_VERSION = 150)
        db      0c3h, 0bbh, 092h, 0e1h, 0e8h, 0cah, 00ch, 0ffh, 016h, 0dbh, 086h, 080h, 03eh, 0a2h, 086h, 000h
        db      074h, 003h, 0e9h, 033h, 007h, 0ffh, 016h, 0ddh, 086h, 0c3h, 08ah, 000h, 01dh, 020h, 092h, 00ah
        db      000h, 021h, 093h, 00bh, 000h, 017h, 0ffh, 0ffh, 026h, 0ddh, 086h, 0bbh, 006h, 0e1h, 0e8h, 0a0h
        db      00ch, 0c7h, 006h, 09eh, 086h, 000h, 000h, 0c7h, 006h, 0a0h, 086h, 000h, 000h, 0c6h, 006h, 0a2h
        db      086h, 000h, 08eh, 006h, 0dfh, 086h, 0a0h, 095h, 086h, 002h, 006h, 096h, 086h, 02ah, 0e4h, 0c1h
        db      0e0h, 002h, 003h, 006h, 0adh, 086h, 08bh, 0f0h, 026h, 08bh, 004h, 026h, 08bh, 054h, 002h, 026h
        elseif  (XL) && (MODEL = 3200)
        db      0c3h, 0bbh, 062h, 0e7h, 0e8h, 0cah, 00ch, 0ffh, 016h, 08bh, 087h, 080h, 03eh, 052h, 087h, 000h
        db      074h, 003h, 0e9h, 033h, 007h, 0ffh, 016h, 08dh, 087h, 0c3h, 08ah, 000h, 01dh, 020h, 092h, 00ah
        db      000h, 021h, 093h, 00bh, 000h, 017h, 0ffh, 0ffh, 026h, 08dh, 087h, 0bbh, 0d6h, 0e6h, 0e8h, 0a0h
        db      00ch, 0c7h, 006h, 04eh, 087h, 000h, 000h, 0c7h, 006h, 050h, 087h, 000h, 000h, 0c6h, 006h, 052h
        db      087h, 000h, 08eh, 006h, 08fh, 087h, 0a0h, 045h, 087h, 002h, 006h, 046h, 087h, 02ah, 0e4h, 0c1h
        db      0e0h, 002h, 003h, 006h, 05dh, 087h, 08bh, 0f0h, 026h, 08bh, 004h, 026h, 08bh, 054h, 002h, 026h
        elseif  (XL) && (FW_VERSION < 150)
        db      0c3h, 0bbh, 006h, 0e1h, 0e8h, 0cah, 00ch, 0ffh, 016h, 03bh, 086h, 080h, 03eh, 002h, 086h, 000h
        db      074h, 003h, 0e9h, 033h, 007h, 0ffh, 016h, 03dh, 086h, 0c3h, 08ah, 000h, 01dh, 020h, 092h, 00ah
        db      000h, 021h, 093h, 00bh, 000h, 017h, 0ffh, 0ffh, 026h, 03dh, 086h, 0bbh, 07ah, 0e0h, 0e8h, 0a0h
        db      00ch, 0c7h, 006h, 0feh, 085h, 000h, 000h, 0c7h, 006h, 000h, 086h, 000h, 000h, 0c6h, 006h, 002h
        db      086h, 000h, 08eh, 006h, 03fh, 086h, 0a0h, 0f5h, 085h, 002h, 006h, 0f6h, 085h, 02ah, 0e4h, 0c1h
        db      0e0h, 002h, 003h, 006h, 00dh, 086h, 08bh, 0f0h, 026h, 08bh, 004h, 026h, 08bh, 054h, 002h, 026h
        endif
        if      XL
        db      08bh, 04ch, 004h, 02bh, 0c8h, 075h, 001h, 0c3h, 081h, 0c1h, 000h, 004h, 081h, 0e1h, 000h, 0feh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      02bh, 006h, 0d3h, 086h, 01bh, 016h, 0d5h, 086h, 0e8h, 0e2h, 00ah, 080h, 03eh, 019h, 087h, 000h
        db      074h, 002h, 0f9h, 0c3h, 0e8h, 0d2h, 00bh, 0beh, 01dh, 0efh, 0bfh, 0c0h, 0c9h, 0e8h, 0feh, 00ch
        db      08bh, 036h, 0d7h, 086h, 0bfh, 0c3h, 0c9h, 08eh, 006h, 001h, 087h, 0e8h, 020h, 00fh, 0e8h, 0fch
        db      008h, 073h, 002h, 0f8h, 0c3h, 0e8h, 044h, 002h, 0beh, 0c0h, 0c9h, 0e8h, 021h, 009h, 0a3h, 0bch
        db      086h, 0a3h, 0bah, 086h, 08eh, 006h, 001h, 087h, 08bh, 036h, 0d7h, 086h, 083h, 0c6h, 036h, 0b1h
        elseif  (XL) && (FW_VERSION = 150)
        db      02bh, 006h, 0b3h, 086h, 01bh, 016h, 0b5h, 086h, 0e8h, 0e2h, 00ah, 080h, 03eh, 0f9h, 086h, 000h
        db      074h, 002h, 0f9h, 0c3h, 0e8h, 0d2h, 00bh, 0beh, 01dh, 0efh, 0bfh, 0a0h, 0c9h, 0e8h, 0feh, 00ch
        db      08bh, 036h, 0b7h, 086h, 0bfh, 0a3h, 0c9h, 08eh, 006h, 0e1h, 086h, 0e8h, 020h, 00fh, 0e8h, 0fch
        db      008h, 073h, 002h, 0f8h, 0c3h, 0e8h, 044h, 002h, 0beh, 0a0h, 0c9h, 0e8h, 021h, 009h, 0a3h, 09ch
        db      086h, 0a3h, 09ah, 086h, 08eh, 006h, 0e1h, 086h, 08bh, 036h, 0b7h, 086h, 083h, 0c6h, 036h, 0b1h
        elseif  (XL) && (MODEL = 3200)
        db      02bh, 006h, 063h, 087h, 01bh, 016h, 065h, 087h, 0e8h, 0e2h, 00ah, 080h, 03eh, 0a9h, 087h, 000h
        db      074h, 002h, 0f9h, 0c3h, 0e8h, 0d2h, 00bh, 0beh, 0edh, 0f4h, 0bfh, 050h, 0cah, 0e8h, 0feh, 00ch
        db      08bh, 036h, 067h, 087h, 0bfh, 053h, 0cah, 08eh, 006h, 091h, 087h, 0e8h, 020h, 00fh, 0e8h, 0fch
        db      008h, 073h, 002h, 0f8h, 0c3h, 0e8h, 044h, 002h, 0beh, 050h, 0cah, 0e8h, 021h, 009h, 0a3h, 04ch
        db      087h, 0a3h, 04ah, 087h, 08eh, 006h, 091h, 087h, 08bh, 036h, 067h, 087h, 083h, 0c6h, 036h, 0b1h
        elseif  (XL) && (FW_VERSION < 150)
        db      02bh, 006h, 013h, 086h, 01bh, 016h, 015h, 086h, 0e8h, 0e2h, 00ah, 080h, 03eh, 059h, 086h, 000h
        db      074h, 002h, 0f9h, 0c3h, 0e8h, 0d2h, 00bh, 0beh, 091h, 0eeh, 0bfh, 0a0h, 0c8h, 0e8h, 0feh, 00ch
        db      08bh, 036h, 017h, 086h, 0bfh, 0a3h, 0c8h, 08eh, 006h, 041h, 086h, 0e8h, 020h, 00fh, 0e8h, 0fch
        db      008h, 073h, 002h, 0f8h, 0c3h, 0e8h, 044h, 002h, 0beh, 0a0h, 0c8h, 0e8h, 021h, 009h, 0a3h, 0fch
        db      085h, 0a3h, 0fah, 085h, 08eh, 006h, 041h, 086h, 08bh, 036h, 017h, 086h, 083h, 0c6h, 036h, 0b1h
        endif
        if      XL
        db      000h, 0b5h, 000h, 026h, 08ah, 004h, 03ch, 0ffh, 075h, 00bh, 0feh, 0c1h, 046h, 080h, 0f9h, 058h
        db      075h, 0f1h, 0e9h, 025h, 001h, 02ah, 0e4h, 006h
        db      "VPQPQ"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0beh, 0ddh, 0efh, 0bfh, 0c0h, 0cah, 0e8h, 0a8h, 00ch, 0c6h, 006h, 0dch, 0cah, 000h, 058h, 004h
        db      015h, 088h, 045h, 003h, 058h, 0e8h, 081h, 001h, 0a3h, 0beh, 086h, 089h, 01eh, 0c0h, 086h, 052h
        db      0e8h, 007h, 002h, 05ah, 073h, 003h, 0e9h, 0d6h, 000h, 0bfh, 0c0h, 0cah, 08ah, 0c2h, 024h, 007h
        elseif  (XL) && (FW_VERSION = 150)
        db      0beh, 0ddh, 0efh, 0bfh, 0a0h, 0cah, 0e8h, 0a8h, 00ch, 0c6h, 006h, 0bch, 0cah, 000h, 058h, 004h
        db      015h, 088h, 045h, 003h, 058h, 0e8h, 081h, 001h, 0a3h, 09eh, 086h, 089h, 01eh, 0a0h, 086h, 052h
        db      0e8h, 007h, 002h, 05ah, 073h, 003h, 0e9h, 0d6h, 000h, 0bfh, 0a0h, 0cah, 08ah, 0c2h, 024h, 007h
        elseif  (XL) && (MODEL = 3200)
        db      0beh, 0adh, 0f5h, 0bfh, 050h, 0cbh, 0e8h, 0a8h, 00ch, 0c6h, 006h, 06ch, 0cbh, 000h, 058h, 004h
        db      015h, 088h, 045h, 003h, 058h, 0e8h, 081h, 001h, 0a3h, 04eh, 087h, 089h, 01eh, 050h, 087h, 052h
        db      0e8h, 007h, 002h, 05ah, 073h, 003h, 0e9h, 0d6h, 000h, 0bfh, 050h, 0cbh, 08ah, 0c2h, 024h, 007h
        elseif  (XL) && (FW_VERSION < 150)
        db      0beh, 051h, 0efh, 0bfh, 0a0h, 0c9h, 0e8h, 0a8h, 00ch, 0c6h, 006h, 0bch, 0c9h, 000h, 058h, 004h
        db      015h, 088h, 045h, 003h, 058h, 0e8h, 081h, 001h, 0a3h, 0feh, 085h, 089h, 01eh, 000h, 086h, 052h
        db      0e8h, 007h, 002h, 05ah, 073h, 003h, 0e9h, 0d6h, 000h, 0bfh, 0a0h, 0c9h, 08ah, 0c2h, 024h, 007h
        endif
        if      XL
        db      03ch, 002h, 074h, 064h, 03ch, 001h, 074h, 003h, 0e9h, 07dh, 000h, 080h, 0e6h, 07fh, 08ah, 0c6h
        db      004h, 020h, 03ch, 07fh, 072h, 002h, 0b0h, 07fh, 080h, 0eeh, 020h, 073h, 002h, 02ah, 0f6h, 0f6h
        db      0c2h, 008h, 074h, 022h, 0c6h, 045h, 02eh, 000h, 0c6h, 045h, 02fh, 060h, 0c6h, 045h, 05eh, 020h
        db      0c6h, 045h, 05fh, 07fh, 0c6h, 045h, 046h, 000h, 0c6h, 045h, 047h, 060h, 0c6h, 045h, 076h, 020h
        db      0c6h, 045h, 077h, 07fh, 0ebh, 042h, 0c6h, 045h, 05eh, 000h, 0c6h, 045h, 05fh, 060h, 0c6h, 045h
        db      02eh, 020h, 0c6h, 045h, 02fh, 07fh, 0c6h, 045h, 076h, 000h, 0c6h, 045h, 077h, 060h, 0c6h, 045h
        db      046h, 020h, 0c6h, 045h, 047h, 07fh, 0ebh, 020h, 0c6h, 045h, 02eh, 000h, 0c6h, 045h, 02fh, 062h
        db      0c6h, 045h, 05eh, 063h, 0c6h, 045h, 05fh, 07fh, 0c6h, 045h, 046h, 000h, 0c6h, 045h, 047h, 062h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0c6h, 045h, 076h, 063h, 0c6h, 045h, 077h, 07fh, 08eh, 006h, 001h, 087h, 08bh, 01eh, 0ddh, 086h
        db      083h, 03eh, 0beh, 086h, 000h, 075h, 004h, 08bh, 01eh, 0dfh, 086h, 026h, 08ah, 047h, 028h, 0b4h
        db      032h, 0f6h, 0e4h, 0b3h, 07fh, 0f6h, 0f3h, 02ch, 032h, 0a2h, 0f2h, 0cah, 0a2h, 00ah, 0cbh, 083h
        db      03eh, 0c0h, 086h, 000h, 074h, 018h, 08bh, 01eh, 0dfh, 086h, 026h, 08ah, 047h, 028h, 0b4h, 032h
        db      0f6h, 0e4h, 0b3h, 07fh, 0f6h, 0f3h, 02ch, 032h, 0a2h, 022h, 0cbh, 0a2h, 03ah, 0cbh, 0f8h, 059h
        elseif  (XL) && (FW_VERSION = 150)
        db      0c6h, 045h, 076h, 063h, 0c6h, 045h, 077h, 07fh, 08eh, 006h, 0e1h, 086h, 08bh, 01eh, 0bdh, 086h
        db      083h, 03eh, 09eh, 086h, 000h, 075h, 004h, 08bh, 01eh, 0bfh, 086h, 026h, 08ah, 047h, 028h, 0b4h
        db      032h, 0f6h, 0e4h, 0b3h, 07fh, 0f6h, 0f3h, 02ch, 032h, 0a2h, 0d2h, 0cah, 0a2h, 0eah, 0cah, 083h
        db      03eh, 0a0h, 086h, 000h, 074h, 018h, 08bh, 01eh, 0bfh, 086h, 026h, 08ah, 047h, 028h, 0b4h, 032h
        db      0f6h, 0e4h, 0b3h, 07fh, 0f6h, 0f3h, 02ch, 032h, 0a2h, 002h, 0cbh, 0a2h, 01ah, 0cbh, 0f8h, 059h
        elseif  (XL) && (MODEL = 3200)
        db      0c6h, 045h, 076h, 063h, 0c6h, 045h, 077h, 07fh, 08eh, 006h, 091h, 087h, 08bh, 01eh, 06dh, 087h
        db      083h, 03eh, 04eh, 087h, 000h, 075h, 004h, 08bh, 01eh, 06fh, 087h, 026h, 08ah, 047h, 028h, 0b4h
        db      032h, 0f6h, 0e4h, 0b3h, 07fh, 0f6h, 0f3h, 02ch, 032h, 0a2h, 082h, 0cbh, 0a2h, 09ah, 0cbh, 083h
        db      03eh, 050h, 087h, 000h, 074h, 018h, 08bh, 01eh, 06fh, 087h, 026h, 08ah, 047h, 028h, 0b4h, 032h
        db      0f6h, 0e4h, 0b3h, 07fh, 0f6h, 0f3h, 02ch, 032h, 0a2h, 0b2h, 0cbh, 0a2h, 0cah, 0cbh, 0f8h, 059h
        elseif  (XL) && (FW_VERSION < 150)
        db      0c6h, 045h, 076h, 063h, 0c6h, 045h, 077h, 07fh, 08eh, 006h, 041h, 086h, 08bh, 01eh, 01dh, 086h
        db      083h, 03eh, 0feh, 085h, 000h, 075h, 004h, 08bh, 01eh, 01fh, 086h, 026h, 08ah, 047h, 028h, 0b4h
        db      032h, 0f6h, 0e4h, 0b3h, 07fh, 0f6h, 0f3h, 02ch, 032h, 0a2h, 0d2h, 0c9h, 0a2h, 0eah, 0c9h, 083h
        db      03eh, 000h, 086h, 000h, 074h, 018h, 08bh, 01eh, 01fh, 086h, 026h, 08ah, 047h, 028h, 0b4h, 032h
        db      0f6h, 0e4h, 0b3h, 07fh, 0f6h, 0f3h, 02ch, 032h, 0a2h, 002h, 0cah, 0a2h, 01ah, 0cah, 0f8h, 059h
        endif
        if      XL
        db      058h, 05eh, 007h, 072h, 04ah, 0feh, 0c5h, 046h, 0feh, 0c1h, 080h, 0f9h, 058h, 074h, 00bh, 026h
        db      03ah, 004h, 074h, 0f3h, 0e8h, 063h, 000h, 0e9h, 0cch, 0feh, 0e8h, 05dh, 000h, 006h, 08eh, 006h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0bch, 086h, 026h, 088h, 02eh, 02ah, 000h, 080h, 0fdh, 000h, 075h, 008h, 0bdh, 042h, 02eh, 09ah
        elseif  (XL) && (FW_VERSION = 150)
        db      09ch, 086h, 026h, 088h, 02eh, 02ah, 000h, 080h, 0fdh, 000h, 075h, 008h, 0bdh, 042h, 02eh, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      04ch, 087h, 026h, 088h, 02eh, 02ah, 000h, 080h, 0fdh, 000h, 075h, 008h, 0bdh, 068h, 02eh, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0fch, 085h, 026h, 088h, 02eh, 02ah, 000h, 080h, 0fdh, 000h, 075h, 008h, 0bdh, 0c0h, 02dh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      007h, 0bdh, 013h, 029h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      007h, 0bdh, 039h, 029h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      007h, 0bdh, 0a3h, 028h, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0bdh, 089h, 052h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0bdh, 0e6h, 052h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0bdh, 0f3h, 051h, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0bdh, 03ch, 02ch, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0bdh, 062h, 02ch, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0bdh, 0bah, 02bh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        db      0f8h, 0c3h, 0feh, 0c5h, 046h, 0feh, 0c1h, 080h, 0f9h, 058h, 074h, 004h, 03bh, 004h, 074h, 0f4h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0e8h, 0bah, 0ffh, 0bdh, 013h, 029h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0e8h, 0bah, 0ffh, 0bdh, 039h, 029h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0e8h, 0bah, 0ffh, 0bdh, 0a3h, 028h, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0bdh, 089h, 052h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0bdh, 0e6h, 052h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0bdh, 0f3h, 051h, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0bdh, 03ch, 02ch, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0bdh, 062h, 02ch, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0bdh, 0bah, 02bh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0f9h, 0c3h, 006h, 08ah, 0c1h, 004h, 014h, 0a2h, 0c4h, 0cah, 056h, 051h, 0beh, 0c0h, 0cah, 0e8h
        db      068h, 007h, 08eh, 006h, 0bah, 086h, 026h, 0a3h, 001h, 000h, 0a3h, 0bah, 086h, 059h, 05eh, 007h
        db      0c3h, 006h, 056h, 057h, 051h, 0c1h, 0e0h, 002h, 08eh, 006h, 001h, 087h, 08bh, 036h, 0d7h, 086h
        elseif  (XL) && (FW_VERSION = 150)
        db      0f9h, 0c3h, 006h, 08ah, 0c1h, 004h, 014h, 0a2h, 0a4h, 0cah, 056h, 051h, 0beh, 0a0h, 0cah, 0e8h
        db      068h, 007h, 08eh, 006h, 09ah, 086h, 026h, 0a3h, 001h, 000h, 0a3h, 09ah, 086h, 059h, 05eh, 007h
        db      0c3h, 006h, 056h, 057h, 051h, 0c1h, 0e0h, 002h, 08eh, 006h, 0e1h, 086h, 08bh, 036h, 0b7h, 086h
        elseif  (XL) && (MODEL = 3200)
        db      0f9h, 0c3h, 006h, 08ah, 0c1h, 004h, 014h, 0a2h, 054h, 0cbh, 056h, 051h, 0beh, 050h, 0cbh, 0e8h
        db      068h, 007h, 08eh, 006h, 04ah, 087h, 026h, 0a3h, 001h, 000h, 0a3h, 04ah, 087h, 059h, 05eh, 007h
        db      0c3h, 006h, 056h, 057h, 051h, 0c1h, 0e0h, 002h, 08eh, 006h, 091h, 087h, 08bh, 036h, 067h, 087h
        elseif  (XL) && (FW_VERSION < 150)
        db      0f9h, 0c3h, 006h, 08ah, 0c1h, 004h, 014h, 0a2h, 0a4h, 0c9h, 056h, 051h, 0beh, 0a0h, 0c9h, 0e8h
        db      068h, 007h, 08eh, 006h, 0fah, 085h, 026h, 0a3h, 001h, 000h, 0a3h, 0fah, 085h, 059h, 05eh, 007h
        db      0c3h, 006h, 056h, 057h, 051h, 0c1h, 0e0h, 002h, 08eh, 006h, 041h, 086h, 08bh, 036h, 017h, 086h
        endif
        if      XL
        db      003h, 0f0h, 081h, 0c6h, 08eh, 000h, 026h, 08ah, 044h, 002h, 006h, 056h, 0e8h, 023h, 000h, 089h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      036h, 0ddh, 086h, 05eh, 007h, 050h, 026h, 08ah, 044h, 003h, 006h, 056h, 0e8h, 013h, 000h, 089h
        db      036h, 0dfh, 086h, 05eh, 007h, 08bh, 0d8h, 058h, 026h, 08bh, 014h, 08bh, 0eeh, 059h, 05fh, 05eh
        db      007h, 0c3h, 03ch, 0ffh, 074h, 02eh, 0b4h, 030h, 0f6h, 0e4h, 08bh, 0d8h, 08eh, 006h, 001h, 087h
        db      08bh, 036h, 0d7h, 086h, 026h, 08ah, 044h, 035h, 02ah, 0e4h, 0c1h, 0e0h, 002h, 003h, 0c3h, 005h
        elseif  (XL) && (FW_VERSION = 150)
        db      036h, 0bdh, 086h, 05eh, 007h, 050h, 026h, 08ah, 044h, 003h, 006h, 056h, 0e8h, 013h, 000h, 089h
        db      036h, 0bfh, 086h, 05eh, 007h, 08bh, 0d8h, 058h, 026h, 08bh, 014h, 08bh, 0eeh, 059h, 05fh, 05eh
        db      007h, 0c3h, 03ch, 0ffh, 074h, 02eh, 0b4h, 030h, 0f6h, 0e4h, 08bh, 0d8h, 08eh, 006h, 0e1h, 086h
        db      08bh, 036h, 0b7h, 086h, 026h, 08ah, 044h, 035h, 02ah, 0e4h, 0c1h, 0e0h, 002h, 003h, 0c3h, 005h
        elseif  (XL) && (MODEL = 3200)
        db      036h, 06dh, 087h, 05eh, 007h, 050h, 026h, 08ah, 044h, 003h, 006h, 056h, 0e8h, 013h, 000h, 089h
        db      036h, 06fh, 087h, 05eh, 007h, 08bh, 0d8h, 058h, 026h, 08bh, 014h, 08bh, 0eeh, 059h, 05fh, 05eh
        db      007h, 0c3h, 03ch, 0ffh, 074h, 02eh, 0b4h, 030h, 0f6h, 0e4h, 08bh, 0d8h, 08eh, 006h, 091h, 087h
        db      08bh, 036h, 067h, 087h, 026h, 08ah, 044h, 035h, 02ah, 0e4h, 0c1h, 0e0h, 002h, 003h, 0c3h, 005h
        elseif  (XL) && (FW_VERSION < 150)
        db      036h, 01dh, 086h, 05eh, 007h, 050h, 026h, 08ah, 044h, 003h, 006h, 056h, 0e8h, 013h, 000h, 089h
        db      036h, 01fh, 086h, 05eh, 007h, 08bh, 0d8h, 058h, 026h, 08bh, 014h, 08bh, 0eeh, 059h, 05fh, 05eh
        db      007h, 0c3h, 03ch, 0ffh, 074h, 02eh, 0b4h, 030h, 0f6h, 0e4h, 08bh, 0d8h, 08eh, 006h, 041h, 086h
        db      08bh, 036h, 017h, 086h, 026h, 08ah, 044h, 035h, 02ah, 0e4h, 0c1h, 0e0h, 002h, 003h, 0c3h, 005h
        endif
        if      XL
        db      08eh, 000h, 003h, 0f0h, 026h, 08ah, 044h, 02dh, 024h, 0c0h, 02ah, 0e4h, 0c1h, 0e0h, 002h, 026h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      08ah, 044h, 001h, 0c3h, 02bh, 0c0h, 0c3h, 006h, 08eh, 006h, 001h, 087h, 08bh, 036h, 0d7h, 086h
        db      0bfh, 0c0h, 0c9h, 0a0h, 0b5h, 086h, 002h, 006h, 0b6h, 086h, 025h, 07fh, 000h, 088h, 045h, 00fh
        db      007h, 0c3h, 0a1h, 0c0h, 086h, 03dh, 000h, 000h, 074h, 052h, 08bh, 01eh, 0dfh, 086h, 089h, 01eh
        db      0e1h, 086h, 0e8h, 056h, 000h, 073h, 001h, 0c3h, 0a1h, 0beh, 086h, 03dh, 000h, 000h, 075h, 002h
        db      0f8h, 0c3h, 08ch, 0d8h, 08eh, 0c0h, 0beh, 0e2h, 0cah, 0bfh, 012h, 0cbh, 0b9h, 030h, 000h, 0fch
        db      0f3h, 0a4h, 01eh, 08ch, 0c8h, 08eh, 0d8h, 0beh, 0ffh, 0efh, 0bfh, 0e2h, 0cah, 0b9h, 030h, 000h
        db      0fch, 0f3h, 0a4h, 01fh, 0a0h, 044h, 0cbh, 08ah, 026h, 045h, 0cbh, 0a2h, 046h, 0cbh, 088h, 026h
        db      047h, 0cbh, 0c6h, 006h, 044h, 0cbh, 000h, 0c6h, 006h, 045h, 0cbh, 000h, 0a1h, 0beh, 086h, 08bh
        db      01eh, 0ddh, 086h, 089h, 01eh, 0e1h, 086h, 0e8h, 001h, 000h, 0c3h, 0a3h, 017h, 087h, 048h, 0e8h
        db      01eh, 008h, 073h, 002h, 0f8h, 0c3h, 08bh, 036h, 0d9h, 086h, 0f6h, 044h, 03ah, 001h, 075h, 018h
        elseif  (XL) && (FW_VERSION = 150)
        db      08ah, 044h, 001h, 0c3h, 02bh, 0c0h, 0c3h, 006h, 08eh, 006h, 0e1h, 086h, 08bh, 036h, 0b7h, 086h
        db      0bfh, 0a0h, 0c9h, 0a0h, 095h, 086h, 002h, 006h, 096h, 086h, 025h, 07fh, 000h, 088h, 045h, 00fh
        db      007h, 0c3h, 0a1h, 0a0h, 086h, 03dh, 000h, 000h, 074h, 052h, 08bh, 01eh, 0bfh, 086h, 089h, 01eh
        db      0c1h, 086h, 0e8h, 056h, 000h, 073h, 001h, 0c3h, 0a1h, 09eh, 086h, 03dh, 000h, 000h, 075h, 002h
        db      0f8h, 0c3h, 08ch, 0d8h, 08eh, 0c0h, 0beh, 0c2h, 0cah, 0bfh, 0f2h, 0cah, 0b9h, 030h, 000h, 0fch
        db      0f3h, 0a4h, 01eh, 08ch, 0c8h, 08eh, 0d8h, 0beh, 0ffh, 0efh, 0bfh, 0c2h, 0cah, 0b9h, 030h, 000h
        db      0fch, 0f3h, 0a4h, 01fh, 0a0h, 024h, 0cbh, 08ah, 026h, 025h, 0cbh, 0a2h, 026h, 0cbh, 088h, 026h
        db      027h, 0cbh, 0c6h, 006h, 024h, 0cbh, 000h, 0c6h, 006h, 025h, 0cbh, 000h, 0a1h, 09eh, 086h, 08bh
        db      01eh, 0bdh, 086h, 089h, 01eh, 0c1h, 086h, 0e8h, 001h, 000h, 0c3h, 0a3h, 0f7h, 086h, 048h, 0e8h
        db      01eh, 008h, 073h, 002h, 0f8h, 0c3h, 08bh, 036h, 0b9h, 086h, 0f6h, 044h, 03ah, 001h, 075h, 018h
        elseif  (XL) && (MODEL = 3200)
        db      08ah, 044h, 001h, 0c3h, 02bh, 0c0h, 0c3h, 006h, 08eh, 006h, 091h, 087h, 08bh, 036h, 067h, 087h
        db      0bfh, 050h, 0cah, 0a0h, 045h, 087h, 002h, 006h, 046h, 087h, 025h, 07fh, 000h, 088h, 045h, 00fh
        db      007h, 0c3h, 0a1h, 050h, 087h, 03dh, 000h, 000h, 074h, 052h, 08bh, 01eh, 06fh, 087h, 089h, 01eh
        db      071h, 087h, 0e8h, 056h, 000h, 073h, 001h, 0c3h, 0a1h, 04eh, 087h, 03dh, 000h, 000h, 075h, 002h
        db      0f8h, 0c3h, 08ch, 0d8h, 08eh, 0c0h, 0beh, 072h, 0cbh, 0bfh, 0a2h, 0cbh, 0b9h, 030h, 000h, 0fch
        db      0f3h, 0a4h, 01eh, 08ch, 0c8h, 08eh, 0d8h, 0beh, 0cfh, 0f5h, 0bfh, 072h, 0cbh, 0b9h, 030h, 000h
        db      0fch, 0f3h, 0a4h, 01fh, 0a0h, 0d4h, 0cbh, 08ah, 026h, 0d5h, 0cbh, 0a2h, 0d6h, 0cbh, 088h, 026h
        db      0d7h, 0cbh, 0c6h, 006h, 0d4h, 0cbh, 000h, 0c6h, 006h, 0d5h, 0cbh, 000h, 0a1h, 04eh, 087h, 08bh
        db      01eh, 06dh, 087h, 089h, 01eh, 071h, 087h, 0e8h, 001h, 000h, 0c3h, 0a3h, 0a7h, 087h, 048h, 0e8h
        db      01eh, 008h, 073h, 002h, 0f8h, 0c3h, 08bh, 036h, 069h, 087h, 0f6h, 044h, 03ah, 001h, 075h, 018h
        elseif  (XL) && (FW_VERSION < 150)
        db      08ah, 044h, 001h, 0c3h, 02bh, 0c0h, 0c3h, 006h, 08eh, 006h, 041h, 086h, 08bh, 036h, 017h, 086h
        db      0bfh, 0a0h, 0c8h, 0a0h, 0f5h, 085h, 002h, 006h, 0f6h, 085h, 025h, 07fh, 000h, 088h, 045h, 00fh
        db      007h, 0c3h, 0a1h, 000h, 086h, 03dh, 000h, 000h, 074h, 052h, 08bh, 01eh, 01fh, 086h, 089h, 01eh
        db      021h, 086h, 0e8h, 056h, 000h, 073h, 001h, 0c3h, 0a1h, 0feh, 085h, 03dh, 000h, 000h, 075h, 002h
        db      0f8h, 0c3h, 08ch, 0d8h, 08eh, 0c0h, 0beh, 0c2h, 0c9h, 0bfh, 0f2h, 0c9h, 0b9h, 030h, 000h, 0fch
        db      0f3h, 0a4h, 01eh, 08ch, 0c8h, 08eh, 0d8h, 0beh, 073h, 0efh, 0bfh, 0c2h, 0c9h, 0b9h, 030h, 000h
        db      0fch, 0f3h, 0a4h, 01fh, 0a0h, 024h, 0cah, 08ah, 026h, 025h, 0cah, 0a2h, 026h, 0cah, 088h, 026h
        db      027h, 0cah, 0c6h, 006h, 024h, 0cah, 000h, 0c6h, 006h, 025h, 0cah, 000h, 0a1h, 0feh, 085h, 08bh
        db      01eh, 01dh, 086h, 089h, 01eh, 021h, 086h, 0e8h, 001h, 000h, 0c3h, 0a3h, 057h, 086h, 048h, 0e8h
        db      01eh, 008h, 073h, 002h, 0f8h, 0c3h, 08bh, 036h, 019h, 086h, 0f6h, 044h, 03ah, 001h, 075h, 018h
        endif
        if      XL
        db      08bh, 044h, 01ch, 08bh, 054h, 01eh, 089h, 044h, 02ch, 089h, 054h, 02eh, 08bh, 044h, 020h, 08bh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      054h, 022h, 089h, 044h, 030h, 089h, 054h, 032h, 08bh, 044h, 014h, 08bh, 054h, 016h, 0a3h, 013h
        db      087h, 089h, 016h, 015h, 087h, 08bh, 0feh, 08ah, 044h, 03ah, 024h, 060h, 0a2h, 01ah, 087h, 03ch
        elseif  (XL) && (FW_VERSION = 150)
        db      054h, 022h, 089h, 044h, 030h, 089h, 054h, 032h, 08bh, 044h, 014h, 08bh, 054h, 016h, 0a3h, 0f3h
        db      086h, 089h, 016h, 0f5h, 086h, 08bh, 0feh, 08ah, 044h, 03ah, 024h, 060h, 0a2h, 0fah, 086h, 03ch
        elseif  (XL) && (MODEL = 3200)
        db      054h, 022h, 089h, 044h, 030h, 089h, 054h, 032h, 08bh, 044h, 014h, 08bh, 054h, 016h, 0a3h, 0a3h
        db      087h, 089h, 016h, 0a5h, 087h, 08bh, 0feh, 08ah, 044h, 03ah, 024h, 060h, 0a2h, 0aah, 087h, 03ch
        elseif  (XL) && (FW_VERSION < 150)
        db      054h, 022h, 089h, 044h, 030h, 089h, 054h, 032h, 08bh, 044h, 014h, 08bh, 054h, 016h, 0a3h, 053h
        db      086h, 089h, 016h, 055h, 086h, 08bh, 0feh, 08ah, 044h, 03ah, 024h, 060h, 0a2h, 05ah, 086h, 03ch
        endif
        if      XL
        db      020h, 074h, 025h, 083h, 0c7h, 004h, 03ch, 040h, 074h, 011h, 083h, 0efh, 004h, 08bh, 044h, 014h
        db      08bh, 054h, 016h, 02bh, 044h, 018h, 01bh, 054h, 01ah, 072h, 00dh, 08bh, 044h, 018h, 08bh, 054h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      01ah, 0a3h, 013h, 087h, 089h, 016h, 015h, 087h, 08bh, 045h, 02ch, 08bh, 055h, 02eh, 02bh, 045h
        db      024h, 01bh, 055h, 026h, 0d1h, 0eah, 0d1h, 0d8h, 005h, 001h, 000h, 083h, 0d2h, 000h, 0a3h, 00bh
        db      087h, 089h, 016h, 00dh, 087h, 08bh, 045h, 02ch, 08bh, 055h, 02eh, 02bh, 045h, 014h, 01bh, 055h
        db      016h, 0d1h, 0eah, 0d1h, 0d8h, 0a3h, 007h, 087h, 089h, 016h, 009h, 087h, 08bh, 045h, 01ch, 08bh
        db      055h, 01eh, 02bh, 045h, 014h, 01bh, 055h, 016h, 0d1h, 0eah, 0d1h, 0d8h, 0a3h, 00fh, 087h, 089h
        db      016h, 011h, 087h, 08bh, 036h, 0d9h, 086h, 0bfh, 0e2h, 0cah, 08ch, 0dbh, 08eh, 0c3h, 0e8h, 00fh
        db      00ch, 0beh, 09dh, 0f0h, 0bfh, 0c0h, 0cbh, 0e8h, 04fh, 009h, 0beh, 0e2h, 0cah, 0bfh, 0c3h, 0cbh
        db      08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch, 0f3h, 0a4h, 08bh, 036h, 0e1h, 086h, 08eh, 006h
        db      001h, 087h, 0bfh, 0c0h, 0cah, 026h, 08ah, 044h, 004h, 0e8h, 02ch, 003h, 088h, 045h, 00ch, 026h
        elseif  (XL) && (FW_VERSION = 150)
        db      01ah, 0a3h, 0f3h, 086h, 089h, 016h, 0f5h, 086h, 08bh, 045h, 02ch, 08bh, 055h, 02eh, 02bh, 045h
        db      024h, 01bh, 055h, 026h, 0d1h, 0eah, 0d1h, 0d8h, 005h, 001h, 000h, 083h, 0d2h, 000h, 0a3h, 0ebh
        db      086h, 089h, 016h, 0edh, 086h, 08bh, 045h, 02ch, 08bh, 055h, 02eh, 02bh, 045h, 014h, 01bh, 055h
        db      016h, 0d1h, 0eah, 0d1h, 0d8h, 0a3h, 0e7h, 086h, 089h, 016h, 0e9h, 086h, 08bh, 045h, 01ch, 08bh
        db      055h, 01eh, 02bh, 045h, 014h, 01bh, 055h, 016h, 0d1h, 0eah, 0d1h, 0d8h, 0a3h, 0efh, 086h, 089h
        db      016h, 0f1h, 086h, 08bh, 036h, 0b9h, 086h, 0bfh, 0c2h, 0cah, 08ch, 0dbh, 08eh, 0c3h, 0e8h, 00fh
        db      00ch, 0beh, 09dh, 0f0h, 0bfh, 0a0h, 0cbh, 0e8h, 04fh, 009h, 0beh, 0c2h, 0cah, 0bfh, 0a3h, 0cbh
        db      08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch, 0f3h, 0a4h, 08bh, 036h, 0c1h, 086h, 08eh, 006h
        db      0e1h, 086h, 0bfh, 0a0h, 0cah, 026h, 08ah, 044h, 004h, 0e8h, 02ch, 003h, 088h, 045h, 00ch, 026h
        elseif  (XL) && (MODEL = 3200)
        db      01ah, 0a3h, 0a3h, 087h, 089h, 016h, 0a5h, 087h, 08bh, 045h, 02ch, 08bh, 055h, 02eh, 02bh, 045h
        db      024h, 01bh, 055h, 026h, 0d1h, 0eah, 0d1h, 0d8h, 005h, 001h, 000h, 083h, 0d2h, 000h, 0a3h, 09bh
        db      087h, 089h, 016h, 09dh, 087h, 08bh, 045h, 02ch, 08bh, 055h, 02eh, 02bh, 045h, 014h, 01bh, 055h
        db      016h, 0d1h, 0eah, 0d1h, 0d8h, 0a3h, 097h, 087h, 089h, 016h, 099h, 087h, 08bh, 045h, 01ch, 08bh
        db      055h, 01eh, 02bh, 045h, 014h, 01bh, 055h, 016h, 0d1h, 0eah, 0d1h, 0d8h, 0a3h, 09fh, 087h, 089h
        db      016h, 0a1h, 087h, 08bh, 036h, 069h, 087h, 0bfh, 072h, 0cbh, 08ch, 0dbh, 08eh, 0c3h, 0e8h, 00fh
        db      00ch, 0beh, 06dh, 0f6h, 0bfh, 050h, 0cch, 0e8h, 04fh, 009h, 0beh, 072h, 0cbh, 0bfh, 053h, 0cch
        db      08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch, 0f3h, 0a4h, 08bh, 036h, 071h, 087h, 08eh, 006h
        db      091h, 087h, 0bfh, 050h, 0cbh, 026h, 08ah, 044h, 004h, 0e8h, 02ch, 003h, 088h, 045h, 00ch, 026h
        elseif  (XL) && (FW_VERSION < 150)
        db      01ah, 0a3h, 053h, 086h, 089h, 016h, 055h, 086h, 08bh, 045h, 02ch, 08bh, 055h, 02eh, 02bh, 045h
        db      024h, 01bh, 055h, 026h, 0d1h, 0eah, 0d1h, 0d8h, 005h, 001h, 000h, 083h, 0d2h, 000h, 0a3h, 04bh
        db      086h, 089h, 016h, 04dh, 086h, 08bh, 045h, 02ch, 08bh, 055h, 02eh, 02bh, 045h, 014h, 01bh, 055h
        db      016h, 0d1h, 0eah, 0d1h, 0d8h, 0a3h, 047h, 086h, 089h, 016h, 049h, 086h, 08bh, 045h, 01ch, 08bh
        db      055h, 01eh, 02bh, 045h, 014h, 01bh, 055h, 016h, 0d1h, 0eah, 0d1h, 0d8h, 0a3h, 04fh, 086h, 089h
        db      016h, 051h, 086h, 08bh, 036h, 019h, 086h, 0bfh, 0c2h, 0c9h, 08ch, 0dbh, 08eh, 0c3h, 0e8h, 00fh
        db      00ch, 0beh, 011h, 0f0h, 0bfh, 0a0h, 0cah, 0e8h, 04fh, 009h, 0beh, 0c2h, 0c9h, 0bfh, 0a3h, 0cah
        db      08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch, 0f3h, 0a4h, 08bh, 036h, 021h, 086h, 08eh, 006h
        db      041h, 086h, 0bfh, 0a0h, 0c9h, 026h, 08ah, 044h, 004h, 0e8h, 02ch, 003h, 088h, 045h, 00ch, 026h
        endif
        if      XL
        db      08ah, 044h, 006h, 0e8h, 0b0h, 003h, 088h, 045h, 00dh, 026h, 08ah, 044h, 007h, 0e8h, 04ah, 004h
        db      088h, 045h, 00eh, 026h, 08ah, 044h, 008h, 0e8h, 09ch, 003h, 088h, 045h, 00fh, 026h, 08ah, 044h
        db      00fh, 0e8h, 004h, 003h, 088h, 045h, 014h, 026h, 08ah, 044h, 011h, 0e8h, 088h, 003h, 088h, 045h
        db      015h, 026h, 08ah, 044h, 012h, 0e8h, 022h, 004h, 088h, 045h, 016h, 026h, 08ah, 044h, 013h, 0e8h
        db      074h, 003h, 088h, 045h, 017h, 026h, 08ah, 044h, 00ch, 0b4h, 063h, 0f6h, 0e4h, 0b3h, 0d8h, 0f6h
        db      0f3h, 03ch, 063h, 072h, 002h, 0b0h, 063h, 08ah, 0f8h, 026h, 08ah, 044h, 020h, 0b4h, 032h, 0f6h
        db      0ech, 0b3h, 07fh, 0f6h, 0fbh, 02ah, 0f8h, 073h, 002h, 02ah, 0ffh, 088h, 07dh, 007h, 026h, 08ah
        db      044h, 020h, 0b4h, 019h, 0f6h, 0ech, 0b3h, 07fh, 0f6h, 0fbh, 088h, 085h, 097h, 000h, 026h, 08ah
        db      044h, 00eh, 0b4h, 032h, 0f6h, 0ech, 0b3h, 07fh, 0f6h, 0fbh, 088h, 085h, 099h, 000h, 0e8h, 003h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      007h, 0bfh, 0c0h, 0cbh, 0a1h, 007h, 087h, 08bh, 016h, 009h, 087h, 089h, 045h, 026h, 089h, 055h
        db      028h, 0a1h, 00fh, 087h, 08bh, 016h, 011h, 087h, 089h, 045h, 01ah, 089h, 055h, 01ch, 089h, 045h
        elseif  (XL) && (FW_VERSION = 150)
        db      007h, 0bfh, 0a0h, 0cbh, 0a1h, 0e7h, 086h, 08bh, 016h, 0e9h, 086h, 089h, 045h, 026h, 089h, 055h
        db      028h, 0a1h, 0efh, 086h, 08bh, 016h, 0f1h, 086h, 089h, 045h, 01ah, 089h, 055h, 01ch, 089h, 045h
        elseif  (XL) && (MODEL = 3200)
        db      007h, 0bfh, 050h, 0cch, 0a1h, 097h, 087h, 08bh, 016h, 099h, 087h, 089h, 045h, 026h, 089h, 055h
        db      028h, 0a1h, 09fh, 087h, 08bh, 016h, 0a1h, 087h, 089h, 045h, 01ah, 089h, 055h, 01ch, 089h, 045h
        elseif  (XL) && (FW_VERSION < 150)
        db      007h, 0bfh, 0a0h, 0cah, 0a1h, 047h, 086h, 08bh, 016h, 049h, 086h, 089h, 045h, 026h, 089h, 055h
        db      028h, 0a1h, 04fh, 086h, 08bh, 016h, 051h, 086h, 089h, 045h, 01ah, 089h, 055h, 01ch, 089h, 045h
        endif
        if      XL
        db      022h, 089h, 055h, 024h, 0b8h, 000h, 000h, 089h, 045h, 01eh, 0c7h, 045h, 02ah, 000h, 000h, 0a1h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      00bh, 087h, 08bh, 016h, 00dh, 087h, 089h, 045h, 02ch, 089h, 055h, 02eh, 08bh, 036h, 0d9h, 086h
        elseif  (XL) && (FW_VERSION = 150)
        db      0ebh, 086h, 08bh, 016h, 0edh, 086h, 089h, 045h, 02ch, 089h, 055h, 02eh, 08bh, 036h, 0b9h, 086h
        elseif  (XL) && (MODEL = 3200)
        db      09bh, 087h, 08bh, 016h, 09dh, 087h, 089h, 045h, 02ch, 089h, 055h, 02eh, 08bh, 036h, 069h, 087h
        elseif  (XL) && (FW_VERSION < 150)
        db      04bh, 086h, 08bh, 016h, 04dh, 086h, 089h, 045h, 02ch, 089h, 055h, 02eh, 08bh, 036h, 019h, 086h
        endif
        if      XL
        db      0b0h, 002h, 0f6h, 044h, 03ah, 001h, 074h, 00ah, 0b0h, 000h, 0f6h, 044h, 03ah, 008h, 075h, 002h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0b0h, 001h, 088h, 045h, 013h, 08eh, 006h, 001h, 087h, 08bh, 01eh, 0e1h, 086h, 026h, 08ah, 007h
        db      004h, 015h, 02ch, 03ch, 0f6h, 0d8h, 08ah, 0e0h, 02ah, 0c0h, 0a3h, 0f0h, 0cah, 0b0h, 03ch, 088h
        db      045h, 002h, 08bh, 01eh, 0e1h, 086h, 026h, 0f6h, 047h, 02fh, 004h, 074h, 00bh, 0c6h, 006h, 044h
        db      0cbh, 001h, 0c7h, 006h, 0f0h, 0cah, 000h, 000h, 026h, 0f6h
        elseif  (XL) && (FW_VERSION = 150)
        db      0b0h, 001h, 088h, 045h, 013h, 08eh, 006h, 0e1h, 086h, 08bh, 01eh, 0c1h, 086h, 026h, 08ah, 007h
        db      004h, 015h, 02ch, 03ch, 0f6h, 0d8h, 08ah, 0e0h, 02ah, 0c0h, 0a3h, 0d0h, 0cah, 0b0h, 03ch, 088h
        db      045h, 002h, 08bh, 01eh, 0c1h, 086h, 026h, 0f6h, 047h, 02fh, 004h, 074h, 00bh, 0c6h, 006h, 024h
        db      0cbh, 001h, 0c7h, 006h, 0d0h, 0cah, 000h, 000h, 026h, 0f6h
        elseif  (XL) && (MODEL = 3200)
        db      0b0h, 001h, 088h, 045h, 013h, 08eh, 006h, 091h, 087h, 08bh, 01eh, 071h, 087h, 026h, 08ah, 007h
        db      004h, 015h, 02ch, 03ch, 0f6h, 0d8h, 08ah, 0e0h, 02ah, 0c0h, 0a3h, 080h, 0cbh, 0b0h, 03ch, 088h
        db      045h, 002h, 08bh, 01eh, 071h, 087h, 026h, 0f6h, 047h, 02fh, 004h, 074h, 00bh, 0c6h, 006h, 0d4h
        db      0cbh, 001h, 0c7h, 006h, 080h, 0cbh, 000h, 000h, 026h, 0f6h
        elseif  (XL) && (FW_VERSION < 150)
        db      0b0h, 001h, 088h, 045h, 013h, 08eh, 006h, 041h, 086h, 08bh, 01eh, 021h, 086h, 026h, 08ah, 007h
        db      004h, 015h, 02ch, 03ch, 0f6h, 0d8h, 08ah, 0e0h, 02ah, 0c0h, 0a3h, 0d0h, 0c9h, 0b0h, 03ch, 088h
        db      045h, 002h, 08bh, 01eh, 021h, 086h, 026h, 0f6h, 047h, 02fh, 004h, 074h, 00bh, 0c6h, 006h, 024h
        db      0cah, 001h, 0c7h, 006h, 0d0h, 0c9h, 000h, 000h, 026h, 0f6h
        endif
        if      XL
        db      "G/ t"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      005h, 0c6h, 006h, 0f5h, 0cah, 003h, 026h, 08ah, 047h, 029h, 08ah, 0e0h, 0d0h, 0fch, 002h, 0c4h
        db      0bbh, 090h, 067h, 0d7h, 098h, 001h, 006h, 0f0h, 0cah, 08bh, 036h, 0d9h, 086h, 08bh, 054h, 034h
        elseif  (XL) && (FW_VERSION = 150)
        db      005h, 0c6h, 006h, 0d5h, 0cah, 003h, 026h, 08ah, 047h, 029h, 08ah, 0e0h, 0d0h, 0fch, 002h, 0c4h
        db      0bbh, 090h, 067h, 0d7h, 098h, 001h, 006h, 0d0h, 0cah, 08bh, 036h, 0b9h, 086h, 08bh, 054h, 034h
        elseif  (XL) && (MODEL = 3200)
        db      005h, 0c6h, 006h, 085h, 0cbh, 003h, 026h, 08ah, 047h, 029h, 08ah, 0e0h, 0d0h, 0fch, 002h, 0c4h
        db      0bbh, 0c0h, 067h, 0d7h, 098h, 001h, 006h, 080h, 0cbh, 08bh, 036h, 069h, 087h, 08bh, 054h, 034h
        elseif  (XL) && (FW_VERSION < 150)
        db      005h, 0c6h, 006h, 0d5h, 0c9h, 003h, 026h, 08ah, 047h, 029h, 08ah, 0e0h, 0d0h, 0fch, 002h, 0c4h
        db      0bbh, 0d0h, 066h, 0d7h, 098h, 001h, 006h, 0d0h, 0c9h, 08bh, 036h, 019h, 086h, 08bh, 054h, 034h
        endif
        if      XL
        db      089h, 095h, 08ah, 000h, 09ah
        dw      far_196f0, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      089h, 055h, 014h, 08bh, 01eh, 0e1h, 086h, 026h, 08ah, 047h, 02ch, 0e8h, 0c0h, 001h, 0a2h, 0f4h
        db      0cah, 08bh, 036h, 0d9h, 086h, 08ah, 044h, 03ah, 024h, 060h, 03ch, 060h, 074h, 02bh, 0e8h, 0c9h
        db      003h, 072h, 01fh, 0a1h, 00fh, 087h, 08bh, 016h, 011h, 087h, 0bdh, 0fdh, 02ah, 09ah
        elseif  (XL) && (FW_VERSION = 150)
        db      089h, 055h, 014h, 08bh, 01eh, 0c1h, 086h, 026h, 08ah, 047h, 02ch, 0e8h, 0c0h, 001h, 0a2h, 0d4h
        db      0cah, 08bh, 036h, 0b9h, 086h, 08ah, 044h, 03ah, 024h, 060h, 03ch, 060h, 074h, 02bh, 0e8h, 0c9h
        db      003h, 072h, 01fh, 0a1h, 0efh, 086h, 08bh, 016h, 0f1h, 086h, 0bdh, 0fdh, 02ah, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      089h, 055h, 014h, 08bh, 01eh, 071h, 087h, 026h, 08ah, 047h, 02ch, 0e8h, 0c0h, 001h, 0a2h, 084h
        db      0cbh, 08bh, 036h, 069h, 087h, 08ah, 044h, 03ah, 024h, 060h, 03ch, 060h, 074h, 02bh, 0e8h, 0c9h
        db      003h, 072h, 01fh, 0a1h, 09fh, 087h, 08bh, 016h, 0a1h, 087h, 0bdh, 023h, 02bh, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      089h, 055h, 014h, 08bh, 01eh, 021h, 086h, 026h, 08ah, 047h, 02ch, 0e8h, 0c0h, 001h, 0a2h, 0d4h
        db      0c9h, 08bh, 036h, 019h, 086h, 08ah, 044h, 03ah, 024h, 060h, 03ch, 060h, 074h, 02bh, 0e8h, 0c9h
        db      003h, 072h, 01fh, 0a1h, 04fh, 086h, 08bh, 016h, 051h, 086h, 0bdh, 07bh, 02ah, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      072h, 010h, 0e8h, 02bh, 001h, 08bh, 01eh, 013h, 087h, 08bh, 00eh, 015h, 087h, 0e8h, 0dch, 002h
        db      0f8h, 0c3h, 0e8h, 055h, 001h, 0f9h, 0c3h, 08bh, 036h, 0d9h, 086h, 0bfh, 0c0h, 0cbh, 0c6h, 045h
        db      00dh, 027h, 0c6h, 045h, 00eh, 016h, 0c6h, 006h, 0f4h, 0cah, 0ceh, 0c6h, 006h, 0efh, 0cah, 07fh
        db      08bh, 036h, 0e1h, 086h, 08eh, 006h, 001h, 087h, 026h, 08ah, 044h, 02fh, 0a8h, 008h, 075h, 019h
        db      0a8h, 040h, 074h, 005h, 0c6h, 006h, 0efh, 0cah, 000h, 0a8h, 080h, 074h, 00ch, 050h, 026h, 08ah
        db      044h, 02ch, 0e8h, 047h, 001h, 0a2h, 0f4h, 0cah, 058h, 0a8h, 020h, 074h, 005h, 0c6h, 006h, 0f5h
        db      0cah, 003h, 0beh, 0c3h, 0cbh, 0bfh, 0e2h, 0cah, 08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch
        db      0f3h, 0a4h, 0e8h, 043h, 003h, 072h, 023h, 0a1h, 00fh, 087h, 08bh, 016h, 011h, 087h, 0bdh, 0fdh
        elseif  (XL) && (FW_VERSION = 150)
        db      072h, 010h, 0e8h, 02bh, 001h, 08bh, 01eh, 0f3h, 086h, 08bh, 00eh, 0f5h, 086h, 0e8h, 0dch, 002h
        db      0f8h, 0c3h, 0e8h, 055h, 001h, 0f9h, 0c3h, 08bh, 036h, 0b9h, 086h, 0bfh, 0a0h, 0cbh, 0c6h, 045h
        db      00dh, 027h, 0c6h, 045h, 00eh, 016h, 0c6h, 006h, 0d4h, 0cah, 0ceh, 0c6h, 006h, 0cfh, 0cah, 07fh
        db      08bh, 036h, 0c1h, 086h, 08eh, 006h, 0e1h, 086h, 026h, 08ah, 044h, 02fh, 0a8h, 008h, 075h, 019h
        db      0a8h, 040h, 074h, 005h, 0c6h, 006h, 0cfh, 0cah, 000h, 0a8h, 080h, 074h, 00ch, 050h, 026h, 08ah
        db      044h, 02ch, 0e8h, 047h, 001h, 0a2h, 0d4h, 0cah, 058h, 0a8h, 020h, 074h, 005h, 0c6h, 006h, 0d5h
        db      0cah, 003h, 0beh, 0a3h, 0cbh, 0bfh, 0c2h, 0cah, 08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch
        db      0f3h, 0a4h, 0e8h, 043h, 003h, 072h, 023h, 0a1h, 0efh, 086h, 08bh, 016h, 0f1h, 086h, 0bdh, 0fdh
        elseif  (XL) && (FW_VERSION < 150)
        db      072h, 010h, 0e8h, 02bh, 001h, 08bh, 01eh, 053h, 086h, 08bh, 00eh, 055h, 086h, 0e8h, 0dch, 002h
        db      0f8h, 0c3h, 0e8h, 055h, 001h, 0f9h, 0c3h, 08bh, 036h, 019h, 086h, 0bfh, 0a0h, 0cah, 0c6h, 045h
        db      00dh, 027h, 0c6h, 045h, 00eh, 016h, 0c6h, 006h, 0d4h, 0c9h, 0ceh, 0c6h, 006h, 0cfh, 0c9h, 07fh
        db      08bh, 036h, 021h, 086h, 08eh, 006h, 041h, 086h, 026h, 08ah, 044h, 02fh, 0a8h, 008h, 075h, 019h
        db      0a8h, 040h, 074h, 005h, 0c6h, 006h, 0cfh, 0c9h, 000h, 0a8h, 080h, 074h, 00ch, 050h, 026h, 08ah
        db      044h, 02ch, 0e8h, 047h, 001h, 0a2h, 0d4h, 0c9h, 058h, 0a8h, 020h, 074h, 005h, 0c6h, 006h, 0d5h
        db      0c9h, 003h, 0beh, 0a3h, 0cah, 0bfh, 0c2h, 0c9h, 08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch
        db      0f3h, 0a4h, 0e8h, 043h, 003h, 072h, 023h, 0a1h, 04fh, 086h, 08bh, 016h, 051h, 086h, 0bdh, 07bh
        endif
        if      (XL) && (MODEL = 3000)
        db      02ah, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      072h, 010h, 0e8h, 02bh, 001h, 08bh, 01eh, 0a3h, 087h, 08bh, 00eh, 0a5h, 087h, 0e8h, 0dch, 002h
        db      0f8h, 0c3h, 0e8h, 055h, 001h, 0f9h, 0c3h, 08bh, 036h, 069h, 087h, 0bfh, 050h, 0cch, 0c6h, 045h
        db      00dh, 027h, 0c6h, 045h, 00eh, 016h, 0c6h, 006h, 084h, 0cbh, 0ceh, 0c6h, 006h, 07fh, 0cbh, 07fh
        db      08bh, 036h, 071h, 087h, 08eh, 006h, 091h, 087h, 026h, 08ah, 044h, 02fh, 0a8h, 008h, 075h, 019h
        db      0a8h, 040h, 074h, 005h, 0c6h, 006h, 07fh, 0cbh, 000h, 0a8h, 080h, 074h, 00ch, 050h, 026h, 08ah
        db      044h, 02ch, 0e8h, 047h, 001h, 0a2h, 084h, 0cbh, 058h, 0a8h, 020h, 074h, 005h, 0c6h, 006h, 085h
        db      0cbh, 003h, 0beh, 053h, 0cch, 0bfh, 072h, 0cbh, 08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch
        db      0f3h, 0a4h, 0e8h, 043h, 003h, 072h, 023h, 0a1h, 09fh, 087h, 08bh, 016h, 0a1h, 087h, 0bdh, 023h
        db      02bh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      073h, 002h, 0ebh, 088h, 0e8h, 0a3h, 000h, 08bh, 036h, 0d9h, 086h, 08bh, 05ch, 014h, 08bh, 04ch
        db      016h, 0e8h, 052h, 002h, 08bh, 036h, 0d9h, 086h, 0bfh, 0c0h, 0cbh, 0c6h, 045h, 00dh, 027h, 0c6h
        db      045h, 00eh, 01ch, 08bh, 036h, 0d9h, 086h, 08eh, 006h, 001h, 087h, 0c6h, 006h, 00ch, 0cbh, 032h
        db      0c6h, 006h, 007h, 0cbh, 07fh, 0a1h, 0f0h, 0cah, 0a3h, 008h, 0cbh, 0a0h, 044h, 0cbh, 0a2h, 045h
        db      0cbh, 08bh, 036h, 0e1h, 086h, 026h, 08ah, 044h, 02fh, 0a8h, 008h, 075h, 019h, 0a8h, 080h, 074h
        db      005h, 0c6h, 006h, 007h, 0cbh, 000h, 0a8h, 040h, 074h, 00ch, 050h, 026h, 08ah, 044h, 02ch, 0e8h
        db      0b4h, 000h, 0a2h, 00ch, 0cbh, 058h, 0a8h, 020h, 074h, 005h, 0c6h, 006h, 00dh, 0cbh, 003h, 0beh
        db      0c3h, 0cbh, 0bfh, 0fah, 0cah, 08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch, 0f3h, 0a4h, 0e8h
        db      0b0h, 002h, 072h, 024h, 0a1h, 00fh, 087h, 08bh, 016h, 011h, 087h, 0bdh, 0fdh, 02ah, 09ah
        elseif  (XL) && (FW_VERSION = 150)
        db      073h, 002h, 0ebh, 088h, 0e8h, 0a3h, 000h, 08bh, 036h, 0b9h, 086h, 08bh, 05ch, 014h, 08bh, 04ch
        db      016h, 0e8h, 052h, 002h, 08bh, 036h, 0b9h, 086h, 0bfh, 0a0h, 0cbh, 0c6h, 045h, 00dh, 027h, 0c6h
        db      045h, 00eh, 01ch, 08bh, 036h, 0b9h, 086h, 08eh, 006h, 0e1h, 086h, 0c6h, 006h, 0ech, 0cah, 032h
        db      0c6h, 006h, 0e7h, 0cah, 07fh, 0a1h, 0d0h, 0cah, 0a3h, 0e8h, 0cah, 0a0h, 024h, 0cbh, 0a2h, 025h
        db      0cbh, 08bh, 036h, 0c1h, 086h, 026h, 08ah, 044h, 02fh, 0a8h, 008h, 075h, 019h, 0a8h, 080h, 074h
        db      005h, 0c6h, 006h, 0e7h, 0cah, 000h, 0a8h, 040h, 074h, 00ch, 050h, 026h, 08ah, 044h, 02ch, 0e8h
        db      0b4h, 000h, 0a2h, 0ech, 0cah, 058h, 0a8h, 020h, 074h, 005h, 0c6h, 006h, 0edh, 0cah, 003h, 0beh
        db      0a3h, 0cbh, 0bfh, 0dah, 0cah, 08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch, 0f3h, 0a4h, 0e8h
        db      0b0h, 002h, 072h, 024h, 0a1h, 0efh, 086h, 08bh, 016h, 0f1h, 086h, 0bdh, 0fdh, 02ah, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      073h, 002h, 0ebh, 088h, 0e8h, 0a3h, 000h, 08bh, 036h, 069h, 087h, 08bh, 05ch, 014h, 08bh, 04ch
        db      016h, 0e8h, 052h, 002h, 08bh, 036h, 069h, 087h, 0bfh, 050h, 0cch, 0c6h, 045h, 00dh, 027h, 0c6h
        db      045h, 00eh, 01ch, 08bh, 036h, 069h, 087h, 08eh, 006h, 091h, 087h, 0c6h, 006h, 09ch, 0cbh, 032h
        db      0c6h, 006h, 097h, 0cbh, 07fh, 0a1h, 080h, 0cbh, 0a3h, 098h, 0cbh, 0a0h, 0d4h, 0cbh, 0a2h, 0d5h
        db      0cbh, 08bh, 036h, 071h, 087h, 026h, 08ah, 044h, 02fh, 0a8h, 008h, 075h, 019h, 0a8h, 080h, 074h
        db      005h, 0c6h, 006h, 097h, 0cbh, 000h, 0a8h, 040h, 074h, 00ch, 050h, 026h, 08ah, 044h, 02ch, 0e8h
        db      0b4h, 000h, 0a2h, 09ch, 0cbh, 058h, 0a8h, 020h, 074h, 005h, 0c6h, 006h, 09dh, 0cbh, 003h, 0beh
        db      053h, 0cch, 0bfh, 08ah, 0cbh, 08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch, 0f3h, 0a4h, 0e8h
        db      0b0h, 002h, 072h, 024h, 0a1h, 09fh, 087h, 08bh, 016h, 0a1h, 087h, 0bdh, 023h, 02bh, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      073h, 002h, 0ebh, 088h, 0e8h, 0a3h, 000h, 08bh, 036h, 019h, 086h, 08bh, 05ch, 014h, 08bh, 04ch
        db      016h, 0e8h, 052h, 002h, 08bh, 036h, 019h, 086h, 0bfh, 0a0h, 0cah, 0c6h, 045h, 00dh, 027h, 0c6h
        db      045h, 00eh, 01ch, 08bh, 036h, 019h, 086h, 08eh, 006h, 041h, 086h, 0c6h, 006h, 0ech, 0c9h, 032h
        db      0c6h, 006h, 0e7h, 0c9h, 07fh, 0a1h, 0d0h, 0c9h, 0a3h, 0e8h, 0c9h, 0a0h, 024h, 0cah, 0a2h, 025h
        db      0cah, 08bh, 036h, 021h, 086h, 026h, 08ah, 044h, 02fh, 0a8h, 008h, 075h, 019h, 0a8h, 080h, 074h
        db      005h, 0c6h, 006h, 0e7h, 0c9h, 000h, 0a8h, 040h, 074h, 00ch, 050h, 026h, 08ah, 044h, 02ch, 0e8h
        db      0b4h, 000h, 0a2h, 0ech, 0c9h, 058h, 0a8h, 020h, 074h, 005h, 0c6h, 006h, 0edh, 0c9h, 003h, 0beh
        db      0a3h, 0cah, 0bfh, 0dah, 0c9h, 08ch, 0d8h, 08eh, 0c0h, 0b9h, 00ch, 000h, 0fch, 0f3h, 0a4h, 0e8h
        db      0b0h, 002h, 072h, 024h, 0a1h, 04fh, 086h, 08bh, 016h, 051h, 086h, 0bdh, 07bh, 02ah, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      073h, 003h, 0e9h, 0f4h, 0feh, 0e8h, 00fh, 000h, 08bh, 036h, 0d9h, 086h, 08bh, 05ch, 018h, 08bh
        db      04ch, 01ah, 0e8h, 0beh, 001h, 0f8h, 0c3h, 0a1h, 03dh, 073h, 08bh, 016h, 03fh, 073h, 0a3h, 0d6h
        db      0cbh, 089h, 016h, 0d8h, 0cbh, 0a3h, 0f7h, 086h, 089h, 016h, 0f9h, 086h, 0beh, 0c0h, 0cbh, 0e8h
        elseif  (XL) && (FW_VERSION = 150)
        db      073h, 003h, 0e9h, 0f4h, 0feh, 0e8h, 00fh, 000h, 08bh, 036h, 0b9h, 086h, 08bh, 05ch, 018h, 08bh
        db      04ch, 01ah, 0e8h, 0beh, 001h, 0f8h, 0c3h, 0a1h, 02dh, 073h, 08bh, 016h, 02fh, 073h, 0a3h, 0b6h
        db      0cbh, 089h, 016h, 0b8h, 0cbh, 0a3h, 0d7h, 086h, 089h, 016h, 0d9h, 086h, 0beh, 0a0h, 0cbh, 0e8h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0a6h, 002h, 050h, 0bdh, 013h, 029h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      073h, 003h, 0e9h, 0f4h, 0feh, 0e8h, 00fh, 000h, 08bh, 036h, 069h, 087h, 08bh, 05ch, 018h, 08bh
        db      04ch, 01ah, 0e8h, 0beh, 001h, 0f8h, 0c3h, 0a1h, 06dh, 073h, 08bh, 016h, 06fh, 073h, 0a3h, 066h
        db      0cch, 089h, 016h, 068h, 0cch, 0a3h, 087h, 087h, 089h, 016h, 089h, 087h, 0beh, 050h, 0cch, 0e8h
        db      0a6h, 002h, 050h, 0bdh, 039h, 029h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      073h, 003h, 0e9h, 0f4h, 0feh, 0e8h, 00fh, 000h, 08bh, 036h, 019h, 086h, 08bh, 05ch, 018h, 08bh
        db      04ch, 01ah, 0e8h, 0beh, 001h, 0f8h, 0c3h, 0a1h, 08dh, 072h, 08bh, 016h, 08fh, 072h, 0a3h, 0b6h
        db      0cah, 089h, 016h, 0b8h, 0cah, 0a3h, 037h, 086h, 089h, 016h, 039h, 086h, 0beh, 0a0h, 0cah, 0e8h
        db      0a6h, 002h, 050h, 0bdh, 0a3h, 028h, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      058h, 00eh, 0e8h, 0f2h, 02fh, 0bdh, 089h, 052h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      058h, 00eh, 0e8h, 075h, 02ah, 0bdh, 0e6h, 052h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      058h, 00eh, 0e8h, 002h, 030h, 0bdh, 0f3h, 051h, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0bdh, 03ch, 02ch, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0bdh, 062h, 02ch, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0bdh, 0bah, 02bh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0c3h, 0bbh, 0d0h, 0e8h, 0e8h, 083h, 005h, 0e8h, 0e7h, 076h, 0c6h, 006h, 0c2h, 086h, 001h, 0f9h
        elseif  (XL) && (FW_VERSION = 150)
        db      0c3h, 0bbh, 0d0h, 0e8h, 0e8h, 083h, 005h, 0e8h, 0e7h, 076h, 0c6h, 006h, 0a2h, 086h, 001h, 0f9h
        elseif  (XL) && (MODEL = 3200)
        db      0c3h, 0bbh, 0a0h, 0eeh, 0e8h, 083h, 005h, 0e8h, 067h, 071h, 0c6h, 006h, 052h, 087h, 001h, 0f9h
        elseif  (XL) && (FW_VERSION < 150)
        db      0c3h, 0bbh, 044h, 0e8h, 0e8h, 083h, 005h, 0e8h, 0e3h, 076h, 0c6h, 006h, 002h, 086h, 001h, 0f9h
        endif
        if      XL
        db      0c3h, 08ah, 001h
        db      "8INSUFFICIENT WAVEFORM MEMORY !"
        db      0ffh, 03ch, 000h, 075h, 002h, 0b0h, 001h, 02ch, 040h, 053h, 0b4h, 032h, 0f6h, 0ech, 0b3h, 03fh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0f6h, 0fbh, 05bh, 0c3h, 053h, 08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 011h, 0e9h, 05bh, 0c3h
        elseif  (XL) && (MODEL = 3200)
        db      0f6h, 0fbh, 05bh, 0c3h, 053h, 08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 0e1h, 0eeh, 05bh, 0c3h
        elseif  (XL) && (FW_VERSION < 150)
        db      0f6h, 0fbh, 05bh, 0c3h, 053h, 08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 085h, 0e8h, 05bh, 0c3h
        endif
        if      XL
        db      000h, 00ah, 014h, 019h, 01eh
        db      "!$&()*+-./0233455677899:;<==>>??@@AACCDDEEFFGGHIJKKLMNOPQQRSSTUVVWXXYZZZ[["
        db      05ch, 05ch
        db      "c]^__`aabbcccccccccccccccccccccccccccccccccccccccS"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 09fh, 0e9h, 05bh, 0c3h, 000h, 000h, 000h, 00ah, 00ch
        elseif  (XL) && (MODEL = 3200)
        db      08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 06fh, 0efh, 05bh, 0c3h, 000h, 000h, 000h, 00ah, 00ch
        elseif  (XL) && (FW_VERSION < 150)
        db      08ah, 0d8h, 02ah, 0ffh, 02eh, 08ah, 087h, 013h, 0e9h, 05bh, 0c3h, 000h, 000h, 000h, 00ah, 00ch
        endif
        if      XL
        db      00fh, 012h, 014h, 015h, 017h, 018h, 01ah, 01bh, 01dh, 01eh, 01fh, 01fh, 020h, 021h, 021h, 022h
        db      "##$%%&''(()*++,,--..//01233455677899:;<==>??@AABCCDDEEFGGHIIJJKLLMNNOPQRRSTUUVWWXYYZ["
        db      05ch
        db      "]^_`abccccccccccccccccc"
        db      0b4h, 063h, 0f6h, 0e4h, 0b3h, 07fh, 0f6h, 0f3h, 03ch, 000h, 074h, 008h, 004h, 00ah, 03ch, 063h
        db      072h, 002h, 0b0h, 063h, 05bh, 0c3h, 053h, 0b4h, 063h, 0f6h, 0e4h, 0b3h, 07fh, 0f6h, 0f3h, 05bh
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0c3h, 0a1h, 0f7h, 086h, 0a3h, 072h, 077h, 0a1h, 0f9h, 086h, 02ah, 0e4h, 0a3h, 074h, 077h, 0a1h
        db      0d9h, 086h, 02bh, 0d2h, 02dh, 0c0h, 0ceh, 003h, 0c3h, 013h, 0d1h, 08bh, 0d8h, 081h, 0e3h, 0ffh
        db      001h, 089h, 01eh, 0dbh, 086h, 08ah, 0c4h, 08ah, 0e2h, 08ah, 0d6h, 02ah, 0f6h, 0d1h, 0eah, 0d1h
        db      0d8h, 003h, 006h, 0c5h, 086h, 013h, 016h, 0c7h, 086h, 0a3h, 01bh, 087h, 089h, 016h, 01dh, 087h
        db      0a1h, 01bh, 087h, 08bh, 016h, 01dh, 087h, 050h, 025h, 00fh, 000h, 0a2h, 0a5h, 07fh, 058h, 0b9h
        db      004h, 000h, 0d1h, 0eah, 0d1h, 0d8h, 0e2h, 0fah, 0a3h, 0abh, 07fh, 0b9h, 000h, 022h, 08bh, 016h
        db      003h, 087h, 0b8h, 000h, 000h, 08ch, 0dbh, 08eh, 0c3h, 0e8h, 0ddh, 007h, 08eh, 006h, 003h, 087h
        db      08bh, 036h, 0dbh, 086h, 0bfh, 000h, 000h, 0b9h, 000h, 010h, 051h, 01eh, 08ch, 0c0h, 08eh, 0d8h
        db      0fch, 0f3h, 0a5h, 01fh, 059h, 051h, 08ch, 0c2h, 0beh, 000h, 000h, 0a1h, 0f7h, 086h, 0a3h, 072h
        db      077h, 0a1h, 0f9h, 086h, 02ah, 0e4h, 0a3h, 074h, 077h, 00eh, 0e8h, 0f0h, 028h, 059h, 0a1h, 0f7h
        db      086h, 08bh, 016h, 0f9h, 086h, 003h, 0c1h, 083h, 0d2h, 000h, 0a3h, 0f7h, 086h, 089h, 016h, 0f9h
        db      086h, 02bh, 006h, 03dh, 073h, 01bh, 016h, 03fh, 073h, 073h, 00dh, 083h, 006h, 01bh, 087h, 010h
        db      083h, 016h, 01dh, 087h, 000h, 0e9h, 078h, 0ffh, 0e8h, 07fh, 002h, 0f8h, 0c3h, 0b3h, 003h, 0bdh
        db      0c3h, 0cbh, 0ebh, 005h, 0b3h, 001h, 0bdh, 0c3h, 0c9h, 006h, 0bah, 04eh, 004h, 0b8h, 000h, 090h
        elseif  (XL) && (FW_VERSION = 150)
        db      0c3h, 0a1h, 0d7h, 086h, 0a3h, 062h, 077h, 0a1h, 0d9h, 086h, 02ah, 0e4h, 0a3h, 064h, 077h, 0a1h
        db      0b9h, 086h, 02bh, 0d2h, 02dh, 0a0h, 0ceh, 003h, 0c3h, 013h, 0d1h, 08bh, 0d8h, 081h, 0e3h, 0ffh
        db      001h, 089h, 01eh, 0bbh, 086h, 08ah, 0c4h, 08ah, 0e2h, 08ah, 0d6h, 02ah, 0f6h, 0d1h, 0eah, 0d1h
        db      0d8h, 003h, 006h, 0a5h, 086h, 013h, 016h, 0a7h, 086h, 0a3h, 0fbh, 086h, 089h, 016h, 0fdh, 086h
        db      0a1h, 0fbh, 086h, 08bh, 016h, 0fdh, 086h, 050h, 025h, 00fh, 000h, 0a2h, 095h, 07fh, 058h, 0b9h
        db      004h, 000h, 0d1h, 0eah, 0d1h, 0d8h, 0e2h, 0fah, 0a3h, 09bh, 07fh, 0b9h, 000h, 022h, 08bh, 016h
        db      0e3h, 086h, 0b8h, 000h, 000h, 08ch, 0dbh, 08eh, 0c3h, 0e8h, 0ddh, 007h, 08eh, 006h, 0e3h, 086h
        db      08bh, 036h, 0bbh, 086h, 0bfh, 000h, 000h, 0b9h, 000h, 010h, 051h, 01eh, 08ch, 0c0h, 08eh, 0d8h
        db      0fch, 0f3h, 0a5h, 01fh, 059h, 051h, 08ch, 0c2h, 0beh, 000h, 000h, 0a1h, 0d7h, 086h, 0a3h, 062h
        db      077h, 0a1h, 0d9h, 086h, 02ah, 0e4h, 0a3h, 064h, 077h, 00eh, 0e8h, 0f0h, 028h, 059h, 0a1h, 0d7h
        db      086h, 08bh, 016h, 0d9h, 086h, 003h, 0c1h, 083h, 0d2h, 000h, 0a3h, 0d7h, 086h, 089h, 016h, 0d9h
        db      086h, 02bh, 006h, 02dh, 073h, 01bh, 016h, 02fh, 073h, 073h, 00dh, 083h, 006h, 0fbh, 086h, 010h
        db      083h, 016h, 0fdh, 086h, 000h, 0e9h, 078h, 0ffh, 0e8h, 07fh, 002h, 0f8h, 0c3h, 0b3h, 003h, 0bdh
        db      0a3h, 0cbh, 0ebh, 005h, 0b3h, 001h, 0bdh, 0a3h, 0c9h, 006h, 0bah, 04eh, 004h, 0b8h, 000h, 090h
        elseif  (XL) && (MODEL = 3200)
        db      0c3h, 0a1h, 087h, 087h, 0a3h, 0a2h, 077h, 0a1h, 089h, 087h, 02ah, 0e4h, 0a3h, 0a4h, 077h, 0a1h
        db      069h, 087h, 02bh, 0d2h, 02dh, 050h, 0cfh, 003h, 0c3h, 013h, 0d1h, 08bh, 0d8h, 081h, 0e3h, 0ffh
        db      001h, 089h, 01eh, 06bh, 087h, 08ah, 0c4h, 08ah, 0e2h, 08ah, 0d6h, 02ah, 0f6h, 0d1h, 0eah, 0d1h
        db      0d8h, 003h, 006h, 055h, 087h, 013h, 016h, 057h, 087h, 0a3h, 0abh, 087h, 089h, 016h, 0adh, 087h
        db      0a1h, 0abh, 087h, 08bh, 016h, 0adh, 087h, 050h, 025h, 00fh, 000h, 0a2h, 0d5h, 07fh, 058h, 0b9h
        db      004h, 000h, 0d1h, 0eah, 0d1h, 0d8h, 0e2h, 0fah, 0a3h, 0dbh, 07fh, 0b9h, 000h, 022h, 08bh, 016h
        db      093h, 087h, 0b8h, 000h, 000h, 08ch, 0dbh, 08eh, 0c3h, 0e8h, 0ddh, 007h, 08eh, 006h, 093h, 087h
        db      08bh, 036h, 06bh, 087h, 0bfh, 000h, 000h, 0b9h, 000h, 010h, 051h, 01eh, 08ch, 0c0h, 08eh, 0d8h
        db      0fch, 0f3h, 0a5h, 01fh, 059h, 051h, 08ch, 0c2h, 0beh, 000h, 000h, 0a1h, 087h, 087h, 0a3h, 0a2h
        db      077h, 0a1h, 089h, 087h, 02ah, 0e4h, 0a3h, 0a4h, 077h, 00eh, 0e8h, 073h, 023h, 059h, 0a1h, 087h
        db      087h, 08bh, 016h, 089h, 087h, 003h, 0c1h, 083h, 0d2h, 000h, 0a3h, 087h, 087h, 089h, 016h, 089h
        db      087h, 02bh, 006h, 06dh, 073h, 01bh, 016h, 06fh, 073h, 073h, 00dh, 083h, 006h, 0abh, 087h, 010h
        db      083h, 016h, 0adh, 087h, 000h, 0e9h, 078h, 0ffh, 0e8h, 07fh, 002h, 0f8h, 0c3h, 0b3h, 003h, 0bdh
        db      053h, 0cch, 0ebh, 005h, 0b3h, 001h, 0bdh, 053h, 0cah, 006h, 0bah, 04eh, 004h, 0b8h, 000h, 090h
        elseif  (XL) && (FW_VERSION < 150)
        db      0c3h, 0a1h, 037h, 086h, 0a3h, 0c2h, 076h, 0a1h, 039h, 086h, 02ah, 0e4h, 0a3h, 0c4h, 076h, 0a1h
        db      019h, 086h, 02bh, 0d2h, 02dh, 0a0h, 0cdh, 003h, 0c3h, 013h, 0d1h, 08bh, 0d8h, 081h, 0e3h, 0ffh
        db      001h, 089h, 01eh, 01bh, 086h, 08ah, 0c4h, 08ah, 0e2h, 08ah, 0d6h, 02ah, 0f6h, 0d1h, 0eah, 0d1h
        db      0d8h, 003h, 006h, 005h, 086h, 013h, 016h, 007h, 086h, 0a3h, 05bh, 086h, 089h, 016h, 05dh, 086h
        db      0a1h, 05bh, 086h, 08bh, 016h, 05dh, 086h, 050h, 025h, 00fh, 000h, 0a2h, 0f5h, 07eh, 058h, 0b9h
        db      004h, 000h, 0d1h, 0eah, 0d1h, 0d8h, 0e2h, 0fah, 0a3h, 0fbh, 07eh, 0b9h, 000h, 022h, 08bh, 016h
        db      043h, 086h, 0b8h, 000h, 000h, 08ch, 0dbh, 08eh, 0c3h, 0e8h, 0ddh, 007h, 08eh, 006h, 043h, 086h
        db      08bh, 036h, 01bh, 086h, 0bfh, 000h, 000h, 0b9h, 000h, 010h, 051h, 01eh, 08ch, 0c0h, 08eh, 0d8h
        db      0fch, 0f3h, 0a5h, 01fh, 059h, 051h, 08ch, 0c2h, 0beh, 000h, 000h, 0a1h, 037h, 086h, 0a3h, 0c2h
        db      076h, 0a1h, 039h, 086h, 02ah, 0e4h, 0a3h, 0c4h, 076h, 00eh, 0e8h, 02dh, 029h, 059h, 0a1h, 037h
        db      086h, 08bh, 016h, 039h, 086h, 003h, 0c1h, 083h, 0d2h, 000h, 0a3h, 037h, 086h, 089h, 016h, 039h
        db      086h, 02bh, 006h, 08dh, 072h, 01bh, 016h, 08fh, 072h, 073h, 00dh, 083h, 006h, 05bh, 086h, 010h
        db      083h, 016h, 05dh, 086h, 000h, 0e9h, 078h, 0ffh, 0e8h, 07fh, 002h, 0f8h, 0c3h, 0b3h, 003h, 0bdh
        db      0a3h, 0cah, 0ebh, 005h, 0b3h, 001h, 0bdh, 0a3h, 0c8h, 006h, 0bah, 04eh, 004h, 0b8h, 000h, 090h
        endif
        if      XL
        db      08eh, 0c0h, 0bfh, 003h, 000h, 08bh, 0f5h, 026h, 038h, 01eh, 000h, 000h, 075h, 008h, 0b9h, 00ch
        db      000h, 0fch, 0f3h, 0a6h, 074h, 00dh, 08ch, 0c0h, 005h, 00ch, 000h, 08eh, 0c0h, 04ah, 075h, 0e2h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0f8h, 007h, 0c3h, 0f9h, 007h, 0c3h, 006h, 056h, 0b8h, 001h, 000h, 0bdh, 0eah, 0b1h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      0f8h, 007h, 0c3h, 0f9h, 007h, 0c3h, 006h, 056h, 0b8h, 001h, 000h, 0bdh, 04ch, 0b3h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0f8h, 007h, 0c3h, 0f9h, 007h, 0c3h, 006h, 056h, 0b8h, 001h, 000h, 0bdh, 02ah, 0afh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      05eh, 073h, 002h, 0ebh, 019h, 056h, 0b8h, 000h, 090h, 08eh, 0c0h, 0bdh, 0e0h, 0b1h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      05eh, 073h, 002h, 0ebh, 019h, 056h, 0b8h, 000h, 090h, 08eh, 0c0h, 0bdh, 042h, 0b3h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      05eh, 073h, 002h, 0ebh, 019h, 056h, 0b8h, 000h, 090h, 08eh, 0c0h, 0bdh, 020h, 0afh, 09ah
        endif
        if      XL
        dw      far_1fbaa, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      05eh, 0fch, 0b9h, 0c0h, 000h, 0f3h, 0a4h, 08ch, 0c0h, 007h, 0c3h, 0bbh, 08eh, 063h, 09ah
        elseif  (XL) && (MODEL = 3200)
        db      05eh, 0fch, 0b9h, 0c0h, 000h, 0f3h, 0a4h, 08ch, 0c0h, 007h, 0c3h, 0bbh, 0beh, 063h, 09ah
        elseif  (XL) && (FW_VERSION < 150)
        db      05eh, 0fch, 0b9h, 0c0h, 000h, 0f3h, 0a4h, 08ch, 0c0h, 007h, 0c3h, 0bbh, 01fh, 063h, 09ah
        endif
        if      XL
        dw      far_1d76b, SEG_MAIN
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0e9h, 0f7h, 0f1h, 0bbh, 000h, 000h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0c0h, 0cch, 0e8h
        db      012h, 003h, 0a0h, 0e8h, 0cch, 02ah, 0e4h, 0d1h, 0e0h, 005h, 0d6h, 0ebh, 08bh, 0d8h, 02eh, 08bh
        db      007h, 0a3h, 0f5h, 086h, 08bh, 01eh, 0d0h, 0cch, 0b9h, 000h, 010h, 0bah, 000h, 000h, 0b8h, 0c0h
        db      0d9h, 0e8h, 0f0h, 002h, 0bbh, 000h, 000h, 0beh, 0c0h, 0d9h, 08bh, 004h, 083h, 0c6h, 020h, 03dh
        elseif  (XL) && (FW_VERSION = 150)
        db      0e9h, 0f7h, 0f1h, 0bbh, 000h, 000h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0a0h, 0cch, 0e8h
        db      012h, 003h, 0a0h, 0c8h, 0cch, 02ah, 0e4h, 0d1h, 0e0h, 005h, 0d6h, 0ebh, 08bh, 0d8h, 02eh, 08bh
        db      007h, 0a3h, 0d5h, 086h, 08bh, 01eh, 0b0h, 0cch, 0b9h, 000h, 010h, 0bah, 000h, 000h, 0b8h, 0a0h
        db      0d9h, 0e8h, 0f0h, 002h, 0bbh, 000h, 000h, 0beh, 0a0h, 0d9h, 08bh, 004h, 083h, 0c6h, 020h, 03dh
        elseif  (XL) && (MODEL = 3200)
        db      0e9h, 0f7h, 0f1h, 0bbh, 000h, 000h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 050h, 0cdh, 0e8h
        db      012h, 003h, 0a0h, 078h, 0cdh, 02ah, 0e4h, 0d1h, 0e0h, 005h, 0a6h, 0f1h, 08bh, 0d8h, 02eh, 08bh
        db      007h, 0a3h, 085h, 087h, 08bh, 01eh, 060h, 0cdh, 0b9h, 000h, 010h, 0bah, 000h, 000h, 0b8h, 050h
        db      0dah, 0e8h, 0f0h, 002h, 0bbh, 000h, 000h, 0beh, 050h, 0dah, 08bh, 004h, 083h, 0c6h, 020h, 03dh
        elseif  (XL) && (FW_VERSION < 150)
        db      0e9h, 0f7h, 0f1h, 0bbh, 000h, 000h, 0b9h, 000h, 002h, 0bah, 000h, 000h, 0b8h, 0a0h, 0cbh, 0e8h
        db      012h, 003h, 0a0h, 0c8h, 0cbh, 02ah, 0e4h, 0d1h, 0e0h, 005h, 04ah, 0ebh, 08bh, 0d8h, 02eh, 08bh
        db      007h, 0a3h, 035h, 086h, 08bh, 01eh, 0b0h, 0cbh, 0b9h, 000h, 010h, 0bah, 000h, 000h, 0b8h, 0a0h
        db      0d8h, 0e8h, 0f0h, 002h, 0bbh, 000h, 000h, 0beh, 0a0h, 0d8h, 08bh, 004h, 083h, 0c6h, 020h, 03dh
        endif
        if      XL
        db      000h, 000h, 074h, 00fh, 080h, 07ch, 011h, 000h, 074h, 0f0h, 080h, 07ch, 011h, 064h, 073h, 0eah
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      043h, 0ebh, 0e7h, 08ch, 0d8h, 08eh, 0c0h, 089h, 01eh, 0b3h, 086h, 0c3h, 040h, 000h, 080h, 000h
        elseif  (XL) && (FW_VERSION = 150)
        db      043h, 0ebh, 0e7h, 08ch, 0d8h, 08eh, 0c0h, 089h, 01eh, 093h, 086h, 0c3h, 040h, 000h, 080h, 000h
        elseif  (XL) && (MODEL = 3200)
        db      043h, 0ebh, 0e7h, 08ch, 0d8h, 08eh, 0c0h, 089h, 01eh, 043h, 087h, 0c3h, 040h, 000h, 080h, 000h
        elseif  (XL) && (FW_VERSION < 150)
        db      043h, 0ebh, 0e7h, 08ch, 0d8h, 08eh, 0c0h, 089h, 01eh, 0f3h, 085h, 0c3h, 040h, 000h, 080h, 000h
        endif
        if      XL
        db      000h, 001h, 000h, 002h, 000h, 004h, 000h, 008h, 000h, 010h, 000h, 020h, 000h, 040h, 000h, 080h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      08ch, 0d8h, 08eh, 0c0h, 0beh, 0a0h, 0d9h, 083h, 0c6h, 020h, 080h, 07ch, 011h, 001h, 075h, 0f7h
        db      08bh, 00eh, 0b1h, 086h, 0feh, 0c1h, 02ah, 0edh, 080h, 07ch, 011h, 000h, 075h, 003h, 083h, 0c6h
        db      020h, 083h, 0c6h, 020h, 0e2h, 0f2h, 083h, 0eeh, 020h, 089h, 036h, 005h, 087h, 08bh, 044h, 012h
        db      048h, 08bh, 01eh, 0f5h, 086h, 0f7h, 0e3h, 003h, 006h, 0e0h, 0cch, 083h, 0d2h, 000h, 0a3h, 0c9h
        db      086h, 089h, 016h, 0cbh, 086h, 0b9h, 000h, 02ch, 08bh, 02eh, 0ffh, 086h, 0bbh, 000h, 000h, 0e8h
        db      07ah, 002h, 0e8h, 005h, 000h, 08ch, 0d8h, 08eh, 0c0h, 0c3h, 08eh, 006h, 0ffh, 086h, 0beh, 000h
        elseif  (XL) && (FW_VERSION = 150)
        db      08ch, 0d8h, 08eh, 0c0h, 0beh, 080h, 0d9h, 083h, 0c6h, 020h, 080h, 07ch, 011h, 001h, 075h, 0f7h
        db      08bh, 00eh, 091h, 086h, 0feh, 0c1h, 02ah, 0edh, 080h, 07ch, 011h, 000h, 075h, 003h, 083h, 0c6h
        db      020h, 083h, 0c6h, 020h, 0e2h, 0f2h, 083h, 0eeh, 020h, 089h, 036h, 0e5h, 086h, 08bh, 044h, 012h
        db      048h, 08bh, 01eh, 0d5h, 086h, 0f7h, 0e3h, 003h, 006h, 0c0h, 0cch, 083h, 0d2h, 000h, 0a3h, 0a9h
        db      086h, 089h, 016h, 0abh, 086h, 0b9h, 000h, 02ch, 08bh, 02eh, 0dfh, 086h, 0bbh, 000h, 000h, 0e8h
        db      07ah, 002h, 0e8h, 005h, 000h, 08ch, 0d8h, 08eh, 0c0h, 0c3h, 08eh, 006h, 0dfh, 086h, 0beh, 000h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      000h, 0b9h, 00ch, 000h, 0bfh, 0c9h, 0ech, 026h, 08ah, 004h, 02eh, 03ah, 005h
        elseif  (XL) && (MODEL = 3200)
        db      08ch, 0d8h, 08eh, 0c0h, 0beh, 030h, 0dah, 083h, 0c6h, 020h, 080h, 07ch, 011h, 001h, 075h, 0f7h
        db      08bh, 00eh, 041h, 087h, 0feh, 0c1h, 02ah, 0edh, 080h, 07ch, 011h, 000h, 075h, 003h, 083h, 0c6h
        db      020h, 083h, 0c6h, 020h, 0e2h, 0f2h, 083h, 0eeh, 020h, 089h, 036h, 095h, 087h, 08bh, 044h, 012h
        db      048h, 08bh, 01eh, 085h, 087h, 0f7h, 0e3h, 003h, 006h, 070h, 0cdh, 083h, 0d2h, 000h, 0a3h, 059h
        db      087h, 089h, 016h, 05bh, 087h, 0b9h, 000h, 02ch, 08bh, 02eh, 08fh, 087h, 0bbh, 000h, 000h, 0e8h
        db      07ah, 002h, 0e8h, 005h, 000h, 08ch, 0d8h, 08eh, 0c0h, 0c3h, 08eh, 006h, 08fh, 087h, 0beh, 000h
        db      000h, 0b9h, 00ch, 000h, 0bfh, 099h, 0f2h, 026h, 08ah, 004h, 02eh, 03ah, 005h
        elseif  (XL) && (FW_VERSION < 150)
        db      08ch, 0d8h, 08eh, 0c0h, 0beh, 080h, 0d8h, 083h, 0c6h, 020h, 080h, 07ch, 011h, 001h, 075h, 0f7h
        db      08bh, 00eh, 0f1h, 085h, 0feh, 0c1h, 02ah, 0edh, 080h, 07ch, 011h, 000h, 075h, 003h, 083h, 0c6h
        db      020h, 083h, 0c6h, 020h, 0e2h, 0f2h, 083h, 0eeh, 020h, 089h, 036h, 045h, 086h, 08bh, 044h, 012h
        db      048h, 08bh, 01eh, 035h, 086h, 0f7h, 0e3h, 003h, 006h, 0c0h, 0cbh, 083h, 0d2h, 000h, 0a3h, 009h
        db      086h, 089h, 016h, 00bh, 086h, 0b9h, 000h, 02ch, 08bh, 02eh, 03fh, 086h, 0bbh, 000h, 000h, 0e8h
        db      07ah, 002h, 0e8h, 005h, 000h, 08ch, 0d8h, 08eh, 0c0h, 0c3h, 08eh, 006h, 03fh, 086h, 0beh, 000h
        db      000h, 0b9h, 00ch, 000h, 0bfh, 03dh, 0ech, 026h, 08ah, 004h, 02eh, 03ah, 005h
        endif
        if      XL
        db      "u=FG"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0e2h, 0f4h, 0c6h, 006h, 0c4h, 086h, 001h, 0c6h, 006h, 0b7h, 086h, 0ffh, 0c7h, 006h, 0cdh, 086h
        db      0cah, 017h, 0c7h, 006h, 0cfh, 086h, 072h, 02bh, 0c7h, 006h, 0d1h, 086h, 000h, 000h, 026h, 0a1h
        db      06ch, 000h, 026h, 08bh, 016h, 06eh, 000h, 0b8h, 000h, 000h, 0bah, 000h, 000h, 0a3h, 0d3h, 086h
        db      089h, 016h, 0d5h, 086h, 0c7h, 006h, 0e3h, 086h, 0d2h, 01bh, 0c3h, 0c6h, 006h, 0c4h, 086h, 000h
        db      0c6h, 006h, 0b7h, 086h, 063h, 0c7h, 006h, 0cdh, 086h, 06ch, 000h, 0c7h, 006h, 0cfh, 086h, 04ah
        db      007h, 0c7h, 006h, 0d1h, 086h, 000h, 000h, 026h, 0a1h, 06ch, 000h, 026h, 08bh, 016h, 06eh, 000h
        db      0a3h, 0d3h, 086h, 089h, 016h, 0d5h, 086h, 0c7h, 006h, 0e3h, 086h, 004h, 002h, 0c3h
        elseif  (XL) && (FW_VERSION = 150)
        db      0e2h, 0f4h, 0c6h, 006h, 0a4h, 086h, 001h, 0c6h, 006h, 097h, 086h, 0ffh, 0c7h, 006h, 0adh, 086h
        db      0cah, 017h, 0c7h, 006h, 0afh, 086h, 072h, 02bh, 0c7h, 006h, 0b1h, 086h, 000h, 000h, 026h, 0a1h
        db      06ch, 000h, 026h, 08bh, 016h, 06eh, 000h, 0b8h, 000h, 000h, 0bah, 000h, 000h, 0a3h, 0b3h, 086h
        db      089h, 016h, 0b5h, 086h, 0c7h, 006h, 0c3h, 086h, 0d2h, 01bh, 0c3h, 0c6h, 006h, 0a4h, 086h, 000h
        db      0c6h, 006h, 097h, 086h, 063h, 0c7h, 006h, 0adh, 086h, 06ch, 000h, 0c7h, 006h, 0afh, 086h, 04ah
        db      007h, 0c7h, 006h, 0b1h, 086h, 000h, 000h, 026h, 0a1h, 06ch, 000h, 026h, 08bh, 016h, 06eh, 000h
        db      0a3h, 0b3h, 086h, 089h, 016h, 0b5h, 086h, 0c7h, 006h, 0c3h, 086h, 004h, 002h, 0c3h
        elseif  (XL) && (MODEL = 3200)
        db      0e2h, 0f4h, 0c6h, 006h, 054h, 087h, 001h, 0c6h, 006h, 047h, 087h, 0ffh, 0c7h, 006h, 05dh, 087h
        db      0cah, 017h, 0c7h, 006h, 05fh, 087h, 072h, 02bh, 0c7h, 006h, 061h, 087h, 000h, 000h, 026h, 0a1h
        db      06ch, 000h, 026h, 08bh, 016h, 06eh, 000h, 0b8h, 000h, 000h, 0bah, 000h, 000h, 0a3h, 063h, 087h
        db      089h, 016h, 065h, 087h, 0c7h, 006h, 073h, 087h, 0d2h, 01bh, 0c3h, 0c6h, 006h, 054h, 087h, 000h
        db      0c6h, 006h, 047h, 087h, 063h, 0c7h, 006h, 05dh, 087h, 06ch, 000h, 0c7h, 006h, 05fh, 087h, 04ah
        db      007h, 0c7h, 006h, 061h, 087h, 000h, 000h, 026h, 0a1h, 06ch, 000h, 026h, 08bh, 016h, 06eh, 000h
        db      0a3h, 063h, 087h, 089h, 016h, 065h, 087h, 0c7h, 006h, 073h, 087h, 004h, 002h, 0c3h
        elseif  (XL) && (FW_VERSION < 150)
        db      0e2h, 0f4h, 0c6h, 006h, 004h, 086h, 001h, 0c6h, 006h, 0f7h, 085h, 0ffh, 0c7h, 006h, 00dh, 086h
        db      0cah, 017h, 0c7h, 006h, 00fh, 086h, 072h, 02bh, 0c7h, 006h, 011h, 086h, 000h, 000h, 026h, 0a1h
        db      06ch, 000h, 026h, 08bh, 016h, 06eh, 000h, 0b8h, 000h, 000h, 0bah, 000h, 000h, 0a3h, 013h, 086h
        db      089h, 016h, 015h, 086h, 0c7h, 006h, 023h, 086h, 0d2h, 01bh, 0c3h, 0c6h, 006h, 004h, 086h, 000h
        db      0c6h, 006h, 0f7h, 085h, 063h, 0c7h, 006h, 00dh, 086h, 06ch, 000h, 0c7h, 006h, 00fh, 086h, 04ah
        db      007h, 0c7h, 006h, 011h, 086h, 000h, 000h, 026h, 0a1h, 06ch, 000h, 026h, 08bh, 016h, 06eh, 000h
        db      0a3h, 013h, 086h, 089h, 016h, 015h, 086h, 0c7h, 006h, 023h, 086h, 004h, 002h, 0c3h
        endif
        if      XL
        db      "EMULATOR 3X "
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0c6h, 006h, 019h, 087h, 000h, 003h, 006h, 0cfh, 086h, 013h, 016h, 0d1h, 086h, 08bh, 0d8h, 08ah
        elseif  (XL) && (FW_VERSION = 150)
        db      0c6h, 006h, 0f9h, 086h, 000h, 003h, 006h, 0afh, 086h, 013h, 016h, 0b1h, 086h, 08bh, 0d8h, 08ah
        elseif  (XL) && (MODEL = 3200)
        db      0c6h, 006h, 0a9h, 087h, 000h, 003h, 006h, 05fh, 087h, 013h, 016h, 061h, 087h, 08bh, 0d8h, 08ah
        elseif  (XL) && (FW_VERSION < 150)
        db      0c6h, 006h, 059h, 086h, 000h, 003h, 006h, 00fh, 086h, 013h, 016h, 011h, 086h, 08bh, 0d8h, 08ah
        endif
        if      XL
        db      0c4h, 08ah, 0e2h, 08ah, 0d6h, 02ah, 0f6h, 0d1h, 0eah, 0d1h, 0d8h, 081h, 0e3h, 0ffh, 001h, 053h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      003h, 006h, 0c9h, 086h, 013h, 016h, 0cbh, 086h, 08bh, 02eh, 001h, 087h, 0bbh, 000h, 000h, 0e8h
        db      0afh, 001h, 05eh, 089h, 036h, 0d7h, 086h, 0c3h, 08eh, 006h, 0ffh, 086h, 0c1h, 0e0h, 002h, 003h
        db      006h, 0e3h, 086h, 08bh, 0f0h, 026h, 08bh, 004h, 026h, 08bh, 054h, 002h, 083h, 0eah, 040h, 072h
        elseif  (XL) && (FW_VERSION = 150)
        db      003h, 006h, 0a9h, 086h, 013h, 016h, 0abh, 086h, 08bh, 02eh, 0e1h, 086h, 0bbh, 000h, 000h, 0e8h
        db      0afh, 001h, 05eh, 089h, 036h, 0b7h, 086h, 0c3h, 08eh, 006h, 0dfh, 086h, 0c1h, 0e0h, 002h, 003h
        db      006h, 0c3h, 086h, 08bh, 0f0h, 026h, 08bh, 004h, 026h, 08bh, 054h, 002h, 083h, 0eah, 040h, 072h
        elseif  (XL) && (MODEL = 3200)
        db      003h, 006h, 059h, 087h, 013h, 016h, 05bh, 087h, 08bh, 02eh, 091h, 087h, 0bbh, 000h, 000h, 0e8h
        db      0afh, 001h, 05eh, 089h, 036h, 067h, 087h, 0c3h, 08eh, 006h, 08fh, 087h, 0c1h, 0e0h, 002h, 003h
        db      006h, 073h, 087h, 08bh, 0f0h, 026h, 08bh, 004h, 026h, 08bh, 054h, 002h, 083h, 0eah, 040h, 072h
        elseif  (XL) && (FW_VERSION < 150)
        db      003h, 006h, 009h, 086h, 013h, 016h, 00bh, 086h, 08bh, 02eh, 041h, 086h, 0bbh, 000h, 000h, 0e8h
        db      0afh, 001h, 05eh, 089h, 036h, 017h, 086h, 0c3h, 08eh, 006h, 03fh, 086h, 0c1h, 0e0h, 002h, 003h
        db      006h, 023h, 086h, 08bh, 0f0h, 026h, 08bh, 004h, 026h, 08bh, 054h, 002h, 083h, 0eah, 040h, 072h
        endif
        if      XL
        db      049h, 026h, 003h, 006h, 030h, 000h, 026h, 013h, 016h, 032h, 000h, 005h, 04ch, 000h, 083h, 0d2h
        db      000h, 08bh, 0d8h, 081h, 0e3h, 0ffh, 001h, 053h, 08ah, 0c4h, 08ah, 0e2h, 08ah, 0d6h, 02ah, 0f6h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0d1h, 0eah, 0d1h, 0d8h, 003h, 006h, 0c9h, 086h, 013h, 016h, 0cbh, 086h, 0a3h, 0c5h, 086h, 089h
        db      016h, 0c7h, 086h, 0bdh, 000h, 000h, 0bbh, 0c0h, 0ceh, 0b9h, 000h, 006h, 0e8h, 052h, 001h, 05eh
        db      081h, 0c6h, 0c0h, 0ceh, 089h, 036h, 0d9h, 086h, 0f8h, 0c3h, 0f9h, 0c3h, 0bbh, 091h, 0edh, 0e8h
        db      0d2h, 000h, 08bh, 036h, 0d9h, 086h, 0b8h, 000h, 000h, 08eh, 0c0h, 0b3h, 04ah, 0b7h, 038h, 0b9h
        elseif  (XL) && (FW_VERSION = 150)
        db      0d1h, 0eah, 0d1h, 0d8h, 003h, 006h, 0a9h, 086h, 013h, 016h, 0abh, 086h, 0a3h, 0a5h, 086h, 089h
        db      016h, 0a7h, 086h, 0bdh, 000h, 000h, 0bbh, 0a0h, 0ceh, 0b9h, 000h, 006h, 0e8h, 052h, 001h, 05eh
        db      081h, 0c6h, 0a0h, 0ceh, 089h, 036h, 0b9h, 086h, 0f8h, 0c3h, 0f9h, 0c3h, 0bbh, 091h, 0edh, 0e8h
        db      0d2h, 000h, 08bh, 036h, 0b9h, 086h, 0b8h, 000h, 000h, 08eh, 0c0h, 0b3h, 04ah, 0b7h, 038h, 0b9h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      010h, 000h, 0e8h, 07fh, 000h, 0c3h, 0bbh, 0b1h, 0edh, 0e9h, 0b8h, 000h, 08ah, 003h
        elseif  (XL) && (MODEL = 3200)
        db      0d1h, 0eah, 0d1h, 0d8h, 003h, 006h, 059h, 087h, 013h, 016h, 05bh, 087h, 0a3h, 055h, 087h, 089h
        db      016h, 057h, 087h, 0bdh, 000h, 000h, 0bbh, 050h, 0cfh, 0b9h, 000h, 006h, 0e8h, 052h, 001h, 05eh
        db      081h, 0c6h, 050h, 0cfh, 089h, 036h, 069h, 087h, 0f8h, 0c3h, 0f9h, 0c3h, 0bbh, 061h, 0f3h, 0e8h
        db      0d2h, 000h, 08bh, 036h, 069h, 087h, 0b8h, 000h, 000h, 08eh, 0c0h, 0b3h, 04ah, 0b7h, 038h, 0b9h
        db      010h, 000h, 0e8h, 07fh, 000h, 0c3h, 0bbh, 081h, 0f3h, 0e9h, 0b8h, 000h, 08ah, 003h
        elseif  (XL) && (FW_VERSION < 150)
        db      0d1h, 0eah, 0d1h, 0d8h, 003h, 006h, 009h, 086h, 013h, 016h, 00bh, 086h, 0a3h, 005h, 086h, 089h
        db      016h, 007h, 086h, 0bdh, 000h, 000h, 0bbh, 0a0h, 0cdh, 0b9h, 000h, 006h, 0e8h, 052h, 001h, 05eh
        db      081h, 0c6h, 0a0h, 0cdh, 089h, 036h, 019h, 086h, 0f8h, 0c3h, 0f9h, 0c3h, 0bbh, 005h, 0edh, 0e8h
        db      0d2h, 000h, 08bh, 036h, 019h, 086h, 0b8h, 000h, 000h, 08eh, 0c0h, 0b3h, 04ah, 0b7h, 038h, 0b9h
        db      010h, 000h, 0e8h, 07fh, 000h, 0c3h, 0bbh, 025h, 0edh, 0e9h, 0b8h, 000h, 08ah, 003h
        endif
        if      XL
        db      "8loading smp:                "
        db      0ffh, 08ah, 003h, 038h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0ffh, 0bbh, 0eah, 0edh, 0e8h, 072h, 000h, 08eh, 006h, 001h, 087h, 08bh, 036h, 0d7h, 086h, 0b3h
        elseif  (XL) && (FW_VERSION = 150)
        db      0ffh, 0bbh, 0eah, 0edh, 0e8h, 072h, 000h, 08eh, 006h, 0e1h, 086h, 08bh, 036h, 0b7h, 086h, 0b3h
        elseif  (XL) && (MODEL = 3200)
        db      0ffh, 0bbh, 0bah, 0f3h, 0e8h, 072h, 000h, 08eh, 006h, 091h, 087h, 08bh, 036h, 067h, 087h, 0b3h
        elseif  (XL) && (FW_VERSION < 150)
        db      0ffh, 0bbh, 05eh, 0edh, 0e8h, 072h, 000h, 08eh, 006h, 041h, 086h, 08bh, 036h, 017h, 086h, 0b3h
        endif
        if      XL
        db      04bh, 0b7h, 038h, 0b9h, 010h, 000h, 0e8h, 020h, 000h, 0c3h, 08ah, 003h
        db      "8loading prg:               "
        db      0ffh
        db      "WVPSQR"
        db      006h, 0b0h, 08ah, 0e8h, 023h, 000h, 08ah, 0c3h, 0e8h, 01eh, 000h, 08ah, 0c7h, 0e8h, 019h, 000h
        db      026h, 08ah, 004h, 024h, 07fh, 03ch, 020h, 073h, 002h, 0b0h, 020h, 046h, 0e8h, 00ah, 000h, 0e2h
        db      0efh, 007h, 05ah, 059h, 05bh, 058h, 05eh, 05fh, 0c3h
fn_33b48:
        push    ax
        push    bx
        push    si
        push    cx
        push    es
        push    ds
        push    cs
        call    far_2ac28
        pop     ds
        pop     es
        pop     cx
        pop     si
        pop     bx
        pop     ax
        ret
fn_33b59:
        mov     al, byte ptr cs:[bx]
        inc     bx
        cmp     al, 0ffh
        jz      br_33b69
        push    bx
        push    cs
        call    far_2ac28
        pop     bx
        jmp     fn_33b59
br_33b69:
        ret
fn_33b6a:
        push    ax
        mov     al, 8ah
        call    fn_33b48
        mov     al, bl
        call    fn_33b48
        mov     al, bh
        call    fn_33b48
        pop     ax
        sub     ah, ah
        mov     cl, 64h
        div     cl
        mov     bl, al
        or      al, 30h
        cmp     al, 30h
        jnz     br_33b8b
        mov     al, 20h
br_33b8b:
        call    fn_33b48
        mov     al, ah
        sub     ah, ah
        mov     cl, 0ah
        div     cl
        or      al, 30h
        cmp     bl, 0
        jnz     br_33ba3
        cmp     al, 30h
        jnz     br_33ba3
        mov     al, 20h
br_33ba3:
        call    fn_33b48
        mov     al, ah
        or      al, 30h
        call    fn_33b48
        ret
fn_33bae:
        push    bx
        and     bx, 0fh
        mov     byte ptr [A_7FA5], bl
        pop     bx
        shr     bx, 4
        mov     word ptr [A_7FAB], bx
        mov     bx, ds
        mov     es, bx
        call    fn_33f9a
        ret
fn_33bc6:
        push    ax
        and     ax, 0fh
        mov     byte ptr [A_7FA5], al
        pop     ax
        push    cx
        mov     cx, 4
loop_33bd2:
        shr     dx, 1
        rcr     ax, 1
        loop    loop_33bd2
        pop     cx
        cmp     dx, 0
        jnz     br_33bf2
        mov     word ptr [A_7FAB], ax
        mov     ax, ds
        mov     es, ax
        mov     dx, bp
        mov     ax, bx
        call    fn_33f9a
        mov     byte ptr [A_8719], 0
        ret
br_33bf2:
        mov     byte ptr [A_8719], 1
        ret
fn_33bf8:
        pop     si
        mov     bx, word ptr [A_873B]
        mov     di, A_871F
        mov     cx, 0fh
loop_33c03:
        mov     ax, word ptr cs:[si]
        mov     word ptr [di], ax
        inc     si
        inc     si
        inc     di
        inc     di
        loop    loop_33c03
        push    si
        mov     bx, ax
        call    fn_33b59
        ret
fn_33c15:
        ret
fn_33c16:
        push    di
        push    ds
        push    es
        push    cx
        mov     ax, ds
        mov     es, ax
        mov     ax, cs
        mov     ds, ax
        cld
        mov     cx, 0c0h
        rep movsb
        pop     cx
        pop     es
        pop     ds
        pop     di
        ret
        db      001h, 0f4h, 0bfh, 01eh, 00fh, 01dh, 01eh, 00ah, 01ah, 01ch, 019h, 011h, 01ch, 00bh, 017h, 000h
        db      000h, 01fh, 001h, 018h, 07fh, 000h, 0ffh, 063h, 000h, 050h, 014h, 000h, 000h, 001h, 063h, 000h
        db      000h, 032h, 000h, 000h, 01eh, 000h, 000h, 002h, 000h, 000h, 001h, 001h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 00ah
        db      00ah, 000h, 000h, 000h, 000h, 000h, 032h, 000h, 000h, 002h, 000h, 000h, 008h, 006h, 00ch, 006h
        db      003h, 006h, 006h, 006h, 005h, 008h, 00ah, 00ah, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 005h, 008h, 00eh, 000h, 008h, 008h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 019h
        db      4dh dup (000h)
        db      002h, 000h, 000h, 018h, 07fh, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 019h, 032h, 063h, 02dh
        db      000h, 000h, 000h, 000h, 000h, 032h, 063h, 02dh, 000h, 000h, 000h, 000h, 019h, 000h, 001h, 004h
        db      0ffh, 0ffh, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 000h, 07fh
        db      000h, 000h, 000h, 000h
        dw      reset, 0ffffh
        db      000h, 000h, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 000h, 000h
        db      000h, 000h, 000h, 000h
        dw      reset, 0ffffh
        db      000h, 000h, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 000h, 000h
        db      000h, 000h, 000h, 000h
        dw      reset, 0ffffh
        db      000h, 000h, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 000h, 000h
        db      000h, 000h, 000h, 000h
        dw      reset, 0ffffh
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 032h, 000h, 000h, 000h, 000h, 000h, 063h, 032h, 063h, 000h
        db      0ffh, 000h, 019h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 063h, 032h, 063h, 000h, 063h, 02dh, 000h, 000h, 000h, 000h, 000h, 019h
        db      003h, 001h, 03ch, 018h, 00fh, 021h, 00ah, 01dh, 00bh, 017h, 01ah, 016h, 00fh, 00ah, 00ah, 080h
        db      001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 000h, 016h, 000h
        db      000h, 000h, 0ffh, 000h, 000h, 000h, 0c0h, 000h, 000h, 000h, 0dfh, 08fh, 0a8h, 000h, 000h, 000h
        db      00fh, 027h
        db      24h dup (000h)
        db      0eah, 0ffh, 097h, 07ah
        db      30h dup (000h)
        db      044h, 0ach, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 006h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      056h, 051h, 057h, 0b9h, 010h, 000h, 0bfh, 0e5h, 086h, 0b0h, 020h, 088h, 005h, 047h, 0e2h, 0fbh
        db      0b9h, 010h, 000h, 0bfh, 0e5h, 086h, 026h, 08ah, 004h, 03ch, 020h, 074h, 003h, 088h, 005h, 047h
        db      046h, 0e2h, 0f3h, 05fh, 0b9h, 00ch, 000h, 0beh, 0e5h, 086h, 08ah, 004h, 0e8h, 00ah, 000h, 088h
        elseif  (XL) && (FW_VERSION = 150)
        db      056h, 051h, 057h, 0b9h, 010h, 000h, 0bfh, 0c5h, 086h, 0b0h, 020h, 088h, 005h, 047h, 0e2h, 0fbh
        db      0b9h, 010h, 000h, 0bfh, 0c5h, 086h, 026h, 08ah, 004h, 03ch, 020h, 074h, 003h, 088h, 005h, 047h
        db      046h, 0e2h, 0f3h, 05fh, 0b9h, 00ch, 000h, 0beh, 0c5h, 086h, 08ah, 004h, 0e8h, 00ah, 000h, 088h
        elseif  (XL) && (MODEL = 3200)
        db      056h, 051h, 057h, 0b9h, 010h, 000h, 0bfh, 075h, 087h, 0b0h, 020h, 088h, 005h, 047h, 0e2h, 0fbh
        db      0b9h, 010h, 000h, 0bfh, 075h, 087h, 026h, 08ah, 004h, 03ch, 020h, 074h, 003h, 088h, 005h, 047h
        db      046h, 0e2h, 0f3h, 05fh, 0b9h, 00ch, 000h, 0beh, 075h, 087h, 08ah, 004h, 0e8h, 00ah, 000h, 088h
        elseif  (XL) && (FW_VERSION < 150)
        db      056h, 051h, 057h, 0b9h, 010h, 000h, 0bfh, 025h, 086h, 0b0h, 020h, 088h, 005h, 047h, 0e2h, 0fbh
        db      0b9h, 010h, 000h, 0bfh, 025h, 086h, 026h, 08ah, 004h, 03ch, 020h, 074h, 003h, 088h, 005h, 047h
        db      046h, 0e2h, 0f3h, 05fh, 0b9h, 00ch, 000h, 0beh, 025h, 086h, 08ah, 004h, 0e8h, 00ah, 000h, 088h
        endif
        if      XL
        db      005h, 047h, 046h, 0e2h, 0f5h, 059h, 05eh, 007h, 0c3h, 0b4h, 027h, 03ch, 02dh, 074h, 044h, 0b4h
        db      02eh, 03ch, 028h, 074h, 03eh, 0b4h, 026h, 03ch, 02bh, 074h, 038h, 0b4h, 025h, 03ch, 023h, 074h
        db      032h, 0b4h, 00ah, 03ch, 020h, 074h, 02ch, 03ch, 030h, 072h, 028h, 03ch, 03ah, 073h, 006h, 02ch
        db      030h, 08ah, 0e0h, 0ebh, 01eh, 03ch, 041h, 072h, 01ah, 03ch, 05bh, 073h, 008h, 02ch, 041h, 004h
        db      00bh, 08ah, 0e0h, 0ebh, 00eh, 03ch, 061h, 072h, 00ah, 03ch, 07bh, 073h, 006h, 02ch, 061h, 004h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      00bh, 08ah, 0e0h, 08ah, 0c4h, 0c3h, 050h, 057h, 0a1h, 017h, 087h, 03dh, 0e8h, 003h, 072h, 003h
        elseif  (XL) && (FW_VERSION = 150)
        db      00bh, 08ah, 0e0h, 08ah, 0c4h, 0c3h, 050h, 057h, 0a1h, 0f7h, 086h, 03dh, 0e8h, 003h, 072h, 003h
        elseif  (XL) && (MODEL = 3200)
        db      00bh, 08ah, 0e0h, 08ah, 0c4h, 0c3h, 050h, 057h, 0a1h, 0a7h, 087h, 03dh, 0e8h, 003h, 072h, 003h
        elseif  (XL) && (FW_VERSION < 150)
        db      00bh, 08ah, 0e0h, 08ah, 0c4h, 0c3h, 050h, 057h, 0a1h, 057h, 086h, 03dh, 0e8h, 003h, 072h, 003h
        endif
        if      XL
        db      0b8h, 001h, 000h, 0b9h, 00ch, 000h, 0b3h, 064h, 0f6h, 0f3h, 08ah, 0f8h, 03ch, 000h, 074h, 00eh
        db      00ch, 030h, 050h, 053h, 0e8h, 092h, 0ffh, 088h, 005h, 047h, 0feh, 0c9h, 05bh, 058h, 08ah, 0c4h
        db      02ah, 0e4h, 0b3h, 00ah, 0f6h, 0f3h, 080h, 0ffh, 000h, 075h, 004h, 03ch, 000h, 074h, 00ch, 00ch
        db      030h, 050h, 0e8h, 074h, 0ffh, 088h, 005h, 047h, 0feh, 0c9h, 058h, 080h, 0cch, 030h, 08ah, 0c4h
        db      0e8h, 066h, 0ffh, 088h, 005h, 047h, 0feh, 0c9h, 026h, 08ah, 004h, 046h, 0e8h, 05ah, 0ffh, 088h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      005h, 047h, 0e2h, 0f4h, 05fh, 058h, 0c3h, 0bfh, 0beh, 0b9h, 0b9h, 010h, 000h, 08ch, 0d8h, 08eh
        db      0c0h, 02bh, 0c0h, 0f3h, 0aah, 0c7h, 006h, 0abh, 07fh, 000h, 000h, 0c6h, 006h, 0a5h, 07fh, 000h
        db      08ch, 0d8h, 08eh, 0c0h, 0bah, 000h, 000h, 0b8h, 0beh, 0b9h, 0b9h, 000h, 002h, 0e8h, 043h, 000h
        db      0beh, 0beh, 0b9h, 0bfh, 05eh, 0f2h, 0b9h, 00ah, 000h, 08ah, 004h, 02eh, 03ah, 005h, 075h, 015h
        elseif  (XL) && (FW_VERSION = 150)
        db      005h, 047h, 0e2h, 0f4h, 05fh, 058h, 0c3h, 0bfh, 09eh, 0b9h, 0b9h, 010h, 000h, 08ch, 0d8h, 08eh
        db      0c0h, 02bh, 0c0h, 0f3h, 0aah, 0c7h, 006h, 09bh, 07fh, 000h, 000h, 0c6h, 006h, 095h, 07fh, 000h
        db      08ch, 0d8h, 08eh, 0c0h, 0bah, 000h, 000h, 0b8h, 09eh, 0b9h, 0b9h, 000h, 002h, 0e8h, 043h, 000h
        db      0beh, 09eh, 0b9h, 0bfh, 05eh, 0f2h, 0b9h, 00ah, 000h, 08ah, 004h, 02eh, 03ah, 005h, 075h, 015h
        elseif  (XL) && (MODEL = 3200)
        db      005h, 047h, 0e2h, 0f4h, 05fh, 058h, 0c3h, 0bfh, 04eh, 0bah, 0b9h, 010h, 000h, 08ch, 0d8h, 08eh
        db      0c0h, 02bh, 0c0h, 0f3h, 0aah, 0c7h, 006h, 0dbh, 07fh, 000h, 000h, 0c6h, 006h, 0d5h, 07fh, 000h
        db      08ch, 0d8h, 08eh, 0c0h, 0bah, 000h, 000h, 0b8h, 04eh, 0bah, 0b9h, 000h, 002h, 0e8h, 043h, 000h
        db      0beh, 04eh, 0bah, 0bfh, 02eh, 0f8h, 0b9h, 00ah, 000h, 08ah, 004h, 02eh, 03ah, 005h, 075h, 015h
        elseif  (XL) && (FW_VERSION < 150)
        db      005h, 047h, 0e2h, 0f4h, 05fh, 058h, 0c3h, 0bfh, 09eh, 0b8h, 0b9h, 010h, 000h, 08ch, 0d8h, 08eh
        db      0c0h, 02bh, 0c0h, 0f3h, 0aah, 0c7h, 006h, 0fbh, 07eh, 000h, 000h, 0c6h, 006h, 0f5h, 07eh, 000h
        db      08ch, 0d8h, 08eh, 0c0h, 0bah, 000h, 000h, 0b8h, 09eh, 0b8h, 0b9h, 000h, 002h, 0e8h, 043h, 000h
        db      0beh, 09eh, 0b8h, 0bfh, 0d2h, 0f1h, 0b9h, 00ah, 000h, 08ah, 004h, 02eh, 03ah, 005h, 075h, 015h
        endif
        if      XL
        db      046h, 047h, 0e2h, 0f5h, 0b0h, 001h, 0c3h, 000h, 000h, 000h, 000h
        db      "S770 MR25A"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      0beh, 0beh, 0b9h, 0bfh, 086h, 0f2h, 0b9h, 004h, 000h, 08ah, 004h, 02eh, 03ah, 005h, 075h, 007h
        elseif  (XL) && (FW_VERSION = 150)
        db      0beh, 09eh, 0b9h, 0bfh, 086h, 0f2h, 0b9h, 004h, 000h, 08ah, 004h, 02eh, 03ah, 005h, 075h, 007h
        elseif  (XL) && (MODEL = 3200)
        db      0beh, 04eh, 0bah, 0bfh, 056h, 0f8h, 0b9h, 004h, 000h, 08ah, 004h, 02eh, 03ah, 005h, 075h, 007h
        elseif  (XL) && (FW_VERSION < 150)
        db      0beh, 09eh, 0b8h, 0bfh, 0fah, 0f1h, 0b9h, 004h, 000h, 08ah, 004h, 02eh, 03ah, 005h, 075h, 007h
        endif
        if      XL
        db      046h, 047h, 0e2h, 0f5h, 0b0h, 002h, 0c3h, 02ah, 0c0h, 0c3h
        db      "EMU3"
fn_33f9a:
        callf   SEG_MAIN:far_1fbb3
        test    byte ptr [A_7F64], 2
        jz      br_33fa9
        jmp     br_32a84
br_33fa9:
        ret
fn_33faa:
        and     byte ptr [A_7F64], 0fdh
        mov     bp, A_B7EF
        callf   SEG_MAIN:far_1fbaa
        test    byte ptr [A_7F64], 2
        jz      br_33fc1
        jmp     br_32a84
br_33fc1:
        ret
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (FW_VERSION < 150)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      XL
        phase   0
far_33fd0:
        mov     cl, byte ptr [A_7380]
        cmp     cl, 0ffh
        jz      br_33fde
        cmp     al, cl
        jz      br_33fde
        retf
br_33fde:
        mov     cl, byte ptr [A_7A63]
        and     cl, 80h
        or      cl, al
        mov     ch, ah
        or      byte ptr [A_7A63], 80h
        mov     si, word ptr [A_7C5A]
        mov     word ptr [si], cx
        mov     word ptr [si + 2], dx
        add     si, 4
        cmp     si, A_7C76
        jnz     br_34003
        mov     si, A_7C5E
br_34003:
        mov     word ptr [A_7C5A], si
        cmp     si, word ptr [A_7C5C]
        jnz     br_3401d
        add     si, 4
        cmp     si, A_7C76
        jnz     br_34019
        mov     si, A_7C5E
br_34019:
        mov     word ptr [A_7C5C], si
br_3401d:
        retf
fn_3401e:
        mov     bl, al
        sub     bh, bh
        add     bx, bx
        mov     al, dh
        sub     dl, dl
        sar     dx, 1
        js      br_3402e
        add     dl, al
br_3402e:
        mov     word ptr [bx+si], dx
        retf
far_34031:
        push    dx
        push    si
        cmp     dl, byte ptr [si + 3]
        jc      br_3403b
        add     dl, byte ptr [si + 2]
br_3403b:
        shr     dl, 1
        shr     dl, 1
        cmp     dl, 20h
        jbe     br_34046
        mov     dl, 20h
br_34046:
        sub     dl, 4
        jnc     br_3404d
        sub     dl, dl
br_3404d:
        mov     al, dh
        mov     dh, 1
        callf   SEG_INT_01:far_2ac66
        pop     si
        pop     dx
        mov     al, dh
        sub     dh, dh
        add     dl, byte ptr [si + 2]
        jns     br_34063
        inc     dh
br_34063:
        mov     dl, 1eh
        callf   SEG_INT_01:far_2b60a
        retf
fn_3406b:
        test    byte ptr [A_7C7F], 1
        jz      br_34093
        callf   SEG_INT_01:far_2583b
        sub     al, byte ptr [A_7C7E]
        cmp     al, 64h
        jc      br_34093
        mov     byte ptr [A_7C7F], 0
        push    es
        mov     bx, A_3602
        mov     es, bx
        mov     bx, 1f0h
        callf   SEG_MAIN:far_1d779
        pop     es
br_34093:
        retf
fn_34094:
        mov     bl, al
        and     bl, 0fh
        sub     bh, bh
        add     bx, A_7A97
        test    byte ptr [bx], 1
        jz      br_340a6
        test    byte ptr [bx], ch
br_340a6:
        retf
far_340a7:
        mov     ah, 0f0h
        callf   SEG_MAIN:far_11132
        mov     ah, 47h
        callf   SEG_MAIN:far_11132
        mov     ah, byte ptr [A_6DC8]
        test    byte ptr [A_73B7], 1
        jz      br_340c4
        mov     ah, byte ptr [A_6E1F]
br_340c4:
        callf   SEG_MAIN:far_11132
        mov     ah, bl
        callf   SEG_MAIN:far_11132
        mov     ah, 49h
        callf   SEG_MAIN:far_11132
        retf
far_340d8:
        sub     al, al
loop_340da:
        push    ax
        push    cs
        call    fn_340e7
        pop     ax
        inc     al
        cmp     al, 8
        jbe     loop_340da
        retf
fn_340e7:
        mov     dh, al
        mov     ah, 9
        mul     ah
        mov     si, A_73C9
        test    byte ptr [A_73B7], 1
        jz      br_340fa
        mov     si, A_7414
br_340fa:
        add     si, ax
        mov     dl, byte ptr [si + 3]
        shr     dl, 1
        shr     dl, 1
        sub     dl, 4
        jnc     br_3410a
        sub     dl, dl
br_3410a:
        mov     al, dh
        callf   SEG_INT_01:far_2b5aa
        retf
far_34112:
        cmp     byte ptr [A_74B9], 8
        jnz     br_3411e
        cmp     byte ptr [A_74BA], 4
br_3411e:
        jnz     br_34139
        push    ax
        push    dx
        sub     dl, dl
        mov     cl, 3
        shr     dx, cl
        mov     cx, dx
        shr     cx, 1
        add     dx, cx
        mov     dl, dh
        sub     dh, dh
        callf   SEG_INT_01:far_2ac66
        pop     dx
        pop     ax
br_34139:
        push    cs
        call    far_33fd0
        retf
fn_3413e:
        cmp     byte ptr [A_74B9], 8
        jnz     br_3414a
        cmp     byte ptr [A_74BA], 4
br_3414a:
        jnz     br_34159
        push    ax
        push    dx
        mov     dh, 1
        sub     dl, dl
        callf   SEG_INT_01:far_2ac66
        pop     dx
        pop     ax
br_34159:
        push    cs
        call    far_33fd0
        retf
fn_3415e:
        mov     si, A_7A7A
        push    cs
        call    fn_3401e
        ret
fn_34166:
        mov     si, A_7AFA
        mov     bl, al
        sub     bh, bh
        add     bx, bx
        sub     dl, dl
        mov     word ptr [bx+si], dx
        ret
fn_34174:
        mov     si, A_7ABA
        push    cs
        call    fn_3401e
        ret
fn_3417c:
        mov     si, A_73CA
        push    cs
        call    fn_3401e
        ret
fn_34184:
        mov     si, A_738A_2
        sub     dh, 80h
        push    cs
        call    fn_3401e
        ret
far_3418f:
        cmp     al, 0f8h
        jc      br_341b5
        jnz     br_34196
        retf
br_34196:
        cmp     al, 0fah
        jnz     br_341a0
        callf   SEG_INT_01:far_3069a
        retf
br_341a0:
        cmp     al, 0fbh
        jnz     br_341a5
        retf
br_341a5:
        cmp     al, 0fch
        jnz     br_341af
        callf   SEG_INT_01:far_3069a
        retf
br_341af:
        inc     al
        jz      br_341b4
        retf
br_341b4:
        retf
br_341b5:
        push    ax
        push    dx
        mov     cl, 2
        mov     al, byte ptr [A_74B9]
        cmp     al, 4
        jz      br_341cf
        cmp     al, 5
        jz      br_341cf
        mov     cl, 0
        cmp     byte ptr [A_78B8], 0
        jz      br_341cf
        mov     cl, 1
br_341cf:
        callf   SEG_INT_01:far_25457
        pop     dx
        pop     ax
        cmp     al, 0f0h
        jc      br_341f7
        jnz     br_341ec
        mov     byte ptr [A_752A_2], dh
        or      byte ptr [A_7A63], 2
        mov     word ptr [A_7C76], A_71A8
        retf
br_341ec:
        cmp     al, 0f2h
        jnz     br_341f1
        retf
br_341f1:
        cmp     al, 0f3h
        jz      br_341f6
        retf
br_341f6:
        retf
br_341f7:
        mov     dl, byte ptr [A_7A66]
        mov     ah, al
        and     ah, 0f0h
        and     al, 0fh
        push    cs
        call    far_34207
        retf
far_34207:
        cmp     ah, 90h
        jnz     br_34265
        or      dh, dh
        jz      br_3425f
        push    cs
        call    far_34112
        test    byte ptr [A_7916], 1
        jz      br_34225
        or      byte ptr [A_7916], 2
        mov     byte ptr [A_7A78], dl
        retf
br_34225:
        callf   SEG_INT_01:far_30784
        cmp     byte ptr [A_74BA], 5
        jnz     br_3425a
        cmp     byte ptr [A_74B9], 1
        jz      br_3423f
        cmp     byte ptr [A_74B9], 3
        jnz     br_3425a
br_3423f:
        cmp     byte ptr [A_7C83], 0
        jz      br_3425a
        mov     ch, byte ptr [A_74BB]
        cmp     ch, 2
        jz      br_34254
        cmp     ch, 3
        jnz     br_3425a
br_34254:
        callf   SEG_MAIN:far_173d0
        retf
br_3425a:
        push    cs
        call    far_3445a
        retf
br_3425f:
        mov     dh, 40h
        mov     ah, 0
        jmp     br_3426a
br_34265:
        cmp     ah, 80h
        jnz     br_3428f
br_3426a:
        push    cs
        call    fn_3413e
        mov     ch, 1
        push    cs
        call    fn_34094
        jz      br_3428e
        mov     bl, dl
        sub     bh, bh
        add     bx, bx
        add     bx, A_7B5A
        mov     cl, al
        mov     di, 0fffeh
        rol     di, cl
        and     word ptr [bx], di
        callf   SEG_MAIN:far_16e49
br_3428e:
        retf
br_3428f:
        cmp     ah, 0a0h
        jnz     br_34295
        retf
br_34295:
        cmp     ah, 0b0h
        jz      br_3429d
        jmp     br_343f7
br_3429d:
        cmp     dl, 7ah
        endif
        if      (XL) && (MODEL = 3000)
        jc      br_342d4
        elseif  (XL) && (MODEL = 3200)
        jc      br_342e3
        endif
        if      XL
        cmp     dl, 7bh
        jnz     br_342d3
        mov     ah, 1
        push    cs
        call    far_33fd0
        mov     ch, 1
        push    cs
        call    fn_34094
        jz      br_342d3
        mov     bx, A_7B5A
        mov     di, 0fffeh
        mov     cl, al
        rol     di, cl
        mov     cx, 80h
loop_342c2:
        and     word ptr [bx], di
        add     bx, 2
        loop    loop_342c2
        callf   SEG_INT_01:far_30715
        callf   SEG_MAIN:far_16e4d
br_342d3:
        retf
        endif
        if      (XL) && (MODEL = 3000)
br_342d4:
        cmp     al, byte ptr [A_8622]
        jnz     br_342e3
        cmp     dl, 4
        jnz     br_342e3
        mov     byte ptr [A_8623], dh
        endif
        if      XL
br_342e3:
        push    ax
        push    dx
        callf   SEG_INT_01:far_2df92
        pop     dx
        pop     ax
        cmp     dl, byte ptr [A_7350_2]
        jnz     br_34307
        mov     ah, 7
        push    cs
        call    far_33fd0
        mov     ch, 1
        push    cs
        call    fn_34094
        jz      br_34307
        push    ax
        push    dx
        call    fn_3417c
        pop     dx
        pop     ax
br_34307:
        cmp     dl, 1
        jnz     br_3431f
        mov     ah, 2
        push    cs
        call    far_33fd0
        mov     ch, 2
        push    cs
        call    fn_34094
        jnz     br_3431b
        retf
br_3431b:
        call    fn_3415e
        retf
br_3431f:
        cmp     dl, 21h
        jnz     br_34325
        retf
br_34325:
        cmp     dl, 7
        jnz     br_3433d
        mov     ah, 3
        push    cs
        call    far_33fd0
        mov     ch, 8
        push    cs
        call    fn_34094
        jnz     br_34339
        retf
br_34339:
        call    fn_34166
        retf
br_3433d:
        cmp     dl, 40h
        jnz     br_3435d
        mov     ah, 4
        push    cs
        call    far_33fd0
        mov     ch, 1
        push    cs
        call    fn_34094
        jz      br_3435c
        cmp     dh, 40h
        jc      br_34359
        or      byte ptr [bx], 40h
        retf
br_34359:
        and     byte ptr [bx], 0bfh
br_3435c:
        retf
br_3435d:
        cmp     dl, 43h
        jnz     br_3437d
        mov     ah, 5
        push    cs
        call    far_33fd0
        mov     ch, 1
        push    cs
        call    fn_34094
        jz      br_3437c
        cmp     dh, 40h
        jc      br_34379
        or      byte ptr [bx], 20h
        retf
br_34379:
        and     byte ptr [bx], 0dfh
br_3437c:
        retf
br_3437d:
        cmp     dl, 42h
        jnz     br_343a4
        mov     ah, 6
        push    cs
        call    far_33fd0
        mov     ch, 1
        push    cs
        call    fn_34094
        jz      br_343a3
        cmp     dh, 40h
        jc      br_343a0
        or      byte ptr [bx], 10h
        and     al, 0fh
        callf   SEG_INT_01:far_29c70
        retf
br_343a0:
        and     byte ptr [bx], 0efh
br_343a3:
        retf
br_343a4:
        cmp     dl, 0ah
        jnz     br_343c2
        mov     ah, 8
        push    cs
        call    far_33fd0
        mov     bl, al
        sub     bh, bh
        add     bx, bx
        sub     dh, 40h
        mov     dl, 0
        sar     dx, 1
        mov     si, A_7B1A
        mov     word ptr [bx+si], dx
        retf
br_343c2:
        cmp     dl, 5bh
        jnz     br_343db
        mov     ah, 9
        push    cs
        call    far_33fd0
        mov     bl, al
        sub     bh, bh
        add     bx, bx
        mov     dl, 0
        mov     si, A_7B3A
        mov     word ptr [bx+si], dx
        retf
br_343db:
        retf
fn_343dc:
        cmp     dl, 41h
        jnz     br_343f6
        mov     ch, 1
        push    cs
        call    fn_34094
        jz      br_343f5
        cmp     dh, 40h
        jc      br_343f2
        or      byte ptr [bx], 80h
        retf
br_343f2:
        and     byte ptr [bx], 7fh
br_343f5:
        retf
br_343f6:
        retf
br_343f7:
        cmp     ah, 0c0h
        jnz     br_3442a
        push    cs
        call    far_33fd0
        mov     ch, 1
        push    cs
        call    fn_34094
        mov     dl, al
        cmp     byte ptr [A_78B8], 0
        jnz     br_34424
        test    byte ptr [A_7389], 0ffh
        jz      br_34423
        test    byte ptr [A_7388], 0ffh
        jnz     br_34424
        cmp     al, byte ptr [A_7387]
        jz      br_34424
br_34423:
        retf
br_34424:
        callf   SEG_MAIN:far_16e51
        retf
br_3442a:
        cmp     ah, 0d0h
        jnz     br_34440
        push    cs
        call    far_33fd0
        mov     ch, 4
        push    cs
        call    fn_34094
        jnz     br_3443c
        retf
br_3443c:
        call    fn_34174
        retf
br_34440:
        cmp     ah, 0e0h
        jnz     br_34459
        shl     dl, 1
        shl     dx, 1
        push    cs
        call    far_33fd0
        mov     ch, 2
        push    cs
        call    fn_34094
        jnz     br_34456
        retf
br_34456:
        call    fn_34184
br_34459:
        retf
far_3445a:
        mov     ch, 1
        push    cs
        call    fn_34094
        jz      br_34481
        mov     bl, dl
        sub     bh, bh
        add     bx, bx
        add     bx, A_7B5A
        mov     cl, al
        mov     di, 1
        shl     di, cl
        or      word ptr [bx], di
        cmp     byte ptr [A_8612], 0
        jnz     br_34481
        callf   SEG_MAIN:far_16e45
br_34481:
        retf
        endif
        if      (XL) && (MODEL = 3000)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (MODEL = 3200)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      XL
        phase   0
far_34490:
        mov     di, A_603D
        mov     al, 3
        stosb
        mov     al, byte ptr [A_7D08]
        stosb
        mov     al, 35h
        stosb
        retf
far_3449e:
        mov     word ptr [A_75F8], A_C058_2
        mov     word ptr [A_75FA], 0
        mov     ax, word ptr [A_7D09]
        shl     ax, 1
        add     ax, 600h
        add     ax, 40h
        mov     word ptr [A_75FC], ax
        mov     word ptr [A_7D46], 0
        retf
far_344bf:
        mov     di, A_7D3E
        mov     cl, byte ptr [A_7D3D]
        sub     ch, ch
        mov     byte ptr [A_7D3D], ch
        push    cs
        call    fn_344d1
        retf
fn_344d1:
        jcxz    br_344e8
loop_344d3:
        mov     dx, 20h
        in      al, dx
        and     al, 0c0h
        cmp     al, 0c0h
        jnz     loop_344d3
        mov     dx, 22h
        in      al, dx
        stosb
        loop    br_344ee
        mov     ah, byte ptr [A_7D3E]
br_344e8:
        and     byte ptr [A_7D00], 0dfh
        retf
br_344ee:
        mov     dl, 14h
loop_344f0:
        dec     dl
        jnz     loop_344f0
        jmp     loop_344d3
far_344f6:
        test    byte ptr [A_7D00], 80h
        jz      br_3450f
        mov     di, word ptr [A_75FE]
        mov     cx, word ptr [A_7600]
        callf   SEG_INT_01:far_2615c
        and     byte ptr [A_7D00], 7fh
br_3450f:
        retf
far_34510:
        push    ds
        push    cs
        call    far_3455b
        mov     byte ptr [si + 10h], 0
        mov     bx, word ptr [si + 14h]
        pop     ds
        mov     si, A_C658
        sub     dx, dx
br_34522:
        shl     bx, 1
        mov     ax, word ptr [bx+si]
        mov     word ptr [bx+si], dx
        test    ax, 8000h
        jnz     br_34531
        mov     bx, ax
        jmp     br_34522
br_34531:
        retf
        phase   A_F822
far_34532:
        mov     di, A_B98C
        mov     cx, 4
loop_34538:
        mov     byte ptr [di], 20h
        inc     di
        loop    loop_34538
        mov     byte ptr [di], 0ffh
        mov     cx, 0ah
loop_34544:
        sub     dx, dx
        div     cx
        add     dl, 30h
        dec     di
        mov     byte ptr [di], dl
        or      ax, ax
        jnz     loop_34544
        mov     bx, A_B98C
        callf   SEG_INT_01:far_2b3e6
        retf
        phase   0cbh
far_3455b:
        mov     ax, word ptr [A_7D58]
        mov     si, 18h
        mul     si
        mov     si, A_62AA
        add     si, ax
        mov     ax, A_3A60
        mov     ds, ax
        retf
far_3456e:
        mov     cx, word ptr [A_7F58]
        push    ds
        mov     ax, A_3A60
        mov     ds, ax
        mov     si, A_62BA
        sub     al, al
        sub     dx, dx
loop_3457f:
        cmp     al, byte ptr [si]
        jnz     br_34584
        inc     dx
br_34584:
        add     si, 18h
        loop    loop_3457f
        pop     ds
        mov     word ptr [A_7F34], dx
        retf
far_3458f:
        mov     si, A_C658
        mov     bx, word ptr [A_7D46]
        shl     bx, 1
br_34598:
        mov     ax, word ptr [bx+si]
        or      ax, ax
        jz      br_345a3
        add     bx, 2
        jmp     br_34598
br_345a3:
        add     si, bx
        shr     bx, 1
        mov     word ptr [A_7D46], bx
        push    ds
        lds     di, dword ptr [A_7D5A]
        mov     word ptr [di], bx
        pop     ds
        mov     word ptr [A_7D5A], si
        retf
far_345b8:
        mov     byte ptr [A_7D5E], 0
        push    es
        mov     ax, A_3A60
        mov     es, ax
        mov     di, A_5CB0
        mov     dl, 70h
        call    fn_34622
        mov     word ptr [A_7464], bx
        mov     dl, 73h
        call    fn_34622
        mov     word ptr [A_7466], bx
        mov     dl, A_0074_3
        call    fn_34622
        mov     word ptr [A_7F60_3], bx
        mov     dl, A_0078_3
        call    fn_34622
        mov     word ptr [A_7F5E_5], bx
        mov     dl, A_0064_2
        call    fn_34622
        mov     word ptr [A_7F5A_4], bx
        mov     dl, A_006D_3
        call    fn_34622
        mov     word ptr [A_7F62_3], bx
        mov     dl, A_0050
        call    fn_34622
        endif
        if      (XL) && (MODEL = 3200)
        mov     word ptr [7f92h], bx
        mov     dl, 50h
        call    fn_34622
        endif
        if      XL
        or      bx, bx
        jz      br_3460e
        mov     word ptr [A_7464], bx
        mov     byte ptr [A_7D5E], 1
br_3460e:
        mov     dl, 53h
        call    fn_34622
        or      bx, bx
        jz      br_34620
        mov     word ptr [A_7466], bx
        mov     byte ptr [A_7D5E], 1
br_34620:
        pop     es
        retf
fn_34622:
        mov     cx, word ptr [A_7F58]
        mov     si, A_62BA
        sub     ax, ax
        sub     bx, bx
loop_3462d:
        mov     dh, byte ptr es:[si]
        and     dh, 7fh
        cmp     dl, dh
        jnz     br_34639
        stosw
        inc     bx
br_34639:
        add     si, 18h
        inc     ax
        loop    loop_3462d
        ret
far_34640:
        mov     dl, al
        and     dl, 7fh
        mov     dh, byte ptr [A_7D55]
br_34649:
        mov     ax, word ptr [A_7D58]
        inc     ax
        cmp     ax, word ptr [A_7F58]
        jc      br_34655
        stc
        retf
br_34655:
        mov     word ptr [A_7D58], ax
        or      dh, dh
        jz      br_3468f
        mov     si, 18h
        push    dx
        mul     si
        pop     dx
        push    ds
        mov     si, A_3A60
        mov     ds, si
        mov     si, A_62AA
        add     si, ax
        mov     cl, byte ptr [si + 10h]
        and     cl, 7fh
        cmp     dl, cl
        jnz     br_34691
        cmp     dh, 2
        jnz     br_3468e
        push    si
        add     si, 0
        mov     di, word ptr es:[A_7D56]
        mov     cx, 0ch
        repe cmpsb
        pop     si
        jnz     br_34691
br_3468e:
        pop     ds
br_3468f:
        clc
        retf
br_34691:
        pop     ds
        jmp     br_34649
far_34694:
        mov     byte ptr [A_7D72], 0
        mov     bx, 40h
        mov     di, A_C058_2
loop_3469f:
        mov     si, A_7D62
        mov     cx, 0ch
        rep movsw
        dec     bx
        jnz     loop_3469f
        mov     di, A_C658
        mov     cx, word ptr [A_7D09]
loop_346b1:
        mov     ax, word ptr [di]
        cmp     ax, 2000h
        jz      br_346ba
        sub     ax, ax
br_346ba:
        stosw
        loop    loop_346b1
        mov     si, A_61FE
        mov     cx, 0ch
        rep movsb
        sub     ax, ax
        stosw
        mov     ax, word ptr [1ch]
        stosw
        mov     si, A_7387
        mov     cx, 30h
        rep movsb
        mov     cx, 11h
        mov     dx, word ptr [A_7D09]
        mov     di, A_C658
loop_346de:
        mov     ax, word ptr [di]
        cmp     ax, 2000h
        jz      br_34724
        mov     ax, 4000h
        stosw
        dec     dx
        loop    loop_346de
        xchg    cx, dx
        push    cx
        mov     ax, 2000h
loop_346f2:
        cmp     word ptr [di], ax
        jz      br_346f7
        inc     dx
br_346f7:
        add     di, 2
        loop    loop_346f2
        mov     word ptr [A_7471], dx
        push    es
        mov     ax, A_3A60
        mov     es, ax
        mov     di, A_62AA
        mov     cx, 17e8h
        sub     ax, ax
        rep stosw
        pop     es
        mov     byte ptr [A_C0D8], 0ffh
        mov     word ptr [A_7F58], 1feh
        callf   SEG_MAIN:far_190aa
        pop     bp
        clc
        retf
br_34724:
        stc
        retf
far_34726:
        mov     al, byte ptr [A_7D00]
        and     al, 2
        shl     al, 5
        add     al, 1bh
        call    fn_3474b
        mov     al, 5fh
        call    fn_3474b
        mov     al, byte ptr [A_7D00]
        and     al, 2
        shl     al, 3
        add     al, 88h
        call    fn_3474b
        mov     al, 0d3h
        call    fn_3474b
        retf
fn_3474b:
        mov     cx, 64h
        endif
        if      (XL) && (MODEL = 3200)
        nop
        endif
        if      XL
loop_3474e:
        loop    loop_3474e
        out     20h, al
        mov     cx, 64h
        nop
loop_34756:
        loop    loop_34756
loop_34758:
        in      al, 20h
        and     al, 0c0h
        cmp     al, 0c0h
        jnz     loop_34758
        in      al, 22h
        ret
far_34763:
        endif
        if      (XL) && (MODEL = 3000)
        mov     al, 1eh
        elseif  (XL) && (MODEL = 3200)
        or      byte ptr cs:[31dh], 10h
        mov     al, byte ptr cs:[31dh]
        or      al, 0eh
        endif
        if      XL
        call    fn_3474b
        retf
far_34769:
        endif
        if      (XL) && (MODEL = 3000)
        mov     al, 0eh
        elseif  (XL) && (MODEL = 3200)
        and     byte ptr cs:[31dh], 0efh
        mov     al, byte ptr cs:[31dh]
        or      al, 0eh
        endif
        if      XL
        call    fn_3474b
        retf
        endif
        if      (XL) && (MODEL = 3200)
far_34e6d:
        or      byte ptr cs:[31dh], 40h
        mov     al, byte ptr cs:[31dh]
        or      al, 0eh
        call    fn_3474b
        retf
far_34e7d:
        and     byte ptr cs:[31dh], 0bfh
        mov     al, byte ptr cs:[31dh]
        or      al, 0eh
        call    fn_3474b
        retf
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL = 0) && (MODEL = 3000))
        db      000h
        endif
        if      XL
far_3476f:
        mov     dx, 0c00fh
        mov     al, 0fh
        out     dx, al
        retf
far_34776:
        lodsb
        mov     ah, al
        lodsb
        mov     byte ptr [A_7D3D], al
        lodsb
        mov     cl, al
        sub     ch, ch
        or      ah, ah
        jz      br_347d7
        lodsb
        mov     di, A_7D34
        rep movsb
        mov     si, A_7D34
        mov     cl, al
        sub     ch, ch
        mov     al, byte ptr [A_7D0D]
        shl     al, 1
        shl     al, 1
        mov     byte ptr [A_7D35], al
        cmp     ah, 1
        jz      br_347d7
        cmp     ah, 2
        jnz     br_347af
        mov     al, byte ptr [A_7D08]
        mov     byte ptr [A_7D37], al
        jmp     br_347d7
br_347af:
        mov     al, byte ptr [A_7D0C]
        mov     byte ptr [A_7D36], al
        cmp     ah, 3
        jz      br_347d7
        mov     di, A_7D37
        mov     al, byte ptr [A_7D0D]
        stosb
        mov     al, byte ptr [A_7D0E]
        stosb
        push    si
        push    cx
        mov     si, A_603D
        mov     cx, 4
        rep movsb
        pop     cx
        pop     si
        cmp     ah, 4
        jz      br_347d7
        retf
br_347d7:
        and     byte ptr [A_7D00], 0dfh
loop_347dc:
        mov     dx, 20h
        in      al, dx
        and     al, 0c0h
        cmp     al, 80h
        jnz     loop_347dc
        lodsb
        mov     dx, 22h
        out     dx, al
        mov     dl, 18h
loop_347ed:
        dec     dl
        jnz     loop_347ed
        loop    loop_347dc
        retf
far_347f4:
        test    byte ptr [A_7D00], 10h
        jnz     br_3480c
        and     byte ptr [A_7D00], 0fdh
        test    byte ptr [A_7D54], 4
        jnz     br_3480c
        or      byte ptr [A_7D00], 2
br_3480c:
        mov     byte ptr [A_7D08], 5
        mov     word ptr [A_7D09], 320h
        mov     word ptr [A_6014], 0ae2h
        test    byte ptr [A_7D00], 2
        jz      br_34835
        mov     byte ptr [A_7D08], 0ah
        mov     word ptr [A_7D09], 640h
        mov     word ptr [A_6014], 14c4h
br_34835:
        retf
far_34836:
        push    cs
        call    far_34694
        jnc     br_3484e
        mov     dx, 2500h
        callf   SEG_INT_01:far_2b3b4
        mov     bx, A_61B5
        callf   SEG_INT_01:far_2b3e6
        stc
        retf
br_3484e:
        mov     dx, 1c66h
        callf   SEG_INT_01:far_2b3b4
        mov     ax, bp
        sub     ax, word ptr [A_7471]
        push    ax
        push    cs
        call    far_34532-A_F780
        mov     dx, 1366h
        callf   SEG_INT_01:far_2b3b4
        mov     ax, word ptr [A_7471]
        push    cs
        call    far_34532-A_F780
        mov     dx, 2500h
        callf   SEG_INT_01:far_2b3b4
        pop     ax
        push    es
        mov     bx, A_3679
        mov     es, bx
        mov     bx, 0
        or      ax, ax
        jz      br_34889
        mov     bx, 29h
br_34889:
        callf   SEG_INT_01:far_2b41e
        pop     es
        clc
        retf
far_34891:
        mov     al, 36h
        out     20h, al
        retf
        endif
        if      (XL) && (MODEL = 3000)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 02bh, 0f6h, 0b8h, 000h, 050h, 08eh
        db      0d8h, 02bh, 0ffh, 08eh, 0c7h, 0b9h, 000h, 080h, 0f3h, 0a5h, 02bh, 0f6h, 0b8h, 000h, 060h, 08eh
        db      0d8h, 02bh, 0ffh, 0b8h, 000h, 010h, 08eh, 0c0h, 0b9h, 000h, 080h, 0f3h, 0a5h, 02bh, 0f6h, 0b8h
        db      000h, 070h, 08eh, 0d8h, 02bh, 0ffh, 0b8h, 000h, 020h, 08eh, 0c0h, 0b9h, 000h, 080h, 0f3h, 0a5h
        db      02bh, 0f6h, 0b8h, 000h, 080h, 08eh, 0d8h, 02bh, 0ffh, 0b8h, 000h, 030h, 08eh, 0c0h, 0b9h, 000h
        db      080h, 0f3h, 0a5h, 0eah
        elseif  (XL) && (MODEL = 3200)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 02bh, 0f6h, 0b8h, 000h, 050h
        db      08eh, 0d8h, 02bh, 0ffh, 08eh, 0c7h, 0b9h, 000h, 080h, 0f3h, 0a5h, 02bh, 0f6h, 0b8h, 000h, 060h
        db      08eh, 0d8h, 02bh, 0ffh, 0b8h, 000h, 010h, 08eh, 0c0h, 0b9h, 000h, 080h, 0f3h, 0a5h, 02bh, 0f6h
        db      0b8h, 000h, 070h, 08eh, 0d8h, 02bh, 0ffh, 0b8h, 000h, 020h, 08eh, 0c0h, 0b9h, 000h, 080h, 0f3h
        db      0a5h, 02bh, 0f6h, 0b8h, 000h, 080h, 08eh, 0d8h, 02bh, 0ffh, 0b8h, 000h, 030h, 08eh, 0c0h, 0b9h
        db      000h, 080h, 0f3h, 0a5h, 0eah
        endif
        if      XL
        dw      start, 0
far_348ee:
        mov     bx, A_0670
        mov     cx, 0ch
loop_348f4:
        lodsb
        cmp     al, 28h
        jbe     br_348fb
        mov     al, 28h
br_348fb:
        xlat
        stosb
        loop    loop_348f4
        retf
far_34900:
        mov     byte ptr [A_7F76], 0
        mov     ax, word ptr [A_7464]
        add     ax, word ptr [A_7466]
        add     ax, word ptr [A_7F5A]
        add     ax, word ptr [A_7F5E]
        add     ax, word ptr [A_7F60_2]
        add     ax, word ptr [A_7F62]
        endif
        if      (XL) && (MODEL = 3200)
        add     ax, word ptr [7f92h]
        endif
        if      XL
        mov     word ptr [A_7468], ax
        mov     byte ptr [A_7D5E], 0
        mov     word ptr [A_7F52], A_7FB1
        mov     word ptr [A_7F54], A_62AA
        mov     word ptr [A_7F56], 2000h
        retf
fn_34937:
        mov     bx, A_BA88
        mov     ah, byte ptr [A_7461]
loop_3493e:
        test    byte ptr [bx + 0ch], 1
        jz      br_34950
        mov     si, bx
        mov     di, A_7478
        mov     cx, 0ch
        repe cmpsb
        jz      br_34959
br_34950:
        add     bx, 10h
        dec     ah
        jnz     loop_3493e
        inc     ah
br_34959:
        retf
fn_3495a:
        mov     bx, word ptr [A_7F54]
        mov     cx, word ptr [A_7468]
        push    ds
        mov     si, A_3A60
        mov     ds, si
loop_34968:
        cmp     al, byte ptr [bx + 10h]
        jnz     br_3497e
        mov     si, bx
        add     si, 0
        mov     di, A_7478
        push    cx
        mov     cx, 0ch
        repe cmpsb
        pop     cx
        jz      br_34984
br_3497e:
        add     bx, 18h
        loop    loop_34968
        inc     cx
br_34984:
        pop     ds
        retf
far_34986:
        push    es
        mov     di, A_3A60
        mov     es, di
        mov     di, A_60AC
        mov     cx, word ptr [A_7F58]
        sub     al, al
        rep stosb
        pop     es
        retf
far_34999:
        mov     ax, word ptr [A_7464]
        add     ax, word ptr [A_7466]
        add     ax, word ptr [A_7F5A]
        add     ax, word ptr [A_7F5E]
        add     ax, word ptr [A_7F60_2]
        add     ax, word ptr [A_7F62]
        endif
        if      (XL) && (MODEL = 3200)
        add     ax, word ptr [7f92h]
        endif
        if      XL
        mov     word ptr [A_7468], ax
        mov     word ptr [A_7F52], A_7D58
        mov     word ptr [A_7F54], A_62AA
        mov     word ptr [A_7F56], 400h
        clc
        retf
far_349c7:
        sub     ax, ax
        mov     word ptr [A_7471], ax
        mov     word ptr [A_7F34], ax
        mov     word ptr [A_7464], ax
        mov     word ptr [A_7466], ax
        mov     word ptr [A_7F5A], ax
        mov     word ptr [A_7F5C], ax
        mov     word ptr [A_7F5E_3], ax
        mov     word ptr [A_7F60_4], ax
        mov     word ptr [A_7F62_2], ax
        mov     byte ptr [A_7461], al
        and     byte ptr [A_7F64], 7fh
        retf
far_349ed:
        sub     ax, ax
        mov     word ptr [A_7471], ax
        mov     word ptr [A_7F34], ax
        mov     word ptr [A_7464], ax
        mov     word ptr [A_7466], ax
        mov     word ptr [A_7F5A], ax
        mov     word ptr [A_7F5C], ax
        mov     word ptr [A_7F5E_3], ax
        mov     word ptr [A_7F60_4], ax
        mov     word ptr [A_7F62_2], ax
        mov     byte ptr [A_7D5E], al
        mov     byte ptr [A_7461], al
        and     byte ptr [A_7F64], 7fh
        retf
far_34a16:
        mov     ax, word ptr [si + 11h]
        mov     dl, byte ptr [si + 13h]
        sub     ax, 3ch
        sbb     dl, 0
        shr     dl, 1
        rcr     ax, 1
        mov     word ptr es:[A_7F38], ax
        mov     byte ptr es:[A_7F3A], dl
        sub     dh, dh
        mov     bp, ax
        mov     bx, dx
        mov     cx, 4
loop_34a38:
        shr     bl, 1
        rcr     bp, 1
        rcr     bh, 1
br_34a3e:
        shr     bl, 1
        rcr     bp, 1
        rcr     bh, 1
        add     dh, bh
        adc     ax, bp
        adc     dl, bl
        jcxz    br_34a50
        loop    loop_34a38
        jmp     br_34a3e
br_34a50:
        retf
far_34a51:
        mov     cx, 0ah
loop_34a54:
        lodsb
        push    ds
        mov     bx, A_3A60
        mov     ds, bx
        mov     bx, A_0E5C
        xlat
        pop     ds
        stosb
        loop    loop_34a54
        mov     al, 0ah
        stosb
        stosb
        retf
far_34a68:
        cmp     byte ptr [A_745C], 0
        endif
        if      (XL) && (FW_VERSION >= 150)
        jnz     br_34a75
        or      byte ptr [A_7D00], 80h
        retf
br_34a75:
        cmp     byte ptr [A_745C], 2
        endif
        if      XL
        jnz     br_34a82
        or      byte ptr [A_8760], 80h
        retf
br_34a82:
        or      byte ptr [A_7F9B], 80h
        retf
far_34a88:
        mov     dl, byte ptr [A_72F4]
        sub     bx, bx
        push    es
        call    fn_34ab2
        pop     es
        jnz     br_34a99
        mov     byte ptr [A_74C3], dh
br_34a99:
        retf
far_34a9a:
        mov     dl, byte ptr [A_72F6]
        mov     bl, byte ptr [A_72F4]
        sub     bh, bh
        shl     bx, 1
        push    es
        call    fn_34ab2
        jnz     br_34ab0
        mov     byte ptr [A_6ED4], dh
br_34ab0:
        pop     es
        retf
fn_34ab2:
        or      dl, dl
        jz      br_34ad4
        add     bx, A_B1B0
        sub     dh, dh
loop_34abc:
        mov     es, word ptr [bx]
        mov     di, 3
        mov     si, A_7D7A
        mov     cx, 0ch
        repe cmpsb
        jz      br_34ad6
        add     bx, 2
        inc     dh
        dec     dl
        jnz     loop_34abc
br_34ad4:
        inc     dl
br_34ad6:
        ret
far_34ad7:
        push    es
        call    fn_34add
        pop     es
        retf
fn_34add:
        mov     di, A_3A60
        mov     es, di
        mov     di, A_62AA
        sub     ax, ax
        mov     cx, 17e8h
        rep stosw
        ret
far_34aed:
        push    ds
        push    es
        call    fn_34add
        mov     word ptr [A_6B99], 0c000h
        mov     word ptr [A_6B9B], 0d6h
        mov     cx, 0c000h
        mov     es, cx
        mov     si, 2
        xor     ch, ch
        mov     cl, byte ptr [A_7463]
        cmp     cl, 0
        jz      br_34b29
        cmp     cl, byte ptr [A_7461]
        jz      br_34b53
loop_34b17:
        seges
        lodsw
        add     word ptr [A_6B9B], ax
        jz      br_34b21
        jnc     br_34b27
br_34b21:
        add     word ptr [A_6B99], 1000h
br_34b27:
        loop    loop_34b17
br_34b29:
        seges
        lodsw
        cmp     ax, 0
        jz      br_34b53
        mov     si, word ptr [A_6B9B]
        mov     dx, A_3A60
        mov     es, dx
        mov     di, A_62AA
        mov     cx, ax
        mov     dx, word ptr [A_6B99]
        mov     ds, dx
loop_34b44:
        mov     al, byte ptr [si]
        stosb
        inc     si
        jnz     br_34b51
        mov     ax, ds
        add     ax, 1000h
        mov     ds, ax
br_34b51:
        loop    loop_34b44
br_34b53:
        pop     es
        pop     ds
        retf
far_34b56:
        and     byte ptr [A_7F64], 0bfh
        retf
fn_34b5c:
        mov     al, byte ptr [A_7791]
        cmp     al, 0ffh
        jz      br_34b84
        mov     si, A_7785
        mov     di, A_7D7A
        mov     cx, 0ch
        rep movsb
        push    cs
        call    far_34a88
        mov     bl, dh
        sub     bh, bh
        push    es
        add     bx, bx
        add     bx, A_B1B0
        mov     es, word ptr [bx]
        mov     byte ptr es:[0fh], al
        pop     es
br_34b84:
        retf
far_34b85:
        mov     bx, A_B1B0
        mov     cl, byte ptr [A_72F4]
        sub     ch, ch
        jcxz    br_34b9f
        push    es
        sub     al, al
loop_34b93:
        mov     es, word ptr [bx]
        mov     byte ptr es:[0bdh], al
        add     bx, 2
        loop    loop_34b93
        pop     es
br_34b9f:
        retf
far_34ba0:
        push    si
        push    di
        mov     si, A_1531
        mov     cx, 60h
        rep movsw
        pop     di
        pop     si
        mov     ax, word ptr [si + 16h]
        mov     cl, 4
        shl     ax, cl
        mov     byte ptr es:[di + 2], ah
        sub     ah, ah
        sub     dx, dx
        sub     dx, ax
        mov     word ptr es:[di + 14h], dx
        mov     dx, word ptr [si + 14h]
        mov     word ptr es:[di + 8ah], dx
        callf   SEG_MAIN:far_196f0
        add     word ptr es:[di + 14h], dx
        cmp     byte ptr [si + 1ah], 4fh
        jnz     br_34be7
        sub     ax, ax
        mov     word ptr es:[di + 30h], ax
        mov     byte ptr es:[di + 10h], al
        mov     byte ptr es:[di + 13h], 2
br_34be7:
        mov     ax, word ptr [si + 1ch]
        mov     dx, word ptr [si + 1eh]
        mov     cx, ax
        neg     cx
        and     cx, 3fh
        add     cx, 6
        sub     bx, bx
        add     ax, cx
        adc     dx, bx
        mov     word ptr es:[di + 22h], ax
        mov     word ptr es:[di + 24h], dx
        mov     word ptr es:[di + 26h], ax
        mov     word ptr es:[di + 28h], dx
        mov     ax, word ptr [si + 20h]
        mov     dx, word ptr [si + 22h]
        add     ax, cx
        adc     dx, bx
        mov     word ptr es:[di + 1eh], ax
        mov     word ptr es:[di + 20h], dx
        mov     ax, word ptr [si + 10h]
        mov     dx, word ptr [si + 12h]
        mov     word ptr [A_7F3C], ax
        mov     word ptr [A_7F3E], dx
        add     ax, cx
        adc     dx, bx
        test    al, 3fh
        jz      br_34c3c
        and     al, 0c0h
        add     ax, 40h
        adc     dx, 0
br_34c3c:
        mov     word ptr es:[di + 1ah], ax
        mov     word ptr es:[di + 1ch], dx
        mov     ax, word ptr [si + 24h]
        mov     dx, word ptr [si + 26h]
        mov     word ptr es:[di + 2ah], bx
        mov     word ptr es:[di + 2ch], ax
        mov     word ptr es:[di + 2eh], dx
        mov     ax, word ptr [A_733D]
        mov     word ptr es:[di + 16h], ax
        mov     word ptr [A_7772], ax
        add     ax, cx
        mov     word ptr [A_7F44_2], ax
        mov     ax, word ptr [A_733F]
        mov     word ptr es:[di + 18h], ax
        mov     word ptr [A_7774], ax
        adc     ax, bx
        mov     word ptr [A_7F46_2], ax
        sub     ax, ax
loop_34c76:
        callf   SEG_INT_01:far_26127
        loop    loop_34c76
        mov     si, A_7D7A
        push    di
        add     di, 3
        mov     cx, 0ch
        rep movsb
        pop     si
        callf   SEG_MAIN:far_1520f
        retf
far_34c90:
        sub     bp, bp
        mov     cx, word ptr [A_7F3C]
        mov     bx, word ptr [A_7F3E]
        mov     ax, word ptr [A_7F44_2]
        mov     dx, word ptr [A_7F46_2]
        add     ax, cx
        adc     dx, bx
        sub     ax, 2
        sbb     dx, bp
        mov     word ptr [A_7F48], ax
        mov     word ptr [A_7F4A], dx
        shr     bx, 1
        rcr     cx, 1
        mov     ax, word ptr [A_7F44_2]
        mov     dx, word ptr [A_7F46_2]
        add     ax, cx
        adc     dx, bx
        sub     ax, 2
        sbb     dx, bp
        mov     word ptr [A_7F40], ax
        mov     word ptr [A_7F42], dx
        shr     bx, 1
        rcr     cx, 1
        pushf
        adc     cx, bp
        adc     bx, bp
        mov     word ptr [A_7F3C], cx
        mov     word ptr [A_7F3E], bx
        add     ax, cx
        adc     dx, bx
        add     ax, 1
        adc     dx, bp
        mov     word ptr [A_7F44_2], ax
        mov     word ptr [A_7F46_2], dx
        popf
        jnc     loop_34d38
        mov     bx, A_7F44_2
        call    fn_34dbb
        callf   SEG_INT_01:far_26106
        mov     dh, al
        mov     bp, 1
        call    fn_34db4
        mov     bx, A_7F40
        call    fn_34dbb
        callf   SEG_INT_01:far_26106
        mov     dl, al
        and     al, 0f0h
        call    fn_34dbb
        callf   SEG_INT_01:far_26127
        mov     bp, 1
        call    fn_34db4
        mov     bx, A_7F48
        call    fn_34dbb
        shl     dl, 4
        mov     ax, dx
        callf   SEG_INT_01:far_26127
        mov     bp, 1
        call    fn_34db4
        jmp     br_34d92
loop_34d38:
        mov     byte ptr [A_7D01], 14h
        mov     bx, A_7F44_2
        call    fn_34dbb
        callf   SEG_INT_01:far_26106
        mov     bp, 1
        call    fn_34db4
        mov     bx, A_7F40
        call    fn_34dbb
        mov     di, A_91B0
        mov     cx, 2
        callf   SEG_INT_01:far_2615c
        mov     si, A_A1B0
        mov     dl, byte ptr [di - 2]
        and     dl, 0f0h
        xchg    byte ptr [di - 2], dl
        shl     dl, 4
        mov     dh, ah
        mov     word ptr [si + 2], dx
        mov     dl, byte ptr [di - 4]
        and     dl, 0f0h
        xchg    byte ptr [di - 4], dl
        shl     dl, 4
        mov     dh, al
        mov     word ptr [si], dx
        mov     bx, A_7F48
        call    fn_34da6
        mov     si, A_91B0
        mov     bx, A_7F40
        call    fn_34da6
br_34d92:
        sub     word ptr [A_7F3C], 1
        sbb     word ptr [A_7F3E], 0
        jnz     loop_34d38
        mov     ax, word ptr [A_7F3C]
        or      ax, ax
        jnz     loop_34d38
        retf
fn_34da6:
        call    fn_34dbb
        mov     cx, 2
        callf   SEG_INT_01:far_26166
        mov     bp, 2
fn_34db4:
        sub     word ptr [bx], bp
        sbb     word ptr [bx + 2], 0
        ret
fn_34dbb:
        mov     bp, word ptr [bx]
        mov     word ptr [A_7772], bp
        mov     bp, word ptr [bx + 2]
        mov     word ptr [A_7774], bp
        ret
far_34dc9:
        cmp     byte ptr es:[bx], 1
        jz      br_34dd4
        push    cs
        call    far_34faa
        retf
br_34dd4:
        mov     word ptr [A_7F70_2], es
        mov     ax, word ptr [A_7D90]
        cmp     ax, 132h
        jnc     br_34de6
        sub     ax, ax
        mov     word ptr es:[bx + 41h], ax
br_34de6:
        mov     ax, word ptr [A_7D90]
        cmp     ax, 200h
        ja      br_34e05
        jc      br_34df7
        cmp     word ptr es:[bx + 46h], 0
        jz      br_34e05
br_34df7:
        sub     ax, ax
        mov     byte ptr es:[bx + 43h], al
        mov     byte ptr es:[bx + 44h], al
        mov     byte ptr es:[bx + 45h], al
br_34e05:
        mov     ax, word ptr [A_7D90]
        cmp     ah, 5
        ja      br_34e23
        mov     byte ptr es:[bx + 46h], 1
        mov     byte ptr es:[bx + 47h], 0
        cmp     byte ptr es:[bx + 38h], 0
        jz      br_34e23
        mov     byte ptr es:[bx + 38h], 0
br_34e23:
        mov     ax, word ptr [A_7D90]
        cmp     ah, 0ah
        jc      br_34e2e
        jmp     br_34f2d
br_34e2e:
        mov     al, byte ptr es:[bx + 46h]
        mov     byte ptr es:[bx + 46h], 46h
        dec     al
        js      br_34e47
        mov     byte ptr es:[bx + 46h], 50h
        jz      br_34e47
        mov     byte ptr es:[bx + 46h], 63h
br_34e47:
        cmp     byte ptr es:[bx + 11h], 0fh
        jnz     br_34e53
        mov     byte ptr es:[bx + 11h], 1fh
br_34e53:
        mov     byte ptr es:[bx + 4ch], 6
        mov     al, byte ptr es:[bx + 20h]
        mov     byte ptr es:[bx + 59h], al
        mov     byte ptr es:[bx + 4dh], 8
        mov     byte ptr es:[bx + 5ah], 19h
        mov     byte ptr es:[bx + 4eh], 1
        mov     al, byte ptr es:[bx + 39h]
        mov     byte ptr es:[bx + 5bh], al
        mov     al, 52h
        mul     byte ptr es:[bx + 1dh]
        mov     byte ptr es:[bx + 1dh], ah
        mov     byte ptr es:[bx + 4fh], 6
        mov     al, byte ptr es:[bx + 1bh]
        mov     byte ptr es:[bx + 5ch], al
        mov     byte ptr es:[bx + 50h], 3
        mov     al, byte ptr es:[bx + 1ch]
        mov     byte ptr es:[bx + 5dh], al
        mov     byte ptr es:[bx + 58h], 5
        mov     byte ptr es:[bx + 54h], 5
        mov     byte ptr es:[bx + 55h], 3
        mov     byte ptr es:[bx + 56h], 0ah
        mov     byte ptr es:[bx + 51h], 6
        mov     al, byte ptr es:[bx + 43h]
        mov     byte ptr es:[bx + 5eh], al
        mov     byte ptr es:[bx + 52h], 6
        mov     al, byte ptr es:[bx + 44h]
        mov     byte ptr es:[bx + 5fh], al
        mov     byte ptr es:[bx + 53h], 6
        mov     al, byte ptr es:[bx + 45h]
        mov     byte ptr es:[bx + 60h], al
        mov     byte ptr es:[bx + 57h], 0ah
        mov     al, byte ptr es:[bx + 27h]
        mov     byte ptr es:[bx + 49h], al
        mov     al, byte ptr es:[bx + 15h]
        mov     ah, 0ch
        mul     ah
        mov     byte ptr es:[bx + 4bh], al
        mov     byte ptr es:[bx + 61h], 0
        mov     byte ptr es:[bx + 62h], 0
        mov     cl, 50h
        mov     al, cl
        mul     byte ptr es:[bx + 22h]
        mov     byte ptr es:[bx + 22h], ah
        mov     al, cl
        mul     byte ptr es:[bx + 44h]
        mov     byte ptr es:[bx + 44h], ah
        mov     al, cl
        mul     byte ptr es:[bx + 24h]
        mov     byte ptr es:[bx + 24h], ah
        mov     al, cl
        mul     byte ptr es:[bx + 25h]
        mov     byte ptr es:[bx + 25h], ah
        mov     al, cl
        mul     byte ptr es:[bx + 26h]
        mov     byte ptr es:[bx + 26h], ah
br_34f2d:
        mov     ax, word ptr [A_7D90]
        cmp     ah, 0fh
        jnc     br_34f6a
        mov     al, byte ptr es:[bx + 16h]
        mov     byte ptr [A_7F72], al
        inc     al
        push    bx
        mov     bx, A_6210
        xlat
        pop     bx
        mov     byte ptr es:[bx + 16h], al
        cmp     byte ptr [A_7D89], 0
        jnz     br_34f58
        cmp     al, 2
        jc      br_34f58
        mov     byte ptr es:[bx + 16h], 0ffh
br_34f58:
        mov     byte ptr es:[73h], 0
        mov     byte ptr es:[71h], 0
        mov     byte ptr es:[72h], 19h
br_34f6a:
        cmp     byte ptr [A_7D89], 1
        jnz     br_34f76
        mov     byte ptr [A_7D88], 1
br_34f76:
        cmp     byte ptr [A_722C], 0
        jz      br_34f95
        test    byte ptr [A_7D88], 1
        jnz     br_34fa9
        mov     byte ptr es:[bx + 63h], 5
        mov     byte ptr es:[bx + 64h], 3
        mov     byte ptr es:[bx + 65h], 0eh
        jmp     br_34fa9
br_34f95:
        mov     cx, 0dh
        mov     di, 4ch
        mov     al, 0eh
loop_34f9d:
        cmp     byte ptr es:[bx+di], al
        jbe     br_34fa6
        mov     byte ptr es:[bx+di], 0
br_34fa6:
        inc     di
        loop    loop_34f9d
br_34fa9:
        retf
far_34faa:
        cmp     byte ptr es:[bx], 2
        jz      br_34fb3
        jmp     br_350c2
br_34fb3:
        mov     ax, word ptr [A_7D90]
        cmp     ax, 11eh
        jnc     br_34fd1
        sub     ax, ax
        mov     word ptr es:[bx + 8ch], ax
        mov     word ptr es:[bx + 8eh], ax
        mov     word ptr es:[bx + 90h], ax
        mov     word ptr es:[bx + 92h], ax
br_34fd1:
        cmp     ax, 132h
        jnc     br_34fdd
        sub     ax, ax
        mov     byte ptr es:[bx + 94h], al
br_34fdd:
        mov     ax, word ptr [A_7D90]
        cmp     ax, 0a53h
        jl      br_34fef
        cmp     ah, 0ah
        jz      br_34ff5
        cmp     ax, 0b03h
        jnc     br_34ff5
br_34fef:
        mov     byte ptr es:[bx + 0a0h], 0ffh
br_34ff5:
        cmp     ah, 0ah
        jnc     br_3505a
        mov     byte ptr es:[bx + 95h], 0
        mov     al, byte ptr es:[bx + 1dh]
        mov     byte ptr es:[bx + 9ah], al
        mov     byte ptr es:[bx + 96h], 63h
        mov     al, byte ptr es:[bx + 94h]
        mov     byte ptr es:[bx + 9bh], al
        mov     al, byte ptr es:[bx + 9]
        mov     byte ptr es:[bx + 97h], al
        mov     al, byte ptr es:[bx + 0ah]
        mov     byte ptr es:[bx + 98h], al
        mov     al, byte ptr es:[bx + 0bh]
        mov     byte ptr es:[bx + 99h], al
        mov     byte ptr es:[bx + 9ch], 63h
        mov     byte ptr es:[bx + 9eh], 63h
        mov     byte ptr es:[bx + 9dh], 0
        mov     byte ptr es:[bx + 9fh], 0
        mov     al, byte ptr es:[bx + 15h]
        sub     al, 9
        jnc     br_35056
        sub     al, al
br_35056:
        mov     byte ptr es:[bx + 15h], al
br_3505a:
        mov     ax, word ptr [A_7D90]
        cmp     ah, 0fh
        jnc     br_350c2
        push    dx
        push    es
        mov     es, word ptr [A_7F70_2]
        mov     dh, byte ptr es:[16h]
        pop     es
        mov     bx, A_621C
        mov     al, byte ptr [A_7D89]
        xlat
        mov     dl, al
        mov     bx, A_6210
        mov     di, 88h
        mov     cx, 4
loop_35080:
        mov     al, byte ptr es:[di]
        add     al, byte ptr [A_7F72]
        inc     al
        sub     ah, ah
        add     al, dl
        div     dl
        mov     al, ah
        xlat
        cmp     byte ptr [A_7D89], 0
        jnz     br_3509f
        cmp     al, 2
        jnz     br_3509f
        mov     al, 0ffh
br_3509f:
        inc     al
        push    dx
        mov     dl, 9
        sub     al, dh
        add     al, dl
        sub     ah, ah
        div     dl
        pop     dx
        dec     ah
        mov     byte ptr es:[di], ah
        inc     di
        loop    loop_35080
        pop     dx
        mov     byte ptr es:[0a1h], 0
        mov     byte ptr es:[0a2h], 19h
br_350c2:
        retf
far_350c3:
        mov     ax, word ptr [A_7D90]
        cmp     ax, 132h
        jnc     br_350d1
        mov     byte ptr es:[bx + 8ch], 0
br_350d1:
        cmp     ah, 0ah
        jnc     br_350ee
        mov     di, bx
        mov     cx, 4
loop_350db:
        and     byte ptr es:[di + 26h], 0c0h
        add     di, 0ch
        loop    loop_350db
        push    si
        mov     si, bx
        callf   SEG_MAIN:far_1520f
        pop     si
br_350ee:
        test    byte ptr es:[bx + 98h], 1
        jnz     br_350fc
        mov     byte ptr es:[bx + 8dh], 0
br_350fc:
        push    cs
        call    far_35101
        retf
far_35101:
        test    byte ptr es:[bx + 0fh], 80h
        jnz     br_3511e
        or      byte ptr es:[bx + 0fh], 80h
        mov     ax, 5622h
        test    byte ptr es:[bx + 1], 1
        jz      br_35119
        add     ax, ax
br_35119:
        mov     word ptr es:[bx + 8ah], ax
br_3511e:
        retf
far_3511f:
        cmp     byte ptr [A_7F73], 0
        jnz     br_35154
        mov     byte ptr [A_7F73], al
        mov     bx, 400h
        mov     di, A_A9F0
        push    ds
        mov     ax, A_3A60
        mov     ds, ax
        mov     cx, 10h
loop_35138:
        mov     ax, bx
        out     80h, ax
        sub     ax, ax
        out     84h, ax
        mov     ax, 0fa24h
        out     82h, ax
        mov     byte ptr [di + 10ch], 0
        add     bl, 2
        add     di, 378h
        loop    loop_35138
        pop     ds
br_35154:
        retf
fn_35155:
        mov     si, A_91B0
        mov     di, A_33D0
        push    es
        mov     ax, A_3A60
        mov     es, ax
        mov     cx, 1c90h
        rep movsb
        pop     es
        retf
fn_35168:
        mov     byte ptr es:[bx + 0a8h], 0
        mov     byte ptr es:[bx + 0a9h], 1
        mov     byte ptr es:[bx + 0aah], 0
        mov     byte ptr es:[bx + 0abh], 0
        mov     byte ptr es:[bx + 0ach], 0
        mov     byte ptr es:[bx + 0adh], 0
        mov     byte ptr es:[bx + 0aeh], 0
        mov     byte ptr es:[bx + 0afh], 0
        mov     byte ptr es:[bx + 0b0h], 0
        mov     byte ptr es:[bx + 0b1h], 63h
        mov     byte ptr es:[bx + 0b2h], 0
        mov     byte ptr es:[bx + 0b3h], 0
        mov     byte ptr es:[bx + 0b4h], 63h
        mov     byte ptr es:[bx + 0b5h], 32h
        mov     byte ptr es:[bx + 0b6h], 63h
        mov     byte ptr es:[bx + 0b7h], 0
        mov     byte ptr es:[bx + 0b8h], 63h
        mov     byte ptr es:[bx + 0b9h], 2dh
        mov     byte ptr es:[bx + 0bah], 0
        mov     byte ptr es:[bx + 0bbh], 0
        mov     byte ptr es:[bx + 0bch], 0
        mov     byte ptr es:[bx + 0bdh], 0
        mov     byte ptr es:[bx + 0beh], 0
        mov     byte ptr es:[bx + 0bfh], 19h
        ret
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (MODEL = 3200)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (FW_VERSION < 150)
        db      000h, 000h, 000h, 000h
        endif
        if      XL
        phase   0
far_35200:
        mov     si, 9000h
        mov     cx, 3eeh
        sub     ax, ax
loop_35208:
        mov     es, si
        cmp     byte ptr es:[0], 3
        jnz     br_35218
        inc     ax
        mov     word ptr [di], si
        add     di, 2
br_35218:
        add     si, 0ch
        loop    loop_35208
        mov     word ptr [A_72F6], ax
        add     ax, word ptr [A_72F4]
        endif
        if      (XL) && (MODEL = 3000)
        add     ax, 2
        elseif  (XL) && (MODEL = 3200)
        add     ax, 3
        endif
        if      XL
        inc     ax
        inc     ax
        mov     word ptr [A_72F8], ax
        mov     cx, word ptr [A_72F4]
        jcxz    br_3525f
        dec     cx
        jz      br_3525f
        mov     bp, cx
loop_35237:
        mov     cx, bp
        mov     di, A_B1B0
        sub     dx, dx
loop_3523e:
        mov     es, word ptr [di + 2]
        mov     al, byte ptr es:[0fh]
        mov     es, word ptr [di]
        cmp     al, byte ptr es:[0fh]
        jnc     br_35256
        mov     ax, word ptr [di]
        xchg    word ptr [di + 2], ax
        mov     word ptr [di], ax
        inc     dx
br_35256:
        add     di, 2
        loop    loop_3523e
        or      dx, dx
        jnz     loop_35237
br_3525f:
        retf
        endif
        if      (XL) && (MODEL = 3200)
fn_35990:
        cmp     byte ptr [74a7h], 0
        jz      br_3599d
        callf   34b7h:far_34e6d
        retf
br_3599d:
        callf   34b7h:far_34e7d
        cmp     byte ptr [804bh], 1
        jnz     br_359b3
        mov     byte ptr [7fcbh], 2
        mov     byte ptr [8055h], 1
br_359b3:
        retf
        endif
        if      XL
fn_35260:
        mov     si, 2ch
        mov     di, A_181B
        mov     al, byte ptr [A_753D]
        sub     ah, ah
        mov     cx, 0ch
        div     cl
        shr     ax, 8
        add     si, ax
        push    ds
        push    ds
        push    es
        pop     ds
        pop     es
        sub     cx, ax
        jz      br_35281
        cld
        rep movsb
br_35281:
        mov     si, 2ch
        mov     cx, ax
        jcxz    br_3528a
        rep movsb
br_3528a:
        pop     ds
        mov     byte ptr [A_753C], 0
        retf
far_35291:
        test    byte ptr [A_7300], 1
        jz      br_3529c
        shr     dx, 1
        rcr     ax, 1
br_3529c:
        mov     cx, 5622h
        test    byte ptr [A_730C], 1
        jz      br_352a8
        shl     cx, 1
br_352a8:
        div     cx
        mov     bp, ax
        sub     ax, ax
        div     cx
        xchg    bp, ax
        retf
far_352b2:
        mov     bl, 4
        sub     di, di
loop_352b6:
        mov     si, word ptr es:[di + 38h]
        cmp     si, 0ffffh
        jz      br_352f2
        push    es
        mov     es, si
        cmp     byte ptr es:[86h], cl
        jz      br_352f1
        mov     byte ptr es:[86h], cl
        inc     ch
        cmp     byte ptr es:[8dh], 0
        jnz     br_352f1
        endif
        if      (XL) && (FW_VERSION >= 150)
        cmp     word ptr es:[si + 18h], 100h
        jnc     br_352f1
        endif
        if      XL
        mov     ax, word ptr es:[1ah]
        mov     dx, word ptr es:[1ch]
        add     word ptr [A_78C8], ax
        adc     word ptr [A_78CA], dx
br_352f1:
        pop     es
br_352f2:
        add     di, 18h
        dec     bl
        jnz     loop_352b6
        retf
far_352fa:
        push    es
        mov     cx, 4
        mov     di, A_753E
        callf   SEG_INT_01:far_25d69
        add     bx, 0ch
        mov     si, bx
        push    ds
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        rep movsb
        pop     ds
        mov     byte ptr [A_7539], 0
        pop     es
        retf
far_3531e:
        push    es
        callf   SEG_INT_01:far_25d69
        mov     si, A_775A
        mov     al, byte ptr es:[bx + 0ch]
        mov     byte ptr [si + 1], al
        mov     byte ptr [si + 2], 63h
        mov     al, byte ptr es:[bx + 0dh]
        mov     byte ptr [si + 5], al
        mov     al, byte ptr es:[bx + 0eh]
        mov     byte ptr [si + 6], al
        mov     al, byte ptr es:[bx + 0fh]
        mov     byte ptr [si + 7], al
        mov     byte ptr [si + 8], 0
        mov     byte ptr [si], 1
        pop     es
        retf
far_35350:
        push    es
        mov     cx, 8
        mov     di, A_75AA
        callf   SEG_INT_01:far_25d69
        mov     si, bx
        mov     al, byte ptr es:[si + 14h]
        mov     byte ptr [di], al
        mov     al, byte ptr es:[si + 9ch]
        mov     byte ptr [di + 1], al
        mov     al, byte ptr es:[si + 9dh]
        mov     byte ptr [di + 2], al
        mov     al, byte ptr es:[si + 9eh]
        mov     byte ptr [di + 3], al
        mov     al, byte ptr es:[si + 15h]
        mov     byte ptr [di + 4], al
        mov     al, byte ptr es:[si + 16h]
        mov     byte ptr [di + 5], al
        mov     al, byte ptr es:[si + 17h]
        mov     byte ptr [di + 6], al
        mov     al, byte ptr es:[si + 9fh]
        mov     byte ptr [di + 7], al
        mov     byte ptr [A_753A], 0
        pop     es
        retf
far_353a0:
        push    es
        callf   SEG_INT_01:far_25d69
        mov     si, A_775A
        mov     al, byte ptr es:[bx + 14h]
        mov     byte ptr [si + 1], al
        mov     al, byte ptr es:[bx + 9ch]
        mov     byte ptr [si + 2], al
        mov     al, byte ptr es:[bx + 9dh]
        mov     byte ptr [si + 3], al
        mov     al, byte ptr es:[bx + 9eh]
        mov     byte ptr [si + 4], al
        mov     al, byte ptr es:[bx + 15h]
        mov     byte ptr [si + 5], al
        mov     al, byte ptr es:[bx + 16h]
        mov     byte ptr [si + 6], al
        mov     al, byte ptr es:[bx + 17h]
        mov     byte ptr [si + 7], al
        mov     al, byte ptr es:[bx + 9fh]
        mov     byte ptr [si + 8], al
        mov     byte ptr [si], 2
        pop     es
        retf
far_353ea:
        push    es
        mov     cx, 8
        mov     di, A_7682
        callf   SEG_INT_01:far_25d69
        mov     si, bx
        mov     al, byte ptr es:[si + 0b3h]
        mov     byte ptr [di], al
        mov     al, byte ptr es:[si + 0b4h]
        mov     byte ptr [di + 1], al
        mov     al, byte ptr es:[si + 0b5h]
        mov     byte ptr [di + 2], al
        mov     al, byte ptr es:[si + 0b6h]
        mov     byte ptr [di + 3], al
        mov     al, byte ptr es:[si + 0b7h]
        mov     byte ptr [di + 4], al
        mov     al, byte ptr es:[si + 0b8h]
        mov     byte ptr [di + 5], al
        mov     al, byte ptr es:[si + 0b9h]
        mov     byte ptr [di + 6], al
        mov     al, byte ptr es:[si + 0bah]
        mov     byte ptr [di + 7], al
        mov     byte ptr [A_753B], 0
        pop     es
        retf
far_3543e:
        push    es
        callf   SEG_INT_01:far_25d69
        mov     si, A_775A
        mov     al, byte ptr es:[bx + 0b3h]
        mov     byte ptr [si + 1], al
        mov     al, byte ptr es:[bx + 0b4h]
        mov     byte ptr [si + 2], al
        mov     al, byte ptr es:[bx + 0b5h]
        mov     byte ptr [si + 3], al
        mov     al, byte ptr es:[bx + 0b6h]
        mov     byte ptr [si + 4], al
        mov     al, byte ptr es:[bx + 0b7h]
        mov     byte ptr [si + 5], al
        mov     al, byte ptr es:[bx + 0b8h]
        mov     byte ptr [si + 6], al
        mov     al, byte ptr es:[bx + 0b9h]
        mov     byte ptr [si + 7], al
        mov     al, byte ptr es:[bx + 0bah]
        mov     byte ptr [si + 8], al
        mov     byte ptr [si], 3
        pop     es
        retf
far_3548c:
        push    es
        mov     ax, 9000h
        mov     es, ax
        sub     di, di
        mov     cx, 3eeh
        mov     dl, 0
loop_35499:
        mov     byte ptr es:[di], dl
        mov     ax, es
        add     ax, 0ch
        mov     es, ax
        loop    loop_35499
        mov     ax, 0bfe8h
        mov     es, ax
        mov     si, A_13B1
        mov     cx, 0c0h
        rep movsb
        mov     si, A_1471
        mov     cx, 0c0h
        rep movsb
        sub     di, di
        mov     byte ptr es:[di + 19h], 63h
        sub     al, al
        mov     byte ptr es:[di + 1ah], al
        add     di, 0c0h
        mov     byte ptr es:[di + 8], al
        mov     byte ptr es:[di + 0b2h], al
        mov     byte ptr es:[di + 0a8h], al
        mov     byte ptr es:[di + 0ch], al
        mov     ax, 7f00h
        mov     byte ptr es:[di + 46h], al
        mov     byte ptr es:[di + 47h], ah
        mov     dx, 0bf28h
        sub     di, di
        mov     cx, 10h
        sub     bl, bl
loop_354f2:
        mov     es, dx
        mov     si, A_13B1
        sub     di, di
        push    cx
        mov     cx, 60h
        rep movsw
        pop     cx
        mov     byte ptr es:[10h], bl
        cmp     cx, 10h
        jz      br_35517
        push    cx
        mov     di, 3
        mov     ax, 0a0ah
        mov     cx, 6
        rep stosw
        pop     cx
br_35517:
        add     dx, 0ch
        inc     bl
        loop    loop_354f2
        pop     es
        mov     byte ptr [A_7381], 0
        retf
far_35525:
        push    cx
        mov     cx, 20h
loop_35529:
        test    bx, 8000h
        jnz     loop_35538
        shl     bp, 1
        rcl     bx, 1
        loop    loop_35529
        mov     bx, 1
loop_35538:
        cmp     bx, dx
        ja      br_35543
        inc     bx
        jnz     loop_35538
        dec     dx
        dec     bx
        jmp     loop_35538
br_35543:
        div     bx
        mov     bx, ax
        sub     bp, bp
loop_35549:
        shr     bx, 1
        rcr     bp, 1
        loop    loop_35549
        pop     cx
        retf
far_35551:
        mov     ax, word ptr es:[16h]
        mov     dx, word ptr es:[18h]
        add     ax, word ptr es:[1ah]
        adc     dx, word ptr es:[1ch]
        add     ax, 0fh
        adc     dx, 0
        and     ax, 0fff0h
        retf
far_3556e:
        push    bx
        push    cx
        push    di
        push    bp
        mov     cl, byte ptr [A_72F6]
        sub     ch, ch
        mov     si, 0ffffh
        jcxz    br_355d6
        mov     bl, byte ptr [A_72F4]
        sub     bh, bh
        shl     bx, 1
        add     bx, A_B1B0
loop_35589:
        mov     es, word ptr [bx]
        cmp     byte ptr es:[8dh], 0
        jnz     br_355d1
        endif
        if      (XL) && (FW_VERSION >= 150)
        cmp     word ptr es:[18h], 100h
        jnc     br_355d1
        endif
        if      XL
        cmp     word ptr es:[18h], dx
        jc      br_355d1
        ja      br_355ac
        cmp     word ptr es:[16h], ax
        jc      br_355d1
br_355ac:
        cmp     si, 0ffffh
        jz      br_355cf
        push    es
        mov     es, si
        mov     bp, word ptr es:[18h]
        mov     di, word ptr es:[16h]
        pop     es
        cmp     word ptr es:[18h], bp
        ja      br_355d1
        jc      br_355cf
        cmp     word ptr es:[16h], di
        ja      br_355d1
br_355cf:
        mov     si, es
br_355d1:
        add     bx, 2
        loop    loop_35589
br_355d6:
        mov     es, si
        pop     bp
        pop     di
        pop     cx
        pop     bx
        retf
far_355dd:
        sub     ch, ch
        jcxz    br_35601
        push    es
        mov     ah, 7fh
        or      al, al
        jns     loop_355ea
        sub     ah, ah
loop_355ea:
        mov     es, word ptr [bx]
        push    ax
        add     al, byte ptr es:[si]
        jns     br_355f4
        mov     al, ah
br_355f4:
        mov     byte ptr es:[si], al
        mov     byte ptr es:[di], al
        pop     ax
        add     bx, 2
        loop    loop_355ea
        pop     es
br_35601:
        retf
far_35602:
        mov     bx, A_775A
        mov     al, byte ptr [bx + 1]
        mul     byte ptr [bx + 2]
        mov     cl, ah
        add     cl, 3
        mov     ch, byte ptr [bx + 2]
        shr     ch, 2
        add     ch, 0dh
        mov     dx, 0d03h
        callf   SEG_MAIN:far_1d6c6
        mov     dx, cx
        mov     al, byte ptr [bx + 2]
        cmp     byte ptr [bx], 1
        jz      br_3564a
        sub     al, byte ptr [bx + 4]
        jns     br_35632
        neg     al
br_35632:
        mul     byte ptr [bx + 3]
        add     cl, ah
        mov     ch, byte ptr [bx + 4]
        shr     ch, 2
        add     ch, 0dh
        callf   SEG_MAIN:far_1d6c6
        mov     dx, cx
        mov     al, byte ptr [bx + 4]
br_3564a:
        sub     al, byte ptr [bx + 6]
        jns     br_35651
        neg     al
br_35651:
        mul     byte ptr [bx + 5]
        add     cl, ah
        mov     ch, byte ptr [bx + 6]
        shr     ch, 2
        add     ch, 0dh
        callf   SEG_MAIN:far_1d6c6
        push    cx
        mov     dl, 9eh
        mov     dh, byte ptr [bx + 8]
        shr     dh, 2
        add     dh, 0dh
        mov     al, byte ptr [bx + 6]
        sub     al, byte ptr [bx + 8]
        jns     br_3567a
        neg     al
br_3567a:
        mul     byte ptr [bx + 7]
        mov     cl, dl
        sub     cl, ah
        callf   SEG_MAIN:far_1d6c6
        pop     dx
        callf   SEG_MAIN:far_1d6c6
        retf
far_3568d:
        push    es
        push    ds
        mov     si, A_B1B0
        sub     ah, ah
        shl     ax, 1
        add     si, ax
        mov     es, word ptr [si]
        mov     cl, byte ptr es:[2ah]
        sub     ch, ch
        mov     bp, cx
        mov     es, word ptr es:[1]
        push    es
loop_356a9:
        pop     ds
        push    ds
        push    cx
        mov     cx, bp
        call    fn_356bd
        pop     cx
        mov     es, word ptr es:[1]
        loop    loop_356a9
        pop     es
        pop     ds
        pop     es
        retf
fn_356bd:
        mov     bl, byte ptr es:[3]
        mov     bh, byte ptr es:[4]
        sub     dx, dx
loop_356c9:
        mov     al, byte ptr [3]
        mov     ah, byte ptr [4]
        push    cs
        call    far_356f1
        mov     ds, word ptr [1]
        loop    loop_356c9
        mov     ax, 0ffh
        inc     dl
        div     dl
        mov     byte ptr es:[20h], al
        mov     ax, 0ffh
        inc     dh
        div     dh
        mov     byte ptr es:[21h], al
        ret
far_356f1:
        cmp     bl, al
        jz      br_35717
        jc      br_35707
        cmp     bh, ah
        jbe     br_35717
        sub     ah, bl
        jc      br_35717
        cmp     ah, dl
        jc      br_35717
        mov     dl, ah
        jmp     br_35717
br_35707:
        cmp     bh, ah
        jnc     br_35717
        mov     ah, bh
        sub     ah, al
        jc      br_35717
        cmp     ah, dh
        jc      br_35717
        mov     dh, ah
br_35717:
        retf
fn_35718:
        push    cx
        mov     di, bx
        add     di, 2ch
        mov     si, di
        add     si, 0ah
        add     di, 0bh
        push    ds
        mov     cx, es
        mov     ds, cx
        mov     al, byte ptr [di]
        mov     cx, 0bh
        std
        rep movsb
        cld
        mov     byte ptr [di], al
        pop     ds
        pop     cx
        ret
fn_35739:
        push    es
        mov     al, byte ptr [A_753D]
        sub     ah, ah
        mov     cl, 0ch
        div     cl
        mov     cl, ah
        sub     ch, ch
        jcxz    br_35753
        callf   SEG_INT_01:far_25d5f
loop_3574e:
        call    fn_35718
        loop    loop_3574e
br_35753:
        pop     es
        retf
far_35755:
        push    di
        sub     ch, ch
        jcxz    br_3577f
        push    es
loop_3575b:
        mov     es, word ptr [bx]
        push    cx
        mov     si, A_8883
        mov     di, 3
        mov     cx, 0ch
        repe cmpsb
        pop     cx
        jz      br_3577b
        add     bx, 2
        inc     ch
        dec     cl
        jnz     loop_3575b
        mov     si, 0ffffh
        clc
        jmp     br_3577e
br_3577b:
        stc
        mov     si, word ptr [bx]
br_3577e:
        pop     es
br_3577f:
        pop     di
        retf
far_35781:
        mov     dh, 0
        mov     byte ptr es:[0], dh
        mov     cl, byte ptr es:[2ah]
        cmp     cl, 0
        jz      br_357bf
loop_35792:
        mov     es, word ptr es:[1]
        mov     byte ptr es:[0], dh
        mov     ah, 4
        mov     dl, 1
        sub     bx, bx
loop_357a2:
        mov     di, word ptr es:[bx + 38h]
        cmp     di, 0ffffh
        jz      br_357b4
        push    es
        mov     es, di
        mov     byte ptr es:[86h], dl
        pop     es
br_357b4:
        add     bx, 18h
        dec     ah
        jnz     loop_357a2
        dec     cl
        jnz     loop_35792
br_357bf:
        retf
far_357c0:
        push    es
        mov     si, A_B1B0
        sub     ah, ah
        shl     ax, 1
        add     si, ax
        mov     es, word ptr [si]
        mov     ch, byte ptr es:[2ah]
        sub     cl, cl
loop_357d3:
        push    cx
        push    es
        callf   SEG_INT_01:far_264cd
        pop     es
        pop     cx
        inc     cl
        dec     ch
        jnz     loop_357d3
        pop     es
        retf
far_357e4:
        push    es
        mov     si, A_B1B0
        sub     ah, ah
        shl     ax, 1
        add     si, ax
        mov     es, word ptr [si]
        mov     ch, byte ptr es:[2ah]
        sub     cl, cl
loop_357f7:
        push    cx
        call    fn_35804
        pop     cx
        inc     cl
        dec     ch
        jnz     loop_357f7
        pop     es
        retf
fn_35804:
        mov     ch, 0
loop_35806:
        push    cx
        push    es
        callf   SEG_INT_01:far_263ac
        pop     es
        pop     cx
        inc     ch
        cmp     ch, 4
        jc      loop_35806
        ret
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (MODEL = 3200)
        db      000h, 000h, 000h, 000h, 000h
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      "Flash ROM"
        db      00dh
        db      "Error in Flash header"
        db      00dh
        db      "Suggest that you reformat Flash ROM"
        elseif  XL = 0
        db      "-18dB"
        db      0ffh
        db      "-12dB"
        db      0ffh
        db      " -6dB"
        db      0ffh
        db      " +0dB"
        db      0ffh
        db      " +6dB"
        db      0ffh
        db      "+12dB"
        db      0ffh
        db      "+18dB"
        endif
        if      ((XL) && (FW_VERSION >= 150)) || ((XL = 0) && (MODEL = 3000))
        db      0ffh, 000h
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      "Flash ROM"
        db      00dh
        db      "attempt to dma to odd byte"
        db      0ffh, 000h
        db      "Unexpected WRITE ERROR"
        db      0ffh, 000h
        db      "Write VERIFY ERROR"
        db      0ffh, 000h, 01eh, 006h, 056h, 057h
fn_358bb:
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        mov     ah, byte ptr [bp + 0eh]
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
        db      01eh, 006h, 056h, 057h
fn_358d2:
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        mov     ax, word ptr [bp + 0eh]
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
        db      01eh, 006h, 056h, 057h
fn_358e9:
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        mov     al, byte ptr [bp + 0eh]
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
        phase   0dch
far_358fc:
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        mov     al, byte ptr [A_7229]
        elseif  (XL) && (MODEL = 3200)
        in      al, 0c0h
        endif
        if      (XL) && (FW_VERSION >= 150)
        and     al, A_00FC_2
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        or      al, 0
        endif
        if      (XL) && (FW_VERSION >= 150)
        out     0c0h, al
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        mov     byte ptr [A_7229], al
        mov     al, byte ptr [A_7229]
        elseif  (XL) && (MODEL = 3200)
        in      al, 0c4h
        endif
        if      (XL) && (FW_VERSION >= 150)
        and     al, A_00FF_3
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        or      al, 2
        endif
        if      (XL) && (FW_VERSION >= 150)
        out     A_00C0_4, al
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        mov     byte ptr [A_7229], al
        elseif  (XL) && (MODEL = 3200)
        in      al, 0c4h
        or      al, 8
        out     0c4h, al
        endif
        if      (XL) && (FW_VERSION >= 150)
        retf
fn_35915:
        push    bp
        mov     bp, sp
        mov     cx, word ptr [bp + 4]
        mov     ax, 0
        mov     ds, ax
        mov     ax, word ptr [bp + 6]
        add     ax, word ptr [A_8758]
        mov     word ptr [A_7772], ax
        mov     ax, word ptr [bp + 8]
        add     ax, word ptr [A_875A]
        mov     word ptr [A_7774], ax
        push    si
        lea     si, [bp + 0ah]
        mov     dx, ss
        callf   SEG_INT_01:far_260de
        pop     si
        pop     bp
        ret
far_35942:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        sub     sp, 6
        push    word ptr [A_8758]
        push    word ptr [A_875A]
        mov     word ptr [A_8758], 0
        mov     word ptr [A_875A], 0
        push    es
        push    word 90h
        push    word ptr [bp + 10h]
        push    0
        push    1
        call    fn_35915
        add     sp, 8
        pop     es
        lea     ax, [bp - 4]
        push    es
        push    2
        push    word ptr [bp + 10h]
        push    0
        push    ss
        push    ax
        push    cs
        call    far_359a4
        add     sp, 0ah
        pop     es
        mov     dx, word ptr [bp - 2]
        mov     ax, word ptr [bp - 4]
        pop     word ptr [A_875A]
        pop     word ptr [A_8758]
        mov     sp, bp
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
far_359a4:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        mov     ax, 0
        test    word ptr [bp + 0eh], 1
        jnz     br_359f1
        push    word ptr [A_7774]
        push    word ptr [A_7772]
        mov     ax, word ptr [bp + 12h]
        add     ax, word ptr [A_8758]
        mov     word ptr [A_7772], ax
        mov     ax, word ptr [bp + 14h]
        add     ax, word ptr [A_875A]
        mov     word ptr [A_7774], ax
        mov     di, word ptr [bp + 0eh]
        mov     dx, word ptr [bp + 10h]
        mov     cx, word ptr [bp + 16h]
        callf   SEG_INT_01:far_260b6
        pop     word ptr [A_7772]
        pop     word ptr [A_7774]
        mov     ax, 1
br_359f1:
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
far_359f7:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        callf   SEG_MAIN:far_10199
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
far_35a10:
        cmp     byte ptr [A_8761], 0
        jz      br_35a1b
        dec     byte ptr [A_8761]
br_35a1b:
        retf
far_35a1c:
        push    es
        mov     ax, A_3A60
        mov     es, ax
        cmp     byte ptr es:[si + 10h], 0f3h
        jnz     br_35a5a
        mov     dl, byte ptr es:[si + 0ch]
        sub     dh, dh
        mov     ax, word ptr es:[si + 14h]
        add     ax, 20h
        adc     dx, 0
        push    es
        push    dx
        push    ax
        push    cs
        call    far_35df7
        add     sp, 4
        pop     es
        or      ax, ax
        jz      br_35a5a
        pop     es
        push    es
        mov     bx, A_3602
        mov     es, bx
        mov     bx, 659h
        callf   SEG_MAIN:far_1d779
        pop     es
        stc
        retf
br_35a5a:
        mov     dl, byte ptr es:[si + 0ch]
        sub     dh, dh
        mov     ax, word ptr es:[si + 14h]
        pop     es
        push    es
        push    dx
        push    ax
        callf   A_1FEC:far_23b79
        add     sp, 4
        pop     es
        sub     al, 1
        retf
far_35a74:
        cmp     byte ptr [A_8761], 0
        jnz     br_35a80
        push    cs
        call    far_35a87
        retf
br_35a80:
        mov     byte ptr [A_8761], 14h
        clc
        retf
far_35a87:
        test    byte ptr [A_8760], 0ch
        jnz     br_35acf
        push    es
        mov     di, A_3A60
        mov     es, di
        mov     di, 62aah
        sub     ax, ax
        mov     cx, 17e8h
        rep stosw
        pop     es
        mov     word ptr [A_7F58], 1feh
        mov     byte ptr [A_7461], 64h
        mov     al, byte ptr [A_7463]
        sub     ah, ah
        push    es
        push    ax
        push    word A_3A60
        push    word 62aah
        push    word 0
        push    word A_B9BE
        callf   A_1FEC:far_2344e
        add     sp, 0ah
        pop     es
        or      ax, ax
        jnz     br_35ad8
        callf   SEG_INT_01:far_2883f
br_35acf:
        mov     byte ptr [A_8761], 14h
        sub     ax, ax
        jmp     br_35aed
br_35ad8:
        cmp     ax, 2
        jnz     br_35aec
        push    es
        mov     bx, A_3602
        mov     es, bx
        mov     bx, 5d5h
        callf   SEG_MAIN:far_1d760
        pop     es
br_35aec:
        stc
br_35aed:
        retf
far_35aee:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        push    es
        push    bx
        mov     es, word ptr [bp + 10h]
        mov     bx, word ptr [bp + 0eh]
        callf   SEG_INT_01:far_25d26
        pop     bx
        pop     es
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
far_35b11:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        push    bx
        mov     es, word ptr [bp + 10h]
        mov     bx, word ptr [bp + 0eh]
        callf   SEG_MAIN:far_1d760
        pop     bx
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
        db      01eh, 006h, 056h, 057h
fn_35b36:
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        push    bx
        mov     es, word ptr [bp + 10h]
        mov     bx, word ptr [bp + 0eh]
        callf   SEG_MAIN:far_1d779
        pop     bx
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
far_35b53:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        push    es
        mov     bx, A_3602
        mov     es, bx
        mov     bx, 63eh
        callf   SEG_MAIN:far_1d779
        pop     es
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
far_35b76:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        mov     al, 82h
        callf   SEG_INT_01:far_2ac28
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
far_35b91:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        mov     bx, A_3602
        mov     es, bx
        mov     bx, 5f9h
        mov     ax, word ptr [bp + 0eh]
        cmp     ax, word ptr [bp + 10h]
        jnz     br_35bc3
        mov     bx, 621h
        mov     dl, 0ah
        div     dl
        or      al, al
        jz      br_35bbc
        add     al, 10h
br_35bbc:
        add     ax, 3020h
        mov     word ptr es:[bx + 11h], ax
br_35bc3:
        callf   SEG_MAIN:far_1d760
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
far_35bce:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        sub     sp, 2
        mov     ax, word ptr [bp + 16h]
        dec     ax
        mov     word ptr [bp - 2], ax
loop_35be6:
        push    es
        push    word ptr [bp + 14h]
        push    word ptr [bp + 12h]
        call    fn_35cd0
        add     sp, 4
        pop     es
        mov     ax, word ptr [A_8740]
        and     al, 6
        cmp     al, 6
        jnz     loop_35be6
        push    es
        push    0
        push    word ptr [bp - 2]
        push    word 0e0h
        push    word ptr [bp + 14h]
        push    word ptr [bp + 12h]
        push    3
        call    fn_35915
        add     sp, 0ch
        pop     es
        mov     ax, 0
        mov     bx, 80h
        mov     cx, word ptr [bp + 10h]
        mov     dx, word ptr [bp + 0eh]
        mov     di, word ptr [bp + 14h]
        mov     si, word ptr [bp + 12h]
        call    fn_35e43
        push    es
        push    word ptr [bp - 2]
        push    0ch
        push    word ptr [bp + 14h]
        push    word ptr [bp + 12h]
        push    2
        call    fn_35915
        add     sp, 0ah
        pop     es
        push    es
        push    0
        push    word ptr [bp + 14h]
        push    word ptr [bp + 12h]
        push    1
        call    fn_35915
        add     sp, 8
        pop     es
        push    es
        push    word ptr [bp + 14h]
        push    word ptr [bp + 12h]
        call    fn_35cf6
        add     sp, 4
        pop     es
        mov     sp, bp
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
far_35c67:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        callf   SEG_INT_01:far_289f0
        push    es
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        call    fn_35cd0
        add     sp, 4
        pop     es
        push    es
        push    word 0d0h
        push    20h
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    2
        call    fn_35915
        add     sp, 0ah
        pop     es
        push    es
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        call    fn_35cf6
        add     sp, 4
        pop     es
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
far_35cb1:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        callf   SEG_INT_01:far_289f0
        mov     ax, word ptr [bp + 10h]
        call    fn_35e61
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
fn_35cd0:
        push    bp
        mov     bp, sp
loop_35cd3:
        push    es
        push    word ptr [bp + 6]
        push    word ptr [bp + 4]
        call    fn_35d57
        add     sp, 4
        pop     es
        test    al, 8
        jnz     loop_35cd3
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        mov     al, byte ptr [A_7229]
        and     al, 0ffh
        or      al, 3
        elseif  (XL) && (MODEL = 3200)
        in      al, 0c4h
        or      al, 8
        out     0c4h, al
        in      al, 0c0h
        or      al, 80h
        endif
        if      (XL) && (FW_VERSION >= 150)
        out     0c0h, al
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        mov     byte ptr [A_7229], al
        endif
        if      (XL) && (FW_VERSION >= 150)
        mov     ax, 1
        pop     bp
        ret
fn_35cf6:
        push    bp
        mov     bp, sp
loop_35cf9:
        push    es
        push    word ptr [bp + 6]
        push    word ptr [bp + 4]
        call    fn_35d87
        add     sp, 4
        pop     es
        test    al, 80h
        jz      loop_35cf9
        push    es
        push    word 0ffh
        push    word ptr [bp + 6]
        push    word ptr [bp + 4]
        push    1
        call    fn_35915
        add     sp, 8
        pop     es
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        mov     al, byte ptr [A_7229]
        elseif  (XL) && (MODEL = 3200)
        in      al, 0c0h
        endif
        if      (XL) && (FW_VERSION >= 150)
        and     al, A_00FC_2
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        or      al, 2
        endif
        if      (XL) && (FW_VERSION >= 150)
        out     0c0h, al
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        mov     byte ptr [A_7229], al
        endif
        if      (XL) && (FW_VERSION >= 150)
        mov     bx, word ptr [A_8748]
        mov     bh, bl
        and     bl, 0f8h
        cmp     bl, 80h
        mov     ax, 1
        jz      br_35d55
        cmp     bl, 0b0h
        jnz     br_35d52
        push    es
        push    50h
        push    word ptr [bp + 6]
        push    word ptr [bp + 4]
        push    1
        call    fn_35915
        add     sp, 8
        pop     es
br_35d52:
        mov     ax, 0
br_35d55:
        pop     bp
        ret
fn_35d57:
        push    bp
        mov     bp, sp
        push    es
        push    71h
        push    word ptr [bp + 6]
        push    word ptr [bp + 4]
        push    1
        call    fn_35915
        add     sp, 8
        pop     es
        push    es
        push    1
        push    word ptr [bp + 6]
        push    2
        push    word 0
        push    word A_8740
        push    cs
        call    far_359a4
        add     sp, 0ah
        pop     es
        mov     ax, word ptr [A_8740]
        pop     bp
        ret
fn_35d87:
        push    bp
        mov     bp, sp
        push    es
        push    70h
        push    word ptr [bp + 6]
        push    word ptr [bp + 4]
        push    1
        call    fn_35915
        add     sp, 8
        pop     es
        push    es
        push    1
        push    word ptr [bp + 6]
        push    word ptr [bp + 4]
        push    word 0
        push    word A_8748
        push    cs
        call    far_359a4
        add     sp, 0ah
        pop     es
        mov     ax, word ptr [A_8748]
        pop     bp
        ret
far_35db8:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        push    es
        push    word ptr [bp + 10h]
        push    word ptr [bp + 0eh]
        push    cs
        call    far_35df7
        add     sp, 4
        pop     es
        or      ax, ax
        jz      br_35df1
        mov     es, ax
        mov     ax, word ptr [bp + 12h]
        add     ax, 60h
        mov     word ptr es:[16h], ax
        mov     dx, word ptr [bp + 14h]
        adc     dx, word ptr [A_875A]
        mov     word ptr es:[18h], dx
br_35df1:
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
far_35df7:
        push    ds
        push    es
        push    si
        push    di
        push    bp
        mov     bp, sp
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        mov     cx, word ptr [A_72F6]
        jcxz    br_35e3a
        mov     si, word ptr [A_72F4]
        add     si, si
        add     si, A_B1B0
        mov     ax, word ptr [bp + 0eh]
        add     ax, 60h
        mov     dx, word ptr [bp + 10h]
        adc     dx, word ptr [A_875A]
loop_35e22:
        mov     es, word ptr [si]
        cmp     word ptr es:[18h], dx
        jnz     br_35e36
        cmp     word ptr es:[16h], ax
        jnz     br_35e36
        mov     ax, es
        jmp     br_35e3d
br_35e36:
        inc     si
        inc     si
        loop    loop_35e22
br_35e3a:
        mov     ax, 0
br_35e3d:
        pop     bp
        pop     di
        pop     si
        pop     es
        pop     ds
        retf
fn_35e43:
        pusha
        add     si, word ptr [A_8758]
        add     di, word ptr [A_875A]
        mov     word ptr [A_7774], di
        mov     word ptr [A_7772], si
        mov     si, dx
        mov     dx, cx
        mov     cx, bx
        callf   SEG_INT_01:far_260de
        popa
        ret
fn_35e61:
        shr     ax, 4
        mov     word ptr [A_8772], ax
        mov     dx, 1c24h
        callf   SEG_INT_01:far_2b3b4
        shl     ax, 5
        callf   SEG_INT_01:far_34532
        mov     word ptr [A_8768], 0
        mov     word ptr [A_876A], 0
        mov     word ptr [A_8786], 0
        sub     al, al
        mov     bx, word ptr [A_8772]
br_35e8f:
        dec     bx
        js      br_35e98
        mov     byte ptr [bx - A_788A], al
        jmp     br_35e8f
br_35e98:
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        mov     al, byte ptr [A_7229]
        and     al, 0fch
        or      al, 3
        elseif  (XL) && (MODEL = 3200)
        in      al, 0c4h
        or      al, 8
        out     0c4h, al
        in      al, 0c0h
        or      al, 80h
        endif
        if      (XL) && (FW_VERSION >= 150)
        out     0c0h, al
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        mov     byte ptr [A_7229], al
        endif
        if      (XL) && (FW_VERSION >= 150)
        mov     ax, word ptr [A_8768]
        mov     word ptr [A_876C], ax
        mov     ax, word ptr [A_876A]
        mov     word ptr [A_876E], ax
        mov     ax, word ptr [A_8772]
        mov     word ptr [A_8770], ax
loop_35eb6:
        push    es
        push    word 0d0h
        push    word 0a7h
        push    word ptr [A_876E]
        push    word ptr [A_876C]
        push    2
        call    fn_35915
        add     sp, 0ah
        pop     es
        add     word ptr [A_876E], 10h
        dec     word ptr [A_8770]
        jnz     loop_35eb6
br_35ed9:
        mov     ax, word ptr [A_8768]
        mov     word ptr [A_876C], ax
        mov     ax, word ptr [A_876A]
        mov     word ptr [A_876E], ax
        mov     word ptr [A_8774], 0
        mov     ax, word ptr [A_8772]
        mov     word ptr [A_8770], ax
loop_35ef1:
        call    fn_35f56
        cmp     ax, 20h
        jz      br_35eff
        mov     word ptr [A_8774], 1
br_35eff:
        mov     bx, word ptr [A_8770]
        dec     bx
        mov     byte ptr [bx - A_788A], al
        sub     ax, ax
        mov     bx, word ptr [A_8772]
br_35f0e:
        dec     bx
        js      br_35f1a
        add     al, byte ptr [bx - A_788A]
        adc     ah, 0
        jmp     br_35f0e
br_35f1a:
        push    ax
        mov     dx, 1324h
        callf   SEG_INT_01:far_2b3b4
        pop     ax
        callf   SEG_INT_01:far_34532
        add     word ptr [A_876E], 10h
        dec     word ptr [A_8770]
        jnz     loop_35ef1
        cmp     word ptr [A_8774], 0
        jz      br_35f3d
        jmp     br_35ed9
br_35f3d:
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        mov     al, byte ptr [A_7229]
        and     al, 0fch
        or      al, 0
        out     0c0h, al
        mov     byte ptr [A_7229], al
        mov     al, byte ptr [A_7229]
        and     al, 0fch
        or      al, 2
        out     0c0h, al
        mov     byte ptr [A_7229], al
        elseif  (XL) && (MODEL = 3200)
        push    cs
        call    far_358fc
        endif
        if      (XL) && (FW_VERSION >= 150)
        ret
fn_35f56:
        mov     ax, word ptr [A_876C]
        mov     word ptr [A_8788], ax
        mov     ax, word ptr [A_876E]
        mov     word ptr [A_878A], ax
        inc     word ptr [A_8788]
        mov     word ptr [A_8790], 0
        mov     word ptr [A_878C], 20h
        push    es
        push    71h
        push    word ptr [A_878A]
        push    word ptr [A_8788]
        push    1
        call    fn_35915
        add     sp, 8
        pop     es
loop_35f86:
        push    es
        push    1
        push    word ptr [A_878A]
        push    word ptr [A_8788]
        push    word 0
        push    word A_878E
        push    cs
        call    far_359a4
        add     sp, 0ah
        pop     es
        test    word ptr [A_878E], 80h
        jz      br_35fab
        inc     word ptr [A_8790]
br_35fab:
        add     word ptr [A_8788], 8000h
        adc     word ptr [A_878A], 0
        dec     word ptr [A_878C]
        jnz     loop_35f86
        mov     ax, word ptr [A_8790]
        ret
far_35fc0:
        mov     dl, al
        and     dl, 7fh
        mov     dh, byte ptr [A_7D55]
br_35fc9:
        mov     ax, word ptr [A_875C]
        inc     ax
        cmp     ax, word ptr [A_7F58]
        jc      br_35fd5
        stc
        retf
br_35fd5:
        mov     word ptr [A_875C], ax
        mov     si, 18h
        push    dx
        mul     si
        pop     dx
        push    ds
        mov     si, A_3A60
        mov     ds, si
        mov     si, 62aah
        add     si, ax
        or      dh, dh
        jz      br_3600e
        mov     cl, byte ptr [si + 10h]
        and     cl, 7fh
        cmp     dl, cl
        jnz     br_36011
        cmp     dh, 2
        jnz     br_3600e
        push    si
        add     si, 0
        mov     di, word ptr es:[A_7D56]
        mov     cx, 0ch
        repe cmpsb
        pop     si
        jnz     br_36011
br_3600e:
        pop     ds
        clc
        retf
br_36011:
        pop     ds
        jmp     br_35fc9
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (FW_VERSION < 150)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      XL
        db      " Can't FIND from Floppy !"
        elseif  (XL = 0) && (MODEL = 3000)
        db      "FX  RVB ", 0
        db      "FLT1 FLT2 ENV1 ENV2 ENV3 TONEFILT      ENV1 env1 ENV2 env2FLT1 FLT2 ENV1 ENV2 ENV3 env1FLT1 FLT2 ENV1 ENV2 ENV3 env2  DD"
        db      08ah, 000h
        db      ".* Direct-to-disk RecordingMO drive:"
        db      0e5h, 00ah, 02ah, 000h, 005h, 000h, 0f2h, 01dh, 051h, 000h, 01dh, 000h, 075h, 01eh, 051h, 000h
        db      01dh, 000h, 0e5h, 022h, 051h, 000h, 01dh, 000h, 0fch, 01eh, 051h, 000h, 01dh, 000h, 08bh, 023h
        db      051h, 000h, 01dh, 000h, 00dh, 00eh, 02ah, 000h, 005h, 000h, 0b1h, 00eh, 02ah, 000h, 005h, 000h
        db      053h, 00fh, 02ah, 000h, 005h, 000h, 0f9h, 00fh, 02ah, 000h, 005h, 000h, 088h, 00bh, 02ah, 000h
        db      005h, 000h, 0e2h, 00bh, 02ah, 000h, 005h, 000h, 0e5h, 00ah, 02fh, 000h, 005h, 000h, 0f2h, 01dh
        db      034h, 000h, 01dh, 000h, 075h, 01eh, 06eh, 000h, 01dh, 000h, 0e5h, 022h, 06eh, 000h, 01dh, 000h
        db      0fch, 01eh, 08bh, 000h, 01dh, 000h, 08bh, 023h, 08bh, 000h, 01dh, 000h, 00dh, 00eh, 02fh, 000h
        db      005h, 000h, 0b1h, 00eh, 02fh, 000h, 005h, 000h, 053h, 00fh, 02fh, 000h, 005h, 000h, 0f9h, 00fh
        db      02fh, 000h, 005h, 000h, 088h, 00bh, 02fh, 000h, 005h, 000h, 0e2h, 00bh, 02fh, 000h, 005h, 000h
        endif
        if      (XL = 0) && (FW_VERSION >= 200)
        db      000h, 000h, 001h, 000h, 012h, 000h, 007h, 0b7h, 0ech, 000h, 007h, 001h, 000h, 012h, 000h, 007h
        db      0b7h, 0ech, 000h, 008h, 001h, 000h, 012h, 000h, 007h, 0b7h, 0ech, 000h, 009h, 001h, 000h, 012h
        db      000h, 007h, 0b7h, 0ech, 000h, 00ah, 001h, 000h, 012h, 000h, 007h, 0b7h, 0ech, 000h, 002h, 001h
        db      000h, 012h, 000h, 007h, 0b7h, 0ech, 000h, 003h, 001h, 000h, 012h, 000h, 007h, 0b7h, 0ech, 002h
        db      006h, 004h, 000h, 009h, 000h, 01dh, 08ch, 001h, 00fh, 000h, 00fh, 0dah, 008h, 012h, 000h, 008h
        db      0dah, 008h, 015h, 000h, 010h, 0dah, 008h, 002h, 007h, 004h, 000h, 009h, 000h, 01dh, 08ch, 001h
        db      00fh, 000h, 00fh, 0dah, 008h, 012h, 000h, 008h, 0dah, 008h, 015h, 000h, 010h, 0dah, 008h, 002h
        db      00fh, 004h, 000h, 009h, 000h, 01dh, 08ch, 001h, 00fh, 000h, 00fh, 0dah, 008h, 012h, 000h, 008h
        db      0dah, 008h, 015h, 000h, 010h, 0dah, 008h, 002h, 008h, 003h, 000h, 009h, 000h, 01dh, 08ch, 001h
        db      00fh, 000h, 00fh, 0dah, 008h, 012h, 000h, 008h, 0dah, 008h, 002h, 010h, 003h, 000h, 009h, 000h
        db      01dh, 08ch, 001h, 00fh, 000h, 00fh, 0dah, 008h, 012h, 000h, 008h, 0dah, 008h, 004h, 000h, 001h
        elseif  (XL = 0) && (FW_VERSION = 150)
        db      000h, 000h, 001h, 000h, 012h, 000h, 007h, 0a7h, 0ech, 000h, 007h, 001h, 000h, 012h, 000h, 007h
        db      0a7h, 0ech, 000h, 008h, 001h, 000h, 012h, 000h, 007h, 0a7h, 0ech, 000h, 009h, 001h, 000h, 012h
        db      000h, 007h, 0a7h, 0ech, 000h, 00ah, 001h, 000h, 012h, 000h, 007h, 0a7h, 0ech, 000h, 002h, 001h
        db      000h, 012h, 000h, 007h, 0a7h, 0ech, 000h, 003h, 001h, 000h, 012h, 000h, 007h, 0a7h, 0ech, 002h
        db      006h, 004h, 000h, 009h, 000h, 01dh, 08ch, 001h, 00fh, 000h, 00fh, 0e1h, 008h, 012h, 000h, 008h
        db      0e1h, 008h, 015h, 000h, 010h, 0e1h, 008h, 002h, 007h, 004h, 000h, 009h, 000h, 01dh, 08ch, 001h
        db      00fh, 000h, 00fh, 0e1h, 008h, 012h, 000h, 008h, 0e1h, 008h, 015h, 000h, 010h, 0e1h, 008h, 002h
        db      00fh, 004h, 000h, 009h, 000h, 01dh, 08ch, 001h, 00fh, 000h, 00fh, 0e1h, 008h, 012h, 000h, 008h
        db      0e1h, 008h, 015h, 000h, 010h, 0e1h, 008h, 002h, 008h, 003h, 000h, 009h, 000h, 01dh, 08ch, 001h
        db      00fh, 000h, 00fh, 0e1h, 008h, 012h, 000h, 008h, 0e1h, 008h, 002h, 010h, 003h, 000h, 009h, 000h
        db      01dh, 08ch, 001h, 00fh, 000h, 00fh, 0e1h, 008h, 012h, 000h, 008h, 0e1h, 008h, 004h, 000h, 001h
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      000h, 009h, 000h, 017h, 08ch, 001h, 002h, 006h, 001h, 000h, 005h, 000h, 043h, 002h, 007h, 001h
        db      000h, 005h, 000h, 043h, 002h, 00fh, 003h, 000h, 005h, 000h, 043h, 007h, 000h, 045h, 009h, 000h
        db      027h, 002h, 008h, 003h, 000h, 005h, 000h, 043h, 007h, 000h, 025h, 008h, 000h, 046h, 002h, 010h
        db      001h, 000h, 005h, 000h, 043h, 004h, 000h, 001h, 000h, 005h, 000h, 043h, 000h, 000h, 001h, 000h
        endif
        if      (XL = 0) && (FW_VERSION >= 200)
        db      012h, 000h, 006h, 0dah, 008h, 000h, 007h, 001h, 000h, 012h, 000h, 006h, 0dah, 008h, 000h, 008h
        db      001h, 000h, 012h, 000h, 006h, 0dah, 008h, 000h, 009h, 001h, 000h, 012h, 000h, 006h, 0dah, 008h
        db      000h, 00ah, 001h, 000h, 012h, 000h, 006h, 0dah, 008h, 000h, 002h, 001h, 000h, 012h, 000h, 006h
        db      0dah, 008h, 000h, 003h, 001h, 000h, 012h, 000h, 006h, 0dah, 008h, 002h, 006h, 004h, 000h, 009h
        db      000h, 017h, 0dah, 008h, 00fh, 000h, 008h, 0dah, 008h, 012h, 000h, 015h, 0dah, 008h, 015h, 000h
        db      018h, 0dah, 008h, 002h, 007h, 004h, 000h, 009h, 000h, 017h, 0dah, 008h, 00fh, 000h, 008h, 0dah
        db      008h, 012h, 000h, 015h, 0dah, 008h, 015h, 000h, 00fh, 0dah, 008h, 002h, 00fh, 004h, 000h, 009h
        db      000h, 017h, 0dah, 008h, 00fh, 000h, 008h, 0dah, 008h, 012h, 000h, 015h, 0dah, 008h, 015h, 000h
        db      00fh, 0dah, 008h, 002h, 008h, 003h, 000h, 009h, 000h, 017h, 0dah, 008h, 00fh, 000h, 008h, 0dah
        db      008h, 012h, 000h, 015h, 0dah, 008h, 002h, 010h, 003h, 000h, 009h, 000h, 017h, 0dah, 008h, 00fh
        db      000h, 008h, 0dah, 008h, 012h, 000h, 015h, 0dah, 008h, 004h, 000h, 001h, 000h, 009h, 000h, 00dh
        db      0dah, 008h, 002h, 006h, 001h, 000h, 005h, 000h, 023h, 002h, 007h, 001h, 000h, 005h, 000h, 023h
        elseif  (XL = 0) && (FW_VERSION = 150)
        db      012h, 000h, 006h, 0e1h, 008h, 000h, 007h, 001h, 000h, 012h, 000h, 006h, 0e1h, 008h, 000h, 008h
        db      001h, 000h, 012h, 000h, 006h, 0e1h, 008h, 000h, 009h, 001h, 000h, 012h, 000h, 006h, 0e1h, 008h
        db      000h, 00ah, 001h, 000h, 012h, 000h, 006h, 0e1h, 008h, 000h, 002h, 001h, 000h, 012h, 000h, 006h
        db      0e1h, 008h, 000h, 003h, 001h, 000h, 012h, 000h, 006h, 0e1h, 008h, 002h, 006h, 004h, 000h, 009h
        db      000h, 017h, 0e1h, 008h, 00fh, 000h, 008h, 0e1h, 008h, 012h, 000h, 015h, 0e1h, 008h, 015h, 000h
        db      018h, 0e1h, 008h, 002h, 007h, 004h, 000h, 009h, 000h, 017h, 0e1h, 008h, 00fh, 000h, 008h, 0e1h
        db      008h, 012h, 000h, 015h, 0e1h, 008h, 015h, 000h, 00fh, 0e1h, 008h, 002h, 00fh, 004h, 000h, 009h
        db      000h, 017h, 0e1h, 008h, 00fh, 000h, 008h, 0e1h, 008h, 012h, 000h, 015h, 0e1h, 008h, 015h, 000h
        db      00fh, 0e1h, 008h, 002h, 008h, 003h, 000h, 009h, 000h, 017h, 0e1h, 008h, 00fh, 000h, 008h, 0e1h
        db      008h, 012h, 000h, 015h, 0e1h, 008h, 002h, 010h, 003h, 000h, 009h, 000h, 017h, 0e1h, 008h, 00fh
        db      000h, 008h, 0e1h, 008h, 012h, 000h, 015h, 0e1h, 008h, 004h, 000h, 001h, 000h, 009h, 000h, 00dh
        db      0e1h, 008h, 002h, 006h, 001h, 000h, 005h, 000h, 023h, 002h, 007h, 001h, 000h, 005h, 000h, 023h
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      002h, 00fh, 003h, 000h, 005h, 000h, 023h, 007h, 000h, 025h, 009h, 000h, 047h, 002h, 008h, 003h
        db      000h, 005h, 000h, 023h, 007h, 000h, 045h, 008h, 000h, 026h, 002h, 010h, 001h, 000h, 005h, 000h
        db      023h, 004h, 000h, 001h, 000h, 005h, 000h, 023h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL = 0) && (MODEL = 3200)
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      XL = 0
        db      "OK      "
        endif
        db      0ffh
        if      XL
        db      " Multi-effects board EB16 not fitted"
        db      0ffh, 000h
        db      "NO SAMPLES IN MEMORY !"
        else
        db      "SHORTED ADDR?"
        endif
        db      0ffh
        if      XL
        db      "CAN'T DELETE LAST PROGRAM !"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      "sample length too short to record"
        else
        db      "R/W ERRORS   "
        endif
        db      0ffh
        if      XL
        db      " New sample length too short"
        else
        db      "NO CARD ?    "
        endif
        db      0ffh
        if      XL
        db      "joined sample can't be A or B"
        else
        db      "NOT TESTED   "
        endif
        db      0ffh
        if      XL
        db      "operation complete"
        else
        db      "testing "
        endif
        db      0ffh
        if      XL
        db      "complete....CLIPPING OCCURRED !!"
        else
        db      "1Mwrd"
        endif
        db      0ffh
        if      XL
        db      "time-stretch in progress .......   ABORT"
        db      0ffh
        db      "  STRETCH ABORTED"
        db      0ffh, 000h, 000h, 000h, 000h
        db      "!! NO DIGITAL INTERFACE !!"
        db      0ffh
        db      "transmitting memory back-up..."
        db      0ffh
        db      "transmitting hard disk back-up..."
        db      0ffh
        db      "not enough space for sample !"
        db      0ffh
        db      "back-up restore aborted"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      "ME-35T MIDI IN & OUT MUST BE CONNECTED!"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      " *** RECEIVING MIDI EXCLUSIVE DATA ***  "
        db      0ffh
        db      "** transmitting midi data **  ABORT"
        db      0ffh, 000h, 000h, 000h
        db      " Not available for floppy !"
        db      0ffh
        db      " 2nd filter board IB304F not fitted !"
        db      0ffh
        db      " Stereo samples of different lengths !"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      "Different floppy disk format - retrying"
        db      0ffh
        db      " FLOPPY DIRECTORY NOW EMPTY !"
        db      0ffh
        db      "Foreign disk"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      XL
        db      " INSUFFICIENT WAVEFORM MEMORY !"
        db      0ffh
        db      " S900 DISK ! use only for reading"
        db      0ffh
        db      " CURSOR IS ON THE WRONG TYPE !"
        db      0ffh
        db      "deleting files..."
        db      0ffh
        db      " save continuation aborted"
        db      0ffh
        db      " NO SYSTEM IN THIS VOLUME"
        db      0ffh
        db      " No MULTI -don't know what to load!!"
        db      0ffh
        db      " Wrong type of FX file!!"
        db      0ffh
        db      "BAD DISK PROGRAM! - Not loaded"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      " waiting for hard disk ready.. SKIP"
        db      0ffh
        db      " park command complete"
        db      0ffh
        db      " VOLUME IS NOW EMPTY"
        db      0ffh
        db      " FORMATTING HARD DISK..."
        db      0ffh
        db      " marking bad hard blocks...    SKIP"
        db      0ffh
        db      "pre-erasing MO partition - please wait"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      "waiting for take from DAT....      ABORT"
        db      0ffh
        db      "ABORTED - bad digital input"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      "Searching Directory . ."
        db      0ffh
        db      " Can't write tags to CD-ROM disks !"
        db      0ffh
        db      " Unable to search this disk . ."
        db      0ffh, 000h, 000h, 000h, 000h
        db      "No Flash ROM fitted!"
        db      0ffh
        db      "ERROR - Flash ROM is not formatted!"
        db      0ffh
        db      "Warning - Flash jumpers incorrectly set"
        db      0ffh
        db      "Flash ROM found    MW fitted"
        db      0ffh
        db      "BUSY - DO NOT POWER-OFF!! "
        db      0ffh
        db      "cannot delete loaded flash sample"
        db      0ffh
        db      "Flash ROM format completed."
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      XL
        db      " ON  $"
        db      022h, 04fh, 046h, 046h, 022h
        db      "$ OFF $VEL=$ALL NOTES OFF  $PITCH WHEEL $MOD. WHEEL  $LOUDNESS    $SUSTAIN PED.$SOFT PEDAL  $SOSTENUTO   $PROGRAM     $PRESSURE    $EXT.CONTROL $PAN POT     $FX DEPTH    $"
        db      08ah, 0d8h
        db      "8off"
        db      0ffh, 08ah, 0d5h
        db      "8 ON "
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      "    DISK IS READY FOR USE               "
        db      0ffh
        db      "WARNING !! OK BUT DISK MAY BE UNRELIABLE"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      " HARD DISK EMPTY...space for DD=     Mb "
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 081h, 083h, 08ch, 06ah, 055h, 009h
        db      "Internal Error - "
        db      0ffh, 08ah, 006h
        db      "&Please tell Richard the operations that"
        db      08ah, 00ch
        db      "/you performed to reach this state"
        db      08ah, 018h
        db      "9Press F8 to continue"
        db      082h, 0ffh, 08dh, 01bh, 001h, 019h, 08ch, 01bh, 09eh, 01ah, 08fh, 05bh, 093h, 01fh, 001h, 015h
        db      093h, 01fh, 09fh, 015h, 092h, 09eh, 001h, 033h, 092h, 09eh, 001h, 015h, 0ffh
        elseif  (XL) && (FW_VERSION < 150)
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 08dh, 01bh, 001h, 019h, 08ch, 01bh, 09eh, 01ah
        db      08fh, 05bh, 093h, 01fh, 001h, 015h, 093h, 01fh, 09fh, 015h, 092h, 09eh, 001h, 033h, 092h, 09eh
        db      001h, 015h, 0ffh
        else
        db      "4Mwrd"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 081h, 083h, 08ch, 06ah, 049h
        db      009h
        db      "Softkey help"
        db      08ah, 00ah, 00ah
        db      "This softkey "
        db      0ffh, 083h, 08ch, 06ah, 055h, 009h
        db      "Parameter help"
        db      08ah, 00ah, 00ah
        db      "This parameter "
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c0h, 040h, 083h, 0a7h, 000h, 000h, 000h, 000h
        db      0c1h, 041h, 0ach, 0adh, 000h, 000h, 000h, 000h, 0c2h, 042h, 087h, 084h, 000h, 000h, 000h, 000h
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      0c3h, 043h, 088h, 085h, 000h, 000h, 000h, 000h, 0c4h, 044h, 089h, 086h, 000h, 000h, 000h, 000h
        db      0c5h, 045h, 0aah, 0abh, 000h, 000h, 000h, 000h, 0c6h, 046h, 082h, 0a6h, 000h, 000h, 000h, 000h
        elseif  (XL = 0) && (MODEL = 3200)
        db      0c3h, 043h, 088h, 085h, 000h, 000h, 000h, 000h, 0c5h, 044h, 089h, 086h, 000h, 000h, 000h, 000h
        db      0c6h, 045h, 0aah, 0abh, 000h, 000h, 000h, 000h, 0c4h, 046h, 082h, 0a6h, 000h, 000h, 000h, 000h
        endif
        if      XL = 0
        db      0c7h, 047h, 081h, 080h, 000h, 000h, 000h, 000h, 048h, 040h, 058h, 08ah, 000h, 000h, 000h, 000h
        db      049h, 041h, 0ach, 0adh, 000h, 000h, 000h, 000h
        db      "JBPS", 0
        db      000h, 000h, 000h
        db      "KCQT", 0
        db      000h, 000h, 000h
        db      "LDRU", 0
        db      000h, 000h, 000h, 04dh, 045h, 0a5h, 0a8h, 000h, 000h, 000h, 000h, 04eh, 046h, 057h, 0a9h, 000h
        db      000h, 000h, 000h
        db      "OGVY", 0
        db      000h, 000h, 000h, 08ah, 040h, 083h, 0a7h, 000h, 000h, 000h, 000h, 08bh, 041h, 0ach, 0adh, 000h
        db      000h, 000h, 000h, 08ch, 042h, 087h, 084h, 000h, 000h, 000h, 000h, 08dh, 043h, 088h, 085h, 000h
        db      000h, 000h, 000h, 08eh, 044h, 089h, 086h, 000h, 000h, 000h, 000h, 08fh, 045h, 0a5h, 0a8h, 000h
        db      000h, 000h, 000h, 080h, 046h, 082h, 0a6h, 000h, 000h, 000h, 000h, 080h, 047h, 081h, 080h, 000h
        db      000h, 000h, 000h, 08bh, 003h, 001h, 088h, 006h, 002h, 001h, 002h, 001h, 002h, 001h, 002h, 001h
        db      002h, 001h, 002h, 001h, 002h, 001h, 002h, 001h, 002h, 001h, 083h, 086h, 0ffh, 087h, 020h, 003h
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      020h, 020h, 003h, 086h, 0ffh, 087h, 020h, 020h, 003h, 086h, 0ffh
        db      "-NO PROGRAM-"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 08dh, 01bh, 001h, 019h
        db      08ch, 01bh, 09eh, 01ah, 08fh, 05bh, 093h, 01fh, 001h, 015h, 093h, 01fh, 09fh, 015h, 092h, 09eh
        db      001h, 033h, 092h, 09eh, 001h, 015h, 0ffh
        elseif  (XL = 0) && (MODEL = 3200)
        db      020h, 020h, 003h, 086h, 0ffh, 087h, 020h, 020h, 003h, 086h, 0ffh, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 08dh, 01bh, 001h, 019h, 08ch, 01bh, 09eh, 01ah, 08fh, 05bh, 093h, 01fh, 001h
        db      015h, 093h, 01fh, 09fh, 015h, 092h, 09eh, 001h, 033h, 092h, 09eh, 001h, 015h, 0ffh
        endif
        db      "no board present"
        db      0ffh, 081h, 083h
        db      "Testing Memory..."
        if      XL = 0
        db      08ah, 000h, 00ah
        db      "slot 1.."
        db      08ah, 000h, 013h
        db      "slot 2.."
        db      08ah, 000h, 01ch
        db      "slot 3.."
        db      08ah, 000h
        db      "%slot 4.."
        endif
        db      082h, 0ffh
        db      "okay"
        db      0ffh
        db      "FAILED!!!"
        db      0ffh
        if      XL
        db      "testing XX Mword"
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      0ffh, 08ah, 0b7h, 038h, 020h, 020h, 020h, 020h, 08ah, 0b7h, 038h, 000h, 04dh, 06fh, 06eh, 0ffh
        db      08ah, 0b7h
        elseif  (XL) && (FW_VERSION < 150)
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      08ah, 0b7h, 038h, 020h, 020h, 020h, 020h, 08ah, 0b7h, 038h, 000h, 04dh, 06fh, 06eh, 0ffh, 08ah
        db      0b7h
        endif
        if      XL
        db      "8Moff"
        else
        db      "testing "
        endif
        if      (XL = 0) || ((XL) && (FW_VERSION >= 150))
        db      0ffh
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      "record time"
        db      0ffh, 08dh, 01bh, 009h, 014h, 08ch, 01bh, 0e6h, 021h, 08fh, 05bh, 0ffh, 08dh, 01bh, 009h, 014h
        db      08ch, 01bh, 073h, 021h, 08fh, 05bh, 0ffh, 08dh, 01bh, 07fh, 014h, 08ch, 01bh, 070h, 021h, 08fh
        db      05bh, 0ffh, 08dh, 01eh, 009h, 014h, 08ch, 01eh, 0e6h, 009h, 08fh, 05eh, 0ffh, 03eh, 03eh, 020h
        db      031h, 030h, 030h, 025h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 08ch, 06ah
        db      06dh, 009h
        elseif  XL = 0
        db      "M DRAM..."
        db      0ffh
        db      "M SRAM..."
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      0ffh, 0aah, 005h, 000h, 0b2h, 005h, 001h, 0d2h, 006h, 002h, 04eh, 007h, 004h, 08eh, 007h, 005h
        db      0aah, 007h, 006h, 0aeh, 007h, 00ch, 0c6h, 007h, 010h, 0cah, 007h, 010h, 0cah, 007h, 010h, 0cah
        endif
        if      (XL = 0) && (FW_VERSION >= 200)
        db      007h, 010h, 08fh, 071h, 0fah, 00bh, 08fh
        db      "qy.ins"
        db      09fh, 072h, 078h, 0c3h, 037h, 08dh, 06dh, 073h, 09fh, 06eh, 06eh, 0c3h, 037h, 070h, 06eh, 0a9h
        db      09fh, 0b0h, 075h, 0c3h, 037h, 06ah, 06eh, 0c0h, 0a4h, 06ah, 06eh, 0a7h, 0a4h, 06ah, 06eh, 0ach
        db      0a2h, 06ah, 06eh, 08bh, 0a2h, 06bh, 06eh, 0b6h, 0a7h, 083h, 06eh, 097h, 0cbh, 084h, 06dh, 004h
        db      0e6h, 085h, 06dh, 0c3h, 037h, 00eh, 06fh, 05eh, 0cbh, 09dh, 06dh, 0a0h, 002h, 0a1h, 075h, 0c3h
        db      037h, 09eh, 06dh, 0a4h, 0ech, 0d0h, 072h, 0c3h, 037h, 0c0h, 07dh, 0c3h, 037h, 05ch, 06ch, 0c3h
        db      037h, 0cbh, 07eh, 0c3h, 037h, 08fh, 06dh, 0c3h, 037h, 040h, 06fh, 0eeh
        db      "6@oO7"
        db      087h, 06dh, 0c3h, 037h, 088h, 06dh, 0c3h, 037h, 08bh, 06dh, 0a4h, 063h, 010h, 06dh, 0c3h, 037h
        db      01ch, 06dh, 0fch, 03dh, 01dh, 06dh, 0c3h, 037h, 060h, 06dh, 0c3h, 037h, 0d9h, 07eh, 0c3h, 037h
        db      00fh, 06dh, 0c3h, 037h, 011h, 06dh, 0c3h, 037h, 012h, 06dh, 0c3h, 037h, 065h, 06dh, 0c3h, 037h
        db      099h, 06dh, 0c3h, 037h, 093h, 06dh, 0a2h, 07bh, 063h, 06dh, 0c3h, 037h, 064h, 06dh, 0c3h, 037h
        db      067h, 06dh, 0c3h, 037h, 078h, 06dh, 0c3h, 037h, 086h, 06dh, 05fh, 0d9h, 08ch, 06dh, 0c3h, 037h
        db      092h, 06dh, 0c3h, 037h, 015h, 06fh, 0c3h, 037h, 0ceh, 07eh, 0c3h, 037h, 0dah, 07eh, 0c3h, 037h
        db      0c8h, 06eh, 0c3h, 037h, 00eh, 06dh, 0c3h, 037h, 062h, 06dh, 0c3h, 037h, 054h, 07eh, 0c3h, 037h
        db      0d5h, 07eh, 0c3h, 037h, 061h, 06dh, 0c3h, 037h, 098h, 06dh, 0c3h, 037h, 09ah, 06dh, 0c3h, 037h
        db      05fh, 06dh, 0c3h, 037h, 0d8h, 07eh, 0c3h, 037h, 0dah, 06eh, 0c3h, 037h, 013h, 06dh, 0d8h, 043h
        db      00ch, 06fh, 0c3h, 037h, 07eh, 06dh, 0c3h, 037h, 07fh, 06dh, 0c3h, 037h, 09ch, 06dh, 0c3h, 037h
        db      09bh, 06dh, 0c3h, 037h, 090h, 06dh, 0c3h, 037h, 043h, 06dh, 0c3h, 037h, 044h, 06dh, 0c3h, 037h
        db      0d6h, 07eh, 0c3h, 037h, 084h, 06eh, 030h, 02eh, 094h, 06dh, 0c3h, 037h, 071h, 06eh, 0c3h, 037h
        db      073h, 06eh, 0c3h, 037h, 00ch, 078h, 0c3h, 037h, 010h, 078h, 0c3h, 037h, 00eh, 078h, 0c3h, 037h
        db      00ah, 078h, 0c3h, 037h, 075h, 06eh, 0c3h, 037h, 077h, 06eh, 0c3h, 037h, 004h, 06dh, 0c3h, 037h
        db      006h, 06dh, 0c3h, 037h, 008h, 06dh, 0c3h, 037h, 0d6h, 06eh, 0c3h, 037h, 07eh, 06eh, 0c3h, 037h
        db      0e4h, 077h, 0c3h, 037h, 0e2h, 077h, 0c3h, 037h, 0c6h, 06eh, 086h, 008h, 082h, 06dh, 0c3h, 037h
        db      0d0h, 06eh, 0c3h, 037h, 0d4h, 06eh, 0c3h, 037h, 027h, 06dh, 0d6h, 03eh, 029h, 06dh, 019h, 03fh
        db      081h, 06eh, 0c3h, 037h, 074h, 06dh, 0c3h, 037h, 076h, 06dh, 0c3h, 037h, 0d2h, 07dh, 0c3h, 037h
        db      0e1h, 07eh, 0c3h, 037h, 0d2h, 06eh, 0c3h, 037h, 07ah, 06dh, 0c3h, 037h, 064h, 07bh, 0c3h, 037h
        db      080h, 06dh, 0c3h, 037h, 056h, 07eh, 0c3h, 037h, 064h, 072h, 0c5h
        db      "7drF:drJ9dr"
        db      0e2h, 038h, 01fh, 06dh, 0c3h, 037h, 033h, 06dh, 0c3h, 037h, 037h, 06dh, 0c3h, 037h, 03bh, 06dh
        db      0c3h, 037h, 03fh, 06dh, 0c3h, 037h, 045h, 06dh, 0c3h, 037h, 068h, 06dh, 0c3h, 037h, 06ch, 06dh
        db      0c3h
        db      "7dr'Jhr'J"
        db      014h, 06dh, 0c3h, 037h, 018h, 06dh, 0c3h, 037h, 0c5h, 07dh, 0c3h, 037h, 0a3h, 07eh, 0c3h, 037h
        db      0a8h, 07eh, 0c3h, 037h, 0adh, 07eh, 0c3h, 037h, 0b2h, 07eh, 0c3h, 037h, 0b7h, 07eh, 0c3h, 037h
        db      01ah, 06fh, 036h, 0f0h, 0dch, 07dh, 0c3h, 037h, 0d8h, 0d2h, 0c3h, 037h, 0cah, 06dh, 0c3h, 037h
        db      085h, 06eh, 0c3h, 037h, 091h, 06eh, 0c3h, 037h, 073h, 080h, 0c3h, 037h, 010h, 07eh, 0c3h, 037h
        db      057h, 073h, 0c3h, 037h, 028h, 076h, 09ch, 09eh, 093h, 071h, 09ch, 09eh, 06eh, 07bh, 020h, 0cfh
        elseif  (XL = 0) && (FW_VERSION = 150)
        db      007h, 010h, 08fh, 071h, 0f8h, 00bh, 08fh, 071h, 089h, 02eh, 069h, 06eh, 093h, 09fh, 072h, 078h
        db      0d3h, 037h, 08dh, 06dh, 093h, 09fh, 06eh, 06eh, 0d3h, 037h, 070h, 06eh, 0c9h, 09fh, 0b0h, 075h
        db      0d3h, 037h, 06ah, 06eh, 0e0h, 0a4h, 06ah, 06eh, 0c7h, 0a4h, 06ah, 06eh, 0cch, 0a2h, 06ah, 06eh
        db      0abh, 0a2h, 06bh, 06eh, 0d6h, 0a7h, 083h, 06eh, 0c5h, 0cbh, 084h, 06dh, 0f4h, 0e5h, 085h, 06dh
        db      0d3h, 037h, 00eh, 06fh, 08ch, 0cbh, 09dh, 06dh, 0b1h, 002h, 0a1h, 075h, 0d3h, 037h, 09eh, 06dh
        db      094h, 0ech, 0d0h, 072h, 0d3h, 037h, 010h, 07dh, 0d3h, 037h, 05ch, 06ch, 0d3h, 037h, 01bh, 07eh
        db      0d3h, 037h, 08fh, 06dh, 0d3h, 037h, 040h, 06fh, 0feh, 036h, 040h, 06fh, 05fh, 037h, 087h, 06dh
        db      0d3h, 037h, 088h, 06dh, 0d3h, 037h, 08bh, 06dh, 0b4h, 063h, 010h, 06dh, 0d3h, 037h, 01ch, 06dh
        db      00ch, 03eh, 01dh, 06dh, 0d3h, 037h, 060h, 06dh, 0d3h, 037h, 029h, 07eh, 0d3h, 037h, 00fh, 06dh
        db      0d3h, 037h, 011h, 06dh, 0d3h, 037h, 012h, 06dh, 0d3h, 037h, 065h, 06dh, 0d3h, 037h, 099h, 06dh
        db      0d3h, 037h, 093h, 06dh, 0d3h, 07bh, 063h, 06dh, 0d3h, 037h, 064h, 06dh, 0d3h, 037h, 067h, 06dh
        db      0d3h, 037h, 078h, 06dh, 0d3h, 037h, 086h, 06dh, 04fh, 0d9h, 08ch, 06dh, 0d3h, 037h, 092h, 06dh
        db      0d3h, 037h, 015h, 06fh, 0d3h, 037h, 01eh, 07eh, 0d3h, 037h, 02ah, 07eh, 0d3h, 037h, 0c8h, 06eh
        db      0d3h, 037h, 00eh, 06dh, 0d3h, 037h, 062h, 06dh, 0d3h, 037h, 0a4h, 07dh, 0d3h, 037h, 025h, 07eh
        db      0d3h, 037h, 061h, 06dh, 0d3h, 037h, 098h, 06dh, 0d3h, 037h, 09ah, 06dh, 0d3h, 037h, 05fh, 06dh
        db      0d3h, 037h, 028h, 07eh, 0d3h, 037h, 0dah, 06eh, 0d3h, 037h, 013h, 06dh, 0e8h, 043h, 00ch, 06fh
        db      0d3h, 037h, 07eh, 06dh, 0d3h, 037h, 07fh, 06dh, 0d3h, 037h, 09ch, 06dh, 0d3h, 037h, 09bh, 06dh
        db      0d3h, 037h, 090h, 06dh, 0d3h, 037h, 043h, 06dh, 0d3h, 037h, 044h, 06dh, 0d3h, 037h, 026h, 07eh
        db      0d3h, 037h, 084h, 06eh, 040h, 02eh, 094h, 06dh, 0d3h, 037h, 071h, 06eh, 0d3h, 037h, 073h, 06eh
        db      0d3h, 037h, 00ch, 078h, 0d3h, 037h, 010h, 078h, 0d3h, 037h, 00eh, 078h, 0d3h, 037h, 00ah, 078h
        db      0d3h, 037h, 075h, 06eh, 0d3h, 037h, 077h, 06eh, 0d3h, 037h, 004h, 06dh, 0d3h, 037h, 006h, 06dh
        db      0d3h, 037h, 008h, 06dh, 0d3h, 037h, 0d6h, 06eh, 0d3h, 037h, 07eh, 06eh, 0d3h, 037h, 0e4h, 077h
        db      0d3h, 037h, 0e2h, 077h, 0d3h, 037h, 0c6h, 06eh, 08dh, 008h, 082h, 06dh, 0d3h, 037h, 0d0h, 06eh
        db      0d3h, 037h, 0d4h, 06eh, 0d3h, 037h, 027h, 06dh, 0e6h, 03eh, 029h, 06dh, 029h, 03fh, 081h, 06eh
        db      0d3h, 037h, 074h, 06dh, 0d3h, 037h, 076h, 06dh, 0d3h, 037h, 022h, 07dh, 0d3h, 037h, 031h, 07eh
        db      0d3h, 037h, 0d2h, 06eh, 0d3h, 037h, 07ah, 06dh, 0d3h, 037h, 064h, 07bh, 0d3h, 037h, 080h, 06dh
        db      0d3h, 037h, 0a6h, 07dh, 0d3h, 037h, 064h, 072h, 0d5h
        db      "7drV:drZ9dr"
        db      0f2h, 038h, 01fh, 06dh, 0d3h, 037h, 033h, 06dh, 0d3h, 037h, 037h, 06dh, 0d3h, 037h, 03bh, 06dh
        db      0d3h, 037h, 03fh, 06dh, 0d3h, 037h, 045h, 06dh, 0d3h, 037h, 068h, 06dh, 0d3h, 037h, 06ch, 06dh
        db      0d3h
        db      "7dr7Jhr7J"
        db      014h, 06dh, 0d3h, 037h, 018h, 06dh, 0d3h, 037h, 015h, 07dh, 0d3h, 037h, 0f3h, 07dh, 0d3h, 037h
        db      0f8h, 07dh, 0d3h, 037h, 0fdh, 07dh, 0d3h, 037h, 002h, 07eh, 0d3h, 037h, 007h, 07eh, 0d3h, 037h
        db      01ah, 06fh, 026h, 0f0h, 02ch, 07dh, 0d3h, 037h, 028h, 0d2h, 0d3h, 037h, 0cah, 06dh, 0d3h, 037h
        db      085h, 06eh, 0d3h, 037h, 091h, 06eh, 0d3h, 037h, 0c3h, 07fh, 0d3h, 037h, 060h, 07dh, 0d3h, 037h
        db      057h, 073h, 0d3h, 037h, 028h, 076h, 0bch, 09eh, 093h, 071h, 0bch, 09eh, 06eh, 07bh, 050h, 0cfh
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 08ah, 0b7h, 038h, 020h, 020h, 020h
        db      020h, 08ah, 0b7h, 038h, 000h, 04dh, 06fh, 06eh, 0ffh, 08ah, 0b7h
        elseif  (XL = 0) && (MODEL = 3200)
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 08ah, 0b7h, 038h, 020h, 020h, 020h, 020h, 08ah
        db      0b7h, 038h, 000h, 04dh, 06fh, 06eh, 0ffh, 08ah, 0b7h
        endif
        if      XL = 0
        db      "8Moff"
        endif
        if      (XL = 0) || ((XL) && (FW_VERSION < 150))
        db      0ffh, 081h, 083h, 08ch, 06ah, 055h, 009h
        db      "Internal Error - record time"
        db      08ah, 00ch, 013h
        db      "Please report the operations that you"
        db      08ah, 00ch, 01ch
        db      "performed to reach this state"
        db      08ah, 018h
        db      ".Press F8 to continue"
        db      082h, 0ffh, 08dh, 01bh, 009h, 014h, 08ch, 01bh, 0e6h, 021h, 08fh, 05bh, 0ffh, 08dh, 01bh, 009h
        db      014h, 08ch, 01bh, 073h, 021h, 08fh, 05bh, 0ffh, 08dh, 01bh, 07fh, 014h, 08ch, 01bh, 070h, 021h
        endif
        if      (XL) && (FW_VERSION < 150)
        db      08fh, 05bh, 0ffh, 08dh, 01eh, 009h, 014h, 08ch, 01eh, 0e6h, 009h, 08fh, 05eh, 0ffh, 03eh, 03eh
        db      020h, 031h, 030h, 030h, 025h, 0ffh, 000h, 000h, 08ch, 06ah, 06dh, 009h
        elseif  (XL = 0) && (MODEL = 3000)
        db      08fh, 05bh, 0ffh, 08dh, 01eh, 009h, 014h, 08ch, 01eh, 0e6h, 009h, 08fh, 05eh, 0ffh, 08ah, 0b7h
        db      038h, 01eh, 02dh, 02dh, 03eh, 0ffh, 08ah, 0b7h, 038h, 03ch, 02dh, 02dh, 01fh, 0ffh
        elseif  (XL = 0) && (MODEL = 3200)
        db      08fh, 05bh, 0ffh, 08ah, 0b7h, 038h, 01eh, 02dh, 02dh, 03eh, 0ffh, 08ah, 0b7h, 038h, 03ch, 02dh
        db      02dh, 01fh, 0ffh
        endif
        if      XL = 0
        db      "TIME TO GO 100%"
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 088h, 006h, 007h
        elseif  (XL = 0) && (MODEL = 3200)
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 088h, 006h, 007h
        endif
        if      XL = 0
        db      "WAITING FOR CARRIER"
        db      088h, 006h, 008h, 0ffh, 08dh, 01bh, 00ch, 02eh, 08ch, 01bh, 072h, 007h, 08fh, 05bh, 0ffh, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      " ON  $"
        db      022h, 04fh, 046h, 046h, 022h
        db      "$ OFF $VEL=$ALL NOTES OFF  $PITCH WHEEL $MOD. WHEEL  $LOUDNESS    $SUSTAIN PED.$SOFT PEDAL  $SOSTENUTO   $PROGRAM     $PRESSURE    $EXT.CONTROL $"
        db      08ah, 0d8h
        db      "8off"
        db      0ffh, 08ah, 0d5h
        db      "8 ON "
        endif
        if      (XL = 0) && (FW_VERSION >= 200)
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 0f7h, 086h, 000h, 026h, 078h, 000h, 03eh, 087h, 000h
        db      026h, 078h, 000h, 048h, 087h, 000h, 026h, 078h, 002h, 08fh, 087h, 002h, 0e4h, 082h, 003h, 0aah
        db      087h, 003h, 0cch, 083h, 002h, 0e0h, 087h, 002h, 08eh, 084h, 00ch, 0f7h, 087h, 00ah, 0deh, 085h
        db      000h, 06bh, 089h, 000h, 078h, 085h, 000h, 080h, 089h, 000h, 097h, 085h, 002h, 0aeh, 089h, 003h
        db      0c3h, 089h, 002h, 00ah, 08ah, 000h, 026h, 078h, 001h, 0eeh, 086h, 000h, 073h, 082h, 000h, 073h
        db      082h, 000h, 073h, 082h, 000h, 073h, 082h, 000h, 073h, 082h, 001h, 036h, 094h, 00ah, 066h, 086h
        db      000h, 0f3h, 08eh, 000h, 0f3h, 08eh, 002h, 074h, 082h, 002h, 09bh, 082h, 000h, 0b0h, 082h, 000h
        db      0e0h, 082h, 002h, 07ch, 091h, 002h, 07ch, 091h, 002h, 06eh, 090h, 007h, 0f1h, 093h, 007h, 091h
        db      092h, 007h, 0fdh, 093h, 007h, 099h, 092h, 007h, 009h, 094h, 007h, 0a1h, 092h, 007h, 0a9h, 093h
        db      007h, 089h, 092h, 007h, 0d9h, 093h, 007h, 079h, 092h, 007h, 0cdh, 093h, 007h, 081h, 092h, 007h
        db      0e5h, 093h, 007h, 051h, 092h, 007h, 0b5h, 093h, 007h, 013h, 080h, 007h, 0c1h, 093h, 007h, 013h
        db      080h, 007h, 013h, 080h, 007h, 013h, 080h, 007h, 013h, 080h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL = 0) && (FW_VERSION = 150)
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 01fh, 087h, 000h, 036h, 078h, 000h, 066h, 087h, 000h
        db      036h, 078h, 000h, 070h, 087h, 000h, 036h, 078h, 002h, 0b7h, 087h, 002h, 00ch, 083h, 003h, 0d2h
        db      087h, 003h, 0f4h, 083h, 002h, 008h, 088h, 002h, 0b6h, 084h, 00ch, 01fh, 088h, 00ah, 006h, 086h
        db      000h, 093h, 089h, 000h, 0a0h, 085h, 000h, 0a8h, 089h, 000h, 0bfh, 085h, 002h, 0d6h, 089h, 003h
        db      0ebh, 089h, 002h, 032h, 08ah, 000h, 036h, 078h, 001h, 016h, 087h, 000h, 09bh, 082h, 000h, 09bh
        db      082h, 000h, 09bh, 082h, 000h, 09bh, 082h, 000h, 09bh, 082h, 001h, 054h, 094h, 00ah, 08eh, 086h
        db      000h, 011h, 08fh, 000h, 011h, 08fh, 002h, 09ch, 082h, 002h, 0c3h, 082h, 000h, 0d8h, 082h, 000h
        db      008h, 083h, 002h, 09ah, 091h, 002h, 09ah, 091h, 002h, 08ch, 090h, 007h, 00fh, 094h, 007h, 0afh
        db      092h, 007h, 01bh, 094h, 007h, 0b7h, 092h, 007h, 027h, 094h, 007h, 0bfh, 092h, 007h, 0c7h, 093h
        db      007h, 0a7h, 092h, 007h, 0f7h, 093h, 007h, 097h, 092h, 007h, 0ebh, 093h, 007h, 09fh, 092h, 007h
        db      003h, 094h, 007h, 06fh, 092h, 007h, 0d3h, 093h, 007h, 03bh, 080h, 007h, 0dfh, 093h, 007h, 03bh
        db      080h, 007h, 03bh, 080h, 007h, 03bh, 080h, 007h, 03bh, 080h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL = 0) && (MODEL = 3200)
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 0bah, 08ch, 000h, 094h, 07dh, 000h, 0fdh, 08ch, 000h
        db      094h, 07dh, 000h, 007h, 08dh, 000h, 094h, 07dh, 002h, 04ch, 08dh, 002h, 0c8h, 088h, 003h, 065h
        db      08dh, 003h, 0a7h, 089h, 002h, 099h, 08dh, 002h, 064h, 08ah, 00ch, 0aeh, 08dh, 00ah, 0adh, 08bh
        db      000h, 01ah, 08fh, 000h, 049h, 08bh, 000h, 02dh, 08fh, 000h, 067h, 08bh, 002h, 059h, 08fh, 003h
        db      06ch, 08fh, 002h, 0b1h, 08fh, 000h, 094h, 07dh, 001h, 0b1h, 08ch, 000h, 059h, 088h, 000h, 059h
        db      088h, 000h, 059h, 088h, 000h, 059h, 088h, 000h, 059h, 088h, 001h, 0feh, 097h, 00ah, 02fh, 08ch
        db      000h, 0a4h, 094h, 000h, 0a4h, 094h, 002h, 05ah, 088h, 002h, 081h, 088h, 000h, 094h, 088h, 000h
        db      0c4h, 088h, 002h, 02bh, 097h, 002h, 02bh, 097h, 002h, 01fh, 096h, 000h, 000h, 000h, 000h, 000h
        endif
        if      XL = 0
        db      000h, 000h, 000h, 000h, 000h, 000h, 08ch, 06ah, 06dh, 009h
        endif
        db      "PROGRAMS IN MEMORY"
        db      08ah, 072h, 001h
        db      "(vol:"
        db      08ah, 0e4h, 001h, 029h, 093h, 02bh, 06eh, 00ah, 08ah, 090h, 00ah
        db      "program(s)"
        db      08ah, 090h, 013h
        db      "now active"
        db      08ah, 07eh, 01ch
        db      "PROGRAM NUMBER:"
        db      08ah, 003h
        if      XL
        db      "8SLCT ", 0
        else
        db      "8SLCT RNUM ", 0
        endif
        db      "MIX ", 0
        if      XL
        db      "MIDI LOUD DISK ", 0
        db      "DEL ", 0
        db      "RNUM"
        db      0ffh, 08ch, 06ah, 013h, 009h, 04dh, 049h, 058h, 08ah, 01eh, 001h
        db      "prog no:"
        db      08ah, 06ch, 001h
        db      "st-pan out-lev fx-send"
        db      08ah, 003h
        db      "8SLCT ", 0
        db      "MIX ", 0
        db      "MIDI LOUD DISK ", 0
        db      "DEL ", 0
        db      "RNUM"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "MIDI"
        db      08ah, 01eh, 001h
        db      "prog no:"
        db      08ah, 06ch, 001h
        db      "ch  range ", 0
        db      "pol pri  tr"
        db      08ah, 003h
        db      "8SLCT ", 0
        db      "MIX ", 0
        db      "MIDI LOUD DISK ", 0
        db      "DEL ", 0
        db      "RNUM"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "LOUD"
        db      08ah, 01eh, 001h
        elseif  (XL = 0) && (MODEL = 3000)
        db      "MIDI LOAD ", 0
        else
        db      "MIDI DISK ", 0
        endif
        if      XL = 0
        db      "DEL  RVB ", 0
        db      "MUTE"
        db      0ffh, 08ch, 06ah, 0e5h, 009h
        db      "CHANGE PROGRAM NUMBER OF MEMORY PROGS."
        db      093h, 02bh, 06fh, 00ah, 08ah, 003h
        db      "8SLCT RNUM"
        db      08ah, 099h, 038h, 000h
        db      "ALL ", 0
        db      "SLIP ", 0
        db      053h, 045h, 054h, 0ffh, 08ch, 06ah, 013h, 009h, 04dh, 049h, 058h, 08ah, 024h, 001h
        endif
        db      "prog no:"
        db      08ah, 072h, 001h
        if      XL
        db      "loudness  vel>loud"
        else
        db      "loud st pan send lev"
        endif
        db      08ah, 003h
        if      XL
        db      "8SLCT ", 0
        else
        db      "8SLCT RNUM ", 0
        endif
        db      "MIX ", 0
        if      XL
        db      "MIDI LOUD DISK ", 0
        db      "DEL ", 0
        db      "RNUM"
        elseif  (XL = 0) && (MODEL = 3000)
        db      "MIDI LOAD ", 0
        else
        db      "MIDI DISK ", 0
        endif
        if      XL = 0
        db      "DEL  RVB ", 0
        db      "MUTE"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "MIDI"
        db      08ah, 021h, 001h
        db      "prog no:"
        db      08ah, 069h, 001h
        db      "cha ", 0
        db      "range ", 0
        db      "pol pri  tr"
        db      08ah, 003h
        db      "8SLCT RNUM ", 0
        db      "MIX ", 0
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      "MIDI LOAD ", 0
        elseif  (XL = 0) && (MODEL = 3200)
        db      "MIDI DISK ", 0
        endif
        if      XL = 0
        db      "DEL  RVB ", 0
        db      "MUTE"
        endif
        db      0ffh, 08ch, 06ah, 055h, 009h
        db      "LOAD FROM DISK"
        db      08ah, 058h, 001h, 03ah, 08ah, 08fh, 001h
        db      "vol:"
        db      093h, 02bh, 087h, 00ah, 08ah, 090h, 013h
        db      "programs:"
        db      08ah, 090h, 01ch
        db      "(samples:    )"
        db      08ah, 090h
        db      "%free mem:    %"
        db      08ah, 0c0h, 02eh, 01ch
        db      "LOAD"
        db      01dh, 08ah, 003h
        if      XL
        db      "8SLCT ", 0
        else
        db      "8SLCT RNUM ", 0
        endif
        db      "MIX ", 0
        if      XL
        db      "MIDI LOUD DISK ", 0
        elseif  (XL = 0) && (MODEL = 3200)
        db      "MIDI DISK ", 0
        endif
        if      (XL) || (MODEL = 3200)
        db      "DEL  P+S  VOL"
        else
        db      "MIDI ", 0
        db      "ROM  DEL  P+S  VOL"
        endif
        db      0ffh, 08ch, 06ah, 0a3h, 009h
        db      "DELETE PROGRAMS FROM MEMORY"
        db      093h, 02bh, 08dh, 00ah, 08ah, 09ch, 00ah
        db      "programs:"
        db      08ah, 0b4h, 01ch
        db      "free:   %"
        db      08ah, 0a5h, 02eh, 01ch
        db      " delete "
        db      01dh, 08ah, 003h
        if      XL
        db      "8SLCT ", 0
        else
        db      "8SLCT RNUM ", 0
        endif
        db      "MIX ", 0
        if      XL
        db      "MIDI LOUD DISK PROG PNUM ALL!"
        db      0ffh, 08ch, 06ah, 0e5h, 009h
        db      "CHANGE PROGRAM NUMBER OF MEMORY PROGS."
        db      093h, 02bh, 06fh, 00ah, 08ah
        db      "B8ALL ", 0
        db      "SLIP ", 0
        db      "SET ", 0
        db      "SEQU EXIT"
        db      0ffh, 08ch, 06ah, 025h, 009h
        db      "MULTI:"
        elseif  (XL = 0) && (MODEL = 3000)
        db      "MIDI LOAD PROG PNUM ALL!"
        else
        db      "MIDI DISK PROG PNUM ALL!"
        endif
        if      XL = 0
        db      0ffh, 08ch, 06ah, 013h, 009h, 052h, 056h, 042h, 08ah, 016h, 001h
        db      "(prog:   =  )"
        db      08ah, 066h, 001h, 06eh, 06fh, 03ah, 08ah, 018h, 00ah
        db      "type:"
        db      08ah, 0a8h, 00ah
        db      "output:"
        db      08ah, 012h, 013h
        db      "decay:"
        db      08ah, 0bah, 013h
        db      "pan:"
        db      08ah, 006h, 01ch
        db      "HF damp:"
        db      08ah, 0a8h, 01ch
        db      "HF cut:"
        db      08ah, 012h
        db      "%delay:"
        db      08ah
        db      "K%mS"
        db      08ah, 0aeh
        db      "%width:"
        db      08ah, 006h
        db      ".diffuse:"
        db      08ah, 003h
        db      "8SLCT RNUM ", 0
        db      "MIX ", 0
        db      "MIDI SAVE COPY  FX  MUTE"
        db      0ffh, 08ch, 06ah, 00dh, 009h, 046h, 058h, 08ah, 012h, 001h
        db      "(prog:   =  ) no:"
        db      08ah, 018h, 00ah
        db      "type:"
        db      08ah, 0a8h, 00ah
        db      "output:"
        db      08ah, 0bah, 013h
        db      "pan:"
        db      08ah, 012h, 018h
        db      "speed:"
        db      08ah, 012h
        db      "!depth:"
        db      08ah, 000h
        db      "*feedback:"
        db      08ah, 0a8h, 01ch
        db      "HF cut:"
        db      08ah, 0aeh
        db      "%width:"
        db      08ah, 003h
        db      "8SLCT RNUM ", 0
        db      "MIX ", 0
        db      "MIDI SAVE COPY ", 0
        db      "RVB ", 0
        db      "MUTE"
        db      0ffh, 08ch, 06ah, 00dh, 009h, 046h, 058h, 08ah, 012h, 001h
        db      "(prog:   =  ) no:"
        db      08ah, 018h, 00ah
        db      "type:"
        db      08ah, 0a8h, 00ah
        db      "output:"
        db      08ah, 03ch, 013h
        db      "LEFT   RIGHT"
        db      08ah, 0bah, 013h
        db      "pan:"
        db      08ah, 018h, 01ch
        db      "tune:"
        db      08ah, 0a8h, 01ch
        db      "HF cut:"
        db      08ah, 000h
        db      "%feedback:"
        db      08ah, 0aeh
        db      "%width:"
        db      08ah, 012h
        db      ".delay:"
        db      08ah
        db      "T.mS"
        db      08ah, 003h
        db      "8SLCT RNUM ", 0
        db      "MIX ", 0
        db      "MIDI SAVE COPY ", 0
        db      "RVB ", 0
        db      "MUTE"
        db      0ffh, 08ch, 06ah, 00dh, 009h, 046h, 058h, 08ah, 012h, 001h
        db      "(prog:   =  ) no:"
        db      08ah, 018h, 00ah
        db      "type:"
        db      08ah, 0a8h, 00ah
        db      "output:"
        db      08ah, 01eh, 013h, 044h, 031h, 000h, 03eh, 000h, 044h, 032h, 000h, 03eh, 000h, 044h, 033h, 000h
        db      03eh, 000h
        db      "Dleft"
        db      08ah, 0bah, 013h
        db      "pan:"
        db      08ah, 000h, 01ch
        db      "del:"
        db      08ah, 084h, 01ch, 06dh, 053h, 08ah, 000h
        db      "%fbk:"
        db      08ah
        db      "f%damp:"
        db      08ah, 0aeh
        db      "%width:"
        db      08ah, 000h
        db      ".pan:"
        db      08ah, 003h
        db      "8SLCT RNUM ", 0
        db      "MIX ", 0
        db      "MIDI SAVE COPY ", 0
        db      "RVB ", 0
        db      "MUTE"
        db      0ffh, 08ch, 06ah, 00dh, 009h, 046h, 058h, 08ah, 012h, 001h
        db      "(prog:   =  ) no:"
        db      08ah, 018h, 00ah
        db      "type:"
        db      08ah, 0a8h, 00ah
        db      "output:"
        db      08ah, 0bah, 013h
        db      "pan:"
        db      08ah, 0a8h, 01ch
        db      "HF cut:"
        db      08ah, 018h, 013h
        db      "delay: 999 mS"
        db      08ah, 006h, 01ch
        db      "feedback:"
        db      08ah, 006h
        db      "%lfo rate:"
        db      08ah, 000h
        db      ".lfo depth: 999 mS"
        db      08ah, 003h
        db      "8SLCT RNUM ", 0
        db      "MIX ", 0
        db      "MIDI SAVE COPY ", 0
        db      "RVB ", 0
        db      "MUTE"
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      0ffh, 08ch, 06ah, 067h, 009h
        db      "LOAD FROM WAVEROM"
        db      093h, 02bh, 087h, 00ah, 08ah, 09ch, 013h
        db      "programs:"
        db      08ah, 090h, 01eh
        db      "free P/K/S:"
        db      08ah, 0c0h, 02eh, 01ch
        db      "LOAD"
        db      01dh, 08ah, 003h
        db      "8SLCT RNUM ", 0
        db      "MIX ", 0
        db      "MIDI DISK ", 0
        db      "DEL  P+S  VOL"
        endif
        if      XL = 0
        db      0ffh, 08ch, 06ah, 043h, 009h
        db      "SAMPLE EDIT"
        endif
        db      08ah, 078h, 001h
        if      XL
        db      "Ch  Lev Pan  Fx Send"
        db      08ah, 003h, 038h, 000h
        db      "MIX  OUT ", 0
        db      "TUNE RNGE PRIO INIT RNUM"
        else
        db      "sample:"
        db      092h, 072h, 000h, 00ch, 093h, 026h, 072h, 00ch, 08ah, 000h, 00eh
        db      "name:"
        db      08ah, 084h, 00ah
        db      "size:"
        db      08ah, 084h, 013h
        db      "Free:"
        db      08ah, 0d2h, 013h, 03dh, 020h, 020h, 020h, 025h, 08ah, 07eh, 01ch
        db      "samples in mem:"
        db      08ah
        db      "x%monitoring program:-"
        db      08ah, 000h
        db      "%mode:"
        db      08ah, 003h
        db      "8SLCT REC1 REC2 ED.1 ED.2 ED.3      ", 0
        db      044h, 045h, 04ch, 0ffh, 08ch, 06ah, 04fh, 009h
        db      "RECORD SET-UP"
        db      08ah, 054h, 001h
        db      "sample name:"
        db      093h, 026h, 082h, 00ch, 08ah, 012h, 00ah
        db      "mode:"
        db      08ah, 006h, 013h, 028h
        db      "V)iew:"
        db      08ah, 08ah, 013h
        db      "bandwidth:"
        db      08ah, 00ch, 01ch
        db      "start:"
        db      08ah, 084h, 01ch
        db      "orig.pitch:"
        db      08ah, 000h
        db      "%monitor:"
        db      08ah, 084h
        db      "%record tim:      s"
        db      08ah, 006h
        db      ".(F)ree:        =   %  =            %"
        db      08ah, 003h
        db      "8SLCT REC1 REC2 ED.1 ED.2 ED.3      DIGI"
        endif
        db      0ffh, 08ch, 06ah, 025h, 009h
        if      XL
        db      "MULTI:"
        else
        db      "RECORD"
        db      08ah, 054h, 001h, 056h, 03ah, 08ah, 0e4h, 001h, 025h, 046h, 08dh, 0dbh, 008h, 013h, 08ch, 0bbh
        db      0e8h, 023h, 08ah, 000h, 00ah
        db      "-  dB ptch:    tim:      s=            %"
        db      08ah, 003h
        db      "8SLCT REC1 REC2 ED.1 ED.2 ED.3 Moff ", 0
        db      041h, 052h, 04dh, 0ffh, 08ch, 06ah, 019h, 009h
        db      "TRIM"
        db      08ah, 01eh, 001h
        db      "edit-mode:"
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      08ah, 0e4h, 001h, 025h, 046h, 08dh, 0dbh, 008h, 01dh, 08ch, 0bbh, 0e8h, 019h, 08dh, 0deh, 008h
        db      013h, 08ch, 0beh, 0e8h, 00bh, 08ah, 000h, 00ah
        elseif  (XL = 0) && (MODEL = 3200)
        db      08ah, 0e4h, 001h, 025h, 046h, 08dh, 0dbh, 008h, 013h, 08ch, 0bbh, 0e8h, 023h, 08ah, 000h, 00ah
        endif
        if      XL = 0
        db      "start:"
        db      08ah, 05ah, 00ah
        db      "end:"
        db      08ah, 003h
        db      "8SLCT TRIM LOOP JOIN ", 0
        db      05ah, 049h, 04eh, 000h
        db      " ZOUT <--> ", 0
        db      043h, 055h, 054h, 0ffh, 08ch, 06ah, 019h, 009h
        db      "LOOP:"
        db      08ah, 036h, 001h
        db      "time:"
        db      08ah, 06eh, 001h, 06dh, 053h, 08ah, 0e4h, 001h, 025h, 046h, 08dh, 0dbh, 008h, 013h, 08ch, 0bbh
        db      075h, 023h, 08dh, 09bh, 07eh, 013h, 08ch, 0bbh, 072h, 023h, 08dh, 04eh, 0b6h, 014h, 08ch, 02eh
        db      001h, 021h, 08ah, 000h, 00ah, 061h, 074h, 03ah, 08ah, 048h, 00ah
        db      "lng:"
        db      08ah, 0adh, 00ah, 058h, 066h, 03ah, 08ah, 003h
        db      "8SLCT TRIM LOOP JOIN ", 0
        db      05ah, 049h, 04eh, 000h
        db      " ZOUT FIND X-FD"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "JOIN"
        db      08ah, 024h, 001h
        db      "A then B --> J  Free:        =   %"
        db      08ah, 072h, 00ah
        db      "first    last   scale"
        db      08ah, 000h, 013h, 041h, 03ah, 08ah, 0e4h, 013h, 064h, 062h, 08ah, 000h, 01ch, 042h, 03ah, 08ah
        db      0e4h, 01ch, 064h, 062h, 08ah, 000h, 025h, 04ah, 03ah, 08ah
        db      "r%X-fade over:"
        db      08ah, 09ch
        db      ".spl"
        db      08ah, 0e4h, 02eh, 06dh, 078h, 08ah, 003h
        db      "8SLCT TRIM LOOP JOIN      A->J SPLI ", 0
        db      04dh, 049h, 058h, 0ffh, 08ch, 06ah, 03dh, 009h
        db      "PARAMETERS of sample:"
        db      08ah, 0e4h, 001h, 025h, 046h, 08ah, 00ch, 013h
        db      "original pitch:"
        db      08ah, 018h, 01ch
        db      "pitch offset:"
        db      08ah, 096h, 01ch
        db      "(semi.cent)"
        db      08ah, 000h
        db      "%type of playback:"
        db      08ah, 000h
        db      ".loop tune offset:     cents (HOLD only)"
        db      08ah, 003h
        db      "8SLCT PARA TIME RATE"
        db      08ah, 0d8h
        db      "8REV"
        db      0ffh, 08ch, 06ah, 049h, 009h
        db      "TIME-STRETCH  sample:"
        db      08ah, 0e4h, 001h, 025h, 046h, 08ah, 000h, 00ah
        db      "stretch zone:"
        db      08ah, 090h, 00ah, 074h, 06fh, 03ah, 08ah, 000h, 013h
        db      "Cycle length:"
        db      08ah, 07eh, 013h
        db      "total:"
        db      08ah, 0cch, 013h, 03dh, 020h, 020h, 020h, 025h, 08ah, 006h, 01ch
        db      "time factor:"
        db      08ah, 068h, 01ch, 025h, 08ah, 07eh, 01ch
        db      "norm.time="
        db      08ah, 0deh, 01ch, 073h, 065h, 063h, 08ah, 000h
        db      "%stretch mode:"
        db      08ah, 084h
        db      "%qual:"
        db      08ah, 0bah
        db      "%width:"
        db      08ah, 00ch
        db      ".new sample:"
        db      08ah, 003h
        db      "8SLCT PARA TIME RATE autC ZONE  GO  PLAY"
        db      0ffh, 08ch, 06ah, 037h, 009h
        db      "RE-SAMPLE"
        db      08ah, 04eh, 001h
        db      "sample:"
        db      08ah, 0e4h, 001h, 025h, 046h, 08ah, 000h, 00ah
        db      "present sample rate:"
        db      08bh, 02ah, 000h, 048h, 07ah, 08ah, 018h, 013h
        db      "new sample rate:"
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      08bh, 02ah, 000h, 048h, 07ah, 08ah, 0b8h, 013h
        db      "qual:"
        db      08ah, 036h, 01ch
        elseif  (XL = 0) && (MODEL = 3200)
        db      08bh, 02ah, 000h, 048h, 07ah, 08ah, 036h, 01ch
        endif
        if      XL = 0
        db      "new length:"
        db      08ah, 0cch, 01ch, 03dh, 020h, 020h, 020h, 025h, 08ah
        db      "0%tune offset:+00.00 semi.cent"
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      08ah, 006h
        elseif  (XL = 0) && (MODEL = 3200)
        db      08ah, 00ch
        endif
        if      XL = 0
        db      ".new sample:"
        db      08ah, 003h
        db      "8SLCT PARA TIME RATE ", 0
        db      033h, 02fh, 034h, 020h, 020h, 032h, 02fh, 033h, 020h, 000h
        db      " GO  PLAY"
        db      0ffh, 08ch, 06ah, 0bbh, 009h
        db      "DIGITAL INTERFACE - Receive"
        db      08ah, 000h, 013h
        db      "      source:"
        db      08ah, 000h, 01ch
        db      "       input:"
        db      08ah, 000h
        db      "%receive rate:"
        db      08ah, 003h
        db      "8SLCT REC1 REC2 ED.1 ED.2 ED.3      DIGI"
        db      0ffh, 08ch, 06ah, 02bh, 009h
        db      "SECTION"
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      08ah, 090h, 001h, 074h, 06fh, 03ah, 08ah, 0e4h, 00ah, 025h, 046h, 08dh, 0dbh, 008h, 01dh, 08ch
        db      0bbh, 0e8h, 019h, 08dh, 0deh, 008h, 013h, 08ch, 0beh, 0e8h, 00bh, 08ah, 000h, 00ah
        elseif  (XL = 0) && (MODEL = 3200)
        db      08ah, 090h, 001h, 074h, 06fh, 03ah, 08ah, 0e4h, 00ah, 025h, 046h, 08dh, 0dbh, 008h, 013h, 08ch
        db      0bbh, 0e8h, 023h, 08ah, 000h, 00ah
        endif
        if      XL = 0
        db      "start:"
        db      08ah, 05ah, 00ah
        db      "end:"
        db      08ah, 003h
        db      "8SLCT SECT SCAL FADE ", 0
        db      "ZIN ", 0
        db      "ZOUT <--> EXEC"
        db      0ffh, 08ch, 06ah, 02bh, 009h
        db      "SCALING"
        db      08ah, 090h, 001h, 074h, 06fh, 03ah, 08ah, 0e4h, 00ah, 025h, 046h, 08dh, 0dbh, 008h, 013h, 08ch
        db      0bbh, 0e8h, 023h, 08ah, 018h, 00ah
        db      "rescale value:    dB"
        db      08ah, 003h
        db      "8SLCT SECT SCAL FADE NORM RSCL"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "FADE"
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      08ah, 090h, 001h, 074h, 06fh, 03ah, 08ah, 0e4h, 00ah, 025h, 046h, 08dh, 0dbh, 008h, 01dh, 08ch
        db      0bbh, 0e8h, 019h, 08dh, 0deh, 008h, 013h, 08ch, 0beh, 0e8h, 00bh, 08ah, 000h, 00ah
        elseif  (XL = 0) && (MODEL = 3200)
        db      08ah, 090h, 001h, 074h, 06fh, 03ah, 08ah, 0e4h, 00ah, 025h, 046h, 08dh, 0dbh, 008h, 013h, 08ch
        db      0bbh, 0e8h, 023h, 08ah, 000h, 00ah
        endif
        if      XL = 0
        db      "start:"
        db      08ah, 05ah, 00ah
        db      "end:"
        db      08ah, 003h
        db      "8SLCT SECT SCAL FADE ", 0
        db      "ZIN ", 0
        db      "ZOUT <-->  GO"
        db      0ffh, 08ch, 06ah, 02bh, 009h
        db      "SECTION"
        db      08ah, 090h, 001h, 074h, 06fh, 03ah, 08ah, 0e4h, 00ah, 025h, 046h, 08dh, 0dbh, 008h, 013h, 08ch
        db      0bbh, 0e8h, 023h, 08ah, 000h, 00ah
        db      "start:"
        db      08ah, 05ah, 00ah
        db      "end:"
        db      08ah, 048h, 038h, 000h
        db      "Select: CHOP ", 0
        db      043h, 055h, 054h, 000h
        db      " EXTR exit"
        db      0ffh, 08ch, 06ah, 043h, 009h
        db      "SAMPLE EDIT"
        endif
        db      08ah, 078h, 001h
        if      XL
        db      "Ch OUTselect Level"
        db      08ah, 003h, 038h, 000h
        db      "MIX  OUT ", 0
        db      "TUNE RNGE PRIO INIT RNUM"
        db      0ffh, 08ch, 06ah, 025h, 009h
        db      "MULTI:"
        db      08ah, 078h, 001h
        db      "Ch Transpose Cents"
        db      08ah, 003h, 038h, 000h
        db      "MIX  OUT ", 0
        db      "TUNE RNGE PRIO INIT RNUM"
        db      0ffh, 08ch, 06ah, 025h, 009h
        db      "MULTI:"
        db      08ah, 078h, 001h
        db      "Ch LowLimit HiLimit"
        db      08ah, 003h, 038h, 000h
        db      "MIX  OUT ", 0
        db      "TUNE RNGE PRIO INIT RNUM"
        db      0ffh, 08ch, 06ah, 025h, 009h
        db      "MULTI:"
        db      08ah, 078h, 001h
        db      "Ch  Priority"
        db      08ah, 003h, 038h, 000h
        db      "MIX  OUT ", 0
        db      "TUNE RNGE PRIO INIT RNUM"
        else
        db      "sample:"
        db      092h, 072h, 000h, 00ch, 093h, 026h, 072h, 00ch, 08ah, 000h, 00eh
        db      "name:"
        db      08ah, 084h, 00ah
        db      "size:"
        db      08ah, 084h, 013h
        db      "Free:"
        db      08ah, 0d2h, 013h, 03dh, 020h, 020h, 020h, 025h, 08ah, 07eh, 01ch
        db      "samples in mem:"
        db      08ah
        db      "x%monitoring program:-"
        db      08ah, 000h
        db      "%mode:"
        db      08ah, 066h, 038h, 000h
        db      "Select: COPY ", 0
        db      052h, 045h, 04eh, 000h
        db      " exit"
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "TRIM"
        db      08ah, 01eh, 001h
        db      "edit-mode:"
        db      08ah, 0e4h, 001h, 025h, 046h, 08dh, 0dbh, 008h, 01dh, 08ch, 0bbh, 0e8h, 019h, 08dh, 0deh, 008h
        db      013h, 08ch, 0beh, 0e8h, 00bh, 08ah, 000h, 00ah
        db      "start:"
        db      08ah, 05ah, 00ah
        db      "end:"
        db      08ah, 048h, 038h, 000h
        db      "Select: S>LP toLP ", 0
        db      043h, 055h, 054h, 000h
        db      " exit"
        endif
        db      0ffh, 08ch, 06ah, 049h, 009h
        db      "PROGRAM EDIT"
        db      093h, 015h, 078h, 01dh, 092h, 070h, 078h, 01dh, 093h, 015h, 0e8h, 01dh, 092h, 070h, 078h, 032h
        db      08ah, 054h, 001h
        db      "program:                 %"
        db      08ah, 000h, 00ah
        db      "   keygroups:         progs in mem:"
        db      08ah, 000h, 013h
        db      "     samples:          listen solo:"
        db      08ah, 000h, 01ch
        db      "KG crossfade:"
        db      08ah, 000h
        db      "% Mono Legato:"
        db      08ah
        db      "| name:"
        db      08ah, 003h
        db      "8MAIN KGRP ", 0
        db      04dh, 04fh, 044h, 000h
        db      " MIDI ", 0
        db      "OUT  PAN", 0
        db      " TUNE ", 0
        if      XL
        db      044h, 045h, 04ch, 0ffh, 08ch, 06ah, 049h, 009h
        db      "PROGRAM EDIT"
        db      093h, 015h, 078h, 01dh, 092h, 070h, 078h, 01dh, 093h, 015h, 0e8h, 01dh, 092h, 070h, 078h, 032h
        db      08ah, 054h, 001h
        db      "program:                 %"
        db      08ah, 000h, 00ah
        db      "   keygroups:         progs in mem:"
        db      08ah, 000h, 013h
        db      "     samples:          listen solo:"
        db      08ah, 000h, 01ch
        db      "KG crossfade:"
        db      08ah, 000h
        db      "% Mono Legato:"
        db      08ah, 08eh
        db      " MULTI part:"
        db      08ah, 082h
        db      ")parts active:"
        db      08ah, 003h
        db      "8MAIN KGRP ", 0
        db      04dh, 04fh, 044h, 000h
        db      " MIDI ", 0
        db      "OUT  PAN", 0
        db      " TUNE "
        db      0ffh, 08ch, 06ah, 04fh, 009h
        else
        db      044h, 045h, 04ch, 0ffh, 08ch, 06ah, 04fh, 009h
        endif
        db      "MIDI RESPONSE (PROGRAM)"
        db      08ah, 0eah, 001h, 025h, 08ah, 000h, 00ah
        db      "program number:              PLAY-RANGE"
        db      08ah, 000h, 013h
        db      "  MIDI channel:               low  high"
        db      08ah, 000h, 01ch
        db      "     polyphony:"
        db      08ah, 000h
        db      "%      priority:"
        db      08ah, 000h
        db      ".  reassignment:          transpose:"
        db      08ah, 003h
        db      "8MAIN KGRP ", 0
        db      04dh, 04fh, 044h, 000h
        db      " MIDI ", 0
        db      "OUT  PAN", 0
        db      " TUNE "
        db      0ffh, 08ch, 06ah, 04fh, 009h
        if      XL
        db      "MIDI RESPONSE (PROGRAM)"
        db      08ah, 0eah, 001h, 025h, 08ah, 024h, 00eh
        db      "program number:"
        db      08ah, 042h, 017h
        db      "polyphony:"
        db      08ah
        db      "0 reassignment:"
        db      08ah, 003h
        db      "8MAIN KGRP ", 0
        db      04dh, 04fh, 044h, 000h
        db      " MIDI ", 0
        db      "OUT  PAN", 0
        db      " TUNE "
        db      0ffh, 08ch, 06ah, 04fh, 009h
        endif
        db      "OUTPUT LEVELS (PROGRAM)"
        if      XL
        db      08ah, 0eah, 001h, 025h, 08ah, 018h, 00ah
        db      "OUTPUTS"
        db      08ah, 000h, 013h
        db      "stereo level:"
        db      08ah, 00ch, 01ch
        db      "stereo pan:"
        db      08ah, 006h
        db      "%indiv:OFF  lev:"
        db      08ah, 000h
        db      ".FX bus:FX1 send:"
        db      08ah, 084h, 00ah
        db      "LOUDNESS CONTROL"
        db      08ah, 07eh, 013h
        db      "basic loudness:"
        db      08ah, 07eh, 01ch
        db      "velocity", 0
        else
        db      08ah, 0eah, 001h, 025h, 08ah, 001h, 00ah
        db      "    loudness:       LOUDNESS MODULATION"
        db      08ah, 001h, 013h
        db      "indiv output:       velocity", 0
        endif
        db      03eh, 000h
        db      "loud:"
        if      XL
        db      08ah, 0aeh, 025h, 000h, 03eh, 000h
        db      "loud:"
        db      08ah, 0aeh, 02eh, 000h, 03eh, 000h
        db      "loud:"
        db      08ah, 003h
        db      "8MAIN KGRP ", 0
        db      04dh, 04fh, 044h, 000h
        db      " MIDI ", 0
        db      "OUT  PAN", 0
        db      " TUNE "
        db      0ffh, 08ch, 06ah, 04fh, 009h
        db      "OUTPUT LEVELS (PROGRAM)"
        db      08ah, 0eah, 001h, 025h, 08ah, 084h, 00ah
        db      "LOUDNESS CONTROL"
        db      08ah, 07eh, 013h
        db      "basic loudness:"
        db      08ah, 07eh, 01ch
        db      "velocity", 0
        else
        db      08ah, 001h, 01ch
        db      " indiv level:               ", 0
        endif
        db      03eh, 000h
        db      "loud:"
        if      XL
        db      08ah, 0aeh, 025h, 000h, 03eh, 000h
        db      "loud:"
        db      08ah, 0aeh, 02eh, 000h, 03eh, 000h
        else
        db      08ah, 001h
        db      "%stereo level:               ", 0
        db      03eh, 000h
        endif
        db      "loud:"
        if      XL = 0
        db      08ah, 001h
        db      ".  stereo pan:"
        endif
        db      08ah, 003h
        db      "8MAIN KGRP ", 0
        db      04dh, 04fh, 044h, 000h
        db      " MIDI ", 0
        db      "OUT  PAN", 0
        db      " TUNE "
        db      0ffh, 08ch, 06ah, 049h, 009h
        db      "PROGRAM EDIT"
        db      093h, 015h, 078h, 01dh, 092h, 070h, 078h, 01dh, 093h, 015h, 0e8h, 01dh, 092h, 070h, 078h, 032h
        db      08ah, 054h, 001h
        db      "program:                 %"
        db      08ah, 000h, 00ah
        db      "   keygroups:         progs in mem:"
        db      08ah, 000h, 013h
        db      "     samples:          listen solo:"
        db      08ah, 000h, 01ch
        db      "KG crossfade:"
        db      08ah, 000h
        db      "% Mono Legato:"
        db      08ah
        db      "| name:"
        db      08ah, 066h, 038h, 000h
        db      "Select: COPY ", 0
        db      052h, 045h, 04eh, 000h
        db      " exit"
        db      0ffh, 08ch, 06ah, 037h, 009h
        db      "KEYGROUPS"
        db      08ah, 0eah, 001h, 025h, 08ah, 000h, 00ah
        db      "  Keygroups in Program:     (+/-)"
        db      08ah, 000h, 013h
        db      "active Keygroup number:"
        if      XL
        db      08ah, 0a8h, 013h
        db      "Edit:"
        endif
        db      08ah, 000h, 01ch
        db      "                  Span:     -"
        if      (XL) || (MODEL = 3000)
        db      08ah
        db      "H%Mute Group:"
        endif
        if      XL
        db      08ah, 00ch
        db      ".Override prog FX bus: XXX  send:"
        db      08ah, 003h
        elseif  (XL = 0) && (MODEL = 3000)
        db      08ah
        db      "l.Edit:"
        db      08ah, 000h, 02eh, 08ah, 003h
        else
        db      08ah, 000h, 025h, 08ah, 000h, 02eh, 08ah, 003h
        endif
        db      "8MAIN KGRP SPAN FILT ", 0
        db      045h, 04eh, 056h, 000h
        db      " SMPL PTCH"
        db      0ffh, 08ch, 06ah, 02bh, 009h
        db      "KEYSPAN"
        db      08ah, 036h, 001h
        db      "edit:"
        db      08ah, 06fh, 001h
        db      "KG LOW HIGH TUNE"
        db      08dh, 09bh, 000h, 009h, 08ch, 0bbh, 06eh, 02dh, 08ah, 0d8h, 001h
        db      "BEAT"
        db      08ah, 090h
        db      "8midi->span:"
        db      08ah, 003h
        db      "8MAIN KGRP SPAN"
        db      08ah, 0d5h, 038h, 000h, 06fh, 066h, 066h, 0ffh, 08ch, 06ah, 025h, 009h
        if      (XL) || (MODEL = 3000)
        db      "FILTER"
        else
        db      "FILTER "
        endif
        db      08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 01ah, 00ah, 02dh, 08ah, 00bh, 013h
        db      " frequency:"
        db      08ah, 00bh, 01ch
        db      "key follow:"
        db      08ah, 00bh
        db      "% resonance:"
        db      08ah, 072h, 013h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, 03eh, 000h
        db      "freq:"
        db      08ah, 072h, 01ch, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, 03eh, 000h
        db      "freq:"
        db      08ah, 072h, 025h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, 03eh, 000h
        db      "freq:"
        db      08ah, 003h
        db      "8MAIN KGRP FLT1 FLT2 ENV1 ENV2 ENV3 TONE"
        db      0ffh, 08ch, 06ah, 031h, 009h
        db      "ENV1-VOL"
        db      08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 01ah, 00ah, 02dh, 08ah, 054h, 00ah
        db      "template:"
        db      08ah, 0a8h, 013h
        db      " Attack:"
        db      08ah, 0a8h, 01ch
        db      "  Decay:"
        db      08ah, 0a8h
        db      "%Sustain:"
        db      08ah, 0a8h
        db      ".Release:"
        db      08ah, 003h
        db      "8MAIN KGRP FLT1 FLT2 ENV1 ENV2 ENV3 env1"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "ENV2"
        db      08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 01ah, 00ah, 02dh, 08ah, 054h, 00ah
        db      "template:"
        db      08ah, 0a5h, 013h
        db      "R1:    L1:"
        db      08ah, 0a5h, 01ch
        db      "R2:    L2:"
        db      08ah, 0a5h
        db      "%R3:    L3:"
        db      08ah, 0a5h
        db      ".R4:    L4:"
        db      08ah, 003h
        db      "8MAIN KGRP FLT1 FLT2 ENV1 ENV2 ENV3 env2"
        db      0ffh, 08ah, 005h, 001h, 020h, 020h, 020h, 02dh, 020h, 020h, 020h, 08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08dh, 09bh, 0d4h, 00ah, 08ch, 0bbh, 01ch, 023h, 08ah, 000h, 00ah
        db      "zn   sample     V-lo V-hi pitch"
        db      08ah, 000h, 013h, 031h, 08ah, 0c0h, 013h, 058h, 066h, 064h, 08ah, 000h, 01ch, 032h, 08ah, 000h
        db      025h, 033h, 08ah, 000h, 02eh, 034h, 08ah, 0d6h, 02eh, 031h, 032h, 033h, 034h, 08ah, 003h
        db      "8MAIN KGRP SMP1 SMP2 SMP3"
        db      0ffh, 08ah, 005h, 001h, 020h, 020h, 020h, 02dh, 020h, 020h, 020h, 08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 000h, 00ah
        db      "zn  sem.cnt loud filt pan  out  playback"
        db      08ah, 000h, 013h, 031h, 08ah, 000h, 01ch, 032h, 08ah, 000h, 025h, 033h, 08ah, 000h, 02eh, 034h
        db      08ah, 003h
        db      "8MAIN KGRP SMP1 SMP2 SMP3"
        db      0ffh, 08ah, 005h, 001h, 020h, 020h, 020h, 02dh, 020h, 020h, 020h, 08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 000h, 00ah
        db      "zn  vel>start"
        db      08ah, 000h, 013h, 031h, 08ah, 000h, 01ch, 032h, 08ah, 000h, 025h, 033h, 08ah, 000h, 02eh, 034h
        db      08ah, 003h
        db      "8MAIN KGRP SMP1 SMP2 SMP3"
        db      0ffh, 08ch, 06ah, 01fh, 009h
        db      "PITCH (PROGRAM)"
        db      08ah, 0eah, 001h, 025h, 08ah, 000h, 00ah
        db      "PITCH-BEND"
        db      08ah, 000h, 013h
        db      "Bendwheel up:"
        db      08ah, 000h, 01ch
        db      "Bendwheel dn:"
        db      08ah, 000h
        db      "%    Pressure:"
        db      08ah, 000h, 02eh, 020h, 020h, 009h
        db      "Bend mode:"
        db      08ah, 003h
        if      (XL) || (MODEL = 3000)
        db      "8MAIN BEND LFO1 LFO2 SOFT PORT"
        else
        db      "8MAIN BEND LFO1 LFO2 SOFT"
        endif
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "LFO1 (PROGRAM)"
        db      08ah, 0eah, 001h, 025h, 08ah, 000h, 00ah
        db      "Waveform:            LFO desync:"
        db      08ah, 000h, 013h
        db      "      FIXED   VARIABLE      EXTRA DEPTH"
        db      08ah, 000h, 01ch
        db      "speed:              :       modwheel:"
        db      08ah, 000h
        db      "%depth:              :       pressure:"
        db      08ah, 000h
        db      ".delay:              :       velocity:"
        db      093h, 01dh, 09eh, 016h, 08ah, 003h
        if      (XL) || (MODEL = 3000)
        db      "8MAIN BEND LFO1 LFO2 SOFT PORT"
        else
        db      "8MAIN BEND LFO1 LFO2 SOFT"
        endif
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "LFO2 (PROGRAM)"
        db      08ah, 0eah, 001h, 025h, 08ah, 000h, 00ah
        db      "Waveform:"
        db      08ah, 012h, 013h
        db      "speed:"
        db      08ah, 012h, 01ch
        db      "depth:"
        db      08ah, 012h
        db      "%delay:"
        if      (XL) || (MODEL = 3000)
        db      08ah, 00ch
        db      ".retrig:"
        endif
        db      08ah, 003h
        if      (XL) || (MODEL = 3000)
        db      "8MAIN BEND LFO1 LFO2 SOFT PORT"
        else
        db      "8MAIN BEND LFO1 LFO2 SOFT"
        endif
        db      0ffh, 08ch, 06ah, 031h, 009h
        db      "ENV1-VOL"
        db      08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 01ah, 00ah, 02dh, 08ah, 060h, 00ah
        db      "velocity", 0
        db      03eh, 000h
        db      "attack:"
        db      08ah, 05ah, 013h
        db      "velocity", 0
        db      03eh, 000h
        db      "release:"
        db      08ah, 042h, 01ch
        db      "off velocity", 0
        db      03eh, 000h
        db      "release:"
        db      08ah
        db      "H%key", 0
        db      03eh, 000h
        db      "decay & release:"
        db      08ah
        db      "~.attack hold:"
        db      08ah, 003h
        db      "8MAIN KGRP FLT1 FLT2 ENV1 ENV2 ENV3 env1"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "ENV2"
        db      08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 01ah, 00ah, 02dh, 08ah, 054h, 00ah
        db      "velocity", 0
        db      03eh, 000h, 052h, 031h, 03ah, 08ah, 054h, 013h
        db      "velocity", 0
        db      03eh, 000h, 052h, 034h, 03ah, 08ah, 03ch, 01ch
        db      "off velocity", 0
        db      03eh, 000h, 052h, 034h, 03ah, 08ah
        db      "T%key", 0
        db      03eh, 000h
        db      "R2 & R4:"
        db      08ah
        db      "0.velocity", 0
        db      03eh, 000h
        db      "envelope:"
        db      08ah, 003h
        db      "8MAIN KGRP FLT1 FLT2 ENV1 ENV2 ENV3 env2"
        db      0ffh, 08ch, 06ah, 037h, 009h
        db      "PITCH/AMP"
        db      08ah, 03ch, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 01ah, 00ah, 02dh, 08ah, 050h, 013h
        db      "LFO1", 0
        db      03eh, 000h
        db      "pitch:"
        db      08ah, 06bh, 01ch, 03eh, 000h
        db      "pitch:"
        db      08ah, 059h, 02eh, 03eh, 000h
        db      "loudness:"
        db      08ah, 003h
        if      (XL) || ((XL = 0) && (FW_VERSION < 200))
        db      "8MAIN KGRP SPAN FILT ", 0
        else
        db      "8MAIN KGRP "
        phase   0
        db      "SPAN FILT ", 0
        endif
        db      045h, 04eh, 056h, 000h
        db      " SMPL PTCH"
        db      0ffh, 08ch, 06ah, 013h, 009h
        db      "PAN (PROGRAM)"
        if      XL
        db      08ah, 0eah, 001h, 025h, 08ah, 096h, 00ch
        else
        db      08ah, 0eah, 001h, 025h, 08ah, 096h, 00ah
        endif
        db      "PAN MODULATION"
        if      XL
        db      08ah, 0aeh, 017h, 000h, 03eh, 000h
        else
        db      08ah, 001h, 013h
        db      "    loudness:                ", 0
        db      03eh, 000h
        endif
        db      "pan:"
        if      XL
        db      08ah, 0aeh, 020h, 000h, 03eh, 000h
        else
        db      08ah, 001h, 01ch
        db      "stereo level:                ", 0
        db      03eh, 000h
        endif
        db      "pan:"
        if      XL
        db      08ah, 0aeh, 029h, 000h, 03eh, 000h
        else
        db      08ah, 001h
        db      "%  stereo pan:                ", 0
        db      03eh, 000h
        endif
        db      "pan:"
        db      08ah, 003h
        db      "8MAIN KGRP ", 0
        db      04dh, 04fh, 044h, 000h
        db      " MIDI ", 0
        db      "OUT  PAN", 0
        db      " TUNE "
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "TUNE (PROGRAM)"
        db      08ah, 0eah, 001h, 025h, 08ah, 012h, 00ah, 000h, 043h, 000h, 020h, 043h, 023h, 020h, 000h, 044h
        db      000h, 020h, 044h, 023h, 020h, 000h, 045h, 000h, 020h, 000h, 046h, 000h, 020h, 046h, 023h, 020h
        db      000h, 047h, 000h, 020h, 047h, 023h, 020h, 000h, 041h, 000h, 020h, 041h, 023h, 020h, 000h, 042h
        db      000h, 08ah, 01eh, 01ch
        db      "   Program tune:"
        db      08ah, 01eh
        db      "%Tuning template:"
        db      08ah, 01eh
        db      ".            Key:"
        db      08ah, 003h
        db      "8MAIN KGRP ", 0
        db      04dh, 04fh, 044h, 000h
        db      " MIDI ", 0
        db      "OUT  PAN", 0
        db      " TUNE "
        db      0ffh, 08ch, 06ah, 03dh, 009h
        db      "SOFT PEDAL (PROGRAM)"
        db      08ah, 0eah, 001h, 025h, 08ah, 00ch, 013h
        db      "loudness reduction:"
        db      08ah, 024h, 01ch
        db      "attack stretch:"
        db      08ah
        db      "0%filter close:"
        db      08ah, 003h
        if      (XL) || (MODEL = 3000)
        db      "8MAIN BEND LFO1 LFO2 SOFT PORT"
        else
        db      "8MAIN BEND LFO1 LFO2 SOFT"
        endif
        db      0ffh, 08ch, 06ah, 01fh, 009h
        db      "ENV-3"
        db      08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 01ah, 00ah, 02dh, 08ah, 054h, 00ah
        db      "template:"
        db      08ah, 0a5h, 013h
        db      "R1:    L1:"
        db      08ah, 0a5h, 01ch
        db      "R2:    L2:"
        db      08ah, 0a5h
        db      "%R3:    L3:"
        db      08ah, 0a5h
        db      ".R4:    L4:"
        db      08ah, 003h
        db      "8MAIN KGRP FLT1 FLT2 ENV1 ENV2 ENV3 env3"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "ENV3"
        db      08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 01ah, 00ah, 02dh, 08ah, 054h, 00ah
        db      "velocity", 0
        db      03eh, 000h, 052h, 031h, 03ah, 08ah, 054h, 013h
        db      "velocity", 0
        db      03eh, 000h, 052h, 034h, 03ah, 08ah, 03ch, 01ch
        db      "off velocity", 0
        db      03eh, 000h, 052h, 034h, 03ah, 08ah
        db      "T%key", 0
        db      03eh, 000h
        db      "R2 & R4:"
        db      08ah
        db      "0.velocity", 0
        db      03eh, 000h
        db      "envelope:"
        db      08ah, 003h
        db      "8MAIN KGRP FLT1 FLT2 ENV1 ENV2 ENV3 env3"
        db      0ffh, 08ch, 06ah, 02bh, 009h
        db      "FILTER2"
        db      08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 01ah, 00ah, 02dh, 08ah, 05ah, 00ah
        db      "Filter2/Tone enable:"
        db      08ah, 005h, 013h
        db      "  frequency:"
        db      08ah, 005h, 01ch
        db      " key follow:"
        db      08ah, 005h
        db      "%  resonance:"
        db      08ah, 005h
        db      ".filter mode:"
        db      08ah, 090h
        db      ".attenuator:"
        db      08ah, 072h, 013h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, 03eh, 000h
        db      "freq:"
        db      08ah, 072h, 01ch, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, 03eh, 000h
        db      "freq:"
        db      08ah, 072h, 025h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, 03eh, 000h
        db      "freq:"
        db      08ah, 003h
        db      "8MAIN KGRP FLT1 FLT2 ENV1 ENV2 ENV3 TONE"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "TONE"
        db      08ah, 036h, 001h
        db      "KG:   ED:"
        db      08ah, 0eah, 001h, 025h, 08ah, 01ah, 00ah, 02dh, 08ah, 05ah, 00ah
        db      "Filter2/Tone enable:"
        db      08ah, 01eh, 013h
        db      "centre frequency:"
        db      08ah, 01eh, 01ch
        db      "           slope:"
        db      08ah, 01eh
        db      "%      attenuator:"
        db      08ah, 003h
        db      "8MAIN KGRP FLT1 FLT2 ENV1 ENV2 ENV3 TONE"
        if      (XL) || (MODEL = 3000)
        db      0ffh, 08ch, 06ah, 03dh, 009h
        db      "PORTAMENTO (PROGRAM)"
        db      08ah, 0eah, 001h, 025h, 08ah, 036h, 013h
        db      "portamento:"
        db      08ah, 05ah, 01ch
        db      "rate:"
        db      08ah
        db      "Z%type:"
        db      08ah, 003h
        db      "8MAIN BEND LFO1 LFO2 SOFT PORT"
        endif
        if      XL
        db      0ffh, 08ch, 06ah, 04fh, 009h
        db      "RECORD SET-UP"
        db      08ah, 054h, 001h
        db      "sample name:"
        db      093h, 026h, 082h, 00ch, 08ah, 012h, 00ah
        db      "mode:"
        db      08ah, 006h, 013h
        db      "source:"
        db      08ah, 00ch, 01ch
        db      "start:"
        db      08ah, 000h
        db      "%monitor:"
        db      08ah, 006h
        db      ".(F)ree:        =   %  =            %"
        db      08ah, 08ah, 013h
        db      "bandwidth:"
        db      08ah, 084h, 01ch
        db      "orig.pitch:"
        db      08ah, 084h
        db      "%record tim:      s"
        db      08ah, 003h, 038h, 000h
        db      "SET  REC"
        db      0ffh, 08ch, 06ah, 025h, 009h
        db      "RECORD"
        db      08ah, 054h, 001h, 08ah, 0e4h, 001h, 025h, 046h, 08dh, 0dbh, 008h, 013h, 08ch, 0bbh, 0e8h, 023h
        db      08ah, 000h, 00ah
        db      "-  dB ptch:    tim:      s=            %"
        db      08ah, 003h, 038h, 000h
        db      "SET  REC"
        db      08ah, 0b7h
        db      "8Moff ", 0
        db      041h, 052h, 04dh, 0ffh, 08ch, 06ah, 067h, 009h
        db      "SAMPLES IN MEMORY"
        db      08ah, 078h, 001h
        db      "sample:"
        db      092h, 072h, 000h, 00ch, 093h, 026h, 072h, 00ch, 08ah, 000h, 00eh
        db      "name:"
        db      08ah, 084h, 00ah
        db      "size:"
        db      08ah, 084h, 013h
        db      "Free:"
        db      08ah, 0d2h, 013h, 03dh, 020h, 020h, 020h, 025h, 08ah, 07eh, 01ch
        db      "samples in mem:"
        else
        db      0ffh, 08ch, 06ah, 09dh, 009h
        db      "BASIC MIDI CHANNEL CONTROL"
        db      08ah, 048h, 00ah
        db      "program select:"
        db      08ah, 05ah, 013h
        db      "global OMNI:"
        endif
        db      08ah
        if      XL
        db      "x%monitoring program:-"
        db      08ah, 000h
        db      "%mode:"
        else
        db      "*%external controller:"
        endif
        db      08ah, 003h
        if      XL
        db      "8SLCT TRIM LOOP NORM ", 0
        db      "DSP ", 0
        db      "MORE      ", 0
        db      044h, 045h, 04ch, 0ffh, 08ch, 06ah, 06dh, 009h
        db      "SAMPLE COPY/RENAME"
        db      08ah, 078h, 001h
        db      "sample:"
        db      092h, 072h, 000h, 00ch, 093h, 026h, 072h, 00ch, 08ah, 000h, 00eh
        db      "name:"
        db      08ah, 084h, 00ah
        db      "size:"
        db      08ah, 084h, 013h
        db      "Free:"
        db      08ah, 0d2h, 013h, 03dh, 020h, 020h, 020h, 025h, 08ah, 07eh, 01ch
        db      "samples in mem:"
        db      08ah
        db      "x%monitoring program:-"
        db      08ah, 000h
        db      "%mode:"
        db      08ah, 066h, 038h, 000h
        db      "Select: COPY ", 0
        db      052h, 045h, 04eh, 000h
        db      " exit"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "TRIM"
        db      08ah, 01eh, 001h
        db      "edit-mode:"
        db      08ah, 0e4h, 001h, 025h, 046h, 08dh, 0dbh, 008h, 01dh, 08ch, 0bbh, 0e8h, 019h, 08dh, 0deh, 008h
        db      013h, 08ch, 0beh, 0e8h, 00bh, 08ah, 000h, 00ah
        db      "start:"
        db      08ah, 05ah, 00ah
        db      "end:"
        db      08ah, 003h
        db      "8SLCT TRIM LOOP NORM ", 0
        db      05ah, 049h, 04eh, 000h
        db      " ZOUT <--> ", 0
        db      043h, 055h, 054h, 0ffh, 08ch, 06ah, 019h, 009h
        db      "TRIM"
        db      08ah, 01eh, 001h
        db      "edit-mode:"
        db      08ah, 0e4h, 001h, 025h, 046h, 08dh, 0dbh, 008h, 01dh, 08ch, 0bbh, 0e8h, 019h, 08dh, 0deh, 008h
        db      013h, 08ch, 0beh, 0e8h, 00bh, 08ah, 000h, 00ah
        db      "start:"
        db      08ah, 05ah, 00ah
        db      "end:"
        db      08ah, 048h, 038h, 000h
        db      "Select: S>LP toLP ", 0
        db      043h, 055h, 054h, 000h
        db      " exit"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "LOOP:"
        db      08ah, 036h, 001h
        db      "time:"
        db      08ah, 06eh, 001h, 06dh, 053h, 08ah, 0e4h, 001h, 025h, 046h, 08dh, 0dbh, 008h, 013h, 08ch, 0bbh
        db      075h, 023h, 08dh, 09bh, 07eh, 013h, 08ch, 0bbh, 072h, 023h, 08dh, 04eh, 0b6h, 014h, 08ch, 02eh
        db      001h, 021h, 08ah, 000h, 00ah, 061h, 074h, 03ah, 08ah, 048h, 00ah
        db      "lng:"
        db      08ah, 0adh, 00ah, 058h, 066h, 03ah, 08ah, 003h
        db      "8SLCT TRIM LOOP NORM ", 0
        db      05ah, 049h, 04eh, 000h
        db      " ZOUT FIND X-FD"
        db      0ffh, 08ch, 06ah, 02bh, 009h
        db      "SCALING"
        db      08ah, 090h, 001h, 074h, 06fh, 03ah, 08ah, 0e4h, 00ah, 025h, 046h, 08dh, 0dbh, 008h, 013h, 08ch
        db      0bbh, 0e8h, 023h, 08ah, 018h, 00ah
        db      "rescale value:    dB"
        db      08ah, 003h
        db      "8SLCT TRIM LOOP NORM           RSCL NORM"
        db      0ffh, 08ch, 06ah, 049h, 009h
        db      "TIME-STRETCH  sample:"
        db      08ah, 0e4h, 001h, 025h, 046h, 08ah, 000h, 00ah
        db      "stretch zone:"
        db      08ah, 090h, 00ah, 074h, 06fh, 03ah, 08ah, 000h, 013h
        db      "Cycle length:"
        db      08ah, 07eh, 013h
        db      "total:"
        db      08ah, 0cch, 013h, 03dh, 020h, 020h, 020h, 025h, 08ah, 006h, 01ch
        db      "time factor:"
        db      08ah, 068h, 01ch, 025h, 08ah, 07eh, 01ch
        db      "norm.time="
        db      08ah, 0deh, 01ch, 073h, 065h, 063h, 08ah, 000h
        db      "%stretch mode:"
        db      08ah, 084h
        db      "%qual:"
        db      08ah, 0bah
        db      "%width:"
        db      08ah, 00ch
        db      ".new sample:"
        db      08ah, 003h
        db      "8SLCT TIME RATE  EQ  autC ZONE  GO  PLAY"
        db      0ffh, 08ch, 06ah, 037h, 009h
        db      "RE-SAMPLE"
        db      08ah, 04eh, 001h
        db      "sample:"
        db      08ah, 0e4h, 001h, 025h, 046h, 08ah, 000h, 00ah
        db      "present sample rate:"
        db      08bh, 02ah, 000h, 048h, 07ah, 08ah, 018h, 013h
        db      "new sample rate:"
        db      08bh, 02ah, 000h, 048h, 07ah, 08ah, 0b8h, 013h
        db      "qual:"
        db      08ah, 036h, 01ch
        db      "new length:"
        db      08ah, 0cch, 01ch, 03dh, 020h, 020h, 020h, 025h, 08ah
        db      "0%tune offset:+00.00 semi.cent"
        db      08ah, 006h
        db      ".new sample:"
        db      08ah, 003h
        db      "8SLCT TIME RATE  EQ  ", 0
        db      033h, 02fh, 034h, 020h, 020h, 032h, 02fh, 033h, 020h, 000h
        db      " GO  PLAY"
        db      0ffh, 08ch, 06ah, 03dh, 009h
        db      "PARAMETERS of sample:"
        db      08ah, 0e4h, 001h, 025h, 046h, 08ah, 00ch, 00eh
        db      "original pitch:"
        db      08ah, 018h, 017h
        db      "pitch offset:"
        db      08ah, 096h, 017h
        db      "(semi.cent)"
        db      08ah, 000h
        db      " type of playback:"
        db      08ah, 000h
        db      ")loop tune offset:     cents (HOLD only)"
        db      08ah, 003h
        db      "8SLCT PARA SECT JOIN FADE  Reverse-", 0
        db      " REV"
        db      0ffh, 08ch, 06ah, 02bh, 009h
        db      "SECTION"
        db      08ah, 090h, 001h, 074h, 06fh, 03ah, 08ah, 0e4h, 00ah, 025h, 046h, 08dh, 0dbh, 008h, 01dh, 08ch
        db      0bbh, 0e8h, 019h, 08dh, 0deh, 008h, 013h, 08ch, 0beh, 0e8h, 00bh, 08ah, 000h, 00ah
        db      "start:"
        db      08ah, 05ah, 00ah
        db      "end:"
        db      08ah, 003h
        db      "8SLCT PARA SECT JOIN ", 0
        db      "ZIN ", 0
        db      "ZOUT <--> EXEC"
        db      0ffh, 08ch, 06ah, 02bh, 009h
        db      "SECTION"
        db      08ah, 090h, 001h, 074h, 06fh, 03ah, 08ah, 0e4h, 00ah, 025h, 046h, 08dh, 0dbh, 008h, 013h, 08ch
        db      0bbh, 0e8h, 023h, 08ah, 000h, 00ah
        db      "start:"
        db      08ah, 05ah, 00ah
        db      "end:"
        db      08ah, 048h, 038h, 000h
        db      "Select: CHOP ", 0
        db      043h, 055h, 054h, 000h
        db      " EXTR exit"
        db      0ffh, 08ch, 06ah, 019h, 009h
        db      "JOIN"
        db      08ah, 024h, 001h
        db      "A then B --> J  Free:        =   %"
        db      08ah, 072h, 00ah
        db      "first    last   scale"
        db      08ah, 000h, 013h, 041h, 03ah, 08ah, 0e4h, 013h, 064h, 062h, 08ah, 000h, 01ch, 042h, 03ah, 08ah
        db      0e4h, 01ch, 064h, 062h, 08ah, 000h, 025h, 04ah, 03ah, 08ah
        db      "r%X-fade over:"
        db      08ah, 09ch
        db      ".spl"
        db      08ah, 0e4h, 02eh, 06dh, 078h, 08ah, 003h
        db      "8SLCT PARA SECT JOIN FADE A->J SPLI ", 0
        db      04dh, 049h, 058h, 0ffh, 08ch, 06ah, 019h, 009h
        db      "FADE"
        db      08ah, 090h, 001h, 074h, 06fh, 03ah, 08ah, 0e4h, 00ah, 025h, 046h, 08dh, 0dbh, 008h, 01dh, 08ch
        db      0bbh, 0e8h, 019h, 08dh, 0deh, 008h, 013h, 08ch, 0beh, 0e8h, 00bh, 08ah, 000h, 00ah
        db      "start:"
        db      08ah, 05ah, 00ah
        db      "end:"
        db      08ah, 003h
        db      "8SLCT PARA SECT JOIN ", 0
        db      "ZIN ", 0
        db      "ZOUT <-->  GO"
        db      0ffh, 08ch, 06ah, 07fh, 009h
        db      "EFFECTS/REVERB SELECT"
        db      08ah, 084h, 001h, 066h, 06fh, 072h, 08ah, 000h, 00ah
        db      "Chan"
        db      08ah, 03ch, 00ah
        db      "Effects"
        db      08ah, 0a8h, 00ah
        db      "Reverb"
        db      08ah, 002h, 013h
        db      "FX1 "
        db      01fh, 08ah, 084h, 013h, 01fh, 08ah, 002h, 01ch
        db      "FX2 "
        db      01fh, 08ah, 084h, 01ch, 01fh, 08ah, 084h, 025h, 01fh, 08ah, 084h, 02eh, 01fh, 08ah, 006h
        db      "8I/O"
        db      0ffh, 08ch, 06ah, 0e5h, 009h
        db      "FX: EXTERNAL INPUT MIX & GLOBAL OUTPUT"
        db      093h, 02bh, 090h, 00ah, 08ah, 000h, 013h
        db      "external input  L   R"
        db      08ah, 00ch, 01ch
        db      "FX channels:"
        db      08ah, 012h
        db      "%thru level:"
        db      08ah, 0a8h, 01ch
        db      "FX output"
        db      08ah, 006h
        db      "8I/O"
        db      0ffh, 08ch, 06ah, 073h, 009h
        db      "FX EDIT: DISTORTION"
        db      08ah, 08ah, 001h, 03dh, 08ah, 018h, 013h, 022h
        db      "RINGMOD"
        db      022h, 08ah, 072h, 013h
        db      "DISTORT"
        db      08ah, 012h, 01ch
        db      "freq:"
        db      08ah, 050h, 01ch, 048h, 07ah, 08ah, 00ch
        db      "%depth:"
        db      08ah, 04ah, 025h, 025h, 08ah, 06ch, 01ch
        db      "depth:"
        db      08ah
        db      "f%output:"
        db      08ah, 0cch, 013h
        db      "bypass"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 06dh, 009h
        db      "FX EDIT: 4-BAND EQ"
        db      08ah, 08ah, 001h, 03dh, 08ah, 030h, 00ah
        db      "LOW   ", 0
        db      "MID1   MID2   HIGH ", 0
        db      "bypass"
        db      08ah, 006h, 013h
        db      "freq:"
        db      08ah, 03eh, 013h, 048h, 07ah, 08ah, 068h, 013h, 048h, 07ah, 08ah, 092h, 013h, 048h, 07ah, 08ah
        db      0bch, 013h, 048h, 07ah, 08ah, 000h, 01ch
        db      "level:"
        db      08ah, 03eh, 01ch, 064h, 042h, 08ah, 068h, 01ch, 064h, 042h, 08ah, 092h, 01ch, 064h, 042h, 08ah
        db      0bch, 01ch, 064h, 042h, 08ah, 000h
        db      "%width:"
        db      08ah, 006h
        db      ".fmod:"
        db      08ah, 03eh, 02eh, 048h, 07ah, 08ah, 05dh, 02eh, 05eh, 000h
        db      "depth", 0
        db      05eh, 08ah, 0bch, 02eh, 048h, 07ah, 08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 073h, 009h
        db      "FX EDIT: MODULATION"
        db      08ah, 08ah, 001h, 03dh, 08ah, 006h, 00ah
        db      "function:"
        db      08ah, 02ah, 013h
        db      "mode:"
        db      08ah, 024h, 01ch
        db      "speed:"
        db      08ah, 062h, 01ch, 048h, 07ah, 08ah
        db      "$%depth:"
        db      08ah, 012h
        db      ".feedback:"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 073h, 009h
        db      "FX EDIT: MODULATION"
        db      08ah, 08ah, 001h, 03dh, 08ah, 006h, 00ah
        db      "function:"
        db      08ah, 024h, 013h
        db      "speed1:"
        db      08ah, 068h, 013h, 048h, 07ah, 08ah, 024h, 01ch
        db      "speed2:"
        db      08ah, 068h, 01ch, 048h, 07ah, 08ah, 000h
        db      "%acceleration:"
        db      08ah
        db      "h%Sec"
        db      08ah
        db      "*.depth:"
        db      08ah, 08ah, 010h
        db      "init:"
        db      08ah, 090h, 01ch
        db      "Midi Control"
        db      08ah, 08ah
        db      "%cont:"
        db      08ah, 08ah
        db      ".chan:"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 073h, 009h
        db      "FX EDIT: MODULATION"
        db      08ah, 08ah, 001h, 03dh, 08ah, 006h, 00ah
        db      "function:"
        db      08ah, 036h, 013h
        db      "FMOD"
        db      08ah, 08ah, 013h
        db      "AUTOPAN"
        db      08ah, 024h, 01ch
        db      "speed:"
        db      08ah, 062h, 01ch, 048h, 07ah, 08ah
        db      "$%depth:"
        db      08ah, 012h
        db      ".feedback:"
        db      08ah, 084h, 01ch
        db      "speed:"
        db      08ah, 0c2h, 01ch, 048h, 07ah, 08ah, 084h
        db      "%depth:"
        db      08ah, 08ah
        db      ".mode:"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 073h, 009h
        db      "FX EDIT: MODULATION"
        db      08ah, 08ah, 001h, 03dh, 08ah, 006h, 00ah
        db      "function:"
        db      08ah, 054h, 013h
        db      "LEFT     RIGHT"
        db      08ah, 02ah, 01ch
        db      "tune:"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 073h, 009h
        db      "FX EDIT: MODULATION"
        db      08ah, 08ah, 001h, 03dh, 08ah, 006h, 00ah
        db      "function:"
        db      08ah, 054h, 013h
        db      "LEFT     RIGHT"
        db      08ah, 02ah, 01ch
        db      "tune:"
        db      08ah
        db      "$%delay:  000mS"
        db      08ah, 09ch, 025h, 06dh, 053h, 08ah, 012h
        db      ".feedback:"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 073h, 009h
        db      "FX EDIT: DELAY/ECHO"
        db      08ah, 08ah, 001h, 03dh, 08ah, 01eh, 00ah
        db      "mode:"
        db      08ah, 02ah, 013h
        db      "fbk delay:"
        db      08ah, 080h, 013h, 06dh, 053h, 08ah, 030h, 01ch
        db      "feedback:"
        db      08ah, 080h, 01ch, 025h, 08ah
        db      "$%HF damping:"
        db      08ah, 080h, 025h, 048h, 07ah, 08ah, 000h
        db      ".L/R delay offset:"
        db      08ah, 080h, 02eh, 025h, 08ah, 0bah, 01ch
        db      "outputs"
        db      08ah, 0c6h
        db      "%-delay"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 073h, 009h
        db      "FX EDIT: DELAY/ECHO"
        db      08ah, 08ah, 001h, 03dh, 08ah, 01eh, 00ah
        db      "mode:"
        db      08ah, 02ah, 013h
        db      "fbk delay:"
        db      08ah, 080h, 013h, 06dh, 053h, 08ah, 030h, 01ch
        db      "feedback:"
        db      08ah, 080h, 01ch, 025h, 08ah
        db      "$%HF damping:"
        db      08ah, 080h, 025h, 048h, 07ah, 08ah, 000h
        db      ".L/R delay offset:"
        db      08ah, 080h, 02eh, 025h, 08ah, 0bah, 01ch
        db      "outputs"
        db      08ah, 0c6h
        db      "%-delay"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 073h, 009h
        db      "FX EDIT: DELAY/ECHO"
        db      08ah, 08ah, 001h, 03dh, 08ah, 01eh, 00ah
        db      "mode:"
        db      08ah, 04eh, 013h
        db      "LEFT"
        db      08ah, 084h, 013h
        db      "RIGHT"
        db      08ah, 024h, 01ch
        db      "delay:"
        db      08ah, 062h, 01ch, 06dh, 053h, 08ah, 098h, 01ch, 06dh, 053h, 08ah, 012h
        db      "%feedback:"
        db      08ah, 062h, 025h, 025h, 08ah, 098h, 025h, 025h, 08ah, 006h
        db      ".HF damping:"
        db      08ah
        db      "b.Hz"
        db      08ah, 098h, 02eh, 048h, 07ah, 08ah, 0bah, 01ch
        db      "outputs"
        db      08ah, 0c6h
        db      "%-delay"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 073h, 009h
        db      "FX EDIT: DELAY/ECHO"
        db      08ah, 08ah, 001h, 03dh, 08ah, 006h, 013h
        db      "Echo not available in PITCH + FBK mode"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 031h, 009h
        db      "FX EDIT:"
        db      08ah, 048h, 001h
        db      "channel="
        db      08ah, 024h, 013h
        db      "This channel is REVERB only"
        db      08ah
        db      "~8REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 05bh, 009h
        db      "FX EDIT: REVERB"
        db      08ah, 08ah, 001h, 03dh, 08ah, 01eh, 00ah
        db      "type:"
        db      08ah, 012h, 013h
        db      "predelay:"
        db      08ah, 062h, 013h, 06dh, 053h, 08ah, 02ah, 01ch
        db      "time:"
        db      08ah, 018h
        db      "%diffuse:"
        db      08ah, 02ah
        db      ".near:"
        db      08ah
        db      "x%LF damp:"
        db      08ah, 0c2h, 025h, 048h, 07ah, 08ah
        db      "x.HF damp:"
        db      08ah, 0c2h, 02eh, 048h, 07ah, 08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 05bh, 009h
        db      "FX EDIT: REVERB"
        db      08ah, 08ah, 001h, 03dh, 08ah, 01eh, 00ah
        db      "type:"
        db      08ah, 012h, 013h
        db      "predelay:"
        db      08ah, 062h, 013h, 06dh, 053h, 08ah, 02ah, 01ch
        db      "time:"
        db      08ah, 018h
        db      "%diffuse:"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 061h, 009h
        db      "FX PATH & OUTPUT"
        db      08ah, 08ah, 001h, 03dh, 092h, 05eh, 000h, 01ah, 093h, 01bh, 05eh, 01ah, 08ah, 08ah, 00ah, 03dh
        db      08ah, 006h, 00dh
        db      "direct sig:"
        db      08ah, 00ch, 01ch
        db      "path control:"
        db      08ah, 0a2h, 013h
        db      "LEV  PAN  WID"
        db      08ah, 06ch, 01ch
        db      "dist/EQ:"
        db      08ah
        db      "f%mod/echo:"
        db      08ah
        db      "r.reverb:"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 04fh, 009h
        db      "REVERB OUTPUT"
        db      08ah, 08ah, 001h, 03dh, 08ah, 0a2h, 013h
        db      "LEVEL  PAN"
        db      08ah, 072h, 01ch
        db      "reverb:"
        db      08ah, 003h
        db      "8DIST  EQ  ", 0
        db      04dh, 04fh, 044h, 000h
        db      " ECHO ", 0
        db      "REV  OUT ", 0
        db      "COPY"
        db      0ffh, 08ch, 06ah, 061h, 009h
        db      "FX & REVERB COPY"
        db      08ah, 048h, 00bh, 046h, 058h, 08ah, 03ch, 01fh
        db      "REVERB"
        db      08ah, 06ch, 006h
        db      "From:"
        db      08ah, 078h, 00fh, 054h, 06fh, 03ah, 08ah, 06ch, 01ah
        db      "From:"
        db      08ah
        db      "x#To:"
        db      092h, 012h, 056h, 00eh, 092h, 006h, 062h, 022h, 093h, 010h, 068h, 006h, 093h, 010h, 068h, 01ah
        db      092h, 002h, 068h, 005h, 092h, 002h, 068h, 016h, 092h, 002h, 068h, 019h, 092h, 002h, 068h, 02ah
        db      08ah, 006h, 02eh, 01ch
        db      "  to CLIP  "
        db      01dh, 020h, 020h, 01ch
        db      " from CLIP "
        db      01dh, 092h, 009h, 00bh, 031h, 092h, 009h, 045h, 031h, 092h, 004h, 065h, 031h, 092h, 004h, 0a4h
        db      031h, 08ah, 003h
        db      "8 FX  ", 0
        db      "REV ", 0
        db      "FX+R  FX  ", 0
        db      "REV ", 0
        db      "FX+R EXIT COPY"
        db      0ffh, 08ch, 06ah, 043h, 009h
        db      "REVERB COPY"
        db      08ah, 03ch, 01fh
        db      "REVERB"
        db      08ah, 06ch, 01ah
        db      "From:"
        db      08ah
        db      "x#To:"
        db      092h, 006h, 062h, 022h, 093h, 010h, 068h, 01ah, 092h, 002h, 068h, 019h, 092h, 002h, 068h, 02ah
        db      08ah, 006h
        db      ".   to CLIP       from CLIP"
        db      08ah, 003h, 038h, 020h, 020h, 020h, 020h, 020h, 000h
        db      "REV ", 0
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h
        db      "REV ", 0
        db      "     EXIT COPY"
        db      0ffh, 08ch, 06ah, 06ch, 009h
        db      "BASIC MIDI CONTROL"
        db      08ah, 012h, 013h
        db      "SINGLE prog select chan:"
        endif
        if      (XL) && (MODEL = 3200)
        db      08ah, 012h, 01ch
        db      "FOOTSWITCH MIDI channel:"
        endif
        if      XL
        db      08ah, 012h
        db      "%APM external controller:"
        db      08ah, 003h
        db      "8CHAN FILT PPMs RCVE TRAN EXCL SCSI ", 0
        db      052h, 045h, 053h, 0ffh, 08ch, 06ah, 079h, 009h
        else
        db      "8CHAN FILT PPMs RCVE TRAN EXCL SCSI"
        db      0ffh, 08ch, 06ah, 079h, 009h
        endif
        db      "MIDI RECEIVE FILTERS   +on  -off"
        db      08ah, 000h, 00ah
        db      "CHAN:1 2 3 4 5 6 7 8 9 "
        db      010h, 020h, 011h, 020h, 012h, 020h, 013h, 020h, 014h, 020h, 015h, 020h, 016h
        db      " all"
        db      08ah, 00ch, 013h, 04fh, 04eh, 03ah, 08ah, 0deh, 013h, 03ch, 08ah, 000h, 01ch
        db      "WHLS:"
        db      08ah, 0deh, 01ch, 03ch, 08ah, 000h
        db      "%PRES:"
        db      08ah, 0deh, 025h, 03ch, 08ah, 000h
        db      ".LOUD:"
        db      08ah, 0deh, 02eh, 03ch, 08ah, 003h
        db      "8CHAN FILT PPMs RCVE TRAN EXCL SCSI"
        db      0ffh, 08ch, 06ah, 07fh, 009h
        db      "MIDI NOTE PPM DISPLAY"
        db      08dh, 0dbh, 05eh, 00eh, 08ch, 0bbh, 084h, 01ah, 08ah, 014h, 018h
        db      "ON-velocity^"
        db      08ah
        db      "&*channel:- "
        db      089h, 008h, 008h, 031h, 032h, 033h, 034h, 035h, 036h, 037h, 038h, 039h, 010h, 011h, 012h, 013h
        db      014h, 015h, 016h, 083h, 08ah, 003h
        db      "8CHAN FILT PPMs RCVE TRAN EXCL SCSI"
        db      0ffh, 08ch, 06ah, 079h, 009h
        db      "MIDI RECEIVE MONITOR"
        db      08ah, 090h, 001h
        db      "CHAN:"
        db      08ah, 024h, 00ah, 05eh, 08ah, 0c0h, 00ah, 064h, 06fh, 074h, 08ah, 024h, 013h, 05eh, 08ah, 0bah
        db      013h
        db      "means"
        db      08ah, 024h, 01ch, 05eh, 08ah, 0bah, 01ch
        db      "running"
        db      08ah, 024h, 025h, 05eh, 08ah, 0bah
        db      "%status"
        db      08ah, 000h
        db      ".latest >"
        db      08ah, 003h
        db      "8CHAN FILT PPMs RCVE TRAN EXCL SCSI"
        db      095h, 036h, 0a8h, 00ah, 037h, 08ah, 036h, 02eh, 0ffh, 08ch, 06ah, 08bh, 009h
        db      "MIDI NOTE TRANSMIT TEST"
        db      08ah, 030h, 013h
        db      "channel:"
        db      08ah, 042h, 01ch
        db      "note:"
        db      08ah
        db      "*%velocity:"
        db      08ah, 0c0h, 02eh, 01ch
        db      "SEND"
        db      01dh, 08ah, 003h
        db      "8CHAN FILT PPMs RCVE TRAN EXCL  ON  ", 0
        db      04fh, 046h, 046h, 0ffh, 08ch, 06ah, 055h, 009h
        db      "MIDI EXCLUSIVE"
        db      08ah, 05ah, 001h
        db      "channel:     (tran & rec)"
        db      08ah, 00ch, 00ah
        db      "type of transmission:"
        db      08ah, 02ah, 013h
        db      "sample protocol:"
        db      08ah, 030h, 01ch
        db      "single program:"
        db      08ah
        db      "6%single sample:"
        db      08ah, 000h
        db      ".sample number override:"
        db      08ah, 003h
        db      "8CHAN FILT PPMs RCVE TRAN EXCL SCSI SEND"
        db      0ffh, 08ch, 06ah, 06dh, 009h
        db      "SCSI COMMUNICATION"
        db      08ah, 036h, 00ah
        db      "MIDI via SCSI:"
        db      08ah, 036h, 013h
        db      "local SCSI ID:"
        db      08ah, 030h, 01ch
        db      "remote SCSI ID:"
        db      08ah, 003h
        if      XL
        db      "8CHAN FILT PPMs RCVE TRAN EXCL SCSI"
        else
        db      "8CHAN FILT PPMs RCVE TRAN EXCL SCSI Sres"
        endif
        db      0ffh, 08ch, 06ah, 055h, 009h
        db      "LOAD FROM DISK:"
        db      08ah, 08fh, 001h
        db      "vol:"
        db      093h, 02bh, 075h, 00ah, 08ah, 000h, 00ah
        db      "free memory:   %"
        db      08ah, 006h, 013h
        db      "free P/K/S:"
        db      08ah, 000h, 01ch
        db      "type of load:-"
        db      08ah, 000h
        db      ".progs:    samps:"
        db      08ah, 003h
        if      XL
        db      "8LOAD VOLS FIND TAGS SCSI      ", 0
        elseif  (XL = 0) && (MODEL = 3000)
        db      "8FIND SAVE ", 0
        else
        db      "8LOAD SAVE ", 0
        endif
        if      XL = 0
        db      "REN  DEL", 0
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      " HDSK TAGS ", 0
        elseif  (XL = 0) && (MODEL = 3200)
        db      " HDSK FORM ", 0
        endif
        db      043h, 04ch, 052h, 000h
        db      "  GO"
        db      0ffh, 08ch, 06ah, 049h, 009h
        db      "SAVE TO DISK :"
        db      08ah, 08fh, 001h
        db      "vol:"
        db      093h, 02bh, 075h, 00ah, 08ah, 006h, 00ah
        db      "free blocks:"
        db      08ah, 000h, 013h
        db      "free entries:"
        db      08ah, 000h, 01ch
        db      "type of save:-"
        db      08ah, 000h
        db      ".progs:    samps:"
        db      08ah, 003h
        if      XL
        db      "8SAVE VOLS ", 0
        else
        db      "8LOAD SAVE ", 0
        endif
        if      (XL = 0) || ((XL) && (FW_VERSION >= 200)) || ((XL) && (FW_VERSION < 150))
        db      "REN  DEL", 0
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL) && (FW_VERSION >= 200))
        db      " SCSI FORM WIPE  GO"
        elseif  (XL) && (FW_VERSION = 150)
        db      "REN  D"
        dw      far_24d55+4c00h, 2000h
        db      "SCSI FORM WIPE  GO"
        else
        db      " HDSK FORM WIPE  GO"
        endif
        db      0ffh, 08ch, 06ah, 055h, 009h
        db      "RENAME ON DISK:"
        db      08ah, 08fh, 001h
        db      "vol:"
        db      093h, 02bh, 075h, 00ah, 08ah, 000h, 00ah
        db      "new name:-"
        db      08ah, 000h, 01ch
        db      "vol load number:"
        db      08ah, 000h
        db      "%vol load enable:"
        db      08ah, 000h
        db      ".rename VOL or FILE"
        db      08ah, 003h
        if      XL
        db      "8SAVE VOLS ", 0
        else
        db      "8LOAD SAVE ", 0
        endif
        if      (XL = 0) || ((XL) && (FW_VERSION >= 200)) || ((XL) && (FW_VERSION < 150))
        db      "REN  DEL", 0
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL) && (FW_VERSION >= 200))
        db      " SCSI FORM ", 0
        elseif  (XL) && (FW_VERSION = 150)
        db      "REN  D"
        dw      far_24d55+4c00h, 2000h
        db      "SCSI FORM ", 0
        else
        db      " HDSK FORM ", 0
        endif
        db      056h, 04fh, 04ch, 000h
        db      " FILE"
        db      0ffh, 08ch, 06ah, 025h, 009h
        db      "DELETE   disk:"
        db      08ah, 08fh, 001h
        db      "vol:"
        if      (XL) || (MODEL = 3000)
        db      093h, 02bh, 075h, 00ah, 08ah, 006h, 00ah
        else
        db      093h, 02bh, 075h, 00ah, 08ah, 000h, 00ah
        endif
        db      "free blocks:"
        db      08ah, 000h, 013h
        if      (XL) || (MODEL = 3000)
        db      "free entries:"
        db      08ah, 000h, 01ch
        endif
        db      "type of delete:-"
        if      (XL) || (MODEL = 3000)
        db      08ah, 000h
        db      ".progs:    samps:"
        endif
        db      08ah, 003h
        if      XL
        db      "8SAVE VOLS ", 0
        else
        db      "8LOAD SAVE ", 0
        endif
        if      (XL = 0) || ((XL) && (FW_VERSION >= 200)) || ((XL) && (FW_VERSION < 150))
        db      "REN  DEL", 0
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL) && (FW_VERSION >= 200))
        db      " SCSI FORM       GO"
        elseif  (XL) && (FW_VERSION = 150)
        db      "REN  D"
        dw      far_24d55+4c00h, 2000h
        db      "SCSI FORM       GO"
        endif
        if      XL
        db      0ffh, 08ch, 06ah, 06dh, 009h
        db      "SCSI DRIVE CONTROL"
        else
        db      " HDSK FORM       GO"
        db      0ffh, 08ch, 06ah, 067h, 009h
        db      "HARD DISK CONTROL"
        endif
        if      (XL) || (MODEL = 3000)
        db      08ah, 03ch, 00ah
        endif
        if      XL
        db      "drive SCSI ID:"
        elseif  (XL = 0) && (MODEL = 3000)
        db      "SCSI drive ID:"
        endif
        db      08ah, 03ch, 013h
        if      (XL = 0) && (MODEL = 3200)
        db      "SCSI drive ID:"
        db      08ah, 03ch, 01ch
        endif
        db      "local SCSI ID:"
        if      XL
        db      08ah, 024h, 01ch
        db      "drive sector size:"
        elseif  (XL = 0) && (MODEL = 3000)
        db      08ah, 006h, 01ch
        db      "SCSI drive sector size:"
        db      08ah, 01eh
        db      "%Volume list screen:"
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL = 0) && (MODEL = 3000))
        db      08ah
        endif
        if      (XL) && (MODEL = 3200)
        db      "B+MO drive/fan:"
        elseif  (XL = 0) && (MODEL = 3000)
        db      "Z.MO drive:"
        elseif  (XL = 0) && (MODEL = 3200)
        db      08ah, 006h
        db      "%SCSI drive sector size:"
        db      08ah, 000h
        db      ".Press PARK to set heads to safe position"
        db      08ah, 05ah, 00ah
        db      "MO drive:"
        endif
        db      08ah, 003h
        if      XL
        db      "8SAVE VOLS ", 0
        else
        db      "8LOAD SAVE ", 0
        endif
        if      (XL = 0) || ((XL) && (FW_VERSION >= 200)) || ((XL) && (FW_VERSION < 150))
        db      "REN  DEL", 0
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL) && (FW_VERSION >= 200))
        db      " SCSI FORM"
        elseif  (XL) && (FW_VERSION = 150)
        db      "REN  D"
        dw      far_24d55+4c00h, 2000h
        db      "SCSI FORM"
        endif
        if      XL
        db      0ffh, 08ch, 06ah, 06dh, 009h
        db      "SCSI DRIVE CONTROL"
        db      08ah, 03ch, 00ah
        db      "drive SCSI ID:"
        db      08ah, 03ch, 013h
        db      "local SCSI ID:"
        db      08ah, 024h, 01ch
        db      "drive sector size:"
        endif
        if      (XL) && (MODEL = 3200)
        db      08ah
        db      "B+MO drive/fan:"
        endif
        if      XL
        db      08ah, 003h
        db      "8LOAD VOLS FIND TAGS SCSI"
        db      08ah, 0b7h
        db      "8Rlnd EIII"
        else
        db      " HDSK FORM Sres PARK"
        endif
        db      0ffh, 08ch, 06ah, 09dh, 009h
        db      "FORMAT FLOPPY OR HARD DISK :"
        db      08ah, 05ah, 00ah
        db      "BLOCKS"
        db      08ah, 096h, 00ah
        db      "HARD PARTITIONS"
        db      08ah, 000h, 013h
        db      "track:"
        db      08ah, 048h, 013h
        db      "good:"
        db      08ah, 09ch, 013h
        db      "size:   Mb"
        db      08ah, 006h, 01ch
        db      "side:"
        db      08ah, 04eh, 01ch
        db      "bad:"
        db      08ah, 0a2h, 01ch
        db      "max:"
        db      08ah, 000h
        if      XL
        db      ".floppy format density:          "
        else
        db      ".FORMat or ARRange floppy disk-> "
        endif
        db      01ch
        db      "START"
        db      01dh, 08ah, 003h
        if      XL
        db      "8SAVE VOLS ", 0
        else
        db      "8LOAD SAVE ", 0
        endif
        if      (XL = 0) || ((XL) && (FW_VERSION >= 200)) || ((XL) && (FW_VERSION < 150))
        db      "REN  DEL", 0
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL) && (FW_VERSION >= 200))
        db      " SCSI FORM FORM ", 0
        elseif  (XL) && (FW_VERSION = 150)
        db      "REN  D"
        dw      far_24d55+4c00h, 2000h
        db      "SCSI FORM FORM ", 0
        endif
        if      XL
        db      041h, 052h, 052h, 0ffh, 08ch, 06ah, 06dh, 009h
        db      "DAT BACKUP/RESTORE"
        else
        db      " HDSK FORM FORM ", 0
        db      041h, 052h, 052h, 0ffh, 0ffh, 08ch, 06ah, 055h, 009h
        db      "DIGITAL BACKUP"
        endif
        db      08ah, 0a2h, 001h
        db      "programs:"
        db      08ah, 0a8h, 00ah
        db      "samples:"
        db      08ah, 0aeh, 013h
        db      "Qlists:"
        db      08ah, 0aeh, 01ch
        db      "Tlists:"
        db      08ah, 0c6h, 025h, 046h, 058h, 03ah, 08ah, 0bah
        if      XL
        db      ".multi:"
        else
        db      ".drum:"
        endif
        db      08ah, 00ch, 00ah
        db      "current vol:"
        db      08ah, 000h, 013h
        db      "complete vols:"
        db      08ah, 00ch, 01ch
        db      "backup type:"
        db      08ah, 000h
        db      "%transmit:"
        if      XL = 0
        db      08ah, 003h
        db      "8     DIGI"
        endif
        db      08ah, 0b7h
        db      "8SAVE LOAD"
        if      (XL) || (MODEL = 3000)
        db      0ffh, 08ch, 06ah, 055h, 009h
        db      "FIND FROM DISK:"
        db      093h, 02bh, 075h, 00ah, 08ah, 005h, 01eh
        db      "CLR / GO to load:-"
        db      092h, 075h, 000h, 019h, 08ah, 005h, 00dh
        db      "Find:"
        db      08ah, 003h
        endif
        if      XL
        db      "8LOAD VOLS FIND TAGS SCSI FIND ", 0
        elseif  (XL = 0) && (MODEL = 3000)
        db      "8LOAD FIND ", 0
        db      "REN  DEL", 0
        db      " HDSK TAGS ", 0
        endif
        if      (XL) || (MODEL = 3000)
        db      043h, 04ch, 052h, 000h
        db      "  GO"
        db      0ffh, 08ch, 06ah, 055h, 009h
        db      "DISK FILE TAGS:"
        db      08ah, 08fh, 001h
        db      "vol:"
        db      093h, 02bh, 075h, 00ah, 093h, 02bh, 06bh, 00ah, 08ah, 000h, 00ch
        db      "Select Tag:-"
        db      08ah, 000h
        db      "!Type of load:-"
        db      08ah, 003h
        endif
        if      XL
        db      "8LOAD VOLS FIND TAGS NEXT MARK ", 0
        elseif  (XL = 0) && (MODEL = 3000)
        db      "8LOAD SAVE NEXT ", 0
        db      044h, 045h, 04ch, 000h
        db      " HDSK MARK ", 0
        endif
        if      (XL) || (MODEL = 3000)
        db      043h, 04ch, 052h, 000h
        db      "  GO"
        endif
        if      XL
        db      0ffh, 08ch, 06ah, 05bh, 009h
        db      "VOLUMES ON DISK:"
        elseif  (XL = 0) && (MODEL = 3000)
        db      0ffh, 08ch, 06ah, 055h, 009h
        db      "LOAD FROM DISK:"
        endif
        if      (XL) || (MODEL = 3000)
        db      093h, 02bh, 075h, 00ah, 08ah, 07eh, 00fh
        db      "free memory:   %"
        db      08ah, 084h, 018h
        db      "free P/K/S:"
        db      08ah
        db      "~%Disk Volumes:"
        db      08ah, 003h
        endif
        if      XL
        db      "8LOAD VOLS FIND TAGS SCSI"
        db      0ffh, 08ch, 06ah, 05bh, 009h
        db      "VOLUMES ON DISK:"
        db      093h, 02bh, 075h, 00ah, 08ah, 07eh, 00fh
        db      "free memory:   %"
        db      08ah, 084h, 018h
        db      "free P/K/S:"
        db      08ah
        db      "~%Disk Volumes:"
        db      08ah, 003h
        db      "8SAVE VOLS ", 0
        elseif  (XL = 0) && (MODEL = 3000)
        db      "8FIND SAVE ", 0
        endif
        if      ((XL) && (FW_VERSION >= 200)) || ((XL = 0) && (MODEL = 3000)) || ((XL) && (FW_VERSION < 150))
        db      "REN  DEL", 0
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL) && (FW_VERSION >= 200))
        db      " SCSI FORM"
        elseif  (XL) && (FW_VERSION = 150)
        db      "REN  D"
        dw      far_24d55+4c00h, 2000h
        db      "SCSI FORM"
        elseif  (XL = 0) && (MODEL = 3000)
        db      " HDSK TAGS"
        db      08ah, 0d5h
        db      "8OPEN"
        endif
        db      0ffh, 08ch, 06ah, 0f0h, 009h, 08ah, 024h, 001h
        db      "TRANSPOSE"
        db      08ah, 09ch, 001h
        db      "FINE TUNE"
        db      08ah, 00fh, 00ah, 02dh, 037h, 020h, 02dh, 034h, 000h, 020h, 020h, 030h, 020h, 020h, 000h, 02bh
        db      034h, 020h, 02bh, 037h, 08ah, 07eh, 00ah, 02dh, 035h, 030h, 020h, 020h, 020h, 020h, 020h, 020h
        db      030h, 020h, 020h, 020h, 020h, 020h, 020h, 02bh, 035h, 030h, 08ah, 006h, 013h, 017h, 01bh, 01ah
        db      01bh, 01bh, 01ah, 01bh, 01bh, 01bh, 01ah, 01bh, 01bh, 01bh, 01ah, 01bh, 01bh, 01ah, 01bh, 018h
        db      08ah, 082h, 013h, 017h, 019h, 08bh, 0fch, 000h, 019h, 019h, 019h, 019h, 019h, 019h, 019h, 01ah
        db      019h, 019h, 019h, 019h, 019h, 019h, 019h, 019h, 08bh, 0fch, 000h, 018h, 08ah, 022h
        db      " SEMI-TONES"
        db      08ah, 0a8h
        db      " CENTS"
        db      08ah
        db      "H/Master Level:"
        db      08ah, 0c0h, 02eh, 01ch
        db      "tone"
        db      01dh, 08ah, 003h, 038h, 000h
        db      "dec  inc"
        db      08ah, 0bdh
        db      "8ON  ", 0
        if      XL
        db      04fh, 046h, 046h, 0ffh, 08ch, 06ah, 031h, 009h
        else
        db      04fh, 046h, 046h, 0ffh, 08ch, 06ah, 04fh, 009h
        db      "HELP FACILITY   Tuning and Master Level"
        db      08ah, 001h, 009h
        db      " Use the cursor keys to transpose key."
        db      08ah, 001h, 012h
        db      " Use the data wheel to change tuning."
        db      08ah, 001h, 01bh
        db      " Use the softkeys to change the Level."
        db      08ah, 003h, 038h, 000h
        db      "dec  inc"
        db      08ah, 0bdh
        db      "8ON  ", 0
        db      04fh, 046h, 046h, 0ffh, 08ch, 06ah, 037h, 009h
        db      "UTILITIES"
        db      08ah, 003h, 00ah
        db      "The following utilities are available:"
        db      08ah, 000h, 013h
        db      "* ME-35T Interface"
        db      08ah, 000h, 01ch
        db      "  Digital Audio"
        db      08ah, 000h
        db      "%  Cue-lists (Smpte)"
        db      08ah, 003h
        db      "8DRUM DIGI SMPT  DD"
        db      08ah, 000h
        db      ".* Direct-to-disk Recording"
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      08ah, 0d8h
        db      "8ROM"
        endif
        if      (XL = 0) && (FW_VERSION >= 200)
        db      08ah, 099h
        db      "8Rlnd"
        db      08ah, 0b7h
        db      "8EMU3"
        db      0ffh, 0ffh, 08ch, 06ah, 04fh, 009h
        elseif  (XL = 0) && (FW_VERSION < 200)
        db      0ffh, 08ch, 06ah, 04fh, 009h
        endif
        if      XL = 0
        db      "HELP FACILITY   Utilities and Options"
        db      08ah, 001h, 009h
        db      " This screen indicates which additional"
        db      08ah, 001h, 012h
        db      "features are available on this machine."
        db      08ah, 001h, 01bh
        db      " Use the relevant soft-key to select"
        db      08ah, 001h
        db      "$the feature you require."
        db      08ah, 000h
        db      ".[Sorry, SMPTE not available on S2800.]"
        db      08ah, 003h
        db      "8DRUM DIGI SMPT  DD"
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      08ah, 0d8h
        db      "8ROM"
        endif
        if      XL = 0
        db      0ffh, 08ch, 06ah, 031h, 009h
        endif
        db      "DD TAKES"
        db      08ah, 07eh, 001h
        db      "take:"
        db      08ah, 000h, 00ah
        db      "name:"
        db      08ah, 08ah, 00ah
        db      "length:"
        db      08ah, 096h, 013h
        db      "type:"
        db      08ah, 006h, 01ch
        db      "show:"
        db      08ah, 096h, 01ch
        db      "rate:"
        db      08ah, 000h
        db      "%total:"
        db      08ah, 006h
        db      ".free:"
        db      08ah, 090h
        db      ".takes:"
        db      08ah, 003h
        if      XL
        db      "8 DD  SONG PLAY EDIT DREC TAKE SCSI ", 0
        db      044h, 045h, 04ch, 0ffh, 08ch, 06ah, 061h, 009h
        else
        db      "8 DD  SONG PLAY EDIT DREC TAKE ", 0
        db      "     DEL"
        db      0ffh, 08ch, 06ah, 061h, 009h
        endif
        db      "DD RECORD SET-UP"
        db      08ah, 07eh, 001h
        db      "take:"
        if      XL
        db      093h, 022h, 078h, 00ch, 08ah, 00ch, 00ah
        else
        db      093h, 028h, 078h, 00ch, 08ah, 00ch, 00ah
        endif
        db      "mode:"
        if      XL
        db      08ah, 000h, 013h
        db      "source:"
        db      08ah, 006h, 01ch
        db      "start:"
        db      08ah, 000h
        db      "%predel:    mS"
        db      08ah, 000h
        db      ".FX bus:FX1 send:"
        endif
        db      08ah, 096h, 00ah
        db      "free:"
        if      XL = 0
        db      08ah, 000h, 013h
        db      "source:"
        endif
        db      08ah, 08ah, 013h
        db      "length:"
        if      XL = 0
        db      08ah, 000h, 01ch
        db      "dig.in:"
        endif
        db      08ah, 08ah, 01ch
        db      "note:"
        if      XL
        db      08ah, 0c6h, 01ch, 063h, 068h, 03ah, 08ah
        else
        db      08ah, 0c6h, 01ch, 063h, 068h, 03ah, 08ah, 006h
        db      "%start:"
        db      08ah
        endif
        db      "~%stereo:"
        db      08ah, 0c0h
        db      "%pan:"
        if      XL
        db      08ah
        db      "~.output:"
        db      08ah, 0c6h, 02eh, 074h, 06fh, 03ah, 08ah, 003h
        else
        db      08ah, 000h
        db      ".predel:    mS"
        db      08ah, 084h
        db      ".indiv:"
        db      08ah, 0c0h, 02eh, 02dh, 02dh, 03eh, 08ah, 003h
        endif
        db      "8 DD  SONG PLAY EDIT DREC TAKE BU.L"
        db      0ffh, 08ch, 06ah, 037h, 009h
        db      "DD RECORD"
        db      08ah, 03ch, 001h
        db      "mode:"
        db      08dh, 0dbh, 008h, 013h, 08ch, 0bbh, 0e8h, 023h, 08ah, 000h, 00ah
        db      "-  dB  free:"
        db      08ah, 08ah, 00ah
        db      "length:"
        db      08ah, 003h
        db      "8 DD  SONG PLAY EDIT DREC METR Moff ", 0
        db      041h, 052h, 04dh, 0ffh, 08ch, 06ah, 06dh, 009h
        db      "DD PLAY/PARAMETERS"
        db      08ah, 07eh, 001h
        db      "take:"
        db      08ah, 000h, 00ah
        db      "samp.rate:"
        if      XL
        db      08ah, 060h, 00ah, 048h, 07ah, 08ah, 000h, 013h
        else
        db      08ah, 060h, 00ah, 048h, 07ah, 08ah, 07eh, 00ah
        db      "start:"
        db      08ah, 000h, 013h
        endif
        db      "varispeed:"
        if      XL
        db      08ah, 066h, 013h, 025h, 08ah, 00ch, 01ch
        db      "fade in:"
        db      08ah, 05ah, 01ch, 06dh, 053h, 08ah, 00ch
        db      "%fadeout:"
        else
        db      08ah, 066h, 013h, 025h, 08ah, 07eh, 013h
        db      "predelay:    mS"
        db      08ah, 00ch
        db      "%fade in:"
        endif
        db      08ah
        db      "Z%mS"
        if      XL
        db      08ah, 000h
        db      ".FX bus:    send:"
        db      08ah, 07eh, 00ah
        db      "start:"
        db      08ah, 07eh, 013h
        db      "predelay:    mS"
        else
        db      08ah, 00ch
        db      ".fadeout:"
        db      08ah
        db      "Z.mS"
        endif
        db      08ah, 084h, 01ch
        db      "note:"
        db      08ah, 0c6h, 01ch, 063h, 068h, 03ah, 08ah
        db      "x%stereo:"
        db      08ah, 0c0h
        db      "%pan:"
        db      08ah
        if      XL
        db      "x.output:"
        db      08ah, 0c6h, 02eh, 074h, 06fh, 03ah, 08ah, 003h
        else
        db      "~.indiv:"
        db      08ah, 0c0h, 02eh, 02dh, 02dh, 03eh, 08ah, 003h
        endif
        db      "8 DD  SONG PLAY EDIT DREC TAKE BU.S PRME"
        db      0ffh, 08ch, 06ah, 000h, 000h, 07ch, 08ah, 04eh, 001h, 01eh, 02dh, 08ah, 08ah, 001h, 02dh, 01fh
        db      092h, 0f0h, 000h, 012h, 092h, 0f0h, 000h, 013h, 092h, 0f0h, 000h, 035h, 08ah, 006h, 00ah
        db      "start:"
        db      08ah, 084h, 00ah
        db      "end:"
        db      08ah, 003h
        db      "8 DD  SONG PLAY EDIT ", 0
        db      05ah, 049h, 04eh, 000h
        db      " ZOUT S<>E ", 0
        db      043h, 055h, 054h, 0ffh, 08ch, 06ah, 013h, 009h, 08ah, 063h, 001h, 06eh, 074h, 08ah, 075h, 001h
        db      063h, 068h, 08ah, 085h, 001h, 06ch, 076h, 08ah, 095h, 001h, 070h, 061h, 06eh, 08ah, 0adh, 001h
        db      066h, 069h, 06eh, 08ah, 0c7h, 001h
        db      "fout"
        db      08ah, 0e3h, 001h, 072h, 070h, 08ah, 003h
        db      "8 DD  S.ED PLAY EDIT DREC TAKE      ", 0
        db      052h, 055h, 04eh, 0ffh, 08ch, 06ah, 013h, 009h, 08ah, 063h, 001h, 06eh, 074h, 08ah, 075h, 001h
        db      063h, 068h, 08ah, 085h, 001h, 06ch, 076h, 08ah, 095h, 001h, 070h, 061h, 06eh, 08ah, 0adh, 001h
        db      066h, 069h, 06eh, 08ah, 0c7h, 001h
        db      "fout"
        db      08ah, 0e3h, 001h, 072h, 070h, 08ah, 003h
        db      "8 DD  SONG PLAY EDIT MARK BLCK ", 0
        db      "INS  DEL"
        db      0ffh, 08ch, 06ah, 061h, 009h
        db      "TAKE BACKUP SAVE"
        db      08ah, 07eh, 001h
        db      "take:"
        db      08ah, 006h, 013h
        db      "transmit rate:"
        db      08ah, 084h, 02eh, 01ch
        db      "save"
        db      01dh, 08ah, 003h
        db      "8 DD  SONG PLAY EDIT ", 0
        db      "ONE  ALL ", 0
        db      "BU.S STOP"
        db      0ffh, 08ch, 06ah, 061h, 009h
        db      "TAKE BACKUP LOAD"
        db      08dh, 0dbh, 008h, 013h, 08ch, 0bbh, 0e8h, 023h, 08ah, 036h, 00ah
        db      "free:"
        db      08ah, 090h, 00ah
        db      "length:"
        db      08ah, 003h
        db      "8 DD  SONG PLAY EDIT DREC TAKE BU.L ", 0
        db      041h, 052h, 04dh, 0ffh, 08ch, 06ah, 031h, 009h
        db      "DD TAKES"
        db      08ah, 07eh, 001h
        db      "take:"
        db      08ah, 000h, 00ah
        db      "name:"
        db      08ah, 08ah, 00ah
        db      "length:"
        db      08ah, 096h, 013h
        db      "type:"
        db      08ah, 006h, 01ch
        db      "show:"
        db      08ah, 096h, 01ch
        db      "rate:"
        db      08ah, 000h
        db      "%total:"
        db      08ah, 006h
        db      ".free:"
        db      08ah, 090h
        db      ".takes:"
        db      08ah, 066h, 038h, 000h
        db      "Select: COPY ", 0
        db      052h, 045h, 04eh, 000h
        db      " exit"
        if      XL
        db      0ffh, 08ch, 06ah, 06dh, 009h
        db      "SCSI DRIVE CONTROL"
        db      08ah, 03ch, 00ah
        db      "drive SCSI ID:"
        db      08ah, 03ch, 013h
        db      "local SCSI ID:"
        db      08ah, 024h, 01ch
        db      "drive sector size:"
        endif
        if      (XL) && (MODEL = 3200)
        db      08ah
        db      "B+MO drive/fan:"
        endif
        if      XL
        db      08ah, 003h
        db      "8 DD  SONG PLAY EDIT DREC TAKE SCSI"
        endif
        db      0ffh, 08ch, 06ah, 01fh, 009h
        db      "QPLAY"
        db      08ah, 083h, 001h
        db      "time   :  :  :"
        db      08ah, 003h
        db      "8PLAY EDIT SMPT GRAB Pext Pint Cint STOP"
        db      0ffh, 08ch, 06ah, 013h, 009h, 051h, 045h, 044h, 08ah, 018h, 001h, 06dh, 074h, 03ah, 08ah, 089h
        db      001h, 073h, 06ch, 03ah, 08ah, 003h
        db      "8PLAY EDIT MARK BLCK ", 0
        db      "INS  DEL ", 0
        db      "SLIP SORT"
        db      0ffh, 08ch, 06ah, 01fh, 009h
        db      "SMPTE"
        db      08ah, 087h, 001h
        db      "H  M  S  F"
        db      08ah, 0d8h, 001h, 066h, 02fh, 073h, 08ah, 024h, 00ah
        db      "receive time:-    :  :  :"
        db      08ah, 018h, 01ch
        db      "transmit start:-"
        db      08ah, 00ch
        db      "%current transmit:-    :  :  :"
        db      08ah, 0a2h, 02eh, 01ch
        db      "tran"
        db      01dh, 08ah, 003h
        db      "8PLAY EDIT SMPT      RCVE STRT CONT STOP"
        if      XL = 0
        db      0ffh, 08ch, 06ah, 0c7h, 009h
        db      "TIMECODE INTERFACE - Not present!"
        db      08ah, 00ah, 00ah
        db      "To add the control of SMPTE timecode"
        db      08ah, 001h, 013h
        db      "and Cue-lists of events driven from"
        db      08ah, 001h, 01ch
        db      "it, you will need SMPTE interface card."
        db      08ah, 00ah
        db      "%Consult your dealer."
        db      08ah, 000h
        db      ".[Cue-lists not available on the S2800.]"
        db      08ah, 0d5h
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      "8exit"
        elseif  (XL = 0) && (MODEL = 3200)
        db      "8CONT"
        endif
        db      0ffh, 08ch, 06ah, 067h, 009h
        db      "DIGITAL INTERFACE - Transmit"
        db      08ah, 028h, 00ch
        db      "transmit rate:"
        db      08ah, 028h, 015h
        db      "       format:"
        db      08ah, 003h
        db      "8 TX  BACK"
        db      0ffh, 08ch, 06ah, 0c1h, 009h
        db      "DIGITAL INTERFACE - Not present!"
        db      08ah, 00ah, 00ah
        db      "To receive and transmit digital audio"
        db      08ah, 001h, 013h
        db      "and to use the dat backup facility, you"
        db      08ah, 001h, 01ch
        db      "will need to fit a digital audio"
        db      08ah, 001h
        db      "%interface card."
        db      08ah, 00ah
        db      ".Please consult your dealer."
        db      08ah, 0d5h
        if      (XL) || (MODEL = 3000)
        db      "8exit"
        else
        db      "8CONT"
        endif
        db      0ffh, 08ch, 06ah, 073h, 009h
        db      "DRUM INPUT SETTINGS"
        db      08ah, 084h, 001h
        db      "name:"
        db      08dh, 0dbh, 0a6h, 012h, 08ch, 0bbh, 044h, 01eh, 08dh, 0dch, 0a6h, 00dh, 08ch, 0bch, 044h, 006h
        db      08ah, 000h, 00ah
        db      "unit:"
        db      08ah, 04eh, 00ah
        db      "input:"
        db      08ah, 000h, 013h
        db      "chan:"
        db      08ah, 042h, 013h
        db      "capture:   mS"
        db      08ah, 000h, 01ch
        db      "note:"
        db      08ah, 042h, 01ch
        db      "recover:   mS"
        db      08ah, 000h
        db      "%sens:"
        db      08ah
        db      "B%on-time:   mS"
        db      08ah, 000h
        db      ".trig:"
        db      08ah
        db      "B.V-curve:"
        db      08ah, 091h
        db      "4IN:-"
        db      089h, 008h, 008h, 031h, 032h, 033h, 034h, 035h, 036h, 037h, 038h, 083h, 08ah, 003h
        db      "8EDIT CONT"
        db      0ffh, 08ch, 06ah, 067h, 009h
        db      "DRUM UNIT CONTROL"
        db      08ah, 07eh, 00ah
        db      "UNIT 1"
        db      08ah, 0bah, 00ah
        db      "UNIT 2"
        db      08ah, 030h, 013h
        db      "operation:"
        db      08ah, 000h, 01ch
        db      "exclusive channel:"
        db      08ah, 006h
        db      "%MIDI thru enable:"
        db      08ah, 003h
        db      "8EDIT CONT"
        if      XL
        db      0ffh, 08ch, 06ah, 097h, 009h
        db      "GLOBAL AND UTILITIES MENU"
        db      093h, 02bh, 07bh, 00ah, 08ah, 000h, 00eh
        db      "TUNE=tune & level"
        db      08ah, 000h, 017h
        db      "MIDI=midi utilities"
        elseif  (XL = 0) && (MODEL = 3200)
        db      0ffh, 08ch, 06ah, 00dh, 009h, 046h, 058h, 08ah, 018h, 001h
        db      "tap #:"
        db      08ah, 006h, 00ah
        db      "position:"
        db      08ah, 012h, 013h
        db      "weight:"
        db      08ah, 006h, 01ch
        db      "function:"
        db      08ah, 078h, 001h
        db      "send lev:    ->"
        db      08ah, 0a2h, 00ah
        db      "direct:"
        db      08ah, 0a8h, 013h
        db      "decay:"
        db      08ah, 09ch, 01ch
        db      "pre-del:"
        db      08ah, 0a2h
        db      "%spread:"
        endif
        if      (XL) || (MODEL = 3200)
        db      08ah, 000h
        endif
        if      XL
        db      " DRUM=ME35T interface"
        db      08ah, 000h
        db      ")DAT =backup/restore"
        db      08ah, 07eh, 00eh
        db      "SMF =midi song play"
        db      08ah, 07eh, 017h
        db      "DD  =disk recorder"
        endif
        if      (XL) && (MODEL = 3200)
        db      08ah
        db      "~ CUE =SMPTE cue-list"
        elseif  (XL = 0) && (MODEL = 3200)
        db      "%model:"
        db      08ah, 006h
        db      ".size:"
        db      08ah, 003h
        db      "8                          ON   OFF"
        db      0ffh
        db      "HELP Delay Line development tool"
        db      08ah, 001h, 00ah
        db      " Select a tap number and adjust the"
        db      08ah, 001h, 013h
        db      "function, weight and position. Some   "
        db      08ah, 001h, 01ch
        db      "preset patches are available via the  "
        db      08ah, 001h
        db      "%softkeys. Hit disp to change display. "
        db      08ah, 003h
        db      "8echo rvrb hall ping ster chor  OFF DISP"
        endif
        if      XL = 0
        db      0ffh, 08ch, 06ah, 0a3h, 009h
        db      "parameter field description"
        db      08ah, 003h, 012h
        db      "a help page"
        endif
        db      08ah, 003h
        if      XL
        db      "8TUNE MIDI DRUM ", 0
        db      "DAT  SMF ", 0
        endif
        if      (XL) && (MODEL = 3000)
        db      " DD      "
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (MODEL = 3200)
        db      " DD  ", 0
        db      043h, 055h, 045h, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      XL
        db      "-18dB"
        else
        db      "8soft keys text also seen from this page"
        db      0ffh, 08ah, 003h, 01bh
        db      "soft 1"
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      0ffh, 0ffh, 08ch, 06ah, 055h, 009h
        db      "PIANO ROM MODE"
        db      08ah, 093h
        db      " Transpose:"
        db      08ah, 0b1h
        db      "*Tune:"
        db      08ah, 000h, 00ch
        db      "Program number:"
        db      08ah, 036h, 016h
        db      "Level:"
        db      08ah, 081h, 016h
        db      "MIDI channel:"
        db      08ah
        db      "$ FX level:"
        db      08ah, 01eh
        db      "*FX select:"
        db      08ah, 0beh
        db      "8FX:"
        db      08ah, 0d5h
        db      "8MUTE"
        endif
        if      (XL) || ((XL = 0) && (FW_VERSION >= 200))
        db      0ffh
        endif
        if      XL
        db      "-12dB"
        elseif  (XL = 0) && (FW_VERSION = 150)
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      "    DISK IS READY FOR USE               "
        endif
        if      (XL) || (MODEL = 3000)
        db      0ffh
        endif
        if      XL
        db      " -6dB"
        db      0ffh
        db      " +0dB"
        db      0ffh
        db      " +6dB"
        db      0ffh
        db      "+12dB"
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL) && (FW_VERSION >= 200))
        db      0ffh
        db      "+18dB"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (FW_VERSION = 150)
        db      0ffh, 02bh, 031h, 038h, 064h
        dw      main+0ff40h, 0
        db      000h, 000h, 000h, 000h
        endif
        if      XL
        db      "OK      "
        db      0ffh
        db      "SHORTED ADDR?"
        db      0ffh
        db      "R/W ERRORS   "
        db      0ffh
        db      "NO CARD ?    "
        db      0ffh
        db      "NOT TESTED   "
        db      0ffh
        db      "testing "
        db      0ffh
        db      "1Mwrd"
        db      0ffh
        db      "4Mwrd"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 081h, 083h, 08ch, 06ah, 049h
        db      009h
        db      "Softkey help"
        db      08ah, 00ah, 00ah
        db      "This softkey "
        db      0ffh, 083h, 08ch, 06ah, 055h, 009h
        db      "Parameter help"
        db      08ah, 00ah, 00ah
        db      "This parameter "
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c0h, 040h, 083h, 0a7h, 000h, 000h, 000h, 000h
        db      0c1h, 041h, 0ach, 0adh, 000h, 000h, 000h, 000h, 0c2h, 042h, 087h, 084h, 000h, 000h, 000h, 000h
        db      0c3h, 043h, 088h, 085h, 000h, 000h, 000h, 000h, 0c4h, 044h, 089h, 086h, 000h, 000h, 000h, 000h
        db      0c5h, 045h, 0aah, 0abh, 000h, 000h, 000h, 000h, 0c6h, 046h, 082h, 0a6h, 000h, 000h, 000h, 000h
        db      0c7h, 047h, 081h, 080h, 000h, 000h, 000h, 000h, 048h, 040h, 058h, 08ah, 000h, 000h, 000h, 000h
        db      049h, 041h, 0ach, 0adh, 000h, 000h, 000h, 000h
        db      "JBPS", 0
        db      000h, 000h, 000h
        db      "KCQT", 0
        db      000h, 000h, 000h
        db      "LDRU", 0
        db      000h, 000h, 000h, 04dh, 045h, 0a5h, 0a8h, 000h, 000h, 000h, 000h, 04eh, 046h, 057h, 0a9h, 000h
        db      000h, 000h, 000h
        db      "OGVY", 0
        db      000h, 000h, 000h, 08ah, 040h, 083h, 0a7h, 000h, 000h, 000h, 000h, 08bh, 041h, 0ach, 0adh, 000h
        db      000h, 000h, 000h, 08ch, 042h, 087h, 084h, 000h, 000h, 000h, 000h, 08dh, 043h, 088h, 085h, 000h
        db      000h, 000h, 000h, 08eh, 044h, 089h, 086h, 000h, 000h, 000h, 000h, 08fh, 045h, 0a5h, 0a8h, 000h
        db      000h, 000h, 000h, 080h, 046h, 082h, 0a6h, 000h, 000h, 000h, 000h, 080h, 047h, 081h, 080h, 000h
        db      000h, 000h, 000h, 08bh, 003h, 001h, 088h, 006h, 002h, 001h, 002h, 001h, 002h, 001h, 002h, 001h
        db      002h, 001h, 002h, 001h, 002h, 001h, 002h, 001h, 002h, 001h, 083h, 086h, 0ffh, 087h, 020h, 003h
        db      020h, 020h, 003h, 086h, 0ffh, 087h, 020h, 020h, 003h, 086h, 0ffh, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h
        db      "M DRAM..."
        db      0ffh
        db      "M SRAM..."
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      0ffh, 005h, 002h, 000h, 015h, 002h, 001h, 045h, 003h, 002h, 0c5h, 003h, 004h, 005h, 004h, 005h
        db      021h, 004h, 006h, 025h, 004h, 00ch, 045h, 004h, 010h, 049h, 004h, 010h, 049h, 004h, 010h, 049h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      004h, 010h, 081h, 077h, 086h, 00ch, 081h, 077h, 013h, 029h, 081h, 077h, 088h, 0d6h, 081h, 077h
        db      067h, 0eah, 05ch, 074h, 0e8h, 09ah, 0c2h, 07fh, 010h, 032h, 07dh, 073h, 0e8h, 09ah, 061h, 074h
        db      010h, 032h, 063h, 074h, 01eh, 09bh, 000h, 07dh, 010h
        db      "2]tI"
        db      0a1h, 05dh, 074h, 030h, 0a1h, 05dh, 074h, 0a3h, 09eh, 05dh, 074h, 085h, 09eh, 05eh, 074h, 042h
        db      0a5h, 076h, 074h, 023h, 0cbh, 074h, 073h, 09fh, 0e6h, 075h, 073h, 010h, 032h, 004h, 075h, 0eah
        db      0cah, 08fh, 073h, 096h, 002h, 0f1h, 07ch, 010h, 032h, 090h, 073h, 056h, 0e8h, 0e0h, 079h, 010h
        db      032h, 090h, 084h, 010h, 032h, 02bh, 072h, 010h, 032h, 09bh, 085h, 010h, 032h, 07fh, 073h, 010h
        db      "28u918u"
        db      09fh, 031h, 077h, 073h, 010h, 032h, 078h, 073h, 010h, 032h, 07bh, 073h, 086h, 05fh, 000h, 073h
        db      010h, 032h, 00ch, 073h, 056h, 038h, 00dh, 073h, 010h, 032h, 050h, 073h, 010h, 032h, 0a9h, 085h
        db      010h, 032h, 0ffh, 072h, 010h, 032h, 001h, 073h, 010h, 032h, 002h, 073h, 010h, 032h, 055h, 073h
        db      010h, 032h, 08bh, 073h, 010h, 032h, 082h, 073h, 0cfh, 074h, 053h, 073h, 010h, 032h, 054h, 073h
        db      010h, 032h, 057h, 073h, 010h, 032h, 068h, 073h, 010h
        db      "2vs3"
        db      0d9h, 07ch, 073h, 010h, 032h, 084h, 073h, 010h, 032h, 00bh, 075h, 010h, 032h, 09eh, 085h, 010h
        db      032h, 0aah, 085h, 010h, 032h, 0bbh, 074h, 010h, 032h, 0feh, 072h, 010h, 032h, 052h, 073h, 010h
        db      032h, 024h, 085h, 010h, 032h, 0a5h, 085h, 010h, 032h, 051h, 073h, 010h, 032h, 08ah, 073h, 010h
        db      032h, 08ch, 073h, 010h, 032h, 04fh, 073h, 010h, 032h, 0a8h, 085h, 010h, 032h, 0cdh, 074h, 010h
        db      032h, 003h, 073h, 0cch, 03eh, 002h, 075h, 010h, 032h, 06eh, 073h, 010h, 032h, 06fh, 073h, 010h
        db      032h, 08eh, 073h, 010h, 032h, 08dh, 073h, 010h, 032h, 080h, 073h, 010h, 032h, 033h, 073h, 010h
        db      032h, 034h, 073h, 010h, 032h, 0a6h, 085h, 010h, 032h, 081h, 077h, 010h, 032h, 083h, 073h, 010h
        db      032h, 00ch, 075h, 010h, 032h, 02dh, 072h, 010h, 032h, 02eh, 072h, 010h, 032h, 0b8h, 078h, 09dh
        db      005h, 064h, 074h, 010h, 032h, 066h, 074h, 010h, 032h, 05ch, 07fh, 010h, 032h, 060h, 07fh, 010h
        db      032h, 05eh, 07fh, 010h, 032h, 05ah, 07fh, 010h, 032h, 068h, 074h, 010h, 032h, 06ah, 074h, 010h
        db      032h, 0f4h, 072h, 010h, 032h, 0f6h, 072h, 010h, 032h, 0f8h, 072h, 010h, 032h, 0c9h, 074h, 010h
        db      032h, 071h, 074h, 010h, 032h, 034h, 07fh, 010h, 032h, 032h, 07fh, 010h, 032h, 0b9h, 074h, 05ch
        db      008h, 072h, 073h, 010h, 032h, 0c3h, 074h, 010h, 032h, 0c7h, 074h, 010h, 032h, 017h, 073h, 02ch
        db      039h, 019h
        db      "so9tt"
        db      010h, 032h, 064h, 073h, 010h, 032h, 066h, 073h, 010h, 032h, 0a2h, 084h, 010h, 032h, 0b1h, 085h
        db      010h, 032h, 0c5h, 074h, 010h, 032h, 06ah, 073h, 010h, 032h, 0c0h, 082h, 010h, 032h, 070h, 073h
        db      010h, 032h, 026h, 085h, 010h, 032h, 0c7h, 074h, 0e3h, 0cdh, 074h, 079h, 012h, 032h, 074h, 079h
        db      093h, 034h, 074h, 079h, 097h
        db      "3ty/3"
        db      00fh, 073h, 010h, 032h, 023h, 073h, 010h, 032h, 027h, 073h, 010h, 032h, 02bh, 073h, 010h, 032h
        db      02fh, 073h, 010h, 032h, 035h, 073h, 010h, 032h, 058h, 073h, 010h, 032h, 05ch, 073h, 010h
        db      "2ty2Exy2E"
        db      004h, 073h, 010h, 032h, 008h, 073h, 010h, 032h, 095h, 084h, 010h, 032h, 073h, 085h, 010h, 032h
        db      078h, 085h, 010h, 032h, 07dh, 085h, 010h, 032h, 082h, 085h, 010h, 032h, 087h, 085h, 010h, 032h
        db      081h, 077h, 010h, 032h, 081h, 077h, 010h, 032h, 048h, 0d3h, 010h, 032h, 0bdh, 073h, 010h, 032h
        db      078h, 074h, 010h, 032h, 084h, 074h, 010h, 032h, 083h, 088h, 010h, 032h, 0e0h, 084h, 010h, 032h
        db      078h, 074h, 0a5h, 0a6h, 078h, 074h, 015h, 0a7h, 067h, 07ah, 010h
        db      "2z}b"
        db      099h, 085h, 077h, 062h, 099h, 0cah, 082h, 0e7h, 0ceh, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (FW_VERSION = 150)
        db      004h, 010h, 071h, 077h, 086h, 00ch, 071h, 077h, 013h, 029h, 071h, 077h, 088h, 0d6h, 071h, 077h
        db      077h, 0e9h, 04ch, 074h, 0e8h, 09ah, 0b2h, 07fh, 010h, 032h, 06dh, 073h, 0e8h, 09ah, 051h, 074h
        db      010h, 032h, 053h, 074h, 01eh, 09bh, 0f0h, 07ch, 010h
        db      "2MtI"
        db      0a1h, 04dh, 074h, 030h, 0a1h, 04dh, 074h, 0a3h, 09eh, 04dh, 074h, 085h, 09eh, 04eh, 074h, 042h
        db      0a5h, 066h, 074h, 023h, 0cbh, 064h, 073h, 0b5h, 0e5h, 065h, 073h, 010h, 032h, 0f4h, 074h, 0eah
        db      0cah, 07fh, 073h, 096h, 002h, 0e1h, 07ch, 010h, 032h, 080h, 073h, 066h, 0e7h, 0d0h, 079h, 010h
        db      032h, 070h, 084h, 010h, 032h, 01bh, 072h, 010h, 032h, 07bh, 085h, 010h, 032h, 06fh, 073h, 010h
        db      "2(u91(u"
        db      09fh, 031h, 067h, 073h, 010h, 032h, 068h, 073h, 010h, 032h, 06bh, 073h, 086h, 05fh, 0f0h, 072h
        db      010h, 032h, 0fch, 072h, 056h, 038h, 0fdh, 072h, 010h, 032h, 040h, 073h, 010h, 032h, 089h, 085h
        db      010h, 032h, 0efh, 072h, 010h, 032h, 0f1h, 072h, 010h, 032h, 0f2h, 072h, 010h, 032h, 045h, 073h
        db      010h, 032h, 07bh, 073h, 010h, 032h, 072h, 073h, 0cfh, 074h, 043h, 073h, 010h, 032h, 044h, 073h
        db      010h, 032h, 047h, 073h, 010h, 032h, 058h, 073h, 010h
        db      "2fs3"
        db      0d9h, 06ch, 073h, 010h, 032h, 074h, 073h, 010h, 032h, 0fbh, 074h, 010h, 032h, 07eh, 085h, 010h
        db      032h, 08ah, 085h, 010h, 032h, 0abh, 074h, 010h, 032h, 0eeh, 072h, 010h, 032h, 042h, 073h, 010h
        db      032h, 004h, 085h, 010h, 032h, 085h, 085h, 010h, 032h, 041h, 073h, 010h, 032h, 07ah, 073h, 010h
        db      032h, 07ch, 073h, 010h, 032h, 03fh, 073h, 010h, 032h, 088h, 085h, 010h, 032h, 0bdh, 074h, 010h
        db      032h, 0f3h, 072h, 0cch, 03eh, 0f2h, 074h, 010h, 032h, 05eh, 073h, 010h, 032h, 05fh, 073h, 010h
        db      032h, 07eh, 073h, 010h, 032h, 07dh, 073h, 010h, 032h, 070h, 073h, 010h, 032h, 023h, 073h, 010h
        db      032h, 024h, 073h, 010h, 032h, 086h, 085h, 010h, 032h, 071h, 077h, 010h, 032h, 073h, 073h, 010h
        db      032h, 0fch, 074h, 010h, 032h, 01dh, 072h, 010h, 032h, 01eh, 072h, 010h, 032h, 0a8h, 078h, 09dh
        db      005h, 054h, 074h, 010h, 032h, 056h, 074h, 010h, 032h, 04ch, 07fh, 010h, 032h, 050h, 07fh, 010h
        db      032h, 04eh, 07fh, 010h, 032h, 04ah, 07fh, 010h, 032h, 058h, 074h, 010h, 032h, 05ah, 074h, 010h
        db      032h, 0e4h, 072h, 010h, 032h, 0e6h, 072h, 010h, 032h, 0e8h, 072h, 010h, 032h, 0b9h, 074h, 010h
        db      032h, 061h, 074h, 010h, 032h, 024h, 07fh, 010h, 032h, 022h, 07fh, 010h, 032h, 0a9h, 074h, 05ch
        db      008h, 062h, 073h, 010h, 032h, 0b3h, 074h, 010h, 032h, 0b7h, 074h, 010h, 032h, 007h, 073h, 02ch
        db      039h, 009h
        db      "so9dt"
        db      010h, 032h, 054h, 073h, 010h, 032h, 056h, 073h, 010h, 032h, 082h, 084h, 010h, 032h, 091h, 085h
        db      010h, 032h, 0b5h, 074h, 010h, 032h, 05ah, 073h, 010h, 032h, 0b0h, 082h, 010h, 032h, 060h, 073h
        db      010h, 032h, 006h, 085h, 010h, 032h, 0b7h, 074h, 0e3h, 0cdh, 064h, 079h, 012h, 032h, 064h, 079h
        db      093h, 034h, 064h, 079h, 097h
        db      "3dy/3"
        db      0ffh, 072h, 010h, 032h, 013h, 073h, 010h, 032h, 017h, 073h, 010h, 032h, 01bh, 073h, 010h, 032h
        db      01fh, 073h, 010h, 032h, 025h, 073h, 010h, 032h, 048h, 073h, 010h, 032h, 04ch, 073h, 010h
        db      "2dy2Ehy2E"
        db      0f4h, 072h, 010h, 032h, 0f8h, 072h, 010h, 032h, 075h, 084h, 010h, 032h, 053h, 085h, 010h, 032h
        db      058h, 085h, 010h, 032h, 05dh, 085h, 010h, 032h, 062h, 085h, 010h, 032h, 067h, 085h, 010h, 032h
        db      071h, 077h, 010h, 032h, 071h, 077h, 010h, 032h, 028h, 0d3h, 010h, 032h, 0adh, 073h, 010h, 032h
        db      068h, 074h, 010h, 032h, 074h, 074h, 010h, 032h, 063h, 088h, 010h, 032h, 0c0h, 084h, 010h, 032h
        db      068h, 074h, 0a5h, 0a6h, 068h, 074h, 015h, 0a7h, 057h, 07ah, 010h
        db      "2j}b"
        db      099h, 075h, 077h, 062h, 099h, 0bah, 082h, 0e7h, 0ceh, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      000h, 000h, 000h, 000h, 08ah, 0b7h, 038h, 01eh, 02dh, 02dh, 03eh, 0ffh, 08ah, 0b7h, 038h, 03ch
        db      02dh, 02dh, 01fh, 0ffh, 088h, 006h, 007h
        elseif  (XL) && (MODEL = 3200)
        db      004h, 010h, 0b1h, 077h, 0aeh, 00ch, 0b1h, 077h, 039h, 029h, 0b1h, 077h, 0f8h, 0d7h, 0b1h, 077h
        db      046h, 0eah, 08ch, 074h, 0f8h, 09bh, 0f2h, 07fh, 036h, 032h, 0adh, 073h, 0f8h, 09bh, 091h, 074h
        db      036h, 032h, 093h, 074h, 02eh, 09ch, 030h, 07dh, 036h, 032h, 08dh, 074h, 073h, 0a2h, 08dh, 074h
        db      05ah, 0a2h, 08dh, 074h, 0c4h, 09fh, 08dh, 074h, 0a6h, 09fh, 08eh, 074h, 08fh, 0a6h, 0a6h, 074h
        db      093h, 0cch, 0a4h, 073h, 08bh, 0e7h, 0a5h
        db      "s624uZ"
        db      0cch, 0bfh, 073h, 0b9h, 002h, 021h, 07dh, 036h, 032h, 0c0h, 073h, 046h, 0e9h, 010h, 07ah, 036h
        db      032h, 0c0h, 084h, 036h, 032h, 05bh, 072h, 036h, 032h, 02bh, 086h, 036h, 032h, 0afh
        db      "s62hu_1hu"
        db      0c5h, 031h, 0a7h, 073h, 036h, 032h, 0a8h, 073h, 036h, 032h, 0abh, 073h, 010h
        db      "`0s62<s|8=s62"
        db      080h, 073h, 036h, 032h, 039h, 086h
        db      "62/s621s622s62"
        db      085h, 073h, 036h, 032h, 0bbh, 073h, 036h, 032h, 0b2h, 073h, 0f5h, 075h, 083h, 073h, 036h, 032h
        db      084h, 073h, 036h, 032h, 087h, 073h, 036h, 032h, 098h, 073h, 036h, 032h, 0a6h, 073h, 08fh, 0dah
        db      0ach, 073h, 036h, 032h, 0b4h
        db      "s62;u62."
        db      086h, 036h, 032h, 03ah, 086h, 036h, 032h, 0ebh
        db      "t62.s62"
        db      082h, 073h, 036h, 032h, 0b4h, 085h, 036h, 032h, 035h, 086h, 036h, 032h, 081h, 073h, 036h, 032h
        db      0bah, 073h, 036h, 032h, 0bch, 073h, 036h, 032h, 07fh, 073h, 036h, 032h, 038h, 086h, 036h, 032h
        db      0fdh
        db      "t623s"
        db      0fch, 03eh, 032h, 075h, 036h, 032h, 09eh, 073h, 036h, 032h, 09fh, 073h, 036h, 032h, 0beh, 073h
        db      036h, 032h, 0bdh, 073h, 036h, 032h, 0b0h
        db      "s62cs62ds626"
        db      086h, 036h, 032h, 0a7h, 074h, 0f0h, 028h, 0b3h
        db      "s62<u62]r62^r62"
        db      0e8h, 078h, 0bdh, 005h, 094h, 074h, 036h, 032h, 096h, 074h, 036h, 032h, 08ch, 07fh, 036h, 032h
        db      090h, 07fh, 036h, 032h, 08eh, 07fh, 036h, 032h, 08ah, 07fh, 036h, 032h, 098h, 074h, 036h, 032h
        db      09ah
        db      "t62$s62&s62(s62"
        db      0f9h, 074h, 036h, 032h, 0a1h
        db      "t62d"
        db      07fh, 036h, 032h, 062h, 07fh, 036h, 032h, 0e9h, 074h, 06ah, 008h, 0a2h, 073h, 036h, 032h, 0f3h
        db      074h, 036h, 032h, 0f7h
        db      "t62GsR9Is"
        db      095h, 039h, 0a4h, 074h, 036h, 032h, 094h, 073h, 036h, 032h, 096h, 073h, 036h, 032h, 0d2h, 084h
        db      036h, 032h, 041h, 086h, 036h, 032h, 0f5h, 074h, 036h, 032h, 09ah, 073h, 036h, 032h, 0f0h, 082h
        db      036h, 032h, 0a0h, 073h, 036h, 032h, 0b6h, 085h, 036h, 032h, 0f7h, 074h, 053h, 0cfh, 0a4h, 079h
        db      038h, 032h, 0a4h, 079h, 0b9h, 034h, 0a4h, 079h, 0bdh, 033h, 0a4h
        db      "yU3?s62Ss62Ws62[s62_s62es62"
        db      088h, 073h, 036h, 032h, 08ch, 073h, 036h, 032h, 0a4h, 079h, 08fh, 045h, 0a8h, 079h, 08fh
        db      "E4s628s62"
        db      0c5h, 084h, 036h, 032h, 003h, 086h, 036h, 032h, 008h, 086h, 036h, 032h, 00dh, 086h, 036h, 032h
        db      012h, 086h, 036h, 032h, 017h, 086h
        db      "62Bu"
        db      0f7h, 0ebh, 0dch, 084h, 036h, 032h, 0d8h, 0d3h, 036h, 032h, 0edh, 073h, 036h, 032h, 0a8h, 074h
        db      036h, 032h, 0b4h, 074h, 036h, 032h, 013h, 089h, 036h, 032h, 070h, 085h, 036h, 032h, 0a8h, 074h
        db      007h, 0a8h, 0a8h, 074h, 077h, 0a8h, 097h, 07ah, 036h, 032h, 0aah, 07dh, 072h, 09ah, 0b5h, 077h
        db      072h, 09ah, 0fah, 082h, 057h, 0d0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 08ah, 0b7h, 038h, 01eh, 02dh, 02dh, 03eh, 0ffh, 08ah, 0b7h, 038h, 03ch, 02dh, 02dh, 01fh
        db      0ffh, 088h, 006h, 007h
        elseif  (XL) && (FW_VERSION < 150)
        db      0ffh, 005h, 002h, 000h, 011h, 002h, 001h, 035h, 003h, 002h, 0b5h, 003h, 004h, 0f5h, 003h, 005h
        db      011h, 004h, 006h, 015h, 004h, 00ch, 02dh, 004h, 010h, 031h, 004h, 010h, 031h, 004h, 010h, 031h
        db      004h, 010h, 0d1h, 076h, 043h, 00ch, 0d1h, 076h, 0a3h, 028h, 0d1h, 076h, 028h, 0d3h, 0abh, 073h
        db      083h, 099h, 012h, 07fh, 099h, 031h, 0cdh, 072h, 083h, 099h, 0b0h, 073h, 099h, 031h, 0b2h, 073h
        db      0b9h, 099h, 050h, 07ch, 099h, 031h, 0ach, 073h, 05bh, 09fh, 0ach, 073h, 042h, 09fh, 0ach, 073h
        db      0b5h, 09ch, 0ach, 073h, 097h, 09ch, 0adh, 073h, 00bh, 0a3h, 0c5h, 073h, 0c3h, 0c7h, 0c4h, 072h
        db      051h, 0e2h, 0c5h, 072h, 099h, 031h, 053h, 074h, 08ah, 0c7h, 0dfh, 072h, 071h, 002h, 041h, 07ch
        db      099h, 031h, 0e0h, 072h, 0f3h, 0e3h, 030h, 079h, 099h, 031h, 0d0h, 083h, 099h, 031h, 08bh, 071h
        db      099h, 031h, 0dbh, 084h, 099h, 031h, 0cfh, 072h, 099h, 031h, 088h, 074h, 0c0h, 030h, 088h, 074h
        db      021h, 031h, 0c7h, 072h, 099h, 031h, 0c8h, 072h, 099h, 031h, 0cbh, 072h, 0e6h, 05eh, 050h, 072h
        db      099h, 031h, 05ch, 072h, 0dfh, 037h, 05dh, 072h, 099h, 031h, 0a0h, 072h, 099h, 031h, 0e9h, 084h
        db      099h, 031h, 04fh, 072h, 099h, 031h, 051h, 072h, 099h, 031h, 052h, 072h, 099h, 031h, 0a5h, 072h
        db      099h, 031h, 0dbh, 072h, 099h, 031h, 0d2h, 072h, 02fh, 074h, 0a3h, 072h, 099h, 031h, 0a4h, 072h
        db      099h, 031h, 0a7h, 072h, 099h, 031h, 0b8h, 072h, 099h, 031h, 0c6h, 072h, 0d3h, 0d5h, 0cch, 072h
        db      099h, 031h, 0d4h, 072h, 099h, 031h, 05ah, 074h, 099h, 031h, 0deh, 084h, 099h, 031h, 0eah, 084h
        db      099h, 031h, 00ah, 074h, 099h, 031h, 04eh, 072h, 099h, 031h, 0a2h, 072h, 099h, 031h, 064h, 084h
        db      099h, 031h, 0e5h, 084h, 099h, 031h, 0a1h, 072h, 099h, 031h, 0dah, 072h, 099h, 031h, 0dch, 072h
        db      099h, 031h, 09fh, 072h, 099h, 031h, 0e8h, 084h, 099h, 031h, 01ch, 074h, 099h, 031h, 053h, 072h
        db      05ch, 03eh, 051h, 074h, 099h, 031h, 0beh, 072h, 099h, 031h, 0bfh, 072h, 099h, 031h, 0deh, 072h
        db      099h, 031h, 0ddh, 072h, 099h, 031h, 0d0h, 072h, 099h, 031h, 083h, 072h, 099h, 031h, 084h, 072h
        db      099h, 031h, 0e6h, 084h, 099h, 031h, 0d1h, 076h, 099h, 031h, 0d3h, 072h, 099h, 031h, 05bh, 074h
        db      099h, 031h, 0b3h, 073h, 099h, 031h, 0b5h, 073h, 099h, 031h, 0ach, 07eh, 099h, 031h, 0b0h, 07eh
        db      099h, 031h, 0aeh, 07eh, 099h, 031h, 0aah, 07eh, 099h, 031h, 0b7h, 073h, 099h, 031h, 0b9h, 073h
        db      099h, 031h, 044h, 072h, 099h, 031h, 046h, 072h, 099h, 031h, 048h, 072h, 099h, 031h, 018h, 074h
        db      099h, 031h, 0c0h, 073h, 099h, 031h, 084h, 07eh, 099h, 031h, 082h, 07eh, 099h, 031h, 008h, 074h
        db      02bh, 008h, 0c2h, 072h, 099h, 031h, 012h, 074h, 099h, 031h, 016h, 074h, 099h, 031h, 067h, 072h
        db      0b5h, 038h, 069h, 072h, 0f8h, 038h, 0c3h, 073h, 099h, 031h, 0b4h, 072h, 099h, 031h, 0b6h, 072h
        db      099h, 031h, 0e2h, 083h, 099h, 031h, 0f1h, 084h, 099h, 031h, 014h, 074h, 099h, 031h, 0bah, 072h
        db      099h, 031h, 010h, 082h, 099h, 031h, 0c0h, 072h, 099h, 031h, 066h, 084h, 099h, 031h, 016h, 074h
        db      083h, 0cah, 0c4h, 078h, 09bh, 031h, 0c4h, 078h, 01ch, 034h, 0c4h, 078h, 020h, 033h, 0c4h, 078h
        db      0b8h, 032h, 05fh, 072h, 099h, 031h, 073h, 072h, 099h, 031h, 077h, 072h, 099h, 031h, 07bh, 072h
        db      099h, 031h, 07fh, 072h, 099h, 031h, 085h, 072h, 099h, 031h, 0a8h, 072h, 099h, 031h, 0ach, 072h
        db      099h, 031h, 0c4h, 078h, 0c2h, 044h, 0c8h, 078h, 0c2h, 044h, 054h, 072h, 099h, 031h, 058h, 072h
        db      099h, 031h, 0d5h, 083h, 099h, 031h, 0b3h, 084h, 099h, 031h, 0b8h, 084h, 099h, 031h, 0bdh, 084h
        db      099h, 031h, 0c2h, 084h, 099h, 031h, 0c7h, 084h, 099h, 031h, 0d1h, 076h, 099h, 031h, 0d1h, 076h
        db      099h, 031h, 028h, 0d2h, 099h, 031h, 00ch, 073h, 099h, 031h, 0c7h, 073h, 099h, 031h, 0d3h, 073h
        db      099h, 031h, 063h, 087h, 099h, 031h, 020h, 084h, 099h, 031h, 0b7h, 079h, 099h, 031h, 0cah, 07ch
        db      08dh, 098h, 0d5h, 076h, 08dh, 098h, 01ah, 082h, 087h, 0cbh, 000h, 000h, 000h, 08ah, 0b7h, 038h
        db      01eh, 02dh, 02dh, 03eh, 0ffh, 08ah, 0b7h, 038h, 03ch, 02dh, 02dh, 01fh, 0ffh, 088h, 006h, 007h
        endif
        if      XL
        db      "WAITING FOR CARRIER"
        db      088h, 006h, 008h, 0ffh, 08dh, 01bh, 00ch, 02eh, 08ch, 01bh, 072h, 007h, 08fh, 05bh, 0ffh, 000h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 08dh, 080h, 000h, 0d1h, 071h
        db      000h, 0d4h, 080h, 000h, 0d1h, 071h, 000h, 0deh, 080h, 000h, 0d1h, 071h, 002h, 025h, 081h, 002h
        db      076h, 07ch, 003h, 040h, 081h, 003h, 060h, 07dh, 002h, 076h, 081h, 002h, 022h, 07eh, 00ch, 08dh
        db      081h, 00ah, 074h, 07fh, 000h, 008h, 083h, 000h, 00eh, 07fh, 000h, 01dh, 083h, 000h, 02dh, 07fh
        db      002h, 04bh, 083h, 003h, 060h, 083h, 002h, 0a7h, 083h, 000h, 0d1h, 071h, 001h, 084h, 080h, 000h
        db      005h, 07ch, 000h, 005h, 07ch, 000h, 005h, 07ch, 000h, 005h, 07ch, 000h, 005h, 07ch, 001h, 0feh
        db      08dh, 00ah, 0fch, 07fh, 000h, 096h, 088h, 000h, 096h, 088h, 002h, 006h, 07ch, 002h, 02dh, 07ch
        db      000h, 042h, 07ch, 000h, 072h, 07ch, 002h, 025h, 08bh, 002h, 025h, 08bh, 002h, 011h, 08ah, 007h
        db      0adh, 08dh, 007h, 044h, 08ch, 007h, 0b9h, 08dh, 007h, 04ch, 08ch, 007h, 0d1h, 08dh, 007h, 054h
        db      08ch, 007h, 065h, 08dh, 007h, 03ch, 08ch, 007h, 095h, 08dh, 007h, 02ch, 08ch, 007h, 089h, 08dh
        db      007h, 034h, 08ch, 007h, 0a1h, 08dh, 007h, 0fch, 08bh, 007h, 071h, 08dh, 007h, 0a5h, 079h, 007h
        db      07dh, 08dh, 007h, 0a5h, 079h, 007h, 0a5h, 079h, 007h, 0a5h, 079h, 007h, 0a5h, 079h, 007h, 0a5h
        db      079h, 007h, 0a5h, 079h, 007h, 0a5h, 079h, 007h, 0a5h, 079h, 007h, 0a5h, 079h, 007h, 0c5h, 08dh
        db      007h, 024h, 08ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 006h, 000h
        elseif  (XL) && (MODEL = 3200)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0adh, 081h, 000h, 0f8h, 072h
        db      000h, 0f4h, 081h, 000h, 0f8h, 072h, 000h, 0feh, 081h, 000h, 0f8h, 072h, 002h, 045h, 082h, 002h
        db      096h, 07dh, 003h, 060h, 082h, 003h, 080h, 07eh, 002h, 096h, 082h, 002h, 042h, 07fh, 00ch, 0adh
        db      082h, 00ah, 094h, 080h, 000h, 028h, 084h, 000h, 02eh, 080h, 000h, 03dh, 084h, 000h, 04dh, 080h
        db      002h, 06bh, 084h, 003h, 080h, 084h, 002h, 0c7h, 084h, 000h, 0f8h, 072h, 001h, 0a4h, 081h, 000h
        db      025h, 07dh, 000h, 025h, 07dh, 000h, 025h, 07dh, 000h, 025h, 07dh, 000h, 025h, 07dh, 001h, 01eh
        db      08fh, 00ah, 01ch, 081h, 000h, 0b6h, 089h, 000h, 0b6h, 089h, 002h, 026h, 07dh, 002h, 04dh, 07dh
        db      000h, 062h, 07dh, 000h, 092h, 07dh, 002h, 045h, 08ch, 002h, 045h, 08ch, 002h, 031h, 08bh, 007h
        db      0cdh, 08eh, 007h, 064h, 08dh, 007h, 0d9h, 08eh, 007h, 06ch, 08dh, 007h, 0f1h, 08eh, 007h, 074h
        db      08dh, 007h, 085h, 08eh, 007h, 05ch, 08dh, 007h, 0b5h, 08eh, 007h, 04ch, 08dh, 007h, 0a9h, 08eh
        db      007h, 054h, 08dh, 007h, 0c1h, 08eh, 007h, 01ch, 08dh, 007h, 091h, 08eh, 007h, 0c5h, 07ah, 007h
        db      09dh, 08eh, 007h, 0c5h, 07ah, 007h, 0c5h, 07ah, 007h, 0c5h, 07ah, 007h, 0c5h, 07ah, 007h, 0c5h
        db      07ah, 007h, 0c5h, 07ah, 007h, 0c5h, 07ah, 007h, 0c5h, 07ah, 007h, 0c5h, 07ah, 007h, 0e5h, 08eh
        db      007h, 044h, 08dh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 006h, 000h
        elseif  (XL) && (FW_VERSION < 150)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0edh, 07fh, 000h, 031h, 071h
        db      000h, 034h, 080h, 000h, 031h, 071h, 000h, 03eh, 080h, 000h, 031h, 071h, 002h, 085h, 080h, 002h
        db      0d6h, 07bh, 003h, 0a0h, 080h, 003h, 0c0h, 07ch, 002h, 0d6h, 080h, 002h, 082h, 07dh, 00ch, 0edh
        db      080h, 00ah, 0d4h, 07eh, 000h, 068h, 082h, 000h, 06eh, 07eh, 000h, 07dh, 082h, 000h, 08dh, 07eh
        db      002h, 0abh, 082h, 003h, 0c0h, 082h, 002h, 007h, 083h, 000h, 031h, 071h, 001h, 0e4h, 07fh, 000h
        db      065h, 07bh, 000h, 065h, 07bh, 000h, 065h, 07bh, 000h, 065h, 07bh, 000h, 065h, 07bh, 001h, 05eh
        db      08dh, 00ah, 05ch, 07fh, 000h, 0f6h, 087h, 000h, 0f6h, 087h, 002h, 066h, 07bh, 002h, 08dh, 07bh
        db      000h, 0a2h, 07bh, 000h, 0d2h, 07bh, 002h, 085h, 08ah, 002h, 085h, 08ah, 002h, 071h, 089h, 007h
        db      00dh, 08dh, 007h, 0a4h, 08bh, 007h, 019h, 08dh, 007h, 0ach, 08bh, 007h, 031h, 08dh, 007h, 0b4h
        db      08bh, 007h, 0c5h, 08ch, 007h, 09ch, 08bh, 007h, 0f5h, 08ch, 007h, 08ch, 08bh, 007h, 0e9h, 08ch
        db      007h, 094h, 08bh, 007h, 001h, 08dh, 007h, 05ch, 08bh, 007h, 0d1h, 08ch, 007h, 005h, 079h, 007h
        db      0ddh, 08ch, 007h, 005h, 079h, 007h, 005h, 079h, 007h, 005h, 079h, 007h, 005h, 079h, 007h, 005h
        db      079h, 007h, 005h, 079h, 007h, 005h, 079h, 007h, 005h, 079h, 007h, 005h, 079h, 007h, 025h, 08dh
        db      007h, 084h, 08bh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 006h, 000h
        endif
        if      XL
        db      009h, 000h, 00ch, 000h, 00fh, 000h, 012h, 000h, 015h, 000h, 018h, 000h, 01bh, 000h, 01eh, 000h
        db      021h, 000h, 024h, 000h, 027h, 000h, 02ah, 000h, 02dh, 000h, 030h, 000h, 01fh, 000h, 020h, 000h
        db      021h, 000h, 022h, 000h, 023h, 000h, 024h, 000h, 025h, 000h, 026h, 000h, 027h, 000h, 028h, 000h
        db      029h, 000h, 02ah, 000h, 02bh, 000h, 02ch, 000h, 02eh, 000h, 02fh, 000h, 030h, 000h, 032h, 000h
        db      033h, 000h, 034h, 000h, 036h, 000h, 037h, 000h, 039h, 000h, 03ah, 000h, 03ch, 000h, 03eh, 000h
        db      03fh, 000h, 041h, 000h, 043h, 000h, 045h, 000h, 047h, 000h, 049h, 000h, 04bh, 000h, 04dh, 000h
        db      04fh, 000h, 051h, 000h, 053h, 000h, 055h, 000h, 058h, 000h, 05ah, 000h, 05dh, 000h, 05fh, 000h
        db      062h, 000h, 065h, 000h, 067h, 000h, 06ah, 000h, 06dh, 000h, 070h, 000h, 073h, 000h, 077h, 000h
        db      07ah, 000h, 07dh, 000h, 081h, 000h, 084h, 000h, 088h, 000h, 08ch, 000h, 090h, 000h, 094h, 000h
        db      098h, 000h, 09ch, 000h, 0a0h, 000h, 0a5h, 000h, 0a9h, 000h, 0aeh, 000h, 0b3h, 000h, 0b8h, 000h
        db      0bdh, 000h, 0c2h, 000h, 0c7h, 000h, 0cdh, 000h, 0d2h, 000h, 0d8h, 000h, 0deh, 000h, 0e4h, 000h
        db      0ebh, 000h, 0f1h, 000h, 0f8h, 000h, 0ffh, 000h, 006h, 001h, 00dh, 001h, 014h, 001h, 01ch, 001h
        db      024h, 001h, 02ch, 001h, 034h, 001h, 03dh, 001h, 046h, 001h, 04fh, 001h, 058h, 001h, 061h, 001h
        db      06bh, 001h, 075h, 001h, 07fh, 001h, 08ah, 001h, 095h, 001h, 0a0h, 001h, 0ach, 001h, 0b8h, 001h
        db      0c4h, 001h, 0d0h, 001h, 0ddh, 001h, 0eah, 001h, 0f8h, 001h, 006h, 002h, 014h, 002h, 023h, 002h
        db      032h, 002h, 041h, 002h, 051h, 002h, 062h, 002h, 073h, 002h, 084h, 002h, 096h, 002h, 0a8h, 002h
        db      0bbh, 002h, 0ceh, 002h, 0e2h, 002h, 0f7h, 002h, 00ch, 003h, 021h, 003h, 037h, 003h, 04eh, 003h
        db      066h, 003h, 07eh, 003h, 096h, 003h, 0b0h, 003h, 0cah, 003h, 0e5h, 003h, 000h, 004h, 01dh, 004h
        db      03ah, 004h, 058h, 004h, 076h, 004h, 096h, 004h, 0b6h, 004h, 0d8h, 004h, 0fah, 004h, 01dh, 005h
        db      042h, 005h, 067h, 005h, 08dh, 005h, 0b4h, 005h, 0ddh, 005h, 006h, 006h, 031h, 006h, 05dh, 006h
        db      08ah, 006h, 0b8h, 006h, 0e8h, 006h, 019h, 007h, 04bh, 007h, 07eh, 007h, 0b4h, 007h, 0eah, 007h
        db      022h, 008h, 05ch, 008h, 097h, 008h, 0d4h, 008h, 012h, 009h, 052h, 009h, 094h, 009h, 0d8h, 009h
        db      01eh, 00ah, 066h, 00ah, 0afh, 00ah, 0fbh, 00ah, 049h, 00bh, 099h, 00bh, 0ebh, 00bh, 03fh, 00ch
        db      096h, 00ch, 0efh, 00ch, 04bh, 00dh, 0a9h, 00dh, 009h, 00eh, 06dh, 00eh, 0d3h, 00eh, 03ch, 00fh
        db      0a8h, 00fh, 017h, 010h, 089h, 010h, 0feh, 010h, 076h, 011h, 0f2h, 011h, 071h, 012h, 0f4h, 012h
        db      07ah, 013h, 004h, 014h, 091h, 014h, 023h, 015h, 0b9h, 015h, 053h, 016h, 0f1h, 016h, 093h, 017h
        db      03ah, 018h, 0e6h, 018h, 096h, 019h, 04bh, 01ah, 005h, 01bh, 0c5h, 01bh, 089h, 01ch, 053h, 01dh
        db      023h, 01eh, 0f9h, 01eh, 0d4h, 01fh, 0b5h, 020h, 09dh, 021h, 08bh, 022h, 080h, 023h, 07bh, 024h
        db      07dh, 025h, 087h, 026h, 098h, 027h, 0b0h, 028h, 0d0h, 029h, 0f8h, 02ah, 029h, 02ch, 061h, 02dh
        db      0a3h, 02eh, 0edh, 02fh, 040h, 031h, 09dh, 032h, 004h, 034h, 074h, 035h, 0efh, 036h, 074h, 038h
        db      003h, 03ah, 09eh, 03bh, 044h, 03dh, 0f6h, 03eh, 0b4h
        elseif  (XL = 0) && (MODEL = 3000)
        db      "WARNING !! OK BUT DISK MAY BE UNRELIABLE"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        else
        db      0ffh, 08ah, 003h, 01bh
        db      "soft 2"
        db      0ffh, 08ah, 003h, 01bh
        db      "soft 3"
        db      0ffh, 08ah, 003h, 01bh
        db      "soft 4"
        db      0ffh, 08ah, 003h, 01bh
        db      "soft 5"
        db      0ffh, 08ah, 003h, 01bh
        db      "soft 6"
        db      0ffh, 08ah, 003h, 01bh
        db      "soft 7"
        db      08ah, 003h
        db      "8soft keys text also seen from this page"
        db      0ffh, 08ah, 003h, 01bh
        db      "soft 8"
        db      0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h
        endif
        if      XL = 0
        db      " HARD DISK EMPTY...space for DD=     Mb "
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 006h, 000h, 009h, 000h
        db      00ch, 000h, 00fh, 000h, 012h, 000h, 015h, 000h, 018h, 000h, 01bh, 000h, 01eh, 000h, 021h, 000h
        db      024h, 000h, 027h, 000h, 02ah, 000h, 02dh, 000h, 030h, 000h, 01fh, 000h, 020h, 000h, 021h, 000h
        db      022h, 000h, 023h, 000h, 024h, 000h, 025h, 000h, 026h, 000h, 027h, 000h, 028h, 000h, 029h, 000h
        db      02ah, 000h, 02bh, 000h, 02ch, 000h, 02eh, 000h, 02fh, 000h, 030h, 000h, 032h, 000h, 033h, 000h
        db      034h, 000h, 036h, 000h, 037h, 000h, 039h, 000h, 03ah, 000h, 03ch, 000h, 03eh, 000h, 03fh, 000h
        db      041h, 000h, 043h, 000h, 045h, 000h, 047h, 000h, 049h, 000h, 04bh, 000h, 04dh, 000h, 04fh, 000h
        db      051h, 000h, 053h, 000h, 055h, 000h, 058h, 000h, 05ah, 000h, 05dh, 000h, 05fh, 000h, 062h, 000h
        db      065h, 000h, 067h, 000h, 06ah, 000h, 06dh, 000h, 070h, 000h, 073h, 000h, 077h, 000h, 07ah, 000h
        db      07dh, 000h, 081h, 000h, 084h, 000h, 088h, 000h, 08ch, 000h, 090h, 000h, 094h, 000h, 098h, 000h
        db      09ch, 000h, 0a0h, 000h, 0a5h, 000h, 0a9h, 000h, 0aeh, 000h, 0b3h, 000h, 0b8h, 000h, 0bdh, 000h
        db      0c2h, 000h, 0c7h, 000h, 0cdh, 000h, 0d2h, 000h, 0d8h, 000h, 0deh, 000h, 0e4h, 000h, 0ebh, 000h
        db      0f1h, 000h, 0f8h, 000h, 0ffh, 000h, 006h, 001h, 00dh, 001h, 014h, 001h, 01ch, 001h, 024h, 001h
        db      02ch, 001h, 034h, 001h, 03dh, 001h, 046h, 001h, 04fh, 001h, 058h, 001h, 061h, 001h, 06bh, 001h
        db      075h, 001h, 07fh, 001h, 08ah, 001h, 095h, 001h, 0a0h, 001h, 0ach, 001h, 0b8h, 001h, 0c4h, 001h
        db      0d0h, 001h, 0ddh, 001h, 0eah, 001h, 0f8h, 001h, 006h, 002h, 014h, 002h, 023h, 002h, 032h, 002h
        db      041h, 002h, 051h, 002h, 062h, 002h, 073h, 002h, 084h, 002h, 096h, 002h, 0a8h, 002h, 0bbh, 002h
        db      0ceh, 002h, 0e2h, 002h, 0f7h, 002h, 00ch, 003h, 021h, 003h, 037h, 003h, 04eh, 003h, 066h, 003h
        db      07eh, 003h, 096h, 003h, 0b0h, 003h, 0cah, 003h, 0e5h, 003h, 000h, 004h, 01dh, 004h, 03ah, 004h
        db      058h, 004h, 076h, 004h, 096h, 004h, 0b6h, 004h, 0d8h, 004h, 0fah, 004h, 01dh, 005h, 042h, 005h
        db      067h, 005h, 08dh, 005h, 0b4h, 005h, 0ddh, 005h, 006h, 006h, 031h, 006h, 05dh, 006h, 08ah, 006h
        db      0b8h, 006h, 0e8h, 006h, 019h, 007h, 04bh, 007h, 07eh, 007h, 0b4h, 007h, 0eah, 007h, 022h, 008h
        db      05ch, 008h, 097h, 008h, 0d4h, 008h, 012h, 009h, 052h, 009h, 094h, 009h, 0d8h, 009h, 01eh, 00ah
        db      066h, 00ah, 0afh, 00ah, 0fbh, 00ah, 049h, 00bh, 099h, 00bh, 0ebh, 00bh, 03fh, 00ch, 096h, 00ch
        db      0efh, 00ch, 04bh, 00dh, 0a9h, 00dh, 009h, 00eh, 06dh, 00eh, 0d3h, 00eh, 03ch, 00fh, 0a8h, 00fh
        db      017h, 010h, 089h, 010h, 0feh, 010h, 076h, 011h, 0f2h, 011h, 071h, 012h, 0f4h, 012h, 07ah, 013h
        db      004h, 014h, 091h, 014h, 023h, 015h, 0b9h, 015h, 053h, 016h, 0f1h, 016h, 093h, 017h, 03ah, 018h
        db      0e6h, 018h, 096h, 019h, 04bh, 01ah, 005h, 01bh, 0c5h, 01bh, 089h, 01ch, 053h, 01dh, 023h, 01eh
        db      0f9h, 01eh, 0d4h, 01fh, 0b5h, 020h, 09dh, 021h, 08bh, 022h, 080h, 023h, 07bh, 024h, 07dh, 025h
        db      087h, 026h, 098h, 027h, 0b0h, 028h, 0d0h, 029h, 0f8h, 02ah, 029h, 02ch, 061h, 02dh, 0a3h, 02eh
        db      0edh, 02fh, 040h, 031h, 09dh, 032h, 004h, 034h, 074h, 035h, 0efh, 036h, 074h, 038h, 003h, 03ah
        db      09eh, 03bh, 044h, 03dh, 0f6h, 03eh, 0b4h
        endif
        db      "@~BUD9F*H*J7LRN}P"
        db      0b7h, 052h, 001h, 055h, 05bh, 057h, 0c6h, 059h, 041h, 05ch, 0cfh
        db      "^na d"
        db      0e5h, 066h, 0beh, 069h, 0abh, 06ch, 0ach, 06fh, 0c3h, 072h, 0f0h, 075h, 033h, 079h, 08dh, 07ch
        db      0ffh, 07fh, 000h, 003h, 005h, 008h, 00ah, 00dh, 00fh, 012h, 014h, 017h, 01ah, 01ch, 01fh
        db      "!$&)+.0368;=@BEGJLORTWY"
        db      05ch
        db      "^acfiknpsuxz}"
        db      07fh, 082h, 085h, 087h, 08ah, 08ch, 08fh, 091h, 094h, 096h, 099h, 09ch, 09eh, 0a1h, 0a3h, 0a6h
        db      0a8h, 0abh, 0adh, 0b0h, 0b2h, 0b5h, 0b8h, 0bah, 0bdh, 0bfh, 0c2h, 0c4h, 0c7h, 0c9h, 0cch, 0cfh
        db      0d1h, 0d4h, 0d6h, 0d9h, 0dbh, 0deh, 0e0h, 0e3h, 0e5h, 0e8h, 0ebh, 0edh, 0f0h, 0f2h, 0f5h, 0f7h
        db      0fah, 0fch
        db      38h dup (0ffh)
        db      000h, 003h, 005h, 008h, 00ah, 00dh, 00fh, 012h, 014h, 017h, 01ah, 01ch, 01fh
        db      "!$&),.1368;=@CEHJMORTWZ"
        db      05ch
        db      "_adfilnqsvx{}"
        db      080h, 083h, 085h, 088h, 08ah, 08dh, 08fh, 092h, 094h, 097h, 09ah, 09ch, 09fh, 0a1h, 0a4h, 0a6h
        db      0a9h, 0ach, 0aeh, 0b1h, 0b3h, 0b6h, 0b8h, 0bbh, 0bdh, 0c0h, 0c3h, 0c5h, 0c8h, 0cah, 0cdh, 0cfh
        db      0d2h, 0d4h, 0d7h, 0dah, 0dch, 0dfh, 0e1h, 0e4h, 0e6h, 0e9h, 0ech, 0eeh, 0f1h, 0f3h, 0f6h, 0f8h
        db      0fbh, 0fdh, 062h, 000h, 068h, 000h, 06eh, 000h, 074h, 000h, 07bh, 000h, 082h, 000h, 089h, 000h
        db      091h, 000h, 099h, 000h, 0a2h, 000h, 0abh, 000h, 0b4h, 000h, 0bfh, 000h, 0cah, 000h, 0d5h, 000h
        db      0e1h, 000h, 0eeh, 000h, 0fbh, 000h, 00ah, 001h, 019h, 001h, 029h, 001h, 03ah, 001h, 04bh, 001h
        db      05eh, 001h, 072h, 001h, 087h, 001h, 09dh, 001h, 0b5h, 001h, 0ceh, 001h, 0e8h, 001h, 003h, 002h
        db      021h, 002h, 040h, 002h, 060h, 002h, 083h, 002h, 0a7h, 002h, 0ceh, 002h, 0f7h, 002h, 022h, 003h
        db      04fh, 003h, 07fh, 003h, 0b2h, 003h, 0e7h, 003h, 020h, 004h, 05ch, 004h, 09bh, 004h, 0deh, 004h
        db      025h, 005h, 070h, 005h, 0bfh, 005h, 012h, 006h, 06ah, 006h, 0c7h, 006h, 02ah, 007h, 092h, 007h
        db      0ffh, 007h, 073h, 008h, 0eeh, 008h, 070h, 009h, 0f9h, 009h, 089h, 00ah, 022h, 00bh, 0c4h, 00bh
        db      06fh, 00ch, 023h, 00dh, 0e2h, 00dh, 0abh, 00eh, 080h, 00fh, 061h, 010h, 04fh, 011h, 04ah, 012h
        db      054h, 013h, 06ch, 014h, 095h, 015h, 0ceh, 016h, 019h, 018h, 076h, 019h, 0e8h, 01ah, 06eh, 01ch
        db      00bh, 01eh, 0bfh, 01fh, 08ch, 021h, 073h, 023h, 075h, 025h, 095h, 027h, 0d3h, 029h, 032h, 02ch
        db      0b3h, 02eh, 059h, 031h, 025h, 034h, 01ah, 037h, 03ah, 03ah, 087h, 03dh, 003h, 041h, 0b3h, 044h
        db      098h, 048h, 0b5h, 04ch, 00fh, 051h, 0a7h, 055h, 082h, 05ah, 000h, 080h, 03bh, 080h, 077h, 080h
        db      0b2h, 080h, 0edh, 080h, 029h, 081h, 065h, 081h, 0a1h, 081h, 0ddh, 081h, 019h, 082h, 055h, 082h
        db      091h, 082h, 0ceh, 082h, 00ah, 083h, 047h, 083h, 083h, 083h, 0c0h, 083h, 0fdh, 083h, 03ah, 084h
        db      077h, 084h, 0b5h, 084h, 0f2h, 084h, 02fh, 085h, 06dh, 085h, 0abh, 085h, 0e9h, 085h, 027h, 086h
        db      065h, 086h, 0a3h, 086h, 0e1h, 086h, 01fh, 087h, 05eh, 087h, 09dh, 087h, 0dbh, 087h, 01ah, 088h
        db      059h, 088h, 098h, 088h, 0d7h, 088h, 017h, 089h, 056h, 089h, 095h, 089h, 0d5h, 089h, 015h, 08ah
        db      055h, 08ah, 095h, 08ah, 0d5h, 08ah, 015h, 08bh, 055h, 08bh, 096h, 08bh, 0d6h, 08bh, 017h, 08ch
        db      058h, 08ch, 099h, 08ch, 0dah, 08ch, 01bh, 08dh, 05ch, 08dh, 09eh, 08dh, 0dfh, 08dh, 021h, 08eh
        db      062h, 08eh, 0a4h, 08eh, 0e6h, 08eh, 028h, 08fh, 06bh, 08fh, 0adh, 08fh, 0efh, 08fh, 032h, 090h
        db      075h, 090h, 0b7h, 090h, 0fah, 090h, 03dh, 091h, 081h, 091h, 0c4h, 091h, 007h, 092h, 04bh, 092h
        db      08fh, 092h, 0d2h, 092h, 016h, 093h, 05ah, 093h, 09eh, 093h, 0e3h, 093h, 027h, 094h, 06ch, 094h
        db      0b0h, 094h, 0f5h, 094h, 03ah, 095h, 07fh, 095h, 0c4h, 095h, 009h, 096h, 04fh, 096h, 094h, 096h
        db      0dah, 096h, 020h, 097h, 066h, 097h, 0ach, 097h, 0f2h, 097h, 038h, 098h, 07eh, 098h, 0c5h, 098h
        db      00ch, 099h, 052h, 099h, 099h, 099h, 0e0h, 099h, 028h, 09ah, 06fh, 09ah, 0b6h, 09ah, 0feh, 09ah
        db      046h, 09bh, 08dh, 09bh, 0d5h, 09bh, 01dh, 09ch, 066h, 09ch, 0aeh, 09ch, 0f6h, 09ch, 03fh, 09dh
        db      088h, 09dh, 0d1h, 09dh, 01ah, 09eh, 063h, 09eh, 0ach, 09eh, 0f5h, 09eh, 03fh, 09fh, 089h, 09fh
        db      0d2h, 09fh, 01ch, 0a0h, 066h, 0a0h, 0b0h, 0a0h, 0fbh, 0a0h, 045h, 0a1h, 090h, 0a1h, 0dbh, 0a1h
        db      025h, 0a2h, 070h, 0a2h, 0bch, 0a2h, 007h, 0a3h, 052h, 0a3h, 09eh, 0a3h, 0e9h, 0a3h, 035h, 0a4h
        db      081h, 0a4h, 0cdh, 0a4h, 01ah, 0a5h, 066h, 0a5h, 0b2h, 0a5h, 0ffh, 0a5h, 04ch, 0a6h, 099h, 0a6h
        db      0e6h, 0a6h, 033h, 0a7h, 080h, 0a7h, 0ceh, 0a7h, 01bh, 0a8h, 069h, 0a8h, 0b7h, 0a8h, 005h, 0a9h
        db      053h, 0a9h, 0a2h, 0a9h, 0f0h, 0a9h, 03fh, 0aah, 08dh, 0aah, 0dch, 0aah, 02bh, 0abh, 07ah, 0abh
        db      0cah, 0abh, 019h, 0ach, 069h, 0ach, 0b9h, 0ach, 008h, 0adh, 058h, 0adh, 0a9h, 0adh, 0f9h, 0adh
        db      049h, 0aeh, 09ah, 0aeh, 0ebh, 0aeh, 03ch, 0afh, 08dh, 0afh, 0deh, 0afh, 02fh, 0b0h, 081h, 0b0h
        db      0d2h, 0b0h, 024h, 0b1h, 076h, 0b1h, 0c8h, 0b1h, 01ah, 0b2h, 06dh, 0b2h, 0bfh, 0b2h, 012h, 0b3h
        db      065h, 0b3h, 0b8h, 0b3h, 00bh, 0b4h, 05eh, 0b4h, 0b2h, 0b4h, 005h, 0b5h, 059h, 0b5h, 0adh, 0b5h
        db      001h, 0b6h, 055h, 0b6h, 0a9h, 0b6h, 0feh, 0b6h, 052h, 0b7h, 0a7h, 0b7h, 0fch, 0b7h, 051h, 0b8h
        db      0a7h, 0b8h, 0fch, 0b8h, 052h, 0b9h, 0a7h, 0b9h, 0fdh, 0b9h, 053h, 0bah, 0a9h, 0bah, 000h, 0bbh
        db      056h, 0bbh, 0adh, 0bbh, 004h, 0bch, 05bh, 0bch, 0b2h, 0bch, 009h, 0bdh, 060h, 0bdh, 0b8h, 0bdh
        db      010h, 0beh, 068h, 0beh, 0c0h, 0beh, 018h, 0bfh, 070h, 0bfh, 0c9h, 0bfh, 022h, 0c0h, 07ah, 0c0h
        db      0d3h, 0c0h, 02dh, 0c1h, 086h, 0c1h, 0dfh, 0c1h, 039h, 0c2h, 093h, 0c2h, 0edh, 0c2h, 047h, 0c3h
        db      0a1h, 0c3h, 0fch, 0c3h, 057h, 0c4h, 0b1h, 0c4h, 00ch, 0c5h, 068h, 0c5h, 0c3h, 0c5h, 01eh, 0c6h
        db      07ah, 0c6h, 0d6h, 0c6h, 032h, 0c7h, 08eh, 0c7h, 0eah, 0c7h, 047h, 0c8h, 0a3h, 0c8h, 000h, 0c9h
        db      05dh, 0c9h, 0bah, 0c9h, 017h, 0cah, 075h, 0cah, 0d3h, 0cah, 030h, 0cbh, 08eh, 0cbh, 0ech, 0cbh
        db      04bh, 0cch, 0a9h, 0cch, 008h, 0cdh, 067h, 0cdh, 0c6h, 0cdh, 025h, 0ceh, 084h, 0ceh, 0e4h, 0ceh
        db      044h, 0cfh, 0a3h, 0cfh, 003h, 0d0h, 064h, 0d0h, 0c4h, 0d0h, 025h, 0d1h, 085h, 0d1h, 0e6h, 0d1h
        db      047h, 0d2h, 0a9h, 0d2h, 00ah, 0d3h, 06ch, 0d3h, 0cdh, 0d3h, 02fh, 0d4h, 091h, 0d4h, 0f4h, 0d4h
        db      056h, 0d5h, 0b9h, 0d5h, 01ch, 0d6h, 07fh, 0d6h, 0e2h, 0d6h, 045h, 0d7h, 0a9h, 0d7h, 00dh, 0d8h
        db      071h, 0d8h, 0d5h, 0d8h, 039h, 0d9h, 09eh, 0d9h, 002h, 0dah, 067h, 0dah, 0cch, 0dah, 031h, 0dbh
        db      097h, 0dbh, 0fch, 0dbh, 062h, 0dch, 0c8h, 0dch, 02eh, 0ddh, 094h, 0ddh, 0fbh, 0ddh, 061h, 0deh
        db      0c8h, 0deh, 02fh, 0dfh, 097h, 0dfh, 0feh, 0dfh, 066h, 0e0h, 0cdh, 0e0h, 035h, 0e1h, 09eh, 0e1h
        db      006h, 0e2h, 06eh, 0e2h, 0d7h, 0e2h, 040h, 0e3h, 0a9h, 0e3h, 012h, 0e4h, 07ch, 0e4h, 0e6h, 0e4h
        db      050h, 0e5h, 0bah, 0e5h, 024h, 0e6h, 08eh, 0e6h, 0f9h, 0e6h, 064h, 0e7h, 0cfh, 0e7h, 03ah, 0e8h
        db      0a5h, 0e8h, 011h, 0e9h, 07dh, 0e9h, 0e9h, 0e9h, 055h, 0eah, 0c1h, 0eah, 02eh, 0ebh, 09bh, 0ebh
        db      008h, 0ech, 075h, 0ech, 0e2h, 0ech, 050h, 0edh, 0beh, 0edh, 02ch, 0eeh, 09ah, 0eeh, 008h, 0efh
        db      077h, 0efh, 0e5h, 0efh, 054h, 0f0h, 0c3h, 0f0h, 033h, 0f1h, 0a2h, 0f1h, 012h, 0f2h, 082h, 0f2h
        db      0f2h, 0f2h, 063h, 0f3h, 0d3h, 0f3h, 044h, 0f4h, 0b5h, 0f4h, 026h, 0f5h, 098h, 0f5h, 009h, 0f6h
        db      07bh, 0f6h, 0edh, 0f6h, 05fh, 0f7h, 0d2h, 0f7h, 044h, 0f8h, 0b7h, 0f8h, 02ah, 0f9h, 09dh, 0f9h
        db      011h, 0fah, 084h, 0fah, 0f8h, 0fah, 06ch, 0fbh, 0e1h, 0fbh, 055h, 0fch, 0cah, 0fch, 03fh, 0fdh
        db      0b4h, 0fdh, 029h, 0feh, 09fh, 0feh, 015h, 0ffh, 08bh, 0ffh, 0ffh, 0ffh, 020h, 000h, 021h, 000h
        db      022h, 000h, 023h, 000h, 024h, 000h, 025h, 000h, 026h, 000h, 027h, 000h, 028h, 000h, 029h, 000h
        db      02ah, 000h, 02bh, 000h, 02ch, 000h, 02eh, 000h, 02fh, 000h, 030h, 000h, 031h, 000h, 033h, 000h
        db      034h, 000h, 036h, 000h, 037h, 000h, 039h, 000h, 03ah, 000h, 03ch, 000h, 03dh, 000h, 03fh, 000h
        db      041h, 000h, 043h, 000h, 044h, 000h, 046h, 000h, 048h, 000h, 04ah, 000h, 04ch, 000h, 04eh, 000h
        db      051h, 000h, 053h, 000h, 055h, 000h, 057h, 000h, 05ah, 000h, 05ch, 000h, 05fh, 000h, 062h, 000h
        db      064h, 000h, 067h, 000h, 06ah, 000h, 06dh, 000h, 070h, 000h, 073h, 000h, 076h, 000h, 079h, 000h
        db      07dh, 000h, 080h, 000h, 084h, 000h, 087h, 000h, 08bh, 000h, 08fh, 000h, 093h, 000h, 097h, 000h
        db      09bh, 000h, 09fh, 000h, 0a3h, 000h, 0a8h, 000h, 0adh, 000h, 0b1h, 000h, 0b6h, 000h, 0bbh, 000h
        db      0c0h, 000h, 0c6h, 000h, 0cbh, 000h, 0d1h, 000h, 0d7h, 000h, 0dch, 000h, 0e3h, 000h, 0e9h, 000h
        db      0efh, 000h, 0f6h, 000h, 0fdh, 000h, 003h, 001h, 00bh, 001h, 012h, 001h, 01ah, 001h, 021h, 001h
        db      029h, 001h, 031h, 001h, 03ah, 001h, 043h, 001h, 04bh, 001h, 055h, 001h, 05eh, 001h, 068h, 001h
        db      071h, 001h, 07ch, 001h, 086h, 001h, 091h, 001h, 09ch, 001h, 0a7h, 001h, 0b3h, 001h, 0bfh, 001h
        db      0cbh, 001h, 0d8h, 001h, 0e5h, 001h, 0f2h, 001h, 000h, 002h, 00eh, 002h, 01dh, 002h, 02bh, 002h
        db      03bh, 002h, 04bh, 002h, 05bh, 002h, 06bh, 002h, 07ch, 002h, 08eh, 002h, 0a0h, 002h, 0b2h, 002h
        db      0c5h, 002h, 0d9h, 002h, 0edh, 002h, 002h, 003h, 017h, 003h, 02dh, 003h, 043h, 003h, 05ah, 003h
        db      072h, 003h, 08ah, 003h, 0a3h, 003h, 0bdh, 003h, 0d7h, 003h, 0f2h, 003h, 00eh, 004h, 02bh, 004h
        db      048h, 004h, 066h, 004h, 085h, 004h, 0a5h, 004h, 0c6h, 004h, 0e8h, 004h, 00ah, 005h, 02eh, 005h
        db      052h, 005h, 078h, 005h, 09eh, 005h, 0c6h, 005h, 0efh, 005h, 019h, 006h, 044h, 006h, 070h, 006h
        db      09dh, 006h, 0cch, 006h, 0fch, 006h, 02dh, 007h, 060h, 007h, 094h, 007h, 0c9h, 007h, 000h, 008h
        db      038h, 008h, 072h, 008h, 0aeh, 008h, 0ebh, 008h, 02ah, 009h, 06bh, 009h, 0adh, 009h, 0f1h, 009h
        db      038h, 00ah, 080h, 00ah, 0cah, 00ah, 016h, 00bh, 064h, 00bh, 0b4h, 00bh, 007h, 00ch, 05ch, 00ch
        db      0b3h, 00ch, 00dh, 00dh, 069h, 00dh, 0c7h, 00dh, 028h, 00eh, 08ch, 00eh, 0f3h, 00eh, 05ch, 00fh
        db      0c9h, 00fh, 038h, 010h, 0aah, 010h, 020h, 011h, 099h, 011h, 015h, 012h, 094h, 012h, 017h, 013h
        db      09eh, 013h, 029h, 014h, 0b7h, 014h, 049h, 015h, 0dfh, 015h, 079h, 016h, 018h, 017h, 0bbh, 017h
        db      062h, 018h, 00eh, 019h, 0bfh, 019h, 074h, 01ah, 02fh, 01bh, 0efh, 01bh, 0b4h, 01ch, 07eh, 01dh
        db      04eh, 01eh, 024h, 01fh, 000h, 020h, 0e2h, 020h, 0cah, 021h, 0b8h, 022h, 0adh, 023h, 0a8h, 024h
        db      0abh, 025h, 0b5h, 026h, 0c6h, 027h, 0deh, 028h, 0ffh, 029h, 027h, 02bh, 057h, 02ch, 090h, 02dh
        db      0d1h, 02eh, 01ch, 030h, 06fh, 031h, 0cch, 032h, 032h, 034h, 0a2h, 035h, 01dh, 037h, 0a1h, 038h
        if      (XL) || (MODEL = 3200) || ((XL = 0) && (FW_VERSION >= 200))
        db      031h, 03ah, 0cbh, 03bh, 071h, 03dh, 023h, 03fh, 0e0h, 040h, 0aah, 042h, 080h
        db      "DcFSHRJ^LyN"
        else
        db      031h, 03ah, 0cbh, 03bh, 071h, 03dh, 023h, 03fh, 0e0h, 040h, 0aah, 042h, 080h, 044h, 063h, 046h
        phase   0
        db      "SHRJ^LyN"
        endif
        db      0a2h, 050h, 0dbh
        db      "R#U|W"
        db      0e5h, 059h, 05fh, 05ch, 0ebh, 05eh, 088h, 061h, 038h, 064h, 0fbh, 066h, 0d2h, 069h, 0bch, 06ch
        db      0bbh, 06fh, 0d0h, 072h, 0f9h, 075h, 03ah, 079h, 091h, 07ch, 0ffh, 07fh
        db      20h dup (028h)
        db      00ah, 028h, 028h, 025h, 028h, 028h, 028h, 028h, 028h, 028h, 028h, 026h, 028h, 027h, 028h, 028h
        db      000h, 001h, 002h, 003h, 004h, 005h, 006h, 007h, 008h, 009h, 028h, 028h, 028h, 028h, 028h, 028h
        db      028h, 00bh, 00ch, 00dh, 00eh, 00fh, 010h, 011h, 012h, 013h, 014h, 015h, 016h, 017h, 018h, 019h
        db      01ah, 01bh, 01ch, 01dh, 01eh, 01fh, 020h, 021h, 022h, 023h, 024h, 028h, 028h, 028h, 028h, 028h
        db      028h, 00bh, 00ch, 00dh, 00eh, 00fh, 010h, 011h, 012h, 013h, 014h, 015h, 016h, 017h, 018h, 019h
        db      01ah, 01bh, 01ch, 01dh, 01eh, 01fh, 020h, 021h, 022h, 023h, 024h, 028h, 028h, 028h, 028h, 028h
        db      030h, 02ah, 024h, 021h, 01eh, 01ch, 01bh, 019h, 018h, 017h, 016h, 015h, 015h, 014h, 013h, 013h
        db      012h, 012h, 011h, 011h, 010h, 010h, 00fh, 00fh, 00fh, 00eh, 00eh, 00eh, 00dh, 00dh, 00dh, 00ch
        db      00ch, 00ch, 00ch, 00bh, 00bh, 00bh, 00bh, 00ah, 00ah, 00ah, 00ah, 009h, 009h, 009h, 009h, 009h
        db      009h, 008h, 008h, 008h, 008h, 008h, 007h, 007h, 007h, 007h, 007h, 007h, 007h, 006h, 006h, 006h
        db      006h, 006h, 006h, 006h, 005h, 005h, 005h, 005h, 005h, 005h, 005h, 005h, 005h, 004h, 004h, 004h
        db      004h, 004h, 004h, 004h, 004h, 004h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 002h, 001h, 001h, 001h, 001h
        db      001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 001h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      001h, 000h, 001h, 000h, 001h, 000h, 001h, 000h, 001h, 000h, 001h, 000h, 002h, 000h, 002h, 000h
        db      002h, 000h, 002h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 004h, 000h, 004h, 000h, 005h, 000h
        db      005h, 000h, 006h, 000h, 006h, 000h, 007h, 000h, 008h, 000h, 009h, 000h, 00ah, 000h, 00bh, 000h
        db      00dh, 000h, 00eh, 000h, 010h, 000h, 012h, 000h, 014h, 000h, 017h, 000h, 01ah, 000h, 01dh, 000h
        db      020h, 000h, 024h, 000h, 029h, 000h, 02eh, 000h, 033h, 000h, 039h, 000h, 040h, 000h, 048h, 000h
        db      051h, 000h, 05bh, 000h, 066h, 000h, 072h, 000h, 080h, 000h, 090h, 000h, 0a2h, 000h, 0b5h, 000h
        db      0cbh, 000h, 0e4h, 000h, 000h, 001h, 01fh, 001h, 042h, 001h, 06ah, 001h, 096h, 001h, 0c7h, 001h
        db      0ffh, 001h, 03dh, 002h, 083h, 002h, 0d2h, 002h, 02ah, 003h, 08ch, 003h, 0fbh, 003h, 078h, 004h
        db      003h, 005h, 0a0h, 005h, 04fh, 006h, 014h, 007h, 0f1h, 007h, 0eah, 008h, 000h, 00ah, 038h, 00bh
        db      097h, 00ch, 020h, 00eh, 0d9h, 00fh, 0c8h, 011h, 0f4h, 013h, 063h, 016h, 01eh, 019h, 02fh, 01ch
        db      09fh, 01fh, 07bh, 023h, 0d0h, 027h, 0abh, 02ch, 01eh, 032h, 03ch, 038h, 019h, 03fh, 0cbh
        db      "FoO Y", 0
        db      064h, 034h, 070h, 0e4h, 07dh, 041h, 08dh, 07dh, 09eh, 0d4h, 0b1h, 087h, 0c7h, 0dfh, 0dfh, 030h
        if      XL
        db      0fbh, 0ffh, 0ffh, 0ffh, 0ffh
        db      2ah dup (000h)
        db      033h, 00ch, 033h, 00ch, 033h, 00ch, 033h, 00ch, 033h, 00ch, 033h, 00ch, 033h, 00ch, 033h, 00ch
        db      033h, 00ch, 033h, 00ch, 033h, 00ch, 033h, 00ch, 033h, 00ch, 033h, 00ch, 000h, 000h, 000h, 000h
        db      0cch, 000h, 0cch, 000h, 0cch, 000h, 0cch, 000h, 0cch, 000h, 0cch, 000h, 0cch, 000h, 0cch, 000h
        db      0cch, 000h, 0cch, 000h, 0cch, 000h, 0cch, 000h, 0cch, 000h, 0cch, 000h, 000h, 000h, 000h, 000h
        db      000h, 00ch, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0ffh, 00fh, 0ffh, 00fh, 0ffh, 003h, 0ffh, 003h, 0ffh, 000h, 0ffh, 000h, 03fh, 000h, 03fh, 000h
        db      03fh, 000h, 03fh, 000h, 03fh, 000h, 03fh, 000h, 03fh, 000h, 03fh, 000h, 000h, 000h, 000h, 000h
        db      0fch, 003h, 0fch, 003h, 0fch, 003h, 0fch, 003h, 0fch, 003h, 0fch, 003h, 0fch, 003h, 0fch, 003h
        db      0fch, 003h, 0fch, 003h, 0fch, 003h, 0fch, 003h, 0fch, 003h, 0fch, 003h, 000h, 000h, 000h, 000h
        db      000h, 003h, 000h, 003h, 0c0h, 003h, 0c0h, 003h, 000h, 003h, 000h, 003h, 03fh, 003h, 03fh, 003h
        db      000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h
        db      124h dup (000h)
        db      0f3h, 003h, 0f3h, 003h, 033h, 003h, 033h, 003h, 033h, 003h, 033h, 003h, 033h, 003h, 033h, 003h
        db      033h, 003h, 033h, 003h, 033h, 003h, 033h, 003h, 0f3h, 003h, 0f3h, 003h, 000h, 000h, 000h, 000h
        db      0c3h, 000h, 0c3h, 000h, 0c3h, 000h, 0c3h, 000h, 0c3h, 000h, 0c3h, 000h, 0c3h, 000h, 0c3h, 000h
        db      0c3h, 000h, 0c3h, 000h, 0c3h, 000h, 0c3h, 000h, 0c3h, 000h, 0c3h, 000h, 000h, 000h, 000h, 000h
        db      0c3h, 000h, 0c3h, 000h, 033h, 003h, 033h, 003h, 003h, 003h, 003h, 003h, 0c3h, 000h, 0c3h, 000h
        db      033h, 000h, 033h, 000h, 033h, 000h, 033h, 000h, 0f3h, 003h, 0f3h, 003h, 000h, 000h, 000h, 000h
        db      0c3h, 000h, 0c3h, 000h, 033h, 003h, 033h, 003h, 003h, 003h, 003h, 003h, 0c3h, 000h, 0c3h, 000h
        db      003h, 003h, 003h, 003h, 033h, 003h, 033h, 003h, 0c3h, 000h, 0c3h, 000h, 000h, 000h, 000h, 000h
        db      033h, 000h, 033h, 000h, 033h, 000h, 033h, 000h, 033h, 000h, 033h, 000h, 033h, 000h, 033h, 000h
        db      033h, 003h, 033h, 003h, 0f3h, 003h, 0f3h, 003h, 003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h
        db      0f3h, 003h, 0f3h, 003h, 033h, 000h, 033h, 000h, 0f3h, 000h, 0f3h, 000h, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 033h, 003h, 033h, 003h, 0c3h, 000h, 0c3h, 000h, 000h, 000h, 000h, 000h
        db      0c3h, 000h, 0c3h, 000h, 033h, 000h, 033h, 000h, 033h, 000h, 033h, 000h, 0f3h, 000h, 0f3h, 000h
        db      033h, 003h, 033h, 003h, 033h, 003h, 033h, 003h, 0c3h, 000h, 0c3h, 000h, 000h, 000h, 000h, 000h
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 0f0h, 00fh, 0f0h, 00fh
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 03fh, 000h, 03fh, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 00fh, 0ffh, 00fh
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 0ffh, 00fh, 0ffh, 00fh
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 0ffh, 00fh, 0ffh, 00fh
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0f0h, 003h, 0f0h, 003h
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 03fh, 000h, 03fh, 000h
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h
        db      0c0h, 003h, 0c0h, 003h, 0f0h, 003h, 0f0h, 003h, 0fch, 003h, 0fch, 003h, 0ffh, 003h, 0ffh, 003h
        db      0fch, 003h, 0fch, 003h, 0f0h, 003h, 0f0h, 003h, 0c0h, 003h, 0c0h, 003h, 000h, 000h, 000h, 000h
        db      00fh, 000h, 00fh, 000h, 03fh, 000h, 03fh, 000h, 0ffh, 000h, 0ffh, 000h, 0ffh, 003h, 0ffh, 003h
        db      0ffh, 000h, 0ffh, 000h, 03fh, 000h, 03fh, 000h, 00fh, 000h, 00fh
        db      25h dup (000h)
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
        db      030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h
        db      0cch, 000h, 0cch, 000h, 0cch, 000h, 0cch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0cch, 000h, 0cch, 000h, 0cch, 000h, 0cch, 000h, 0ffh, 003h, 0ffh, 003h, 0cch, 000h, 0cch, 000h
        db      0ffh, 003h, 0ffh, 003h, 0cch, 000h, 0cch, 000h, 0cch, 000h, 0cch, 000h, 000h, 000h, 000h, 000h
        db      030h, 000h, 030h, 000h, 0fch, 003h, 0fch, 003h, 033h, 000h, 033h, 000h, 0fch, 000h, 0fch, 000h
        db      030h, 003h, 030h, 003h, 0ffh, 000h, 0ffh, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h
        db      00fh, 000h, 00fh, 000h, 00fh, 003h, 00fh, 003h, 0c0h, 000h, 0c0h, 000h, 030h, 000h, 030h, 000h
        db      00ch, 000h, 00ch, 000h, 0c3h, 003h, 0c3h, 003h, 0c0h, 003h, 0c0h, 003h, 000h, 000h, 000h, 000h
        db      03ch, 000h, 03ch, 000h, 0c3h, 000h, 0c3h, 000h, 033h, 000h, 033h, 000h, 00ch, 000h, 00ch, 000h
        db      033h, 003h, 033h, 003h, 0c3h, 000h, 0c3h, 000h, 03ch, 003h, 03ch, 003h, 000h, 000h, 000h, 000h
        db      03ch, 000h, 03ch, 000h, 030h, 000h, 030h, 000h, 00ch, 000h, 00ch, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0c0h, 000h, 0c0h, 000h, 030h, 000h, 030h, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h
        db      00ch, 000h, 00ch, 000h, 030h, 000h, 030h, 000h, 0c0h, 000h, 0c0h, 000h, 000h, 000h, 000h, 000h
        db      00ch, 000h, 00ch, 000h, 030h, 000h, 030h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h
        db      0c0h, 000h, 0c0h, 000h, 030h, 000h, 030h, 000h, 00ch, 000h, 00ch, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h, 033h, 003h, 033h, 003h, 0fch, 000h, 0fch, 000h
        db      033h, 003h, 033h, 003h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 0ffh, 003h, 0ffh, 003h
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      03ch, 000h, 03ch, 000h, 030h, 000h, 030h, 000h, 00ch, 000h, 00ch, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh, 003h
        db      24h dup (000h)
        db      018h, 000h, 03ch, 000h, 03ch, 000h, 018h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 003h, 000h, 003h, 0c0h, 000h, 0c0h, 000h, 030h, 000h, 030h, 000h, 00ch, 000h, 00ch, 000h
        db      003h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 078h, 000h, 0fch, 000h
        db      086h, 001h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      003h, 003h, 086h, 001h, 0fch, 000h, 078h, 000h, 000h, 000h, 000h, 000h, 030h, 000h, 038h, 000h
        db      03ch, 000h, 03ch, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
        db      030h, 000h, 030h, 000h, 0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh, 001h
        db      003h, 003h, 003h, 003h, 000h, 003h, 000h, 003h, 080h, 001h, 0c0h, 000h, 060h, 000h, 030h, 000h
        db      018h, 000h, 00ch, 003h, 0feh, 003h, 0ffh, 003h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh, 003h
        db      080h, 001h, 0c0h, 000h, 060h, 000h, 030h, 000h, 060h, 000h, 0c0h, 000h, 080h, 001h, 000h, 003h
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL) && (FW_VERSION >= 200))
        db      003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 0c0h, 000h, 0e0h, 000h
        db      0f0h, 000h, 0d8h, 000h, 0cch, 000h, 0c6h, 000h, 0c3h, 000h, 0c3h, 000h, 0ffh, 003h, 0ffh, 003h
        db      0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh, 003h
        db      003h, 000h, 003h, 000h, 003h, 000h, 0ffh, 000h, 0ffh, 001h, 000h, 003h, 000h, 003h, 000h, 003h
        db      003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 0f0h, 000h, 0f8h, 000h
        db      00ch, 000h, 006h, 000h, 003h, 000h, 07fh, 000h, 0ffh, 000h, 083h, 001h, 003h, 003h, 003h, 003h
        db      003h, 003h, 086h, 001h, 0fch, 000h, 078h, 000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh, 003h
        db      003h, 003h, 000h, 003h, 080h, 001h, 0c0h, 000h, 060h, 000h, 030h, 000h, 018h, 000h, 00ch, 000h
        db      00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh, 001h
        db      003h, 003h, 003h, 003h, 003h, 003h, 086h, 001h, 0fch, 000h, 0fch, 000h, 086h, 001h, 003h, 003h
        db      003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh, 001h
        db      003h, 003h, 003h, 003h, 003h, 003h, 006h, 003h, 0fch, 003h, 0f8h, 003h, 000h, 003h, 000h, 003h
        db      080h, 001h, 0c0h, 000h, 07ch, 000h, 03ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      03ch, 000h, 03ch, 000h, 03ch, 000h, 03ch, 000h, 000h, 000h, 000h, 000h, 03ch, 000h, 03ch, 000h
        db      03ch, 000h, 03ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      03ch, 000h, 03ch, 000h, 03ch, 000h, 03ch, 000h, 000h, 000h, 000h, 000h, 03ch, 000h, 03ch, 000h
        db      030h, 000h, 030h, 000h, 00ch, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 0c0h, 003h, 0c0h, 003h
        db      0f0h, 000h, 0f0h, 000h, 03ch, 000h, 03ch, 000h, 00fh, 000h, 00fh, 000h, 03ch, 000h, 03ch, 000h
        db      0f0h, 000h, 0f0h, 000h, 0c0h, 003h, 0c0h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh, 003h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh, 003h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00fh, 000h, 00fh, 000h
        db      03ch, 000h, 03ch, 000h, 0f0h, 000h, 0f0h, 000h, 0c0h, 003h, 0c0h, 003h, 0f0h, 000h, 0f0h, 000h
        db      03ch, 000h, 03ch, 000h, 00fh, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0fch, 000h
        db      003h, 003h, 003h, 003h, 000h, 003h, 000h, 003h, 0c0h, 000h, 0c0h, 000h, 030h, 000h, 030h, 000h
        db      000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0fch, 000h
        db      003h, 003h, 003h, 003h, 000h, 003h, 000h, 003h, 03ch, 003h, 03ch, 003h, 033h, 003h, 033h, 003h
        db      033h, 003h, 033h, 003h, 0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 030h, 000h, 078h, 000h
        db      0cch, 000h, 086h, 001h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0ffh, 003h, 0ffh, 003h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0ffh, 001h
        db      003h, 003h, 003h, 003h, 003h, 003h, 083h, 001h, 0ffh, 000h, 0ffh, 000h, 083h, 001h, 003h, 003h
        db      003h, 003h, 003h, 003h, 0ffh, 001h, 0ffh, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh, 001h
        db      003h, 003h, 003h, 003h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h
        db      003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 03fh, 000h, 07fh, 000h
        db      0c3h, 000h, 083h, 001h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      083h, 001h, 0c3h, 000h, 07fh, 000h, 03fh, 000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh, 003h
        db      003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 0ffh, 000h, 0ffh, 000h, 003h, 000h, 003h, 000h
        db      003h, 000h, 003h, 000h, 0ffh, 003h, 0ffh, 003h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh, 003h
        db      003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 0ffh, 000h, 0ffh, 000h, 003h, 000h, 003h, 000h
        db      003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh, 001h
        db      003h, 003h, 003h, 003h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 0c3h, 003h, 0c3h, 003h
        db      003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0ffh, 003h, 0ffh, 003h, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 0fch, 000h, 0fch, 000h
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
        db      030h, 000h, 030h, 000h, 0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 0fch, 003h, 0fch, 003h
        db      0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h
        db      0c3h, 000h, 0c3h, 000h, 07eh, 000h, 03ch, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 083h, 001h
        db      0c3h, 000h, 063h, 000h, 033h, 000h, 01bh, 000h, 00fh, 000h, 00fh, 000h, 01bh, 000h, 033h, 000h
        db      063h, 000h, 0c3h, 000h, 083h, 001h, 003h, 003h, 000h, 000h, 000h, 000h, 003h, 000h, 003h, 000h
        db      003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h
        db      003h, 000h, 003h, 000h, 0ffh, 003h, 0ffh, 003h, 000h, 000h, 000h, 000h, 003h, 003h, 087h, 003h
        db      0cfh, 003h, 0ffh, 003h, 07bh, 003h, 033h, 003h, 033h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 003h, 003h, 003h, 003h
        db      003h, 003h, 007h, 003h, 00fh, 003h, 01bh, 003h, 033h, 003h, 063h, 003h, 0c3h, 003h, 083h, 003h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh, 001h
        elseif  (XL) && (FW_VERSION = 150)
        db      003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h
        dw      far_2c110+4c00h, 0e000h
        db      000h, 0f0h, 000h, 0d8h, 000h, 0cch, 000h, 0c6h, 000h, 0c3h, 000h, 0c3h, 000h, 0ffh, 003h, 0ffh
        db      003h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh
        db      003h, 003h, 000h, 003h, 000h, 003h, 000h, 0ffh, 000h, 0ffh, 001h, 000h, 003h, 000h, 003h, 000h
        db      003h, 003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 0f0h, 000h, 0f8h
        db      000h, 00ch, 000h, 006h, 000h, 003h, 000h, 07fh, 000h, 0ffh, 000h, 083h, 001h, 003h, 003h, 003h
        db      003h, 003h, 003h, 086h, 001h, 0fch, 000h, 078h, 000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh
        db      003h, 003h, 003h, 000h, 003h, 080h, 001h, 0c0h, 000h, 060h, 000h, 030h, 000h, 018h, 000h, 00ch
        db      000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh
        db      001h, 003h, 003h, 003h, 003h, 003h, 003h, 086h, 001h, 0fch, 000h, 0fch, 000h, 086h, 001h, 003h
        db      003h, 003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh
        db      001h, 003h, 003h, 003h, 003h, 003h, 003h, 006h, 003h, 0fch, 003h, 0f8h, 003h, 000h, 003h, 000h
        db      003h, 080h, 001h, 0c0h, 000h, 07ch, 000h, 03ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 03ch, 000h, 03ch, 000h, 03ch, 000h, 03ch, 000h, 000h, 000h, 000h, 000h, 03ch, 000h, 03ch
        db      000h, 03ch, 000h, 03ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 03ch, 000h, 03ch, 000h, 03ch, 000h, 03ch, 000h, 000h, 000h, 000h, 000h, 03ch, 000h, 03ch
        db      000h, 030h, 000h, 030h, 000h, 00ch, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 0c0h, 003h, 0c0h
        db      003h, 0f0h, 000h, 0f0h, 000h, 03ch, 000h, 03ch, 000h, 00fh, 000h, 00fh, 000h, 03ch, 000h, 03ch
        db      000h, 0f0h, 000h, 0f0h, 000h, 0c0h, 003h, 0c0h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh, 003h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh
        db      003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00fh, 000h, 00fh
        db      000h, 03ch, 000h, 03ch, 000h, 0f0h, 000h, 0f0h, 000h, 0c0h, 003h, 0c0h, 003h, 0f0h, 000h, 0f0h
        db      000h, 03ch, 000h, 03ch, 000h, 00fh, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0fch
        db      000h, 003h, 003h, 003h, 003h, 000h, 003h, 000h, 003h, 0c0h, 000h, 0c0h, 000h, 030h, 000h, 030h
        db      000h, 000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0fch
        db      000h, 003h, 003h, 003h, 003h, 000h, 003h, 000h, 003h, 03ch, 003h, 03ch, 003h, 033h, 003h, 033h
        db      003h, 033h, 003h, 033h, 003h, 0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 030h, 000h, 078h
        db      000h, 0cch, 000h, 086h, 001h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0ffh, 003h, 0ffh
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0ffh
        db      001h, 003h, 003h, 003h, 003h, 003h, 003h, 083h, 001h, 0ffh, 000h, 0ffh, 000h, 083h, 001h, 003h
        db      003h, 003h, 003h, 003h, 003h, 0ffh, 001h, 0ffh, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh
        db      001h, 003h, 003h, 003h, 003h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h
        db      000h, 003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 03fh, 000h, 07fh
        db      000h, 0c3h, 000h, 083h, 001h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      003h, 083h, 001h, 0c3h, 000h, 07fh, 000h, 03fh, 000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh
        db      003h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 0ffh, 000h, 0ffh, 000h, 003h, 000h, 003h
        db      000h, 003h, 000h, 003h, 000h, 0ffh, 003h, 0ffh, 003h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh
        db      003h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 0ffh, 000h, 0ffh, 000h, 003h, 000h, 003h
        db      000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh
        db      001h, 003h, 003h, 003h, 003h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 0c3h, 003h, 0c3h
        db      003h, 003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0ffh, 003h, 0ffh, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 0fch, 000h, 0fch
        db      000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h
        db      000h, 030h, 000h, 030h, 000h, 0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 0fch, 003h, 0fch
        db      003h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h
        db      000h, 0c3h, 000h, 0c3h, 000h, 07eh, 000h, 03ch, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 083h
        db      001h, 0c3h, 000h, 063h, 000h, 033h, 000h, 01bh, 000h, 00fh, 000h, 00fh, 000h, 01bh, 000h, 033h
        db      000h, 063h, 000h, 0c3h, 000h, 083h, 001h, 003h, 003h, 000h, 000h, 000h, 000h, 003h, 000h, 003h
        db      000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h
        db      000h, 003h, 000h, 003h, 000h, 0ffh, 003h, 0ffh, 003h, 000h, 000h, 000h, 000h, 003h, 003h, 087h
        db      003h, 0cfh, 003h, 0ffh, 003h, 07bh, 003h, 033h, 003h, 033h, 003h, 003h, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 003h, 003h, 003h
        db      003h, 003h, 003h, 007h, 003h, 00fh, 003h, 01bh, 003h, 033h, 003h, 063h, 003h, 0c3h, 003h, 083h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh
        db      001h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0ffh
        db      001h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0ffh, 001h, 0ffh, 000h, 003h, 000h, 003h
        db      000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh
        db      001h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 01bh, 003h, 033h
        db      003h, 0e3h, 001h, 0c3h, 000h, 0feh, 001h, 03ch, 003h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0ffh
        db      001h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0ffh, 001h, 0ffh, 000h, 01bh, 000h, 033h
        db      000h, 063h, 000h, 0c3h, 000h, 083h, 001h, 003h, 003h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh
        db      001h, 003h, 003h, 003h, 003h, 003h, 000h, 003h, 000h, 0feh, 000h, 0fch, 001h, 000h, 003h, 000h
        db      003h, 003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh
        db      003h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h
        db      000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 003h
        endif
        if      XL
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL) && (FW_VERSION >= 200))
        db      003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0ffh, 001h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0ffh, 001h, 0ffh, 000h, 003h, 000h, 003h, 000h
        db      003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh, 001h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 01bh, 003h, 033h, 003h
        db      0e3h, 001h, 0c3h, 000h, 0feh, 001h, 03ch, 003h, 000h, 000h, 000h, 000h, 0ffh, 000h, 0ffh, 001h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0ffh, 001h, 0ffh, 000h, 01bh, 000h, 033h, 000h
        db      063h, 000h, 0c3h, 000h, 083h, 001h, 003h, 003h, 000h, 000h, 000h, 000h, 0fch, 000h, 0feh, 001h
        db      003h, 003h, 003h, 003h, 003h, 000h, 003h, 000h, 0feh, 000h, 0fch, 001h, 000h, 003h, 000h, 003h
        db      003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh, 003h
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 003h, 003h
        elseif  (XL) && (FW_VERSION = 150)
        db      003h, 003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 003h
        endif
        if      XL
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL) && (FW_VERSION >= 200))
        db      003h, 003h, 003h, 003h, 0feh, 001h, 0fch, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      086h, 001h, 0cch, 000h, 078h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 033h, 003h, 033h, 003h
        db      033h, 003h, 07bh, 003h, 0ceh, 001h, 084h, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 003h, 003h
        db      003h, 003h, 086h, 001h, 0cch, 000h, 078h, 000h, 030h, 000h, 030h, 000h, 078h, 000h, 0cch, 000h
        db      086h, 001h, 003h, 003h, 003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 003h, 003h, 003h, 003h
        db      003h, 003h, 086h, 001h, 0cch, 000h, 078h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh, 003h
        db      000h, 003h, 080h, 001h, 0c0h, 000h, 060h, 000h, 030h, 000h, 018h, 000h, 00ch, 000h, 006h, 000h
        db      003h, 000h, 003h, 000h, 0ffh, 003h, 0ffh, 003h, 000h, 000h, 000h, 000h, 0fch, 000h, 0fch, 000h
        db      00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h
        db      00ch, 000h, 00ch, 000h, 0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      003h, 000h, 003h, 000h, 00ch, 000h, 00ch, 000h, 030h, 000h, 030h, 000h, 0c0h, 000h, 0c0h, 000h
        db      000h, 003h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0fch, 000h
        db      0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h
        db      0c0h, 000h, 0c0h, 000h, 0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h
        db      0fch, 000h, 0fch, 000h, 0ffh, 003h, 0ffh, 003h, 0fch, 000h, 0fch, 000h, 0fch, 000h, 0fch, 000h
        db      0fch, 000h, 0fch
        elseif  (XL) && (FW_VERSION = 150)
        db      003h, 086h, 001h, 0cch, 000h, 078h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 033h, 003h, 033h
        db      003h, 033h, 003h, 07bh, 003h, 0ceh, 001h, 084h, 000h, 000h, 000h, 000h, 000h, 003h, 003h, 003h
        db      003h, 003h, 003h, 086h, 001h, 0cch, 000h, 078h, 000h, 030h, 000h, 030h, 000h, 078h, 000h, 0cch
        db      000h, 086h, 001h, 003h, 003h, 003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 003h, 003h, 003h
        db      003h, 003h, 003h, 086h, 001h, 0cch, 000h, 078h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h
        db      000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 0ffh, 003h, 0ffh
        db      003h, 000h, 003h, 080h, 001h, 0c0h, 000h, 060h, 000h, 030h, 000h, 018h, 000h, 00ch, 000h, 006h
        db      000h, 003h, 000h, 003h, 000h, 0ffh, 003h, 0ffh, 003h, 000h, 000h, 000h, 000h, 0fch, 000h, 0fch
        db      000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch
        db      000h, 00ch, 000h, 00ch, 000h, 0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 003h, 000h, 003h, 000h, 00ch, 000h, 00ch, 000h, 030h, 000h, 030h, 000h, 0c0h, 000h, 0c0h
        db      000h, 000h, 003h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0fch, 000h, 0fch
        db      000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h
        db      000h, 0c0h, 000h, 0c0h, 000h, 0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 030h, 000h, 030h
        db      000h, 0fch, 000h, 0fch, 000h, 0ffh, 003h, 0ffh, 003h, 0fch, 000h, 0fch, 000h, 0fch, 000h, 0fch
        db      000h, 0fch, 000h, 0fch
        endif
        if      XL
        db      21h dup (000h)
        db      0ffh, 003h, 0ffh, 003h, 000h, 000h, 000h, 000h, 00ch, 000h, 00ch, 000h, 030h, 000h, 030h, 000h
        db      0c0h, 000h, 0c0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0fch, 000h, 0fch, 000h, 000h, 003h, 000h, 003h, 0fch, 003h, 0fch, 003h, 003h, 003h, 003h, 003h
        db      0fch, 003h, 0fch, 003h, 000h, 000h, 000h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h
        db      0ffh, 000h, 0ffh, 000h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      0ffh, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0fch, 003h, 0fch, 003h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h
        db      0fch, 003h, 0fch, 003h, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h
        db      0fch, 003h, 0fch, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      0fch, 003h, 0fch, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0fch, 000h, 0fch, 000h, 003h, 003h, 003h, 003h, 0ffh, 003h, 0ffh, 003h, 003h, 000h, 003h, 000h
        db      0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 0f0h, 000h, 0f0h, 000h, 00ch, 003h, 00ch, 003h
        db      00ch, 000h, 00ch, 000h, 03fh, 000h, 03fh, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h
        db      00ch, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0fch, 003h, 0fch, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0fch, 003h, 0fch, 003h
        db      000h, 003h, 000h, 003h, 0fch, 000h, 0fch, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h
        db      0ffh, 000h, 0ffh, 000h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h
        db      03ch, 000h, 03ch, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
        db      0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 0c0h, 000h, 0c0h, 000h, 000h, 000h, 000h, 000h
        db      0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h, 0c0h, 000h
        db      0c3h, 000h, 0c3h, 000h, 03ch, 000h, 03ch, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h
        db      0c3h, 000h, 0c3h, 000h, 033h, 000h, 033h, 000h, 00fh, 000h, 00fh, 000h, 033h, 000h, 033h, 000h
        db      0c3h, 000h, 0c3h, 000h, 000h, 000h, 000h, 000h, 03ch, 000h, 03ch, 000h, 030h, 000h, 030h, 000h
        db      030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
        db      0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0cfh, 000h, 0cfh, 000h, 033h, 003h, 033h, 003h, 033h, 003h, 033h, 003h, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0f3h, 000h, 0f3h, 000h, 00fh, 003h, 00fh, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0fch, 000h, 0fch, 000h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0ffh, 000h, 0ffh, 000h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0ffh, 000h, 0ffh, 000h
        db      003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      03ch, 003h, 03ch, 003h, 0c3h, 003h, 0c3h, 003h, 0c3h, 003h, 0c3h, 003h, 03ch, 003h, 03ch, 003h
        db      000h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0f3h, 000h, 0f3h, 000h, 00fh, 003h, 00fh, 003h, 003h, 000h, 003h, 000h, 003h, 000h, 003h, 000h
        db      003h, 000h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0fch, 003h, 0fch, 003h, 003h, 000h, 003h, 000h, 0fch, 000h, 0fch, 000h, 000h, 003h, 000h, 003h
        db      0ffh, 000h, 0ffh, 000h, 000h, 000h, 000h, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h
        db      03fh, 000h, 03fh, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 000h, 00ch, 003h, 00ch, 003h
        db      0f0h, 000h, 0f0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h
        db      0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0cch, 000h, 0cch, 000h
        db      030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 033h, 003h, 033h, 003h, 033h, 003h, 033h, 003h
        db      0cch, 000h, 0cch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      003h, 003h, 003h, 003h, 0cch, 000h, 0cch, 000h, 030h, 000h, 030h, 000h, 0cch, 000h, 0cch, 000h
        db      003h, 003h, 003h, 003h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 003h, 0fch, 003h, 0fch, 003h
        db      000h, 003h, 000h, 003h, 0fch, 000h, 0fch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      0ffh, 003h, 0ffh, 003h, 0c0h, 000h, 0c0h, 000h, 030h, 000h, 030h, 000h, 00ch, 000h, 00ch, 000h
        db      0ffh, 003h, 0ffh, 003h, 000h, 000h, 000h, 000h, 0c0h, 000h, 0c0h, 000h, 030h, 000h, 030h, 000h
        db      030h, 000h, 030h, 000h, 00ch, 000h, 00ch, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
        db      0c0h, 000h, 0c0h, 000h, 000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
        db      030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
        db      030h, 000h, 030h, 000h, 000h, 000h, 000h, 000h, 00ch, 000h, 00ch, 000h, 030h, 000h, 030h, 000h
        db      030h, 000h, 030h, 000h, 0c0h, 000h, 0c0h, 000h, 030h, 000h, 030h, 000h, 030h, 000h, 030h, 000h
        db      00ch, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h
        db      0c0h, 000h, 0c0h, 000h, 0ffh, 003h, 0ffh, 003h, 0c0h, 000h, 0c0h, 000h, 030h, 000h, 030h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 030h, 000h, 030h, 000h
        db      00ch, 000h, 00ch, 000h, 0ffh, 003h, 0ffh, 003h, 00ch, 000h, 00ch, 000h, 030h, 000h, 030h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      025h, 025h, 025h, 025h, 025h, 025h, 025h, 000h, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 000h
        db      020h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 03fh, 01fh, 00fh, 007h, 007h, 007h, 007h, 000h
        db      01eh, 01eh, 01eh, 01eh, 01eh, 01eh, 01eh, 000h, 010h, 018h, 010h, 017h, 010h, 010h, 010h
        db      3ah dup (000h)
        db      00ch, 012h, 021h, 012h, 00ch, 000h, 000h, 000h, 006h, 009h, 010h, 009h, 006h, 000h, 000h, 01dh
        db      015h, 015h, 015h, 015h, 015h, 01dh, 000h, 009h, 009h, 009h, 009h, 009h, 009h, 009h, 000h, 009h
        db      015h, 011h, 009h, 005h, 005h, 01dh, 000h, 009h, 015h, 011h, 009h, 011h, 015h, 009h, 000h, 005h
        db      005h, 005h, 005h, 015h, 01dh, 011h, 000h, 01dh, 005h, 00dh, 011h, 011h, 015h, 009h, 000h, 009h
        db      005h, 005h, 00dh, 015h, 015h, 009h, 000h, 004h, 004h, 004h, 03ch, 000h, 000h, 000h, 000h, 004h
        db      004h, 004h, 007h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 03fh, 000h, 000h, 000h, 000h, 004h
        db      004h, 004h, 03fh, 000h, 000h, 000h, 000h, 000h, 004h, 004h, 03fh, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 01ch, 004h, 004h, 004h, 000h, 000h, 000h, 000h, 007h, 004h, 004h, 004h, 000h, 018h
        db      01ch, 01eh, 01fh, 01eh, 01ch, 018h, 000h, 003h, 007h, 00fh, 01fh, 00fh, 007h, 003h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 004h, 004h, 004h, 004h, 004h, 000h, 004h, 000h, 00ah
        db      00ah, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 00ah, 01fh, 00ah, 01fh, 00ah, 00ah, 000h, 004h
        db      01eh, 005h, 00eh, 014h, 00fh, 004h, 000h, 003h, 013h, 008h, 004h, 002h, 019h, 018h, 000h, 006h
        db      009h, 005h, 002h, 015h, 009h, 016h, 000h, 006h, 004h, 002h, 000h, 000h, 000h, 000h, 000h, 008h
        db      004h, 002h, 002h, 002h, 004h, 008h, 000h, 002h, 004h, 008h, 008h, 008h, 004h, 002h, 000h, 000h
        db      004h, 015h, 00eh, 015h, 004h, 000h, 000h, 000h, 004h, 004h, 01fh, 004h, 004h, 000h, 000h, 000h
        db      000h, 000h, 000h, 006h, 004h, 002h, 000h, 000h, 000h, 000h, 01fh, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 006h, 006h, 000h, 000h, 010h, 008h, 004h, 002h, 001h, 000h, 000h, 004h
        db      00ah, 011h, 011h, 011h, 00ah, 004h, 000h, 004h, 006h, 004h, 004h, 004h, 004h, 00eh, 000h, 00eh
        db      011h, 010h, 008h, 004h, 002h, 01fh, 000h, 01fh, 008h, 004h, 008h, 010h, 011h, 00eh, 000h, 008h
        db      00ch, 00ah, 009h, 01fh, 008h, 008h, 000h, 01fh, 001h, 00fh, 010h, 010h, 011h, 00eh, 000h, 00ch
        db      002h, 001h, 00fh, 011h, 011h, 00eh, 000h, 01fh, 011h, 008h, 004h, 002h, 001h, 001h, 000h, 00eh
        db      011h, 011h, 00eh, 011h, 011h, 00eh, 000h, 00eh, 011h, 011h, 01eh, 010h, 008h, 006h, 000h, 000h
        db      006h, 006h, 000h, 006h, 006h, 000h, 000h, 000h, 006h, 006h, 000h, 006h, 004h, 002h, 000h, 018h
        db      00ch, 006h, 003h, 006h, 00ch, 018h, 000h, 000h, 000h, 01fh, 000h, 01fh, 000h, 000h, 000h, 003h
        db      006h, 00ch, 018h, 00ch, 006h, 003h, 000h, 00eh, 011h, 010h, 008h, 004h, 000h, 004h, 000h, 00eh
        db      011h, 010h, 016h, 015h, 015h, 00eh, 000h, 004h, 00ah, 011h, 011h, 01fh, 011h, 011h, 000h, 00fh
        db      011h, 011h, 00fh, 011h, 011h, 00fh, 000h, 00eh, 011h, 001h, 001h, 001h, 011h, 00eh, 000h, 007h
        db      009h, 011h, 011h, 011h, 009h, 007h, 000h, 01fh, 001h, 001h, 00fh, 001h, 001h, 01fh, 000h, 01fh
        db      001h, 001h, 00fh, 001h, 001h, 001h, 000h, 00eh, 011h, 001h, 001h, 019h, 011h, 00eh, 000h, 011h
        db      011h, 011h, 01fh, 011h, 011h, 011h, 000h, 00eh, 004h, 004h, 004h, 004h, 004h, 00eh, 000h, 01eh
        db      008h, 008h, 008h, 008h, 009h, 006h, 000h, 011h, 009h, 005h, 003h, 005h, 009h, 011h, 000h, 001h
        db      001h, 001h, 001h, 001h, 001h, 01fh, 000h, 011h, 01bh, 015h, 015h, 011h, 011h, 011h, 000h, 011h
        db      011h, 013h, 015h, 019h, 011h, 011h, 000h, 00eh, 011h, 011h, 011h, 011h, 011h, 00eh, 000h, 00fh
        db      011h, 011h, 00fh, 001h, 001h, 001h, 000h, 00eh, 011h, 011h, 011h, 015h, 009h, 016h, 000h, 00fh
        db      011h, 011h, 00fh, 005h, 009h, 011h, 000h, 00eh, 011h, 001h, 00eh, 010h, 011h, 00eh, 000h, 01fh
        db      004h, 004h, 004h, 004h, 004h, 004h, 000h, 011h, 011h, 011h, 011h, 011h, 011h, 00eh, 000h, 011h
        db      011h, 011h, 011h, 011h, 00ah, 004h, 000h, 011h, 011h, 011h, 015h, 015h, 015h, 00ah, 000h, 011h
        db      011h, 00ah, 004h, 00ah, 011h, 011h, 000h, 011h, 011h, 00ah, 004h, 004h, 004h, 004h, 000h, 01fh
        db      010h, 008h, 004h, 002h, 001h, 01fh, 000h, 00eh, 002h, 002h, 002h, 002h, 002h, 00eh, 000h, 000h
        db      001h, 002h, 004h, 008h, 010h, 000h, 000h, 00eh, 008h, 008h, 008h, 008h, 008h, 00eh, 000h, 004h
        db      00eh, 01fh, 00eh, 00eh, 00eh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 01fh, 000h, 002h
        db      004h, 008h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00eh, 010h, 01eh, 011h, 01eh, 000h, 001h
        db      001h, 00fh, 011h, 011h, 011h, 00fh, 000h, 000h, 000h, 01eh, 001h, 001h, 001h, 01eh, 000h, 010h
        db      010h, 01eh, 011h, 011h, 011h, 01eh, 000h, 000h, 000h, 00eh, 011h, 01fh, 001h, 00eh, 000h, 00ch
        db      012h, 002h, 007h, 002h, 002h, 002h, 000h, 000h, 000h, 01eh, 011h, 011h, 01eh, 010h, 00eh, 001h
        db      001h, 00fh, 011h, 011h, 011h, 011h, 000h, 004h, 000h, 006h, 004h, 004h, 004h, 00eh, 000h, 008h
        db      000h, 008h, 008h, 008h, 008h, 009h, 006h, 001h, 001h, 009h, 005h, 003h, 005h, 009h, 000h, 006h
        db      004h, 004h, 004h, 004h, 004h, 00eh, 000h, 000h, 000h, 00bh, 015h, 015h, 011h, 011h, 000h, 000h
        db      000h, 00dh, 013h, 011h, 011h, 011h, 000h, 000h, 000h, 00eh, 011h, 011h, 011h, 00eh, 000h, 000h
        db      000h, 00fh, 011h, 011h, 00fh, 001h, 001h, 000h, 000h, 016h, 019h, 019h, 016h, 010h, 010h, 000h
        db      000h, 00dh, 013h, 001h, 001h, 001h, 000h, 000h, 000h, 01eh, 001h, 00eh, 010h, 00fh, 000h, 002h
        db      002h, 007h, 002h, 002h, 012h, 00ch, 000h, 000h, 000h, 011h, 011h, 011h, 011h, 00eh, 000h, 000h
        db      000h, 011h, 011h, 011h, 00ah, 004h, 000h, 000h, 000h, 011h, 011h, 015h, 015h, 00ah, 000h, 000h
        db      000h, 011h, 00ah, 004h, 00ah, 011h, 000h, 000h, 000h, 011h, 011h, 011h, 01eh, 010h, 00eh, 000h
        db      000h, 01fh, 008h, 004h, 002h, 01fh, 000h, 008h, 004h, 004h, 002h, 004h, 004h, 008h, 000h, 004h
        db      004h, 004h, 000h, 004h, 004h, 004h, 000h, 002h, 004h, 004h, 008h, 004h, 004h, 002h, 000h, 000h
        db      004h, 008h, 01fh, 008h, 004h, 000h, 000h, 000h, 004h, 002h, 01fh, 002h, 004h, 000h, 000h, 081h
        db      083h, 086h, 08ah, 000h, 001h, 041h, 058h, 08ah, 036h, 001h, 053h, 049h, 08ah, 06ch, 001h, 043h
        db      053h, 08ah, 0a8h, 001h
        elseif  (XL = 0) && (MODEL = 3200)
        db      0fbh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 025h, 025h, 025h, 025h, 025h, 025h, 025h, 000h, 00ah
        db      00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 000h, 020h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 03fh
        db      01fh, 00fh, 007h, 007h, 007h, 007h, 000h, 01eh, 01eh, 01eh, 01eh, 01eh, 01eh, 01eh, 000h, 010h
        db      018h, 010h, 017h, 010h, 010h, 010h
        db      49h dup (000h)
        db      01dh, 015h, 015h, 015h, 015h, 015h, 01dh, 000h, 009h, 009h, 009h, 009h, 009h, 009h, 009h, 000h
        db      009h, 015h, 011h, 009h, 005h, 005h, 01dh, 000h, 009h, 015h, 011h, 009h, 011h, 015h, 009h, 000h
        db      005h, 005h, 005h, 005h, 015h, 01dh, 011h, 000h, 01dh, 005h, 00dh, 011h, 011h, 015h, 009h, 000h
        db      009h, 005h, 005h, 00dh, 015h, 015h, 009h, 000h, 004h, 004h, 004h, 03ch, 000h, 000h, 000h, 000h
        db      004h, 004h, 004h, 007h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 03fh, 000h, 000h, 000h, 000h
        db      004h, 004h, 004h, 03fh, 000h, 000h, 000h, 000h, 000h, 004h, 004h, 03fh, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 01ch, 004h, 004h, 004h, 000h, 000h, 000h, 000h, 007h, 004h, 004h, 004h, 000h
        db      018h, 01ch, 01eh, 01fh, 01eh, 01ch, 018h, 000h, 003h, 007h, 00fh, 01fh, 00fh, 007h, 003h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 004h, 004h, 004h, 004h, 004h, 000h, 004h, 000h
        db      00ah, 00ah, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 00ah, 01fh, 00ah, 01fh, 00ah, 00ah, 000h
        db      004h, 01eh, 005h, 00eh, 014h, 00fh, 004h, 000h, 003h, 013h, 008h, 004h, 002h, 019h, 018h, 000h
        db      006h, 009h, 005h, 002h, 015h, 009h, 016h, 000h, 006h, 004h, 002h, 000h, 000h, 000h, 000h, 000h
        db      008h, 004h, 002h, 002h, 002h, 004h, 008h, 000h, 002h, 004h, 008h, 008h, 008h, 004h, 002h, 000h
        db      000h, 004h, 015h, 00eh, 015h, 004h, 000h, 000h, 000h, 004h, 004h, 01fh, 004h, 004h, 000h, 000h
        db      000h, 000h, 000h, 000h, 006h, 004h, 002h, 000h, 000h, 000h, 000h, 01fh, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 006h, 006h, 000h, 000h, 010h, 008h, 004h, 002h, 001h, 000h, 000h
        db      004h, 00ah, 011h, 011h, 011h, 00ah, 004h, 000h, 004h, 006h, 004h, 004h, 004h, 004h, 00eh, 000h
        db      00eh, 011h, 010h, 008h, 004h, 002h, 01fh, 000h, 01fh, 008h, 004h, 008h, 010h, 011h, 00eh, 000h
        db      008h, 00ch, 00ah, 009h, 01fh, 008h, 008h, 000h, 01fh, 001h, 00fh, 010h, 010h, 011h, 00eh, 000h
        db      00ch, 002h, 001h, 00fh, 011h, 011h, 00eh, 000h, 01fh, 011h, 008h, 004h, 002h, 001h, 001h, 000h
        db      00eh, 011h, 011h, 00eh, 011h, 011h, 00eh, 000h, 00eh, 011h, 011h, 01eh, 010h, 008h, 006h, 000h
        db      000h, 006h, 006h, 000h, 006h, 006h, 000h, 000h, 000h, 006h, 006h, 000h, 006h, 004h, 002h, 000h
        db      018h, 00ch, 006h, 003h, 006h, 00ch, 018h, 000h, 000h, 000h, 01fh, 000h, 01fh, 000h, 000h, 000h
        db      003h, 006h, 00ch, 018h, 00ch, 006h, 003h, 000h, 00eh, 011h, 010h, 008h, 004h, 000h, 004h, 000h
        db      00eh, 011h, 010h, 016h, 015h, 015h, 00eh, 000h, 004h, 00ah, 011h, 011h, 01fh, 011h, 011h, 000h
        db      00fh, 011h, 011h, 00fh, 011h, 011h, 00fh, 000h, 00eh, 011h, 001h, 001h, 001h, 011h, 00eh, 000h
        db      007h, 009h, 011h, 011h, 011h, 009h, 007h, 000h, 01fh, 001h, 001h, 00fh, 001h, 001h, 01fh, 000h
        db      01fh, 001h, 001h, 00fh, 001h, 001h, 001h, 000h, 00eh, 011h, 001h, 001h, 019h, 011h, 00eh, 000h
        db      011h, 011h, 011h, 01fh, 011h, 011h, 011h, 000h, 00eh, 004h, 004h, 004h, 004h, 004h, 00eh, 000h
        db      01eh, 008h, 008h, 008h, 008h, 009h, 006h, 000h, 011h, 009h, 005h, 003h, 005h, 009h, 011h, 000h
        db      001h, 001h, 001h, 001h, 001h, 001h, 01fh, 000h, 011h, 01bh, 015h, 015h, 011h, 011h, 011h, 000h
        db      011h, 011h, 013h, 015h, 019h, 011h, 011h, 000h, 00eh, 011h, 011h, 011h, 011h, 011h, 00eh, 000h
        db      00fh, 011h, 011h, 00fh, 001h, 001h, 001h, 000h, 00eh, 011h, 011h, 011h, 015h, 009h, 016h, 000h
        db      00fh, 011h, 011h, 00fh, 005h, 009h, 011h, 000h, 00eh, 011h, 001h, 00eh, 010h, 011h, 00eh, 000h
        db      01fh, 004h, 004h, 004h, 004h, 004h, 004h, 000h, 011h, 011h, 011h, 011h, 011h, 011h, 00eh, 000h
        db      011h, 011h, 011h, 011h, 011h, 00ah, 004h, 000h, 011h, 011h, 011h, 015h, 015h, 015h, 00ah, 000h
        db      011h, 011h, 00ah, 004h, 00ah, 011h, 011h, 000h, 011h, 011h, 00ah, 004h, 004h, 004h, 004h, 000h
        db      01fh, 010h, 008h, 004h, 002h, 001h, 01fh, 000h, 00eh, 002h, 002h, 002h, 002h, 002h, 00eh, 000h
        db      000h, 001h, 002h, 004h, 008h, 010h, 000h, 000h, 00eh, 008h, 008h, 008h, 008h, 008h, 00eh, 000h
        db      004h, 00eh, 01fh, 00eh, 00eh, 00eh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 01fh, 000h
        db      002h, 004h, 008h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00eh, 010h, 01eh, 011h, 01eh, 000h
        db      001h, 001h, 00fh, 011h, 011h, 011h, 00fh, 000h, 000h, 000h, 01eh, 001h, 001h, 001h, 01eh, 000h
        db      010h, 010h, 01eh, 011h, 011h, 011h, 01eh, 000h, 000h, 000h, 00eh, 011h, 01fh, 001h, 00eh, 000h
        db      00ch, 012h, 002h, 007h, 002h, 002h, 002h, 000h, 000h, 000h, 01eh, 011h, 011h, 01eh, 010h, 00eh
        db      001h, 001h, 00fh, 011h, 011h, 011h, 011h, 000h, 004h, 000h, 006h, 004h, 004h, 004h, 00eh, 000h
        db      008h, 000h, 008h, 008h, 008h, 008h, 009h, 006h, 001h, 001h, 009h, 005h, 003h, 005h, 009h, 000h
        db      006h, 004h, 004h, 004h, 004h, 004h, 00eh, 000h, 000h, 000h, 00bh, 015h, 015h, 011h, 011h, 000h
        db      000h, 000h, 00dh, 013h, 011h, 011h, 011h, 000h, 000h, 000h, 00eh, 011h, 011h, 011h, 00eh, 000h
        db      000h, 000h, 00fh, 011h, 011h, 00fh, 001h, 001h, 000h, 000h, 016h, 019h, 019h, 016h, 010h, 010h
        db      000h, 000h, 00dh, 013h, 001h, 001h, 001h, 000h, 000h, 000h, 01eh, 001h, 00eh, 010h, 00fh, 000h
        db      002h, 002h, 007h, 002h, 002h, 012h, 00ch, 000h, 000h, 000h, 011h, 011h, 011h, 011h, 00eh, 000h
        db      000h, 000h, 011h, 011h, 011h, 00ah, 004h, 000h, 000h, 000h, 011h, 011h, 015h, 015h, 00ah, 000h
        db      000h, 000h, 011h, 00ah, 004h, 00ah, 011h, 000h, 000h, 000h, 011h, 011h, 011h, 01eh, 010h, 00eh
        db      000h, 000h, 01fh, 008h, 004h, 002h, 01fh, 000h, 008h, 004h, 004h, 002h, 004h, 004h, 008h, 000h
        db      003h, 003h, 003h, 00fh, 007h, 003h, 001h, 000h, 002h, 004h, 004h, 008h, 004h, 004h, 002h, 000h
        db      000h, 004h, 008h, 01fh, 008h, 004h, 000h, 000h, 000h, 004h, 002h, 01fh, 002h, 004h, 000h, 000h
        db      081h, 083h, 086h, 08ah, 000h, 001h, 041h, 058h, 08ah, 036h, 001h, 053h, 049h, 08ah, 06ch, 001h
        db      043h, 053h, 08ah, 0a8h, 001h
        endif
        if      (XL) || (MODEL = 3200)
        db      "ZCSOAPDIT"
        db      08ah, 000h, 00ah, 042h, 058h, 08ah, 036h, 00ah, 044h, 049h, 08ah, 06ch, 00ah, 044h, 053h, 08ah
        db      000h, 013h, 043h, 058h, 08ah, 036h, 013h, 042h, 050h, 08ah, 06ch, 013h, 045h, 053h, 08ah, 0a8h
        db      013h
        db      "BRK@"
        db      08ah, 000h, 01ch, 044h, 058h, 08ah, 036h, 01ch, 053h, 050h, 08ah, 06ch, 01ch, 053h, 053h, 08ah
        db      0b4h, 01ch, 049h, 050h, 08ah, 019h, 02eh, 03ah, 08ah, 003h
        db      "8 GO  LINE STEP      Bcyc BPon Boff ADDR"
        db      08fh, 0e0h, 08fh, 0e1h, 08fh, 0e2h, 08fh, 0e3h, 08fh, 0e4h, 08fh, 0e5h, 08fh, 0e6h, 08fh, 0e7h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      082h, 0ffh, 000h, 0b0h, 092h, 0aah, 06dh, 004h, 012h, 001h, 000h, 0b2h, 092h, 0aah, 06dh, 004h
        db      012h, 00ah, 000h, 0b4h, 092h, 0aah, 06dh, 004h, 012h, 013h, 000h, 0b6h, 092h, 0aah, 06dh, 004h
        db      012h, 01ch, 000h, 0b8h, 092h, 0aah, 06dh, 004h, 048h, 001h, 000h, 0bah, 092h, 0aah, 06dh, 004h
        db      048h, 00ah, 000h, 0bch, 092h, 0aah, 06dh, 004h, 048h, 013h, 000h, 0beh, 092h, 0aah, 06dh, 004h
        db      048h, 01ch, 000h, 0c0h, 092h, 0aah, 06dh, 004h, 07eh, 001h, 003h, 0c2h, 092h, 0aah, 06dh, 004h
        db      07eh, 00ah, 001h, 0c4h, 092h, 0aah, 06dh, 004h, 07eh, 013h, 001h, 0c6h, 092h, 0aah, 06dh, 004h
        db      07eh, 01ch, 001h, 006h, 000h, 008h, 06eh, 001h, 0a8h, 00ah, 000h, 000h, 000h, 008h, 06eh, 001h
        db      0aeh, 00ah, 000h, 007h, 000h, 008h, 06eh, 001h, 0b4h, 00ah, 000h, 00bh, 000h, 008h, 06eh, 001h
        db      0bah, 00ah, 000h, 004h, 000h, 008h, 06eh, 001h, 0c0h, 00ah, 000h, 002h, 000h, 008h, 06eh, 001h
        db      0c6h, 00ah, 000h, 00ah, 000h, 008h, 06eh, 001h, 0cch, 00ah, 000h, 009h, 000h, 008h, 06eh, 001h
        db      0d2h, 00ah, 000h, 008h, 000h, 008h, 06eh, 001h, 0d8h, 00ah, 000h, 0cch, 092h, 0aah, 06dh, 004h
        db      0c6h, 013h, 010h, 0cah, 092h, 0aah, 06dh, 004h, 0c6h, 01ch, 006h, 0ceh, 092h, 0aah, 06dh, 004h
        db      001h, 02eh, 000h, 0d0h, 092h, 0aah, 06dh, 004h, 01fh, 02eh, 000h, 000h, 000h, 03ah, 06eh, 002h
        db      042h, 02eh, 008h, 001h, 000h, 03ah, 06eh, 002h, 054h, 02eh, 008h, 002h, 000h, 03ah, 06eh, 002h
        db      066h, 02eh, 008h, 003h, 000h, 03ah, 06eh, 002h, 078h, 02eh, 008h, 004h, 000h, 03ah, 06eh, 002h
        db      08ah, 02eh, 008h, 005h, 000h, 03ah, 06eh, 002h, 09ch, 02eh, 008h, 006h, 000h, 03ah, 06eh, 002h
        db      0aeh, 02eh, 008h, 007h, 000h, 03ah, 06eh, 002h, 0c0h, 02eh, 008h, 008h, 000h, 03ah, 06eh, 002h
        db      0d2h, 02eh, 008h, 009h, 000h, 03ah, 06eh, 002h, 0e4h, 02eh, 008h, 006h, 02eh, 003h
        elseif  (XL) && (MODEL = 3200)
        db      082h, 0ffh, 000h, 0b0h, 092h, 0fah, 06dh, 004h, 012h, 001h, 000h, 0b2h, 092h, 0fah, 06dh, 004h
        db      012h, 00ah, 000h, 0b4h, 092h, 0fah, 06dh, 004h, 012h, 013h, 000h, 0b6h, 092h, 0fah, 06dh, 004h
        db      012h, 01ch, 000h, 0b8h, 092h, 0fah, 06dh, 004h, 048h, 001h, 000h, 0bah, 092h, 0fah, 06dh, 004h
        db      048h, 00ah, 000h, 0bch, 092h, 0fah, 06dh, 004h, 048h, 013h, 000h, 0beh, 092h, 0fah, 06dh, 004h
        db      048h, 01ch, 000h, 0c0h, 092h, 0fah, 06dh, 004h, 07eh, 001h, 003h, 0c2h, 092h, 0fah, 06dh, 004h
        db      07eh, 00ah, 001h, 0c4h, 092h, 0fah, 06dh, 004h, 07eh, 013h, 001h, 0c6h, 092h, 0fah, 06dh, 004h
        db      07eh, 01ch, 001h, 006h, 000h, 058h, 06eh, 001h, 0a8h, 00ah, 000h, 000h, 000h, 058h, 06eh, 001h
        db      0aeh, 00ah, 000h, 007h, 000h, 058h, 06eh, 001h, 0b4h, 00ah, 000h, 00bh, 000h, 058h, 06eh, 001h
        db      0bah, 00ah, 000h, 004h, 000h, 058h, 06eh, 001h, 0c0h, 00ah, 000h, 002h, 000h, 058h, 06eh, 001h
        db      0c6h, 00ah, 000h, 00ah, 000h, 058h, 06eh, 001h, 0cch, 00ah, 000h, 009h, 000h, 058h, 06eh, 001h
        db      0d2h, 00ah, 000h, 008h, 000h, 058h, 06eh, 001h, 0d8h, 00ah, 000h, 0cch, 092h, 0fah, 06dh, 004h
        db      0c6h, 013h, 010h, 0cah, 092h, 0fah, 06dh, 004h, 0c6h, 01ch, 006h, 0ceh, 092h, 0fah, 06dh, 004h
        db      001h, 02eh, 000h, 0d0h, 092h, 0fah, 06dh, 004h, 01fh, 02eh, 000h, 000h, 000h, 08ah, 06eh, 002h
        db      042h, 02eh, 008h, 001h, 000h, 08ah, 06eh, 002h, 054h, 02eh, 008h, 002h, 000h, 08ah, 06eh, 002h
        db      066h, 02eh, 008h, 003h, 000h, 08ah, 06eh, 002h, 078h, 02eh, 008h, 004h, 000h, 08ah, 06eh, 002h
        db      08ah, 02eh, 008h, 005h, 000h, 08ah, 06eh, 002h, 09ch, 02eh, 008h, 006h, 000h, 08ah, 06eh, 002h
        db      0aeh, 02eh, 008h, 007h, 000h, 08ah, 06eh, 002h, 0c0h, 02eh, 008h, 008h, 000h, 08ah, 06eh, 002h
        db      0d2h, 02eh, 008h, 009h, 000h, 08ah, 06eh, 002h, 0e4h, 02eh, 008h, 006h, 02eh, 003h
        elseif  (XL) && (FW_VERSION < 150)
        db      082h, 0ffh, 000h, 090h, 092h, 01ah, 06dh, 004h, 012h, 001h, 000h, 092h, 092h, 01ah, 06dh, 004h
        db      012h, 00ah, 000h, 094h, 092h, 01ah, 06dh, 004h, 012h, 013h, 000h, 096h, 092h, 01ah, 06dh, 004h
        db      012h, 01ch, 000h, 098h, 092h, 01ah, 06dh, 004h, 048h, 001h, 000h, 09ah, 092h, 01ah, 06dh, 004h
        db      048h, 00ah, 000h, 09ch, 092h, 01ah, 06dh, 004h, 048h, 013h, 000h, 09eh, 092h, 01ah, 06dh, 004h
        db      048h, 01ch, 000h, 0a0h, 092h, 01ah, 06dh, 004h, 07eh, 001h, 003h, 0a2h, 092h, 01ah, 06dh, 004h
        db      07eh, 00ah, 001h, 0a4h, 092h, 01ah, 06dh, 004h, 07eh, 013h, 001h, 0a6h, 092h, 01ah, 06dh, 004h
        db      07eh, 01ch, 001h, 006h, 000h, 078h, 06dh, 001h, 0a8h, 00ah, 000h, 000h, 000h, 078h, 06dh, 001h
        db      0aeh, 00ah, 000h, 007h, 000h, 078h, 06dh, 001h, 0b4h, 00ah, 000h, 00bh, 000h, 078h, 06dh, 001h
        db      0bah, 00ah, 000h, 004h, 000h, 078h, 06dh, 001h, 0c0h, 00ah, 000h, 002h, 000h, 078h, 06dh, 001h
        db      0c6h, 00ah, 000h, 00ah, 000h, 078h, 06dh, 001h, 0cch, 00ah, 000h, 009h, 000h, 078h, 06dh, 001h
        db      0d2h, 00ah, 000h, 008h, 000h, 078h, 06dh, 001h, 0d8h, 00ah, 000h, 0ach, 092h, 01ah, 06dh, 004h
        db      0c6h, 013h, 010h, 0aah, 092h, 01ah, 06dh, 004h, 0c6h, 01ch, 006h, 0aeh, 092h, 01ah, 06dh, 004h
        db      001h, 02eh, 000h, 0b0h, 092h, 01ah, 06dh, 004h, 01fh, 02eh, 000h, 000h, 000h, 0aah, 06dh, 002h
        db      042h, 02eh, 008h, 001h, 000h, 0aah, 06dh, 002h, 054h, 02eh, 008h, 002h, 000h, 0aah, 06dh, 002h
        db      066h, 02eh, 008h, 003h, 000h, 0aah, 06dh, 002h, 078h, 02eh, 008h, 004h, 000h, 0aah, 06dh, 002h
        db      08ah, 02eh, 008h, 005h, 000h, 0aah, 06dh, 002h, 09ch, 02eh, 008h, 006h, 000h, 0aah, 06dh, 002h
        db      0aeh, 02eh, 008h, 007h, 000h, 0aah, 06dh, 002h, 0c0h, 02eh, 008h, 008h, 000h, 0aah, 06dh, 002h
        db      0d2h, 02eh, 008h, 009h, 000h, 0aah, 06dh, 002h, 0e4h, 02eh, 008h, 006h, 02eh, 003h
        elseif  (XL = 0) && (MODEL = 3200)
        db      082h, 0ffh, 000h, 050h, 0a8h, 09ah, 04dh, 004h, 012h, 001h, 000h, 052h, 0a8h, 09ah, 04dh, 004h
        db      012h, 00ah, 000h, 054h, 0a8h, 09ah, 04dh, 004h, 012h, 013h, 000h, 056h, 0a8h, 09ah, 04dh, 004h
        db      012h, 01ch, 000h, 058h, 0a8h, 09ah, 04dh, 004h, 048h, 001h, 000h, 05ah, 0a8h, 09ah, 04dh, 004h
        db      048h, 00ah, 000h, 05ch, 0a8h, 09ah, 04dh, 004h, 048h, 013h, 000h, 05eh, 0a8h, 09ah, 04dh, 004h
        db      048h, 01ch, 000h, 060h, 0a8h, 09ah, 04dh, 004h, 07eh, 001h, 003h, 062h, 0a8h, 09ah, 04dh, 004h
        db      07eh, 00ah, 001h, 064h, 0a8h, 09ah, 04dh, 004h, 07eh, 013h, 001h, 066h, 0a8h, 09ah, 04dh, 004h
        db      07eh, 01ch, 001h, 006h, 000h, 0f8h, 04dh, 001h, 0a8h, 00ah, 000h, 000h, 000h, 0f8h, 04dh, 001h
        db      0aeh, 00ah, 000h, 007h, 000h, 0f8h, 04dh, 001h, 0b4h, 00ah, 000h, 00bh, 000h, 0f8h, 04dh, 001h
        db      0bah, 00ah, 000h, 004h, 000h, 0f8h, 04dh, 001h, 0c0h, 00ah, 000h, 002h, 000h, 0f8h, 04dh, 001h
        db      0c6h, 00ah, 000h, 00ah, 000h, 0f8h, 04dh, 001h, 0cch, 00ah, 000h, 009h, 000h, 0f8h, 04dh, 001h
        db      0d2h, 00ah, 000h, 008h, 000h, 0f8h, 04dh, 001h, 0d8h, 00ah, 000h, 06ch, 0a8h, 09ah, 04dh, 004h
        db      0c6h, 013h, 010h, 06ah, 0a8h, 09ah, 04dh, 004h, 0c6h, 01ch, 006h, 06eh, 0a8h, 09ah, 04dh, 004h
        db      001h, 02eh, 000h, 070h, 0a8h, 09ah, 04dh, 004h, 01fh, 02eh, 000h, 000h, 000h, 02ah, 04eh, 002h
        db      042h, 02eh, 008h, 001h, 000h, 02ah, 04eh, 002h, 054h, 02eh, 008h, 002h, 000h, 02ah, 04eh, 002h
        db      066h, 02eh, 008h, 003h, 000h, 02ah, 04eh, 002h, 078h, 02eh, 008h, 004h, 000h, 02ah, 04eh, 002h
        db      08ah, 02eh, 008h, 005h, 000h, 02ah, 04eh, 002h, 09ch, 02eh, 008h, 006h, 000h, 02ah, 04eh, 002h
        db      0aeh, 02eh, 008h, 007h, 000h, 02ah, 04eh, 002h, 0c0h, 02eh, 008h, 008h, 000h, 02ah, 04eh, 002h
        db      0d2h, 02eh, 008h, 009h, 000h, 02ah, 04eh, 002h, 0e4h, 02eh, 008h, 006h, 02eh, 003h
        endif
        if      (XL) || (MODEL = 3200)
        db      "CS:6"
        db      003h, 053h, 053h, 03ah, 03eh, 003h, 044h, 053h, 03ah, 026h, 003h, 045h, 053h, 03ah, 0f2h, 007h
        db      "REPNZ  "
        db      0f3h, 006h
        db      "REPZ  "
        db      022h, 060h, 005h
        db      "PUSHAa"
        db      004h
        db      "POPA"
        db      0d7h, 004h
        db      "XLAT"
        db      09fh, 004h
        db      "LAHF"
        db      09eh, 004h
        db      "SAHF"
        db      09ch, 005h
        db      "PUSHF"
        db      09dh, 004h
        db      "POPF7"
        db      003h
        db      "AAA'"
        db      003h
        db      "DAA?"
        db      003h
        db      "AAS/"
        db      003h, 044h, 041h, 053h, 098h, 003h, 043h, 042h, 057h, 099h, 003h, 043h, 057h, 044h, 0c3h, 003h
        db      052h, 045h, 054h, 0cbh, 007h
        db      "RET FAR"
        db      0c9h, 005h
        db      "LEAVE"
        db      0cch, 005h
        db      "INT 3"
        db      0ceh, 004h
        db      "INTO"
        db      0cfh, 004h
        db      "IRET"
        db      0f8h, 003h, 043h, 04ch, 043h, 0f5h, 003h, 043h, 04dh, 043h, 0f9h, 003h, 053h, 054h, 043h, 0fch
        db      003h, 043h, 04ch, 044h, 0fdh, 003h, 053h, 054h, 044h, 0fah, 003h, 043h, 04ch, 049h, 0fbh, 003h
        db      053h, 054h, 049h, 0f4h, 003h, 048h, 04ch, 054h, 09bh, 004h
        db      "WAIT"
        db      0f0h, 004h
        db      "LOCK"
        db      090h, 003h, 04eh, 04fh, 050h, 0ech, 008h
        db      "IN AL,DX"
        db      0edh, 008h
        db      "IN AX,DX"
        db      0eeh, 009h
        db      "OUT DX,AL"
        db      0efh, 009h
        db      "OUT DX,AX"
        db      015h, 0ebh, 009h
        db      "JMP SHORTt"
        db      002h, 04ah, 05ah, 07ch, 002h, 04ah, 04ch, 07eh, 003h
        db      "JNGr"
        db      002h, 04ah, 042h, 076h, 003h
        db      "JNAz"
        db      003h
        db      "JPEp"
        db      002h, 04ah, 04fh, 078h, 002h, 04ah, 053h, 075h, 003h
        db      "JNZ}"
        db      003h, 04ah, 04eh, 04ch, 07fh, 002h, 04ah, 047h, 073h, 003h
        db      "JNBw"
        db      002h, 04ah, 041h, 07bh, 003h
        db      "JPOq"
        db      003h
        db      "JNOy"
        db      003h, 04ah, 04eh, 053h, 0e2h, 004h
        db      "LOOP"
        db      0e1h, 005h
        db      "LOOPZ"
        db      0e0h, 006h
        db      "LOOPNZ"
        db      0e3h, 004h
        db      "JCXZ"
        db      006h, 0a4h, 004h
        db      "MOVS"
        db      0a6h, 004h
        db      "SCAS"
        db      0ach, 004h
        db      "LODS"
        db      0aah, 004h
        db      "STOSl"
        db      003h
        db      "INSn"
        db      004h
        db      "OUTS"
        db      018h, 08dh, 004h
        db      "LEA "
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      093h, 072h, 0c5h, 004h
        elseif  (XL) && (MODEL = 3200)
        db      0e3h, 072h, 0c5h, 004h
        elseif  (XL) && (FW_VERSION < 150)
        db      003h, 072h, 0c5h, 004h
        elseif  (XL = 0) && (MODEL = 3200)
        db      084h, 052h, 0c5h, 004h
        endif
        if      (XL) || (MODEL = 3200)
        db      "LDS "
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      093h, 072h, 0c4h, 004h
        elseif  (XL) && (MODEL = 3200)
        db      0e3h, 072h, 0c4h, 004h
        elseif  (XL) && (FW_VERSION < 150)
        db      003h, 072h, 0c4h, 004h
        elseif  (XL = 0) && (MODEL = 3200)
        db      084h, 052h, 0c4h, 004h
        endif
        if      (XL) || (MODEL = 3200)
        db      "LES "
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      093h, 072h, 0e8h, 005h
        elseif  (XL = 0) && (MODEL = 3200)
        db      084h, 052h, 0e8h, 005h
        endif
        if      ((XL = 0) && (MODEL = 3200)) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        db      "CALL "
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0e7h, 071h, 09ah, 009h
        db      "CALL FAR Mr"
        elseif  (XL = 0) && (MODEL = 3200)
        db      0d8h, 051h, 09ah, 009h
        db      "CALL FAR >R"
        endif
        if      ((XL = 0) && (MODEL = 3200)) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        db      0e9h, 004h
        db      "JMP "
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0e7h, 071h, 0eah, 008h
        db      "JMP FAR Mr"
        elseif  (XL = 0) && (MODEL = 3200)
        db      0d8h, 051h, 0eah, 008h
        db      "JMP FAR >R"
        endif
        if      ((XL = 0) && (MODEL = 3200)) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        db      0c2h, 004h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      "RET 8r"
        elseif  (XL = 0) && (MODEL = 3200)
        db      "RET )R"
        endif
        if      ((XL = 0) && (MODEL = 3200)) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        db      0cah, 008h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      "RET FAR 8r"
        elseif  (XL = 0) && (MODEL = 3200)
        db      "RET FAR )R"
        endif
        if      ((XL = 0) && (MODEL = 3200)) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        db      0c8h, 006h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      "ENTER pr"
        elseif  (XL = 0) && (MODEL = 3200)
        db      "ENTER aR"
        endif
        if      ((XL = 0) && (MODEL = 3200)) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        db      0cdh, 004h
        db      "INT "
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      003h, 072h, 062h, 006h
        elseif  (XL) && (MODEL = 3200)
        db      0e3h, 072h, 0e8h, 005h
        db      "CALL 7r"
        elseif  (XL) && (FW_VERSION < 150)
        db      003h, 072h, 0e8h, 005h
        db      "CALL Wq"
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 150))
        db      09ah, 009h
        db      "CALL FAR "
        endif
        if      (XL) && (MODEL = 3200)
        db      09dh, 072h, 0e9h, 004h
        db      "JMP 7r"
        elseif  (XL) && (FW_VERSION < 150)
        db      0bdh, 071h, 0e9h, 004h
        db      "JMP Wq"
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 150))
        db      0eah, 008h
        db      "JMP FAR "
        endif
        if      (XL) && (MODEL = 3200)
        db      09dh, 072h, 0c2h, 004h
        elseif  (XL) && (FW_VERSION < 150)
        db      0bdh, 071h, 0c2h, 004h
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 150))
        db      "RET "
        endif
        if      (XL) && (MODEL = 3200)
        db      088h, 072h, 0cah, 008h
        elseif  (XL) && (FW_VERSION < 150)
        db      0a8h, 071h, 0cah, 008h
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 150))
        db      "RET FAR "
        endif
        if      (XL) && (MODEL = 3200)
        db      088h, 072h, 0c8h, 006h
        elseif  (XL) && (FW_VERSION < 150)
        db      0a8h, 071h, 0c8h, 006h
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 150))
        db      "ENTER "
        endif
        if      (XL) && (MODEL = 3200)
        db      0c0h, 072h, 0cdh, 004h
        db      "INT Srb"
        elseif  (XL) && (FW_VERSION < 150)
        db      0e0h, 071h, 0cdh, 004h
        db      "INT sqb"
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 150))
        db      006h
        elseif  (XL = 0) && (MODEL = 3200)
        db      0f4h, 051h, 062h, 006h
        endif
        if      (XL) || (MODEL = 3200)
        db      "BOUND "
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      093h, 072h, 08eh, 004h
        elseif  (XL) && (MODEL = 3200)
        db      0e3h, 072h, 08eh, 004h
        elseif  (XL = 0) && (MODEL = 3200)
        db      084h, 052h, 08eh, 004h
        endif
        if      (MODEL = 3200) || ((XL) && (FW_VERSION >= 150))
        db      "MOV "
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0c4h, 072h, 08ch, 004h
        elseif  (XL = 0) && (MODEL = 3200)
        db      0b5h, 052h, 08ch, 004h
        endif
        if      ((XL = 0) && (MODEL = 3200)) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        db      "MOV "
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      0d7h, 072h, 068h, 006h
        db      "PUSHI 8rj"
        elseif  (XL) && (MODEL = 3200)
        db      014h, 073h, 08ch, 004h
        db      "MOV 'sh"
        elseif  (XL) && (FW_VERSION < 150)
        db      003h, 072h, 08eh, 004h
        db      "MOV 4r"
        db      08ch, 004h
        db      "MOV Grh"
        elseif  (XL = 0) && (MODEL = 3200)
        db      0c8h, 052h, 068h, 006h
        db      "PUSHI )Rj"
        endif
        if      (XL) || (MODEL = 3200)
        db      006h
        db      "PUSHI "
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      003h, 072h, 0e4h, 006h
        elseif  (XL = 0) && (MODEL = 3200)
        db      0f4h, 051h, 0e4h, 006h
        endif
        if      ((XL = 0) && (MODEL = 3200)) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        db      "IN AL,"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      003h, 072h, 0e5h, 006h
        elseif  (XL = 0) && (MODEL = 3200)
        db      0f4h, 051h, 0e5h, 006h
        endif
        if      ((XL = 0) && (MODEL = 3200)) || ((XL) && (MODEL = 3000) && (FW_VERSION >= 150))
        db      "IN AX,"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      003h, 072h, 0e6h, 00ch
        elseif  (XL) && (MODEL = 3200)
        db      088h, 072h, 06ah, 006h
        db      "PUSHI Sr"
        elseif  (XL) && (FW_VERSION < 150)
        db      0a8h, 071h, 06ah, 006h
        db      "PUSHI sq"
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 150))
        db      0e4h, 006h
        endif
        if      (XL) && (MODEL = 3200)
        db      "IN AL,Sr"
        elseif  (XL) && (FW_VERSION < 150)
        db      "IN AL,sq"
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 150))
        db      0e5h, 006h
        endif
        if      (XL) && (MODEL = 3200)
        db      "IN AX,Sr"
        elseif  (XL) && (FW_VERSION < 150)
        db      "IN AX,sq"
        endif
        if      ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 150))
        db      0e6h, 00ch
        elseif  (XL = 0) && (MODEL = 3200)
        db      0f4h, 051h, 0e6h, 00ch
        endif
        if      (XL) || (MODEL = 3200)
        db      "OUT   ,AL"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      08bh, 0e2h, 000h, 003h, 072h, 0e7h, 00ch
        elseif  (XL) && (MODEL = 3200)
        db      08bh, 0e2h, 000h, 053h, 072h, 0e7h, 00ch
        elseif  (XL) && (FW_VERSION < 150)
        db      08bh, 0e2h, 000h, 073h, 071h, 0e7h, 00ch
        elseif  (XL = 0) && (MODEL = 3200)
        db      08bh, 0e2h, 000h, 0f4h, 051h, 0e7h, 00ch
        endif
        if      (XL) || (MODEL = 3200)
        db      "OUT   ,AX"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      08bh, 0e2h, 000h, 003h, 072h, 0a0h, 007h
        db      "MOV AL,+r"
        elseif  (XL) && (MODEL = 3200)
        db      08bh, 0e2h, 000h, 053h, 072h, 0a0h, 007h
        db      "MOV AL,{r"
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      0a1h, 007h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      "MOV AX,+r"
        elseif  (XL) && (MODEL = 3200)
        db      "MOV AX,{r"
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      0a2h, 010h
        elseif  (XL) && (FW_VERSION < 150)
        db      08bh, 0e2h, 000h, 073h, 071h, 0a0h, 007h
        elseif  (XL = 0) && (MODEL = 3200)
        db      08bh, 0e2h, 000h, 0f4h, 051h, 0a0h, 007h
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL = 0) && (MODEL = 3200))
        db      "MOV AL,"
        endif
        if      (XL) && (FW_VERSION < 150)
        db      09bh, 071h, 0a1h, 007h
        elseif  (XL = 0) && (MODEL = 3200)
        db      01ch, 052h, 0a1h, 007h
        endif
        if      ((XL) && (FW_VERSION < 150)) || ((XL = 0) && (MODEL = 3200))
        db      "MOV AX,"
        endif
        if      (XL) && (FW_VERSION < 150)
        db      09bh, 071h, 0a2h, 010h
        elseif  (XL = 0) && (MODEL = 3200)
        db      01ch, 052h, 0a2h, 010h
        endif
        if      (XL) || (MODEL = 3200)
        db      "MOV [    ],AL"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      08bh, 0d0h, 000h, 038h, 072h, 0a3h, 010h
        elseif  (XL) && (MODEL = 3200)
        db      08bh, 0d0h, 000h, 088h, 072h, 0a3h, 010h
        elseif  (XL) && (FW_VERSION < 150)
        db      08bh, 0d0h, 000h, 0a8h, 071h, 0a3h, 010h
        elseif  (XL = 0) && (MODEL = 3200)
        db      08bh, 0d0h, 000h, 029h, 052h, 0a3h, 010h
        endif
        if      (XL) || (MODEL = 3200)
        db      "MOV [    ],AX"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      08bh, 0d0h, 000h, 038h, 072h, 006h, 0ffh, 030h, 004h
        elseif  (XL) && (MODEL = 3200)
        db      08bh, 0d0h, 000h, 088h, 072h, 006h, 0ffh, 030h, 004h
        elseif  (XL) && (FW_VERSION < 150)
        db      08bh, 0d0h, 000h, 0a8h, 071h, 006h, 0ffh, 030h, 004h
        elseif  (XL = 0) && (MODEL = 3200)
        db      08bh, 0d0h, 000h, 029h, 052h, 006h, 0ffh, 030h, 004h
        endif
        if      (XL) || (MODEL = 3200)
        db      "PUSH"
        db      08fh, 000h, 003h, 050h, 04fh, 050h, 0ffh, 010h, 004h
        db      "CALL"
        db      0ffh, 018h, 008h
        db      "CALL FAR"
        db      0ffh, 020h, 003h, 04ah, 04dh, 050h, 0ffh, 028h, 007h
        db      "JMP FAR"
        db      005h, 050h, 005h
        db      "PUSH X"
        db      004h
        db      "POP "
        db      090h, 008h
        db      "XCHG AX,@"
        db      004h
        db      "INC H"
        db      004h
        db      "DEC "
        db      003h, 041h, 041h, 04dh, 003h, 041h, 041h, 044h, 003h, 04dh, 04fh, 056h, 003h, 044h, 042h, 020h
        db      002h, 006h, 004h
        db      "PUSH"
        db      007h, 003h, 050h, 04fh, 050h, 009h, 088h, 003h, 04dh, 04fh, 056h, 000h, 003h, 041h, 044h, 044h
        db      010h, 003h
        db      "ADC("
        db      003h, 053h, 055h, 042h, 018h, 003h
        db      "SBB8"
        db      003h
        db      "CMP "
        db      003h, 041h, 04eh, 044h, 008h, 002h, 04fh, 052h, 030h, 003h, 058h, 04fh, 052h, 009h, 004h, 003h
        db      041h, 044h, 044h, 0a8h, 004h
        db      "TEST"
        db      014h, 003h
        db      "ADC,"
        db      003h, 053h, 055h, 042h, 01ch, 003h
        db      "SBB<"
        db      003h
        db      "CMP$"
        db      003h, 041h, 04eh, 044h, 00ch, 002h, 04fh, 052h, 034h, 003h, 058h, 04fh, 052h, 002h, 086h, 004h
        db      "XCHG"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      09ah, 072h, 084h, 004h
        elseif  (XL) && (MODEL = 3200)
        db      0eah, 072h, 084h, 004h
        elseif  (XL) && (FW_VERSION < 150)
        db      00ah, 072h, 084h, 004h
        elseif  (XL = 0) && (MODEL = 3200)
        db      08bh, 052h, 084h, 004h
        endif
        if      (XL) || (MODEL = 3200)
        db      "TEST"
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      09ah, 072h, 008h, 0feh, 000h, 003h, 049h, 04eh, 043h, 0feh, 008h, 003h, 044h, 045h, 043h, 0f6h
        elseif  (XL) && (MODEL = 3200)
        db      0eah, 072h, 008h, 0feh, 000h, 003h, 049h, 04eh, 043h, 0feh, 008h, 003h, 044h, 045h, 043h, 0f6h
        elseif  (XL) && (FW_VERSION < 150)
        db      00ah, 072h, 008h, 0feh, 000h, 003h, 049h, 04eh, 043h, 0feh, 008h, 003h, 044h, 045h, 043h, 0f6h
        elseif  (XL = 0) && (MODEL = 3200)
        db      08bh, 052h, 008h, 0feh, 000h, 003h, 049h, 04eh, 043h, 0feh, 008h, 003h, 044h, 045h, 043h, 0f6h
        endif
        if      (XL) || (MODEL = 3200)
        db      018h, 003h, 04eh, 045h, 047h, 0f6h, 020h, 003h, 04dh, 055h, 04ch, 0f6h, 028h, 004h
        db      "IMUL"
        db      0f6h, 030h, 003h, 044h, 049h, 056h, 0f6h, 038h, 004h
        db      "IDIV"
        db      0f6h, 010h, 003h, 04eh, 04fh, 054h, 005h, 0c6h, 000h, 003h, 04dh, 04fh, 056h, 080h, 020h, 003h
        db      041h, 04eh, 044h, 0f6h, 000h, 004h
        db      "TEST"
        db      080h, 008h, 002h, 04fh, 052h, 080h, 030h, 003h, 058h, 04fh, 052h, 005h, 080h, 000h, 003h, 041h
        db      044h, 044h, 080h, 010h, 003h, 041h, 044h, 043h, 080h, 028h, 003h, 053h, 055h, 042h, 080h, 018h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 150)
        db      003h, 053h, 042h, 042h, 080h, 038h, 003h, 043h, 04dh, 050h, 003h, 0d0h, 002h, 085h, 070h, 0d2h
        db      002h, 089h, 070h, 0c0h, 002h, 096h
        elseif  (XL) && (MODEL = 3200)
        db      003h, 053h, 042h, 042h, 080h, 038h, 003h, 043h, 04dh, 050h, 003h, 0d0h, 002h, 0d5h, 070h, 0d2h
        db      002h, 0d9h, 070h, 0c0h, 002h, 0e6h
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      "pROLRORRCLRCRSHLSHR???SARAXCXDXBXSPBPSIDIALCLDLBLAHCHDHBHESCSSSDS#***1*8*?*C*G*K*"
        elseif  (XL) && (FW_VERSION < 150)
        db      003h, 053h, 042h, 042h, 080h, 038h, 003h, 043h, 04dh, 050h, 003h, 0d0h, 002h, 0f5h, 06fh, 0d2h
        db      002h, 0f9h, 06fh, 0c0h, 002h, 006h
        db      "pROLRORRCLRCRSHLSHR???SARAXCXDXBXSPBPSIDIALCLDLBLAHCHDHBHESCSSSDS"
        db      003h, 02ah, 00ah, 02ah, 011h, 02ah, 018h, 02ah, 01fh, 02ah, 023h, 02ah, 027h, 02ah, 02bh, 02ah
        elseif  (XL = 0) && (MODEL = 3200)
        db      003h, 053h, 042h, 042h, 080h, 038h, 003h, 043h, 04dh, 050h, 003h, 0d0h, 002h, 076h, 050h, 0d2h
        db      002h, 07ah, 050h, 0c0h, 002h, 087h
        db      "PROLRORRCLRCRSHLSHR???SARAXCXDXBXSPBPSIDIALCLDLBLAHCHDHBHESCSSSDS#M*M1M8M?MCMGMKM"
        endif
        if      (XL) || (MODEL = 3200)
        db      006h
        db      "[BX+SI"
        db      006h
        db      "[BX+DI"
        db      006h
        db      "[BP+SI"
        db      006h
        db      "[BP+DI"
        db      003h, 05bh, 053h, 049h, 003h, 05bh, 044h, 049h, 003h, 05bh, 042h, 050h, 003h, 05bh, 042h, 058h
        endif
        if      XL
        db      000h, 02eh, 000h, 034h, 000h, 03ah, 000h, 042h, 000h, 04ah, 000h, 053h, 000h, 05dh, 000h, 068h
        db      000h, 075h, 000h, 084h, 000h, 094h, 000h, 0a6h, 000h, 0bah, 000h, 0d1h, 000h, 0eah, 000h, 007h
        db      001h, 027h, 001h, 04bh, 001h, 074h, 001h, 0a1h, 001h, 0d4h, 001h, 00dh, 002h, 04dh, 002h, 095h
        db      002h, 0e6h, 002h, 041h, 003h, 0a6h, 003h, 018h, 004h, 098h, 004h, 028h, 005h, 0c9h, 005h, 07eh
        db      006h, 049h, 007h, 02ch, 008h, 02bh, 009h, 049h, 00ah, 08bh, 00bh, 0f3h, 00ch, 087h, 00eh, 04bh
        db      010h, 047h, 012h, 081h, 014h, 0ffh, 016h, 0c9h, 019h, 0eah, 01ch
        db      "j U$"
        db      0b4h, 028h, 0a0h, 02dh, 00eh, 033h, 026h, 039h, 0e8h, 03fh, 072h, 047h, 0c4h, 04fh, 0f2h, 058h
        endif
        if      (XL) && (FW_VERSION >= 150)
        db      006h, 063h, 014h, 06eh, 012h, 07ah, 0ffh, 07fh, 0ffh, 07fh, 0ffh, 07fh, 0ffh, 07fh, 0ffh, 07fh
        db      0ffh, 07fh, 0ffh, 07fh, 0ffh, 07fh, 02eh, 000h, 034h, 000h, 03ah, 000h, 041h, 000h, 049h, 000h
        elseif  (XL) && (FW_VERSION < 150)
        db      006h, 063h, 014h, 06eh, 012h, 07ah, 00ah, 087h, 0fch, 094h, 0c0h, 0a3h, 056h, 0b3h, 082h, 0c3h
        db      026h, 0d4h, 010h, 0e5h, 0fah, 0f5h, 02eh, 000h, 034h, 000h, 03ah, 000h, 041h, 000h, 049h, 000h
        endif
        if      XL
        db      053h, 000h, 05dh, 000h, 068h, 000h, 075h, 000h, 083h, 000h, 093h, 000h, 0a5h, 000h, 0b9h, 000h
        db      0d0h, 000h, 0e9h, 000h, 006h, 001h, 026h, 001h, 04ah, 001h, 072h, 001h, 0a0h, 001h, 0d2h, 001h
        db      00bh, 002h, 04bh, 002h, 093h, 002h, 0e3h, 002h, 03dh, 003h, 0a2h, 003h, 014h, 004h, 093h, 004h
        db      022h, 005h, 0c2h, 005h, 075h, 006h, 03eh, 007h, 01fh, 008h, 01ah, 009h, 034h, 00ah, 070h, 00bh
        db      0d0h, 00ch, 059h, 00eh, 00fh, 010h, 0f7h, 011h, 015h, 014h, 06dh, 016h, 004h, 019h, 0deh, 01bh
        db      0fdh, 01eh, 065h, 022h, 014h, 026h, 008h, 02ah, 040h, 02eh, 0b4h, 032h, 05ah, 037h, 028h, 03ch
        db      00ah, 041h, 0f6h, 045h, 0ceh, 04ah, 09ch, 04fh, 038h, 054h, 0a2h, 058h, 0c6h, 05ch, 0aeh, 060h
        db      050h, 064h, 0ach, 067h, 0c2h, 06ah, 088h, 06dh, 045h, 070h, 013h
        db      "sHQ[fr"
        db      080h, 063h, 01ah, 050h, 014h, 041h, 009h, 032h, 00eh, 0cdh, 0ach, 0dbh, 049h, 033h, 033h, 000h
        db      020h, 067h, 0a6h, 000h, 040h, 0cch, 02ch, 099h, 019h, 0e6h, 0b0h, 01ah, 04fh, 0e5h, 030h, 0e5h
        db      030h, 0e5h, 030h, 0e5h, 030h, 01ah, 04fh, 0e6h, 0b0h, 000h, 020h, 033h, 033h, 0dbh, 049h, 0cdh
        db      0ach, 099h, 019h, 0cch, 02ch, 000h, 040h, 067h, 0a6h
        db      4ah dup (000h)
        elseif  (XL = 0) && (MODEL = 3000)
        db      0fbh, 0ffh, 0ffh, 0ffh, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 025h, 025h, 025h, 025h, 025h, 025h, 025h, 000h, 00ah
        db      00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 000h, 020h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 03fh
        db      01fh, 00fh, 007h, 007h, 007h, 007h, 000h, 01eh, 01eh, 01eh, 01eh, 01eh, 01eh, 01eh, 000h, 010h
        db      018h, 010h, 017h, 010h, 010h, 010h
        db      49h dup (000h)
        db      01dh, 015h, 015h, 015h, 015h, 015h, 01dh, 000h, 009h, 009h, 009h, 009h, 009h, 009h, 009h, 000h
        db      009h, 015h, 011h, 009h, 005h, 005h, 01dh, 000h, 009h, 015h, 011h, 009h, 011h, 015h, 009h, 000h
        db      005h, 005h, 005h, 005h, 015h, 01dh, 011h, 000h, 01dh, 005h, 00dh, 011h, 011h, 015h, 009h, 000h
        db      009h, 005h, 005h, 00dh, 015h, 015h, 009h, 000h, 004h, 004h, 004h, 03ch, 000h, 000h, 000h, 000h
        db      004h, 004h, 004h, 007h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 03fh, 000h, 000h, 000h, 000h
        db      004h, 004h, 004h, 03fh, 000h, 000h, 000h, 000h, 000h, 004h, 004h, 03fh, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 01ch, 004h, 004h, 004h, 000h, 000h, 000h, 000h, 007h, 004h, 004h, 004h, 000h
        db      018h, 01ch, 01eh, 01fh, 01eh, 01ch, 018h, 000h, 003h, 007h, 00fh, 01fh, 00fh, 007h, 003h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 004h, 004h, 004h, 004h, 004h, 000h, 004h, 000h
        db      00ah, 00ah, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 00ah, 01fh, 00ah, 01fh, 00ah, 00ah, 000h
        db      004h, 01eh, 005h, 00eh, 014h, 00fh, 004h, 000h, 003h, 013h, 008h, 004h, 002h, 019h, 018h, 000h
        db      006h, 009h, 005h, 002h, 015h, 009h, 016h, 000h, 006h, 004h, 002h, 000h, 000h, 000h, 000h, 000h
        db      008h, 004h, 002h, 002h, 002h, 004h, 008h, 000h, 002h, 004h, 008h, 008h, 008h, 004h, 002h, 000h
        db      000h, 004h, 015h, 00eh, 015h, 004h, 000h, 000h, 000h, 004h, 004h, 01fh, 004h, 004h, 000h, 000h
        db      000h, 000h, 000h, 000h, 006h, 004h, 002h, 000h, 000h, 000h, 000h, 01fh, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 006h, 006h, 000h, 000h, 010h, 008h, 004h, 002h, 001h, 000h, 000h
        db      004h, 00ah, 011h, 011h, 011h, 00ah, 004h, 000h, 004h, 006h, 004h, 004h, 004h, 004h, 00eh, 000h
        db      00eh, 011h, 010h, 008h, 004h, 002h, 01fh, 000h, 01fh, 008h, 004h, 008h, 010h, 011h, 00eh, 000h
        db      008h, 00ch, 00ah, 009h, 01fh, 008h, 008h, 000h, 01fh, 001h, 00fh, 010h, 010h, 011h, 00eh, 000h
        db      00ch, 002h, 001h, 00fh, 011h, 011h, 00eh, 000h, 01fh, 011h, 008h, 004h, 002h, 001h, 001h, 000h
        db      00eh, 011h, 011h, 00eh, 011h, 011h, 00eh, 000h, 00eh, 011h, 011h, 01eh, 010h, 008h, 006h, 000h
        db      000h, 006h, 006h, 000h, 006h, 006h, 000h, 000h, 000h, 006h, 006h, 000h, 006h, 004h, 002h, 000h
        db      018h, 00ch, 006h, 003h, 006h, 00ch, 018h, 000h, 000h, 000h, 01fh, 000h, 01fh, 000h, 000h, 000h
        db      003h, 006h, 00ch, 018h, 00ch, 006h, 003h, 000h, 00eh, 011h, 010h, 008h, 004h, 000h, 004h, 000h
        db      00eh, 011h, 010h, 016h, 015h, 015h, 00eh, 000h, 004h, 00ah, 011h, 011h, 01fh, 011h, 011h, 000h
        db      00fh, 011h, 011h, 00fh, 011h, 011h, 00fh, 000h, 00eh, 011h, 001h, 001h, 001h, 011h, 00eh, 000h
        db      007h, 009h, 011h, 011h, 011h, 009h, 007h, 000h, 01fh, 001h, 001h, 00fh, 001h, 001h, 01fh, 000h
        db      01fh, 001h, 001h, 00fh, 001h, 001h, 001h, 000h, 00eh, 011h, 001h, 001h, 019h, 011h, 00eh, 000h
        db      011h, 011h, 011h, 01fh, 011h, 011h, 011h, 000h, 00eh, 004h, 004h, 004h, 004h, 004h, 00eh, 000h
        db      01eh, 008h, 008h, 008h, 008h, 009h, 006h, 000h, 011h, 009h, 005h, 003h, 005h, 009h, 011h, 000h
        db      001h, 001h, 001h, 001h, 001h, 001h, 01fh, 000h, 011h, 01bh, 015h, 015h, 011h, 011h, 011h, 000h
        db      011h, 011h, 013h, 015h, 019h, 011h, 011h, 000h, 00eh, 011h, 011h, 011h, 011h, 011h, 00eh, 000h
        db      00fh, 011h, 011h, 00fh, 001h, 001h, 001h, 000h, 00eh, 011h, 011h, 011h, 015h, 009h, 016h, 000h
        db      00fh, 011h, 011h, 00fh, 005h, 009h, 011h, 000h, 00eh, 011h, 001h, 00eh, 010h, 011h, 00eh, 000h
        db      01fh, 004h, 004h, 004h, 004h, 004h, 004h, 000h, 011h, 011h, 011h, 011h, 011h, 011h, 00eh, 000h
        db      011h, 011h, 011h, 011h, 011h, 00ah, 004h, 000h, 011h, 011h, 011h, 015h, 015h, 015h, 00ah, 000h
        db      011h, 011h, 00ah, 004h, 00ah, 011h, 011h, 000h, 011h, 011h, 00ah, 004h, 004h, 004h, 004h, 000h
        db      01fh, 010h, 008h, 004h, 002h, 001h, 01fh, 000h, 00eh, 002h, 002h, 002h, 002h, 002h, 00eh, 000h
        db      000h, 001h, 002h, 004h, 008h, 010h, 000h, 000h, 00eh, 008h, 008h, 008h, 008h, 008h, 00eh, 000h
        db      004h, 00eh, 01fh, 00eh, 00eh, 00eh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 01fh, 000h
        db      002h, 004h, 008h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00eh, 010h, 01eh, 011h, 01eh, 000h
        db      001h, 001h, 00fh, 011h, 011h, 011h, 00fh, 000h, 000h, 000h, 01eh, 001h, 001h, 001h, 01eh, 000h
        db      010h, 010h, 01eh, 011h, 011h, 011h, 01eh, 000h, 000h, 000h, 00eh, 011h, 01fh, 001h, 00eh, 000h
        db      00ch, 012h, 002h, 007h, 002h, 002h, 002h, 000h, 000h, 000h, 01eh, 011h, 011h, 01eh, 010h, 00eh
        db      001h, 001h, 00fh, 011h, 011h, 011h, 011h, 000h, 004h, 000h, 006h, 004h, 004h, 004h, 00eh, 000h
        db      008h, 000h, 008h, 008h, 008h, 008h, 009h, 006h, 001h, 001h, 009h, 005h, 003h, 005h, 009h, 000h
        db      006h, 004h, 004h, 004h, 004h, 004h, 00eh, 000h, 000h, 000h, 00bh, 015h, 015h, 011h, 011h, 000h
        db      000h, 000h, 00dh, 013h, 011h, 011h, 011h, 000h, 000h, 000h, 00eh, 011h, 011h, 011h, 00eh, 000h
        db      000h, 000h, 00fh, 011h, 011h, 00fh, 001h, 001h, 000h, 000h, 016h, 019h, 019h, 016h, 010h, 010h
        db      000h, 000h, 00dh, 013h, 001h, 001h, 001h, 000h, 000h, 000h, 01eh, 001h, 00eh, 010h, 00fh, 000h
        db      002h, 002h, 007h, 002h, 002h, 012h, 00ch, 000h, 000h, 000h, 011h, 011h, 011h, 011h, 00eh, 000h
        db      000h, 000h, 011h, 011h, 011h, 00ah, 004h, 000h, 000h, 000h, 011h, 011h, 015h, 015h, 00ah, 000h
        db      000h, 000h, 011h, 00ah, 004h, 00ah, 011h, 000h, 000h, 000h, 011h, 011h, 011h, 01eh, 010h, 00eh
        db      000h, 000h, 01fh, 008h, 004h, 002h, 01fh, 000h, 008h, 004h, 004h, 002h, 004h, 004h, 008h, 000h
        db      004h, 004h, 004h, 000h, 004h, 004h, 004h, 000h, 002h, 004h, 004h, 008h, 004h, 004h, 002h, 000h
        db      000h, 004h, 008h, 01fh, 008h, 004h, 000h, 000h, 000h, 004h, 002h, 01fh, 002h, 004h, 000h, 000h
        db      008h, 000h, 008h, 000h, 000h, 000h, 00ch, 000h, 00ch, 000h, 008h, 000h, 010h, 000h, 010h, 000h
        db      00ch, 000h, 014h, 000h, 014h, 000h, 010h, 000h, 018h, 000h, 018h, 000h, 014h, 000h, 01ch, 000h
        db      01ch, 000h, 018h, 000h, 020h, 000h, 01ch, 000h, 024h, 000h, 020h, 000h, 028h, 000h, 024h, 000h
        db      02ch, 000h, 028h, 000h, 030h, 000h, 02ch, 000h, 034h, 000h, 030h, 000h, 001h, 000h, 034h, 000h
        db      0eah, 04eh, 0fah, 04eh, 00ch
        endif
        if      (XL = 0) && (FW_VERSION >= 200)
        db      "O$O2O-"
        db      0e6h, 0afh, 09eh, 004h, 000h, 06eh, 0e9h, 0dah, 09dh, 0dah, 09dh, 0dah, 09dh, 0dah, 09dh, 05ah
        db      09eh, 036h, 09fh, 005h, 000h, 04fh, 0eah, 0abh, 0eah, 0cbh, 0eah, 0dfh, 0e7h, 0aeh, 0e7h, 008h
        db      0a1h, 07ah, 09eh, 0beh, 09fh, 008h, 000h, 06ch, 0ebh, 084h, 0ebh, 026h, 0ech, 04dh, 0ech, 0fah
        db      0ebh, 010h, 0ech, 0dfh, 0e7h, 0aeh, 0e7h, 0f0h, 0a0h, 0a8h, 09eh, 0afh, 09eh, 003h, 000h, 0d9h
        db      0eah, 00fh, 0ebh, 03fh, 0ebh, 0f0h, 0a0h, 041h, 09eh, 0b0h, 09eh, 004h, 000h, 0c4h, 0e6h, 069h
        db      0e7h, 087h, 0e7h, 092h, 0e7h, 0f5h, 0a0h, 002h, 000h, 010h, 048h, 002h, 008h, 018h, 04ch, 004h
        db      004h, 00ch, 014h, 01ch, 04eh, 008h, 002h, 006h, 00ah, 00eh, 012h, 016h, 01ah, 01eh, 04fh, 08ah
        db      0d5h
        elseif  (XL = 0) && (FW_VERSION = 150)
        db      "O$O2O"
        db      01dh, 0e6h, 00fh, 07ah, 004h, 000h, 05eh, 0e9h, 03ah, 079h, 03ah
        db      "y:y:y"
        db      0bah, 079h, 096h, 07ah, 005h, 000h, 03fh, 0eah, 09bh, 0eah, 0bbh, 0eah, 0cfh, 0e7h, 09eh, 0e7h
        db      068h, 07ch, 0dah, 079h, 01eh, 07bh, 008h, 000h, 05ch, 0ebh, 074h, 0ebh, 016h, 0ech, 03dh, 0ech
        db      0eah, 0ebh, 000h, 0ech, 0cfh, 0e7h, 09eh, 0e7h, 050h, 07ch, 008h, 07ah, 00fh, 07ah, 003h, 000h
        db      0c9h, 0eah, 0ffh, 0eah, 02fh, 0ebh, 050h, 07ch, 0a1h, 079h, 010h, 07ah, 004h, 000h, 0b4h, 0e6h
        db      059h, 0e7h, 077h, 0e7h, 082h, 0e7h, 055h, 07ch, 002h, 000h, 010h, 048h, 002h, 008h, 018h, 04ch
        db      004h, 004h, 00ch, 014h, 01ch, 04eh, 008h, 002h, 006h, 00ah, 00eh, 012h, 016h, 01ah, 01eh, 04fh
        db      08ah, 0d5h
        endif
        if      (XL = 0) && (MODEL = 3000)
        db      "8MUTE"
        db      0ffh, 08ah, 0d5h, 038h, 03eh, 03eh, 03ch, 03ch, 0ffh
        db      48h dup (000h)
        elseif  (XL = 0) && (MODEL = 3200)
        db      000h, 008h, 000h, 008h, 000h, 000h, 000h, 00ch, 000h, 00ch, 000h, 008h, 000h, 010h, 000h, 010h
        db      000h, 00ch, 000h, 014h, 000h, 014h, 000h, 010h, 000h, 018h, 000h, 018h, 000h, 014h, 000h, 01ch
        db      000h, 01ch, 000h, 018h, 000h, 020h, 000h, 01ch, 000h, 024h, 000h, 020h, 000h, 028h, 000h, 024h
        db      000h, 02ch, 000h, 028h, 000h, 030h, 000h, 02ch, 000h, 034h, 000h, 030h, 000h, 001h, 000h, 034h
        db      000h, 09ah, 04dh, 0aah, 04dh, 0bch, 04dh, 0d4h, 04dh, 0e2h, 04dh, 0ddh, 0e6h, 0a6h, 055h, 004h
        db      000h, 048h, 0eah, 0d1h, 054h, 0d1h, 054h, 0d1h, 054h, 0d1h
        db      "TQU-V"
        db      005h, 000h, 027h, 0ebh, 083h, 0ebh, 0a3h, 0ebh, 0c5h, 0e8h, 07eh, 0e8h, 0ffh, 057h, 071h, 055h
        db      0b5h, 056h, 008h, 000h, 044h, 0ech, 05ch, 0ech, 0fah, 0ech, 021h, 0edh, 0ceh, 0ech, 0e4h, 0ech
        db      0c5h, 0e8h, 07eh, 0e8h, 0e7h, 057h, 09fh, 055h, 0a6h, 055h, 003h, 000h, 0b1h, 0ebh, 0e7h, 0ebh
        db      017h, 0ech, 0e7h, 057h, 038h, 055h, 0a7h, 055h, 004h, 000h, 098h, 0e7h, 03dh, 0e8h, 05bh, 0e8h
        db      066h, 0e8h, 0ech, 057h
        db      50h dup (000h)
        endif
        dw      reset, 0ffffh
        db      80h dup (000h)
        db      0dbh, 002h, 000h, 000h, 000h, 000h, 0ceh, 002h, 000h, 000h, 000h, 000h, 0e7h, 002h, 000h, 000h
        db      000h, 000h, 0ceh, 002h, 000h, 000h, 000h, 000h, 0e7h, 002h, 000h, 000h, 000h, 000h, 0ceh, 002h
        db      000h, 000h, 000h, 000h, 0dbh, 002h, 000h, 000h, 000h, 000h, 003h, 002h, 001h, 000h, 000h, 000h
        if      (XL) || (MODEL = 3000)
        db      005h, 002h, 002h, 000h, 000h, 000h, 007h, 002h, 003h, 000h, 000h, 000h
        dw      reset, 0ffffh
        db      000h, 000h, 006h, 000h, 0c8h, 000h, 000h, 000h, 00ch, 000h, 0d6h, 001h, 000h, 000h, 012h, 000h
        db      0e8h, 002h, 000h, 000h, 018h, 000h, 0b0h, 003h, 000h, 000h, 01eh, 000h, 02fh, 005h, 000h, 000h
        db      01eh, 000h, 08ch, 009h, 000h, 000h, 018h, 000h, 0c1h, 00eh, 000h, 000h, 012h, 000h, 0f9h, 010h
        db      000h, 000h, 00ch, 000h, 09dh, 016h, 000h, 000h, 006h, 000h, 0ebh, 017h, 000h, 000h, 006h, 001h
        db      0fah, 000h, 000h, 000h, 00ch, 001h, 0f4h, 001h, 000h, 000h, 012h, 001h, 06dh, 003h, 000h, 000h
        db      018h, 001h, 035h, 005h, 000h, 000h, 01eh, 001h, 0cfh, 007h, 000h, 000h, 01eh, 001h, 0aeh, 008h
        db      000h, 000h, 018h, 001h, 005h, 00dh, 000h, 000h, 012h, 001h, 05ch, 011h, 000h, 000h, 00ch, 001h
        db      0b3h, 015h, 000h, 000h, 006h, 001h, 085h, 01ah, 000h, 000h, 008h, 000h, 000h, 000h, 000h, 000h
        else
        db      005h, 002h, 002h, 000h, 000h, 000h, 007h, 002h, 003h, 000h, 000h, 000h, 00ah, 000h, 0ffh, 0ffh
        db      000h, 000h, 002h, 000h, 0c8h, 000h, 000h, 000h, 004h, 000h, 0d6h, 001h, 000h, 000h, 006h, 000h
        db      0e8h, 002h, 000h, 000h, 008h, 000h, 0b0h, 003h, 000h, 000h, 00ah, 000h, 02fh, 005h, 000h, 000h
        db      00ah, 000h, 08ch, 009h, 000h, 000h, 008h, 000h, 0c1h, 00eh, 000h, 000h, 006h, 000h, 0f9h, 010h
        db      000h, 000h, 004h, 000h, 09dh, 016h, 000h, 000h, 002h, 000h, 0ebh, 017h, 000h, 000h, 002h, 001h
        db      0fah, 000h, 000h, 000h, 004h, 001h, 0f4h, 001h, 000h, 000h, 006h, 001h, 06dh, 003h, 000h, 000h
        db      008h, 001h, 035h, 005h, 000h, 000h, 00ah, 001h, 0cfh, 007h, 000h, 000h, 00ah, 001h, 0aeh, 008h
        db      000h, 000h, 008h, 001h, 005h, 00dh, 000h, 000h, 006h, 001h, 05ch, 011h, 000h, 000h, 004h, 001h
        db      0b3h, 015h, 000h, 000h, 002h, 001h, 085h, 01ah, 000h, 000h, 008h, 000h, 000h, 000h, 000h, 000h
        endif
        db      080h, 000h, 000h, 0fah, 000h, 000h, 080h, 000h, 000h, 0fah, 000h, 000h, 080h, 001h, 000h, 0fah
        db      000h, 000h, 080h, 001h, 000h, 0fah
        db      26h dup (000h)
        dw      reset, 0ffffh
        db      7ah dup (000h)
        db      009h
        db      41h dup (000h)
        dw      reset, 0ffffh
        db      7ah dup (000h)
        if      XL
        db      08ch, 06ah, 00dh, 009h, 045h, 051h, 08ah, 066h, 001h, 074h, 06fh, 03ah, 08ah, 0e4h, 001h, 025h
        db      046h, 08ah, 09bh, 00ah
        db      "Mode:"
        db      08ah, 09bh, 013h
        db      "Curv:"
        db      08ah, 09bh, 01ch
        db      "Freq:"
        db      08ah, 0dah, 01ch, 048h, 07ah, 08ah, 09bh
        db      "%Gain:"
        db      08ah, 0ceh, 025h, 064h, 042h, 08ah, 09bh
        db      ". Vol:"
        db      08ah, 0ceh, 02eh, 064h, 042h, 08ah, 000h, 00bh, 02bh, 032h, 034h, 08ah, 000h, 017h, 030h, 064h
        db      042h, 08ah, 000h, 023h, 02dh, 032h, 034h, 08ah, 014h, 02eh, 032h, 030h, 08ah, 02dh, 02eh, 031h
        db      030h, 030h, 08ah, 048h, 02eh, 035h, 030h, 030h, 08ah
        db      "c.2K"
        db      08ah
        db      "|.10KHz"
        db      08ah, 003h
        db      "8SLCT TIME RATE  EQ             GO  PLAY"
        db      0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 08ch, 06ah
        db      055h, 009h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      "MIDI"
        phase   8
far_3d558:
        and     byte ptr [bp+di + 4fh], dl
        dec     si
        inc     di
        and     byte ptr [bx+si + 4ch], dl
        inc     cx
        pop     cx
        mov     bh, byte ptr [si + 1]
        jnc     br_3d5d6
        outsb
        db      067h, 03ah, 08ah, 0a2h, 00bh
        elseif  ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 200))
        db      "MIDI SONG PLAY"
        db      08ah, 07ch, 001h
        db      "song:"
        db      08ah, 0a2h, 00bh
        endif
        if      XL
        db      "start:"
        db      08ah, 0aeh, 016h
        db      "end:"
        db      08ah, 084h
        db      "!tempo mode:"
        db      08ah
        db      "x,manual tempo:"
        db      08ah, 012h, 014h
        db      "BAR BEAT TEMPO"
        db      08ah, 003h
        db      "8PLAY"
        db      08ah
        db      "!8DISK"
        db      08ah, 09dh
        db      "8DEL"
        db      08ah, 0b7h
        db      "8PLAY STOP "
        db      0ffh, 08ch, 06ah, 08bh, 009h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      "LOAD MI"
br_3d5d6:
        inc     sp
        dec     cx
        sub     ax, 4946h
        dec     sp
        inc     bp
        and     byte ptr [bx+si], ch
        inc     sp
        dec     di
        push    bx
        sub     ax, 4446h
        sub     word ptr [bp+si + 1bah], cx
        inc     si
        jc      br_3d651
        db      065h, 03ah, 08ah, 0eah, 001h, 025h, 08ah, 018h, 012h
        elseif  ((XL) && (MODEL = 3200)) || ((XL) && (FW_VERSION < 200))
        db      "LOAD MIDI-FILE (DOS-FD)"
        db      08ah, 0bah, 001h
        db      "Free:"
        db      08ah, 0eah, 001h, 025h, 08ah, 018h, 012h
        endif
        if      XL
        db      "Volume:"
        db      08ah
        db      "0$files"
        db      08ah, 003h
        db      "8PLAY"
        db      08ah
        db      "!8DISK"
        db      08ah, 0d5h
        db      "8LOAD"
        db      0ffh, 08ah, 042h, 012h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 020h, 0ffh
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 007h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      20h dup (000h)
br_3d651:
        add     byte ptr [bx+si], al
        add     byte ptr [bx+si], al
        add     word ptr [bx+si], ax
        adc     byte ptr [bx+si], al
        adc     byte ptr [bx+si], al
        add     byte ptr [bx+si], al
        rol     byte ptr [bx+si], 40h
        db      0ffh, 0ffh, 0ffh, 03fh, 09ch, 0ffh
        elseif  XL = 0
        db      007h
        endif
        if      (XL = 0) || ((XL) && (FW_VERSION < 200)) || (MODEL = 3200)
        db      24h dup (000h)
        db      001h, 000h, 010h, 000h, 010h, 000h, 000h, 000h, 0c0h, 000h, 040h, 0ffh, 0ffh, 0ffh, 03fh, 09ch
        db      0ffh
        endif
        dw      reset, 0ffffh
        db      0ffh, 03fh, 09ch, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 010h, 000h, 010h, 000h, 000h, 000h, 0c0h
        db      000h, 040h, 000h, 000h, 000h, 000h, 024h, 0fah, 000h, 000h, 000h, 000h, 000h, 000h, 024h, 0fah
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 010h, 000h, 001h, 000h, 010h, 00fh, 010h, 000h, 000h, 063h, 002h, 096h, 0fbh, 000h, 000h
        db      000h, 000h, 0e7h, 003h, 0ffh, 03fh, 0ffh, 0ffh, 0ffh, 03fh, 047h, 001h, 0f0h, 07fh, 0ffh, 0ffh
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 010h, 000h, 001h
        db      000h, 010h, 008h, 010h, 000h, 000h, 000h, 0f0h, 080h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 008h, 010h, 000h, 001h, 000h, 010h, 010h, 010h
        db      000h, 000h, 000h, 0f0h, 080h
        db      22h dup (000h)
        db      001h, 000h, 010h, 000h, 000h, 000h, 000h, 000h, 0f0h, 080h
        db      22h dup (000h)
        db      001h, 000h, 010h, 000h, 000h, 000h, 000h, 000h, 0f0h, 080h
        db      20h dup (000h)
        db      010h, 000h, 001h, 000h, 010h, 008h, 010h, 000h, 000h, 000h, 0f0h, 080h, 000h, 000h, 000h, 000h
        db      000h, 088h, 013h, 01ah, 074h, 0ffh, 0ffh, 0ffh, 03fh, 047h, 001h, 0f0h, 07fh, 000h, 040h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 008h, 010h, 000h, 001h, 000h
        db      010h, 010h, 010h, 000h, 000h, 000h, 0f0h, 080h, 000h, 000h, 000h, 000h, 000h, 088h, 013h, 01ah
        db      074h, 0ffh, 0ffh, 0ffh, 03fh, 047h, 001h, 0f0h, 07fh, 040h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 010h, 000h, 000h, 000h
        db      000h, 000h, 0f0h, 080h, 000h, 000h, 000h, 000h, 000h, 088h, 013h, 01ah, 074h, 0ffh, 0ffh, 0ffh
        db      03fh, 047h, 001h, 0f0h, 07fh, 000h, 040h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 010h, 000h, 000h, 000h, 000h, 000h, 0f0h, 080h
        db      000h, 000h, 000h, 000h, 000h, 088h, 013h, 01ah, 074h, 0ffh, 0ffh, 0ffh, 03fh, 047h, 001h, 0f0h
        db      07fh, 040h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 001h, 000h, 010h, 000h, 010h, 000h, 000h, 000h, 0c0h, 000h, 040h, 000h, 000h, 000h
        db      000h, 018h, 0fch, 000h, 080h, 000h, 000h, 000h, 030h, 064h, 000h, 0f0h, 07fh, 0ffh, 0ffh, 00fh
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 010h, 004h, 010h, 000h, 001h, 000h
        db      000h, 000h, 010h, 010h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00fh, 027h, 0ffh
        db      07fh, 000h, 000h, 000h, 030h, 064h, 000h, 0f0h, 07fh, 000h, 000h, 007h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 010h, 000h, 001h, 000h, 010h, 000h, 018h, 000h
        if      (XL = 0) || ((XL) && (FW_VERSION >= 200)) || ((XL) && (FW_VERSION < 150))
        db      000h, 000h, 0c0h, 000h, 020h, 000h, 000h, 000h, 000h, 09ch, 0ffh, 000h, 000h, 000h, 000h, 000h
        db      000h, 09ch, 0ffh, 000h, 000h, 000h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 018h, 000h, 001h, 000h, 010h, 000h, 020h, 000h, 000h, 000h, 0c0h, 000h
        db      020h, 000h, 000h, 000h, 000h, 09ch, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 09ch, 0ffh, 000h
        db      000h, 000h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      010h, 000h, 001h, 000h, 010h, 000h, 018h, 010h, 000h, 000h, 0c0h, 000h, 020h, 000h, 000h, 000h
        db      000h, 0e8h, 003h, 0ffh, 07fh, 0ffh, 0ffh, 0ffh, 03fh, 0e8h, 003h, 0f0h, 07fh, 000h, 080h, 00fh
        db      000h, 0ffh, 07fh, 0ffh, 0bfh, 000h, 0c0h, 000h, 080h, 000h, 000h, 000h, 018h, 000h, 001h, 000h
        db      010h, 000h, 020h, 010h, 000h, 000h, 0c0h, 000h, 020h, 000h, 000h, 000h, 000h, 0e8h, 003h, 0ffh
        db      07fh, 0ffh, 0ffh, 0ffh, 03fh, 0e8h, 003h, 0f0h, 07fh, 080h, 000h, 00fh, 000h, 0ffh, 07fh, 0ffh
        db      0bfh, 000h, 0c0h, 000h, 080h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 010h, 000h, 010h, 000h
        db      000h, 000h, 0c0h, 000h, 040h, 000h, 000h, 000h, 000h, 09ch, 0ffh, 000h, 000h, 000h, 000h, 000h
        db      000h, 09ch, 0ffh, 000h, 000h, 000h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 010h, 002h, 018h, 000h, 01ah, 000h, 01ch
        db      004h, 008h, 07fh, 004h, 024h, 0ffh, 000h, 010h, 002h, 018h, 000h, 01ah, 000h, 008h, 0ffh, 004h
        db      084h, 0ffh, 000h, 010h, 003h, 018h, 000h, 01ah, 000h, 01ch, 001h, 008h, 0ffh, 004h, 084h, 0ffh
        db      000h, 010h, 007h, 018h, 000h, 01ah, 000h, 01ch, 001h, 008h, 0ffh, 004h, 084h, 0ffh, 000h, 002h
        db      054h, 002h, 014h, 010h, 006h, 018h, 000h, 01ah, 000h, 01ch, 001h, 008h, 0ffh, 004h, 084h, 0ffh
        endif
        if      (MODEL = 3200) || ((XL) && (FW_VERSION >= 200)) || ((XL) && (FW_VERSION < 150))
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 015h, 000h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (FW_VERSION = 150)
        db      000h
        dw      far_2c110+4c00h, 2000h
        db      000h, 000h, 000h, 000h, 09ch, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 09ch, 0ffh, 000h, 000h
        db      000h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 018h
        db      000h, 001h, 000h, 010h, 000h, 020h, 000h, 000h
        dw      far_2c110+4c00h, 2000h
        db      000h, 000h, 000h, 000h, 09ch, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 09ch, 0ffh, 000h, 000h
        db      000h, 000h, 00fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 010h
        db      000h, 001h, 000h, 010h, 000h, 018h, 010h, 000h
        dw      far_2c110+4c00h, 2000h
        db      000h, 000h, 000h, 000h, 0e8h, 003h, 0ffh, 07fh, 0ffh, 0ffh, 0ffh, 03fh, 0e8h, 003h, 0f0h, 07fh
        db      000h, 080h, 00fh, 000h, 0ffh, 07fh, 0ffh, 0bfh, 000h, 0c0h, 000h, 080h, 000h, 000h, 000h, 018h
        db      000h, 001h, 000h, 010h, 000h, 020h, 010h, 000h
        dw      far_2c110+4c00h, 2000h
        db      000h, 000h, 000h, 000h, 0e8h, 003h, 0ffh, 07fh, 0ffh, 0ffh, 0ffh, 03fh, 0e8h, 003h, 0f0h, 07fh
        db      080h, 000h, 00fh, 000h, 0ffh, 07fh, 0ffh, 0bfh, 000h, 0c0h, 000h, 080h, 000h, 000h, 000h, 000h
        db      000h, 001h, 000h, 010h, 000h, 010h, 000h, 000h, 000h, 0c0h, 000h, 040h, 000h, 000h, 000h, 000h
        db      09ch, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 09ch, 0ffh, 000h, 000h, 000h, 000h, 00fh, 000h
        else
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00fh, 010h, 010h, 00fh
        db      00dh, 01eh, 01dh, 00ah, 010h, 013h, 016h, 00fh, 006h, 0abh, 00fh, 029h, 00fh, 0b3h, 00eh, 034h
        db      00dh, 0c5h, 00ch, 02eh, 00ch, 058h, 002h, 009h, 002h, 0ddh, 001h, 0a1h, 001h, 000h, 000h, 0ffh
        db      007h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 070h, 00ah, 040h, 01eh, 0a0h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0b3h, 009h, 093h, 00ah, 0f4h, 007h, 0e2h
        db      009h, 043h, 007h, 032h, 009h, 0e8h, 001h, 084h, 001h, 037h, 001h, 032h, 001h, 0ceh, 000h, 0d5h
        db      007h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 060h, 00ah, 040h, 01eh, 0a0h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0cbh, 005h, 072h, 007h, 052h, 008h, 0d9h
        db      006h, 08dh, 004h, 000h, 004h, 0c5h, 001h, 0a1h, 001h, 096h, 001h, 084h, 001h, 081h, 000h, 00bh
        db      006h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 040h, 00ah, 060h, 01eh, 0a0h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00bh, 004h, 0d0h, 003h, 072h, 003h, 020h
        db      003h, 0e5h, 002h, 0ceh, 002h, 090h, 001h, 072h, 001h, 03dh, 001h, 01ah, 001h, 081h, 000h, 037h
        db      007h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00fh, 030h, 00ah, 060h, 00fh, 0b0h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0b3h, 009h, 093h, 00ah, 0f4h, 007h, 0e2h
        db      009h, 043h, 007h, 032h, 009h, 0e8h, 001h, 084h, 001h, 037h, 001h, 032h, 001h, 0cah, 007h, 005h
        endif
        if      ((XL) && (FW_VERSION = 150)) || ((XL = 0) && (MODEL = 3000))
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      (XL) && (FW_VERSION = 150)
        db      010h, 002h, 018h, 000h, 01ah, 000h, 01ch, 004h, 008h, 07fh, 004h, 024h, 0ffh, 000h, 010h, 002h
        db      018h, 000h, 01ah, 000h, 008h, 0ffh, 004h, 084h, 0ffh, 000h, 010h, 003h, 018h, 000h, 01ah, 000h
        db      01ch, 001h, 008h, 0ffh, 004h, 084h, 0ffh, 000h, 010h, 007h, 018h, 000h, 01ah, 000h, 01ch, 001h
        db      008h, 0ffh, 004h, 084h, 0ffh, 000h, 002h, 054h, 002h, 014h, 010h, 006h, 018h, 000h, 01ah, 000h
        db      01ch, 001h, 008h, 0ffh, 004h, 084h, 0ffh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      015h, 000h, 000h, 000h, 000h, 000h, 000h
        endif
        if      XL
        db      "RETLOOP", 0
        db      000h, 002h, 000h, 000h, 00fh, 010h, 010h, 00fh, 00dh, 01eh, 01dh, 00ah, 010h, 013h, 016h, 00fh
        db      000h, 000h, 0ffh
        db      1feh dup (000h)
        db      80h dup (001h)
        db      80h dup (002h)
        db      80h dup (003h)
        db      01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 001h, 00ah, 000h, 001h, 0d0h, 007h
        db      000h, 000h, 063h, 000h, 000h, 000h, 019h, 005h, 01ah, 002h, 032h, 028h, 0dbh, 032h, 02eh, 000h
        db      005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h, 005h, 041h, 000h, 014h
        db      01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh, 000h, 000h, 000h, 000h
        db      00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h
        db      000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h, 032h, 000h, 000h, 002h
        db      01eh, 013h, 011h, 012h, 01eh, 00ah, 01ch, 019h, 019h, 017h, 00ah, 001h, 000h, 000h, 000h, 000h
        db      003h, 000h, 00fh, 000h, 04bh, 012h, 042h, 01eh, 050h, 032h, 019h, 000h, 000h, 000h, 000h, 000h
        db      01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 002h, 00ah, 000h, 001h, 0d0h, 007h
        db      000h, 000h, 063h, 000h, 000h, 000h, 014h, 008h, 01bh, 000h, 032h, 030h, 001h, 032h, 038h, 000h
        db      005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h, 005h, 041h, 000h, 014h
        db      01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh, 000h, 000h, 000h, 000h
        db      00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h
        db      000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h, 032h, 000h, 000h, 00dh
        db      017h, 00fh, 00eh, 013h, 01fh, 017h, 00ah, 01ch, 019h, 019h, 017h, 00ah, 000h, 000h, 000h, 000h
        db      002h, 000h, 00ah, 000h, 019h, 000h, 040h, 023h, 063h, 032h, 032h, 000h, 000h, 000h, 000h, 000h
        db      01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 003h, 00ah, 000h, 001h, 0d0h, 007h
        db      000h, 000h, 063h, 000h, 000h, 000h, 01fh, 008h, 01ch, 0dbh, 032h, 032h, 001h, 032h, 03eh, 0dbh
        db      005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h, 005h, 041h, 000h, 014h
        db      01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh, 000h, 000h, 000h, 000h
        db      00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h
        db      000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h, 032h, 000h, 000h, 019h
        db      016h, 019h, 018h, 011h, 00ah, 012h, 00bh, 016h, 016h, 00ah, 001h, 00ah, 000h, 000h, 000h, 000h
        db      000h, 000h, 032h, 000h, 023h, 000h, 03eh, 033h, 05ah, 032h, 032h, 000h, 000h, 000h, 000h, 000h
        db      01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 004h, 00ah, 000h, 001h, 0d0h, 007h
        db      000h, 000h, 063h, 000h, 000h, 000h, 018h, 001h, 01bh, 004h, 032h, 032h, 0fch, 032h, 022h, 000h
        db      005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h, 005h, 041h, 000h, 014h
        db      01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh, 000h, 000h, 000h, 000h
        db      00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h
        db      000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h, 032h, 000h, 000h, 006h
        db      01dh, 012h, 019h, 01ch, 01eh, 00ah, 01ch, 00fh, 020h, 00ah, 001h, 00ah, 000h, 000h, 000h, 000h
        db      003h, 000h, 023h, 000h, 023h, 000h
        db      "A(Z22", 0
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 005h, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 01bh, 005h, 01eh, 003h, 032h, 032h
        db      0fch, 032h, 02eh, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 021h, 017h, 00fh, 00eh, 013h, 01fh, 017h, 00ah, 012h, 00bh, 016h, 016h, 001h
        db      000h, 000h, 000h, 000h, 000h, 000h, 028h, 000h, 019h, 000h, 040h, 01eh, 055h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 006h, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 018h, 004h, 01ch, 0dbh, 032h, 038h
        db      007h, 032h, 031h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 02ah, 01dh, 017h, 00bh, 016h, 016h, 00ah, 012h, 00bh, 016h, 016h, 00ah, 001h
        db      000h, 000h, 000h, 000h, 001h, 000h, 00fh, 000h, 03ch, 006h, 03fh, 019h, 046h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 007h, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 018h, 003h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 031h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 02dh, 016h, 00bh, 01ch, 011h, 00fh, 00ah, 01ch, 019h, 019h, 017h, 00ah, 001h
        db      000h, 000h, 000h, 000h, 003h, 000h, 014h, 000h, 014h, 000h, 040h, 032h, 050h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 008h, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 023h, 007h, 01ch, 0dbh, 032h, 034h
        db      004h, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 000h, 00bh, 017h, 00ch, 013h, 00fh, 018h, 01eh, 00ah, 01ch, 019h, 019h, 017h
        db      000h, 000h, 000h, 000h, 003h, 000h, 00fh, 000h, 046h, 000h, 03eh, 019h, 032h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 009h, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 01bh, 003h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 02dh, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 005h, 00dh, 019h, 019h, 016h, 00ah, 012h, 00bh, 016h, 016h, 00ah, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 001h, 000h, 023h, 000h, 046h, 01dh
        db      "B(c22", 0
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 001h, 000h
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 014h, 008h, 01ch, 0dbh, 032h, 028h
        db      006h, 032h, 036h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 004h, 01dh, 01eh, 01fh, 00eh, 013h, 019h, 00ah, 00bh, 017h, 00ch, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 002h, 000h, 037h, 000h, 006h, 01ch, 032h, 019h, 01eh, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 001h, 001h
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 01ah, 009h, 01ch, 0dbh, 032h, 035h
        db      000h, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 016h, 01dh, 01eh, 01ch, 013h, 018h, 011h, 01dh, 00ah, 012h, 00bh, 016h, 016h
        db      000h, 000h, 000h, 000h, 000h, 000h, 023h, 000h, 019h, 000h, 039h, 028h, 046h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 001h, 002h
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 019h, 006h, 01ch, 0dbh, 032h, 038h
        db      0feh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 026h, 01dh, 01eh, 00bh, 011h, 00fh, 00ah, 00bh, 017h, 00ch, 00ah, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 002h, 000h, 041h, 000h, 032h, 000h, 040h, 02dh, 055h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 001h, 003h
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 019h, 009h, 01bh, 0f8h, 032h, 032h
        db      005h, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 01bh, 021h, 012h, 013h, 01eh, 00fh, 00ah, 01ch, 019h, 019h, 017h, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 003h, 000h, 00fh, 000h, 032h, 014h, 035h, 03ch, 03ch, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 001h, 004h
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 01ah, 009h, 027h, 000h, 032h, 032h
        db      007h, 034h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 00ah, 00ch, 01ch, 013h, 011h, 012h, 01eh, 00ah, 01ch, 019h, 019h, 017h, 00ah
        db      000h, 000h, 000h, 000h, 003h, 000h, 028h, 000h, 00ah, 022h, 03dh, 028h, 032h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00fh, 01bh, 00ah, 001h, 005h
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 019h, 00bh, 01ch, 002h, 018h, 038h
        db      00ah, 032h, 02ch, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 028h, 010h, 016h, 01fh, 01eh, 01eh, 00fh, 01ch, 00ah, 012h, 00bh, 016h, 016h
        db      000h, 000h, 000h, 000h, 000h, 000h, 03ch, 000h, 050h, 00eh, 03ch, 032h, 019h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 00dh, 016h, 00fh, 00bh, 01ch, 00ah, 00dh, 012h, 019h, 01ch, 01fh, 01dh
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 014h, 008h, 01ch, 0fbh, 032h, 038h
        db      005h, 032h, 03ch, 008h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 003h, 011h, 02eh, 00eh
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 001h, 021h, 00bh, 01ch, 00fh, 012h, 019h, 01fh, 01dh, 00fh, 00ah, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 002h, 000h, 014h, 000h, 014h, 000h
        db      "8PF22", 0
        db      000h, 000h, 000h, 000h, 01ch, 013h, 00dh, 012h, 00ah, 00dh, 012h, 019h, 01ch, 01fh, 01dh, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 003h, 020h, 00ah, 0f3h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 004h, 00eh, 01ch, 01fh, 017h, 00ah, 00bh, 017h, 00ch, 013h, 00fh, 018h, 01eh
        db      000h, 000h, 000h, 000h, 004h, 000h, 019h, 000h, 000h, 000h, 03ch, 000h, 045h, 02dh, 032h, 000h
        db      000h, 000h, 000h, 000h, 01dh, 016h, 019h, 021h, 00ah, 010h, 016h, 00bh, 018h, 011h, 00fh, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 002h, 004h, 063h, 0dch
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 006h, 011h, 00bh, 01eh, 00fh, 00ah, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 001h
        db      000h, 000h, 000h, 000h, 005h, 000h, 00ah, 000h, 000h, 000h, 03ch, 01eh, 05ah, 03ch, 032h, 000h
        db      000h, 000h, 000h, 000h, 01eh, 012h, 013h, 00dh, 015h, 00ah, 010h, 016h, 00bh, 018h, 011h, 00fh
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 002h, 008h, 03fh, 0d3h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 004h, 016h, 013h, 020h, 00fh, 00ah, 012h, 019h, 01fh, 01dh, 00fh, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 003h, 000h, 019h, 000h, 050h, 01ch, 041h, 005h, 05fh, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 00fh, 01bh, 026h, 01ch, 00fh, 01dh, 00ah, 010h, 00bh, 024h, 00fh, 01ch
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 028h, 006h, 003h, 031h
        db      006h, 006h, 022h, 000h, 005h, 00eh, 006h, 010h, 000h, 000h, 000h, 000h, 000h, 006h, 00ah, 0d2h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 017h, 00dh, 016h, 00fh, 00bh, 01ch, 00ah, 01ch, 00fh, 020h, 00fh, 01ch, 00ch
        db      000h, 000h, 000h, 000h, 001h, 000h, 023h, 000h, 019h, 014h
        db      "B(c22", 0
        db      000h, 000h, 000h, 000h, 01eh, 012h, 01ch, 019h, 00bh, 01eh, 023h, 00ah, 010h, 00bh, 024h, 00fh
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 00eh, 004h, 0d3h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 003h, 016h, 019h, 018h, 011h, 00ah, 012h, 00bh, 016h, 016h, 00ah, 002h, 00ah
        db      000h, 000h, 000h, 000h, 000h, 000h, 00fh, 000h, 01eh, 000h, 03ah, 032h, 055h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 00ch, 01fh, 00ch, 00ch, 016h, 00fh, 023h, 00ah, 010h, 00bh, 024h, 00fh
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 030h, 009h, 0e2h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 003h, 01ch, 00fh, 020h, 00fh, 01ch, 01dh, 00fh, 00ah, 01ch, 00fh, 020h, 001h
        db      000h, 000h, 000h, 000h, 006h, 000h, 014h, 000h, 000h, 000h, 03ch, 01eh, 055h, 050h, 032h, 000h
        db      000h, 000h, 000h, 000h, 00fh, 00dh, 012h, 019h, 00ah, 010h, 016h, 00bh, 018h, 011h, 00fh, 01ch
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 001h, 004h, 04bh, 0d3h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 04bh, 001h, 01ch, 042h, 04fh, 001h, 01dh, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 008h, 01ah, 00fh, 01ch, 00dh, 01fh, 01dh, 01dh, 00ah, 00bh, 017h, 00ch, 00ah
        db      000h, 000h, 000h, 000h, 003h, 000h, 00fh, 000h, 014h, 01fh, 036h, 01eh, 032h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 019h, 01eh, 00bh, 01ch, 023h, 00ah, 00dh, 00bh, 00ch, 00ah, 00ah
        db      000h, 000h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 001h, 000h, 002h, 00fh, 019h, 000h
        db      006h, 045h, 000h, 014h, 019h, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 004h, 021h, 013h, 018h, 00eh, 023h, 00ah, 01ch, 00fh, 020h, 00fh, 01ch, 00ch
        db      000h, 000h, 000h, 000h, 002h, 000h, 055h, 000h, 041h, 000h, 03ch, 01eh, 05ah, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 019h, 00dh, 015h, 00ah, 019h, 01ch, 011h, 00bh, 018h, 00ah, 00ah
        db      000h, 000h, 0d0h, 007h, 000h, 013h, 048h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 001h, 000h, 002h, 00fh, 019h, 000h
        db      007h, 045h, 000h, 00fh, 022h, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 00bh, 01dh, 017h, 00bh, 016h, 016h, 00ah, 012h, 00bh, 016h, 016h, 00ah, 002h
        db      000h, 000h, 000h, 000h, 001h, 000h, 02dh, 000h, 00ah, 000h, 03eh, 01eh, 050h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 00dh, 016h, 00fh, 00bh, 018h, 00ah, 011h, 01fh, 013h, 01eh, 00bh, 01ch
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 003h, 015h, 012h, 0f0h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 047h, 001h, 017h, 042h, 04fh, 001h, 018h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 005h, 01dh, 012h, 019h, 01ch, 01eh, 00ah, 01ch, 00fh, 020h, 00ah, 002h, 00ah
        db      000h, 000h, 000h, 000h, 003h, 000h, 028h, 000h, 028h, 012h, 040h, 00ah, 05ah, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 017h, 013h, 016h, 00eh, 00ah, 00dh, 016h, 013h, 01ah, 00ah, 00ah, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 01bh, 040h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 003h, 015h, 012h, 0f0h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 0c8h, 000h, 01fh, 042h, 0c6h, 000h, 01eh, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 000h, 021h, 00bh, 01ch, 00fh, 012h, 019h, 01fh, 01dh, 00fh, 00ah, 002h, 00ah
        db      000h, 000h, 000h, 000h, 001h, 000h, 005h, 000h, 00bh, 000h, 033h, 03ch, 023h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 019h, 020h, 01ch, 00eh, 01ch, 013h, 020h, 00fh, 00ah, 011h, 01eh, 01ch
        db      000h, 000h, 0d0h, 007h, 000h, 02fh, 01ch, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 002h, 015h, 014h, 0ech
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 0fah, 000h, 01fh, 042h, 0f6h, 000h, 021h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 001h, 00dh, 019h, 018h, 00dh, 00fh, 01ch, 01eh, 00ah, 012h, 00bh, 016h, 016h
        db      000h, 000h, 000h, 000h, 000h, 000h, 019h, 000h, 019h, 000h, 03eh, 02dh, 05ah, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 017h, 00fh, 01eh, 00bh, 016h, 00ah, 012h, 00fh, 01ch, 019h, 00ah, 00ah
        db      000h, 000h, 0d0h, 007h, 000h, 063h, 014h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 002h, 015h, 019h, 0f0h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 04fh, 001h, 019h, 042h, 046h, 001h, 01bh, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 005h, 01ah, 019h, 021h, 00fh, 01ch, 00ah, 011h, 00bh, 01eh, 00fh, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 005h, 000h, 02dh, 000h, 000h, 000h, 03ch, 01eh, 063h, 063h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 012h, 019h, 00eh, 00fh, 01dh, 00ah, 01ah, 00bh, 018h, 00ah, 00ah
        db      000h, 000h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 002h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 01eh, 008h, 000h, 01eh, 04ah, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 003h, 01eh, 013h, 016h, 00fh, 00eh, 00ah, 01ch, 019h, 019h, 017h, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 003h, 000h, 041h, 000h, 019h, 00ch, 03ch, 032h, 023h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01eh, 01ch, 00fh, 017h, 019h, 016h, 019h, 00ah, 00ah, 00ah, 00ah, 00ah
        db      000h, 000h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 002h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 02ah, 02ah, 003h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 003h, 01eh, 01fh, 018h, 018h, 00fh, 016h, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 014h, 000h
        db      "7Pc22", 0
        db      000h, 000h, 000h, 000h, 016h, 019h, 018h, 011h, 00ah, 017h, 019h, 018h, 019h, 00eh, 00eh, 016h
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 09eh, 002h, 000h, 000h
        db      032h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 005h, 021h, 019h, 019h, 00eh, 00ah, 021h, 013h, 018h, 00eh, 00ah, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 000h, 000h, 03ch, 000h, 019h, 014h, 035h, 028h, 05fh, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ah, 013h, 018h, 011h, 00ah, 01ah, 019h, 018h, 011h, 00ah, 00ah, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 09eh, 002h, 000h, 000h
        db      032h, 042h, 032h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      01eh, 000h, 000h, 001h, 01ch, 00fh, 020h, 00fh, 01ch, 01dh, 00fh, 00ah, 01ch, 00fh, 020h, 002h
        db      000h, 000h, 000h, 000h, 006h, 000h, 032h, 000h, 063h, 000h, 03ch, 01eh, 063h, 062h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01dh, 01eh, 00fh, 01ch, 00fh, 019h, 00ah, 00eh, 00fh, 016h, 00bh, 023h
        db      000h, 000h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 04fh, 001h, 02fh, 042h, 047h, 001h, 02dh, 042h, 063h, 000h, 063h, 019h
        db      01ah, 000h, 000h, 001h, 011h, 023h, 017h, 018h, 00bh, 01dh, 013h, 01fh, 017h, 00ah, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 001h, 000h, 019h, 000h, 063h, 000h, 03bh, 032h, 00ah, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 022h, 019h, 020h, 00fh, 01ch, 00ah, 00eh, 00fh, 016h, 00bh, 023h, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 0fah, 000h
        db      032h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 001h, 016h, 00bh, 01ch, 011h, 00fh, 00ah, 01ch, 019h, 019h, 017h, 00ah, 002h
        db      000h, 000h, 000h, 000h, 002h, 000h, 032h, 000h, 014h, 006h, 03ch, 02dh, 05ah, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01eh, 012h, 013h, 00dh, 015h, 00fh, 018h, 00fh, 01ch, 00ah, 001h, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 003h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 023h, 000h
        db      000h, 000h, 000h, 000h, 0ddh, 0ffh, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 000h, 011h, 00bh, 01eh, 00fh, 00ah, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 002h
        db      000h, 000h, 000h, 000h, 004h, 000h, 032h, 000h, 000h, 000h, 03ch, 01eh, 037h, 05fh, 032h, 000h
        db      000h, 000h, 000h, 000h, 01eh, 012h, 013h, 00dh, 015h, 00fh, 018h, 00fh, 01ch, 00ah, 002h, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 003h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 023h, 000h
        db      000h, 000h, 000h, 000h, 0ddh, 0ffh, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 04ch, 000h, 000h, 042h, 055h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 000h, 00bh, 017h, 00ch, 013h, 00fh, 018h, 00dh, 00fh, 00ah, 00ah, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 003h, 000h, 019h, 000h, 05fh, 008h, 040h, 00ah, 063h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 00dh, 016h, 00fh, 00bh, 01ch, 00ah, 00eh, 00fh, 01eh, 01fh, 018h, 00fh
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 019h, 00ah, 022h, 0f0h, 032h, 01fh
        db      008h, 032h, 039h, 00ah, 002h, 028h, 001h, 028h, 000h, 000h, 003h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 001h, 063h, 003h, 019h, 000h
        db      000h, 000h, 000h, 000h, 0e7h, 0ffh, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 000h, 00bh, 013h, 01ch, 00ah, 020h, 019h, 013h, 00dh, 00fh, 00ah, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 000h, 000h, 032h, 000h, 000h, 012h, 028h, 02dh, 063h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 019h, 01eh, 00bh, 01eh, 013h, 019h, 018h, 00ah, 01ah, 00bh, 018h
        db      000h, 000h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 002h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 002h, 01eh, 000h, 001h, 063h, 001h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 004h, 00ch, 00bh, 01dh, 00fh, 017h, 00fh, 018h, 01eh, 00ah, 00ah, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 003h, 000h, 00fh, 000h, 037h, 008h, 02eh, 01eh, 028h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01dh, 01eh, 00fh, 01ch, 00fh, 019h, 00ah, 00dh, 012h, 019h, 01ch, 01dh
        db      000h, 001h, 0d0h, 007h, 000h, 014h, 03ch, 000h, 000h, 000h, 014h, 00ch, 022h, 0fbh, 032h, 02eh
        db      0feh, 032h, 03ah, 006h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 002h, 005h, 046h, 0ddh
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 002h, 000h, 000h, 000h, 0fah, 000h
        db      005h, 042h, 00fh, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 004h, 00fh, 00bh, 01ch, 016h, 023h, 00ah, 01ch, 00fh, 010h, 00ah, 001h, 00ah
        db      000h, 000h, 000h, 000h, 004h, 000h, 00ah, 000h, 000h, 000h, 03ch, 01eh, 05fh, 041h, 032h, 000h
        db      000h, 000h, 000h, 000h, 010h, 016h, 00bh, 018h, 011h, 00fh, 01ch, 00ah, 01dh, 01ah, 013h, 018h
        db      000h, 000h, 0d0h, 007h, 000h, 00fh, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 001h, 000h, 002h, 00fh, 019h, 000h
        db      003h, 037h, 000h, 014h, 04bh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 064h, 000h, 014h, 042h, 064h, 000h, 014h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 001h, 01dh, 01ah, 00bh, 00dh, 00fh, 00ah, 01ch, 00fh, 020h, 00fh, 01ch, 00ch
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      ">Fc22", 0
        db      000h, 000h, 000h, 000h, 01dh, 021h, 013h, 01ch, 016h, 023h, 00ah, 01dh, 021h, 00fh, 00fh, 01ah
        db      000h, 000h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 028h, 006h, 002h, 033h
        db      006h, 002h, 022h, 000h, 002h, 028h, 001h, 028h, 063h, 000h, 002h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 001h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      01eh, 000h, 000h, 002h, 017h, 00fh, 00eh, 013h, 01fh, 017h, 00ah, 012h, 00bh, 016h, 016h, 002h
        db      000h, 000h, 000h, 000h, 001h, 000h, 02dh, 000h, 019h, 028h, 03ah, 032h, 046h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 00bh, 01fh, 01eh, 021h, 00bh, 012h, 00ah, 00ch, 01fh, 00ch, 00ch, 016h
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      009h, 005h, 022h, 000h, 005h, 000h, 033h, 009h, 000h, 000h, 000h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 01ah, 00fh, 00bh, 01ch, 016h, 023h, 00ah, 01ch, 00fh, 010h, 00ah, 002h, 00ah
        db      000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 024h, 000h, 042h, 009h, 063h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 00dh, 019h, 017h, 00fh, 00ah, 00bh, 018h, 00eh, 00ah, 011h, 019h, 00ah
        db      000h, 001h, 0e8h, 003h, 037h, 019h, 03ch, 000h, 000h, 000h, 022h, 000h, 01ch, 0f6h, 032h, 02fh
        db      00ch, 04bh, 03bh, 009h, 005h, 014h, 005h, 063h, 005h, 000h, 000h, 000h, 002h, 005h, 028h, 01eh
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 00ah
        db      02dh, 000h, 000h, 01ch, 01eh, 013h, 011h, 012h, 01eh, 00ah, 01ch, 019h, 019h, 017h, 00ah, 002h
        db      000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 019h, 000h, 028h, 014h, 063h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ah, 012h, 00bh, 01dh, 00fh, 00eh, 00ah, 01ch, 020h, 01ch, 00ch, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 00ch, 005h, 0d9h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 032h, 000h, 063h, 0ceh
        db      000h, 000h, 000h, 028h, 00bh, 017h, 00ch, 013h, 00fh, 018h, 00dh, 00fh, 00ah, 002h, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 003h, 000h, 028h, 000h, 05fh, 028h, 040h, 005h, 063h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 010h, 016h, 00bh, 018h, 011h, 00fh, 00eh, 00ah, 01ch, 020h, 01ch, 00ch
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 032h, 0dbh
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 032h, 000h, 063h, 0ceh
        db      000h, 000h, 000h, 028h, 016h, 00bh, 01ch, 011h, 00fh, 00ah, 011h, 019h, 016h, 00eh, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 002h, 000h, 03ch, 000h, 063h, 000h, 03fh, 032h, 055h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 00dh, 012h, 019h, 01ch, 01fh, 01dh, 00eh, 00ah, 01ch, 020h, 01ch, 00ch
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 002h, 011h, 008h, 0f9h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 032h, 000h, 063h, 0ceh
        db      019h, 000h, 000h, 028h, 00eh, 01ch, 01fh, 017h, 00ah, 00ch, 019h, 019h, 01eh, 012h, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 003h, 000h, 02dh, 000h, 014h, 000h, 028h, 023h, 055h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 00eh, 019h, 01ah, 01ah, 016h, 00fh, 01ch, 00ah, 01ch, 020h, 01ch, 00ch
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 002h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 049h, 013h, 005h, 063h, 001h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 032h, 000h, 063h, 0ceh
        db      019h, 000h, 000h, 028h, 012h, 00bh, 01ch, 00eh, 00ah, 021h, 00bh, 016h, 016h, 01dh, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 000h, 000h, 05ah, 000h, 028h, 000h, 03fh, 01eh, 032h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch, 00ah, 00dh, 012h, 00bh, 013h, 018h
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 005h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      000h, 000h, 004h, 030h, 00eh, 013h, 010h, 010h, 01fh, 01dh, 00fh, 01ch, 00ah, 00ah, 00ah, 00ah
        db      000h, 000h, 000h, 000h, 004h, 000h, 000h, 000h, 000h, 000h, 03ch, 01eh, 063h, 01eh, 032h, 000h
        db      000h, 000h, 000h, 000h, 010h, 022h, 00ah, 01eh, 00fh, 017h, 01ah, 016h, 00bh, 01eh, 00fh, 00ah
        db      000h, 001h, 0d0h, 007h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 000h, 01ch, 0dbh, 032h, 028h
        db      0dbh, 032h, 022h, 000h, 005h, 000h, 005h, 000h, 000h, 000h, 000h, 000h, 002h, 00fh, 019h, 000h
        db      005h, 041h, 000h, 014h, 01eh, 001h, 000h, 000h, 005h, 000h, 000h, 005h, 063h, 000h, 0f4h, 0ffh
        db      000h, 000h, 000h, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 003h, 000h, 000h, 000h, 000h, 000h
        db      000h, 042h, 000h, 000h, 000h, 000h, 000h, 042h, 000h, 000h, 000h, 042h, 063h, 000h, 063h, 019h
        db      032h, 000h, 000h, 000h, 01ch, 00fh, 020h, 00ah, 01eh, 00fh, 017h, 01ah, 016h, 00bh, 01eh, 00fh
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 03ch, 01eh, 063h, 032h, 032h, 000h
        db      000h, 000h, 000h, 000h, 018h, 00bh, 017h, 00fh, 019h, 010h, 00fh, 010h, 010h, 00fh, 00dh, 01eh
        db      000h, 001h, 064h, 000h, 000h, 000h, 063h, 000h, 000h, 000h, 022h, 019h, 01ch, 000h, 032h, 02eh
        db      000h, 032h, 022h, 019h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 00ah, 032h, 032h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 004h, 01eh, 032h, 00eh, 01eh, 001h, 000h, 004h
        db      064h, 000h, 000h, 000h, 000h, 007h, 064h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 064h, 000h, 000h, 063h, 064h, 000h, 000h, 063h, 000h, 000h, 063h, 000h
        db      063h, 000h, 000h, 000h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch, 00fh, 020h, 00fh, 01ch, 00ch
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 002h, 050h, 03ch, 050h, 000h, 063h, 000h
        db      000h, 000h, 000h, 000h, 08ah
        db      "`8Mt1  Mt2  Mt3  Mt4 ", 0
        db      "Mall"
        db      0ffh, 08ah, 0d5h
        db      "8Mall"
        db      0ffh, 08ah, 0d8h
        db      "8ALL"
        db      0ffh, 000h, 000h, 000h, 010h, 000h, 001h, 000h, 010h, 008h, 010h, 000h, 000h, 000h, 0f0h, 080h
        elseif  (XL = 0) && (MODEL = 3000)
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 080h, 01eh, 070h, 032h
        else
        db      "RETLOO"
        dw      start, 0
        db      000h, 000h, 00fh, 010h, 010h, 00fh, 00dh, 01eh, 01dh, 00ah, 010h, 013h, 016h, 00fh, 006h, 0abh
        db      00fh, 029h, 00fh, 0b3h, 00eh, 034h, 00dh, 0c5h, 00ch, 02eh, 00ch, 058h, 002h, 009h, 002h, 0ddh
        db      001h, 0a1h, 001h, 000h, 000h, 0ffh, 007h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah
        db      070h, 00ah, 040h, 01eh, 0a0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0b3h
        db      009h, 093h, 00ah, 0f4h, 007h, 0e2h, 009h, 043h, 007h, 032h, 009h, 0e8h, 001h, 084h, 001h, 037h
        db      001h, 032h, 001h, 0ceh, 000h, 0d5h, 007h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah
        db      060h, 00ah, 040h, 01eh, 0a0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0cbh
        db      005h, 072h, 007h, 052h, 008h, 0d9h, 006h, 08dh, 004h, 000h, 004h, 0c5h, 001h, 0a1h, 001h, 096h
        db      001h, 084h, 001h, 081h, 000h, 00bh, 006h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah
        db      040h, 00ah, 060h, 01eh, 0a0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00bh
        db      004h, 0d0h, 003h, 072h, 003h, 020h, 003h, 0e5h, 002h, 0ceh, 002h, 090h, 001h, 072h, 001h, 03dh
        db      001h, 01ah, 001h, 081h, 000h, 037h, 007h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00fh
        db      030h, 00ah, 060h, 00fh, 0b0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0b3h
        db      009h, 093h, 00ah, 0f4h, 007h, 0e2h, 009h, 043h, 007h, 032h, 009h, 0e8h, 001h, 084h, 001h, 037h
        db      001h, 032h, 001h, 0cah, 007h, 005h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah
        db      080h, 01eh, 070h, 032h
        endif
        if      XL = 0
        dw      start, 0
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 0b3h, 009h, 032h, 009h, 0bch, 008h, 000h, 008h, 05bh
        db      007h, 0f1h, 006h, 026h, 003h, 0f7h, 002h, 0c8h, 002h, 093h, 002h, 004h, 004h, 063h, 000h, 000h
        endif
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        if      XL
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 008h
        db      010h, 000h, 001h, 000h, 010h, 010h, 010h, 000h, 000h, 000h, 0f0h, 080h
        db      20h dup (000h)
        db      010h, 000h, 001h, 000h, 010h, 008h, 010h, 000h, 000h, 000h, 0f0h, 080h, 000h, 000h, 000h, 000h
        db      000h, 088h, 013h, 01ah, 074h, 0ffh, 0ffh, 0ffh, 03fh, 047h, 001h, 0f0h, 07fh, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 008h, 010h, 000h, 001h, 000h
        db      010h, 010h, 010h, 000h, 000h, 000h, 0f0h, 080h, 000h, 000h, 000h, 000h, 000h, 088h, 013h, 01ah
        db      074h, 0ffh, 0ffh, 0ffh, 03fh, 047h, 001h, 0f0h, 07fh, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 01bh, 016h, 001h
        db      00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 02bh, 000h, 000h, 000h, 000h, 000h, 001h
        db      001h
        else
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 00fh, 060h, 028h, 080h, 00ah, 080h
        db      20ah dup (000h)
        db      020h, 028h, 016h, 019h, 018h, 011h, 00ah, 00fh, 00dh, 012h, 019h, 00ah, 001h, 008h, 001h, 063h
        db      0ceh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 068h, 001h, 068h, 001h, 068h, 001h, 000h, 000h, 032h, 032h, 032h, 0ceh, 000h, 000h, 000h
        db      016h, 019h, 018h, 011h, 00ah, 012h, 00bh, 016h, 016h, 00ah, 001h, 00ah, 001h, 000h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 030h, 000h, 000h, 027h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      062h, 025h, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      016h, 027h, 01ch, 027h, 017h, 013h, 00eh, 00ah, 01ch, 00fh, 01ah, 01eh, 001h, 008h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 068h, 001h, 068h, 001h, 068h, 001h, 000h, 000h, 032h, 0ceh, 032h, 000h, 00ah, 000h, 032h
        db      016h, 019h, 018h, 011h, 00ah, 012h, 00bh, 016h, 016h, 00ah, 002h, 00ah, 001h, 000h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 030h, 000h, 000h, 01eh, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      038h, 00bh, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01ah, 013h, 018h, 011h, 00ah, 01ah, 019h, 018h, 011h, 00ah, 00ah, 00ah, 001h, 008h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 068h, 001h, 000h, 000h, 068h, 001h, 000h, 000h, 04eh, 0ceh, 000h, 032h, 00ah, 000h, 04fh
        db      00ch, 01ch, 013h, 011h, 012h, 01eh, 00ah, 012h, 00bh, 016h, 016h, 001h, 001h, 001h, 001h, 063h
        db      0fch, 063h, 000h, 000h, 000h, 013h, 000h, 000h, 039h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      05dh, 00eh, 000h, 04ah, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01eh, 00bh, 01ah, 00fh, 00ah, 00fh, 00dh, 012h, 019h, 00ah, 001h, 00ah, 001h, 008h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 032h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 019h, 000h, 04bh, 000h, 064h, 000h, 000h, 000h, 057h, 0ech, 000h, 014h, 000h, 000h, 059h
        db      00ch, 01ch, 013h, 011h, 012h, 01eh, 00ah, 012h, 00bh, 016h, 016h, 002h, 001h, 001h, 001h, 063h
        db      0ffh, 063h, 000h, 000h, 000h, 013h, 000h, 000h, 039h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      05dh, 007h, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01eh, 00bh, 01ah, 00fh, 00ah, 00fh, 00dh, 012h, 019h, 00ah, 002h, 00ah, 001h, 008h, 001h, 063h
        db      0fdh, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 032h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 067h, 000h, 0bdh, 000h, 055h, 001h, 000h, 000h, 03ch, 0ech, 000h, 014h, 00ah, 000h, 03ch
        db      016h, 00bh, 01ch, 011h, 00fh, 00ah, 01ch, 019h, 019h, 017h, 00ah, 001h, 001h, 002h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 01fh, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00bh, 000h, 040h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      011h, 00bh, 016h, 016h, 019h, 01ah, 00ah, 00fh, 00dh, 012h, 019h, 00ah, 001h, 008h, 001h, 063h
        db      0f6h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0fah, 000h, 073h, 000h, 08eh, 000h, 000h, 000h, 050h, 0ceh, 000h, 032h, 00ah, 000h, 032h
        db      016h, 00bh, 01ch, 011h, 00fh, 00ah, 01ch, 019h, 019h, 017h, 00ah, 002h, 001h, 002h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 016h, 000h, 000h, 029h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      04eh, 008h, 000h, 011h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01dh, 01ah, 00bh, 00dh, 00fh, 023h, 00ah, 00fh, 00dh, 012h, 019h, 00ah, 001h, 008h, 001h, 063h
        db      0f6h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 068h, 001h, 064h, 000h, 0f1h, 000h, 000h, 000h, 050h, 0ech, 000h, 014h, 0b4h, 000h, 01eh
        db      01dh, 017h, 00bh, 016h, 016h, 00ah, 01ch, 019h, 019h, 017h, 00ah, 001h, 001h, 003h, 001h, 063h
        db      0f6h, 063h, 000h, 000h, 000h, 022h, 000h, 000h, 015h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      056h, 006h, 000h, 000h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01dh, 016h, 00bh, 01ah, 00ch, 00bh, 00dh, 015h, 00ah, 00ah, 00ah, 00ah, 001h, 008h, 001h, 063h
        db      0f6h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 000h, 000h, 064h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 050h
        db      01dh, 017h, 00bh, 016h, 016h, 00ah, 01ch, 019h, 019h, 017h, 00ah, 002h, 001h, 003h, 001h, 063h
        db      0fah, 063h, 000h, 000h, 000h, 004h, 000h, 000h, 023h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      04ah, 000h, 000h, 05eh, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      017h, 01fh, 016h, 01eh, 013h, 027h, 01dh, 016h, 00bh, 01ah, 00ah, 00ah, 001h, 008h, 001h, 063h
        db      0f6h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 022h, 000h, 028h, 000h, 050h, 000h, 00ah, 00ah, 00ah, 032h, 0ech, 0ech, 00ah, 000h, 051h
        db      01ah, 016h, 00bh, 01eh, 00fh, 00ah, 001h, 00ah, 00ah, 00ah, 00ah, 00ah, 001h, 004h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 004h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      031h, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01dh, 012h, 01fh, 010h, 010h, 016h, 00fh, 00ah, 00fh, 00dh, 012h, 019h, 001h, 008h, 001h, 063h
        db      0f6h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 068h, 001h, 068h, 001h, 068h, 001h, 000h, 000h, 03ch, 0ceh, 000h, 032h, 0b4h, 000h, 019h
        db      01ah, 016h, 00bh, 01eh, 00fh, 00ah, 002h, 00ah, 00ah, 00ah, 00ah, 00ah, 001h, 005h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 027h, 000h, 000h, 023h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      026h, 014h, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      017h, 013h, 016h, 00eh, 00ah, 00dh, 012h, 019h, 01ch, 01fh, 01dh, 001h, 001h, 006h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 030h, 000h, 000h, 063h, 000h, 032h, 0f4h, 001h, 0f4h, 001h, 00ah
        db      062h, 025h, 000h, 063h, 009h, 04dh, 000h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      010h, 016h, 01fh, 01eh, 01eh, 00fh, 01ch, 00ah, 012h, 00bh, 016h, 016h, 001h, 004h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 036h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      01dh, 00ah, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      017h, 013h, 016h, 00eh, 00ah, 00dh, 012h, 019h, 01ch, 01fh, 01dh, 002h, 001h, 006h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 030h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      038h, 00bh, 000h, 063h, 009h, 01ch, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      00dh, 00bh, 020h, 00fh, 01ch, 018h, 019h, 01fh, 01dh, 00ah, 00ah, 00ah, 001h, 000h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 073h, 000h, 000h, 023h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      05fh, 063h, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01ch, 013h, 00dh, 012h, 00ah, 00dh, 012h, 019h, 01ch, 01fh, 01dh, 001h, 001h, 006h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 013h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      05dh, 00eh, 000h, 04ah, 005h, 04eh, 00fh, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      011h, 023h, 017h, 018h, 00bh, 01dh, 013h, 01fh, 017h, 00ah, 00ah, 00ah, 001h, 001h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 007h, 000h, 000h, 046h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      016h, 002h, 000h, 03ch, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01ch, 013h, 00dh, 012h, 00ah, 00dh, 012h, 019h, 01ch, 01fh, 01dh, 002h, 001h, 006h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 013h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      05dh, 007h, 000h, 063h, 007h, 057h, 016h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01dh, 019h, 010h, 01eh, 00ah, 012h, 00bh, 016h, 016h, 00ah, 00ah, 00ah, 001h, 000h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 00eh, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      063h, 006h, 000h, 04bh, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01eh, 012h, 013h, 00dh, 015h, 00ah, 00dh, 012h, 019h, 01ch, 01fh, 01dh, 001h, 006h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 01fh, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      050h, 00bh, 000h, 040h, 003h, 063h, 041h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      021h, 00bh, 01ch, 00fh, 012h, 019h, 01fh, 01dh, 00fh, 00ah, 001h, 00ah, 001h, 002h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 053h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      055h, 063h, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      017h, 013h, 016h, 00eh, 00ah, 010h, 016h, 00bh, 018h, 011h, 00fh, 00ah, 001h, 006h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 016h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      04eh, 008h, 000h, 011h, 001h, 063h, 028h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      021h, 00bh, 01ch, 00fh, 012h, 019h, 01fh, 01dh, 00fh, 00ah, 002h, 00ah, 001h, 005h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 053h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      055h, 053h, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      00ch, 01fh, 00ch, 00ch, 016h, 00fh, 01dh, 00ah, 00ah, 00ah, 00ah, 00ah, 001h, 006h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 022h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      056h, 006h, 000h, 000h, 015h, 03fh, 02eh, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      00ch, 01ch, 013h, 011h, 012h, 01eh, 00ah, 01ah, 016h, 00bh, 01eh, 00fh, 001h, 005h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 01eh, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 001h, 000h, 063h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01dh, 016h, 019h, 021h, 00ah, 010h, 016h, 00bh, 018h, 011h, 00fh, 00ah, 001h, 006h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 004h, 000h, 000h, 023h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      04ah, 000h, 000h, 05eh, 001h, 03fh, 04ch, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      017h, 00fh, 01eh, 00bh, 016h, 00ah, 01ch, 019h, 019h, 017h, 00ah, 00ah, 001h, 003h, 001h, 063h
        db      0f8h, 063h, 000h, 000h, 000h, 05dh, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 000h, 000h, 020h, 00ah, 032h, 032h, 0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h
        db      01dh, 00dh, 013h, 010h, 013h, 00ah, 00dh, 012h, 019h, 01ch, 01fh, 01dh, 001h, 006h, 001h, 063h
        db      000h, 063h, 000h, 000h, 000h, 004h, 000h, 000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      031h, 00ah, 000h
        db      "cccK"
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01dh, 012h, 00bh, 010h, 01eh, 00ah, 001h
        db      00ah, 00ah, 00ah, 00ah, 00ah, 001h, 000h, 001h, 063h, 008h, 063h, 000h, 000h, 000h, 068h, 001h
        db      000h, 023h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 039h, 01fh, 000h, 063h, 00ah, 032h, 032h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 010h, 00bh, 01dh, 01eh, 00ah, 010h, 016h
        db      00bh, 018h, 011h, 00fh, 00ah, 001h, 006h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 027h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 026h, 014h, 000h, 063h, 01fh, 010h, 044h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01dh, 012h, 00bh, 010h, 01eh, 00ah, 002h
        db      00ah, 00ah, 00ah, 00ah, 00ah, 001h, 005h, 001h, 063h, 0ffh, 063h, 000h, 000h, 000h, 068h, 001h
        db      000h, 023h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 048h, 000h, 063h, 00ah, 032h, 032h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 017h, 013h, 016h, 00eh, 00ah, 00eh, 00fh
        db      01eh, 01fh, 018h, 00fh, 001h, 001h, 007h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 036h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 01dh, 00ah, 000h, 063h, 00ah, 032h, 032h
        db      0f3h, 0ffh, 00dh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 00dh, 00bh, 01eh, 012h, 00fh, 00eh, 01ch
        db      00bh, 016h, 00ah, 00ah, 00ah, 000h, 001h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 04bh, 000h
        db      000h, 020h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 040h, 043h, 000h, 00fh, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 017h, 013h, 016h, 00eh, 00ah, 00eh, 00fh
        db      01eh, 01fh, 018h, 00fh, 002h, 001h, 007h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 073h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 05fh, 063h, 000h, 063h, 00ah, 032h, 032h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01eh, 013h, 016h, 00fh, 00eh, 00ah, 01ch
        db      019h, 019h, 017h, 00ah, 00ah, 000h, 003h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 043h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 01dh, 043h, 000h, 01ah, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01eh, 012h, 013h, 00dh, 015h, 00ah, 00eh
        db      01eh, 01fh, 018h, 00fh, 001h, 001h, 007h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 007h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 016h, 002h, 000h, 03ch, 00ah, 032h, 032h
        db      0cch, 0ffh, 034h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 017h, 00fh, 01eh, 00bh, 016h, 00ah, 01dh
        db      016h, 00bh, 01ah, 00ah, 00ah, 000h, 003h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 068h, 001h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00dh, 045h, 000h, 011h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01eh, 012h, 013h, 00dh, 015h, 00ah, 00eh
        db      01eh, 01fh, 018h, 00fh, 002h, 001h, 007h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 063h, 006h, 000h, 04bh, 00ah, 032h, 032h
        db      0bfh, 0ffh, 041h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 020h, 019h, 00dh, 00bh, 016h, 00ah, 01ah
        db      016h, 00bh, 01eh, 00fh, 00ah, 000h, 005h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 00ah, 000h
        db      000h, 01bh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 010h, 032h, 000h, 03dh, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 017h, 00bh, 014h, 019h, 01ch, 00ah, 00dh
        db      012h, 019h, 01ch, 00eh, 00ah, 001h, 007h, 001h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 055h, 063h, 000h, 063h, 00ah, 032h, 032h
        db      0fdh, 003h, 000h, 007h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 00ch, 019h, 022h, 00fh, 00eh, 00ah, 013h
        db      018h, 00ah, 00ah, 00ah, 00ah, 000h, 003h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 056h, 000h
        db      000h, 02ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 002h, 034h, 000h, 031h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 017h, 013h, 018h, 019h, 01ch, 00ah, 00dh
        db      012h, 019h, 01ch, 00eh, 00ah, 001h, 007h, 001h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 055h, 063h, 000h, 063h, 00ah, 032h, 032h
        db      000h, 003h, 000h, 007h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01dh, 018h, 00bh, 01ch, 00fh, 00ah, 01ah
        db      016h, 00bh, 01eh, 00fh, 00ah, 000h, 005h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 028h, 000h
        db      000h, 039h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0deh, 023h, 000h, 010h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 019h, 00dh, 01eh, 00bh, 020h, 00fh, 01dh
        db      01ah, 016h, 013h, 01eh, 001h, 001h, 007h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 01eh, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 001h, 000h, 063h, 00ah, 032h, 032h
        db      0f1h, 00bh, 000h, 00ch, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01dh, 01eh, 019h, 018h, 00fh, 00ah, 00dh
        db      00bh, 020h, 00fh, 00ah, 00ah, 000h, 005h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 0b3h, 000h
        db      000h, 034h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 00ah, 05bh, 000h, 02eh, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 019h, 00dh, 01eh, 00bh, 020h, 00fh, 01dh
        db      01ah, 016h, 013h, 01eh, 002h, 001h, 007h, 001h, 063h, 000h, 000h, 000h, 000h, 000h, 05dh, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 020h, 00ah, 032h, 032h
        db      0e1h, 0f3h, 003h, 00ch, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 013h, 011h, 012h, 01eh, 00ah, 00dh
        db      016h, 01fh, 00ch, 00ah, 00ah, 000h, 002h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 00ch, 000h
        db      000h, 02bh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 063h, 039h, 000h, 04bh, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01dh, 01ah, 013h, 01ch, 00bh, 016h, 00ah
        db      001h, 00ah, 00ah, 00ah, 00ah, 001h, 007h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 068h, 001h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 039h, 01fh, 000h, 063h, 00ah, 032h, 032h
        db      000h, 004h, 003h, 00ch, 05bh, 05bh, 032h, 000h, 032h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 00dh, 019h, 01ch, 01ch, 013h, 00eh, 019h
        db      01ch, 00ah, 00ah, 00ah, 00ah, 000h, 001h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 00ah, 000h
        db      000h, 00dh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 041h, 046h, 000h, 037h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01dh, 01ah, 013h, 01ch, 00bh, 016h, 00ah
        db      01eh, 00bh, 01ah, 00ah, 00ah, 001h, 007h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 068h, 001h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 006h, 048h, 000h, 063h, 00ah, 032h, 032h
        db      000h, 0fch, 003h, 00ch, 063h, 063h, 0b4h, 000h, 0b4h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 00bh, 017h, 00ch, 013h, 00fh, 018h, 00dh
        db      00fh, 00ah, 00ah, 00ah, 00ah, 000h, 001h, 001h, 063h, 000h, 014h, 000h, 000h, 000h, 00ah, 000h
        db      000h, 004h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 060h, 038h, 000h, 038h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 001h, 00ah, 01dh, 00fh, 00dh, 019h, 018h
        db      00eh, 00ah, 00eh, 00fh, 016h, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 02ch, 0e7h, 003h, 000h, 000h, 000h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 007h, 005h, 000h, 017h, 01dh, 00ah, 00eh
        db      00fh, 016h, 00bh, 023h, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 02ch, 0eeh, 002h, 000h, 000h, 000h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 005h, 000h, 000h, 017h, 01dh, 00ah, 00eh
        db      00fh, 016h, 00bh, 023h, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 02ch, 0f4h, 001h, 000h, 000h, 000h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 002h, 005h, 000h, 017h, 01dh, 00ah, 00eh
        db      00fh, 016h, 00bh, 023h, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 02ch, 0fah, 000h, 000h, 000h, 000h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01ch, 019h, 00dh, 015h, 00ah, 018h, 00ah
        db      01ch, 019h, 016h, 016h, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 04bh, 000h, 032h, 064h, 000h, 000h, 000h, 000h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 00ch, 00bh, 01eh, 012h, 01ch, 019h, 019h
        db      017h, 00ah, 00ah, 00ah, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 04dh, 000h, 037h, 032h, 000h, 000h, 000h, 000h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01eh, 00bh, 01ah, 00fh, 00ah, 016h, 019h
        db      019h, 01ah, 00ah, 00ah, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 063h, 0e7h, 003h, 000h, 000h, 000h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 017h, 01fh, 01eh, 00fh, 00eh, 00ah, 00eh
        db      00fh, 016h, 00bh, 023h, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 02ch, 000h, 037h, 0f4h, 001h, 000h, 000h, 000h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 00bh, 017h, 00ch, 013h, 00fh, 018h, 01eh
        db      00ah, 00eh, 00fh, 016h, 023h, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 012h, 000h, 058h, 0e7h, 003h, 000h, 000h, 000h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01dh, 016h, 019h, 021h, 00ah, 010h, 016h
        db      00bh, 018h, 011h, 00fh, 001h, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 053h, 00ah, 000h, 004h, 000h, 00ah, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01dh, 016h, 019h, 021h, 00ah, 010h, 016h
        db      00bh, 018h, 011h, 00fh, 002h, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 05ah, 002h, 000h, 022h, 000h, 001h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01eh, 012h, 013h, 015h, 00ah, 010h, 016h
        db      00bh, 018h, 011h, 00fh, 001h, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 059h, 000h, 04fh, 019h, 000h, 014h, 000h, 008h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01eh, 012h, 013h, 015h, 00ah, 010h, 016h
        db      00bh, 018h, 011h, 00fh, 002h, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 032h, 000h, 059h, 005h, 000h, 002h, 000h, 008h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01eh, 012h, 013h, 015h, 00ah, 010h, 016h
        db      00bh, 018h, 011h, 00fh, 003h, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 05ch, 003h, 000h, 005h, 000h, 009h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 00dh, 012h, 019h, 01ch, 01fh, 01dh, 00ah
        db      001h, 00ah, 00ah, 00ah, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 012h, 003h, 000h, 003h, 000h, 063h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 00dh, 012h, 019h, 01ch, 01fh, 01dh, 00ah
        db      002h, 00ah, 00ah, 00ah, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 02fh, 00ah, 000h, 005h, 000h, 021h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 00dh, 012h, 019h, 01ch, 01fh, 01dh, 00ah
        db      003h, 00ah, 00ah, 00ah, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 02dh, 002h, 000h, 002h, 000h, 063h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 01dh, 023h, 018h, 00dh, 00ah, 01dh, 021h
        db      00fh, 00fh, 01ah, 00ah, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 05bh, 002h, 000h, 001h, 000h, 001h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 00ch, 00fh, 018h, 00eh, 00ah, 00fh, 00dh
        db      012h, 019h, 00ah, 00ah, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 046h, 0f4h, 001h, 00ah, 000h, 010h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 019h, 01fh, 01eh, 01ch, 00bh, 011h, 00fh
        db      019h, 01fh, 01dh, 00ah, 00ah, 001h, 009h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 030h, 000h
        db      000h, 063h, 000h, 059h, 0fah, 000h, 020h, 003h, 019h, 062h, 025h, 000h, 063h, 009h, 04dh, 000h
        db      0e6h, 0ffh, 01ah, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 000h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 00fh
        db      010h, 010h, 00fh, 00dh, 01eh, 000h, 008h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 018h, 00bh, 017h, 00fh, 019h, 010h, 01ch
        db      00fh, 020h, 00fh, 01ch, 00ch, 000h, 008h, 001h, 063h, 000h, 063h, 000h, 000h, 000h, 000h, 000h
        db      000h, 063h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 028h, 028h, 000h, 046h, 00ah, 032h, 032h
        db      000h, 004h, 000h, 007h, 000h, 000h, 064h, 000h, 064h, 000h, 0c8h, 000h, 0c8h, 000h, 0c8h, 000h
        db      000h, 000h, 000h, 000h, 000h, 000h, 00ah, 000h, 032h, 000h, 000h, 000h, 01bh, 016h, 001h, 00ah
        db      00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 02bh, 000h, 000h, 000h, 000h, 000h, 001h, 001h
        endif
        db      69h dup (000h)
        db      00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 00ah, 000h, 000h, 000h, 000h
        if      (XL = 0) && (MODEL = 3200)
        phase   0
        endif
        if      (XL = 0) || (MODEL = 3000)
        db      000h, 001h, 03ch, 07fh, 000h, 032h, 000h, 000h, 00ah, 000h, 032h
        endif
        if      (XL) && (MODEL = 3000) && (FW_VERSION >= 200)
        db      795h dup (000h)
        elseif  (XL) && (FW_VERSION = 150)
        db      8a5h dup (000h)
        elseif  (XL) && (MODEL = 3200)
        db      000h, 001h, 03ch, 07fh, 000h, 032h, 000h, 000h, 00ah, 000h, 032h, 000h, 000h, 000h, 000h, 000h
        elseif  (XL) && (FW_VERSION < 150)
        db      2f05h dup (000h)
        elseif  (XL = 0) && (FW_VERSION >= 200)
        db      8000h dup (000h)
        db      2d15h dup (000h)
        elseif  (XL = 0) && (FW_VERSION = 150)
        db      9e5h dup (000h)
        else
        db      45c5h dup (000h)
        endif
        phase   0
reset:
        jmpf    SEG_BOOT + 0c000h:boot
far_3fff5:
        jmpf    SEG_BOOT + 0c000h:far_242df
        db      000h, 000h, 000h, 000h, 000h, 000h
