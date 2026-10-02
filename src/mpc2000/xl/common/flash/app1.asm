; app1 -- MPC2000XL flash: disk, F-ROM; its own part under APP1_SEG.
; v1.20 0x0a9aa-0x0f68c (19682 bytes), v1.14 0x0a9a6-0x0f598 (19442 bytes),
; v1.12 0x0a868-0x0f45a (19442 bytes), v1.11 0x0a812-0x0f402 (19440 bytes),
; v1.10 0x0a812-0x0f3f6 (19428 bytes), v1.07 0x0a7e0-0x0f19a (18874 bytes).
; FAT12/16 on floppy (uPD765 at 20h/22h), SCSI, F-ROM; ATA/CF is ata.asm
        if      FW_VERSION < 120
        ifdef   XL_FOR_2K
        fatal   "XL_FOR_2K: this version has no cave for the wheel decoder and key gate"
        endif
        endif
; app1 keeps its stock offsets under APP1_SEG: stock put it in segment 0, and
; growth ahead of it moves the segment instead.
APP1_CSBASE set     APP1_SEG*16-SEGBASE
; a near call into app0 stays in APP1_SEG's 64K while the callee sits at or
; above APP1_SEG*16: growth between them may move app1 no further than that.
APP0_NEAR       macro   target
        if      APP0_BASE+(target) < APP1_SEG*16
        error   "app1: a near call into app0 falls below APP1_SEG"
        endif
        call    APP0_BASE+(target)-SEGBASE
        endm

xl_floppy_service:
        sti
        push    ds
        mov     bp, 0f000h
        mov     ds, bp
        mov     word ptr [0a000h], sp
        pusha
        call    fn_0BAEB
        popa
        mov     bp, TBL_DISK_SERVICE-APP1_CSBASE
        cmp     byte ptr [0a094h], 0
        je      isr_0A9C7
        mov     bp, TBL_DISK_SERVICE_ALT-APP1_CSBASE
isr_0A9C7:
        sub     bh, bh
        shl     bx, 1
        add     bx, bp
        call    word ptr cs:[bx]
isr_0A9D0:
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
loop_0A9DC:
        mov     al, 9
        jmp     br_0A9EC
loop_0A9E0:
        mov     al, 5
        jmp     br_0A9EC
loop_0A9E4:
        mov     al, 18h
        jmp     br_0A9EC
loop_0A9E8:
        mov     al, 1eh
        jmp     br_0A9EC
br_0A9EC:
        cli
        mov     sp, word ptr [0a000h]
        stc
        jmp     isr_0A9D0
TBL_DISK_SERVICE:
        dw      fn_0AA8D-APP1_CSBASE, fn_0AAC4-APP1_CSBASE, tgt_0AA3B-APP1_CSBASE, fn_0AEF8-APP1_CSBASE
        dw      tgt_0B0BC-APP1_CSBASE, tgt_0B135-APP1_CSBASE, tgt_0B169-APP1_CSBASE, tgt_0B308-APP1_CSBASE
        dw      tgt_0B3EE-APP1_CSBASE, tgt_0B414-APP1_CSBASE, tgt_0B581-APP1_CSBASE, tgt_0B485-APP1_CSBASE
        dw      tgt_0B8C0-APP1_CSBASE, fn_0B666-APP1_CSBASE, L_0B023-APP1_CSBASE, tgt_0AA3B-APP1_CSBASE
        dw      tgt_0BB0B-APP1_CSBASE, fn_0B6EE-APP1_CSBASE, tgt_0AA3B-APP1_CSBASE, fn_0B1CF-APP1_CSBASE
        dw      tgt_0B05D-APP1_CSBASE, tgt_0B603-APP1_CSBASE, tgt_0AF2A-APP1_CSBASE, tgt_0AA3B-APP1_CSBASE
        dw      tgt_0B8AC-APP1_CSBASE, tgt_0B974-APP1_CSBASE, tgt_0AA34-APP1_CSBASE, tgt_0B075-APP1_CSBASE
        dw      tgt_0AA3B-APP1_CSBASE, tgt_0AA3B-APP1_CSBASE, tgt_0AA38-APP1_CSBASE, loop_0B235-APP1_CSBASE
tgt_0AA34:
        sub     ax, ax
        stc
        ret
tgt_0AA38:
        sub     ax, ax
        ret
tgt_0AA3B:
        sub     bx, bp
        shr     bx, 1
        mov     ax, 23h
        stc
        ret
TBL_DISK_SERVICE_ALT:
        dw      fn_0AA8D-APP1_CSBASE, fn_0AAC4-APP1_CSBASE, tgt_0AA84-APP1_CSBASE, tgt_0BBBB-APP1_CSBASE
        dw      tgt_0BCB0-APP1_CSBASE, tgt_0BCE8-APP1_CSBASE, tgt_0BD1C-APP1_CSBASE, tgt_0AA84-APP1_CSBASE
        dw      tgt_0AA84-APP1_CSBASE, tgt_0AA84-APP1_CSBASE, tgt_0AA84-APP1_CSBASE, tgt_0AA84-APP1_CSBASE
        dw      tgt_0B8C0-APP1_CSBASE, tgt_0AA84-APP1_CSBASE, L_0BC8E-APP1_CSBASE, fn_0BAEB-APP1_CSBASE
        dw      tgt_0BB0B-APP1_CSBASE, fn_0B6EE-APP1_CSBASE, tgt_0AA84-APP1_CSBASE, tgt_0AA84-APP1_CSBASE
        dw      tgt_0AA84-APP1_CSBASE, tgt_0AA84-APP1_CSBASE, loop_0BC4C-APP1_CSBASE, tgt_0AA84-APP1_CSBASE
        dw      tgt_0B8AC-APP1_CSBASE, tgt_0B974-APP1_CSBASE, tgt_0AA34-APP1_CSBASE, tgt_0AA84-APP1_CSBASE
        dw      tgt_0AA84-APP1_CSBASE, tgt_0AA84-APP1_CSBASE, tgt_0AA84-APP1_CSBASE, tgt_0AA84-APP1_CSBASE
tgt_0AA84:
        sub     ax, ax
        mov     bx, ax
        mov     cx, ax
        mov     dx, ax
        ret
fn_0AA8D:
        mov     al, 36h
        out     20h, al
        mov     ax, ds
        mov     es, ax
        mov     di, 0a002h
        mov     cx, 92h
        sub     ax, ax
        rep stosw
        mov     byte ptr [0a10dh], 3
        mov     byte ptr [0a10eh], 3
        mov     byte ptr [0a10fh], 0c4h
        mov     byte ptr [0a110h], 14h
        call    fn_0BA7D
        mov     ah, 4bh
        call    fn_0BAA8
        mov     byte ptr [0a095h], 0
        call    fn_0BB64
        ret
fn_0AAC4:
        call    fn_0AA8D
        call    fn_0BAEB
        call    fn_0B722
        jae     br_0AAD0
        ret
br_0AAD0:
        mov     al, 3
        call    fn_0B74B
        jae     br_0AAD8
        ret
br_0AAD8:
        call    fn_0B6EE
        mov     al, 1
        mov     ah, 0
        jb      br_0AB10
        call    fn_0AB12
        je      br_0AB05
        call    fn_0ABCA
        je      br_0AB05
        call    fn_0AC82
        je      br_0AB05
        call    fn_0AD1B
        je      br_0AB05
        call    fn_0AE39
        je      br_0AB05
        call    fn_0ADB0
        je      br_0AB05
        mov     al, 1
        mov     ah, 1
        sub     cx, cx
br_0AB05:
        sub     dx, dx
        sub     di, di
        mov     si, 0a0e5h
        push    ds
        pop     es
        sub     bx, bx
br_0AB10:
        clc
        ret
fn_0AB12:
        mov     byte ptr [0a113h], 2
        mov     byte ptr [0a114h], 12h
        mov     byte ptr [0a115h], 1bh
        mov     byte ptr [0a116h], 0ffh
        mov     word ptr [A1_W_0A0A2], 200h
        mov     word ptr [A1_W_0A09E], 1200h
        mov     word ptr [A1_W_0A0A0], 0b1fh
        mov     word ptr [A1_W_0A0AE], 21h
        mov     word ptr [A1_W_0A0B0], 1
        mov     word ptr [0a0b2h], 200h
        mov     word ptr [A1_W_0A0A6], 2600h
        mov     word ptr [A1_W_0A0A8], 0e0h
        mov     byte ptr [0a093h], 1
        mov     byte ptr [0a094h], 0
        mov     byte ptr [0a11ah], 2
        mov     byte ptr [0a11bh], 12h
        mov     byte ptr [0a11ch], 54h
        mov     byte ptr [0a11dh], 0f6h
        mov     ah, 4fh
        call    fn_0BAA8
        mov     ah, 4bh
        call    fn_0BAA8
        call    fn_0AEC2
        je      br_0AB84
        ret
br_0AB84:
        mov     di, P_B9C1
        mov     si, 0
resume_0AB8A:
        mov     bx, cs
        mov     es, bx
        mov     cx, 1ch
        repe cmpsb
        mov     al, 2
        mov     ah, 0bh
        je      br_0ABBB
        mov     di, P_BA31
        mov     si, 0
        mov     bx, cs
        mov     es, bx
        mov     cx, 1ch
        repe cmpsb
        mov     al, 2
        mov     ah, 0ah
        je      br_0ABBB
        mov     di, P_B9CC
        call    fn_0AEEB
        je      br_0ABB7
        ret
br_0ABB7:
        mov     al, 2
        mov     ah, 2
br_0ABBB:
        push    ax
        call    fn_0AFEA
        call    fn_0B666
        mov     cx, ax
        pop     ax
        sub     dx, dx
        sub     bx, bx
        ret
fn_0ABCA:
        mov     byte ptr [0a113h], 2
        mov     byte ptr [0a114h], 9
        mov     byte ptr [0a115h], 1bh
        mov     byte ptr [0a116h], 0ffh
        mov     word ptr [A1_W_0A0A2], 200h
        mov     word ptr [A1_W_0A09E], 600h
        mov     word ptr [A1_W_0A0A0], 2c9h
        mov     word ptr [A1_W_0A0AE], 0eh
        mov     word ptr [A1_W_0A0B0], 2
        mov     word ptr [0a0b2h], 200h
        mov     word ptr [A1_W_0A0A6], 0e00h
        mov     word ptr [A1_W_0A0A8], 70h
        mov     byte ptr [0a093h], 0
        mov     byte ptr [0a094h], 0
        mov     byte ptr [0a11ah], 2
        mov     byte ptr [0a11bh], 9
        mov     byte ptr [0a11ch], 54h
        mov     byte ptr [0a11dh], 0e5h
        mov     ah, 4fh
        call    fn_0BAA8
        mov     ah, 0bh
        call    fn_0BAA8
        call    fn_0AEC2
        je      br_0AC3C
        ret
br_0AC3C:
        mov     di, P_B9DD
        mov     si, 0
        mov     bx, cs
        mov     es, bx
        mov     cx, 1ch
        repe cmpsb
        mov     al, 3
        mov     ah, 0bh
        je      br_0AC73
        mov     di, P_BA31
        mov     si, 0
        mov     bx, cs
        mov     es, bx
        mov     cx, 0bh
        repe cmpsb
        mov     al, 3
        mov     ah, 0ah
        je      br_0AC73
        mov     di, P_B9E8
        call    fn_0AEEB
        je      br_0AC6F
        ret
br_0AC6F:
        mov     al, 3
        mov     ah, 3
br_0AC73:
        push    ax
        call    fn_0AFEA
        call    fn_0B666
        mov     cx, ax
        pop     ax
        sub     dx, dx
        sub     bx, bx
        ret
fn_0AC82:
        mov     byte ptr [0a113h], 3
        mov     byte ptr [0a114h], 0ah
        mov     byte ptr [0a115h], 35h
        mov     byte ptr [0a116h], 0ffh
        mov     word ptr [A1_W_0A0A2], 600h
        mov     word ptr [A1_W_0A09E], 0c80h
        mov     word ptr [A1_W_0A0A0], 62fh
        mov     word ptr [A1_W_0A0AE], 11h
        mov     word ptr [A1_W_0A0B0], 1
        mov     word ptr [0a0b2h], 400h
        mov     word ptr [A1_W_0A0A6], 1400h
        mov     word ptr [A1_W_0A0A8], 200h
        mov     byte ptr [0a093h], 1
        mov     byte ptr [0a094h], 1
        mov     byte ptr [0a11ah], 3
        mov     byte ptr [0a11bh], 0ah
        mov     byte ptr [0a11ch], 90h
        mov     byte ptr [0a11dh], 0f6h
        mov     ah, 5fh
        call    fn_0BAA8
        mov     ah, 4bh
        call    fn_0BAA8
        call    fn_0AEC2
        je      br_0ACF4
        ret
br_0ACF4:
        sub     cx, cx
        sub     dx, dx
        sub     bx, bx
        cmp     byte ptr [10h], 0ffh
        mov     al, 2
        mov     ah, 5
        jne     br_0AD06
        ret
br_0AD06:
        mov     word ptr [A1_W_0A0A6], 0
        mov     word ptr [A1_W_0A0A8], 40h
        mov     al, 2
        mov     ah, 6
        sub     dx, dx
        sub     bx, bx
        ret
fn_0AD1B:
        mov     byte ptr [0a113h], 3
        mov     byte ptr [0a114h], 5
        mov     byte ptr [0a115h], 35h
        mov     byte ptr [0a116h], 0ffh
        mov     word ptr [A1_W_0A0A2], 600h
        mov     word ptr [A1_W_0A09E], 640h
        mov     word ptr [A1_W_0A0A0], 30fh
        mov     word ptr [A1_W_0A0AE], 11h
        mov     word ptr [A1_W_0A0B0], 1
        mov     word ptr [0a0b2h], 400h
        mov     word ptr [A1_W_0A0A6], 1400h
        mov     word ptr [A1_W_0A0A8], 200h
        mov     byte ptr [0a093h], 0
        mov     byte ptr [0a094h], 1
        mov     byte ptr [0a11ah], 3
        mov     byte ptr [0a11bh], 5
        mov     byte ptr [0a11ch], 90h
        mov     byte ptr [0a11dh], 0e5h
        mov     ah, 4fh
        call    fn_0BAA8
        mov     ah, 0bh
        call    fn_0BAA8
        call    fn_0AEC2
        je      br_0AD8D
        ret
br_0AD8D:
        sub     cx, cx
        sub     dx, dx
        sub     bx, bx
        cmp     byte ptr [10h], 0ffh
        mov     al, 3
        mov     ah, 5
        jne     br_0AD9F
        ret
br_0AD9F:
        mov     word ptr [A1_W_0A0A6], 0
        mov     word ptr [A1_W_0A0A8], 40h
        mov     al, 3
        mov     ah, 6
        ret
fn_0ADB0:
        mov     byte ptr [0a113h], 2
        mov     byte ptr [0a114h], 8
        mov     byte ptr [0a115h], 1bh
        mov     byte ptr [0a116h], 0ffh
        mov     word ptr [A1_W_0A0A2], 200h
        mov     word ptr [A1_W_0A09E], 600h
        mov     word ptr [A1_W_0A0A0], 27ah
        mov     word ptr [A1_W_0A0AE], 0ch
        mov     word ptr [A1_W_0A0B0], 2
        mov     word ptr [0a0b2h], 200h
        mov     word ptr [A1_W_0A0A6], 0a00h
        mov     word ptr [A1_W_0A0A8], 70h
        mov     byte ptr [0a093h], 0
        mov     byte ptr [0a094h], 0
        mov     byte ptr [0a11ah], 2
        mov     byte ptr [0a11bh], 8
        mov     byte ptr [0a11ch], 54h
        mov     byte ptr [0a11dh], 0e5h
        mov     ah, 4fh
        call    fn_0BAA8
        mov     ah, 0bh
        call    fn_0BAA8
        call    fn_0AEC2
        je      br_0AE22
        ret
br_0AE22:
        mov     di, P_BA04
        call    fn_0AEEB
        je      br_0AE2B
        ret
br_0AE2B:
        call    fn_0AFEA
        mov     al, 3
        mov     ah, 7
        sub     cx, cx
        sub     dx, dx
        sub     bx, bx
        ret
fn_0AE39:
        mov     byte ptr [0a113h], 2
        mov     byte ptr [0a114h], 0ah
        mov     byte ptr [0a115h], 1bh
        mov     byte ptr [0a116h], 0ffh
        mov     word ptr [A1_W_0A0A2], 200h
        mov     word ptr [A1_W_0A09E], 600h
        mov     word ptr [A1_W_0A0A0], 319h
        mov     word ptr [A1_W_0A0AE], 0eh
        mov     word ptr [A1_W_0A0B0], 2
        mov     word ptr [0a0b2h], 200h
        mov     word ptr [A1_W_0A0A6], 0e00h
        mov     word ptr [A1_W_0A0A8], 70h
        mov     byte ptr [0a093h], 0
        mov     byte ptr [0a094h], 0
        mov     byte ptr [0a11ah], 2
        mov     byte ptr [0a11bh], 0ah
        mov     byte ptr [0a11ch], 54h
        mov     byte ptr [0a11dh], 0e5h
        mov     ah, 4fh
        call    fn_0BAA8
        mov     ah, 0bh
        call    fn_0BAA8
        call    fn_0AEC2
        je      br_0AEAB
        ret
br_0AEAB:
        mov     di, P_BA20
        call    fn_0AEEB
        je      br_0AEB4
        ret
br_0AEB4:
        call    fn_0AFEA
        mov     al, 3
        mov     ah, 4
        sub     cx, cx
        sub     dx, dx
        sub     bx, bx
        ret
fn_0AEC2:
        mov     ax, 0
        call    fn_0B2D9
        mov     ch, byte ptr [0a114h]
        add     ch, ch
        cmp     byte ptr [0a113h], 3
        jne     br_0AED7
        shl     ch, 1
br_0AED7:
        sub     cl, cl
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        mov     si, 5000h
        rep movsw
        and     byte ptr [0a11fh], 0c0h
        ret
fn_0AEEB:
        mov     si, 0bh
        mov     bx, cs
        mov     es, bx
        mov     cx, 11h
        repe cmpsb
        ret
fn_0AEF8:
        call    fn_0BC77
        cmp     ax, word ptr [A1_W_0A0A8]
        jae     loop_0AF24
        mov     si, ax
        shl     si, 5
        add     si, word ptr [A1_W_0A0A6]
        cmp     byte ptr [si], 0
        je      loop_0AF24
        push    ax
        call    fn_0AF4D
        pop     ax
        jae     loop_0AF19
        inc     ax
        jmp     fn_0AEF8
loop_0AF19:
        push    ax
        mov     word ptr [0a0a4h], si
        call    fn_0AF69
        pop     ax
        clc
        ret
loop_0AF24:
        sub     bx, bx
        sub     dx, dx
        stc
        ret
tgt_0AF2A:
        cmp     ax, word ptr [A1_W_0A0A8]
        jae     br_0AF48
loop_0AF30:
        mov     si, ax
        shl     si, 5
        add     si, word ptr [A1_W_0A0A6]
        push    ax
        call    fn_0AF4D
        pop     ax
        jae     loop_0AF19
        cmp     ax, 0
        je      loop_0AF24
        dec     ax
        jmp     loop_0AF30
br_0AF48:
        mov     ax, word ptr [A1_W_0A0A8]
        jmp     loop_0AF24
fn_0AF4D:
        mov     al, byte ptr [si]
        cmp     al, 0
        je      br_0AF67
        cmp     al, 0e5h
        je      br_0AF67
        cmp     al, 5
        je      br_0AF67
        cmp     al, 2eh
        je      br_0AF67
        test    byte ptr [si+0bh], 0eh
        jne     br_0AF67
        clc
        ret
br_0AF67:
        stc
        ret
fn_0AF69:
        mov     di, 0a0d0h
        mov     ax, ds
        mov     es, ax
        push    di
        push    di
        mov     cx, 14h
        mov     al, 20h
        rep stosb
        pop     di
        mov     dx, si
        mov     bx, di
        mov     cx, 8
        rep movsb
        add     si, 4
        call    fn_0AFAC
        jb      br_0AF90
        mov     cx, 8
        rep movsb
br_0AF90:
        mov     si, dx
        mov     di, bx
        add     si, 8
        add     di, 10h
        mov     al, 2eh
        stosb
        mov     cx, 3
        rep movsb
        mov     si, dx
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        pop     si
        ret
fn_0AFAC:
        push    si
        push    cx
        mov     cx, 8
tgt_0AFB1:
        cmp     byte ptr [si], 20h
        jb      br_0AFC2
        cmp     byte ptr [si], 7eh
        jae     br_0AFC2
        inc     si
        loop    tgt_0AFB1
        pop     cx
        pop     si
        clc
        ret
br_0AFC2:
        pop     cx
        pop     si
        stc
        ret
fn_0AFC6:
        mov     cx, word ptr [A1_W_0A0A8]
        mov     di, word ptr [A1_W_0A0A6]
tgt_0AFCE:
        mov     al, byte ptr [di]
        mov     word ptr [0a0a4h], si
        cmp     al, 0
        jne     br_0AFD9
        ret
br_0AFD9:
        cmp     al, 5
        jne     br_0AFDE
        ret
br_0AFDE:
        cmp     al, 0e5h
        jne     br_0AFE3
        ret
br_0AFE3:
        add     di, 20h
        loop    tgt_0AFCE
        stc
        ret
fn_0AFEA:
        mov     ax, ds
        mov     es, ax
        mov     di, word ptr [A1_W_0A0A6]
        mov     si, di
loop_0AFF4:
        call    fn_0AF4D
        jb      br_0B000
        mov     cx, 10h
        rep movsw
        jmp     loop_0AFF4
br_0B000:
        cmp     al, 0
        je      br_0B009
        add     si, 20h
        jmp     loop_0AFF4
br_0B009:
        mov     cx, word ptr [A1_W_0A0A8]
        shl     cx, 5
        add     cx, word ptr [A1_W_0A0A6]
        sub     cx, di
        jne     br_0B019
        ret
br_0B019:
        jae     br_0B01C
        ret
br_0B01C:
        shr     cx, 1
        sub     ax, ax
        rep stosw
        ret
L_0B023:
        mov     dx, 0ffffh
        mov     bp, si
loop_0B028:
        inc     dx
        push    es
        push    bp
        push    dx
        push    es
        mov     ax, dx
        call    fn_0AEF8
        pop     es
        pop     dx
        pop     bp
        pop     es
        mov     ax, 8
        jae     br_0B03C
        ret
br_0B03C:
        mov     cx, 14h
        mov     si, bp
        mov     di, 0a0d0h
tgt_0B044:
        mov     al, byte ptr es:[si]
        cmp     al, 61h
        jb      br_0B051
        cmp     al, 7bh
        jae     br_0B051
        sub     al, 20h
br_0B051:
        cmp     al, byte ptr [di]
        jne     loop_0B028
        inc     si
        inc     di
        loop    tgt_0B044
        sub     ax, ax
        clc
        ret
tgt_0B05D:
        call    L_0B023
        jae     br_0B063
        ret
br_0B063:
        mov     si, word ptr [0a0a4h]
        mov     byte ptr [si], 0e5h
        mov     ax, word ptr [si+1ah]
        call    fn_0B6A3
        call    fn_0B5E5
        clc
        ret
tgt_0B075:
        mov     si, word ptr [A1_W_0A0A6]
        mov     bx, 0
loop_0B07C:
        cmp     byte ptr [si], 0
        je      br_0B0B7
        cmp     byte ptr [si+0bh], 10h
        je      br_0B0AD
        pusha
        call    fn_0AF4D
        popa
        jb      br_0B0AD
        cmp     cl, 2ah
        je      br_0B0A2
        cmp     cl, byte ptr [si+8]
        jne     br_0B0AD
        cmp     ch, byte ptr [si+9]
        jne     br_0B0AD
        cmp     dl, byte ptr [si+0ah]
        jne     br_0B0AD
br_0B0A2:
        pusha
        mov     byte ptr [si], 0e5h
        mov     ax, word ptr [si+1ah]
        call    fn_0B6A3
        popa
br_0B0AD:
        add     si, 20h
        inc     bx
        cmp     bx, word ptr [A1_W_0A0A8]
        jb      loop_0B07C
br_0B0B7:
        call    fn_0B5E5
        clc
        ret
tgt_0B0BC:
        pusha
        call    fn_0B6EE
        popa
        jae     loop_0B0C5
        jmp     br_0B0FA
loop_0B0C5:
        call    L_0B023
        jae     br_0B0CB
        ret
br_0B0CB:
        mov     si, word ptr [0a0a4h]
        mov     ax, word ptr [si+1ah]
        mov     word ptr [0a0bch], ax
        sub     ax, ax
        mov     word ptr [0a0beh], ax
        mov     word ptr [0a0b6h], ax
        mov     word ptr [0a0b4h], ax
        mov     word ptr [0a0aah], ax
        mov     word ptr [0a0ach], ax
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        mov     word ptr [0a0b8h], bx
        mov     word ptr [0a0bah], dx
        push    ds
        pop     es
        sub     ax, ax
        clc
        ret
br_0B0FA:
        push    es
        pusha
        call    fn_0AAC4
        push    ax
        call    fn_0B6EE
        pop     ax
        jb      br_0B10F
        call    fn_0B11D
        jne     br_0B116
        popa
        pop     es
        jmp     loop_0B0C5
br_0B10F:
        popa
        pop     es
        mov     ax, 7
        stc
        ret
br_0B116:
        popa
        pop     es
        mov     ax, 4
        stc
        ret
fn_0B11D:
        cmp     ah, 2
        je      br_0B134
        cmp     ah, 3
        je      br_0B134
        cmp     ah, 0ah
        je      br_0B134
        cmp     ah, 0bh
        if      FW_VERSION >= 110
        je      br_0B134
        cmp     ah, 4
        endif
br_0B134:
        ret
tgt_0B135:
        mov     ax, word ptr [0a0b8h]
        or      ax, word ptr [0a0bah]
        je      br_0B164
        sub     word ptr [0a0b8h], 1
        sbb     word ptr [0a0bah], 0
        cmp     word ptr [0a0beh], 0
        jne     br_0B152
        call    fn_0B24E
br_0B152:
        mov     si, word ptr [0a0c0h]
        mov     al, byte ptr [si]
        inc     word ptr [0a0c0h]
        dec     word ptr [0a0beh]
        mov     ah, 0
        clc
        ret
br_0B164:
        mov     ax, 0ffffh
        stc
        ret
tgt_0B169:
        mov     ax, word ptr [0a0b8h]
        or      ax, word ptr [0a0bah]
        jne     br_0B173
        ret
br_0B173:
        sub     word ptr [0a0b8h], cx
        sbb     word ptr [0a0bah], 0
        jae     br_0B18E
        add     cx, word ptr [0a0b8h]
        mov     word ptr [0a0b8h], 0
        mov     word ptr [0a0bah], 0
br_0B18E:
        push    cx
        call    fn_0B195
        pop     ax
        clc
        ret
fn_0B195:
        cmp     cx, word ptr [0a0beh]
        jbe     br_0B1C0
        sub     cx, word ptr [0a0beh]
        push    cx
        mov     cx, word ptr [0a0beh]
        mov     word ptr [0a0beh], 0
        mov     si, word ptr [0a0c0h]
        rep movsb
        push    di
        push    es
        call    fn_0B24E
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [0a0beh], 0
        jne     fn_0B195
        ret
br_0B1C0:
        sub     word ptr [0a0beh], cx
        mov     si, word ptr [0a0c0h]
        rep movsb
        mov     word ptr [0a0c0h], si
        ret
fn_0B1CF:
        mov     ax, word ptr [0a0b8h]
        or      ax, word ptr [0a0bah]
        jne     br_0B1D9
        ret
br_0B1D9:
        sub     word ptr [0a0b8h], cx
        sbb     word ptr [0a0bah], 0
        jae     br_0B1F4
        add     cx, word ptr [0a0b8h]
        mov     word ptr [0a0b8h], 0
        mov     word ptr [0a0bah], 0
br_0B1F4:
        push    cx
        call    fn_0B1FB
        pop     ax
        clc
        ret
fn_0B1FB:
        cmp     cx, word ptr [0a0beh]
        jbe     br_0B226
        sub     cx, word ptr [0a0beh]
        push    cx
        mov     cx, word ptr [0a0beh]
        mov     word ptr [0a0beh], 0
        mov     si, word ptr [0a0c0h]
        add     si, cx
        push    di
        push    es
        call    fn_0B24E
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [0a0beh], 0
        jne     fn_0B1FB
        ret
br_0B226:
        sub     word ptr [0a0beh], cx
        mov     si, word ptr [0a0c0h]
        add     si, cx
        mov     word ptr [0a0c0h], si
        ret
loop_0B235:
        sub     ax, 8000h
        sbb     dx, 0
        jb      br_0B247
        pusha
        mov     cx, 8000h
        call    fn_0B1CF
        popa
        jmp     loop_0B235
br_0B247:
        add     ax, 8000h
        mov     cx, ax
        jmp     fn_0B1CF
fn_0B24E:
        mov     ax, word ptr [0a0b6h]
        cmp     word ptr [0a0b4h], 0
        jne     br_0B266
        mov     ax, word ptr [0a0bch]
        mov     bx, 0ff6h
        sub     bx, ax
        jae     br_0B263
        ret
br_0B263:
        call    fn_0B2C4
br_0B266:
        cmp     ax, word ptr [0a0aah]
        jb      br_0B297
        cmp     ax, word ptr [0a0ach]
        jae     br_0B297
        sub     ax, word ptr [0a0aah]
        mov     ah, al
        sub     al, al
        shl     ax, 1
        add     ax, 5000h
        mov     word ptr [0a0c0h], ax
        mov     word ptr [0a0beh], 200h
        inc     word ptr [0a0b6h]
        dec     word ptr [0a0b4h]
        je      br_0B293
        ret
br_0B293:
        call    fn_0B2A7
        ret
br_0B297:
        call    fn_0B2D9
        test    byte ptr [0a11fh], 0c0h
        je      fn_0B24E
        mov     al, byte ptr [0a11fh]
        jmp     loop_0A9DC
fn_0B2A7:
        mov     ax, word ptr [0a0bch]
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        add     bx, word ptr [A1_W_0A0A2]
        mov     ax, word ptr [bx]
        popf
        jae     br_0B2BD
        shr     ax, 4
br_0B2BD:
        and     ah, 0fh
        mov     word ptr [0a0bch], ax
        ret
fn_0B2C4:
        sub     ax, 2
        mov     bx, word ptr [A1_W_0A0B0]
        mul     bx
        add     ax, word ptr [A1_W_0A0AE]
        mov     word ptr [0a0b6h], ax
        mov     word ptr [0a0b4h], bx
        ret
fn_0B2D9:
        push    ax
        mov     bh, byte ptr [0a114h]
        div     bh
        mov     bl, ah
        sub     ah, ah
        shr     al, 1
        rcl     ah, 1
resume_0B2E8:
        sub     bh, bl
        cmp     ah, 0
        jne     br_0B2F3
        add     bh, byte ptr [0a114h]
br_0B2F3:
        inc     bl
        push    bx
        call    fn_0B770
        pop     bx
        mov     bl, bh
        sub     bh, bh
        pop     ax
        mov     word ptr [0a0aah], ax
        add     ax, bx
        mov     word ptr [0a0ach], ax
        ret
tgt_0B308:
        push    es
        pusha
        call    fn_0B6EE
        popa
        pop     es
        jae     loop_0B313
        jmp     br_0B368
loop_0B313:
        cmp     byte ptr [0a092h], 0
        jne     br_0B381
        push    es
        push    si
        push    cx
        push    dx
        call    fn_0AFC6
        pop     dx
        pop     cx
        pop     si
        pop     es
        jb      br_0B386
        mov     word ptr [0a0c2h], di
        mov     word ptr [di+16h], cx
        mov     word ptr [di+18h], dx
        push    es
        push    si
        push    di
        call    fn_0B62B
        pop     di
        pop     si
        pop     es
        jb      loop_0B38B
        mov     word ptr [0a0bch], ax
        mov     word ptr [di+1ah], ax
        call    fn_0B395
        sub     ax, ax
        mov     word ptr [di+1ch], ax
        mov     word ptr [di+1eh], ax
        mov     byte ptr [di+0bh], al
        call    fn_0B4CC
        mov     ax, word ptr [0a0c8h]
        mov     word ptr [0a0c4h], ax
        mov     ax, word ptr [0a0cch]
        mov     word ptr [0a0aah], ax
        mov     byte ptr [0a095h], 2
        sub     ax, ax
        clc
        ret
br_0B368:
        push    es
        pusha
        call    fn_0AAC4
        push    ax
        call    fn_0B6EE
        pop     ax
        jb      br_0B37D
        call    fn_0B11D
        jne     br_0B37D
        popa
        pop     es
        jmp     loop_0B313
br_0B37D:
        popa
        pop     es
        jmp     br_0B390
br_0B381:
        mov     ax, 1
        stc
        ret
br_0B386:
        mov     ax, 2
        stc
        ret
loop_0B38B:
        mov     ax, 3
        stc
        ret
br_0B390:
        mov     ax, 4
        stc
        ret
fn_0B395:
        push    di
        push    ds
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        mov     cx, 8
tgt_0B3A2:
        lodsb
        cmp     al, 61h
        jb      br_0B3AD
        cmp     al, 7bh
        jae     br_0B3AD
        sub     al, 20h
br_0B3AD:
        stosb
        loop    tgt_0B3A2
        push    di
        call    fn_0B3BE
        pop     di
        inc     si
        mov     cx, 3
        rep movsb
        pop     ds
        pop     di
        ret
fn_0B3BE:
        push    si
        mov     cx, 8
        mov     al, 0
tgt_0B3C4:
        or      al, byte ptr [si]
        inc     si
        loop    tgt_0B3C4
        pop     si
        add     di, 4
        cmp     al, 20h
        je      br_0B3E3
        mov     cx, 8
tgt_0B3D4:
        lodsb
        cmp     al, 61h
        jb      br_0B3DF
        cmp     al, 7bh
        jae     br_0B3DF
        sub     al, 20h
br_0B3DF:
        stosb
        loop    tgt_0B3D4
        ret
br_0B3E3:
        mov     al, 0
        mov     cx, 8
        rep stosb
        add     si, 8
        ret
tgt_0B3EE:
        mov     di, word ptr [0a0c2h]
        add     word ptr [di+1ch], 1
        adc     word ptr [di+1eh], 0
        mov     di, word ptr [0a0c8h]
        mov     byte ptr [di], al
        inc     word ptr [0a0c8h]
        dec     word ptr [0a0cah]
        je      br_0B40B
        ret
br_0B40B:
        call    fn_0B492
        jb      br_0B411
        ret
br_0B411:
        jmp     loop_0B38B
tgt_0B414:
        mov     di, word ptr [0a0c2h]
        add     word ptr [di+1ch], cx
        adc     word ptr [di+1eh], 0
        mov     di, word ptr [0a0c2h]
loop_0B423:
        cmp     cx, 0
        je      br_0B482
        cmp     cx, word ptr [0a0cah]
        jbe     br_0B45C
        sub     cx, word ptr [0a0cah]
        push    cx
        mov     cx, word ptr [0a0cah]
        mov     di, word ptr [0a0c8h]
        add     word ptr [0a0c8h], cx
        mov     word ptr [0a0cah], 0
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
        mov     ds, ax
        call    fn_0B492
        pop     cx
        jae     loop_0B423
        jmp     loop_0B38B
br_0B45C:
        sub     word ptr [0a0cah], cx
        pushf
        mov     di, word ptr [0a0c8h]
        add     word ptr [0a0c8h], cx
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
        mov     ds, ax
        popf
        jne     br_0B482
        call    fn_0B492
        jae     br_0B482
        jmp     loop_0B38B
br_0B482:
        sub     ax, ax
        ret
tgt_0B485:
        mov     es, dx
        mov     di, word ptr [0a0a4h]
        call    fn_0B395
        call    fn_0B5E5
        ret
fn_0B492:
        push    si
        call    fn_0B54A
        pop     si
        jae     br_0B49B
        jmp     br_0B4B8
br_0B49B:
        call    fn_0B4CC
        jb      br_0B4A1
        ret
br_0B4A1:
        push    cx
        push    si
        push    es
        call    fn_0B51B
        mov     ax, word ptr [0a0c8h]
        mov     word ptr [0a0c4h], ax
        mov     ax, word ptr [0a0cch]
        mov     word ptr [0a0aah], ax
        pop     es
        pop     si
        pop     cx
        clc
        ret
br_0B4B8:
        mov     byte ptr [0a095h], 0
        mov     di, word ptr [0a0c2h]
        mov     byte ptr [di], 0
        mov     ax, word ptr [di+1ah]
        call    fn_0B6A3
        stc
        ret
fn_0B4CC:
        mov     ax, word ptr [0a0c8h]
        mov     word ptr [0a0c6h], ax
        push    word ptr [0a0c8h]
        push    word ptr [0a0ceh]
        mov     ax, word ptr [0a0bch]
        call    fn_0B2C4
        mov     word ptr [0a0cch], ax
        mov     bl, byte ptr [0a114h]
        add     bl, bl
        div     bl
        mov     bl, ah
        sub     bh, bh
        sub     ah, ah
        mov     word ptr [0a0ceh], ax
        mov     ax, word ptr [0a0b2h]
        push    ax
        mul     bx
        add     ax, 5000h
        mov     word ptr [0a0c8h], ax
        mov     ax, word ptr [A1_W_0A0B0]
        pop     dx
        mul     dx
        mov     word ptr [0a0cah], ax
        pop     bx
        pop     ax
        cmp     bx, word ptr [0a0ceh]
        jne     br_0B519
        cmp     ax, word ptr [0a0c8h]
        jne     br_0B519
        clc
        ret
br_0B519:
        stc
        ret
fn_0B51B:
        mov     ax, word ptr [0a0c6h]
        sub     ax, word ptr [0a0c4h]
        jne     br_0B525
        ret
br_0B525:
        mov     bx, word ptr [0a0b2h]
        if      FW_VERSION >= 112
        sub     dx, dx
        endif
        div     bx
        mov     bh, al
        mov     ax, word ptr [0a0aah]
        mov     bl, byte ptr [0a114h]
        div     bl
        mov     bl, ah
        sub     ah, ah
        shr     al, 1
        rcl     ah, 1
resume_0B540:
        inc     bl
        mov     si, word ptr [0a0c4h]
        call    fn_0B808
        ret
fn_0B54A:
        mov     cx, word ptr [0a0bch]
        mov     word ptr [0a098h], cx
        call    fn_0B62E
        jae     br_0B558
        ret
br_0B558:
        mov     cx, ax
        xchg    ax, word ptr [0a0bch]
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        add     bx, word ptr [A1_W_0A0A2]
        mov     ax, word ptr [bx]
        popf
        jae     br_0B579
        shl     cx, 4
        and     ax, 0fh
        or      ax, cx
        mov     word ptr [bx], ax
        ret
br_0B579:
        and     ax, 0f000h
        or      ax, cx
        mov     word ptr [bx], ax
        ret
tgt_0B581:
        sub     ax, ax
        xchg    al, byte ptr [0a095h]
        cmp     al, 2
        jne     br_0B5CE
        mov     di, word ptr [0a0c8h]
        test    di, 1ffh
        jne     br_0B5AD
        mov     ax, word ptr [0a0bch]
        call    fn_0B6A3
        mov     ax, word ptr [0a098h]
        call    fn_0B6D0
        mov     ax, word ptr [0a0c6h]
        mov     bx, word ptr [0a0c4h]
        call    fn_0B51B
        jmp     br_0B5C3
br_0B5AD:
        mov     cx, word ptr [0a0cah]
        mov     ax, ds
        mov     es, ax
        mov     al, 0
        rep stosb
        mov     word ptr [0a0c8h], di
        call    fn_0B4CC
        call    fn_0B51B
br_0B5C3:
        mov     si, word ptr [0a0c2h]
        mov     byte ptr [si+0bh], 20h
        call    fn_0B5E5
br_0B5CE:
        clc
        ret
fn_0B5D0:
        mov     ax, ds
        mov     es, ax
        mov     cx, word ptr [A1_W_0A09E]
        mov     si, word ptr [A1_W_0A0A2]
        mov     di, si
        add     di, cx
        shr     cx, 1
        rep movsw
        ret
fn_0B5E5:
        call    fn_0B5D0
        mov     ax, 0
        mov     bl, 1
        mov     bh, byte ptr [A1_W_0A0AE]
        mov     si, 0
        call    fn_0B808
        test    byte ptr [0a11fh], 0c0h
        je      br_0B601
        jmp     loop_0A9E0
br_0B601:
        clc
        ret
tgt_0B603:
        mov     ax, ds
        mov     es, ax
        mov     di, word ptr [A1_W_0A0A6]
        mov     cx, word ptr [A1_W_0A0A8]
        shl     cx, 5
        rep stosb
        mov     di, word ptr [A1_W_0A0A2]
        add     di, 3
        mov     cx, word ptr [A1_W_0A09E]
        sub     cx, 3
        sub     ax, ax
        rep stosb
        call    fn_0B5E5
        clc
        ret
fn_0B62B:
        mov     cx, 2
fn_0B62E:
        mov     si, word ptr [A1_W_0A0A2]
loop_0B632:
        mov     bx, cx
        shr     bx, 1
        pushf
        add     bx, cx
        mov     ax, word ptr [bx+si]
        popf
        jb      br_0B657
        and     ax, 0fffh
        cmp     ax, 0
        jne     loop_0B64E
        or      word ptr [bx+si], 0fffh
        mov     ax, cx
        clc
        ret
loop_0B64E:
        inc     cx
        cmp     cx, word ptr [A1_W_0A0A0]
        jne     loop_0B632
        stc
        ret
br_0B657:
        and     ax, 0fff0h
        cmp     ax, 0
        jne     loop_0B64E
        or      word ptr [bx+si], 0fff0h
        mov     ax, cx
        clc
        ret
fn_0B666:
        mov     si, word ptr [A1_W_0A0A2]
        mov     cx, 2
        mov     dx, 0
loop_0B670:
        inc     cx
        cmp     cx, word ptr [A1_W_0A0A0]
        je      br_0B699
        mov     bx, cx
        shr     bx, 1
        pushf
        add     bx, cx
        mov     ax, word ptr [bx+si]
        popf
        jb      br_0B68E
        and     ax, 0fffh
        cmp     ax, 0
        jne     loop_0B670
        inc     dx
        jmp     loop_0B670
br_0B68E:
        and     ax, 0fff0h
        cmp     ax, 0
        jne     loop_0B670
        inc     dx
        jmp     loop_0B670
br_0B699:
        mov     ax, word ptr [A1_W_0A0B0]
        mul     dx
        shr     ax, 1
        sub     bx, bx
        ret
fn_0B6A3:
        or      ax, ax
        jne     br_0B6A8
        ret
br_0B6A8:
        mov     si, word ptr [A1_W_0A0A2]
loop_0B6AC:
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        mov     cx, word ptr [bx+si]
        popf
        jb      br_0B6C8
        and     word ptr [bx+si], 0f000h
loop_0B6BC:
        and     cx, 0fffh
        mov     ax, cx
        cmp     ax, 0fffh
        jne     loop_0B6AC
        ret
br_0B6C8:
        and     word ptr [bx+si], 0fh
        shr     cx, 4
        jmp     loop_0B6BC
fn_0B6D0:
        or      ax, ax
        jne     br_0B6D5
        ret
br_0B6D5:
        mov     si, word ptr [A1_W_0A0A2]
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        mov     cx, word ptr [bx+si]
        popf
        jb      br_0B6EA
        or      word ptr [bx+si], 0fffh
        ret
br_0B6EA:
        or      word ptr [bx+si], 0fff0h
        ret
fn_0B6EE:
        mov     byte ptr [0a10dh], 2
        mov     byte ptr [0a10eh], 4
        mov     byte ptr [0a10fh], 0
        call    fn_0BA7D
        call    fn_0BA5A
        xor     al, 38h
        mov     ah, al
        mov     bl, al
        and     bl, 40h
        mov     byte ptr [0a092h], bl
        mov     bh, 0
        and     ah, 8
        sub     ah, 8
        jb      br_0B71D
        sub     ax, ax
        ret
br_0B71D:
        mov     ax, 7
        stc
        ret
fn_0B722:
        mov     byte ptr [0a10dh], 2
        mov     byte ptr [0a10eh], 7
        mov     byte ptr [0a10fh], 0
        cli
        call    fn_0BA7D
        sti
        call    fn_0BB55
        call    fn_0BA47
        cmp     al, 80h
        jne     br_0B741
        ret
br_0B741:
        cmp     al, 20h
        jne     br_0B746
        ret
br_0B746:
        mov     ax, 29h
        stc
        ret
fn_0B74B:
        mov     byte ptr [0a10dh], 3
        mov     byte ptr [0a10eh], 0fh
        mov     byte ptr [0a10fh], 0
        mov     byte ptr [0a110h], al
        cli
        call    fn_0BA7D
        sti
        call    fn_0BB55
        call    fn_0BA47
        cmp     al, 20h
        jne     br_0B76D
        ret
br_0B76D:
        jmp     loop_0A9E8
fn_0B770:
        push    ax
        push    bx
        call    fn_0B74B
        pop     bx
        pop     ax
        mov     byte ptr [0a10dh], 9
        mov     cl, ah
        xor     cl, 1
        ror     cl, 1
        or      cl, 46h
        mov     byte ptr [0a10eh], cl
        mov     cl, ah
        rol     cl, 2
        mov     byte ptr [0a10fh], cl
        mov     byte ptr [0a110h], al
        mov     byte ptr [0a111h], ah
        mov     byte ptr [0a112h], bl
        call    fn_0BB16
        mov     dx, ASIC_DMA_C031
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     ax, ds
        mov     cx, 4
        sub     bl, bl
tgt_0B7BA:
        shl     ax, 1
        rcl     bl, 1
        loop    tgt_0B7BA
        add     ax, 5000h
        adc     bl, 0
        mov     dx, ASIC_DMA_ADDR
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        mov     ah, bh
        shl     ah, 1
        sub     al, al
        cmp     byte ptr [0a113h], 3
        jne     br_0B7E1
        shl     ax, 1
br_0B7E1:
        dec     ax
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     dx, ASIC_DMA_C03A
        mov     al, 4
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        pop     dx
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        call    fn_0BA7D
        call    fn_0BA3C
        call    fn_0BB3A
        ret
fn_0B808:
        push    ax
        push    bx
        push    si
        call    fn_0B74B
        pop     si
        pop     bx
        pop     ax
        mov     byte ptr [0a10dh], 9
        mov     cl, ah
        xor     cl, 1
        ror     cl, 1
        or      cl, 45h
        mov     byte ptr [0a10eh], cl
        mov     cl, ah
        rol     cl, 2
        mov     byte ptr [0a10fh], cl
        mov     byte ptr [0a110h], al
        mov     byte ptr [0a111h], ah
        mov     byte ptr [0a112h], bl
        call    fn_0BB16
        mov     dx, ASIC_DMA_C031
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     ax, ds
        mov     cx, 4
        sub     bl, bl
tgt_0B854:
        shl     ax, 1
        rcl     bl, 1
        loop    tgt_0B854
        add     ax, si
        adc     bl, 0
        mov     dx, ASIC_DMA_ADDR
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        mov     ah, bh
        shl     ah, 1
        sub     al, al
        cmp     byte ptr [0a113h], 3
        jne     br_0B87A
        shl     ax, 1
br_0B87A:
        dec     ax
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     dx, ASIC_DMA_C03A
        mov     al, 8
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        pop     dx
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        call    fn_0BA7D
        call    fn_0BA3C
        call    fn_0BB3A
        test    byte ptr [0a11fh], 0c0h
        je      br_0B8AA
        jmp     loop_0A9E0
br_0B8AA:
        clc
        ret
tgt_0B8AC:
        mov     byte ptr [0a11eh], 0
        mov     byte ptr [0a094h], 0
        cmp     al, 0
        jne     br_0B8BD
        jmp     fn_0AB12
br_0B8BD:
        jmp     fn_0ABCA
tgt_0B8C0:
        mov     al, byte ptr [0a11eh]
        push    ax
        shr     al, 1
        call    fn_0B74B
        pop     ax
        mov     ah, al
        shr     al, 1
        and     ah, 1
        push    ax
        shl     ah, 2
        mov     byte ptr [0a119h], ah
        mov     bl, 1
        mov     bh, byte ptr [0a11ah]
        mov     cl, byte ptr [0a11bh]
        sub     ch, ch
        mov     di, 0a002h
        pop     ax
tgt_0B8E9:
        mov     byte ptr [di], al
        inc     di
        mov     byte ptr [di], ah
        inc     di
        mov     byte ptr [di], bl
        inc     di
        mov     byte ptr [di], bh
        inc     di
        inc     bl
        loop    tgt_0B8E9
        call    fn_0BB16
        mov     dx, ASIC_DMA_C031
        mov     al, 1
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        or      al, 2
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     ax, ds
        mov     cx, 4
        sub     bl, bl
tgt_0B915:
        shl     ax, 1
        rcl     bl, 1
        loop    tgt_0B915
        add     ax, 0a002h
        adc     bl, 0
        mov     dx, ASIC_DMA_ADDR
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        mov     al, byte ptr [0a11bh]
        mov     ah, 4
        dec     ax
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     dx, ASIC_DMA_C03A
        mov     al, 8
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        pop     dx
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        and     al, 0fdh
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     byte ptr [0a117h], 6
        mov     byte ptr [0a118h], 4dh
        call    fn_0BA95
        call    fn_0BA3C
        call    fn_0BB3A
        test    al, 0c0h
        je      br_0B969
        jmp     loop_0A9E4
br_0B969:
        inc     byte ptr [0a11eh]
        mov     al, byte ptr [0a11eh]
        shr     al, 1
        clc
        ret
tgt_0B974:
        call    fn_0B722
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        push    di
        mov     cx, 2100h
        sub     ax, ax
        rep stosw
        pop     di
        mov     si, P_B9C1
        mov     al, 0f0h
        cmp     byte ptr [0a093h], 0
        jne     br_0B998
        mov     si, P_B9DD
        mov     al, 0f9h
br_0B998:
        mov     byte ptr [di+200h], al
        mov     word ptr [di+201h], 0ffffh
        mov     cx, 1ch
        push    ds
        mov     ax, cs
        mov     ds, ax
        rep movsb
        pop     ds
        call    fn_0B5D0
        mov     si, 0
        mov     al, 0
        mov     ah, 0
        mov     bl, 1
        mov     bh, byte ptr [A1_W_0A0AE]
        call    fn_0B808
        ret
loop_0B9C1:
        jmp     loop_0B9C1
        db      90h
        db      "MPC2KXL "
L_0B9CC:
        db      00h, 02h, 01h, 01h, 00h, 02h, 0e0h
        db      00h, 40h, 0bh, 0f0h, 09h, 00h, 12h, 00h, 02h, 00h
L_0B9DD:
        db      0ebh, 0feh, 90h, 4dh, 50h, 43h
        db      32h, 4bh, 58h, 4ch, 20h
L_0B9E8:
        db      00h, 02h, 02h, 01h, 00h, 02h, 70h, 00h, 0a0h, 05h, 0f9h
        db      03h, 00h, 09h, 00h, 02h, 00h, 0ebh, 0feh, 90h, 20h, 20h, 20h, 20h, 20h, 20h, 20h
        db      20h
L_0BA04:
        db      00h, 02h, 02h, 01h, 00h, 02h, 70h, 00h, 00h, 05h, 0fbh, 02h, 00h, 08h, 00h
        db      02h, 00h, 0ebh, 0feh, 90h
        db      "        "
L_0BA20:
        db      00h, 02h, 02h
        db      01h, 00h, 02h, 70h, 00h, 40h, 06h, 0f9h, 03h, 00h, 0ah, 00h, 02h, 00h
L_0BA31:
        db      0ebh, 0feh
        db      90h
        db      "MPC2000 "
fn_0BA3C:
        call    fn_0BB55
        in      al, 20h
        test    al, 40h
        je      fn_0BA47
        jmp     fn_0BA5A
fn_0BA47:
        mov     byte ptr [0a10dh], 1
        mov     byte ptr [0a10eh], 8
        call    fn_0BA7D
        call    fn_0BA5A
        and     al, 0f8h
        ret
fn_0BA5A:
        call    fn_0BADC
        mov     si, 0a11fh
        call    fn_0BB6B
loop_0BA63:
        call    fn_0BB78
        in      al, 20h
        and     al, 0c0h
        cmp     al, 80h
        je      br_0BA79
        cmp     al, 0c0h
        jne     loop_0BA63
        in      al, 22h
        mov     byte ptr [si], al
        inc     si
        jmp     loop_0BA63
br_0BA79:
        mov     al, byte ptr [0a11fh]
        ret
fn_0BA7D:
        mov     si, 0a10eh
        pusha
        call    fn_0BABA
        call    fn_0BB64
        popa
loop_0BA88:
        call    fn_0BACD
        lodsb
        out     22h, al
        dec     byte ptr [0a10dh]
        jne     loop_0BA88
        ret
fn_0BA95:
        mov     si, 0a118h
        call    fn_0BB64
loop_0BA9B:
        call    fn_0BACD
        lodsb
        out     22h, al
        dec     byte ptr [0a117h]
        jne     loop_0BA9B
        ret
fn_0BAA8:
        push    ax
        call    fn_0BABA
        call    fn_0BACD
        pop     ax
        mov     al, ah
        out     20h, al
        call    fn_0BADC
        in      al, 22h
        ret
fn_0BABA:
        call    fn_0BB6B
loop_0BABD:
        call    fn_0BB78
        in      al, 20h
        and     al, 0c0h
        cmp     al, 0c0h
        je      br_0BAC9
        ret
br_0BAC9:
        in      al, 22h
        jmp     loop_0BABD
fn_0BACD:
        call    fn_0BB6B
loop_0BAD0:
        call    fn_0BB78
        in      al, 20h
        and     al, 0c0h
        cmp     al, 80h
        jne     loop_0BAD0
        ret
fn_0BADC:
        call    fn_0BB6B
loop_0BADF:
        call    fn_0BB78
        in      al, 20h
        and     al, 0c0h
        cmp     al, 0c0h
        jne     loop_0BADF
        ret
fn_0BAEB:
        mov     ah, 1eh
        call    fn_0BAA8
        cmp     byte ptr [0a096h], 0
        je      br_0BAF8
        ret
br_0BAF8:
        mov     byte ptr [0a096h], 1
        mov     bl, 7
L_0BAFF:
        mov     cx, 0ffffh
tgt_0BB02:
        mul     ax
        loop    tgt_0BB02
        dec     bl
        jne     L_0BAFF
        ret
tgt_0BB0B:
        mov     ah, 0eh
        call    fn_0BAA8
        mov     byte ptr [0a096h], 0
        ret
fn_0BB16:
        pusha
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C038
        mov     al, 10h
        out     dx, al
        mov     dx, ASIC_DMA_DIR
        mov     al, 1
        out     dx, al
        mov     al, 31h
        cmp     byte ptr [0a093h], 0
        jne     br_0BB34
        mov     al, 71h
br_0BB34:
        mov     dx, 0fff6h
        out     dx, al
        popa
        ret
fn_0BB3A:
        pusha
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C038
        mov     al, 10h
        out     dx, al
        mov     dx, ASIC_DMA_DIR
        mov     al, 0
        out     dx, al
        mov     dx, 0fff6h
        mov     al, 11h
        out     dx, al
        popa
        ret
fn_0BB55:
        call    fn_0BB6B
loop_0BB58:
        call    fn_0BB78
        mov     al, 1
        int     92h
        cmp     al, 0
        je      loop_0BB58
        ret
fn_0BB64:
        pusha
        mov     al, 0
        int     92h
        popa
        ret
fn_0BB6B:
        mov     word ptr [0a09ah], 0
        mov     word ptr [0a09ch], 14h
        ret
fn_0BB78:
        push    ax
        push    dx
        mov     ax, 0ffffh
        mul     ax
        pop     dx
        pop     ax
        dec     word ptr [0a09ah]
        je      br_0BB88
        ret
br_0BB88:
        dec     word ptr [0a09ch]
        jne     br_0BB91
        jmp     loop_0A9DC
br_0BB91:
        ret
TBL_DIR_CHARSET:
        db      "0123456789 ABCDEFGHIJKLMNOPQRSTUVWXYZ#+-."
tgt_0BBBB:
        call    fn_0BC77
        cmp     ax, word ptr [A1_W_0A0A8]
        jae     loop_0BC3F
        mov     bp, ax
        mov     bx, 18h
        mul     bx
        mov     si, ax
        add     si, word ptr [A1_W_0A0A6]
        mov     bl, byte ptr [si+10h]
        cmp     bl, 0
        je      loop_0BC3F
        and     bl, 7fh
        cmp     bl, 73h
        je      loop_0BBE6
        mov     ax, bp
        inc     ax
        jmp     SHORT tgt_0BBBB
loop_0BBE6:
        mov     word ptr [0a0a4h], si
        mov     di, 0a0d0h
        push    di
        push    si
        mov     cx, 0ch
        sub     bx, bx
tgt_0BBF4:
        mov     bl, byte ptr [si]
        mov     al, byte ptr cs:[bx+TBL_DIR_CHARSET-APP1_CSBASE]
        mov     byte ptr [di], al
        inc     si
        inc     di
        loop    tgt_0BBF4
        mov     byte ptr [di], 20h
        mov     byte ptr [di+1], 20h
        mov     byte ptr [di+2], 20h
        mov     byte ptr [di+3], 20h
        mov     byte ptr [di+4], 2eh
        mov     byte ptr [di+5], 53h
        mov     byte ptr [di+6], 33h
        cmp     word ptr [A1_W_0A0A6], 0
        jne     br_0BC27
        mov     byte ptr [di+6], 31h
br_0BC27:
        pop     si
        pop     di
        mov     bl, byte ptr [si+11h]
        mov     bh, byte ptr [si+12h]
        mov     dl, byte ptr [si+13h]
        sub     dh, dh
        mov     cx, ds
        mov     es, cx
        mov     si, 0a0d0h
        mov     ax, bp
        clc
        ret
loop_0BC3F:
        mov     ax, ds
        mov     es, ax
        sub     bx, bx
        sub     dx, dx
        mov     si, 0a0d0h
        stc
        ret
loop_0BC4C:
        call    fn_0BC77
        mov     bp, ax
        mov     bx, 18h
        mul     bx
        mov     si, ax
        add     si, word ptr [A1_W_0A0A6]
        cmp     si, word ptr [A1_W_0A0A6]
        mov     bl, byte ptr [si+10h]
        and     bl, 7fh
        cmp     bl, 73h
        jne     br_0BC6E
        jmp     loop_0BBE6
br_0BC6E:
        mov     ax, bp
        sub     ax, 1
        jb      loop_0BC3F
        jmp     loop_0BC4C
fn_0BC77:
        push    ax
        mov     ax, ds
        mov     es, ax
        mov     di, 0a0d0h
        push    di
        mov     al, 20h
        mov     cx, 14h
        rep stosb
        pop     di
        mov     byte ptr [di+10h], 2eh
        pop     ax
        ret
L_0BC8E:
        mov     ax, 0
        mov     di, si
loop_0BC93:
        push    es
        push    di
        call    tgt_0BBBB
        pop     di
        pop     es
        jae     br_0BC9D
        ret
br_0BC9D:
        mov     si, 0a0d0h
        mov     bp, di
        mov     cx, 0ch
        repe cmpsb
        je      br_0BCAE
        mov     di, bp
        inc     ax
        jmp     loop_0BC93
br_0BCAE:
        clc
        ret
tgt_0BCB0:
        call    L_0BC8E
        jae     br_0BCB6
        ret
br_0BCB6:
        mov     si, word ptr [0a0a4h]
        mov     al, byte ptr [si+11h]
        mov     ah, byte ptr [si+12h]
        mov     dl, byte ptr [si+13h]
        sub     dh, dh
        mov     word ptr [0a0b8h], ax
        mov     word ptr [0a0bah], dx
        push    ax
        push    dx
        mov     ax, word ptr [si+14h]
        mov     word ptr [0a0b6h], ax
        mov     byte ptr [0a095h], 1
        mov     word ptr [0a0beh], 0
        pop     dx
        pop     bx
        if      FW_VERSION >= 114
        push    ds
        pop     es
        endif
        mov     ax, 0
        clc
        ret
tgt_0BCE8:
        mov     ax, word ptr [0a0b8h]
        or      ax, word ptr [0a0bah]
        je      br_0BD17
        sub     word ptr [0a0b8h], 1
        sbb     word ptr [0a0bah], 0
        cmp     word ptr [0a0beh], 0
        jne     br_0BD05
        call    fn_0BD70
br_0BD05:
        mov     si, word ptr [0a0c0h]
        mov     al, byte ptr [si]
        inc     word ptr [0a0c0h]
        dec     word ptr [0a0beh]
        mov     ah, 0
        clc
        ret
br_0BD17:
        mov     ax, 0ffffh
        stc
        ret
tgt_0BD1C:
        mov     ax, word ptr [0a0b8h]
        or      ax, word ptr [0a0bah]
        jne     br_0BD26
        ret
br_0BD26:
        sub     word ptr [0a0b8h], cx
        sbb     word ptr [0a0bah], 0
        jae     br_0BD35
        add     cx, word ptr [0a0b8h]
br_0BD35:
        push    cx
        call    fn_0BD3C
        pop     ax
        clc
        ret
fn_0BD3C:
        cmp     cx, word ptr [0a0beh]
        jbe     br_0BD61
        sub     cx, word ptr [0a0beh]
        push    cx
        mov     cx, word ptr [0a0beh]
        mov     si, word ptr [0a0c0h]
        rep movsb
        push    di
        push    es
        call    fn_0BD70
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [0a0beh], 0
        jne     fn_0BD3C
        ret
br_0BD61:
        sub     word ptr [0a0beh], cx
        mov     si, word ptr [0a0c0h]
        rep movsb
        mov     word ptr [0a0c0h], si
        ret
fn_0BD70:
        mov     word ptr [0a0beh], 0
        mov     ax, word ptr [0a0b6h]
        cmp     ax, 8000h
        jne     br_0BD7F
        ret
br_0BD7F:
        cmp     ax, word ptr [0a0aah]
        jb      isr_0BDB0
        cmp     ax, word ptr [0a0ach]
        jae     isr_0BDB0
        sub     ax, word ptr [0a0aah]
        mov     ah, al
        sub     al, al
        shl     ax, 2
        add     ax, 5000h
        mov     word ptr [0a0c0h], ax
        mov     word ptr [0a0beh], 400h
        mov     bx, word ptr [0a0b6h]
        shl     bx, 1
        mov     ax, word ptr [bx+600h]
        mov     word ptr [0a0b6h], ax
        ret
isr_0BDB0:
        call    fn_0B2D9
        test    byte ptr [0a11fh], 0c0h
        je      fn_0BD70
        jmp     loop_0A9DC
        if      FW_VERSION >= 110
        db      00h
        endif
isr_0BDBE:                              ; INT 91h, SCSI slots (xl_device_slot_vectors)
        sti
        push    ds
        mov     bp, 0f000h
        mov     ds, bp
        mov     bh, byte ptr [0e803h]
        mov     bp, TBL_DEVICE_SERVICE_1-APP1_CSBASE
        cmp     bh, 1
        je      L_0BDE8
        mov     bp, TBL_DEVICE_SERVICE_2-APP1_CSBASE
        cmp     bh, 2
        je      L_0BDE8
        mov     bp, TBL_DEVICE_SERVICE_3-APP1_CSBASE
        cmp     bh, 3
        je      L_0BDE8
        mov     bp, TBL_DEVICE_SERVICE_4-APP1_CSBASE
        cmp     bh, 4
        je      L_0BDE8
        mov     bp, TBL_DEVICE_SERVICE_0-APP1_CSBASE
L_0BDE8:
        sub     bh, bh
        shl     bx, 1
        add     bx, bp
        mov     word ptr [0e800h], sp
        call    word ptr cs:[bx]
isr_0BDF9:
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
loop_0BE05:
        cli
        mov     sp, word ptr [0e800h]
        stc
        jmp     isr_0BDF9
TBL_DEVICE_SERVICE_0:
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BF5D-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, fn_0C861-APP1_CSBASE
        dw      tgt_0C950-APP1_CSBASE, tgt_0C98A-APP1_CSBASE, tgt_0C9BB-APP1_CSBASE, fn_0CB67-APP1_CSBASE
        dw      tgt_0CD58-APP1_CSBASE, tgt_0CD87-APP1_CSBASE, tgt_0CDF4-APP1_CSBASE, tgt_0CF39-APP1_CSBASE
        dw      tgt_0D0C9-APP1_CSBASE, fn_0CC93-APP1_CSBASE, tgt_0C914-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0D3D5-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, fn_0CA21-APP1_CSBASE
        dw      tgt_0CF46-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0C89B-APP1_CSBASE, tgt_0C451-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0C47C-APP1_CSBASE, L_0CE3C-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE4D-APP1_CSBASE, loop_0CA87-APP1_CSBASE
tgt_0BE4D:
        mov     ax, 1
        clc
        ret
tgt_0BE52:
        sub     bx, bp
        shr     bx, 1
        mov     ax, 23h
        stc
        ret
TBL_DEVICE_SERVICE_1:
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BF5D-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, fn_0D6A7-APP1_CSBASE
        dw      tgt_0D756-APP1_CSBASE, tgt_0D78C-APP1_CSBASE, tgt_0D7C0-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0D0C9-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, fn_0D814-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0D3D5-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0D734-APP1_CSBASE, tgt_0D667-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0D596-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, loop_0CA87-APP1_CSBASE
TBL_DEVICE_SERVICE_2:
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BF5D-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0DBAD-APP1_CSBASE
        dw      tgt_0DCE4-APP1_CSBASE, tgt_0DD1C-APP1_CSBASE, tgt_0DD50-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0D3D5-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0DC54-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BEDB-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, loop_0CA87-APP1_CSBASE
tgt_0BEDB:
        db      0f9h, 0c3h
TBL_DEVICE_SERVICE_3:
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BF5D-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0D987-APP1_CSBASE
        dw      tgt_0DA78-APP1_CSBASE, tgt_0DAB7-APP1_CSBASE, tgt_0DAD8-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0DB38-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0D3D5-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0DA56-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0D888-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, loop_0CA87-APP1_CSBASE
TBL_DEVICE_SERVICE_4:
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BF5D-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, fn_0C861-APP1_CSBASE
        dw      tgt_0E1AB-APP1_CSBASE, tgt_0E1DC-APP1_CSBASE, tgt_0E20D-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0C914-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0D3D5-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, fn_0E29A-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0C89B-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0DE6D-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, isr_0E300-APP1_CSBASE
tgt_0BF5D:
        if      FW_VERSION >= 114
        call    L_0BF6A
        push    ds
        pop     es
        mov     si, 0e806h
        if      FW_VERSION >= 120
        db      8bh, 3eh, 8ch, 0e8h, 0c3h
        else
        mov     di, word ptr [A1_W_0E88C]
        ret
        endif
L_0BF6A:
        mov     ax, ds
        mov     es, ax
L_0BF6E:
        mov     di, 0e802h
        mov     cx, 2bbh
        sub     ax, ax
        rep stosw
        mov     byte ptr [0e803h], 0
        if      FW_VERSION >= 120
        mov     word ptr [0e88ch], 0
        else
        mov     word ptr [A1_W_0E88C], 0
        endif
        mov     byte ptr [0e87dh], 0
        mov     dx, ds
        mov     di, 0e806h
        mov     cx, 2ch
        mov     cx, 24h
        mov     bl, 4
        int     93h
        jae     L_0BF9C
        jmp     NEAR loop_0C0D9
L_0BF9C:
        mov     ah, byte ptr [0e806h]
        cmp     ah, 0
        mov     al, 5
        je      L_0BFB8
        cmp     ah, 5
        mov     al, 6
        je      L_0BFB8
        cmp     ah, 7
        mov     al, 7
        je      L_0BFB8
        jmp     NEAR loop_0C0D9
L_0BFB8:
        mov     byte ptr [0e867h], al
        mov     bl, 5
        int     93h
        if      FW_VERSION >= 120
        jae     L_0BFC4
        jmp     NEAR loop_0C0D9
        else
        db      73h, 03h, 0e9h, 17h, 01h
        endif
L_0BFC4:
        mov     word ptr [0e87eh], ax
        mov     word ptr [0e880h], dx
        db      89h, 0eh, 86h, 0e8h, 0c7h, 06h, 96h, 0e8h, 02h, 00h, 81h, 0f9h, 00h, 08h
        je      L_0BFE1
        db      0c7h, 06h, 96h, 0e8h, 04h, 00h
L_0BFE1:
        mov     bx, 7a1h
        db      81h, 0f9h, 00h, 02h, 74h, 0ah, 0d1h
        jmp     SHORT L_0BF6E
        db      0f9h, 00h, 04h, 74h, 02h, 0d1h, 0ebh, 0f7h, 0f3h, 0a3h, 8ch, 0e8h, 2bh, 0c0h
        db      2bh, 0d2h, 0a3h, 88h, 0e8h, 89h, 16h, 8ah, 0e8h, 8ch, 0dbh, 8eh, 0c3h, 0b9h, 01h, 00h
        if      FW_VERSION >= 120
        db      0bfh, 00h, 80h, 0b3h, 02h, 0cdh, 93h, 73h, 03h
        jmp     NEAR loop_0C0D9
        db      2bh, 0c0h, 2bh, 0d2h
        db      8ch, 0dbh, 8eh, 0c3h, 0b9h, 01h, 00h, 0bfh, 00h, 80h
        call    fn_0D06B
        cmp     word ptr [81feh], 0aa55h
        db      74h, 02h, 0ebh, 7dh, 80h, 3eh, 67h, 0e8h, 06h, 75h, 23h, 0c6h, 06h
        db      7dh, 0e8h, 01h, 0c7h, 06h, 86h, 0e8h, 00h, 02h, 0a1h, 7eh, 0e8h, 8bh, 16h, 80h, 0e8h
        db      0d1h, 0e0h, 0d1h, 0d2h, 0d1h, 0e0h, 0d1h, 0d2h, 0a3h, 7eh, 0e8h, 89h, 16h, 80h, 0e8h, 0ebh
        db      25h, 0beh, 0beh, 81h, 0e8h, 82h, 00h, 73h, 16h, 83h, 0c6h, 10h
        call    L_0BEAB
        db      73h
        db      0eh, 83h, 0c6h, 10h
        call    L_0BEAB
        db      73h, 06h, 83h, 0c6h, 10h
        call    L_0BEAB
        db      0a3h
        db      88h, 0e8h, 89h, 16h, 8ah, 0e8h, 2bh, 0c0h, 2bh, 0d2h, 0b9h, 01h, 00h, 8ch, 0dbh, 8eh
        db      0c3h, 0bfh, 00h, 80h
        call    fn_0D06B
        call    fn_0C113
        db      72h, 18h
        cmp     ah, 0bh
        db      75h
        db      01h, 0c3h
        cmp     ah, 0ah
        jne     L_0C0A3
        db      0c3h
L_0C0A3:
        cmp     ah, 4
        jne     L_0C0A9
        db      0c3h
L_0C0A9:
        cmp     ah, 0ch
        db      75h, 01h, 0c3h, 2bh, 0c0h, 0a3h, 88h, 0e8h, 0a3h, 8ah, 0e8h
        call    L_0D8F8
        db      72h
        db      01h, 0c3h
        call    L_0C06D
        db      72h, 01h, 0c3h
        call    L_0C134
        db      72h, 01h, 0c3h, 0e8h, 41h
        db      03h, 72h, 01h, 0c3h
        mov     al, byte ptr [0e867h]
        mov     ah, 1
        sub     dx, dx
        sub     bx, bx
        ret
        else
        db      0bfh, 00h, 80h, 0b3h, 02h, 0cdh, 93h, 73h, 03h, 0e9h, 0c4h, 00h, 2bh, 0c0h, 2bh, 0d2h
        db      0b9h, 01h, 00h, 0bfh, 00h, 80h, 0e8h, 14h, 10h, 81h, 3eh, 0feh, 81h, 55h, 0aah, 74h
        db      03h, 0e9h, 82h, 00h, 80h, 3eh, 67h, 0e8h, 06h, 75h, 21h, 0c6h, 06h, 7dh, 0e8h, 01h
        db      0c7h, 06h, 86h, 0e8h, 00h, 02h, 0a1h, 7eh, 0e8h, 8bh, 16h, 80h, 0e8h, 0d1h, 0e0h, 0d1h
        db      0d2h, 0d1h, 0e0h, 0d1h, 0d2h, 0a3h, 7eh, 0e8h, 89h, 16h, 80h, 0e8h, 0e8h, 96h, 00h, 72h
        db      18h, 80h, 0fch, 0bh, 75h, 01h, 0c3h, 80h, 0fch, 0ah, 75h, 01h, 0c3h, 80h, 0fch, 04h
        db      75h, 01h, 0c3h, 80h, 0fch, 0ch, 75h, 01h, 0c3h, 0beh, 0beh, 81h, 0e8h, 6bh, 00h, 75h
        db      18h, 83h, 0c6h, 10h, 0e8h, 63h, 00h, 75h, 10h, 83h, 0c6h, 10h, 0e8h, 5bh, 00h, 75h
        db      08h, 83h, 0c6h, 10h, 0e8h, 53h, 00h, 74h, 1dh, 0a3h, 88h, 0e8h, 89h, 16h, 8ah, 0e8h
        db      2bh, 0c0h, 2bh, 0d2h, 0b9h, 01h, 00h, 0bfh, 00h, 80h, 0e8h, 90h, 0fh, 0e8h, 45h, 00h
        db      80h, 0fch, 0ch, 75h, 01h, 0c3h, 2bh, 0c0h, 0a3h, 88h, 0e8h, 0a3h, 8ah, 0e8h, 0e8h, 48h
        db      1ch, 72h, 01h, 0c3h, 0e8h, 20h, 02h, 72h, 01h, 0c3h, 0e8h, 0e1h, 02h, 72h, 01h, 0c3h
        db      0e8h, 03h, 03h, 72h, 01h, 0c3h, 0a0h, 67h, 0e8h, 0b4h, 01h, 2bh, 0d2h, 2bh, 0dbh, 0c3h
        endif
        else
        if      FW_VERSION >= 111
        db      0e8h, 0ah, 00h, 1eh, 07h, 0beh, 06h, 0e8h, 8bh, 3eh, 8ch, 0e8h, 0c3h, 8ch, 0d8h, 8eh
        db      0c0h, 0bfh, 02h, 0e8h, 0b9h, 0bbh, 02h, 2bh, 0c0h, 0f3h, 0abh, 0c6h, 06h, 03h, 0e8h, 00h
        db      0c7h, 06h, 8ch, 0e8h, 00h, 00h, 0c6h, 06h, 7dh, 0e8h, 00h, 8ch, 0dah, 0bfh, 06h, 0e8h
        db      0b9h, 2ch, 00h, 0b9h, 24h, 00h, 0b3h, 04h, 0cdh, 93h, 73h, 03h, 0e9h, 3fh, 01h, 8ah
        db      26h, 06h, 0e8h, 80h, 0fch, 00h, 0b0h, 05h, 74h, 11h, 80h, 0fch, 05h, 0b0h, 06h, 74h
        db      0ah, 80h, 0fch, 07h, 0b0h, 07h, 74h, 03h, 0e9h, 23h, 01h, 0a2h, 67h, 0e8h, 0b3h, 05h
        db      0cdh, 93h, 73h, 03h, 0e9h, 17h, 01h, 0a3h, 7eh, 0e8h, 89h, 16h, 80h, 0e8h, 89h, 0eh
        db      86h, 0e8h, 0c7h, 06h, 96h, 0e8h, 02h, 00h, 81h, 0f9h, 00h, 08h, 74h, 06h, 0c7h, 06h
        db      96h, 0e8h, 04h, 00h, 0bbh, 0a1h, 07h, 81h, 0f9h, 00h, 02h, 74h, 0ah, 0d1h, 0ebh, 81h
        db      0f9h, 00h, 04h, 74h, 02h, 0d1h, 0ebh, 0f7h, 0f3h, 0a3h, 8ch, 0e8h, 2bh, 0c0h, 2bh, 0d2h
        db      0a3h, 88h, 0e8h, 89h, 16h, 8ah, 0e8h, 8ch, 0dbh, 8eh, 0c3h, 0b9h, 01h, 00h, 0bfh, 00h
        db      80h, 0b3h, 02h, 0cdh, 93h, 73h, 03h, 0e9h, 0c4h, 00h, 2bh, 0c0h, 2bh, 0d2h, 0b9h, 01h
        db      00h, 0bfh, 00h, 80h, 0e8h, 15h, 10h, 81h, 3eh, 0feh, 81h, 55h, 0aah, 74h, 03h, 0e9h
        db      82h, 00h, 80h, 3eh, 67h, 0e8h, 06h, 75h, 21h, 0c6h, 06h, 7dh, 0e8h, 01h, 0c7h, 06h
        db      86h, 0e8h, 00h, 02h, 0a1h, 7eh, 0e8h, 8bh, 16h, 80h, 0e8h, 0d1h, 0e0h, 0d1h, 0d2h, 0d1h
        db      0e0h, 0d1h, 0d2h, 0a3h, 7eh, 0e8h, 89h, 16h, 80h, 0e8h, 0e8h, 96h, 00h, 72h, 18h, 80h
        db      0fch, 0bh, 75h, 01h, 0c3h, 80h, 0fch, 0ah, 75h, 01h, 0c3h, 80h, 0fch, 04h, 75h, 01h
        db      0c3h, 80h, 0fch, 0ch, 75h, 01h, 0c3h, 0beh, 0beh, 81h, 0e8h, 6bh, 00h, 75h, 18h, 83h
        db      0c6h, 10h, 0e8h, 63h, 00h, 75h, 10h, 83h, 0c6h, 10h, 0e8h, 5bh, 00h, 75h, 08h, 83h
        db      0c6h, 10h, 0e8h, 53h, 00h, 74h, 1dh, 0a3h, 88h, 0e8h, 89h, 16h, 8ah, 0e8h, 2bh, 0c0h
        db      2bh, 0d2h, 0b9h, 01h, 00h, 0bfh, 00h, 80h, 0e8h, 91h, 0fh, 0e8h, 45h, 00h, 80h, 0fch
        db      0ch, 75h, 01h, 0c3h, 2bh, 0c0h, 0a3h, 88h, 0e8h, 0a3h, 8ah, 0e8h, 0e8h, 49h, 1ch, 72h
        db      01h, 0c3h, 0e8h, 20h, 02h, 72h, 01h, 0c3h, 0e8h, 0e1h, 02h, 72h, 01h, 0c3h, 0e8h, 03h
        db      03h, 72h, 01h, 0c3h, 0a0h, 67h, 0e8h, 0b4h, 01h, 2bh, 0d2h, 2bh, 0dbh, 0c3h
        else
        db      0e8h, 0ah, 00h
        push    ds
        pop     es
        mov     si, 0e806h
        mov     di, word ptr [A1_W_0E88C]
        ret
        mov     ax, ds
        mov     es, ax
        mov     di, 0e802h
        if      FW_VERSION >= 110
        mov     cx, 2bbh
        else
        mov     cx, 3b6h
        endif
        sub     ax, ax
        rep stosw
        mov     byte ptr [0e803h], 0
        mov     word ptr [A1_W_0E88C], 0
        if      FW_VERSION >= 110
        mov     byte ptr [0e87dh], 0
        endif
        mov     dx, ds
        mov     di, 0e806h
        mov     cx, 2ch
        mov     cx, 24h
        mov     bl, 4
        int     93h
        if      FW_VERSION >= 110
        db      73h, 03h
        jmp     NEAR loop_0C0D9
        else
        jae     L_0BDC3
        jmp     loop_0C0D9
L_0BDC3:
        endif
        mov     ah, byte ptr [0e806h]
        cmp     ah, 0
        mov     al, 5
        db      74h, 11h
        cmp     ah, 5
        mov     al, 6
        db      74h, 0ah
        cmp     ah, 7
        mov     al, 7
        if      FW_VERSION >= 110
        db      74h, 03h
        jmp     NEAR loop_0C0D9
        else
        je      L_0BDDF
        jmp     loop_0C0D9
L_0BDDF:
        endif
        mov     byte ptr [0e867h], al
        if      FW_VERSION >= 110
        db      0b3h, 05h, 0cdh, 93h, 73h, 03h, 0e9h, 17h, 01h, 0a3h, 7eh, 0e8h, 89h, 16h, 80h, 0e8h
        db      89h, 0eh, 86h, 0e8h, 0c7h, 06h, 96h, 0e8h, 02h, 00h, 81h, 0f9h, 00h, 08h, 74h, 06h
        db      0c7h, 06h, 96h, 0e8h, 04h, 00h, 0bbh, 0a1h, 07h, 81h, 0f9h, 00h, 02h, 74h, 0ah, 0d1h
        db      0ebh, 81h, 0f9h, 00h, 04h, 74h, 02h, 0d1h, 0ebh, 0f7h, 0f3h, 0a3h, 8ch, 0e8h, 2bh, 0c0h
        db      2bh, 0d2h, 0a3h, 88h, 0e8h, 89h, 16h, 8ah, 0e8h, 8ch, 0dbh, 8eh, 0c3h, 0b9h, 01h, 00h
        db      0bfh, 00h, 80h, 0b3h, 02h, 0cdh, 93h, 73h, 03h, 0e9h, 0c4h, 00h, 2bh, 0c0h, 2bh, 0d2h
        db      0b9h, 01h, 00h, 0bfh, 00h, 80h, 0e8h, 0ah, 10h, 81h, 3eh, 0feh, 81h, 55h, 0aah, 74h
        db      03h, 0e9h, 82h, 00h, 80h, 3eh, 67h, 0e8h, 06h, 75h, 21h, 0c6h, 06h, 7dh, 0e8h, 01h
        db      0c7h, 06h, 86h, 0e8h, 00h, 02h, 0a1h, 7eh, 0e8h, 8bh, 16h, 80h, 0e8h, 0d1h, 0e0h, 0d1h
        db      0d2h, 0d1h, 0e0h, 0d1h, 0d2h, 0a3h, 7eh, 0e8h, 89h, 16h, 80h, 0e8h, 0e8h, 96h, 00h, 72h
        db      18h, 80h, 0fch, 0bh, 75h, 01h, 0c3h, 80h, 0fch, 0ah, 75h, 01h, 0c3h, 80h, 0fch, 04h
        db      75h, 01h, 0c3h, 80h, 0fch, 0ch, 75h, 01h, 0c3h, 0beh, 0beh, 81h, 0e8h, 6bh, 00h, 75h
        db      18h, 83h, 0c6h, 10h, 0e8h, 63h, 00h, 75h, 10h, 83h, 0c6h, 10h, 0e8h, 5bh, 00h, 75h
        db      08h, 83h, 0c6h, 10h, 0e8h, 53h, 00h, 74h, 1dh, 0a3h, 88h, 0e8h, 89h, 16h, 8ah, 0e8h
        db      2bh, 0c0h, 2bh, 0d2h, 0b9h, 01h, 00h, 0bfh, 00h, 80h, 0e8h, 86h, 0fh, 0e8h, 45h, 00h
        db      80h, 0fch, 0ch, 75h, 01h, 0c3h, 2bh, 0c0h, 0a3h, 88h, 0e8h, 0a3h, 8ah, 0e8h, 0e8h, 3eh
        db      1ch, 72h, 01h, 0c3h, 0e8h, 20h, 02h, 72h, 01h, 0c3h, 0e8h, 0e1h, 02h, 72h, 01h, 0c3h
        db      0e8h, 03h, 03h, 72h, 01h, 0c3h, 0a0h, 67h, 0e8h, 0b4h, 01h, 2bh, 0d2h, 2bh, 0dbh, 0c3h
        else
        mov     bl, 5
        int     93h
        jae     L_0BDEB
        jmp     loop_0C0D9
L_0BDEB:
        mov     word ptr [0e87eh], ax
        mov     word ptr [0e880h], dx
        mov     bx, 7a1h
        div     bx
        mov     word ptr [0e88ah], ax
        mov     word ptr [0e886h], 0
        mov     word ptr [0e888h], 0
        sub     ax, ax
        sub     dx, dx
        mov     cx, 1
        mov     di, 8000h
        call    fn_0D06B
        cmp     word ptr [81feh], 0aa55h
        je      L_0BE1D
        jmp     L_0BE77
L_0BE1D:
        call    fn_0C113
        jb      L_0BE3A
        cmp     ah, 0bh
        jne     L_0BE28
        ret
L_0BE28:
        cmp     ah, 0ah
        jne     L_0BE2E
        ret
L_0BE2E:
        cmp     ah, 4
        jne     L_0BE34
        ret
L_0BE34:
        cmp     ah, 0ch
        jne     L_0BE3A
        ret
L_0BE3A:
        mov     si, 81beh
        call    L_0BEAB
        jne     L_0BE5A
        add     si, 10h
        call    L_0BEAB
        jne     L_0BE5A
        add     si, 10h
        call    L_0BEAB
        jne     L_0BE5A
        add     si, 10h
        call    L_0BEAB
        je      L_0BE77
L_0BE5A:
        mov     word ptr [0e886h], ax
        mov     word ptr [0e888h], dx
        sub     ax, ax
        sub     dx, dx
        mov     cx, 1
        mov     di, 8000h
        call    fn_0D06B
        call    fn_0C113
        cmp     ah, 0ch
        jne     L_0BE77
        ret
L_0BE77:
        sub     ax, ax
        mov     word ptr [0e886h], ax
        mov     word ptr [0e888h], ax
        call    L_0D8F8
        jb      L_0BE85
        ret
L_0BE85:
        call    L_0C06D
        jb      L_0BE8B
        ret
L_0BE8B:
        call    L_0C134
        jb      L_0BE91
        ret
L_0BE91:
        call    L_0C15C
        jb      L_0BE97
        ret
L_0BE97:
        mov     al, byte ptr [0e867h]
        mov     ah, 1
        sub     dx, dx
        sub     bx, bx
        ret
        endif
        endif
        endif
loop_0C0D9:
        mov     al, byte ptr [0e867h]
        mov     ah, 1
        sub     dx, dx
        sub     bx, bx
        if      FW_VERSION >= 120
        stc
        endif
        ret
L_0BEAB:
        mov     ax, word ptr [si+8]
        mov     dx, word ptr [si+0ah]
        if      FW_VERSION >= 120
        cmp     dx, 0
        jne     L_0C10D
        endif
        mov     bx, ax
        or      bx, dx
        if      FW_VERSION >= 120
        je      L_0C10D
        pusha
        mov     cx, 1
        mov     bx, ds
        mov     es, bx
        mov     di, 8200h
        call    fn_0D06B
        cmp     word ptr [83feh], 0aa55h
        popa
        jne     L_0C10D
        ret
L_0C10D:
        sub     ax, ax
        sub     dx, dx
        stc
        endif
        ret
fn_0C113:
        cmp     byte ptr [8000h], 0ebh
        je      br_0C123
        cmp     byte ptr [8000h], 0e9h
        je      br_0C123
        jmp     loop_0C0D9
br_0C123:
        mov     si, 8036h
        call    fn_0D547
        db      "FAT12", 00h
        mov     ah, 0ch
        jae     br_0C164
        call    fn_0D547
        db      "FAT16", 00h
        mov     ah, 10h
        jae     br_0C164
        cmp     byte ptr [81c2h], 4
        je      br_0C164
        cmp     word ptr [8013h], 0
        je      br_0C164
        if      FW_VERSION >= 120
        push    ax
        mov     ax, word ptr [8013h]
        sub     dx, dx
        sub     bx, bx
        mov     bl, byte ptr [800dh]
        div     bx
        cmp     ax, 0ff5h
        pop     ax
        jae     br_0C164
        endif
        mov     ah, 0ch
br_0C164:
        mov     byte ptr [0e866h], ah
        if      FW_VERSION >= 110
        mov     ax, word ptr [800bh]
        cmp     al, 0
        cmp     ax, word ptr [0e886h]
        else
        cmp     word ptr [800bh], 200h
        endif
        je      br_0C176
        jmp     loop_0C0D9
br_0C176:
        if      FW_VERSION >= 110
        sub     dx, dx
        endif
        mov     bl, byte ptr [8010h]
        cmp     bl, 2
        je      br_0C184
        jmp     loop_0C0D9
br_0C184:
        mov     ax, word ptr [800eh]
        mov     word ptr [A1_W_0E898], ax
        if      FW_VERSION >= 110
        mov     cx, ax
        mov     ax, word ptr [8016h]
        mov     word ptr [0e89ch], ax
        add     cx, ax
        mov     word ptr [0e89ah], cx
        else
        mov     cx, word ptr [8016h]
        mov     word ptr [0e896h], cx
        endif
        add     ax, cx
        if      FW_VERSION >= 110
        mov     word ptr [0ecb8h], ax
        else
        mov     word ptr [0e894h], ax
        add     ax, cx
        mov     word ptr [0eeb2h], ax
        endif
        mov     word ptr [A1_W_0ECBA], 0
        mov     ax, word ptr [8011h]
        cmp     ax, 400h
        jb      br_0C1AE
        mov     ax, 400h
br_0C1AE:
        if      FW_VERSION >= 110
        mov     word ptr [0ecbch], ax
        else
        mov     word ptr [0eeb6h], ax
        endif
        mov     ax, word ptr [8011h]
        mov     dx, 20h
        mul     dx
        if      FW_VERSION >= 110
        mov     bx, word ptr [0e886h]
        else
        mov     bx, 200h
        endif
        div     bx
        or      dx, dx
        je      br_0C1C4
        inc     ax
br_0C1C4:
        if      FW_VERSION >= 110
        mov     word ptr [0ecbeh], ax
        add     ax, word ptr [0ecb8h]
        else
        add     ax, word ptr [0eeb2h]
        endif
        mov     word ptr [A1_W_0E89E], ax
        mov     di, ax
        mov     al, byte ptr [800dh]
        if      FW_VERSION >= 110
        mov     cl, al
        mov     ah, 0
        endif
        or      al, al
        jne     br_0C1DE
        jmp     loop_0C0D9
br_0C1DE:
        if      FW_VERSION >= 110
        mov     dx, word ptr [0e886h]
        mul     dx
        or      dx, dx
        je      br_0C1EB
        jmp     loop_0C0D9
br_0C1EB:
        cmp     ax, 4001h
        else
        cmp     al, 21h
        endif
        jb      br_0C1F3
        jmp     loop_0C0D9
br_0C1F3:
        if      FW_VERSION >= 110
        mov     word ptr [0e88eh], ax
        mov     ch, 0
        mov     word ptr [0e892h], cx
        else
        sub     ah, ah
        mov     word ptr [0e890h], ax
        mov     bx, 200h
        mul     bx
        mov     word ptr [0e88ch], ax
        endif
        sub     dx, dx
        mov     ax, word ptr [8013h]
        or      ax, ax
        jne     br_0C20C
        mov     ax, word ptr [8020h]
        mov     dx, word ptr [8022h]
br_0C20C:
        sub     ax, di
        sbb     dx, 0
        mov     bx, word ptr [P_E892]
        cmp     dx, bx
        jb      br_0C21C
        jmp     loop_0C0D9
br_0C21C:
        div     bx
        mov     word ptr [A1_W_0E890], ax
        if      FW_VERSION < 110
        mov     ax, 0
        call    fn_0CB47
        endif
        cmp     byte ptr [0e866h], 0ch
        jne     br_0C23C
        mov     ax, word ptr [A1_W_0E898]
        sub     dx, dx
        mov     cx, word ptr [A1_W_0E89C]
        mov     di, 0c000h
        call    fn_0D06B
        if      FW_VERSION >= 120
        call    fn_0CD1B
        endif
        if      FW_VERSION >= 110
        jmp     br_0C245
        endif
br_0C23C:
        call    fn_0CCA8
        mov     ax, 0
        call    fn_0CB47
br_0C245:
        mov     ax, 0
        call    fn_0C504
        call    fn_0C49A
        mov     si, 8003h
        call    fn_0D547
        db      "MPC2KXL", 00h
        if      FW_VERSION >= 110
        jae     br_0C270
        mov     si, 802bh
        call    fn_0D547
        db      "MPC2KXL", 00h
        jae     br_0C270
        jmp     br_0C276
        else
        jb      br_0C276
        endif
br_0C270:
        call    fn_0C2E6
        mov     ah, 0bh
        ret
br_0C276:
        mov     si, 8003h
        call    fn_0D547
        db      "MPC2000", 00h
        jb      br_0C28D
        call    fn_0C2E6
        mov     ah, 0ah
        clc
        ret
br_0C28D:
        mov     si, 8020h
        mov     cx, 20h
        mov     al, 0
tgt_0C295:
        or      al, byte ptr [si]
        inc     si
        loop    tgt_0C295
        cmp     al, 0
        je      br_0C2A0
        jmp     br_0C2D7
br_0C2A0:
        mov     si, 8040h
        mov     cx, 70h
        mov     al, 0
tgt_0C2A8:
        or      al, byte ptr [si]
        inc     si
        loop    tgt_0C2A8
        cmp     al, 0
        jne     br_0C2B3
        jmp     br_0C2D7
br_0C2B3:
        mov     si, 80b0h
        mov     cx, 14ch
        mov     al, 0
tgt_0C2BB:
        or      al, byte ptr [si]
        inc     si
        loop    tgt_0C2BB
        cmp     al, 0
        jne     br_0C2D7
        cmp     word ptr [81feh], 0aa55h
        jne     br_0C2D7
        call    fn_0C2E6
        mov     al, byte ptr [0e867h]
        mov     ah, 4
        sub     bx, bx
        ret
br_0C2D7:
        call    fn_0CC93
        mov     cx, ax
        mov     al, byte ptr [0e867h]
        mov     ah, 0ch
        sub     dx, dx
        sub     bx, bx
        ret
fn_0C2E6:
        mov     si, 8044h
        mov     cx, 1ah
        mov     dh, 0ffh
tgt_0C2EE:
        inc     dh
        lodsw
        mov     bx, ax
        lodsw
        if      FW_VERSION >= 110
        push    ax
        endif
        or      ax, bx
        if      FW_VERSION >= 110
        pop     ax
        endif
        je      br_0C30F
        if      FW_VERSION >= 110
        sub     bx, word ptr [0e87eh]
        sbb     ax, word ptr [0e880h]
        jb      br_0C30D
        sub     dh, 1
        jae     br_0C30F
        mov     dh, 0
        jmp     br_0C30F
br_0C30D:
        endif
        loop    tgt_0C2EE
br_0C30F:
        mov     dl, 0
        push    dx
        call    fn_0CC93
        mov     cx, ax
        pop     dx
        mov     al, byte ptr [0e867h]
        sub     bx, bx
        ret
L_0C06D:
        sub     ax, ax
        sub     dx, dx
        mov     cx, 3
        mov     di, 0
        push    di
        if      FW_VERSION >= 110
        call    fn_0D85A
        else
        call    fn_0D09B
        endif
        pop     di
        call    fn_0C3BB
        jae     br_0C333
        ret
br_0C333:
        mov     si, 4502h
        mov     cl, byte ptr [4500h]
        mov     ch, 0
        mov     dh, cl
        dec     dh
        sub     ax, ax
tgt_0C342:
        add     ax, word ptr [si]
        add     si, 2
        loop    tgt_0C342
        cmp     ax, word ptr [si]
        je      br_0C34F
        jmp     br_0C378
br_0C34F:
        mov     si, 4502h
        mov     di, 0c000h
        mov     cx, 12h
        mov     ax, ds
        mov     es, ax
        rep movsw
        mov     byte ptr [0e803h], 1
        mov     ah, 5
        test    byte ptr [0cah], 2
        jne     br_0C36E
        mov     ah, 6
br_0C36E:
        mov     dl, 0
        mov     al, byte ptr [0e867h]
        sub     si, si
        sub     bx, bx
        ret
br_0C378:
        mov     cl, byte ptr [4900h]
        mov     dh, cl
        dec     dh
        mov     si, 4902h
        mov     ch, 0
        sub     ax, ax
tgt_0C387:
        add     ax, word ptr [si]
        add     si, 2
        loop    tgt_0C387
        cmp     ax, word ptr [si]
        je      br_0C394
        mov     dh, 0
br_0C394:
        mov     si, 4902h
        mov     di, 0c000h
        mov     cx, 12h
        mov     ax, ds
        mov     es, ax
        rep movsw
        mov     byte ptr [0e803h], 1
        mov     ah, 5
        test    byte ptr [0cah], 2
        jne     br_0C3B3
        mov     ah, 6
br_0C3B3:
        mov     dl, 0
        mov     al, byte ptr [0e867h]
        sub     bx, bx
        ret
fn_0C3BB:
        mov     cx, 63h
        sub     ax, ax
        sub     dx, dx
        sub     bx, bx
        cmp     ax, word ptr [di]
        je      L_0C20B
tgt_0C3C8:
        add     ax, word ptr [di]
        adc     dx, 0
        or      bx, word ptr [di]
        add     di, 2
        loop    tgt_0C3C8
        cmp     ax, word ptr [di]
        jne     L_0C20B
        cmp     dx, word ptr [di+2]
        jne     L_0C20B
        or      bx, bx
        je      L_0C20B
        clc
        ret
L_0C20B:
        stc
        ret
L_0C134:
        mov     ax, ds
        mov     es, ax
        mov     si, 0
        call    fn_0D547
        db      "EMU", 00h
        jae     br_0C3F6
        ret
br_0C3F6:
        call    fn_0DB3A
        mov     al, 1
        call    fn_0D8F3
        mov     byte ptr [0e803h], 3
        mov     al, byte ptr [0e867h]
        mov     ah, 8
        sub     dx, dx
        sub     bx, bx
        ret
L_0C15C:
        mov     ax, ds
        mov     es, ax
        mov     si, 4
        call    fn_0D547
        db      "S770 MR25A", 00h
        jae     br_0C425
        ret
br_0C425:
        mov     byte ptr [0e803h], 2
        if      FW_VERSION >= 110
        call    L_0D971
        else
        db      0e8h, 2ch, 15h
        endif
        mov     al, byte ptr [0e867h]
        mov     ah, 9
        sub     dx, dx
        sub     bx, bx
        ret
L_0C186:
        shl     ax, 1
        rcl     dx, 1
        shl     ax, 1
        rcl     dx, 1
        push    si
        mov     si, A1_W_0ED10
        add     al, byte ptr [si+0bh]
        adc     ah, byte ptr [si+0ah]
        adc     dl, byte ptr [si+9]
        adc     dh, byte ptr [si+8]
        pop     si
        ret
tgt_0C451:
        push    ax
        sub     ax, ax
        sub     dx, dx
        mov     word ptr [P_E888], ax
        mov     word ptr [P_E88A], ax
        mov     cx, 1
        mov     di, 8000h
        call    fn_0D06B
        pop     ax
        sub     ah, ah
        shl     ax, 2
        add     ax, 8040h
        mov     si, ax
        lodsw
        mov     word ptr [P_E888], ax
        lodsw
        mov     word ptr [P_E88A], ax
        call    fn_0C113
        ret
tgt_0C47C:
        mov     bl, cl
        mov     bh, 0
        shl     bx, 1
        call    word ptr cs:[bx+TBL_0C488-APP1_CSBASE]
        ret
TBL_0C488:
        dw      fn_0C4CC-APP1_CSBASE, fn_0C4E3-APP1_CSBASE, tgt_0C680-APP1_CSBASE, tgt_0C6D9-APP1_CSBASE
        dw      tgt_0C751-APP1_CSBASE, fn_0C7F9-APP1_CSBASE, tgt_0C570-APP1_CSBASE, fn_0C59B-APP1_CSBASE
        ret
        db      0c3h
fn_0C49A:
        mov     ax, ds
        mov     es, ax
        mov     di, 0d800h
        sub     ax, ax
        mov     cx, 708h
        rep stosw
        mov     si, A1_W_0E157
        mov     di, 0d800h
        mov     cx, 8
tgt_0C4B1:
        mov     al, byte ptr cs:[si]
        inc     si
        stosb
        loop    tgt_0C4B1
        mov     si, 0d800h
        mov     word ptr [si+0ah], 0
        mov     ax, 0
        ret
        db      "ROOT    "
fn_0C4CC:
        push    ax
        mov     bx, 0ch
        mul     bx
        mov     si, ax
        add     si, 0d800h
        mov     dx, word ptr [si+0ah]
        mov     al, byte ptr [si]
        sub     al, 1
        push    ds
        pop     es
        pop     ax
        ret
fn_0C4E3:
        call    fn_0C4CC
        jae     br_0C4E9
        ret
br_0C4E9:
        cmp     byte ptr [si], 2eh
        stc
        jne     br_0C4F0
        ret
br_0C4F0:
        mov     word ptr [P_ECC6], ax
        push    ax
        push    si
        push    es
        mov     ax, word ptr [si+0ah]
        mov     word ptr [A1_W_0ECC0], ax
        call    fn_0C504
        pop     es
        pop     si
        pop     ax
        clc
        ret
fn_0C504:
        push    ax
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        sub     ax, ax
        mov     cx, 4000h
        rep stosw
        pop     ax
        cmp     ax, 0
        je      br_0C54F
        mov     word ptr [A1_W_0ECCE], ax
        mov     di, 0
loop_0C51F:
        mov     ax, word ptr [A1_W_0ECCE]
        mov     word ptr [A1_W_0ECC2], ax
        push    di
        call    fn_0CADE
        pop     di
        mov     si, 8000h
        mov     cx, word ptr [A1_W_0E88E]
        shr     cx, 1
        mov     ax, ds
        mov     es, ax
        rep movsw
        cmp     word ptr [A1_W_0ECCE], -1
        jne     loop_0C51F
        mov     ax, di
        sub     ax, 0
        shr     ax, 5
        mov     word ptr [A1_W_0EAB0], ax
        call    fn_0C825
        ret
br_0C54F:
        if      FW_VERSION >= 110
        mov     ax, word ptr [0ecbch]
        mov     word ptr [0eab0h], ax
        mov     ax, word ptr [0ecb8h]
        mov     dx, word ptr [0ecbah]
        mov     cx, word ptr [0ecbeh]
        else
        mov     ax, word ptr [0eeb2h]
        mov     dx, word ptr [0eeb4h]
        mov     cx, word ptr [0eeb6h]
        mov     word ptr [0ecaah], cx
        shr     cx, 4
        endif
        mov     di, 0
        call    fn_0D06B
        call    fn_0C825
        mov     word ptr [A1_W_0ECC2], 0
        ret
tgt_0C570:
        shl     ax, 5
        add     ax, 0
        mov     si, ax
        cmp     byte ptr [si+0bh], 10h
        stc
        mov     ax, 0
        je      br_0C583
        ret
br_0C583:
        cmp     byte ptr [si], 2eh
        stc
        mov     ax, 0
        jne     br_0C58D
        ret
br_0C58D:
        push    si
        call    fn_0C62F
        pop     si
        mov     ax, ds
        mov     es, ax
        call    fn_0C7F9
        clc
        ret
fn_0C59B:
        mov     si, 0d800h
        cmp     byte ptr [si], 2eh
        je      br_0C5DE
        push    word ptr [A1_W_0ECC0]
        mov     ax, 0
        mov     word ptr [P_ECC6], ax
        mov     word ptr [A1_W_0ECC0], ax
        call    fn_0C504
        call    fn_0C49A
        pop     ax
        mov     bx, 0ffffh
        mov     si, 0ffe0h
loop_0C5BD:
        inc     bx
        add     si, 20h
        cmp     byte ptr [si], 0
        je      br_0C5D7
        push    ax
        call    fn_0C8E5
        pop     ax
        jb      loop_0C5BD
        cmp     ax, word ptr [si+1ah]
        jne     loop_0C5BD
        mov     ax, 0
        clc
        ret
br_0C5D7:
        mov     ax, 0
        mov     bx, ax
        clc
        ret
br_0C5DE:
        cmp     word ptr [si+16h], 0
        jne     br_0C5F9
        push    word ptr [si+0ah]
        mov     ax, 0
        call    fn_0C504
        call    fn_0C62F
        pop     ax
        call    fn_0C612
        call    fn_0C4E3
        clc
        ret
br_0C5F9:
        mov     ax, word ptr [si+0ah]
        push    ax
        call    fn_0C504
        mov     ax, word ptr [3ah]
        call    fn_0C504
        call    fn_0C62F
        pop     ax
        call    fn_0C612
        call    fn_0C4E3
        clc
        ret
fn_0C612:
        mov     cx, 0
        mov     si, 0d800h
loop_0C618:
        cmp     byte ptr [si], 0
        je      L_0C62B
        cmp     ax, word ptr [si+0ah]
        jne     br_0C625
        mov     ax, cx
        ret
br_0C625:
        inc     cx
        add     si, 0ch
        jmp     loop_0C618
L_0C62B:
        mov     ax, 0
        ret
fn_0C62F:
        mov     ax, ds
        mov     es, ax
        mov     di, 0d800h
        sub     ax, ax
        mov     cx, 708h
        rep stosw
        mov     di, 0d800h
        mov     si, 0
        mov     word ptr [P_ECC8], 0
loop_0C649:
        cmp     byte ptr [si], 0
        je      br_0C67F
        cmp     byte ptr [si+0bh], 10h
        jne     br_0C676
        mov     ax, ds
        mov     es, ax
        push    si
        push    di
        mov     cx, 8
        rep movsb
        pop     di
        pop     si
        mov     ax, word ptr [si+1ah]
        mov     word ptr [di+0ah], ax
        add     di, 0ch
        inc     word ptr [P_ECC8]
        cmp     word ptr [P_ECC8], 12bh
        je      br_0C67F
br_0C676:
        add     si, 20h
        cmp     si, 8000h
        jb      loop_0C649
br_0C67F:
        ret
tgt_0C680:
        push    si
        push    dx
        mov     ax, ds
        mov     es, ax
        mov     di, A1_W_0ECFC
        mov     al, 20h
        mov     cx, 14h
        rep stosb
        mov     ax, word ptr [P_ECC6]
        mov     bx, 0ch
        mul     bx
        add     ax, 0d800h
        mov     si, ax
        mov     di, A1_W_0ECFC
        mov     cx, 8
        rep movsb
        call    fn_0C59B
        mov     ax, ds
        mov     es, ax
        mov     si, A1_W_0ECFC
        call    fn_0C918
        pop     es
        pop     di
        jae     br_0C6B7
        ret
br_0C6B7:
        push    di
        push    es
        mov     si, word ptr [A1_W_0EAB6]
        mov     cx, 8
tgt_0C6C0:
        mov     al, byte ptr es:[di]
        mov     byte ptr [si], al
        inc     si
        inc     di
        loop    tgt_0C6C0
        call    FN_0CAA0
        call    fn_0C62F
        pop     es
        pop     si
        call    fn_0C7F9
        call    fn_0C4E3
        clc
        ret
tgt_0C6D9:
        mov     cx, 0
        mov     dx, 0
        call    fn_0CB67
        jae     L_0C50D
        ret
L_0C50D:
        mov     byte ptr [di+0bh], 10h
        call    fn_0CE3D
        mov     ax, ds
        mov     es, ax
        mov     di, 8000h
        sub     ax, ax
        mov     cx, 2000h
        rep stosw
        push    ds
        mov     ax, cs
        mov     ds, ax
        mov     si, P_C73B
        mov     di, 8000h
        mov     cx, 0bh
        rep movsb
        mov     si, P_C746
        mov     di, 8020h
        mov     cx, 0bh
        rep movsb
        pop     ds
        mov     di, 8000h
        mov     ax, word ptr [A1_W_0ECCE]
        mov     word ptr [di+1ah], ax
        mov     byte ptr [di+0bh], 10h
        mov     ax, word ptr [A1_W_0ECC0]
        mov     word ptr [di+3ah], ax
        mov     byte ptr [di+2bh], 10h
        call    fn_0D05A
        call    FN_0CAA0
        mov     ax, word ptr [P_ECC6]
        call    fn_0C4E3
        clc
        ret
L_0C73B:
        db      2eh, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h
L_0C746:
        db      2eh, 2eh, 20h, 20h
        db      20h, 20h, 20h, 20h, 20h, 20h
        db      20h
tgt_0C751:
        mov     ax, word ptr [A1_W_0ECC0]
        cmp     ax, 0
        jne     br_0C75A
        ret
br_0C75A:
        mov     word ptr [P_ECC4], ax
        call    fn_0C782
        call    fn_0CE3D
        call    fn_0C825
        call    fn_0C62F
        clc
        ret
loop_0C76B:
        mov     si, word ptr [A1_W_0EAB6]
        mov     ax, word ptr [si+1ah]
        mov     word ptr [P_ECC4], ax
        call    fn_0C782
        call    fn_0CE3D
        call    fn_0C825
        call    FN_0CAA0
        ret
fn_0C782:
        call    fn_0C504
        mov     si, 0ffe0h
loop_0C788:
        call    fn_0C7E3
        jb      br_0C798
        cmp     byte ptr [si+0bh], 10h
        jne     loop_0C788
        mov     ax, word ptr [si+1ah]
        jmp     fn_0C782
br_0C798:
        call    fn_0C7CD
        mov     si, 0
        push    word ptr [si+1ah]
        mov     ax, word ptr [si+3ah]
        push    ax
        call    fn_0C504
        pop     bx
        pop     ax
        mov     si, 0ffe0h
loop_0C7AD:
        add     si, 20h
        cmp     byte ptr [si], 0
        je      br_0C7C6
        cmp     ax, word ptr [si+1ah]
        jne     loop_0C7AD
        pusha
        call    fn_0CF63
        popa
        pusha
        mov     ax, bx
        call    fn_0CAA3
        popa
br_0C7C6:
        cmp     ax, word ptr [P_ECC4]
        jne     loop_0C788
        ret
fn_0C7CD:
        mov     si, 0ffe0h
loop_0C7D0:
        call    fn_0C7E3
        jae     br_0C7D6
        ret
br_0C7D6:
        cmp     byte ptr [si+0bh], 10h
        je      loop_0C7D0
        push    si
        call    fn_0CF63
        pop     si
        jmp     loop_0C7D0
fn_0C7E3:
        add     si, 20h
        cmp     byte ptr [si], 0
        je      br_0C7F7
        call    fn_0C8E5
        jb      fn_0C7E3
        cmp     byte ptr [si], 2eh
        je      fn_0C7E3
        clc
        ret
br_0C7F7:
        stc
        ret
fn_0C7F9:
        mov     di, 0d800h
        mov     ax, 0
loop_0C7FF:
        cmp     byte ptr [di], 0
        je      br_0C810
        call    fn_0C812
        jb      br_0C80A
        ret
br_0C80A:
        inc     ax
        add     di, 0ch
        jmp     loop_0C7FF
br_0C810:
        stc
        ret
fn_0C812:
        pusha
        mov     cx, 8
tgt_0C816:
        mov     al, byte ptr es:[si]
        cmp     al, byte ptr [di]
        stc
        jne     br_0C823
        inc     si
        inc     di
        loop    tgt_0C816
        clc
br_0C823:
        popa
        ret
fn_0C825:
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        mov     si, 0
loop_0C82F:
        mov     al, byte ptr [si]
        cmp     al, 0
        je      br_0C84F
        cmp     al, 0e5h
        je      br_0C84A
        cmp     al, 5
        je      br_0C84A
        cmp     byte ptr [si+0bh], 0fh
        je      br_0C84A
        mov     cx, 10h
        rep movsw
        jmp     loop_0C82F
br_0C84A:
        add     si, 20h
        jmp     loop_0C82F
br_0C84F:
        mov     cx, 8000h
        sub     cx, di
        jne     L_0C857
        ret
L_0C857:
        jae     br_0C85A
        ret
br_0C85A:
        shr     cx, 1
        sub     ax, ax
        rep stosw
        ret
fn_0C861:
        dec     ax
loop_0C862:
        inc     ax
        call    fn_0C8FD
        cmp     ax, word ptr [A1_W_0EAB0]
        jae     loop_0C88C
        mov     si, ax
        shl     si, 5
        add.w   si, 0
        cmp     byte ptr [si], 0
        je      loop_0C88C
        push    ax
        call    fn_0C8E5
        pop     ax
        jb      loop_0C862
loop_0C881:
        push    ax
        mov     word ptr [A1_W_0EAB6], si
        call    fn_0D484
        pop     ax
        clc
        ret
loop_0C88C:
        push    ax
        sub     bx, bx
        sub     dx, dx
        mov     ax, ds
        mov     es, ax
        mov     si, 0e868h
        pop     ax
        stc
        ret
tgt_0C89B:
        call    fn_0C8FD
        cmp     ax, word ptr [A1_W_0EAB0]
        jb      loop_0C8A8
        mov     ax, word ptr [A1_W_0EAB0]
        dec     ax
loop_0C8A8:
        push    ax
        shl     ax, 5
        add     ax, 0
        mov     si, ax
        call    fn_0C8E5
        pop     ax
        jb      br_0C8BE
        cmp     byte ptr [si], 2eh
        je      loop_0C88C
        jmp     loop_0C881
br_0C8BE:
        cmp     ax, 0
        je      loop_0C88C
        dec     ax
        jmp     loop_0C8A8
fn_0C8C6:
        mov     cx, word ptr [A1_W_0EAB0]
        mov     di, 0
tgt_0C8CD:
        mov     al, byte ptr [di]
        cmp     al, 0
        jne     br_0C8D4
        ret
br_0C8D4:
        cmp     al, 5
        jne     br_0C8D9
        ret
br_0C8D9:
        cmp     al, 0e5h
        jne     br_0C8DE
        ret
br_0C8DE:
        add     di, 20h
        loop    tgt_0C8CD
        stc
        ret
fn_0C8E5:
        mov     al, byte ptr [si]
        cmp     al, 0
        je      br_0C8FB
        cmp     al, 0e5h
        je      br_0C8FB
        cmp     al, 5
        je      br_0C8FB
        test    byte ptr [si+0bh], 0eh
        jne     br_0C8FB
        clc
        ret
br_0C8FB:
        stc
        ret
fn_0C8FD:
        push    ax
        mov     ax, ds
        mov     es, ax
        mov     di, 0e868h
        push    di
        mov     al, 20h
        mov     cx, 14h
        rep stosb
        pop     di
        mov     byte ptr [di+10h], 2eh
        pop     ax
        ret
tgt_0C914:
        call    fn_0C918
        db      0c3h
fn_0C918:
        mov     dx, 0ffffh
        mov     bp, si
loop_0C91D:
        inc     dx
        push    es
        push    bp
        mov     ax, dx
        call    fn_0C861
        mov     dx, ax
        pop     bp
        pop     es
        mov     ax, 8
        jae     br_0C92F
        ret
br_0C92F:
        mov     cx, 14h
        mov     si, bp
        mov     di, 0e868h
tgt_0C937:
        mov     al, byte ptr es:[si]
        cmp     al, 61h
        jb      br_0C944
        cmp     al, 7bh
        jae     br_0C944
        sub     al, 20h
br_0C944:
        cmp     al, byte ptr [di]
        jne     loop_0C91D
        inc     si
        inc     di
        loop    tgt_0C937
        sub     ax, ax
        clc
        ret
tgt_0C950:
        call    fn_0C918
        jae     br_0C956
        ret
br_0C956:
        mov     si, word ptr [A1_W_0EAB6]
        mov     ax, word ptr [si+1ah]
        cmp     ax, 2
        jb      br_0C985
        cmp     byte ptr [si+0bh], 10h
        je      br_0C985
        mov     word ptr [A1_W_0ECCE], ax
        mov     word ptr [A1_W_0ECD0], 0
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        mov     word ptr [A1_W_0ECCA], bx
        mov     word ptr [A1_W_0ECCC], dx
        push    ds
        pop     es
        sub     ax, ax
        clc
        ret
br_0C985:
        mov     ax, 0ah
        stc
        ret
tgt_0C98A:
        mov     ax, word ptr [A1_W_0ECCA]
        or      ax, word ptr [A1_W_0ECCC]
        je      br_0C9B9
        sub     word ptr [A1_W_0ECCA], 1
        sbb     word ptr [A1_W_0ECCC], 0
        cmp     word ptr [A1_W_0ECD0], 0
        jne     br_0C9A7
        call    fn_0CADE
br_0C9A7:
        mov     si, word ptr [A1_W_0ECD2]
        mov     al, byte ptr [si]
        inc     word ptr [A1_W_0ECD2]
        dec     word ptr [A1_W_0ECD0]
        mov     ah, 0
        clc
        ret
br_0C9B9:
        stc
        ret
tgt_0C9BB:
        mov     ax, word ptr [A1_W_0ECCA]
        or      ax, word ptr [A1_W_0ECCC]
        jne     br_0C9C5
        ret
br_0C9C5:
        sub     word ptr [A1_W_0ECCA], cx
        sbb     word ptr [A1_W_0ECCC], 0
        jae     br_0C9E0
        add     cx, word ptr [A1_W_0ECCA]
        mov     word ptr [A1_W_0ECCA], 0
        mov     word ptr [A1_W_0ECCC], 0
br_0C9E0:
        push    cx
        call    fn_0C9E7
        pop     ax
        clc
        ret
fn_0C9E7:
        cmp     cx, word ptr [A1_W_0ECD0]
        jbe     br_0CA12
        sub     cx, word ptr [A1_W_0ECD0]
        push    cx
        mov     cx, word ptr [A1_W_0ECD0]
        mov     word ptr [A1_W_0ECD0], 0
        mov     si, word ptr [A1_W_0ECD2]
        rep movsb
        push    di
        push    es
        call    fn_0CADE
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [A1_W_0ECD0], 0
        jne     fn_0C9E7
        ret
br_0CA12:
        sub     word ptr [A1_W_0ECD0], cx
        mov     si, word ptr [A1_W_0ECD2]
        rep movsb
        mov     word ptr [A1_W_0ECD2], si
        ret
fn_0CA21:
        mov     ax, word ptr [A1_W_0ECCA]
        or      ax, word ptr [A1_W_0ECCC]
        jne     br_0CA2B
        ret
br_0CA2B:
        sub     word ptr [A1_W_0ECCA], cx
        sbb     word ptr [A1_W_0ECCC], 0
        jae     br_0CA46
        add     cx, word ptr [A1_W_0ECCA]
        mov     word ptr [A1_W_0ECCA], 0
        mov     word ptr [A1_W_0ECCC], 0
br_0CA46:
        push    cx
        call    fn_0CA4D
        pop     ax
        clc
        ret
fn_0CA4D:
        cmp     cx, word ptr [A1_W_0ECD0]
        jbe     br_0CA78
        sub     cx, word ptr [A1_W_0ECD0]
        push    cx
        mov     cx, word ptr [A1_W_0ECD0]
        mov     word ptr [A1_W_0ECD0], 0
        mov     si, word ptr [A1_W_0ECD2]
        rep lodsb
        push    di
        push    es
        call    fn_0CADE
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [A1_W_0ECD0], 0
        jne     fn_0CA4D
        ret
br_0CA78:
        sub     word ptr [A1_W_0ECD0], cx
        mov     si, word ptr [A1_W_0ECD2]
        rep lodsb
        mov     word ptr [A1_W_0ECD2], si
        ret
loop_0CA87:
        sub     ax, 8000h
        sbb     dx, 0
        jb      br_0CA99
        pusha
        mov     cx, 8000h
        call    fn_0CA21
        popa
        jmp     loop_0CA87
br_0CA99:
        add     ax, 8000h
        mov     cx, ax
        jmp     fn_0CA21
FN_0CAA0:
        mov     ax, word ptr [A1_W_0ECC0]
fn_0CAA3:
        cmp     ax, 0
        jne     br_0CABA
        mov     di, 0
        if      FW_VERSION >= 110
        mov     ax, word ptr [0ecb8h]
        mov     dx, word ptr [0ecbah]
        mov     cx, word ptr [0ecbeh]
        else
        mov     cx, word ptr [0ecaah]
        shr     cx, 4
        mov     ax, word ptr [0eeb2h]
        mov     dx, word ptr [0eeb4h]
        endif
        call    fn_0D0AE
        ret
br_0CABA:
        mov     word ptr [A1_W_0ECCE], ax
        mov     di, 0
loop_0CAC0:
        mov     ax, word ptr [A1_W_0ECCE]
        cmp     ax, 0ffffh
        jne     br_0CAC9
        ret
br_0CAC9:
        call    fn_0D049
        push    di
        mov     cx, word ptr [P_E892]
        call    fn_0D0AE
        call    fn_0CB02
        pop     di
        add     di, word ptr [A1_W_0E88E]
        jmp     loop_0CAC0
fn_0CADE:
        mov     ax, word ptr [A1_W_0ECCE]
        cmp     ax, 0ffffh
        jne     br_0CAE7
        ret
br_0CAE7:
        call    fn_0D049
        mov     cx, word ptr [P_E892]
        mov     di, 8000h
        mov     word ptr [A1_W_0ECD2], di
        call    fn_0D06B
        mov     ax, word ptr [A1_W_0E88E]
        mov     word ptr [A1_W_0ECD0], ax
        call    fn_0CB02
        ret
fn_0CB02:
        cmp     byte ptr [0e866h], 0ch
        jne     br_0CB0C
        jmp     br_0D3EB
br_0CB0C:
        mov     ax, word ptr [A1_W_0ECCE]
        if      FW_VERSION >= 110
        call    fn_0CB30
        mov     bx, word ptr [0e886h]
        shr     bx, 1
        dec     bx
        and     ax, bx
        else
        cmp     ah, byte ptr [0e8a3h]
        je      L_0C86B
        call    fn_0CB47
L_0C86B:
        sub     ah, ah
        endif
        shl     ax, 1
        if      FW_VERSION >= 110
        add     ax, 0c000h
        else
        add     ax, 0e8a6h
        endif
        mov     si, ax
        mov     ax, word ptr [si]
        cmp     ax, 0fff8h
        jb      br_0CB2C
        mov     ax, 0ffffh
br_0CB2C:
        mov     word ptr [A1_W_0ECCE], ax
        ret
        if      FW_VERSION >= 110
fn_0CB30:
        push    ax
        mov     dx, 0
        mov     bx, word ptr [0e886h]
        shr     bx, 1
        div     bx
        cmp     al, byte ptr [0e8a9h]
        pop     ax
        je      br_0CB46
        call    fn_0CB47
br_0CB46:
        ret
        endif
fn_0CB47:
        push    ax
        if      FW_VERSION >= 110
        mov     dx, 0
        mov     bx, word ptr [0e886h]
        shr     bx, 1
        div     bx
        mov     byte ptr [0e8a9h], al
        else
        mov     byte ptr [0e8a3h], ah
        mov     al, ah
        sub     ah, ah
        endif
        add     ax, word ptr [A1_W_0E898]
        sub     dx, dx
        if      FW_VERSION >= 110
        mov     cx, 1
        else
        mov     cx, 2
        endif
        mov     di, A1_W_0C000
        call    fn_0D06B
        pop     ax
        ret
fn_0CB67:
        push    es
        push    si
        push    cx
        push    dx
        mov     ax, word ptr [P_E8A0]
        mov     dx, word ptr [P_E8A2]
        mov     word ptr [P_E8A4], ax
        mov     word ptr [P_E8A6], dx
        call    fn_0C8C6
        jae     br_0CB81
        call    fn_0CBC5
br_0CB81:
        pop     dx
        pop     cx
        pop     si
        pop     es
        mov     word ptr [A1_W_0EAB6], di
        mov     word ptr [di+16h], cx
        mov     word ptr [di+18h], dx
        push    es
        push    si
        push    di
        call    fn_0CC4E
        pop     di
        pop     si
        pop     es
        jae     br_0CB9D
        jmp     NEAR X_0CC2B
br_0CB9D:
        mov     word ptr [A1_W_0ECCE], ax
        mov     word ptr [di+1ah], ax
        call    fn_0D4E2
        sub     ax, ax
        mov     word ptr [di+1ch], ax
        mov     word ptr [di+1eh], ax
        mov     byte ptr [di+0bh], al
        mov     word ptr [A1_W_0ECD4], 0
        mov     byte ptr [A1_B_0E8A8], 2
        mov     byte ptr [0e87ch], 0
        sub     ax, ax
        clc
        ret
fn_0CBC5:
        cmp     byte ptr [0e866h], 0ch
        je      BR_0CC25
        cmp     word ptr [A1_W_0ECC0], 0
        je      BR_0CC25
        mov     ax, word ptr [A1_W_0EAB0]
        cmp     ax, 400h
        je      BR_0CC25
        mov     cx, word ptr [A1_W_0E88E]
        shr     cx, 5
        add     ax, cx
        cmp     ax, 400h
        ja      BR_0CC25
        mov     ax, word ptr [A1_W_0ECC2]
        mov     word ptr [A1_W_0ECCE], ax
        if      FW_VERSION >= 110
        call    fn_0CB30
        else
        cmp     ah, byte ptr [0e8a3h]
        je      L_0C92D
        call    fn_0CB47
L_0C92D:
        endif
        call    fn_0CE8C
        jb      X_0CC2B
        push    ax
        call    fn_0CE5F
        mov     ax, ds
        mov     es, ax
        mov     di, 8000h
        mov     cx, word ptr [A1_W_0E88E]
        shr     cx, 1
        mov     ax, 0
        rep stosw
        pop     ax
        call    fn_0D049
        mov     cx, word ptr [P_E892]
        mov     di, 8000h
        call    fn_0D0AE
        mov     ax, word ptr [1ah]
        call    fn_0C504
        call    fn_0C8C6
        ret
BR_0CC25:
        mov     ax, 2
        jmp     loop_0BE05
X_0CC2B:
        mov     si, word ptr [A1_W_0EAB6]
        call    fn_0CF63
        call    fn_0C825
        mov     ax, word ptr [P_E8A4]
        mov     dx, word ptr [P_E8A6]
        mov     word ptr [P_E8A0], ax
        mov     word ptr [P_E8A2], dx
        mov     byte ptr [A1_B_0E8A8], 0
        mov     ax, 3
        jmp     loop_0BE05
fn_0CC4E:
        cmp     byte ptr [0e866h], 10h
        je      br_0CC58
        jmp     br_0D408
br_0CC58:
        sub     ax, ax
        call    fn_0CB47
        mov     ax, 2
        mov     si, A1_W_0C000
loop_0CC63:
        if      FW_VERSION >= 110
        mov     bx, word ptr [0e886h]
        shr     bx, 1
        dec     bx
        and     bx, ax
        else
        mov     bx, ax
        sub     bh, bh
        endif
        shl     bx, 1
        cmp     word ptr [bx+si], 0
        jne     br_0CC78
        mov     word ptr [bx+si], 0ffffh
        ret
br_0CC78:
        inc     ax
        cmp     ax, word ptr [A1_W_0E890]
        je      br_0CC91
        if      FW_VERSION < 110
        cmp     al, 0
        jne     loop_0CC63
        endif
        if      FW_VERSION >= 111
        mov     bx, word ptr [0e886h]
        shr     bx, 1
        dec     bx
        and     bx, ax
        jne     loop_0CC63
        endif
        push    si
        call    fn_0CB47
        pop     si
        jmp     loop_0CC63
br_0CC91:
        stc
        ret
fn_0CC93:
        mov     ax, word ptr [P_E8A0]
        mov     dx, word ptr [P_E8A2]
        mov     bx, 64h
        cmp     dx, bx
        jae     br_0CCA4
        div     bx
        ret
br_0CCA4:
        mov     ax, 0ea60h
        ret
fn_0CCA8:
        if      FW_VERSION < 120
        cmp     byte ptr [0e866h], 10h
        jne     fn_0CD1B
        endif
        sub     dx, dx
        sub     cx, cx
        mov     di, 1
        mov     bp, word ptr [A1_W_0E890]
        mov     ax, word ptr [A1_W_0E898]
        mov     word ptr [A1_W_0E8AA], ax
loop_0CCB9:
        mov     bx, 4000h
        sub     bp, bx
        jae     br_0CCC4
        add     bx, bp
        sub     bp, bp
br_0CCC4:
        pusha
        if      FW_VERSION >= 110
        mov     ax, 8000h
        mov     dx, 0
        mov     bx, word ptr [0e886h]
        div     bx
        mov     cx, ax
        mov     ax, word ptr [0e8aah]
        else
        mov     ax, word ptr [0e8a4h]
        endif
        sub     dx, dx
        if      FW_VERSION < 110
        mov     cx, 40h
        endif
        mov     di, 0
        call    fn_0D06B
        if      FW_VERSION >= 110
        add     word ptr [0e8aah], cx
        else
        add     word ptr [0e8a4h], 40h
        endif
        popa
        mov     si, 0
loop_0CCE6:
        lodsw
        sub     ax, di
        adc     dx, cx
        dec     bx
        jne     loop_0CCE6
        cmp     bp, cx
        jne     loop_0CCB9
        mov     ax, word ptr [P_E892]
        mul     dx
        shr     dx, 1
        rcr     ax, 1
        if      FW_VERSION >= 110
        cmp     word ptr [0e886h], 200h
        je      loop_0CD13
        shl     ax, 1
        rcl     dx, 1
        cmp     word ptr [0e886h], 400h
        je      loop_0CD13
        shl     ax, 1
        rcl     dx, 1
        endif
loop_0CD13:
        mov     word ptr [P_E8A0], ax
        mov     word ptr [P_E8A2], dx
        ret
fn_0CD1B:
        mov     si, 0c000h
        mov     cx, 2
        mov     dx, 0
loop_0CD24:
        inc     cx
        cmp     cx, word ptr [A1_W_0E890]
        je      br_0CD4D
        mov     bx, cx
        shr     bx, 1
        pushf
        add     bx, cx
        mov     ax, word ptr [bx+si]
        popf
        jb      br_0CD42
        and     ax, 0fffh
        cmp     ax, 0
        jne     loop_0CD24
        inc     dx
        jmp     loop_0CD24
br_0CD42:
        and     ax, 0fff0h
        cmp     ax, 0
        jne     loop_0CD24
        inc     dx
        jmp     loop_0CD24
br_0CD4D:
        mov     ax, word ptr [P_E892]
        mul     dx
        if      FW_VERSION >= 120
        shr     dx, 1
        rcr     ax, 1
        else
        shr     ax, 1
        sub     dx, dx
        endif
        jmp     loop_0CD13
tgt_0CD58:
        mov     di, word ptr [A1_W_0EAB6]
        add     word ptr [di+1ch], 1
        adc     word ptr [di+1eh], 0
        mov     di, word ptr [A1_W_0ECD4]
        mov     byte ptr [di-8000h], al
        inc     di
        cmp     di, word ptr [A1_W_0E88E]
        jne     br_0CD80
        call    fn_0D05A
        call    fn_0CE8C
        jae     br_0CD7E
        jmp     X_0CC2B
br_0CD7E:
        sub     di, di
br_0CD80:
        mov     word ptr [A1_W_0ECD4], di
        sub     ax, ax
        ret
tgt_0CD87:
        mov     di, word ptr [A1_W_0EAB6]
        add     word ptr [di+1ch], cx
        adc     word ptr [di+1eh], 0
loop_0CD92:
        mov     di, 8000h
        mov     bx, word ptr [A1_W_0ECD4]
        add     di, bx
        mov     ax, word ptr [A1_W_0E88E]
        sub     ax, bx
        cmp     cx, ax
        jb      br_0CDDF
        cmp     byte ptr [0e87ch], 0
        je      br_0CDB7
        pusha
        push    es
        call    fn_0CE8C
        pop     es
        popa
        jae     br_0CDB7
        jmp     X_0CC2B
br_0CDB7:
        mov     byte ptr [0e87ch], 1
        sub     cx, ax
        mov     word ptr [A1_W_0ECD4], 0
        push    cx
        mov     cx, ax
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
        mov     ds, ax
        push    si
        push    es
        call    fn_0D05A
        pop     es
        pop     si
        pop     cx
        jmp     loop_0CD92
br_0CDDF:
        add     word ptr [A1_W_0ECD4], cx
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
        mov     ds, ax
        sub     ax, ax
        ret
tgt_0CDF4:
        sub     ax, ax
        xchg    al, byte ptr [A1_B_0E8A8]
        cmp     al, 2
        jne     br_0CE3B
        cmp     word ptr [A1_W_0ECD4], 0
        je      br_0CE2D
        cmp     byte ptr [0e87ch], 0
        je      br_0CE14
        call    fn_0CE8C
        jae     br_0CE14
        jmp     X_0CC2B
br_0CE14:
        mov     ax, ds
        mov     es, ax
        mov     cx, word ptr [A1_W_0E88E]
        mov     di, word ptr [A1_W_0ECD4]
        sub     cx, di
        add     di, 8000h
        mov     al, 0
        rep stosb
        call    fn_0D05A
br_0CE2D:
        mov     si, word ptr [A1_W_0EAB6]
        or      byte ptr [si+0bh], 20h
        call    fn_0CE3D
        call    FN_0CAA0
br_0CE3B:
        clc
        ret
fn_0CE3D:
        cmp     byte ptr [0e866h], 0ch
        je      fn_0CE46
        jmp     fn_0CE5F
fn_0CE46:
        mov     ax, word ptr [A1_W_0E898]
        sub     dx, dx
        mov     cx, word ptr [A1_W_0E89C]
        mov     di, 0c000h
        call    fn_0D0AE
        mov     ax, word ptr [A1_W_0E89A]
        call    fn_0D0AE
        call    FN_0CAA0
        ret
fn_0CE5F:
        mov     al, byte ptr [A1_B_0E8A9]
        mov     ah, 0
        push    ax
        add     ax, word ptr [A1_W_0E898]
        sub     dx, dx
        mov     cx, 1
        mov     di, A1_W_0C000
        call    fn_0D0AE
        pop     ax
        add     ax, word ptr [A1_W_0E89A]
        sub     dx, dx
        mov     cx, 1
        mov     di, A1_W_0C000
        call    fn_0D0AE
        ret
        mov     cl, 2ah
        call    L_0CE3C
        clc
        ret
fn_0CE8C:
        cmp     byte ptr [0e866h], 10h
        je      br_0CE96
        jmp     br_0D442
br_0CE96:
        if      FW_VERSION >= 110
        mov     bp, 0
        endif
        call    fn_0CEEC
        jae     br_0CE9F
        ret
br_0CE9F:
        push    ax
        if      FW_VERSION >= 110
        push    ax
        mov     ax, word ptr [0e892h]
        mov     dx, word ptr [0e886h]
        mul     dx
        shr     ax, 0ah
        sub     word ptr [0e8a0h], ax
        sbb     word ptr [0e8a2h], 0
        pop     ax
        mov     dx, word ptr [0e886h]
        else
        mov     dx, word ptr [0e890h]
        endif
        shr     dx, 1
        if      FW_VERSION >= 110
        dec     dx
        else
        sub     word ptr [0e89ah], dx
        sbb     word ptr [0e89ch], 0
        endif
        mov     bx, ax
        xchg    bx, word ptr [A1_W_0ECCE]
        mov     cx, bx
        if      FW_VERSION >= 110
        and     bx, dx
        else
        sub     bh, bh
        endif
        shl     bx, 1
        if      FW_VERSION >= 110
        mov     word ptr [bx-4000h], ax
        or      bp, bp
        else
        mov     word ptr [bx-175ah], ax
        cmp     ah, ch
        endif
        je      br_0CEDE
        if      FW_VERSION >= 110
        push    dx
        endif
        push    ax
        call    fn_0CE5F
        pop     ax
        push    ax
        call    fn_0CB47
        pop     ax
        if      FW_VERSION >= 110
        pop     dx
        endif
br_0CEDE:
        if      FW_VERSION >= 110
        and     ax, dx
        else
        sub     ah, ah
        endif
        shl     ax, 1
        mov     bx, ax
        mov     word ptr [bx+A1_TBL_0C000], 0ffffh
        pop     ax
        ret
fn_0CEEC:
        mov     ax, word ptr [A1_W_0ECCE]
        if      FW_VERSION >= 110
        mov     dx, word ptr [0e886h]
        shr     dx, 1
        dec     dx
        endif
        mov     si, A1_W_0C000
loop_0CEF9:
        mov     bx, ax
        if      FW_VERSION >= 110
        and     bx, dx
        else
        sub     bh, bh
        endif
        shl     bx, 1
        cmp     word ptr [bx+si], 0
        jne     br_0CF05
        ret
br_0CF05:
        inc     ax
        cmp     ax, word ptr [A1_W_0E890]
        stc
        jne     br_0CF0E
        ret
br_0CF0E:
        if      FW_VERSION >= 110
        mov     bx, ax
        and     bx, dx
        else
        cmp     al, 0
        endif
        jne     loop_0CEF9
        push    ax
        if      FW_VERSION >= 110
        push    dx
        mov     dx, 0
        mov     bx, word ptr [0e886h]
        shr     bx, 1
        div     bx
        else
        mov     al, ah
        sub     ah, ah
        endif
        add     ax, word ptr [A1_W_0E898]
        sub     dx, dx
        mov     cx, 1
        if      FW_VERSION >= 110
        mov     di, 0d000h
        else
        mov     di, 0eaa6h
        endif
        push    di
        call    fn_0D06B
        pop     si
        if      FW_VERSION >= 110
        pop     dx
        endif
        pop     ax
        if      FW_VERSION >= 110
        mov     bp, 1
        endif
        jmp     loop_0CEF9
tgt_0CF39:
        mov     es, dx
        mov     di, word ptr [A1_W_0EAB6]
        call    fn_0D4E2
        call    FN_0CAA0
        ret
tgt_0CF46:
        call    fn_0C918
        jae     br_0CF4C
        ret
br_0CF4C:
        mov     si, word ptr [A1_W_0EAB6]
        cmp     byte ptr [si+0bh], 10h
        jne     br_0CF59
        jmp     loop_0C76B
br_0CF59:
        call    fn_0CF63
        call    fn_0C825
        call    FN_0CAA0
        ret
fn_0CF63:
        mov     byte ptr [si], 0e5h
        mov     ax, word ptr [si+1ah]
        cmp     ax, 2
        jae     br_0CF6F
        ret
br_0CF6F:
        cmp     byte ptr [0e866h], 10h
        je      loop_0CF78
        jmp     L_0CE03
loop_0CF78:
        if      FW_VERSION >= 110
        push    ax
        endif
        call    fn_0CB47
        if      FW_VERSION >= 110
        pop     ax
        endif
loop_0CF7D:
        if      FW_VERSION >= 110
        mov     bx, word ptr [0e886h]
        shr     bx, 1
        dec     bx
        and     bx, ax
        else
        mov     bl, al
        sub     bh, bh
        endif
        shl     bx, 1
        sub     cx, cx
        xchg    cx, word ptr [bx+A1_TBL_0C000]
        cmp     cx, 0
        je      L_0CFCD
        if      FW_VERSION >= 110
        mov     ax, word ptr [0e892h]
        mov     dx, word ptr [0e886h]
        mul     dx
        shr     ax, 0ah
        add     word ptr [0e8a0h], ax
        else
        mov     dx, word ptr [0e890h]
        shr     dx, 1
        add     word ptr [0e89ah], dx
        endif
        adc     word ptr [P_E8A2], 0
        cmp     cx, -1
        je      br_0CFC9
        if      FW_VERSION >= 110
        mov     ax, cx
        mov     dx, 0
        mov     bx, word ptr [0e886h]
        shr     bx, 1
        div     bx
        cmp     al, byte ptr [0e8a9h]
        else
        cmp     ah, ch
        endif
        mov     ax, cx
        je      loop_0CF7D
        push    ax
        call    fn_0CE5F
        pop     ax
        jmp     loop_0CF78
br_0CFC9:
        call    fn_0CE5F
        ret
L_0CFCD:
        if      FW_VERSION < 114
        ret
        endif
        if      FW_VERSION >= 120
        call    fn_0CE5F
        ret
        else
        mov     ax, 2bh
        jmp     loop_0BE05
        endif
L_0CE03:
        mov     si, 0c000h
loop_0CFD4:
        mov     dx, word ptr [P_E892]
        shr     dx, 1
        add     word ptr [P_E8A0], dx
        adc     word ptr [P_E8A2], 0
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        mov     cx, word ptr [bx+si]
        popf
        jb      br_0D002
        and     word ptr [bx+si], 0f000h
loop_0CFF3:
        and     cx, 0fffh
        mov     ax, cx
        cmp     ax, 0fffh
        jne     loop_0CFD4
        call    fn_0CE46
        ret
br_0D002:
        and     word ptr [bx+si], 0fh
        shr     cx, 4
        jmp     loop_0CFF3
L_0CE3C:
        mov     si, 0
loop_0D00D:
        cmp     byte ptr [si], 0
        je      br_0D041
        cmp     byte ptr [si+0bh], 10h
        je      br_0D038
        pusha
        call    fn_0C8E5
        popa
        jb      br_0D038
        cmp     cl, 2ah
        je      br_0D033
        cmp     cl, byte ptr [si+8]
        jne     br_0D038
        cmp     ch, byte ptr [si+9]
        jne     br_0D038
        cmp     dl, byte ptr [si+0ah]
        jne     br_0D038
br_0D033:
        pusha
        call    fn_0CF63
        popa
br_0D038:
        add     si, 20h
        cmp     si, 8000h
        jb      loop_0D00D
br_0D041:
        call    fn_0C825
        call    FN_0CAA0
        clc
        ret
fn_0D049:
        sub     ax, 2
        mov     bx, word ptr [P_E892]
        mul     bx
        add     ax, word ptr [A1_W_0E89E]
        adc     dx, 0
        ret
fn_0D05A:
        mov     ax, word ptr [A1_W_0ECCE]
        call    fn_0D049
        mov     cx, word ptr [P_E892]
        mov     di, 8000h
        call    fn_0D0AE
        ret
fn_0D06B:
        pusha
        add     ax, word ptr [P_E888]
        adc     dx, word ptr [P_E88A]
        mov     bx, ds
        mov     es, bx
        if      FW_VERSION >= 110
        cmp     byte ptr [0e87dh], 0
        jne     br_0D08D
        endif
        mov     bl, 2
        int     93h
        if      FW_VERSION >= 110
        mov     ax, 9
        jae     br_0D08B
        jmp     loop_0BE05
br_0D08B:
        popa
        ret
br_0D08D:
        mov     bl, 0eh
        int     93h
        mov     ax, 9
        endif
        jae     br_0D099
        jmp     loop_0BE05
br_0D099:
        popa
        ret
fn_0D09B:
        pusha
        if      FW_VERSION < 110
        shl     cx, 4
        sub     dx, dx
        add     ax, word ptr [0e886h]
        adc     dx, word ptr [0e888h]
        push    cx
        mov     cx, 4
L_0CD67:
        shl     ax, 1
        rcl     dx, 1
        loop    L_0CD67
        pop     cx
        endif
        mov     bx, ds
        mov     es, bx
        if      FW_VERSION >= 110
        mov     bl, 0eh
        else
        mov     bl, 2
        endif
        int     93h
        if      FW_VERSION >= 110
        mov     ax, 9
        endif
        jae     br_0D0AC
        jmp     loop_0BE05
br_0D0AC:
        popa
        ret
fn_0D0AE:
        pusha
        add     ax, word ptr [P_E888]
        adc     dx, word ptr [P_E88A]
        mov     bx, ds
        mov     es, bx
        mov     bl, 3
        int     93h
        if      FW_VERSION >= 120
        mov     ax, 5
        endif
        jae     L_0D0C7
        jmp     loop_0BE05
L_0D0C7:
        popa
        ret
        if      FW_VERSION >= 120
tgt_0D0C9:
        mov     bx, RAM_SEG
        mov     es, bx
        cmp     byte ptr es:[61h], 0
        je      L_0D0D9
        jmp     L_0D176
        endif
L_0D0D9:
        if      FW_VERSION < 120
tgt_0D0C9:
        endif
        push    ax
        mov     ah, 0
        mov     di, ax
        sub     si, si
        mov     ax, word ptr [0e87eh]
        mov     dx, word ptr [0e880h]
        int     0b8h
        mov     word ptr [0e882h], ax
        mov     word ptr [0e884h], dx
        if      FW_VERSION < 120
        pop     cx
        endif
        sub     ax, ax
        mov     word ptr [P_E888], ax
        mov     word ptr [P_E88A], ax
        if      FW_VERSION >= 120
        mov     bx, ds
        mov     es, bx
        mov     di, 8000h
        mov     cx, 3400h
        sub     ax, ax
        rep stosw
        pop     cx
        push    cx
        sub     ax, ax
        sub     dx, dx
        mov     si, 8040h
        mov     word ptr [si], ax
        mov     word ptr [si+2], dx
        add     ax, word ptr [0e882h]
        adc     dx, word ptr [0e884h]
        add     si, 4
        dec     cl
        jne     loop_0D145
        call    fn_0D1FD
        pop     cx
        mov     word ptr [0e888h], 0
        endif
loop_0D12D:
        push    cx
        push    cx
        mov     bx, ds
        mov     es, bx
        mov     di, 8000h
        mov     cx, 3400h
        sub     ax, ax
        rep stosw
        sub     ax, ax
        sub     dx, dx
        pop     cx
        mov     si, 8040h
loop_0D145:
        mov     word ptr [si], ax
        mov     word ptr [si+2], dx
        add     ax, word ptr [0e882h]
        adc     dx, word ptr [0e884h]
        add     si, 4
        dec     cl
        jne     loop_0D145
        pop     cx
        pusha
        call    fn_0D1FD
        call    fn_0D2B6
        popa
        mov     ax, word ptr [0e882h]
        mov     dx, word ptr [0e884h]
        add     word ptr [P_E888], ax
        adc     word ptr [P_E88A], dx
        dec     cl
        jne     loop_0D12D
        ret
        if      FW_VERSION >= 120
L_0D176:
        mov     bx, ds
        mov     es, bx
        mov     di, 8000h
        mov     cx, 3400h
        sub     ax, ax
        rep stosw
        mov     word ptr [81feh], 0aa55h
        mov     byte ptr [81c2h], 4
        mov     word ptr [81c6h], 20h
        mov     ax, word ptr [0e87eh]
        mov     dx, word ptr [0e880h]
        cmp     dx, 20h
        jb      L_0D1A7
        mov     dx, 1fh
        mov     ax, 0ffffh
L_0D1A7:
        sub     ax, 20h
        sbb     dx, 0
        mov     word ptr [81cah], ax
        mov     word ptr [81cch], dx
        mov     word ptr [0e882h], ax
        mov     word ptr [0e884h], dx
        sub     ax, ax
        mov     word ptr [0e888h], ax
        mov     word ptr [0e88ah], ax
        mov     dx, ax
        mov     cx, 1
        mov     di, 8000h
        mov     word ptr cs:[bpb_hidden_sectors-APP1_CSBASE], 20h
        call    fn_0D0AE
        mov     bx, ds
        mov     es, bx
        mov     di, 8000h
        mov     cx, 3400h
        sub     ax, ax
        rep stosw
        mov     word ptr [0e888h], 20h
        mov     word ptr [0e88ah], 0
        call    fn_0D1FD
        call    fn_0D2B6
        mov     word ptr cs:[bpb_hidden_sectors-APP1_CSBASE], 0
        ret
        endif
fn_0D1FD:
        mov     si, P_D395
        if      FW_VERSION >= 110
        cmp     word ptr [0e886h], 800h
        je      L_0D216
        mov     si, P_D355
        cmp     word ptr [0e886h], 400h
        je      L_0D216
        mov     si, P_D315
        endif
L_0D216:
        mov     di, 8000h
        push    ds
        mov     bx, cs
        mov     ds, bx
        if      FW_VERSION >= 110
        mov     cx, 40h
        else
        mov     cx, 34h
        endif
        rep movsb
        pop     ds
        mov     di, 8000h
        mov     byte ptr [di+1feh], 55h
        mov     byte ptr [di+1ffh], 0aah
        if      FW_VERSION <> 107
        mov     bx, word ptr [0e886h]
        mov     byte ptr [bx+di-2], 55h
        mov     byte ptr [bx+di-1], 0aah
        if      FW_VERSION < 120
        mov     ax, 0
        mov     dx, 1
        mov     bx, word ptr [0e886h]
        div     bx
        mov     cx, ax
        endif
        endif
        mov     ax, word ptr [0e882h]
        mov     dx, word ptr [0e884h]
        if      FW_VERSION < 120
        if      FW_VERSION >= 110
        cmp     dx, cx
        else
        push    ax
        push    dx
        mov     bx, 0
        mov     cx, 20h
        sub     ax, bx
        sbb     dx, cx
        pop     dx
        pop     ax
        endif
        jb      L_0D15C
        if      FW_VERSION >= 110
        mov     ax, 0
        mov     dx, cx
        sub     ax, 1
        sbb     dx, 0
        else
        mov     ax, 0ffffh
        mov     dx, 1fh
        endif
L_0D15C:
        endif
        mov     word ptr [di+20h], ax
        mov     word ptr [di+22h], dx
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        or      dx, dx
        jne     L_0D257
        mov     word ptr [di+20h], dx
        mov     word ptr [di+22h], dx
        mov     word ptr [di+13h], ax
        else
        mov     word ptr [di+1e8h], ax
        mov     word ptr [di+1eah], dx
        mov     byte ptr [di+1f2h], 4
        endif
L_0D257:
        push    ax
        push    dx
        else
        mov     word ptr [di+1fah], ax
        mov     word ptr [di+1fch], dx
        mov     byte ptr [di+1c2h], 4
        endif
        if      FW_VERSION >= 120
        mov     cx, 4000h
        cmp     dx, 8
        jae     br_0D274
        mov     cx, 2000h
        cmp     dx, 4
        jae     br_0D274
        mov     cx, 1000h
        cmp     dx, 2
        jae     br_0D274
        mov     cx, 800h
        else
        mov     cl, 1
L_0D173:
        cmp     dx, 0
        je      br_0D274
        shr     dx, 1
        rcr     ax, 1
        shl     cl, 1
        jmp     L_0D173
        endif
br_0D274:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        mov     ax, cx
        else
        mov     ax, 4000h
        endif
        mov     dx, 0
        mov     bx, word ptr [0e886h]
        div     bx
        mov     byte ptr [di+0dh], al
        mov     bl, al
        pop     dx
        pop     ax
        mov     bh, 0
        div     bx
        or      dx, dx
        je      br_0D28F
        inc     ax
br_0D28F:
        mov     dx, 2
        mul     dx
        mov     bx, word ptr [0e886h]
        div     bx
        cmp     dx, 0
        je      br_0D2A0
        inc     ax
br_0D2A0:
        mov     word ptr [di+16h], ax
        mov     word ptr [0ecd8h], ax
        else
        mov     cl, 20h
        mov     byte ptr [di+0dh], cl
        endif
        mov     ax, 0
        mov     dx, 0
        mov     cx, 1
        mov     di, 8000h
        call    fn_0D0AE
        ret
fn_0D2B6:
        mov     ax, ds
        mov     es, ax
        mov     cx, 3400h
        mov     di, 8000h
        push    di
        sub     ax, ax
        rep stosw
        pop     di
        if      FW_VERSION >= 110
        mov     ax, 4000h
        mov     dx, 0
        mov     bx, word ptr [0e886h]
        div     bx
        mov     si, ax
        else
        mov     word ptr [di], 0fff8h
        mov     word ptr [di+2], 0ffffh
        endif
        mov     ax, 1
        mov     dx, 0
        if      FW_VERSION >= 110
        mov     bp, word ptr [0ecd8h]
        call    fn_0D2EE
        mov     bp, word ptr [0ecd8h]
        call    fn_0D2EE
        mov     cx, si
        call    fn_0D0AE
        ret
fn_0D2EE:
        mov     word ptr [di], 0fff8h
        mov     word ptr [di+2], 0ffffh
loop_0D2F7:
        mov     cx, si
        cmp     cx, bp
        jb      br_0D2FF
        mov     cx, bp
br_0D2FF:
        sub     bp, cx
        else
        mov     cx, 20h
        endif
        call    fn_0D0AE
        mov     word ptr [di], 0
        mov     word ptr [di+2], 0
        if      FW_VERSION < 110
        mov     bl, 7
L_0CEA0:
        endif
        add     ax, cx
        if      FW_VERSION >= 110
        cmp     bp, 0
        jne     loop_0D2F7
        else
        call    fn_0D0AE
        dec     bl
        jne     L_0CEA0
        mov     word ptr [di], 0fff8h
        mov     word ptr [di+2], 0ffffh
        add     ax, cx
        call    fn_0D0AE
        mov     word ptr [di], 0
        mov     word ptr [di+2], 0
        mov     bl, 7
L_0CEC2:
        add     ax, cx
        call    fn_0D0AE
        dec     bl
        jne     L_0CEC2
        add     ax, cx
        mov     cx, 20h
        call    fn_0D0AE
        endif
        ret
        if      FW_VERSION >= 120
L_0D315:
        jmp     L_0D353
        db      90h
        db      "        "
        db      00h, 02h, 20h, 01h, 00h, 02h, 00h
        db      02h, 00h, 00h, 0f8h, 00h, 01h, 10h, 00h, 02h, 00h
bpb_hidden_sectors:
        db      00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 80h, 00h, 29h, 0d0h, 07h, 00h, 00h
        db      "MPC2000XL  FAT16   "
L_0D353:
        db      00h, 00h
        endif
loop_0D355:
        jmp     loop_0D355
        if      FW_VERSION >= 110
        if      FW_VERSION < 120
        db      90h
        db      "        "
        db      00h, 02h, 20h, 01h, 00h, 02h, 00h, 02h, 00h, 00h, 0f8h, 00h, 01h, 10h, 00h, 02h
        db      9 dup (00h)
        db      80h, 00h, 29h
        db      4 dup (00h)
        db      "MPC2KXL    FAT16   "
        db      00h, 00h, 0ebh, 0feh
        endif
        db      90h
        db      "        "
        db      00h, 04h, 10h, 01h, 00h, 02h, 00h, 02h, 00h, 00h, 0f8h, 80h, 00h, 10h, 00h, 02h
        db      9 dup (00h)
        db      80h, 00h, 29h
        db      4 dup (00h)
        db      "MPC2KXL    FAT16   "
        db      00h, 00h
L_0D395:
        db      0ebh, 45h, 90h
        db      "        "
        db      00h, 08h, 08h, 01h, 00h, 02h, 00h, 02h, 00h, 00h, 0f8h, 40h, 00h, 20h, 00h, 40h
        db      11 dup (00h)
        db      29h
        db      4 dup (00h)
        db      "MPC2KXL    FAT16   "
        db      00h, 00h
        else
        db      90h
        db      "MPC2KXL "
        db      00h, 02h, 20h, 01h, 00h, 02h, 00h, 02h, 00h, 00h, 0f8h, 00h, 01h, 10h, 00h, 02h
        db      9 dup (00h)
        db      80h, 00h, 29h
        db      4 dup (00h)
        db      "MPC2KXL "
        db      00h
        endif
tgt_0D3D5:
        mov     bl, 7
        int     93h
        mov     bl, 0
        jae     br_0D3E7
        cmp     al, 0
        je      br_0D3E7
        cmp     al, 1
        je      br_0D3E7
        stc
        ret
br_0D3E7:
        sub     ax, ax
        clc
        ret
br_0D3EB:
        mov     ax, word ptr [A1_W_0ECCE]
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        add     bx, 0c000h
        mov     ax, word ptr [bx]
        popf
        jae     br_0D401
        shr     ax, 4
br_0D401:
        and     ah, 0fh
        mov     word ptr [A1_W_0ECCE], ax
        ret
br_0D408:
        mov     cx, 2
fn_0D40B:
        mov     si, 0c000h
loop_0D40E:
        mov     bx, cx
        shr     bx, 1
        pushf
        add     bx, cx
        mov     ax, word ptr [bx+si]
        popf
        jb      br_0D433
        and     ax, 0fffh
        cmp     ax, 0
        jne     loop_0D42A
        or      word ptr [bx+si], 0fffh
        mov     ax, cx
        clc
        ret
loop_0D42A:
        inc     cx
        cmp     cx, word ptr [A1_W_0E890]
        jne     loop_0D40E
        stc
        ret
br_0D433:
        and     ax, 0fff0h
        cmp     ax, 0
        jne     loop_0D42A
        or      word ptr [bx+si], 0fff0h
        mov     ax, cx
        clc
        ret
br_0D442:
        mov     cx, word ptr [A1_W_0ECCE]
        call    fn_0D40B
        jae     br_0D44C
        ret
br_0D44C:
        mov     dx, word ptr [P_E892]
        shr     dx, 1
        sub     word ptr [P_E8A0], dx
        sbb     word ptr [P_E8A2], 0
        mov     cx, ax
        xchg    ax, word ptr [A1_W_0ECCE]
        mov     bx, ax
        shr     bx, 1
        pushf
        add     bx, ax
        add     bx, 0c000h
        mov     ax, word ptr [bx]
        popf
        jae     br_0D47C
        shl     cx, 4
        and     ax, 0fh
        or      ax, cx
        mov     word ptr [bx], ax
        ret
br_0D47C:
        and     ax, 0f000h
        or      ax, cx
        mov     word ptr [bx], ax
        ret
fn_0D484:
        push    ds
        pop     es
        mov     di, 0e868h
        mov     dx, si
        mov     bx, di
        mov     cx, 8
        rep movsb
        add     si, 4
        call    fn_0D4C8
        jb      br_0D49F
        mov     cx, 8
        rep movsb
br_0D49F:
        mov     si, dx
        mov     di, bx
        add     si, 8
        add     di, 10h
        mov     al, 2eh
        stosb
        mov     cx, 3
        rep movsb
        mov     si, dx
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        cmp     byte ptr [si+0bh], 10h
        jne     br_0D4C4
        mov     byte ptr [0e878h], 20h
br_0D4C4:
        mov     si, 0e868h
        ret
fn_0D4C8:
        push    si
        push    cx
        mov     cx, 8
tgt_0D4CD:
        cmp     byte ptr [si], 20h
        jb      br_0D4DE
        cmp     byte ptr [si], 7eh
        jae     br_0D4DE
        inc     si
        loop    tgt_0D4CD
        pop     cx
        pop     si
        clc
        ret
br_0D4DE:
        pop     cx
        pop     si
        stc
        ret
fn_0D4E2:
        push    es
        push    di
        mov     ax, ds
        mov     es, ax
        mov     cx, 0bh
        mov     al, 0
        rep stosb
        inc     di
        mov     cx, 8
        rep stosb
        pop     di
        pop     es
        push    di
        push    ds
        mov     bp, si
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        mov     cx, 8
tgt_0D506:
        lodsb
        cmp     al, 61h
        jb      br_0D511
        cmp     al, 7bh
        jae     br_0D511
        sub     al, 20h
br_0D511:
        stosb
        loop    tgt_0D506
        cmp     byte ptr ds:[bp+10h], 20h
        je      br_0D520
        push    di
        call    fn_0D529
        pop     di
br_0D520:
        inc     si
        mov     cx, 3
        rep movsb
        pop     ds
        pop     di
        ret
fn_0D529:
        cmp     byte ptr [si], 20h
        jne     L_0D2A8
        add     si, 8
        ret
L_0D2A8:
        add     di, 4
        mov     cx, 8
tgt_0D538:
        lodsb
        cmp     al, 61h
        jb      br_0D543
        cmp     al, 7bh
        jae     br_0D543
        sub     al, 20h
br_0D543:
        stosb
        loop    tgt_0D538
        ret
fn_0D547:
        pop     bp
        mov     dx, si
loop_0D54A:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      xl_shared_jmp_bp_10757
        mov     ah, byte ptr [si]
        inc     si
        cmp     ah, al
        je      loop_0D54A
loop_0D55A:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     loop_0D55A
        mov     si, dx
        stc
        jmp     bp
xl_shared_jmp_bp_10757:
        mov     si, dx
        clc
        jmp     bp
TBL_NAME_CHARSET:
        db      "0123456789 ABCDEFGHIJKLMNOPQRSTUVWXYZ#+-."
tgt_0D596:
        mov     bl, cl
        mov     bh, 0
        shl     bx, 1
        call    word ptr cs:[bx+TBL_0D5A2-APP1_CSBASE]
        ret
TBL_0D5A2:
        dw      loop_0D5B6-APP1_CSBASE, tgt_0D5F0-APP1_CSBASE, tgt_0D5B2-APP1_CSBASE, tgt_0D5B2-APP1_CSBASE
        dw      tgt_0D5B2-APP1_CSBASE, tgt_0D5B2-APP1_CSBASE, tgt_0D5B2-APP1_CSBASE, tgt_0D5B2-APP1_CSBASE
tgt_0D5B2:
        sub     ax, ax
        stc
        ret
loop_0D5B6:
        mov     bl, al
        mov     ah, 0
        shl     ax, 4
        add     ax, 0cah
        mov     si, ax
        test    byte ptr [si+0ch], 1
        je      br_0D5E6
        mov     byte ptr [0e804h], bl
        mov     cx, 0ch
        sub     bx, bx
        mov     di, 0e868h
        push    di
tgt_0D5D5:
        mov     bl, byte ptr [si]
        mov     al, byte ptr cs:[bx+TBL_NAME_CHARSET-APP1_CSBASE]
        mov     byte ptr [di], al
        inc     si
        inc     di
        loop    tgt_0D5D5
        pop     si
        push    ds
        pop     es
        ret
br_0D5E6:
        mov     al, bl
        inc     al
        cmp     al, 64h
        jne     loop_0D5B6
        stc
        ret
tgt_0D5F0:
        mov     bl, al
        mov     ah, 0
        shl     ax, 4
        add     ax, 0cah
        mov     si, ax
        test    byte ptr [si+0ch], 1
        je      BR_0D62C
        mov     byte ptr [0e804h], bl
        mov     cx, 0ch
        sub     bx, bx
        mov     di, 0e868h
        push    di
tgt_0D60F:
        mov     bl, byte ptr [si]
        mov     al, byte ptr cs:[bx+TBL_NAME_CHARSET-APP1_CSBASE]
        mov     byte ptr [di], al
        inc     si
        inc     di
        loop    tgt_0D60F
        pop     si
        mov     bx, ds
        mov     es, bx
        mov     al, byte ptr [si]
        push    es
        pusha
        call    fn_0D62E
        popa
        pop     es
        clc
        ret
BR_0D62C:
        stc
        ret
fn_0D62E:
        mov     al, byte ptr [0e804h]
        mov     ah, 0
        shl     ax, 4
        add     ax, 0cah
        mov     si, ax
        mov     al, byte ptr [si+0ch]
        push    ax
        mov     ax, word ptr [si+0eh]
        mov     cx, 1
        mov     di, 6000h
        push    di
        if      FW_VERSION >= 110
        call    fn_0D85A
        else
        call    fn_0D09B
        endif
        pop     di
        mov     word ptr [A1_W_0EAAC], di
        mov     word ptr [A1_W_0EAB4], di
        pop     ax
        mov     word ptr [A1_W_0EAB0], 7eh
        test    al, 2
        je      br_0D666
        mov     word ptr [A1_W_0EAB0], 154h
br_0D666:
        ret
tgt_0D667:
        mov     cl, al
        mov     ch, 0
        sub     ax, ax
        sub     dx, dx
        jcxz    br_0D680
        mov     si, 0c000h
tgt_0D674:
        add     ax, word ptr [si]
        adc     dx, 0
        add     si, 2
        loop    tgt_0D674
        mov     si, ax
br_0D680:
        mov     word ptr [P_E888], ax
        mov     word ptr [P_E88A], dx
        sub     ax, ax
        sub     dx, dx
        mov     cx, 3
        mov     di, 0
        push    di
        if      FW_VERSION >= 110
        call    fn_0D85A
        else
        call    fn_0D09B
        endif
        pop     di
        call    fn_0C3BB
        jae     br_0D69C
        ret
br_0D69C:
        mov     al, byte ptr [0d6h]
        test    al, 1
        stc
        jne     BR_0D6A5
        ret
BR_0D6A5:
        clc
        ret
fn_0D6A7:
        call    fn_0C8FD
        cmp     ax, word ptr [A1_W_0EAB0]
        jae     loop_0D725
        mov     bp, ax
        dec     bp
loop_0D6B3:
        inc     bp
        mov     ax, 18h
        mul     bp
        mov     si, ax
        add     si, word ptr [A1_W_0EAAC]
        mov     al, byte ptr [si+10h]
        cmp     al, 0
        je      loop_0D725
        and     al, 7fh
        cmp     al, 73h
        jne     loop_0D6B3
        mov     al, byte ptr [si+11h]
        or      al, byte ptr [si+12h]
        or      al, byte ptr [si+13h]
        je      loop_0D6B3
loop_0D6D7:
        mov     word ptr [A1_W_0EAB4], si
        push    si
        mov     cx, 0ch
        sub     bx, bx
        mov     di, 0e868h
tgt_0D6E4:
        mov     bl, byte ptr [si]
        mov     al, byte ptr cs:[bx+TBL_NAME_CHARSET-APP1_CSBASE]
        mov     byte ptr es:[di], al
        inc     si
        inc     di
        loop    tgt_0D6E4
        add     di, 4
        pop     si
        mov     byte ptr es:[di], 2eh
        mov     byte ptr es:[di+1], 53h
        mov     byte ptr es:[di+2], 31h
        cmp     byte ptr [si+0ch], 20h
        je      br_0D70F
        mov     byte ptr es:[di+2], 33h
br_0D70F:
        mov     bl, byte ptr [si+11h]
        mov     bh, byte ptr [si+12h]
        mov     dl, byte ptr [si+13h]
        sub     dh, dh
        mov     ax, ds
        mov     es, ax
        mov     si, 0e868h
        mov     ax, bp
        clc
        ret
loop_0D725:
        sub     bx, bx
        sub     dx, dx
        mov     ax, ds
        mov     es, ax
        mov     si, 0e868h
        mov     ax, bp
        stc
        ret
tgt_0D734:
        call    fn_0C8FD
        mov     bp, ax
        inc     bp
loop_0D73A:
        cmp     bp, 0
        je      loop_0D725
        dec     bp
        mov     ax, 18h
        mul     bp
        mov     si, ax
        add     si, word ptr [A1_W_0EAAC]
        mov     al, byte ptr [si+10h]
        and     al, 7fh
        cmp     al, 73h
        jne     loop_0D73A
        jmp     loop_0D6D7
tgt_0D756:
        call    fn_0D814
        mov     ax, 8
        jae     br_0D75F
        ret
br_0D75F:
        mov     si, word ptr [A1_W_0EAB4]
        mov     al, byte ptr [si+11h]
        mov     ah, byte ptr [si+12h]
        mov     dl, byte ptr [si+13h]
        sub     dh, dh
        mov     word ptr [A1_W_0ECCA], ax
        mov     word ptr [A1_W_0ECCC], dx
        push    ax
        push    dx
        mov     ax, word ptr [si+14h]
        mov     word ptr [A1_W_0ECD6], ax
        mov     byte ptr [A1_B_0E8A8], 1
        mov     word ptr [A1_W_0ECD0], 0
        pop     dx
        pop     bx
        clc
        ret
tgt_0D78C:
        mov     ax, word ptr [A1_W_0ECCA]
        or      ax, word ptr [A1_W_0ECCC]
        je      br_0D7BB
        sub     word ptr [A1_W_0ECCA], 1
        sbb     word ptr [A1_W_0ECCC], 0
        cmp     word ptr [A1_W_0ECD0], 0
        jne     br_0D7A9
        call    fn_0D82E
br_0D7A9:
        mov     si, word ptr [A1_W_0ECD2]
        mov     al, byte ptr [si]
        inc     word ptr [A1_W_0ECD2]
        dec     word ptr [A1_W_0ECD0]
        mov     ah, 0
        clc
        ret
br_0D7BB:
        mov     ax, 0ffffh
        stc
        ret
tgt_0D7C0:
        mov     ax, word ptr [A1_W_0ECCA]
        or      ax, word ptr [A1_W_0ECCC]
        jne     br_0D7CA
        ret
br_0D7CA:
        sub     word ptr [A1_W_0ECCA], cx
        sbb     word ptr [A1_W_0ECCC], 0
        jae     br_0D7D9
        add     cx, word ptr [A1_W_0ECCA]
br_0D7D9:
        push    cx
        call    fn_0D7E0
        pop     ax
        clc
        ret
fn_0D7E0:
        cmp     cx, word ptr [A1_W_0ECD0]
        jbe     br_0D805
        sub     cx, word ptr [A1_W_0ECD0]
        push    cx
        mov     cx, word ptr [A1_W_0ECD0]
        mov     si, word ptr [A1_W_0ECD2]
        rep movsb
        push    di
        push    es
        call    fn_0D82E
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [A1_W_0ECD0], 0
        jne     fn_0D7E0
        ret
br_0D805:
        sub     word ptr [A1_W_0ECD0], cx
        mov     si, word ptr [A1_W_0ECD2]
        rep movsb
        mov     word ptr [A1_W_0ECD2], si
        ret
fn_0D814:
        mov     ax, 0ffffh
        mov     di, si
loop_0D819:
        inc     ax
        push    di
        push    es
        call    fn_0D6A7
        pop     es
        pop     di
        jae     br_0D824
        ret
br_0D824:
        pusha
        mov     cx, 0ch
        repe cmpsb
        popa
        jne     loop_0D819
        ret
fn_0D82E:
        mov     ax, word ptr [A1_W_0ECD6]
        cmp     ax, 8000h
        jne     br_0D837
        ret
br_0D837:
        mov     cx, 1
        mov     di, 8000h
        mov     word ptr [A1_W_0ECD2], di
        if      FW_VERSION >= 110
        call    fn_0D85A
        else
        call    fn_0D09B
        endif
        mov     word ptr [A1_W_0ECD0], 2000h
        mov     si, word ptr [A1_W_0ECD6]
        add     si, si
        add     si, 70ah
        mov     ax, word ptr [si]
        mov     word ptr [A1_W_0ECD6], ax
        if      FW_VERSION >= 110
        ret
fn_0D85A:
        pusha
        mov     bp, cx
        mov     cx, word ptr [0e896h]
        shl     bp, cl
        sub     dx, dx
        add     ax, word ptr [0e888h]
        adc     dx, word ptr [0e88ah]
        mov     cx, word ptr [0e896h]
tgt_0D871:
        shl     ax, 1
        rcl     dx, 1
        loop    tgt_0D871
        mov     cx, bp
        mov     bx, ds
        mov     es, bx
        mov     bl, 2
        int     93h
        jae     br_0D886
        jmp     loop_0BE05
br_0D886:
        popa
        endif
        ret
tgt_0D888:
        mov     bl, cl
        mov     bh, 0
        shl     bx, 1
        call    word ptr cs:[bx+TBL_0D894-APP1_CSBASE]
        ret
TBL_0D894:
        dw      fn_0D8A6-APP1_CSBASE, fn_0D8F3-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE
        dw      tgt_0BE52-APP1_CSBASE, tgt_0BE52-APP1_CSBASE, tgt_0D8A4-APP1_CSBASE, tgt_0D8A4-APP1_CSBASE
tgt_0D8A4:
        stc
        ret
fn_0D8A6:
        mov     cl, al
        sub     ch, ch
        cmp     cx, word ptr [A1_W_0ECEC]
        jb      br_0D8B2
        jmp     SHORT br_0D8F1
br_0D8B2:
        mov     si, 0ffe0h
loop_0D8B5:
        add     si, 20h
        cmp     byte ptr [si+11h], 1
        jne     loop_0D8B5
        inc     cl
tgt_0D8C0:
        cmp     byte ptr [si+11h], 0
        jne     br_0D8C9
        add     si, 20h
br_0D8C9:
        add     si, 20h
        loop    tgt_0D8C0
        sub     si, 20h
        mov     word ptr [A1_W_0ECF0], si
        mov     ax, ds
        mov     es, ax
        APP0_NEAR match_inline
        db      "BBBBBBBBBBBBBBBB", 00h
        jae     br_0D8F1
        clc
        ret
br_0D8F1:
        stc
        ret
fn_0D8F3:
        push    ax
        call    fn_0D8A6
        pop     ax
        jae     br_0D8FB
        ret
br_0D8FB:
        mov     cl, al
        sub     ch, ch
        cmp     cx, word ptr [A1_W_0ECEC]
        jb      br_0D907
        jmp     br_0D985
br_0D907:
        mov     si, 0ffe0h
loop_0D90A:
        add     si, 20h
        cmp     byte ptr [si+11h], 1
        jne     loop_0D90A
        inc     cl
tgt_0D915:
        cmp     byte ptr [si+11h], 0
        jne     br_0D91E
        add     si, 20h
br_0D91E:
        add     si, 20h
        loop    tgt_0D915
        sub     si, 20h
        mov     word ptr [A1_W_0ECF0], si
        mov     ax, word ptr [si+12h]
        dec     ax
        mov     bx, word ptr [A1_W_0ECEE]
        mul     bx
        add     ax, word ptr [0c020h]
        adc     dx, 0
        mov     word ptr [A1_W_0ECF2], ax
        mov     word ptr [A1_W_0ECF4], dx
        mov     cx, 1eh
        mov     di, 4000h
        push    di
        if      FW_VERSION >= 110
        call    fn_0D09B
        else
        call    fn_0D06B
        endif
        pop     si
        mov     ax, ds
        mov     es, ax
        mov     word ptr [A1_W_0ECE8], 62h
        mov     word ptr [A1_W_0ECEA], 4204h
        call    fn_0D547
        db      "EMULATOR 3X ", 00h
        jb      br_0D97B
        mov     word ptr [A1_W_0ECE8], 3e6h
        mov     word ptr [A1_W_0ECEA], 5bd2h
br_0D97B:
        mov     si, word ptr [A1_W_0ECF0]
        mov     ax, ds
        mov     es, ax
        clc
        ret
br_0D985:
        stc
        ret
tgt_0D987:
        call    fn_0C8FD
        mov     bp, ax
        dec     bp
loop_0D98D:
        inc     bp
        cmp     bp, word ptr [A1_W_0ECE8]
        jb      br_0D997
        jmp     loop_0DA47
br_0D997:
        mov     bx, bp
        shl     bx, 2
        mov     si, word ptr [A1_W_0ECEA]
        mov     ax, word ptr [bx+si]
        mov     dx, word ptr [bx+si+2]
        sub     dx, 40h
        jb      loop_0D98D
loop_0D9AA:
        push    bp
        add     ax, word ptr [4030h]
        adc     dx, word ptr [4032h]
        add     ax, 4ch
        adc     dx, 0
        mov     bx, ax
        and     bx, 1ffh
        mov     word ptr [A1_W_0ECFA], bx
        push    bx
        mov     al, ah
        mov     ah, dl
        mov     dl, dh
        sub     dh, dh
        shr     dx, 1
        rcr     ax, 1
        add     ax, word ptr [A1_W_0ECF2]
        adc     dx, word ptr [A1_W_0ECF4]
        mov     word ptr [A1_W_0ECF6], ax
        mov     word ptr [A1_W_0ECF8], dx
        mov     di, 8000h
        mov     cx, 3
        if      FW_VERSION >= 110
        call    fn_0D09B
        else
        call    fn_0D06B
        endif
        pop     si
        add     si, 8000h
        mov     ax, ds
        mov     es, ax
        push    si
        push    di
        mov     cx, 10h
        rep movsb
        pop     di
        pop     si
        mov     byte ptr [di+10h], 2eh
        mov     byte ptr [di+11h], 45h
        mov     byte ptr [di+12h], 4dh
        mov     byte ptr [di+13h], 55h
        sub     bx, bx
        sub     dx, dx
        test    byte ptr [si+3ah], 20h
        je      br_0DA20
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        sub     bx, word ptr [si+14h]
        sbb     dx, word ptr [si+16h]
br_0DA20:
        test    byte ptr [si+3ah], 40h
        je      br_0DA32
        add     bx, word ptr [si+20h]
        adc     dx, word ptr [si+22h]
        sub     bx, word ptr [si+18h]
        sbb     dx, word ptr [si+1ah]
br_0DA32:
        mov     word ptr [A1_W_0ECCA], bx
        mov     word ptr [A1_W_0ECCC], dx
        pop     ax
        mov     cx, bx
        or      cx, dx
        je      loop_0DA47
        mov     si, di
        push    ds
        pop     es
        clc
        ret
loop_0DA47:
        sub     bx, bx
        sub     dx, dx
        mov     ax, ds
        mov     es, ax
        mov     si, 0e868h
        mov     ax, bp
        stc
        ret
tgt_0DA56:
        call    fn_0C8FD
        mov     bp, ax
        inc     bp
loop_0DA5C:
        cmp     bp, 0
        je      loop_0DA47
        dec     bp
        mov     bx, bp
        shl     bx, 2
        mov     si, word ptr [A1_W_0ECEA]
        mov     ax, word ptr [bx+si]
        mov     dx, word ptr [bx+si+2]
        sub     dx, 40h
        jb      loop_0DA5C
        jmp     loop_0D9AA
tgt_0DA78:
        mov     byte ptr [A1_B_0E8A8], 1
        mov     ax, 600h
        mov     si, word ptr [A1_W_0ECFA]
        sub     ax, word ptr [A1_W_0ECFA]
        mov     word ptr [A1_W_0ECD0], ax
        add     si, 8000h
        mov     word ptr [A1_W_0ECD2], si
        add     word ptr [A1_W_0ECF6], 3
        adc     word ptr [A1_W_0ECF8], 0
        push    ds
        pop     es
        mov     di, 0e700h
        push    di
        mov     cx, 100h
        rep movsb
        if      FW_VERSION = 114
L_0D9BB                         equ     $+6
        endif
        pop     si
        sub     ax, ax
        sub     di, di
        mov     bx, word ptr [A1_W_0ECCA]
        mov     dx, word ptr [A1_W_0ECCC]
        clc
        ret
tgt_0DAB7:
        cmp     word ptr [A1_W_0ECD0], 0
        jne     br_0DAC1
        call    fn_0DB13
br_0DAC1:
        mov     si, word ptr [A1_W_0ECD2]
        mov     al, byte ptr [si]
        inc     word ptr [A1_W_0ECD2]
        dec     word ptr [A1_W_0ECD0]
        mov     ah, 0
        clc
        ret
        mov     ax, 0ffffh
        stc
        ret
tgt_0DAD8:
        push    cx
        call    fn_0DADF
        pop     ax
        clc
        ret
fn_0DADF:
        cmp     cx, word ptr [A1_W_0ECD0]
        jbe     br_0DB04
        sub     cx, word ptr [A1_W_0ECD0]
        push    cx
        mov     cx, word ptr [A1_W_0ECD0]
        mov     si, word ptr [A1_W_0ECD2]
        rep movsb
        push    di
        push    es
        call    fn_0DB13
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [A1_W_0ECD0], 0
        jne     fn_0DADF
        ret
br_0DB04:
        sub     word ptr [A1_W_0ECD0], cx
        mov     si, word ptr [A1_W_0ECD2]
        rep movsb
        mov     word ptr [A1_W_0ECD2], si
        ret
fn_0DB13:
        mov     ax, word ptr [A1_W_0ECF6]
        mov     dx, word ptr [A1_W_0ECF8]
        mov     cx, 20h
        mov     di, 8000h
        mov     word ptr [A1_W_0ECD2], di
        if      FW_VERSION >= 110
        call    fn_0D09B
        else
        call    fn_0D06B
        endif
        add     word ptr [A1_W_0ECF6], 20h
        adc     word ptr [A1_W_0ECF8], 0
        mov     word ptr [A1_W_0ECD0], 4000h
        ret
tgt_0DB38:
        clc
        ret
fn_0DB3A:
        sub     ax, ax
        sub     dx, dx
        mov     cx, 2
        mov     di, 0c000h
        if      FW_VERSION >= 110
        call    fn_0D09B
        else
        call    fn_0D06B
        endif
        mov     al, byte ptr [0c028h]
        sub     ah, ah
        shl     ax, 1
        add     ax, L_0DB8F-APP1_CSBASE
        mov     bx, ax
        mov     ax, word ptr cs:[bx]
        mov     word ptr [A1_W_0ECEE], ax
        mov     ax, word ptr [0c010h]
        sub     dx, dx
        mov     cx, 8
        mov     di, 0
        if      FW_VERSION >= 110
        call    fn_0D09B
        else
        call    fn_0D06B
        endif
        mov     bx, 0
        mov     si, 0
loop_0DB6D:
        mov     ax, word ptr [si]
        add     si, 20h
        cmp     ax, 0
        je      br_0DB86
        cmp     byte ptr [si+11h], 0
        je      loop_0DB6D
        cmp     byte ptr [si+11h], 64h
        jae     loop_0DB6D
        inc     bx
        jmp     loop_0DB6D
br_0DB86:
        mov     ax, ds
        mov     es, ax
        mov     word ptr [A1_W_0ECEC], bx
        ret
L_0DB8F:
        dw      0040h, 0080h, 0100h, 0200h, 0400h, 0800h, 1000h, 2000h, 4000h, 8000h
L_0D971:
        mov     word ptr [A1_W_0EAB2], 0
        call    fn_0DCA6
        ret
tgt_0DBAD:
        call    fn_0C8FD
        dec     ax
        mov     word ptr [A1_W_0EAB2], ax
loop_0DBB4:
        mov     ax, word ptr [A1_W_0EAB2]
        inc     ax
        cmp     ax, 1fffh
        jb      br_0DBC0
        jmp     loop_0DC44
br_0DBC0:
        mov     word ptr [A1_W_0EAB2], ax
        call    fn_0DC91
        mov     ax, word ptr [A1_W_0EAB2]
        sub     dx, dx
        mov     bx, 1a0h
        div     bx
        push    dx
        mov     ax, 20h
        mul     dx
        add     ax, 0
        mov     si, ax
        pop     ax
        mov     bx, 30h
        mul     bx
        add     ax, 3400h
        mov     di, ax
        cmp     byte ptr [si], 0
        je      loop_0DC44
        cmp     byte ptr [si], 0feh
        je      loop_0DBB4
loop_0DBF0:
        mov     word ptr [A1_W_0EAB4], si
        mov     word ptr [A1_W_0EAB6], di
        mov     si, di
        mov     di, 0e868h
        push    si
        push    di
        mov     cx, 10h
        rep movsb
        pop     di
        pop     si
        mov     byte ptr [di+3], 5fh
        cmp     byte ptr [di+0eh], 7fh
        jne     br_0DC14
        mov     byte ptr [di+0eh], 2dh
br_0DC14:
        mov     byte ptr [di+10h], 2eh
        mov     byte ptr [di+11h], 52h
        mov     byte ptr [di+12h], 4ch
        mov     byte ptr [di+13h], 44h
        mov     si, word ptr [A1_W_0EAB6]
        mov     bx, word ptr [si+19h]
        mov     dl, byte ptr [si+1bh]
        add     bx, 1
        adc     dx, 0
        and     dx, 0fh
        shl     bx, 1
        rcl     dx, 1
        mov     si, di
        push    ds
        pop     es
        mov     ax, word ptr [A1_W_0EAB2]
        clc
        ret
loop_0DC44:
        mov     ax, ds
        mov     es, ax
        mov     si, 0e868h
        sub     bx, bx
        sub     dx, dx
        mov     ax, word ptr [A1_W_0EAB2]
        stc
        ret
tgt_0DC54:
        call    fn_0C8FD
        inc     ax
        mov     word ptr [A1_W_0EAB2], ax
loop_0DC5B:
        cmp     word ptr [A1_W_0EAB2], 0
        je      loop_0DC44
        dec     word ptr [A1_W_0EAB2]
        call    fn_0DC91
        mov     ax, word ptr [A1_W_0EAB2]
        sub     dx, dx
        mov     bx, 1a0h
        div     bx
        push    ax
        mov     bx, 20h
        mul     bx
        add     ax, 0
        mov     si, ax
        pop     ax
        mov     bx, 2ah
        mul     bx
        add     ax, 3400h
        mov     di, ax
        cmp     byte ptr [si], 0feh
        je      loop_0DC5B
        jmp     loop_0DBF0
fn_0DC91:
        mov     ax, word ptr [A1_W_0EAB2]
        sub     dx, dx
        mov     bx, 1a0h
        div     bx
        cmp     ax, word ptr [A1_W_0EAAC]
        jne     br_0DCA2
        ret
br_0DCA2:
        call    fn_0DCA6
        ret
fn_0DCA6:
        mov     ax, word ptr [A1_W_0EAB2]
        sub     dx, dx
        mov     bx, 1a0h
        div     bx
        mov     word ptr [A1_W_0EAAC], ax
        mov     bx, 1ah
        mul     bx
        add     ax, 66ch
        sub     dx, dx
        mov     di, 0
        mov     cx, 1ah
        if      FW_VERSION >= 110
        call    fn_0D09B
        else
        call    fn_0D06B
        endif
        mov     ax, word ptr [A1_W_0EAB2]
        sub     dx, dx
        mov     bx, 1a0h
        div     bx
        mov     bx, 27h
        mul     bx
        add     ax, 12ach
        sub     dx, dx
        mov     di, 3400h
        mov     cx, 27h
        if      FW_VERSION >= 110
        call    fn_0D09B
        else
        call    fn_0D06B
        endif
        ret
tgt_0DCE4:
        if      FW_VERSION >= 110
        mov     si, word ptr [0eab4h]
        mov     ax, word ptr [si+1ch]
        mov     word ptr [0ecd6h], ax
        mov     si, word ptr [0eab6h]
        mov     ax, ds
        mov     es, ax
        mov     bx, word ptr [si+19h]
        mov     dl, byte ptr [si+1bh]
        add     bx, 1
        adc     dl, 0
        and     dx, 0fh
        shl     bx, 1
        rcl     dx, 1
        mov     word ptr [0eccah], bx
        mov     word ptr [0eccch], dx
        mov     word ptr [0ecd0h], 0
        else
        mov     si, word ptr [0ecaeh]
        mov     ax, word ptr [si+1ch]
        mov     word ptr [0eeceh], ax
        mov     si, word ptr [0ecb0h]
        mov     ax, ds
        mov     es, ax
        mov     bx, word ptr [si+19h]
        mov     dl, byte ptr [si+1bh]
        add     bx, 1
        adc     dl, 0
        and     dx, 0fh
        shl     bx, 1
        rcl     dx, 1
        mov     word ptr [0eec2h], bx
        mov     word ptr [0eec4h], dx
        mov     word ptr [0eec8h], 0
        endif
        mov     ax, 0
        clc
        ret
tgt_0DD1C:
        mov     ax, word ptr [A1_W_0ECCA]
        or      ax, word ptr [A1_W_0ECCC]
        je      br_0DD4B
        sub     word ptr [A1_W_0ECCA], 1
        sbb     word ptr [A1_W_0ECCC], 0
        cmp     word ptr [A1_W_0ECD0], 0
        jne     br_0DD39
        call    fn_0DDA4
br_0DD39:
        mov     si, word ptr [A1_W_0ECD2]
        mov     al, byte ptr [si]
        inc     word ptr [A1_W_0ECD2]
        dec     word ptr [A1_W_0ECD0]
        mov     ah, 0
        clc
        ret
br_0DD4B:
        mov     ax, 0ffffh
        stc
        ret
tgt_0DD50:
        mov     ax, word ptr [A1_W_0ECCA]
        or      ax, word ptr [A1_W_0ECCC]
        jne     br_0DD5A
        ret
br_0DD5A:
        sub     word ptr [A1_W_0ECCA], cx
        sbb     word ptr [A1_W_0ECCC], 0
        jae     br_0DD69
        add     cx, word ptr [A1_W_0ECCA]
br_0DD69:
        push    cx
        call    fn_0DD70
        pop     ax
        clc
        ret
fn_0DD70:
        cmp     cx, word ptr [A1_W_0ECD0]
        jbe     br_0DD95
        sub     cx, word ptr [A1_W_0ECD0]
        push    cx
        mov     cx, word ptr [A1_W_0ECD0]
        mov     si, word ptr [A1_W_0ECD2]
        rep movsb
        push    di
        push    es
        call    fn_0DDA4
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [A1_W_0ECD0], 0
        jne     fn_0DD70
        ret
br_0DD95:
        sub     word ptr [A1_W_0ECD0], cx
        mov     si, word ptr [A1_W_0ECD2]
        rep movsb
        mov     word ptr [A1_W_0ECD2], si
        ret
fn_0DDA4:
        mov     ax, word ptr [A1_W_0ECD6]
        cmp     ax, 0fff8h
        jne     br_0DDAD
        ret
br_0DDAD:
        sub     ax, 2
        mov     dx, 12h
        mul     dx
        add     ax, 15ach
        adc     dx, 0
        mov     cx, 12h
        mov     di, 8200h
        mov     word ptr [A1_W_0ECD2], di
        if      FW_VERSION >= 110
        call    fn_0D09B
        else
        call    fn_0D06B
        endif
        mov     word ptr [A1_W_0ECD0], 2400h
        mov     ax, word ptr [A1_W_0ECD6]
        push    ax
        mov     al, ah
        mov     ah, 0
        sub     dx, dx
        add     ax, 404h
        mov     di, 0c000h
        push    di
        mov     cx, 1
        if      FW_VERSION >= 110
        call    fn_0D09B
        else
        call    fn_0D06B
        endif
        pop     di
        pop     ax
        mov     ah, 0
        shl     ax, 1
        add     di, ax
        mov     ax, word ptr [di]
        mov     word ptr [A1_W_0ECD6], ax
        ret
L_0D8F8:
        cmp     byte ptr [0e867h], 6
        stc
        je      br_0DDFC
        ret
br_0DDFC:
        mov     di, A1_W_0ED10
        mov     dx, ds
        mov     bl, 0ah
        int     93h
        jae     br_0DE08
        ret
br_0DE08:
        cmp     byte ptr [A1_B_0ED12], 1
        stc
        je      br_0DE11
        ret
br_0DE11:
        cmp     byte ptr [A1_B_0ED13], 64h
        cmc
        jae     br_0DE1A
        ret
br_0DE1A:
        mov     ax, 10h
        mov     dx, 0
        if      FW_VERSION < 110
        call    L_0C186
        endif
        mov     di, 8000h
        mov     cx, 1
        push    di
        call    fn_0D06B
        pop     si
        cmp     byte ptr [si], 1
        stc
        je      br_0DE32
        ret
br_0DE32:
        inc     si
        call    fn_0D547
        db      "CD001", 00h
        jae     br_0DE3F
        ret
br_0DE3F:
        mov     ax, word ptr [80a6h]
        mov     dx, word ptr [80a8h]
        mov     word ptr [A1_W_0ECDE], ax
        mov     word ptr [A1_W_0ECE0], dx
        mov     ax, word ptr [809eh]
        mov     dx, word ptr [80a0h]
        if      FW_VERSION >= 110
        mov     word ptr [0ecb8h], ax
        else
        call    L_0C186
        mov     word ptr [0eeb2h], ax
        endif
        mov     word ptr [A1_W_0ECBA], dx
        call    fn_0E128
        mov     byte ptr [0e803h], 4
        mov     al, byte ptr [0e867h]
        mov     ah, 0eh
        sub     dx, dx
        sub     bx, bx
        ret
tgt_0DE6D:
        mov     bl, cl
        mov     bh, 0
        shl     bx, 1
        call    word ptr cs:[bx+TBL_0DE79-APP1_CSBASE]
        ret
TBL_0DE79:
        dw      fn_0DE8A-APP1_CSBASE, fn_0DEC5-APP1_CSBASE, tgt_0DE89-APP1_CSBASE, tgt_0DE89-APP1_CSBASE
        dw      tgt_0DE89-APP1_CSBASE, fn_0E1A3-APP1_CSBASE, tgt_0E095-APP1_CSBASE, tgt_0E0BB-APP1_CSBASE
tgt_0DE89:
        db      0c3h
fn_0DE8A:
        push    ax
        mov     bx, 0ch
        mul     bx
        mov     si, ax
        add     si, 0d800h
        call    fn_0DEA1
        mov     al, byte ptr [si]
        sub     al, 1
        push    ds
        pop     es
        pop     ax
        ret
fn_0DEA1:
        mov     dx, 1
        cmp     byte ptr [0d800h], 2eh
        jne     br_0DEAC
        ret
br_0DEAC:
        if      FW_VERSION >= 110
        mov     ax, word ptr [0ecb8h]
        else
        mov     ax, word ptr [0eeb2h]
        endif
        mov     bx, word ptr [A1_W_0ECBA]
        cmp     ax, word ptr [0d808h]
        je      br_0DEBA
        ret
br_0DEBA:
        cmp     bx, word ptr [0d80ah]
        je      br_0DEC1
        ret
br_0DEC1:
        mov     dx, 0
        ret
fn_0DEC5:
        call    fn_0DE8A
        jae     br_0DECB
        ret
br_0DECB:
        mov     word ptr [P_ECC6], ax
        push    ax
        push    si
        push    es
        mov     ax, word ptr [si+8]
        mov     dx, word ptr [si+0ah]
        mov     word ptr [A1_W_0ECE2], ax
        mov     word ptr [A1_W_0ECE4], dx
        mov     word ptr [A1_W_0ECDA], ax
        mov     word ptr [A1_W_0ECDC], dx
        mov     di, 8000h
        if      FW_VERSION >= 110
        mov     cx, 8
        else
        mov     cx, 32
        endif
        call    fn_0D06B
        call    fn_0DEF6
        pop     es
        pop     si
        pop     ax
        clc
        ret
fn_0DEF6:
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        sub     ax, ax
        mov     cx, 4000h
        rep stosw
        mov     di, 0
        mov     si, 8000h
        mov     word ptr [A1_W_0ECE6], si
        mov     ax, word ptr [si+0ah]
        mov     dx, word ptr [si+0ch]
        mov     word ptr [A1_W_0ECDE], ax
        mov     word ptr [A1_W_0ECE0], dx
        mov     word ptr [A1_W_0EAB0], 0
loop_0DF21:
        cmp     byte ptr [si], 0
        jne     br_0DF32
loop_0DF26:
        call    fn_0DF83
        jae     br_0DF2C
        ret
br_0DF2C:
        cmp     byte ptr [si], 0
        jne     br_0DF32
        ret
br_0DF32:
        push    si
        push    di
        call    fn_0DFD6
        pop     di
        pop     si
        mov     ax, word ptr [si+2]
        mov     dx, word ptr [si+4]
        if      FW_VERSION < 110
        call    L_0C186
        endif
        mov     word ptr [di+16h], ax
        mov     word ptr [di+18h], dx
        mov     ax, word ptr [si+0ah]
        mov     dx, word ptr [si+0ch]
        mov     word ptr [di+1ch], ax
        mov     word ptr [di+1eh], dx
        mov     al, byte ptr [si+19h]
        and     al, 2
        je      br_0DF5C
        mov     byte ptr [di+0bh], 10h
br_0DF5C:
        add     di, 20h
        inc     word ptr [A1_W_0EAB0]
        cmp     word ptr [A1_W_0EAB0], 3ffh
        je      br_0DF82
        mov     bl, byte ptr [si]
        mov     bh, 0
        add     si, bx
        mov     ax, si
        and     ax, 0f800h
        cmp     ax, word ptr [A1_W_0ECE6]
        je      loop_0DF21
        sub     si, 800h
        jmp     loop_0DF26
br_0DF82:
        ret
fn_0DF83:
        sub     word ptr [A1_W_0ECDE], 800h
        sbb     word ptr [A1_W_0ECE0], 0
        jae     br_0DF91
        ret
br_0DF91:
        mov     ax, word ptr [A1_W_0ECDE]
        or      ax, word ptr [A1_W_0ECE0]
        stc
        jne     br_0DF9C
        ret
br_0DF9C:
        and     si, 0f800h
        add     si, 800h
        mov     word ptr [A1_W_0ECE6], si
        cmp     si, 0c000h
        jb      br_0DFD4
        push    di
        mov     ax, word ptr [A1_W_0ECDA]
        mov     dx, word ptr [A1_W_0ECDC]
        if      FW_VERSION >= 110
        add     ax, 8
        else
        add     ax, 32
        endif
        adc     dx, 0
        mov     word ptr [A1_W_0ECDA], ax
        mov     word ptr [A1_W_0ECDC], dx
        if      FW_VERSION >= 110
        mov     cx, 8
        else
        mov     cx, 32
        endif
        mov     di, 8000h
        call    fn_0D06B
        pop     di
        mov     si, 8000h
        mov     word ptr [A1_W_0ECE6], si
br_0DFD4:
        clc
        ret
fn_0DFD6:
        push    di
        push    di
        mov     ax, 20h
        mov     cx, 0bh
        rep stosb
        pop     di
        mov     cl, byte ptr [si+20h]
        mov     ch, 0
        add     si, 21h
        mov     bl, 0
tgt_0DFEB:
        mov     al, byte ptr [si]
        inc     si
        cmp     al, 2eh
        je      loop_0E029
        mov     byte ptr [di], al
        inc     di
        inc     bl
        cmp     bl, 10h
        je      br_0E033
        cmp     bl, 8
        jne     br_0E00F
        add     di, 4
        push    di
        push    cx
        mov     al, 20h
        mov     cx, 8
        rep stosb
        pop     cx
        pop     di
br_0E00F:
        loop    tgt_0DFEB
        pop     di
        cmp     byte ptr [di], 0
        je      br_0E01D
        cmp     byte ptr [di], 1
        je      br_0E021
        ret
br_0E01D:
        mov     byte ptr [di], 2eh
        ret
br_0E021:
        mov     byte ptr [di], 2eh
        mov     byte ptr [di+1], 2eh
        ret
loop_0E029:
        pop     di
        add     di, 8
        mov     cx, 3
        rep movsb
        ret
br_0E033:
        mov     al, byte ptr [si]
        inc     si
        cmp     al, 2eh
        je      loop_0E029
        loop    br_0E033
        pop     di
        ret
fn_0E03E:
        mov     ax, ds
        mov     es, ax
        mov     di, 0d800h
        sub     ax, ax
        mov     cx, 708h
        rep stosw
        mov     di, 0d800h
        mov     si, 0
        mov     word ptr [P_ECC8], 0
loop_0E058:
        cmp     byte ptr [si], 0
        je      br_0E094
        cmp     byte ptr [si+0bh], 10h
        jne     br_0E08B
        push    si
        push    di
        mov     ax, ds
        mov     es, ax
        mov     cx, 8
        rep movsb
        pop     di
        pop     si
        mov     ax, word ptr [si+16h]
        mov     dx, word ptr [si+18h]
        mov     word ptr [di+8], ax
        mov     word ptr [di+0ah], dx
        add     di, 0ch
        inc     word ptr [P_ECC8]
        cmp     word ptr [P_ECC8], 12bh
        je      br_0E094
br_0E08B:
        add     si, 20h
        cmp     si, 8000h
        jb      loop_0E058
br_0E094:
        ret
tgt_0E095:
        shl     ax, 5
        add     ax, 0
        mov     si, ax
        cmp     byte ptr [si+0bh], 10h
        mov     ax, 0
        stc
        je      br_0E0A8
        ret
br_0E0A8:
        cmp     byte ptr [si], 2eh
        mov     ax, 0
        stc
        jne     br_0E0B2
        ret
br_0E0B2:
        push    si
        call    fn_0E03E
        pop     si
        call    fn_0E1A3
        ret
tgt_0E0BB:
        mov     si, 0d800h
        cmp     byte ptr [si], 2eh
        stc
        mov     ax, 0
        je      br_0E0C8
        ret
br_0E0C8:
        cmp     byte ptr [si+0ch], 2eh
        stc
        mov     ax, 0
        je      br_0E0D3
        ret
br_0E0D3:
        mov     ax, word ptr [si+8]
        mov     dx, word ptr [si+0ah]
        add     si, 0ch
        cmp     ax, word ptr [si+8]
        jne     br_0E103
        cmp     dx, word ptr [si+0ah]
        jne     br_0E103
        call    fn_0E128
        push    word ptr [A1_W_0ECE2]
        push    word ptr [A1_W_0ECE4]
        mov     ax, 0
        call    fn_0DEC5
        pop     dx
        pop     ax
        call    fn_0E15F
        mov     bx, ax
        mov     ax, 0
        clc
        ret
br_0E103:
        mov     ax, word ptr [0d814h]
        mov     dx, word ptr [0d816h]
        push    word ptr [0d808h]
        push    word ptr [0d80ah]
        mov     di, 8000h
        if      FW_VERSION >= 110
        mov     cx, 8
        else
        mov     cx, 32
        endif
        call    fn_0D06B
        call    fn_0DEF6
        call    fn_0E03E
        pop     dx
        pop     ax
        call    fn_0E181
        clc
        ret
fn_0E128:
        mov     ax, ds
        mov     es, ax
        mov     di, 0d800h
        sub     ax, ax
        mov     cx, 708h
        rep stosw
        mov     si, A1_W_0E157
        mov     di, 0d800h
        mov     cx, 8
tgt_0E13F:
        mov     al, byte ptr cs:[si]
        inc     si
        stosb
        loop    tgt_0E13F
        mov     si, 0d800h
        if      FW_VERSION >= 110
        mov     ax, word ptr [0ecb8h]
        else
        mov     ax, word ptr [0eeb2h]
        endif
        mov     dx, word ptr [A1_W_0ECBA]
        mov     word ptr [si+8], ax
        mov     word ptr [si+0ah], dx
        ret
        db      "ROOT    "
fn_0E15F:
        mov     cx, 0
        mov     si, 0
loop_0E165:
        cmp     byte ptr [si], 0
        je      br_0E17D
        cmp     ax, word ptr [si+16h]
        jne     br_0E177
        cmp     dx, word ptr [si+18h]
        jne     br_0E177
        mov     ax, cx
        ret
br_0E177:
        inc     cx
        add     si, 20h
        jmp     loop_0E165
br_0E17D:
        mov     ax, 0
        ret
fn_0E181:
        mov     cx, 0
        mov     si, 0d800h
loop_0E187:
        cmp     byte ptr [si], 0
        je      br_0E19F
        cmp     ax, word ptr [si+8]
        jne     br_0E199
        cmp     dx, word ptr [si+0ah]
        jne     br_0E199
        mov     ax, cx
        ret
br_0E199:
        inc     cx
        add     si, 0ch
        jmp     loop_0E187
br_0E19F:
        mov     ax, 0
        ret
fn_0E1A3:
        mov     ax, ds
        mov     es, ax
        call    fn_0C7F9
        ret
tgt_0E1AB:
        call    fn_0C918
        jae     br_0E1B1
        ret
br_0E1B1:
        mov     si, word ptr [A1_W_0EAB6]
        mov     ax, word ptr [si+16h]
        mov     dx, word ptr [si+18h]
        mov     word ptr [A1_W_0ECDA], ax
        mov     word ptr [A1_W_0ECDC], dx
        mov     word ptr [A1_W_0ECD0], 0
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        mov     word ptr [A1_W_0ECCA], bx
        mov     word ptr [A1_W_0ECCC], dx
        push    ds
        pop     es
        sub     ax, ax
        clc
        ret
tgt_0E1DC:
        mov     ax, word ptr [A1_W_0ECCA]
        or      ax, word ptr [A1_W_0ECCC]
        je      br_0E20B
        sub     word ptr [A1_W_0ECCA], 1
        sbb     word ptr [A1_W_0ECCC], 0
        cmp     word ptr [A1_W_0ECD0], 0
        jne     br_0E1F9
        call    fn_0E275
br_0E1F9:
        mov     si, word ptr [A1_W_0ECD2]
        mov     al, byte ptr [si]
        inc     word ptr [A1_W_0ECD2]
        dec     word ptr [A1_W_0ECD0]
        mov     ah, 0
        clc
        ret
br_0E20B:
        stc
        ret
tgt_0E20D:
        mov     ax, word ptr [A1_W_0ECCA]
        or      ax, word ptr [A1_W_0ECCC]
        jne     br_0E217
        ret
br_0E217:
        sub     word ptr [A1_W_0ECCA], cx
        sbb     word ptr [A1_W_0ECCC], 0
        jae     br_0E232
        add     cx, word ptr [A1_W_0ECCA]
        mov     word ptr [A1_W_0ECCA], 0
        mov     word ptr [A1_W_0ECCC], 0
br_0E232:
        push    cx
        call    fn_0E23B
        pop     ax
        sub     ax, cx
        clc
        ret
fn_0E23B:
        cmp     cx, word ptr [A1_W_0ECD0]
        jbe     br_0E266
        sub     cx, word ptr [A1_W_0ECD0]
        push    cx
        mov     cx, word ptr [A1_W_0ECD0]
        mov     word ptr [A1_W_0ECD0], 0
        mov     si, word ptr [A1_W_0ECD2]
        rep movsb
        push    di
        push    es
        call    fn_0E275
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [A1_W_0ECD0], 0
        jne     fn_0E23B
        ret
br_0E266:
        sub     word ptr [A1_W_0ECD0], cx
        mov     si, word ptr [A1_W_0ECD2]
        rep movsb
        mov     word ptr [A1_W_0ECD2], si
        ret
fn_0E275:
        mov     ax, word ptr [A1_W_0ECDA]
        mov     dx, word ptr [A1_W_0ECDC]
        if      FW_VERSION >= 110
        mov     cx, 8
        else
        mov     cx, 32
        endif
        mov     di, 8000h
        mov     word ptr [A1_W_0ECD2], di
        call    fn_0D06B
        mov     word ptr [A1_W_0ECD0], 4000h
        if      FW_VERSION >= 110
        add     word ptr [A1_W_0ECDA], 8
        else
        add     word ptr [A1_W_0ECDA], 20h
        endif
        adc     word ptr [A1_W_0ECDC], 0
        ret
fn_0E29A:
        mov     ax, word ptr [A1_W_0ECCA]
        or      ax, word ptr [A1_W_0ECCC]
        jne     br_0E2A4
        ret
br_0E2A4:
        sub     word ptr [A1_W_0ECCA], cx
        sbb     word ptr [A1_W_0ECCC], 0
        jae     br_0E2BF
        add     cx, word ptr [A1_W_0ECCA]
        mov     word ptr [A1_W_0ECCA], 0
        mov     word ptr [A1_W_0ECCC], 0
br_0E2BF:
        push    cx
        call    fn_0E2C6
        pop     ax
        clc
        ret
fn_0E2C6:
        cmp     cx, word ptr [A1_W_0ECD0]
        jbe     br_0E2F1
        sub     cx, word ptr [A1_W_0ECD0]
        push    cx
        mov     cx, word ptr [A1_W_0ECD0]
        mov     word ptr [A1_W_0ECD0], 0
        mov     si, word ptr [A1_W_0ECD2]
        rep lodsb
        push    di
        push    es
        call    fn_0E275
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [A1_W_0ECD0], 0
        jne     fn_0E2C6
        ret
br_0E2F1:
        sub     word ptr [A1_W_0ECD0], cx
        mov     si, word ptr [A1_W_0ECD2]
        rep lodsb
        mov     word ptr [A1_W_0ECD2], si
        ret
isr_0E300:
        sub     ax, 8000h
        sbb     dx, 0
        jb      isr_0E312
        pusha
        mov     cx, 8000h
        call    fn_0E29A
        popa
        jmp     isr_0E300
isr_0E312:
        add     ax, 8000h
        mov     cx, ax
        jmp     fn_0E29A
        if      FW_VERSION < 110
        db      00h
        endif
        if      (FW_VERSION >= 111) && (FW_VERSION < 114)
        db      00h
        endif
        if      FW_VERSION >= 120
        db      00h
        endif
isr_0E31A:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     word ptr [A1_W_088BA], sp
        mov     bh, 0
        shl     bx, 1
        call    word ptr cs:[bx+TBL_INT89_SERVICE-APP1_CSBASE]
isr_0E32E:
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
loop_0E33A:
        cli
        mov     sp, word ptr [A1_W_088BA]
        stc
        jmp     isr_0E32E
TBL_INT89_SERVICE:
        dw      tgt_0E38B-APP1_CSBASE, xl_flash_board_detect-APP1_CSBASE, tgt_0E38B-APP1_CSBASE, fn_0E439-APP1_CSBASE
        dw      tgt_0E5A3-APP1_CSBASE, tgt_0E614-APP1_CSBASE, tgt_0E648-APP1_CSBASE, tgt_0E733-APP1_CSBASE
        dw      tgt_0E38B-APP1_CSBASE, fn_0E7AB-APP1_CSBASE, tgt_0E888-APP1_CSBASE, tgt_0E38B-APP1_CSBASE
        dw      tgt_0EA20-APP1_CSBASE, fn_0E966-APP1_CSBASE, fn_0E8DF-APP1_CSBASE, tgt_0E38B-APP1_CSBASE
        dw      tgt_0E38B-APP1_CSBASE, tgt_0EA57-APP1_CSBASE, tgt_0E38B-APP1_CSBASE, fn_0E6D1-APP1_CSBASE
        dw      tgt_0EAA4-APP1_CSBASE, tgt_0E9B7-APP1_CSBASE, loop_0E490-APP1_CSBASE, tgt_0E38B-APP1_CSBASE
        dw      tgt_0E38B-APP1_CSBASE, tgt_0EA26-APP1_CSBASE, L_0E382-APP1_CSBASE, tgt_0EB6D-APP1_CSBASE
        dw      tgt_0E38B-APP1_CSBASE, tgt_0E38B-APP1_CSBASE, tgt_0E386-APP1_CSBASE, loop_0EA8A-APP1_CSBASE
L_0E382:
        sub     ax, ax
        stc
        ret
tgt_0E386:
        mov     ax, 2
        clc
        ret
tgt_0E38B:
        mov     ax, 23h
        stc
        ret
        shr     bx, 1
        mov     al, 17h
        jmp     loop_0E33A
xl_flash_board_detect:
        call    fn_0EF08
        cmp     al, 89h
        jne     br_0E412
        cmp     bx, 66a0h
        jne     br_0E412
        mov     ax, 100h
        mov     es, ax
        mov     di, 0
        if      FW_VERSION >= 112
        mov     si, A1_W_0A4F2
        elseif  FW_VERSION >= 110
        mov     si, 0a4d2h
        else
        mov     si, 0a4b2h
        endif
        mov     cx, 10h
        push    ds
        pusha
        call    dma_transfer_init
        popa
        pop     ds
        mov     si, P_A4F2
        call    fn_0F1F4
        db      "MPC2000XL", 00h
        mov     ah, 0bh
        jae     br_0E3DE
        mov     si, P_A4F2+8
        call    fn_0F1F4
        db      "MPC2000", 00h
        jb      br_0E3FD
        mov     ah, 0ah
br_0E3DE:
        mov     byte ptr [A1_B_FLASHFS_DEVICE], ah
        push    ax
        call    fn_0E511
        pop     ax
        jb      br_0E3FD
        mov     al, 8
        push    ax
        call    fn_0E966
        mov     cx, ax
        mov     di, bx
        pop     ax
        sub     dx, dx
        push    ds
        pop     es
        mov     si, A1_W_0A629
        clc
        ret
br_0E3FD:
        mov     ah, 1
        mov     al, 8
        mov     byte ptr [A1_B_FLASHFS_DEVICE], ah
        sub     cx, cx
        sub     dx, dx
        sub     di, di
        push    ds
        pop     es
        mov     si, A1_W_0A629
        clc
        ret
br_0E412:
        mov     ah, 0dh
        mov     al, 8
        mov     byte ptr [A1_B_FLASHFS_DEVICE], ah
        sub     dx, dx
        sub     cx, cx
        sub     di, di
        push    ds
        pop     es
        mov     si, A1_W_0A629
        clc
        ret
fn_0E427:
        cmp     byte ptr [A1_B_FLASHFS_DEVICE], 1
        je      br_0E437
        cmp     byte ptr [A1_B_FLASHFS_DEVICE], 0dh
        je      br_0E437
        clc
        ret
br_0E437:
        stc
        ret
fn_0E439:
        call    fn_0E4FA
        call    fn_0E427
        jb      loop_0E481
loop_0E441:
        cmp     ax, 0c8h
        jae     loop_0E481
        push    ax
        mov     bx, 24h
        mul     bx
        mov     si, ax
        pop     ax
        if      FW_VERSION >= 114
        add     si, 88bch
        elseif  FW_VERSION >= 112
        add     si, 88a0h
        elseif  FW_VERSION >= 110
        add     si, 889ch
        else
        add     si, 887ch
        endif
        cmp     byte ptr [si], 0ffh
        je      loop_0E481
        cmp     byte ptr [si], 0
        je      L_0E231
        cmp     byte ptr [si+0bh], 20h
        je      loop_0E466
L_0E231:
        inc     ax
        jmp     loop_0E441
loop_0E466:
        push    ax
        mov     word ptr [A1_W_FLASHFS_DIR_ENTRY], si
        mov     ax, word ptr [si+1ah]
        mov     dx, word ptr [si+14h]
        mov     word ptr [A1_W_FLASHFS_ADDR_LO], ax
        mov     word ptr [A1_W_FLASHFS_ADDR_HI], dx
        call    fn_0F13E
        pop     ax
        mov     word ptr [A1_W_0A627], ax
        clc
        ret
loop_0E481:
        push    ax
        sub     bx, bx
        sub     dx, dx
        mov     ax, ds
        mov     es, ax
        mov     si, A1_W_FLASHFS_NAME_BUF
        pop     ax
        stc
        ret
loop_0E490:
        call    fn_0E4FA
        call    fn_0E427
        jae     br_0E499
        ret
br_0E499:
        push    ax
        mov     bx, 24h
        mul     bx
        if      FW_VERSION >= 114
        add     ax, 88bch
        elseif  FW_VERSION >= 112
        add     ax, 88a0h
        elseif  FW_VERSION >= 110
        add     ax, 889ch
        else
        add     ax, 887ch
        endif
        mov     si, ax
        pop     ax
        cmp     byte ptr [si+0bh], 20h
        jae     loop_0E466
        sub     ax, 1
        jb      loop_0E481
        jmp     SHORT loop_0E490
fn_0E4B2:
        mov     cx, 0c8h
        mov     si, A1_W_088BC
tgt_0E4B8:
        mov     al, byte ptr [si]
        cmp     al, 0ffh
        je      br_0E4C5
        add     si, 24h
        loop    tgt_0E4B8
        stc
        ret
br_0E4C5:
        mov     word ptr [A1_W_FLASHFS_DIR_ENTRY], si
        mov     ax, 80h
        mov     dx, 100h
        cmp     byte ptr [A1_B_FLASHFS_DEVICE], 0ah
        jne     br_0E4DC
        mov     ax, 0
        mov     dx, 103h
br_0E4DC:
        cmp     cx, 0c8h
        je      br_0E4F1
        sub     si, 24h
        mov     ax, word ptr [si+20h]
        mov     dx, word ptr [si+22h]
        add     ax, word ptr [si+1ah]
        adc     dx, word ptr [si+14h]
br_0E4F1:
        mov     word ptr [A1_W_FLASHFS_ADDR_LO], ax
        mov     word ptr [A1_W_FLASHFS_ADDR_HI], dx
        clc
        ret
fn_0E4FA:
        push    ax
        mov     ax, ds
        mov     es, ax
        mov     di, A1_W_FLASHFS_NAME_BUF
        push    di
        mov     al, 20h
        mov     cx, 14h
        rep stosb
        pop     di
        mov     byte ptr [di+10h], 2eh
        pop     ax
        ret
fn_0E511:
        mov     ax, ds
        mov     es, ax
        mov     di, A1_W_088BC
        push    di
        mov     cx, 0e10h
        mov     ax, 0ffffh
        rep stosw
        pop     di
        mov     ax, 80h
        mov     dx, 100h
        cmp     byte ptr [A1_B_FLASHFS_DEVICE], 0ah
        jne     loop_0E535
        mov     ax, 0
        mov     dx, 103h
loop_0E535:
        mov     word ptr [A1_W_FLASHFS_ADDR_LO], ax
        mov     word ptr [A1_W_FLASHFS_ADDR_HI], dx
        push    di
        push    es
        mov     di, ax
        mov     es, dx
        mov     si, A1_W_0A4F2
        mov     cx, 10h
        call    dma_transfer_init
        pop     es
        pop     di
        cmp     byte ptr [si], 0ffh
        clc
        jne     br_0E554
        ret
br_0E554:
        mov     ax, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     dx, word ptr [A1_W_FLASHFS_ADDR_HI]
        mov     word ptr [si+1ah], ax
        mov     word ptr [si+14h], dx
        mov     bx, word ptr [si+1ch]
        mov     cx, word ptr [si+1eh]
        mov     bp, bx
        or      bp, cx
        je      br_0E5A1
        mov     bp, bx
        and     bp, cx
        inc     bp
        je      br_0E5A1
        cmp     bl, 0
        je      br_0E580
        add     bx, 100h
        adc     cx, 0
br_0E580:
        mov     bl, 0
        shr     cx, 1
        rcr     bx, 1
        mov     word ptr [si+20h], bx
        mov     word ptr [si+22h], cx
        add     ax, bx
        adc     dx, cx
        jb      br_0E5A1
        cmp     dx, 140h
        jae     br_0E5A1
        push    si
        mov     cx, 24h
        rep movsb
        pop     si
        jmp     loop_0E535
br_0E5A1:
        stc
        ret
tgt_0E5A3:
        call    fn_0E8DF
        jae     br_0E5A9
        ret
br_0E5A9:
        mov     si, word ptr [A1_W_FLASHFS_DIR_ENTRY]
        mov     ax, word ptr [si+1ah]
        mov     dx, word ptr [si+14h]
        add     ax, 10h
        adc     dx, 0
        mov     cx, ax
        mov     bp, dx
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_LO], ax
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_HI], dx
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        sub     bx, 20h
        sbb     dx, 0
        mov     word ptr [A1_W_FLASHFS_REMAIN_LO], bx
        mov     word ptr [A1_W_FLASHFS_REMAIN_HI], dx
        mov     word ptr [A1_W_FLASHFS_BUF_COUNT], 0
        mov     byte ptr [A1_B_0A4E8], 1
        sub     ax, ax
        clc
        ret
        mov     ax, 0ffffh
        stc
        ret
        mov     ax, 0f000h
        mov     es, ax
        sub     ax, ax
        sub     di, di
        mov     cx, 8000h
        rep stosw
        mov     di, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     ax, word ptr [A1_W_FLASHFS_ADDR_HI]
        mov     es, ax
        push    ds
        mov     ax, 0f000h
        mov     ds, ax
        mov     si, 0
        mov     cx, 7fffh
        call    dma_transfer_init
        pop     ds
        ret
tgt_0E614:
        mov     ax, word ptr [A1_W_FLASHFS_REMAIN_LO]
        or      ax, word ptr [A1_W_FLASHFS_REMAIN_HI]
        je      br_0E643
        sub     word ptr [A1_W_FLASHFS_REMAIN_LO], 1
        sbb     word ptr [A1_W_FLASHFS_REMAIN_HI], 0
        cmp     word ptr [A1_W_FLASHFS_BUF_COUNT], 0
        jne     br_0E631
        call    fn_0E6AE
br_0E631:
        mov     si, word ptr [A1_W_FLASHFS_BUF_PTR]
        mov     al, byte ptr [si]
        inc     word ptr [A1_W_FLASHFS_BUF_PTR]
        dec     word ptr [A1_W_FLASHFS_BUF_COUNT]
        mov     ah, 0
        clc
        ret
br_0E643:
        mov     ax, 0ffffh
        stc
        ret
tgt_0E648:
        mov     ax, word ptr [A1_W_FLASHFS_REMAIN_LO]
        or      ax, word ptr [A1_W_FLASHFS_REMAIN_HI]
        jne     br_0E652
        ret
br_0E652:
        sub     word ptr [A1_W_FLASHFS_REMAIN_LO], cx
        sbb     word ptr [A1_W_FLASHFS_REMAIN_HI], 0
        jae     br_0E66D
        add     cx, word ptr [A1_W_FLASHFS_REMAIN_LO]
        mov     word ptr [A1_W_FLASHFS_REMAIN_LO], 0
        mov     word ptr [A1_W_FLASHFS_REMAIN_HI], 0
br_0E66D:
        push    cx
        call    fn_0E674
        pop     ax
        clc
        ret
fn_0E674:
        cmp     cx, word ptr [A1_W_FLASHFS_BUF_COUNT]
        jbe     br_0E69F
        sub     cx, word ptr [A1_W_FLASHFS_BUF_COUNT]
        push    cx
        mov     cx, word ptr [A1_W_FLASHFS_BUF_COUNT]
        mov     word ptr [A1_W_FLASHFS_BUF_COUNT], 0
        mov     si, word ptr [A1_W_FLASHFS_BUF_PTR]
        rep movsb
        push    di
        push    es
        call    fn_0E6AE
        pop     es
        pop     di
        pop     cx
        cmp     word ptr [A1_W_FLASHFS_BUF_COUNT], 0
        jne     fn_0E674
        ret
br_0E69F:
        sub     word ptr [A1_W_FLASHFS_BUF_COUNT], cx
        mov     si, word ptr [A1_W_FLASHFS_BUF_PTR]
        rep movsb
        mov     word ptr [A1_W_FLASHFS_BUF_PTR], si
        ret
fn_0E6AE:
        mov     si, A1_W_0A4F2
        mov     word ptr [A1_W_FLASHFS_BUF_PTR], si
        mov     cx, 80h
        les     di, [A1_W_FLASHFS_DATA_ADDR_LO]
        add     word ptr [A1_W_FLASHFS_DATA_ADDR_LO], cx
        adc     word ptr [A1_W_FLASHFS_DATA_ADDR_HI], 0
        push    cx
        call    dma_transfer_init
        pop     cx
        shl     cx, 1
        mov     word ptr [A1_W_FLASHFS_BUF_COUNT], cx
        ret
fn_0E6D1:
        mov     ax, word ptr [A1_W_FLASHFS_REMAIN_LO]
        or      ax, word ptr [A1_W_FLASHFS_REMAIN_HI]
        jne     br_0E6DB
        ret
br_0E6DB:
        sub     word ptr [A1_W_FLASHFS_REMAIN_LO], cx
        sbb     word ptr [A1_W_FLASHFS_REMAIN_HI], 0
        jae     br_0E6F6
        add     cx, word ptr [A1_W_FLASHFS_REMAIN_LO]
        mov     word ptr [A1_W_FLASHFS_REMAIN_LO], 0
        mov     word ptr [A1_W_FLASHFS_REMAIN_HI], 0
br_0E6F6:
        push    cx
        call    fn_0E6FD
        pop     ax
        clc
        ret
fn_0E6FD:
        cmp     cx, word ptr [A1_W_FLASHFS_BUF_COUNT]
        jbe     br_0E724
        sub     cx, word ptr [A1_W_FLASHFS_BUF_COUNT]
        push    cx
        mov     cx, word ptr [A1_W_FLASHFS_BUF_COUNT]
        mov     word ptr [A1_W_FLASHFS_BUF_COUNT], 0
        mov     si, word ptr [A1_W_FLASHFS_BUF_PTR]
        add     si, cx
        call    fn_0E6AE
        pop     cx
        cmp     word ptr [A1_W_FLASHFS_BUF_COUNT], 0
        jne     fn_0E6FD
        ret
br_0E724:
        sub     word ptr [A1_W_FLASHFS_BUF_COUNT], cx
        mov     si, word ptr [A1_W_FLASHFS_BUF_PTR]
        add     si, cx
        mov     word ptr [A1_W_FLASHFS_BUF_PTR], si
        ret
tgt_0E733:
        call    fn_0E427
        jae     br_0E739
        ret
br_0E739:
        push    es
        pusha
        mov     di, A1_W_0A4D6
        mov     ax, ds
        mov     es, ax
        mov     cx, 20h
        mov     ax, 0
        rep stosb
        call    fn_0E4B2
        popa
        pop     es
        jae     br_0E752
        ret
br_0E752:
        mov     di, A1_W_0A4D6
        mov     word ptr [di+16h], cx
        mov     word ptr [di+18h], dx
        call    fn_0F19B
        mov     ax, 0ffffh
        mov     word ptr [di+1ch], ax
        mov     word ptr [di+1eh], ax
        mov     ax, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     dx, word ptr [A1_W_FLASHFS_ADDR_HI]
        mov     word ptr [di+1ah], ax
        mov     word ptr [di+14h], dx
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_LO], ax
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_HI], dx
        sub     ax, ax
        mov     byte ptr [di+14h], al
        mov     byte ptr [di+15h], al
        mov     word ptr [di+1ah], ax
        mov     byte ptr [di+0bh], 20h
        mov     word ptr [A1_W_FLASHFS_REMAIN_LO], 20h
        mov     word ptr [A1_W_FLASHFS_REMAIN_HI], 0
        mov     word ptr [A1_W_0A4D4], 20h
        mov     word ptr [A1_W_0A4D2], 0e0h
        mov     byte ptr [A1_B_0A4E8], 2
        sub     ax, ax
        clc
        ret
fn_0E7AB:
        add     word ptr [A1_W_FLASHFS_REMAIN_LO], cx
        adc     word ptr [A1_W_FLASHFS_REMAIN_HI], 0
loop_0E7B4:
        cmp     cx, 0
        je      br_0E812
        cmp     cx, word ptr [A1_W_0A4D2]
        jb      br_0E7F5
        sub     cx, word ptr [A1_W_0A4D2]
        push    cx
        mov     cx, word ptr [A1_W_0A4D2]
        mov     di, A1_W_0A4D6
        add     di, word ptr [A1_W_0A4D4]
        mov     word ptr [A1_W_0A4D2], 100h
        mov     word ptr [A1_W_0A4D4], 0
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
        mov     ds, ax
        push    es
        push    si
        call    fn_0EF36
        pop     si
        pop     es
        pop     cx
        jae     loop_0E7B4
        jmp     br_0E815
br_0E7F5:
        sub     word ptr [A1_W_0A4D2], cx
        mov     di, A1_W_0A4D6
        add     di, word ptr [A1_W_0A4D4]
        add     word ptr [A1_W_0A4D4], cx
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        rep movsb
        mov     es, bx
        mov     ds, ax
br_0E812:
        sub     ax, ax
        ret
br_0E815:
        mov     di, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     es, word ptr [A1_W_FLASHFS_ADDR_HI]
        mov     cx, di
        and     cx, 7fffh
        je      br_0E835
        and     di, 8000h
        push    ds
        mov     ax, 0f000h
        mov     ds, ax
        sub     si, si
        call    dma_transfer_init
        pop     ds
br_0E835:
        mov     ax, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     bx, word ptr [A1_W_FLASHFS_ADDR_HI]
        shl     ax, 1
        rcl     bx, 1
        and     bx, 7fh
loop_0E843:
        call    fn_0F017
        inc     bl
        cmp     bl, 80h
        jne     loop_0E843
        mov     word ptr [A1_W_0A4D4], 0
        mov     word ptr [A1_W_0A4D2], 100h
        mov     cx, word ptr [A1_W_FLASHFS_ADDR_LO]
        and     cx, 7fffh
        shl     cx, 1
        je      br_0E883
        and     word ptr [A1_W_FLASHFS_ADDR_LO], 8000h
        mov     ax, 0f000h
        mov     es, ax
        sub     si, si
        mov     ax, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     dx, word ptr [A1_W_FLASHFS_ADDR_HI]
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_LO], ax
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_HI], dx
        call    fn_0E7AB
br_0E883:
        mov     ax, 3
        stc
        ret
tgt_0E888:
        sub     ax, ax
        xchg    al, byte ptr [A1_B_0A4E8]
        cmp     al, 2
        je      br_0E893
        ret
br_0E893:
        cmp     word ptr [A1_W_0A4D2], 100h
        je      br_0E8B1
        mov     di, A1_W_0A4D6
        add     di, word ptr [A1_W_0A4D4]
        mov     cx, word ptr [A1_W_0A4D2]
        mov     ax, ds
        mov     es, ax
        mov     al, 0
        rep stosb
        call    fn_0EF36
br_0E8B1:
        mov     ax, word ptr [A1_W_FLASHFS_REMAIN_LO]
        mov     di, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     es, word ptr [A1_W_FLASHFS_ADDR_HI]
        add     di, 0eh
        call    fn_0EFF0
        mov     ax, word ptr [A1_W_FLASHFS_REMAIN_HI]
        mov     di, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     es, word ptr [A1_W_FLASHFS_ADDR_HI]
        add     di, 0fh
        call    fn_0EFF0
        call    fn_0F081
        call    fn_0E511
        ret
        db      0b0h, 16h
        jmp     NEAR loop_0E33A
fn_0E8DF:
        mov     dx, 0ffffh
        mov     bp, si
loop_0E8E4:
        inc     dx
        push    es
        push    bp
        push    dx
        mov     ax, dx
        call    fn_0E439
        pop     dx
        pop     bp
        pop     es
        jae     br_0E8F3
        ret
br_0E8F3:
        mov     cx, 14h
        mov     si, bp
        mov     di, A1_W_FLASHFS_NAME_BUF
tgt_0E8FB:
        mov     al, byte ptr es:[si]
        cmp     al, 61h
        jb      br_0E908
        cmp     al, 7bh
        jae     br_0E908
        sub     al, 20h
br_0E908:
        cmp     al, byte ptr [di]
        jne     loop_0E8E4
        inc     si
        inc     di
        loop    tgt_0E8FB
        mov     si, word ptr [A1_W_FLASHFS_DIR_ENTRY]
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        mov     ax, word ptr [si+1ah]
        mov     cx, word ptr [si+14h]
        add     ax, 10h
        adc     cx, 0
        mov     di, ax
        mov     si, cx
        sub     ax, ax
        clc
        ret
        push    si
        push    es
        mov     di, 8000h
        mov     ax, 101h
        mov     es, ax
        mov     word ptr [A1_W_FLASHFS_ADDR_LO], di
        mov     word ptr [A1_W_FLASHFS_ADDR_HI], es
        mov     byte ptr [A1_B_0A4CA], 0
        mov     si, A1_W_0A5D6
        mov     cx, 10h
        call    dma_transfer_init
        mov     di, A1_W_FLASHFS_NAME_BUF
        call    fn_0F13E
        pop     es
        pop     di
        mov     si, A1_W_FLASHFS_NAME_BUF
        mov     cx, 14h
        repe cmpsb
        jne     br_0E964
        sub     ax, ax
        clc
        ret
br_0E964:
        stc
        ret
fn_0E966:
        call    fn_0E427
        jb      br_0E9B2
        call    fn_0E4B2
        sub     ax, ax
        mov     dx, 140h
        sub     ax, word ptr [A1_W_FLASHFS_ADDR_LO]
        sbb     dx, word ptr [A1_W_FLASHFS_ADDR_HI]
        mov     cx, 9
tgt_0E97E:
        shr     dx, 1
        rcr     ax, 1
        loop    tgt_0E97E
        mov     di, ax
        mov     si, dx
        push    di
        sub     ax, ax
        sub     dx, dx
        mov     si, A1_W_088BC
loop_0E990:
        cmp     byte ptr [si], 0ffh
        je      br_0E9A5
        cmp     byte ptr [si], 0
        jne     br_0E9A0
        add     ax, word ptr [si+20h]
        adc     dx, word ptr [si+22h]
br_0E9A0:
        add     si, 24h
        jmp     loop_0E990
br_0E9A5:
        mov     cx, 9
tgt_0E9A8:
        shr     dx, 1
        rcr     ax, 1
        loop    tgt_0E9A8
        mov     bx, ax
        pop     ax
        ret
br_0E9B2:
        sub     ax, ax
        sub     bx, bx
        ret
tgt_0E9B7:
        call    fn_0E427
        jae     br_0E9BD
        ret
br_0E9BD:
        DISP_MSG        "      WIPE F-ROM...   %"
        call    fn_0E966
        mov     ax, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     dx, word ptr [A1_W_FLASHFS_ADDR_HI]
        shl     ax, 1
        rcl     dx, 1
        inc     dl
        cmp     dl, 81h
        jb      br_0E9EF
        mov     dl, 80h
br_0E9EF:
        mov     byte ptr [A1_B_0A620], dl
        mov     bx, 6
loop_0E9F6:
        call    fn_0EA07
        call    fn_0F017
        inc     bx
        cmp     bl, byte ptr [A1_B_0A620]
        jne     loop_0E9F6
        call    fn_0E511
        ret
fn_0EA07:
        push    bx
        sub     bl, 6
        mov     al, 64h
        mul     bl
        mov     cl, 7ah
        div     cl
        mov     ah, 0
        DISP_NUM        97h, 1bh, 03h
        DISP_FLUSH
        db      5bh, 0c3h
tgt_0EA20:
        mov     bx, ax
        call    fn_0F017
        ret
tgt_0EA26:
        mov     si, L_0EA47-APP1_CSBASE
        mov     cx, 8
        mov     ax, 100h
        mov     es, ax
        mov     di, 0
tgt_0EA34:
        mov     ax, word ptr cs:[si]
        pusha
        push    es
        call    fn_0EFF0
        pop     es
        popa
        add     si, 2
        add     di, 1
        loop    tgt_0EA34
        ret
L_0EA47:
        dec     bp
        push    ax
        inc     bx
        xor     dh, byte ptr [bx+si]
        xor     byte ptr [bx+si], dh
        db      "XL       "
tgt_0EA57:
        mov     bx, 0
        mov     ax, 0
        cmp     byte ptr [A1_B_FLASHFS_DEVICE], 0ah
        jne     br_0EA65
        ret
br_0EA65:
        cmp     byte ptr [A1_B_FLASHFS_DEVICE], 0bh
        jne     br_0EA6D
        ret
br_0EA6D:
        cmp     byte ptr [A1_B_FLASHFS_DEVICE], 1
        mov     ax, 0bh
        stc
        jne     br_0EA79
        ret
br_0EA79:
        cmp     byte ptr [A1_B_FLASHFS_DEVICE], 0dh
        mov     ax, 12h
        stc
        jne     br_0EA85
        ret
br_0EA85:
        mov     ax, 14h
        stc
        ret
loop_0EA8A:
        sub     ax, 8000h
        sbb     dx, 0
        jb      br_0EA9C
        pusha
        mov     cx, 8000h
        call    fn_0E6D1
        popa
        jmp     loop_0EA8A
br_0EA9C:
        add     ax, 8000h
        mov     cx, ax
        jmp     fn_0E6D1
tgt_0EAA4:
        call    fn_0E8DF
        jae     L_0E878
        ret
L_0E878:
        mov     si, word ptr [A1_W_FLASHFS_DIR_ENTRY]
fn_0EAAE:
        mov     di, word ptr [si+1ah]
        mov     es, word ptr [si+14h]
        mov     ax, 0
        call    fn_0EFF0
        call    fn_0F081
        mov     si, word ptr [A1_W_FLASHFS_DIR_ENTRY]
        cmp     word ptr [si+20h], -1
        je      br_0EACA
        jmp     br_0EB68
br_0EACA:
        mov     di, word ptr [si+1ch]
        mov     si, word ptr [si+1eh]
        mov     ax, di
        mov     dx, si
        cmp     al, 0
        je      br_0EADE
        add     ax, 100h
        adc     dx, 0
br_0EADE:
        mov     al, 0
        shr     dx, 1
        rcr     ax, 1
        mov     di, word ptr [si+1ah]
        mov     si, word ptr [si+14h]
        mov     word ptr [A1_W_FLASHFS_ADDR_LO], di
        mov     word ptr [A1_W_FLASHFS_ADDR_HI], si
        add     ax, di
        adc     dx, si
        shl     ax, 1
        rcl     dx, 1
        and     dl, 7fh
        mov     cx, di
        and     cx, 7fffh
        je      br_0EB17
        and     di, 8000h
        mov     es, si
        push    ds
        mov     ax, 0f000h
        mov     ds, ax
        sub     si, si
        call    dma_transfer_init
        pop     ds
br_0EB17:
        mov     ax, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     bx, word ptr [A1_W_FLASHFS_ADDR_HI]
        shl     ax, 1
        rcl     bx, 1
        and     bx, 7fh
loop_0EB25:
        push    dx
        call    fn_0F017
        pop     dx
        cmp     bl, dl
        je      br_0EB32
        inc     bl
        jmp     loop_0EB25
br_0EB32:
        mov     word ptr [A1_W_0A4D4], 0
        mov     word ptr [A1_W_0A4D2], 100h
        mov     cx, word ptr [A1_W_FLASHFS_ADDR_LO]
        and     cx, 7fffh
        shl     cx, 1
        je      br_0EB68
        and     word ptr [A1_W_FLASHFS_ADDR_LO], 8000h
        mov     ax, 0f000h
        mov     es, ax
        sub     si, si
        mov     ax, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     dx, word ptr [A1_W_FLASHFS_ADDR_HI]
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_LO], ax
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_HI], dx
        call    fn_0E7AB
br_0EB68:
        call    fn_0E511
        clc
        ret
tgt_0EB6D:
        mov     si, A1_W_088BC
        mov     bx, 0
loop_0EB73:
        cmp     byte ptr [si], 0ffh
        je      br_0EBA6
        cmp     byte ptr [si], 0
        je      br_0EB9C
        cmp     byte ptr [si+0bh], 20h
        jne     br_0EB9C
        cmp     cl, 2ah
        je      br_0EB97
        cmp     cl, byte ptr [si+8]
        jne     br_0EB9C
        cmp     ch, byte ptr [si+9]
        jne     br_0EB9C
        cmp     dl, byte ptr [si+0ah]
        jne     br_0EB9C
br_0EB97:
        pusha
        call    fn_0EAAE
        popa
br_0EB9C:
        add     si, 24h
        inc     bx
        cmp     bx, 0c8h
        jb      loop_0EB73
br_0EBA6:
        call    fn_0E511
        clc
        ret
isr_0EBAB:
        push    ds
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     byte ptr [A1_B_0A622], 1
        call    fn_0EBE8
        DISP_TEXT       1bh, 29h, "Pressing^ARRANG will^arrange^data."
        db      0c6h
        push    es
        if      FW_VERSION >= 114
        db      3eh, 0a6h
        add     byte ptr [bx], bl
        elseif  FW_VERSION >= 112
        and     ah, byte ptr [bp+1f00h]
        else
        if      FW_VERSION >= 110
        push    ds
        cmpsb
        else
        db      0feh
        movsw
        endif
        add     byte ptr [bx], bl
        endif
        iret
fn_0EBE8:
        DISP_WIN_WIDE   "F-ROM  Fragmentation"
        db      0b1h, 34h, 0b5h
        or      si, word ptr [bx+si-4b6fh]
        add     word ptr [bp+di-32eeh], si
        nop
        add     ch, 3
        cmp     ch, 26h
        db      75h, 0f4h
        mov     cl, 34h
        mov     ch, 0bh
        mov     al, 1
        mov     ah, 18h
loop_0EC1D:
        mov     bl, 12h
        int     90h
        add     cl, 9
        cmp     cl, 0cdh
        jne     loop_0EC1D
        DISP_HDOTS      18h, 27h, 0c8h
        mov     ax, 80h
        mov     dx, 100h
        mov     word ptr [A1_W_0A60A], ax
        mov     word ptr [A1_W_0A60C], dx
        mov     bx, A1_W_088BC
loop_0EC3F:
        cmp     byte ptr [bx], 0ffh
        jne     L_0E9BB
        ret
L_0E9BB:
        mov     ax, word ptr [bx+1ah]
        mov     dx, word ptr [bx+14h]
        mov     di, word ptr [bx+20h]
        mov     si, word ptr [bx+22h]
        push    bx
        cmp     byte ptr [bx], 0
        je      br_0EC5A
        call    fn_0EC60
br_0EC5A:
        pop     bx
        add     bx, 24h
        jmp     loop_0EC3F
fn_0EC60:
        and     ax, 0f000h
loop_0EC63:
        call    fn_0EC76
        add     ax, 1000h
        adc     dx, 0
        sub     di, 1000h
        sbb     si, 0
        jae     loop_0EC63
        ret
fn_0EC76:
        pusha
        sub     dx, 100h
        mov     bx, 1000h
        div     bx
        mov     bl, 80h
        div     bl
        mov     ch, al
        shl     ch, 1
        add     ch, al
        add     ch, 0ch
        mov     al, ah
        mov     ah, 0
        mov     bl, 8
        div     bl
        mov     cl, ah
        mov     ah, 9
        mul     ah
        add     al, 35h
        add     cl, al
        mov     al, 1
        mov     ah, 3
        mov     bl, 12h
        int     90h
        popa
        ret
isr_0ECA9:
        push    ds
        mov     ax, RAM_SEG
        mov     ds, ax
        cmp     byte ptr [A1_B_FLASHFS_DEVICE], 0bh
        jne     isr_0ECC6
        mov     byte ptr [A1_B_0A63E], 0
        call    fn_0ECC8
        call    fn_0E511
        mov     ax, 1
        int     47h
isr_0ECC6:
        pop     ds
        iret
fn_0ECC8:
        call    fn_0EBE8
        DISP_TEXT       56h, 29h, "Processing....."
        DISP_FLUSH
        call    fn_0ED46
        jae     L_0EBF5
        ret
L_0EBF5:
        mov     byte ptr [A1_B_0A63C], 0
loop_0ECEE:
        call    fn_0EDA1
        call    fn_0EEDF
        call    fn_0EE7F
        call    fn_0EBE8
        DISP_TEXT       56h, 29h, "Processing....."
        DISP_FLUSH
        cmp     byte ptr [A1_B_0A620], 0
        je      loop_0ECEE
loop_0ED19:
        mov     ax, word ptr [A1_W_0A616]
        mov     bx, word ptr [A1_W_0A618]
        shl     ax, 1
        rcl     bx, 1
        cmp     bl, byte ptr [A1_B_0A621]
        jae     br_0ED3A
        call    fn_0EEDF
        add     word ptr [A1_W_0A616], 8000h
        adc     word ptr [A1_W_0A618], 0
        jmp     loop_0ED19
br_0ED3A:
        call    fn_0E966
        mov     word ptr [A1_W_0A623], di
        mov     word ptr [A1_W_0A625], si
        ret
fn_0ED46:
        sub     ax, ax
        mov     word ptr [A1_W_0A61E], ax
        mov     word ptr [A1_W_0A61A], ax
        mov     word ptr [A1_W_0A61C], ax
        call    fn_0EEF8
        mov     si, A1_W_088BC
        mov     word ptr [A1_W_0A627], 0
loop_0ED5D:
        cmp     byte ptr [si], 0ffh
        stc
        jne     br_0ED64
        ret
br_0ED64:
        cmp     byte ptr [si], 0
        je      br_0ED72
        add     si, 24h
        inc     word ptr [A1_W_0A627]
        jmp     loop_0ED5D
br_0ED72:
        mov     ax, word ptr [si+1ah]
        mov     dx, word ptr [si+14h]
        mov     cx, ax
        and     ax, 8000h
        mov     word ptr [A1_W_0A616], ax
        mov     word ptr [A1_W_0A618], dx
        and     cx, 7fffh
        jne     br_0ED8B
        ret
br_0ED8B:
        mov     word ptr [A1_W_0A61E], cx
        sub     si, si
        mov     di, ax
        mov     es, dx
        push    ds
        mov     ax, 0f000h
        mov     ds, ax
        call    dma_transfer_init
        pop     ds
        clc
        ret
fn_0EDA1:
        cmp     byte ptr [A1_B_0A620], 0
        je      br_0EDA9
        ret
br_0EDA9:
        mov     ax, word ptr [A1_W_0A61A]
        mov     dx, word ptr [A1_W_0A61C]
        mov     bx, ax
        or      bx, dx
        jne     br_0EE03
loop_0EDB6:
        mov     ax, word ptr [A1_W_0A627]
        inc     ax
        call    fn_0E439
        jae     br_0EDC2
        jmp     br_0EE4F
br_0EDC2:
        mov     word ptr [A1_W_0A627], ax
        mov     ax, word ptr [A1_W_FLASHFS_ADDR_LO]
        mov     dx, word ptr [A1_W_FLASHFS_ADDR_HI]
        mov     word ptr [P_A62E], ax
        mov     word ptr [A1_W_0A614], dx
        mov     si, word ptr [A1_W_FLASHFS_DIR_ENTRY]
        mov     ax, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        pusha
        mov     ax, word ptr [A1_W_0A616]
        mov     dx, word ptr [A1_W_0A618]
        mov     word ptr [si+1ah], ax
        mov     word ptr [si+14h], dx
        popa
        test    al, 0ffh
        je      br_0EDF8
        add     ax, 100h
        adc     dx, 0
        mov     al, 0
br_0EDF8:
        shr     dx, 1
        rcr     ax, 1
        mov     word ptr [A1_W_0A61A], ax
        mov     word ptr [A1_W_0A61C], dx
br_0EE03:
        mov     cx, 8000h
        mov     si, word ptr [A1_W_0A61E]
        sub     cx, si
        sub     ax, cx
        sbb     dx, 0
        jae     br_0EE19
        add     cx, ax
        sub     ax, ax
        sub     dx, dx
br_0EE19:
        sub     word ptr [A1_W_0A61A], cx
        sbb     word ptr [A1_W_0A61C], 0
        shl     si, 1
        mov     di, word ptr [P_A62E]
        mov     es, word ptr [A1_W_0A614]
        push    ds
        mov     ax, 0f000h
        mov     ds, ax
        call    dma_transfer_init
        pop     ds
        add     word ptr [P_A62E], cx
        adc     word ptr [P_A630], 0
        add     word ptr [P_A63A], cx
        cmp     word ptr [P_A63A], 8000h
        je      L_0EE4E
        jmp     loop_0EDB6
L_0EE4E:
        ret
br_0EE4F:
        mov     si, word ptr [A1_W_FLASHFS_DIR_ENTRY]
        mov     ax, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        test    al, 0ffh
        je      br_0EE65
        add     ax, 100h
        adc     dx, 0
        mov     al, 0
br_0EE65:
        shr     dx, 1
        rcr     ax, 1
        add     ax, word ptr [P_A62E]
        adc     dx, word ptr [A1_W_0A614]
        shl     ax, 1
        rcl     dx, 1
        mov     byte ptr [A1_B_0A621], dl
        mov     byte ptr [A1_B_0A620], 1
        ret
fn_0EE7F:
        cmp     word ptr [A1_W_0A61E], 0
        jne     br_0EE87
        ret
br_0EE87:
        mov     word ptr [A1_W_0A4D4], 0
        mov     word ptr [A1_W_0A4D2], 100h
        mov     ax, 0f000h
        mov     es, ax
        sub     si, si
        mov     ax, word ptr [A1_W_0A616]
        mov     dx, word ptr [A1_W_0A618]
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_LO], ax
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_HI], dx
        mov     cx, 8000h
        pusha
        call    fn_0E7AB
        popa
        mov     ax, word ptr [A1_W_0A616]
        mov     dx, word ptr [A1_W_0A618]
        add     ax, 4000h
        adc     dx, 0
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_LO], ax
        mov     word ptr [A1_W_FLASHFS_DATA_ADDR_HI], dx
        mov     si, 8000h
        call    fn_0E7AB
        call    fn_0EEF8
        add     word ptr [A1_W_0A616], 8000h
        adc     word ptr [A1_W_0A618], 0
        mov     word ptr [A1_W_0A61E], 0
        ret
fn_0EEDF:
        mov     ax, word ptr [A1_W_0A616]
        mov     bx, word ptr [A1_W_0A618]
        cmp     bx, 140h
        jb      br_0EEED
        ret
br_0EEED:
        shl     ax, 1
        rcl     bx, 1
        and     bl, 7fh
        call    fn_0F017
        ret
fn_0EEF8:
        mov     ax, 0f000h
        mov     es, ax
        sub     di, di
        mov     ax, 0ffffh
        mov     cx, 8000h
        rep stosw
        ret
fn_0EF08:
        call    fn_0F128
        sub     ax, ax
        mov     word ptr [A1_W_08894], ax
        mov     ax, 100h
        mov     word ptr [A1_W_08896], ax
        mov     al, 90h
        call    fn_0F0E8
        mov     si, A1_W_0A4F2
        sub     di, di
        mov     ax, 100h
        mov     es, ax
        mov     cx, 2
        call    dma_transfer_init
        call    fn_0F081
        mov     ax, word ptr [P_A4F2]
        mov     bx, word ptr [A1_W_0A4F4]
        ret
fn_0EF36:
        call    fn_0EF58
        jae     br_0EF3C
        ret
br_0EF3C:
        test    al, 20h
        je      br_0EF4C
        call    fn_0EF58
        test    al, 20h
        je      br_0EF4C
        mov     al, 16h
        jmp     loop_0E33A
br_0EF4C:
        add     word ptr [A1_W_FLASHFS_DATA_ADDR_LO], 80h
        adc     word ptr [A1_W_FLASHFS_DATA_ADDR_HI], 0
        ret
fn_0EF58:
        mov     ax, word ptr [A1_W_FLASHFS_DATA_ADDR_LO]
        mov     dx, word ptr [A1_W_FLASHFS_DATA_ADDR_HI]
        mov     word ptr [A1_W_08894], ax
        mov     word ptr [A1_W_08896], dx
        add     ax, 80h
        adc     dx, 0
        cmp     dx, 140h
        jb      L_0ECEA
        jmp     br_0EFEC
L_0ECEA:
        call    fn_0F087
        mov     word ptr [0b8ch], 1388h
loop_0EF7D:
        call    fn_0F0AC
        test    al, 80h
        je      br_0EF88
        test    al, 4
        jne     br_0EF94
br_0EF88:
        cmp     word ptr [0b8ch], 0
        jne     loop_0EF7D
        mov     al, 14h
        jmp     loop_0E33A
br_0EF94:
        mov     al, 0e0h
        call    fn_0F0E8
        mov     al, 7fh
        call    fn_0F0E8
        mov     al, 0
        call    fn_0F0E8
        mov     cx, 80h
        mov     si, A1_W_0A4F2
        les     di, [A1_W_FLASHFS_DATA_ADDR_LO]
        call    fn_0F22B
        call    fn_0F11D
        mov     word ptr [0b8ch], 1388h
loop_0EFB9:
        call    fn_0F0AC
        test    al, 80h
        je      br_0EFC4
        test    al, 4
        jne     br_0EFD0
br_0EFC4:
        cmp     word ptr [0b8ch], 0
        jne     loop_0EFB9
        mov     al, 14h
        jmp     loop_0E33A
br_0EFD0:
        mov     al, 0ch
        call    fn_0F0E8
        mov     al, 7fh
        call    fn_0F0E8
        mov     al, 0
        call    fn_0F100
        call    L_0EF77
        push    ax
        call    fn_0F128
        call    fn_0F081
        pop     ax
        clc
        ret
br_0EFEC:
        sub     ax, ax
        stc
        ret
fn_0EFF0:
        push    ax
        mov     word ptr [A1_W_08894], di
        mov     word ptr [A1_W_08896], es
        call    fn_0F087
        call    fn_0F11D
        mov     al, 40h
        call    fn_0F0E8
        pop     ax
        mov     si, A1_W_088B4
        mov     word ptr [si], ax
        mov     cx, 1
        call    fn_0F22B
        call    fn_0F055
        call    fn_0F128
        ret
fn_0F017:
        push    bx
        sub     ax, ax
        shr     bx, 1
        rcr     ax, 1
        or      bx, 100h
        mov     word ptr [A1_W_08894], ax
        mov     word ptr [A1_W_08896], bx
        call    fn_0F055
        call    fn_0F087
        mov     al, 20h
        call    fn_0F0E8
        call    fn_0F11D
        mov     al, 0d0h
        call    fn_0F0E8
        call    fn_0F055
        push    ax
        call    fn_0F128
        call    fn_0F087
        call    fn_0F081
        pop     ax
        test    al, 38h
        jne     br_0F050
        pop     bx
        ret
br_0F050:
        mov     al, 15h
        jmp     loop_0E33A
fn_0F055:
        mov     word ptr [0b8ch], 1388h
loop_0F05B:
        call    fn_0F090
        test    al, 80h
        je      br_0F063
        ret
br_0F063:
        cmp     word ptr [0b8ch], 0
        jne     loop_0F05B
        ret
L_0EF77:
        mov     word ptr [0b8ch], 1388h
loop_0F071:
        call    fn_0F0AC
        test    al, 80h
        je      br_0F079
        ret
br_0F079:
        cmp     word ptr [0b8ch], 0
        jne     loop_0F071
        ret
fn_0F081:
        mov     al, 0ffh
        call    fn_0F0E8
        ret
fn_0F087:
        call    fn_0F055
        mov     al, 50h
        call    fn_0F0E8
        ret
fn_0F090:
        pusha
        mov     al, 70h
        call    fn_0F0E8
        mov     si, A1_W_088B4
        les     di, [A1_W_08894]
        and     di, 8000h
        mov     cx, 1
        call    dma_transfer_init
        popa
        mov     al, byte ptr [A1_W_088B4]
        ret
fn_0F0AC:
        pusha
        mov     al, 71h
        call    fn_0F0E8
        mov     si, A1_W_088B4
        les     di, [A1_W_08894]
        and     di, 8000h
        add     di, 2
        mov     cx, 1
        call    dma_transfer_init
        popa
        mov     al, byte ptr [A1_W_088B4]
        ret
        pusha
        mov     al, 71h
        call    fn_0F0E8
        mov     si, A1_W_088B4
        les     di, [A1_W_08894]
        and     di, 8000h
        inc     di
        mov     cx, 1
        call    dma_transfer_init
        popa
        mov     al, byte ptr [A1_W_088B4]
        ret
fn_0F0E8:
        pusha
        mov     si, A1_W_088B4
        mov     ah, 0
        mov     word ptr [si], ax
        les     di, [A1_W_08894]
        and     di, 8000h
        mov     cx, 1
        call    fn_0F22B
        popa
        ret
fn_0F100:
        pusha
        mov     si, A1_W_088B4
        mov     ah, 0
        mov     word ptr [si], ax
        les     di, [A1_W_08894]
        and     di, 0ff80h
        mov     cx, 1
        call    fn_0F22B
        and     word ptr [A1_W_08894], 8000h
        popa
        ret
fn_0F11D:
        push    ax
        push    dx
        mov     dx, 0c0h
        mov     al, 1bh
        out     dx, al
        pop     dx
        pop     ax
        ret
fn_0F128:
        push    ax
        push    dx
        mov     dx, 0c0h
        mov     al, 1ah
        out     dx, al
        pop     dx
        pop     ax
        ret
        push    ax
        push    dx
        mov     dx, 0c0h
        mov     al, 1ah
        out     dx, al
        pop     dx
        pop     ax
        ret
fn_0F13E:
        mov     di, A1_W_FLASHFS_NAME_BUF
        mov     ax, ds
        mov     es, ax
        push    di
        push    di
        mov     cx, 14h
        mov     al, 20h
        rep stosb
        pop     di
        mov     dx, si
        mov     bx, di
        mov     cx, 8
        rep movsb
        add     si, 4
        call    fn_0F181
        jb      br_0F165
        mov     cx, 8
        rep movsb
br_0F165:
        mov     si, dx
        mov     di, bx
        add     si, 8
        add     di, 10h
        mov     al, 2eh
        stosb
        mov     cx, 3
        rep movsb
        mov     si, dx
        mov     bx, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        pop     si
        ret
fn_0F181:
        push    si
        push    cx
        mov     cx, 8
tgt_0F186:
        cmp     byte ptr [si], 20h
        jb      br_0F197
        cmp     byte ptr [si], 7bh
        jae     br_0F197
        inc     si
        loop    tgt_0F186
        pop     cx
        pop     si
        clc
        ret
br_0F197:
        pop     cx
        pop     si
        stc
        ret
fn_0F19B:
        push    di
        push    ds
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        mov     cx, 8
tgt_0F1A8:
        lodsb
        cmp     al, 61h
        jb      br_0F1B3
        cmp     al, 7bh
        jae     br_0F1B3
        sub     al, 20h
br_0F1B3:
        stosb
        loop    tgt_0F1A8
        push    di
        call    fn_0F1C4
        pop     di
        inc     si
        mov     cx, 3
        rep movsb
        pop     ds
        pop     di
        ret
fn_0F1C4:
        push    si
        mov     cx, 8
        mov     al, 0
tgt_0F1CA:
        or      al, byte ptr [si]
        inc     si
        loop    tgt_0F1CA
        pop     si
        add     di, 4
        cmp     al, 20h
        je      br_0F1E9
        mov     cx, 8
tgt_0F1DA:
        lodsb
        cmp     al, 61h
        jb      br_0F1E5
        cmp     al, 7bh
        jae     br_0F1E5
        sub     al, 20h
br_0F1E5:
        stosb
        loop    tgt_0F1DA
        ret
br_0F1E9:
        mov     al, 0
        mov     cx, 8
        rep stosb
        add     si, 8
        ret
fn_0F1F4:
        pop     bp
        mov     dx, si
loop_0F1F7:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      br_0F215
        mov     ah, byte ptr [si]
        inc     si
        cmp     ah, al
        je      loop_0F1F7
loop_0F207:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     loop_0F207
        mov     si, dx
        stc
        jmp     bp
br_0F215:
        mov     si, dx
        clc
        jmp     bp
dma_transfer_init:
        or      cx, cx
        jne     br_0F21F
        ret
br_0F21F:
        cli
        pusha
        mov     bh, 45h
        mov     bl, 6fh
xl_dma_setup_transfer_variant_1c85b:
        call    dma_setup_transfer
        popa
        sti
        ret
fn_0F22B:
        or      cx, cx
        jne     br_0F230
        ret
br_0F230:
        cli
        pusha
        mov     bh, 49h
        mov     bl, 4fh
xl_dma_setup_transfer_variant_1c86c:
        call    dma_setup_transfer
        popa
        sti
        ret
dma_setup_transfer:
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        or      al, 8
        out     dx, al
        xor     ax, ax
        out     80h, ax
        mov     dx, di
        mov     ax, es
        sar     ax, 1
        rcr     dx, 1
        sar     ax, 1
        rcr     dx, 1
        sar     ax, 1
        rcr     dx, 1
        sar     ax, 1
        rcr     dx, 1
        mov     ah, 1
        out     86h, ax
        mov     ax, dx
        out     84h, ax
        mov     ax, di
        shl     ax, 0ch
        out     82h, ax
        mov     ax, 100h
        out     80h, ax
        mov     ax, 0fh
        out     86h, ax
        mov     ax, 0ffffh
        out     84h, ax
        mov     ax, 1000h
        out     82h, ax
        mov     ax, 200h
        out     80h, ax
        xor     ax, ax
        out     8ch, ax
        mov     dx, 1eh
loop_0F28A:
        mov     ax, dx
        out     80h, ax
        mov     ax, 100h
        out     86h, ax
        sub     dx, 2
        jne     loop_0F28A
        mov     ax, 3
        mov     dx, ASIC_DMA_C031
        out     dx, al
        mov     ax, ds
        sub     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
        add     ax, ax
        adc     dx, dx
xl_sys_startup_init_shared:
        add     ax, ax
        adc     dx, dx
        add     ax, si
        adc     dx, 0
        push    dx
        mov     dx, ASIC_DMA_ADDR
        out     dx, ax
        pop     ax
        int     8eh
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     al, bh
        mov     dx, ASIC_DMA_C03A
        out     dx, al
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        and     al, 0f7h
        out     dx, al
        mov     al, bl
        xor     ah, ah
        out     88h, ax
loop_0F2DE:
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        test    al, 8
        je      loop_0F2DE
        cmp     bl, 4fh
        jne     br_0F2FF
        mov     dx, di
        add     dx, cx
        shl     dx, 0ch
loop_0F2F2:
        xor     ax, ax
        out     80h, ax
        in      ax, 82h
        and     ax, 0f000h
        cmp     ax, dx
        jne     loop_0F2F2
br_0F2FF:
        xor     ax, ax
        out     80h, ax
        mov     ah, 1
        out     86h, ax
        xor     ax, ax
        out     88h, ax
loop_0F30B:
        in      al, 88h
        test    al, 80h
        jne     loop_0F30B
        ret
isr_0F312:
        sti
        mov     cx, ds
        push    ds
        mov     ax, RAM_SEG
        mov     ds, ax
isr_0F31B:
        mov     al, byte ptr es:[bp]
        mov     bx, word ptr es:[bp+1]
        mov     dx, word ptr es:[bp+3]
        cmp     al, 0
        je      isr_0F337
        add     bp, 5
        push    es
        pusha
        call    fn_0F339
        popa
        pop     es
        jmp     isr_0F31B
isr_0F337:
        pop     ds
        iret
fn_0F339:
        cmp     al, 1
        je      br_0F36E
        cmp     al, 0ffh
        je      L_0F389
        cmp     al, 35h
        je      br_0F38C
        mov     di, ax
        and     di, 3fh
        shl     di, 1
        if      FW_VERSION >= 114
        add     di, 0a66eh
        elseif  FW_VERSION >= 112
        add     di, 0a652h
        elseif  FW_VERSION >= 110
        add     di, 0a64eh
        else
        add     di, 0a62eh
        endif
        mov     di, word ptr [di]
        mov     si, A1_W_0318C
        test    al, 80h
        jne     br_0F363
        mov     si, A1_W_032EE
        test    al, 40h
        jne     br_0F363
        mov     si, A1_W_0302A
br_0F363:
        add     si, di
        mov     word ptr [si], bx
        mov     word ptr [si+2], dx
        mov     word ptr [si+4], cx
        ret
br_0F36E:
        push    word ptr [A1_W_03130]
        push    word ptr [A1_W_03116]
        push    word ptr [A1_W_03118]
        int     0a4h
        pop     ax
        mov     word ptr [A1_W_03118], ax
        pop     ax
        mov     word ptr [A1_W_03116], ax
        pop     ax
        mov     word ptr [A1_W_03114], ax
        ret
L_0F389:
        int     0a5h
        ret
br_0F38C:
        mov     di, A0_W_03058
        push    ds
        pop     es
        mov     si, cx
        mov     cx, 0ah
tgt_0F396:
        mov     ax, bx
        stosw
        mov     ax, dx
        stosw
        mov     ax, si
        stosw
        loop    tgt_0F396
        ret
isr_0F3A2:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, word ptr [A0_W_00054]
        mov     cx, word ptr [A0_W_00056]
        call    fn_0F3B5
        pop     ds
        iret
fn_0F3B5:
        cmp     al, 28h
        je      br_0F404
        cmp     al, 3ch
        je      br_0F404
        cmp     al, 3dh
        je      br_0F40A
        cmp     al, 3eh
        je      br_0F410
        cmp     al, 3fh
        je      br_0F416
        cmp     al, 39h
        je      br_0F422
        cmp     al, 3ah
        je      br_0F435
        cmp     al, 3bh
        je      br_0F444
        cmp     al, 29h
        jne     br_0F3DB
        jmp     br_0F41C
br_0F3DB:
        cmp     al, 1ah
        jne     br_0F3E1
        jmp     br_0F453
br_0F3E1:
        cmp     al, 1bh
        jne     br_0F3E7
        jmp     br_0F462
br_0F3E7:
        cmp     al, 14h
        jne     br_0F3EE
        jmp     br_0F475
br_0F3EE:
        cmp     al, 4bh
        jne     br_0F3F5
        jmp     br_0F484
br_0F3F5:
        cmp     al, 49h
        jne     br_0F3FC
        jmp     br_0F493
br_0F3FC:
        cmp     al, 52h
        jne     L_0F179
        jmp     br_0F4A2
L_0F179:
        ret
br_0F404:
        nop
        push    cs
        APP0_NEAR pad_bank_a
        ret
br_0F40A:
        nop
        push    cs
        APP0_NEAR pad_bank_b
        ret
br_0F410:
        nop
        push    cs
        APP0_NEAR pad_bank_c
        ret
br_0F416:
        nop
        push    cs
        APP0_NEAR pad_bank_d
        ret
br_0F41C:
        nop
        push    cs
        APP0_NEAR pad_bank_int_c2
        ret
br_0F422:
        mov     word ptr [A1_W_030FE], 0
        mov     word ptr [A1_W_03100], 0
        mov     word ptr [A1_W_03102], 0
        ret
br_0F435:
        if      FW_VERSION >= 111
        mov     word ptr [di+11ah], 4f22h
        elseif  FW_VERSION >= 110
        mov     word ptr [di+11ah], 4f15h
        else
        mov     word ptr [di+11ah], 4eebh
        endif
        mov     word ptr [di+11ch], bx
        mov     word ptr [di+11eh], cx
        ret
br_0F444:
        if      FW_VERSION >= 112
        mov     word ptr [di+114h], 5ac9h
        elseif  FW_VERSION >= 111
        mov     word ptr [di+114h], 5ac7h
        elseif  FW_VERSION >= 110
        mov     word ptr [di+114h], 5ab9h
        else
        mov     word ptr [di+114h], 5a8dh
        endif
        mov     word ptr [di+116h], bx
        mov     word ptr [di+118h], cx
        ret
br_0F453:
        mov     word ptr [A1_W_03078], 1a7h
        mov     word ptr [A1_W_0307A], bx
        mov     word ptr [A1_W_0307C], cx
        ret
br_0F462:
        mov     word ptr [A1_W_030E8], 0
        mov     word ptr [A1_W_030EA], 0
        mov     word ptr [A1_W_030EC], 0
        ret
br_0F475:
        mov     word ptr [A1_W_03036], 7ah
        mov     word ptr [A1_W_03038], bx
        mov     word ptr [A1_W_0303A], cx
        ret
br_0F484:
        mov     word ptr [A1_W_03306], P_D903
        mov     word ptr [A1_W_03308], bx
        mov     word ptr [A1_W_0330A], cx
        ret
br_0F493:
        if      FW_VERSION >= 114
        mov     word ptr [A1_W_0332E], 13c9h
        mov     word ptr [A1_W_03330], bx
        mov     word ptr [A1_W_03332], cx
        else
        mov     word ptr [A1_W_03312], 13c9h
        mov     word ptr [A1_W_03314], bx
        mov     word ptr [A1_W_03316], cx
        endif
        ret
br_0F4A2:
        mov     word ptr [P_335E], P_4490
        mov     word ptr [P_3360], bx
        mov     word ptr [P_3362], cx
        ret
fn_0F4B1:                               ; called from app0's main loop
        push    ds
        int     49h
        pop     ds
        ret
isr_0F4B6:
        sti
        push    ds
        mov     bx, RAM_SEG
        mov     ds, bx
        cmp     al, 2
        jb      isr_0F4E8
        cmp     al, 3ah
        jae     isr_0F4E8
        mov     bl, al
        and     bl, 3fh
        mov     bh, 0
        shl     bx, 1
        if      FW_VERSION >= 114
        mov     cx, word ptr [bx+A1_TBL_0A66E]
        elseif  FW_VERSION >= 112
        mov     cx, word ptr [bx+A1_TBL_0A66E]
        elseif  FW_VERSION >= 110
        mov     cx, word ptr [bx+A1_TBL_0A66E]
        else
        mov     cx, word ptr [bx+A1_TBL_0A62E]
        endif
        mov     bx, A1_W_0318C
        test    al, 80h
        jne     isr_0F4E3
        mov     bx, P_330A
        test    al, 40h
        jne     isr_0F4E3
        mov     bx, P_3046
isr_0F4E3:
        add     bx, cx
        APP0_NEAR fn_03F5C
isr_0F4E8:
        pop     ds
        iret
isr_0F4EA:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        cmp     bl, 20h
        je      isr_0F517
        cmp     bl, 7
        jne     isr_0F501
        mov     cx, 0
        mov     dx, 0
isr_0F501:
        int     91h
        jb      isr_0F50D
        mov     word ptr [A1_W_0A6EE], 0
        pop     ds
        iret
isr_0F50D:
        mov     ah, 0
        mov     word ptr [A1_W_0A6EE], ax
        mov     ax, 0ffffh
        pop     ds
        iret
isr_0F517:
        mov     ax, word ptr [A1_W_0A6EE]
        cmp     ax, 9
        jb      isr_0F522
        mov     ax, 9
isr_0F522:
        mov     word ptr [A1_W_0A6EE], 0
        pop     ds
        iret
isr_0F52A:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        cmp     bl, 20h
        je      isr_0F517
        int     59h
        jb      isr_0F50D
        pop     ds
        iret
isr_0F53C:
        push    ds
        mov     ax, RAM_SEG
        mov     es, ax
        mov     al, byte ptr es:[A0_B_PLAY_STATE]
        mov     ah, 0
        pop     ds
        iret
isr_0F54A:
        push    ds
        pusha
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     dx, 0c016h
        mov     al, 0
        out     dx, al
        push    dx
        mov     dx, 0c010h
        in      al, dx
        pop     dx
        mov     ah, al
        push    dx
        mov     dx, 0c010h
        in      al, dx
        pop     dx
        sti
        xchg    ah, al
        mov     bx, ax
        xchg    ax, word ptr [A1_W_0A836]
        sub     ax, bx
        add     word ptr [A1_W_0A838], ax
isr_0F574:
        cmp     word ptr [A1_W_0A838], 3e8h
        jb      isr_0F588
        inc     word ptr [A1_W_0A83A]
        sub     word ptr [A1_W_0A838], 3e8h
        jmp     isr_0F574
isr_0F588:
        popa
        mov     ax, word ptr [A1_W_0A83A]
        pop     ds
        iret
isr_0F58E:
        push    ds
        mov     ax, RAM_SEG
        mov     ds, ax
        sub     ah, ah
        mov     al, byte ptr [A0_B_004D5]
        shr     al, 4
        pop     ds
        iret
isr_0F59E:
        push    ds
        mov     bx, RAM_SEG
        mov     ds, bx
        sub     ah, ah
        shl     al, 4
        mov     byte ptr [A0_B_004D5], al
        pop     ds
        iret
isr_0F5AE:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        if      FW_VERSION >= 114
        mov     word ptr [A0_W_0376E], ax
        mov     word ptr [A0_W_03770], dx
        elseif  FW_VERSION >= 112
        mov     word ptr [A0_W_0376E], ax
        mov     word ptr [A0_W_03770], dx
        elseif  FW_VERSION >= 110
        mov     word ptr [A0_W_0376E], ax
        mov     word ptr [A0_W_03770], dx
        else
        mov     word ptr [A0_W_0376E], ax
        mov     word ptr [A0_W_03770], dx
        endif
        mov     bx, ax
        mov     cx, dx
        mov     ah, 10h
        mov     dx, es
        int     0b7h
        pop     ds
        iret
isr_0F5C7:
        push    ds
        mov     ax, RAM_SEG
        mov     ds, ax
        if      FW_VERSION >= 114
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, word ptr [A1_W_04854]
        elseif  FW_VERSION >= 112
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, word ptr [A1_W_04838]
        elseif  FW_VERSION >= 110
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, word ptr [A1_W_04838]
        else
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, word ptr [A1_W_04838]
        endif
        mov     al, byte ptr es:[bx+5c0h]
        mov     ah, 0
        dec     ax
        pop     ds
        iret
isr_0F5DF:
        pusha
        push    ds
        push    es
        mov     bx, RAM_SEG
        mov     ds, bx
        mov     bx, P_F5F8
        test    ah, 1
        je      isr_0F5F2
        mov     bx, P_F62E
isr_0F5F2:
        call    bx
        pop     es
        pop     ds
        popa
        iret
L_0F5F8:
        cli
        mov     bx, word ptr [0d9ch]
        cmp     bx, word ptr [0d9eh]
        je      br_0F615
        mov     bx, word ptr [0d9eh]
        mov     byte ptr [bx+0b9ch], al
        inc     bx
        and     bh, 1
        mov     word ptr [0d9eh], bx
        jmp     br_0F621
br_0F615:
        dec     bx
        and     bh, 1
        mov     byte ptr [bx+0b9ch], al
        mov     word ptr [0d9ch], bx
br_0F621:
        mov     dx, 186h
        mov     al, 0f7h
        out     dx, al
        sti
        mov     byte ptr [0ea4h], 0ffh
        ret
L_0F62E:
        cli
        mov     bx, word ptr [10a6h]
        cmp     bx, word ptr [10a8h]
        je      br_0F64B
        mov     bx, word ptr [10a8h]
        mov     byte ptr [bx+0ea6h], al
        inc     bx
        and     bh, 1
        mov     word ptr [10a8h], bx
        jmp     br_0F657
br_0F64B:
        dec     bx
        and     bh, 1
        mov     byte ptr [bx+0ea6h], al
        mov     word ptr [10a6h], bx
br_0F657:
        mov     dx, 1a6h
        mov     al, 0f7h
        out     dx, al
        sti
        mov     byte ptr [11aeh], 0ffh
        ret
isr_0F664:
        mov     bp, RAM_SEG
        mov     ds, bp
        KEY_RESTORE     A1_TBL_0A6F0
        cli
        mov     sp, word ptr [A0_W_0005E]
        mov     bp, RAM_SEG
        mov     ds, bp
        sti
        cmp     byte ptr [A0_B_001B9], 0
        jne     isr_0F684
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
isr_0F684:
        mov     byte ptr [A0_B_001B9], 1
xs_app1_jmp:
        if      APP1_FAR = 0
        jmp     APP0_BASE+main_restart-SEGBASE ; near while app1 is in segment 0
        else
        jmpf    APP0_SEG:main_restart
        endif
xs_app1_jmp_end:
; app0's main-loop call to fn_0F4B1, once app1 is off segment 0 (APP1_FAR).
        if      APP1_FAR
fn_0F4B1_far:
        call    fn_0F4B1
        retf
        endif
xs_app1_thunk_end:
; its offsets are APP1_SEG offsets: a byte past 64K of it is out of reach, and
; near calls would wrap without a word.
        if      $-APP1_CSBASE > 10000h
        error   "app1: code runs past 64K of APP1_SEG"
        endif
APP1_END:
; ata starts on its ATA_SEG paragraph phase.
        FRAME_PAD SEG_ATA
