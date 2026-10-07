; one text: S900 ROM v1.2a, OS v2.1/v4.0; S950 ROM v1.0a/v1.2a. each at
; linear 0. ROMs self-copy (reset_stub); OS moved by FIXUPS, entered at 0:40h.
; layout: IVT 0000h, version record 00FCh (v4.0 at 1DE0h). v4.0 is RAM image:
; 8117h+ stale data; S950 0A400h-0FE01h erased EPROM as RAM. MODEL driver
; sets MODEL (900/950), FW_VERSION (S900: 120/210/400; S950: 100/120).
; condition: FW_VERSION >= 210 = S900 OS, < 210 = ROM. S950 from OS v2.x.
; names tagged by version (_os21, _v12a, _s950); RAM vars in version's ram.inc.
; lifting: reachable from reset_stub, IVT, os_entry, stored handler words, UI
; field records; rest is db. op.w: 81h ALU with immediate fitting byte.
; registry (floppy-OS) addresses offset 200h (disk 512 bytes off). UI: SCR_
; (2x40 LCD), FLD_ (field.inc FIELD macro) with position/handler, FIELDS_ list
; in menu_navigation_loop (bit 15 = first field of page), KEYS_ for FT_KEYS.
; each named for text, same name across versions.

        assume  ds:code, es:code, ss:code       ; DS=ES=SS=0: a label is a plain offset

; memory catalog: SLOTS, 46h bytes/entry, SLOT_TAGS byte ('S'/'P'/0=free).
; two extra entries before both (P_A03E, W_9E4A), counted if B_9575 set.
        if      MODEL = 950
SLOT_COUNT      equ     0c6h
        else
SLOT_COUNT      equ     42h
        endif

; voice record, bp while voice serviced. VC: field offset in OS disks' record.
; S950 lacks 09h word; v1.2a ROM lacks 25h-2Ah three; later fields offset lower.
VC      function o, o-2*((MODEL=950)&&(o>=0bh))-6*((MODEL=900)&&(FW_VERSION<210)&&(o>=2bh))
VOICE_SIZE      equ     VC(37h)

        include "field.inc"                     ; the UI field record

        if      MODEL = 950
        dw      isr_trap, 0             ; INT 00h divide error
        elseif  (MODEL = 900) && (FW_VERSION < 210)
os_entry:                               ; jmpf 0:0 lands here; costs INT 00h its vector
        jmp     br_7cef
        db      00h
        else
        dw      isr_divide_error, 0             ; INT 00h divide error
        endif
        dw      isr_trap, 0             ; INT 01h single step
        dw      isr_midi_rx, 0             ; INT 02h NMI
        dw      isr_trap, 0             ; INT 03h breakpoint
W_0010:
        dw      isr_trap, 0             ; INT 04h overflow
        dw      isr_trap, 0             ; INT 05h
        dw      isr_5dd2, 0             ; INT 06h
        dw      isr_5ddb, 0             ; INT 07h
        dw      isr_voice0, 0             ; INT 08h
        dw      isr_voice1, 0             ; INT 09h
        dw      isr_voice2, 0             ; INT 0Ah
        dw      isr_voice3, 0             ; INT 0Bh
        dw      isr_voice4, 0             ; INT 0Ch
        dw      isr_voice5, 0             ; INT 0Dh
        dw      isr_voice6, 0             ; INT 0Eh
        dw      isr_voice7, 0             ; INT 0Fh
        if      (FW_VERSION >= 210) || (MODEL = 950)
os_entry:
        jmp     br_7cef
        endif
        if      MODEL = 950
B_0043_S950:
        db      03h, 0deh, 0ffh, 00h, 0f0h, 02h, 08h
        endif
        if      (MODEL = 950) && (FW_VERSION = 100)
B_00F0_S950 equ     $+0a6h
B_00F1_S950 equ     $+0a7h
W_00F2_S950 equ     $+0a8h
W_00F4_S950 equ     $+0aah
W_00F6_S950 equ     $+0ach
W_00F8_S950 equ     $+0aeh
        db      178 dup (0)
        endif
        if      (MODEL = 950) && (FW_VERSION = 120)

fn_004a_s950:
        test    byte ptr [FLOPPY_CTRL], 80h
        je      br_0052_s950
        pop     ax
br_0052_s950:
        cmp     byte ptr [B_B46D_S950], 0ffh
        ret
B_00F0_S950 equ     $+98h
B_00F1_S950 equ     $+99h
W_00F2_S950 equ     $+9ah
W_00F4_S950 equ     $+9ch
W_00F6_S950 equ     $+9eh
W_00F8_S950 equ     $+0a0h
        db      164 dup (0)
        endif
        if      MODEL = 950
        db      05h, 58h, 2eh, 58h

; unreachable: DOS .COM (org 100h, INT 21h/4Ch). sends 0A113h bytes of image to
; port 300h. dump tool left in image.
rom_dump_serial:
        endif

RUN_FN_1D22 macro   {GLOBALSYMBOLS}

fn_1d22:
        mov     al, byte ptr [DRUM_SENSITIVITY]
        out     40h, al
        jmp     br_4015
loop_1d2a:
        mov     byte ptr [bx+16h], al
        jmp     br_41e3

fn_1d30:
        call    find_sample
        jae     br_1d36
        ret
br_1d36:
        call    fn_1335
        jmp     fn_1607
        endm
        if      (MODEL = 900) && (FW_VERSION < 400)
        RUN_FN_1D22
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)

L_005a_v12a:
        db      162 dup (0)
        db      02h
W_1DE1:
        db      58h, 2eh
B_1DE3:
        db      58h

; unreachable: sends bytes 0-7F70h, count first, via INT 0E0h fn 4, stops INT 3.
; dump tool left in image.
rom_dump_int_e0:
W_1DE4:                                 ; the dump tool's bytes are variables once the ROM runs
W_1DE6  equ     $+2
        mov     si, 0
W_0104_V12A equ     $+1
        mov     bx, P_8148
W_0106_V12A:
        mov     dl, bl
L_0108_V12A:
W_0108_V12A:
        call    int_e0_print_dispatch
W_1DF0  equ     $+1
        mov     dl, bh
W_1DF2  equ     $+1
        call    int_e0_print_dispatch
loop_0110_v12a:
W_1DF4:
W_1DF6  equ     $+2
        mov     dl, byte ptr cs:[si]
        call    int_e0_print_dispatch
        lodsb
        cmp     si, bx
        jne     loop_0110_v12a
        int     3

int_e0_print_dispatch:
        push    si
        push    bx
        mov     cl, 4
        int     0e0h
        pop     bx
        pop     si
        endif
        if      FW_VERSION = 210
        db      159 dup (0)
        db      03h
W_1DE1:
        db      32h, 2eh
B_1DE3:
        db      31h
; unreachable from OS: at 100h, DOS .COM sends to AUX via INT 21h, count first.
; dump tool (ROM moved to DOS); bytes become variables once OS runs.
com_dump_aux:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
W_1DE4:
        mov     ax, cs
W_1DE6:
        mov     ss, ax
        endif
        if      MODEL = 950
W_0104_V12A:
        mov     ds, ax
W_0108_V12A equ     $+2
W_0106_V12A:
        mov     sp, 0ff80h
L_0109_S950:
        mov     dx, 300h
W_1DF0:
        mov     al, 17h
W_1DF2:
        out     dx, al
W_010F_S950:
        mov     al, 15h
        out     dx, al
W_1DF6:
        mov     si, 0
        mov     cx, 0a113h
        mov     ah, cl
        call    fn_012e_s950
        mov     ah, ch
        call    fn_012e_s950
loop_0122_s950:
        lodsb
        mov     ah, al
        call    fn_012e_s950
        loop    loop_0122_s950
        endif
        if      FW_VERSION = 210
W_1DE8:
        mov     ds, ax
W_1DEA:
        mov     sp, VOICES
W_1DEC  equ     $-1
        mov     si, 0
W_1DEE  equ     $-2
W_1DF0:
        mov     cx, P_8148
W_1DF2  equ     $-1
        mov     dl, cl
W_1DF4  equ     $-1
        call    dos_aux_out
W_1DF6  equ     $-2
        mov     dl, ch
        call    dos_aux_out
loop_0119_os21:
        lodsb
        xchg    dx, ax
        call    dos_aux_out
        loop    loop_0119_os21
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     ah, 4ch
        int     21h
        endif
        if      MODEL = 950

fn_012e_s950:
        mov     dx, 302h
loop_0131_s950:
        in      al, dx
        and     al, 2
        je      loop_0131_s950
        mov     dx, 301h
        mov     al, ah
        out     dx, al
        endif
        if      FW_VERSION = 210

dos_aux_out:                            ; dl out through INT 21h function 4
        pusha
        mov     ah, 4
        int     21h
        popa
        endif
        if      FW_VERSION < 400
        ret
W_1E09:
        endif
        if      FW_VERSION < 210
        db      00h, 00h
W_1E0B:
        db      00h, 00h
W_1E0D:
        db      00h, 00h
        endif
        if      FW_VERSION = 210
        db      9eh, 0aah
W_1E0B:
        db      20h, 0a8h
W_1E0D:
        db      42h, 00h
        endif

RUN_FN_1E0F macro   {GLOBALSYMBOLS}

fn_1e0f:
        push    ax
        mov     byte ptr [B_9575], 0ffh
        mov     ax, word ptr [CUR_PROGRAM]
        cmp     ax, P_A03E
        je      br_1e20
        mov     word ptr [W_7CD8], ax
br_1e20:
        pop     ax
        ret

program_sample_name_xref_resolve:
        if      MODEL = 950
        push    word ptr [FLOPPY_CTRL]
        or      byte ptr [FLOPPY_CTRL], 80h
        call    fn_0167_s950
        pop     word ptr [FLOPPY_CTRL]
        ret

fn_0167_s950:
        mov     byte ptr [B_01DC_S950], 11h
        nop
        endif
        pusha
        mov     bp, W_9E4A
        endm
        if      FW_VERSION < 400
        RUN_FN_1E0F
        mov     cx, SLOT_COUNT+2
        mov     dx, P_A03E
loop_1e2c:
        mov     al, byte ptr [bp]
        cmp     al, 4bh
        jne     br_1e36
        endif
        if      MODEL = 950
        call    fn_018c_s950
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    fn_1e3e
        endif
        if      FW_VERSION < 400
br_1e36:
        add     dx, 46h
        inc     bp
        loop    loop_1e2c
        popa
        endif
        if      MODEL = 950
        jmp     word ptr [IDLE_HOOK]

fn_018c_s950:
        ror     byte ptr [B_01DC_S950], 1
        jae     fn_1e3e
        call    word ptr [IDLE_HOOK]
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        ret
        endif
        if      FW_VERSION < 400

fn_1e3e:
        mov     di, dx
        mov     word ptr [di+28h], 0
        mov     word ptr [di+3eh], 0
        push    bp
        push    cx
        mov     bx, SLOTS
        mov     cx, SLOT_COUNT
        endif

RUN_LOOP_1E55 macro   {GLOBALSYMBOLS}
        mov     bp, SLOT_TAGS
loop_1e55:
        mov     al, byte ptr [bp]
        cmp     al, 53h
        jne     br_1e6c
        mov     di, dx
        add     di, 18h
        call    fn_1e75
        mov     di, dx
        add     di, 2eh
        call    fn_1e75
br_1e6c:
        inc     bp
        add     bx, 46h
        loop    loop_1e55
        pop     cx
        pop     bp
        ret

fn_1e75:
        push    cx
        mov     cx, 5
        lea     si, [bx]
        repe cmpsw
        jne     br_1e82
        mov     word ptr [di+6], bx
br_1e82:
        pop     cx
        ret
        if      MODEL = 950
B_01DC_S950:
        db      00h
        endif

program_sample_catalog_screen:
        call    cold_init_buffer_clear_dispatch
        mov     si, MSG_PROGRAMS
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     di, P_86EE
        call    fn_2ef8
        mov     byte ptr [B_957A], 50h
        call    program_sample_tag_scan
        nop

play_prompt:
        mov     byte ptr [LCD_CURSOR_MODE], 0dh
        out     68h, al
        cmp     al, 1
        je      br_1ebf
        cmp     al, 0ah
        pushf
        mov     si, MSG_SCROLL_WITH_KNOB
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     di, P_86F7
        call    fn_2ef8
        mov     si, MSG_SELECT_WITH_SINGLE_KEY
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        popf
        jb      br_1eb9
        mov     si, MSG_SELECT_WITH_TWO_DIGITS
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
br_1eb9:
        mov     di, B_87F6
        call    fn_2ef8
br_1ebf:
        mov     bp, SLOT_TAGS
        endm
        if      FW_VERSION < 400
        RUN_LOOP_1E55
        mov     cx, SLOT_COUNT
        endif

RUN_LOOP_1ED7 macro   {GLOBALSYMBOLS}
        mov     bx, 0
        mov     dx, SLOTS
        mov     word ptr [W_95B4], P_8709
        mov     word ptr [W_95B6], P_8811
loop_1ed7:
        mov     al, byte ptr [bp]
        cmp     byte ptr [B_957A], al
        jne     br_1f39
        push    cx
        push    bx
        mov     ax, bx
        inc     ax
        mov     cl, 0ah
        div     cl
        add     ax, 3030h
        and.w   bx, 1
        add     bx, bx
        endm
        if      FW_VERSION < 400
        RUN_LOOP_1ED7
        mov     di, word ptr [bx+TBL_95B4]
        endif

RUN_BR_1EFE macro   {GLOBALSYMBOLS}
        cmp     byte ptr [B_9576], cl
        jae     br_1efe
        mov     al, 20h
br_1efe:
        stosw
        mov     byte ptr [di], 2dh
        inc     di
        mov     si, dx
        mov     cx, 5
        rep movsw
        cmp     dx, word ptr [CUR_PROGRAM]
        jne     br_1f2f
        mov     si, 17h
        nop
        endm
        if      FW_VERSION < 400
        RUN_BR_1EFE
        mov     word ptr [si+TBL_87F6], ax
        endif

RUN_BR_1F2F macro   {GLOBALSYMBOLS}
        mov     al, byte ptr [bx+TBL_1F4B]
        mov     byte ptr [B_7C57], al
        mov     ax, word ptr [W_95B6]
        cmp     byte ptr [B_9576], 0ah
        adc     ax, cx
        sub     ax, B_87F6
        mov     word ptr [W_9588], ax
br_1f2f:
        mov     al, 20h
        stosb
        endm
        if      FW_VERSION < 400
        RUN_BR_1F2F
        mov     word ptr [bx+TBL_95B4], di
        endif

RUN_BR_1F39 macro   {GLOBALSYMBOLS}
        pop     bx
        pop     cx
        inc     bx
br_1f39:
        inc     bp
        add     dx, 46h
        loop    loop_1ed7
        mov     ax, word ptr [W_95B4]
        sub     ax, W_870A
        mov     word ptr [LCD_SCROLL_MAX], ax
        jmp     program_sample_tag_scan
TBL_1F4B:
        db      00h, 00h, 40h
MSG_PROGRAMS:
        db      "PROGRAMS."
        db      0feh
MSG_SCROLL_WITH_KNOB:
        db      " Scroll with knob."
        db      0feh
MSG_SELECT_WITH_SINGLE_KEY:
        db      "Select with single key  7"
        db      0feh
MSG_SELECT_WITH_TWO_DIGITS:
        db      "Select with two digits 97"
        endm
        if      FW_VERSION < 400
        RUN_BR_1F39
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      0feh
        db      "SAMPLES. "
        endif

RUN_COLD_INIT_BUFFER_CLEAR_DISPATCH macro   {GLOBALSYMBOLS}
        db      0feh

cold_init_buffer_clear_dispatch:
        mov     di, P_86EE
        mov     ax, 2020h
        mov     cx, 108h
        rep stosw
        mov     ax, 0
        jmp     lcd_show_screen

panel_scan:
        mov     al, 90h
        out     66h, al
        in      al, 60h
        mov     ah, al
        mov     al, 82h
        out     66h, al
        mov     al, byte ptr [PANEL_LAMPS]
        out     64h, al
        cmp     ah, 0ffh
        je      br_2010
        in      al, 62h
        cmp     al, 0ffh
        je      br_2010
        mov     cx, 0ffffh
        cmp     al, 0e3h
        jne     key_matrix_scan_decode
        pusha
loop_1fde:
        in      al, 62h
        cmp     al, 0ffh
        jne     loop_1fde
        int     3
        db      61h
key_matrix_scan_decode:
        inc     cl
        shr     al, 1
        jb      key_matrix_scan_decode
loop_1fec:
        inc     ch
        shr     ah, 1
        jb      loop_1fec
        mov     al, ch
        shl     al, 1
        shl     al, 1
        shl     al, 1
        or      al, cl
        mov     ah, al
        xchg    byte ptr [KEY_MATRIX_LAST], al
        cmp     al, ah
        je      br_2015
        mov     al, ah
        mov     bx, KEY_MAP
        xlat
        mov     byte ptr [KEY_CODE], al
        ret
br_2010:
        mov     al, 0ffh
        mov     byte ptr [KEY_MATRIX_LAST], al
br_2015:
        ret

fn_2016:
        push    cx
        push    di
        mov     di, SLOT_TAGS
        endm
        if      FW_VERSION < 400
        RUN_COLD_INIT_BUFFER_CLEAR_DISPATCH
        mov     cx, SLOT_COUNT
        endif

RUN_LOOP_2020 macro   {GLOBALSYMBOLS}
        xor     ah, ah
loop_2020:
        scasb
        jne     br_2025
        inc     ah
br_2025:
        loop    loop_2020
        pop     di
        pop     cx
        xchg    al, ah
        cbw
        ret

program_sample_tag_scan:
        endm
        if      FW_VERSION < 400
        RUN_LOOP_2020
        mov     cx, SLOT_COUNT
        endif

RUN_LOOP_2036 macro   {GLOBALSYMBOLS}
        mov     si, SLOT_TAGS
        mov     dx, 0
loop_2036:
        lodsb
        cmp     al, 50h
        jne     br_203d
        inc     dl
br_203d:
        cmp     al, 53h
        jne     br_2043
        inc     dh
br_2043:
        loop    loop_2036
        mov     ax, dx
        mov     byte ptr [B_9576], al
        mov     byte ptr [B_9577], ah
        or      al, al
        ret
loop_2051:
        mov     ax, word ptr [bp+9]

put_number:
        push    bx
        push    cx
        push    dx
        push    di
        push    ax
        mov     ah, dh
        call    fn_20bf
        mov     cl, dl
        sub     cl, dh
        mov     ch, 0
        mov     dl, dh
        mov     dh, 0
        add     di, dx
        mov     dl, 0
        pop     ax
        cmp     byte ptr [bp+5], 2
        jne     br_2076
        call    put_note_name
br_2076:
        test    byte ptr [bp+5], 10h
        je      br_208d
        and     ax, ax
        mov     bl, 2bh
        jns     br_2086
        neg     ax
        mov     bl, 2dh
br_2086:
        xchg    bx, ax
        stosb
        call    put_char_echo
        dec     cx
        xchg    bx, ax
br_208d:
        mov     bx, cx
        add     bx, bx
        div     word ptr [bx+br_2109]
        add     al, 30h
        cmp     al, 30h
        jne     br_20a8
        cmp     cx, 1
        je      br_20a8
        cmp     byte ptr [di-1], 20h
        jne     br_20a8
        mov     al, 20h
br_20a8:
        stosb
        call    put_char_echo
        mov     ax, dx
        cwd
        loop    br_208d
        pop     di
        pop     dx
        pop     cx
        pop     bx
        mov     ah, dh
        mov     bl, ah
        dec     ah
        js      br_20f7
        jmp     br_20cc

fn_20bf:
        dec     ah
        js      br_20f7
        cmp     byte ptr [bp+5], 2
        jne     br_20cc
        sub     ah, 4
br_20cc:
        cmp     ah, 28h
        jb      br_20e4
        sub     ah, 28h
        add     ah, byte ptr [W_9582]
        js      br_20f7
        cmp     ah, 28h
        jae     br_20f7
        add     ah, 40h
        jmp     br_20ef
br_20e4:
        add     ah, byte ptr [W_9582]
        js      br_20f7
        cmp     ah, 28h
        jae     br_20f7
br_20ef:
        mov     byte ptr [PUT_ECHO], 0ffh
        if      (MODEL = 900) && (FW_VERSION < 400)
        nop
        endif
        jmp     br_2177
br_20f7:
        mov     byte ptr [PUT_ECHO], 0
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        ret

put_char_echo:
        mov     ah, al
        test    byte ptr [PUT_ECHO], 0ffh
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        je      br_2109
        call    lcd_put_char
br_2109:
        ret
PUT_ECHO:
        db      00h, 01h, 00h, 0ah, 00h, 64h, 00h, 0e8h, 03h, 10h, 27h

put_note_name:
        pusha
        sub     di, 4
        xor     ah, ah
        mov     dl, 0ch
        div     dl
        push    ax
        xchg    al, ah
        mov     bx, NOTE_LETTERS
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        xlat
        stosb
        call    put_char_echo
        pop     ax
        push    ax
        mov     bx, NOTE_OCTAVES
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        xlat
        stosb
        call    put_char_echo
        pop     ax
        xchg    al, ah
        mov     bx, NOTE_SHARPS
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        xlat
        stosb
        call    put_char_echo
        mov     al, 20h
        call    put_char_echo
        popa
        ret
NOTE_LETTERS:
        db      "CCDDEFFGGAAB"
NOTE_OCTAVES:
        db      "--0123456789+"
NOTE_SHARPS:
        db      " # #  # # # "

lcd_goto:
        dec     ah
        js      br_2184
        cmp     ah, 28h
        jb      br_2177
        add     ah, 18h
br_2177:
        add     ah, 80h
        call    lcd_command
        mov     ah, byte ptr [LCD_CURSOR_MODE]
        jmp     lcd_command
br_2184:
        ret
        db      0cch, 0c3h
        if      MODEL = 950

fn_04d6_s950:
        pusha
        call    fn_2187
        popa
        ret
        endif

fn_2187:
        cmp     byte ptr [bp], 53h
        je      fn_21a1

fn_218d:
        mov     byte ptr [bp], 0
        mov     dx, word ptr [bx+12h]
loop_2194:
        call    fn_29f9
        mov     bx, dx
        mov     dx, word ptr [bx+44h]
        and     dx, dx
        jne     loop_2194
        ret

fn_21a1:
        mov     byte ptr [bp], 0
        mov     bx, word ptr [bx+28h]
br_21a8:
        xor     al, al
        xchg    byte ptr [bx], al
        mov     bx, word ptr [bx+8]
        and     al, 2
        jne     br_21a8
        ret

isr_divide_error:
        mov     si, MSG_DIVIDE_ERROR
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     dx, 1
        call    lcd_print
        int     3
MSG_DIVIDE_ERROR:
        db      "DIVIDE ERROR."
        db      0c2h, 0feh

fn_21cd:
        cmp     byte ptr [FIELD_PAGES], 0
        je      br_221c
        mov     si, word ptr [FIELD_LIST]
        xor     cx, cx
loop_21da:
        lodsw
        rol     ax, 1
        shr     ax, 1
        je      br_221c
        mov     dx, ax
        xchg    bx, ax
        mov     al, byte ptr [bx+2]
        pushf
        and     ax, 7fh
        if      (MODEL = 900) && (FW_VERSION < 210)
        popf
        endif
        xchg    di, ax
        mov     bx, word ptr [bx]
        endm
        if      FW_VERSION < 400
        RUN_LOOP_2036
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     byte ptr [bx+di], 2ah
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        cmp     byte ptr [bx+di], 0
        jne     br_21f6
        mov     byte ptr [bx+di], 2ah
br_21f6:
        popf
        endif

RUN_BR_2208 macro   {GLOBALSYMBOLS}
        jae     br_2208
        inc     cx
        mov     byte ptr [bx], 2ah
        cmp     byte ptr [B_956B], 0
        jne     br_220f
        xor     di, di
        jmp     br_220f
br_2208:
        cmp     byte ptr [B_956B], 0
        je      loop_21da
br_220f:
        cmp     dx, bp
        jne     loop_21da
        mov     byte ptr [bx+di], 0
        mov     byte ptr [B_2D1E], cl
        jmp     loop_21da
br_221c:
        ret
menu_navigation_loop:
        mov     word ptr [IDLE_HOOK], idle_tasks
        endm
        if      FW_VERSION < 400
        RUN_BR_2208
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
loop_2223:
        endif

RUN_LOOP_2244 macro   {GLOBALSYMBOLS}
        push    ax
        call    voice_reset_all
        call    thk_program_sample_tag_scan
        call    fn_66aa
        sti
        pop     ax
        mov     word ptr [FIELD_LIST], ax
        mov     word ptr [FIELD_LIST_POS], ax
        mov     byte ptr [B_2D1E], 1
        nop
        xchg    si, ax
        xor     ax, ax
        mov     byte ptr [FIELD_COUNT], al
        mov     byte ptr [FIELD_PAGES], al
loop_2244:
        lodsw
        shl     ax, 1
        je      br_2255
        jae     br_224f
        inc     byte ptr [FIELD_PAGES]
br_224f:
        inc     byte ptr [FIELD_COUNT]
        jmp     loop_2244
br_2255:
        mov     byte ptr [B_7C57], 40h
        mov     byte ptr [LCD_CURSOR_MODE], 0dh
        mov     bx, word ptr [FIELD_LIST]
        mov     bp, word ptr [bx]
        and     bp, 7fffh
        mov     ax, word ptr [bp]
        mov     word ptr [LCD_ROW1], ax
        add     ax, 28h
        mov     word ptr [LCD_ROW2], ax
        cmp     byte ptr [FIELD_PAGES], 0
        je      br_227f
loop_227c:
        call    fn_2c42
br_227f:
        endm
        if      FW_VERSION < 400
        RUN_LOOP_2244
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     bx, word ptr [LAST_FIELD_PTR]
        mov     word ptr [bx], bp
        endif

RUN_BR_22A3 macro   {GLOBALSYMBOLS}
        mov     byte ptr [B_956B], 0ffh
        mov     al, byte ptr [bp+3]
        cbw
        dec     ax
        mov     word ptr [W_9588], ax
        mov     byte ptr [B_7C57], 0
        sub     al, 28h
        jb      br_22a3
        mov     word ptr [W_9588], ax
        mov     byte ptr [B_7C57], 40h
br_22a3:
        call    menu_item_render_and_transmit
        mov     di, word ptr [bp]
        dec     di
        mov     dh, byte ptr [bp+3]
        mov     dl, byte ptr [bp+4]
        call    field_edit
        cmp     byte ptr [FIELD_PAGES], 0
        jne     br_22cb
        mov     byte ptr [B_956B], 0ffh
        cmp     al, 10h
        jne     br_22c5
        mov     al, 9
br_22c5:
        cmp     al, 11h
        jne     br_22cb
        mov     al, 8
br_22cb:
        cmp     byte ptr [B_956B], 0
        jne     br_22d7
        call    fn_2ce4
        jmp     br_227f
br_22d7:
        cmp     al, 20h
        jne     br_22e9
        call    fn_235a
        test    byte ptr [bp+2], 80h
        je      br_22e7
        call    fn_235a
br_22e7:
        jmp     br_227f
br_22e9:
        cmp     al, 8
        mov     si, word ptr [FIELD_LIST_POS]
        lodsw
        jne     br_2314
        test    ah, 80h
        je      br_22ff
        mov     byte ptr [B_956B], 0
        jmp     loop_227c
br_22ff:
        sub     si, 4
        cmp     word ptr [si], 0
        je      br_22e7
        mov     word ptr [FIELD_LIST_POS], si
        mov     bp, word ptr [si]
        and     bp, 7fffh
        jmp     br_227f
br_2314:
        mov     dx, si
        lodsw
        rol     ax, 1
        shr     ax, 1
        ja      br_2339
loop_231d:
        sub     si, 4
        cmp     byte ptr [FIELD_PAGES], 0
        je      br_2336
        mov     dx, si
        lodsw
        rol     ax, 1
        shr     ax, 1
        jae     loop_231d
loop_2330:
        mov     bp, ax
        mov     word ptr [FIELD_LIST_POS], dx
br_2336:
        jmp     br_227f
br_2339:
        xchg    si, ax
        test    byte ptr [si+2], 80h
        xchg    si, ax
        jne     loop_231d
        jmp     loop_2330

menu_item_render_and_transmit:
        call    fn_21cd
        mov     ax, word ptr [bp]
        mov     word ptr [LCD_ROW1], ax
        add     ax, 28h
        mov     word ptr [LCD_ROW2], ax
        xor     ax, ax
        mov     byte ptr [W_9582], al
        jmp     lcd_show_screen

fn_235a:
        endm
        if      FW_VERSION < 400
        RUN_BR_22A3
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        cmp     bp, word ptr [LAST_FIELD_PTR]
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        cmp     bp, word ptr [FIELD_PREVIOUS]
        endif
        if      FW_VERSION < 400
        mov     bp, word ptr [FIELD_RECENT]
        je      br_2368
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     bp, word ptr [LAST_FIELD_PTR]
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     bp, word ptr [FIELD_PREVIOUS]
        endif

RUN_BR_2368 macro   {GLOBALSYMBOLS}
br_2368:
        mov     si, word ptr [FIELD_LIST]
loop_236c:
        mov     word ptr [FIELD_LIST_POS], si
        lodsw
        and     ah, 7fh
        cmp     ax, bp
        jne     loop_236c
        ret

menu_selection_history:
        cmp     bp, word ptr [FIELD_RECENT]
        je      br_238b
        push    word ptr [FIELD_RECENT]
        endm
        if      FW_VERSION < 400
        RUN_BR_2368
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        pop     word ptr [LAST_FIELD_PTR]
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        pop     word ptr [FIELD_PREVIOUS]
        endif

RUN_BR_238B macro   {GLOBALSYMBOLS}
        mov     word ptr [FIELD_RECENT], bp
br_238b:
        ret
error_restart:
        mov     word ptr [ERROR_MSG], ax
        if      MODEL = 950
        cld
        endif
        cli
        mov     sp, VOICES
        xor     ax, ax
        mov     ds, ax
        mov     es, ax
        endm
        if      FW_VERSION < 400
        RUN_BR_238B
        endif
        if      MODEL = 950
        mov     al, 1
        out     8fh, al
        mov     al, 0
        out     8, al
        mov     byte ptr [FLOPPY_CTRL], al
        mov     byte ptr [B_0443], al
        mov     byte ptr [B_0497], al
        mov     byte ptr [B_04D7], al
        call    voice_reset_all
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        cld
        call    voice_reset_all
        mov     byte ptr [MOTOR_TIMEOUT], 20h
        endif

RUN_FIELD_PARSE macro   {GLOBALSYMBOLS}
        mov     si, word ptr [ERROR_MSG]
        mov     dx, 1
        call    lcd_print
        call    program_sample_name_xref_resolve
        jmp     br_2abe

field_parse:
        push    si
        push    bp
        push    bx
        push    cx
        push    dx
        mov     al, byte ptr [bp+5]
        mov     byte ptr [B_2415], al
        test    al, 10h
        je      br_23c3
        inc     dh
br_23c3:
        mov     al, dl
        dec     al
        cbw
        add     ax, di
        mov     si, ax
        std
        sub     dl, dh
        mov     cl, dl
        mov     ch, 0
        xor     ax, ax
        mov     bx, ax
        mov     bp, POW10
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
loop_23da:
        lodsb
        cmp     al, 3ah
        jb      br_23e1
        xor     ax, ax
br_23e1:
        and     ax, 0fh
        mul     word ptr [bp]
        jae     br_23ee
        mov     ax, 0ffffh
        jb      br_2404
br_23ee:
        add     bx, ax
        inc     bp
        inc     bp
        loop    loop_23da
        mov     ax, bx
        test    byte ptr [B_2415], 10h
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        je      br_2404
        cmp     byte ptr [si], 2dh
        jne     br_2404
        neg     ax
br_2404:
        pop     dx
        pop     cx
        pop     bx
        pop     bp
        pop     si
        cld
        ret
POW10:
        db      01h, 00h, 0ah, 00h, 64h, 00h, 0e8h, 03h, 10h, 27h
B_2415:
        db      00h

find_sample:
        mov     al, 53h
        jmp     find_slot_by_name

find_program:
        mov     al, 50h

find_slot_by_name:
        mov     bx, SLOTS
        mov     bp, SLOT_TAGS
        cmp     byte ptr [B_9575], 0
        je      br_242f
        mov     bx, P_A03E
        mov     bp, W_9E4A
br_242f:
        cmp     byte ptr [bp], al
        jne     br_243f
        lea     di, [bx]
        mov     si, dx
        mov     cx, 5
        repe cmpsw
        je      br_244a
br_243f:
        add     bx, 46h
        inc     bp
        cmp     bp, P_9E8E
        jne     br_242f
        stc
br_244a:
        mov     ax, bx
        ret

find_free_slot:
        push    cx
        endm
        if      FW_VERSION < 400
        RUN_FIELD_PARSE
        mov     cx, SLOT_COUNT
        endif

RUN_LOOP_2457 macro   {GLOBALSYMBOLS}
        mov     bp, SLOT_TAGS
        mov     bx, SLOTS
loop_2457:
        test    byte ptr [bp], 0ffh
        je      br_2464
        inc     bp
        add     bx, 46h
        loop    loop_2457
        stc
br_2464:
        pop     cx
        ret

fn_2466:
        push    cx
        mov     bp, P_967A
        endm
        if      FW_VERSION < 400
        RUN_LOOP_2457
        endif
        if      MODEL = 950
        mov     cx, 12ch
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     cx, 0c8h
        endif

RUN_LOOP_246D macro   {GLOBALSYMBOLS}
loop_246d:
        test    byte ptr [bp], 0ffh
        je      br_2479
        add     bp, 0ah
        loop    loop_246d
        stc
br_2479:
        pop     cx
        ret

fn_247b:
        call    panel_scan

key_get:
        xor     al, al
        xchg    byte ptr [KEY_CODE], al
        cmp     al, 0
        ret

field_edit:
        out     68h, al
        mov     byte ptr [ENTER_KEY], 0
        mov     ah, 0dh
        cmp     word ptr [bp+5], 1
        jne     br_2498
        mov     ah, 0eh
br_2498:
        call    lcd_set_cursor_mode
        mov     bh, 0
        mov     bl, dh
loop_249f:
        call    word ptr [IDLE_HOOK]
        call    key_get
        jne     br_24b0
        call    fn_27c5
        call    field_knob
        jmp     loop_249f
br_24b0:
        cmp     al, 0ah
        jne     br_24ce
        cmp     byte ptr [bp+5], 1
        jne     loop_249f
        cmp     byte ptr [bp+6], 41h
        jb      loop_249f
        xor     byte ptr [LCD_CURSOR_MODE], 3
        mov     ah, byte ptr [LCD_CURSOR_MODE]
        call    lcd_command
        jmp     loop_249f
br_24ce:
        cmp     al, 10h
        je      br_24d6
        cmp     al, 11h
        jne     br_24dd
br_24d6:
        mov     byte ptr [B_956B], 0
        jmp     field_commit
br_24dd:
        cmp     al, 20h
        jne     br_24e6
        call    menu_selection_history
        jmp     br_24f5
br_24e6:
        cmp     al, 8
        je      br_24ee
        cmp     al, 9
        jne     br_250b
br_24ee:
        cmp     byte ptr [FIELD_PAGES], 0
        je      br_250b
br_24f5:
        cmp     byte ptr [LCD_CURSOR_MODE], 0eh
        je      br_250b

field_commit:
        pusha
        test    byte ptr [bp+5], 6
        je      br_2506
        call    field_parse_clamp
br_2506:
        call    word ptr [bp+7]
        popa
        ret
br_250b:
        cmp     al, 0dh
        jne     br_2521
        mov     byte ptr [ENTER_KEY], 0ffh
        mov     ah, 0dh
        call    lcd_set_cursor_mode
char_input_classifier:
        call    field_commit
        mov     bl, dh
        jmp     br_25a5
br_2521:
        test    byte ptr [bp+5], 48h
        je      br_252a
        jmp     br_25b4
br_252a:
        cmp     al, 8
        jne     br_2538
        dec     bl
        cmp     bl, dh
        jae     br_25a5
        mov     bl, dh
        jmp     br_25a5
br_2538:
        cmp     al, 9
        jne     br_2546
        inc     bl
        cmp     bl, dl
        jne     br_25a5
        dec     bl
        jmp     br_25a5
br_2546:
        cmp     al, 20h
        jae     br_254d
loop_254a:
        jmp     loop_249f
br_254d:
        cmp     al, 7eh
        jae     loop_254a
        test    byte ptr [bp+5], 6
        jne     br_2560
        test    byte ptr [bp+5], 20h
        jne     br_25b4
        jmp     br_258d
        db      90h
br_2560:
        cmp     al, 20h
        jne     br_2573
        cmp     al, byte ptr [bx+di-1]
        jne     loop_254a
        mov     ah, dl
        sub     ah, bl
        dec     ah
        je      loop_254a
        jmp     br_258d
br_2573:
        test    byte ptr [bp+5], 10h
        je      br_2585
        cmp     dh, bl
        jne     br_2585
        cmp     al, 2dh
        je      br_258d
        cmp     al, 2bh
        je      br_258d
br_2585:
        cmp     al, 30h
        jb      loop_254a
        cmp     al, 3ah
        jae     loop_254a
br_258d:
        mov     byte ptr [bx+di], al
        mov     ah, al
        endm
        if      FW_VERSION < 400
        RUN_LOOP_246D
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
field_char_echo_input:
        endif

RUN_BR_25A5 macro   {GLOBALSYMBOLS}
        call    lcd_put_char
        inc     bl
        cmp     bl, dl
        jne     br_25ae
        dec     bl
        test    byte ptr [bp+5], 6
        je      br_25a5
        jmp     char_input_classifier
br_25a5:
        mov     ah, bl
        add     ah, byte ptr [W_9582]
        call    lcd_goto
br_25ae:
        call    menu_selection_history
        jmp     loop_249f
br_25b4:
        push    di
        mov     di, word ptr [bp+0bh]
        mov     cx, word ptr [bp+0dh]
        mov     ch, 0
loop_25bd:
        cmp     al, byte ptr [di]
        je      br_25c8
        inc     di
        loop    loop_25bd
        pop     di
        jmp     loop_249f
br_25c8:
        pop     di
        mov     byte ptr [bx+di], al
        mov     ah, al
        test    byte ptr [bp+5], 48h
        jne     br_25d8
        call    lcd_put_char
        jmp     br_2603
br_25d8:
        cmp     ah, 2dh
        pusha
        mov     si, TXT_NO_OFF
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     word ptr [bp+9], 0
        je      br_25ec
        mov     si, TXT_YES_ON
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        dec     word ptr [bp+9]
br_25ec:
        lea     di, [bx+di]
        mov     cx, 3
        test    byte ptr [bp+5], 40h
        je      br_25f9
        add     si, cx
br_25f9:
        lodsb
        stosb
        xchg    ah, al
        call    lcd_put_char
        loop    br_25f9
        popa
br_2603:
        call    menu_selection_history
        jmp     char_input_classifier
TXT_NO_OFF:
        db      "NO OFF"
TXT_YES_ON:
        db      "YESON "

field_knob:
        call    knob_read
        je      br_2630
        test    byte ptr [bp+5], 6
        je      br_2631
        add     ax, word ptr [bp+9]
        jo      br_2630
loop_2625:
        call    menu_selection_history
        pusha
        call    field_clamp
        call    word ptr [bp+7]
        popa
br_2630:
        ret
br_2631:
        test    byte ptr [bp+5], 1
        je      br_2630
        cmp     byte ptr [LCD_CURSOR_MODE], 0eh
        je      br_2644
        cmp     byte ptr [bp+6], 41h
        jae     br_26ac
br_2644:
        or      ah, 1
        add     al, byte ptr [bx+di]
        push    di
        push    cx
        mov     di, NAME_CHARS
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     cx, 26h
        repne scasb
        je      br_2663
        mov     di, NAME_CHAR_WRAP
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     cl, 8
        repne scasb
        mov     al, 41h
        jne     br_2663
        mov     al, byte ptr [di+7]
br_2663:
        pop     cx
        pop     di
        mov     byte ptr [bx+di], al
        mov     ah, al
        call    lcd_put_char
        mov     ah, bl
        add     ah, byte ptr [W_9582]
        call    lcd_goto
        ret
NAME_CHAR_WRAP:
        db      "[$:!"
        db      22h, 2fh, 1fh
        db      "@Z1 A##9 "
NAME_CHARS:
        db      "#0123456789 ABCDEFGHIJKLMNOPQRSTUVWXYZ"
br_26ac:
        mov     al, byte ptr [bp+6]
        pusha
        push    dx
        push    ax
        xchg    dh, dl
        xor     dh, dh
        add     di, dx
        xchg    dx, di
        if      MODEL = 950
        cmp     al, 56h
        jne     br_0a25_s950
        jmp     br_0b3a_s950
br_0a25_s950:
        endif
        cmp     al, 61h
        jb      br_26c1
        jmp     br_2783
br_26c1:
        mov     word ptr [W_1E09], SLOTS
        mov     word ptr [W_1E0B], SLOT_TAGS
        endm
        if      FW_VERSION < 400
        RUN_BR_25A5
        mov     word ptr [W_1E0D], SLOT_COUNT
        cmp     byte ptr [B_9575], 0
        je      br_26ec
        mov     word ptr [W_1E09], P_A03E
        mov     word ptr [W_1E0B], W_9E4A
        mov     word ptr [W_1E0D], SLOT_COUNT+2
        endif

RUN_BR_26EC macro   {GLOBALSYMBOLS}
br_26ec:
        call    find_slot_by_name
        jae     br_26f9
        mov     bx, word ptr [W_1E09]
        mov     bp, word ptr [W_1E0B]
br_26f9:
        pop     ax
        mov     cx, word ptr [W_1E0D]
        and     ah, ah
        jne     br_271e
loop_2702:
        add     bx, 46h
        inc     bp
        cmp     bp, P_9E8E
        jne     br_2714
        mov     bx, word ptr [W_1E09]
        mov     bp, word ptr [W_1E0B]
br_2714:
        cmp     al, byte ptr [bp]
        je      br_2737
        loop    loop_2702
loop_271b:
        pop     dx
        popa
        ret
br_271e:
        sub     bx, 46h
        dec     bp
        cmp     bp, word ptr [W_1E0B]
        jae     br_272e
        mov     bp, P_9E8E
        endm
        if      FW_VERSION < 400
        RUN_BR_26EC
        endif
        if      MODEL = 950
        mov     bx, MIDI_RX_BUF
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     bx, P_B2D6
        endif

RUN_BR_272E macro   {GLOBALSYMBOLS}
br_272e:
        cmp     al, byte ptr [bp]
        je      br_2737
        loop    br_271e
        jmp     loop_271b
br_2737:
        mov     di, dx
        mov     si, bx
        mov     cx, 5
        rep movsw
        cmp     al, 53h
        jne     br_274e
        mov     al, 20h
        cmp     byte ptr [bx+2ah], cl
        je      br_274d
        mov     al, 4
br_274d:
        stosb
br_274e:
        pop     ax
        add     ah, byte ptr [W_9582]
        call    lcd_goto
        mov     cx, 0bh
        mov     bx, dx
loop_275b:
        mov     ah, byte ptr [bx]
        call    lcd_put_char
        inc     bx
        loop    loop_275b
        popa
        endm
        if      FW_VERSION < 400
        RUN_BR_272E
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        cmp     bp, FLD_SOFT_SAMPLE_1
        jne     br_276d
        call    fn_503b
br_276d:
        cmp     bp, FLD_LOUD_SAMPLE_2
        endif
        if      MODEL = 950
        jne     br_0ae1_s950
        call    fn_5045
br_0ae1_s950:
        cmp     bp, P_0EE0
        jne     br_2776
        call    fn_1832
        endif
        if      FW_VERSION = 210
        jne     br_2776
        call    fn_5045
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
br_2776:
        endif

RUN_BR_2783 macro   {GLOBALSYMBOLS}
        mov     ah, dl
        dec     ah
        mov     bl, ah
        add     ah, byte ptr [W_9582]
        jmp     lcd_goto
br_2783:
        sub     al, 20h
        mov     bx, dx
        call    disk_catalog_find
        mov     dx, bx
        je      br_2791
        mov     di, DISK_CATALOG
br_2791:
        pop     ax
        sub     al, 20h
        and     ah, ah
        mov     bx, 18h
        endm
        if      FW_VERSION < 400
        RUN_BR_2783
        endif
        if      MODEL = 950
        mov     cx, word ptr [W_1E78_S950]
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     cx, 40h
        endif

RUN_BR_27A0 macro   {GLOBALSYMBOLS}
        je      br_27a0
        neg     bx
br_27a0:
        add     di, bx
        cmp     di, DISK_CATALOG
        jae     br_27ab
        mov     di, P_8EE6
br_27ab:
        cmp     di, P_8EFE
        jb      br_27b4
        mov     di, DISK_CATALOG
br_27b4:
        cmp     al, byte ptr [di+10h]
        je      br_27be
        loop    br_27a0
        jmp     loop_271b
br_27be:
        mov     bx, di
        xor     ax, ax
        jmp     br_2737
        if      MODEL = 950
br_0b3a_s950:
        call    fn_2327_s950
        and     ax, ax
        jne     br_0b5d_s950
        pop     ax
        add     ax, ax
        jb      br_0b50_s950
        mov     byte ptr [B_B462_S950], 1
        pusha
        call    word ptr [bp+7]
        popa
br_0b50_s950:
        mov     si, 1eb0h
        mov     di, dx
        mov     cx, 5
        rep movsw
        jmp     br_274e
br_0b5d_s950:
        mov     si, 1eb0h
        mov     di, dx
        mov     cx, 5
        repe cmpsw
        je      br_0b6e_s950
        call    fn_2fa3_s950
        jae     br_0b71_s950
br_0b6e_s950:
        mov     ax, 0ffffh
br_0b71_s950:
        pop     bx
        mov     bl, bh
        or      bl, 1
        add     ax, bx
        js      br_0b50_s950
        push    ax
        call    fn_2327_s950
        pop     bx
        dec     ax
        cmp     ax, bx
        jb      br_0b86_s950
        xchg    bx, ax
br_0b86_s950:
        call    fn_2dfc_s950
        jmp     br_274e
        endif

fn_27c5:
        cmp     word ptr [bp+5], 4b02h
        jne     br_27de
        cmp     byte ptr [B_957D], 0
        je      br_27de
        mov     ax, word ptr [W_959A]
        cmp     ax, word ptr [bp+9]
        je      br_27de
        jmp     loop_2625
br_27de:
        ret

isr_trap:
        push    es
        push    ds
        push    ax
        xor     ax, ax
        mov     es, ax
        mov     ds, ax
        pop     word ptr [W_1DE4]
        mov     word ptr [W_1DE6], bp
        endm
        if      FW_VERSION < 400
        RUN_BR_27A0
        endif
        if      FW_VERSION < 210
        mov     word ptr [W_0104_V12A], bx
        mov     word ptr [W_0106_V12A], cx
        mov     word ptr [W_0108_V12A], di
        endif
        if      FW_VERSION = 210
        mov     word ptr [W_1DE8], bx
        mov     word ptr [W_1DEA], cx
        mov     word ptr [W_1DEC], di
        endif
        if      FW_VERSION < 400
        pop     word ptr [W_1DEE]
        mov     word ptr [W_1DF0], dx
        pop     word ptr [W_1DF2]
        endif
        if      MODEL = 950
        mov     word ptr [W_010F_S950+1], si
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     word ptr [W_1DF4], si
        endif
        if      FW_VERSION < 400
        mov     word ptr [W_1DF6], sp
        mov     word ptr [W_2968], ax
        mov     word ptr [W_9588], ax
        mov     byte ptr [B_7C57], al
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     byte ptr [B_296A], al
        endif
        if      FW_VERSION < 400
        mov     byte ptr [LCD_CURSOR_MODE], 0dh
        mov     word ptr [LCD_SCROLL_MAX], 0e0h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
loop_282a:
        mov     cx, 3e8h
        endif

RUN_LOOP_282A macro   {GLOBALSYMBOLS}
        call    lcd_redraw
        if      MODEL = 950
        mov     dx, 1c4h
        mov     al, byte ptr [B_0043_S950+5]
        out     dx, al
        mov     dx, 1c6h
        mov     al, byte ptr [B_0043_S950+6]
        out     dx, al
        endif
loop_282a:
        mov     cx, 3e80h
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_LOOP_282A
        endif
        if      FW_VERSION < 400
loop_282d:
        loop    loop_282d
        call    knob_read
        call    lcd_scroll_screen
        call    fn_247b
        je      loop_282a
        cmp     al, 0ah
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        jne     br_2869
        call    ram_test
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        jne     br_2843
        call    ram_test
        endif

RUN_BR_2843 macro   {GLOBALSYMBOLS}
        jmp     loop_282a
br_2843:
        cmp     al, 0fh
        jne     br_2869
        xor     byte ptr [B_296A], 0ffh
        mov     word ptr [W_9588], 0
        mov     byte ptr [B_7C57], 0
        je      br_2864
        mov     word ptr [W_9588], 2
        mov     byte ptr [B_7C57], 40h
br_2864:
        call    lcd_redraw
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_BR_2843
        endif

RUN_BR_2869 macro   {GLOBALSYMBOLS}
        jmp     loop_282a
br_2869:
        cmp     al, 10h
        jne     br_2878
        mov     ax, word ptr [CUR_SAMPLE]
        mov     word ptr [W_9626], ax
        call    midi_send_sample
        jmp     loop_282a
br_2878:
        cmp     al, 0dh
        jne     br_287d
        iret
br_287d:
        cmp     al, 20h
        jne     br_28a1
        endm
        if      FW_VERSION < 400
        RUN_BR_2869
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
loop_0b63_v12a:
        call    fn_247b
        je      loop_0b63_v12a
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
loop_2881:
        mov     cx, 3e80h
loop_2884:
        loop    loop_2884
        call    fn_247b
        je      loop_2881
        endif

RUN_BR_2894 macro   {GLOBALSYMBOLS}
        mov     byte ptr [B_87F6], al
        cmp     al, 40h
        jb      br_2894
        add     al, 9
br_2894:
        and     ax, 0fh
        mov     cl, 0ch
        shl     ax, cl
        mov     word ptr [W_2968], ax
        jmp     br_2900
        db      90h
br_28a1:
        mov     bx, word ptr [W_9588]
        cmp     al, 90h
        jb      br_28b0
        cmp     al, 95h
        jb      br_28ae
        dec     ax
br_28ae:
        sub     al, 4fh
br_28b0:
        endm
        if      FW_VERSION < 400
        RUN_BR_2894
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     byte ptr [bx+TBL_86EE], al
        inc     word ptr [W_9588]
        cmp     bl, 3
        jne     br_2900
        endif

RUN_AFTER_BR_28B0  macro   {GLOBALSYMBOLS}
        mov     si, P_86EE
        lodsw
        xchg    al, ah
        call    fn_298b
        mov     dh, al
        lodsw
        xchg    al, ah
        call    fn_298b
        mov     dl, al
        mov     si, dx
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_AFTER_BR_28B0
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

        cmp     byte ptr [B_296A], 0ffh
        je      br_2914
        mov     byte ptr [bx+TBL_86EE], al
        inc     word ptr [W_9588]
        cmp     bl, 3
        jne     br_2900
        call    fn_2950
        endif

RUN_LOOP_28CD macro   {GLOBALSYMBOLS}
        mov     di, P_86F2
        mov     cx, 54h
loop_28cd:
        mov     al, 20h
        stosb
        inc     dx
        mov     al, dl
        call    fn_296b
        xchg    al, ah
        stosb
        mov     al, ah
        stosb
        loop    loop_28cd
        mov     di, P_87F7
        mov     cx, 54h
loop_28e4:
        mov     al, 20h
        stosb
        push    ds
        mov     ax, word ptr [W_2968]
        mov     ds, ax
        lodsb
        pop     ds
        call    fn_296b
        xchg    al, ah
        stosb
        mov     al, ah
        stosb
        loop    loop_28e4
        mov     word ptr [W_9588], 0
br_2900:
        xor     ax, ax
        mov     word ptr [LCD_ROW1], P_86EE
        mov     word ptr [LCD_ROW2], B_87F6
        call    lcd_show_screen
        jmp     loop_282a
        endm
        if      FW_VERSION < 400
        RUN_LOOP_28CD
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
W_2968:
        db      00h, 00h
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
br_2914:
        mov     byte ptr [bx+TBL_87F6], al
        endif

RUN_BR_293A macro   {GLOBALSYMBOLS}
        call    fn_2950
        xchg    bx, ax
        sub     ax, 2
        cwd
        mov     cx, 3
        div     cx
        add     si, ax
        xchg    bx, ax
        mov     ah, 30h
        call    fn_298b
        push    ds
        lds     bp, [FP_2966]
        dec     dx
        jne     br_293a
        and     byte ptr [si], 0f0h
        jmp     br_2941
br_293a:
        and     byte ptr [si], 0fh
        mov     cl, 10h
        mul     cl
br_2941:
        or      byte ptr [si], al
        inc     dx
        inc     dx
        pop     ds
        add     word ptr [W_9588], dx
        call    lcd_redraw
        jmp     loop_282a

fn_2950:
        push    ax
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_BR_293A
        RUN_AFTER_BR_28B0
FP_2966:
        pop     ax
        ret
W_2968:
        db      00h, 00h
B_296A:
        db      00h
        endif

RUN_FN_296B macro   {GLOBALSYMBOLS}

fn_296b:
        mov     ah, al
        and     al, 0fh
        add     al, 30h
        cmp     al, 3ah
        jb      br_2977
        add     al, 7
br_2977:
        shr     ah, 1
        shr     ah, 1
        shr     ah, 1
        shr     ah, 1
        add     ah, 30h
        cmp     ah, 3ah
        jb      br_298a
        add     ah, 7
br_298a:
        ret

fn_298b:
        cmp     al, 40h
        jb      br_2991
        add     al, 9
br_2991:
        and     al, 0fh
        cmp     ah, 40h
        jb      br_299b
        add     ah, 9
br_299b:
        shl     ah, 1
        shl     ah, 1
        shl     ah, 1
        shl     ah, 1
        or      al, ah
        ret

fn_29a6:
        push    ax
        mov     byte ptr [B_9575], 0
        mov     ax, word ptr [CUR_PROGRAM]
        cmp     ax, P_A03E
        jne     br_29ba
        mov     ax, word ptr [W_7CD8]
        mov     word ptr [CUR_PROGRAM], ax
br_29ba:
        pop     ax
        ret

knob_read:
        in      al, 68h
        out     68h, al
        and     ax, 0fh
        sub     ax, 8
        ret

knob_sign:
        call    knob_read
        je      br_29d0
        mov     al, ah
        or      al, 1
br_29d0:
        ret

panel_lamps_update:
        mov     al, byte ptr [TIMER_TICKS]
        ror     al, 1
        ror     al, 1
        cbw
        mov     al, byte ptr [B_9572]
        and     al, ah
        mov     ah, al
        mov     al, 80h
        and     al, byte ptr [B_957D]
        or      al, byte ptr [B_9571]
        xor     al, 0ffh
        or      al, ah
        mov     byte ptr [B_957D], 0
        out     64h, al
        mov     byte ptr [PANEL_LAMPS], al
        ret

fn_29f9:
        mov     bx, SLOT_TAGS
        endm
        if      FW_VERSION < 400
        RUN_FN_296B
        mov     cx, SLOT_COUNT
        endif

RUN_LOOP_2A02 macro   {GLOBALSYMBOLS}
        mov     ax, SLOTS
loop_2a02:
        cmp     ax, dx
        je      br_2a0c
        add     ax, 46h
        inc     bx
        loop    loop_2a02
br_2a0c:
        mov     byte ptr [bx], ch
        ret
        if      MODEL = 950
loop_0de4_s950:
        test    byte ptr [B_0043_S950], 3
        je      loop_2a0f
        call    fn_22f6_s950
        endif
loop_2a0f:
        if      (MODEL = 900) && (FW_VERSION < 210)
        call    disk_catalog_screen_trampoline
        endif
        call    fn_66aa
        mov     al, 0
        jmp     br_2a24
        if      FW_VERSION >= 400
loop_2a16:
        jmp     br_2abe
        endif
loop_2a19:
        call    key_get
        cmp     al, 90h
        if      FW_VERSION >= 400
        jb      loop_2a16
        cmp     al, 98h
        jae     loop_2a16
        else
        jb      br_2abe
        cmp     al, 98h
        jae     br_2abe
        endif
br_2a24:
        and     ax, 7
        mov     bp, ax
        add     bp, ax
        mov     bx, MODE_LAMPS
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        xlat
        mov     byte ptr [B_9572], al
        mov     byte ptr [B_9571], al
        if      FW_VERSION >= 400
        push    si
        push    di
        push    ax
        push    cx
        push    es
        push    ds
        mov     cx, bp
        shr     cx, 1
        inc     cx
        mov     al, byte ptr [B_1CE4]
        shr     al, cl
        jb      br_2ab1
        mov     al, byte ptr [B_1CE4]
        xor     al, 0ffh
        mov     byte ptr [B_1CE4], al
        mov     ax, 1ce3h
        sub     ax, DISK_LAST_FIELD
        push    ax
        mov     al, byte ptr [B_1CE4+1]
        shr     al, 1
        jae     br_2a7e
        mov     byte ptr [B_1CE4+1], 0
        xor     di, di
        mov     ds, di
        inc     di
        mov     ax, 8000h
        mov     es, ax
        mov     si, DISK_LAST_FIELD
        mov     cx, 1893h
        sub     cx, si
        inc     cx
        call    fn_1d1c
        mov     si, 3700h
        jmp     br_2a9e
        db      90h
br_2a7e:
        mov     byte ptr [B_1CE4+1], 1
        xor     di, di
        mov     ds, di
        mov     di, 3700h
        inc     di
        mov     ax, 8000h
        mov     es, ax
        mov     si, DISK_LAST_FIELD
        mov     cx, 1ce3h
        sub     cx, si
        inc     cx
        call    fn_1d1c
        xor     si, si
br_2a9e:
        xor     cx, cx
        mov     es, cx
        mov     cx, 8000h
        mov     ds, cx
        inc     si
        mov     di, DISK_LAST_FIELD
        pop     cx
loop_2aac:
        lodsb
        stosb
        inc     si
        loop    loop_2aac
br_2ab1:
        pop     ds
        pop     es
        pop     cx
        pop     ax
        pop     di
        pop     si
        endif
        call    word ptr [bp+MODE_KEYS]
        if      MODEL = 950
        in      al, 8fh
        or      al, 1
        and     al, 0dh
        out     8fh, al
        endif
        jmp     loop_2a19
br_2abe:
        mov     byte ptr [B_9571], 0ffh
        mov     byte ptr [B_9572], 0ffh
        call    panel_lamps_update
        call    timer_poll
        endm
        if      FW_VERSION < 400
        RUN_LOOP_2A02
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    motor_off_timer
        endif

RUN_MODE_KEYS macro   {GLOBALSYMBOLS}
        call    panel_scan
        jmp     loop_2a19
MODE_KEYS:
        dw      mode_play               ; key 90h
        dw      mode_record             ; key 91h
        dw      mode_edit_sample        ; key 92h
        dw      mode_edit_program       ; key 93h
        dw      mode_disk               ; key 94h
        dw      mode_midi               ; key 95h
        dw      mode_utility            ; key 96h
        dw      mode_master_tuning      ; key 97h
MODE_LAMPS:
        db      08h, 04h, 02h, 01h, 40h, 10h, 20h, 08h

fn_2aef:
        mov     bp, SLOT_TAGS
        mov     bx, SLOTS
        endm
        if      FW_VERSION < 400
        RUN_MODE_KEYS
        mov     cx, SLOT_COUNT
        endif

RUN_LOOP_2AFC macro   {GLOBALSYMBOLS}
        mov     dl, 0
        mov     dh, 53h
loop_2afc:
        cmp     byte ptr [bp], dh
        jne     br_2b18
        inc     dl
        cmp     dl, 1
        je      br_2b16
        mov     ax, word ptr [si+36h]
        cmp     ax, word ptr [bx+36h]
        mov     ax, word ptr [si+38h]
        sbb     ax, word ptr [bx+38h]
        jae     br_2b18
br_2b16:
        mov     si, bx
br_2b18:
        inc     bp
        add     bx, 46h
        loop    loop_2afc
        cmp     dl, 0
        endm
        if      FW_VERSION < 400
        RUN_LOOP_2AFC
        endif
        if      MODEL = 950
        mov     bx, 0
        mov     cx, word ptr [W_B4A2_S950]
        mov     ax, 8000h
        mov     dx, 1
        je      br_0e9f_s950
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        je      br_2b3f
        endif
        if      FW_VERSION < 400
        mov     ax, word ptr [si+36h]
        mov     dx, word ptr [si+38h]
        add     ax, word ptr [si+10h]
        adc     dx, word ptr [si+12h]
        endif
        if      MODEL = 950
        add     ax, word ptr [si+10h]
        adc     dx, word ptr [si+12h]
br_0e9f_s950:
        sub     bx, ax
        sbb     cx, dx
        shr     cx, 1
        rcr     bx, 1
        add     ax, 0fh
        adc     dx, 0
        and     ax, 0fff0h
        and.w   bx, 0fff8h
        endif

RUN_BR_2B3F macro   {GLOBALSYMBOLS}
        push    ax
        push    dx
        mov     bx, 0
        sub     bx, ax
        mov     cx, 8
        pop     dx
        pop     ax
        sbb     cx, dx
        jmp     br_2b4b
br_2b3f:
        mov     bx, 4000h
        mov     cx, 7
        mov     ax, 0c000h
        mov     dx, 0
br_2b4b:
        test    al, 0fh
        je      br_2b5b
        or      al, 0fh
        add     ax, 1
        adc     dx, 0
        and.w   bx, 0fff0h
br_2b5b:
        endm
        if      (MODEL = 900) && (FW_VERSION < 400)
        RUN_BR_2B3F
        endif

RUN_FN_2B60 macro   {GLOBALSYMBOLS}
        mov     bp, bx
        or      bp, cx
        ret

fn_2b60:
        call    find_sample
        jae     br_2b67
        jmp     fn_2aef
br_2b67:
        add     ax, 36h
        mov     si, ax
        mov     dl, 1
        mov     bp, SLOT_TAGS
        endm
        if      FW_VERSION < 400
        RUN_FN_2B60
        mov     cx, SLOT_COUNT
        endif

RUN_LOOP_2B77 macro   {GLOBALSYMBOLS}
        mov     bx, P_A100
loop_2b77:
        mov     al, 53h
        cmp     al, byte ptr [bp]
        jne     br_2b9c
        mov     ax, word ptr [si]
        cmp     ax, word ptr [bx]
        mov     ax, word ptr [si+2]
        sbb     ax, word ptr [bx+2]
        jae     br_2b9c
        dec     dl
        je      br_2b9a
        mov     ax, word ptr [di]
        cmp     ax, word ptr [bx]
        mov     ax, word ptr [di+2]
        sbb     ax, word ptr [bx+2]
        jb      br_2b9c
br_2b9a:
        mov     di, bx
br_2b9c:
        add     bx, 46h
        inc     bp
        loop    loop_2b77
        mov     bx, word ptr [di]
        mov     cx, word ptr [di+2]
        dec     dl
        jne     br_2bb1
        mov     bx, 0
        endm
        if      FW_VERSION < 400
        RUN_LOOP_2B77
        endif
        if      MODEL = 950
        mov     cx, word ptr [W_B4A2_S950]
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     cx, 8
        endif

RUN_BR_2BB1 macro   {GLOBALSYMBOLS}
br_2bb1:
        sub     bx, word ptr [si]
        sbb     cx, word ptr [si+2]
        if      MODEL = 950
        shr     cx, 1
        rcr     bx, 1
        endif
        or      al, 1
        ret

fn_2bb9:
        pusha
        call    uarts_reset
        mov     bx, MIDI_SETTINGS
        endm
        if      FW_VERSION < 400
        RUN_BR_2BB1
        endif
        if      MODEL = 950
        mov     cl, 0d5h
        mov     al, byte ptr [bx+26h]
        cbw
        add     ax, 10h
        cmp     byte ptr [bx+1dh], 2
        jne     br_0f32_s950
        call    fn_2bf3
        mov     cl, 95h
br_0f32_s950:
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        cmp     byte ptr [bx+1dh], 2
        jne     br_2bde
        call    fn_2bf3
        endif
        if      FW_VERSION < 400
        out     24h, al
        mov     al, ah
        out     24h, al
        endif
        if      MODEL = 950
        mov     ax, word ptr [MIDI_RX_HEAD]
        mov     word ptr [MIDI_RX_TAIL], ax
        xchg    cx, ax
        endif

RUN_BR_2BDE macro   {GLOBALSYMBOLS}
        mov     al, 58h
        call    fn_2be9
        mov     al, 4eh
        out     5ah, al
        mov     al, 35h
        out     5ah, al
        popa
        ret
br_2bde:
        mov     al, 56h
        call    fn_2be9
        mov     al, 95h
        endm
        if      (MODEL = 900) && (FW_VERSION < 400)
        RUN_BR_2BDE
        endif
        if      FW_VERSION < 400
        out     50h, al
        popa
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        ret

fn_2be9:
        mov     byte ptr [B_2C1F+1], al
        mov     ax, word ptr [MIDI_RX_HEAD]
        mov     word ptr [MIDI_RX_TAIL], ax
        endif

RUN_FN_2BF3 macro   {GLOBALSYMBOLS}
        ret

fn_2bf3:
        lea     bx, [P_7C88]
        cmp     word ptr [bx], 1eh
        jae     br_2c00
        mov     word ptr [bx], 3c0h
br_2c00:
        mov     dx, 1
        mov     ax, 86a0h
        div     word ptr [bx]
        inc     ax
        shr     ax, 1
        ret

uarts_reset:
        mov     al, 17h
        out     50h, al
        endm
        if      FW_VERSION < 400
        RUN_FN_2BF3
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        xor     ax, ax
        out     5ah, al
        out     5ah, al
        out     5ah, al
        mov     al, 40h
        out     5ah, al
        endif

RUN_ISR_MIDI_RX macro   {GLOBALSYMBOLS}
        ret

isr_midi_rx:
        push    ax
        push    bx
B_2C1F:
        in      al, 56h
        mov     bx, word ptr cs:[MIDI_RX_HEAD]
        mov     byte ptr cs:[bx], al
        inc     bx
        cmp     bx, MIDI_RX_END
        je      br_2c38
        mov     word ptr cs:[MIDI_RX_HEAD], bx
        pop     bx
        pop     ax
        iret
br_2c38:
        mov     word ptr cs:[MIDI_RX_HEAD], MIDI_RX_BUF
        pop     bx
        pop     ax
        iret

fn_2c42:
        mov     byte ptr [B_956B], 0
        out     68h, al
        mov     ah, 0dh
        call    lcd_set_cursor_mode
loop_2c4e:
        mov     byte ptr [B_956C], 0
        mov     byte ptr [B_7C57], 0
        mov     word ptr [W_9588], 1
        call    menu_item_render_and_transmit
loop_2c61:
        call    word ptr [IDLE_HOOK]
        call    knob_sign
        je      br_2c71
        add     al, byte ptr [B_2D1E]
        jmp     br_2cb5
        db      90h
br_2c71:
        call    key_get
        je      loop_2c61
        cmp     al, 9
        jne     br_2c86
        cmp     byte ptr [bp+2], 0
        je      loop_2c61
        mov     byte ptr [B_956B], 0ffh
        ret
br_2c86:
        cmp     al, 30h
        jb      br_2cdd
        cmp     al, 3ah
        jae     br_2cdd
        push    ax
        xchg    ah, al
        call    lcd_put_char
        pop     ax
        inc     byte ptr [B_956C]
        inc     word ptr [W_9588]
        cmp     byte ptr [B_956C], 2
        je      br_2caf
        sub     al, 30h
        mov     cl, 0ah
        mul     cl
        mov     byte ptr [B_9570], al
        jmp     loop_2c61
br_2caf:
        sub     al, 30h
        add     al, byte ptr [B_9570]
br_2cb5:
        and     al, al
        jne     br_2cba
        inc     ax
br_2cba:
        cmp     al, byte ptr [FIELD_PAGES]
        jb      br_2cc3
        mov     al, byte ptr [FIELD_PAGES]
br_2cc3:
        mov     byte ptr [B_2D1E], al
        cbw
        xchg    cx, ax
        mov     si, word ptr [FIELD_LIST]
loop_2ccc:
        mov     word ptr [FIELD_LIST_POS], si
        lodsw
        shl     ax, 1
        jae     loop_2ccc
        loop    loop_2ccc
        shr     ax, 1
        xchg    bp, ax
        jmp     fn_2c42
br_2cdd:
        cmp     al, 8
        jne     fn_2ce4
        jmp     loop_2c4e

fn_2ce4:
        cmp     al, 10h
        jne     br_2cf0
        mov     al, 1
loop_2cea:
        add     al, byte ptr [B_2D1E]
        jmp     br_2cb5
br_2cf0:
        cmp     al, 11h
        jne     br_2cf8
        mov     al, 0ffh
        jmp     loop_2cea
br_2cf8:
        cmp     al, 0dh
        jne     br_2d0f
        cmp     byte ptr [bp+2], 0
        jne     br_2d0f
        mov     byte ptr [ENTER_KEY], 0ffh
        push    bp
        call    word ptr [bp+7]
        pop     bp
        jmp     loop_2c61
br_2d0f:
        cmp     al, 20h
        je      br_2d16
        jmp     loop_2c61
br_2d16:
        mov     byte ptr [B_956B], 0ffh
        jmp     fn_235a
B_2D1E:
        endm
        if      FW_VERSION < 400
        RUN_ISR_MIDI_RX
        endif
        if      FW_VERSION < 210
        db      01h
FIELD_PAGES:
        db      01h
        endif
        if      FW_VERSION = 210
        db      04h
FIELD_PAGES:
        db      08h
        endif

RUN_LCD_PRINT macro   {GLOBALSYMBOLS}

lcd_print:
        mov     ah, dl
        call    lcd_goto
loop_2d25:
        lodsb
        cmp     al, 0feh
        je      br_2d46
        test    al, 80h
        je      br_2d3f
        cmp     al, 0ffh
        je      br_2d3f
        sub     al, 80h
        mov     ch, 0
        mov     cl, al
loop_2d38:
        call    lcd_put_char
        loop    loop_2d38
        jmp     loop_2d25
br_2d3f:
        mov     ah, al
        call    lcd_put_char
        jmp     loop_2d25
br_2d46:
        mov     ah, dh
        jmp     lcd_goto

lcd_put_char:
        in      al, 4ch
        and     al, 80h
        jne     lcd_put_char
        mov     al, ah
        out     4ah, al
        ret

lcd_set_cursor_mode:
        mov     byte ptr [LCD_CURSOR_MODE], ah

lcd_command:
        in      al, 4ch
        and     al, 80h
        jne     lcd_command
        mov     al, ah
        out     48h, al
        ret

fn_2d65:
        mov     cx, 40h
        mov     ah, 40h
        call    lcd_command
loop_2d6d:
        lodsb
        mov     ah, al
        call    lcd_put_char
        loop    loop_2d6d
        ret
        endm
        if      FW_VERSION < 400
        RUN_LCD_PRINT
        endif
        if      MODEL = 950

ram_test:
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)

ram_test:
        cli
        call    voice_reset_all
        call    uarts_reset
        endif
        if      FW_VERSION < 400
        mov     si, MSG_RAM_TEST
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    lcd_print_home
        endif
        if      MODEL = 950
        mov     ax, 1
loop_10c3_s950:
        call    fn_1100_s950
        inc     ax
        cmp     ax, 30h
        jne     loop_10c3_s950
        mov     ax, 1
loop_10cf_s950:
        call    fn_1115_s950
        jne     br_10e2_s950
        inc     ax
        cmp     ax, 30h
        jne     loop_10cf_s950
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     ax, 0aaaah
        call    fn_2dc0
        jne     br_2d9b
        mov     ax, 5555h
        call    fn_2dc0
        jne     br_2d9b
        endif
        if      FW_VERSION < 400
        mov     si, MSG_RAM_OK
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif

lcd_print_home:
        mov     dx, 1
        jmp     lcd_print
        endif
        if      MODEL = 950
br_10e2_s950:
        mov     cx, 0fh
loop_10e5_s950:
        shl     bp, 1
        jb      br_10eb_s950
        loop    loop_10e5_s950
br_10eb_s950:
        shr     cx, 1
        and     ax, 0f8h
        add     ax, cx
        mov     bx, ax
        mov     ax, word ptr [bx+TBL_1157_S950]
        mov     si, MSG_BAD_IC
        mov     word ptr [si+6], ax
        jmp     lcd_print_home

fn_1100_s950:
        push    ax
        call    fn_1130_s950
        rep movsw
loop_1106_s950:
        mov     ax, 0
        mov     ds, ax
        mov     es, ax
        mov     dx, 1c2h
        mov     al, 1
        out     dx, al
        pop     ax
        ret

fn_1115_s950:
        push    ax
        mov     bx, 0ffffh
        cmp     ax, 8
        jb      br_1120_s950
        mov     bl, 0f0h
br_1120_s950:
        call    fn_1130_s950
loop_1123_s950:
        lodsw
        xor     ax, word ptr es:[di]
        inc     di
        inc     di
        and     ax, bx
        loope   loop_1123_s950
        xchg    bp, ax
        jmp     loop_1106_s950

fn_1130_s950:
        mov     dx, 1c2h
        mov     al, al
        out     dx, al
        mov     dx, 1c4h
        mov     al, al
        out     dx, al
        add     ax, ax
        mov     di, ax
        mov     dx, 1c6h
        mov     al, 0fh
        out     dx, al
        mov     si, 0
        mov     cx, 8000h
        mov     ax, 1000h
        mov     es, ax
        mov     ax, 3000h
        mov     ds, ax
        ret
TBL_1157_S950:
        db      "45464748..495051,,L1L2L3;;L4L5L6<<H1H2H3>>H4H5H6"
MSG_BAD_IC:
        db      "Bad IC## "
        db      0c6h, 0feh
MSG_RAM_TEST:
        db      "RAM test "
        db      0c6h, 0feh
        endif

RUN_BR_2D9B macro   {GLOBALSYMBOLS}
br_2d9b:
        mov     cx, 0ffffh
loop_2d9e:
        inc     cx
        shr     ax, 1
        jae     loop_2d9e
        xchg    cx, ax
        mov     cl, 0ah
        div     cl
        add     ax, 3030h
        mov     si, MSG_BAD_RAM_BIT_DK00
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     word ptr [si+0eh], ax
        mov     byte ptr [si+0dh], 4ah
        test    dh, 80h
        je      br_2dbe
        mov     byte ptr [si+0dh], 4bh
br_2dbe:
        jmp     lcd_print_home

fn_2dc0:
        push    es
        mov     dx, 0f000h
        mov     di, 0
loop_2dc7:
        mov     es, dx
        mov     cx, 8000h
        rep stosw
        sub     dx, 1000h
        jne     loop_2dc7
        pop     es
        mov     bx, ax
        push    ds
        mov     dx, 0f000h
        mov     si, cx
loop_2ddd:
        mov     ds, dx
        mov     bp, 0ffffh
        mov     di, bx
        test    dh, 80h
        je      br_2df1
        mov     bp, 0fff0h
        and     di, bp
        mov     cx, 8000h
br_2df1:
        lodsw
        and     ax, bp
        xor     ax, di
        loope   br_2df1
        jne     br_2e00
        sub     dx, 1000h
        jne     loop_2ddd
br_2e00:
        pop     ds
        ret
        endm
        if      (MODEL = 900) && (FW_VERSION < 400)
        RUN_BR_2D9B
        endif
        if      FW_VERSION < 400
MSG_RAM_OK:
        db      "RAM OK  "
        endif
        if      MODEL = 950
        db      0c7h, 0feh

L_11a7_s950:
        pusha
        endif

RUN_MSG_BAD_RAM_BIT_DK00 macro   {GLOBALSYMBOLS}
        db      0feh
MSG_BAD_RAM_BIT_DK00:
        db      "Bad RAM bit DK00 "
        db      0feh
MSG_RAM_TEST:
        db      "RAM test "
        db      0feh

L_2e27:
        pusha
loop_2e28:
        test    byte ptr [MOTOR_TIMEOUT], 0ffh
        jne     br_2e68
        endm
        if      (MODEL = 900) && (FW_VERSION < 400)
        RUN_MSG_BAD_RAM_BIT_DK00
        endif

RUN_LOOP_2E2F macro   {GLOBALSYMBOLS}
loop_2e2f:
        call    timer_poll
        mov     al, byte ptr [TIMER_TICKS]
        xchg    byte ptr [B_9566], al
        cmp     byte ptr [B_9566], al
        jne     br_2e41
loop_2e3f:
        popa
        ret
br_2e41:
        endm
        if      FW_VERSION < 400
        RUN_LOOP_2E2F
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     byte ptr [B_7C55], 0ffh
        endif

RUN_BR_2E5D macro   {GLOBALSYMBOLS}
        call    panel_lamps_update
        call    panel_scan
        mov     al, byte ptr [KEY_CODE]
        cmp     al, 0fh
        jne     br_2e5d
        mov     byte ptr [KEY_CODE], 0
        mov     byte ptr [B_9610], 2
br_2e5d:
        and     al, 0f8h
        if      MODEL = 950
        test    byte ptr [FLOPPY_CTRL], 80h
        jne     loop_2e3f
        endif
        cmp     al, 90h
        jne     loop_2e3f
        mov     sp, word ptr [MODE_SP]
        ret
        endm
        if      FW_VERSION < 400
        RUN_BR_2E5D
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
br_2e68:
        call    motor_off_timer
        jmp     loop_2e2f
        endif

RUN_LCD_SCROLL_SCREEN macro   {GLOBALSYMBOLS}

lcd_scroll_screen:
        cbw
        neg     ax
        add     ax, word ptr [LCD_SCROLL]
        jns     br_2e7f
        xor     ax, ax
        jmp     br_2e88

lcd_redraw:
        mov     ax, word ptr [LCD_SCROLL]
        jmp     lcd_show_screen
br_2e7f:
        cmp     ax, word ptr [LCD_SCROLL_MAX]
        jb      br_2e88
        mov     ax, word ptr [LCD_SCROLL_MAX]
br_2e88:
        cmp     ax, word ptr [LCD_SCROLL]
        je      br_2ef7

lcd_show_screen:
        mov     word ptr [LCD_SCROLL], ax
        mov     si, word ptr [LCD_ROW1]
        xchg    bx, ax
        mov     ah, 80h
        call    lcd_command
        mov     cx, 28h
loop_2e9e:
        in      al, 4ch
        and     al, 80h
        jne     loop_2e9e
        mov     al, byte ptr [bx+si]
        out     4ah, al
        inc     bx
        loop    loop_2e9e
        mov     cx, 28h
        mov     bx, word ptr [LCD_SCROLL]
        mov     si, word ptr [LCD_ROW2]
loop_2eb6:
        in      al, 4ch
        and     al, 80h
        jne     loop_2eb6
        mov     al, byte ptr [bx+si]
        out     4ah, al
        inc     bx
        loop    loop_2eb6
loop_2ec3:
        cmp     byte ptr [LCD_CURSOR_MODE], 0ch
        je      br_2ef2
        mov     ax, word ptr [W_9588]
        mov     bx, word ptr [LCD_SCROLL]
        cmp     ax, bx
        jb      br_2ef2
        add     bx, 28h
        cmp     ax, bx
        jae     br_2ef2
        sub     ax, word ptr [LCD_SCROLL]
        add     al, 80h
        add     al, byte ptr [B_7C57]
        mov     ah, al
        call    lcd_command
        mov     ah, byte ptr [LCD_CURSOR_MODE]
        jmp     lcd_command
br_2ef2:
        mov     ah, 0ch
        jmp     lcd_command
br_2ef7:
        ret

fn_2ef8:
        lodsb
        cmp     al, 0feh
        je      br_2f00
        stosb
        jmp     fn_2ef8
br_2f00:
        ret

timer_poll:
        mov     al, 86h
        out     3eh, al
        in      al, 3ch
        mov     ah, al
        xchg    byte ptr [B_9564], al
        cmp     al, ah
        jb      br_2f14
        or      al, 1
        ret
br_2f14:
        inc     word ptr [TIMER_TICKS]
        dec     word ptr [W_95B0]
        ret

fn_2f1d:
        push    ax
        call    timer_poll
        pop     ax
        ret
        endm
        if      FW_VERSION < 400
        RUN_LCD_SCROLL_SCREEN
        endif

RUN_MOTOR_OFF_TIMER macro   {GLOBALSYMBOLS}

motor_off_timer:
        test    byte ptr [MOTOR_TIMEOUT], 0ffh
        je      br_2f48
        mov     al, 86h
        out     3eh, al
        in      al, 3ch
        mov     ah, al
        xchg    byte ptr [B_9565], al
        cmp     al, ah
        jb      br_2f3b
        ret
br_2f3b:
        dec     byte ptr [MOTOR_TIMEOUT]
        jne     br_2f48
        mov     al, 8
        out     8, al
        mov     byte ptr [FLOPPY_CTRL], al
br_2f48:
        ret
        endm
        if      (MODEL = 900) && (FW_VERSION < 400)
        RUN_MOTOR_OFF_TIMER
        endif

RUN_FIELD_PARSE_CLAMP macro   {GLOBALSYMBOLS}

field_parse_clamp:
        call    field_parse

field_clamp:
        test    byte ptr [bp+5], 80h
        je      br_2f6c
        cmp     ax, word ptr [bp+0dh]
        je      br_2f66
        jb      br_2f5e
loop_2f59:
        mov     ax, word ptr [bp+0dh]
        jmp     br_2f66
br_2f5e:
        cmp     ax, word ptr [bp+0bh]
        jae     br_2f66
loop_2f63:
        mov     ax, word ptr [bp+0bh]
br_2f66:
        mov     word ptr [bp+9], ax
        jmp     loop_2051
br_2f6c:
        cmp     ax, word ptr [bp+0dh]
        jg      loop_2f59
        cmp     ax, word ptr [bp+0bh]
        jl      loop_2f63
        jmp     br_2f66
        endm
        if      FW_VERSION < 400
        RUN_FIELD_PARSE_CLAMP
        endif
        if      MODEL = 950
        db      42 dup (0)
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      00h
TBL_7948:
        db      0e8h, 0fdh
semitone_ratio_table:
        endif

RUN_AFTER_SEMITONE_RATIO_TABLE macro   {GLOBALSYMBOLS}
        db      19h, 0dah, 57h, 0bbh, 0ech, 0a0h, 3ah, 8ah, 0bch, 76h, 0fdh, 65h, 9bh, 57h, 40h, 4bh
        db      0a3h, 40h, 85h, 37h, 0b1h, 2fh, 0f7h
        db      "(0#:"
        db      1eh, 0f7h, 19h, 4dh, 16h, 28h, 13h, 75h, 10h, 22h, 0eh, 24h, 0ch, 6eh, 0ah, 0f5h
        db      08h, 0b2h, 07h, 9ch, 06h, 0adh, 05h, 0e0h, 04h, 30h, 04h, 99h, 03h, 17h, 03h, 0a8h
        db      02h, 48h, 02h, 0f5h, 01h, 0afh, 01h, 72h, 01h, 3eh, 01h, 11h, 01h, 0ebh, 00h, 0c9h
        db      00h, 0adh, 00h, 95h, 00h, 80h, 00h, 6eh, 00h, 5eh, 00h, 51h, 00h, 46h, 00h, 3ch
        db      00h, 33h, 00h, 2ch, 00h, 26h, 00h, 0ffh, 0f1h, 0e3h, 0d6h, 0cah, 0bfh, 0b4h, 0aah, 0a1h
        db      98h, 8fh, 87h, 80h
        db      "xrke`ZUPLHD@<9630-+(&$"
        db      22h, 20h, 1eh, 1ch, 1bh, 19h, 18h, 17h, 15h, 14h, 13h, 12h, 11h, 10h, 0fh, 0eh
        db      0dh, 0dh, 0ch, 0bh, 0bh, 0ah, 09h, 09h, 08h, 08h, 08h, 07h, 07h, 06h, 06h, 06h
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_AFTER_SEMITONE_RATIO_TABLE
        db      05h, 05h, 05h, 05h, 90h
sine_lfo_table:
        endif

RUN_P_7A78 macro   {GLOBALSYMBOLS}
        db      00h, 18h
        db      "0FYiu|"
        db      7fh
        db      "|uiYF0"
        db      18h, 00h, 0e8h, 0d0h, 0bah, 0a7h, 97h, 8bh, 84h, 81h, 84h, 8bh, 97h, 0a7h, 0bah, 0d0h
        db      0e8h
P_7A78:
        db      81h, 0bah, 0cah, 0d4h, 0dah, 0dfh, 0e3h, 0e7h, 0eah, 0ech, 0efh, 0f1h, 0f2h, 0f4h, 0f5h, 0f7h
        db      0f8h, 0f9h, 0fah, 0fbh, 0fch, 0fch, 0fdh, 0feh, 0feh, 0ffh, 0ffh, 0ffh, 00h, 00h, 00h, 00h
        db      00h
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_P_7A78
P_58AE:
        db      00h, 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0ah, 0ch, 0dh, 0eh, 90h
        endif

RUN_P_58BC macro   {GLOBALSYMBOLS}
P_58BC:
        dw      L_6f44
        dw      L_6f59
        dw      L_6f6e
        dw      L_6ecd
        dw      L_6fad
        dw      L_6fdf
        dw      L_6fd6
        dw      L_6df4
        dw      L_6e29
        dw      L_6e68
        dw      L_8212_os21
        dw      L_6e0e
        dw      L_6e1e
        dw      L_6f1a

B_58D8:
        db      0ffh
P_58D9:
        db      0f0h, 47h, 00h, 0bh, 40h, 00h, 00h, 80h
P_58E1:
        db      0f0h, 47h, 00h, 0ch, 40h, 00h, 00h, 80h
P_58E9:
        db      0f0h, 47h, 00h, 07h, 40h, 00h, 00h, 80h
P_58F1:
        db      0f0h, 47h, 00h, 08h, 40h, 00h, 00h, 80h
P_58F9:
        db      0f0h, 47h, 00h, 09h, 40h, 00h, 00h, 80h
P_5901:
        db      0f0h, 47h, 00h, 0ah, 40h, 00h, 00h, 80h
        endm

RUN_B_5909 macro   {GLOBALSYMBOLS}
B_5909:
        db      80h
P_590A:
        db      0f0h, 7eh
P_590C:
        db      7fh, 0f7h, 80h
P_590F:
        db      0f0h, 7eh, 7dh, 0f7h, 80h, 0f0h, 7eh, 7eh, 0f7h, 80h
B_5919:
        db      20h
B_591A:
        db      0ffh
P_591B:
        db      0f0h, 7eh, 01h, 00h, 00h, 0ch
        db      13 dup (0)
        db      80h, 90h
W_5930:
        db      0d4h, 00h
P_5932:
        if      MODEL = 950
        db      "TONE      "
        db      6 dup (0)
        else
        db      "TONE            "
        endif
        db      08h, 07h, 00h, 00h
W_5946:
        db      0fdh, 2dh, 0c0h, 03h, 00h, 00h, 4ch, 00h, 08h, 07h, 00h, 00h, 00h, 00h, 00h, 00h
        db      2dh, 00h, 00h, 00h, 00h, 00h, 00h, 4eh
        db      16 dup (0)
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_P_58BC
        RUN_B_5909

midi_note_trigger:
        push    bx
        call    midi_channel_slot_resolve
        mov     word ptr [bp+21h], bx
        xor     ax, ax
        endif

RUN_AFTER_MIDI_NOTE_TRIGGER macro   {GLOBALSYMBOLS}
        xchg    byte ptr [bp+4], al
        sub     ax, 10h
        not     ah
        and     al, ah
        and     al, byte ptr [B_9612]
        mov     byte ptr [B_9612], 0
        mov     dh, byte ptr [bp+VC(31h)]
        mov     dl, 78h
        out     dx, al
        mov     al, byte ptr [W_9596]
        mov     cl, 10h
        mul     cl
        endm

RUN_BR_59B1 macro   {GLOBALSYMBOLS}
        mov     word ptr [bp+VC(17h)], ax
        mov     bx, word ptr [W_9580]
        cmp     bx, word ptr [CUR_KEYGROUP]
        jne     br_59b1
        or      byte ptr [B_9569], 20h
br_59b1:
        mov     word ptr [bp+VC(15h)], bx
        xor     di, di
        mov     al, byte ptr [bx+2]
        cmp     al, byte ptr [W_95B2]
        jae     br_59c2
        mov     di, 16h
br_59c2:
        mov     word ptr [bp+VC(11h)], di
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_AFTER_MIDI_NOTE_TRIGGER
        RUN_BR_59B1
        endif

RUN_BR_59CE macro   {GLOBALSYMBOLS}
        mov     si, word ptr [bx+di+28h]
        and     si, si
        jne     br_59ce
        pop     bx
        ret
br_59ce:
        cmp     si, word ptr [CUR_SAMPLE]
        jne     br_59d9
        or      byte ptr [B_956A], 20h
br_59d9:
        mov     byte ptr [bp], 10h
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_59CE
        mov     ax, word ptr [si+28h]
        mov     word ptr [bp+0dh], ax
        xor     ax, ax
        mov     word ptr [bp+1dh], ax
        mov     word ptr [bp+23h], ax
        mov     word ptr [bp+1fh], ax
        endif

RUN_BR_5A00 macro   {GLOBALSYMBOLS}
        mov     al, byte ptr [bx+0ch]
        cmp     al, ah
        jne     br_5a00
        mov     al, byte ptr [bx+0dh]
        xchg    ah, al
        jmp     br_5a11
br_5a00:
        mul     byte ptr [W_95B2]
        mov     cx, 32h
        div     cl
        mov     cl, al
        mov     al, byte ptr [bx+0dh]
        cbw
        imul    cx
br_5a11:
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5A00
        endif

RUN_BR_5A35 macro   {GLOBALSYMBOLS}
        mov     word ptr [bp+VC(19h)], ax
        if      MODEL = 900
        mov     ax, 0ffh
        test    byte ptr [bx+12h], 2
        je      br_5a3c
        mov     ah, byte ptr [W_95B2]
        if      FW_VERSION >= 210
        test    byte ptr [bx+12h], 20h
        je      br_5a35
        add     ah, 40h
        sub     ah, byte ptr [bx+26h]
        jns     br_5a35
        rol     ah, 1
        cwd
        cbw
        xor     ah, dl
br_5a35:
        endif
        shl     ah, 1
        not     ah
        and     ax, 0f00fh
br_5a3c:
        mov     word ptr [bp+9], ax
        endif
        endm

RUN_AFTER_BR_5A3C macro   {GLOBALSYMBOLS}
        call    fn_5c92
        push    ax
        mov     bx, word ptr [bp+VC(15h)]
        mov     al, byte ptr [bx+di+2ch]
        cbw
        mov     cx, 140h
        mul     cx
        xchg    dl, ah
        mov     ax, word ptr [bp+VC(17h)]
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5A35
        RUN_AFTER_BR_5A3C
        endif

RUN_BR_5A7F macro   {GLOBALSYMBOLS}
        sar     ax, 4
        if      (FW_VERSION >= 210) || (MODEL = 950)
        sub     al, 3fh
        else
        sub     al, 3ch
        endif
        imul    byte ptr [bx+8]
        mov     cl, 32h
        idiv    cl
        cbw
        add     dx, ax
        mov     al, byte ptr [W_95B2]
        sub     al, 40h
        imul    byte ptr [bx+7]
        shl     ax, 1
        xchg    al, ah
        cbw
        add     ax, dx
        add     ax, 46h
        if      (FW_VERSION >= 210) || (MODEL = 950)
        mov     word ptr [bp+VC(25h)], ax
        endif
        js      br_5a7f
        cmp     ax, 62h
        jae     br_5a82
br_5a7f:
        mov     ax, 62h
br_5a82:
        endm

RUN_BR_5A8A macro   {GLOBALSYMBOLS}
br_5a8a:
        mov     bx, semitone_ratio_table
        xlat
        pop     cx
        cmp     al, cl
        jae     br_5a95
        xchg    al, cl
br_5a95:
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5A7F
        cmp     ax, 0a8h
        jb      br_5a8a
        mov     ax, 0a8h
        RUN_BR_5A8A
        mov     dl, byte ptr [bp+2dh]
        mov     dh, 0
        mov     byte ptr [bp+13h], al
        endif

RUN_AFTER_BR_5A95 macro   {GLOBALSYMBOLS}
        out     dx, al
        xor     al, al
        out     dx, al
        int     6
        int     7
        call    interrupt_wait_primitive
        call    fn_5e7a
        xor     ax, ax
        mov     word ptr [bp+7], ax
        mov     byte ptr [bp+4], al
        mov     byte ptr [bp+3], al
        mov     al, byte ptr [W_95B2]
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_AFTER_BR_5A95
        mov     bx, word ptr [bp+15h]
        endif

RUN_AFTER_BR_5A95_2 macro   {GLOBALSYMBOLS}
        mul     byte ptr [bx+0bh]
        mov     cx, 418h
        mul     cx
        mov     al, byte ptr [bx+0bh]
        cbw
        shl     al, 1
        add     dx, 0e8h
        sub     dx, ax
        mov     al, byte ptr [bx+di+2dh]
        cbw
        add     ax, dx
        mov     si, word ptr [bx+di+28h]
        add     ax, word ptr [si+18h]
        xchg    cx, ax
        mov     al, byte ptr [W_9596]
        sub     al, 3ch
        pop     bx
        imul    byte ptr [bx+10h]
        mov     dx, 0dh
        imul    dx
        xchg    al, ah
        cbw
        add     cx, ax
        cmp     byte ptr [bx+15h], 0
        je      br_5b51
        mov     si, word ptr [bx+12h]
        endm

RUN_LOOP_5B0A macro   {GLOBALSYMBOLS}
        mov     bx, word ptr [bp+VC(15h)]
        mov     al, byte ptr [W_9596]
        mov     ah, byte ptr [bx]
        sub     ah, al
        sub     al, byte ptr [bx+1]
        xchg    dx, ax
loop_5b0a:
        cmp     si, word ptr [bp+VC(15h)]
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_AFTER_BR_5A95_2
        RUN_LOOP_5B0A
        endif

RUN_BR_5B29 macro   {GLOBALSYMBOLS}
        je      br_5b4a
        mov     al, byte ptr [W_9596]
        mov     ah, byte ptr [si]
        sub     ah, al
        jb      br_5b4a
        sub     al, byte ptr [si+1]
        jb      br_5b4a
        cmp     al, dl
        jae     br_5b29
        cmp     ah, dh
        jb      br_5b4a
        mov     ah, dh
        jmp     br_5b31
br_5b29:
        cmp     ah, dh
        jae     br_5b4a
        mov     al, ah
        mov     ah, dl
br_5b31:
        inc     al
        inc     ah
        add     al, ah
        xchg    bl, al
        xor     al, al
        shr     ax, 1
        shr     ax, 1
        shr     ax, 1
        div     bl
        mov     bx, P_7A78
        xlat
        cbw
        add     cx, ax
br_5b4a:
        mov     si, word ptr [si+44h]
        and     si, si
        jne     loop_5b0a
br_5b51:
        xchg    cx, ax
        and     ax, ax
        jns     br_5b58
        xor     ax, ax
br_5b58:
        cmp     ax, 20h
        jae     br_5b5f
        mov     al, 20h
br_5b5f:
        and     ah, ah
        je      br_5b66
        mov     ax, 0ffh
br_5b66:
        mov     byte ptr [bp+5], al
        mov     cl, 10h
        div     cl
        xchg    al, ah
        mov     bx, P_5BAA
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        dec     cl
        sub     cl, ah
        cbw
        xlat
        xchg    al, ah
        shr     ax, cl
        mov     cx, ax
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5B29
        mov     bx, word ptr [bp+15h]
        endif

RUN_BR_153C_V12A macro   {GLOBALSYMBOLS}
        mov     al, byte ptr [bx+9]
        mul     byte ptr [W_95B2]
        shl     ax, 1
        xchg    al, ah
        neg     al
        add     al, byte ptr [bx+3]
        if      (FW_VERSION >= 210) || (MODEL = 950)
        je      br_5ba7
        js      br_5ba7
        else
        jns     br_153c_v12a
        xor     al, al
br_153c_v12a:
        endif
        mul     al
        add     ax, 4
        cwd
        xchg    cx, ax
        div     cx
        and     ax, ax
        jne     br_5ba3
        inc     ax
br_5ba3:
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_153C_V12A
        mov     word ptr [bp+0fh], ax
        endif

RUN_BR_5BA7 macro   {GLOBALSYMBOLS}
        ret
        if      (FW_VERSION >= 210) || (MODEL = 950)
br_5ba7:
        jmp     br_5f73
        endif
P_5BAA:
        db      85h, 8bh, 91h, 98h, 9eh, 0a5h, 0adh, 0b4h, 0bch, 0c5h, 0cdh, 0d6h, 0e0h, 0eah, 0f4h, 0ffh
loop_5bba:
        mov     bp, VOICES
        mov     cx, 8
        call    midi_channel_slot_resolve
loop_5bc3:
        test    byte ptr [bp], 1ch
        je      br_5bd1
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5BA7
        cmp     word ptr [bp+21h], bx
        endif

RUN_BR_5BD1 macro   {GLOBALSYMBOLS}
        jne     br_5bd1
        call    fn_633a
br_5bd1:
        add     bp, VOICE_SIZE
        loop    loop_5bc3
        ret

voice_slot_lookup:
        mov     cx, 8
        mov     al, byte ptr [bp+13h]
        and     al, al
        js      br_5c0c
        cmp     al, cl
        mov     cl, 4
        je      br_5c0c
        mov     bx, P_B532
        jae     br_5c0f
        mov     cl, VOICE_SIZE
        mul     cl
        add     ax, VOICES
        mov     word ptr [W_9586], ax
        xchg    bp, ax
        mov     al, byte ptr [B_5909]
        mov     byte ptr [bp+1], al
        test    byte ptr [bp], 1fh
        jne     br_5c04
        ret
br_5c04:
        mov     byte ptr [B_9612], 0ffh
        jmp     fn_5e09
br_5c0c:
        mov     bx, VOICES
br_5c0f:
        mov     bp, bx
        xor     ax, ax
        mov     si, ax
        mov     di, ax
        dec     ax
        cwd
        mov     ah, cl
loop_5c1b:
        mov     al, byte ptr [bp]
        test    al, 1fh
        je      br_5c71
        if      FW_VERSION >= 210
        or      al, byte ptr [bp+0bh]
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        cmp     al, 2
        jne     br_5c35
        else
        or      al, byte ptr [bp+9]
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        test    al, 2
        je      br_5c35
        endif
        cmp     dh, byte ptr [bp+4]
        jb      br_5c43
        mov     dh, byte ptr [bp+4]
        mov     di, bp
        jmp     br_5c43
br_5c35:
        test    al, 0ch
        je      br_5c43
        cmp     dl, byte ptr [bp+4]
        jb      br_5c43
        mov     dl, byte ptr [bp+4]
        mov     si, bp
br_5c43:
        add     bp, VOICE_SIZE
        loop    loop_5c1b
        mov     bp, di
        and     bp, bp
        jne     br_5c69
        mov     bp, si
        and     bp, bp
        jne     br_5c69
        mov     cl, ah
        mov     al, 0ffh
        mov     dx, VOICE_SIZE
loop_5c5b:
        cmp     al, byte ptr [bx+5]
        jb      br_5c65
        mov     al, byte ptr [bx+5]
        mov     bp, bx
br_5c65:
        add     bx, dx
        loop    loop_5c5b
br_5c69:
        call    fn_5e09
        mov     byte ptr [B_9612], 0ffh
br_5c71:
        mov     word ptr [W_9586], bp
        mov     byte ptr [bp+1], 80h
        ret

midi_channel_slot_resolve:
        xor     bx, bx
        test    byte ptr [MIDI_BASIC_CHANNEL], 80h
        jne     br_5c8b
        mov     bl, byte ptr [MIDI_RUNNING_CHANNEL]
        shl     bx, 1
        inc     bx
        inc     bx
br_5c8b:
        ret

fn_5c8c:
        endm

RUN_FN_5C92 macro   {GLOBALSYMBOLS}
        mov     bx, word ptr [bp+VC(15h)]
        mov     di, word ptr [bp+VC(11h)]

fn_5c92:
        mov     si, word ptr [bx+di+28h]
        mov     ax, 3c0h
        test    byte ptr [bx+12h], 1
        jne     br_5ca1
        mov     ax, word ptr [bp+VC(17h)]
br_5ca1:
        sub     ax, word ptr [si+16h]
        add     ax, word ptr [bx+di+2ah]
        mov     bx, word ptr [bp+VC(21h)]
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5BD1
        RUN_FN_5C92
        add     ax, word ptr [bx+TBL_9EB0]
        add     ax, word ptr [bp+1dh]
        add     ax, word ptr [MASTER_TUNING]
        xchg    bx, ax
        mov     al, byte ptr [bp+1ah]
        endif

RUN_PITCH_SCALE_ROUTINE macro   {GLOBALSYMBOLS}
pitch_scale_routine:
        cbw
        add     ax, bx
        mov     cx, 0c0h
        cwd
        idiv    cx
        and     dx, dx
        js      br_5ccb
        inc     ax
        sub     dx, 0c0h
br_5ccb:
        push    ax
        neg     dx
        mov     bx, dx
        mov     dx, word ptr [si+14h]
        shr     bx, 1
        jae     br_5cdc
        mov     ax, 0ff14h
        mul     dx
br_5cdc:
        shr     bx, 1
        jae     br_5ce5
        mov     ax, 0fe29h
        mul     dx
br_5ce5:
        shr     bx, 1
        jae     br_5cee
        mov     ax, 0fc54h
        mul     dx
br_5cee:
        shr     bx, 1
        jae     br_5cf7
        mov     ax, 0f8b6h
        mul     dx
br_5cf7:
        shr     bx, 1
        jae     br_5d00
        mov     ax, 0f1a2h
        mul     dx
br_5d00:
        shr     bx, 1
        jae     br_5d09
        mov     ax, 0e412h
        mul     dx
br_5d09:
        shr     bx, 1
        jae     br_5d12
        mov     ax, 0cb30h
        mul     dx
br_5d12:
        shr     bx, 1
        jae     br_5d1b
        mov     ax, 0a145h
        mul     dx
br_5d1b:
        mov     cx, dx
        mov     dx, 0f4h
        mov     ax, 2400h
        div     cx
        pop     cx
        and     cx, cx
        jns     br_5d30
        neg     cx
        shl     ax, cl
        jmp     br_5d3d
br_5d30:
        jcxz    br_5d3d
loop_5d32:
        cmp     ax, word ptr [W_5930]
        jb      br_5d3d
        inc     ax
        shr     ax, 1
        loop    loop_5d32
br_5d3d:
        cmp     ax, 4e20h
        jae     br_5d55
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_PITCH_SCALE_ROUTINE
        mov     word ptr [bp+1bh], ax
        mov     dl, byte ptr [bp+2ah]
        endif

RUN_BR_5D55 macro   {GLOBALSYMBOLS}
        mov     dh, 0
        out     dx, al
        xchg    al, ah
        out     dx, al
        xchg    al, ah
        mov     cl, 50h
        div     cl
        ret
br_5d55:
        shr     ax, 1
        jmp     br_5d3d

isr_voice0:
        push    bp
        mov     bp, VOICES
        jmp     voice_irq

isr_voice1:
        push    bp
        mov     bp, P_B48D
        jmp     voice_irq

isr_voice2:
        push    bp
        mov     bp, P_B4C4
        jmp     voice_irq

isr_voice3:
        push    bp
        mov     bp, P_B4FB
        jmp     voice_irq

isr_voice4:
        push    bp
        mov     bp, P_B532
        jmp     voice_irq

isr_voice5:
        push    bp
        mov     bp, P_B569
        jmp     voice_irq

isr_voice6:
        push    bp
        mov     bp, P_B5A0
        jmp     voice_irq

isr_voice7:
        push    bp
        mov     bp, P_B5D7
voice_irq:
        push    bx
        push    dx
        push    ax
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5D55
        mov     al, byte ptr [bp+25h]
loop_5d8d:
        mov     dx, word ptr [bp+26h]
        mov     bx, word ptr [bp+0dh]
        out     dx, al
        mov     al, byte ptr [bx+7]
        add     dx, 9
        out     dx, al
        mov     byte ptr [bp+2], al
        test    byte ptr [bx], 4
        endif

RUN_BR_5DAC macro   {GLOBALSYMBOLS}
        je      br_5dac
        in      al, 0e2h
        or      al, byte ptr [bp+VC(34h)]
        out     0e2h, al
        jmp     br_5dcd
br_5dac:
        endm

RUN_AFTER_BR_5DAC macro   {GLOBALSYMBOLS}
        mov     ax, word ptr [bx+4]
        add     dx, -6
        out     dx, ax
        mov     al, byte ptr [bx+6]
        and     al, byte ptr [bp+9]
        or      al, byte ptr [bp+0ah]
        add     dx, 2
        out     dx, al
        mov     ax, word ptr [bx+2]
        add     dx, -4
        out     dx, ax
        mov     ax, word ptr [bx+8]
        mov     word ptr [bp+0dh], ax
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5DAC
        RUN_AFTER_BR_5DAC
        endif

RUN_BR_5DCD macro   {GLOBALSYMBOLS}
br_5dcd:
        pop     ax
        pop     dx
        pop     bx
        pop     bp
        iret

isr_5dd2:
        push    bp
        mov     al, byte ptr [bp+VC(2eh)]
        push    bx
        push    dx
        push    ax
        jmp     loop_5d8d

isr_5ddb:
        push    bp
        jmp     voice_irq
loop_5dde:
        call    midi_rx_dispatch
        mov     al, byte ptr [W_9596]
        shl     al, 1
        shl     ax, 1
        mov     al, ah
        mov     ah, 0
        cmp     al, 0feh
        jb      br_5df3
        mov     ax, 100h
br_5df3:
        sub     ax, 80h
        xchg    dx, ax
        mov     al, byte ptr [B_7C87]
        cbw
        imul    dx
        mov     cl, 3
        sar     ax, cl
        call    midi_channel_slot_resolve
        mov     word ptr [bx+TBL_9EB0], ax
        ret

fn_5e09:
        mov     dl, byte ptr [bp+VC(35h)]
        mov     dh, 0
        mov     al, byte ptr [bp+VC(36h)]
        out     dx, al
        mov     dx, word ptr [bp+VC(2ch)]
        add     dx, 0eh
        mov     ah, byte ptr [bp+VC(2fh)]
        in      al, dx
        or      al, ah
        out     dx, al
        ret

fn_5e20:
        pushf
        cli
        in      al, 0e2h
        or      al, byte ptr [bp+VC(34h)]
        out     0e2h, al
        popf
        ret
loop_5e2b:
        mov     di, P_9F16
        xor     ah, 7fh
        call    fn_5e6e
        cmp     byte ptr [B_7C80], 0
        je      br_5e65
        mov     cx, 8
        mov     bp, VOICES
        mov     dl, 78h
loop_5e43:
        test    byte ptr [bp], 4
        je      br_5e60
        xor     ax, ax
        mov     al, byte ptr [bp+3]
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5DCD
        mov     bx, word ptr [bp+21h]
        sub     ax, word ptr [bx+TBL_9F16]
        endif

RUN_BR_5E60 macro   {GLOBALSYMBOLS}
        not     ah
        and     al, ah
        mov     dh, byte ptr [bp+VC(31h)]
        out     dx, al
        mov     byte ptr [bp+4], al
br_5e60:
        add     bp, VOICE_SIZE
        loop    loop_5e43
br_5e65:
        ret
loop_5e66:
        mov     di, P_9EF4
        jmp     fn_5e6e
loop_5e6b:
        mov     di, P_9ED2

fn_5e6e:
        call    midi_rx_dispatch
        xchg    al, ah
        cbw
        call    midi_channel_slot_resolve
        mov     word ptr [bx+di], ax
        ret

fn_5e7a:
        mov     dl, byte ptr [bp+VC(35h)]
        mov     dh, 0
        mov     al, byte ptr [bp+VC(36h)]
        out     dx, al
        mov     dx, word ptr [bp+VC(2ch)]
        add     dx, 0eh
        mov     ah, byte ptr [bp+VC(2fh)]
        xor     ah, 0fh
        in      al, dx
        and     al, ah
        out     dx, al
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5E60
        mov     dl, byte ptr [bp+2ah]
        mov     dh, 0
        mov     ax, word ptr [bp+1bh]
        endif

RUN_INTERRUPT_WAIT_PRIMITIVE macro   {GLOBALSYMBOLS}
        out     dx, al
        xchg    al, ah
        out     dx, al
        ret

interrupt_wait_primitive:
        in      al, 0e0h
        test    byte ptr [bp+VC(34h)], al
        je      fn_5ec7
        mov     al, byte ptr [bp+VC(31h)]
        add     al, al
        add     al, al
        cbw
        mov     bx, 20h
        add     bx, ax
        mov     bx, word ptr [bx]
        mov     byte ptr [bx], 0cfh
        call    fn_5ec7
        if      MODEL = 950
        sti
        endif
loop_5ebc:
        in      al, 0e0h
        test    byte ptr [bp+VC(34h)], al
        jne     loop_5ebc
        mov     byte ptr [bx], 55h
        ret

fn_5ec7:
        mov     ah, byte ptr [bp+VC(34h)]
        xor     ah, 0ffh
        pushf
        cli
        in      al, 0e2h
        and     al, ah
        out     0e2h, al
        popf
        ret

fn_5ed7:
        mov     al, 86h
        out     3eh, al
        in      al, 3ch
        xchg    byte ptr [B_960D], al
        sub     al, byte ptr [B_960D]
        mov     byte ptr [W_9622], al
        mov     bp, VOICES
        mov     cx, 8
loop_5eee:
        test    byte ptr [bp], 1fh
        if      (FW_VERSION >= 210) || (MODEL = 950)
        je      br_5ef9
        push    cx
        call    fn_5eff
        pop     cx
br_5ef9:
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        jne     br_189e_v12a
br_5ef9:
        endif
        add     bp, VOICE_SIZE
        loop    loop_5eee
        ret
        if      (FW_VERSION >= 210) || (MODEL = 950)

fn_5eff:
        else
loop_189b_v12a:
        pop     cx
        jmp     br_5ef9
br_189e_v12a:
        push    cx
        endif
        test    byte ptr [bp+2], 10h
        jne     br_5f2c
        mov     ax, 5300h
        mov     dx, 7
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_INTERRUPT_WAIT_PRIMITIVE
        div     word ptr [bp+1bh]
        xchg    cx, ax
        mov     al, byte ptr [bp+28h]
        mov     dx, word ptr [bp+26h]
        endif

RUN_AFTER_BR_189E_V12A macro   {GLOBALSYMBOLS}
        pushf
        cli
        out     dx, al
        inc     dx
        in      ax, dx
        popf
        cmp     ax, cx
        jae     br_5f2c
        mov     byte ptr [bp], 2
        mov     byte ptr [bp+5], 0
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_AFTER_BR_189E_V12A
        mov     word ptr [bp+0fh], 4000h
        endif

RUN_BR_5F2C macro   {GLOBALSYMBOLS}
br_5f2c:
        mov     al, byte ptr [bp]
        test    al, 1bh
        if      (FW_VERSION >= 210) || (MODEL = 950)
        je      br_5f3a
        else
        je      loop_189b_v12a
        endif
        test    al, 10h
        jne     br_5f3b
        jmp     br_5fe3
        if      (FW_VERSION >= 210) || (MODEL = 950)
br_5f3a:
        ret
        endif
br_5f3b:
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5F2C
        mov     ax, word ptr [bp+0fh]
        endif

RUN_LOOP_5F4F macro   {GLOBALSYMBOLS}
        mul     word ptr [W_9622]
        if      (FW_VERSION >= 210) || (MODEL = 950)
        jb      br_5f70
        add     ax, word ptr [bp+7]
        jb      br_5f70
        else
        jb      br_1910_v12a
        add     ax, word ptr [bp+7]
        jb      br_1910_v12a
        endif
        mov     word ptr [bp+7], ax
        mov     cx, 0fh
loop_5f4f:
        shl     ax, 1
        jb      br_5f55
        loop    loop_5f4f
br_5f55:
        mov     al, ah
        shr     al, 1
        shr     al, 1
        shr     al, 1
        mov     bx, P_5FC3
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        xlat
        mov     ah, al
        mov     al, cl
        mov     cl, 4
        shl     al, cl
        add     al, ah
        cmp     al, byte ptr [bp+5]
        jb      br_5fa3
        if      (FW_VERSION >= 210) || (MODEL = 950)
br_5f70:
        endif
        if      FW_VERSION >= 210
        mov     bx, word ptr [bp+15h]
        elseif  (MODEL = 900) && (FW_VERSION < 210)
br_1910_v12a:
        mov     byte ptr [bp], 8
        mov     bx, word ptr [bp+15h]
        else
        mov     bx, word ptr [bp+13h]
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
br_5f73:
        mov     byte ptr [bp], 8
        endif
        mov     al, 63h
        sub     al, byte ptr [bx+5]
        cmp     al, 63h
        jne     br_5f82
        mov     al, 0ffh
br_5f82:
        mov     ah, al
        mov     al, byte ptr [bp+5]
        mov     byte ptr [bp+8], al
        push    ax
        sub     al, ah
        jae     br_5f91
        xor     al, al
br_5f91:
        mov     byte ptr [bp+5], al
        mov     al, byte ptr [bx+4]
        cbw
        and     al, 0feh
        xchg    si, ax
        endm

RUN_BR_5FA3 macro   {GLOBALSYMBOLS}
        mov     word ptr [bp+VC(0fh)], ax
        pop     ax
br_5fa3:
        mov     byte ptr [bp+3], al
        mov     ah, 0
        cmp     byte ptr [B_7C80], ah
        je      br_5fb9
        mov     bx, word ptr [bp+VC(21h)]
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_LOOP_5F4F
        mov     ax, word ptr [si+TBL_7948]
        RUN_BR_5FA3
        sub     ax, word ptr [bx+TBL_9F16]
        endif

RUN_BR_5FB9 macro   {GLOBALSYMBOLS}
        not     ah
        and     al, ah
br_5fb9:
        mov     byte ptr [bp+4], al
        mov     dh, byte ptr [bp+VC(31h)]
        mov     dl, 78h
        out     dx, al
        if      (FW_VERSION >= 210) || (MODEL = 950)
        ret
        else
        pop     cx
        jmp     br_5ef9
        endif
P_5FC3:
        db      00h, 01h, 01h, 02h, 03h, 03h, 04h, 05h, 05h, 06h, 06h, 07h, 07h, 08h, 08h, 09h
        db      09h, 0ah, 0ah, 0bh, 0bh, 0ch, 0ch, 0dh, 0dh, 0dh, 0eh, 0eh, 0fh, 0fh, 0fh, 0fh
br_5fe3:
        mov     ch, byte ptr [bp+5]
        mov     cl, 0
        mov     ax, word ptr [W_9622]
        shl     ax, 1
        shl     ax, 1
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5FB9
        mul     word ptr [bp+0fh]
        endif

RUN_BR_5FFF macro   {GLOBALSYMBOLS}
        sub     word ptr [bp+6], ax
        sbb     byte ptr [bp+8], dl
        jb      br_5fff
        cmp     cx, word ptr [bp+7]
        jb      br_6008
br_5fff:
        mov     word ptr [bp+7], cx
        jcxz    br_600d
        mov     byte ptr [bp], 4
br_6008:
        mov     al, byte ptr [bp+8]
        jmp     br_5fa3
br_600d:
        call    fn_6085
        xor     ax, ax
        mov     byte ptr [bp], al
        mov     word ptr [bp+7], ax
        jmp     br_5fa3

midi_rx_dispatch:
        push    ax
        mov     al, byte ptr [MIDI_BASIC_CHANNEL]
        cbw
        inc     ah
        je      br_6029
        cmp     al, byte ptr [MIDI_RUNNING_CHANNEL]
        jne     br_602e
br_6029:
        mov     byte ptr [B_957D], 0ffh
br_602e:
        pop     ax
        ret

fn_6030:
        in      al, 3ch
        xor     al, byte ptr [B_9607]
        js      br_6039
loop_6038:
        ret
br_6039:
        xor     byte ptr [B_9607], al
        test    byte ptr [B_9610], 0ffh
        jne     br_606f
        in      al, 6ah
        and     al, 8
        cmp     al, byte ptr [B_9605]
        je      loop_6038
        mov     byte ptr [B_9605], al
        cmp     byte ptr [B_9606], 0
        je      loop_6038
loop_6058:
        mov     bx, MIDI_SETTINGS
        mov     dl, byte ptr [bx+14h]
        dec     dx
        mov     dh, byte ptr [bx+16h]
        and     al, al
        jne     br_6069
        jmp     br_62ea
br_6069:
        mov     al, byte ptr [bx+18h]
        jmp     br_617a
br_606f:
        cmp     byte ptr [B_9610], 2
        mov     al, 1
        je      br_6080
        cmp     byte ptr [KEY_MATRIX_LAST], 0ffh
        jne     loop_6038
        dec     ax
br_6080:
        mov     byte ptr [B_9610], al
        jmp     loop_6058

fn_6085:
        call    fn_5e09
        call    fn_5e20
        mov     dx, word ptr [bp+VC(2ch)]
        mov     al, byte ptr [bp+VC(2eh)]
        pushf
        cli
        out     dx, al
        mov     al, 89h
        add     dx, 9
        out     dx, al
        mov     ax, P_9614
        add     dx, -6
        out     dx, ax
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_5FFF
        mov     al, 0f0h
        endif

RUN_MIDI_RX_BYTE macro   {GLOBALSYMBOLS}
        add     dx, 2
        out     dx, al
        mov     ax, 3
        add     dx, -4
        out     dx, ax
        mov     al, byte ptr [bp+VC(2fh)]
        add     dx, 0ch
        out     dx, al
        popf
        ret

midi_rx_byte:
        test    al, 80h
        je      br_60ee
        cmp     al, 0f0h
        mov     ah, al
        je      br_60e1
        jae     br_60ca
        and     al, 0fh
        mov     byte ptr [MIDI_RUNNING_CHANNEL], al
        jmp     br_60e1
br_60ca:
        cmp     al, 0f7h
        mov     ah, 0ffh
        jne     br_60dd
        xchg    al, ah
        xchg    byte ptr [W_7CDC], al
        cmp     al, 0f0h
        jne     br_60ea
        jmp     br_678d
br_60dd:
        cmp     al, 0f6h
        jae     br_60ea
br_60e1:
        mov     byte ptr [B_9594], 0
        mov     byte ptr [W_7CDC], ah
br_60ea:
        ret
loop_60eb:
        jmp     br_678d
br_60ee:
        mov     ah, al
        mov     al, byte ptr [W_7CDC]
        cmp     al, 0f0h
        je      loop_60eb
        jae     br_60ea
        and     al, 0f0h
        cmp     al, 0a0h
        je      br_60ea
        cmp     al, 0c0h
        endm

RUN_LOOP_6108 macro   {GLOBALSYMBOLS}
        jne     br_6123
        call    midi_rx_dispatch
        je      br_6109
loop_6108:
        ret
br_6109:
        cmp     byte ptr [B_7C82], 0
        je      loop_6108
        cmp     ah, byte ptr [B_9576]
        jae     loop_6108
        xchg    al, ah
        inc     ax
        call    fn_6645
        call    fn_66be
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_MIDI_RX_BYTE
        RUN_LOOP_6108
        endif

RUN_BR_6123 macro   {GLOBALSYMBOLS}
        jmp     word ptr [MODE_FILL]
br_6123:
        cmp     al, 0d0h
        je      br_6138
        test    byte ptr [B_9594], 0ffh
        jne     br_613b
        mov     byte ptr [B_9594], 1
        mov     byte ptr [W_9596], ah
        ret
br_6138:
        jmp     loop_5e66
br_613b:
        mov     byte ptr [B_9594], 0
        cmp     al, 0b0h
        jne     br_616d
        mov     al, byte ptr [W_9596]
        cmp     al, 7bh
        jb      br_6157
        and     ah, ah
        jne     br_6156
        cmp     al, 7bh
        jne     br_6156
        jmp     loop_5bba
br_6156:
        ret
br_6157:
        cmp     al, 1
        jne     br_615e
        jmp     loop_5e6b
br_615e:
        cmp     al, 40h
        jne     br_6165
        jmp     sustain_pedal_handler
br_6165:
        cmp     al, 7
        jne     br_616c
        jmp     loop_5e2b
br_616c:
        ret
br_616d:
        cmp     al, 0e0h
        jne     br_61a0
        jmp     loop_5dde
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_6123

fn_6174:
        mov     dl, byte ptr [si+1]
        mov     dh, byte ptr [si+2]
        endif

RUN_BR_617A macro   {GLOBALSYMBOLS}
br_617a:
        mov     byte ptr [W_95B2], al
        mov     al, dl
        mov     byte ptr [W_95AA], al
        xchg    byte ptr [MIDI_RUNNING_CHANNEL], al
        push    ax
        mov     al, dh
        mov     byte ptr [W_959A], al
        xchg    byte ptr [W_9596], al
        push    ax
        call    fn_61bd
        pop     word ptr [W_9596]
        pop     word ptr [MIDI_RUNNING_CHANNEL]
        ret
loop_619d:
        jmp     br_630c
br_61a0:
        mov     byte ptr [W_95B2], ah
        mov     bl, byte ptr [W_9596]
        mov     byte ptr [W_959A], bl
        mov     bx, word ptr [MIDI_RUNNING_CHANNEL]
        mov     byte ptr [W_95AA], bl
        cmp     al, 80h
        je      loop_619d
        cmp     ah, 0
        je      loop_619d

fn_61bd:
        mov     bx, word ptr [CUR_PROGRAM]
        mov     bp, word ptr [bx+12h]
        test    byte ptr [MIDI_BASIC_CHANNEL], 80h
        jne     br_6213
        mov     al, byte ptr [MIDI_RUNNING_CHANNEL]
        sub     al, byte ptr [MIDI_BASIC_CHANNEL]
        mov     byte ptr [B_9620], al
        je      br_61da
        jae     br_61df
        ret
br_61da:
        mov     byte ptr [B_957D], 0ffh
br_61df:
        mov     al, byte ptr [B_9620]
        cmp     al, byte ptr [bp+14h]
        jne     br_620b
        mov     al, byte ptr [W_9596]
        cmp     al, byte ptr [bp+1]
        jb      br_620b
        cmp     byte ptr [bp], al
        jb      br_620b
        mov     word ptr [W_9580], bp
        mov     byte ptr [B_957D], 0ffh
        call    voice_slot_lookup
        mov     bx, word ptr [CUR_PROGRAM]
        call    midi_note_trigger
        mov     bp, word ptr [W_9580]
br_620b:
        mov     bp, word ptr [bp+44h]
        and     bp, bp
        jne     br_61df
        ret
br_6213:
        mov     byte ptr [B_957D], 0ffh
loop_6218:
        mov     al, byte ptr [W_9596]
        cmp     al, byte ptr [bp+1]
        jb      br_6237
        cmp     byte ptr [bp], al
        jb      br_6237
        mov     word ptr [W_9580], bp
        call    voice_slot_lookup
        mov     bx, word ptr [CUR_PROGRAM]
        call    midi_note_trigger
        mov     bp, word ptr [W_9580]
br_6237:
        mov     bp, word ptr [bp+44h]
        and     bp, bp
        jne     loop_6218
        ret

thk_program_sample_tag_scan:
        jmp     program_sample_tag_scan
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_617A
        endif

RUN_TX_PUMP macro   {GLOBALSYMBOLS}

tx_pump:
        cmp     byte ptr [CONTROL_BY], 2
        je      br_626e
        in      al, 52h
        and     al, 2
        je      br_6266
        mov     si, word ptr [TX_TAIL]
        cmp     si, word ptr [TX_HEAD]
        je      br_6266
        lodsb
        out     54h, al
        cmp     si, MIDI_RX_BUF
        je      br_6267
        mov     word ptr [TX_TAIL], si
br_6266:
        ret
br_6267:
        mov     word ptr [TX_TAIL], P_B2D6
        ret
br_626e:
        in      al, 5ah
        and     al, 1
        je      br_628b
        mov     si, word ptr [TX_TAIL]
        cmp     si, word ptr [TX_HEAD]
        je      br_628b
        lodsb
        out     58h, al
        cmp     si, MIDI_RX_BUF
        je      br_6267
        mov     word ptr [TX_TAIL], si
br_628b:
        ret
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_TX_PUMP
        endif

RUN_MIDI_RX_PUMP macro   {GLOBALSYMBOLS}

midi_rx_pump:
        mov     si, word ptr [MIDI_RX_TAIL]
        cmp     si, word ptr [MIDI_RX_HEAD]
        jne     br_6297
        ret
br_6297:
        lodsb
        cmp     si, MIDI_RX_END
        je      br_62a7
loop_629e:
        mov     word ptr [MIDI_RX_TAIL], si
        call    midi_rx_byte
        jmp     midi_rx_pump
br_62a7:
        mov     si, MIDI_RX_BUF
        jmp     loop_629e
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_MIDI_RX_PUMP
        endif

RUN_FN_62AC macro   {GLOBALSYMBOLS}

fn_62ac:
        mov     di, word ptr [TX_HEAD]
        mov     al, 90h
        or      al, byte ptr [si+1]
        cmp     al, byte ptr [B_7C55]
        je      br_62c8
        mov     byte ptr [B_7C55], al
        stosb
        cmp     di, MIDI_RX_BUF
        jne     br_62c8
        mov     di, P_B2D6
br_62c8:
        mov     al, byte ptr [si+2]
        mov     dh, al
        stosb
        cmp     di, MIDI_RX_BUF
        jne     br_62d7
        mov     di, P_B2D6
br_62d7:
        mov     al, 0
        stosb
        cmp     di, MIDI_RX_BUF
        jne     br_62e3
        mov     di, P_B2D6
br_62e3:
        mov     word ptr [TX_HEAD], di
        mov     dl, byte ptr [si+1]
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_FN_62AC
        endif

RUN_BR_62EA macro   {GLOBALSYMBOLS}
br_62ea:
        mov     al, dl
        mov     byte ptr [W_95AA], al
        xchg    byte ptr [MIDI_RUNNING_CHANNEL], al
        push    ax
        mov     al, 90h
        xchg    byte ptr [W_7CDC], al
        push    ax
        mov     al, dh
        mov     byte ptr [W_959A], al
        call    fn_630f
        pop     word ptr [W_7CDC]
        pop     word ptr [MIDI_RUNNING_CHANNEL]
        ret
br_630c:
        mov     al, byte ptr [W_9596]

fn_630f:
        mov     cl, 10h
        mul     cl
        mov     bp, VOICES
        mov     cx, 8
        call    midi_rx_dispatch
        call    midi_channel_slot_resolve
loop_631f:
        test    byte ptr [bp], 1ch
        je      br_6334
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_62EA
        cmp     word ptr [bp+17h], ax
        jne     br_6334
        cmp     word ptr [bp+21h], bx
        endif

RUN_BR_6334 macro   {GLOBALSYMBOLS}
        jne     br_6334
        push    ax
        call    fn_633a
        pop     ax
br_6334:
        add     bp, VOICE_SIZE
        loop    loop_631f
        ret

fn_633a:
        mov     byte ptr [B_957D], 0ffh
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_6334
        mov     di, word ptr [bp+15h]
        test    byte ptr [di+12h], 8
        je      br_1cf7_v12a
        add     di, word ptr [bp+11h]
        endif

RUN_BR_6354 macro   {GLOBALSYMBOLS}
        mov     di, word ptr [di+28h]
        cmp     byte ptr [di+1ah], 4fh
        if      (FW_VERSION >= 210) || (MODEL = 950)
        je      br_63bb
br_6354:
        endif
        if      FW_VERSION >= 210
        cmp     byte ptr [bx+TBL_9E8E], 0
        je      br_6360
        mov     byte ptr [bp+0bh], 2
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        je      br_1d4b_v12a
br_1cf7_v12a:
        mov     byte ptr [bp], 2
        else
        cmp     byte ptr [bx+TBL_9E8E], 0
        je      br_6360
        mov     byte ptr [bp+9], 2
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        ret
br_6360:
        mov     byte ptr [bp], 2
        mov     word ptr [bp+VC(29h)], L_650c
        endif
        xor     dx, dx
        mov     byte ptr [bp+5], dl
        mov     al, byte ptr [bp+3]
        mov     byte ptr [bp+8], al
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_6354
        mov     si, word ptr [bp+15h]
        cmp     byte ptr [W_7CDC], 80h
        jne     br_639f
        endif

RUN_BR_6392 macro   {GLOBALSYMBOLS}
        mov     al, byte ptr [si+0ah]
        shl     al, 1
        if      (FW_VERSION >= 210) || (MODEL = 950)
        je      br_639f
        endif
        if      FW_VERSION >= 210
        mov     ah, byte ptr [bp+0ch]
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        mov     ah, byte ptr [W_95B2]
        else
        mov     ah, byte ptr [bp+0ah]
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        test    byte ptr [si+12h], 10h
        jne     br_6392
        test    byte ptr [W_7CDC], 10h
        jne     br_639f
        mov     ah, byte ptr [W_95B2]
br_6392:
        endif
        sub     ah, 40h
        imul    ah
        shl     ax, 1
        shl     ax, 1
        xchg    al, ah
        cbw
        xchg    dx, ax
br_639f:
        mov     al, byte ptr [si+6]
        cbw
        add     ax, dx
        jns     br_63a9
        xor     ax, ax
br_63a9:
        cmp     ax, 63h
        jb      br_63b1
        mov     ax, 63h
br_63b1:
        and     al, 0feh
        xchg    di, ax
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_6392
        mov     ax, word ptr [di+TBL_7948]
        cmp     byte ptr [bx+TBL_9E8E], 0
        je      br_1d48_v12a
        xor     ax, ax
br_1d48_v12a:
        mov     word ptr [bp+0fh], ax
br_1d4b_v12a:
        ret

mode_play:
        mov     word ptr [MODE_SP], sp

L_1d50_v12a:
        endif

RUN_LOOP_6538 macro   {GLOBALSYMBOLS}
        call    fn_29a6
        mov     word ptr [MODE_FILL], play_refresh
loop_6538:
        call    program_sample_catalog_screen
        mov     word ptr [LCD_ROW1], P_86EE
        mov     word ptr [LCD_ROW2], B_87F6
        xor     ax, ax
        mov     byte ptr [B_960F], al
loop_654c:
        call    lcd_show_screen
        mov     word ptr [FIELD_LIST], 0
        sti
        cmp     byte ptr [B_9576], 1
        jne     br_6585
        mov     word ptr [LCD_ROW1], P_86FF
        mov     word ptr [LCD_ROW2], P_8810
        mov     word ptr [W_870A], 2020h
        mov     byte ptr [LCD_CURSOR_MODE], 0ch
        xor     ax, ax
        call    lcd_show_screen
loop_6579:
        call    idle_tasks
        test    byte ptr [B_960F], 0ffh
        jne     loop_6538
        jmp     loop_6579
br_6585:
        test    byte ptr [B_960F], 0ffh
        jne     loop_6538
        call    knob_read
        call    lcd_scroll_screen
        call    idle_tasks
        call    key_get
        je      br_6585
        cmp     al, 3ah
        jae     br_6585
        cmp     al, 30h
        jb      br_6585
        cmp     byte ptr [B_9576], 0ah
        jae     br_65ef
        sub     al, 30h
        je      br_6585
        cmp     byte ptr [B_9576], al
        jb      br_6585
        push    ax
        add     al, 30h
        mov     bx, 17h
        inc     bx
        mov     byte ptr [bx+TBL_87F6], al
        mov     byte ptr [B_7C57], 40h
        mov     word ptr [W_9588], bx
        xor     ax, ax
        call    lcd_show_screen
loop_65cc:
        call    idle_tasks
        cmp     byte ptr [KEY_MATRIX_LAST], 0ffh
        jne     loop_65cc
        pop     ax
loop_65d7:
        push    ax
        call    fn_6645
        mov     al, byte ptr [B_9576]
        call    play_prompt
        pop     ax
        dec     ax
        shr     al, 1
        mov     cl, 0eh
        mul     cl
        add     ax, 0dh
        jmp     loop_654c
br_65ef:
        push    ax
        sub     ax, 30h
        mov     cl, 0ah
        mul     cl
        mov     byte ptr [B_960E], al
        cmp     byte ptr [B_9576], al
        pop     ax
        jae     br_6603
        jmp     br_6585
br_6603:
        mov     bx, 17h
        mov     byte ptr [bx+TBL_87F6], al
        mov     byte ptr [B_7C57], 40h
        mov     word ptr [W_9588], 18h
        xor     ax, ax
        call    lcd_show_screen
loop_661a:
        test    byte ptr [B_960F], 0ffh
        jne     br_6642
        call    idle_tasks
        call    key_get
        je      loop_661a
        cmp     al, 3ah
        jae     loop_661a
        sub     al, 30h
        jb      loop_661a
        mov     bx, 17h
        add     al, byte ptr [B_960E]
        je      loop_661a
        cmp     byte ptr [B_9576], al
        jb      loop_661a
        jmp     loop_65d7
br_6642:
        jmp     loop_6538

fn_6645:
        mov     bx, SLOTS
        mov     si, SLOT_TAGS
        mov     ah, 1
loop_664d:
        cmp     byte ptr [si], 50h
        jne     br_6658
        cmp     al, ah
        je      br_665e
        inc     ah
br_6658:
        inc     si
        add     bx, 46h
        jmp     loop_664d
br_665e:
        mov     word ptr [CUR_PROGRAM], bx
        ret

play_refresh:
        mov     byte ptr [B_960F], 0ffh
        ret

idle_tasks:
        pusha
        call    midi_rx_pump
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_LOOP_6538
        call    drum_inputs_poll
        call    midi_receive_monitor
        call    fn_5ed7
        call    drum_inputs_poll
        call    voice_vibrato_lfo_update
        call    fn_6030
        endif

RUN_IDLE_TASKS_DRUMS macro   {GLOBALSYMBOLS}
        jmp     loop_2e28

idle_tasks_drums:
        pusha
        call    drum_inputs_poll
        call    midi_rx_pump
        call    drum_inputs_poll
        call    midi_receive_monitor
        call    drum_inputs_poll
        call    fn_5ed7
        call    drum_inputs_poll
        call    drum_inputs_poll
        call    voice_vibrato_lfo_update
        call    drum_inputs_poll
        call    fn_6030
        call    drum_inputs_poll
        jmp     loop_2e28
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_IDLE_TASKS_DRUMS
        endif

RUN_VOICE_VIBRATO_LFO_UPDATE macro   {GLOBALSYMBOLS}

voice_vibrato_lfo_update:
        mov     al, 86h
        out     3eh, al
        in      al, 3ch
        mov     ah, al
        sub     al, byte ptr [B_960C]
        neg     al
        cmp     al, byte ptr [B_5919]
        jae     br_63d1
        ret
br_63d1:
        mov     byte ptr [B_960C], ah
        mov     byte ptr [W_9622], al
        mov     bp, VOICES
        mov     cx, 8
loop_63de:
        test    byte ptr [bp], 1fh
        jne     br_63ea
loop_63e4:
        add     bp, VOICE_SIZE
        loop    loop_63de
        ret
br_63ea:
        push    cx
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_VOICE_VIBRATO_LFO_UPDATE
        mov     si, word ptr [bp+15h]
        mov     al, 64h
        sub     al, byte ptr [si+0fh]
        mul     byte ptr [W_9622]
        add     word ptr [bp+1fh], ax
        jns     br_6401
        mov     word ptr [bp+1fh], 7fffh
        endif

RUN_BR_6401 macro   {GLOBALSYMBOLS}
br_6401:
        mov     ax, 4
        test    byte ptr [si+12h], al
        je      br_6410
        mov     ah, byte ptr [bp+VC(2eh)]
        shl     ah, 1
        shl     ah, 1
br_6410:
        mov     al, byte ptr [si+10h]
        shr     al, 1
        add     al, byte ptr [si+10h]
        add     al, 1eh
        add     al, ah
        mul     byte ptr [W_9622]
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_6401
        add     ax, word ptr [bp+23h]
        mov     word ptr [bp+23h], ax
        xchg    al, ah
        mov     cl, 3
        shr     al, cl
        mov     bx, sine_lfo_table
        xlat
        imul    byte ptr [bp+20h]
        shl     ax, 1
        xchg    dx, ax
        mov     bx, word ptr [bp+21h]
        mov     al, byte ptr [bx+TBL_9EF4]
        endif

RUN_AFTER_BR_6410 macro   {GLOBALSYMBOLS}
        mul     byte ptr [si+15h]
        xchg    di, ax
        mov     al, byte ptr [bx+TBL_9ED2]
        mul     byte ptr [si+16h]
        add     ax, di
        add     ah, byte ptr [si+11h]
        xchg    al, ah
        shr     al, 1
        imul    dh
        xchg    al, ah
        cbw
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_AFTER_BR_6410
        mov     word ptr [bp+1dh], ax
        cmp     byte ptr [bp+1ah], ah
        je      br_1f81_v12a
        mov     al, 68h
        sub     al, byte ptr [si+0eh]
        mul     byte ptr [W_9622]
        imul    word ptr [bp+19h]
        mov     cx, 3e80h
        idiv    cx
        sub     word ptr [bp+19h], ax
br_1f81_v12a:
        call    fn_5c8c
        pop     cx
        cmp     al, byte ptr [bp+13h]
        ja      br_1f8d_v12a
        jmp     loop_63e4
br_1f8d_v12a:
        mov     dl, byte ptr [bp+2dh]
        mov     dh, 0
        mov     byte ptr [bp+13h], al
        out     dx, al
        xor     al, al
        out     dx, al
        jmp     loop_63e4
        endif

RUN_FN_66AA macro   {GLOBALSYMBOLS}

fn_66aa:
        test    byte ptr [B_9611], 0ffh
        jne     br_66b8
        call    fn_2bb9
        mov     al, 1
        out     8fh, al
br_66b8:
        mov     byte ptr [B_9606], 0ffh
        ret
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_FN_66AA
        endif

RUN_FN_66BE macro   {GLOBALSYMBOLS}

fn_66be:
        cmp     byte ptr [DRUM_INPUTS_ON], 0
        je      br_66e7
        mov     si, P_9F4E
        mov     cx, 8
loop_66cb:
        cmp     word ptr [si+16h], 0
        je      br_66d6
        pusha
        call    fn_62ac
        popa
br_66d6:
        add     si, 1eh
        loop    loop_66cb
loop_66db:
        call    tx_pump
        mov     ax, word ptr [TX_TAIL]
        cmp     ax, word ptr [TX_HEAD]
        jne     loop_66db
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_FN_66BE
        endif

RUN_BR_66E7 macro   {GLOBALSYMBOLS}
br_66e7:
        mov     bp, VOICES
        mov     cx, 8
        xor     bx, bx
loop_66ef:
        test    byte ptr [bp], 1ch
        je      br_66f8
        call    fn_633a
br_66f8:
        add     bp, VOICE_SIZE
        loop    loop_66ef
        mov     byte ptr [B_957D], 0
        ret

voice_reset_all:
        mov     bp, VOICES
        mov     cx, 8
loop_6709:
        mov     byte ptr [bp], 0
        call    fn_6085
        mov     dh, byte ptr [bp+VC(31h)]
        mov     dl, 78h
        xor     al, al
        out     dx, al
        mov     byte ptr [bp+4], al
        add     bp, VOICE_SIZE
        loop    loop_6709
        mov     byte ptr [B_9606], cl
        mov     byte ptr [B_9610], cl
        mov     al, 1
        out     8fh, al
        ret
sustain_pedal_handler:
        call    midi_rx_dispatch
        call    midi_channel_slot_resolve
        and     ah, ah
        je      br_6742
        cmp     ah, 7fh
        jne     br_6741
        if      FW_VERSION >= 210
        mov     byte ptr [bx+TBL_9E8E], 0ffh
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        mov     byte ptr [bx+TBL_9E8E], 63h
        else
        mov     byte ptr [bx+TBL_9E8E], 0ffh
        endif
br_6741:
        ret
br_6742:
        mov     byte ptr [bx+TBL_9E8E], ah
        mov     byte ptr [B_957D], 0ffh
        mov     cx, 8
        mov     bp, VOICES
loop_6751:
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_66E7
        cmp     byte ptr [bp], 2
        jne     br_6787
        cmp     bx, word ptr [bp+21h]
        jne     br_6787
        mov     si, word ptr [bp+15h]
        mov     al, byte ptr [si+6]
        cbw
        and     al, 0feh
        xchg    di, ax
        mov     ax, word ptr [di+TBL_7948]
        mov     word ptr [bp+0fh], ax
br_6787:
        add     bp, VOICE_SIZE
        loop    loop_6751
        ret
        endif

RUN_BR_678D macro   {GLOBALSYMBOLS}
br_678d:
        mov     si, P_962C
        cmp     byte ptr [B_9594], 0
        je      br_679b
        mov     cx, word ptr [si]
        jmp     cx
br_679b:
        mov     byte ptr [B_9594], 1
        cmp     ah, 7eh
        jne     br_67b7
        cmp     byte ptr [B_591A], 0
        je      br_67b1
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_678D
        mov     word ptr [si], L_6820
        endif

RUN_BR_67B1 macro   {GLOBALSYMBOLS}
        ret
br_67b1:
        mov     byte ptr [W_7CDC], 0ffh
        ret
br_67b7:
        mov     byte ptr [B_58D8], 0ffh
        cmp     ah, 47h
        jne     br_67b1
        mov     word ptr [si], L_67c6
        ret

L_67c6:
        mov     al, byte ptr [MIDI_BASIC_CHANNEL]
        test    al, 80h
        jne     br_67d1
        cmp     al, ah
        jne     br_67b1
br_67d1:
        mov     word ptr [si], L_67d6
        ret

L_67d6:
        mov     al, ah
        mov     di, P_58AE
        mov     cx, 0eh
        repne scasb
        jne     br_67b1
        mov     byte ptr [B_58D8], al
        mov     word ptr [si], L_67ea
        ret

L_67ea:
        cmp     ah, 40h
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_67B1
        jne     br_67b1
        endif

RUN_L_67F4 macro   {GLOBALSYMBOLS}
        mov     word ptr [si], L_67f4
        ret

L_67f4:
        mov     al, ah
        cbw
        mov     word ptr [W_9624], ax
        mov     word ptr [si], L_67ff
        ret

L_67ff:
        cmp     ah, 0
        jne     br_67b1
        mov     bx, P_58BC
        mov     di, P_58AE
        mov     cx, 0eh
        mov     al, byte ptr [B_58D8]
loop_6810:
        scasb
        je      br_6819
        inc     bx
        inc     bx
        loop    loop_6810
        jmp     br_67b1
br_6819:
        mov     ax, word ptr [bx]
        mov     word ptr [si], ax
        ret
        if      MODEL = 950

L_8cf1_s950:
        cmp     byte ptr [B_58D8], 1
        jne     br_8cfb_s950
        jmp     L_1cb2_s950
br_8cfb_s950:
        mov     word ptr [W_B520_S950], P_9F4E
        mov     word ptr [si], 8d05h
        mov     bx, word ptr [W_B520_S950]
        mov     byte ptr [bx+7], ah
        cmp     byte ptr [bx], 7
        je      br_8d17_s950
        add     word ptr [W_B520_S950], 1eh
        ret
br_8d17_s950:
        mov     word ptr [si], L_8d1c_s950
        ret

L_8d1c_s950:
        cmp     word ptr [LCD_ROW1], SCR_DRUM_INPUT_GAIN
        je      loop_681e
        mov     si, SYSEX_02_49_00

L_8d27_s950:
        call    sysex_send
        mov     byte ptr [B_B458_S950], 0
        endif
loop_681e:
        jmp     br_67b1

L_6820:
        cmp     ah, 1
        ja      loop_681e
        mov     ax, L_6830
        je      br_682d
        mov     ax, L_69e1
br_682d:
        mov     word ptr [si], ax
        ret

L_6830:
        mov     al, ah
        cbw
        mov     word ptr [W_9624], ax
        mov     word ptr [si], L_683b
        ret

L_683b:
        mov     al, 0
        shr     ax, 1
        add     ax, word ptr [W_9624]
        mov     word ptr [si], L_6866
        mov     di, P_5932
        cmp     ax, 64h
        jb      br_6852
        mov     ax, 63h
br_6852:
        mov     word ptr [W_9624], ax
        mov     cx, 0ah
        div     cl
        add     ax, 3030h
        stosw
        mov     ax, 2020h
        mov     cl, 4
        rep stosw
        ret

L_6866:
        mov     byte ptr [B_9608], ah
        mov     word ptr [si], L_686f
        ret

L_686f:
        mov     byte ptr [B_9609], ah
        mov     word ptr [si], L_6878
        ret

L_6878:
        mov     byte ptr [B_960A], ah
        mov     word ptr [si], L_6881
        ret

L_6881:
        mov     bx, B_9609
        mov     byte ptr [bx+2], ah
        call    fn_6a2b
        and     dx, dx
        jne     br_689e
        cmp     ax, dx
        jne     br_6895
        jmp     br_69db
br_6895:
        cmp     ax, 3b9bh
        jae     br_689e
        shl     ax, 1
        jmp     br_6895
br_689e:
        cmp     ax, 0a121h
        push    dx
        sbb     dx, 7
        pop     dx
        jb      br_68ae
        shr     dx, 1
        rcr     ax, 1
        jmp     br_689e
br_68ae:
        mov     cx, dx
        xchg    bx, ax
        mov     ax, 0c80ch
        mov     dx, 3b9ah
        if      (FW_VERSION >= 210) || (MODEL = 950)
loop_68b7:
        endif
        jcxz    br_68c3
        shr     dx, 1
        rcr     ax, 1
        shr     cx, 1
        rcr     bx, 1
        if      (FW_VERSION >= 210) || (MODEL = 950)
        jmp     loop_68b7
        endif
br_68c3:
        div     bx
        mov     word ptr [W_5946], ax
        mov     word ptr [si], L_68cd
        ret

L_68cd:
        mov     byte ptr [B_9609], ah
        mov     word ptr [si], L_68d6
        ret

L_68d6:
        mov     byte ptr [B_960A], ah
        mov     word ptr [si], L_68df
        ret

L_68df:
        mov     bx, B_9609
        mov     byte ptr [bx+2], ah
        call    fn_6a2b
        mov     word ptr [bp+1ch], ax
        mov     word ptr [bp+1eh], dx
        inc     ax
        jne     br_68f2
        inc     dx
br_68f2:
        and     al, 0feh
        mov     word ptr [bp+10h], ax
        mov     word ptr [bp+12h], dx
        mov     word ptr [si], L_68ff
        ret

L_68ff:
        mov     byte ptr [B_9609], ah
        mov     word ptr [si], L_6908
        ret

L_6908:
        mov     byte ptr [B_960A], ah
        mov     word ptr [si], L_6911
        ret

L_6911:
        mov     bx, B_9609
        mov     byte ptr [bx+2], ah
        call    fn_6a2b
        mov     word ptr [bp+24h], ax
        mov     word ptr [bp+26h], dx
        mov     word ptr [si], L_6925
        ret

L_6925:
        mov     byte ptr [B_9609], ah
        mov     word ptr [si], L_692e
        ret

L_692e:
        mov     byte ptr [B_960A], ah
        mov     word ptr [si], L_6937
        ret

L_6937:
        mov     bx, B_9609
        mov     byte ptr [bx+2], ah
        call    fn_6a2b
        xor     di, di
        sub     ax, word ptr [bp+24h]
        sbb     dx, word ptr [bp+26h]
        mov     word ptr [bp+24h], ax
        mov     word ptr [bp+26h], dx
        mov     byte ptr [bp+1ah], 4ch
        jb      br_695b
        cmp     ax, 5
        sbb     dx, di
        jae     br_6967
br_695b:
        mov     word ptr [bp+24h], 7d0h
        mov     word ptr [bp+26h], di
        mov     byte ptr [bp+1ah], 4fh
br_6967:
        mov     word ptr [si], L_696c
        ret

L_696c:
        mov     bp, P_5932
        cmp     byte ptr [bp+1ah], 4fh
        je      br_697e
        cmp     ah, 1
        jne     br_697e
        mov     byte ptr [bp+1ah], 41h
br_697e:
        mov     byte ptr [W_7CDC], 0ffh
        cmp     byte ptr [B_9608], 8
        jb      br_69db
        cmp     byte ptr [B_9608], 0fh
        jae     br_69db

L_6991:
        call    program_sample_tag_scan
        mov     al, byte ptr [W_9624]
        inc     ax
        cmp     al, ah
        ja      br_69a6
        cbw
        xchg    cx, ax
        mov     al, 53h
        call    fn_6a41
        call    midi_dump_ui_region
br_69a6:
        mov     dx, P_5932
        call    find_sample
        jb      br_69b1
        call    midi_dump_ui_region
br_69b1:
        call    find_free_slot
        jb      br_69db
        call    fn_2aef
        mov     bp, P_5932
        mov     word ptr [bp+36h], ax
        mov     word ptr [bp+38h], dx
        sub     bx, word ptr [bp+10h]
        sbb     cx, word ptr [bp+12h]
        jb      br_69db
        jmp     midi_receive_sample

midi_dump_ui_region:
        pusha
        call    voice_reset_all
        popa
        call    fn_21a1
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_L_67F4
        call    fn_0125
        endif

RUN_BR_69DB macro   {GLOBALSYMBOLS}
        jmp     program_sample_name_xref_resolve
br_69db:
        mov     si, P_590F
        jmp     sysex_send

L_69e1:
        mov     al, ah
        mov     byte ptr [W_9628], al
        mov     word ptr [si], L_69eb
        ret

L_69eb:
        mov     word ptr [si], L_6a1e
        mov     al, 0
        shr     ax, 1
        add     ax, word ptr [W_9628]
        inc     ax
        push    ax

L_69f9:
        call    program_sample_tag_scan
        jne     br_6a05
        pop     ax
loop_69ff:
        mov     byte ptr [W_7CDC], 0ffh
        ret
br_6a05:
        pop     cx
        mov     al, ah
        cbw
        cmp     ax, cx
        jae     br_6a0e
        xchg    cx, ax
br_6a0e:
        mov     ax, cx
        dec     ax
        mov     word ptr [W_9628], ax
        mov     al, 53h
        call    fn_6a41
        mov     word ptr [W_9626], bx
        ret

L_6a1e:
        mov     byte ptr [W_7CDC], 0ffh
        cmp     ah, 0f7h
        jne     loop_69ff
        jmp     midi_send_sample

fn_6a2b:
        mov     ax, word ptr [bx]
        shl     al, 1
        cwd
        shl     ax, 1
        mov     dl, byte ptr [bx+2]
        shr     dx, 1
        rcr     ax, 1
        shr     dx, 1
        rcr     ax, 1
        mov     bp, P_5932
        ret

fn_6a41:
        push    cx
        push    di
        mov     di, SLOT_TAGS
        mov     bx, P_A084
loop_6a49:
        add     bx, 46h
        mov     bp, di
        scasb
        jne     loop_6a49
        loop    loop_6a49
        pop     di
        pop     cx
        ret

sysex_send_byte:
        push    ax
        endm

RUN_LOOP_6A5E macro   {GLOBALSYMBOLS}
        cmp     byte ptr [CONTROL_BY], 2
        je      br_6a68
loop_6a5e:
        in      al, 52h
        and     al, 2
        je      loop_6a5e
        pop     ax
        out     54h, al
        ret
br_6a68:
        in      al, 5ah
        and     al, 1
        je      br_6a68
        pop     ax
        out     58h, al
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_69DB
        RUN_LOOP_6A5E
        endif

RUN_SYSEX_SEND_DATA macro   {GLOBALSYMBOLS}
        ret

sysex_send_data:
        lodsb
        mov     ah, al
        and     al, 7fh
        xor     byte ptr [SYSEX_CHECKSUM], al
        call    sysex_send_byte
        rol     ax, 1
        and     al, 1
        xor     byte ptr [SYSEX_CHECKSUM], al
        call    sysex_send_byte
        loop    sysex_send_data
        ret
loop_6a8c:
        mov     al, byte ptr [SYSEX_CHECKSUM]
        call    sysex_send_byte
        mov     al, 0f7h
        jmp     sysex_send_byte

sysex_send:
        lodsb
        call    sysex_send_byte
        cmp     byte ptr [si], 80h
        jne     sysex_send
        ret
midi_receive_sample:
        mov     al, 7fh
        out     64h, al
        pushf
        cli
        call    voice_reset_all
        mov     bx, P_5932
        mov     si, bx
        mov     di, P_6DB5
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     cx, 5
        rep movsw
        mov     si, MSG_RECEIVING_SAMPLE_OVER_MIDI
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     dx, 1
        call    lcd_print
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_SYSEX_SEND_DATA
        call    fn_660f_os21
        endif

RUN_LOOP_6ADD macro   {GLOBALSYMBOLS}
        lea     si, [bx+10h]
        mov     di, W_9630
        mov     bp, di
        movsw
        movsw
        mov     byte ptr [W_7CDC], 0ffh
        mov     word ptr [W_95B0], 9ch
        mov     si, P_590A
        call    sysex_send
loop_6add:
        mov     si, W_966E
        mov     di, W_95B4
        movsw
        movsw
        mov     ax, word ptr [bp]
        stosw
        mov     ax, word ptr [bp+2]
        stosw
        call    midi_rx_get
        jb      br_6b52
        mov     cx, 3ch
        mov     byte ptr [SYSEX_CHECKSUM], ch
loop_6af9:
        call    midi_rx_get
        jb      br_6b52
        xor     byte ptr [SYSEX_CHECKSUM], al
        mov     ah, al
        call    midi_rx_get
        jb      br_6b52
        xor     byte ptr [SYSEX_CHECKSUM], al
        mov     si, W_966E
        cmp     byte ptr [bp+3], ch
        jne     br_6b37
        shl     al, 1
        shl     ax, 1
        xor     ah, 80h
        push    ax
        mov     ax, word ptr [si]
        mov     di, ax
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_LOOP_6ADD
        and.w   di, 0fh
        and     ax, 0fff0h
        or      ax, word ptr [si+2]
        ror     ax, 1
        ror     ax, 1
        ror     ax, 1
        ror     ax, 1
        endif

RUN_BR_6B37 macro   {GLOBALSYMBOLS}
        mov     es, ax
        pop     ax
        stosw
br_6b37:
        xor     ax, ax
        mov     es, ax
        sub     word ptr [bp], 1
        sbb     word ptr [bp+2], ax
        add     word ptr [si], 2
        adc     word ptr [si+2], ax
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_6B37
        call    fn_61d2_os21
        endif

RUN_BR_6B52 macro   {GLOBALSYMBOLS}
        loop    loop_6af9
        call    midi_rx_get
        jae     br_6b6e
br_6b52:
        je      br_6bb8
        cmp     byte ptr [bp+3], 0
        jne     br_6b9a
        mov     ax, word ptr [bx+10h]
        sub     ax, word ptr [bp]
        mov     word ptr [bx+1ch], ax
        mov     ax, word ptr [bx+12h]
        sbb     ax, word ptr [bp+2]
        mov     word ptr [bx+1eh], ax
        jmp     br_6b9a
br_6b6e:
        cmp     al, byte ptr [SYSEX_CHECKSUM]
        if      FW_VERSION >= 400
        mov     cx, P_590A
        elseif  FW_VERSION = 210
        mov     cx, P_590A
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        mov     cx, P_590A
        else
        mov     cx, P_590A
        endif
        je      br_6b86
        mov     di, W_966E
        mov     si, W_95B4
        movsw
        movsw
        mov     di, bp
        movsw
        movsw
        if      FW_VERSION >= 400
        mov     cx, 5914h
        elseif  FW_VERSION = 210
        mov     cx, 7961h
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        mov     cx, 12e0h
        else
        mov     cx, 7e70h
        endif
br_6b86:
        mov     si, cx
        call    sysex_send
        mov     word ptr [W_95B0], 9ch
        cmp     byte ptr [bp+3], 0
        jne     br_6b9a
        jmp     loop_6add
br_6b9a:
        mov     byte ptr [B_9611], 0ffh
        call    find_free_slot
        jb      br_6bb8
        mov     byte ptr [bp], 53h
        mov     di, bx
        mov     si, P_5932
        mov     cx, 3ch
        rep movsb
        call    fn_0043
        call    program_sample_name_xref_resolve
br_6bb8:
        popf
        call    lcd_redraw
        jmp     fn_7084
loop_6bbf:
        call    fn_2f1d
        je      br_6be1

midi_rx_get:
        mov     si, word ptr [MIDI_RX_TAIL]
        cmp     si, word ptr [MIDI_RX_HEAD]
        je      loop_6bbf
        lodsb
        cmp     si, MIDI_RX_END
        jne     br_6bd8
        mov     si, MIDI_RX_BUF
br_6bd8:
        mov     word ptr [MIDI_RX_TAIL], si
        test    al, 80h
        jne     br_6be3
        ret
br_6be1:
        xor     al, al
br_6be3:
        stc
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_6B52
        endif

RUN_MIDI_SEND_SAMPLE macro   {GLOBALSYMBOLS}
        ret

midi_send_sample:
        pushf
        cli
        call    voice_reset_all
        in      al, 4ch
        or      al, 80h
        xchg    ah, al
        push    ax
        mov     bx, word ptr [W_9626]
        mov     si, bx
        mov     cx, 5
        mov     di, P_6DDC
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        rep movsw
        mov     si, MSG_SENDING_SAMPLE_OVER_MIDI
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     dx, 1
        call    lcd_print
        mov     si, P_591B
        mov     al, byte ptr [W_9628]
        mov     byte ptr [si+3], al
        mov     ax, 3b9ah
        cwd
        div     word ptr [bx+14h]
        push    ax
        mov     ax, 0c80ch
        div     word ptr [bx+14h]
        pop     dx
        lea     di, [si+6]
        call    fn_6d47
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        mov     word ptr [W_9630], ax
        mov     word ptr [W_9632], dx
        call    fn_6d47
        mov     ax, word ptr [bx+1ch]
        mov     dx, word ptr [bx+1eh]
        push    ax
        push    dx
        cmp     byte ptr [bx+1ah], 4fh
        je      br_6c4a
        sub     ax, word ptr [bx+24h]
        sbb     dx, word ptr [bx+26h]
br_6c4a:
        call    fn_6d47
        pop     dx
        pop     ax
        call    fn_6d47
        mov     al, 1
        cmp     byte ptr [bx+1ah], 41h
        je      br_6c5c
        mov     al, 0
br_6c5c:
        stosb
        call    sysex_send
        mov     word ptr [W_961E], 0
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_MIDI_SEND_SAMPLE
        call    fn_660f_os21
        mov     ax, word ptr [bx+36h]
        mov     word ptr [W_966E], ax
        mov     ax, word ptr [bx+38h]
        mov     word ptr [W_9670], ax
        endif

RUN_BR_6C83 macro   {GLOBALSYMBOLS}
        mov     word ptr [W_95B0], 20h
        call    fn_6d5d
        je      br_6c83
        jmp     br_6d3a
br_6c83:
        push    word ptr [W_966E]
        push    word ptr [W_9670]
        push    word ptr [W_9630]
        push    word ptr [W_9632]
        mov     bp, 0
        mov     di, 1
        mov     byte ptr [SYSEX_CHECKSUM], 0
        mov     al, byte ptr [W_961E]
        and     al, 7fh
        call    sysex_send_byte
        mov     cx, 3ch
loop_6ca9:
        mov     ax, word ptr [W_966E]
        mov     si, ax
        endm

RUN_AFTER_LOOP_6CA9_2 macro   {GLOBALSYMBOLS}
        and.w   si, 0fh
        and     ax, 0fff0h
        or      ax, word ptr [W_9670]
        ror     ax, 1
        ror     ax, 1
        ror     ax, 1
        ror     ax, 1
        mov     ds, ax
        lodsw
        xor     ah, 80h
        xchg    dx, ax
        xor     ax, ax
        mov     ds, ax
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_BR_6C83
        RUN_AFTER_LOOP_6CA9_2
        endif

RUN_AFTER_LOOP_6CA9 macro   {GLOBALSYMBOLS}
        shr     dx, 1
        mov     ax, word ptr [W_9632]
        not     ax
        mov     al, dh
        and     al, ah
        xor     byte ptr [SYSEX_CHECKSUM], al
        call    sysex_send_byte
        xchg    dx, ax
        shr     ax, 1
        and     al, dh
        and     al, 7ch
        xor     byte ptr [SYSEX_CHECKSUM], al
        call    sysex_send_byte
        sub     word ptr [W_9630], di
        sbb     word ptr [W_9632], bp
        mov     si, W_966E
        add     word ptr [si], 2
        adc     word ptr [si+2], bp
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_AFTER_LOOP_6CA9
        call    fn_61d2_os21
        endif

RUN_LOOP_6D21 macro   {GLOBALSYMBOLS}
        loop    loop_6ca9
        mov     al, byte ptr [SYSEX_CHECKSUM]
        call    sysex_send_byte
        mov     word ptr [W_95B0], 9dh
        call    fn_6d5d
        jne     br_6d24
        add     sp, 8
        inc     word ptr [W_961E]
        cmp     byte ptr [B_9633], 0ffh
        je      br_6d3a
loop_6d21:
        jmp     br_6c83
br_6d24:
        pop     word ptr [W_9632]
        pop     word ptr [W_9630]
        pop     word ptr [W_9670]
        pop     word ptr [W_966E]
        jb      br_6d3a
        cmp     al, 7eh
        je      loop_6d21
br_6d3a:
        mov     al, 0f7h
        call    sysex_send_byte
        pop     ax
        call    lcd_command
        popf
        jmp     lcd_redraw

fn_6d47:
        push    ax
        and     al, 7fh
        stosb
        pop     ax
        shl     ax, 1
        rcl     dx, 1
        mov     al, ah
        and     al, 7fh
        stosb
        mov     al, dl
        rol     ax, 1
        and     al, 7fh
        stosb
        ret

fn_6d5d:
        mov     di, P_590A
loop_6d60:
        call    timer_poll
        je      br_6d9d
        mov     si, word ptr [MIDI_RX_TAIL]
        cmp     si, word ptr [MIDI_RX_HEAD]
        je      loop_6d60
        lodsb
        cmp     si, MIDI_RX_END
        jne     br_6d79
        mov     si, MIDI_RX_BUF
br_6d79:
        mov     word ptr [MIDI_RX_TAIL], si
        cmp     di, P_590C
        je      br_6d90
        scasb
        jne     br_6d9d
        cmp     al, 0f7h
        jne     loop_6d60
        mov     al, dl
        cmp     al, 7fh
        clc
        ret
br_6d90:
        mov     dl, al
        scasb
        je      loop_6d60
        cmp     al, 7eh
        je      loop_6d60
        cmp     al, 7dh
        je      loop_6d60
br_6d9d:
        or      byte ptr [W_7CDC], 0ffh
        stc
        ret
MSG_RECEIVING_SAMPLE_OVER_MIDI:
        db      "Receiving sample "
P_6DB5:
        db      "0123456789 over MIDI. "
        db      0a8h, 0feh
MSG_SENDING_SAMPLE_OVER_MIDI:
        db      "Sending sample "
P_6DDC:
        db      "0123456789 over MIDI. "
        db      0aah, 0feh

L_6df4:
        mov     cx, 106h
        call    fn_702f
        jne     br_6e0d

L_6dfc:
        call    voice_reset_all
        mov     si, W_7CEE
        mov     di, DRUM_INPUTS_ON
        mov     cx, 106h
        rep movsb
        if      MODEL = 950
        call    fn_1843_s950
        endif
        jmp     fn_7084
br_6e0d:
        ret

L_6e0e:
        mov     cx, 4
        call    fn_7031
        mov     di, word ptr [W_7CEE]
        mov     cx, 0ffffh
        jmp     loop_704e

L_6e1e:
        mov     cx, 2

L_6e21:
        call    fn_702f
        mov     ax, word ptr [W_7CEE]
        jmp     ax

L_6e29:
        mov     cx, 28h
        call    fn_702f
        jne     br_6e0d

L_6e31:
        call    voice_reset_all
        mov     si, W_7CEE
        mov     dx, di
        mov     di, MIDI_SETTINGS
        mov     cx, 28h
        push    word ptr [di+1dh]
        push    word ptr [di+24h]
        push    di
        rep movsb
        call    find_program
        jb      br_6e54
        mov     word ptr [CUR_PROGRAM], bx
        call    thk_program_sample_tag_scan
br_6e54:
        call    fn_7084
        pop     di
        pop     ax
        pop     dx
        cmp     dl, byte ptr [di+1dh]
        jne     br_6e65
        cmp     ax, word ptr [di+24h]
        jne     br_6e65
        ret
br_6e65:
        jmp     fn_66aa

L_6e68:
        mov     cx, 800h
        call    fn_702f
        call    voice_reset_all
        mov     word ptr [W_95B4], 0
        mov     dx, W_7CEE
        call    find_program
        jb      br_6e85
        call    fn_4d41
        mov     word ptr [W_95B4], ax
br_6e85:
        call    program_sample_tag_scan
        xor     cx, cx
        mov     al, byte ptr [W_9624]
        cbw
        inc     ax
        cmp     byte ptr [B_9576], al
        jb      br_6e9f
        xchg    cx, ax
        mov     al, 50h
        call    fn_6a41
        call    fn_4d41
        xchg    cx, ax
br_6e9f:
        xor     ax, ax
        call    fn_2016
        add     ax, cx
        add     ax, word ptr [W_95B4]
        cmp     byte ptr [B_7D05], al
        jb      br_6eb1
        ret
br_6eb1:
        jcxz    br_6eb6
        call    fn_218d
br_6eb6:
        mov     dx, W_7CEE
        call    find_program
        jb      br_6ec1
        call    fn_218d
br_6ec1:
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_LOOP_6D21
        call    fn_11c7
        endif

RUN_L_6ECD macro   {GLOBALSYMBOLS}
        call    thk_program_sample_tag_scan
        call    program_sample_name_xref_resolve
        jmp     fn_7084

L_6ecd:
        mov     si, P_58D9
        call    fn_7098
        call    sysex_send
        mov     al, 50h
loop_6ed8:
        mov     di, SLOT_TAGS
        mov     bx, SLOTS
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_L_6ECD
        mov     cx, SLOT_COUNT
        endif

RUN_LOOP_6EE3 macro   {GLOBALSYMBOLS}
        mov     dl, 0
loop_6ee3:
        scasb
        jne     br_6f0c
        push    cx
        push    ax
        mov     si, bx
        mov     cx, 0ah
        xor     byte ptr [SYSEX_CHECKSUM], al
        call    sysex_send_byte
        mov     al, dl
        xor     byte ptr [SYSEX_CHECKSUM], al
        call    sysex_send_byte
        inc     dx
loop_6efe:
        lodsb
        and     al, 7fh
        xor     byte ptr [SYSEX_CHECKSUM], al
        call    sysex_send_byte
        loop    loop_6efe
        pop     ax
        pop     cx
br_6f0c:
        add     bx, 46h
        loop    loop_6ee3
        cmp     al, 53h
        mov     al, 53h
        jne     loop_6ed8
        jmp     loop_6a8c

L_6f1a:
        mov     cx, 4
        call    fn_702f
        je      br_6f23
        ret
br_6f23:
        mov     si, P_58E1
        mov     ah, 0f7h
        call    fn_7098
        call    sysex_send
        mov     cx, 4
        mov     si, W_7CEE
        push    si
        call    sysex_send_data
        pop     bx
        mov     si, word ptr [bx]
        mov     cx, word ptr [bx+2]
        call    sysex_send_data
        jmp     loop_6a8c

L_6f44:
        mov     si, P_58E9
        call    fn_7098
        call    sysex_send
        mov     si, DRUM_INPUTS_ON
        mov     cx, 106h
        call    sysex_send_data
        jmp     loop_6a8c

L_6f59:
        mov     si, P_58F1
        call    fn_7098
        call    sysex_send
        mov     si, MIDI_SETTINGS
        mov     cx, 28h
        call    sysex_send_data
        jmp     loop_6a8c

L_6f6e:
        mov     si, P_58F9
        call    fn_7098
        call    sysex_send
        call    program_sample_tag_scan
        mov     ah, byte ptr [W_9624]
        inc     ah
        cmp     al, ah
        jb      br_6f86
        mov     al, ah
br_6f86:
        cbw
        xchg    cx, ax
        mov     al, 50h
        call    fn_6a41
        call    fn_4d41
        mov     si, bx
        mov     cx, 26h
        call    sysex_send_data
        mov     bx, word ptr [bx+12h]
loop_6f9b:
        mov     cx, 46h
        mov     si, bx
        call    sysex_send_data
        mov     bx, word ptr [bx+44h]
        and     bx, bx
        jne     loop_6f9b
        jmp     loop_6a8c

L_6fad:
        mov     si, P_5901
        call    fn_7098
        call    sysex_send
        call    program_sample_tag_scan
        mov     al, byte ptr [W_9624]
        inc     al
        cmp     al, ah
        jb      br_6fc4
        mov     al, ah
br_6fc4:
        cbw
        xchg    cx, ax
        mov     al, 53h
        call    fn_6a41
        mov     si, bx
        mov     cx, 3ch
        call    sysex_send_data
        jmp     loop_6a8c

L_6fd6:
        call    fn_70a6
        mov     byte ptr [B_591A], 0
        ret

L_6fdf:
        call    fn_70a6
        mov     byte ptr [B_591A], 0ffh
        ret
        if      FW_VERSION >= 210

        endif
L_8212_os21:
        mov     cx, 3ch
        call    fn_702f
        je      br_6ff1
        ret
br_6ff1:
        call    voice_reset_all
        call    program_sample_tag_scan
        mov     al, ah
        cmp     al, byte ptr [W_9624]
        jb      br_7002
        mov     al, byte ptr [W_9624]
br_7002:
        cbw
        inc     ax
        xchg    cx, ax
        mov     al, 53h
        call    fn_6a41
        mov     si, W_7CEE
        mov     di, bx
        push    word ptr [bx+28h]
        push    word ptr [bx+36h]
        push    word ptr [bx+38h]
        mov     cx, 3ch
        rep movsb
        pop     word ptr [bx+38h]
        pop     word ptr [bx+36h]
        pop     word ptr [bx+28h]
        call    fn_0043
        call    program_sample_name_xref_resolve
        jmp     fn_7084
        db      90h

fn_702f:
        inc     cx
        inc     cx

fn_7031:
        mov     al, 7fh
        out     64h, al
        mov     byte ptr [B_957D], 0ffh
        mov     byte ptr [W_7CDC], 0ffh
        mov     di, W_7CEE
        mov     byte ptr [SYSEX_CHECKSUM], 0
        test    ah, 80h
        je      br_705b
loop_704c:
        pop     ax
        ret
loop_704e:
        mov     word ptr [W_95B0], 1fh
        call    midi_rx_get
        jb      loop_704c
        mov     ah, al
br_705b:
        mov     word ptr [W_95B0], 1fh
        call    midi_rx_get
        jb      br_7078
        xor     byte ptr [SYSEX_CHECKSUM], al
        xor     byte ptr [SYSEX_CHECKSUM], ah
        xchg    al, ah
        shl     al, 1
        shr     ax, 1
        stosb
        loop    loop_704e
        ret
br_7078:
        je      loop_704c
        cmp     ah, byte ptr [SYSEX_CHECKSUM]
        jne     loop_704c
        cmp     cx, 2
        ret

fn_7084:
        mov     al, 0ffh
        mov     byte ptr [B_9606], al
        mov     byte ptr [B_9611], al
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_LOOP_6EE3
        call    word ptr [MODE_FILL]
        endif

RUN_FN_7098 macro   {GLOBALSYMBOLS}
        mov     byte ptr [B_9611], 0
        jmp     lcd_redraw

fn_7098:
        mov     al, 0
        mov     byte ptr [si+6], al
        mov     byte ptr [SYSEX_CHECKSUM], al
        mov     al, byte ptr [B_7C74]
        mov     byte ptr [si+2], al

fn_70a6:
        mov     byte ptr [W_7CDC], 0ffh
        cmp     ah, 0f7h
        je      br_70b2
        pop     ax
        ret
br_70b2:
        mov     byte ptr [B_957D], 0ffh
        ret
        endm
        if      (MODEL = 900) && (FW_VERSION < 210)
        RUN_FN_7098
P_029E:
        db      06h, 4dh, 00h
        endif
        if      FW_VERSION = 210
DRUM_INPUT:
        db      00h
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
DRUM_INPUT_PTR:
        db      00h, 00h
B_3BBD:
        db      00h
B_3BBE:
        endif
        if      MODEL = 950
        db      00h, 0bch, 0c2h
B_3BC1:
        db      00h
        endif
        if      FW_VERSION = 210
        db      00h
W_3BBF:
        db      22h, 0a9h
B_3BC1:
        db      27h
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
MIDI_LAST_FIELD:
        dw      FLD_CHANNEL
UTILITY_LAST_FIELD:
        dw      FLD_DRUM_INPUT_GAIN_INPUT
        endif
        if      MODEL = 950
SYSEX_02_49_08:
        db      0f0h, 47h, 00h, 02h, 49h, 08h, 0f7h, 80h
SYSEX_02_49_00:
        db      0f0h, 47h, 00h, 02h, 49h, 00h, 0f7h, 80h
SYSEX_08_49_F7:
        db      0f0h, 47h, 00h, 08h, 49h, 0f7h, 0f7h, 80h
SYSEX_06_49_00:
        db      0f0h, 47h, 00h, 06h, 49h, 00h, 0f7h, 80h
        endif

RUN_DRUM_LEVEL_CURVE macro   {GLOBALSYMBOLS}
DRUM_LEVEL_CURVE:
        db      0beh, 0d4h, 0e9h, 0f6h, 0ffh, 06h, 0bh, 10h, 14h, 18h, 1bh, 1eh
        db      " #%')+-/02356789;<=>?@AABCDEFFGHHIJJKLLMNNOOPPQQ"
        db      "RSSTTTUUVVWWXXXYYZZZ[["
        db      5ch, 5ch, 5ch
        db      "]]]^^^___```aaabbbcccddddeeeefffgggghhhhiiiijjjj"
        db      "kkkkkllllmmmmmnnnnnooooopppppqqqqqrrrrrrsssssstt"
        db      "tttuuuuuuuvvvvvvwwwwwwxxxxxxxyyyyyyyzzzzzzz{{{{{"
        db      "{{||||||||~}}}}}}}~~~~~~~~"
        db      7fh
        endm
        if      FW_VERSION = 210
        RUN_DRUM_LEVEL_CURVE
        endif

RUN_SCR_BASIC_MIDI_CHANNEL macro   {GLOBALSYMBOLS}
SCR_BASIC_MIDI_CHANNEL:
        db      "*01  *Basic MIDI channel   *Omni on/off "
        db      "      (01 to 16) 01              ON     "
SCR_MIDI_TEST:
        db      "*02 MIDI    *Channel   *Key   *Velocity "
        db      "    TEST       01     C3# 61     127    "
SCR_RECEIVE:
        db      "*03 RECEIVE  Channel   Key     Velocity "
        db      "    MONITOR    01     C3# 61     127    "
SCR_MIDI_PROG_CHANGE:
        db      "*04 MIDI: *Prog change  on *loudness  on"
        db      " *Pitch wheel range (+/- semitones)  7  "
SCR_CONTROL_BY:
        db      "*05  *Control by MIDI(1) RS232(2) 1     "
        db      " *RS232 Baud rate  9600  ACTUAL: "
B_3E4F:
        db      "  960"
B_3E54:
        db      "0 "
        db      "ON OFF"
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_SCR_BASIC_MIDI_CHANNEL
        endif
        if      MODEL = 950

drum_inputs_poll:
        cmp     word ptr [LCD_ROW1], SCR_DRUM_INPUT_GAIN
        je      br_14be_s950
        jmp     br_1558_s950
br_14be_s950:
        cmp     byte ptr [B_B458_S950], 0
        jne     br_14cf_s950
        mov     si, SYSEX_02_49_08

L_14c8_s950:
        call    sysex_send
        dec     byte ptr [B_B458_S950]
br_14cf_s950:
        mov     bx, word ptr [DRUM_INPUT_PTR]
        mov     al, byte ptr [bx+7]
        cmp     byte ptr [B_3BBE], al
        jae     br_3ed2
        mov     byte ptr [B_3BBE], al
        endif

RUN_DRUM_INPUTS_POLL macro   {GLOBALSYMBOLS}

drum_inputs_poll:
        mov     al, byte ptr [DRUM_INPUTS_ON]
        and     al, byte ptr [B_4403]
        jne     br_3e6f
loop_3e65:
        ret
loop_3e66:
        mov     dx, 3040h
        out     dx, al
        mov     dx, 2040h
        out     dx, al
        ret
br_3e6f:
        test    byte ptr [MOTOR_TIMEOUT], 0ffh
        jne     loop_3e66
        call    tx_pump
        in      al, 40h
        test    al, 80h
        je      loop_3e65
        mov     si, word ptr [W_3BBF]
        mov     dx, word ptr [si+1ah]
        or      dx, 100h
        out     dx, al
        mov     di, P_9F4E
        cmp     si, P_A020
        je      br_3e97
        lea     di, [si+1eh]
br_3e97:
        mov     word ptr [W_3BBF], di
        mov     dx, word ptr [di+1ch]
        out     dx, al
        mov     dx, 1040h
        in      al, dx
        mov     dx, word ptr [si+1ah]
        out     dx, al
        mov     dx, 2040h
        out     dx, al
        mov     bx, DRUM_LEVEL_CURVE
        xlat
        cbw
        add     ax, word ptr [si+12h]
        not     ah
        and     al, ah
        xchg    bx, ax
        cmp     word ptr [LCD_ROW1], SCR_DRUM_INPUT_GAIN
        jne     br_3f2d
        mov     al, byte ptr [si]
        cmp     al, byte ptr [DRUM_INPUT]
        jne     br_3f2d
        cmp     byte ptr [B_3BBE], bl
        jae     br_3ed2
        mov     byte ptr [B_3BBE], bl
        endm
        if      FW_VERSION = 210
        RUN_DRUM_INPUTS_POLL
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
br_3ed2:
        in      al, 3ch
        and     al, 50h
        xchg    byte ptr [B_3BBD], al
        cmp     byte ptr [B_3BBD], al
        endif
        if      MODEL = 950
        je      br_1558_s950
        endif
        if      FW_VERSION = 210
        je      br_3f2d
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        in      al, 4ch
        or      al, 80h
        xchg    dx, ax
        mov     ah, 0c0h
        endif
        if      FW_VERSION = 210
L_1541_os21:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    lcd_command
        mov     al, byte ptr [B_3BBE]
        endif
        if      MODEL = 950
        mov     si, word ptr [DRUM_INPUT_PTR]
        add     al, byte ptr [si+3]
        mov     cl, 51h
        mul     cl
        add     ah, 3
        jae     br_150c_s950
        mov     ah, 0
br_150c_s950:
        mov     bh, ah
        mov     al, byte ptr [si+9]
        add     al, byte ptr [si+3]
        mov     cl, 51h
        mul     cl
        add     ah, 3
        mov     ch, ah
        mov     cl, 3
        cmp     ch, 2bh
        jb      loop_3efb
        mov     ch, 2ah
        endif
        if      FW_VERSION = 210
        mov     cl, 55h
        mul     cl
        mov     bh, ah
        mov     ch, byte ptr [si+4]
        add     ch, 2
        mov     cl, 3
        endif

RUN_LOOP_3EFB macro   {GLOBALSYMBOLS}
loop_3efb:
        mov     ax, 23ffh
        cmp     cl, bh
        jb      br_3f05
        mov     ax, 5420h
br_3f05:
        cmp     cl, ch
        je      br_3f0b
        xchg    ah, al
br_3f0b:
        in      al, 4ch
        and     al, 80h
        jne     br_3f0b
        xchg    al, ah
        out     4ah, al
        inc     cl
        cmp     cl, 2bh
        jne     loop_3efb
        sub     byte ptr [B_3BBE], 1
        jae     br_3f28
        mov     byte ptr [B_3BBE], 0
br_3f28:
        mov     ah, dl
        call    lcd_command
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_LOOP_3EFB
        endif
        if      MODEL = 950
br_1558_s950:
        endif

RUN_BR_3F2D macro   {GLOBALSYMBOLS}
br_3f2d:
        mov     ax, 86h
        cwd
        out     3eh, al
        in      al, 3ch
        xchg    byte ptr [si+6], al
        sub     al, byte ptr [si+6]
        cmp     dx, word ptr [si+16h]
        je      br_3f4d
        sub     word ptr [si+16h], ax
        ja      br_3f4d
        mov     word ptr [si+16h], dx
        pusha
        call    fn_62ac
        popa
br_3f4d:
        cmp     word ptr [si+18h], dx
        je      br_3f67
        cmp     byte ptr [si+5], bl
        jae     br_3f5e
        mov     ax, word ptr [si+10h]
        mov     word ptr [si+18h], ax
loop_3f5d:
        ret
br_3f5e:
        sub     word ptr [si+18h], ax
        ja      loop_3f5d
        mov     word ptr [si+18h], dx
        ret
br_3f67:
        cmp     dx, word ptr [si+14h]
        jne     br_3f9f
        cmp     byte ptr [si+5], bl
        jae     br_3f8c
        mov     byte ptr [si+7], bl
        mov     ax, word ptr [si+0ch]
        mov     word ptr [si+14h], ax
        mov     bx, VOICES
        mov     cx, 8
        mov     dl, byte ptr [si]
loop_3f82:
        test    byte ptr [bx], 1fh
        jne     br_3f8d
loop_3f87:
        endm
        if      FW_VERSION = 210
        RUN_BR_3F2D
        add     bx, 37h
        endif

RUN_BR_3F8C macro   {GLOBALSYMBOLS}
        loop    loop_3f82
br_3f8c:
        ret
br_3f8d:
        cmp     byte ptr [bx+1], dl
        jne     loop_3f87
        mov     byte ptr [bx], 2
        mov     byte ptr [bx+5], ch
        mov     word ptr [bx+0fh], 0ffffh
        jmp     loop_3f87
br_3f9f:
        cmp     byte ptr [si+7], bl
        jae     br_3fa7
        mov     byte ptr [si+7], bl
br_3fa7:
        sub     word ptr [si+14h], ax
        jbe     br_3fad
        ret
br_3fad:
        mov     word ptr [si+14h], dx
        cmp     word ptr [si+16h], dx
        je      br_3fba
        push    si
        call    fn_62ac
        pop     si
br_3fba:
        mov     ax, word ptr [si+0eh]
        mov     word ptr [si+16h], ax
        mov     ax, word ptr [si+10h]
        mov     word ptr [si+18h], ax
        mov     di, word ptr [TX_HEAD]
        mov     al, 90h
        or      al, byte ptr [si+1]
        cmp     al, byte ptr [B_7C55]
        je      br_3fe2
        mov     byte ptr [B_7C55], al
        stosb
        cmp     di, MIDI_RX_BUF
        jne     br_3fe2
        mov     di, P_B2D6
br_3fe2:
        mov     al, byte ptr [si+2]
        stosb
        cmp     di, MIDI_RX_BUF
        jne     br_3fef
        mov     di, P_B2D6
br_3fef:
        mov     al, byte ptr [si+7]
        inc     al
        jns     br_3ff8
        mov     al, 7fh
br_3ff8:
        stosb
        cmp     di, MIDI_RX_BUF
        jne     br_4002
        mov     di, P_B2D6
br_4002:
        mov     word ptr [TX_HEAD], di
        mov     ah, byte ptr [si]
        mov     byte ptr [B_5909], ah
        call    fn_6174
        mov     byte ptr [B_5909], 80h
        ret
br_4015:
        mov     cx, 8
        mov     dx, 1140h
loop_401b:
        out     dx, al
        add     dx, 200h
        loop    loop_401b
        endm
        if      FW_VERSION = 210
        RUN_BR_3F8C
        endif

RUN_MIDI_FILL macro   {GLOBALSYMBOLS}
        ret

midi_fill:
        mov     al, 63h
        xchg    byte ptr [W_9582], al
        push    ax
        mov     bx, MIDI_SETTINGS
        mov     al, byte ptr [bx+1bh]
        and     ax, 0fh
        inc     ax
        mov     bp, FLD_BASIC_MIDI_CHANNEL
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_MIDI_FILL
        endif
        if      FW_VERSION = 210

L_4037:
        endif

RUN_BR_4094 macro   {GLOBALSYMBOLS}
        call    put_field_byte
        mov     bp, FLD_OMNI_ON_OFF
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        test    byte ptr [bx+1bh], 80h
        call    put_field_onoff
        mov     ax, word ptr [bx+14h]
        mov     bp, FLD_CHANNEL
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_value
        mov     ax, word ptr [bx+16h]
        mov     bp, FLD_KEY
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_value
        mov     ax, word ptr [bx+18h]
        mov     bp, FLD_MIDI_TEST_VELOCITY
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_value
        mov     al, byte ptr [bx+23h]
        cbw
        mov     bp, FLD_PITCH_WHEEL_RANGE
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_value
        mov     bp, FLD_MIDI_PROG_CHANGE_LOUDNESS
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        test    byte ptr [bx+1ch], 0ffh
        call    put_field_onoff
        mov     bp, FLD_PROG_CHANGE
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        test    byte ptr [bx+1eh], 0ffh
        call    put_field_onoff
        mov     al, byte ptr [bx+1dh]
        cbw
        mov     bp, FLD_CONTROL_BY_1
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_value
        mov     ax, word ptr [bx+24h]
        and     ax, ax
        jne     br_4094
        mov     ax, 3c0h
        mov     word ptr [bx+24h], ax
br_4094:
        mov     bp, FLD_RS232_BAUD_RATE
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_value
        call    fn_40a2
        pop     ax
        mov     byte ptr [W_9582], al
        ret

fn_40a2:
        call    fn_2bf3
        cmp     ax, 8
        xchg    cx, ax
        jb      br_40be
        mov     dx, 7
        mov     ax, 0a120h
        mov     bp, FLD_CONTROL_BY_3
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     byte ptr [B_3E4F], 20h
loop_40b9:
        div     cx
        jmp     put_field_value
br_40be:
        mov     dx, 0
        mov     ax, 0c350h
        mov     bp, FLD_CONTROL_BY_2
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     byte ptr [B_3E54], 30h
        jmp     loop_40b9
        db      00h, 00h
FIELDS_BASIC_MIDI_CHANNEL:
        dw      8000h+FLD_BASIC_MIDI_CHANNEL, FLD_OMNI_ON_OFF, 8000h+FLD_CHANNEL, FLD_KEY
        dw      FLD_MIDI_TEST_VELOCITY, 8000h+FLD_RECEIVE_CHANNEL, 8000h+FLD_PROG_CHANGE, FLD_MIDI_PROG_CHANGE_LOUDNESS
        dw      FLD_PITCH_WHEEL_RANGE, 8000h+FLD_CONTROL_BY_1, FLD_RS232_BAUD_RATE, 0
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_BR_4094
        endif
        if      FW_VERSION = 210
        db      00h, 00h
        endif

RUN_FLD_BASIC_MIDI_CHANNEL macro   {GLOBALSYMBOLS}
FLD_BASIC_MIDI_CHANNEL:
        FIELD   SCR_BASIC_MIDI_CHANNEL, 5, 58, 60, FT_NUM, 0, set_basic_midi_channel, 1, 1, 16
FLD_OMNI_ON_OFF:
        FIELD   SCR_BASIC_MIDI_CHANNEL, 27, 74, 75, FT_KEYS+FT_ONOFF, 0, set_omni, 0, KEYS_OMNI_ON_OFF, 2
KEYS_OMNI_ON_OFF:
        db      2bh, 2dh
FLD_CHANNEL:
        FIELD   SCR_MIDI_TEST, 12, 56, 58, FT_NUM, 0, set_midi_test_channel, 1, 1, 16
FLD_KEY:
        FIELD   SCR_MIDI_TEST, 23, 67, 70, FT_NOTE, 0, set_midi_test_key, 60, 24, 127
FLD_MIDI_TEST_VELOCITY:
        FIELD   SCR_MIDI_TEST, 30, 74, 77, FT_NUM, 0, set_midi_test_velocity, 127, 1, 127
FLD_RECEIVE_CHANNEL:
        FIELD   SCR_RECEIVE, 0, 56, 58, FT_NUM, 0, field_nop, 99, 0, 17
FLD_RECEIVE_KEY:
        FIELD   SCR_RECEIVE, 0, 67, 70, FT_NOTE, 0, field_nop, 99, 24, 127
FLD_RECEIVE_VELOCITY:
        FIELD   SCR_RECEIVE, 0, 74, 77, FT_NUM, 0, field_nop, 999, 1, 127
FLD_MIDI_PROG_CHANGE_LOUDNESS:
        FIELD   SCR_MIDI_PROG_CHANGE, 27, 38, 39, FT_KEYS+FT_ONOFF, 0, set_midi_loudness, 0, KEYS_OMNI_ON_OFF, 2
FLD_PROG_CHANGE:
        FIELD   SCR_MIDI_PROG_CHANGE, 10, 24, 25, FT_KEYS+FT_ONOFF, 0, set_midi_prog_change, 0, KEYS_OMNI_ON_OFF, 2
FLD_PITCH_WHEEL_RANGE:
        FIELD   SCR_MIDI_PROG_CHANGE, 41, 77, 79, FT_NUM, 0, set_pitch_wheel_range, 8, 1, 12
FLD_CONTROL_BY_1:
        FIELD   SCR_CONTROL_BY, 5, 35, 36, FT_NUM, 0, set_control_by, 1, 1, 2
FLD_RS232_BAUD_RATE:
        FIELD   SCR_CONTROL_BY, 41, 59, 63, FT_NUM, 0, set_rs232_baud_rate, 960, 30, 9600
FLD_CONTROL_BY_2:
        FIELD   SCR_CONTROL_BY, 0, 74, 79, FT_NUM, 0, 0, 960, 30, 30000
FLD_CONTROL_BY_3:
        FIELD   SCR_CONTROL_BY, 0, 75, 80, FT_NUM+FT_UNSIGNED, 0, 0, 0, 300, 0ffffh

set_basic_midi_channel:                             ; the handler of the record before it
        mov     ax, word ptr [bp+9]
        dec     ax
        lea     bx, [MIDI_BASIC_CHANNEL]
        mov     ah, byte ptr [bx]
        and     ah, 80h
        or      al, ah
        cmp     al, byte ptr [bx]
        jne     loop_41e1
        ret
loop_41e1:
        mov     byte ptr [bx], al
br_41e3:
        pushf
        cli

L_41e5:
        call    voice_reset_all
        call    thk_program_sample_tag_scan
        call    fn_66aa
        popf
        ret

set_omni:
        lea     bx, [MIDI_BASIC_CHANNEL]
        mov     ah, byte ptr [bx]
        and     ah, 7fh
        mov     al, byte ptr [bp+9]
        and     al, 80h
        or      al, ah
        cmp     al, byte ptr [bx]
        jne     loop_41e1
        ret

set_midi_test_channel:
        call    midi_field
        mov     byte ptr [bx+14h], al
        jmp     br_41e3

set_midi_test_key:
        call    midi_field
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_FLD_BASIC_MIDI_CHANNEL
        endif
        if      MODEL = 950
        mov     byte ptr [bx+16h], al
        jmp     br_41e3
        endif
        if      FW_VERSION = 210
        jmp     loop_1d2a
        endif

RUN_SET_MIDI_TEST_VELOCITY macro   {GLOBALSYMBOLS}

set_midi_test_velocity:
        call    midi_field
        mov     byte ptr [bx+18h], al
        ret

set_midi_loudness:
        call    midi_field
        mov     byte ptr [bx+1ch], al
        ret

set_midi_prog_change:
        call    midi_field
        mov     byte ptr [bx+1eh], al
        ret

set_pitch_wheel_range:
        call    midi_field
        mov     byte ptr [bx+23h], al
        ret

set_control_by:
        call    midi_field
        cmp     byte ptr [bx+1dh], al
        mov     byte ptr [bx+1dh], al
        jne     br_424d
        ret

set_rs232_baud_rate:
        call    midi_field
        cmp     word ptr [bx+24h], ax
        jne     br_4244
        ret
br_4244:
        mov     word ptr [bx+24h], ax

L_4247:
        call    fn_40a2
        call    lcd_redraw

br_424d:
        call    voice_reset_all
        jmp     fn_66aa

midi_field:
        mov     ax, word ptr [bp+9]
        mov     bx, MIDI_SETTINGS
        ret
field_nop:                             ; the handler of a field that needs none
        ret

mode_midi:
        mov     word ptr [MODE_SP], sp
        mov     word ptr [FIELD_RECENT], FLD_BASIC_MIDI_CHANNEL
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_SET_MIDI_TEST_VELOCITY
        mov     word ptr [LAST_FIELD_PTR], MIDI_LAST_FIELD
        mov     ax, word ptr [MIDI_LAST_FIELD]
        mov     word ptr [FIELD_PREVIOUS], ax
        endif

RUN_L_4271 macro   {GLOBALSYMBOLS}

L_4271:
        call    fn_29a6
        mov     word ptr [MODE_FILL], midi_fill
        call    midi_fill
        mov     ax, FIELDS_BASIC_MIDI_CHANNEL
        jmp     menu_navigation_loop

midi_receive_monitor:
        mov     al, byte ptr [TIMER_TICKS]
        cmp     al, byte ptr [B_3BC1]
        jne     br_428d
loop_428c:
        ret
br_428d:
        mov     byte ptr [B_3BC1], al
        cmp     word ptr [FIELD_LIST], FIELDS_BASIC_MIDI_CHANNEL
        jne     br_42be
        cmp     byte ptr [SCR_RECEIVE], 0
        jne     loop_428c
        mov     ax, word ptr [W_95AA]
        inc     ax
        mov     bp, FLD_RECEIVE_CHANNEL
        call    update_field_value
        mov     ax, word ptr [W_959A]
        mov     bp, FLD_RECEIVE_KEY
        call    update_field_value
        mov     ax, word ptr [W_95B2]
        mov     bp, FLD_RECEIVE_VELOCITY
        call    update_field_value
        jmp     loop_2ec3
br_42be:
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_L_4271
        cmp     word ptr [FIELD_LIST], FIELDS_SELECT_COPY_SAMPLE
        endif

RUN_LOOP_42CE macro   {GLOBALSYMBOLS}
        jne     br_42e6
        shl     byte ptr [B_956A], 1
        jp      br_42e6
        mov     bl, 2
loop_42ce:
        jns     br_42d2
        mov     bl, 20h
br_42d2:
        in      al, 4ch
        or      al, 80h
        xchg    dx, ax
        mov     ah, 0c0h
        call    lcd_command
        mov     ah, bl
        call    lcd_put_char
        mov     ah, dl
        jmp     lcd_command
br_42e6:
        cmp     word ptr [FIELD_LIST], P_5063
        jne     br_42f6
        shl     byte ptr [B_9569], 1
        mov     bl, 1
        jnp     loop_42ce
br_42f6:
        ret

update_field_value:
        cmp     ax, word ptr [bp+9]
        je      br_430c
        mov     word ptr [bp+9], ax
        mov     di, word ptr [bp]
        dec     di
        mov     dh, byte ptr [bp+3]
        mov     dl, byte ptr [bp+4]
        jmp     loop_2051
br_430c:
        ret
        if      MODEL = 950

fn_1843_s950:
        mov     si, SYSEX_08_49_F7
        call    sysex_send
        mov     cx, 8
        mov     si, P_9F4E
loop_184f_s950:
        call    br_2bde
        loop    loop_184f_s950
        ret

br_2bde:
        mov     al, 0f0h
        call    sysex_send_byte
        mov     al, 47h
        call    sysex_send_byte
        mov     al, 0
        call    sysex_send_byte
        mov     al, 3
        call    sysex_send_byte
        mov     al, 49h
        call    sysex_send_byte
        mov     al, byte ptr [si]
        call    sysex_send_byte
        mov     al, byte ptr [si+1]
        call    sysex_send_byte
        mov     al, byte ptr [si+2]
        call    sysex_send_byte
        mov     al, byte ptr [si+3]
        call    sysex_send_byte
        cmp     byte ptr [si+8], 0
        jne     br_1896_s950
        mov     byte ptr [si+9], 19h
        mov     byte ptr [si+0ah], 2
        dec     byte ptr [si+8]
br_1896_s950:
        mov     al, byte ptr [si+9]
        call    sysex_send_byte
        mov     al, byte ptr [si+0ah]
        call    sysex_send_byte
        mov     al, byte ptr [si+0ch]
        call    sysex_send_byte
        mov     al, byte ptr [si+10h]
        call    sysex_send_byte
        mov     al, byte ptr [si+0eh]
        and     al, 7fh
        call    sysex_send_byte
        mov     ax, word ptr [si+0eh]
        add     ax, ax
        mov     al, ah
        call    sysex_send_byte
        mov     al, 0f7h
        call    sysex_send_byte
        add     si, 1eh
        ret
        endif

mode_master_tuning:
        mov     word ptr [MODE_SP], sp
        call    fn_29a6
        mov     word ptr [MODE_FILL], L_4332
        mov     word ptr [FIELD_RECENT], FLD_MASTER_TUNING
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_LOOP_42CE
        mov     word ptr [FIELD_PREVIOUS], FLD_MASTER_TUNING
        endif
        if      MODEL = 950
        mov     word ptr [LAST_FIELD_PTR], 194bh
        endif

RUN_SET_MASTER_TUNING macro   {GLOBALSYMBOLS}
        mov     ax, P_4385
        jmp     menu_navigation_loop

set_master_tuning:
        mov     ax, word ptr [bp+9]
        mov     word ptr [MASTER_TUNING], ax

L_4332:
        ret
SCR_MASTER_TUNING:
        db      "             MASTER TUNING              "
        db      "                  +00                   "
        db      00h, 00h
P_4385:
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_SET_MASTER_TUNING
        endif
        if      MODEL = 950
        db      4dh, 19h, 00h, 00h, 4dh, 19h
        endif
        if      FW_VERSION = 210
        dw      FLD_MASTER_TUNING
        db      00h, 00h
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
FLD_MASTER_TUNING:
        FIELD   SCR_MASTER_TUNING, 99, 59, 62, FT_NUM+FT_SIGNED, 0, set_master_tuning, 0, -16, 16

mode_utility:
        mov     word ptr [MODE_SP], sp

L_439c:
        call    fn_29a6
        endif
        if      MODEL = 950
        call    fn_66aa
        mov     word ptr [MODE_FILL], utility_fill
        call    utility_fill
        mov     si, SYSEX_08_49_F7
        call    sysex_send
        mov     si, SYSEX_02_49_00
        call    sysex_send
        mov     byte ptr [B_B458_S950], 0
        mov     byte ptr [B_B413_S950], 0
        mov     word ptr [FIELD_RECENT], FLD_DRUM_INPUT_MIDI_INPUT
        endif
        if      FW_VERSION = 210
        cmp     byte ptr [B_4403], 0
        je      br_43cd
        mov     word ptr [MODE_FILL], utility_fill
        call    utility_fill
        mov     word ptr [FIELD_RECENT], FLD_DRUM_INPUTS
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     word ptr [LAST_FIELD_PTR], UTILITY_LAST_FIELD
        mov     ax, word ptr [UTILITY_LAST_FIELD]
        mov     word ptr [FIELD_PREVIOUS], ax
        endif
        if      MODEL = 950
        mov     ax, FIELDS_ME35T
        jmp     menu_navigation_loop
        db      00h, 00h
FIELDS_ME35T:
        dw      8000h+FLD_SEND_SETTINGS, FLD_READ_SETTINGS, 8000h+FLD_DRUM_INPUT_MIDI_INPUT, FLD_MIDI
        dw      FLD_PITCH, FLD_ONTIME, FLD_V_CURVE, 8000h+FLD_DRUM_INPUT_TIMES_INPUT
        dw      FLD_CAPTURE_TIME, FLD_RECOVERY_TIME, 8000h+FLD_DRUM_INPUT_GAIN_INPUT, FLD_GAIN
        dw      FLD_TRIG_THRESH, 0
SCR_ME35T:
        db      "*01  ME35T Audio trigger to MIDI unit   "
        db      "   *Send settings _    *Read settings _ "
FLD_SEND_SETTINGS:
        FIELD   SCR_ME35T, 43, 59, 60, FT_KEYS, 0, L_4695, 0, KEYS_SEND_SETTINGS, 1
KEYS_SEND_SETTINGS:
        db      0dh
FLD_READ_SETTINGS:
        FIELD   SCR_ME35T, 63, 79, 80, FT_KEYS, 0, read_me35t_settings, 0, KEYS_SEND_SETTINGS, 1
SCR_DRUM_INPUT_MIDI:
        db      "*02 *Input *MIDI *Pitch *OnTime *V-curve"
        db      "       1     01  C3   60  xxxx      x   "
FLD_DRUM_INPUT_MIDI_INPUT:
        FIELD   SCR_DRUM_INPUT_MIDI, 4, 48, 49, FT_NUM, 0, select_drum_input, 1, 1, 8

FLD_MIDI:
        FIELD   SCR_DRUM_INPUT_MIDI, 11, 54, 56, FT_NUM, 0, set_drum_midi_channel, 1, 1, 16
FLD_PITCH:
        FIELD   SCR_DRUM_INPUT_MIDI, 17, 62, 65, FT_NOTE, 0, set_drum_pitch, 60, 24, 127
FLD_ONTIME:
        FIELD   SCR_DRUM_INPUT_MIDI, 24, 67, 71, FT_NUM, 0, set_drum_on_time, 30, 1, 4000
FLD_V_CURVE:
        FIELD   SCR_DRUM_INPUT_MIDI, 32, 77, 78, FT_NUM, 0, set_drum_v_curve, 1, 1, 8
        endif

RUN_BR_43CD macro   {GLOBALSYMBOLS}
        mov     ax, FIELDS_DRUM_INPUTS
        mov     word ptr [IDLE_HOOK], idle_tasks_drums
        jmp     loop_2223
br_43cd:
        mov     word ptr [MODE_FILL], L_43e5
        mov     word ptr [FIELD_RECENT], P_4772
        mov     word ptr [FIELD_PREVIOUS], P_4772
        mov     ax, P_476E
        jmp     menu_navigation_loop

L_43e5:
        ret
        db      00h, 00h
FIELDS_DRUM_INPUTS:
        dw      8000h+FLD_DRUM_INPUTS, FLD_SENSITIVITY, 8000h+FLD_DRUM_INPUT_MIDI_INPUT, FLD_MIDI_CH
        dw      FLD_PITCH, FLD_ON_TIME, 8000h+FLD_DRUM_INPUT_TIMES_INPUT, FLD_CAPTURE_TIME
        dw      FLD_RECOVERY_TIME, 8000h+FLD_DRUM_INPUT_GAIN_INPUT, FLD_GAIN, FLD_TRIG_THRESH
        dw      0
        db      00h
B_4403:
        endm
        if      FW_VERSION = 210
        RUN_BR_43CD
        db      00h
        endif

RUN_SCR_DRUM_INPUTS macro   {GLOBALSYMBOLS}
SCR_DRUM_INPUTS:
        db      "*01   *DRUM INPUTS    *Sensitivity      "
        db      "           ON       low(1), high(2) 2   "
FLD_DRUM_INPUTS:
        FIELD   SCR_DRUM_INPUTS, 6, 52, 53, FT_KEYS+FT_ONOFF, 0, set_drum_inputs, 0, KEYS_DRUM_INPUTS, 2
KEYS_DRUM_INPUTS:
        db      2bh, 2dh
FLD_SENSITIVITY:
        FIELD   SCR_DRUM_INPUTS, 22, 77, 78, FT_NUM, 0, set_drum_sensitivity, 2, 1, 2
SCR_DRUM_INPUT_MIDI:
        db      "*02  *Input  *MIDI ch  *Pitch  *On time "
        db      "        1       01     C3  60    XXXX   "
FLD_DRUM_INPUT_MIDI_INPUT:
        FIELD   SCR_DRUM_INPUT_MIDI, 5, 49, 50, FT_NUM, 0, select_drum_input, 1, 1, 8
        endm
        if      FW_VERSION = 210
        RUN_SCR_DRUM_INPUTS
FLD_MIDI_CH:
        FIELD   SCR_DRUM_INPUT_MIDI, 13, 57, 59, FT_NUM, 0, set_drum_midi_channel, 1, 1, 16
FLD_PITCH:
        FIELD   SCR_DRUM_INPUT_MIDI, 23, 67, 70, FT_NOTE, 0, set_drum_pitch, 60, 24, 127
FLD_ON_TIME:
        FIELD   SCR_DRUM_INPUT_MIDI, 31, 74, 78, FT_NUM, 0, set_drum_on_time, 30, 1, 9999
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
SCR_DRUM_INPUT_TIMES:
        db      "*03 *Input *Capture time *Recovery time "
        db      "       1       30 mS         20 mS      "
FLD_DRUM_INPUT_TIMES_INPUT:
        FIELD   SCR_DRUM_INPUT_TIMES, 4, 48, 49, FT_NUM, 0, select_drum_input, 1, 1, 8
FLD_CAPTURE_TIME:
        endif
        if      MODEL = 950
        FIELD   SCR_DRUM_INPUT_TIMES, 11, 56, 58, FT_NUM, 0, set_drum_capture_time, 3, 0, 20
FLD_RECOVERY_TIME:
        FIELD   SCR_DRUM_INPUT_TIMES, 25, 70, 72, FT_NUM, 0, set_drum_recovery_time, 20, 1, 63
        endif
        if      FW_VERSION = 210
        FIELD   SCR_DRUM_INPUT_TIMES, 11, 56, 58, FT_NUM, 0, set_drum_capture_time, 3, 1, 20
FLD_RECOVERY_TIME:
        FIELD   SCR_DRUM_INPUT_TIMES, 25, 70, 72, FT_NUM, 0, set_drum_recovery_time, 20, 1, 99
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
SCR_DRUM_INPUT_GAIN:
        db      "*04 *Input 1  *Gain 50  *Trig thresh 20 "
        db      "                                        "
FLD_DRUM_INPUT_GAIN_INPUT:
        FIELD   SCR_DRUM_INPUT_GAIN, 4, 12, 13, FT_NUM, 0, select_drum_input, 1, 1, 8
FLD_GAIN:
        endif
        if      MODEL = 950
        FIELD   SCR_DRUM_INPUT_GAIN, 14, 21, 23, FT_NUM, 0, set_drum_gain, 50, 0, 99
FLD_TRIG_THRESH:
        FIELD   SCR_DRUM_INPUT_GAIN, 24, 38, 40, FT_NUM, 0, set_drum_trig_thresh, 20, 0, 99

utility_fill:
        endif
        if      FW_VERSION = 210
        FIELD   SCR_DRUM_INPUT_GAIN, 14, 21, 23, FT_NUM, 0, set_drum_gain, 50, 1, 99
FLD_TRIG_THRESH:
        FIELD   SCR_DRUM_INPUT_GAIN, 24, 38, 40, FT_NUM, 0, set_drum_trig_thresh, 20, 1, 40

utility_fill:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     al, 63h
        xchg    byte ptr [W_9582], al
        push    ax
        endif

RUN_L_77CF_V12A macro   {GLOBALSYMBOLS}
        test    byte ptr [DRUM_INPUTS_ON], 0ffh
        mov     bp, FLD_DRUM_INPUTS
        if      (MODEL = 900) && (FW_VERSION < 210)

L_77cf_v12a:
        endif
        call    put_field_onoff
        mov     al, byte ptr [DRUM_SENSITIVITY]
        out     40h, al
        inc     al
        mov     bp, FLD_SENSITIVITY
        endm
        if      FW_VERSION = 210
        RUN_L_77CF_V12A

L_4616:
        call    put_field_byte
        endif

RUN_AFTER_L_4616  macro   {GLOBALSYMBOLS}
        mov     al, byte ptr [DRUM_INPUT]
        push    ax
        mov     cl, 1eh
        mul     cl
        mov     bx, P_9F4E
        add     bx, ax
        mov     word ptr [DRUM_INPUT_PTR], bx
        pop     ax
        inc     ax
        push    ax
        mov     bp, FLD_DRUM_INPUT_MIDI_INPUT
        call    put_field_byte
        pop     ax
        push    ax
        mov     bp, FLD_DRUM_INPUT_TIMES_INPUT
        call    put_field_byte
        pop     ax
        mov     bp, FLD_DRUM_INPUT_GAIN_INPUT
        call    put_field_byte
        mov     al, byte ptr [bx+1]
        inc     ax
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_AFTER_L_4616
        endif
        if      MODEL = 950
        mov     bp, FLD_MIDI
        endif
        if      FW_VERSION = 210
        mov     bp, FLD_MIDI_CH
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    put_field_byte
        mov     al, byte ptr [bx+2]
        mov     bp, FLD_PITCH
        call    put_field_byte
        mov     ax, word ptr [bx+0eh]
        shr     ax, 1
        shr     ax, 1
        endif
        if      MODEL = 950
        mov     bp, FLD_ONTIME
        call    put_field_value
        mov     al, byte ptr [bx+0ah]
        inc     ax
        mov     bp, FLD_V_CURVE
        call    put_field_byte
        endif
        if      FW_VERSION = 210
        mov     bp, FLD_ON_TIME
        call    put_field_value
        endif

RUN_AFTER_L_4616_2  macro   {GLOBALSYMBOLS}
        mov     ax, word ptr [bx+0ch]
        shr     ax, 1
        shr     ax, 1
        mov     bp, FLD_CAPTURE_TIME
        call    put_field_value
        mov     ax, word ptr [bx+10h]
        shr     ax, 1
        shr     ax, 1
        mov     bp, FLD_RECOVERY_TIME
        call    put_field_value
        mov     al, byte ptr [bx+3]
        mov     bp, FLD_GAIN
        call    put_field_byte
        endm
        if      (FW_VERSION = 210) || (MODEL = 950)
        RUN_AFTER_L_4616_2
        endif
        if      MODEL = 950
        cmp     byte ptr [bx+8], 0
        jne     br_1c49_s950
        mov     byte ptr [bx+9], 19h
        dec     byte ptr [bx+8]
br_1c49_s950:
        mov     al, byte ptr [bx+9]
        endif
        if      FW_VERSION = 210
        mov     al, byte ptr [bx+4]
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     bp, FLD_TRIG_THRESH
        call    put_field_byte
        pop     word ptr [W_9582]
        jmp     lcd_redraw
        endif
        if      MODEL = 950

L_4695:
        call    take_enter
        mov     si, MSG_SENDING_TO_ME35T
        mov     dl, 1
        call    lcd_print
        call    fn_1843_s950
loop_1c67_s950:
        call    idle_tasks
        cmp     byte ptr [KEY_MATRIX_LAST], 0ffh
        jne     loop_1c67_s950
        jmp     lcd_redraw
MSG_RECEIVING_FROM_ME35T:
        db      "Receiving from ME35T "
        db      0bah, 0feh
MSG_SENDING_TO_ME35T:
        db      "Sending to ME35T "
        db      0beh, 0feh

read_me35t_settings:
        call    take_enter
        mov     byte ptr [B_B413_S950], 0ffh
        mov     al, 0
loop_1ca8_s950:
        mov     si, SYSEX_06_49_00
        mov     byte ptr [si+5], al
        call    sysex_send
        ret

L_1cb2_s950:
        pusha
        mov     si, MSG_RECEIVING_FROM_ME35T
        mov     dl, 1
        call    lcd_print
        popa
        cmp     ah, 8
        jb      br_1cc4_s950
        jmp     br_67b1
br_1cc4_s950:
        mov     al, ah
        mov     cl, 1eh
        mul     cl
        add     ax, P_9F4E
        mov     word ptr [W_B51E_S950], ax
        mov     word ptr [si], L_1cd5_s950
        ret

L_1cd5_s950:
        mov     bx, word ptr [W_B51E_S950]
        mov     byte ptr [bx+1], ah
        mov     word ptr [si], L_1ce1_s950
        ret

L_1ce1_s950:
        mov     bx, word ptr [W_B51E_S950]
        mov     byte ptr [bx+2], ah
        mov     word ptr [si], L_1ced_s950
        ret

L_1ced_s950:
        mov     bx, word ptr [W_B51E_S950]
        mov     byte ptr [bx+3], ah
        mov     word ptr [si], L_1cf9_s950
        ret

L_1cf9_s950:
        mov     bx, word ptr [W_B51E_S950]
        mov     byte ptr [bx+9], ah
        mov     word ptr [si], L_1d05_s950
        ret

L_1d05_s950:
        mov     bx, word ptr [W_B51E_S950]
        mov     byte ptr [bx+0ah], ah
        mov     word ptr [si], L_1d11_s950
        ret

L_1d11_s950:
        mov     bx, word ptr [W_B51E_S950]
        mov     byte ptr [bx+0ch], ah
        mov     word ptr [si], L_1d1d_s950
        ret

L_1d1d_s950:
        mov     bx, word ptr [W_B51E_S950]
        mov     byte ptr [bx+10h], ah
        mov     word ptr [si], L_1d29_s950
        ret

L_1d29_s950:
        mov     bx, word ptr [W_B51E_S950]
        mov     byte ptr [bx+0eh], ah
        mov     word ptr [si], L_1d35_s950
        ret

L_1d35_s950:
        mov     word ptr [si], L_1d48_s950
        mov     bx, word ptr [W_B51E_S950]
        mov     al, byte ptr [bx+0eh]
        add     al, al
        shr     ax, 1
        mov     word ptr [bx+0eh], ax
        ret

L_1d48_s950:
        cmp     ah, 0f7h
        je      br_1d50_s950
        jmp     br_67b1
br_1d50_s950:
        mov     ax, word ptr [W_B51E_S950]
        cmp     ax, word ptr [DRUM_INPUT_PTR]
        jne     br_1d5c_s950

L_1d59_s950:
        call    utility_fill

br_1d5c_s950:
        mov     bx, word ptr [W_B51E_S950]
        mov     al, byte ptr [bx]
        cmp     al, 7
        je      br_1d6a_s950
        inc     ax
        jmp     loop_1ca8_s950
br_1d6a_s950:
        mov     byte ptr [B_B413_S950], 0
        jmp     loop_1c67_s950
        endif

RUN_SET_DRUM_INPUTS macro   {GLOBALSYMBOLS}

set_drum_inputs:
        call    fn_470d
        mov     al, byte ptr [bp+9]
        mov     byte ptr [DRUM_INPUTS_ON], al
        jmp     br_4015

set_drum_sensitivity:
        mov     ax, word ptr [bp+9]
        dec     ax
        out     40h, al
        mov     byte ptr [DRUM_SENSITIVITY], al
        jmp     br_4015
        endm
        if      FW_VERSION = 210
        RUN_SET_DRUM_INPUTS
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

select_drum_input:
        mov     ax, word ptr [bp+9]
        dec     ax
        mov     byte ptr [DRUM_INPUT], al
        jmp     utility_fill

set_drum_midi_channel:
        call    drum_field
        call    fn_470d
        dec     ax
        mov     byte ptr [bx+1], al
        endif
        if      MODEL = 950
        jmp     br_1d9d_s950
        endif
        if      FW_VERSION = 210
        ret
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

set_drum_pitch:
        call    drum_field
        call    fn_470d
        mov     byte ptr [bx+2], al
        endif
        if      MODEL = 950
        jmp     br_1d9d_s950
        endif
        if      FW_VERSION = 210
        ret
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

set_drum_on_time:
        call    drum_field
        shl     ax, 1
        shl     ax, 1
        mov     word ptr [bx+0eh], ax
        endif
        if      MODEL = 950
br_1d9d_s950:
        mov     si, bx
        jmp     br_2bde

set_drum_v_curve:
        call    drum_field
        dec     ax
        mov     byte ptr [bx+0ah], al
        jmp     br_1d9d_s950
        endif
        if      FW_VERSION = 210
        ret
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

set_drum_capture_time:
        call    drum_field
        shl     ax, 1
        shl     ax, 1
        mov     word ptr [bx+0ch], ax
        endif
        if      MODEL = 950
        jmp     br_1d9d_s950
        endif
        if      FW_VERSION = 210
        ret
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

set_drum_recovery_time:
        call    drum_field
        shl     ax, 1
        shl     ax, 1
        mov     word ptr [bx+10h], ax
        endif
        if      MODEL = 950
        jmp     br_1d9d_s950
        endif
        if      FW_VERSION = 210
        ret
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

set_drum_gain:
        call    drum_field
        mov     byte ptr [bx+3], al
        mov     cl, 0abh
        mul     cl
        mov     byte ptr [bx+12h], ah
        endif
        if      MODEL = 950
        jmp     br_1d9d_s950
        endif
        if      FW_VERSION = 210
        ret
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

set_drum_trig_thresh:
        call    drum_field
        endif
        if      MODEL = 950
        mov     byte ptr [bx+9], al
        jmp     br_1d9d_s950
        endif
        if      FW_VERSION = 210
        mov     byte ptr [bx+4], al
        mov     ah, al
        shl     al, 1
        add     al, ah
        add     al, 8
        mov     byte ptr [bx+5], al
        ret
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

fn_470d:
        pusha

L_470e:
        endif
        if      MODEL = 950
        call    br_66e7
        endif
        if      FW_VERSION = 210
        call    fn_66be
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        popa
        ret

drum_field:
        mov     bx, word ptr [DRUM_INPUT_PTR]
        mov     ax, word ptr [bp+9]
        ret
        endif
        if      MODEL = 950
        db      00h, 00h, 00h, 00h, 1bh, 00h, 00h, 00h, 04h, 00h, 02h, 00h, 08h, 0d0h, 00h, 00h
        db      0ah, 0e0h, 00h, 00h, 03h, 10h, 04h, 00h
P_029E:
        db      06h, 4dh, 00h, 03h, 05h, 74h, 00h
        endif

RUN_P_476E macro   {GLOBALSYMBOLS}
        db      0c3h
        db      "             UTILITY OPTION                     "
        db      "      NOT PRESENT               "
        db      00h, 00h
P_476E:
        dw      P_4772
        db      00h, 00h
P_4772:
        dw      drum_field+9
        db      "cBC "
        db      00h
        dw      drum_field+8
        db      00h, 00h
        dw      P_4772+0fh
        db      01h, 00h, 51h
        endm
        if      FW_VERSION = 210
        RUN_P_476E
        endif

RUN_FN_0043 macro   {GLOBALSYMBOLS}

fn_0043:
        pushf
        cli
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        mov     si, word ptr [bx+24h]
        mov     di, word ptr [bx+26h]
        call    min_max32
        mov     ax, word ptr [bx+1ch]
        mov     dx, word ptr [bx+1eh]
        call    min_max32
        mov     word ptr [bx+24h], si
        mov     word ptr [bx+26h], di
        call    fn_349a
        jae     br_006c
        popf
        jmp     br_0099
        db      90h
br_006c:
        mov     word ptr [W_9648], ax
        mov     word ptr [W_9658], bp
        call    fn_334f
        mov     al, byte ptr [bx+1ah]
        cmp     al, 4fh
        je      br_0089
        cmp     al, 41h
        jne     br_0086
        call    fn_00dd
        jmp     br_0089
br_0086:
        call    fn_009a
br_0089:
        popf
        mov     ax, word ptr [W_9648]
        xchg    word ptr [bx+28h], ax
        and     ax, ax
        jne     br_0095
        ret
br_0095:
        xchg    bx, ax
        jmp     br_21a8
br_0099:
        int     3

fn_009a:
        call    fn_00ca
        push    ax
        push    dx
        mov     bp, word ptr [W_9658]
        clc
        call    fn_349d
        jae     br_00aa
        int     3
br_00aa:
        mov     di, ax
        cmp     bp, word ptr [di+8]
        jne     br_00b7
        mov     byte ptr [bp+7], 55h
        jmp     br_00c1
br_00b7:
        mov     byte ptr [bp], 0
        mov     ax, word ptr [W_9658]
        mov     word ptr [si+8], ax
br_00c1:
        pop     word ptr [bx+22h]
        pop     word ptr [bx+20h]
        jmp     fn_334f

fn_00ca:
        mov     ax, word ptr [bx+1ch]
        mov     dx, word ptr [bx+1eh]
        sub     ax, word ptr [bx+24h]
        sbb     dx, word ptr [bx+26h]
        xchg    word ptr [bx+20h], ax
        xchg    word ptr [bx+22h], dx
        ret

fn_00dd:
        call    fn_00ca
        push    ax
        push    dx
        call    fn_0106
        mov     bp, word ptr [W_9658]
        clc
        call    fn_349d
        jae     br_00f0
loop_00ef:
        int     3
br_00f0:
        mov     di, ax
        and     byte ptr [di+7], 0dfh
        call    fn_0106
        call    fn_349d
        jb      loop_00ef
        mov     di, ax
        or      byte ptr [di+7], 20h
        jmp     br_00b7

fn_0106:
        mov     ax, word ptr [bx+20h]
        xchg    word ptr [bx+1ch], ax
        mov     word ptr [bx+20h], ax
        mov     ax, word ptr [bx+22h]
        xchg    word ptr [bx+1eh], ax
        mov     word ptr [bx+22h], ax
        ret
        if      (FW_VERSION = 210) || (MODEL = 950)

L_5d31_os21:
        mov     ax, word ptr [bp+9]
        cmp     byte ptr [ENTER_KEY], 0
        jne     br_5d42_os21
        cmp     ax, word ptr [W_5A08_OS21]
        jne     br_5d42_os21
        ret
br_5d42_os21:
        mov     word ptr [W_5A08_OS21], ax
        mov     ax, 14ah
        mul     word ptr [bp+9]
        endif
        if      FW_VERSION = 210
        mov     word ptr [W_5A10_OS21], ax
        mov     bx, word ptr [CUR_SAMPLE]
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)

L_5ddf_os21:
L_5d31_os21:
        endif
        if      MODEL = 950

fn_6dbb_s950:
        mov     word ptr [W_5A10_OS21], ax
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     ax, 7d00h
        cwd
        endif
        if      MODEL = 950
        mov     bx, word ptr [CUR_SAMPLE]
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     si, word ptr [bx+1ch]
        mov     di, word ptr [bx+1eh]
        sub     si, 64h
        sbb     di, dx

L_5d61_os21:
        call    min_max32
        push    si
        call    fn_5d8c_os21
        pop     si
        endif
        if      FW_VERSION = 210
        cmp     byte ptr [bx+2ah], 0
        je      br_5d81_os21
        push    word ptr [bx+20h]
        mov     di, 8
        call    fn_5d8c_os21
        pop     ax
        cmp     ax, word ptr [bx+20h]
        jae     br_5d81_os21
        mov     word ptr [bx+20h], ax
br_5d81_os21:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        push    bx
        call    fn_0043
        pop     bx
        call    fn_54d4_os21
        jmp     lcd_redraw

fn_5d8c_os21:
        xor     ax, ax
        mov     word ptr [bx+20h], ax
        mov     word ptr [bx+22h], ax
        mov     word ptr [W_5A14_OS21], ax
        mov     word ptr [W_9600], si
        mov     word ptr [W_9602], ax
        mov     ax, word ptr [bx+36h]
        mov     word ptr [W_966E], ax
        mov     word ptr [W_9642], ax
        mov     ax, word ptr [bx+38h]
        add     ax, di
        mov     word ptr [W_9670], ax
        mov     word ptr [W_9644], ax
        mov     bp, bx
        mov     word ptr [W_9674], L_5dbd_os21
        endif
        if      FW_VERSION = 210
        jmp     fn_6210_os21
        endif
        if      MODEL = 950
        jmp     fn_70d7_s950
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

L_5dbd_os21:
        cmp     word ptr cs:[W_5A14_OS21], 0
        je      br_5dc6_os21
        ret
br_5dc6_os21:
        mov     bx, word ptr cs:[W_5A10_OS21]
        lodsw
        cwd
        xor     ax, dx
        cmp     ax, bx
        jae     br_5dd9_os21
        inc     word ptr [bp+20h]
        loop    br_5dc6_os21
        ret
br_5dd9_os21:
        inc     word ptr cs:[W_5A14_OS21]
        ret

L_5ddf_os21:
        endif
        if      FW_VERSION < 400
        mov     cx, 3
        mov     si, P_5654_OS21
loop_5de5_os21:
        lodsw
        and     ax, 7fffh
        xchg    bp, ax
        lodsw
        xchg    bx, ax
        mov     ax, word ptr [bp+9]
        mov     dx, 3e8h
        mul     dx
        add     ax, word ptr [bx+9]
        adc     dx, 0
        mov     di, word ptr [bx+0fh]
        mov     bx, word ptr [CUR_SAMPLE]
        add     di, bx
        stosw
        mov     word ptr [di], dx
        loop    loop_5de5_os21
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    fn_54d4_os21
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        call    br_54dc_os21
        endif
        if      FW_VERSION < 400
        call    fn_0043
loop_5e0e_os21:
        call    fn_5467_os21
br_5e11_os21:
        jmp     lcd_redraw

loop_length_auto:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    sample_field_enter
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        call    fn_6bce_v12a
        endif
        if      FW_VERSION < 400
        jne     br_5e1a_os21
        ret
br_5e1a_os21:
        pushf
        cli
        endif
        if      MODEL = 950
        call    fn_6e7a_s950
        jmp     br_6f40_s950

fn_6e7a_s950:
        endif
        if      FW_VERSION < 400
        xor     cx, cx
        mov     ax, word ptr [bx+1ch]
        mov     dx, word ptr [bx+1eh]
        mov     si, ax
        mov     di, dx
        sub     ax, word ptr [bx+24h]
        sbb     dx, word ptr [bx+26h]
        sub     ax, word ptr [W_5A04_OS21]
        sbb     dx, cx
        jae     br_5e39_os21
        xor     ax, ax
        cwd
br_5e39_os21:
        mov     word ptr [W_966E], ax
        mov     word ptr [W_9670], dx
        mov     word ptr [W_A01C_OS21], ax
        mov     word ptr [W_A01E_OS21], dx
        sub     si, 5
        sbb     di, cx
        add     ax, word ptr [W_5A0E_OS21]
        adc     dx, cx
        cmp     ax, si
        push    dx
        sbb     dx, di
        pop     dx
        jae     br_5e5d_os21
        xchg    si, ax
        xchg    di, dx
br_5e5d_os21:
        mov     cx, si
        sub     cx, word ptr [W_966E]
        mov     word ptr [W_A00C_OS21], cx
        mov     ax, word ptr [W_5A04_OS21]
        sub     word ptr [W_A00C_OS21], ax
        mov     ax, word ptr [W_966E]
        mov     dx, word ptr [W_9670]
        shl     ax, 1
        rcl     dx, 1
        call    fn_5f38_os21
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        cmp     byte ptr [bx+2ah], 0
        jne     br_5eac_os21
        sub     ax, word ptr [bx+10h]
        sbb     dx, word ptr [bx+12h]
        jb      br_5e8f_os21
        call    fn_5f32_os21
        jmp     br_5eac_os21
br_5e8f_os21:
        sar     dx, 1
        rcr     ax, 1
        add     ax, cx
        adc     dx, 0
        js      br_5eac_os21
        push    ax
        sub     cx, ax
        call    fn_5f4a_os21
        pop     cx
        xor     ax, ax
        cwd
        call    fn_5f32_os21
        call    fn_5f4d_os21
        jmp     br_5eaf_os21
br_5eac_os21:
        call    fn_5f4a_os21
br_5eaf_os21:
        endif
        if      MODEL = 950
        call    fn_5f4a_os21
        endif
        if      FW_VERSION < 400
        mov     cx, word ptr [W_5A04_OS21]
        inc     cx
        mov     ax, word ptr [bx+1ch]
        mov     dx, word ptr [bx+1eh]
        sub     ax, cx
        sbb     dx, 0
        shl     ax, 1
        rcl     dx, 1
        call    fn_5f38_os21
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        sub     ax, word ptr [bx+10h]
        sbb     dx, word ptr [bx+12h]
        jb      br_5ed1_os21
        call    fn_5f32_os21
br_5ed1_os21:
        endif
        if      FW_VERSION < 400
        dec     cx
        mov     di, P_8EB6_OS21
        call    fn_5f4d_os21
        dec     di
        mov     word ptr [W_A016_OS21], di
        mov     ax, 0ffffh
        mov     word ptr [W_9636], ax
        mov     word ptr [W_9638], ax
        mov     ax, W_7CEE
        add     ax, word ptr [W_5A04_OS21]
        mov     word ptr [W_963A], ax
        mov     di, ax
loop_5ef2_os21:
        mov     si, word ptr [W_A016_OS21]
        call    fn_5f6e_os21
        inc     di
        dec     word ptr [W_A00C_OS21]
        jne     loop_5ef2_os21
        xor     cx, cx
        mov     ax, word ptr [bx+1ch]
        mov     dx, word ptr [bx+1eh]
        stc
        sbb     ax, word ptr [W_963A]
        sbb     dx, cx
        add     ax, W_7CEE
        adc     dx, cx
        sub     ax, word ptr [W_A01C_OS21]
        sbb     dx, word ptr [W_A01E_OS21]
        endif
        if      MODEL = 950
        ret
br_6f40_s950:
        endif
        if      FW_VERSION < 400
        mov     word ptr [bx+24h], ax
        mov     word ptr [bx+26h], dx

br_0ffd:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    fn_54d4_os21
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        call    br_54dc_os21
        endif
        if      FW_VERSION < 400
        call    fn_0043
        call    voice_reset_all
        call    fn_66aa
        popf
        jmp     br_5e11_os21

fn_5f32_os21:
        push    dx
        or      dl, 8
        jmp     br_5f39_os21

fn_5f38_os21:
        push    dx
br_5f39_os21:
        push    ax
        add     ax, word ptr [bx+36h]
        adc     dx, word ptr [bx+38h]
        mov     word ptr [W_966E], ax
        mov     word ptr [W_9670], dx
        pop     ax
        pop     dx
        ret

fn_5f4a_os21:
        mov     di, W_7CEE

fn_5f4d_os21:
        push    ds
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        push    cx
        endif
        if      MODEL = 950
        mov     dx, 1c4h
        mov     al, byte ptr [W_9670]
        out     dx, al
        endif
        if      FW_VERSION < 400
        mov     ax, word ptr [W_966E]
        mov     si, ax
        and.w   si, 0fh
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        and     ax, 0fff0h
        or      ax, word ptr [W_9670]
        mov     cl, 4
        ror     ax, cl
        mov     ds, ax
        pop     cx
        endif
        if      MODEL = 950
        shr     ax, 4
        add     ax, 2000h
        mov     ds, ax
        endif
        if      FW_VERSION < 400
loop_5f66_os21:
        lodsw
        xchg    al, ah
        stosb
        loop    loop_5f66_os21
        pop     ds
        ret

fn_5f6e_os21:
        std
        push    di
        mov     cx, word ptr [W_5A04_OS21]
        dec     di
        lodsb
        sub     al, byte ptr [di]
        jo      br_5fc2_os21
        imul    al
        cmp     al, 0ah
        jae     br_5fc2_os21
        shl     ax, 1
        shl     ax, 1
        cwd
        xchg    bp, ax
        dec     di
        dec     cx
        lodsb
        sub     al, byte ptr [di]
        jo      br_5fc2_os21
        imul    al
        shl     ax, 1
        add     bp, ax
        dec     di
        dec     cx
loop_5f95_os21:
        lodsb
        sub     al, byte ptr [di]
        jo      br_5fc2_os21
        imul    al
        add     bp, ax
        jb      br_5fbf_os21
loop_5fa0_os21:
        dec     di
        loop    loop_5f95_os21
        mov     ax, word ptr [W_9638]
        cmp     word ptr [W_9636], bp
        sbb     ax, dx
        jb      br_5fb6_os21
        mov     word ptr [W_9636], bp
        mov     word ptr [W_9638], dx
br_5fb6_os21:
        pop     di
        jb      br_5fbd_os21
        mov     word ptr [W_963A], di
br_5fbd_os21:
        cld
        ret
br_5fbf_os21:
        inc     dx
        jmp     loop_5fa0_os21
br_5fc2_os21:
        pop     di
        jmp     br_5fbd_os21

set_time_direction:
        call    sample_field
        push    bx
        mov     bx, FLD_LOOP_LENGTH_COARSE+14
        xlat
        pop     bx
        cmp     al, byte ptr [bx+2bh]
        jne     br_5fd4_os21
        ret
br_5fd4_os21:
        mov     byte ptr [bx+2bh], al
        pushf
        cli
        call    voice_reset_all
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    fn_5fe4_os21
        endif
        if      MODEL = 950
        call    fn_7008_s950
        endif
        if      FW_VERSION < 400
        call    fn_66aa
        popf
        ret
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)

fn_5fe4_os21:
        pushf
        cli
        mov     bp, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        mov     byte ptr [B_A004_OS21], 1
        mov     ax, word ptr [bx+38h]
        mov     word ptr [W_9670], ax
        mov     word ptr [W_9644], ax
        mov     ax, word ptr [bx+36h]
        mov     word ptr [W_966E], ax
        add     ax, bp
        adc     word ptr [W_9644], dx
        sub     ax, 2
        sbb     word ptr [W_9642], 0
        or.w    word ptr [W_9644], 8
        mov     word ptr [W_9642], ax
        shr     dx, 1
        rcr     bp, 1
        cmp     byte ptr [bx+2ah], 0
        je      br_6041_os21
        and.w   word ptr [W_9644], 7
        inc     byte ptr [B_A004_OS21]
        shr     dx, 1
        rcr     bp, 1
        push    word ptr [W_9642]
        push    word ptr [W_9644]
        push    word ptr [W_966E]
        push    word ptr [W_9670]
        push    bp
        push    dx
br_6041_os21:
        xor     ax, ax
        mov     cx, 7ff8h
        cmp     cx, bp
        sbb     ax, dx
        jae     br_606a_os21
        call    fn_6095_os21
        mov     ax, 7ff8h
        sub     bp, ax
        sbb     dx, cx
        shl     ax, 1
        add     word ptr [W_966E], ax
        adc     word ptr [W_9670], cx
        sub     word ptr [W_9642], ax
        sbb     word ptr [W_9644], cx
        jmp     br_6041_os21
br_606a_os21:
        mov     cx, bp
        call    fn_6095_os21
        dec     byte ptr [B_A004_OS21]
        je      br_6093_os21
        pop     dx
        pop     bp
        pop     word ptr [W_9670]
        pop     word ptr [W_966E]
        or      byte ptr [W_9670], 8
        pop     word ptr [W_9644]
        pop     word ptr [W_9642]
        or      byte ptr [W_9644], 8
        jmp     br_6041_os21
br_6093_os21:
        popf
        ret

fn_6095_os21:
        push    cx
        mov     ax, word ptr [W_966E]
        mov     di, ax
        and.w   di, 0fh
        and     ax, 0fff0h
        or      ax, word ptr [W_9670]
        mov     cl, 4
        ror     ax, cl
        mov     es, ax
        mov     ax, word ptr [W_9642]
        mov     si, ax
        or.w    si, 0fff0h
        and     ax, 0fff0h
        or      ax, word ptr [W_9644]
        mov     cl, 4
        ror     ax, cl
        sub     ax, 0fffh
        jae     br_60cb_os21
        xor     ax, ax
        mov     si, word ptr [W_9642]
br_60cb_os21:
        mov     ds, ax
        pop     cx
loop_60ce_os21:
        mov     ax, word ptr es:[di]
        xchg    word ptr [si], ax
        stosw
        dec     si
        dec     si
        loop    loop_60ce_os21
        xor     ax, ax
        mov     ds, ax
        mov     es, ax
        ret

L_60df_os21:
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        call    fn_6bce_v12a
        endif
        if      MODEL = 950

fn_7008_s950:
        push    bx
        mov     bp, bx
        mov     si, word ptr [bp+36h]
        mov     bh, byte ptr [bp+38h]
        mov     cx, word ptr [bp+10h]
        mov     bp, word ptr [bp+12h]
        mov     di, cx
        mov     ax, bp
        add     di, di
        adc     ax, ax
        add     di, si
        adc     al, bh
        mov     bl, al
        shr     bp, 1
        rcr     cx, 1
        push    ds
        push    es
        mov     ax, 2000h
        mov     ds, ax
        mov     ax, 3000h
        mov     es, ax
loop_7035_s950:
        mov     dx, 1c4h
        mov     al, bh
        out     dx, al
        mov     dx, 1c6h
        mov     al, bl
        out     dx, al
        mov     ax, word ptr [si]
        xchg    word ptr es:[di], ax
        mov     word ptr [si], ax
        add     si, 2
        adc     bh, 0
        sub     di, 2
        sbb     bl, 0
        sub     cx, 1
        sbb     bp, 0
        mov     ax, cx
        or      ax, bp
        jne     loop_7035_s950
        pop     es
        pop     ds
        pop     bx
        ret

L_0cf8:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    sample_field_enter
        endif
        if      FW_VERSION < 400
        jne     fn_60e5_os21
        ret

fn_60e5_os21:
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        pushf
        cli
        xor     ax, ax
        mov     byte ptr [B_A032_OS21], al
        cmp     byte ptr [bx+2ah], al
        jne     br_6109_os21
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        sub     ax, word ptr [bx+1ch]
        sbb     dx, word ptr [bx+1eh]
        endif
        if      FW_VERSION = 210
        call    fn_6644_os21
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        sub     ax, word ptr [bx+20h]
        sbb     dx, word ptr [bx+22h]
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        jb      br_6109_os21
        dec     byte ptr [B_A032_OS21]
        call    fn_62e2_os21
br_6109_os21:
        mov     bp, W_7CEE
        mov     di, bp
        mov     si, bx
        mov     cx, 3ch
        rep movsb
        mov     si, word ptr [bx+36h]
        mov     word ptr [W_9642], si
        mov     di, word ptr [bx+38h]
        mov     word ptr [W_9644], di
        endif
        if      MODEL = 950
        lea     di, [bx+36h]
        endif
        if      FW_VERSION < 400
        mov     ax, word ptr [bx+20h]
        mov     dx, word ptr [bx+22h]
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        shl     ax, 1
        rcl     dx, 1
        add     ax, si
        adc     dx, di
        mov     word ptr [W_966E], ax
        mov     word ptr [W_9670], dx
        mov     word ptr [bp+20h], cx
        mov     word ptr [bp+22h], cx
        endif
        if      FW_VERSION = 210
        call    fn_663e_os21
        endif
        if      MODEL = 950
        add     ax, ax
        adc     dx, dx
        add     ax, word ptr [di]
        adc     dx, word ptr [di+2]
        mov     si, W_966E
        mov     word ptr [si], ax
        mov     word ptr [si+2], dx
        endif
        if      FW_VERSION < 210
        mov     ax, word ptr [bx+1ch]
        mov     dx, word ptr [bx+1eh]
        sub     ax, word ptr [bx+20h]
        sbb     dx, word ptr [bx+22h]
        endif
        if      MODEL = 950
        mov     word ptr [bx+1ch], ax
        mov     word ptr [bx+1eh], dx
        sub     cx, cx
        endif
        if      FW_VERSION < 400
        add     ax, 1
        adc     dx, cx
        and     ax, 0fffeh
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     word ptr [bp+1ch], ax
        mov     word ptr [bp+1eh], dx
        mov     word ptr [bp+10h], ax
        mov     word ptr [bp+12h], dx
        mov     word ptr [W_9600], ax
        mov     word ptr [W_9602], dx
        cmp     byte ptr [bx+2ah], cl
        je      br_6174_os21
        shl     word ptr [bp+10h], 1
        rcl     word ptr [bp+12h], 1
        push    bp
        push    bx
        lea     bx, [bp+10h]
        call    fn_588d_os21
        pop     bx
        pop     bp
        jmp     br_618d_os21

L_6173_os21:
        nop
br_6174_os21:
        call    fn_6200_os21
        mov     word ptr [W_A024_OS21], ax
        mov     word ptr [W_A026_OS21], dx
        mov     si, W_966E
        call    fn_61fc_os21
        mov     word ptr [W_9674], L_620d_os21
        call    fn_6210_os21
br_618d_os21:
        mov     si, bp
        mov     di, bx
        mov     cx, 3ch
        rep movsb
        cmp     byte ptr [B_A032_OS21], cl
        je      br_619f_os21
        call    fn_62e2_os21
        endif
        if      MODEL = 950
        mov     word ptr [bx+10h], ax
        mov     word ptr [bx+12h], dx
        mov     word ptr [bx+20h], cx
        mov     word ptr [bx+22h], cx
        push    bx
        lea     bx, [bx+10h]
        call    fn_020a
        pop     bx
        pushf
        endif
        if      FW_VERSION < 400
br_619f_os21:
        push    bx
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    fn_0125
        endif
        if      MODEL = 950
        call    fn_78a8_s950
        endif
        if      FW_VERSION < 400
        pop     bx
        call    fn_0043
        popf
        call    sample_fill
        jmp     br_5e11_os21
        endif

min_max32:
        cmp     ax, si
        push    dx
        sbb     dx, di
        pop     dx
        jae     br_0124
        xchg    si, ax
        xchg    di, dx
br_0124:
        ret
        endm
        if      FW_VERSION >= 400
        RUN_FN_0043

fn_0125:
        mov     ax, 0c000h
        mov     dx, 0
        jmp     br_0142
loop_012d:
        mov     ax, word ptr [bx+36h]
        mov     dx, word ptr [bx+38h]
        add     ax, word ptr [bx+10h]
        adc     dx, word ptr [bx+12h]
        add     ax, 0fh
        adc     dx, 0
        and     ax, 0fff0h
        endif

RUN_BR_0142 macro   {GLOBALSYMBOLS}

br_0142:
        push    ax
        push    dx
        call    fn_0189
        pop     dx
        pop     ax
        je      br_0186
        mov     word ptr [W_963E], ax
        mov     word ptr [W_9640], dx
        sub     ax, word ptr [bx+36h]
        sbb     dx, word ptr [bx+38h]
        or      ax, dx
        je      br_017a
        lea     si, [bx+36h]
        push    bx
        lea     bx, [bx+10h]
        mov     di, W_963E
        call    fn_020a
        pop     bx
        mov     ax, word ptr [W_963E]
        mov     word ptr [bx+36h], ax
        mov     dx, word ptr [W_9640]
        mov     word ptr [bx+38h], dx
        endm
        if      FW_VERSION >= 400
        RUN_BR_0142

L_0177:
        endif

RUN_BR_017A macro   {GLOBALSYMBOLS}

        call    fn_0043
br_017a:
        mov     ax, word ptr [W_963E]
        mov     dx, word ptr [W_9640]
        call    fn_0189
        jne     loop_012d
br_0186:
        jmp     program_sample_name_xref_resolve

fn_0189:
        if      MODEL = 950
        call    word ptr [IDLE_HOOK]
        endif
        xchg    di, dx
        xchg    bp, ax
        mov     si, SLOT_TAGS
        mov     bx, SLOTS
        endm
        if      FW_VERSION >= 400
        RUN_BR_017A
        mov     cx, SLOT_COUNT
        endif

RUN_LOOP_01A1 macro   {GLOBALSYMBOLS}

        xor     ax, ax
        mov     word ptr [W_963A], ax
        dec     ax
        mov     word ptr [W_9636], ax
        mov     word ptr [W_9638], ax
loop_01a1:
        cmp     byte ptr [si], 53h
        je      br_01b3
loop_01a6:
        inc     si
        add     bx, 46h
        loop    loop_01a1
        mov     bx, word ptr [W_963A]
        and     bx, bx
        ret
br_01b3:
        mov     ax, word ptr [bx+36h]
        mov     dx, word ptr [bx+38h]
        sub     ax, bp
        sbb     dx, di
        jb      loop_01a6
        cmp     ax, word ptr [W_9636]
        push    dx
        sbb     dx, word ptr [W_9638]
        pop     dx
        jae     loop_01a6
        mov     word ptr [W_9636], ax
        mov     word ptr [W_9638], dx
        mov     word ptr [W_963A], bx
        jmp     loop_01a6
        endm

RUN_FN_01F7 macro   {GLOBALSYMBOLS}
fn_01f7:

fn_2e3f_os21:
        call    fn_2aef
        mov     dx, 7
        mov     ax, 4000h
        sub     ax, bx
        sbb     dx, cx
        mov     cx, 128fh
        div     cx
        endm
        if      FW_VERSION >= 400
        RUN_LOOP_01A1

sample_field:
        call    field_text
        xchg    di, si
        mov     bx, word ptr [CUR_SAMPLE]
        mov     al, byte ptr [si]
        cmp     al, 20h
        ret

check_sample_slots:
        pusha
        call    program_sample_tag_scan
        cmp     ah, 20h
        mov     ax, ERR_TOO_MANY_SAMPLES_IN
        jae     br_01f4
        popa
        ret
br_01f4:
        jmp     error_restart

        RUN_FN_01F7
        endif

RUN_FN_020A macro   {GLOBALSYMBOLS}

        ret

fn_020a:
        lodsw
        mov     word ptr [W_966E], ax
        lodsw
        mov     word ptr [W_9670], ax
        mov     si, di
        lodsw
        mov     word ptr [W_9642], ax
        lodsw
        mov     word ptr [W_9644], ax
        endm
        if      FW_VERSION >= 400
        RUN_FN_020A
        endif

RUN_FN_588D_OS21 macro   {GLOBALSYMBOLS}

fn_588d_os21:
        pushf
        cli
        mov     dx, word ptr [bx+2]
        mov     bx, word ptr [bx]
        shr     dx, 1
        rcr     bx, 1
loop_0227:
        mov     cl, 4
        mov     ax, word ptr [W_9642]
        endm
        if      FW_VERSION >= 400
        RUN_FN_588D_OS21
        mov     di, ax
        and.w   di, 0fh
        endif

RUN_BR_025E macro   {GLOBALSYMBOLS}

        and     ax, 0fff0h
        or      ax, word ptr [W_9644]
        ror     ax, cl
        mov     es, ax
        mov     ax, word ptr [W_966E]
        mov     si, ax
        and.w   si, 0fh
        and     ax, 0fff0h
        or      ax, word ptr [W_9670]
        ror     ax, cl
        mov     ds, ax
        mov     cx, 7ff8h
        xor     ax, ax
        cmp     cx, bx
        sbb     ax, dx
        jb      br_025e
        mov     cx, bx
br_025e:
        push    cx
        push    cx
        push    di
        push    si
        rep movsw
        pop     si
        pop     di
        pop     cx
        mov     ax, ds
        or      ax, 8000h
        mov     ds, ax
        mov     ax, es
        or      ax, 8000h
        mov     es, ax
        rep movsw
        pop     cx
        xor     ax, ax
        sub     bx, cx
        sbb     dx, ax
        mov     ds, ax
        mov     es, ax
        shl     cx, 1
        add     word ptr [W_966E], cx
        adc     word ptr [W_9670], ax
        add     word ptr [W_9642], cx
        adc     word ptr [W_9644], ax
        mov     ax, dx
        or      ax, bx
        jne     loop_0227
        popf
        ret
        endm
        if      FW_VERSION >= 400
        RUN_BR_025E
DISK_LAST_FIELD:
        db      0f9h, 0eh
        endif
        if      FW_VERSION >= 210
P_029E:
        db      06h, 4dh, 04h
        endif
        if      MODEL = 900
B_02A1:
        db      03h
B_02A2:
        db      05h, 74h, 00h, 02h, 4ah, 00h
        endif
P_02A8:
        db      09h
B_02A9:
        if      FW_VERSION < 210
        db      00h
        else
        db      0c5h
        endif
B_02AA:
        if      FW_VERSION < 400
        db      00h
        else
        db      04h
        endif
B_02AB:
        if      FW_VERSION = 210
        db      01h
        else
        db      00h
        endif

B_02AC:
        if      FW_VERSION < 400
        db      00h
        else
        db      01h
        endif
B_02AD:
        db      01h, 03h, 05h, 35h, 0ffh
P_02B2:
        db      02h, 07h, 00h
P_02B5:
        db      03h, 0fh
B_02B7:
        if      FW_VERSION < 400
        db      00h
        else
        db      04h
        endif
B_02B8:
        if      FW_VERSION = 210
        db      01h
        else
        db      00h
        endif

P_02B9:
        db      02h, 04h, 00h
P_02BC:
        if      MODEL = 950
        db      01h, 08h, 03h, 03h, 0d2h, 0ah, 56h
DISK_LAST_FIELD:
        db      0ah, 31h
        else
        db      01h, 08h
P_02BE:
        db      03h, 03h, 0d4h, 0bh
        endif
        if      FW_VERSION = 210
DISK_LAST_FIELD:
        db      94h, 29h
        endif
        if      MODEL = 900
B_02C2:
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      00h
B_02C3:
        db      00h
        endif
        if      FW_VERSION >= 210
        db      03h
B_02C3:
        db      03h
        endif
        if      MODEL = 900
P_02C4:
        db      "DRUM SET  "
        endif
FP_02CE:
        if      FW_VERSION < 210
        dw      W_7CEE
        else
        db      00h, 00h
        endif
        if      MODEL = 900

W_02D0:
        endif
W_02D0_2:
        db      00h, 00h
B_02D2:
        if      MODEL = 950
        db      0ffh, 00h, 00h, 00h, 00h, 00h, 0bh, 24h, 35h, 24h, 0e0h, 2fh, 0e4h, 2fh, 54h, 30h
        db      0dfh, 35h, 6ch, 37h, 22h, 3dh, 86h, 3dh, 9bh, 3dh, 00h, 04h, 40h, 00h, 15h, 2ch
        db      1bh, 24h, 0e3h, 24h, 1eh
        db      "0!0k0"
        db      0feh
        db      "5l74="
        db      8bh, 3dh, 0bbh, 3dh, 00h, 20h, 80h, 00h, 0dfh, 2eh
W_1E64_S950 equ     $+2
W_1E66_S950 equ     $+4
W_1E68_S950 equ     $+6
W_1E6A_S950 equ     $+8
W_1E6C_S950 equ     $+0ah
W_1E6E_S950 equ     $+0ch
W_1E70_S950 equ     $+0eh
W_1E72_S950 equ     $+10h
W_1E74_S950 equ     $+12h
W_1E76_S950 equ     $+14h
W_1E78_S950 equ     $+16h
W_1E7A_S950 equ     $+18h
W_1E62_S950:
        db      26 dup (0)
FP_1E7C_S950:
        db      10h, 46h, 00h, 10h, 10h, 46h, 00h, 10h, 04h, 06h, 00h, 10h, 00h, 00h, 00h, 10h
W_1E8C_S950:
        db      8 dup (0)
MSG_CANT_DO_THIS:
        db      " Cant do this! "
        db      0c0h, 0feh
MSG_DRUM_SET_FLOPPY_HARD:
        db      "DRUM SET  "
        db      90h
        db      "Floppy    "
MSG_HARD_DISK_NOT_READY:
        db      "Hard disk not ready."
        db      0bbh, 0feh
        db      "*HDunit1 *Park_ *Rename Floppy      100%"
SCR_VOLUME:
        db      "*01 VOLUME *Slct,create Floppy     V  99"
B_1F20_S950:
        db      "*HDcont1 *Hdrive1 *Rename 0123456789100%"
SCR_CLEAR_MEMORY_AND_LOAD:
        db      "*02 *Clear mem & load disk (1), Mem-xxx%"
        db      "Load disk (2), Clear prev (3) _ Vol-xxx%"
SCR_LOAD_PROGRM:
        db      "*03 LOAD PROGRM (ENT) *PR only _  M-xxx%"
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      0ffh, 00h
SCR_CLEAR_MEMORY_AND_LOAD:
        db      "*01  Clear memory and load   Memory-xxx%"
        db      "     entire disk (ENT)         Disk-xxx%"
SCR_LOAD_PROGRM:
        db      "*02 LOAD PROGRM (ENT) *PR only _  M-xxx%"
        endif
        if      FW_VERSION = 210
        db      00h, 00h
SCR_CLEAR_MEMORY_AND_LOAD:
        db      "*01  Clear memory and load   Memory-  0%"
        db      "     entire disk (ENT)         Disk-  1%"
SCR_LOAD_PROGRM:
        db      "*02 LOAD PROGRM (ENT) *PR only _  M-  0%"
        endif
        if      FW_VERSION < 400
        db      "    *name "
P_035B:
        endif
        if      FW_VERSION < 210
        db      "0123456789  *PR & samples _   "
SCR_LOAD_SAMPLE:
        endif
        if      MODEL = 950
        db      "*04 LOAD SAMPLE (ENT)           Mem-xxx%"
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        db      "*03 LOAD SAMPLE (ENT)           Mem-xxx%"
        elseif  FW_VERSION = 210
        db      "TONE PRGRM  *PR & samples _   "
        else
        db      00h, 00h, 00h, 00h
SCR_CLEAR_MEMORY_AND_LOAD:
        db      "*01 Clear memory and load    Memory-  0%"
B_02FE:
        db      "    *ensemble 1   0% (ENT)     Disk-  0%"
SCR_LOAD_PROGRM:
        db      "*02 LOAD PROGRM (ENT)   *PR only _   Mem"
B_034E:
        db      " ens 1 *name "
P_035B:
        db      "NONE       *PR&smpls _   0%"
        endif
        if      FW_VERSION >= 210
SCR_LOAD_SAMPLE:
        db      "*03 LOAD SAMPLE (ENT)           Mem-  0%"
        endif
        if      FW_VERSION < 400
        db      "    *name "
P_03B1:
        endif
        if      MODEL = 950
        db      "0123456789    *All samples _  "
SCR_CLEAR_VOLUME_AND_SAVE:
        db      "*05  Clear volume and save      Mem-xxx%"
        db      "     entire memory (ENT)        Vol-xxx%"
SCR_SAVE_PROGRM:
        db      "*06 SAVE PROGRM (ENT) *PR only _    Vol "
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      "0123456789                    "
SCR_CLEAR_DISK_AND_SAVE:
        db      "*04  Clear disk and save        Mem-xxx%"
        db      "     entire memory (ENT)        Dsk-xxx%"
        endif
        if      FW_VERSION = 210
        db      "TONE                          "
        db      00h
        db      "04  Clear disk and save        Mem-  0%     enti"
        db      "re memory (ENT)        Dsk-  1%"
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
SCR_SAVE_PROGRM:
        db      "*05 SAVE PROGRM (ENT) *PR only _    Disk"
        endif
        if      FW_VERSION < 400
        db      "    *name "
P_044B:
        endif
        if      FW_VERSION < 210
        db      "0123456789  *PR & smpls _ xxx%"
        endif
        if      FW_VERSION = 210
        db      "GALLUS FAC  *PR & smpls _   1%"
        endif
        if      FW_VERSION < 400
SCR_SAVE_SAMPLE:
        endif
        if      MODEL = 950
        db      "*07  SAVE SAMPLE (ENT)              Vol "
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      "*06  SAVE SAMPLE (ENT)              Disk"
        endif
        if      FW_VERSION < 400
        db      "    *name "
P_04A1:
        endif
        if      FW_VERSION < 210
        db      "0123456789                xxx%"
        endif
        if      FW_VERSION = 210
        db      "TONE                        1%"
        endif
        if      FW_VERSION < 400
SCR_ERASE:
        endif
        if      MODEL = 950
        db      "*08 ERASE FROM  *Sample "
P_04E6:
        db      "0123456789  Vol "
        db      "  VOLUME (ENT)  *Progrm "
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      "*07 ERASE FROM  *Sample "
P_04E6:
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      "0123456789  Disk"
        endif
        if      FW_VERSION = 210
        db      "TONE        Disk"
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      "    DISK (ENT)  *Progrm "
        endif
        if      FW_VERSION < 400
P_04F6:
        endif
        if      FW_VERSION < 210
        db      "0123456789  xxx%"
        endif
        if      MODEL = 950
SCR_FORMAT_FLOPPY:
        db      "*09 *Format floppy _ *Format SH204/5 _  "
        db      " *Wipe hard disk _    Total free:  1234%"
SCR_LOAD_DRUM_SETTINGS:
        db      "*10  *Load drum settings (ENT) _    Vol "
        db      "     *Save drum settings (ENT) _    xxx%"
B_2218_S950:
        db      "*11   MIDI program changes can now load hard dis"
        db      "k volume. 0123456789 number 123 "
SCR_PARK_HARD_DISK:
        db      "*12  Park hard disk, (ENT).  This makes "
        db      "     it safe for transportation.        "
        db      43h, 1fh, 93h, 1fh, 83h, 20h, 0d3h
        db      " #!s!"
        db      13h, 22h, 00h, 00h
P_0600:
        db      6bh, 1fh, 0bbh, 1fh, 0bh, 20h, 5bh, 20h, 00h, 00h
W_05F6:
        db      0c3h, 21h, 00h, 00h
        endif
        if      FW_VERSION = 210
        db      "TONE PRGRM    1%"
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
SCR_DISK_FORMAT:
        db      "*08  DISK FORMAT.                   Disk"
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      "    Prepare new disk (ENT)          xxx%"
        endif
        if      FW_VERSION = 210
        db      "    Prepare new disk (ENT)            1%"
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
SCR_LOAD_DRUM_SETTINGS:
        db      "*09  *Load drum settings (ENT) _    Disk"
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      "     *Save drum settings (ENT) _    xxx%"
        endif
        if      FW_VERSION = 210
        db      "     *Save drum settings (ENT) _      1%"
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
P_0600:
        dw      B_02D2+4eh
        dw      P_03B1+6ah
        dw      P_044B+1ah
        dw      P_04A1+1ah
        endif
        if      FW_VERSION >= 400
B_039E:
        db      "     ens 1   *name "
P_03B1:
        db      "NONE                 "
        db      00h
        db      "04 Clear ensemble and save     Mem-  0%     ens "
B_03F7:
        db      "1        0% (ENT)      Dsk-  0%"
SCR_SAVE_PROGRM:
        db      "*05 SAVE PROGRM (ENT)   *PR only _  Disk"
        db      " ens "
B_0443:
        db      "1 *name "
P_044B:
        db      "#### ##### *PR&smpls _   0%"
SCR_SAVE_SAMPLE:
        db      "*06 SAVE SAMPLE (ENT)               Disk"
        db      "     ens "
B_0497:
        db      "1   *name "
P_04A1:
        db      "TONE               0%"
SCR_ERASE:
        db      "*07 ERASE FROM DISK  (ENT)   ens "
B_04D7:
        db      "1  Disk"
        db      "  *Smpl "
P_04E6:
        db      "NONE       *Pgm "
P_04F6:
        db      "NONE          0%"
SCR_DISK_FORMAT:
        db      "*08 DISK FORMAT.                    Disk"
        db      "    Prepare new disk (ENT)            0%"
SCR_LOAD_DRUM_SETTINGS:
        db      "*09 *Load drum settings (ENT) _     Disk"
        db      "    *Save drum settings (ENT) _       0%"
        db      "*10 *Compression of saved samples            on "
        db      "disk  ON                        "
W_05F6:
        db      0fah, 02h, 72h, 03h, 9ah, 03h, 0eah, 03h, 00h, 00h
P_0600:
        db      22h, 03h, 12h, 04h, 62h, 04h, 0b2h, 04h
        endif
        if      MODEL = 900
        dw      P_04F6+0ch
        dw      P_04F6+5ch
        dw      P_04F6+0ach
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      00h, 00h
W_05F6:
        dw      B_02D2+26h
        dw      B_02D2+76h
        dw      P_035B+42h
        dw      P_03B1+42h
        db      00h, 00h
        endif
        if      FW_VERSION >= 400
        db      00h, 00h, 0eh, 03h, 0feh, 03h, 00h, 00h
        endif
MSG_SAVING:
        db      "SAVING "
        db      0c8h, 0feh
MSG_LOADING:
        db      "LOADING "
        db      0c7h, 0feh
        if      MODEL = 950
MSG_FILE_NAME:
        else
P_0629:
        endif
        if      FW_VERSION < 210
        db      "0123456789 "
        db      0bdh, 0feh
        endif
        if      MODEL = 950

fn_22f6_s950:
        mov     byte ptr [B_95BC], 0ffh
        call    fn_66aa
        mov     byte ptr [B_02D2], 0
        call    disk_menu_action_guard
        cmp     byte ptr [B_0497], 0
        jne     br_230e_s950
        ret
br_230e_s950:
        test    byte ptr [B_0043_S950], 1
        je      br_2318_s950
        jmp     br_2965_s950
br_2318_s950:
        jmp     fn_29b2_s950

fn_231b_s950:
        xor     ax, ax
        mov     word ptr [W_7CD4], ax
        mov     word ptr [W_95D6], ax
        mov     word ptr [W_95E4], ax
        ret

fn_2327_s950:
        xor     ax, ax
        cmp     byte ptr [B_B46D_S950], al
        je      br_2351_s950
        push    ds
        mov     ax, 1000h
        mov     ds, ax
        cbw
        push    cx
        push    bx
        mov     bx, 0ah
        mov     cx, 80h
loop_233e_s950:
        cmp     word ptr [bx], 0
        je      br_2345_s950
        inc     ah
br_2345_s950:
        add     bx, 0ch
        loop    loop_233e_s950
        mov     al, ah
        mov     ah, 0
        pop     bx
        pop     cx
        pop     ds
br_2351_s950:
        elseif  (MODEL = 900) && (FW_VERSION < 210)

disk_catalog_screen_trampoline:
        mov     byte ptr [B_95BC], 0ffh
        call    fn_2e52_os21
        mov     ax, 3f46h
        elseif  FW_VERSION = 210
        db      "S900 2.1   "
        db      0bdh, 0feh, 0c6h, 06h, 90h, 9fh, 0ffh, 0e8h, 2ch, 0dh, 0b8h, 46h, 3fh
        else
        db      "S900 4.0   "
        db      0bdh, 0feh, 0c6h, 06h, 0bch, 95h, 0ffh, 0e8h, 0bch, 0fh, 0b8h, 46h, 3fh
        endif
        if      FW_VERSION >= 210

L_0641:
        endif
        if      MODEL = 900

        call    disk_catalog_scan
        cmp     byte ptr [B_02D2], 0
        je      br_064c
        ret
br_064c:
        jmp     br_09dd

sample_rate_table_lookup:
        mov     si, ax
        mov     cl, 0ah
        div     cl
        inc     ax
        mul     cl
        cwd
loop_0659:
        mov     word ptr [W_95EC], si
        shl     si, 1
        mov     si, word ptr [si+TBL_8EFE]
        add     dx, 400h
        cmp     si, ax
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        jb      loop_0659
        endif
        if      FW_VERSION >= 210
        jcxz    loop_0659
        endif
        if      MODEL = 900

        mov     word ptr [W_95EE], dx
        endif
        ret

fn_0670:
        cmp     byte ptr [bp], 53h
        jne     br_0691
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        shl     ax, 1
        rcl     dx, 1
        add     ax, word ptr [bx+10h]
        adc     dx, word ptr [bx+12h]
        shr     dx, 1
        rcr     ax, 1
        add     ax, 3ch
        adc     dx, 0
        ret
br_0691:
        cmp     byte ptr [bp], 50h
        jne     br_06a4
        call    fn_4d41
        mov     cx, 46h
        mul     cl
        cwd
        add     ax, 26h
        ret
br_06a4:
        cmp     byte ptr [bp], 4fh
        jne     br_06af
        mov     ax, 28h
        cwd
        ret
br_06af:
        if      MODEL = 950
        cmp     byte ptr [bp], 4dh
        jne     br_06bc
        mov     ax, P_8148
        else
        cmp     byte ptr [bp], 46h
        jne     br_06bc
        mov     ax, word ptr [W_958C]
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        cwd
        else
        mov     dx, 0
        endif

        ret
br_06bc:
        cmp     byte ptr [bp], 44h
        jne     br_06c7
        mov     ax, 106h
        cwd
        ret
br_06c7:
        int     3

fn_06c8:
        if      MODEL = 950
        mov     ax, word ptr [W_B49C_S950]
        mov     word ptr [W_7CD4], ax
        elseif  (MODEL = 900) && (FW_VERSION < 400)
        mov     word ptr [W_7CD4], 0c40h
        else
        mov     word ptr [W_7CD4], 0c64h
        endif
        mov     word ptr [W_95EA], 0
        mov     word ptr [FP_02CE], DISK_CATALOG
        if      MODEL = 950
        mov     word ptr [W_02D0_2], 0
        else
        mov     word ptr [W_02D0], 0
        endif
        ret

fdc_command:
        lodsb
        cbw
        mov     cx, ax
        if      MODEL = 900
loop_06e5:
        mov     al, 0bh
loop_06e7:
        dec     al
        jne     loop_06e7
        endif
loop_06eb:
        in      al, 0
        and     al, 0c0h
        cmp     al, 80h
        jne     loop_06eb
        lodsb
        out     2, al
        if      MODEL = 950
        mov     al, 0ah
loop_23d4_s950:
        dec     al
        jne     loop_23d4_s950
        loop    loop_06eb
        else
        loop    loop_06e5
        mov     cx, 9
        nop
loop_06fc:
        loop    loop_06fc
        endif
        ret
loop_06ff:
        mov     ax, ERR_DISK_DIRECTORY_FULL_ERASE
        cmp     byte ptr [B_95C6], 0
        je      br_070c
        mov     ax, ERR_DISK_SAMPLE_SPACE_FULL
br_070c:
        jmp     error_restart

fdc_read_result:
        mov     di, FDC_RESULT
        if      MODEL = 900
loop_0712:
        mov     al, 0bh
loop_0714:
        dec     al
        jne     loop_0714
        endif
loop_0718:
        in      al, 0
        and     al, 0c0h
        cmp     al, 0c0h
        jne     loop_0718
        in      al, 2
        stosb
        if      MODEL = 950
        loop    loop_0718
        else
        loop    loop_0712
        endif
        ret

fn_0726:
        mov     byte ptr [di+10h], 0
        inc     byte ptr [B_95C6]
        mov     si, word ptr [di+14h]
        if      MODEL = 950
        jmp     word ptr [W_1E62_S950]
        endif
loop_0731:
        xor     ax, ax
        shl     si, 1
        xchg    word ptr [si+TBL_8EFE], ax

        inc     word ptr [W_95C4]
        xchg    si, ax
        jae     loop_0731
        ret
        if      MODEL = 950
loop_241b_s950:
        push    ds
        mov     ax, 1000h
        mov     ds, ax
        xor     ax, ax
        shl     si, 1
        xchg    word ptr [si+604h], ax
        pop     ds
        inc     word ptr [W_95C4]
        cmp     ax, 8000h
        xchg    si, ax
        jne     loop_241b_s950
        ret
        endif

disk_catalog_scan:
        mov     word ptr [W_95C8], ax
        mov     word ptr [W_95AC], sp
        if      MODEL = 950
        mov     al, 1
        out     8fh, al
        mov     al, byte ptr [B_B41C_S950]
        xor     al, 0ffh
        and     al, 2
        or      al, 0a9h
        else
        mov     al, 0bh
        endif
        out     8, al
        xchg    byte ptr [FLOPPY_CTRL], al
        and     al, 1
        jne     br_0764
        if      MODEL = 950
        mov     word ptr [W_95B0], 0dh
loop_2459_s950:
        call    word ptr [IDLE_HOOK]
        in      al, 6ah
        and     al, 1
        je      br_2466_s950
        call    loop_1878
br_2466_s950:
        test    word ptr [W_95B0], 8000h
        je      loop_2459_s950
br_0764:
        cmp     byte ptr [B_0497], 0
        jne     br_2495_s950
        mov     cx, 0ah
loop_2478_s950:
        push    cx
        mov     si, 1e1dh
        call    fdc_command
        call    fn_3f84_s950
        call    fn_13ee
        pop     cx
        and     al, 0f8h
        cmp     al, 20h
        je      br_2491_s950
        loop    loop_2478_s950
        jmp     br_099e
br_2491_s950:
        inc     byte ptr [B_0497]
br_2495_s950:
        call    br_0797
        else
        mov     word ptr [TIMER_TICKS], 0
loop_075a:
        call    timer_poll
        mov     al, byte ptr [TIMER_TICKS]
        cmp     al, 7
        endif
        if      FW_VERSION >= 400
mode_edit_sample:
        endif
        if      MODEL = 900
        jne     loop_075a
br_0764:
        call    fn_076e
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     byte ptr [MOTOR_TIMEOUT], 20h
        endif
        if      FW_VERSION = 210
        mov     byte ptr [MOTOR_TIMEOUT], 8
        endif
        if      FW_VERSION >= 400
        mov     byte ptr [MOTOR_TIMEOUT], 18h
        endif
        clc
        ret
        if      MODEL = 950

br_0797:
        call    fn_3f84_s950
loop_249d_s950:
        else

fn_076e:
        test    byte ptr [B_95F4], 0ffh
        jne     br_0797
        mov     si, P_02BE
        call    fdc_command
        call    fn_1853
        call    fn_13ee
        mov     ax, 28h
        call    fn_14b1
        call    fn_13ee
        and     al, 0f8h
        cmp     al, 20h
        je      br_0793
        jmp     br_099e
br_0793:
        inc     byte ptr [B_95F4]
br_0797:
        call    fn_1853
        endif
        in      al, 6ah
        and     al, 1
        je      br_07a3
        if      MODEL = 950
        call    loop_1878
        jmp     loop_249d_s950
        else
        call    fn_1872
        endif
br_07a3:
        mov     ax, word ptr [W_95C8]
        cmp     ah, 53h
        je      br_07b7
        mov     word ptr [W_95D6], 0
        mov     word ptr [W_95E4], 0
br_07b7:
        cmp     ax, 464dh
        jne     br_07bf
        jmp     br_0da2
br_07bf:
        cmp     al, 57h
        jne     br_07c6
        jmp     fn_08e1
br_07c6:
        cmp     al, 52h
        jne     br_07cd
        if      MODEL = 950
        jmp     fn_251f_s950
        else
        jmp     fn_07de
        endif
        db      90h
br_07cd:
        cmp     ax, 3f46h
        jne     br_07d5
        jmp     br_12fe
br_07d5:
        cmp     ax, 5744h
        jne     br_07dd
        jmp     br_13f7
br_07dd:
        int     3
        if      MODEL = 950

fn_07de:
        mov     word ptr [W_95C8], ax
        mov     word ptr [W_95AC], sp
        push    ax
        call    fn_38af_s950
        pop     ax
        cmp     ah, 53h
        je      br_2500_s950
        mov     word ptr [W_95D6], 0
        mov     word ptr [W_95E4], 0
br_2500_s950:
        cmp     al, 57h
        jne     br_2507_s950
        jmp     fn_27a6_s950
br_2507_s950:
        cmp     al, 52h
        jne     br_250e_s950
        jmp     fn_275a_s950
br_250e_s950:
        cmp     ax, 3f46h
        jne     br_2516_s950
        jmp     br_3616_s950
br_2516_s950:
        cmp     ax, 5744h
        jne     br_251e_s950
        jmp     br_3892_s950
br_251e_s950:
        ret

fn_251f_s950:
        mov     byte ptr [B_02C2], 3
loop_07e3:
        call    fn_14b1
        mov     word ptr [W_95B0], 3fh
        mov     bx, 4
        call    fn_2706_s950
        else

fn_07de:
        mov     byte ptr [B_02C2], 3
loop_07e3:
        mov     ax, word ptr [W_95EA]
        call    fn_14b1
        mov     bp, word ptr [W_95D6]
        mov     bx, word ptr [W_95E4]
        mov     dx, loop_0823
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      MODEL = 900
        cmp     word ptr [W_7CD4], 0
        jne     br_0805
        mov     dx, L_0838
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      MODEL = 900
        and     bp, bp
        jne     br_0805
        mov     dx, L_0859
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      MODEL = 900
br_0805:
        endif
        mov     byte ptr [B_02A9], 0c6h
        mov     si, P_02A8
        call    fdc_command
        if      MODEL = 950
        cmp     byte ptr [B_B4DD_S950], 53h
        jne     br_1181
        call    fn_2571_s950
        jmp     br_254d_s950
br_1181:
        call    fn_3dd3_s950
br_254d_s950:
        in      al, 6ah
        and     al, 1
        je      br_1181
        mov     al, 1
        out     8fh, al
        mov     cx, 7
        else
        mov     cx, word ptr [W_7CD4]
        les     di, [FP_02CE]
loop_0818:
        in      al, 0
        and     al, 20h
        je      loop_0818
        jmp     dx
loop_0820:
        in      al, 2
        stosb
loop_0823:
        in      al, 0
        test    al, 20h
        je      br_0880
        and     al, 0c0h
        cmp     al, 0c0h
        jne     loop_0823
        loop    loop_0820
        and     bp, bp
        je      br_0875
        in      al, 2
        stosb

L_0838:
        mov     cx, bp
        les     di, cs:[FP_95D2]
        jmp     br_0844
loop_0841:
        in      al, 2
        stosb
br_0844:
        in      al, 0
        test    al, 20h
        je      br_0880
        and     al, 0c0h
        cmp     al, 0c0h
        jne     br_0844
        loop    loop_0841
        and     bx, bx
        je      br_0875
        in      al, 2
        stosb

L_0859:
        mov     cx, bx
        les     di, cs:[FP_95E0]
        jmp     br_0866
loop_0862:
        in      al, 2
        inc     di
        stosb
br_0866:
        in      al, 0
        test    al, 20h
        je      br_0880
        and     al, 0c0h
        cmp     al, 0c0h
        jne     br_0866
        loop    loop_0862
        inc     di
br_0875:
        mov     al, 0fh
        out     8, al
        in      al, 2
        stosb
        mov     al, 0bh
        out     8, al
br_0880:
        xor     ax, ax
        mov     es, ax
        mov     cx, 7

L_0887:
        endif
        call    fdc_read_result
        test    word ptr [FDC_RESULT], 0b5c8h
        jne     br_0893
        ret
br_0893:
        dec     byte ptr [B_02C2]
        je      br_089c
        jmp     loop_07e3
br_089c:
        jmp     br_099e
        if      MODEL = 950

fn_2571_s950:
        mov     ax, word ptr [W_95E4]
        mov     word ptr [W_B48E_S950], ax
        mov     ax, word ptr [W_95D6]
        mov     word ptr [W_B48C_S950], ax
        mov     ax, word ptr [W_7CD4]
        mov     word ptr [W_B48A_S950], ax
        mov     ax, word ptr [W_95DC]
        mov     word ptr [W_B494_S950], ax
        mov     dx, word ptr [W_95DE]
        mov     word ptr [W_B496_S950], dx
        mov     ax, word ptr [W_95CE]
        mov     word ptr [W_B490_S950], ax
        mov     dx, word ptr [W_95D0]
        mov     word ptr [W_B492_S950], dx
        add     ax, word ptr [W_7CFE]
        adc     dx, word ptr [W_7D00]
        mov     word ptr [W_B498_S950], ax
        mov     word ptr [W_B49A_S950], dx
loop_25ae_s950:
        call    fn_3dd3_s950
        mov     ax, word ptr [W_B48A_S950]
        or      ax, word ptr [W_B48C_S950]
        or      ax, word ptr [W_B48E_S950]
        jne     br_25bf_s950
        ret
br_25bf_s950:
        in      ax, 84h
        sub     ax, word ptr [W_B486_S950]
        mov     bx, word ptr [W_B48A_S950]
        call    fn_26e0_s950
        jcxz    br_25d8_s950
        sub     word ptr [W_B48A_S950], cx
        sub     ax, cx
        add     word ptr [W_B486_S950], cx
br_25d8_s950:
        mov     bx, word ptr [W_B48C_S950]
        call    fn_26e0_s950
        and.w   cx, 0fffeh
        jne     br_25e8_s950
        jmp     br_267a_s950
br_25e8_s950:
        sub     word ptr [W_B48C_S950], cx
        push    ax
        push    cx
        mov     si, word ptr [W_B486_S950]
        mov     ax, word ptr [W_B488_S950]
        ror     ax, 4
        push    ds
        mov     ds, ax
        mov     bp, 0b490h
        call    fn_26e9_s950
        push    es
        mov     es, ax
        mov     di, dx
        add     word ptr [bp], cx
        adc     word ptr [bp+2], 0
        shr     cx, 1
        push    cx
        push    si
        rep movsw
        mov     bp, 0b498h
        cmp     byte ptr ss:[0b464h], cl
        je      br_2621_s950
        pop     si
        pop     cx
        jmp     br_2669_s950
br_2621_s950:
        call    fn_26e9_s950
        mov     es, ax
        mov     di, dx
        pop     si
        pop     ax
        cwd
        mov     cx, 8
        div     cx
        mov     cx, ax
        jcxz    br_265e_s950
loop_2634_s950:
        lodsw
        shl     ax, 4
        stosw
        lodsw
        shl     ax, 4
        stosw
        lodsw
        shl     ax, 4
        stosw
        lodsw
        shl     ax, 4
        stosw
        lodsw
        shl     ax, 4
        stosw
        lodsw
        shl     ax, 4
        stosw
        lodsw
        shl     ax, 4
        stosw
        lodsw
        shl     ax, 4
        stosw
        loop    loop_2634_s950
br_265e_s950:
        mov     cx, dx
        jcxz    br_2669_s950
loop_2662_s950:
        lodsw
        shl     ax, 4
        stosw
        loop    loop_2662_s950
br_2669_s950:
        pop     es
        pop     ds
        pop     cx
        add     word ptr [bp], cx
        adc     word ptr [bp+2], 0
        pop     ax
        sub     ax, cx
        add     word ptr [W_B486_S950], cx
br_267a_s950:
        cmp     word ptr [W_B48C_S950], 0
        jne     br_26dd_s950
        mov     bx, word ptr [W_B48E_S950]
        call    fn_26e0_s950
        jcxz    br_26dd_s950
        sub     word ptr [W_B48E_S950], cx
        mov     si, word ptr [W_B486_S950]
        mov     ax, word ptr [W_B488_S950]
        add     word ptr [W_B486_S950], cx
        ror     ax, 4
        push    ds
        mov     ds, ax
        mov     bp, 0b494h
        call    fn_26e9_s950
        push    es
        mov     es, ax
        mov     di, dx
        mov     ax, cx
        cwd
        add     word ptr [bp], ax
        adc     word ptr [bp+2], dx
        add     word ptr [bp], ax
        adc     word ptr [bp+2], dx
        mov     cx, 8
        div     cx
        xchg    cx, ax
        jcxz    br_26d3_s950
loop_26c1_s950:
        inc     di
        movsb
        inc     di
        movsb
        inc     di
        movsb
        inc     di
        movsb
        inc     di
        movsb
        inc     di
        movsb
        inc     di
        movsb
        inc     di
        movsb
        loop    loop_26c1_s950
br_26d3_s950:
        mov     cx, dx
        jcxz    br_26db_s950
loop_26d7_s950:
        inc     di
        movsb
        loop    loop_26d7_s950
br_26db_s950:
        pop     es
        pop     ds
br_26dd_s950:
        jmp     loop_25ae_s950

fn_26e0_s950:
        mov     cx, ax
        cmp     ax, bx
        jb      br_26e8_s950
        mov     cx, bx
br_26e8_s950:
        ret

fn_26e9_s950:
        mov     dx, 1c4h
        mov     al, byte ptr [bp+2]
        out     dx, al
        inc     al
        mov     dx, 1c6h
        out     dx, al
        mov     ax, word ptr [bp]
        mov     dx, ax
        and.w   dx, 0fh
        shr     ax, 4
        add     ax, 2000h
        ret

fn_2706_s950:
        mov     ax, word ptr [W_7CD4]
        add     ax, word ptr [W_95D6]
        add     ax, word ptr [W_95E4]
        xchg    bp, ax
        mov     di, 1e7ch
        cmp     byte ptr [B_B4DD_S950], 53h
        je      fn_2723_s950
        mov     bp, word ptr [W_7CD4]
        mov     di, FP_02CE

fn_2723_s950:
        mov     al, 1
        out     8fh, al
        mov     al, 0
        out     81h, al
        mov     al, bl
        out     8ah, al
        mov     ax, 10h
        mul     word ptr [di+2]
        add     ax, word ptr [di]
        adc     dl, 0
        out     84h, ax
        mov     word ptr [W_B486_S950], ax
        xchg    dx, ax
        out     86h, al
        mov     word ptr [W_B488_S950], ax
        mov     ax, bp
        test    bh, 0ffh
        je      br_2752_s950
        add     ax, 1ffh
        and     ax, 0fe00h
br_2752_s950:
        dec     ax
        out     82h, ax
        mov     al, 0
        out     8fh, al
        ret

fn_275a_s950:
        mov     si, 1df4h
        jmp     br_27a9_s950
        db      90h

mode_disk:
        mov     word ptr [MODE_SP], sp
        mov     word ptr [FIELD_RECENT], P_0EE0
        else

mode_disk:
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    fn_2e52_os21
        mov     word ptr [MODE_SP], sp
        mov     word ptr [FIELD_RECENT], FLD_CLEAR_MEMORY_AND_LOAD
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     word ptr [LAST_FIELD_PTR], FLD_LOAD_PROGRM_NAME
        endif
        if      FW_VERSION >= 400
        call    fn_15fa
        mov     word ptr [MODE_SP], sp
        mov     word ptr [FIELD_RECENT], FLD_ENSEMBLE
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        mov     word ptr [LAST_FIELD_PTR], DISK_LAST_FIELD
        mov     ax, word ptr [DISK_LAST_FIELD]
        mov     word ptr [FIELD_PREVIOUS], ax
        endif
        if      MODEL = 950
        xor     ax, ax
        mov     byte ptr [B_95BC], al
        mov     word ptr [W_02D0_2], ax
        mov     byte ptr [B_02D2], al

L_2781_s950:
        call    disk_menu_action_guard
        call    word ptr [W_1E6E_S950]
        else

        mov     byte ptr [B_95BC], 0
        mov     ax, 3f46h
        call    disk_catalog_scan
        endif
        call    fn_29a6
        mov     word ptr [MODE_FILL], disk_fill
        call    disk_fill
        mov     word ptr [LCD_SCROLL_MAX], 0ffh
        mov     word ptr [IDLE_HOOK], idle_tasks
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     ax, FIELDS_CLEAR_MEMORY_AND_LOAD
        else
        mov     ax, P_0EAE
        endif
        jmp     menu_navigation_loop
        if      MODEL = 950

fn_27a6_s950:
        mov     si, 1df8h
br_27a9_s950:
        mov     ax, word ptr [W_95EA]
        mov     cx, 10h
        mul     cx
        mov     word ptr [W_B482_S950], ax
        mov     word ptr [W_B484_S950], dx
        mov     ax, word ptr [W_7CD4]
        add     ax, word ptr [W_95D6]
        add     ax, word ptr [W_95E4]
        mov     word ptr [B_02D2+2], ax
        jmp     br_38d3_s950
fn_08e1:
        test    byte ptr [B_95FD], 40h
        je      br_27d3_s950
        jmp     br_09c9
br_27d3_s950:
        cmp     byte ptr [B_B464_S950], 0
        je      br_27e0_s950
        mov     ax, MSG_CANT_DO_THIS
        jmp     error_restart
br_27e0_s950:
        call    fn_14b1
        cmp     byte ptr [B_B4DD_S950], 53h
        jne     br_27ed_s950
        call    fn_2823_s950
br_27ed_s950:
        mov     word ptr [W_95B0], 3fh
        mov     bx, 8
        call    fn_2706_s950
        else

fn_08e1:
        test    byte ptr [B_95FD], 40h
        je      br_08eb
        jmp     br_09c9
br_08eb:
        mov     ax, word ptr [W_95EA]
        call    fn_14b1
        mov     bp, word ptr [W_95D6]
        mov     bx, word ptr [W_95E4]
        mov     di, loop_092b
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      MODEL = 900
        cmp     word ptr [W_7CD4], 0
        jne     br_090d
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     di, L_0940
        nop
        endif
        if      FW_VERSION >= 210

fn_0903:
        mov     di, L_0940
        endif
        if      MODEL = 900

        and     bp, bp
        jne     br_090d
        mov     di, L_0961
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      MODEL = 900
br_090d:
        endif
        mov     byte ptr [B_02A9], 0c5h
        mov     si, P_02A8
        call    fdc_command
        if      MODEL = 950
loop_2804_s950:
        call    fn_3dd3_s950
        in      al, 6ah
        and     al, 1
        je      loop_2804_s950
        mov     al, 1
        out     8fh, al
        mov     cx, 7
        else
        mov     cx, word ptr [W_7CD4]
        lds     si, [FP_02CE]
loop_0920:
        in      al, 0
        and     al, 20h
        je      loop_0920
        jmp     di
loop_0928:
        lodsb
        out     2, al
loop_092b:
        in      al, 0
        test    al, 20h
        je      br_0988
        and     al, 0c0h
        cmp     al, 80h
        jne     loop_092b
        loop    loop_0928
        and     bp, bp
        je      br_097d
        lodsb
        out     2, al

L_0940:
        mov     cx, bp
        lds     si, cs:[FP_95D2]
        jmp     br_094c
loop_0949:
        lodsb
        out     2, al
br_094c:
        in      al, 0
        test    al, 20h
        je      br_0988
        and     al, 0c0h
        cmp     al, 80h
        jne     br_094c
        loop    loop_0949
        and     bx, bx
        je      br_097d
        lodsb
        out     2, al

L_0961:
        mov     cx, bx
        lds     si, cs:[FP_95E0]
        jmp     br_096e
loop_096a:
        inc     si
        lodsb
        out     2, al
br_096e:
        in      al, 0
        test    al, 20h
        je      br_0988
        and     al, 0c0h
        cmp     al, 80h
        jne     br_096e
        loop    loop_096a
        inc     si
br_097d:
        mov     al, 0fh
        out     8, al
        lodsb
        out     2, al
        mov     al, 0bh
        out     8, al
br_0988:
        xor     ax, ax
        mov     ds, ax
        mov     cx, 7

L_098f:
        endif
        call    fdc_read_result
        test    word ptr [FDC_RESULT], 0b3c8h
        jne     br_099b
        ret
br_099b:
        jmp     br_099e
        db      90h
        if      MODEL = 950

fn_2823_s950:
        push    ds
        push    es
        les     di, [FP_1E7C_S950]
        mov     cx, word ptr [W_7CD4]
        lds     si, [FP_02CE]
        jcxz    br_2835_s950
        rep movsb
br_2835_s950:
        mov     cx, word ptr ss:[W_95D6]
        jcxz    br_2880_s950
        shr     cx, 1
        mov     bp, 0b4e4h
        call    fn_26e9_s950
        mov     ds, ax
        mov     si, dx
        push    cx
        push    di
        rep movsw
        pop     di
        pop     cx
        mov     ax, word ptr [bp]
        mov     dx, word ptr [bp+2]
        add     ax, word ptr ss:[W_7CFE]
        adc     dx, word ptr ss:[W_7D00]
        mov     bp, 0b498h
        mov     word ptr [bp], ax
        mov     word ptr [bp+2], dx
        call    fn_26e9_s950
        mov     ds, ax
        mov     si, dx
        mov     bx, 0f00fh
loop_2871_s950:
        lodsw
        shr     ax, 4
        mov     ah, byte ptr es:[di]
        and     ax, bx
        or      al, ah
        stosb
        inc     di
        loop    loop_2871_s950
br_2880_s950:
        mov     cx, word ptr ss:[W_95E4]
        jcxz    br_2895_s950
        mov     bp, W_95DC
        call    fn_26e9_s950
        mov     ds, ax
        mov     si, dx
loop_2891_s950:
        inc     si
        movsb
        loop    loop_2891_s950
br_2895_s950:
        pop     es
        pop     ds
        ret
        endif
br_099e:
        mov     ax, ERR_BAD_DATA_FROM_DISK
        cmp     word ptr [W_95C8], 3f46h
        jne     br_09cc
        xor     ax, ax
        mov     ds, ax
        mov     es, ax
        dec     ax
        mov     byte ptr [B_02D2], al
loop_09b3:
        if      MODEL = 950
        mov     sp, word ptr [W_95AC]
        mov     al, 1
        out     8fh, al
        mov     al, 0
        out     8, al
        mov     byte ptr [FLOPPY_CTRL], al
        mov     byte ptr [B_0443], al
        mov     byte ptr [B_0497], al
        mov     byte ptr [B_04D7], al
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        mov     byte ptr [MOTOR_TIMEOUT], 20h
        elseif  FW_VERSION = 210
        mov     byte ptr [MOTOR_TIMEOUT], 8
        else
        mov     byte ptr [MOTOR_TIMEOUT], 18h
        endif
        if      MODEL = 900
        mov     sp, word ptr [W_95AC]
        endif
        ret
loop_09bd:
        cmp     byte ptr [B_95BC], 0
        jne     loop_09b3
        mov     ax, ERR_DISK_NOT_MOUNTED
        jmp     br_09cc
br_09c9:
        mov     ax, ERR_DISK_WRITE_PROTECTED_TAKE
br_09cc:
        push    ax
        call    thk_program_sample_tag_scan
        if      MODEL = 900
        call    program_sample_name_xref_resolve
        endif
        pop     ax
        jmp     error_restart

clear_memory_and_load:
        if      MODEL = 950
        call    sample_field
        jne     br_09dd
        ret
br_09dd:
        mov     byte ptr [si], 20h
        cmp     al, 31h
        je      br_2965_s950
        cmp     al, 32h
        jne     fn_28f1_s950
        jmp     br_298e_s950

fn_28f1_s950:
        call    program_sample_tag_scan
        mov     bx, SLOTS
        mov     bp, SLOT_TAGS
        mov     cx, SLOT_COUNT
loop_28fd_s950:
        cmp     byte ptr [bp], 50h
        jne     br_2912_s950
        cmp     byte ptr [bx+0ah], 0ffh
        jne     br_2912_s950
        cmp     al, 1
        je      br_2912_s950
        call    fn_04d6_s950
        dec     al
br_2912_s950:
        cmp     byte ptr [bp], 53h
        jne     br_2921_s950
        cmp     byte ptr [bx+0ah], 0ffh
        jne     br_2921_s950
        call    fn_04d6_s950
br_2921_s950:
        inc     bp
        add     bx, 46h
        loop    loop_28fd_s950
        cmp     byte ptr [B_B457_S950], cl
        je      L_5b5b_os21
        mov     si, 0b42eh
        mov     di, MIDI_SETTINGS
        mov     cx, 28h
        rep movsb
        mov     byte ptr [B_B457_S950], cl
L_5b5b_os21:
        call    fn_78a8_s950
        mov     dx, MIDI_SETTINGS
        call    find_program
        jae     br_295c_s950
        mov     ax, SLOTS
        mov     bp, SLOT_TAGS
        mov     cx, SLOT_COUNT
loop_2950_s950:
        cmp     byte ptr [bp], 50h
        je      br_295c_s950
        inc     bp
        add     ax, 46h
        jmp     loop_2950_s950
br_295c_s950:
        mov     word ptr [CUR_PROGRAM], ax
        call    disk_fill
        jmp     lcd_redraw
br_2965_s950:
        call    fn_2984_s950
        mov     al, 4dh
loop_296a_s950:
        cmp     byte ptr [di+10h], al
        je      br_2977_s950
        add     di, 18h
        loop    loop_296a_s950
        jmp     fn_29b2_s950
        db      90h
br_2977_s950:
        pusha
        call    fn_2e52_os21
        popa
        call    show_loading
        mov     dx, di
        jmp     disk_catalog_entry_handler

fn_2984_s950:
        mov     di, DISK_CATALOG
        mov     cx, word ptr [W_1E78_S950]
        sub     ax, ax
        ret
br_298e_s950:
        mov     byte ptr [B_04D7], 0ffh
        mov     si, SLOT_TAGS
        mov     bx, SLOTS
        mov     cx, SLOT_COUNT
loop_299c_s950:
        lodsb
        cmp     al, 53h
        jne     br_29a5_s950
        mov     byte ptr [bx+0ah], 0ffh
br_29a5_s950:
        cmp     al, 50h
        jne     br_29ad_s950
        mov     byte ptr [bx+0ah], 0ffh
br_29ad_s950:
        add     bx, 46h
        loop    loop_299c_s950

fn_29b2_s950:
        else
        call    take_enter
        jne     br_09dd
        ret
br_09dd:
        endif
        call    disk_menu_action_guard
        call    show_loading
        if      MODEL = 950
        cmp     byte ptr [B_04D7], 0
        jne     br_2a08_s950
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     al, 46h
        mov     dx, P_0C18
        nop
        call    disk_catalog_entry_handler
        jb      br_308b_v12a
        call    P_80BC
br_308b_v12a:
        endif
        xor     di, di
        mov     al, 50h
        mov     si, P_890E
        if      MODEL = 950
        mov     cx, word ptr [W_1E78_S950]
        else
        mov     cx, 40h
        endif
loop_09ed:
        cmp     byte ptr [si], al
        je      br_09ff
        add     si, 18h
        loop    loop_09ed
        mov     di, SLOT_TAGS
        mov     cx, SLOT_COUNT
        repne scasb
        dec     di
br_09ff:
        mov     bp, SLOT_TAGS
        mov     bx, SLOTS
        mov     cx, SLOT_COUNT
loop_0a08:
        cmp     byte ptr [bp], 53h
        je      br_0a22
        cmp     byte ptr [bp], 50h
        jne     br_0a27
        cmp     bp, di
        jne     br_0a22
        mov     word ptr [CUR_PROGRAM], bx
        mov     word ptr [W_7CD8], bx
        jmp     br_0a27
br_0a22:
        if      MODEL = 950
        call    fn_04d6_s950
        else
        pusha
        call    fn_2187
        popa
        endif
br_0a27:
        inc     bp
        add     bx, 46h
        loop    loop_0a08
        if      MODEL = 950
br_2a08_s950:
        call    fn_2984_s950
        else
        mov     di, DISK_CATALOG
        mov     cx, 40h
        endif
        mov     al, 50h
        call    fn_0a65
        call    fn_0b70
        if      MODEL = 950
        call    fn_2ae3_s950
L_1006:
        call    fn_2984_s950
        mov     al, 53h
        mov     byte ptr [B_B41F_S950], 0
        call    fn_0a65
        mov     byte ptr [B_04D7], 0
        call    word ptr [IDLE_HOOK]
        else
        cmp     byte ptr [B_4403], 0
        je      br_0a4d
        mov     dx, P_02C4
        mov     al, 44h
        endif
        if      FW_VERSION >= 210

L_0a47:
        endif
        if      MODEL = 900

        call    disk_catalog_entry_handler
        call    fn_1d22
br_0a4d:
        mov     di, DISK_CATALOG
        mov     cx, 40h
        mov     al, 53h
        call    fn_0a65
        endif
        jmp     fn_0ab5
        if      FW_VERSION < 400
        db      90h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
P_0C18:
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      "FIXUPS    "
        endif
        if      FW_VERSION >= 400
        db      90h, 46h
P_0A5C:
        db      "IXUPS    "
        endif

fn_0a65:
        cmp     al, byte ptr [di+10h]
        jne     br_0a71
        mov     dx, di
        if      MODEL = 950
loop_2a36_s950:
        mov     byte ptr [B_B421_S950], 0
        endif
        pusha
        call    disk_catalog_entry_handler
        popa
        if      MODEL = 950
        cmp     byte ptr [B_B421_S950], 0
        jne     loop_2a36_s950
        cmp     byte ptr [B_B41F_S950], 0
        jne     br_2a53_s950
        endif
br_0a71:
        add     di, 18h
        loop    fn_0a65
        if      MODEL = 950
br_2a53_s950:
        else
        ret

L_0a77:
        endif
        ret

load_program:
        call    take_enter
        if      MODEL = 900
        jne     br_0a7e
        ret
br_0a7e:
        endif
        mov     word ptr [W_95FE], bp
        call    show_loading
        call    disk_menu_action_guard
        mov     dx, P_035B
        push    dx
        mov     al, 50h
        call    disk_catalog_entry_handler
        pop     dx
        call    find_program
        jb      br_0ab8
        if      FW_VERSION < 400
        cmp     word ptr [W_95FE], FLD_PR_AND_SAMPLES
        else
        cmp     word ptr [W_95FE], FLD_LOAD_PROGRM_PR_AND_SMPLS
        endif
        jne     fn_0ab5
        mov     bx, word ptr [bx+12h]
loop_0aa2:
        lea     dx, [bx+18h]
        call    fn_0ac5
        lea     dx, [bx+2eh]
        call    fn_0ac5
        mov     bx, word ptr [bx+44h]
        and     bx, bx
        jne     loop_0aa2

fn_0ab5:
        call    thk_program_sample_tag_scan
br_0ab8:
        call    program_sample_name_xref_resolve
        call    disk_fill
loop_0abe:
        call    fn_66aa
        sti
        if      MODEL = 950
        call    word ptr [W_1E6E_S950]
        endif
        jmp     lcd_redraw

fn_0ac5:
        push    bx
        call    find_sample
        jae     br_0ad0
        mov     al, 53h
        call    disk_catalog_entry_handler
br_0ad0:
        pop     bx
        ret

erase_program:
        mov     byte ptr [B_95CC], 50h
        mov     word ptr [W_95CA], P_04F6
loop_0add:
        call    take_enter
        if      MODEL = 900
        jne     br_0ae3
        ret
br_0ae3:
        endif
        call    disk_menu_action_guard
        mov     bx, word ptr [W_95CA]
        mov     al, byte ptr [B_95CC]
        if      FW_VERSION >= 210

L_0aed:
        endif

        call    disk_catalog_find
        jne     br_0af8
        call    fn_0726
        jmp     br_0cd6
br_0af8:
        jmp     loop_0abe

load_drum_settings:
        call    take_enter
        if      MODEL = 900
        jne     br_0b00
        ret
br_0b00:
        endif
        call    show_loading
        call    disk_menu_action_guard
        if      MODEL = 950
        call    fn_2ae3_s950
        jmp     br_0cdc

fn_2ae3_s950:
        mov     dx, MSG_DRUM_SET_FLOPPY_HARD
        else
        mov     dx, P_02C4
        endif
        mov     al, 44h
        call    disk_catalog_entry_handler
        if      MODEL = 950
        jb      br_2af0_s950
        call    fn_1843_s950
br_2af0_s950:
        ret
        else
        call    fn_1d22
        jmp     br_0cdc
        endif

save_drum_settings:
        call    take_enter
        if      MODEL = 900
        jne     br_0b1a
        ret
br_0b1a:
        endif
        call    show_saving
        call    disk_menu_action_guard
        if      MODEL = 950
        mov     bx, MSG_DRUM_SET_FLOPPY_HARD
        else
        mov     bx, P_02C4
        endif
        mov     bp, bx
        call    fn_1607
        jmp     br_0cd6

load_sample:
        call    take_enter
        if      MODEL = 900
        jne     br_0b31
        ret
br_0b31:
        endif
        call    show_loading
        call    disk_menu_action_guard
        mov     dx, P_03B1
        mov     al, 53h
        call    disk_catalog_entry_handler
        jmp     br_0ab8
        if      MODEL = 950

load_all_samples:
        call    take_enter
        call    show_loading
        call    disk_menu_action_guard
        jmp     L_1006
        endif

erase_sample:
        mov     byte ptr [B_95CC], 53h
        mov     word ptr [W_95CA], P_04E6
        jmp     loop_0add
        if      MODEL = 950

set_hard_disk_unit:
        mov     ax, word ptr [bp+9]
        cmp     ax, word ptr [bp+0fh]
        je      br_2b48_s950
        mov     word ptr [bp+0fh], ax
        mov     byte ptr [B_B46D_S950], 0
        call    disk_menu_action_guard
        jmp     fn_0ab5
br_2b48_s950:
        ret
        else
        db      0c3h, 0c3h

L_0b51:
        call    take_enter
        jne     br_0b57
        ret
br_0b57:
        call    disk_menu_action_guard
        call    fn_0b70
        jmp     fn_0ab5
        endif
P_0B60:
        db      "OVERALL SETTINGS"

fn_0b70:
        mov     al, 4fh
        mov     dx, P_0B60
        call    disk_catalog_entry_handler
        if      MODEL = 950
        jb      br_0b9b
        mov     bx, 0b42eh
        cmp     byte ptr [B_04D7], 0
        jne     br_2b7c_s950
        endif
        mov     dx, MIDI_SETTINGS
        call    find_program
        jb      br_0b84
        mov     word ptr [CUR_PROGRAM], bx
br_0b84:
        mov     bx, MIDI_SETTINGS
        if      MODEL = 950
br_2b7c_s950:
        endif
        cmp     byte ptr [bx+1bh], 0ffh
        jne     br_0b91
        mov     byte ptr [bx+1bh], 80h
br_0b91:
        cmp     byte ptr [bx+23h], 0
        jne     br_0b9b
        mov     byte ptr [bx+23h], 7
br_0b9b:
        ret

clear_disk_and_save:
        call    take_enter
        if      MODEL = 950
        call    disk_menu_action_guard
        call    show_saving
        mov     si, 2bcah
        else
        jne     br_0ba2
        ret
br_0ba2:
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    fn_2e52_os21
        endif
        if      FW_VERSION >= 400
        call    fn_15fa
        endif
        if      MODEL = 900
        cmp     byte ptr [B_02D2], 0
        je      br_0bb2
        mov     ax, 464dh
        call    disk_catalog_scan
br_0bb2:
        call    show_saving
        endif
        if      FW_VERSION >= 210
        mov     si, P_0C22
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        mov     di, SLOTS
        mov     cx, 0ah
        repe cmpsb
        jne     br_0c2c
        endif
        if      MODEL = 950
        mov     byte ptr [B_0043_S950], 2
        mov     word ptr [FP_02CE], 0
        mov     word ptr [W_02D0_2], 0
        mov     word ptr [W_7CD4], P_8148
        mov     bx, 2bd5h
        mov     bp, 2bd4h
        endif
        if      FW_VERSION >= 210
        mov     word ptr [FP_02CE], ffile_buf
        mov     word ptr [W_958C], 8ch
        mov     bx, P_0C18
        mov     bp, bx
        call    fn_1607

        mov     word ptr [FP_02CE], 0
        endif
        if      FW_VERSION = 210
        mov     word ptr [W_958C], P_8148
        endif
        if      FW_VERSION >= 400
        push    ax
        push    cx
        push    es
        push    ds
        push    di
        push    si
        xor     ax, ax
        mov     es, ax
        mov     ax, DISK_LAST_FIELD
        mov     cx, 1ce3h
        sub     cx, ax
        mov     ax, cx
        mov     si, 3700h
        inc     si
        mov     di, SYSEX_CHECKSUM
        add     ax, di
        mov     word ptr [W_958C], ax
        mov     ax, 8000h
        mov     ds, ax
loop_0c01:
        lodsb
        stosb
        inc     si
        loop    loop_0c01
        pop     si
        pop     di
        pop     ds
        pop     es
        pop     cx
        pop     ax
        endif
        if      FW_VERSION >= 210
        mov     bx, P_8126
        mov     bp, P_0C18
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        call    fn_1607
        jmp     br_0cd6
        endif
        if      (MODEL = 950) && (FW_VERSION = 100)
        db      "#### #####MS950  1.0 "
        endif
        if      (MODEL = 950) && (FW_VERSION = 120)
        db      "#### #####MS950  1.2 "
        endif
        if      MODEL = 950

fn_2bdf_s950:
        call    fn_2984_s950
loop_2be2_s950:
        cmp     byte ptr [di+10h], ch
        je      br_2bea_s950
        call    fn_0726
br_2bea_s950:
        add     di, 18h
        loop    loop_2be2_s950
        ret
br_0c2c:
        call    fn_2bdf_s950
        endif
        if      FW_VERSION >= 210
P_0C18:
        db      "FIXUPS    "
P_0C22:
        endif
        if      FW_VERSION = 210
        db      "GALLUS FAC"
        endif
        if      FW_VERSION >= 400
        db      "#### #####"
        endif
        if      FW_VERSION >= 210
br_0c2c:
        endif
        if      MODEL = 900

        mov     di, DISK_CATALOG
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        xor     ax, ax
        mov     cx, 0c40h
        endif
        if      FW_VERSION >= 400
        mov     cx, 40h
loop_0c32:
        mov     ax, word ptr [di+14h]
        cmp     ax, 0
        je      br_0c44
        push    cx
        call    fn_0726
        pop     cx
        add     di, 18h
        loop    loop_0c32
br_0c44:
        mov     cx, 600h
        xor     ax, ax
        mov     di, DISK_CATALOG
        endif
        if      MODEL = 900
        rep stosb
        endif
        call    fn_1306
        if      (MODEL = 900) && (FW_VERSION < 210)
        cmp     word ptr [W_958C], 0
        je      br_3279_v12a
        mov     bx, P_0C18
        mov     bp, bx
        call    fn_1607
br_3279_v12a:
        mov     al, 50h
        mov     si, 33cbh
        nop
        else
        mov     al, 50h
        mov     si, P_0DA1
        endif

        call    fn_0c76
        call    fn_0d28
        if      MODEL = 950
        mov     bx, MSG_DRUM_SET_FLOPPY_HARD
        else
        cmp     byte ptr [B_4403], 0
        je      br_0c6b
        mov     bx, P_02C4
        endif
        mov     bp, bx
        call    fn_1607
        if      MODEL = 950
        mov     al, 53h
        call    word ptr [W_1E7A_S950]
        else
br_0c6b:
        mov     al, 53h
        mov     si, fn_1335
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    fn_0c76
        jmp     br_0cd6
        db      90h
        if      MODEL = 950

L_2c15_s950:
        mov     byte ptr [B_B426_S950], 0ffh
        ret
        endif

fn_0c76:
        mov     bp, SLOT_TAGS
        mov     bx, SLOTS
        mov     cx, SLOT_COUNT
loop_0c7f:
        cmp     al, byte ptr [bp]
        jne     br_0c8b
        pusha
        if      MODEL = 900
        call    si
        endif
        call    fn_1607
        popa
br_0c8b:
        add     bx, 46h
        inc     bp
        loop    loop_0c7f
        ret
        if      MODEL = 900

L_0c92:
        ret
        endif

save_program:
        call    take_enter
        if      MODEL = 900
        jne     br_0c99
        ret
br_0c99:
        endif
        mov     word ptr [W_95FE], bp
        call    fn_0d7b
        call    show_saving
        mov     dx, P_044B
        call    find_program
        jb      br_0cdc
        mov     word ptr [W_95F2], bx
        mov     al, 50h
        call    fn_1601
        cmp     word ptr [W_95FE], FLD_SAVE_PROGRM_PR_AND_SMPLS
        jne     br_0cd6
        mov     bx, word ptr [W_95F2]
        mov     bx, word ptr [bx+12h]
loop_0cc3:
        lea     dx, [bx+18h]
        call    fn_0ce5
        lea     dx, [bx+2eh]
        call    fn_0ce5
        mov     bx, word ptr [bx+44h]
        and     bx, bx
        jne     loop_0cc3
br_0cd6:
        mov     ax, 5744h
        if      MODEL = 950
        call    word ptr [W_1E64_S950]
        else
        call    disk_catalog_scan
        endif
br_0cdc:
        call    fn_1306
        call    disk_fill
        jmp     loop_0abe

fn_0ce5:
        push    bx
        mov     al, 53h
        mov     bx, dx
        call    disk_catalog_find
        mov     dx, bx
        je      br_0cf6
        mov     al, 53h
        if      MODEL = 950
        call    find_sample
        jb      br_0cf6
        call    fn_1607
        else
        call    fn_1d30
        endif
br_0cf6:
        pop     bx
        ret

save_sample:
        call    take_enter
        if      MODEL = 900
        jne     br_0cfe
        ret
br_0cfe:
        endif
        mov     dx, P_04A1
        call    find_sample
        jae     br_0d09
        jmp     lcd_redraw
br_0d09:
        if      MODEL = 900
        call    fn_1335
        endif
        call    fn_0d7b
        call    show_saving
        call    fn_1607
        jmp     br_0cd6
        if      MODEL = 950

park_hard_disk:
        call    take_enter
        mov     si, 1dech
        jmp     br_38d3_s950
        else

L_0d17:
        call    take_enter
        jne     br_0d1d
        ret
br_0d1d:
        call    fn_0d7b
        call    show_saving
        call    fn_0d28
        jmp     br_0cd6
        endif

fn_0d28:
        mov     di, MIDI_SETTINGS
        mov     si, word ptr [CUR_PROGRAM]
        mov     cx, 5
        rep movsw
        mov     bx, P_0B60
        mov     bp, bx
        jmp     fn_1607

format_disk:
        call    take_enter
        if      MODEL = 900
        jne     br_0d42
        ret
br_0d42:
        endif
        if      FW_VERSION < 400
        call    fn_2e52_os21
        else
        call    fn_15fa
        endif
        mov     ax, 464dh
        call    disk_catalog_scan
        mov     ax, 3f46h
        call    disk_catalog_scan
        call    disk_fill
        jmp     br_0ab8
        if      MODEL = 950

B_2CEB_S950:
        db      00h

format_hard_disk:
        mov     al, 46h
        jmp     br_2cf2_s950

wipe_hard_disk:
        mov     al, 0
br_2cf2_s950:
        mov     byte ptr [B_2CEB_S950], al
        call    take_enter
        call    fn_3089_s950
        call    fn_231b_s950
        cmp     byte ptr [B_2CEB_S950], 46h
        jne     br_2d0b_s950
        mov     si, 1df0h
        call    br_38d3_s950
br_2d0b_s950:
        push    es
        les     di, [FP_1E7C_S950+0ch]
        xor     ax, ax
        mov     cx, 600h
        rep stosb
        mov     ax, word ptr [B_02D2+4]
        stosw
        mov     ax, 0ffh
        stosw
        mov     di, 604h
        mov     ax, 0ffffh
        mov     cx, 8
        mov     cx, 4
        rep stosw
        inc     ax
        mov     cx, 1dc4h
        rep stosw
        pop     es
        mov     ax, 5744h
        call    fn_07de
        mov     di, word ptr [W_05F6]
        mov     ax, word ptr [B_02D2+4]
        sub     ax, 4
        mov     cx, 2000h
        mul     cx
        call    fn_3c3d_s950
        div     cx
        cwd
        mov     cx, 3e8h
        div     cx
        add     al, 30h
        stosb
        xchg    dx, ax
        mov     cl, 64h
        div     cl
        add     al, 30h
        stosb
        mov     al, ah
        mov     ah, 0
        mov     cl, 0ah
        div     cl
        add     ax, 3030h
        stosw
        call    fn_376c_s950
        jmp     lcd_redraw

rename_volume:
        call    take_enter
        call    fn_2e74_s950
        jne     br_2d7f_s950
loop_2d79_s950:
        mov     ax, MSG_CANT_DO_THIS
        jmp     error_restart
br_2d7f_s950:
        mov     di, 1f3ah
        mov     si, 1eb0h
        mov     cx, 5
        repe cmpsw
        je      loop_2d79_s950
        mov     dx, 1f3ah
        call    fn_2fa3_s950
        jae     loop_2d79_s950
        mov     dx, 1f10h
        call    fn_2fa3_s950
        jb      loop_2d79_s950
        cmp     byte ptr [B_1F20_S950+1ah], 2dh
        jne     br_2de6_s950
        push    ds
        mov     ax, 1000h
        mov     ds, ax
        xor     ax, ax
        xchg    word ptr [si+0ah], ax
        add     ax, ax
        xchg    si, ax
        xor     ax, ax
        mov     word ptr [si+604h], ax
        pop     ds
        call    fn_2bdf_s950
        call    fn_3f56_s950
        mov     ax, 5744h
        call    fn_07de
        call    fn_2327_s950
        and     ax, ax
        jne     br_2dd8_s950
        mov     si, 1eb0h
        mov     di, 1f10h
        mov     cx, 5
        rep movsw
        jmp     br_2de0_s950
br_2dd8_s950:
        xor     ax, ax
        mov     dx, 1f10h
        call    fn_2dfc_s950
br_2de0_s950:
        call    disk_menu_action_guard
        jmp     br_0cdc
br_2de6_s950:
        mov     di, si
        mov     si, 1f3ah
        call    fn_2e18_s950
        mov     si, 1f3ah
        mov     di, 1f10h
        mov     cx, 5
        rep movsw
        jmp     br_2e6b_s950
        db      90h

fn_2dfc_s950:
        mov     di, dx
        xchg    cx, ax
        push    ds
        lds     si, [FP_1E7C_S950+0ch]
        inc     cx
        jmp     br_2e0a_s950
loop_2e07_s950:
        add     si, 0ch
br_2e0a_s950:
        cmp     word ptr [si+0ah], 0
        je      loop_2e07_s950
        loop    loop_2e07_s950
        mov     cl, 0ah
        rep movsb
        pop     ds
        ret

fn_2e18_s950:
        mov     ax, 1000h
        push    es
        mov     es, ax
        mov     cx, 0ah
        rep movsb
        pop     es
        ret
        db      0d0h, 2eh, 62h, 0b4h, 73h, 0ch

fn_2e2b_s950:
        call    fn_231b_s950
        mov     ax, 3f46h
        call    fn_07de
        jmp     fn_376c_s950

L_2e37_s950:
        call    disk_menu_action_guard
        call    fn_2e74_s950
        je      br_2e71_s950
        mov     dx, 1f10h
        call    fn_2fa3_s950
        jae     br_2e71_s950
        je      br_2e4f_s950
loop_2e49_s950:
        mov     ax, ERR_DISK_DIRECTORY_FULL_ERASE
        jmp     error_restart
br_2e4f_s950:
        mov     di, si
        mov     si, 1f10h
        call    fn_2e18_s950
        call    fn_301e_s950
        je      loop_2e49_s950
        push    es
        mov     ax, 1000h
        mov     es, ax
        xchg    dx, ax
        stosw
        pop     es
        call    fn_3dbb_s950
        call    fn_3659_s950
br_2e6b_s950:
        mov     ax, 5744h
        call    fn_07de
br_2e71_s950:
        jmp     br_0ab8

fn_2e74_s950:
        mov     di, 1f10h
        mov     si, 1eb0h
        mov     cx, 5
        repe cmpsw
        mov     si, 1e2eh
        je      br_2e87_s950
        mov     si, 1e48h
br_2e87_s950:
        mov     di, 1e62h
        mov     cx, 1ah
        rep movsb
        ret
        endif

fn_0d57:
        pusha
        mov     si, bx
        if      MODEL = 950
        mov     di, MSG_FILE_NAME
        else
        mov     di, P_0629
        endif
        push    di
        mov     cx, 5
        rep movsw
        pop     si
        mov     dx, 9
        jmp     br_0d70

show_loading:
        pusha
        mov     si, MSG_LOADING
loop_0d6d:
        mov     dx, 1
br_0d70:
        call    lcd_print
        popa
        ret

show_saving:
        pusha
        mov     si, MSG_SAVING
        jmp     loop_0d6d

fn_0d7b:
        push    bp
        push    bx
        call    disk_menu_action_guard
        mov     ax, word ptr [W_95C4]
        mov     dl, byte ptr [B_95C6]
        cmp     ax, 2
        pop     bx
        pop     bp
        jae     br_0d8f
        ret
br_0d8f:
        cmp     dl, 1
        ret

take_enter:
        if      MODEL = 950
        mov     byte ptr [B_B426_S950], 0
        endif
        cmp     byte ptr [ENTER_KEY], 0
        jne     br_0d9b
        if      MODEL = 950
        pop     ax
        endif
        ret
br_0d9b:
        mov     byte ptr [ENTER_KEY], 0
        if      MODEL = 950
P_0DA1:
        ret
br_0da2:
        call    fn_13b1
        test    byte ptr [B_95FD], 40h
        else
        ret
        endif
        if      FW_VERSION >= 210
P_0DA1:
        endif
        if      MODEL = 900

        db      0c3h
br_0da2:
        test    byte ptr [B_95FD], 40h
        mov     bl, 0
        endif
        je      br_0dae
        jmp     br_09c9
br_0dae:
        mov     ah, 1
        call    lcd_goto
        if      MODEL = 950
        mov     byte ptr [B_B466_S950], 1
        endif
        mov     byte ptr [B_02B8], 0
loop_0db8:
        mov     al, 2eh
        out     4ah, al
        mov     byte ptr [B_02B7], 0
        call    fn_1492
        if      MODEL = 950
        mov     al, byte ptr [B_B466_S950]
        add     al, byte ptr [B_B467_S950]
        cmp     al, byte ptr [P_029E+4]
        jbe     br_2f19_s950
        sub     al, byte ptr [P_029E+4]
br_2f19_s950:
        mov     byte ptr [B_B466_S950], al
        else
        add     bl, 3
        cmp     bl, 6
        jb      br_0dce
        mov     bl, 1
br_0dce:
        endif
        call    fn_0de8
        mov     byte ptr [B_02B7], 4
        call    fn_1492
        call    fn_0de8
        inc     byte ptr [B_02B8]
        cmp     byte ptr [B_02B8], 50h
        jne     loop_0db8
        ret
        if      MODEL = 950

fn_0de8:
        push    es
        les     di, [FP_1E7C_S950]
        mov     ch, 0
        mov     cl, byte ptr [P_029E+4]
loop_2f41_s950:
        mov     al, byte ptr [B_02B8]
        stosb
        mov     al, byte ptr [B_02B7]
        shr     al, 2
        stosb
        mov     al, byte ptr [B_B466_S950]
        stosb
        inc     al
        cmp     al, byte ptr [P_029E+4]
        jbe     br_2f5a_s950
        mov     al, 1
br_2f5a_s950:
        mov     byte ptr [B_B466_S950], al
        mov     al, byte ptr [P_029E+3]
        stosb
        loop    loop_2f41_s950
        pop     es
        mov     di, 1e7ch
        mov     al, byte ptr [P_029E+4]
        cbw
        add     ax, ax
        add     ax, ax
        xchg    bp, ax
        mov     bx, 8
        call    fn_2723_s950
        mov     word ptr [W_95B0], 7eh
        else

fn_0de8:
        endif
        mov     si, P_029E
        mov     al, byte ptr [B_02B7]
        mov     byte ptr [si+2], al
        call    fdc_command
        if      MODEL = 950
loop_2f88_s950:
        in      al, 6ah
        and     al, 1
        je      loop_2f88_s950
        mov     al, 1
        out     8fh, al
        else
        mov     ah, byte ptr [B_02B7]
        mov     cx, 2
        shr     ah, cl
        mov     cl, byte ptr [B_02A2]
        jmp     br_0e08
loop_0e03:
        mov     al, byte ptr [B_02A1]
        out     2, al
br_0e08:
        in      al, 0
        and     al, 80h
        je      br_0e08
        mov     al, byte ptr [B_02B8]
        out     2, al
loop_0e13:
        in      al, 0
        and     al, 80h
        je      loop_0e13
        mov     al, ah
        out     2, al
loop_0e1d:
        in      al, 0
        and     al, 80h
        je      loop_0e1d
        mov     al, bl
        out     2, al
        inc     bl
        cmp     bl, 6
        jne     br_0e30
        mov     bl, 1
br_0e30:
        in      al, 0
        and     al, 80h
        je      br_0e30
        loop    loop_0e03
        mov     al, 0fh
        out     8, al
        mov     al, byte ptr [B_02A1]
        out     2, al
        mov     al, 0bh
        out     8, al
        mov     di, FDC_RESULT
        endif
        mov     cx, 7
        call    fdc_read_result
        if      MODEL = 950
        test    byte ptr [FDC_RESULT], 0c0h
        jne     br_2fa0_s950
        ret
br_2fa0_s950:
        jmp     br_099e

fn_2fa3_s950:
        push    ds
        lds     si, [FP_1E7C_S950+0ch]
        xor     ax, ax
        mov     cx, 80h
loop_2fad_s950:
        mov     bx, word ptr [si+0ah]
        cmp     bx, 0
        je      br_2fc9_s950
        mov     di, dx
        push    cx
        mov     cx, 0ah
        push    si
loop_2fbc_s950:
        cmpsb
        jne     br_2fc6_s950
        loop    loop_2fbc_s950
        pop     si
        pop     cx
        pop     ds
        clc
        ret
br_2fc6_s950:
        pop     si
        pop     cx
        inc     ax
br_2fc9_s950:
        add     si, 0ch
        loop    loop_2fad_s950
        mov     cx, 80h
        mov     si, 0fff4h
loop_2fd4_s950:
        add     si, 0ch
        cmp     word ptr [si+0ah], 0
        loopne  loop_2fd4_s950
        pop     ds
        stc
        ret

L_2fe0_s950:
        mov     dx, word ptr [W_B4CE_S950]
        else
        mov     al, byte ptr [FDC_RESULT]
        and     al, 0c0h
        je      br_0e58
        jmp     br_099e
br_0e58:
        ret

fn_0e59:
        mov     dx, 4
        endif

fn_0e5c:
        push    di
        mov     di, dx
        if      MODEL = 950
        mov     cx, word ptr [W_B4D0_S950]
        else
        mov     cx, 321h
        endif
        sub     cx, di
        shl     di, 1
        xor     ax, ax
        add     di, P_8EFE
        repne scasw
        jcxz    br_0e8e
        mov     ax, di
        sub     ax, P_8F00
        shr     ax, 1
        push    ax
        mov     word ptr [W_95EA], ax
        mov     cx, 0ah
        div     cl
        sub     cl, ah
        xor     ax, ax
        cwd
loop_0e85:
        if      MODEL = 950
        add     dx, word ptr [W_1E76_S950]
        else
        add     dx, 400h
        endif
        scasw
        loope   loop_0e85
        xchg    dx, ax
        pop     dx
br_0e8e:
        or      ax, ax
        mov     word ptr [W_95EE], ax
        pop     di
        ret
        if      MODEL = 950

fn_301e_s950:
        mov     dx, 4

fn_3021_s950:
        push    si
        mov     cx, word ptr [B_02D2+4]
        sub     cx, dx
        push    ds
        lds     si, [FP_1E7C_S950+8]
        add     dx, dx
        mov     si, dx
loop_3031_s950:
        cmp     word ptr [si+604h], 0
        je      br_3041_s950
        add     si, 2
        loop    loop_3031_s950
        xor     ax, ax
        jmp     br_3044_s950
br_3041_s950:
        mov     ax, 2000h
br_3044_s950:
        or      ax, ax
        pop     ds
        mov     word ptr [W_95EE], ax
        shr     si, 1
        mov     word ptr [W_95EA], si
        mov     dx, si
        pop     si
        ret
        endif

L_0e95:
        mov     si, word ptr [W_95EC]
        shl     si, 1
        mov     ax, word ptr [si+TBL_8EFE]
        if      MODEL = 950
        mov     word ptr [W_95EA], ax
        mov     word ptr [W_95EC], ax
        mov     ax, word ptr [W_1E76_S950]
        mov     word ptr [W_95EE], ax
        ret

L_306b_s950:
        mov     si, word ptr [W_95EC]
        shl     si, 1
        push    ds
        mov     ax, 1000h
        mov     ds, ax
        mov     ax, word ptr [si+604h]
        pop     ds
        mov     word ptr [W_95EA], ax
        mov     word ptr [W_95EC], ax
        mov     ax, 2000h
        mov     word ptr [W_95EE], ax
        ret

fn_3089_s950:
        mov     word ptr [W_95EA], 0
        mov     bp, 1000h
loop_3092_s950:
        add     word ptr [W_95EA], bp
        mov     word ptr [FP_02CE], 4610h
        mov     word ptr [W_02D0_2], 1000h
        mov     word ptr [W_7CD4], 2000h
        mov     ax, P_476E
        push    bp

L_30ac_s950:
        call    fn_07de
        pop     bp
        in      ax, 84h
        cmp     ax, 6610h
        je      br_30bb_s950
        sub     word ptr [W_95EA], bp
br_30bb_s950:
        shr     bp, 1
        jae     loop_3092_s950
        mov     ax, word ptr [W_95EA]
        mov     word ptr [B_02D2+4], ax
        endif
        if      MODEL = 900

        mov     word ptr [W_95EA], ax
        call    sample_rate_table_lookup
        mov     ax, word ptr [W_95EC]
        shl     ax, 1
        xchg    dx, ax
        endif
        ret
        db      00h, 00h
        if      (MODEL = 900) && (FW_VERSION < 210)
FIELDS_CLEAR_MEMORY_AND_LOAD:
        dw      8000h+FLD_CLEAR_MEMORY_AND_LOAD, 8000h+FLD_LOAD_PROGRM_NAME, FLD_LOAD_PROGRM_PR_ONLY, FLD_PR_AND_SAMPLES
        dw      8000h+FLD_LOAD_SAMPLE_NAME, 8000h+FLD_CLEAR_DISK_AND_SAVE, 8000h+FLD_SAVE_PROGRM_NAME, FLD_SAVE_PROGRM_PR_ONLY
        dw      FLD_SAVE_PROGRM_PR_AND_SMPLS, 8000h+FLD_SAVE_SAMPLE_NAME, 8000h+FLD_ERASE_SAMPLE, FLD_PROGRM
W_34F0_V12A:
        dw      8000h+FLD_DISK_FORMAT, 8000h+FLD_LOAD_DRUM_SETTINGS, FLD_SAVE_DRUM_SETTINGS, 0
        db      8 dup (0)
        else
P_0EAE:
        endif
        if      MODEL = 950
        dw      8000h+P_0EE0
        db      11h, 32h, 1ah, 32h, 2bh, 32h, 0ah, 0b1h, 1dh, 0b1h
        db      "&161u"
        db      0b1h, 7eh, 31h, 8dh, 0b1h, 9ch, 0b1h, 0b4h, 31h, 0c3h, 31h, 0d2h, 0b1h, 6ch, 0b1h, 63h
        db      31h, 0dbh, 0b1h, 0eah, 31h, 0f9h, 31h, 45h, 0b1h, 54h, 31h, 0a5h, 0b1h, 3ch, 0b2h, 00h
        db      00h
        endif
        if      FW_VERSION = 210
        dw      8000h+FLD_CLEAR_MEMORY_AND_LOAD
        dw      8000h+FLD_CLEAR_MEMORY_AND_LOAD+10h
        dw      FLD_CLEAR_MEMORY_AND_LOAD+19h
        dw      FLD_PR_AND_SAMPLES
        dw      8000h+FLD_PR_AND_SAMPLES+3fh
        dw      8000h+FLD_PR_AND_SAMPLES+48h
FIELDS_SAVE_PROGRM:
        dw      8000h+FLD_SAVE_PROGRM_NAME, FLD_SAVE_PROGRM_PR_ONLY, FLD_SAVE_PROGRM_PR_AND_SMPLS, 8000h+FLD_SAVE_SAMPLE_NAME
W_2968_OS21:
        dw      8000h+FLD_ERASE_SAMPLE, FLD_PROGRM, 8000h+FLD_DISK_FORMAT, 0
        dw      FLD_PR_AND_SAMPLES+1eh
        db      00h, 00h
        endif
        if      FW_VERSION >= 400
        dw      8000h+FLD_ENSEMBLE
        db      0f9h, 8eh, 02h, 0fh
        dw      FLD_LOAD_PROGRM_PR_AND_SMPLS
        db      6ch, 8fh, 75h, 8fh, 84h, 8fh, 8dh, 0fh
        dw      FLD_SAVE_PROGRM_PR_AND_SMPLS
        dw      8000h+FLD_SAVE_PROGRM_PR_AND_SMPLS+0fh
        db      63h, 8fh, 5ah, 0fh
        dw      8000h+FLD_SAVE_PROGRM_PR_AND_SMPLS+18h
W_0EC8:
        dw      8000h+FLD_LOAD_PROGRM_PR_AND_SMPLS+0fh
W_0ECA:
        db      4bh, 0fh, 30h, 8fh, 00h, 00h
        endif
P_0ED0:
        dw      P_0ED8
        db      00h, 00h, 00h, 04h, 00h, 20h
P_0ED8:
        if      MODEL = 950
        db      "    "
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        db      "   %"
        else
        db      "  0%"
        endif

P_0EDC:
        db      "UNFM"
        if      MODEL = 950
FLD_CLEAR_MEM_AND_LOAD:
        FIELD   SCR_CLEAR_MEMORY_AND_LOAD, 4, 71, 72, FT_KEYS, 0, clear_memory_and_load, 0, KEYS_CLEAR_MEM_AND_LOAD, 3
KEYS_CLEAR_MEM_AND_LOAD:
        db      31h, 32h, 33h
KEYS_LOAD_DRUM_SETTINGS:
        db      0dh, 98h, 1fh, 2ch, 33h, 3dh, 01h, 70h, 0dfh, 2eh
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
FLD_CLEAR_MEMORY_AND_LOAD:
        FIELD   SCR_CLEAR_MEMORY_AND_LOAD, 0, 65, 66, FT_KEYS, 0, clear_memory_and_load, 0, KEYS_CLEAR_MEMORY_AND_LOAD, 1
KEYS_CLEAR_MEMORY_AND_LOAD:
        db      0dh
FLD_LOAD_PROGRM_NAME:
        TEXTFIELD SCR_LOAD_PROGRM, 44, 51, 61, FT_NAME, 'p', L_0a77
        endif
        if      FW_VERSION < 400
FLD_LOAD_PROGRM_PR_ONLY:
        FIELD   SCR_LOAD_PROGRM, 22, 32, 33, FT_KEYS, 0, load_program, 0, KEYS_LOAD_PROGRM_PR_ONLY, 1
        else
FLD_ENSEMBLE:
        FIELD   SCR_CLEAR_MEMORY_AND_LOAD, 44, 55, 56, FT_KEYS, 0, field_0fc3, 0, KEYS_ENSEMBLE, 9
KEYS_LOAD_DRUM_SETTINGS:
        db      0dh
KEYS_ENSEMBLE:
        db      "123456789"
FLD_LOAD_PROGRM_NAME:
        TEXTFIELD SCR_LOAD_PROGRM, 47, 54, 64, FT_NAME, 'p', L_0a77
FLD_LOAD_PROGRM_PR_ONLY:
        FIELD   SCR_LOAD_PROGRM, 24, 34, 35, FT_KEYS, 0, load_program, 0, KEYS_LOAD_PROGRM_PR_ONLY, 1
        endif
KEYS_LOAD_PROGRM_PR_ONLY:
        db      0dh
        if      FW_VERSION < 400
FLD_PR_AND_SAMPLES:
        FIELD   SCR_LOAD_PROGRM, 62, 77, 78, FT_KEYS, 0, load_program, 0, KEYS_LOAD_PROGRM_PR_ONLY, 1
        else
FLD_LOAD_PROGRM_PR_AND_SMPLS:
        FIELD   SCR_LOAD_PROGRM, 64, 75, 76, FT_KEYS, 0, load_program, 0, KEYS_LOAD_PROGRM_PR_ONLY, 1
        endif
FLD_LOAD_DRUM_SETTINGS:
        if      MODEL = 950
        FIELD   SCR_LOAD_DRUM_SETTINGS, 5, 32, 33, FT_KEYS, 0, load_drum_settings, 0, KEYS_LOAD_DRUM_SETTINGS, 1
FLD_SAVE_DRUM_SETTINGS:
        FIELD   SCR_LOAD_DRUM_SETTINGS, 45, 72, 73, FT_KEYS, 0, save_drum_settings, 0, KEYS_LOAD_DRUM_SETTINGS, 1
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        FIELD   SCR_LOAD_DRUM_SETTINGS, 5, 32, 33, FT_KEYS, 0, load_drum_settings, 0, KEYS_CLEAR_MEMORY_AND_LOAD, 1
FLD_SAVE_DRUM_SETTINGS:
        FIELD   SCR_LOAD_DRUM_SETTINGS, 45, 72, 73, FT_KEYS, 0, save_drum_settings, 0, KEYS_CLEAR_MEMORY_AND_LOAD, 1
        endif
        if      FW_VERSION < 400
FLD_PROGRM:
        TEXTFIELD SCR_ERASE, 56, 65, 75, FT_NAME, 'p', erase_program
FLD_ERASE_SAMPLE:
        TEXTFIELD SCR_ERASE, 16, 25, 35, FT_NAME, 's', erase_sample
FLD_LOAD_SAMPLE_NAME:
        TEXTFIELD SCR_LOAD_SAMPLE, 44, 51, 61, FT_NAME, 's', load_sample
        endif
        if      MODEL = 950
FLD_ALL_SAMPLES:
        FIELD   SCR_LOAD_SAMPLE, 64, 78, 79, FT_KEYS, 0, load_all_samples, 0, KEYS_LOAD_DRUM_SETTINGS, 1
FLD_CLEAR_VOLUME_AND_SAVE:
        FIELD   SCR_CLEAR_VOLUME_AND_SAVE, 0, 67, 68, FT_KEYS, 0, clear_disk_and_save, 0, KEYS_LOAD_DRUM_SETTINGS, 1
        db      88h
        db      " ,3="
        db      01h, 50h, 0dfh, 2eh, 18h, 22h, 00h, 4dh, 50h, 04h, 00h, 0dfh, 2eh, 00h, 00h, 00h
        db      00h, 80h, 00h
FLD_SAVE_PROGRM_PR_ONLY:
        FIELD   SCR_SAVE_PROGRM, 22, 32, 33, FT_KEYS, 0, save_program, 0, KEYS_LOAD_DRUM_SETTINGS, 1
FLD_SAVE_PROGRM_PR_AND_SMPLS:
        FIELD   SCR_SAVE_PROGRM, 62, 75, 76, FT_KEYS, 0, save_program, 0, KEYS_LOAD_DRUM_SETTINGS, 1
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
FLD_CLEAR_DISK_AND_SAVE:
        FIELD   SCR_CLEAR_DISK_AND_SAVE, 0, 67, 68, FT_KEYS, 0, clear_disk_and_save, 0, KEYS_CLEAR_MEMORY_AND_LOAD, 1
        endif
        if      FW_VERSION = 210
        dw      P_03B1+1eh
        db      00h, 43h, 44h, 20h, 00h
        dw      clear_disk_and_save
        db      00h, 00h
        dw      FLD_CLEAR_MEMORY_AND_LOAD+0fh
        db      01h, 00h
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
FLD_SAVE_PROGRM_NAME:
        TEXTFIELD SCR_SAVE_PROGRM, 44, 51, 61, FT_NAME, 'P', L_0c92
FLD_SAVE_PROGRM_PR_ONLY:
        FIELD   SCR_SAVE_PROGRM, 22, 32, 33, FT_KEYS, 0, save_program, 0, KEYS_CLEAR_MEMORY_AND_LOAD, 1
FLD_SAVE_PROGRM_PR_AND_SMPLS:
        FIELD   SCR_SAVE_PROGRM, 62, 75, 76, FT_KEYS, 0, save_program, 0, KEYS_CLEAR_MEMORY_AND_LOAD, 1
        endif
        if      FW_VERSION < 400
FLD_SAVE_SAMPLE_NAME:
        TEXTFIELD SCR_SAVE_SAMPLE, 44, 51, 61, FT_NAME, 'S', save_sample
        endif
        if      MODEL = 950
FLD_FORMAT_FLOPPY:
        FIELD   SCR_FORMAT_FLOPPY, 4, 20, 21, FT_KEYS, 0, format_disk, 0, KEYS_LOAD_DRUM_SETTINGS, 1
FLD_FORMAT_SH204_5:
        FIELD   SCR_FORMAT_FLOPPY, 21, 38, 39, FT_KEYS, 0, format_hard_disk, 0, KEYS_LOAD_DRUM_SETTINGS, 1
FLD_WIPE_HARD_DISK:
        FIELD   SCR_FORMAT_FLOPPY, 41, 58, 59, FT_KEYS, 0, wipe_hard_disk, 0, KEYS_LOAD_DRUM_SETTINGS, 1
P_0EE0:
        db      0f8h, 1eh, 0bh, 19h, 23h, 01h, 56h, 25h, 2eh
FLD_RENAME:
        TEXTFIELD SCR_VOLUME, 58, 67, 77, FT_NAME, 'V', rename_volume
FLD_HDCONT1:
        FIELD   SCR_VOLUME, 40, 48, 49, FT_NUM, 0, set_hard_disk_unit, 1, 1, 4
        db      01h, 00h
FLD_HDRIVE1:
        FIELD   SCR_VOLUME, 49, 57, 58, FT_NUM, 0, set_hard_disk_unit, 1, 1, 8
        db      01h, 00h
FLD_PARK_HARD_DISK:
        FIELD   SCR_PARK_HARD_DISK, 0, 66, 67, FT_KEYS, 0, park_hard_disk, 0, KEYS_LOAD_DRUM_SETTINGS, 1
        db      0f8h, 1eh, 01h, 26h, 29h, 04h, 00h, 0dfh, 2eh, 00h, 00h, 00h, 00h, 80h, 00h
        elseif  (MODEL = 900) && (FW_VERSION < 400)
FLD_DISK_FORMAT:
        FIELD   SCR_DISK_FORMAT, 0, 68, 69, FT_KEYS, 0, format_disk, 0, KEYS_CLEAR_MEMORY_AND_LOAD, 1
        else
        FIELD   SCR_LOAD_DRUM_SETTINGS, 5, 32, 33, FT_KEYS, 0, load_drum_settings, 0, KEYS_LOAD_DRUM_SETTINGS, 1
        db      0a6h, 05h, 04h, 37h, 38h, 60h, 00h, 44h, 0fh, 00h, 00h, 3fh, 0fh, 02h, 00h, 2bh
B_0F40:
        db      2dh, 01h, 00h, 00h, 0d1h, 0e9h, 88h, 0eh, 41h, 0fh, 0c3h
FLD_SAVE_DRUM_SETTINGS:
        FIELD   SCR_LOAD_DRUM_SETTINGS, 45, 72, 73, FT_KEYS, 0, save_drum_settings, 0, KEYS_LOAD_DRUM_SETTINGS, 1
FLD_PGM:
        TEXTFIELD SCR_ERASE, 59, 65, 75, FT_NAME, 'p', erase_program
FLD_SMPL:
        TEXTFIELD SCR_ERASE, 42, 49, 59, FT_NAME, 's', erase_sample
FLD_LOAD_SAMPLE_NAME:
        TEXTFIELD SCR_LOAD_SAMPLE, 53, 60, 70, FT_NAME, 's', load_sample
        db      0c6h, 03h, 00h, 43h, 44h, 20h, 00h, 9ch, 0bh, 00h, 00h, 0efh, 0eh, 01h, 00h
FLD_SAVE_PROGRM_NAME:
        TEXTFIELD SCR_SAVE_PROGRM, 47, 54, 64, FT_NAME, 'P', L_0c92
FLD_SAVE_PROGRM_PR_ONLY:
        FIELD   SCR_SAVE_PROGRM, 24, 34, 35, FT_KEYS, 0, save_program, 0, KEYS_LOAD_DRUM_SETTINGS, 1
FLD_SAVE_PROGRM_PR_AND_SMPLS:
        FIELD   SCR_SAVE_PROGRM, 64, 75, 76, FT_KEYS, 0, save_program, 0, KEYS_LOAD_DRUM_SETTINGS, 1
FLD_SAVE_SAMPLE_NAME:
        TEXTFIELD SCR_SAVE_SAMPLE, 53, 60, 70, FT_NAME, 'S', save_sample
FLD_DISK_FORMAT:
        FIELD   SCR_DISK_FORMAT, 0, 68, 69, FT_KEYS, 0, format_disk, 0, KEYS_LOAD_DRUM_SETTINGS, 1

field_0fc3:
        and     ax, 0ffh
        sub     ax, 31h
        js      br_0ffd
        mov     word ptr [B_02D2+2], 0

L_0fd1:
        call    fn_10b8
        je      br_0ff7
        shl     ax, 1
        mov     word ptr [B_02D2+2], ax
        push    ax
        mov     ax, 3f46h
        call    disk_catalog_scan
        pop     ax
        mov     word ptr [B_02D2+2], ax
        call    fn_100a
        cmp     ax, 0
        jne     br_0ffd
        call    fn_104f
        call    fn_1013
        jmp     br_0ffd
        db      90h
br_0ff7:
        mov     ax, 3f46h
        call    disk_catalog_scan
br_0ffd:
        call    disk_fill
        call    fn_1306
        call    clear_memory_and_load

L_1006:
        call    lcd_redraw
        ret

fn_100a:
        mov     bx, word ptr [B_02D2+2]
        mov     ax, word ptr [bx+P_953E]
        ret

fn_1013:
        mov     bx, word ptr [B_02D2+2]
        mov     ax, word ptr [bx+P_953E]
        mov     word ptr [W_95EA], ax
        mov     word ptr [FP_02CE], DISK_CATALOG
        mov     word ptr [W_7CD4], P_0600
        mov     ax, 4457h
        call    disk_catalog_scan
        ret

fn_1031:
        mov     word ptr [W_7CD4], P_0600
        mov     bx, word ptr [B_02D2+2]
        mov     ax, word ptr [bx+P_953E]
        mov     word ptr [W_95EA], ax
        mov     word ptr [FP_02CE], DISK_CATALOG
        mov     ax, 4452h
        call    disk_catalog_scan
        ret

fn_104f:
        push    di
        push    cx
        push    dx
        push    ax
        push    bx
        mov     dx, 4
loop_1057:
        call    fn_0e5c
        je      br_10d0
        cmp     ax, 800h
        jns     br_1064
        inc     dx
        jmp     loop_1057
br_1064:
        mov     bx, word ptr [B_02D2+2]
        mov     word ptr [bx+P_953E], dx
        mov     word ptr [bx+TBL_9550], 40h
        mov     bx, dx
        shl     bx, 1
        inc     dx
        mov     word ptr [bx+TBL_8EFE], dx
        mov     word ptr [bx+P_8F00], 8000h
        xor     ax, ax
        mov     word ptr [W_95EA], ax
        mov     word ptr [FP_02CE], DISK_CATALOG
        mov     word ptr [W_7CD4], 0c64h
        mov     ax, 4457h
        call    disk_catalog_scan
        xor     ax, ax
        mov     di, DISK_CATALOG
        mov     cx, 600h
        shr     cx, 1
        rep stosw
        mov     ax, word ptr [B_02D2+2]
        shr     ax, 1
        add     ax, 31h
        mov     byte ptr [B_02FE+0eh], al
        call    fn_10b8
        pop     bx
        pop     ax
        pop     dx
        pop     cx
        pop     di
        ret

fn_10b8:
        push    ax
        mov     al, byte ptr [B_02FE+0eh]
        mov     byte ptr [B_034E+5], al
        mov     byte ptr [B_039E+9], al
        mov     byte ptr [B_03F7], al
        mov     byte ptr [B_0443], al
        mov     byte ptr [B_0497], al
        mov     byte ptr [B_04D7], al
        pop     ax
        ret
br_10d0:
        pop     bx
        pop     ax
        pop     dx
        pop     cx
        pop     di
        jmp     loop_06ff

fn_10d8:
        push    cx
        mov     cx, 8
loop_10dc:
        mov     bx, cx
        shl     bx, 1
        cmp     word ptr [bx+P_953E], 0
        je      br_110e
        cmp     word ptr [bx+TBL_9550], 40h
        jne     br_110e
        mov     ax, word ptr [bx+P_953E]
        mov     word ptr [bx+P_953E], 0
        mov     word ptr [bx+TBL_9550], 0
        mov     bx, ax
        shl     bx, 1
        mov     word ptr [bx+TBL_8EFE], 0
        mov     word ptr [bx+P_8F00], 0
br_110e:
        loop    loop_10dc
        pop     cx
        ret
        endif

disk_catalog_entry_handler:
        mov     byte ptr [B_95CC], al
        mov     bx, dx
        if      FW_VERSION >= 210
L_2a48_os21:
        endif

        call    disk_catalog_find
        je      br_111e
        stc
        ret
br_111e:
        call    fn_0d57
        mov     ax, word ptr [di+14h]
        mov     word ptr [W_95EA], ax
        if      MODEL = 950
        mov     word ptr [W_95EC], ax
        mov     word ptr [FP_02CE], W_7CEE
        mov     word ptr [W_02D0_2], 0
        mov     ax, 3e8h
        cmp     byte ptr [B_95CC], 50h
        je      br_328f_s950
        cmp     byte ptr [B_95CC], 4dh
        jne     br_32b3_s950
br_328f_s950:
        mov     ax, word ptr [FP_1E7C_S950]
        mov     word ptr [FP_02CE], ax
        mov     ax, word ptr [FP_1E7C_S950+2]
        mov     word ptr [W_02D0_2], ax
        mov     ax, word ptr [di+11h]
        sub     ax, word ptr [W_95EE]
        mov     word ptr [W_95BE], ax
        mov     ax, word ptr [W_95EE]
        jae     br_32b3_s950
        mov     ax, word ptr [di+11h]
        mov     word ptr [W_95BE], 0
br_32b3_s950:
        mov     word ptr [W_7CD4], ax
        else
        mov     word ptr [FP_02CE], W_7CEE
        mov     word ptr [W_02D0], 0
        mov     word ptr [W_7CD4], 400h
        endif
        mov     ax, 4452h
        mov     word ptr [W_95C0], di
        if      MODEL = 950
        push    dx
        call    word ptr [W_1E64_S950]
        pop     dx
        else
        cmp     byte ptr [B_95CC], 46h
        jne     br_114d
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     word ptr [FP_02CE], P_80BC
        endif
        if      FW_VERSION >= 210
        mov     word ptr [FP_02CE], ffile_buf
        endif
        if      MODEL = 900

br_114d:
        call    disk_catalog_scan
        endif
        mov     al, byte ptr [B_95CC]
        cmp     al, 4fh
        jne     br_1164
        if      MODEL = 950
        mov     cx, 28h
        mov     di, MIDI_SETTINGS
        cmp     byte ptr [B_04D7], 0
        je      loop_115d
        mov     di, 0b42eh
        mov     byte ptr [B_B457_S950], 0ffh
        else
        mov     di, MIDI_SETTINGS
        mov     cx, 28h
        endif
loop_115d:
        mov     si, W_7CEE
        rep movsb
        clc
        ret
br_1164:
        cmp     al, 44h
        jne     br_1170
        mov     di, DRUM_INPUTS_ON
        mov     cx, 106h
        jmp     loop_115d
br_1170:
        mov     dx, W_7CEE
        cmp     al, 50h
        if      MODEL = 950
        je      br_3317_s950
        cmp     al, 4dh
        je      br_3300_s950
        jmp     br_33fe_s950
br_3300_s950:
        call    fn_3364_s950
        call    fn_3521_s950
        mov     ax, 0
        mov     es, ax
        mov     di, 0
        lds     si, [FP_1E7C_S950]
        mov     cx, 8000h
        int     11h
br_3317_s950:
        mov     dx, word ptr [W_95C0]
        call    find_program
        jb      br_3323_s950
        call    fn_218d
br_3323_s950:
        else
        je      br_1181
        cmp     al, 46h
        jne     br_11f9
        call    fn_11b2
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        jmp     P_80BC
        endif
        if      FW_VERSION >= 210
        jmp     ffile_buf
        endif
        if      MODEL = 900

br_1181:
        call    find_program
        jb      br_1189
        call    fn_218d
br_1189:
        mov     dx, W_7CEE
        endif
        xor     ax, ax
        call    fn_2016
        if      MODEL = 950
        mov     bp, 17h
        cmp     byte ptr [0b464h], 0
        je      br_3335_s950
        mov     bp, 2ah
br_3335_s950:
        push    ds
        lds     si, [1e7ch]
        cmp     byte ptr ds:[bp+si], al
        pop     ds
        jb      L_0641
        else
        cmp     byte ptr [B_7D05], al
        jb      br_11c4
        endif
loop_1197:
        call    fn_0ab5
        mov     ax, ERR_MEMORY_SPACE_FOR_PROGRAMS
        jmp     error_restart
loop_11a0:
        if      MODEL = 950
        mov     ax, word ptr [W_95EE]
        add     word ptr [FP_02CE], ax
        sub     word ptr [W_95BE], ax
        jae     br_335a_s950
        add     ax, word ptr [W_95BE]
br_335a_s950:
        mov     word ptr [W_7CD4], ax
        mov     ax, 4452h
        call    word ptr [W_1E64_S950]

fn_3364_s950:
        call    word ptr [W_1E6A_S950]
        test    byte ptr [B_B4F9_S950], 80h
        je      loop_11a0
        clc
        ret
L_0641:
        call    fn_3364_s950
        cmp     byte ptr [B_B464_S950], 0
        je      br_337e_s950
        call    fn_95c2_s950
br_337e_s950:
        call    fn_33a6_s950
        cmp     byte ptr [bx+1bh], 0
        jne     br_33a4_s950
        dec     byte ptr [bx+1bh]
        mov     al, 50h
        call    disk_catalog_find
        mov     si, DISK_CATALOG
loop_3392_s950:
        cmp     si, di
        je      br_33a4_s950
        cmp     byte ptr [si+10h], 50h
        jne     br_339f_s950
        inc     byte ptr [bx+1ah]
br_339f_s950:
        add     si, 18h
        jmp     loop_3392_s950
br_33a4_s950:
        clc
        ret

fn_33a6_s950:
        call    find_free_slot
        push    bx
        else
        add     word ptr [FP_02CE], 400h
        mov     word ptr [W_7CD4], 400h
        mov     ax, 4452h
        call    disk_catalog_scan

fn_11b2:
        mov     si, word ptr [W_95EA]
        shl     si, 1
        endif
        if      MODEL = 900
        mov     ax, word ptr [si+TBL_8EFE]

        mov     word ptr [W_95EA], ax
        shl     ax, 1
        jae     loop_11a0
        ret
br_11c4:
        call    fn_11b2

fn_11c7:
        call    find_free_slot
        endif
        mov     byte ptr [bp], 50h
        mov     cx, 26h
        mov     di, bx
        if      MODEL = 950
        cmp     byte ptr [B_04D7], 0
        jne     br_33be_s950
        mov     word ptr [CUR_PROGRAM], bx
br_33be_s950:
        push    ds
        lds     si, [FP_1E7C_S950]
        mov     al, byte ptr [si+17h]
        rep movsb
        pop     ds
        mov     byte ptr [bx+0ah], 0
        mov     byte ptr [B_B41E_S950], al
        else
        mov     word ptr [CUR_PROGRAM], bx
        mov     si, W_7CEE
        rep movsb
        endif
        lea     di, [bx+12h]
loop_11df:
        call    find_free_slot
        mov     byte ptr [bp], 4bh
        mov     word ptr [di], bx
        mov     cx, 46h
        mov     di, bx
        if      MODEL = 950
        push    ds
        lds     ax, [FP_1E7C_S950]
        mov     word ptr [si+28h], 0
        mov     word ptr [si+3eh], 0
        rep movsb
        pop     ds
        dec     byte ptr [B_B41E_S950]
        lea     di, [bx+44h]
        jne     loop_11df
        pop     bx
        ret
br_33fe_s950:
        cmp     byte ptr [B_B464_S950], 0
        je      br_3408_s950
        call    fn_9803_s950
br_3408_s950:
        call    br_11f9
        else
        rep movsb
        dec     byte ptr [B_7D05]
        lea     di, [bx+44h]
        jne     loop_11df
        ret
        endif

RUN_BR_11F9 macro   {GLOBALSYMBOLS}

br_11f9:
        call    find_sample
        jb      br_1206
        call    fn_21a1
        if      MODEL = 900
        call    fn_0125
        else
        call    fn_78a8_s950
        endif
        jmp     br_1209
br_1206:
        call    check_sample_slots
br_1209:
        call    find_free_slot
        endm
        if      MODEL = 900
        RUN_BR_11F9
        jae     br_1210
        jmp     loop_1197
br_1210:
        endif
        push    bx
        push    bp
        call    fn_2aef
        mov     word ptr [W_7D24], ax
        mov     word ptr [W_7D26], dx
        sub     bx, word ptr [W_7CFE]
        sbb     cx, word ptr [W_7D00]
        jae     br_122c
        if      MODEL = 950
        cmp     byte ptr [B_04D7], 0
        jne     br_349b_s950
        endif
        mov     ax, ERR_MEMORY_SAMPLE_SPACE_FULL
        jmp     error_restart
br_122c:
        if      MODEL = 950
        mov     bx, 9f7ah
        xchg    word ptr [FP_02CE], bx
        mov     ax, word ptr [W_1E6A_S950]
        mov     word ptr [W_95F0], ax
        mov     word ptr [W_95C2], L_347b_s950
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        mov     bx, 7bf0h
        else
        mov     bx, P_7D2A
        endif
        if      MODEL = 900
        xchg    word ptr [FP_02CE], bx
        mov     word ptr [W_95F0], L_0e95
        mov     word ptr [W_95C2], L_1270
        endif
        if      FW_VERSION < 400
        call    fn_1724
        else
        call    fn_75c3
        jne     br_124a
        call    fn_1724
        jmp     br_1250
        db      90h
br_124a:
        call    fn_7524
        call    fn_70b8
        endif
        if      FW_VERSION >= 210
br_1250:
        endif

        pop     bp
        pop     bx
        mov     byte ptr [bp], 53h
        mov     di, bx
        mov     si, W_7CEE
        mov     cx, 3ch
        rep movsb
        if      MODEL = 950
        mov     word ptr [bx+28h], cx
        mov     byte ptr [bx+0ah], cl
        cmp     byte ptr [bx+2ah], cl
        je      br_3475_s950
        endif

RUN_AFTER_BR_1250 macro   {GLOBALSYMBOLS}
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        shr     dx, 1
        rcr     ax, 1
        add     word ptr [bx+20h], ax
        adc     word ptr [bx+22h], dx
        add     word ptr [bx+1ch], ax
        adc     word ptr [bx+1eh], dx
        endm
        if      MODEL = 950
        RUN_AFTER_BR_1250
br_3475_s950:
        call    fn_0043
        jmp     program_sample_name_xref_resolve

L_347b_s950:
        mov     ax, 5352h
        jmp     word ptr [W_1E64_S950]
        RUN_BR_11F9
        jae     br_349a_s950
        jmp     loop_1197
br_349a_s950:
        ret
br_349b_s950:
        mov     si, MSG_MEMORY_FULL_CLEAR_PREVIOUS
        mov     dx, 4f01h
        call    lcd_print
loop_34a4_s950:
        call    word ptr [IDLE_HOOK]
        cmp     byte ptr [KEY_CODE], 33h
        je      br_34bd_s950
        cmp     byte ptr [KEY_CODE], 0dh
        jne     loop_34a4_s950
        mov     byte ptr [B_B41F_S950], 0ffh
        jmp     br_34c8_s950
br_34bd_s950:
        call    fn_28f1_s950
        mov     byte ptr [B_B421_S950], 0ffh
        call    show_loading
br_34c8_s950:
        mov     byte ptr [KEY_CODE], 0
        pop     bp
        pop     bx
        ret
MSG_MEMORY_FULL_CLEAR_PREVIOUS:
        db      "MEMORY FULL. Press (3) to clear previousand cont"
        db      "inue loading, or cancel (ENT) _ "
        db      0feh

fn_3521_s950:
        mov     dx, 1c0h
        mov     al, 0
        out     dx, al
        mov     dx, 1c2h
        mov     al, 1
        out     dx, al
        mov     dx, 1c4h
        mov     al, 2
        out     dx, al
        mov     dx, 1c6h
        mov     al, 3
        out     dx, al
        endif
        if      FW_VERSION >= 400

        call    fn_75c3
        jne     br_1268
        endif
        if      MODEL = 900
        call    fn_1385
        endif
        if      FW_VERSION >= 210
br_1268:
        endif
        if      MODEL = 900

        mov     word ptr [bx+28h], 0
        jmp     fn_0043

L_1270:
        mov     ax, 5352h
        jmp     disk_catalog_scan

fn_1276:
        mov     cx, 0ah
        div     cl
        cmp     ah, 5
        jb      br_1285
        inc     ch
        sub     ah, 5
br_1285:
        inc     ah
        endif
        ret

fn_1288:
        mov     al, byte ptr [bp]
        call    disk_catalog_find
        jne     br_1293
        call    fn_0726
br_1293:
        if      MODEL = 950
        mov     cx, word ptr [W_1E78_S950]
        else
        mov     cx, 40h
        endif
        mov     di, P_88E6
        mov     ax, 18h
        cmp     byte ptr [B_95C6], ch
        je      br_12e0
loop_12a2:
        add     di, ax
        cmp     byte ptr [di+10h], ch
        loopne  loop_12a2
        push    di
        mov     si, bx
        mov     cx, 5
        rep movsw
        mov     cx, 7
        xor     ax, ax
        rep stosw
        call    fn_0670
        pop     di
        mov     word ptr [di+11h], ax
        mov     byte ptr [di+13h], dl
        if      MODEL = 950
        mov     dh, 0
        mov     cx, word ptr [W_1E76_S950]
        dec     cx
        add     ax, cx
        adc     dx, 0
        inc     cx
        endif
        if      FW_VERSION >= 400
        cmp     byte ptr [bp], 53h
        jne     br_12cf
        cmp     byte ptr [B_0F40+1], 0
        jne     br_12ed
        endif
        if      FW_VERSION >= 210
br_12cf:
        endif
        if      MODEL = 900

        add     ax, 3ffh
        adc     dx, 0
        mov     cx, 400h
        endif
        div     cx
        cmp     word ptr [W_95C4], ax
        jae     br_12e9
br_12e0:
        mov     ax, 5744h
        if      MODEL = 950
        pusha
        call    word ptr [W_1E64_S950]
        popa
        cmp     byte ptr [B_B426_S950], 0
        je      br_359f_s950
        call    fn_36e4_s950
        jmp     fn_1288
br_359f_s950:
        else
        call    disk_catalog_scan
        endif
        jmp     loop_06ff
br_12e9:
        if      FW_VERSION < 400
        dec     byte ptr [B_95C6]
        sub     word ptr [W_95C4], ax
        else
        sub     word ptr [W_95C4], ax
br_12ed:
        dec     byte ptr [B_95C6]
        endif
        mov     al, byte ptr [bp]
        mov     byte ptr [di+10h], al
        if      MODEL = 950
        call    word ptr [W_1E66_S950]
        else
        call    fn_0e59
        endif
        mov     word ptr [di+14h], dx
        ret
br_12fe:
        if      MODEL = 950
        call    br_0d1d
        else
        call    fn_13b1
        endif
        mov     byte ptr [B_02D2], 0

fn_1306:
        if      MODEL = 950
        call    fn_2984_s950
        mov     dl, al
        else
        mov     cx, 40h
        mov     dl, 0
        mov     si, DISK_CATALOG
        endif
        mov     bx, 10h
loop_1311:
        if      MODEL = 950
        mov     al, byte ptr [bx+di]
        else
        mov     al, byte ptr [bx+si]
        endif
        cmp     al, 0
        jne     br_1319
        inc     dl
br_1319:
        add     bx, 18h
        loop    loop_1311
        mov     byte ptr [B_95C6], dl
        if      MODEL = 900
        mov     di, P_8F06
        endif
        xchg    cx, ax
        cwd
        if      MODEL = 950
        jmp     word ptr [W_1E6C_S950]

L_35df_s950:
        mov     di, P_8EFE
        add     di, word ptr [W_B4CE_S950]
        add     di, word ptr [W_B4CE_S950]
        mov     cx, word ptr [W_B4D0_S950]
        dec     cx
        sub     cx, word ptr [W_B4CE_S950]
        else
        mov     cx, 31ch
        endif
loop_132a:
        scasw
        jne     br_132e
        inc     dx
br_132e:
        loop    loop_132a
        if      MODEL = 950
loop_35f9_s950:
        endif
        mov     word ptr [W_95C4], dx
        ret
        if      MODEL = 950

fn_1335:
        mov     cx, word ptr [B_02D2+4]
        push    ds
        lds     si, [FP_1E7C_S950+8]
        xor     ax, ax
loop_3609_s950:
        cmp     word ptr [si], ax
        jne     br_360e_s950
        inc     dx
br_360e_s950:
        add     si, 2
        loop    loop_3609_s950
        pop     ds
        jmp     loop_35f9_s950
br_3616_s950:
        mov     byte ptr [B_B464_S950], 0
        call    fn_36c8_s950
        call    fn_275a_s950
        push    ds
        lds     si, [FP_1E7C_S950+0ch]
        cmp     byte ptr [si+602h], 0ffh
        mov     ax, 9c4h
        jne     br_3634_s950
        mov     ax, word ptr [si+600h]
br_3634_s950:
        pop     ds
        mov     word ptr [B_02D2+4], ax
        call    fn_3683_s950
        jae     br_3643_s950
        call    fn_275a_s950
        call    fn_36a9_s950
br_3643_s950:
        call    fn_275a_s950
        mov     byte ptr [B_B46D_S950], 0ffh
        call    fn_3659_s950
        call    fn_3666_s950
        jb      br_3656_s950
        call    fn_275a_s950
br_3656_s950:
        jmp     fn_1306

fn_3659_s950:
        mov     di, DISK_CATALOG
        mov     cx, 1280h
        shr     cx, 1
        xor     ax, ax
        rep stosw
        ret

fn_3666_s950:
        call    fn_231b_s950
        mov     word ptr [W_02D0_2], ax
        mov     word ptr [FP_02CE], DISK_CATALOG
        mov     dx, 1f10h
        call    fn_2fa3_s950
        mov     word ptr [W_95EA], bx
        mov     word ptr [W_7CD4], 0c00h
        ret

fn_3683_s950:
        call    fn_231b_s950
        mov     word ptr [FP_02CE], 604h
        mov     word ptr [W_02D0_2], 1000h
        mov     word ptr [W_95EA], 1
        mov     ax, word ptr [B_02D2+4]
        add     ax, ax
        mov     bx, 2000h
        cmp     bx, ax
        jae     br_36a5_s950
        xchg    bx, ax
br_36a5_s950:
        mov     word ptr [W_7CD4], ax
        ret

fn_36a9_s950:
        call    fn_231b_s950
        mov     word ptr [FP_02CE], 2604h
        mov     word ptr [W_02D0_2], 1000h
        mov     word ptr [W_95EA], 2
        mov     ax, word ptr [B_02D2+4]
        add     ax, ax
        sub     ax, 2000h
        jmp     br_36a5_s950

fn_36c8_s950:
        call    fn_231b_s950
        mov     word ptr [FP_02CE], 0
        mov     word ptr [W_02D0_2], 1000h
        mov     word ptr [W_7CD4], 604h
        mov     word ptr [W_95EA], 0
        ret

fn_36e4_s950:
        pusha
        mov     si, MSG_THIS_DISK_NOW_FULL
        mov     dx, 5001h
        call    lcd_print
        call    fn_376c_s950
loop_36f1_s950:
        call    word ptr [IDLE_HOOK]
        sub     ax, ax
        xchg    byte ptr [KEY_CODE], al
        cmp     al, 33h
        jne     br_3702_s950
        jmp     loop_06ff
br_3702_s950:
        cmp     al, 32h
        je      br_3710_s950
        cmp     al, 31h
        jne     loop_36f1_s950
        mov     ax, 464dh
        call    disk_catalog_scan
br_3710_s950:
        call    disk_menu_action_guard
        popa
        call    show_saving
        call    fn_0d57
        ret
MSG_THIS_DISK_NOW_FULL:
        db      "This disk now full. Put in new disk.    Format i"
        db      "t (1), continue (2), abort (3) _"
        db      0feh

fn_376c_s950:
        mov     al, byte ptr [FLOPPY_CTRL]
        and     al, 7eh
        out     8, al
        mov     byte ptr [FLOPPY_CTRL], al
        else

fn_1335:
        mov     si, loop_1375
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      MODEL = 900
loop_1338:
        push    ds
        push    es
        mov     dx, word ptr [bx+12h]
        mov     ax, word ptr [bx+36h]
        and     ax, 0fh
        mov     di, ax
        mov     ax, word ptr [bx+36h]
        and     ax, 0fff0h
        or      ax, word ptr [bx+38h]
        mov     cl, 4
        ror     ax, cl
loop_1352:
        mov     ds, ax
        or      ax, 8000h
        mov     es, ax
        dec     dx
        js      br_1368
        mov     cx, 8000h
        call    si
        mov     ax, ds
        add     ax, 1000h
        jmp     loop_1352
br_1368:
        mov     cx, word ptr cs:[bx+10h]
        shr     cx, 1
        je      br_1372
        call    si
br_1372:
        pop     es
        pop     ds
        ret
loop_1375:
        mov     al, byte ptr es:[di]
        shr     al, 4
        and     byte ptr [di], 0f0h
        or      byte ptr [di], al
        endif
        if      FW_VERSION >= 400
fn_137f equ     $-1                     ; v4.0 entry; v2.1 calls fn_61d2_os21
        endif
        if      MODEL = 900
        inc     di
        inc     di
        loopne  loop_1375
        ret

fn_1385:
        mov     si, fn_138a
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      MODEL = 900
        jmp     loop_1338
fn_138a:                                ; called through si by loop_1338
        mov     al, byte ptr [di]
        shl     al, 4
        stosb
        inc     di
        loopne  fn_138a
        endif
        ret

disk_menu_action_guard:
        if      MODEL = 950
        pusha
        call    fn_2e74_s950
        jne     br_13a1
        call    fn_13b1
        endif
        cmp     byte ptr [B_02D2], 0
        je      br_13a1
        mov     ax, ERR_DISK_UNPREPARED_YOU_MUST
        jmp     error_restart
br_13a1:
        if      MODEL = 950
        else
        pusha
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    fn_2e52_os21
        endif
        if      FW_VERSION >= 400
        call    fn_15fa
        endif
        mov     al, 0bfh
        out     64h, al
        if      MODEL = 950
        call    fn_231b_s950
        mov     ax, 3f46h
        call    word ptr [W_1E64_S950]
        else
        mov     ax, 3f46h
        endif
        if      FW_VERSION >= 210

L_13ac:
        endif
        if      MODEL = 900

        call    disk_catalog_scan
        endif
        popa
        ret
        if      MODEL = 950

fn_13b1:
        push    word ptr [B_B41C_S950]
        mov     byte ptr [B_B41C_S950], 0
        mov     word ptr [P_02BC+4], 0ad2h
        mov     byte ptr [P_029E+4], 5
        mov     byte ptr [B_02AD+2], 5
        mov     word ptr [W_B4BE_S950], 0ah
        mov     byte ptr [B_B467_S950], 3
        mov     word ptr [W_B49C_S950], 0c40h
        mov     word ptr [W_B4CE_S950], 4
        mov     word ptr [W_B4D0_S950], 321h
        mov     al, byte ptr [FLOPPY_CTRL]
        push    ax
        or      al, 1
        out     8, al
        in      al, 6ah
        and     al, 2
        pop     ax
        out     8, al
        jne     br_3815_s950
        dec     byte ptr [B_B41C_S950]
        mov     byte ptr [P_029E+4], 0ah
        mov     byte ptr [B_02AD+2], 0ah
        mov     word ptr [W_B4BE_S950], 14h
        mov     byte ptr [B_B467_S950], 6
        mov     word ptr [W_B49C_S950], 1280h
        mov     word ptr [W_B4CE_S950], 5
        mov     word ptr [W_B4D0_S950], 641h
        mov     word ptr [P_02BC+4], 14a4h
br_3815_s950:
        pop     ax
        cmp     al, byte ptr [B_B41C_S950]
        je      br_3821_s950
        mov     byte ptr [B_0497], 0
br_3821_s950:
        ret

br_0d1d:
        call    fn_06c8
        call    fn_251f_s950
        call    fn_2984_s950
        mov     byte ptr [B_B464_S950], al
loop_382e_s950:
        mov     al, byte ptr [di+10h]
        cmp     al, 73h
        je      br_3839_s950
        cmp     al, 70h
        jne     br_3844_s950
br_3839_s950:
        or      byte ptr [B_B464_S950], al
        sub     byte ptr [di+10h], 20h
        call    fn_384a_s950
br_3844_s950:
        add     di, 18h
        loop    loop_382e_s950
        ret

fn_384a_s950:
        pusha
        mov     cx, 0ah
        mov     bx, 385ah
        mov     si, di
loop_3853_s950:
        lodsb
        xlat
        stosb
        loop    loop_3853_s950
        popa
        ret
        db      "0123456789 ABCDEFGHIJKLMNOPQRSTUVWXYZ#+-."
        else

fn_13b1:
        call    fn_06c8
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        jmp     fn_07de
        endif
        if      FW_VERSION >= 400
        call    fn_07de
        push    ax
        call    fn_13dc
L_13bb:
        call    fn_100a
        cmp     ax, 0
        je      br_13cc
        call    fn_1031
        call    disk_fill
        jmp     br_13d7
        db      90h
br_13cc:
        mov     word ptr [B_02D2+2], 0
        mov     byte ptr [B_02FE+0eh], 31h
br_13d7:
        call    fn_10b8
        pop     ax
        ret

fn_13dc:
        push    cx
        push    di
        push    si
        mov     cx, 100h
        mov     di, 0b6b6h
        mov     si, 8cfeh
        rep movsw
        pop     si
        pop     di
        pop     cx
        ret
        endif

fn_13ee:
        mov     si, P_02B2
        call    fdc_command
        if      MODEL = 950
        jmp     loop_1878
        else
        jmp     fn_1872
        endif
br_13f7:
        call    fn_06c8
        if      MODEL = 950
        jmp     fn_08e1
br_3892_s950:
        call    fn_36c8_s950
        call    fn_27a6_s950
        call    fn_3683_s950
        jae     br_38a3_s950
        call    fn_27a6_s950
        call    fn_36a9_s950
br_38a3_s950:
        call    fn_27a6_s950
        call    fn_3666_s950
        jae     br_38ac_s950
        ret
br_38ac_s950:
        jmp     fn_27a6_s950

fn_38af_s950:
        test    byte ptr [B_0443], 0ffh
        jne     br_38bd_s950

L_38b6_s950:
        call    fn_38be_s950
        dec     byte ptr [B_0443]
br_38bd_s950:
        ret

fn_38be_s950:
        call    fn_38c6_s950
        mov     al, 0
        call    fn_38c8_s950

fn_38c6_s950:
        mov     al, 1

fn_38c8_s950:
        out     5ah, al
        mov     cx, 18h
loop_38cd_s950:
        loop    loop_38cd_s950
        ret

L_38d0_s950:
        jmp     br_3a2d_s950
br_38d3_s950:
        inc     word ptr [W_00F2_S950]
        mov     word ptr [W_00F4_S950], 0ffffh
        mov     word ptr [W_00F6_S950], 0ffffh
        mov     word ptr [W_00F8_S950], 0ffffh
        cmp     si, 1dfch
        je      br_38f3_s950
        mov     word ptr [W_1E8C_S950+2], si
br_38f3_s950:
        in      al, 6ah
        and     al, 4
        je      br_38fc_s950
        jmp     br_3a2d_s950
br_38fc_s950:
        test    byte ptr [si+1], 30h
        je      br_3928_s950
        push    si
        mov     bx, 144h
        test    byte ptr [si+1], 10h
        jne     br_3919_s950
        cmp     byte ptr [B_B4DD_S950], 53h
        jne     br_3916_s950
        call    fn_2823_s950
br_3916_s950:
        mov     bx, 148h
br_3919_s950:
        mov     al, 1
        out     8fh, al
        mov     al, 0b8h
        out     8, al
        mov     byte ptr [FLOPPY_CTRL], al
        call    fn_2706_s950
        pop     si
br_3928_s950:
        mov     al, 1
        out     5ah, al
        call    fn_3a02_s950
        mov     ax, word ptr [FLD_HDRIVE1+9]
        dec     ax
        shl     ax, 5
        or      al, byte ptr [si]
        out     5ch, al
        mov     al, 3
        out     5ah, al
        mov     ax, word ptr [FLD_HDCONT1+9]
        dec     ax
        shl     ax, 5
        mov     dx, ax
        mov     al, byte ptr [si+1]
        cbw
        mov     al, byte ptr [W_B484_S950]
        and     al, ah
        add     ax, dx
        call    fn_3a16_s950
        mov     al, byte ptr [B_B483_S950]
        and     al, ah
        call    fn_3a16_s950
        mov     al, byte ptr [W_B482_S950]
        and     al, ah
        call    fn_3a16_s950
        mov     al, byte ptr [si+2]
        test    byte ptr [si+1], 40h
        je      br_397a_s950
        mov     ax, word ptr [B_02D2+2]
        add     ax, 1ffh
        cwd
        mov     cx, 200h
        div     cx
br_397a_s950:
        call    fn_3a16_s950
        mov     al, byte ptr [si+3]
        call    fn_3a16_s950
        mov     al, 3
        test    byte ptr [si+1], 10h
        je      br_398d_s950
        mov     al, 7
br_398d_s950:
        out     5ah, al
        je      br_39a1_s950
        cmp     byte ptr [B_B4DD_S950], 53h
        jne     br_39a1_s950
        mov     word ptr [W_95B0], 0fh
        call    fn_2571_s950
br_39a1_s950:
        mov     word ptr [W_95B0], 2eh
        cmp     word ptr [W_1E8C_S950+2], 1df0h
        jne     br_39b5_s950
        mov     word ptr [W_95B0], 125ch
br_39b5_s950:
        in      al, 6ah
        and     al, 4
        jne     br_39c8_s950
        call    fn_2f1d
        jne     br_39b5_s950
        mov     byte ptr [B_00F0_S950], 4
        jmp     br_3a2d_s950
        db      90h
br_39c8_s950:
        mov     al, 7
        out     5ah, al
        in      al, 5ch
        cmp     al, 0
        je      br_39f2_s950
        cmp     word ptr [W_1E8C_S950+2], 1dech
        jne     br_39df_s950
loop_39da_s950:
        call    fn_38be_s950
        jmp     br_39f2_s950
br_39df_s950:
        cmp     word ptr [W_95C8], P_476E
        je      loop_39da_s950
        mov     byte ptr [B_00F0_S950], 5
        mov     byte ptr [B_00F1_S950], al
        jmp     br_3a2d_s950
        db      90h
br_39f2_s950:
        mov     al, 1
        out     81h, al
        in      ax, 84h
        mov     word ptr [W_B502_S950], ax
        mov     al, 0
        out     81h, al
        sub     ax, ax
        ret

fn_3a02_s950:
        mov     al, 1
        out     81h, al
loop_3a06_s950:
        in      ax, 84h
        sub     ax, word ptr [W_B502_S950]
        endif
        if      (MODEL = 950) && (FW_VERSION = 100)
        cmp     ax, 18h
        endif
        if      (MODEL = 950) && (FW_VERSION = 120)
        cmp     ax, 28h
        endif
        if      MODEL = 950
        jb      loop_3a06_s950
        mov     al, 0
        out     81h, al
        ret

fn_3a16_s950:
        mov     word ptr [W_95B0], 20h
        push    ax
loop_3a1d_s950:
        in      al, 6ah
        and     al, 4
        jne     br_3a42_s950
        call    fn_2f1d
        jne     loop_3a1d_s950
        mov     byte ptr [B_00F0_S950], 2
br_3a2d_s950:
        mov     word ptr [W_00F4_S950], si
        mov     si, 1eb0h
        mov     di, 1f10h
        mov     cx, 5
        rep movsw
        mov     ax, MSG_HARD_DISK_NOT_READY
        jmp     error_restart
br_3a42_s950:
        pop     ax
        out     5ch, al
        elseif  (MODEL = 900) && (FW_VERSION < 400)
        jmp     fn_08e1
        else
        push    ax
        call    fn_100a
        cmp     ax, 0
        je      br_142a
        xor     ax, ax
        mov     al, byte ptr [B_95C6]
        mov     word ptr [bx+TBL_9550], ax
        call    fn_1013
        mov     word ptr [W_7CD4], 0c64h
        sub     word ptr [W_7CD4], 400h
        mov     word ptr [W_95EA], 1
        mov     word ptr [FP_02CE], 8cfeh
        call    fn_1432
br_142a:
        call    fn_10d8
        pop     ax
        call    fn_08e1
        ret

fn_1432:
        push    cx
        push    di
        push    si
        mov     cx, 100h
        mov     si, 0b6b6h
        mov     di, 8cfeh
        rep movsw
        pop     si
        pop     di
        pop     cx
        endif
        if      (FW_VERSION >= 400) || (MODEL = 950)
        ret
        endif

disk_catalog_find:
        push    si
        if      MODEL = 950
        mov     di, DISK_CATALOG
        mov     cx, word ptr [W_1E78_S950]
        mov     dx, di
        else
        mov     dx, DISK_CATALOG
        mov     cx, 40h
        mov     di, dx
        endif
        sub     di, 18h
loop_1450:
        add     di, 18h
        cmp     al, byte ptr [di+10h]
        loopne  loop_1450
        jne     br_1478
        mov     dx, di
        xchg    ah, cl
        mov     cl, 5
        mov     si, bx
        repe cmpsw
        xchg    cl, ah
        mov     di, dx
        jne     loop_1450
        mov     ax, word ptr [di+14h]
        if      MODEL = 950
        mov     dx, word ptr [W_1E76_S950]
        mov     word ptr [W_95EE], dx
        else
        call    sample_rate_table_lookup
        mov     ax, word ptr [W_95EC]
        endif
        and     ax, 8000h
        shl     ax, 1
br_1478:
        pop     si
        ret
loop_147a:
        if      MODEL = 950
        mov     byte ptr [B_02C3], 0ah
        else
        mov     byte ptr [B_02C3], 3
        endif
loop_147f:
        mov     al, byte ptr [B_02AC]
        if      MODEL = 950
        shl     al, 2
        else
        shl     al, 1
        shl     al, 1
        endif
        mov     byte ptr [B_02B7], al
        mov     byte ptr [B_02AA], al
        mov     al, byte ptr [B_02AB]
        mov     byte ptr [B_02B8], al

fn_1492:
        mov     si, P_02B5
        call    fdc_command
        if      MODEL = 950
        call    loop_1878
        else
        call    fn_1872
        endif
        and     al, 0f8h
        cmp     al, 20h
        jne     br_14a8
        cmp     ah, byte ptr [B_02B8]
        jne     br_14a8
        ret
br_14a8:
        dec     byte ptr [B_02C3]
        jne     loop_147f
        jmp     br_099e
        if      MODEL = 950

fn_14b1:
        mov     ax, word ptr [W_95EA]
        mov     cx, word ptr [W_B4BE_S950]
        div     cl
        cmp     ah, byte ptr [P_029E+4]
        jb      br_3aca_s950
        inc     ch
        sub     ah, byte ptr [P_029E+4]
br_3aca_s950:
        inc     ah
        else

fn_14b1:
        call    fn_1276
        endif
        mov     byte ptr [B_02AB], al
        mov     byte ptr [B_02AC], ch
        mov     byte ptr [B_02AD], ah
        jmp     loop_147a

disk_fill:
        cmp     byte ptr [B_95BC], 0
        je      br_14c9
        ret
br_14c9:
        if      MODEL = 950
        mov     si, 1f10h
        mov     di, 1f3ah
        mov     cx, 5
        rep movsw
        endif
        push    word ptr [W_9582]
        mov     byte ptr [W_9582], 63h
        if      MODEL = 950
        call    fn_1832
        endif
        mov     ax, P_0EDC
        cmp     byte ptr [B_02D2], 0ffh
        je      br_14f0
        if      MODEL = 950
        call    fn_2984_s950
        cwd
        mov     bl, 53h
        mov     bp, 3ch
        cmp     byte ptr [B_B464_S950], al
        pushf
        je      br_3b15_s950
        mov     bp, 96h
br_3b15_s950:
        cmp     byte ptr [di+10h], bl
        jne     br_3b24_s950
        add     ax, word ptr [di+11h]
        adc     dl, byte ptr [di+13h]
        sub     ax, bp
        sbb     dl, ch
br_3b24_s950:
        add     di, 18h
        loop    br_3b15_s950
        call    fn_3c3d_s950
        div     cx
        popf
        je      br_3b3b_s950
        mov     cx, 3
        mul     cx
        mov     cx, 4
        div     cx
br_3b3b_s950:
        call    fn_158b
        mov     ax, P_0ED8
br_14f0:
        mov     bx, 22b8h
        call    fn_159e
        call    fn_2e3f_os21
        call    fn_158b
        else
        mov     ax, 320h
        sub     ax, word ptr [W_95C4]
        mov     cx, 64h
        mul     cx
        mov     cx, 2c4h
        div     cx
        call    fn_158b
br_14f0:
        endif
        mov     bx, P_0600
        mov     ax, P_0ED8
        call    fn_159e
        if      MODEL = 950
        mov     ax, word ptr [W_95C4]
        mul     word ptr [W_1E76_S950]
        call    fn_3c3d_s950
        div     cx
        elseif  (MODEL = 900) && (FW_VERSION < 400)
        call    fn_2e3f_os21
        else
        call    fn_01f7
        endif
        call    fn_158b
        mov     bx, W_05F6
        mov     ax, P_0ED8
        call    fn_159e
        if      FW_VERSION >= 400
        call    fn_151f
        call    fn_158b
        mov     bx, 610h
        mov     ax, P_0ED8
        call    fn_159e
        call    fn_155a
        pop     word ptr [W_9582]
        ret

fn_151f:
        mov     bx, 88fch
        mov     cx, 40h
        xor     ax, ax
        push    dx
loop_1528:
        add     bx, 18h
        cmp     byte ptr [bx-6], 0
        je      br_154d
        cmp     word ptr [bx], 0
        jne     br_154b
        cmp     word ptr [bx-5], 0
        je      br_154d
        mov     dx, word ptr [bx-4]
        add     dx, 3
        shr     dx, 1
        shr     dx, 1
        add     ax, dx
        jmp     br_154d
        db      90h
br_154b:
        add     ax, word ptr [bx]
br_154d:
        loop    loop_1528
        pop     dx
        xor     cx, cx
        mov     cl, 7
        div     cl
        and     ax, 0ffh
        ret
        endif
        if      FW_VERSION >= 210

fn_155a:
        endif

        mov     bx, P_035B
        mov     al, 50h
        call    fn_15a5
        mov     bx, P_03B1
        mov     al, 53h
        call    fn_15a5
        mov     bx, P_04E6
        mov     al, 53h
        call    fn_15a5
        mov     bx, P_04F6
        mov     al, 50h
        call    fn_15a5
        mov     dx, P_044B
        mov     al, 50h
        call    fn_15d7
        mov     dx, P_04A1
        mov     al, 53h
        call    fn_15d7
        if      FW_VERSION < 400
        pop     word ptr [W_9582]
        endif
        ret

fn_158b:
        mov     bp, P_0ED0
        mov     di, word ptr [bp]
        dec     di
        if      MODEL = 950
        mov     dx, 105h
        else
        mov     dx, 104h
        endif
        jmp     put_number
loop_1598:
        mov     si, ax
        movsw
        movsw
        inc     bx
        inc     bx

fn_159e:
        mov     di, word ptr [bx]
        and     di, di
        jne     loop_1598
        ret

fn_15a5:
        push    ax
        if      FW_VERSION >= 210

L_15a6:
        endif

        call    disk_catalog_find
        pop     ax
        je      br_15c6
        if      MODEL = 950
        mov     cx, word ptr [W_1E78_S950]
        else
        mov     cx, 40h
        endif
        mov     si, DISK_CATALOG
loop_15b2:
        cmp     al, byte ptr [si+10h]
        je      br_15bf
        add     si, 18h
        loop    loop_15b2
        mov     si, P_15C7
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
br_15bf:
        mov     di, bx
        mov     cx, 5
        rep movsw
br_15c6:
        ret
P_15C7:
        db      "NONE            "

fn_15d7:
        push    ax
        call    find_slot_by_name
        pop     ax
        jae     br_15f9
        mov     di, SLOT_TAGS
        mov     cx, SLOT_COUNT
        mov     si, SLOTS
loop_15e7:
        scasb
        je      br_15f2
        add     si, 46h
        loop    loop_15e7
        mov     si, P_15C7
br_15f2:
        mov     di, dx
        mov     cx, 5
        rep movsw
br_15f9:
        ret
        if      MODEL = 950

fn_2e3f_os21:
        call    fn_2aef
        call    fn_3c2f_s950
        shr     dx, 1
        rcr     ax, 1
        push    ax
        push    dx
        mov     bp, 64h
        div     bp
        mov     bp, ax
        pop     dx
        pop     ax
        sub     ax, bx
        sbb     dx, cx
        div     bp
        ret

fn_3c2f_s950:
        mov     dx, word ptr [W_B4A2_S950]
        mov     ax, 0
        sub     ax, 8000h
        sbb     dx, 1
        ret

fn_3c3d_s950:
        push    ax
        push    dx
        call    fn_3c2f_s950
        push    bp
        push    bx
        mov     bx, ax
        mov     bp, dx
        add     ax, ax
        rcl     dx, 1
        add     ax, bx
        adc     dx, bp
        mov     cx, 190h
        div     cx
        mov     cx, ax
        pop     bx
        pop     bp
        pop     dx
        pop     ax
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)

fn_2e3f_os21:
        call    fn_2aef
        mov     dx, 7
        mov     ax, 4000h
        sub     ax, bx
        sbb     dx, cx
        mov     cx, 128fh
        div     cx
        endif
        if      FW_VERSION = 210

        RUN_FN_01F7
        endif
        if      FW_VERSION < 400
        ret
        endif
        if      FW_VERSION >= 210

fn_15fa:
        endif

fn_2e52_os21:
        call    uarts_reset
        cli
        jmp     voice_reset_all

fn_1601:
        call    find_slot_by_name
        jae     fn_1607
        ret

fn_1607:
        if      MODEL = 950
        mov     byte ptr [B_B41D_S950], 0
        endif
        call    fn_0d57
        call    fn_1288
        mov     word ptr [W_95C0], di
        cmp     byte ptr [bp], 4fh
        jne     br_161f
        mov     word ptr [FP_02CE], MIDI_SETTINGS
        if      MODEL = 950
        mov     word ptr [W_02D0_2], 0
        endif
        jmp     br_1633
br_161f:
        cmp     byte ptr [bp], 44h
        jne     br_162d
        mov     word ptr [FP_02CE], DRUM_INPUTS_ON
        if      MODEL = 950
        mov     word ptr [W_02D0_2], 0
        endif
        jmp     br_1633
br_162d:
        if      MODEL = 950
        cmp     byte ptr [bp], 4dh
        else
        cmp     byte ptr [bp], 46h
        endif
        jne     br_1642
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     word ptr [FP_02CE], P_80BC
        endif
br_1633:
        mov     ax, word ptr [di+11h]
        mov     word ptr [W_95BE], ax
        if      MODEL = 950
        jmp     br_16b4
        else
        mov     word ptr [W_02D0], 0
        jmp     br_16b4
        db      90h
        endif
br_1642:
        mov     si, bx
        mov     di, W_7CEE
        mov     word ptr [FP_02CE], di
        if      MODEL = 950
        mov     word ptr [W_02D0_2], 0
        else
        mov     word ptr [W_02D0], 0
        endif
        cmp     byte ptr [bp], 50h
        jne     br_1678
        if      MODEL = 950
        push    es
        les     di, [FP_1E7C_S950+4]
        mov     word ptr [FP_02CE], di
        mov     ax, es
        mov     word ptr [W_02D0_2], ax
        endif
        mov     cx, 26h
        rep movsb
        mov     bx, word ptr [bx+12h]
loop_165f:
        mov     si, bx
        mov     cx, 46h
        rep movsb
        mov     bx, word ptr [bx+44h]
        and     bx, bx
        jne     loop_165f
        if      MODEL = 950
        pop     es
        sub     di, 4610h
        else
        sub     di, W_7CEE
        endif
        mov     word ptr [W_95BE], di
        jmp     br_16b4
        db      90h
br_1678:
        mov     cx, 3ch
        rep movsb
        if      MODEL = 950
        mov     byte ptr [di-12h], cl
        mov     ax, word ptr [W_1E70_S950]
        mov     word ptr [W_95F0], ax
        else
        mov     word ptr [W_95F0], L_16a2
        endif
        mov     word ptr [W_95C2], L_168d
        if      FW_VERSION < 400
        jmp     fn_1724
        else
        call    fn_7250
        ret
        endif

L_168d:
        mov     ax, word ptr [W_7CD4]
        add     ax, word ptr [W_95D6]
        add     ax, word ptr [W_95E4]
        xchg    dx, ax
        if      MODEL = 950
        call    word ptr [W_1E74_S950]
        mov     ax, 5357h
        jmp     word ptr [W_1E64_S950]
        else
        call    fn_16f7
        mov     ax, 5357h
        jmp     disk_catalog_scan
        endif

L_16a2:
        mov     dx, word ptr [W_95EC]
        call    fn_0e5c
        mov     di, word ptr [W_95EC]
        shl     di, 1
        mov     word ptr [di+TBL_8EFE], dx
        if      MODEL = 950
        ret

L_3d34_s950:
        mov     dx, word ptr [W_95EC]
        call    fn_3021_s950
        mov     di, word ptr [W_95EC]
        add     di, di
        jmp     br_3d8b_s950
        db      90h
        endif
        if      MODEL = 900

        ret
        endif
br_16b4:
        mov     ax, word ptr [W_95EE]
        mov     dx, word ptr [W_95BE]
        cmp     ax, dx
        jae     br_16ea
        if      MODEL = 950
        xchg    dx, ax
        call    br_16ea
        else
        mov     word ptr [W_7CD4], ax
        xchg    dx, ax
        call    fn_16f7
        mov     ax, 4457h
        call    disk_catalog_scan
        endif
        mov     ax, word ptr [W_95EE]
        sub     word ptr [W_95BE], ax
        add     word ptr [FP_02CE], ax
        if      MODEL = 950
        add     ax, ax
        mov     dx, word ptr [W_95EC]
        call    word ptr [W_1E68_S950]
        else
        mov     dx, word ptr [W_95EC]
        call    fn_0e5c
        endif
        mov     di, word ptr [W_95EC]
        shl     di, 1
        if      MODEL = 950
        call    word ptr [W_1E72_S950]
        jmp     br_16b4

br_16ea:
        call    word ptr [W_1E74_S950]
        call    fn_231b_s950
        mov     word ptr [W_7CD4], dx
        mov     ax, 4457h
        jmp     word ptr [W_1E64_S950]

L_3d86_s950:
        mov     word ptr [di+TBL_8EFE], dx
        ret
br_3d8b_s950:
        push    ax
        push    ds
        push    di
        mov     ax, 1000h
        mov     ds, ax
        mov     word ptr [di+604h], dx
        pop     di
        pop     ds
        pop     ax
        ret

L_3d9b_s950:
        push    dx
        else
        mov     word ptr [di+TBL_8EFE], dx
        endif
        if      MODEL = 900

        jmp     br_16b4
br_16ea:
        mov     word ptr [W_7CD4], dx
        call    fn_16f7
        mov     ax, 4457h
        jmp     disk_catalog_scan

fn_16f7:
        endif
        mov     ax, word ptr [W_95EA]
        mov     di, ax
        add     di, ax
        lea     di, [di+TBL_8EFE]

loop_1702:
        inc     ax
        if      MODEL = 950
        sub     dx, word ptr [W_1E76_S950]
        else
        sub     dx, 400h
        endif
        jbe     br_170c
        stosw
        jmp     loop_1702
br_170c:
        dec     ax
        mov     word ptr [W_95EC], ax
        mov     word ptr [di], 8000h
        if      MODEL = 950
        pop     dx
        ret

fn_3dbb_s950:
        mov     di, word ptr [W_95EA]
        mov     word ptr [W_95EC], di
        add     di, di
        push    ds
        mov     ax, 1000h
        mov     ds, ax
        mov     word ptr [di+604h], 8000h
        pop     ds
        ret

fn_3dd3_s950:
        call    word ptr [IDLE_HOOK]
        test    word ptr [W_95B0], 8000h
        je      br_1723
        jmp     br_099e
        else
        ret

fn_1715:
        call    timer_poll
        test    word ptr [TIMER_TICKS], 0fff0h
        je      br_1723
        jmp     loop_09bd
        endif
br_1723:
        ret

fn_1724:
        mov     ax, word ptr [bx+36h]
        mov     word ptr [W_95CE], ax
        if      MODEL = 950
        mov     dx, word ptr [bx+38h]
        mov     word ptr [W_95D0], dx
        cmp     byte ptr [B_B464_S950], 0
        je      br_3dfa_s950
        jmp     br_9916_s950
br_3dfa_s950:
        add     ax, word ptr [bx+10h]
        adc     dx, word ptr [bx+12h]
        mov     word ptr [W_95DC], ax
        mov     word ptr [W_95DE], dx
        mov     ax, word ptr [bx+10h]
        mov     word ptr [W_95D8], ax
        mov     dx, word ptr [bx+12h]
        mov     word ptr [W_95DA], dx
        mov     word ptr [W_95D6], ax
        else
        mov     word ptr [W_95DC], ax
        mov     ax, word ptr [bx+38h]
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     word ptr [W_95D0], ax
        endif
        if      FW_VERSION >= 400
        mov     word ptr [W_95D0], ax
        endif
        if      MODEL = 900
        or      ax, 8
        mov     word ptr [W_95DE], ax
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        mov     word ptr [W_95D8], ax
        mov     word ptr [W_95D6], ax
        mov     word ptr [W_95DA], dx
        endif
        shr     dx, 1
        rcr     ax, 1
        mov     word ptr [W_95E6], ax
        mov     word ptr [W_95E8], dx
        mov     word ptr [W_95E4], 0
        mov     word ptr [W_7CD4], 3ch
        mov     di, word ptr [W_95C0]
        mov     ax, word ptr [W_95EE]
        cmp     byte ptr [di+13h], 0
        jne     br_177f
        cmp     ax, word ptr [di+11h]
        jb      br_177f
        mov     ax, word ptr [W_95E6]
        mov     word ptr [W_95E4], ax
loop_1778:
        if      MODEL = 900
        call    fn_1832
        endif
        jmp     word ptr [W_95C2]
br_177f:
        sub     ax, 3ch
        mov     dx, ax
        cmp     byte ptr [bx+12h], 0
        jne     br_1794
        sub     ax, word ptr [bx+10h]
        jb      br_1794
        mov     word ptr [W_95E4], ax
        jmp     br_1798
br_1794:
        mov     word ptr [W_95D6], dx
br_1798:
        if      MODEL = 900
        call    fn_1832
        endif
        call    word ptr [W_95C2]
        call    word ptr [W_95F0]
        push    ax
        mov     bp, 0
        mov     word ptr [W_7CD4], bp
        mov     ax, word ptr [W_95E4]
        sub     word ptr [W_95E6], ax
        sbb     word ptr [W_95E8], bp
        mov     dx, word ptr [W_95D6]
        if      FW_VERSION >= 210
L_17ba:
        endif

        sub     word ptr [W_95D8], dx
        sbb     word ptr [W_95DA], bp
        jne     br_17ef
        cmp     word ptr [W_95D8], bp
        jne     br_17ef
        mov     word ptr [W_95D6], bp
        shl     ax, 1
        add     word ptr [W_95DC], ax
        adc     word ptr [W_95DE], bp
        mov     ax, word ptr [W_95E6]
        mov     word ptr [W_95E4], ax
        xchg    dx, ax
        pop     ax
        cmp     word ptr [W_95E8], bp
        jne     br_17ea
        cmp     ax, dx
        jae     loop_1778
br_17ea:
        mov     word ptr [W_95E4], ax
        jmp     br_1798
br_17ef:
        mov     di, word ptr [W_95D8]
        add     word ptr [W_95CE], dx
        adc     word ptr [W_95D0], bp
        pop     ax
        mov     word ptr [W_95D6], ax
        cmp     word ptr [W_95DA], bp
        jne     br_1798
        cmp     ax, di
        jb      br_1798
        mov     word ptr [W_95D6], di
        add     di, word ptr [W_95E6]
        mov     cx, word ptr [W_95DA]
        adc     cx, word ptr [W_95E8]
        jne     br_1828
        cmp     ax, di
        jb      br_1828
        mov     ax, word ptr [W_95E6]
        mov     word ptr [W_95E4], ax
        jmp     loop_1778
br_1828:
        sub     ax, word ptr [W_95D8]
        mov     word ptr [W_95E4], ax
        jmp     br_1798
        if      MODEL = 950

fn_1832:
        mov     word ptr [SCR_VOLUME+23h], 2056h
        pusha
        mov     si, 1f10h
        mov     di, 2252h
        mov     cx, 5
        rep movsw
        mov     dx, 1f10h
        call    fn_2fa3_s950
        inc     ax
        pushf
        jae     br_3f18_s950
        sub     ax, ax
br_3f18_s950:
        push    ax
        mov     bp, 324bh
        call    put_field_value
        pop     ax
        push    word ptr [W_9582]
        mov     byte ptr [W_9582], 63h
        mov     bp, 31a5h
        call    put_field_value
        pop     word ptr [W_9582]
        popf
        jae     br_3f4a_s950
        mov     si, 3f4ch
        mov     di, 1f1bh
        mov     cx, 5
        cmp     byte ptr [B_B464_S950], ch
        jne     br_3f48_s950
        mov     si, 3f51h
br_3f48_s950:
        rep movsb
br_3f4a_s950:
        popa
        ret
        db      "S1000S900 "

fn_3f56_s950:
        push    ds
        push    es
        mov     ax, 1000h
        mov     ds, ax
        mov     es, ax
        mov     di, 0
        mov     si, 0ch
        mov     cx, 7fh
loop_3f68_s950:
        cmp     word ptr [di+0ah], 0
        je      br_3f79_s950
        add     di, 0ch
        add     si, 0ch
        loop    loop_3f68_s950
        jmp     br_3f81_s950
        db      90h
br_3f79_s950:
        mov     al, 0ch
        mul     cl
        mov     cx, ax
        rep movsb
br_3f81_s950:
        pop     es
        pop     ds
        ret

fn_3f84_s950:
        mov     word ptr [W_95B0], 0fh
        else

fn_1832:
        mov     si, W_95CE
        mov     di, FP_95D2
        call    fn_1841
        mov     si, W_95DC
        mov     di, FP_95E0

fn_1841:
        lodsw
        push    ax
        and     ax, 0fh
        stosw
        pop     ax
        and     ax, 0fff0h
        or      ax, word ptr [si]
        mov     cl, 4
        ror     ax, cl
        stosw
        ret

fn_1853:
        mov     word ptr [TIMER_TICKS], 0
        endif
loop_1859:
        mov     si, P_02B9
        call    fdc_command
        mov     cx, 1
        call    fdc_read_result
        test    al, 20h
        je      br_186d
        mov     byte ptr [B_95FD], al
        ret
br_186d:
        if      MODEL = 950
        call    word ptr [IDLE_HOOK]
        test    word ptr [W_95B0], 8000h
        je      loop_1859
        jmp     loop_09bd
        else
        call    fn_1715
        jmp     loop_1859

fn_1872:
        mov     word ptr [TIMER_TICKS], 0
        endif
loop_1878:
        in      al, 6ah
        and     al, 1
        jne     br_1883
        if      MODEL = 950
        call    word ptr [IDLE_HOOK]
        else
        call    fn_1715
        endif
        jmp     loop_1878
br_1883:
        mov     si, P_02BC
        call    fdc_command
        mov     cx, 2
        call    fdc_read_result
        mov     ax, word ptr [FDC_RESULT]
        ret
        if      MODEL = 950
        db      00h, 00h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      00h
        endif
        if      FW_VERSION >= 400
        db      90h
        db      983 dup (0)

sample_field_enter:                                ; v4.0 zeroed the routines from here to fn_1ce6
        db      23 dup (0)

fn_1c82:
        db      68 dup (0)

fn_1cc6:
        db      30 dup (0)
B_1CE4:
        db      10h, 01h

fn_1ce6:
        push    si
        push    di
        push    ax
        push    cx
        push    es
        push    ds
        xor     di, di
        mov     ds, di
        inc     di
        mov     ax, 8000h
        mov     es, ax
        mov     si, DISK_LAST_FIELD
        mov     cx, 1893h
        sub     cx, si
        inc     cx
        call    fn_1d1c
        mov     di, 3700h
        inc     di
        mov     ax, DISK_LAST_FIELD
        mov     cx, 1ce3h
        sub     cx, ax
        inc     cx
        mov     si, SYSEX_CHECKSUM
        call    fn_1d1c
        pop     ds
        pop     es
        pop     cx
        pop     ax
        pop     di
        pop     si
        ret

fn_1d1c:
        lodsb
        stosb
        inc     di
        loop    fn_1d1c
        ret
        RUN_FN_1D22
        db      164 dup (0)
        db      03h
W_1DE1:
        db      34h, 2eh
B_1DE3:
        db      30h
W_1DE4:
        db      0ffh, 0efh
W_1DE6:
        db      0eh, 0b6h
W_1DE8:
        db      28h, 00h
W_1DEA:
        db      0ffh, 0ffh
W_1DEC:
        db      3eh, 00h
W_1DEE:
        db      00h, 00h
W_1DF0:
        db      0e8h, 0ah
W_1DF2:
        db      00h, 00h
W_1DF4:
        db      16h, 0b3h
W_1DF6:
        db      28h, 0b4h, 06h, 00h, 0ach, 3bh, 0f3h, 75h, 0f5h, 0cch, 56h, 53h, 0b1h, 04h, 0cdh, 0e0h
        db      5bh, 5eh, 0c3h
W_1E09:
        db      0cah, 0a0h
W_1E0B:
        db      4ch, 9eh
W_1E0D:
        db      42h, 00h
        RUN_FN_1E0F
        mov     cx, SLOT_COUNT+2
        mov     dx, P_A03E
loop_1e2c:
        mov     al, byte ptr [bp]
        cmp     al, 4bh
        jne     br_1e36
        call    fn_1e3e
br_1e36:
        add     dx, 46h
        inc     bp
        loop    loop_1e2c
        popa
        ret

fn_1e3e:
        mov     di, dx
        mov     word ptr [di+28h], 0
        mov     word ptr [di+3eh], 0
        push    bp
        push    cx
        mov     bx, SLOTS
        mov     cx, SLOT_COUNT
        RUN_LOOP_1E55
        mov     cx, SLOT_COUNT
        RUN_LOOP_1ED7
        mov     di, word ptr [bx+TBL_95B4]
        RUN_BR_1EFE
        mov     word ptr [si+TBL_87F6], ax
        RUN_BR_1F2F
        mov     word ptr [bx+TBL_95B4], di
        RUN_BR_1F39
        db      0feh
        db      "SAMPLES. "
        RUN_COLD_INIT_BUFFER_CLEAR_DISPATCH
        mov     cx, SLOT_COUNT
        RUN_LOOP_2020
        mov     cx, SLOT_COUNT
        RUN_LOOP_2036
        cmp     byte ptr [bx+di], 0
        jne     br_21f6
        mov     byte ptr [bx+di], 2ah
br_21f6:
        popf
        RUN_BR_2208
loop_2223:
        RUN_LOOP_2244
        mov     bx, word ptr [LAST_FIELD_PTR]
        mov     word ptr [bx], bp
        RUN_BR_22A3
        cmp     bp, word ptr [FIELD_PREVIOUS]
        mov     bp, word ptr [FIELD_RECENT]
        je      br_2368
        mov     bp, word ptr [FIELD_PREVIOUS]
        RUN_BR_2368
        pop     word ptr [FIELD_PREVIOUS]
        RUN_BR_238B
        cld
        call    voice_reset_all
        mov     byte ptr [MOTOR_TIMEOUT], 20h
        RUN_FIELD_PARSE
        mov     cx, SLOT_COUNT
        RUN_LOOP_2457
        mov     cx, 0c8h
        RUN_LOOP_246D
field_char_echo_input:
        RUN_BR_25A5
        mov     word ptr [W_1E0D], SLOT_COUNT
        cmp     byte ptr [B_9575], 0
        je      br_26ec
        mov     word ptr [W_1E09], P_A03E
        mov     word ptr [W_1E0B], W_9E4A
        mov     word ptr [W_1E0D], SLOT_COUNT+2
        RUN_BR_26EC
        mov     bx, P_B2D6
        RUN_BR_272E
        cmp     bp, FLD_SOFT_SAMPLE_1
        jne     br_276d
        call    fn_503b
br_276d:
        cmp     bp, FLD_LOUD_SAMPLE_2
        jne     br_2776
        call    fn_5045
br_2776:
        RUN_BR_2783
        mov     cx, 40h
        RUN_BR_27A0
        mov     word ptr [W_1DE8], bx
        mov     word ptr [W_1DEA], cx
        mov     word ptr [W_1DEC], di
        pop     word ptr [W_1DEE]
        mov     word ptr [W_1DF0], dx
        pop     word ptr [W_1DF2]
        mov     word ptr [W_1DF4], si
        mov     word ptr [W_1DF6], sp
        mov     word ptr [W_2968], ax
        mov     word ptr [W_9588], ax
        mov     byte ptr [B_7C57], al
        mov     byte ptr [B_296A], al
        mov     byte ptr [LCD_CURSOR_MODE], 0dh
        mov     word ptr [LCD_SCROLL_MAX], 0e0h
        RUN_LOOP_282A
loop_282d:
        loop    loop_282d
        call    knob_read
        call    lcd_scroll_screen
        call    fn_247b
        je      loop_282a
        cmp     al, 0ah
        jne     br_2843
        call    ram_test
        RUN_BR_2843
        RUN_BR_2869
loop_2881:
        mov     cx, 3e80h
loop_2884:
        loop    loop_2884
        call    fn_247b
        je      loop_2881
        RUN_BR_2894

        cmp     byte ptr [B_296A], 0ffh
        je      br_2914
        mov     byte ptr [bx+TBL_86EE], al
        inc     word ptr [W_9588]
        cmp     bl, 3
        jne     br_2900
        call    fn_2950
        RUN_LOOP_28CD
br_2914:
        mov     byte ptr [bx+TBL_87F6], al
        RUN_BR_293A
        RUN_AFTER_BR_28B0
FP_2966:
        pop     ax
        ret
W_2968:
        db      00h, 00h
B_296A:
        db      0ffh
        RUN_FN_296B
        mov     cx, SLOT_COUNT
        RUN_LOOP_2A02
        call    motor_off_timer
        RUN_MODE_KEYS
        mov     cx, SLOT_COUNT
        RUN_LOOP_2AFC
        je      br_2b3f
        mov     ax, word ptr [si+36h]
        mov     dx, word ptr [si+38h]
        add     ax, word ptr [si+10h]
        adc     dx, word ptr [si+12h]
        RUN_BR_2B3F
        RUN_FN_2B60
        mov     cx, SLOT_COUNT
        RUN_LOOP_2B77
        mov     cx, 8
        RUN_BR_2BB1
        cmp     byte ptr [bx+1dh], 2
        jne     br_2bde
        call    fn_2bf3
        out     24h, al
        mov     al, ah
        out     24h, al
        RUN_BR_2BDE
        out     50h, al
        popa
        ret

fn_2be9:
        mov     byte ptr [B_2C1F+1], al
        mov     ax, word ptr [MIDI_RX_HEAD]
        mov     word ptr [MIDI_RX_TAIL], ax
        RUN_FN_2BF3
        xor     ax, ax
        out     5ah, al
        out     5ah, al
        out     5ah, al
        mov     al, 40h
        out     5ah, al
        RUN_ISR_MIDI_RX
        db      04h
FIELD_PAGES:
        db      0ah
        RUN_LCD_PRINT

ram_test:
        cli
        call    voice_reset_all
        call    uarts_reset
        mov     si, MSG_RAM_TEST
        call    lcd_print_home
        mov     ax, 0aaaah
        call    fn_2dc0
        jne     br_2d9b
        mov     ax, 5555h
        call    fn_2dc0
        jne     br_2d9b
        mov     si, MSG_RAM_OK

lcd_print_home:
        mov     dx, 1
        jmp     lcd_print
        RUN_BR_2D9B
MSG_RAM_OK:
        db      "RAM OK  "
        RUN_MSG_BAD_RAM_BIT_DK00
        RUN_LOOP_2E2F
        mov     byte ptr [B_7C55], 0ffh
        RUN_BR_2E5D
br_2e68:
        call    motor_off_timer
        jmp     loop_2e2f
        RUN_LCD_SCROLL_SCREEN
        RUN_MOTOR_OFF_TIMER
        RUN_FIELD_PARSE_CLAMP
        endif
        if      MODEL = 900

B_2F78:
        db      00h
B_2F79:
        db      00h
        endif
B_2F7A:
        db      00h
B_2F7B:
        db      00h
B_2F7C:
        if      MODEL = 950
        db      33h
        else
        db      33h, 90h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
W_2F8A:
        else
W_2F7E:
        endif
        db      00h, 00h
W_2F80:
        db      00h, 00h
W_2F82:
        db      00h, 00h
        if      (FW_VERSION >= 210) || (MODEL = 950)
W_2F84:
        db      00h, 00h
W_2F86:
        db      00h, 00h
REC_LAST_FIELD:
        dw      FLD_PREVIOUS+9+6
W_2F8A:
        db      00h, 00h
W_2F8C:
        db      00h, 00h
        endif
W_2F8E:
        db      00h, 00h
SCR_REC_SAMPLE_NAME:
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      "    Name of sample to be recorded       "
        else
        db      "    Name of sample to be recorded.      "
        endif
        db      "              "
P_2FC6:
        db      "TONE                      "
SCR_REC_MONITOR:
        db      "    Name of program for monitoring      "
        db      "              "
P_3016:
        db      "Monitor                   "
        if      MODEL = 950
SCR_REC_AUDIO_SOURCE:
        db      "AUDIO SOURCE:     Analog input (1),     "
        db      " Digital -fibre optic(2), -phono(3) 1   "
SCR_DIGITAL_AUDIO_LEFT_RIGHT:
        db      "DIGITAL AUDIO:                          "
        db      " Left (1), Right (2), L/R mix (3)  1    "
SCR_DIGITAL_AUDIO_CD_KHZ:
        db      "DIGITAL AUDIO:                          "
        db      "CD 44KHz(1), DAT -32KHz(2), -48KHz(3) 3 "
SCR_DIGITAL_AUDIO_BOOST:
        db      "DIGITAL AUDIO BOOST:                    "
        db      "No boost (1), +6dB (2), +12dB (3)  1    "
        else
SCR_REC_SAMPLE_TYPE:
        db      " SAMPLE TYPE:     Normal (1),           "
        db      "Velocity crossfade -soft(2), -loud(3) "
B_307E:
        db      "1 "
        endif
SCR_REC_BANDWIDTH:
        db      " Audio bandwidth               Previous "
        if      MODEL = 950
        db      "  (3000 to 19200)  10000 Hz          Hz "
        else
        db      "  (3000 to 16000)  10000 Hz          Hz "
        endif
SCR_REC_TIME:
        db      " Recording time                         "
        if      MODEL = 950
        db      "  (250 to xxxxx0)    2000 mS            "
        else
        db      "  (250 to xxxxx)    1000 mS             "
        endif
SCR_REC_PITCH:
        db      " Pitch of sound being recorded.         "
        db      " Use knob or play keyboard:  C3  60     "
SCR_REC_START_WITH:
        db      "START WITH:   any key(1), footswitch(2),"
        db      "              audio level(3)            "
SCR_REC_REPLAY:
        db      "         Press ENT to replay _          "
        db      "                                        "
MSG_HIT_FOOTSWITCH_TO_START:
        db      "Hit footswitch to start recording. "
        db      85h, 0feh
MSG_PRESS_ANY_KEY_TO:
        db      "Press any key to start recording. "
        db      86h, 0feh
MSG_KNOB_SETS_TRIG_LEVEL:
        if      MODEL = 950
        db      "Knob sets trig level. ENT when ready"
        else
        db      "Knob sets trig level. Any key when ready"
        endif
        db      0feh
MSG_WAITING_FOR_AUDIO:
        db      "Waiting for audio. "
        db      95h, 0feh
MSG_RECORDING:
        db      "Recording:."
        db      9dh, 0feh
MSG_MEMORY_FULL_ERASE_SAMPLE:
        db      "Memory full. Erase a sample or "
        db      89h
        db      "overwrite an existing one. "
        db      8dh, 0feh
MSG_PLAYBACK:
        db      " Playback. "
        db      0c5h, 0feh
        if      MODEL = 900

fn_32ee:
        cmp     byte ptr [B_307E], 33h
        jne     br_3302
        cmp     word ptr [FIELD_LIST], FIELDS_REC_SAMPLE_NAME
        jne     br_3302
        cmp     byte ptr [B_9611], 0
br_3302:
        ret
        endif

fn_3303:
        mov     dx, P_2FC6
        call    fn_2b60
        je      br_3327
        if      MODEL = 950
        mov     ax, 28h
        else
        mov     ax, 190h
        endif
        cwd
        mul     cx
        mov     cx, ax
        if      MODEL = 950
        mov     ax, 28h
        else
        mov     ax, 190h
        endif
        mul     bx
        add     dx, cx
        div     word ptr [FLD_REC_BANDWIDTH+9]
        if      MODEL = 900
        cmp     byte ptr [B_307E], 31h
        je      br_3327
        shr     ax, 1
        endif
br_3327:
        mov     bp, FLD_REC_TIME
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     word ptr [bp+0dh], ax
        mov     di, word ptr [bp]
        dec     di
        mov     dh, byte ptr [bp+3]
        mov     dl, byte ptr [bp+4]
        if      MODEL = 950

L_4455_s950:
        endif
        call    field_parse
        mov     word ptr [bp+9], ax
        mov     ax, word ptr [bp+0dh]
        cmp     ax, word ptr [bp+9]
        jae     br_3348
        mov     word ptr [bp+9], ax
br_3348:
        mov     dh, 33h
        mov     dl, 38h
        jmp     put_number

fn_334f:
        mov     bp, P_967A
        if      MODEL = 950
        mov     cx, 12ch
        else
        mov     cx, 0c8h
        endif
loop_3355:
        test    byte ptr [bp+7], 4
        je      br_3378
        mov     al, byte ptr [bp+7]
        and     al, 30h
        or      al, 9
        mov     byte ptr [bp+7], al
        if      MODEL = 950
        else
        mov     al, byte ptr [bp+6]
        test    al, 8
        je      br_3371
        call    fn_32ee
        jne     br_3373
br_3371:
        or      al, 0f0h
br_3373:
        and     al, 0f7h
        mov     byte ptr [bp+6], al
        endif
br_3378:
        add     bp, 0ah
        loop    loop_3355
        ret
        if      MODEL = 950
        db      99h, 92h, 80h, 0c4h, 80h, 0cfh

fn_448f_s950:
        call    fn_4fe0_s950
        mov     word ptr [W_0010], 4489h
        mov     dx, 1a0h
        mov     al, 0
        out     dx, al

L_449e_s950:
        call    uarts_reset
        call    voice_reset_all
        out     68h, al
        mov     al, byte ptr [B_7CD2]
        call    fn_377b
        mov     byte ptr [B_2F7A], 0
        mov     ax, word ptr [FLD_DIGITAL_AUDIO_BOOST+9]
        dec     ax
        mov     byte ptr [B_B47A_S950], al
        push    es
        mov     ax, 1000h
        mov     es, ax
        xor     ax, ax
        mov     di, ax
        mov     cx, 2000h
        rep stosw
        pop     es
        mov     byte ptr [B_B46D_S950], cl
        mov     dx, 1a0h
        mov     al, 1ah
        cmp     byte ptr [FLD_REC_AUDIO_SOURCE+9], 3
        je      br_44da_s950
        or      al, 1
br_44da_s950:
        cmp     byte ptr [FLD_DIGITAL_AUDIO_LEFT_RIGHT+9], 1
        jne     br_44e3_s950
        sub     al, 8
br_44e3_s950:
        cmp     byte ptr [FLD_DIGITAL_AUDIO_LEFT_RIGHT+9], 2
        jne     br_44ec_s950
        sub     al, 10h
br_44ec_s950:
        out     dx, al
        mov     byte ptr [B_B411_S950], al
        mov     si, MSG_WAITING_FOR_DIGITAL_LEADER
        mov     dx, 1
        call    lcd_print
L_689e_os21:
        call    fn_47db_s950
        jne     br_68a4_os21
        ret
br_68a4_os21:
        mov     dx, 1a0h
        mov     cx, 3e8h
loop_4505_s950:
        in      al, dx
        test    al, 4
        jne     L_689e_os21
        loop    loop_4505_s950
        mov     al, 1
        out     8fh, al
        endif
        if      (MODEL = 950) && (FW_VERSION = 100)
        mov     al, 14h
        endif
        if      (MODEL = 950) && (FW_VERSION = 120)
        mov     al, 10h
        endif
        if      MODEL = 950
        out     8, al
        mov     byte ptr [FLOPPY_CTRL], al
        mov     al, 0
        out     81h, al
        mov     al, 55h
        out     8ah, al
        mov     ax, 0
        out     84h, ax
        mov     word ptr [W_966E], ax
        mov     al, 1
        out     86h, al
        mov     ax, 1fffh
        out     82h, ax
        mov     al, 2
        out     8fh, al
        or      byte ptr [B_B411_S950], 20h
        mov     dx, 1a0h
        mov     al, byte ptr [B_B411_S950]
        out     dx, al
        mov     ax, 4
        mov     bx, 16bh
        cmp     byte ptr [FLD_DIGITAL_AUDIO_CD_KHZ+9], 1
        je      br_455d_s950
        mov     bx, 14dh
        cmp     byte ptr [FLD_DIGITAL_AUDIO_CD_KHZ+9], 3
        je      br_455d_s950
        mov     bx, 1f4h
        mov     ax, 6
br_455d_s950:
        out     28h, al
        mov     al, ah
        out     28h, al
        cmp     byte ptr [FLD_DIGITAL_AUDIO_LEFT_RIGHT+9], 3
        jne     br_456c_s950
        shr     bx, 1
br_456c_s950:
        mov     al, bl
        out     10h, al
        mov     al, bh
        out     10h, al
        mov     word ptr [W_FCF5_S950], bx
        mov     al, 1
        out     0afh, al
        mov     al, 0
        out     0a1h, al
        mov     al, 19h
        out     0aah, al
        mov     ax, 2000h
        out     0a4h, ax
        mov     al, 1
        out     0a6h, al
        mov     ax, 0fffh
        out     0a2h, ax
        mov     al, 10h
        out     0a1h, al
        mov     ax, 0
        out     0a4h, ax
        mov     ax, 1fffh
        out     0a2h, ax
        mov     al, 0
        out     0a1h, al
        mov     al, 0
        out     0afh, al
        mov     ax, 0fh
        mul     word ptr [B_B47A_S950]
        add     al, 0cah
        out     78h, al
        sub     ax, ax
        mov     byte ptr [B_2F7B], al
        mov     word ptr [W_959E], ax
        mov     byte ptr [B_957C], al
        cmp     byte ptr [B_2F7C], 33h
        jne     br_45ed_s950
        mov     si, MSG_KNOB_SETS_TRIG_LEVEL
        mov     dx, 1
        call    lcd_print
loop_45ce_s950:
        call    fn_4ccc_s950
        call    fn_47db_s950
        jne     br_45d9_s950
        jmp     br_467e_s950
br_45d9_s950:
        cmp     al, 0
        je      loop_45ce_s950
        mov     byte ptr [B_2F7B], 0ffh
        mov     byte ptr [B_957C], 0
        mov     si, MSG_WAITING_FOR_AUDIO
        jmp     br_45fa_s950
        db      90h
br_45ed_s950:
        mov     si, MSG_HIT_FOOTSWITCH_TO_START
        cmp     byte ptr [B_2F7C], 32h
        je      br_45fa_s950
        mov     si, MSG_PRESS_ANY_KEY_TO
br_45fa_s950:
        mov     dx, 1
        call    lcd_print
loop_4600_s950:
        call    fn_47db_s950
        jne     br_4608_s950
        jmp     br_467e_s950
        db      90h
br_4608_s950:
        cmp     al, 0
        je      br_4613_s950
        cmp     byte ptr [B_2F7C], 31h
        je      br_462a_s950
br_4613_s950:
        in      al, 6ah
        and     al, 8
        je      br_4620_s950
        cmp     byte ptr [B_2F7C], 32h
        je      br_462a_s950
br_4620_s950:
        call    fn_4ccc_s950
        cmp     byte ptr [B_957C], 0
        je      loop_4600_s950
br_462a_s950:
        call    br_38a4
        in      ax, 84h
        mov     bx, 0fa0h
        cmp     byte ptr [FLD_DIGITAL_AUDIO_LEFT_RIGHT+9], 3
        jne     br_463b_s950
        add     bx, bx
br_463b_s950:
        sub     ax, bx
        jae     br_4642_s950
        add     ax, 4000h
br_4642_s950:
        and     al, 0fch
        mov     word ptr [W_966E], ax
        mov     bx, word ptr [CUR_SAMPLE]
        mov     ax, word ptr [bx+36h]
        mov     word ptr [W_9642], ax
        mov     dx, word ptr [bx+38h]
        mov     word ptr [W_9644], dx
        mov     ax, word ptr [bx+10h]
        mov     word ptr [W_9600], ax
        mov     dx, word ptr [bx+12h]
        mov     word ptr [W_9602], dx
        call    fn_495f_s950
loop_4668_s950:
        call    fn_47db_s950
        je      br_467e_s950
        call    fn_4fa3_s950
        call    br_3692
        call    fn_48df_s950
        jne     loop_4668_s950
        mov     ax, 14ah
        call    fn_6dbb_s950
br_467e_s950:
        mov     al, 0fh
        out     0afh, al
        mov     al, 1
        out     8fh, al
        mov     al, 0
        out     78h, al
        jmp     br_39c0

L_468d_s950:
        push    cx
        mov     bx, cx
        and.w   bx, 7
        shr     cx, 3
        jcxz    br_46f8_s950
        nop
loop_469a_s950:
        lodsw
        add     ax, word ptr [si]
        into
        shl     ax, 1
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        shl     ax, 1
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        shl     ax, 1
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        shl     ax, 1
        into
        inc     si
        inc     si
        stosw
        cwd
        xor     ax, dx
        sub     ax, bp
        cwd
        not     dx
        and     ax, dx
        add     bp, ax
        lodsw
        add     ax, word ptr [si]
        into
        shl     ax, 1
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        shl     ax, 1
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        shl     ax, 1
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        shl     ax, 1
        into
        inc     si
        inc     si
        stosw
        loop    loop_469a_s950
br_46f8_s950:
        mov     cx, bx
        jcxz    br_4714_s950
loop_46fc_s950:
        lodsw
        add     ax, word ptr [si]
        into
        shl     ax, 1
        into
        inc     si
        inc     si
        stosw
        loop    loop_46fc_s950
        cwd
        xor     ax, dx
        sub     ax, bp
        cwd
        not     dx
        and     ax, dx
        add     bp, ax
br_4714_s950:
        pop     bx
        mov     ax, bx
        add     ax, ax
        ret

L_471a_s950:
        push    cx
        mov     bx, cx
        and.w   bx, 7
        shr     cx, 3
        jcxz    br_476c_s950
loop_4726_s950:
        lodsw
        add     ax, word ptr [si]
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        inc     si
        inc     si
        stosw
        cwd
        xor     ax, dx
        sub     ax, bp
        cwd
        not     dx
        and     ax, dx
        add     bp, ax
        lodsw
        add     ax, word ptr [si]
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        inc     si
        inc     si
        stosw
        lodsw
        add     ax, word ptr [si]
        into
        inc     si
        inc     si
        stosw
        loop    loop_4726_s950
br_476c_s950:
        mov     cx, bx
        jcxz    br_4785_s950
loop_4770_s950:
        lodsw
        add     ax, word ptr [si]
        into
        inc     si
        inc     si
        stosw
        loop    loop_4770_s950
        cwd
        xor     ax, dx
        sub     ax, bp
        cwd
        not     dx
        and     ax, dx
        add     bp, ax
br_4785_s950:
        pop     bx
        mov     ax, bx
        add     ax, ax
        ret

L_478b_s950:
        push    cx
loop_478c_s950:
        lodsw
        shl     ax, 1
        into
        shl     ax, 1
        into
        stosw
        cwd
        xor     ax, dx
        sub     ax, bp
        cwd
        not     dx
        and     ax, dx
        add     bp, ax
        loop    loop_478c_s950
        pop     bx
        mov     ax, bx
        ret

L_47a6_s950:
        push    cx
loop_47a7_s950:
        lodsw
        shl     ax, 1
        into
        stosw
        cwd
        xor     ax, dx
        sub     ax, bp
        cwd
        not     dx
        and     ax, dx
        add     bp, ax
        loop    loop_47a7_s950
        pop     bx
        mov     ax, bx
        ret
MSG_WAITING_FOR_DIGITAL_LEADER:
        db      "Waiting for digital leader "
        db      0b4h, 0feh

fn_47db_s950:
        call    word ptr [IDLE_HOOK]
        call    key_get
        mov     ah, byte ptr [FLD_DIGITAL_AUDIO_BOOST+9]
        cmp     al, 2bh
        je      br_47f1_s950
        cmp     al, 2dh
        je      br_4827_s950
        cmp     al, 20h
        ret
br_47f1_s950:
        inc     ah
        cmp     ah, 3
        jb      br_47fa_s950
        mov     ah, 3
br_47fa_s950:
        mov     byte ptr [FLD_DIGITAL_AUDIO_BOOST+9], ah
        dec     ah
        mov     byte ptr [B_B47A_S950], ah
        mov     al, 0fh
        mul     ah
        add     al, 0cah
        out     78h, al
        pusha
        mov     ax, 5
        mul     byte ptr [B_B47A_S950]
        add     ax, 482fh
        xchg    si, ax
        mov     dx, 25h
        call    lcd_print
        call    fn_495f_s950
        popa
        or      al, 1
        mov     al, 0
        ret
br_4827_s950:
        dec     ah
        jne     br_47fa_s950
        inc     ah
        jmp     br_47fa_s950
        db      "0 dB"
        db      0feh
        db      "+6dB"
        db      0feh
        db      "12dB"
        db      0feh

L_483e_s950:
        push    cx
        mov     bx, cx
        and.w   bx, 7
        shr     cx, 3
        jcxz    br_48a8_s950
loop_484a_s950:
        lodsw
        sar     ax, 1
        xchg    dx, ax
        lodsw
        sar     ax, 1
        add     ax, dx
        stosw
        lodsw
        sar     ax, 1
        xchg    dx, ax
        lodsw
        sar     ax, 1
        add     ax, dx
        stosw
        lodsw
        sar     ax, 1
        xchg    dx, ax
        lodsw
        sar     ax, 1
        add     ax, dx
        stosw
        lodsw
        sar     ax, 1
        xchg    dx, ax
        lodsw
        sar     ax, 1
        add     ax, dx
        stosw
        cwd
        xor     ax, dx
        sub     ax, bp
        cwd
        not     dx
        and     ax, dx
        add     bp, ax
        lodsw
        sar     ax, 1
        xchg    dx, ax
        lodsw
        sar     ax, 1
        add     ax, dx
        stosw
        lodsw
        sar     ax, 1
        xchg    dx, ax
        lodsw
        sar     ax, 1
        add     ax, dx
        stosw
        lodsw
        sar     ax, 1
        xchg    dx, ax
        lodsw
        sar     ax, 1
        add     ax, dx
        stosw
        lodsw
        sar     ax, 1
        xchg    dx, ax
        lodsw
        sar     ax, 1
        add     ax, dx
        stosw
        loop    loop_484a_s950
br_48a8_s950:
        mov     cx, bx
        jcxz    br_48c4_s950
loop_48ac_s950:
        lodsw
        sar     ax, 1
        xchg    dx, ax
        lodsw
        sar     ax, 1
        add     ax, dx
        stosw
        loop    loop_48ac_s950
        cwd
        xor     ax, dx
        sub     ax, bp
        cwd
        not     dx
        and     ax, dx
        add     bp, ax
br_48c4_s950:
        pop     bx
        mov     ax, bx
        add     ax, ax
        ret

L_48ca_s950:
        push    cx
loop_48cb_s950:
        lodsw
        stosw
        cwd
        xor     ax, dx
        sub     ax, bp
        cwd
        not     dx
        and     ax, dx
        add     bp, ax
        loop    loop_48cb_s950
        pop     bx
        mov     ax, bx
        ret

fn_48df_s950:
        in      ax, 84h
        and     al, 0fch
        sub     ax, word ptr [W_966E]
        jae     br_48f0_s950
        mov     ax, 4000h
        sub     ax, word ptr [W_966E]
br_48f0_s950:
        cmp     byte ptr [FLD_DIGITAL_AUDIO_LEFT_RIGHT+9], 3
        jne     br_48f9_s950
        shr     ax, 1
br_48f9_s950:
        shr     ax, 1
        cmp     word ptr [W_9602], 0
        jne     br_490b_s950
        cmp     ax, word ptr [W_9600]
        jb      br_490b_s950
        mov     ax, word ptr [W_9600]
br_490b_s950:
        mov     cx, ax
        mov     si, word ptr [W_966E]
        push    ds
        push    es
        mov     ax, 1000h
        mov     ds, ax
        mov     bp, W_9642
        call    fn_26e9_s950
        mov     di, dx
        mov     es, ax
        mov     bp, word ptr cs:[W_959E]
        call    word ptr cs:[W_B538_S950]
        pop     es
        pop     ds
        add     ax, ax
        add     word ptr [W_966E], ax
        cmp     word ptr [W_966E], 4000h
        jb      br_4940_s950
        mov     word ptr [W_966E], cx
br_4940_s950:
        mov     word ptr [W_959E], bp
        mov     ax, bx
        add     bx, bx
        add     word ptr [W_9642], bx
        adc     word ptr [W_9644], cx
        sub     word ptr [W_9600], ax
        sbb     word ptr [W_9602], cx
        jne     br_495e_s950
        cmp     word ptr [W_9600], cx
br_495e_s950:
        ret

; block loop calls word ptr cs:[0B538h]. one of six by [49CCh] (3 or not),
; [49AEh] (1, 2, other).
fn_495f_s950:
        mov     cx, word ptr [FLD_DIGITAL_AUDIO_BOOST+9]
        mov     ax, L_483e_s950
        cmp     byte ptr [FLD_DIGITAL_AUDIO_LEFT_RIGHT+9], 3
        jne     br_497f_s950
        cmp     cl, 1
        je      br_4992_s950
        mov     ax, L_471a_s950
        cmp     cl, 2
        je      br_4992_s950
        mov     ax, L_468d_s950
        jmp     br_4992_s950
br_497f_s950:
        mov     ax, L_48ca_s950
        cmp     cl, 1
        je      br_4992_s950
        mov     ax, L_47a6_s950
        cmp     cl, 2
        je      br_4992_s950
        mov     ax, L_478b_s950
br_4992_s950:
        mov     word ptr [W_B538_S950], ax
        ret
FLD_REC_AUDIO_SOURCE:
        FIELD   SCR_REC_AUDIO_SOURCE, 99, 77, 78, FT_NUM, 0, L_3bab, 1, 1, 3
FLD_DIGITAL_AUDIO_BOOST:
        FIELD   SCR_DIGITAL_AUDIO_BOOST, 99, 76, 77, FT_NUM, 0, L_3bab, 1, 1, 3
FLD_DIGITAL_AUDIO_CD_KHZ:
        FIELD   SCR_DIGITAL_AUDIO_CD_KHZ, 99, 79, 80, FT_NUM, 0, L_3bab, 3, 1, 3
FLD_DIGITAL_AUDIO_LEFT_RIGHT:
        FIELD   SCR_DIGITAL_AUDIO_LEFT_RIGHT, 99, 76, 77, FT_NUM, 0, L_3bab, 1, 1, 3
        endif
FLD_REC_SAMPLE_NAME:
        TEXTFIELD SCR_REC_SAMPLE_NAME, 99, 55, 65, FT_NAME, 'S', L_3bab
FLD_REC_MONITOR:
        TEXTFIELD SCR_REC_MONITOR, 99, 55, 65, FT_NAME, 'P', set_rec_monitor_program
        if      MODEL = 950
FLD_REC_BANDWIDTH:
        FIELD   SCR_REC_BANDWIDTH, 99, 60, 65, FT_NUM+FT_UNSIGNED, 0, L_3bab, 10000, 3000, 19200
FLD_REC_TIME:
        FIELD   SCR_REC_TIME, 99, 60, 65, FT_NUM+FT_UNSIGNED, 0, L_3bab, 200, 25, 1500
        else
FLD_REC_SAMPLE_TYPE:
        FIELD   SCR_REC_SAMPLE_TYPE, 99, 79, 80, FT_KEYS, 0, L_3bab, 0, KEYS_REC_SAMPLE_TYPE, 3
KEYS_REC_SAMPLE_TYPE:
        db      31h, 32h, 33h
FLD_REC_BANDWIDTH:
        FIELD   SCR_REC_BANDWIDTH, 99, 60, 65, FT_NUM+FT_UNSIGNED, 0, L_3bab, 10000, 3000, 16000
FLD_REC_TIME:
        FIELD   SCR_REC_TIME, 99, 60, 65, FT_NUM+FT_UNSIGNED, 0, L_3bab, 1000, 250, 15000
        endif
FLD_REC_PITCH:
        FIELD   SCR_REC_PITCH, 99, 74, 76, FT_NOTE, 'K', L_3bab, 60, 24, 96
FLD_PREVIOUS:
        FIELD   SCR_REC_BANDWIDTH, 99, 72, 77, FT_NUM+FT_UNSIGNED, 0, 0, 10000, 0, 32000
FLD_REC_START_WITH:
        FIELD   SCR_REC_START_WITH, 99, 70, 71, FT_KEYS, 0, set_rec_start_with, 0, KEYS_REC_START_WITH, 3
KEYS_REC_START_WITH:
        db      31h, 32h, 33h
FLD_REC_REPLAY:
        FIELD   SCR_REC_REPLAY, 99, 30, 31, FT_KEYS, 0, rec_replay, 0, KEYS_REC_REPLAY, 1
KEYS_REC_REPLAY:
        db      0dh, 00h, 00h
FIELDS_REC_SAMPLE_NAME:
        if      MODEL = 950
        dw      FLD_REC_SAMPLE_NAME, FLD_REC_MONITOR, FLD_REC_AUDIO_SOURCE, FLD_REC_BANDWIDTH
        dw      FLD_DIGITAL_AUDIO_LEFT_RIGHT, FLD_DIGITAL_AUDIO_BOOST, FLD_REC_TIME, FLD_REC_PITCH
        dw      FLD_REC_START_WITH, FLD_REC_REPLAY, 0
FIELDS_DIGITAL_AUDIO_CD_KHZ:
        dw      FLD_DIGITAL_AUDIO_CD_KHZ, FLD_DIGITAL_AUDIO_LEFT_RIGHT, FLD_DIGITAL_AUDIO_BOOST, FLD_REC_TIME
        dw      FLD_REC_PITCH, FLD_REC_START_WITH, FLD_REC_REPLAY, 0
FIELDS_REC_BANDWIDTH:
        dw      FLD_REC_BANDWIDTH, FLD_REC_TIME, FLD_REC_PITCH, FLD_REC_START_WITH
        dw      FLD_REC_REPLAY, 0
        else
        dw      FLD_REC_SAMPLE_NAME, FLD_REC_MONITOR, FLD_REC_SAMPLE_TYPE, FLD_REC_BANDWIDTH
        dw      FLD_REC_TIME, FLD_REC_PITCH, FLD_REC_START_WITH, FLD_REC_REPLAY
        dw      0
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      10 dup (0)
        endif

rec_playback:
        cmp     word ptr [W_2F8A], 0
        jne     br_341c
        ret
br_341c:
        call    uarts_reset
        cli
        call    voice_reset_all
        call    fn_3a71
        mov     si, MSG_PLAYBACK
        mov     dx, 1
        call    lcd_print
        call    fn_334f
        if      FW_VERSION >= 210

L_3432:
        endif
        mov     al, 0fh
        out     0afh, al
        mov     al, 9
        out     8fh, al
        in      al, 0abh
        xor     al, al
        out     0a1h, al
        mov     bx, word ptr [W_2F8A]
        mov     bp, word ptr [bx+28h]
        call    fn_3473
        if      MODEL = 950
        mov     al, 0cah
        else
        mov     al, 0efh
        endif
        out     78h, al
        jmp     br_345d
loop_3450:
        test    byte ptr [bp], 4
        je      br_345d
        xor     al, al
        out     78h, al
        jmp     br_39c0
br_345d:
        mov     bp, word ptr [bp+8]
        mov     al, 4
        out     0a1h, al
        call    fn_3473
loop_3467:
        mov     al, 0fbh
        out     64h, al
        in      al, 0abh
        and     al, 1
        je      loop_3467
        jmp     loop_3450

fn_3473:
        mov     al, byte ptr [bp+7]
        out     0aah, al
        test    byte ptr [bp], 4
        je      br_347f
        ret
br_347f:
        mov     ax, word ptr [bp+4]
        out     0a4h, ax
        mov     al, byte ptr [bp+6]
        if      FW_VERSION >= 210

L_3487:
        endif
        if      MODEL = 900
        call    fn_32ee
        jne     br_348e
        and     al, 0fh
br_348e:
        endif
        out     0a6h, al
        mov     ax, word ptr [bp+2]
        out     0a2h, ax
        mov     al, 0eh
        out     0afh, al
        ret

fn_349a:
        call    fn_2466

fn_349d:
        push    bp
        jb      br_3507
        if      MODEL = 900
        mov     byte ptr [B_2F78], 2
        endif
        mov     ax, word ptr [bx+1ch]
        sub     ax, word ptr [bx+20h]
        mov     ax, word ptr [bx+1eh]
        sbb     ax, word ptr [bx+22h]
        jae     br_34b6
        jmp     br_3586
        if      MODEL = 950
        db      90h
        endif
br_34b6:
        mov     cx, word ptr [bx+20h]
        mov     dh, byte ptr [bx+22h]
        shl     cx, 1
        rcl     dh, 1
        add     cx, word ptr [bx+36h]
        adc     dh, byte ptr [bx+38h]
        if      MODEL = 900
        cmp     byte ptr [bx+2ah], 0
        je      br_34d6
        call    fn_32ee
        jne     br_3513
        add     dh, 8
        jmp     br_3513
br_34d6:
        mov     dl, byte ptr [bx+12h]
        mov     di, word ptr [bx+10h]
        shr     dl, 1
        rcr     di, 1
        mov     word ptr [W_95B4], di
        mov     byte ptr [W_95B6], dl
        sub     di, word ptr [bx+20h]
        sbb     dl, byte ptr [bx+22h]
        jb      br_350a
        mov     al, dl
        cbw
        or      ax, di
        je      br_350a
        mov     ax, word ptr [W_95B4]
        sub     ax, word ptr [bx+1ch]
        mov     al, byte ptr [W_95B6]
        sbb     al, byte ptr [bx+1eh]
        jae     br_3513
        jmp     br_3523
br_3507:
        stc
        pop     ax
        ret
br_350a:
        sub     cx, word ptr [bx+10h]
        sbb     dh, byte ptr [bx+12h]
        add     dh, 8
br_3513:
        endif
        mov     di, word ptr [bx+1ch]
        mov     dl, byte ptr [bx+1eh]
        sub     di, word ptr [bx+20h]
        sbb     dl, byte ptr [bx+22h]
        if      MODEL = 900
        dec     byte ptr [B_2F78]
        endif
br_3523:
        mov     si, bp
        mov     word ptr [si+4], cx
        mov     byte ptr [si+6], dh
        mov     byte ptr [si], 2
        mov     byte ptr [si+7], 55h
        call    fn_2466
        jb      br_3507
        mov     word ptr [si+8], bp
        xor     ax, ax
        cmp     ax, di
        mov     al, 1
        sbb     al, dl
        jae     br_3550
        dec     dl
        mov     word ptr [si+2], 0ffffh
        add     dh, 2
        jmp     br_3523
br_3550:
        dec     di
        mov     word ptr [si+2], di
        call    fn_2466
        jb      br_3507
        mov     word ptr [si+8], bp
        if      MODEL = 900
        dec     byte ptr [B_2F78]
        je      br_357b
        mov     di, word ptr [bx+1ch]
        mov     dl, byte ptr [bx+1eh]
        sub     di, word ptr [W_95B4]
        sbb     dl, byte ptr [W_95B6]
        mov     cx, word ptr [bx+36h]
        mov     dh, byte ptr [bx+38h]
        add     dh, 8
        jmp     br_3523
br_357b:
        endif
        mov     byte ptr [bp], 4
        mov     byte ptr [bp+7], 45h
        if      MODEL = 950
br_3507:
        else
        clc
        endif
        pop     ax
        ret
br_3586:
        mov     cx, word ptr [bx+20h]
        mov     dh, byte ptr [bx+22h]
        shl     cx, 1
        rcl     dh, 1
        add     cx, word ptr [bx+36h]
        adc     dh, byte ptr [bx+38h]
        sub     cx, 2
        sbb     dh, 0
        if      MODEL = 900
        cmp     byte ptr [bx+2ah], 0
        je      br_35ac
        call    fn_32ee
        jne     br_35f3
        add     dh, 8
        jmp     br_35f3
br_35ac:
        mov     dl, byte ptr [bx+12h]
        mov     di, word ptr [bx+10h]
        shr     dl, 1
        rcr     di, 1
        mov     word ptr [W_95B4], di
        mov     byte ptr [W_95B6], dl
        mov     di, word ptr [bx+20h]
        mov     dl, byte ptr [bx+22h]
        sub     di, word ptr [W_95B4]
        sbb     dl, byte ptr [W_95B6]
        jb      br_35f3
        mov     al, dl
        cbw
        or      ax, di
        je      br_35f3
        sub     cx, word ptr [bx+10h]
        sbb     dh, byte ptr [bx+12h]
        or      dh, 8
        mov     ax, word ptr [bx+1ch]
        sub     ax, word ptr [W_95B4]
        mov     al, byte ptr [bx+1eh]
        sbb     al, byte ptr [W_95B6]
        jae     br_35f3
        jmp     br_3603
loop_35f0:
        stc
        pop     ax
        ret
br_35f3:
        endif
        mov     di, word ptr [bx+20h]
        mov     dl, byte ptr [bx+22h]
        sub     di, word ptr [bx+1ch]
        sbb     dl, byte ptr [bx+1eh]
        if      MODEL = 900
        dec     byte ptr [B_2F78]
        endif
br_3603:
        mov     si, bp
        mov     word ptr [si+4], cx
        mov     byte ptr [si+6], dh
        mov     byte ptr [si], 2
        mov     byte ptr [si+7], 75h
        call    fn_2466
        jb      loop_35f0
        mov     word ptr [si+8], bp
        xor     ax, ax
        cmp     ax, di
        mov     al, 1
        sbb     al, dl
        jae     br_3630
        dec     dl
        mov     word ptr [si+2], 0ffffh
        sub     dh, 2
        jmp     br_3603
br_3630:
        dec     di
        mov     word ptr [si+2], di
        call    fn_2466
        jb      loop_35f0
        mov     word ptr [si+8], bp
        if      MODEL = 950
        else
        dec     byte ptr [B_2F78]
        je      br_3664
        mov     di, word ptr [W_95B4]
        mov     dl, byte ptr [W_95B6]
        sub     di, word ptr [bx+1ch]
        sbb     dl, byte ptr [bx+1eh]
        mov     cx, word ptr [bx+36h]
        mov     dh, byte ptr [bx+38h]
        add     cx, word ptr [bx+10h]
        adc     dh, byte ptr [bx+12h]
        sub     cx, 2
        sbb     dh, 0
        jmp     br_3603
br_3664:
        endif
        mov     byte ptr [bp], 4
        mov     byte ptr [bp+7], 65h
        if      MODEL = 950
loop_35f0:
        else
        clc
        endif
        pop     ax
        ret

fn_366f:
        mov     dx, 180h
        in      ax, dx
        cwd
        xor     ax, dx
        cmp     ax, word ptr [W_959E]
        jb      br_367f
        mov     word ptr [W_959E], ax
br_367f:
        cmp     ax, word ptr [W_2F82]
        jb      br_3692
        cmp     byte ptr [B_2F7B], 0ffh
        jne     br_3692
        mov     byte ptr [B_957C], 0ffh
loop_3691:
        ret
br_3692:
        in      al, 3ch
        and     al, 80h
        xchg    byte ptr [B_9567], al
        cmp     byte ptr [B_9567], al
        je      loop_3691
        mov     ax, word ptr [W_959E]
        cwd
        mov     cx, 0db20h
        mul     cx
        mov     word ptr [W_959E], dx
        or.w    dx, 0fh
        mov     cx, 0ch
        mov     ax, dx
loop_36b6:
        shl     ax, 1
        jb      br_36bc
        loop    loop_36b6
br_36bc:
        mov     al, ah
        mov     ah, cl
        mov     cl, 4
        shr     al, cl
        mov     bx, METER_LOG
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        xlat
        mov     cx, 2ah
        div     cl
        sub     al, 1fh
        jae     br_36d3
        mov     al, 0
br_36d3:
        mov     byte ptr [B_9573], al
        cmp     al, byte ptr [B_2F7A]
        jb      br_36e5
        mov     byte ptr [B_2F7A], al
        mov     word ptr [W_95B0], 0fh
br_36e5:
        cmp     word ptr [W_95B0], 0
        jne     br_36f1
        mov     byte ptr [B_2F7A], 0
br_36f1:
        cmp     byte ptr [B_2F7C], 33h
        jne     br_3711

L_36f8:
        call    knob_read
        je      br_3711
        add     al, byte ptr [B_7CD2]
        jns     br_3705
        xor     al, al
br_3705:
        cmp     al, 28h
        jb      br_370b
        mov     al, 27h
br_370b:
        mov     byte ptr [B_7CD2], al
        call    fn_377b
br_3711:
        mov     ah, 29h
        call    lcd_goto
        mov     cl, 0
loop_3718:
        xor     ax, ax
        cmp     byte ptr [B_2F7C], 33h
        rcl     ax, 1
        cmp     cl, byte ptr [B_9573]
        rcl     ax, 1
        cmp     cl, byte ptr [B_2F7A]
        rcl     ax, 1
        cmp     cl, 22h
        rcl     ax, 1
        cmp     cl, byte ptr [B_7CD2]
        je      br_3739
        stc
br_3739:
        rcl     ax, 1
        mov     bx, METER_CHARS
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        xlat
        xchg    ah, al
        call    lcd_put_char
        inc     cx
        cmp     cl, 28h
        jne     loop_3718
        ret
METER_CHARS:
        db      54h, 0a5h, 54h, 20h, 05h, 07h, 05h, 06h, 23h, 03h, 23h, 0ffh, 23h, 03h, 23h, 0ffh
        db      0a5h, 0a5h, 20h, 20h, 07h, 07h, 06h, 06h, 03h, 03h, 0ffh, 0ffh, 03h, 03h, 0ffh, 0ffh
        if      MODEL = 950

fn_4ccc_s950:
        mov     bx, W_966E
        mov     si, word ptr [bx]
        in      ax, 84h
        mov     word ptr [bx], ax
        sub     ax, si
        jae     br_4ce2_s950
        mov     ax, 4000h
        sub     ax, si
        mov     word ptr [bx], 0
br_4ce2_s950:
        mov     bp, word ptr [W_959E]
        mov     cl, byte ptr [B_B47A_S950]
        shr     bp, cl
        shr     ax, 1
        xchg    cx, ax
        push    ds
        mov     ax, 1000h
        mov     ds, ax
loop_4cf5_s950:
        lodsw
        cwd
        xor     ax, dx
        sub     ax, bp
        cwd
        not     dx
        and     ax, dx
        add     bp, ax
        loop    loop_4cf5_s950
        pop     ds
        xchg    bp, ax
        mov     cl, byte ptr [B_B47A_S950]
        shl     ax, cl
        jno     br_4d11_s950
        mov     ax, 7fffh
br_4d11_s950:
        mov     word ptr [W_959E], ax
        jmp     br_367f
        endif
METER_LOG:
        db      00h, 15h
        db      "*>Rcu"
        db      85h, 95h, 0a4h, 0b3h, 0c1h, 0ceh, 0dbh, 0e8h, 0f4h

fn_377b:
        pusha
        mov     cx, 28h
        sub     cl, al
        mov     di, 0e429h
        mov     ax, 8c00h
loop_3787:
        mul     di
        xchg    dx, ax
        loop    loop_3787
        mov     word ptr [W_2F82], ax
        popa
        ret

mode_record:
        call    fn_379b
        call    fn_334f
        call    program_sample_name_xref_resolve
        ret

fn_379b:
        mov     word ptr [MODE_SP], sp
        mov     word ptr [W_2F8A], 0
        mov     word ptr [FIELD_RECENT], FLD_REC_SAMPLE_NAME
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     word ptr [LAST_FIELD_PTR], FLD_REC_START_WITH
        else
        mov     word ptr [LAST_FIELD_PTR], REC_LAST_FIELD
        mov     ax, word ptr [REC_LAST_FIELD]
        mov     word ptr [FIELD_PREVIOUS], ax
        endif
        call    fn_1e0f
        mov     bp, FLD_REC_MONITOR
        if      FW_VERSION < 400
        call    fn_54b9_os21
        else
        call    fn_0903
        endif
        mov     word ptr [MODE_FILL], fn_3a9a
        call    fn_3a9a
        mov     word ptr [LCD_SCROLL_MAX], 19h
        mov     ax, FIELDS_REC_SAMPLE_NAME
        jmp     menu_navigation_loop

record_sample:
        if      (MODEL = 900) && (FW_VERSION < 210)
        cmp     word ptr [FLD_REC_TIME+9], 0
        jne     br_44e7_v12a
        else
        mov     ax, W_7CEE
        add     ax, 3ch
        mov     word ptr [W_2F8C], ax
        endif
        if      MODEL = 950
        mov     cx, 0b3fah
        endif
        if      FW_VERSION = 210
        mov     cx, 9f36h
        endif
        if      FW_VERSION >= 400
        mov     cx, 953eh
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        sub     cx, ax
        mov     word ptr [W_2F7E], cx
        endif
        if      MODEL = 950
        call    fn_4fd3_s950
        endif
        if      FW_VERSION >= 210
        cmp     word ptr [FLD_REC_TIME+9], 0
        jne     br_37f4
        endif
        if      MODEL = 900
        mov     ax, MSG_MEMORY_FULL_ERASE_SAMPLE
        jmp     error_restart
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
br_44e7_v12a:
        endif
        if      FW_VERSION >= 210
br_37f4:
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        call    uarts_reset
        call    voice_reset_all
        call    fn_3a71
        mov     al, 0
        endif
        if      MODEL = 950
        out     8, al
        mov     byte ptr [FLOPPY_CTRL], al
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        out     81h, al
        mov     al, 55h
        out     8ah, al
        mov     ax, word ptr [W_2F8C]
        out     84h, ax
        mov     al, 0
        out     86h, al
        mov     ax, word ptr [W_2F7E]
        shr     ax, 1
        dec     ax
        out     82h, ax
        mov     al, 0ch
        out     8fh, al
loop_381a:
        in      ax, 82h
        dec     ax
        jne     loop_381a
        endif
        out     68h, al
        mov     al, byte ptr [B_7CD2]
        call    fn_377b
        mov     byte ptr [B_2F7A], 0
        mov     si, MSG_KNOB_SETS_TRIG_LEVEL
        mov     al, byte ptr [B_2F7C]
        mov     byte ptr [B_2F7B], 0
        cmp     al, 33h
        je      br_3845
        mov     si, MSG_HIT_FOOTSWITCH_TO_START
        cmp     al, 32h
        je      br_3845
        mov     si, MSG_PRESS_ANY_KEY_TO
br_3845:
        mov     dx, 1
        call    lcd_print
        mov     byte ptr [B_957C], 0
        mov     word ptr [W_959E], 0
loop_3856:
        test    byte ptr [VOICES], 1fh
        if      (MODEL = 900) && (FW_VERSION < 210)
        jne     br_4528_v12a
        call    fn_3a71
br_4528_v12a:
        cmp     byte ptr [CONTROL_BY], 2
        jne     br_3860
        call    uarts_reset
        call    voice_reset_all
        else
        jne     br_3860
        call    fn_3a71
        endif
br_3860:
        call    word ptr [IDLE_HOOK]
        call    fn_366f
        cmp     byte ptr [B_957C], 0
        if      MODEL = 950
        jne     br_4e4b_s950
        else
        jne     br_38a4
        endif
        cmp     byte ptr [B_2F7C], 32h
        je      br_389e
loop_3875:
        call    key_get
        je      loop_3856
        cmp     al, 20h
        jne     br_3881
        jmp     br_39c0
br_3881:
        cmp     byte ptr [B_2F7C], 31h
        if      MODEL = 950
        je      br_4e4b_s950
        else
        je      br_38a4
        endif
        cmp     byte ptr [B_2F7C], 33h
        jne     br_3860
        mov     byte ptr [B_2F7B], 0ffh
        mov     byte ptr [B_2F7A], 0
        mov     si, MSG_WAITING_FOR_AUDIO
        jmp     br_3845
br_389e:
        in      al, 6ah
        and     al, 8
        je      loop_3875
        if      MODEL = 950
br_4e4b_s950:
        call    br_38a4
        jmp     br_4eb6_s950
        db      90h
        endif
br_38a4:
        mov     byte ptr [KEY_CODE], 0
        mov     byte ptr [B_2F7A], 0
        if      (MODEL = 900) && (FW_VERSION < 210)
        call    uarts_reset
        cli
        call    voice_reset_all
        mov     word ptr [IDLE_HOOK], L_2e27
        call    fn_3a71
        jae     br_38cb
        else
        cli
        endif
        if      MODEL = 950
        mov     word ptr [IDLE_HOOK], L_11a7_s950
        endif
        if      FW_VERSION >= 210
        mov     word ptr [IDLE_HOOK], L_2e27
        endif
        mov     dx, P_2FC6
        call    find_sample
        jb      br_38c0
        call    fn_21a1
br_38c0:
        call    find_free_slot
        jae     br_38cb
        mov     ax, ERR_MEMORY_SPACE_FOR_PROGRAMS
        jmp     error_restart
br_38cb:
        mov     byte ptr [bp], 53h
        mov     di, bx
        mov     si, W_7CEE
        mov     cx, 3ch
        rep movsb
        call    fn_349a
        mov     word ptr [bx+28h], ax
        mov     word ptr [CUR_SAMPLE], bx
        mov     si, MSG_RECORDING
        mov     dx, 1
        call    lcd_print
        mov     ax, word ptr [FLD_REC_TIME+9]
        xor     dx, dx
        if      MODEL = 950
        mov     cx, 18h
        else
        mov     cx, 0f0h
        endif
        div     cx
        mov     word ptr [W_2F8E], ax
        mov     word ptr [W_2F80], ax
        mov     byte ptr [B_9578], 0bh
        mov     bp, word ptr [bx+28h]
        mov     word ptr [W_2F8A], bx
        if      MODEL = 950
        ret
br_4eb6_s950:
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        mov     cx, word ptr [bp+2]
        push    cx
        push    word ptr [bp+4]
        push    word ptr [bp+6]
        mov     ax, 7d0h
        cwd
        sub     word ptr [bp+2], ax
        jae     br_3920
        mov     word ptr [bp+2], dx
        mov     ax, cx
br_3920:
        mov     word ptr [W_2F86], ax
        add     ax, ax
        add     word ptr [bp+4], ax
        endif
        if      MODEL = 950
        adc     byte ptr [bp+6], dl
        endif
        if      FW_VERSION >= 210
        adc     word ptr [bp+6], dx
        endif
        mov     al, 0
        out     81h, al
        if      (MODEL = 900) && (FW_VERSION < 210)
        call    fn_3a0d
        else
        in      ax, 84h
        mov     cx, ax
loop_3933:
        in      ax, 84h
        cmp     ax, cx
        je      loop_3933
        mov     word ptr [W_2F84], ax
        mov     al, 0dh
        out     8fh, al
        in      al, 8bh
        call    fn_3a0d
        pop     word ptr [bp+6]
        pop     word ptr [bp+4]
        pop     word ptr [bp+2]
        endif
loop_394e:
        test    byte ptr [bp], 4
        jne     br_396a
        mov     bp, word ptr [bp+8]
        mov     al, 4
        out     81h, al
        call    fn_3a0d
        call    fn_3a2d
        jae     loop_394e
        mov     al, 0dh
        out     8fh, al
        jmp     record_sample
br_396a:
        if      (MODEL = 900) && (FW_VERSION < 210)
        cmp     byte ptr [B_2F79], 0
        je      br_39c0
        mov     bx, word ptr [W_2F8A]
        else
        mov     bx, word ptr [W_2F8A]
        mov     ax, word ptr [W_2F84]
        mov     cx, word ptr [W_2F86]
        sub     ax, cx
        sub     ax, cx
        cmp     ax, word ptr [W_2F8C]
        jae     br_3983
        add     ax, word ptr [W_2F7E]
br_3983:
        mov     si, ax
        endif
        if      MODEL = 950
        lea     bp, [bx+36h]
        call    fn_26e9_s950
        mov     di, dx
        endif
        if      FW_VERSION >= 210
        mov     ax, word ptr [bx+36h]
        mov     di, ax
        and.w   di, 0fh
        and     ax, 0fff0h
        or      ax, word ptr [bx+38h]
        ror     ax, 4
        cmp     byte ptr [B_307E], 33h
        jne     br_39a1
        or      ah, 80h
br_39a1:
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        push    es
        mov     es, ax
loop_39a4:
        movsw
        endif
        if      FW_VERSION = 210
        cmp     si, KEY_CODE
        endif
        if      (FW_VERSION >= 400) || (MODEL = 950)
        cmp     si, P_953E
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        jne     br_39af
        mov     si, word ptr [W_2F8C]
br_39af:
        loop    loop_39a4
        pop     es
        endif
        if      MODEL = 950
        mov     ax, 14ah
        call    fn_6dbb_s950
        endif
        if      FW_VERSION >= 210
        cmp     byte ptr [B_2F79], 0
        je      br_39c0
        mov     bx, word ptr [W_2F8A]
        call    fn_39db
        endif

RUN_BR_39C0 macro   {GLOBALSYMBOLS}

br_39c0:
        call    fn_1c82
        mov     word ptr [IDLE_HOOK], idle_tasks
        call    fn_334f
        call    program_sample_name_xref_resolve
        if      MODEL = 950
        call    fn_78a8_s950
        endif
        call    fn_66aa
        sti
        jmp     lcd_redraw
        endm
        if      (FW_VERSION >= 210) || (MODEL = 950)
        RUN_BR_39C0
        endif
        if      FW_VERSION >= 210

L_39d6:
        xor     ax, ax
        rep stosw
        ret

fn_39db:
        endif
        if      MODEL = 900
        mov     ax, word ptr [bx+36h]
        mov     word ptr [W_966E], ax
        mov     word ptr [W_9642], ax
        mov     ax, word ptr [bx+38h]
        cmp     byte ptr [B_2F79], 33h
        je      br_39f0
        or      al, 8
br_39f0:
        mov     word ptr [W_9670], ax
        mov     word ptr [W_9644], ax
        mov     ax, word ptr [bx+1ch]
        mov     word ptr [W_9600], ax
        mov     ax, word ptr [bx+1eh]
        mov     word ptr [W_9602], ax
        mov     word ptr [W_9674], L_39d6
        mov     bp, bx
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        call    fn_6210_os21
        RUN_BR_39C0

L_39d6:
        xor     ax, ax
        rep stosw
        ret
        endif
        if      FW_VERSION = 210
        jmp     fn_6210_os21
        endif
        if      FW_VERSION >= 400
        jmp     L_13bb+2
        endif

fn_3a0d:
        mov     al, byte ptr [bp+7]
        out     8ah, al
        test    byte ptr [bp], 4
        je      br_3a19
        ret
br_3a19:
        mov     ax, word ptr [bp+4]
        out     84h, ax
        mov     al, byte ptr [bp+6]
        out     86h, al
        mov     ax, word ptr [bp+2]
        out     82h, ax
        mov     al, 0ch
        out     8fh, al
        ret

fn_3a2d:
        call    word ptr [IDLE_HOOK]
        call    fn_366f
        if      MODEL = 950
        call    fn_4fa3_s950
        endif

RUN_BR_3A6F macro   {GLOBALSYMBOLS}
        call    key_get
        jne     br_3a6f
        in      al, 8bh
        and     al, 1
        je      fn_3a2d
        ret
br_3a6f:
        stc
        ret
        endm
        if      MODEL = 950
        RUN_BR_3A6F

fn_4fa3_s950:
        endif

        in      al, 3ch
        and     al, 0e0h
        xchg    byte ptr [B_9568], al
        cmp     byte ptr [B_9568], al
        je      br_3a63
        dec     word ptr [W_2F80]
        jne     br_3a63
        mov     ax, word ptr [W_2F8E]
        mov     word ptr [W_2F80], ax
        mov     ah, byte ptr [B_9578]
        cmp     ah, 28h
        je      br_3a63
        call    lcd_goto
        mov     ah, 3eh
        if      MODEL = 950
        inc     byte ptr [B_9578]
        jmp     lcd_put_char
br_3a63:
        ret

fn_4fd3_s950:
        cmp     word ptr [FLD_REC_TIME+9], 0
        jne     fn_4fe0_s950
        mov     ax, MSG_MEMORY_FULL_ERASE_SAMPLE
        jmp     error_restart

fn_4fe0_s950:
        ret

fn_3a71:
        mov     al, 0bh
        else
        call    lcd_put_char
        inc     byte ptr [B_9578]
br_3a63:
        RUN_BR_3A6F

fn_3a71:
        mov     al, 0dh
        endif
        out     24h, al
        mov     al, 0
        out     24h, al
        mov     dx, 61h
        mov     ax, 0a800h
        div     word ptr [FLD_REC_BANDWIDTH+9]
        out     10h, al
        mov     al, ah
        out     10h, al
        mov     dx, 1
        mov     ax, 3880h
        div     word ptr [FLD_REC_BANDWIDTH+9]
        if      MODEL = 950
        cmp     al, 4
        jae     br_5009_s950
        mov     al, 4
br_5009_s950:
        endif
        out     28h, al
        mov     al, ah
        out     28h, al
        ret

fn_3a9a:
        push    word ptr [W_9582]
        mov     byte ptr [W_9582], 63h
        mov     bp, FLD_REC_SAMPLE_NAME
        call    fn_1cc6
        if      MODEL = 950
        mov     bx, FIELD_PREVIOUS
        mov     si, FIELDS_REC_BANDWIDTH
        cmp     word ptr [FLD_REC_AUDIO_SOURCE+9], 1
        je      br_505b_s950
        cmp     word ptr [bx], FLD_REC_BANDWIDTH
        jne     br_5036_s950
        mov     word ptr [bx], FLD_DIGITAL_AUDIO_CD_KHZ
br_5036_s950:
        mov     si, FIELDS_DIGITAL_AUDIO_CD_KHZ
        mov     word ptr [FLD_REC_BANDWIDTH+9], 44e8h
        cmp     byte ptr [FLD_DIGITAL_AUDIO_CD_KHZ+9], 1
        je      br_506b_s950
        mov     word ptr [FLD_REC_BANDWIDTH+9], 3200h
        cmp     byte ptr [FLD_DIGITAL_AUDIO_CD_KHZ+9], 2
        je      br_506b_s950
        mov     word ptr [FLD_REC_BANDWIDTH+9], 4b00h
        jmp     br_506b_s950
br_505b_s950:
        cmp     word ptr [bx], FLD_DIGITAL_AUDIO_CD_KHZ
        je      br_5067_s950
        cmp     word ptr [bx], FLD_DIGITAL_AUDIO_LEFT_RIGHT
        jne     br_506b_s950
br_5067_s950:
        mov     word ptr [bx], FLD_REC_BANDWIDTH
br_506b_s950:
        mov     di, 4a4ah
        mov     cx, 7
        rep movsw
        endif
        call    fn_3303
        mov     bx, W_7CEE
        mov     di, bx
        mov     dx, P_2FC6
        mov     si, dx
        mov     cx, 5
        rep movsw
        xor     ax, ax
        mov     word ptr [FLD_PREVIOUS+9], ax
        mov     cx, 32h
        rep stosb
        if      MODEL = 900
        mov     al, byte ptr [B_307E]
        mov     byte ptr [B_2F79], al
        endif
        push    bx
        call    find_sample
        jb      br_3afb
        mov     word ptr [CUR_SAMPLE], bx
        mov     ax, word ptr [bx+14h]
        mov     cx, 2
        mul     cx
        mov     cl, 5
        div     cx
        mov     word ptr [FLD_PREVIOUS+9], ax
        call    fn_1c82
        call    program_sample_name_xref_resolve
        if      MODEL = 900
        mov     al, byte ptr [bx+2ah]
        not     ax
        and     byte ptr [B_2F79], al
        endif
        mov     ax, word ptr [bx+36h]
        mov     dx, word ptr [bx+38h]
        jmp     br_3b01
br_3afb:
        call    check_sample_slots
        call    fn_2aef
br_3b01:
        pop     bx
        mov     word ptr [bx+36h], ax
        mov     word ptr [bx+38h], dx
        if      MODEL = 950
        mov     ax, 5
        mul     word ptr [FLD_REC_BANDWIDTH+9]
        mov     cx, 0c8h
        div     cx
        mul     word ptr [FLD_REC_TIME+9]
        and     ax, 0fffeh
        else
        mov     ax, word ptr [FLD_REC_BANDWIDTH+9]
        mul     word ptr [FLD_REC_TIME+9]
        mov     cx, 0c80h
        div     cx
        mov     cx, 8
        mul     cx
        endif
        mov     word ptr [bx+1ch], ax
        mov     word ptr [bx+1eh], dx
        if      MODEL = 900
        cmp     byte ptr [B_307E], 31h
        je      br_3b2d
        dec     byte ptr [bx+2ah]
        shl     ax, 1
        rcl     dx, 1
br_3b2d:
        endif
        mov     word ptr [bx+10h], ax
        mov     word ptr [bx+12h], dx
        mov     ax, 5
        mul     word ptr [FLD_REC_BANDWIDTH+9]
        shr     dx, 1
        rcr     ax, 1
        mov     word ptr [bx+14h], ax
        mov     ax, word ptr [FLD_REC_PITCH+9]
        mov     cl, 4
        shl     ax, cl
        mov     word ptr [bx+16h], ax
        mov     word ptr [bx+24h], 7d0h
        mov     byte ptr [bx+1ah], 4fh
        mov     byte ptr [bx+2bh], 4eh
        if      MODEL = 900
        mov     al, byte ptr [bx+2ah]
        and     byte ptr [B_2F79], al
        endif
        mov     bp, FLD_PREVIOUS
        mov     ax, word ptr [bp+9]
        call    put_field_value
        pop     word ptr [W_9582]
        ret

set_rec_start_with:
        call    fn_3bb0
        jne     br_3b73
        ret
br_3b73:
        mov     byte ptr [B_2F7C], al
        if      MODEL = 950
        cmp     byte ptr [FLD_REC_AUDIO_SOURCE+9], 1
        je      br_512a_s950
        call    fn_448f_s950
        jmp     br_512d_s950
br_512a_s950:
        call    record_sample
br_512d_s950:
        else
        call    record_sample
        endif
        jmp     br_3ba8
        db      90h

set_rec_monitor_program:
        mov     dx, P_3016
        mov     di, dx
        mov     si, word ptr [CUR_PROGRAM]
        mov     cx, 5
        repe cmpsw
        je      br_3b98

L_3b8c:
        call    find_program
        jb      br_3b98
        mov     word ptr [CUR_PROGRAM], bx
        call    fn_588a
br_3b98:
        ret

rec_replay:
        xor     ax, ax
        cmp     byte ptr [ENTER_KEY], al
        jne     br_3ba2
        ret
br_3ba2:
        mov     byte ptr [ENTER_KEY], al
        call    rec_playback
br_3ba8:
        jmp     lcd_redraw

L_3bab:
        call    fn_3a9a
        jmp     br_3ba8

fn_3bb0:
        call    field_text
        mov     al, 20h
        xchg    byte ptr [di], al
        scasb
        ret
        db      00h

RUN_SET_DRUM_PITCH macro   {GLOBALSYMBOLS}
        call    fn_470d
        dec     ax
        mov     byte ptr [bx+1], al
        ret

set_drum_pitch:
        call    drum_field
        call    fn_470d
        mov     byte ptr [bx+2], al
        ret

set_drum_on_time:
        call    drum_field
        shl     ax, 1
        shl     ax, 1
        mov     word ptr [bx+0eh], ax
        ret

set_drum_capture_time:
        call    drum_field
        shl     ax, 1
        shl     ax, 1
        mov     word ptr [bx+0ch], ax
        ret

set_drum_recovery_time:
        call    drum_field
        shl     ax, 1
        shl     ax, 1
        mov     word ptr [bx+10h], ax
        ret

set_drum_gain:
        call    drum_field
        mov     byte ptr [bx+3], al
        mov     cl, 0abh
        mul     cl
        mov     byte ptr [bx+12h], ah
        ret

set_drum_trig_thresh:
        call    drum_field
        mov     byte ptr [bx+4], al
        mov     ah, al
        shl     al, 1
        add     al, ah
        add     al, 8
        mov     byte ptr [bx+5], al
        ret

fn_470d:
        pusha
        endm

RUN_FLD_PITCH macro   {GLOBALSYMBOLS}
FLD_PITCH:
        FIELD   SCR_DRUM_INPUT_MIDI, 23, 67, 70, FT_NOTE, 0, set_drum_pitch, 60, 24, 127
FLD_ON_TIME:
        FIELD   SCR_DRUM_INPUT_MIDI, 31, 74, 78, FT_NUM, 0, set_drum_on_time, 30, 1, 9999
SCR_DRUM_INPUT_TIMES:
        db      "*03 *Input *Capture time *Recovery time "
        db      "       1       30 mS         20 mS      "
FLD_DRUM_INPUT_TIMES_INPUT:
        FIELD   SCR_DRUM_INPUT_TIMES, 4, 48, 49, FT_NUM, 0, select_drum_input, 1, 1, 8
FLD_CAPTURE_TIME:
        FIELD   SCR_DRUM_INPUT_TIMES, 11, 56, 58, FT_NUM, 0, set_drum_capture_time, 3, 1, 20
FLD_RECOVERY_TIME:
        FIELD   SCR_DRUM_INPUT_TIMES, 25, 70, 72, FT_NUM, 0, set_drum_recovery_time, 20, 1, 99
SCR_DRUM_INPUT_GAIN:
        db      "*04 *Input 1  *Gain 50  *Trig thresh 20 "
        db      "                                        "
FLD_DRUM_INPUT_GAIN_INPUT:
        FIELD   SCR_DRUM_INPUT_GAIN, 4, 12, 13, FT_NUM, 0, select_drum_input, 1, 1, 8
FLD_GAIN:
        FIELD   SCR_DRUM_INPUT_GAIN, 14, 21, 23, FT_NUM, 0, set_drum_gain, 50, 1, 99
FLD_TRIG_THRESH:
        FIELD   SCR_DRUM_INPUT_GAIN, 24, 38, 40, FT_NUM, 0, set_drum_trig_thresh, 20, 1, 40

utility_fill:
        mov     al, 63h
        xchg    byte ptr [W_9582], al
        push    ax
        endm

RUN_BR_3ED2 macro   {GLOBALSYMBOLS}
br_3ed2:
        in      al, 3ch
        and     al, 50h
        xchg    byte ptr [B_3BBD], al
        cmp     byte ptr [B_3BBD], al
        je      br_3f2d
        in      al, 4ch
        or      al, 80h
        xchg    dx, ax
        mov     ah, 0c0h
L_1541_os21:
        call    lcd_command
        mov     al, byte ptr [B_3BBE]
        mov     cl, 55h
        mul     cl
        mov     bh, ah
        mov     ch, byte ptr [si+4]
        add     ch, 2
        mov     cl, 3
        endm

RUN_FLD_MASTER_TUNING macro   {GLOBALSYMBOLS}
FLD_MASTER_TUNING:
        FIELD   SCR_MASTER_TUNING, 99, 59, 62, FT_NUM+FT_SIGNED, 0, set_master_tuning, 0, -16, 16

mode_utility:
        mov     word ptr [MODE_SP], sp

L_439c:
        call    fn_29a6
        cmp     byte ptr [B_4403], 0
        je      br_43cd
        mov     word ptr [MODE_FILL], utility_fill
        call    utility_fill
        mov     word ptr [FIELD_RECENT], FLD_DRUM_INPUTS
        endm

RUN_DRUM_INPUT macro   {GLOBALSYMBOLS}
DRUM_INPUT:
        db      00h
DRUM_INPUT_PTR:
        db      00h, 00h
B_3BBD:
        db      00h
B_3BBE:
        db      00h
W_3BBF:
        endm

RUN_AFTER_L_4616_3 macro   {GLOBALSYMBOLS}
        call    put_field_byte
        mov     al, byte ptr [bx+2]
        mov     bp, FLD_PITCH
        call    put_field_byte
        mov     ax, word ptr [bx+0eh]
        shr     ax, 1
        shr     ax, 1
        mov     bp, FLD_ON_TIME
        call    put_field_value
        endm
        if      FW_VERSION >= 400
        RUN_DRUM_INPUT
        db      4eh, 9fh
B_3BC1:
        db      37h
MIDI_LAST_FIELD:
        dw      FLD_CHANNEL
UTILITY_LAST_FIELD:
        dw      FLD_DRUM_INPUT_GAIN_INPUT
        RUN_DRUM_LEVEL_CURVE
        RUN_SCR_BASIC_MIDI_CHANNEL
        RUN_DRUM_INPUTS_POLL
        RUN_BR_3ED2
        RUN_LOOP_3EFB
        RUN_BR_3F2D
        add     bx, 37h
        RUN_BR_3F8C
        RUN_MIDI_FILL

L_4037:
        RUN_BR_4094
        db      00h, 00h
        RUN_FLD_BASIC_MIDI_CHANNEL
        jmp     loop_1d2a
        RUN_SET_MIDI_TEST_VELOCITY
        mov     word ptr [LAST_FIELD_PTR], MIDI_LAST_FIELD
        mov     ax, word ptr [MIDI_LAST_FIELD]
        mov     word ptr [FIELD_PREVIOUS], ax
        RUN_L_4271
        cmp     word ptr [FIELD_LIST], P_0A5C
        RUN_LOOP_42CE
        mov     word ptr [FIELD_PREVIOUS], FLD_MASTER_TUNING
        RUN_SET_MASTER_TUNING
        dw      FLD_MASTER_TUNING
        db      00h, 00h
        RUN_FLD_MASTER_TUNING
        mov     word ptr [LAST_FIELD_PTR], UTILITY_LAST_FIELD
        mov     ax, word ptr [UTILITY_LAST_FIELD]
        mov     word ptr [FIELD_PREVIOUS], ax
        RUN_BR_43CD
        db      0ffh
        RUN_SCR_DRUM_INPUTS
FLD_MIDI_CH:
        FIELD   SCR_DRUM_INPUT_MIDI, 13, 57, 59, FT_NUM, 0, set_drum_midi_channel, 1, 1, 16
        RUN_FLD_PITCH
        RUN_L_77CF_V12A

L_4616:
        call    put_field_byte
        RUN_AFTER_L_4616
        mov     bp, FLD_MIDI_CH
        RUN_AFTER_L_4616_3
        RUN_AFTER_L_4616_2
        mov     al, byte ptr [bx+4]
        mov     bp, FLD_TRIG_THRESH
        call    put_field_byte
        pop     word ptr [W_9582]
        jmp     lcd_redraw
        RUN_SET_DRUM_INPUTS

select_drum_input:
        mov     ax, word ptr [bp+9]
        dec     ax
        mov     byte ptr [DRUM_INPUT], al
        jmp     utility_fill

set_drum_midi_channel:
        call    drum_field
        RUN_SET_DRUM_PITCH

L_470e:
        call    fn_66be
        popa
        ret

drum_field:
        mov     bx, word ptr [DRUM_INPUT_PTR]
        mov     ax, word ptr [bp+9]
        ret
        RUN_P_476E
        endif
B_4782:
        db      00h
W_4783:
        db      01h, 00h
        if      MODEL = 950
PROGRAM_LAST_FIELD:
        db      0afh, 5ch
        endif
        if      FW_VERSION < 210
P_4787:
        db      "          "
SCR_SELECT_COPY_PROGRAM:
        db      "*01       *Select, Copy      0123456789 "
        db      " PROGRAM  *Rename, Delete(-) 0123456789 "
        endif
        if      MODEL = 950
SCR_MIDI_PROG:
        db      "*02  *MIDI prog ___  *Key-loudness +00  "
        db      "     *Positional crossfade  FF          "
        endif
        if      FW_VERSION >= 210
PROGRAM_LAST_FIELD:
        dw      P_5154
P_4787:
        endif
        if      FW_VERSION = 210
        db      "          *01       *Select, Copy      GALLUS FA"
        db      "C  PROGRAM  "
        db      00h
        db      "Rename, Delete(-) GALLUS FAC "
        endif
        if      FW_VERSION >= 400
        db      "          *01       *Select, Copy      #### ####"
        db      "#  PROGRAM  "
        db      00h
        db      "Rename, Delete(-) #### ##### "
        endif
        if      MODEL = 900
SCR_KEY_LOUDNESS:
        db      "*02      *Key-loudness +00              "
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      "         *Positional crossfade  FF      "
        endif
        if      FW_VERSION >= 210
        db      "         *Positional crossfade  OFF     "
        endif
SCR_KEYGROUP:
        db      "*03  KEYGROUP:  *Select ("
B_484A:
        if      FW_VERSION < 210
        db      "00 to 32) "
W_4854:
        db      "0"
W_4855:
        db      "1"
        else
        db      " 0 to  1) "
W_4854:
        db      "1"
W_4855:
        db      " "
        endif
B_4856:
        db      "   "
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      "                *Copy(+), Delete(-) _   "
SCR_VELOCITY_XFADE:
        db      "*04         *Velocity Crossfade  FF     "
        db      " *KG01  *Velocity switch threshold 00   "
        else
        db      "  *Put_ *Get_   *Copy(+), Delete(-)     "
SCR_VELOCITY_XFADE:
        endif
        if      MODEL = 950
        db      "*04                                     "
        db      " *KG01  *Velocity switch threshold 00   "
        endif
        if      FW_VERSION >= 210
        db      "*04 *Vel X-fade OFF *50% mix at vel=  64"
        db      " *KG1   *Velocity switch threshold 128  "
        endif
SCR_SOFT_SAMPLE:
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      "*05   Soft *sample   *Low key *High key "
        db      " *KG01    0123456789  c3# 61   c3# 61   "
        else
        db      "*05 *Soft sample "
P_48E2:
        endif
        if      MODEL = 950
        db      "0123456789  at  C3# 127"
        db      " *KGall "
P_4901:
        db      "*Low key c3# 127 *Hi key C3# 127"
        endif
        if      FW_VERSION >= 210
        db      "TONE        at  C3   60"
        db      " *KG1   "
P_4901:
        db      "*Low key C0   24 *Hi key G8  127"
        endif
SCR_LOUDNESS_06:
        db      "*06 S *Loudness *Filter *Transpose *fine"
        if      MODEL = 950
        db      " *KG01  "
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        db      " *KG01 "
P_49F1:
        db      "  +00      99      +00      +00  "
SCR_LOUD_SAMPLE:
        db      "*07   Loud *sample    *Low key *High key"
        db      " *KG01 "
P_49A1:
        db      " 010123456789   c3# 61   C3# 61  "
        else
        db      " *KG1   "
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
P_4951:
        db      " +00      99      +00      +00  "
SCR_LOUD_SAMPLE:
        db      "*07 *Loud sample "
P_4982:
        endif
        if      MODEL = 950
        db      "0123456789  at  C3# 127"
        db      " *KGall "
P_49A1:
        db      "*Low key c3# 127 *Hi key C3# 127"
        endif
        if      FW_VERSION >= 210
        db      "2 SAMPLE    at  C-    0"
        db      " *KG1   "
P_49A1:
        db      " No loud sample, vlcty thrsh=128"
        endif
SCR_LOUDNESS_08:
        db      "*08 L *Loudness *Filter *Transpose *fine"
        if      MODEL = 950
        db      " *KG01  "
P_49F1:
        db      " +00      99      +00      +00  "
SCR_VCF:
        db      "*09 VCF *Attk *Dcay *Sstain *Rlse *Amnt "
        db      " *KG01    ", 5ch, 5ch, "    ", 5ch, 5ch, "     ", 5ch, 5ch, "     ", 5ch, 5ch, "   -", 5ch, 5ch, "  "
SCR_ENV:
        db      "*10 ENV *Attack *Decay *Sustain *Release"
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        db      " *KG01   +00      99      +00      +00  "
        else
        db      " *KG1   "
P_49F1:
        db      " No loud sample, vlcty thrsh=128"
        endif
        if      MODEL = 900
SCR_ENV:
        db      "*09 ENV *Attack *Decay *Sustain *Release"
        endif
        if      FW_VERSION < 210
        db      " *KG01     00     99      99       00   "
SCR_VLCTY:
        endif
        if      MODEL = 950
        db      "*11   VLCTY  *Loudness 40  *Attack 10   "
        db      " *KG01 SENS. *Filter 00 *OFF*Release +00"
SCR_WARP:
        db      "*12   WARP  *Velocity 00       *Time 00 "
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      "*10   VLCTY  *Loudness 40  *Attack 10   "
        db      " *KG01 SENS. *Filter 00    *Release +00 "
SCR_WARP:
        db      "*11   WARP  *Velocity 00       *Time 00 "
        endif
        if      FW_VERSION < 210
        db      " *KG01      *Attack offset +00          "
        else
        db      " *KG1       0     80      99       30   "
SCR_VLCTY:
        db      "*10   VLCTY  *Loudness 30  *Attack  0   "
        db      " *KG1  SENS. *Filter 10 *OFF*Release +00"
SCR_WARP:
        db      "*11   WARP  *Velocity  0       *Time 99 "
        db      " *KG1       *Attack offset +00          "
        endif
SCR_LFO:
        if      MODEL = 950
        db      "*13   LFO.  *Depth *Rate *Delay *Desync."
        else
        db      "*12   LFO.  *Depth *Rate *Delay *Desync."
        endif
        if      FW_VERSION < 210
        db      " *KG01        20     40    50      YES  "
        else
        db      " *KG1          0     42    64      ON   "
        endif
SCR_LFO_DEPTH:
        if      MODEL = 950
        db      "*14 LFO DEPTH   *Aftertouch  *Mod. wheel"
        else
        db      "*13 LFO DEPTH   *Aftertouch  *Mod. wheel"
        endif
        if      FW_VERSION < 210
        db      " *KG01               @@          @@     "
        else
        db      " *KG1                 0          50     "
        endif
SCR_KEY_FILTER:
        if      MODEL = 950
        db      "*15   *Key-filter *Const pitch *One-shot"
        else
        db      "*14   *Key-filter *Const pitch *One-shot"
        endif
        if      FW_VERSION < 210
        db      " *KG01     00           FF         FF   "
        else
        db      " *KG1      50          OFF        OFF   "
        endif
SCR_MIDI_CHANNEL:
        if      MODEL = 950
        db      "*16     *MIDI channel   This keygroup on"
        else
        db      "*15     *MIDI channel   This keygroup on"
        endif
        if      FW_VERSION < 210
        db      " *KG01 offset(0-15) 00    MIDI ch. "
        else
        db      " *KG1  offset(0-15)  0    MIDI ch. "
        endif
P_4C3C:
        db      "ALL  "
SCR_OUTPUT:
        if      MODEL = 950
        db      "*17    *OUTPUT   All(00), Mono(01-08)   "
        else
        db      "*16    *OUTPUT   All(00), Mono(01-08)   "
        endif
        if      FW_VERSION < 210
        db      " *KG01 VOICE(S)  Left(09), Right(10) 00 "
        else
        db      " *KG1  VOICE(S)  Left(09), Right(10)  0 "
SCR_VCF:
        db      "*17 VCF *Attk *Dcay *Sstain *Rlse *Amnt "
        db      " *KG1     20    20     20     20   +00  "
        endif
P_4CE1:
        db      " No loud sample, vlcty thrsh=128"
P_4D01:
        db      " No soft sample, vlcty thrsh=0  "
        if      (FW_VERSION >= 210) || (MODEL = 950)
P_4D21:
        db      "*Low key         *Hi key        "
        endif

fn_4d41:
        xor     ax, ax
        push    si
        mov     si, word ptr [bx+12h]
        jmp     br_4d4c
loop_4d49:
        mov     si, word ptr [si+44h]
br_4d4c:
        inc     ax
        cmp     word ptr [si+44h], 0
        jne     loop_4d49
        pop     si
        mov     byte ptr [bx+17h], al
        ret

mode_edit_program:
        mov     word ptr [MODE_SP], sp
        if      FW_VERSION < 210
        mov     word ptr [FIELD_RECENT], FLD_SELECT_COPY_PROGRAM
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     word ptr [LAST_FIELD_PTR], FLD_SELECT
        endif
        if      FW_VERSION >= 210
        mov     word ptr [FIELD_RECENT], P_514B
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        mov     word ptr [LAST_FIELD_PTR], PROGRAM_LAST_FIELD
        mov     ax, word ptr [PROGRAM_LAST_FIELD]
        mov     word ptr [FIELD_PREVIOUS], ax
        endif
        call    fn_29a6
        mov     word ptr [MODE_FILL], program_fill
        call    program_fill
        mov     word ptr [LCD_SCROLL_MAX], 0ffh
        mov     ax, P_5063
        jmp     menu_navigation_loop

program_fill:
        mov     al, 63h
        xchg    byte ptr [W_9582], al
        push    ax
        mov     bx, word ptr [CUR_PROGRAM]
        if      FW_VERSION < 210
        lea     si, [bx]
        mov     bp, FLD_SELECT_COPY_PROGRAM
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION >= 210
        mov     bp, word ptr [bx+12h]
loop_4d94:
        test    byte ptr [bp+12h], 20h
        jne     br_4da2
        mov     byte ptr [bp+26h], 40h
        or      byte ptr [bp+12h], 20h
br_4da2:
        mov     bp, word ptr [bp+44h]
        and     bp, bp
        jne     loop_4d94
        lea     si, [bx]
        mov     bp, P_514B
        endif
        push    si
        call    put_field_text
        pop     si
        if      FW_VERSION < 210
        mov     bp, FLD_SELECT_COPY_PROGRAM_RENAME_DELETE
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION >= 210
        mov     bp, P_5154
        endif
        call    put_field_text
        test    byte ptr [bx+15h], 80h
        if      MODEL = 950
        mov     bp, FLD_MIDI_PROG_POSITIONAL_CROSSFADE
        call    put_field_onoff
        mov     al, byte ptr [bx+1ah]
        cbw
        inc     ax
        mov     bp, FLD_MIDI_PROG
        call    put_field_value
        mov     ax, word ptr [bx+10h]
        mov     bp, FLD_MIDI_PROG_KEY_LOUDNESS
        else
        mov     bp, FLD_KEY_LOUDNESS_POSITIONAL_CROSSFADE
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      MODEL = 900
        call    put_field_onoff
        mov     ax, word ptr [bx+10h]
        mov     bp, FLD_KEY_LOUDNESS
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION >= 210

L_4dc9:
        endif
        call    put_field_value
        mov     bp, FLD_SELECT
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        xor     ax, ax
        mov     si, word ptr [bx+12h]
loop_4dd4:
        test    word ptr [si+44h], 0ffffh
        je      br_4de1
        inc     ax
        mov     si, word ptr [si+44h]
        jmp     loop_4dd4
br_4de1:
        mov     byte ptr [B_4782], al
        inc     ax
        mov     word ptr [bp+0dh], ax
        mov     byte ptr [B_484A], 20h
        mov     word ptr [W_4855], 2020h
        mov     cl, byte ptr [bp+3]
        inc     cx
        cmp     ax, 0ah
        jb      br_4e02
        inc     cx
        mov     byte ptr [B_484A], 30h
br_4e02:
        mov     byte ptr [bp+4], cl
        cmp     byte ptr [W_4783], al
        jb      br_4e11
        mov     byte ptr [W_4783], al
        mov     byte ptr [bp+9], al
br_4e11:
        push    ax
        mov     ax, word ptr [bp+9]
        and     ax, ax
        je      br_4e1e
        call    put_field_value
        jmp     br_4e29
br_4e1e:
        mov     ax, 6c61h
        mov     word ptr [W_4854], ax
        mov     al, 6ch
        mov     byte ptr [B_4856], al
br_4e29:
        pop     ax
        mov     bp, FLD_KEYGROUP
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_value
        mov     cx, word ptr [W_4783]
        dec     cx
        mov     bx, word ptr [bx+12h]
        jcxz    br_4e3f
loop_4e3a:
        mov     bx, word ptr [bx+44h]
        loop    loop_4e3a
br_4e3f:
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     cx, 0dh
        mov     si, FIELDS_VELOCITY_XFADE
        nop
        mov     bp, FLD_SELECT
        nop
        else
        mov     cx, 0eh
        mov     si, FIELDS_VELOCITY_XFADE
        mov     bp, FLD_SELECT
        endif
loop_4e48:
        lodsw
        xchg    di, ax
        mov     ax, word ptr [bp+9]
        mov     word ptr [di+9], ax
        mov     ax, word ptr [bp+0dh]
        mov     word ptr [di+0dh], ax
        mov     al, byte ptr [bp+4]
        add     al, 9
        mov     byte ptr [di+4], al
        mov     ax, word ptr [W_4854]
        mov     di, word ptr [di]
        mov     word ptr [di+2ch], ax
        mov     al, byte ptr [B_4856]
        mov     byte ptr [di+2eh], al
        loop    loop_4e48
        mov     word ptr [CUR_KEYGROUP], bx
        mov     al, 20h
        mov     cx, 20h
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     di, 498ch
        else
        mov     di, P_4951
        endif
        rep stosb
        mov     cl, 20h
        mov     di, P_49F1
        rep stosb
        if      (FW_VERSION >= 210) || (MODEL = 950)
        mov     si, P_4D21
        mov     cl, 20h
        mov     di, P_4901
        rep movsb
        mov     si, P_4D21
        endif
        mov     cl, 20h
        mov     di, P_49A1
        if      (MODEL = 900) && (FW_VERSION < 210)
        rep stosb
        mov     cl, 20h
        mov     di, 4a7ch
        rep stosb
        else
        rep movsb
        endif
        mov     si, P_5063
loop_4e9a:
        lodsw
        and     ax, 7fffh
        je      br_4ea7
        xchg    di, ax
        and     byte ptr [di+2], 7fh
        jmp     loop_4e9a
br_4ea7:
        call    fn_501b
        lea     si, [bx+18h]
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     bp, FLD_SOFT_SAMPLE_SAMPLE
        nop
        else
        mov     bp, FLD_SOFT_SAMPLE_1
        endif
        call    fn_1cc6
        call    put_field_text
        mov     si, P_5109
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
loop_4eb9:
        lodsw
        and     ax, ax
        je      br_4ec4
        xchg    bp, ax
        call    fn_500f
        jmp     loop_4eb9
br_4ec4:
        mov     ax, word ptr [bx+2ah]
        mov     cl, 4
        add     ax, 8
        sar     ax, cl
        mov     bp, FLD_LOUDNESS_06_TRANSPOSE
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_byte
        mov     ax, word ptr [bx+2ah]
        and     ax, 0fh
        test    ax, 8
        je      br_4ee2
        or      ax, 0fff0h
br_4ee2:
        mov     bp, FLD_LOUDNESS_06_FINE
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_byte
        lea     si, [bx+2eh]
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     bp, FLD_LOUD_SAMPLE_SAMPLE
        nop
        else
        mov     bp, FLD_LOUD_SAMPLE_2
        endif
        call    fn_1cc6
        call    put_field_text
        mov     ax, word ptr [bx+40h]
        mov     cl, 4
        add     ax, 8
        sar     ax, cl
        mov     bp, FLD_LOUDNESS_08_TRANSPOSE
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_byte
        mov     ax, word ptr [bx+40h]
        and     ax, 0fh
        test    ax, 8
        je      br_4f12
        or      ax, 0fff0h
br_4f12:
        mov     bp, FLD_LOUDNESS_08_FINE
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_byte
        if      MODEL = 900
        test    byte ptr [bx+12h], 2
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     bp, FLD_VELOCITY_CROSSFADE
        nop
        endif
        if      FW_VERSION >= 210
        mov     bp, FLD_VEL_X_FADE
        endif
        if      MODEL = 900
        call    put_field_onoff
        endif
        push    bx
        call    fn_578b
        pop     bx
        mov     al, byte ptr [bx+13h]
        inc     ax
        mov     bp, FLD_OUTPUT
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_byte
        test    byte ptr [bx+12h], 1
        mov     bp, FLD_CONST_PITCH
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_onoff
        test    byte ptr [bx+12h], 4
        mov     bp, FLD_DESYNC
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_onoff
        test    byte ptr [bx+12h], 8
        mov     bp, FLD_ONE_SHOT
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        else
        call    put_field_onoff
        test    byte ptr [bx+12h], 10h
        mov     bp, FLD_OFF
        endif
        call    put_field_onoff
        mov     al, byte ptr [bx+2]
        mov     ah, 0
        push    ax
        mov     bp, FLD_VELOCITY_SWITCH_THRESHOLD
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        call    put_field_value
        mov     bx, 5054h
        nop
        mov     ax, P_4D01
        mov     di, 498ch
        else
        call    put_field_value
        mov     bx, P_507B
        mov     ax, P_4D01
        mov     di, P_4901
        endif
        pop     cx
        jcxz    br_4f7f
        cmp     cl, 80h
        jne     br_4fa6
        mov     bx, P_508D
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     ax, P_4CE1
        mov     di, P_49A1
br_4f7f:
        mov     si, ax
        mov     cl, 20h
        rep movsb
        add     di, 30h
        xchg    si, ax
        mov     cl, 20h
        rep movsb
        mov     cx, 9
loop_4f90:
        test    word ptr [bx], 8000h
        jne     br_4f9c
        mov     si, word ptr [bx]
        or      byte ptr [si+2], 80h
br_4f9c:
        inc     bx
        inc     bx
        loop    loop_4f90
        if      (FW_VERSION >= 210) || (MODEL = 950)
        call    fn_503b
        call    fn_5045
        endif
br_4fa6:
        pop     ax
        mov     byte ptr [W_9582], al
        ret

put_field_text:
        call    field_text
        rep movsb
        ret

field_text:
        mov     di, word ptr [bp]
        dec     di
        mov     dl, byte ptr [bp+3]
        mov     cl, byte ptr [bp+4]
        sub     cl, dl
        mov     ch, 0
        mov     dh, 0
        add     di, dx
        ret
        db      8ah, 04h, 88h, 46h, 09h, 0c3h

put_field_onoff:
        pushf
        call    field_text
        popf
        mov     word ptr [bp+9], 0
        mov     si, TXT_NO_OFF_2
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        je      br_4fdf
        mov     si, 4feeh
        nop
        else
        je      br_4fdf
        mov     si, TXT_YES_ON_2
        endif
        dec     word ptr [bp+9]
br_4fdf:
        mov     cx, 3
        test    byte ptr [bp+5], 40h
        je      br_4fea
        add     si, cx
br_4fea:
        rep movsb
        ret
        if      (FW_VERSION >= 210) || (MODEL = 950)
TXT_YES_ON_2:
        endif
        db      "YESON "
TXT_NO_OFF_2:
        db      "NO OFF"

put_field_value:
        mov     word ptr [bp+9], ax
        mov     di, word ptr [bp]
        dec     di
        mov     dh, byte ptr [bp+3]
        mov     dl, byte ptr [bp+4]
        push    bx
        call    put_number
        pop     bx
        ret

put_field_byte:
        cbw
        jmp     put_field_value

fn_500f:
        mov     al, byte ptr [bp+0fh]
        cbw
        xchg    di, ax
        mov     al, byte ptr [bx+di]
        cbw
        call    put_field_value
        ret

fn_501b:
        mov     al, byte ptr [bx+1]
        push    ax
        mov     bp, FLD_SOFT_SAMPLE_LOW_KEY
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    put_field_byte
        pop     ax
        if      FW_VERSION < 210
        mov     bp, FLD_LOUD_SAMPLE_LOW_KEY
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION >= 210
        mov     bp, FLD_NO_LOUD_SAMPLE_VLCTY
        endif
        call    put_field_byte
        mov     al, byte ptr [bx]
        push    ax
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     bp, FLD_SOFT_SAMPLE_HIGH_KEY
        nop
        else
        mov     bp, FLD_SOFT_SAMPLE_HI_KEY
        endif
        call    put_field_byte
        pop     ax
        if      MODEL = 950
        mov     bp, FLD_LOUD_SAMPLE_HI_KEY
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        mov     bp, FLD_LOUD_SAMPLE_HIGH_KEY
        nop
        jmp     put_field_byte
        else
        mov     bp, FLD_VLCTY_THRSH
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        jmp     put_field_byte

fn_503b:
        pusha
        mov     bp, FLD_SOFT_SAMPLE_2
        mov     dx, P_48E2
        jmp     br_504c
        db      90h

fn_5045:
        pusha
        mov     bp, FLD_LOUD_SAMPLE_1
        mov     dx, P_4982
br_504c:
        push    bp
        call    find_sample
        mov     ax, 0
        jb      br_505b
        mov     ax, word ptr [bx+16h]
        sar     ax, 4
br_505b:
        pop     bp
        call    put_field_byte
        popa
        ret
        endif
        db      00h, 00h
P_5063:
        if      FW_VERSION < 210
        dw      8000h+FLD_SELECT_COPY_PROGRAM
        dw      FLD_SELECT_COPY_PROGRAM_RENAME_DELETE
        endif
        if      MODEL = 950
        db      2eh, 0dbh
        db      "N[=[]"
        db      0dbh, 9bh, 5dh, 6fh, 5ch, 4dh, 5ch, 7bh, 0dbh
        dw      FLD_LOUDNESS_08_FINE+0fh
        endif
        if      FW_VERSION >= 210
        dw      8000h+P_514B
        dw      P_5154
        endif
        if      MODEL = 900
        dw      8000h+FLD_KEY_LOUDNESS
        dw      FLD_KEY_LOUDNESS_POSITIONAL_CROSSFADE
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        dw      8000h+FLD_KEY_LOUDNESS+0fh
        db      23h, 52h, 60h, 0d1h
        db      "qSaSo"
        db      0d1h
        db      "uR5RER~"
        db      0d1h, 7eh, 52h, 8eh, 52h, 9eh, 52h, 0cdh, 52h
        endif
        if      FW_VERSION >= 210
        dw      8000h+FLD_SELECT
        dw      FLD_LOUD_SAMPLE_2+29h
        dw      FLD_SOFT_SAMPLE_LOW_KEY+10h
        dw      FLD_KEYGROUP+0e1h
        dw      8000h+FLD_KEYGROUP+0fh
        dw      FLD_VEL_X_FADE
        dw      FLD_VEL_X_FADE+0fh
        dw      FLD_VELOCITY_SWITCH_THRESHOLD
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
P_507B:
        dw      8000h+FLD_KEYGROUP+1eh
        dw      FLD_SOFT_SAMPLE_1
        endif
        if      MODEL = 950
P_476E:
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        dw      FLD_SOFT_SAMPLE_LOW_KEY
        dw      FLD_SOFT_SAMPLE_HI_KEY
        dw      8000h+FLD_KEYGROUP+2dh
        dw      FLD_SOFT_SAMPLE_1+9
        dw      FLD_SOFT_SAMPLE_1+19h
        dw      FLD_LOUDNESS_06_TRANSPOSE
        dw      FLD_LOUDNESS_06_FINE
        endif
P_508D:
        dw      8000h+FLD_KEYGROUP+3ch
        if      (MODEL = 900) && (FW_VERSION < 210)
        dw      FLD_LOUD_SAMPLE_SAMPLE
        dw      FLD_LOUD_SAMPLE_LOW_KEY
        dw      FLD_LOUD_SAMPLE_HIGH_KEY
        dw      8000h+FLD_KEYGROUP+4bh
        dw      FLD_LOUD_SAMPLE_SAMPLE+9
        dw      FLD_LOUD_SAMPLE_SAMPLE+19h
        else
        dw      FLD_LOUD_SAMPLE_2
        endif
        if      MODEL = 950
        dw      FLD_LOUD_SAMPLE_LOW_KEY
        dw      FLD_LOUD_SAMPLE_HI_KEY
        endif
        if      FW_VERSION >= 210
        dw      FLD_NO_LOUD_SAMPLE_VLCTY
        dw      FLD_VLCTY_THRSH
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        dw      8000h+FLD_KEYGROUP+4bh
        dw      FLD_LOUD_SAMPLE_2+9
        dw      FLD_LOUD_SAMPLE_2+19h
        endif
        dw      FLD_LOUDNESS_08_TRANSPOSE
        if      FW_VERSION < 210
        dw      FLD_LOUDNESS_08_TRANSPOSE+9+6
        endif
        if      MODEL = 950
        db      3eh, 0dch, 07h, 5eh, 17h
        db      "^'^7^G^"
        db      0e4h, 0dbh, 0d8h, 5dh, 0e8h, 5dh, 76h, 5eh, 86h, 5eh, 0f3h, 0dbh, 0a6h, 5eh, 96h, 5eh
        db      0b6h
        db      "^g^W^"
        db      02h, 0dch, 0d6h, 5eh, 0f6h, 5eh, 0e6h, 5eh, 11h, 0dch, 26h, 5fh, 16h, 5fh, 06h, 5fh
        db      0f8h, 5dh, 2fh, 0dch, 0e7h, 5ch, 0f7h, 5ch, 20h, 0dch, 0c6h
        db      "^6_c]"
        db      0c6h, 0dbh, 16h, 5dh
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        dw      8000h+FLD_KEYGROUP+78h
        db      80h, 53h, 90h, 53h, 0afh, 53h, 0bfh, 53h
        dw      8000h+FLD_KEYGROUP+87h
        db      0efh, 53h, 0cfh, 53h, 0ffh, 53h, 0dfh, 53h, 0e7h, 0d1h, 1fh
        db      "T?T/T"
        db      0f6h, 0d1h
        db      "oT_TOT"
        db      0a0h, 53h, 14h, 0d2h, 0adh, 52h, 0bdh, 52h, 05h, 0d2h, 0fh, 54h, 7fh, 54h, 0bh, 53h
        db      0abh, 0d1h, 0dch, 52h
        endif
        if      FW_VERSION < 210
FIELDS_OUTPUT:
        dw      8000h+FLD_OUTPUT_KG, FLD_OUTPUT, 0
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      00h, 00h, 00h, 00h, 00h, 00h
        endif
        if      FW_VERSION >= 210
        dw      FLD_LOUDNESS_08_FINE
        dw      8000h+FLD_KEYGROUP+78h
        dw      FLD_VEL_X_FADE+1fh
        dw      FLD_VEL_X_FADE+2fh
        dw      FLD_OFF+0fh
        dw      FLD_OFF+1fh
        dw      8000h+FLD_KEYGROUP+87h
        dw      FLD_OFF+3fh
        dw      FLD_OFF+2fh
        dw      FLD_OFF+4fh
        dw      FLD_OFF
        dw      FLD_DESYNC+5fh
        dw      8000h+FLD_KEYGROUP+96h
        dw      FLD_OFF+6fh
        dw      FLD_OFF+8fh
        dw      FLD_OFF+7fh
        dw      8000h+FLD_KEYGROUP+0a5h
        dw      FLD_OFF+0bfh
        dw      FLD_OFF+0afh
        dw      FLD_OFF+9fh
        dw      FLD_DESYNC
        dw      8000h+FLD_KEYGROUP+0c3h
        dw      FLD_LOUDNESS_06_TRANSPOSE+9+6
        dw      FLD_LOUDNESS_06_TRANSPOSE+9+16h
        dw      8000h+FLD_KEYGROUP+0b4h
        dw      FLD_OFF+5fh
        dw      FLD_CONST_PITCH
        dw      FLD_ONE_SHOT
        dw      8000h+FLD_KEYGROUP+5ah
        dw      FLD_LOUDNESS_06_FINE+9+6
FIELDS_OUTPUT:
        dw      8000h+FLD_OUTPUT_KG, FLD_OUTPUT, 8000h+FLD_VCF_KG, FLD_ATTK
        dw      FLD_DCAY, FLD_SSTAIN, FLD_RLSE, FLD_AMNT
        dw      0
        endif
FIELDS_VELOCITY_XFADE:
        dw      FLD_VELOCITY_XFADE_KG, FLD_SOFT_SAMPLE_KG, FLD_LOUDNESS_06_KG, FLD_LOUD_SAMPLE_KG
        dw      FLD_LOUDNESS_08_KG, FLD_MIDI_CHANNEL_KG, FLD_OUTPUT_KG, FLD_ENV_KG
        dw      FLD_VLCTY_KG, FLD_WARP_KG, FLD_LFO_KG, FLD_KEY_FILTER_KG
        if      (MODEL = 900) && (FW_VERSION < 210)
        dw      FLD_LFO_DEPTH_KG, 0
        db      00h, 00h
        else
        dw      FLD_LFO_DEPTH_KG, FLD_VCF_KG, 0
        endif
P_5109:
        dw      FLD_SOFT_SAMPLE_LOW_KEY
        if      (MODEL = 900) && (FW_VERSION < 210)
        dw      FLD_SOFT_SAMPLE_HIGH_KEY
        dw      FLD_LOUD_SAMPLE_LOW_KEY
        dw      FLD_LOUD_SAMPLE_HIGH_KEY
        dw      FLD_SOFT_SAMPLE_SAMPLE+9
        dw      FLD_SOFT_SAMPLE_SAMPLE+19h
        else
        dw      FLD_SOFT_SAMPLE_HI_KEY
        endif
        if      MODEL = 950
        dw      FLD_LOUD_SAMPLE_LOW_KEY
        dw      FLD_LOUD_SAMPLE_HI_KEY
        endif
        if      FW_VERSION >= 210
        dw      FLD_NO_LOUD_SAMPLE_VLCTY
        dw      FLD_VLCTY_THRSH
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        dw      FLD_SOFT_SAMPLE_1+9
        dw      FLD_SOFT_SAMPLE_1+19h
        endif
        dw      FLD_LOUDNESS_06_FINE+9+6
FIELDS_LOUDNESS_08:
        dw      FLD_LOUDNESS_08, FLD_LOUDNESS_08_FILTER, FLD_ENV_ATTACK, FLD_DECAY
        dw      FLD_SUSTAIN, FLD_ENV_RELEASE, FLD_VLCTY_ATTACK, FLD_VLCTY_RELEASE
        dw      FLD_VLCTY_LOUDNESS, FLD_VLCTY_FILTER, FLD_KEY_FILTER, FLD_WARP_VELOCITY
        dw      FLD_ATTACK_OFFSET, FLD_WARP_TIME, FLD_DELAY, FLD_RATE
        if      MODEL = 950
        dw      FLD_DEPTH, FLD_AFTERTOUCH, FLD_MOD_WHEEL, FLD_ATTK
        dw      FLD_DCAY, FLD_SSTAIN, FLD_RLSE, FLD_AMNT
        dw      0
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        dw      FLD_DEPTH, FLD_AFTERTOUCH, FLD_MOD_WHEEL, 0
        endif
        if      FW_VERSION < 210
FLD_SELECT_COPY_PROGRAM:
        TEXTFIELD SCR_SELECT_COPY_PROGRAM, 10, 30, 40, FT_NAME, 'P', select_program
FLD_SELECT_COPY_PROGRAM_RENAME_DELETE:
        TEXTFIELD SCR_SELECT_COPY_PROGRAM, 50, 70, 80, FT_NAME, 'P', rename_program
        endif
        if      MODEL = 950
FLD_MIDI_PROG:
        FIELD   SCR_MIDI_PROG, 5, 17, 20, FT_NUM, 0, L_565b, 1, 1, 128
FLD_MIDI_PROG_POSITIONAL_CROSSFADE:
        FIELD   SCR_MIDI_PROG, 45, 69, 70, FT_KEYS+FT_ONOFF, 0, L_6028_s950, 0, KEYS_MIDI_PROG_POSITIONAL_CROSSFADE, 2
KEYS_MIDI_PROG_POSITIONAL_CROSSFADE:
        db      2bh, 2dh
FLD_MIDI_PROG_KEY_LOUDNESS:
        FIELD   SCR_MIDI_PROG, 21, 36, 39, FT_NUM+FT_SIGNED, 0, set_key_loudness, 0, -50, 50
        endif
        if      FW_VERSION >= 210
        dw      FLD_DEPTH, FLD_AFTERTOUCH, FLD_MOD_WHEEL, FLD_ATTK
        dw      FLD_DCAY, FLD_SSTAIN, FLD_RLSE, FLD_AMNT
        dw      FLD_MIX_AT_VEL, 0
P_514B:
        dw      P_4787+0ah
        db      0ah, 1eh, 28h, 01h, 50h
        dw      select_program
P_5154:
        dw      P_4787+0ah
        db      32h, 46h, 50h, 01h, 50h
        dw      rename_program
        endif
        if      MODEL = 900
FLD_KEY_LOUDNESS_POSITIONAL_CROSSFADE:
        FIELD   SCR_KEY_LOUDNESS, 49, 73, 74, FT_KEYS+FT_ONOFF, 0, L_565b, 0, KEYS_KEY_LOUDNESS_POSITIONAL_CROSSFADE, 2
KEYS_KEY_LOUDNESS_POSITIONAL_CROSSFADE:
        db      2bh, 2dh
FLD_KEY_LOUDNESS:
        FIELD   SCR_KEY_LOUDNESS, 9, 24, 27, FT_NUM+FT_SIGNED, 0, set_key_loudness, 0, -50, 50
        endif
FLD_SELECT:
        if      FW_VERSION < 210
        FIELD   SCR_KEYGROUP, 16, 36, 38, FT_NUM, 0, L_566c, 1, 0, 2
FLD_KEYGROUP:
        FIELD   SCR_KEYGROUP, 1, 32, 34, FT_NUM, 0, 0, 0, 0, 0
FLD_VELOCITY_XFADE_KG:
        FIELD   SCR_VELOCITY_XFADE, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_SOFT_SAMPLE_KG:
        FIELD   SCR_SOFT_SAMPLE, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_LOUDNESS_06_KG:
        FIELD   SCR_LOUDNESS_06, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_LOUD_SAMPLE_KG:
        FIELD   SCR_LOUD_SAMPLE, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_LOUDNESS_08_KG:
        FIELD   SCR_LOUDNESS_08, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_MIDI_CHANNEL_KG:
        FIELD   SCR_MIDI_CHANNEL, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_OUTPUT_KG:
        FIELD   SCR_OUTPUT, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_ENV_KG:
        FIELD   SCR_ENV, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_VLCTY_KG:
        FIELD   SCR_VLCTY, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_WARP_KG:
        FIELD   SCR_WARP, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_LFO_KG:
        FIELD   SCR_LFO, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_KEY_FILTER_KG:
        FIELD   SCR_KEY_FILTER, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
FLD_LFO_DEPTH_KG:
        FIELD   SCR_LFO_DEPTH, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
        endif
        if      MODEL = 950
FLD_VCF_KG:
        FIELD   SCR_VCF, 41, 45, 47, FT_NUM, 0, L_566c, 1, 0, 2
        endif
        if      FW_VERSION >= 210
        FIELD   SCR_KEYGROUP, 16, 36, 37, FT_NUM, 0, L_566c, 1, 0, 1
FLD_KEYGROUP:
        FIELD   SCR_KEYGROUP, 1, 32, 34, FT_NUM, 0, 0, 1, 0, 0
FLD_VELOCITY_XFADE_KG:
        FIELD   SCR_VELOCITY_XFADE, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_SOFT_SAMPLE_KG:
        FIELD   SCR_SOFT_SAMPLE, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_LOUDNESS_06_KG:
        FIELD   SCR_LOUDNESS_06, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_LOUD_SAMPLE_KG:
        FIELD   SCR_LOUD_SAMPLE, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_LOUDNESS_08_KG:
        FIELD   SCR_LOUDNESS_08, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_MIDI_CHANNEL_KG:
        FIELD   SCR_MIDI_CHANNEL, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_OUTPUT_KG:
        FIELD   SCR_OUTPUT, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_ENV_KG:
        FIELD   SCR_ENV, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_VLCTY_KG:
        FIELD   SCR_VLCTY, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_WARP_KG:
        FIELD   SCR_WARP, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_LFO_KG:
        FIELD   SCR_LFO, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_KEY_FILTER_KG:
        FIELD   SCR_KEY_FILTER, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_LFO_DEPTH_KG:
        FIELD   SCR_LFO_DEPTH, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
FLD_VCF_KG:
        FIELD   SCR_VCF, 41, 45, 46, FT_NUM, 0, L_566c, 1, 0, 1
        endif
FLD_COPY:
        FIELD   SCR_KEYGROUP, 56, 77, 78, FT_KEYS, 0, keygroup_copy_delete, 0, KEYS_COPY, 3
KEYS_COPY:
        db      20h, 2bh, 2dh
FLD_SOFT_SAMPLE_LOW_KEY:
        if      MODEL = 950
        FIELD   SCR_SOFT_SAMPLE, 48, 62, 65, FT_NOTE, 0, L_5711, 0, 24, 127
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        FIELD   SCR_SOFT_SAMPLE, 21, 67, 70, FT_NOTE, 0, L_5711, 0, 24, 127
        db      01h
FLD_SOFT_SAMPLE_HIGH_KEY:
        FIELD   SCR_SOFT_SAMPLE, 30, 76, 79, FT_NOTE, 0, L_5711, 0, 24, 127
        db      00h
FLD_LOUD_SAMPLE_LOW_KEY:
        FIELD   SCR_LOUD_SAMPLE, 22, 68, 71, FT_NOTE, 0, L_5711, 0, 24, 127
        db      01h
FLD_LOUD_SAMPLE_HIGH_KEY:
        FIELD   SCR_LOUD_SAMPLE, 31, 77, 80, FT_NOTE, 0, L_5711, 0, 24, 127
        db      00h
FLD_SOFT_SAMPLE_SAMPLE:
        TEXTFIELD SCR_SOFT_SAMPLE, 11, 51, 61, FT_NAME, 'S', set_soft_sample_name
        else
        FIELD   SCR_SOFT_SAMPLE, 48, 62, 65, FT_NOTE, 0, L_5711, 24, 24, 127
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        db      01h
FLD_GET:
        FIELD   SCR_KEYGROUP, 48, 53, 54, FT_KEYS, 0, keygroup_get, 0, KEYS_GET, 1
KEYS_GET:
        db      0dh
FLD_SOFT_SAMPLE_HI_KEY:
        endif
        if      MODEL = 950
        FIELD   SCR_SOFT_SAMPLE, 65, 78, 81, FT_NOTE, 0, L_5711, 0, 24, 127
        db      00h
FLD_LOUD_SAMPLE_LOW_KEY:
        FIELD   SCR_LOUD_SAMPLE, 48, 62, 65, FT_NOTE, 0, L_5711, 0, 24, 127
        db      01h
FLD_LOUD_SAMPLE_HI_KEY:
        FIELD   SCR_LOUD_SAMPLE, 65, 78, 81, FT_NOTE, 0, L_5711, 0, 24, 127
        endif
        if      FW_VERSION >= 210
        FIELD   SCR_SOFT_SAMPLE, 65, 78, 81, FT_NOTE, 0, L_5711, 127, 24, 127
        db      00h
FLD_NO_LOUD_SAMPLE_VLCTY:
        FIELD   SCR_LOUD_SAMPLE, 80h+48, 62, 65, FT_NOTE, 0, L_5711, 24, 24, 127
        db      01h
FLD_VLCTY_THRSH:
        FIELD   SCR_LOUD_SAMPLE, 80h+65, 78, 81, FT_NOTE, 0, L_5711, 127, 24, 127
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        db      00h
FLD_SOFT_SAMPLE_1:
        TEXTFIELD SCR_SOFT_SAMPLE, 4, 18, 28, FT_NAME, 'S', set_soft_sample_name
        endif
FLD_LOUDNESS_06:
        FIELD   SCR_LOUDNESS_06, 6, 50, 53, FT_NUM+FT_SIGNED, 0, fn_5859, 0, -50, 50
        db      2dh
FLD_LOUDNESS_06_FILTER:
        if      FW_VERSION < 210
        FIELD   SCR_LOUDNESS_06, 16, 59, 61, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_LOUDNESS_06, 16, 59, 61, FT_NUM, 0, fn_5859, 99, 0, 99
        endif
        db      2ch
FLD_LOUDNESS_06_TRANSPOSE:
        FIELD   SCR_LOUDNESS_06, 24, 67, 70, FT_NUM+FT_SIGNED, 0, set_soft_sample_tuning, 0, -50, 50
FLD_AFTERTOUCH:
        FIELD   SCR_LFO_DEPTH, 16, 62, 64, FT_NUM, 0, fn_5859, 0, 0, 99
        db      15h
FLD_MOD_WHEEL:
        if      FW_VERSION < 210
        FIELD   SCR_LFO_DEPTH, 29, 74, 76, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_LFO_DEPTH, 29, 74, 76, FT_NUM, 0, fn_5859, 50, 0, 99
        endif
        db      16h
FLD_LOUDNESS_06_FINE:
        FIELD   SCR_LOUDNESS_06, 35, 76, 79, FT_NUM+FT_SIGNED, 0, set_soft_sample_tuning, 0, -99, 99
        if      MODEL = 950
        db      2dh, 56h, 08h, 3dh, 3fh, 04h, 00h
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        db      7dh, 4ch, 08h, 3dh, 3fh, 04h, 00h
        else
        dw      P_49F1+200h
        db      08h, 3dh, 3fh, 04h, 00h
        endif
        dw      br_5787+1
W_533F:
        db      00h, 00h, 00h, 00h, 0fh, 00h, 14h
FLD_MIDI_CHANNEL:
        FIELD   SCR_MIDI_CHANNEL, 1, 76, 78, FT_NUM, 0, 0, 0, 0, 15
        if      (FW_VERSION >= 210) || (MODEL = 950)
FLD_SOFT_SAMPLE_2:
        endif
        if      MODEL = 950
        FIELD   SCR_SOFT_SAMPLE, 0, 38, 41, FT_NOTE, 0, 0, 0, 0, 127
        endif
        if      FW_VERSION >= 210
        FIELD   SCR_SOFT_SAMPLE, 0, 38, 41, FT_NOTE, 0, 0, 60, 0, 127
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
FLD_LOUD_SAMPLE_1:
        FIELD   SCR_LOUD_SAMPLE, 0, 38, 41, FT_NOTE, 0, 0, 0, 0, 127
        endif
FLD_OUTPUT:
        FIELD   SCR_OUTPUT, 7, 78, 80, FT_NUM, 0, set_keygroup_output, 0, 0, 10
        db      13h
FLD_ONE_SHOT:
        if      MODEL = 950
        FIELD   SCR_KEY_FILTER, 31, 75, 76, FT_KEYS+FT_ONOFF, 0, set_one_shot, 0, KEYS_MIDI_PROG_POSITIONAL_CROSSFADE, 2
FLD_LOUD_SAMPLE_2:
        TEXTFIELD SCR_LOUD_SAMPLE, 4, 18, 28, FT_NAME, 'S', set_loud_sample_name
        else
        FIELD   SCR_KEY_FILTER, 31, 75, 76, FT_KEYS+FT_ONOFF, 0, set_one_shot, 0, KEYS_KEY_LOUDNESS_POSITIONAL_CROSSFADE, 2
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
FLD_LOUD_SAMPLE_SAMPLE:
        TEXTFIELD SCR_LOUD_SAMPLE, 11, 51, 61, FT_NAME, 'S', set_loud_sample_name
        endif
        if      FW_VERSION < 210
FLD_LOUDNESS_08:
        FIELD   SCR_LOUDNESS_08, 6, 50, 53, FT_NUM+FT_SIGNED, 0, fn_5859, 0, -50, 50
        else
FLD_LOUD_SAMPLE_2:
        TEXTFIELD SCR_LOUD_SAMPLE, 80h+4, 18, 28, FT_NAME, 'S', set_loud_sample_name
FLD_LOUDNESS_08:
        FIELD   SCR_LOUDNESS_08, 80h+6, 50, 53, FT_NUM+FT_SIGNED, 0, fn_5859, 0, -50, 50
        endif
        db      43h
FLD_LOUDNESS_08_FILTER:
        if      FW_VERSION < 210
        FIELD   SCR_LOUDNESS_08, 16, 59, 61, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_LOUDNESS_08, 80h+16, 59, 61, FT_NUM, 0, fn_5859, 99, 0, 99
        endif
        db      42h
        if      (FW_VERSION >= 210) || (MODEL = 950)
FLD_PUT:
        FIELD   SCR_KEYGROUP, 42, 47, 48, FT_KEYS, 0, keygroup_put, 0, KEYS_GET, 1
        endif
FLD_LOUDNESS_08_TRANSPOSE:
        if      FW_VERSION < 210
        FIELD   SCR_LOUDNESS_08, 24, 67, 70, FT_NUM+FT_SIGNED, 0, set_loud_sample_tuning, 0, -50, 50
FLD_LOUDNESS_08_FINE:
        FIELD   SCR_LOUDNESS_08, 35, 76, 79, FT_NUM+FT_SIGNED, 0, set_loud_sample_tuning, 0, -99, 99
FLD_VELOCITY_SWITCH_THRESHOLD:
        FIELD   SCR_VELOCITY_XFADE, 48, 76, 79, FT_NUM, 0, set_velocity_switch_threshold, 0, 0, 128
        db      02h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
FLD_VELOCITY_CROSSFADE:
        FIELD   SCR_VELOCITY_XFADE, 12, 34, 35, FT_KEYS+FT_ONOFF, 0, set_velocity_crossfade, 0, KEYS_KEY_LOUDNESS_POSITIONAL_CROSSFADE, 2
FLD_ENV_ATTACK:
        FIELD   SCR_ENV, 8, 52, 54, FT_NUM, 0, fn_5859, os_entry, 0, 99
        endif
        if      FW_VERSION >= 210
        FIELD   SCR_LOUDNESS_08, 80h+24, 67, 70, FT_NUM+FT_SIGNED, 0, set_loud_sample_tuning, 0, -50, 50
FLD_LOUDNESS_08_FINE:
        FIELD   SCR_LOUDNESS_08, 80h+35, 76, 79, FT_NUM+FT_SIGNED, 0, set_loud_sample_tuning, 0, -99, 99
FLD_VELOCITY_SWITCH_THRESHOLD:
        FIELD   SCR_VELOCITY_XFADE, 48, 76, 79, FT_NUM, 0, set_velocity_switch_threshold, 128, 0, 128
        db      02h
FLD_VEL_X_FADE:
        FIELD   SCR_VELOCITY_XFADE, 4, 17, 18, FT_KEYS+FT_ONOFF, 0, set_velocity_crossfade, 0, KEYS_KEY_LOUDNESS_POSITIONAL_CROSSFADE, 2
FLD_MIX_AT_VEL:
        FIELD   SCR_VELOCITY_XFADE, 20, 38, 41, FT_NUM, 0, fn_5859, os_entry, 0, 127
        db      26h
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
FLD_ENV_ATTACK:
        FIELD   SCR_ENV, 8, 52, 54, FT_NUM, 0, fn_5859, 0, 0, 99
        endif
        db      03h
FLD_DECAY:
        if      FW_VERSION < 210
        FIELD   SCR_ENV, 16, 59, 61, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_ENV, 16, 59, 61, FT_NUM, 0, fn_5859, 80, 0, 99
        endif
        db      04h
FLD_DESYNC:
        if      MODEL = 950
        FIELD   SCR_LFO, 32, 76, 77, FT_KEYS+FT_ONOFF, 0, set_lfo_desync, 0, KEYS_MIDI_PROG_POSITIONAL_CROSSFADE, 2
FLD_ATTK:
        FIELD   SCR_VCF, 8, 51, 53, FT_NUM, 0, fn_5859, 0, 0, 99
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        FIELD   SCR_LFO, 32, 76, 77, FT_KEYS+FT_ONOFF, 0, set_lfo_desync, 0, KEYS_KEY_LOUDNESS_POSITIONAL_CROSSFADE, 2
FLD_SUSTAIN:
        FIELD   SCR_ENV, 23, 67, 69, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_LFO, 32, 76, 77, FT_KEYS+FT_ONOFF, 0, set_lfo_desync, 0ffffh, KEYS_KEY_LOUDNESS_POSITIONAL_CROSSFADE, 2
FLD_ATTK:
        FIELD   SCR_VCF, 8, 51, 53, FT_NUM, 0, fn_5859, 20, 0, 99
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        db      22h
FLD_DCAY:
        endif
        if      MODEL = 950
        FIELD   SCR_VCF, 14, 57, 59, FT_NUM, 0, fn_5859, 0, 0, 99
        endif
        if      FW_VERSION >= 210
        FIELD   SCR_VCF, 14, 57, 59, FT_NUM, 0, fn_5859, 20, 0, 99
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        db      23h
FLD_SSTAIN:
        endif
        if      MODEL = 950
        FIELD   SCR_VCF, 20, 64, 66, FT_NUM, 0, fn_5859, 0, 0, 99
        endif
        if      FW_VERSION >= 210
        FIELD   SCR_VCF, 20, 64, 66, FT_NUM, 0, fn_5859, 20, 0, 99
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        db      24h
FLD_RLSE:
        endif
        if      MODEL = 950
        FIELD   SCR_VCF, 28, 71, 73, FT_NUM, 0, fn_5859, 0, 0, 99
        endif
        if      FW_VERSION >= 210
        FIELD   SCR_VCF, 28, 71, 73, FT_NUM, 0, fn_5859, 20, 0, 99
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        db      25h
FLD_AMNT:
        FIELD   SCR_VCF, 34, 76, 79, FT_NUM+FT_SIGNED, 0, fn_5859, 0, -50, 50
        db      17h
FLD_VLCTY_RELEASE:
        FIELD   SCR_VLCTY, 68, 78, 81, FT_NUM+FT_SIGNED, 0, fn_5859, 0, -50, 50
        db      0ah
FLD_OFF:
        endif
        if      MODEL = 950
        FIELD   SCR_VLCTY, 64, 66, 67, FT_KEYS+FT_ONOFF, 0, L_584b, 0, KEYS_MIDI_PROG_POSITIONAL_CROSSFADE, 2
FLD_SUSTAIN:
        FIELD   SCR_ENV, 23, 67, 69, FT_NUM, 0, fn_5859, 0, 0, 99
        endif
        if      FW_VERSION >= 210
        FIELD   SCR_VLCTY, 64, 66, 67, FT_KEYS+FT_ONOFF, 0, L_584b, 0, KEYS_KEY_LOUDNESS_POSITIONAL_CROSSFADE, 2
FLD_SUSTAIN:
        FIELD   SCR_ENV, 23, 67, 69, FT_NUM, 0, fn_5859, 99, 0, 99
        endif
        db      05h
FLD_ENV_RELEASE:
        if      FW_VERSION < 210
        FIELD   SCR_ENV, 32, 76, 78, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_ENV, 32, 76, 78, FT_NUM, 0, fn_5859, 30, 0, 99
        endif
        db      06h
FLD_VLCTY_ATTACK:
        FIELD   SCR_VLCTY, 27, 36, 38, FT_NUM, 0, fn_5859, 0, 0, 99
        db      09h
        if      (MODEL = 900) && (FW_VERSION < 210)
FLD_VLCTY_RELEASE:
        FIELD   SCR_VLCTY, 67, 77, 80, FT_NUM+FT_SIGNED, 0, fn_5859, 0, -50, 50
        db      0ah
        endif
FLD_VLCTY_LOUDNESS:
        if      FW_VERSION < 210
        FIELD   SCR_VLCTY, 13, 24, 26, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_VLCTY, 13, 24, 26, FT_NUM, 0, fn_5859, 30, 0, 99
        endif
        db      0bh
FLD_VLCTY_FILTER:
        if      FW_VERSION < 210
        FIELD   SCR_VLCTY, 53, 62, 64, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_VLCTY, 53, 62, 64, FT_NUM, 0, fn_5859, 10, 0, 99
        endif
        db      07h
FLD_KEY_FILTER:
        if      FW_VERSION < 210
        FIELD   SCR_KEY_FILTER, 6, 52, 54, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_KEY_FILTER, 6, 52, 54, FT_NUM, 0, fn_5859, 50, 0, 99
        endif
        db      08h
FLD_WARP_VELOCITY:
        FIELD   SCR_WARP, 12, 23, 25, FT_NUM, 0, fn_5859, 0, 0, 99
        db      0ch
FLD_ATTACK_OFFSET:
        FIELD   SCR_WARP, 52, 68, 71, FT_NUM+FT_SIGNED, 0, fn_5859, 0, -50, 50
        db      0dh
FLD_WARP_TIME:
        if      FW_VERSION < 210
        FIELD   SCR_WARP, 31, 38, 40, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_WARP, 31, 38, 40, FT_NUM, 0, fn_5859, 99, 0, 99
        endif
        db      0eh
FLD_DELAY:
        if      FW_VERSION < 210
        FIELD   SCR_LFO, 25, 68, 70, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_LFO, 25, 68, 70, FT_NUM, 0, fn_5859, 64, 0, 99
        endif
        db      0fh
FLD_RATE:
        if      FW_VERSION < 210
        FIELD   SCR_LFO, 19, 62, 64, FT_NUM, 0, fn_5859, 0, 0, 99
        else
        FIELD   SCR_LFO, 19, 62, 64, FT_NUM, 0, fn_5859, 42, 0, 99
        endif
        db      10h
FLD_DEPTH:
        FIELD   SCR_LFO, 12, 55, 57, FT_NUM, 0, fn_5859, 0, 0, 99
        db      11h
FLD_CONST_PITCH:
        if      MODEL = 950
        FIELD   SCR_KEY_FILTER, 18, 64, 65, FT_KEYS+FT_ONOFF, 0, set_const_pitch, 0, KEYS_MIDI_PROG_POSITIONAL_CROSSFADE, 2
        else
        FIELD   SCR_KEY_FILTER, 18, 64, 65, FT_KEYS+FT_ONOFF, 0, set_const_pitch, 0, KEYS_KEY_LOUDNESS_POSITIONAL_CROSSFADE, 2
        endif
        db      0c3h

select_program:
        call    keygroup_field
        repe cmpsb
        jne     br_558d
        ret
br_558d:
        call    keygroup_field
        mov     di, P_4787
        repe cmpsb
        je      br_5609
        call    keygroup_field
        mov     dx, si
        call    find_program
        jb      br_55aa
loop_55a1:
        mov     word ptr [CUR_PROGRAM], ax
        call    fn_588a
loop_55a7:
        jmp     br_5684
br_55aa:
        mov     si, SLOT_TAGS
        mov     cx, SLOT_COUNT
        xor     ax, ax
loop_55b2:
        lodsb
        and     al, al
        jne     br_55b9
        inc     ah
br_55b9:
        loop    loop_55b2
        mov     al, byte ptr [B_4782]
        add     al, 2
        cmp     ah, al
        jb      loop_55a7
        if      FW_VERSION < 210
        mov     bp, FLD_SELECT_COPY_PROGRAM
        call    keygroup_field
        else
        mov     bp, P_514B
        call    keygroup_field

L_55ca:
        endif
        call    find_free_slot
        mov     byte ptr [bp], 50h
        mov     di, bx
        push    bx
        rep movsb
        mov     si, word ptr [CUR_PROGRAM]
        add     si, 0ah
        mov     cx, 1ch
        rep movsb
        mov     si, word ptr [CUR_PROGRAM]
        mov     si, word ptr [si+12h]
        lea     di, [bx+12h]
loop_55ec:
        call    find_free_slot
        mov     byte ptr [bp], 4bh
        mov     word ptr [di], bx
        mov     di, bx
        mov     cx, 46h
        rep movsb
        mov     si, word ptr [bx+44h]
        lea     di, [bx+44h]
        and     si, si
        jne     loop_55ec
        pop     ax
loop_5607:
        jmp     loop_55a1
br_5609:
        call    program_sample_tag_scan
        cmp     al, 1
        je      loop_55a7
        mov     dx, word ptr [CUR_PROGRAM]
        call    find_program
        call    fn_218d
        mov     si, SLOT_TAGS
        mov     ax, SLOTS
loop_5620:
        cmp     byte ptr [si], 50h
        je      loop_5607
        add     ax, 46h
        inc     si
        jmp     loop_5620

rename_program:
        call    keygroup_field
        cmp     byte ptr [si], 2dh
        je      br_5609
        mov     di, P_4787
        repe cmpsb
        je      br_5609
        call    keygroup_field
        push    cx
        push    di
        push    si
        mov     dx, si
        call    find_program
        pop     si
        pop     di
        pop     cx
        jae     br_5658
        push    si
        rep movsb
        if      FW_VERSION < 210
        mov     bp, FLD_SELECT_COPY_PROGRAM
        else
        mov     bp, P_514B
        endif
        call    keygroup_field
        pop     di
        xchg    si, di
        rep movsb
br_5658:
        jmp     br_5687

L_565a:
        nop
L_565b:
        call    keygroup_field
        if      MODEL = 950
        dec     ax
        mov     byte ptr [di+1ah], al
        mov     byte ptr [di+1bh], 0ffh
        ret

L_6028_s950:
        call    keygroup_field
        else
        mov     al, byte ptr [bp+9]
        endif
        mov     byte ptr [di+15h], al
        ret

set_key_loudness:
        call    keygroup_field
        mov     word ptr [di+10h], ax
        ret

L_566c:
        call    keygroup_field
        mov     word ptr [FLD_SELECT+9], ax
        and     ax, ax
        je      loop_5679
        mov     byte ptr [W_4783], al
loop_5679:
        call    word ptr [IDLE_HOOK]
        cmp     byte ptr [KEY_MATRIX_LAST], 0ffh
        jne     loop_5679
br_5684:
        call    program_fill
br_5687:
        jmp     lcd_redraw

keygroup_copy_delete:
        call    keygroup_field
        mov     al, 20h
        xchg    byte ptr [si], al
        cmp     al, 20h
        je      br_5687
        cmp     al, 2bh
        je      br_56c3
        cmp     byte ptr [B_4782], 0
        je      br_5687
        lea     si, [di+12h]
loop_56a3:
        mov     di, word ptr [si]
        cmp     di, bx
        je      br_56ae
        lea     si, [di+44h]
        jmp     loop_56a3
br_56ae:
        mov     ax, word ptr [bx+44h]
        mov     word ptr [si], ax
        xchg    dx, bx
        call    fn_29f9
        mov     ax, 1
        mov     word ptr [FLD_SELECT+9], ax
        mov     byte ptr [W_4783], al
        jmp     loop_5679
br_56c3:
        if      MODEL = 950
        cmp     byte ptr [B_4782], 62h
        jae     loop_5679
        endif
        mov     ax, word ptr [FLD_SELECT+13]
        inc     ax
        mov     word ptr [FLD_SELECT+9], ax
        test    word ptr [bx+44h], 0ffffh
        je      br_56d6
        mov     bx, word ptr [bx+44h]
        jmp     br_56c3
br_56d6:
        push    bx
        call    find_free_slot
        pop     di
        jb      loop_5679
        mov     word ptr [di+44h], bx
        mov     byte ptr [bp], 4bh
        mov     si, word ptr [CUR_KEYGROUP]
        mov     di, bx
        mov     cx, 46h
        rep movsb
        mov     word ptr [bx+44h], 0
        inc     byte ptr [W_4783]
        jmp     loop_5679
        if      (FW_VERSION >= 210) || (MODEL = 950)

keygroup_get:                                 ; a field handler; calls into what v4.0 zeroed
        call    sample_field_enter
        jne     br_5700
        ret
br_5700:
        mov     bx, word ptr [CUR_KEYGROUP]
        mov     word ptr [CUR_KEYGROUP], P_7C8C
        call    br_56c3
        jmp     program_sample_name_xref_resolve
        endif

L_5711:
        call    fn_5859
        jmp     program_fill

set_soft_sample_name:
        call    keygroup_field
        mov     dx, 18h
loop_571d:
        mov     di, bx
        add     di, dx
        pusha
        rep movsb
        popa
        cmp     byte ptr [ENTER_KEY], ch
        je      br_574b
        mov     byte ptr [ENTER_KEY], ch
        cmp     byte ptr [FLD_SELECT+9], ch
        jne     br_574b
        mov     bx, word ptr [CUR_PROGRAM]
        mov     bx, word ptr [bx+12h]
loop_573c:
        mov     di, bx
        add     di, dx
        pusha
        rep movsb
        popa
        mov     bx, word ptr [bx+44h]
        and     bx, bx
        jne     loop_573c
br_574b:
        if      (MODEL = 900) && (FW_VERSION < 210)
        jmp     program_sample_name_xref_resolve
        else
        call    program_sample_name_xref_resolve
        jmp     br_5684
        endif

set_soft_sample_tuning:
        mov     ax, word ptr [FLD_LOUDNESS_06_TRANSPOSE+9]
        mov     cl, 4
        shl     ax, cl
        add     ax, word ptr [FLD_LOUDNESS_06_FINE+9]
        mov     di, 2ah

loop_575f:
        mov     bx, word ptr [CUR_KEYGROUP]
        cmp     byte ptr [ENTER_KEY], 0
        jne     br_576e
        cmp     ax, word ptr [bx+di]
        je      br_5787
br_576e:
        mov     word ptr [bx+di], ax
        cmp     word ptr [FLD_SELECT+9], 0
        jne     br_5787
        mov     bx, word ptr [CUR_PROGRAM]
        mov     bx, word ptr [bx+12h]
loop_577e:
        mov     word ptr [bx+di], ax
        mov     bx, word ptr [bx+44h]
        and     bx, bx
        jne     loop_577e
br_5787:
        ret
        if      MODEL = 950
        db      0e8h, 0c9h, 00h
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        db      0e8h, 0b6h, 00h
        else
        db      0e8h, 0ceh, 00h
        endif

fn_578b:
        mov     di, P_4C3C
        mov     word ptr [di+2], 2020h
        mov     cx, 4
        mov     si, P_57B9
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     al, byte ptr [MIDI_BASIC_CHANNEL]
        cbw
        inc     ax
        jns     br_57a4
loop_57a0:
        rep movsb
        jmp     br_57b6
br_57a4:
        add     ax, word ptr [W_533F]
        cmp     ax, 11h
        mov     si, P_57BD
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        jae     loop_57a0
        mov     bp, FLD_MIDI_CHANNEL
        call    put_field_value
br_57b6:
        jmp     br_5687

P_57B9:
        db      "ALL "
P_57BD:
        db      "NONE"
set_keygroup_output:
        call    keygroup_field
        dec     ax
        mov     di, 13h
        jmp     br_5861
        if      (MODEL = 900) && (FW_VERSION < 210)

L_56bd_v12a:
        nop
        endif

set_one_shot:
        call    keygroup_field
        mov     dl, 8
        jmp     br_5805

L_57d2:
        nop
set_loud_sample_name:
        call    keygroup_field
        mov     dx, 2eh
        jmp     loop_571d
        if      (FW_VERSION >= 210) || (MODEL = 950)

keygroup_put:                                 ; unreached in v4.0; v2.1's table entry
        call    sample_field_enter
        jne     br_57e2
        ret
br_57e2:
        mov     si, word ptr [CUR_KEYGROUP]
        mov     di, P_7C8C
        mov     cx, 46h
        rep movsb
        ret
        endif

set_loud_sample_tuning:
        mov     ax, word ptr [FLD_LOUDNESS_08_TRANSPOSE+9]
        mov     cl, 4
        shl     ax, cl
        add     ax, word ptr [FLD_LOUDNESS_08_FINE+9]
        mov     di, 40h
        jmp     loop_575f
        if      MODEL = 900

set_velocity_crossfade:                             ; unreached in v4.0 and v2.1; the ROM's field handler
        call    keygroup_field
        mov     dl, 2
        endif
br_5805:
        mov     di, 12h
        mov     dh, dl
        not     dh
        mov     ah, byte ptr [bp+9]
        and     ah, dl
        cmp     byte ptr [ENTER_KEY], 0
        jne     br_5820
        mov     al, byte ptr [bx+di]
        and     al, dl
        cmp     al, ah
        je      br_583d
br_5820:
        and     byte ptr [bx+di], dh
        or      byte ptr [bx+di], ah
        cmp     word ptr [FLD_SELECT+9], 0
        jne     br_5889
        mov     bx, word ptr [CUR_PROGRAM]
        mov     bx, word ptr [bx+12h]
loop_5832:
        and     byte ptr [bx+di], dh
        or      byte ptr [bx+di], ah
        mov     bx, word ptr [bx+44h]
        and     bx, bx
        jne     loop_5832
br_583d:
        ret

set_velocity_switch_threshold:
        call    fn_5859
        jmp     br_5684

set_lfo_desync:
        call    keygroup_field
        mov     dl, 4
        if      (FW_VERSION >= 210) || (MODEL = 950)
        jmp     br_5805

L_584b:
        call    keygroup_field
        mov     dl, 10h
        endif
        jmp     br_5805

set_const_pitch:
        call    keygroup_field
        mov     dl, 1
        jmp     br_5805

fn_5859:
        mov     al, byte ptr [bp+0fh]
        cbw
        xchg    di, ax
        mov     ax, word ptr [bp+9]
br_5861:
        mov     bx, word ptr [CUR_KEYGROUP]
        cmp     byte ptr [ENTER_KEY], 0
        jne     br_5870
        cmp     al, byte ptr [bx+di]
        je      br_5889
br_5870:
        mov     byte ptr [bx+di], al
        cmp     word ptr [FLD_SELECT+9], 0
        jne     br_5889
        mov     bx, word ptr [CUR_PROGRAM]
        mov     bx, word ptr [bx+12h]
loop_5880:
        mov     byte ptr [bx+di], al
        mov     bx, word ptr [bx+44h]
        and     bx, bx
        jne     loop_5880
br_5889:
        ret

fn_588a:
        pushf
        cli
        call    voice_reset_all
        call    thk_program_sample_tag_scan
        call    fn_66aa
        popf
        ret
        db      8ah, 46h, 09h, 89h, 07h, 0c3h

keygroup_field:
        call    field_text
        mov     si, di
        mov     ax, word ptr [bp+9]
        mov     di, word ptr [CUR_PROGRAM]
        mov     bx, word ptr [CUR_KEYGROUP]
        ret
        if      MODEL = 950
SAMPLE_LAST_FIELD:
        dw      FLD_REPLAY_MODE_ONE_SHOT
        db      00h, 00h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      00h
        endif
        if      FW_VERSION < 210
W_5A04_OS21:
        db      20h, 00h
        endif
        if      MODEL = 950
W_5A06_OS21:
        db      00h, 00h
W_5A08_OS21:
        db      01h, 00h
W_5A0A_OS21:
        db      00h, 00h
        endif
        if      FW_VERSION < 210
W_5A0C_OS21:
        dw      fn_61ba_os21
W_5A0E_OS21:
        db      0d0h, 07h
        endif
        if      MODEL = 950
W_5A10_OS21:
        db      00h, 00h, 00h, 00h
W_5A14_OS21:
        db      00h, 00h
        endif
        if      FW_VERSION = 210
SAMPLE_LAST_FIELD:
        dw      FLD_REPLAY_MODE_ONE_SHOT
        endif
        if      FW_VERSION < 400
SCR_SELECT_COPY_SAMPLE:
        db      "*01      *Select, Copy      "
W_4E76_OS21:
        db      "0123456789  "
        db      "  SAMPLE *Rename, delete(-) "
P_4E9E_OS21:
        db      "0123456789  "
SCR_SELECT_PROGRAM:
        db      "*02  *Select program Monitor            "
        db      "                                        "
SCR_LOUDNESS_03:
        db      "*03 *Loudness  *Nom pitch  *Fine pitch  "
        db      "       +00       C3# 61        +00      "
SCR_REPLAY_MODE:
        db      "*04   *REPLAY MODE One shot(1),         "
        db      "      Looping(2), Alternating(3) _      "
SCR_TIME_DIRECTION:
        db      "*05   *TIME DIRECTION                   "
        db      "      Normal(1), Reverse(2) _           "
SCR_START_POINT:
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      "*06  START POINT   *Coarse *Fine        "
        db      "    (0 -  CCC,DDD)     000,000          "
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        db      "*06  START POINT   *Coarse *Fine  *AUTO "
        endif
        if      MODEL = 950
        db      "     (0 -  cCCC,DDD)  x000,000      01  "
        endif
        if      FW_VERSION = 210
        db      "    (0 -  CCC,DDD)     000,000      01  "
        endif
        if      FW_VERSION < 400
SCR_END_POINT:
        db      "*07  END POINT     *Coarse *Fine        "
        endif
        if      MODEL = 950
        db      "(aAAA,BBB- cCCC,DDD)  x000,000          "
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      " (AAA,BBB-CCC,DDD)     000,000          "
        endif
        if      FW_VERSION < 400
SCR_LOOP_LENGTH:
        db      "*08  LOOP LENGTH   *Coarse *Fine  *AUTO "
        endif
        if      MODEL = 950
        db      "     (5 -  cCCC,DDD)  x000,000    (ENT)_"
SCR_CROSSFADE_LOOP:
        db      "*09  CROSSFADE LOOP.  *Name NEW SAMPLE  "
        db      " *X-fade length 32000 *Execute_ Mem 100%"
SCR_RESAMPLE:
        db      "*10  *Resample at half bandwidth (ENT)_ "
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      "    (5 -  CCC,DDD)     000,000    (ENT)_"
SCR_RESAMPLE:
        db      "*09  *Resample at half bandwidth (ENT)_ "
        endif
        if      FW_VERSION < 400
        db      " *Discard before start, after end (ENT)_"
SCR_SPLICE:
        endif
        if      MODEL = 950
        db      "*11 SPLICE  *2nd sample name "
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      "*10 SPLICE  *2nd sample name "
        endif
        if      FW_VERSION < 400
P_5147_OS21:
        db      "SAMPLE 2   "
        db      "    X-FADE  *New sample name "
P_516F_OS21:
        db      "NEW SAMPLE "
SCR_SPLICE_XFADE:
        endif
        if      MODEL = 950
        db      "*12 *Splice crossfade time, (points)    "
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      "*11 *Splice crossfade time, (points)    "
        endif
        if      FW_VERSION < 400
        db      "          (0- EEEEE)  00000             "
SCR_SPLICE_ORDER:
        endif
        if      MODEL = 950
        db      "*13 *SPLICE ORDER: 1st then 2nd(1),     "
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      "*12 *SPLICE ORDER: 1st then 2nd(1),     "
        endif
        if      FW_VERSION < 400
        db      " 2nd then 1st(2), Together(3)_. Mem 100%"
        endif
        if      FW_VERSION = 210
SCR_CROSSFADE_LOOP:
        db      "*13  CROSSFADE LOOP.  *Name NEW SAMPLE  "
        db      " *X-fade length 32000 *Execute_ Mem 100%"
SCR_VX_TIME_SKEW:
        db      "*14  VX-TIME SKEW. *Name "
P_5283_OS21:
        db      "NEW SAMPLE  Mem"
        db      "*Time  5000  *Delay soft/loud(1/2)_ 100%"
SCR_CREATE_VX:
        db      "*15 *Loud LOUD SAMPL  *New NEW SAMPLE  M"
        db      "    *Soft SOFT SAMPL  *Create VX _  100%"
        endif
        if      FW_VERSION < 400

mode_edit_sample:
        mov     word ptr [MODE_SP], sp
        mov     word ptr [FIELD_RECENT], FLD_SELECT_COPY_SAMPLE
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     word ptr [LAST_FIELD_PTR], FLD_REPLAY_MODE_ONE_SHOT
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     word ptr [LAST_FIELD_PTR], SAMPLE_LAST_FIELD
        mov     ax, word ptr [SAMPLE_LAST_FIELD]
        mov     word ptr [FIELD_PREVIOUS], ax
        endif
        if      FW_VERSION = 210

L_5320_os21:
        endif
        if      FW_VERSION < 400
        call    fn_1e0f
        mov     word ptr [MODE_FILL], sample_fill
        endif
        if      FW_VERSION < 210

L_5b67_v12a:
        endif
        if      FW_VERSION < 400
        call    sample_fill
        mov     word ptr [LCD_SCROLL_MAX], 0ffh
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     ax, P_0A5C
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     ax, FIELDS_SELECT_COPY_SAMPLE
        endif
        if      FW_VERSION < 400
        jmp     menu_navigation_loop

sample_field:
        call    field_text
        xchg    di, si
        mov     bx, word ptr [CUR_SAMPLE]
        mov     al, byte ptr [si]
        cmp     al, 20h
        ret

sample_fill:
        call    program_sample_tag_scan
        and     ah, ah
        jne     br_5372_os21
        mov     si, MSG_NO_SAMPLES_PRESENT
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        mov     dx, 1
        call    lcd_print
loop_5356_os21:
        call    word ptr [IDLE_HOOK]
        jmp     loop_5356_os21
MSG_NO_SAMPLES_PRESENT:
        db      "No samples present. "
        db      0bbh, 0feh
br_5372_os21:
        mov     bp, FLD_SELECT_COPY_SAMPLE
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        call    field_text
        mov     dx, di
        call    find_sample
        jae     br_5399_os21
        mov     bx, SLOT_TAGS
        mov     si, SLOTS
loop_5385_os21:
        cmp     byte ptr [bx], 53h
        je      br_5390_os21
        inc     bx
        add     si, 46h
        jmp     loop_5385_os21
br_5390_os21:
        mov     bx, si
        mov     cx, 5
        mov     di, dx
        rep movsw
br_5399_os21:
        mov     al, 63h
        xchg    byte ptr [W_9582], al
        push    ax
        mov     bp, FLD_SELECT_COPY_SAMPLE
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        call    fn_1cc6
        mov     bp, FLD_SELECT_PROGRAM_MONITOR
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        call    fn_54b9_os21
        mov     word ptr [CUR_SAMPLE], bx
        call    fn_1c82
        call    program_sample_name_xref_resolve
        mov     bp, FLD_SELECT_COPY_SAMPLE_RENAME_DELETE
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    fn_1cc6
        endif
        if      FW_VERSION < 400
        mov     si, bx
        call    put_field_text
        endif
        if      MODEL = 950
        call    fn_1cc6
        endif
        if      FW_VERSION < 400
        mov     ax, word ptr [bx+18h]
        mov     bp, FLD_LOUDNESS_03
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        call    put_field_value
        mov     ax, word ptr [bx+16h]
        mov     cl, 4
        add     ax, 8
        shr     ax, cl
        mov     bp, FLD_NOM_PITCH
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        call    put_field_byte
        mov     ax, word ptr [bx+16h]
        and     ax, 0fh
        test    ax, 8
        je      br_53e8_os21
        or      ax, 0fff0h
br_53e8_os21:
        mov     bp, FLD_FINE_PITCH
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        call    put_field_byte
        mov     al, byte ptr [bx+1ah]
        mov     di, P_56EC_OS21
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        mov     cx, 3
        repne scasb
        mov     ax, 33h
        sub     ax, cx
        mov     bp, FLD_REPLAY_MODE_ONE_SHOT
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        call    field_text
        stosb
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        call    br_54dc_os21
        mov     bp, FLD_LOOP_LENGTH_AUTO
        nop
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    fn_54d4_os21
        mov     bp, FLD_LOOP_LENGTH_AUTO
        endif
        if      FW_VERSION < 400
        call    fn_5460_os21
        mov     al, byte ptr [bx+2bh]
        mov     di, P_577D_OS21
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        mov     cx, 2
        repne scasb
        mov     ax, 32h
        sub     ax, cx
        mov     bp, FLD_TIME_DIRECTION
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        call    field_text
        stosb
        mov     bp, FLD_DISCARD_BEFORE_START_AFTER
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        call    fn_5460_os21
        mov     bp, FLD_RESAMPLE_AT_HALF_BANDWIDTH
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    fn_5460_os21
        endif
        if      FW_VERSION = 210
        mov     bp, FLD_DELAY_SOFT_LOUD
        call    fn_5460_os21
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     bp, FLD_EXECUTE
        endif
        if      FW_VERSION < 400
        call    fn_5460_os21
        mov     bp, FLD_2ND_SAMPLE_NAME
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        call    fn_1cc6
        mov     bp, FLD_NEW_SAMPLE_NAME
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION = 210
        call    fn_1cc6
        mov     bp, FLD_VX_TIME_SKEW_NAME
        endif
        if      FW_VERSION < 400
        call    fn_1cc6
        call    fn_590d_os21
        call    fn_5467_os21
        mov     bp, FLD_SPLICE_ORDER_1
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        call    fn_5460_os21
        pop     ax
        mov     byte ptr [W_9582], al
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        ret
        endif
        if      FW_VERSION < 400

fn_5460_os21:
        call    field_text
        mov     byte ptr [di], 20h
        ret

fn_5467_os21:
        mov     al, 63h
        xchg    byte ptr [W_9582], al
        push    ax
        push    bx
        mov     bx, word ptr [CUR_SAMPLE]
        mov     bp, FLD_SPLICE_CROSSFADE_TIME
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        mov     ax, word ptr [bp+9]
        call    put_field_value
        call    fn_663e_os21
        push    ax
        push    dx
        mov     dx, P_5147_OS21
        call    find_sample
        mov     ax, 0
        cwd
        jb      br_5490_os21
        call    fn_663e_os21
br_5490_os21:
        pop     di
        pop     si
        call    min_max32
        mov     ax, 7d00h
        cwd
        call    min_max32
        xchg    si, ax
        mov     dx, 373ch
        mov     bp, FLD_SPLICE_CROSSFADE_TIME
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        mov     di, word ptr [bp]
        dec     di
        call    put_number
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     bp, FLD_X_FADE_LENGTH
        mov     ax, word ptr [bp+9]
        call    put_field_value
        endif
        if      FW_VERSION < 400
        pop     bx
        pop     ax
        mov     byte ptr [W_9582], al
        ret

fn_54b9_os21:
        pusha
        call    field_text
        mov     si, P_7C5A
        repe cmpsb
        mov     si, P_A03E
        je      br_54cb_os21
        mov     si, word ptr [CUR_PROGRAM]
br_54cb_os21:
        mov     word ptr [CUR_PROGRAM], si
        call    put_field_text
        popa
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        ret

fn_54d4_os21:
        cmp     word ptr [W_5A0A_OS21], 0
        je      br_54dc_os21
        endif
        if      FW_VERSION < 400
        ret
br_54dc_os21:
        mov     al, 63h
        xchg    byte ptr [W_9582], al
        push    ax
        push    bx
        mov     ax, word ptr [bx+20h]
        mov     dx, word ptr [bx+22h]
        push    ax
        push    dx
        mov     cx, 3e8h
        div     cx
        mov     word ptr [FLD_START_POINT_FINE+9], dx
        mov     word ptr [FLD_START_POINT_COARSE+9], ax
        mov     ax, word ptr [bx+1ch]
        mov     dx, word ptr [bx+1eh]
        push    ax
        push    dx
        mov     si, ax
        mov     di, dx
        div     cx
        mov     word ptr [FLD_END_POINT_FINE+9], dx
        mov     word ptr [FLD_END_POINT_COARSE+9], ax
        mov     word ptr [FLD_LOOP_LENGTH_FINE+13], dx
        mov     word ptr [FLD_LOOP_LENGTH_COARSE+13], ax
        mov     word ptr [FLD_LOOP_LENGTH_FINE+11], 5
        mov     word ptr [FLD_LOOP_LENGTH_COARSE+11], 0
        pop     dx
        pop     ax
        sub     ax, 64h
        sbb     dx, 0
        div     cx
        mov     word ptr [FLD_START_POINT_FINE+13], dx
        mov     word ptr [FLD_START_POINT_COARSE+13], ax
        mov     ax, word ptr [bx+24h]
        mov     dx, word ptr [bx+26h]
        cmp     ax, si
        sbb     dx, di
        mov     dx, word ptr [bx+26h]
        jb      br_5543_os21
        xchg    si, ax
        xchg    dx, di
br_5543_os21:
        mov     word ptr [bx+24h], ax
        mov     word ptr [bx+26h], dx
        div     cx
        mov     word ptr [FLD_LOOP_LENGTH_FINE+9], dx
        mov     word ptr [FLD_LOOP_LENGTH_COARSE+9], ax
        pop     dx
        pop     ax
        add     ax, 64h
        adc     dx, 0
        div     cx
        mov     word ptr [FLD_END_POINT_FINE+11], dx
        mov     word ptr [FLD_END_POINT_COARSE+11], ax
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        cmp     byte ptr [bx+2ah], 0
        je      br_5573_os21
        shr     dx, 1
        rcr     ax, 1
br_5573_os21:
        endif
        if      FW_VERSION < 400
        div     cx
        mov     word ptr [FLD_END_POINT_FINE+13], dx
        mov     word ptr [FLD_END_POINT_COARSE+13], ax
        mov     si, P_5654_OS21
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        mov     cx, 6
loop_5582_os21:
        lodsw
        and     ax, 7fffh
        xchg    bp, ax
        push    cx
        mov     ax, word ptr [bp+9]
        call    put_field_value
        pop     cx
        loop    loop_5582_os21
        mov     si, P_55F0_OS21
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        mov     cx, 8
loop_5597_os21:
        lodsw
        xchg    bp, ax
        lodsw
        xchg    dx, ax
        mov     di, word ptr [bp]
        dec     di
        mov     ax, word ptr [bp+0bh]
        cmp     cx, 3
        jb      br_55aa_os21
        mov     ax, word ptr [bp+0dh]
br_55aa_os21:
        push    cx
        call    put_number
        pop     cx
        loop    loop_5597_os21
        mov     cx, 3
        mov     si, P_5654_OS21
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
loop_55b7_os21:
        lodsw
        and     ax, 7fffh
        xchg    bp, ax
        lodsw
        xchg    bx, ax
        mov     dx, word ptr [bx+9]
        mov     ax, word ptr [bp+9]
        cmp     ax, word ptr [bp+0bh]
        je      br_55d6_os21
        cmp     dx, word ptr [bx+0bh]
        jae     br_55d1_os21
        inc     word ptr [bp+0bh]
br_55d1_os21:
        mov     word ptr [bx+0bh], 0
br_55d6_os21:
        cmp     ax, word ptr [bp+0dh]
        je      br_55e8_os21
        cmp     word ptr [bx+0dh], dx
        jae     br_55e3_os21
        dec     word ptr [bp+0dh]
br_55e3_os21:
        mov     word ptr [bx+0dh], 3e7h
br_55e8_os21:
        loop    loop_55b7_os21
        pop     bx
        pop     ax
        mov     byte ptr [W_9582], al
        ret
P_55F0_OS21:
        dw      P_56EC_OS21+3
        endif
        if      MODEL = 950
        db      38h, 34h
        dw      FLD_START_POINT_COARSE+13+2
        db      3ch, 39h
        dw      FLD_START_POINT_FINE+13+13h
        db      38h, 34h
        dw      FLD_END_POINT_COARSE+13+2
        db      3ch, 39h
        dw      FLD_END_POINT_FINE+13+4
        db      38h, 34h
        dw      FLD_LOOP_LENGTH_COARSE+14+1
        db      3ch, 39h
        dw      FLD_START_POINT_FINE+13+13h
        db      2eh, 2ah
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        db      36h, 33h
        dw      FLD_START_POINT_COARSE+13+2
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      3ah, 37h, 0edh, 5eh, 36h, 33h
        endif
        if      FW_VERSION = 210
        db      3ah, 37h
        dw      FLD_START_POINT_FINE+13+13h
        db      36h, 33h
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        dw      FLD_END_POINT_COARSE+13+2
        db      3ah, 37h
        dw      FLD_END_POINT_FINE+13+4
        db      36h, 33h
        dw      FLD_LOOP_LENGTH_COARSE+14+1
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      3ah, 37h, 0edh, 5eh, 2eh, 2bh
        endif
        if      FW_VERSION = 210
        db      3ah, 37h
        dw      FLD_START_POINT_FINE+13+13h
        db      2eh, 2bh
        endif
        if      FW_VERSION < 400
        dw      FLD_END_POINT_COARSE+13+2
        db      32h, 2fh, 00h, 00h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
P_0A5C:
        dw      8000h+FLD_SELECT_COPY_SAMPLE
        dw      FLD_SELECT_COPY_SAMPLE_RENAME_DELETE
        dw      8000h+FLD_DISCARD_BEFORE_START_AFTER+1eh
        dw      8000h+FLD_LOUDNESS_03
        dw      FLD_NOM_PITCH
        dw      FLD_FINE_PITCH
        dw      8000h+FLD_FINE_PITCH+9+6
        dw      8000h+FLD_TIME_DIRECTION
P_5654_OS21:
        dw      8000h+P_56EC_OS21+3
        dw      FLD_START_POINT_COARSE+13+2
        db      0edh, 0deh
        dw      FLD_END_POINT_COARSE+13+2
        db      0dh, 0dfh
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
FIELDS_SELECT_COPY_SAMPLE:
        dw      8000h+FLD_SELECT_COPY_SAMPLE, FLD_SELECT_COPY_SAMPLE_RENAME_DELETE, 8000h+FLD_SELECT_PROGRAM_MONITOR, 8000h+FLD_LOUDNESS_03
        dw      FLD_NOM_PITCH, FLD_FINE_PITCH, 8000h+FLD_REPLAY_MODE_ONE_SHOT, 8000h+FLD_TIME_DIRECTION
        dw      8000h+FLD_START_POINT_COARSE, FLD_START_POINT_FINE, FLD_START_POINT_AUTO, 8000h+FLD_END_POINT_COARSE
        dw      FLD_END_POINT_FINE, 8000h+FLD_LOOP_LENGTH_COARSE, FLD_LOOP_LENGTH_FINE, FLD_LOOP_LENGTH_AUTO
        endif
        if      MODEL = 950
        dw      8000h+FLD_CROSSFADE_LOOP_NAME, FLD_X_FADE_LENGTH, FLD_EXECUTE, 8000h+FLD_RESAMPLE_AT_HALF_BANDWIDTH
        dw      FLD_DISCARD_BEFORE_START_AFTER, 8000h+FLD_2ND_SAMPLE_NAME, FLD_NEW_SAMPLE_NAME, 8000h+FLD_SPLICE_CROSSFADE_TIME
        dw      8000h+FLD_SPLICE_ORDER_1, 8000h+FLD_NEW_NAME, FLD_STRETCH, FLD_D_TIME
        dw      FLD_AUTO_D, FLD_MON1_POL2, FLD_DO, 0
        endif
        if      FW_VERSION = 210
        dw      8000h+FLD_RESAMPLE_AT_HALF_BANDWIDTH, FLD_DISCARD_BEFORE_START_AFTER, 8000h+FLD_2ND_SAMPLE_NAME, FLD_NEW_SAMPLE_NAME
        dw      8000h+FLD_SPLICE_CROSSFADE_TIME, 8000h+FLD_SPLICE_ORDER_1, 8000h+FLD_CROSSFADE_LOOP_NAME, FLD_X_FADE_LENGTH
        dw      FLD_EXECUTE, 8000h+FLD_VX_TIME_SKEW_NAME, FLD_VX_TIME_SKEW_TIME, FLD_DELAY_SOFT_LOUD
        dw      8000h+FLD_LOUD, FLD_NEW, FLD_SOFT, FLD_CREATE_VX_1
        dw      0
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
P_5654_OS21:
        dw      P_56EC_OS21+3
        dw      FLD_START_POINT_COARSE+13+2
        dw      FLD_START_POINT_FINE+13+13h
        dw      FLD_END_POINT_COARSE+13+2
        dw      FLD_END_POINT_FINE+13+4
        endif
        if      FW_VERSION < 400
        dw      FLD_LOOP_LENGTH_COARSE+14+1
        dw      FLD_LOOP_LENGTH_AUTO
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      5fh, 0dfh, 50h, 5fh, 77h, 0dfh, 80h, 5fh, 89h, 0dfh, 98h, 0dfh
        db      12 dup (0)
        endif
        if      FW_VERSION < 400
FLD_SELECT_COPY_SAMPLE:
        TEXTFIELD SCR_SELECT_COPY_SAMPLE, 9, 29, 39, FT_NAME, 'S', select_sample
FLD_SELECT_COPY_SAMPLE_RENAME_DELETE:
        TEXTFIELD SCR_SELECT_COPY_SAMPLE, 49, 69, 79, FT_NAME, 'S', rename_sample
FLD_LOUDNESS_03:
        FIELD   SCR_LOUDNESS_03, 4, 48, 51, FT_NUM+FT_SIGNED, 0, set_sample_loudness, 0, -50, 50
        endif
        if      FW_VERSION = 210
FLD_LOUD:
        TEXTFIELD SCR_CREATE_VX, 4, 11, 21, FT_NAME, 'S', L_63f3_os21
FLD_NEW:
        TEXTFIELD SCR_CREATE_VX, 22, 28, 38, FT_NAME, 'S', L_63f3_os21
FLD_SOFT:
        TEXTFIELD SCR_CREATE_VX, 44, 51, 61, FT_NAME, 'S', L_63f3_os21
FLD_CREATE_VX_1:
        FIELD   SCR_CREATE_VX, 62, 74, 75, FT_KEYS, 0, L_5b52_os21, 0, KEYS_CREATE_VX_1, 1
FLD_CREATE_VX_2:
        FIELD   SCR_CREATE_VX, 0, 77, 80, FT_NUM, 0, 0, 100, 0, 100
        endif
        if      FW_VERSION < 400
FLD_NOM_PITCH:
        FIELD   SCR_LOUDNESS_03, 15, 62, 64, FT_NOTE, 0, set_sample_pitch, 0, 24, 96
FLD_FINE_PITCH:
        FIELD   SCR_LOUDNESS_03, 27, 72, 75, FT_NUM+FT_SIGNED, 0, set_sample_pitch, 0, -99, 99
FLD_REPLAY_MODE_ONE_SHOT:
        FIELD   SCR_REPLAY_MODE, 6, 74, 75, FT_KEYS, 0, set_replay_mode, 0, KEYS_REPLAY_MODE_ONE_SHOT, 3
KEYS_REPLAY_MODE_ONE_SHOT:
        db      31h, 32h, 33h
P_56EC_OS21:
        db      4fh, 4ch, 41h
FLD_START_POINT_COARSE:
        endif
        if      MODEL = 950
        FIELD   SCR_START_POINT, 19, 63, 67, FT_NUM, 0, L_5ddf_os21, 0, 0, 0
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        FIELD   SCR_START_POINT, 19, 64, 67, FT_NUM, 0, L_5ddf_os21, 0, 0, 0
        endif
        if      FW_VERSION < 400
FLD_START_POINT_FINE:
        FIELD   SCR_START_POINT, 27, 68, 71, FT_NUM, 0, L_5ddf_os21, 0, 0, 0
        db      20h, 00h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
FLD_END_POINT_COARSE:
        FIELD   SCR_END_POINT, 19, 64, 67, FT_NUM, 0, L_5d31_os21, 0, 0, 0
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
FLD_START_POINT_AUTO:
        FIELD   SCR_START_POINT, 34, 77, 79, FT_NUM, 0, L_5d31_os21, 1, 0, 99
FLD_END_POINT_COARSE:
        endif
        if      MODEL = 950
        FIELD   SCR_END_POINT, 19, 63, 67, FT_NUM, 0, L_5ddf_os21, 0, 0, 0
        endif
        if      FW_VERSION = 210
        FIELD   SCR_END_POINT, 19, 64, 67, FT_NUM, 0, L_5ddf_os21, 0, 0, 0
        endif
        if      FW_VERSION < 400
FLD_END_POINT_FINE:
        FIELD   SCR_END_POINT, 27, 68, 71, FT_NUM, 0, L_5ddf_os21, 0, 0, 0
        db      1ch, 00h
FLD_LOOP_LENGTH_COARSE:
        endif
        if      MODEL = 950
        FIELD   SCR_LOOP_LENGTH, 19, 63, 67, FT_NUM, 0, L_5ddf_os21, 0, 0, 0
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        FIELD   SCR_LOOP_LENGTH, 19, 64, 67, FT_NUM, 0, L_5ddf_os21, 0, 0, 0
        endif
        if      FW_VERSION < 400
FLD_LOOP_LENGTH_FINE:
        FIELD   SCR_LOOP_LENGTH, 27, 68, 71, FT_NUM, 0, L_5ddf_os21, 0, 5, 0
        db      24h, 00h
FLD_LOOP_LENGTH_AUTO:
        endif
        if      FW_VERSION < 210
        FIELD   SCR_LOOP_LENGTH, 34, 80, 81, FT_KEYS, 0, loop_length_auto, 0, KEYS_LOOP_LENGTH_AUTO, 1
KEYS_LOOP_LENGTH_AUTO:
        endif
        if      FW_VERSION = 210
        FIELD   SCR_LOOP_LENGTH, 34, 80, 81, FT_KEYS, 0, loop_length_auto, 0, KEYS_CREATE_VX_1, 1
KEYS_CREATE_VX_1:
        endif
        if      FW_VERSION < 400
        db      0dh
FLD_TIME_DIRECTION:
        FIELD   SCR_TIME_DIRECTION, 6, 69, 70, FT_KEYS, 0, set_time_direction, 0, KEYS_TIME_DIRECTION, 2
P_577D_OS21:
        db      4eh, 52h
KEYS_TIME_DIRECTION:
        db      31h, 32h
FLD_DISCARD_BEFORE_START_AFTER:
        endif
        if      MODEL = 950
        FIELD   SCR_RESAMPLE, 41, 80, 81, FT_KEYS, 0, L_0cf8, 0, KEYS_LOOP_LENGTH_AUTO, 1
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        FIELD   SCR_RESAMPLE, 41, 80, 81, FT_KEYS, 0, L_60df_os21, 0, KEYS_LOOP_LENGTH_AUTO, 1
        endif
        if      FW_VERSION < 210
FLD_RESAMPLE_AT_HALF_BANDWIDTH:
        FIELD   SCR_RESAMPLE, 5, 39, 40, FT_KEYS, 0, resample_at_half_bandwidth, 0, KEYS_LOOP_LENGTH_AUTO, 1
        endif
        if      FW_VERSION = 210
        FIELD   SCR_RESAMPLE, 41, 80, 81, FT_KEYS, 0, L_60df_os21, 0, KEYS_CREATE_VX_1, 1
FLD_RESAMPLE_AT_HALF_BANDWIDTH:
        FIELD   SCR_RESAMPLE, 5, 39, 40, FT_KEYS, 0, resample_at_half_bandwidth, 0, KEYS_CREATE_VX_1, 1
        endif
        if      FW_VERSION < 400
FLD_SELECT_PROGRAM_MONITOR:
        TEXTFIELD SCR_SELECT_PROGRAM, 5, 22, 32, FT_NAME, 'P', set_monitor_program
FLD_2ND_SAMPLE_NAME:
        TEXTFIELD SCR_SPLICE, 12, 30, 40, FT_NAME, 'S', set_splice_second_sample
FLD_NEW_SAMPLE_NAME:
        TEXTFIELD SCR_SPLICE, 52, 70, 80, FT_NAME, 'S', L_63f3_os21
FLD_SPLICE_CROSSFADE_TIME:
        FIELD   SCR_SPLICE_XFADE, 4, 63, 68, FT_NUM+FT_UNSIGNED, 0, L_63f8_os21, 1000, 0, 32000
FLD_SPLICE_ORDER_1:
        FIELD   SCR_SPLICE_ORDER, 4, 70, 71, FT_KEYS, 0, set_splice_order, 0, KEYS_SPLICE_ORDER_1, 4
        db      4ch, 46h, 54h
KEYS_SPLICE_ORDER_1:
        db      " 123"
FLD_SPLICE_ORDER_2:
        FIELD   SCR_SPLICE_ORDER, 0, 77, 80, FT_NUM, 0, 0, 100, 0, 100
        endif
        if      MODEL = 950
FLD_EXECUTE:
        FIELD   SCR_CROSSFADE_LOOP, 62, 71, 72, FT_KEYS, 0, L_67a9_os21, 0, KEYS_LOOP_LENGTH_AUTO, 1
        endif
        if      FW_VERSION = 210
FLD_DELAY_SOFT_LOUD:
        FIELD   SCR_VX_TIME_SKEW, 53, 75, 76, FT_KEYS, 0, L_67a9_os21, 0, KEYS_SPLICE_ORDER_1, 3
FLD_VX_TIME_SKEW_TIME:
        FIELD   SCR_VX_TIME_SKEW, 40, 47, 52, FT_NUM+FT_UNSIGNED, 0, L_63f8_os21, 5000, 0, 32000
FLD_VX_TIME_SKEW:
        FIELD   SCR_VX_TIME_SKEW, 0, 77, 80, FT_NUM, 0, 0, 100, 0, 100
FLD_VX_TIME_SKEW_NAME:
        TEXTFIELD SCR_VX_TIME_SKEW, 19, 26, 36, FT_NAME, 'S', L_63f3_os21
FLD_EXECUTE:
        FIELD   SCR_CROSSFADE_LOOP, 62, 71, 72, FT_KEYS, 0, L_689e_os21, 0, KEYS_CREATE_VX_1, 1
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
FLD_X_FADE_LENGTH:
        FIELD   SCR_CROSSFADE_LOOP, 41, 57, 62, FT_NUM+FT_UNSIGNED, 0, L_63f8_os21, 32000, 0, 32000
FLD_CROSSFADE_LOOP:
        FIELD   SCR_CROSSFADE_LOOP, 0, 77, 80, FT_NUM, 0, 0, 100, 0, 100
FLD_CROSSFADE_LOOP_NAME:
        TEXTFIELD SCR_CROSSFADE_LOOP, 22, 29, 39, FT_NAME, 'S', L_63f3_os21
        endif
        if      FW_VERSION < 400
        db      0c3h
        endif

RUN_FN_1C82 macro   {GLOBALSYMBOLS}
fn_1c82:
        pusha
        mov     si, word ptr [CUR_SAMPLE]
        mov     di, P_A084
        and     byte ptr [di+12h], 0fdh
        cmp     byte ptr [si+2ah], 0
        je      br_5871_os21
        or      byte ptr [di+12h], 2
br_5871_os21:
        add     di, 18h
        mov     cx, 5
        rep movsw
        popa
        endm

RUN_FN_0125 macro   {GLOBALSYMBOLS}
        jmp     put_field_value

fn_0125:
        mov     ax, 0c000h
        mov     dx, 0
        jmp     br_0142
loop_012d:
        mov     ax, word ptr [bx+36h]
        mov     dx, word ptr [bx+38h]
        add     ax, word ptr [bx+10h]
        adc     dx, word ptr [bx+12h]
        add     ax, 0fh
        adc     dx, 0
        and     ax, 0fff0h
        endm
        if      FW_VERSION = 210

        RUN_FN_1C82
        RUN_FN_020A
        RUN_FN_588D_OS21
        mov     di, ax
        and.w   di, 0fh
        RUN_BR_025E

fn_590d_os21:
        call    fn_2e3f_os21
        mov     bp, FLD_SPLICE_ORDER_2
        call    put_field_value
        call    fn_2e3f_os21
        mov     bp, FLD_CREATE_VX_2
        call    put_field_value
        call    fn_2e3f_os21
        mov     bp, FLD_CROSSFADE_LOOP
        call    put_field_value
        call    fn_2e3f_os21
        mov     bp, FLD_VX_TIME_SKEW
        RUN_FN_0125
        RUN_BR_0142

L_0177:
        RUN_BR_017A
        mov     cx, SLOT_COUNT
        RUN_LOOP_01A1
        endif

RUN_FN_1CC6 macro   {GLOBALSYMBOLS}

fn_1cc6:
        pusha
        call    field_text
        mov     dx, di
        call    find_sample
        mov     al, 20h
        jb      br_59fa_os21
        cmp     byte ptr [bx+2ah], 0
        je      br_59fa_os21
        mov     ax, 4
br_59fa_os21:
        mov     di, dx
        mov     byte ptr [di+0ah], al
        popa
        ret
        endm
        if      FW_VERSION = 210
        RUN_FN_1CC6
W_5A01_OS21:
        db      00h, 00h, 00h
W_5A04_OS21:
        db      20h, 00h
W_5A06_OS21:
        db      00h, 00h
W_5A08_OS21:
        db      01h, 00h
W_5A0A_OS21:
        db      00h, 00h
W_5A0C_OS21:
        dw      fn_61ba_os21
W_5A0E_OS21:
        db      0d0h, 07h
W_5A10_OS21:
        db      00h, 00h, 00h, 00h
W_5A14_OS21:
        db      00h, 00h
        endif
        if      FW_VERSION < 400

select_sample:
        call    sample_field
        mov     dx, si
        mov     di, word ptr [CUR_SAMPLE]
        repe cmpsb
        jne     br_5a24_os21
        ret
br_5a24_os21:
        call    find_sample
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        jae     L_1006
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        jae     br_5a3d_os21
        endif
        if      FW_VERSION < 400
        mov     di, dx
        mov     al, 20h
        mov     cx, 0ah
        repe scasb
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        jne     br_124a
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        jne     fn_5a43_os21
        endif
        if      FW_VERSION < 400
        mov     dx, P_4E9E_OS21
loop_5a37_os21:
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        call    find_sample
        call    fn_21a1
        call    fn_0125
loop_5fe8_v12a:
        call    program_sample_name_xref_resolve
L_1006:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    fn_5b39_os21
loop_5a3a_os21:
        call    program_sample_name_xref_resolve
br_5a3d_os21:
        endif
        if      FW_VERSION < 400
        call    sample_fill
        jmp     br_5e11_os21
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
br_124a:
        call    check_sample_slots
        call    find_free_slot
        jae     br_5fff_v12a
        mov     ax, ERR_MEMORY_SPACE_FOR_PROGRAMS
        jmp     error_restart
br_5fff_v12a:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

fn_5a43_os21:
        call    check_sample_slots
        call    fn_5a76_os21
        endif
        if      FW_VERSION < 400
        push    bp
        push    bx
        call    fn_2aef
        mov     si, word ptr [CUR_SAMPLE]
        push    ax
        mov     ax, word ptr [si+10h]
        sub     ax, bx
        mov     ax, word ptr [si+12h]
        sbb     ax, cx
        pop     ax
        pop     bx
        pop     bp
        jb      br_5a7f_os21
        mov     ax, ERR_MEMORY_SAMPLE_SPACE_FULL
loop_5a65_os21:
        jmp     error_restart
        endif
        if      MODEL = 950

check_sample_slots:
        pusha
        call    program_sample_tag_scan
        cmp     ah, 63h
        mov     ax, ERR_TOO_MANY_SAMPLES_IN
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)

check_sample_slots:
        pusha
        call    program_sample_tag_scan
        cmp     ah, 20h
        mov     ax, ERR_TOO_MANY_SAMPLES_IN
        endif
        if      FW_VERSION < 400
        jae     loop_5a65_os21
        popa
        ret
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

fn_5a76_os21:
        call    find_free_slot
        mov     ax, ERR_MEMORY_SPACE_FOR_PROGRAMS
        jb      loop_5a65_os21
        ret
        endif
        if      FW_VERSION < 400
br_5a7f_os21:
        mov     di, bx
        mov     cx, 3ch
        rep movsb
        mov     word ptr [bx+36h], ax
        mov     word ptr [bx+38h], dx
        mov     byte ptr [bp], 53h
        mov     si, W_4E76_OS21
        mov     cx, 5
        mov     di, bx
        rep movsw
        push    bx
        xchg    word ptr [CUR_SAMPLE], bx
        mov     word ptr [W_A030_OS21], bx
        pop     bx
        mov     word ptr [bx+28h], cx
        call    fn_0043
        mov     bx, word ptr [W_A030_OS21]
        lea     si, [bx+36h]
        mov     di, word ptr [CUR_SAMPLE]
        lea     di, [di+36h]
        lea     bx, [bx+10h]
        call    fn_020a
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        jmp     loop_5fe8_v12a
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        jmp     loop_5a3a_os21
        endif
        if      FW_VERSION < 400

rename_sample:
        call    sample_field
        mov     di, word ptr [CUR_SAMPLE]
        repe cmpsb
        jne     br_5acd_os21
        ret
br_5acd_os21:
        mov     di, P_4E9E_OS21
        cmp     byte ptr [di], 2dh
        je      br_5ade_os21
        mov     cx, 0ah
        mov     al, 20h
        repe scasb
        jne     br_5ae5_os21
br_5ade_os21:
        mov     dx, word ptr [CUR_SAMPLE]
        jmp     loop_5a37_os21
br_5ae5_os21:
        mov     dx, P_4E9E_OS21
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)

L_6095_v12a:
        call    find_sample
        jb      br_60a0_v12a
        call    fn_21a1
        call    fn_0125
br_60a0_v12a:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    fn_5b39_os21
        endif
        if      FW_VERSION < 400
        mov     bp, W_9E4A
        mov     dx, P_AA2A_OS21
loop_5af1_os21:
        cmp     byte ptr [bp], 4bh
        jne     br_5b02_os21
        mov     di, dx
        call    fn_5b22_os21
        add     di, 16h
        call    fn_5b22_os21
br_5b02_os21:
        add     dx, 46h
        inc     bp
        cmp     bp, P_9E8E
        jne     loop_5af1_os21
        mov     di, word ptr [CUR_SAMPLE]
        call    fn_5b22_os21
        mov     di, W_4E76_OS21
        call    fn_5b22_os21
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

L_5b19_os21:
        endif
        if      FW_VERSION < 400
        call    program_sample_name_xref_resolve
        call    sample_fill
        jmp     br_5e11_os21

fn_5b22_os21:
        push    di
        mov     si, W_4E76_OS21
        mov     cx, 5
        repe cmpsw
        jne     br_5b37_os21
        pop     di
        push    di
        mov     si, P_4E9E_OS21
        mov     cx, 5
        rep movsw
br_5b37_os21:
        pop     di
        ret
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

fn_5b39_os21:
        pusha
        call    find_sample
        jb      br_5b45_os21
        call    fn_21a1
        endif
        if      MODEL = 950
        call    fn_78a8_s950
        endif
        if      FW_VERSION = 210
        call    fn_0125
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
br_5b45_os21:
        popa
        ret
        endif
        if      FW_VERSION < 400

set_sample_loudness:
        mov     ax, word ptr [bp+9]
        mov     bx, word ptr [CUR_SAMPLE]
        mov     word ptr [bx+18h], ax
        ret
        endif
        if      FW_VERSION = 210

L_5b52_os21:
        call    sample_field_enter
        jne     br_5b58_os21
        ret
br_5b58_os21:
        mov     dx, 52d5h

L_5b5b_os21:
        call    fn_5b39_os21
        mov     dx, 52ech
        call    find_sample
        jae     br_5b67_os21
loop_5b66_os21:
        ret
br_5b67_os21:
        mov     word ptr [W_A01A_OS21], bx
        mov     dx, 52c4h
        call    find_sample
        jb      loop_5b66_os21
        mov     word ptr [W_A03C_OS21], bx
        call    check_sample_slots
        call    fn_5a76_os21
        mov     di, bx
        mov     si, word ptr [W_A01A_OS21]
        mov     cx, 3ch
        rep movsb
        mov     si, 52d5h
        mov     di, bx
        mov     cx, 0ah
        rep movsb
        mov     word ptr [W_5A01_OS21+1], bx
        mov     bx, word ptr [W_A03C_OS21]
        call    fn_663e_os21
        xchg    si, ax
        xchg    di, dx
        mov     bx, word ptr [W_A01A_OS21]
        call    fn_663e_os21
        call    min_max32
        mov     bx, word ptr [W_5A01_OS21+1]
        mov     word ptr [bx+1ch], ax
        mov     word ptr [bx+1eh], dx
        add     ax, ax
        adc     dx, dx
        mov     word ptr [bx+10h], ax
        mov     word ptr [bx+12h], dx
        call    fn_2aef
        jne     br_5bc6_os21
loop_5bc3_os21:
        jmp     br_64b6_os21
br_5bc6_os21:
        mov     bp, word ptr [W_5A01_OS21+1]
        mov     word ptr [bp+36h], ax
        mov     word ptr [bp+38h], dx
        rcr     cx, 1
        shr     bx, 1
        sub     bx, word ptr [bp+10h]
        sbb     cx, word ptr [bp+12h]
        jb      loop_5bc3_os21
        call    find_free_slot
        mov     byte ptr [bp], 53h
        mov     byte ptr [bx+2ah], 0ffh
        xor     ax, ax
        mov     word ptr [bx+18h], ax
        mov     word ptr [bx+20h], ax
        mov     word ptr [bx+22h], ax
        mov     word ptr [bx+28h], ax
        call    fn_688f_os21
        mov     bp, word ptr [W_5A01_OS21+1]
        mov     bx, word ptr [W_A01A_OS21]
        xor     ax, ax
        call    fn_5c14_os21
        mov     ax, 8
        mov     bx, word ptr [W_A03C_OS21]
        call    fn_5c14_os21
        mov     bx, bp
        jmp     load_all_samples

fn_5c14_os21:
        or      ax, word ptr [bp+38h]
        mov     word ptr [W_9644], ax
        mov     ax, word ptr [bp+36h]
        mov     word ptr [W_9642], ax
        call    fn_660f_os21
        mov     word ptr [W_9600], ax
        mov     word ptr [W_9602], dx
        call    loudness_gain
        mov     word ptr [W_9674], L_671b_os21
        jmp     br_670b_os21
        endif
        if      FW_VERSION < 400

set_sample_pitch:
        mov     ax, word ptr [FLD_NOM_PITCH+9]
        mov     cl, 4
        shl     ax, cl
        add     ax, word ptr [FLD_FINE_PITCH+9]
        mov     bx, word ptr [CUR_SAMPLE]
        mov     word ptr [bx+16h], ax
        ret

set_replay_mode:
        call    sample_field
        push    bx
        endif
        if      FW_VERSION < 210
        mov     bx, FLD_LOUDNESS_03+14
        endif
        if      FW_VERSION = 210
        mov     bx, FLD_CREATE_VX_2+14
        endif
        if      FW_VERSION < 400
        xlat
        pop     bx
        cmp     al, byte ptr [bx+1ah]
        jne     br_5c58_os21
        ret
br_5c58_os21:
        mov     byte ptr [bx+1ah], al
        RUN_FN_0043

fn_61ba_os21:
        add     word ptr [di], cx
        adc     word ptr [di+2], 0
        endif
        if      MODEL = 950
        ret

fn_70d7_s950:
        mov     word ptr [W_5A0C_OS21], fn_61ba_os21
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        cmpsw
        jne     br_61d1_os21
        cmpsw
        jne     br_61d1_os21
        sub     di, 4
        lea     si, [bx+36h]
        movsw
        lodsw
        or      al, 8
        stosw
br_61d1_os21:
        ret

fn_61d2_os21:
        push    si
        lodsw
        cmp     byte ptr [si], 8
        jb      br_61e0_os21
        jne     br_61fa_os21
        cmp     ax, 0c000h
        jae     br_61fa_os21
br_61e0_os21:
        sub     ax, word ptr [W_A024_OS21]
        mov     dx, word ptr [si]
        sbb     dx, word ptr [W_A026_OS21]
        jb      br_61fa_os21
        add     ax, word ptr [bx+36h]
        adc     dx, word ptr [bx+38h]
        or      dl, 8
        mov     word ptr [si], dx
        mov     word ptr [si-2], ax
br_61fa_os21:
        pop     si
        ret

fn_61fc_os21:
        push    si
        lodsw
        jmp     br_61e0_os21

fn_6200_os21:
        mov     ax, word ptr [bx+36h]
        mov     dx, word ptr [bx+38h]
        add     ax, word ptr [bx+10h]
        adc     dx, word ptr [bx+12h]
        ret

L_620d_os21:
        rep movsw
        ret

fn_6210_os21:
        mov     word ptr [W_5A0C_OS21], fn_61ba_os21

fn_6216_os21:
        pushf
        cli

L_6218_os21:
        call    fn_6200_os21
        mov     word ptr [W_A024_OS21], ax
        mov     word ptr [W_A026_OS21], dx
        xchg    bx, bp
        call    fn_6200_os21
        mov     word ptr [W_A020_OS21], ax
        mov     word ptr [W_A022_OS21], dx
        xchg    bp, bx
        endif
        if      FW_VERSION < 400
loop_6230_os21:
        mov     si, word ptr [W_9600]
        mov     di, word ptr [W_9602]
        shl     si, 1
        rcl     di, 1
        endif
        if      MODEL = 950
        sub     ax, ax
        mov     dx, 1
        sub     ax, word ptr [W_966E]
        sbb     dx, 0

L_70f5_s950:
        call    min_max32
        sub     ax, ax
        mov     dx, 1
        sub     ax, word ptr [W_9642]
        sbb     dx, 0
        cmp     word ptr [W_5A0C_OS21], L_63bd_os21
        jne     br_7110_s950
        add     ax, ax
        rcl     dx, 1
br_7110_s950:
        call    min_max32
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     ax, word ptr [W_A024_OS21]
        mov     dx, word ptr [W_A026_OS21]
        sub     ax, word ptr [W_966E]
        sbb     dx, word ptr [W_9670]
        call    min_max32
        cmp     word ptr [W_5A0C_OS21], L_63bd_os21
        je      br_6268_os21
        mov     ax, word ptr [W_A020_OS21]
        mov     dx, word ptr [W_A022_OS21]
        sub     ax, word ptr [W_9642]
        sbb     dx, word ptr [W_9644]
        call    min_max32
br_6268_os21:
        endif
        if      FW_VERSION < 400
        and     di, di
        mov     cx, 7ff8h
        jne     br_6282_os21
        and     si, si
        jne     br_6275_os21
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        popf
        endif
        if      FW_VERSION < 400
        ret
br_6275_os21:
        mov     cx, si
        shr     cx, 1
        cmp     cx, 7ff9h
        jb      br_6282_os21
        sub     cx, 8
br_6282_os21:
        push    cx
        push    ds
        push    es
        endif
        if      MODEL = 950
        mov     dx, 1c6h
        mov     al, byte ptr [W_9644]
        out     dx, al
        mov     ax, word ptr [W_9642]
        mov     di, ax
        and.w   di, 0fh
        shr     ax, 4
        add     ax, 3000h
        mov     es, ax
        mov     dx, 1c4h
        mov     al, byte ptr [W_9670]
        out     dx, al
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        push    cx
        mov     cl, 4
        endif
        if      FW_VERSION < 400
        mov     ax, word ptr [W_966E]
        mov     si, ax
        and.w   si, 0fh
        endif
        if      MODEL = 950
        shr     ax, 4
        add     ax, 2000h
        mov     ds, ax
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        and     ax, 0fff0h
        or      ax, word ptr [W_9670]
        ror     ax, cl
        push    ax
        mov     ax, word ptr [W_9642]
        mov     di, ax
        and.w   di, 0fh
        and     ax, 0fff0h
        or      ax, word ptr [W_9644]
        ror     ax, cl
        mov     es, ax
        pop     ds
        pop     cx
        endif
        if      FW_VERSION < 400
        push    bx
        push    bp
        call    word ptr cs:[W_9674]
        pop     bp
        pop     bx
        pop     es
        pop     ds
        pop     cx
        sub     word ptr [W_9600], cx
        sbb     word ptr [W_9602], 0
        shl     cx, 1
        mov     di, W_966E
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     si, W_A024_OS21
        endif
        if      FW_VERSION < 400
        call    fn_61ba_os21
        mov     di, W_9642
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        mov     si, W_A020_OS21
        endif
        if      FW_VERSION < 400
        xchg    bx, bp
        call    word ptr [W_5A0C_OS21]
        xchg    bp, bx
        jmp     loop_6230_os21
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)

fn_62e2_os21:
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        mov     si, ax
        mov     di, dx
        sub     ax, word ptr [bx+1ch]
        sbb     dx, word ptr [bx+1eh]
        xchg    word ptr [bx+20h], ax
        xchg    word ptr [bx+22h], dx
        sub     si, ax
        sbb     di, dx
        mov     word ptr [bx+1ch], si
        mov     word ptr [bx+1eh], di
        jmp     fn_5fe4_os21
        endif
        if      FW_VERSION < 400

resample_at_half_bandwidth:
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        call    fn_6bce_v12a
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    sample_field_enter
        endif
        if      FW_VERSION < 400
        jne     br_630b_os21
        ret
br_630b_os21:
        cmp     word ptr [bx+12h], 0
        jne     br_6318_os21
        cmp     word ptr [bx+10h], 0c8h
        jb      br_631f_os21
br_6318_os21:
        cmp     word ptr [bx+14h], 0bb8h
        jae     br_6325_os21
br_631f_os21:
        mov     ax, MSG_ENOUGH_ALREADY
        jmp     error_restart
br_6325_os21:
        pushf
        cli
        mov     si, bx
        mov     di, W_7CEE
        mov     cx, 3ch
        rep movsb
        add     word ptr [bx+10h], 2
        adc     word ptr [bx+12h], 0
        and.w   word ptr [bx+10h], 0fffch
        shr     word ptr [bx+12h], 1
        rcr     word ptr [bx+10h], 1
        shr     word ptr [bx+22h], 1
        rcr     word ptr [bx+20h], 1
        shr     word ptr [bx+1eh], 1
        rcr     word ptr [bx+1ch], 1
        shr     word ptr [bx+26h], 1
        rcr     word ptr [bx+24h], 1
        shr     word ptr [bx+14h], 1
        mov     bp, bx
        mov     bx, W_7CEE
        lea     si, [bx+10h]
        mov     di, W_9600
        movsw
        movsw
        lea     si, [bx+36h]
        push    si
        mov     di, W_966E
        movsw
        movsw
        pop     si
        mov     di, W_9642
        movsw
        movsw
        mov     word ptr [W_9674], L_6394_os21
        mov     word ptr [W_5A0C_OS21], L_63bd_os21
        mov     ax, 8000h
        mov     word ptr [W_A02E_OS21], ax
        mov     byte ptr [B_A02C_OS21], al
        endif
        if      MODEL = 950
        call    loop_6230_os21
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    fn_6216_os21
        endif
        if      FW_VERSION < 400
        mov     bx, word ptr [CUR_SAMPLE]
        jmp     br_619f_os21

L_6394_os21:
        push    bp
        mov     bp, W_A02A_OS21
        mov     word ptr [bp], 0
loop_639d_os21:
        lodsw
        add     ah, 80h
        test    byte ptr [bp+2], 1
        jne     br_63b3_os21
        add     ax, word ptr [bp+4]
        rcr     ax, 1
        add     ah, 80h
        stosw
        inc     word ptr [bp]
br_63b3_os21:
        mov     word ptr [bp+4], ax
        inc     byte ptr [bp+2]
        loop    loop_639d_os21
        pop     bp
        ret

L_63bd_os21:
        push    cx
        mov     cx, word ptr [W_A02A_OS21]
        shl     cx, 1

L_63c4_os21:
        call    fn_61ba_os21
        pop     cx
        ret

set_monitor_program:
        call    sample_field
        mov     dx, si
        call    find_program
        jb      br_63e9_os21
        cmp     bx, word ptr [CUR_PROGRAM]
        je      br_63e9_os21
        mov     word ptr [CUR_PROGRAM], bx
        pushf
        cli
        call    voice_reset_all
        call    fn_66aa
        call    thk_program_sample_tag_scan
        popf
br_63e9_os21:
        ret

set_splice_second_sample:
        call    fn_1cc6
        call    fn_5467_os21
loop_63f0_os21:
        jmp     lcd_redraw

L_63f3_os21:
        call    fn_1cc6
        jmp     loop_63f0_os21

L_63f8_os21:
        ret

set_splice_order:
        call    sample_field
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        jne     br_6820_v12a
        ret
br_6820_v12a:
        mov     byte ptr [si], 20h
        push    bx
        mov     bx, 5f76h
        xlat
        pop     bx
        mov     byte ptr [B_A046_OS21], al
        call    find_free_slot
        jae     br_6837_v12a
        mov     ax, ERR_MEMORY_SPACE_FOR_PROGRAMS
        jmp     error_restart
br_6837_v12a:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        jne     br_63ff_os21
        ret
br_63ff_os21:
        mov     word ptr [W_5A06_OS21], P_516F_OS21
        mov     byte ptr [si], 20h
        mov     bx, FLD_SELECT_PROGRAM_MONITOR+8
        xlat
        mov     byte ptr [B_A046_OS21], al
        call    fn_5a76_os21
        endif
        if      FW_VERSION < 400
        mov     di, bx
        mov     si, word ptr [CUR_SAMPLE]
        mov     cx, 3ch
        rep movsb
        mov     word ptr [W_A048_OS21], bx
        mov     word ptr [W_A042_OS21], bp
        mov     dx, P_516F_OS21
        call    find_sample
        jb      br_643a_os21
        mov     word ptr [W_A048_OS21], bx
        mov     word ptr [W_A042_OS21], bp
        call    fn_21a1
        jmp     br_643d_os21
br_643a_os21:
        call    check_sample_slots
br_643d_os21:
        endif
        if      MODEL = 950
        call    fn_78a8_s950
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    fn_0125
        endif
        if      FW_VERSION < 400
        mov     dx, P_5147_OS21
        call    find_sample
        jae     br_644b_os21
        jmp     br_5e11_os21
br_644b_os21:
        mov     bp, word ptr [CUR_SAMPLE]
        cmp     byte ptr [B_A046_OS21], 4ch
        jne     fn_6458_os21
        xchg    bp, bx

fn_6458_os21:
        mov     word ptr [W_A01A_OS21], bx
        mov     word ptr [W_A03C_OS21], bp
        mov     si, word ptr [bp+1ch]
        mov     di, word ptr [bp+1eh]
        sub     si, word ptr [bp+20h]
        sbb     di, word ptr [bp+22h]
        call    fn_663e_os21
        call    min_max32
        pushf
        cmp     si, word ptr [FLD_SPLICE_CROSSFADE_TIME+9]
        push    di
        sbb     di, 0
        pop     di
        jae     br_6482_os21
        mov     word ptr [FLD_SPLICE_CROSSFADE_TIME+9], si
br_6482_os21:
        cmp     byte ptr [B_A046_OS21], 54h
        jne     br_6496_os21
        popf
        jae     br_64a2_os21
        mov     word ptr [W_A01A_OS21], bp
        mov     word ptr [W_A03C_OS21], bx
        jmp     br_64a2_os21
br_6496_os21:
        popf
        add     ax, si
        adc     dx, di
        sub     ax, word ptr [FLD_SPLICE_CROSSFADE_TIME+9]
        sbb     dx, 0
br_64a2_os21:
        push    ax
        push    dx
        call    fn_2aef
        mov     si, ax
        mov     di, dx
        pop     dx
        pop     ax
        je      br_64b6_os21
        stc
        sbb     bx, ax
        sbb     cx, dx
        jae     br_64bc_os21
br_64b6_os21:
        mov     ax, ERR_MEMORY_SAMPLE_SPACE_FULL
        jmp     error_restart
br_64bc_os21:
        mov     bx, word ptr [W_A042_OS21]
        mov     byte ptr [bx], 53h
        mov     bx, word ptr [W_A048_OS21]
        mov     word ptr [bx+36h], si
        mov     word ptr [bx+38h], di
        mov     word ptr [W_9642], si
        mov     word ptr [W_9644], di
        mov     word ptr [bx+1ch], ax
        mov     word ptr [bx+1eh], dx
        add     ax, 1
        adc     dx, 0
        and     ax, 0fffeh
        mov     word ptr [bx+10h], ax
        mov     word ptr [bx+12h], dx
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     si, P_516F_OS21
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     si, word ptr [W_5A06_OS21]
        endif
        if      FW_VERSION < 400
        mov     di, bx
        mov     cx, 5
        rep movsw
        mov     word ptr [bx+20h], cx
        mov     word ptr [bx+22h], cx
        mov     byte ptr [bx+2ah], 0
        pushf
        cli
        call    fn_66e4_os21
        mov     bx, word ptr [W_A01A_OS21]
        call    loudness_gain
        call    fn_660f_os21
        cmp     byte ptr [B_A046_OS21], 54h
        je      br_651a_os21
        call    fn_66ef_os21
        je      br_6538_os21
br_651a_os21:
        mov     word ptr [W_9600], ax
        mov     word ptr [W_9602], dx
        mov     word ptr [W_9674], L_671b_os21
        call    fn_6707_os21
        cmp     byte ptr [B_A046_OS21], 54h
        je      br_653b_os21
        cmp     word ptr [FLD_SPLICE_CROSSFADE_TIME+9], 0
        je      br_6578_os21
br_6538_os21:
        jmp     br_65aa_os21
        db      90h
br_653b_os21:
        mov     word ptr [W_9674], L_672b_os21
        lea     si, [bp+36h]
        mov     di, W_9642
        movsw
        movsw
        cmp     word ptr [FLD_SPLICE_CROSSFADE_TIME+9], 0
        je      br_6578_os21
        mov     bx, word ptr [W_A03C_OS21]
        call    loudness_gain
        call    fn_660f_os21
        call    fn_66ef_os21
        je      br_6569_os21
        mov     word ptr [W_9600], ax
        mov     word ptr [W_9602], dx
        call    fn_6707_os21
br_6569_os21:
        call    fn_66c7_os21
        mov     word ptr [W_9674], L_6773_os21
        call    fn_66fb_os21
        jmp     br_6594_os21
        db      90h
br_6578_os21:
        mov     bx, word ptr [W_A03C_OS21]
        call    fn_660f_os21
loop_657f_os21:
        mov     word ptr [W_9600], ax
        mov     word ptr [W_9602], dx
        call    loudness_gain
        xor     ax, ax
        mov     word ptr [W_A038_OS21], ax
        mov     word ptr [W_A03A_OS21], ax
        call    fn_6707_os21
br_6594_os21:
        call    program_sample_name_xref_resolve
        mov     bx, word ptr [W_A048_OS21]
        mov     word ptr [bx+28h], 0
        call    fn_0043
        popf
        call    fn_590d_os21
        jmp     loop_5e0e_os21
br_65aa_os21:
        call    fn_66c7_os21
        mov     word ptr [W_9674], L_6748_os21
        push    word ptr [W_9642]
        push    word ptr [W_9644]
        call    fn_66fb_os21
        pop     word ptr [W_9644]
        pop     word ptr [W_9642]
        mov     bx, word ptr [W_A03C_OS21]
        call    loudness_gain
        call    fn_660f_os21
        push    ax
        push    dx
        xor     ax, ax
        mov     cx, ax
        mov     word ptr [W_A034_OS21], ax
        xchg    word ptr [W_A036_OS21], ax
        cwd
        div     word ptr [FLD_SPLICE_CROSSFADE_TIME+9]
        xchg    cx, ax
        div     word ptr [FLD_SPLICE_CROSSFADE_TIME+9]
        add     ax, 1
        mov     word ptr [W_A038_OS21], ax
        adc     cx, 0
        mov     word ptr [W_A03A_OS21], cx
        mov     word ptr [W_9674], L_6773_os21
        call    fn_66fb_os21
        pop     dx
        pop     ax
        call    fn_66ef_os21
        jne     br_6606_os21
        jmp     br_6594_os21
br_6606_os21:
        mov     word ptr [W_9674], L_671b_os21
        jmp     loop_657f_os21

fn_660f_os21:
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    fn_6200_os21
        add     ax, 1
        adc     dx, 0
        and     al, 0feh
        mov     word ptr [W_A024_OS21], ax
        mov     word ptr [W_A026_OS21], dx
        endif
        if      FW_VERSION < 400
        mov     ax, word ptr [bx+20h]
        mov     dx, word ptr [bx+22h]
        shl     ax, 1
        rcl     dx, 1
        add     ax, word ptr [bx+36h]
        adc     dx, word ptr [bx+38h]
        mov     word ptr [W_966E], ax
        mov     word ptr [W_9670], dx
        mov     si, W_966E
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        call    fn_61fc_os21
        endif
        if      FW_VERSION < 400

fn_663e_os21:
        mov     ax, word ptr [bx+1ch]
        mov     dx, word ptr [bx+1eh]
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

fn_6644_os21:
        endif
        if      FW_VERSION < 400
        sub     ax, word ptr [bx+20h]
        sbb     dx, word ptr [bx+22h]
        ret

loudness_gain:
        push    bx
        mov     word ptr [W_A034_OS21], 0
        mov     ax, word ptr [bx+18h]
        add     al, 32h
        cbw
        mov     bx, LOUDNESS_CURVE
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION < 400
        xlat
        mov     word ptr [W_A036_OS21], ax
        pop     bx
        ret
LOUDNESS_CURVE:
        db      00h, 01h, 02h, 02h, 02h, 02h, 02h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 04h
        db      04h, 04h, 04h, 04h, 04h, 05h, 05h, 05h, 05h, 05h, 06h, 06h, 06h, 06h, 07h, 07h
        db      07h, 08h, 08h, 08h, 09h, 09h, 0ah, 0ah, 0ah, 0bh, 0bh, 0ch, 0ch, 0dh, 0dh, 0eh
        db      0fh, 0fh, 10h, 11h, 11h, 12h, 13h, 14h, 15h, 16h, 17h, 18h, 19h, 1ah, 1bh, 1ch
        db      1dh, 1fh
        db      " !#$&()+-/1468;=@CFILOSW[_cglpu{"
        db      7fh, 7fh, 7fh, 7fh

fn_66c7_os21:
        xor     ax, ax
        mov     cx, ax
        mov     word ptr [W_A034_OS21], ax
        mov     ax, word ptr [W_A036_OS21]
        cwd
        div     word ptr [FLD_SPLICE_CROSSFADE_TIME+9]
        xchg    cx, ax
        div     word ptr [FLD_SPLICE_CROSSFADE_TIME+9]
        sub     word ptr [W_A038_OS21], ax
        sbb     word ptr [W_A03A_OS21], cx
        ret

fn_66e4_os21:
        xor     ax, ax
        mov     di, W_A034_OS21
        mov     cx, 4
        rep stosw
        ret

fn_66ef_os21:
        sub     ax, word ptr [FLD_SPLICE_CROSSFADE_TIME+9]
        sbb     dx, 0
        mov     cx, ax
        or      cx, dx
        ret

fn_66fb_os21:
        mov     ax, word ptr [FLD_SPLICE_CROSSFADE_TIME+9]
        xor     dx, dx
        mov     word ptr [W_9600], ax
        mov     word ptr [W_9602], dx

fn_6707_os21:
        mov     bp, word ptr [W_A048_OS21]
        endif
        if      FW_VERSION = 210
br_670b_os21:
        endif
        if      FW_VERSION < 400
        mov     word ptr [W_0010], P_6714_OS21
        endif
        if      MODEL = 950
        jmp     fn_70d7_s950
        endif
        if      (MODEL = 900) && (FW_VERSION < 400)
        jmp     fn_6210_os21
        endif
        if      FW_VERSION < 400
P_6714_OS21:
        db      92h, 99h, 92h, 35h, 0ffh, 7fh, 0cfh

L_671b_os21:
        mov     bp, word ptr cs:[W_A036_OS21]
loop_6720_os21:
        lodsw
        sar     ax, 4
        imul    bp
        into
        stosw
        loop    loop_6720_os21
        ret

L_672b_os21:
        mov     bp, word ptr cs:[W_A036_OS21]
loop_6730_os21:
        lodsw
        sar     ax, 4
        imul    bp
        into
        add     ax, word ptr es:[di]
        jo      br_6740_os21
        stosw
        loop    loop_6730_os21
        ret
br_6740_os21:
        cwd
        rcr     dx, 1
        xchg    dx, ax
        stosw
        loop    loop_6730_os21
        ret

L_6748_os21:
        mov     bp, W_A034_OS21
loop_674b_os21:
        lodsw
        sar     ax, 4
        imul    word ptr [bp+1]
        mov     al, ah
        mov     ah, dl
        mov     bh, dh
        cwd
        cmp     dh, bh
        je      br_6763_os21
        xchg    bx, ax
        cwd
        xchg    dx, ax
        xor     ax, 7fffh
br_6763_os21:
        stosw
        mov     ax, word ptr [bp+4]
        add     word ptr [bp], ax
        mov     ax, word ptr [bp+6]
        adc     word ptr [bp+2], ax
        loop    loop_674b_os21
        ret

L_6773_os21:
        mov     bp, W_A034_OS21
loop_6776_os21:
        lodsw
        sar     ax, 4
        imul    word ptr [bp+1]
        mov     al, ah
        mov     ah, dl
        mov     bh, dh
        cwd
        cmp     dh, bh
        je      br_678e_os21
        xchg    bx, ax
        cwd
        xchg    dx, ax
        xor     ax, 7fffh
br_678e_os21:
        add     ax, word ptr es:[di]
        jo      br_67a3_os21
loop_6793_os21:
        stosw
        mov     ax, word ptr [bp+4]
        add     word ptr [bp], ax
        mov     ax, word ptr [bp+6]
        adc     word ptr [bp+2], ax
        loop    loop_6776_os21
        ret
br_67a3_os21:
        cwd
        rcr     dx, 1
        xchg    dx, ax
        jmp     loop_6793_os21
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)

fn_6bce_v12a:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

L_67a9_os21:
        endif
        if      MODEL = 950
        call    sample_field_enter
        jne     rename_duplicate_guard
        ret
rename_duplicate_guard:
        mov     dx, 652ch
        mov     di, W_4E76_OS21
        mov     si, dx
        mov     cx, 0ah
        repe cmpsb
        jne     br_37f4
        mov     ax, MSG_NO_MUST_BE_NEW
        jmp     error_restart
MSG_NO_MUST_BE_NEW:
        db      "NO! Must be new name "
        db      0bah, 0feh
br_37f4:
        call    fn_5b39_os21
        mov     bx, word ptr [CUR_SAMPLE]
        endif
        if      FW_VERSION = 210
        call    sample_field
        jne     br_67af_os21
        ret
br_67af_os21:
        mov     byte ptr [si], 20h
        cmp     byte ptr [bx+2ah], 0
        jne     br_67bb_os21
        jmp     lcd_redraw
br_67bb_os21:
        mov     byte ptr [W_5A10_OS21+2], al
        mov     dx, P_5283_OS21
        call    fn_5b39_os21

L_67c4_os21:
        call    check_sample_slots
        call    fn_2aef
        push    ax
        push    dx
        je      br_67e4_os21
        mov     bp, word ptr [CUR_SAMPLE]
        mov     ax, word ptr [FLD_VX_TIME_SKEW_TIME+9]
        cwd
        add     ax, ax
        add     ax, word ptr [bp+10h]
        adc     dx, word ptr [bp+12h]
        sub     bx, ax
        sbb     cx, dx
        jae     br_67e7_os21
br_67e4_os21:
        jmp     br_64b6_os21
br_67e7_os21:
        push    ax
        push    dx
        call    fn_5a76_os21
        mov     byte ptr [bp], 53h
        mov     di, bx
        mov     si, word ptr [CUR_SAMPLE]
        mov     cx, 3ch
        rep movsb
        mov     di, bx
        mov     si, P_5283_OS21
        mov     cx, 0ah
        rep movsb
        pop     word ptr [bx+12h]
        pop     word ptr [bx+10h]
        pop     word ptr [bx+38h]
        pop     word ptr [bx+36h]
        call    fn_688f_os21
        mov     bp, bx
        mov     bx, word ptr [CUR_SAMPLE]
        mov     word ptr [W_9674], L_620d_os21
        mov     di, 0
        mov     si, di
        cmp     byte ptr [W_5A10_OS21+2], 31h
        jne     br_682d_os21
        dec     si
br_682d_os21:
        call    fn_6854_os21
        mov     di, 8
        mov     si, 0
        cmp     byte ptr [W_5A10_OS21+2], 32h
        jne     br_683e_os21
        dec     si
br_683e_os21:
        call    fn_6854_os21
        mov     bx, bp
        mov     word ptr [bx+28h], 0
load_all_samples:
        call    fn_0043
        call    program_sample_name_xref_resolve
        call    sample_fill
        jmp     lcd_redraw

fn_6854_os21:
        mov     ax, word ptr [bx+36h]
        mov     word ptr [W_966E], ax
        mov     ax, word ptr [bx+38h]
        or      ax, di
        mov     word ptr [W_9670], ax
        mov     ax, word ptr [bp+36h]
        mov     dx, word ptr [bp+38h]
        mov     cx, word ptr [FLD_VX_TIME_SKEW_TIME+9]
        and     cx, si
        add     cx, cx
        add     ax, cx
        adc     dx, di
        mov     word ptr [W_9642], ax
        mov     word ptr [W_9644], dx
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        shr     dx, 1
        rcr     ax, 1
        mov     word ptr [W_9600], ax
        mov     word ptr [W_9602], dx
        jmp     fn_6210_os21

fn_688f_os21:
        mov     byte ptr [B_2F79], 33h
        call    fn_39db
        dec     byte ptr [B_2F79]
        jmp     fn_39db

L_689e_os21:
        call    sample_field_enter
        jne     br_68a4_os21
        ret
br_68a4_os21:
        mov     dx, 5236h

L_68a7_os21:
        call    fn_5b39_os21
        mov     bx, word ptr [CUR_SAMPLE]
        cmp     byte ptr [bx+2ah], 0
        jne     br_68b7_os21
        jmp     fn_6970_os21
br_68b7_os21:
        call    fn_6970_os21
        mov     di, W_7CEE
        mov     cx, 3ch
        add     di, cx
        mov     si, di
        xchg    word ptr [CUR_SAMPLE], si
        mov     bx, di
        rep movsb
        RUN_AFTER_BR_1250
        push    5236h
        push    bx
        mov     bx, 5236h
        mov     byte ptr [bx], 24h
        pop     bx
        call    fn_6970_os21
        mov     dx, 5236h

L_68f3_os21:
        call    find_sample
        mov     word ptr [W_7CEE], bx
        call    fn_21a1
        push    5236h
        call    find_sample
        mov     bp, word ptr [W_7CEE]
        mov     ax, word ptr [bx+36h]
        mov     word ptr [W_966E], ax
        mov     ax, word ptr [bx+38h]
        or      al, 8
        mov     word ptr [W_9670], ax
        mov     ax, word ptr [bp+36h]
        mov     word ptr [W_9642], ax
        mov     ax, word ptr [bp+38h]
        mov     word ptr [W_9644], ax
        mov     word ptr [W_9674], loop_6966_os21
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        shr     dx, 1
        rcr     ax, 1
        mov     word ptr [W_9600], ax
        mov     word ptr [W_9602], dx
        call    fn_6210_os21
        mov     byte ptr [bx+2ah], 0ffh
        lea     si, [bp+36h]
        mov     di, W_963E
        push    di
        mov     ax, word ptr [bx+36h]
        add     ax, word ptr [bx+10h]
        stosw
        mov     ax, word ptr [bx+38h]
        adc     ax, word ptr [bx+12h]
        stosw
        pop     di
        push    bx
        lea     bx, [bp+10h]
        call    fn_020a
        pop     bx
        shl     word ptr [bx+10h], 1
        rcl     word ptr [bx+12h], 1
        jmp     load_all_samples
loop_6966_os21:
        mov     ax, word ptr es:[di]
        movsw
        mov     word ptr [si-2], ax
        loop    loop_6966_os21
        ret

fn_6970_os21:
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    br_124a
        mov     si, bx
        mov     di, W_7CEE
        mov     bp, di
        mov     cx, 3ch
        rep movsb
        cmp     byte ptr [bx+1ah], 41h
        je      br_69d5_os21
        mov     si, word ptr [bx+24h]
        mov     di, word ptr [bx+26h]
        mov     ax, word ptr [bx+1ch]
        mov     dx, word ptr [bx+1eh]
        sub     ax, si
        sbb     dx, di
        push    ax
        push    dx
        call    fn_6644_os21

L_699a_os21:
        call    min_max32
        mov     ax, word ptr [FLD_X_FADE_LENGTH+9]
        cwd
        call    min_max32
        mov     word ptr [FLD_X_FADE_LENGTH+9], si
        pop     dx
        pop     ax
        mov     word ptr [bp+1ch], ax
        mov     word ptr [bp+1eh], dx
        sub     ax, si
        sbb     dx, di
        mov     word ptr [bp+20h], ax
        mov     word ptr [bp+22h], dx
        endif
        if      MODEL = 950
        mov     word ptr [W_5A06_OS21], 652ch
        endif
        if      FW_VERSION = 210
        mov     word ptr [W_5A06_OS21], 5236h
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)

fn_69c0_os21:
        mov     byte ptr [B_A046_OS21], 46h
        mov     ax, word ptr [FLD_X_FADE_LENGTH+9]
        xchg    word ptr [FLD_SPLICE_CROSSFADE_TIME+9], ax
        push    ax
        call    fn_6458_os21
        pop     word ptr [FLD_SPLICE_CROSSFADE_TIME+9]
        ret
br_69d5_os21:
        mov     ax, word ptr [bx+24h]
        mov     dx, word ptr [bx+26h]
        shr     dx, 1
        jne     br_69ea_os21
        rcr     ax, 1
        cmp     word ptr [FLD_X_FADE_LENGTH+9], ax
        jb      br_69ea_os21
        mov     word ptr [FLD_X_FADE_LENGTH+9], ax
br_69ea_os21:
        endif
        if      MODEL = 950
        push    word ptr [W_4E76_OS21]
        mov     byte ptr [W_4E76_OS21], 24h
        endif
        if      FW_VERSION = 210
        push    W_4E76_OS21
        push    bx
        mov     bx, W_4E76_OS21
        mov     byte ptr [bx], 24h
        pop     bx
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    fn_5a43_os21
        mov     bx, word ptr [CUR_SAMPLE]
        mov     ax, word ptr [bx+1ch]
        mov     dx, word ptr [bx+1eh]
        sub     ax, word ptr [bx+24h]
        sbb     dx, word ptr [bx+26h]
        mov     word ptr [bx+20h], ax
        mov     word ptr [bx+22h], dx
        push    ax
        push    dx
        dec     word ptr [W_5A0A_OS21]
        call    fn_60e5_os21
        inc     word ptr [W_5A0A_OS21]
        mov     bx, word ptr [CUR_SAMPLE]
        endif
        if      MODEL = 950
        call    fn_7008_s950
        endif
        if      FW_VERSION = 210
        call    fn_5fe4_os21
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     si, word ptr [W_A030_OS21]
        mov     bx, W_7CEE
        mov     di, bx
        mov     cx, 3ch
        rep movsb
        pop     dx
        pop     ax
        mov     word ptr [bx+20h], ax
        mov     word ptr [bx+22h], dx
        add     ax, word ptr [FLD_X_FADE_LENGTH+9]
        adc     dx, cx
        mov     word ptr [bx+1ch], ax
        mov     word ptr [bx+1eh], dx
        call    br_124a
        mov     word ptr [W_5A06_OS21], br_69ea_os21
        mov     bp, W_7CEE
        call    fn_69c0_os21
        mov     dx, W_4E76_OS21
        call    fn_5b39_os21
        endif
        if      MODEL = 950
        pop     word ptr [W_4E76_OS21]
        endif
        if      FW_VERSION = 210
        push    W_4E76_OS21
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        mov     bx, word ptr [W_A030_OS21]
        mov     word ptr [CUR_SAMPLE], bx
        call    br_124a
        mov     bx, word ptr [W_A048_OS21]
        mov     byte ptr [bx+1ah], 4ch
        mov     ax, word ptr [bx+24h]
        mov     dx, word ptr [bx+26h]
        sub     ax, word ptr [FLD_X_FADE_LENGTH+9]
        sbb     dx, 0
        add     ax, ax
        adc     dx, dx
        mov     word ptr [bx+24h], ax
        mov     word ptr [bx+26h], dx
        mov     dx, br_69ea_os21
        call    find_sample
        mov     bp, bx
        mov     bx, word ptr [CUR_SAMPLE]
        endif
        if      MODEL = 950
        mov     word ptr [W_5A06_OS21], 652ch
        endif
        if      FW_VERSION = 210
        mov     word ptr [W_5A06_OS21], 5236h
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        call    fn_69c0_os21
        mov     dx, br_69ea_os21
        call    fn_5b39_os21
        jmp     sample_fill

br_124a:
        call    check_sample_slots
        call    fn_5a76_os21
        mov     word ptr [W_A048_OS21], bx
        mov     word ptr [W_A042_OS21], bp
        mov     di, bx
        mov     bx, word ptr [CUR_SAMPLE]
        mov     si, bx
        mov     cx, 3ch
        rep movsb
        ret

sample_field_enter:
        endif
        if      FW_VERSION < 400
        call    field_text
        xchg    di, si
        mov     bx, word ptr [CUR_SAMPLE]
        cmp     byte ptr [ENTER_KEY], 0
        jne     br_6ad1_os21
        ret
br_6ad1_os21:
        mov     byte ptr [ENTER_KEY], 0
        ret
        endif
        if      MODEL = 950

fn_1c82:
        pusha
        mov     si, word ptr [CUR_SAMPLE]
        mov     di, P_A084
        add     di, 18h
        mov     cx, 5
        rep movsw
        popa
        RUN_FN_020A

fn_77dc_s950:
        push    word ptr [FLOPPY_CTRL]
        or      byte ptr [FLOPPY_CTRL], 80h
        call    fn_77ed_s950
        pop     word ptr [FLOPPY_CTRL]
        ret

fn_77ed_s950:
        mov     ax, word ptr [bx]
        mov     word ptr [W_9600], ax
        mov     ax, word ptr [bx+2]
        mov     word ptr [W_9602], ax
loop_77f8_s950:
        call    word ptr [IDLE_HOOK]
        mov     cx, 0
        sub     cx, word ptr [W_966E]
        cmc
        rcr     cx, 1
        sub     ax, ax
        sub     ax, word ptr [W_9642]
        cmc
        rcr     ax, 1
        cmp     ax, cx
        jae     br_7814_s950
        xchg    cx, ax
br_7814_s950:
        cmp     word ptr [W_9602], 0
        jne     br_7825_s950
        cmp     cx, word ptr [W_9600]
        jb      br_7825_s950
        mov     cx, word ptr [W_9600]
br_7825_s950:
        cmp     cx, 1388h
        jb      br_782e_s950
        mov     cx, 1388h
br_782e_s950:
        mov     bp, W_966E
        push    ds
        call    fn_7855_s950
        mov     bp, W_9642
        push    es
        call    fn_787c_s950
        push    cx
        rep movsw
        pop     cx
        pop     es
        pop     ds
        sub     word ptr [W_9600], cx
        sbb     word ptr [W_9602], 0
        mov     ax, word ptr [W_9600]
        or      ax, word ptr [W_9602]
        jne     loop_77f8_s950
        ret

fn_7855_s950:
        mov     dx, 1c4h
        mov     al, byte ptr [bp+2]
        out     dx, al
        mov     ax, word ptr [bp]
        mov     si, ax
        and.w   si, 0fh
        shr     ax, 4
        add     ax, 2000h
        mov     ds, ax
loop_786d_s950:
        sub     ax, ax
        add     word ptr [bp], cx
        adc     word ptr [bp+2], ax
        add     word ptr [bp], cx
        adc     word ptr [bp+2], ax
        ret

fn_787c_s950:
        mov     dx, 1c6h
        mov     al, byte ptr [bp+2]
        out     dx, al
        mov     ax, word ptr [bp]
        mov     di, ax
        and.w   di, 0fh
        shr     ax, 4
        add     ax, 3000h
        mov     es, ax
        jmp     loop_786d_s950

fn_590d_os21:
        call    fn_2e3f_os21
        mov     bp, FLD_SPLICE_ORDER_2
        call    put_field_value
        call    fn_2e3f_os21
        mov     bp, FLD_CROSSFADE_LOOP
        jmp     put_field_value

fn_78a8_s950:
        push    word ptr [FLOPPY_CTRL]
        or      byte ptr [FLOPPY_CTRL], 80h
        call    fn_78b9_s950
        pop     word ptr [FLOPPY_CTRL]
        ret

fn_78b9_s950:
        mov     ax, 8000h
        mov     dx, 1
        jmp     br_0142
loop_012d:
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        shl     ax, 1
        rcl     dx, 1
        add     ax, word ptr [bx+36h]
        adc     dx, word ptr [bx+38h]
        add     ax, 0fh
        adc     dx, 0
        and     al, 0f0h
        RUN_BR_0142
        RUN_BR_017A
        mov     cx, SLOT_COUNT
        RUN_LOOP_01A1
        RUN_FN_1CC6
W_7990_S950:
        db      15 dup (0)
SCR_STRETCH:
        db      "*14 STRETCH *New name "
P_5283_OS21:
        db      "NEW SAMPLE  *200% "
B_79C7_S950:
        db      " *D-time 1000 *Auto D_ *Mon1/pol2 2 *Do_"
FLD_AUTO_D:
        FIELD   SCR_STRETCH, 54, 62, 63, FT_KEYS, 0, L_5b52_os21, 0, KEYS_AUTO_D, 1
FLD_D_TIME:
        FIELD   SCR_STRETCH, 41, 50, 54, FT_NUM+FT_UNSIGNED, 0, L_0c92, 1000, 5, 9999
FLD_MON1_POL2:
        FIELD   SCR_STRETCH, 63, 75, 76, FT_NUM, 0, L_0c92, 2, 1, 2
FLD_NEW_NAME:
        TEXTFIELD SCR_STRETCH, 12, 23, 33, FT_NAME, 'S', L_63f3_os21
FLD_STRETCH:
        FIELD   SCR_STRETCH, 34, 36, 39, FT_NUM, 0, L_0c92, 200, 1, 999
FLD_DO:
        FIELD   SCR_STRETCH, 76, 80, 81, FT_KEYS, 0, L_60df_os21, 0, KEYS_AUTO_D, 1
KEYS_AUTO_D:
        db      0dh

L_5b52_os21:
        call    sample_field_enter
        jne     br_7a4a_s950
        ret
br_7a4a_s950:
        mov     word ptr [FLD_MON1_POL2+9], 1
        mov     byte ptr [B_79C7_S950+22h], 31h
        push    word ptr [bx+24h]
        push    word ptr [bx+26h]
        mov     ax, word ptr [FLD_D_TIME+9]
        mov     word ptr [bx+24h], ax
        mov     word ptr [bx+26h], 0
        call    fn_6e7a_s950
        mov     bp, FLD_D_TIME
        cmp     ax, word ptr [bp+0dh]
        sbb     dx, 0
        jb      br_7a77_s950
        mov     ax, word ptr [bp+0dh]
br_7a77_s950:
        call    put_field_value
        pop     word ptr [bx+26h]
        pop     word ptr [bx+24h]
        call    voice_reset_all
        call    fn_66aa
        jmp     lcd_redraw

L_0c92:
        ret

L_60df_os21:
        call    sample_field_enter
        jne     br_7a90_s950
        ret
br_7a90_s950:
        mov     si, word ptr [CUR_SAMPLE]
        mov     di, P_5283_OS21
        mov     cx, 0ah
        repe cmpsb
        jne     br_7aa4_s950
loop_7a9e_s950:
        mov     ax, MSG_CANT_DO_THIS
        jmp     error_restart
br_7aa4_s950:
        cmp     word ptr [FLD_MON1_POL2+9], 2
        jne     br_7aeb_s950
        push    es
        mov     bx, W_A034_OS21
        mov     bp, 0
        mov     si, bp
        mov     di, bp
        mov     word ptr [bx], bp
        mov     word ptr [bx+2], 1000h
        mov     ax, 1000h
        mov     es, ax
        mov     cx, 1001h
loop_7ac5_s950:
        mov     ax, si
        cmp     bp, 8000h
        cmc
        adc     ax, 0
        stosw
        mov     ax, 19h
        mul     word ptr [bx+2]
        add     bp, ax
        adc     si, dx
        mov     ax, 19h
        mul     si
        sub     word ptr [bx], ax
        sbb     word ptr [bx+2], dx
        loop    loop_7ac5_s950
        pop     es
        mov     byte ptr [B_B46D_S950], cl
br_7aeb_s950:
        mov     dx, P_5283_OS21
        call    br_11f9
        push    bx
        push    bp
        push    word ptr [0]
loop_7af7_s950:
        mov     ax, word ptr [FLD_D_TIME+9]
        cmp     word ptr [FLD_STRETCH+9], 64h
        jne     br_7b0f_s950
        mov     word ptr [W_7990_S950], 0
        mov     word ptr [W_7990_S950+2], 0
        jmp     br_7b4c_s950
br_7b0f_s950:
        jb      br_7b13_s950
        neg     ax
br_7b13_s950:
        cwd
        mov     bp, ax
        shl     ax, 1
        rcl     dx, 1
        mov     word ptr [W_7990_S950], ax
        mov     word ptr [W_7990_S950+2], dx
        mov     word ptr [0], 7b46h
        mov     byte ptr [W_7990_S950+0eh], 0
        mov     ax, word ptr [FLD_STRETCH+9]
        mov     cx, ax
        neg     bp
        imul    bp
        sub     cx, 64h
        idiv    cx
        shr     byte ptr [W_7990_S950+0eh], 1
        jae     br_7b4c_s950
        shr     word ptr [FLD_D_TIME+9], 1
        jmp     loop_7af7_s950
        db      0c6h, 06h, 9eh, 79h, 01h, 0cfh
br_7b4c_s950:
        mov     word ptr [W_7990_S950+0ch], ax
        pop     word ptr [0]
        and     ax, ax
        jne     br_7b5a_s950
        jmp     loop_7a9e_s950
br_7b5a_s950:
        mov     si, word ptr [CUR_SAMPLE]
        mov     ax, word ptr [si+1ch]
        mov     dx, word ptr [si+1eh]
        sub     ax, word ptr [si+20h]
        sbb     dx, word ptr [si+22h]
        mov     cx, 64h
        div     cx
        add     dx, -1
        adc     ax, 0
        mov     dx, word ptr [FLD_STRETCH+9]
        inc     dx
        mul     dx
        add     ax, word ptr [si+20h]
        adc     dx, word ptr [si+22h]
        add     ax, word ptr [si+10h]
        adc     dx, word ptr [si+12h]
        sub     ax, word ptr [si+1ch]
        sbb     dx, word ptr [si+1eh]
        add     ax, word ptr [W_7990_S950+0ch]
        adc     dx, 0
        push    ax
        push    dx
        call    fn_2aef
        mov     word ptr [W_7990_S950+4], ax
        mov     word ptr [W_7990_S950+6], dx
        pop     dx
        pop     ax
        sub     bx, ax
        sbb     cx, dx
        jae     br_67e7_os21
        jmp     br_64b6_os21
br_67e7_os21:
        pop     bp
        pop     bx
        mov     byte ptr [bp], 53h
        mov     si, word ptr [CUR_SAMPLE]
        mov     di, bx
        mov     cx, 3ch
        rep movsb
        mov     di, bx
        mov     si, P_5283_OS21
        mov     cx, 0ah
        rep movsb
        mov     word ptr [bx+20h], cx
        mov     word ptr [bx+22h], cx
        mov     ax, word ptr [W_7990_S950+4]
        mov     word ptr [bx+36h], ax
        mov     dx, word ptr [W_7990_S950+6]
        mov     word ptr [bx+38h], dx
        mov     si, word ptr [CUR_SAMPLE]
        mov     ax, word ptr [si+20h]
        mov     dx, word ptr [si+22h]
        push    ax
        push    dx
        cmp     word ptr [FLD_STRETCH+9], 65h
        jb      br_7c0f_s950
        sub     ax, word ptr [FLD_D_TIME+9]
        sbb     dx, 0
        jae     br_7c0f_s950
        neg     ax
        cwd
        add     ax, word ptr [si+20h]
        adc     dx, word ptr [si+22h]
        cmp     ax, word ptr [si+1ch]
        push    dx
        sbb     dx, word ptr [si+1eh]
        pop     dx
        jae     br_7c0f_s950
        mov     word ptr [si+20h], ax
        mov     word ptr [si+22h], dx
br_7c0f_s950:
        push    bx
        mov     word ptr [W_A048_OS21], bx
        lea     di, [bx+36h]
        lea     bx, [si+20h]
        lea     si, [si+36h]
        call    fn_020a
        pop     bp
        mov     al, 0fdh
        out     64h, al
        mov     bx, word ptr [CUR_SAMPLE]
        mov     ax, word ptr [bx+20h]
        mov     word ptr [bp+10h], ax
        mov     dx, word ptr [bx+22h]
        mov     word ptr [bp+12h], dx
loop_7c35_s950:
        call    fn_66e4_os21
        mov     ax, 10h
        mov     word ptr [W_A036_OS21], ax
        cwd
        div     word ptr [W_7990_S950+0ch]
        xchg    cx, ax
        div     word ptr [W_7990_S950+0ch]
        sub     word ptr [W_A038_OS21], ax
        sbb     word ptr [W_A03A_OS21], cx
        push    word ptr [W_966E]
        push    word ptr [W_9670]
        push    word ptr [W_9642]
        push    word ptr [W_9644]
        mov     word ptr [W_9674], L_6748_os21
        cmp     word ptr [FLD_MON1_POL2+9], 1
        je      br_7c73_s950
        mov     word ptr [W_9674], L_7d5e_s950
br_7c73_s950:
        mov     ax, word ptr [W_7990_S950+0ch]
        mov     word ptr [W_9600], ax
        mov     word ptr [W_9602], 0
        call    fn_70d7_s950
        pop     word ptr [W_9644]
        pop     word ptr [W_9642]
        pop     dx
        pop     ax
        add     ax, word ptr [W_7990_S950]
        adc     dx, word ptr [W_7990_S950+2]
        mov     word ptr [W_966E], ax
        mov     word ptr [W_9670], dx
        call    fn_66e4_os21
        mov     ax, 10h
        cwd
        div     word ptr [W_7990_S950+0ch]
        xchg    cx, ax
        div     word ptr [W_7990_S950+0ch]
        mov     word ptr [W_A038_OS21], ax
        mov     word ptr [W_A03A_OS21], cx
        mov     word ptr [W_9674], L_6773_os21
        cmp     word ptr [FLD_MON1_POL2+9], 1
        je      br_7cc5_s950
        mov     word ptr [W_9674], L_7dae_s950
br_7cc5_s950:
        mov     ax, word ptr [W_7990_S950+0ch]
        mov     word ptr [W_9600], ax
        add     word ptr [bp+10h], ax
        adc     word ptr [bp+12h], 0
        mov     word ptr [W_9602], 0
        call    fn_70d7_s950
        mov     ax, word ptr [W_966E]
        mov     dx, word ptr [W_9670]
        sub     ax, word ptr [bx+36h]
        sbb     dx, word ptr [bx+38h]
        shr     dx, 1
        rcr     ax, 1
        mov     si, ax
        mov     di, dx
        add     ax, word ptr [W_7990_S950+0ch]
        adc     dx, 0
        cmp     word ptr [FLD_STRETCH+9], 64h
        jae     br_7d05_s950
        add     ax, word ptr [FLD_D_TIME+9]
        adc     dx, 0
br_7d05_s950:
        sub     ax, word ptr [bx+1ch]
        sbb     dx, word ptr [bx+1eh]
        jae     br_7d10_s950
        jmp     loop_7c35_s950
br_7d10_s950:
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        sub     ax, si
        sbb     dx, di
        pushf
        add     word ptr [bp+10h], ax
        adc     word ptr [bp+12h], dx
        popf
        js      br_7d33_s950
        mov     bx, 7998h
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], dx
        or      ax, dx
        je      br_7d33_s950
        call    fn_77dc_s950
br_7d33_s950:
        mov     bx, word ptr [W_A048_OS21]
        and     byte ptr [bx+10h], 0feh
        mov     ax, word ptr [bx+10h]
        mov     word ptr [bx+1ch], ax
        mov     dx, word ptr [bx+12h]
        mov     word ptr [bx+1eh], dx
        mov     si, word ptr [CUR_SAMPLE]
        pop     word ptr [si+22h]
        pop     word ptr [si+20h]
        pushf
        mov     bp, FLD_D_TIME
        mov     ax, word ptr [bp+9]
        call    put_field_value
        jmp     br_6594_os21

L_7d5e_s950:
        push    bx
        mov     bp, W_A034_OS21
        mov     ax, word ptr [bp]
        mov     word ptr [bp+8], ax
        mov     dx, word ptr [bp+2]
        mov     word ptr [bp+0ah], dx
        mov     word ptr [bp+0bh], 1000h
loop_7d73_s950:
        lodsw
        sar     ax, 4
        push    ds
        lds     bx, [bp+9]
        add     bx, bx
        imul    word ptr [bx]
        pop     ds
        mov     al, ah
        mov     ah, dl
        mov     bh, dh
        cwd
        cmp     dh, bh
        je      br_7d91_s950
        xchg    bx, ax
        cwd
        xchg    dx, ax
        xor     ax, 7fffh
br_7d91_s950:
        stosw
        mov     ax, word ptr [bp+4]
        add     word ptr [bp+8], ax
        mov     al, byte ptr [bp+6]
        adc     byte ptr [bp+0ah], al
        loop    loop_7d73_s950
        mov     ax, word ptr [bp+8]
        mov     word ptr [bp], ax
        mov     dx, word ptr [bp+0ah]
        mov     word ptr [bp+2], dx
        pop     bx
        ret

L_7dae_s950:
        push    bx
        mov     bp, W_A034_OS21
        mov     ax, word ptr [bp]
        mov     word ptr [bp+8], ax
        mov     dx, word ptr [bp+2]
        mov     word ptr [bp+0ah], dx
        mov     word ptr [bp+0bh], 1000h
loop_7dc3_s950:
        lodsw
        sar     ax, 4
        push    ds
        lds     bx, [bp+9]
        add     bx, bx
        imul    word ptr [bx]
        pop     ds
        mov     al, ah
        mov     ah, dl
        mov     bh, dh
        cwd
        cmp     dh, bh
        je      br_7de1_s950
        xchg    bx, ax
        cwd
        xchg    dx, ax
        xor     ax, 7fffh
br_7de1_s950:
        add     ax, word ptr es:[di]
        jo      br_7e03_s950
loop_7de6_s950:
        stosw
        mov     ax, word ptr [bp+4]
        add     word ptr [bp+8], ax
        mov     al, byte ptr [bp+6]
        adc     byte ptr [bp+0ah], al
        loop    loop_7dc3_s950
        mov     ax, word ptr [bp+8]
        mov     word ptr [bp], ax
        mov     dx, word ptr [bp+0ah]
        mov     word ptr [bp+2], dx
        pop     bx
        ret
br_7e03_s950:
        cwd
        rcr     dx, 1
        xchg    dx, ax
        jmp     loop_7de6_s950
        db      00h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)

        RUN_FN_1C82
        RUN_FN_020A
        RUN_FN_588D_OS21
        mov     di, ax
        and.w   di, 0fh
        RUN_BR_025E

fn_590d_os21:
        call    fn_2e3f_os21
        mov     bp, FLD_SPLICE_ORDER_2
        RUN_FN_0125
        RUN_BR_0142
        RUN_BR_017A
        mov     cx, SLOT_COUNT
        RUN_LOOP_01A1
        RUN_FN_1CC6
        RUN_DRUM_INPUT
        db      0beh, 0a7h
B_3BC1:
        db      00h
        RUN_DRUM_LEVEL_CURVE
        RUN_SCR_BASIC_MIDI_CHANNEL
        RUN_DRUM_INPUTS_POLL
        RUN_BR_3ED2
        RUN_LOOP_3EFB
        RUN_BR_3F2D
        add     bx, 31h
        RUN_BR_3F8C
        RUN_MIDI_FILL
        nop
        RUN_BR_4094
        db      10 dup (0)
        RUN_FLD_BASIC_MIDI_CHANNEL
        jmp     loop_1d2a
        RUN_SET_MIDI_TEST_VELOCITY
        mov     word ptr [LAST_FIELD_PTR], FLD_CHANNEL
        RUN_L_4271
        cmp     word ptr [FIELD_LIST], P_0A5C
        RUN_LOOP_42CE
        mov     word ptr [LAST_FIELD_PTR], FLD_MASTER_TUNING
        RUN_SET_MASTER_TUNING
        dw      FLD_MASTER_TUNING
        db      8 dup (0)
        RUN_FLD_MASTER_TUNING
        mov     word ptr [LAST_FIELD_PTR], FLD_DRUM_INPUT_GAIN_INPUT
        mov     ax, P_43E8
        mov     word ptr [IDLE_HOOK], idle_tasks_drums
        jmp     loop_2223
br_43cd:
        mov     word ptr [MODE_FILL], L_43e5
        mov     word ptr [FIELD_RECENT], P_4772
        mov     word ptr [LAST_FIELD_PTR], P_4772
        mov     ax, P_476E
        jmp     menu_navigation_loop

L_43e5:
        ret
        db      00h, 00h
P_43E8:
        dw      8000h+FLD_DRUM_INPUTS
        dw      FLD_SENSITIVITY
        dw      8000h+FLD_DRUM_INPUT_MIDI_INPUT
        dw      P_44D3
FIELDS_DRUM_INPUT_MIDI:
        dw      FLD_PITCH, FLD_ON_TIME, 8000h+FLD_DRUM_INPUT_TIMES_INPUT, FLD_CAPTURE_TIME
        dw      FLD_RECOVERY_TIME, 8000h+FLD_DRUM_INPUT_GAIN_INPUT, FLD_GAIN, FLD_TRIG_THRESH
        dw      0
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h
B_4403:
        db      00h
        RUN_SCR_DRUM_INPUTS
P_44D3:
        dw      FLD_SENSITIVITY+0fh
        db      0dh, 39h, 3bh, 04h, 00h
        dw      select_drum_input+0ah
        db      01h, 00h, 01h, 00h, 10h, 00h
        RUN_FLD_PITCH
        RUN_L_77CF_V12A
        call    put_field_byte
        RUN_AFTER_L_4616
        mov     bp, P_44D3
        RUN_AFTER_L_4616_3
        RUN_AFTER_L_4616_2
        mov     al, byte ptr [bx+4]
        mov     bp, FLD_TRIG_THRESH
        call    put_field_byte
        pop     word ptr [W_9582]
        jmp     lcd_redraw
        RUN_SET_DRUM_INPUTS

select_drum_input:
        mov     ax, word ptr [bp+9]
        dec     ax
        mov     byte ptr [DRUM_INPUT], al
        jmp     utility_fill
        db      0e8h, 59h, 00h

set_drum_midi_channel:
        RUN_SET_DRUM_PITCH
        call    fn_66be
        popa
        ret

drum_field:
        mov     bx, word ptr [DRUM_INPUT_PTR]
        mov     ax, word ptr [bp+9]
        ret
        RUN_P_476E
        elseif  FW_VERSION = 210
        db      00h
B_5909:
        db      80h
B_5919:
        db      20h
W_5930:
        db      0d4h, 00h
        else

P_58AE:
        db      00h, 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0ah, 0ch, 0dh, 0eh
        endif
        if      (FW_VERSION >= 400) || (MODEL = 950)
        RUN_P_58BC
        RUN_B_5909
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)

midi_note_trigger:
        push    bx
        call    midi_channel_slot_resolve
        mov     word ptr [bp+VC(21h)], bx
        xor     ax, ax
        mov     word ptr [bp+VC(27h)], ax
        mov     word ptr [bp+VC(29h)], L_64c2
        RUN_AFTER_MIDI_NOTE_TRIGGER
        RUN_BR_59B1
        RUN_BR_59CE
        mov     byte ptr [bp+VC(0bh)], 0
        mov     ax, word ptr [si+28h]
        mov     word ptr [bp+VC(0dh)], ax
        xor     ax, ax
        mov     word ptr [bp+VC(1dh)], ax
        mov     word ptr [bp+VC(23h)], ax
        mov     word ptr [bp+VC(1fh)], ax
        RUN_BR_5A00
        RUN_BR_5A35
        RUN_AFTER_BR_5A3C
        RUN_BR_5A7F
        if      MODEL = 950
        cmp     ax, 0aah
        jb      br_5a8a
        mov     ax, 0aah
        else
        cmp     ax, 0a8h
        jb      br_5a8a
        mov     ax, 0a8h
        endif
        RUN_BR_5A8A
        mov     dl, byte ptr [bp+VC(33h)]
        mov     dh, 0
        mov     byte ptr [bp+VC(13h)], al
        RUN_AFTER_BR_5A95
        mov     bx, word ptr [bp+VC(15h)]
        mov     byte ptr [bp+VC(0ch)], al
        RUN_AFTER_BR_5A95_2
        RUN_LOOP_5B0A
        RUN_BR_5B29
        mov     bx, word ptr [bp+VC(15h)]
        RUN_BR_153C_V12A
        mov     word ptr [bp+VC(0fh)], ax
        RUN_BR_5BA7
        cmp     word ptr [bp+VC(21h)], bx
        RUN_BR_5BD1
        RUN_FN_5C92
        add     ax, word ptr [bx+TBL_9EB0]
        add     ax, word ptr [bp+VC(1dh)]
        add     ax, word ptr [MASTER_TUNING]
        xchg    bx, ax
        mov     al, byte ptr [bp+VC(1ah)]
        RUN_PITCH_SCALE_ROUTINE
        mov     word ptr [bp+VC(1bh)], ax
        mov     dl, byte ptr [bp+VC(30h)]
        RUN_BR_5D55
        mov     al, byte ptr [bp+VC(2bh)]
loop_5d8d:
        mov     dx, word ptr [bp+VC(2ch)]
        mov     bx, word ptr [bp+VC(0dh)]
        out     dx, al
        if      MODEL = 950
        mov     al, byte ptr cs:[bx+7]
        else
        mov     al, byte ptr [bx+7]
        endif
        add     dx, 9
        out     dx, al
        mov     byte ptr [bp+2], al
        if      MODEL = 950
        test    byte ptr cs:[bx], 4
        else
        test    byte ptr [bx], 4
        endif
        RUN_BR_5DAC
        if      MODEL = 950
        mov     ax, word ptr cs:[bx+4]
        add     dx, -6
        out     dx, ax
        mov     al, byte ptr cs:[bx+6]
        add     dx, 2
        out     dx, al
        mov     ax, word ptr cs:[bx+2]
        add     dx, -4
        out     dx, ax
        mov     ax, word ptr cs:[bx+8]
        mov     word ptr [bp+VC(0dh)], ax
        else
        RUN_AFTER_BR_5DAC
        endif
        RUN_BR_5DCD
        mov     bx, word ptr [bp+VC(21h)]
        sub     ax, word ptr [bx+TBL_9F16]
        RUN_BR_5E60
        mov     dl, byte ptr [bp+VC(30h)]
        mov     dh, 0
        mov     ax, word ptr [bp+VC(1bh)]
        RUN_INTERRUPT_WAIT_PRIMITIVE
        div     word ptr [bp+VC(1bh)]
        xchg    cx, ax
        mov     al, byte ptr [bp+VC(2eh)]
        mov     dx, word ptr [bp+VC(2ch)]
        RUN_AFTER_BR_189E_V12A
        mov     word ptr [bp+VC(0fh)], 4000h
        RUN_BR_5F2C
        mov     ax, word ptr [bp+VC(0fh)]
        RUN_LOOP_5F4F
        mov     ax, word ptr [si+TBL_7948]
        RUN_BR_5FA3
        sub     ax, word ptr [bx+TBL_9F16]
        RUN_BR_5FB9
        mul     word ptr [bp+VC(0fh)]
        RUN_BR_5FFF
        if      MODEL = 950
        mov     al, 0
        else
        mov     al, 0f0h
        endif
        RUN_MIDI_RX_BYTE
        if      MODEL = 950
        je      br_8638_s950
        jmp     br_6123
br_8638_s950:
        call    midi_rx_dispatch
        je      br_6109
loop_6108:
        ret
br_6109:
        cmp     byte ptr [B_7C82], 0
        je      loop_6108
        cmp     word ptr [FIELD_LIST], P_0EAE
        jne     br_8654_s950
        cmp     byte ptr [B_2218_S950], 0
        je      br_8693_s950
br_8654_s950:
        mov     bx, SLOTS
        mov     bp, SLOT_TAGS
        mov     cx, SLOT_COUNT
loop_865d_s950:
        cmp     bx, word ptr [CUR_PROGRAM]
        je      br_8669_s950
        add     bx, 46h
        inc     bp
        jmp     loop_865d_s950
br_8669_s950:
        add     bx, 46h
        inc     bp
        cmp     bx, MIDI_RX_BUF
        jne     br_8679_s950
        mov     bx, SLOTS
        mov     bp, SLOT_TAGS
br_8679_s950:
        cmp     byte ptr [bp], 50h
        jne     br_8684_s950
        cmp     byte ptr [bx+1ah], ah
        je      br_8688_s950
br_8684_s950:
        loop    br_8669_s950
        jmp     loop_6108
br_8688_s950:
        mov     word ptr [CUR_PROGRAM], bx
        call    br_66e7
        jmp     word ptr [MODE_FILL]
br_8693_s950:
        endif
        if      (MODEL = 950) && (FW_VERSION = 100)
        push    ax
        cmp     byte ptr [B_B46D_S950], 0ffh
        endif
        if      (MODEL = 950) && (FW_VERSION = 120)
        call    fn_004a_s950
        nop
        nop
        push    ax
        endif
        if      MODEL = 950
        je      br_869e_s950
        call    fn_2e2b_s950
br_869e_s950:
        call    fn_2327_s950
        mov     bx, ax
        pop     ax
        mov     al, ah
        cbw
        cmp     ax, bx
        jae     loop_6108
        mov     dx, 1f10h
        call    fn_2dfc_s950
        call    fn_29b2_s950
        else
        RUN_LOOP_6108
        endif
        RUN_BR_6123
        if      FW_VERSION >= 210

fn_6174:
        mov     dl, byte ptr [si+1]
        mov     dh, byte ptr [si+2]
        endif
        RUN_BR_617A
        if      FW_VERSION >= 210
        RUN_TX_PUMP
        endif
        RUN_MIDI_RX_PUMP
        if      FW_VERSION >= 210
        RUN_FN_62AC
        endif
        RUN_BR_62EA
        cmp     word ptr [bp+VC(17h)], ax
        jne     br_6334
        cmp     word ptr [bp+VC(21h)], bx
        RUN_BR_6334
        mov     di, word ptr [bp+VC(15h)]
        test    byte ptr [di+12h], 8
        je      br_6354
        add     di, word ptr [bp+VC(11h)]
        RUN_BR_6354
        mov     si, word ptr [bp+VC(15h)]
        RUN_BR_6392
        mov     ax, word ptr [di+TBL_7948]
        mov     word ptr [bp+VC(0fh)], ax
br_63bb:
        ret
        RUN_VOICE_VIBRATO_LFO_UPDATE
        mov     si, word ptr [bp+VC(15h)]
        mov     al, 64h
        sub     al, byte ptr [si+0fh]
        mul     byte ptr [W_9622]
        add     word ptr [bp+VC(1fh)], ax
        jns     br_6401
        mov     word ptr [bp+VC(1fh)], 7fffh
        RUN_BR_6401
        add     ax, word ptr [bp+VC(23h)]
        mov     word ptr [bp+VC(23h)], ax
        xchg    al, ah
        mov     cl, 3
        shr     al, cl
        mov     bx, sine_lfo_table
        xlat
        imul    byte ptr [bp+VC(20h)]
        shl     ax, 1
        xchg    dx, ax
        mov     bx, word ptr [bp+VC(21h)]
        mov     al, byte ptr [bx+TBL_9EF4]
        RUN_AFTER_BR_6410
        mov     word ptr [bp+VC(1dh)], ax
        cmp     byte ptr [bp+VC(1ah)], ah
        je      br_6472
        mov     al, 68h
        sub     al, byte ptr [si+0eh]
        mul     byte ptr [W_9622]
        imul    word ptr [bp+VC(19h)]
        mov     cx, 3e80h
        idiv    cx
        sub     word ptr [bp+VC(19h)], ax
br_6472:
        cmp     byte ptr [si+17h], 0
        je      br_64a7
        mov     ax, word ptr [W_9622]
        mov     bx, word ptr [bp+VC(29h)]
        call    bx
        mov     word ptr [bp+VC(27h)], ax
        mov     al, ah
        imul    byte ptr [si+17h]
        mov     cl, 32h
        idiv    cl
        cbw
        add     ax, word ptr [bp+VC(25h)]
        cmp     ax, 62h
        jg      br_6498
        mov     ax, 62h
br_6498:
        cmp     ax, 0a8h
        jl      br_64a0
        mov     ax, 0a8h
br_64a0:
        mov     bx, semitone_ratio_table
        xlat
        mov     byte ptr [bp+VC(13h)], al
br_64a7:
        call    fn_5c8c
        cmp     al, byte ptr [bp+VC(13h)]
        jb      br_64b2
        mov     byte ptr [bp+VC(13h)], al
br_64b2:
        mov     dl, byte ptr [bp+VC(33h)]
        mov     dh, 0
        mov     al, byte ptr [bp+VC(13h)]
        out     dx, al
        xor     al, al
        out     dx, al
        pop     cx
        jmp     loop_63e4

L_64c2:
        mov     bl, byte ptr [si+22h]
        and     bx, 0feh
        mul     word ptr [bx+sine_lfo_table-64h]      ; the ratio table's last 50 words
        jb      br_64dc
        and     ax, ax
        js      br_64dc
        add     ax, word ptr [bp+VC(27h)]
        cmp     ax, 6300h
        jae     br_64dc
        ret
br_64dc:
        mov     ax, 6300h
        mov     word ptr [bp+VC(29h)], L_64e5
        ret

L_64e5:
        mov     bl, byte ptr [si+23h]
        and     bx, 0feh
        mul     word ptr [bx+sine_lfo_table-64h]      ; the ratio table's last 50 words
        jb      br_6501
        neg     ax
        jns     br_6501
        add     ax, word ptr [bp+VC(27h)]
        js      br_6501
        cmp     ah, byte ptr [si+24h]
        jb      br_6501
        ret
br_6501:
        mov     word ptr [bp+VC(29h)], P_6506
P_6506:
        mov     ah, byte ptr [si+24h]
        mov     al, 0
        ret

L_650c:
        mov     bl, byte ptr [si+25h]
        and     bx, 0feh
        mul     word ptr [bx+sine_lfo_table-64h]      ; the ratio table's last 50 words
        jb      br_6523
        neg     ax
        jns     br_6523
        add     ax, word ptr [bp+VC(27h)]
        js      br_6523
        ret
br_6523:
        mov     word ptr [bp+VC(29h)], P_6528
P_6528:
        xor     ax, ax
        endif
        if      MODEL = 950
        ret

mode_play:
        mov     word ptr [MODE_SP], sp

L_1d50_v12a:
        RUN_LOOP_6538
        call    midi_receive_monitor
        call    fn_5ed7
        call    drum_inputs_poll
        call    voice_vibrato_lfo_update
        call    fn_6030
        jmp     loop_2e2f
        RUN_FN_66AA
        RUN_BR_66E7
        endif
        if      FW_VERSION >= 210
        ret

mode_play:
        mov     word ptr [MODE_SP], sp
        RUN_LOOP_6538
        call    drum_inputs_poll
        call    midi_receive_monitor
        call    fn_5ed7
        call    drum_inputs_poll
        call    voice_vibrato_lfo_update
        call    fn_6030
        RUN_IDLE_TASKS_DRUMS
        RUN_FN_66AA
        RUN_FN_66BE
        RUN_BR_66E7
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
        test    byte ptr [bp], 1ch
        je      br_6787
        cmp     byte ptr [bp+VC(0bh)], ch
        je      br_6787
        cmp     bx, word ptr [bp+VC(21h)]
        jne     br_6787
        mov     si, word ptr [bp+VC(15h)]
        mov     al, byte ptr [si+6]
        cbw
        and     al, 0feh
        xchg    di, ax
        mov     ax, word ptr [di+TBL_7948]
        mov     word ptr [bp+VC(0fh)], ax
        mov     byte ptr [bp], 2
        mov     word ptr [bp+VC(29h)], L_650c
        mov     byte ptr [bp+VC(0bh)], ch
        mov     byte ptr [bp+5], ch
        mov     al, byte ptr [bp+3]
        mov     byte ptr [bp+8], al
br_6787:
        endif
        if      MODEL = 950
        add     bp, VOICE_SIZE
        loop    loop_6751
        ret
        RUN_BR_678D
        mov     word ptr [si], L_6820
        RUN_BR_67B1
        je      br_8cc1_s950
        cmp     ah, 49h
        jne     br_67b1
        cmp     byte ptr [B_58D8], 0
        je      br_8cbc_s950
        cmp     byte ptr [B_58D8], 1
        jne     br_67b1
        cmp     byte ptr [B_B413_S950], 0
        je      br_67b1
br_8cbc_s950:
        mov     word ptr [si], L_8cf1_s950
        ret
br_8cc1_s950:
        RUN_L_67F4
        call    fn_78a8_s950
        RUN_BR_69DB
br_6a68:
        in      al, 52h
        and     al, 2
        je      br_6a68
        pop     ax
        out     54h, al
        RUN_SYSEX_SEND_DATA
        call    fn_90dd_s950
        RUN_LOOP_6ADD
        mov     al, byte ptr [W_9670]
        push    dx
        mov     dx, 1c4h
        out     dx, al
        pop     dx
        mov     ax, 2000h
        RUN_BR_6B37
        RUN_BR_6B52
        ret

fn_90dd_s950:
        mov     ax, word ptr [bx+36h]
        mov     word ptr [W_966E], ax
        mov     ax, word ptr [bx+38h]
        mov     word ptr [W_9670], ax
        RUN_MIDI_SEND_SAMPLE
        call    fn_90dd_s950
        RUN_BR_6C83
        mov     dx, 1c4h
        mov     al, byte ptr [W_9670]
        out     dx, al
        mov     ax, 2000h
        push    ds
        mov     ds, ax
        lodsw
        xor     ah, 80h
        xchg    dx, ax
        pop     ds
        RUN_AFTER_LOOP_6CA9
        RUN_LOOP_6D21
        push    word ptr [FP_1E7C_S950]
        push    word ptr [FP_1E7C_S950+2]
        mov     word ptr [FP_1E7C_S950], W_7CEE
        mov     word ptr [FP_1E7C_S950+2], 0
        call    fn_33a6_s950
        pop     word ptr [FP_1E7C_S950+2]
        pop     word ptr [FP_1E7C_S950]
        RUN_L_6ECD
        mov     cx, SLOT_COUNT
        RUN_LOOP_6EE3
        call    word ptr [MODE_FILL]
        RUN_FN_7098

fn_95c2_s950:
        pusha
        endif
        if      FW_VERSION >= 210
        add     bp, VOICE_SIZE
        loop    loop_6751
        ret
        endif
        if      FW_VERSION = 210
        db      00h

P_58AE:
        db      00h, 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0ah, 0ch, 0dh, 0eh
        RUN_P_58BC
P_590A:
        db      0f0h, 7eh
P_590C:
        db      7fh, 0f7h, 80h
P_590F:
        db      0f0h, 7eh, 7dh, 0f7h, 80h, 0f0h, 7eh, 7eh, 0f7h, 80h
B_591A:
        db      0ffh
P_591B:
        db      0f0h, 7eh, 01h, 00h, 00h, 0ch
        db      13 dup (0)
        db      80h
P_5932:
        db      "TONE            "
        db      08h, 07h, 00h, 00h
W_5946:
        db      0fdh, 2dh, 0c0h, 03h, 00h, 00h, 4ch, 00h, 08h, 07h, 00h, 00h, 00h, 00h, 00h, 00h
        db      2dh, 00h, 00h, 00h, 00h, 00h, 00h, 4eh
        db      16 dup (0)
        endif
        if      FW_VERSION >= 210
        RUN_BR_678D
        mov     word ptr [si], L_6820
        RUN_BR_67B1
        jne     br_67b1
        RUN_L_67F4
        call    fn_0125
        RUN_BR_69DB
        RUN_LOOP_6A5E
        RUN_SYSEX_SEND_DATA
        endif
        if      FW_VERSION = 210
        call    fn_660f_os21
        endif
        if      FW_VERSION >= 400
        call    L_17ba+2
        endif
        if      FW_VERSION >= 210
        RUN_LOOP_6ADD
        and.w   di, 0fh
        and     ax, 0fff0h
        or      ax, word ptr [si+2]
        ror     ax, 1
        ror     ax, 1
        ror     ax, 1
        ror     ax, 1
        RUN_BR_6B37
        endif
        if      FW_VERSION = 210
        call    fn_61d2_os21
        endif
        if      FW_VERSION >= 400
        call    fn_137f
        endif
        if      FW_VERSION >= 210
        RUN_BR_6B52
        RUN_MIDI_SEND_SAMPLE
        endif
        if      FW_VERSION = 210
        call    fn_660f_os21
        endif
        if      FW_VERSION >= 400
        call    L_17ba+2
        endif
        if      FW_VERSION >= 210
        mov     ax, word ptr [bx+36h]
        mov     word ptr [W_966E], ax
        mov     ax, word ptr [bx+38h]
        mov     word ptr [W_9670], ax
        RUN_BR_6C83
        RUN_AFTER_LOOP_6CA9_2
        RUN_AFTER_LOOP_6CA9
        endif
        if      FW_VERSION = 210
        call    fn_61d2_os21
        endif
        if      FW_VERSION >= 400
        call    fn_137f
        endif
        if      FW_VERSION >= 210
        RUN_LOOP_6D21
        call    fn_11c7
        RUN_L_6ECD
        mov     cx, SLOT_COUNT
        RUN_LOOP_6EE3
        endif
        if      FW_VERSION = 210
        call    MODE_FILL
        endif
        if      FW_VERSION >= 400
        call    word ptr [MODE_FILL]
        endif
        if      FW_VERSION >= 210
        RUN_FN_7098
        endif
        if      FW_VERSION = 210
        db      00h
        endif
        if      FW_VERSION >= 400

fn_70b8:
        push    bx
        push    cx
        push    dx
        push    bp
        push    si
        push    di
        endif
        if      (FW_VERSION >= 400) || (MODEL = 950)
        push    ds
        push    es
        endif
        if      MODEL = 950
        mov     bp, W_7CEE
        push    ds
        lds     si, [FP_1E7C_S950]
        mov     di, bp
        mov     cx, 4bh
        rep movsw
        pop     ds
        mov     di, 9d7dh
        call    fn_384a_s950
        les     di, [FP_1E7C_S950]
        mov     si, bp
        push    di
        mov     cx, 26h
        sub     ax, ax
        rep stosb
        pop     di
        push    di
        add     si, 3
        mov     cx, 5
        rep movsw
        pop     di
        lds     si, [FP_1E7C_S950]
        mov     al, byte ptr [bp+1bh]
        cbw
        mov     word ptr [di+10h], ax
        cmp     byte ptr [bp+29h], 0
        je      br_9608_s950
        dec     byte ptr [di+15h]
br_9608_s950:
        mov     al, byte ptr [bp+0fh]
        mov     byte ptr [di+1ah], al
        dec     byte ptr [di+1bh]
        mov     al, byte ptr [bp+2ah]
        mov     byte ptr [di+17h], al
        cbw
        mov     cx, ax
        add     si, 96h
        add     di, 26h
loop_9621_s950:
        push    cx
        sub     ax, ax
        mov     cx, 46h
        push    di
        rep stosb
        pop     di
        mov     al, byte ptr [si+4]
        mov     byte ptr [di], al
        mov     al, byte ptr [si+3]
        mov     byte ptr [di+1], al
        mov     dx, 7fh
        mov     al, 80h
        cmp     byte ptr [si+2eh], dh
        jne     br_9661_s950
        cmp     byte ptr [si+2fh], dl
        je      br_9661_s950
        cmp     byte ptr [si+2fh], dh
        je      br_9661_s950
        cmp     byte ptr [si+46h], dl
        je      br_9661_s950
        cmp     byte ptr [si+46h], dh
        je      br_9661_s950
        cmp     byte ptr [si+47h], dl
        jne     br_9661_s950
        mov     al, byte ptr [si+2fh]
        add     al, byte ptr [si+46h]
        shr     al, 1
br_9661_s950:
        mov     byte ptr [di+2], al
        mov     al, byte ptr [si+0ch]
        call    fn_97fa_s950
        mov     byte ptr [di+3], al
        mov     al, byte ptr [si+0dh]
        mov     byte ptr [di+4], al
        mov     al, byte ptr [si+0eh]
        mov     byte ptr [di+5], al
        mov     al, byte ptr [si+0fh]
        mov     byte ptr [di+6], al
        mov     al, byte ptr [si+9]
        cbw
        xor     ah, al
        and     al, ah
        cbw
        mov     cx, 143h
        mul     cx
        mov     byte ptr [di+7], ah
        mov     al, byte ptr [si+8]
        cbw
        mov     cx, 42bh
        mul     cx
        cmp     ah, 64h
        jb      br_96a0_s950
        mov     ah, 63h
br_96a0_s950:
        mov     byte ptr [di+8], ah
        mov     al, byte ptr [si+10h]
        cbw
        xor     ah, al
        and     al, ah
        add     al, al
        mov     byte ptr [di+9], al
        mov     al, byte ptr [si+12h]
        neg     al
        sar     al, 1
        mov     byte ptr [di+0ah], al
        mov     al, byte ptr [bp+1ah]
        cbw
        xor     ah, al
        and     al, ah
        cbw
        mov     cx, 14fh
        mul     cx
        mov     byte ptr [di+0bh], ah
        mov     al, byte ptr [bp+23h]
        mov     byte ptr [di+0fh], al
        mov     al, byte ptr [bp+21h]
        cbw
        mov     cx, 0cfh
        mul     cx
        sub     ax, 0f66h
        cwd
        xor     dx, ax
        and     ax, dx
        mov     byte ptr [di+10h], ah
        mov     al, byte ptr [bp+22h]
        mov     byte ptr [di+11h], al
        sub     ax, ax
        cmp     byte ptr [si+84h], ah
        je      br_96f5_s950
        mov     al, 1
br_96f5_s950:
        cmp     byte ptr [bp+3bh], ah
        je      br_96fc_s950
        or      al, 4
br_96fc_s950:
        mov     byte ptr [di+12h], al
        dec     byte ptr [di+13h]
        mov     al, byte ptr [bp+25h]
        mov     byte ptr [di+15h], al
        mov     al, byte ptr [bp+24h]
        mov     byte ptr [di+16h], al
        mov     al, byte ptr [si+0bh]
        mov     byte ptr [di+17h], al
        mov     al, byte ptr [si+14h]
        call    fn_97fa_s950
        mov     byte ptr [di+22h], al
        mov     al, byte ptr [si+15h]
        mov     byte ptr [di+23h], al
        mov     al, byte ptr [si+16h]
        mov     byte ptr [di+24h], al
        mov     al, byte ptr [si+17h]
        mov     byte ptr [di+25h], al
        mov     bx, 385ah
        push    si
        add     si, 22h
        push    di
        add     di, 18h
        mov     cx, 0ah
loop_973d_s950:
        lodsb
        segcs
        xlat
        stosb
        loop    loop_973d_s950
        pop     di
        pop     si
        mov     ax, word ptr [si+30h]
        add     ax, word ptr [si+5]
        sar     ax, 4
        mov     word ptr [di+2ah], ax
        mov     al, byte ptr [bp+19h]
        sub     al, 55h
        cbw
        xchg    dx, ax
        mov     al, byte ptr [si+32h]
        cbw
        add     ax, dx
        mov     cx, 0a4h
        imul    cx
        call    fn_97dd_s950
        mov     byte ptr [di+2dh], ah
        mov     al, byte ptr [si+33h]
        sub     al, 11h
        cbw
        mov     dx, ax
        mov     al, byte ptr [si+7]
        cbw
        add     ax, dx
        call    fn_97ec_s950
        mov     byte ptr [di+2ch], al
        mov     bx, 385ah
        push    si
        add     si, 3ah
        push    di
        add     di, 2eh
        mov     cx, 0ah
loop_978b_s950:
        lodsb
        segcs
        xlat
        stosb
        loop    loop_978b_s950
        pop     di
        pop     si
        mov     ax, word ptr [si+48h]
        add     ax, word ptr [si+5]
        sar     ax, 4
        mov     word ptr [di+40h], ax
        mov     al, byte ptr [bp+19h]
        sub     al, 55h
        cbw
        xchg    dx, ax
        mov     al, byte ptr [si+4ah]
        cbw
        add     ax, dx
        mov     cx, 0a4h
        imul    cx
        call    fn_97dd_s950
        mov     byte ptr [di+43h], ah
        mov     al, byte ptr [si+4bh]
        sub     al, 14h
        cbw
        mov     dx, ax
        mov     al, byte ptr [si+7]
        cbw
        add     ax, dx
        call    fn_97ec_s950
        mov     byte ptr [di+42h], al
        pop     cx
        add     si, 96h
        add     di, 46h
        dec     cx
        jcxz    br_97d9_s950
        jmp     loop_9621_s950
br_97d9_s950:
        endif
        if      FW_VERSION >= 400
        call    fn_7223
        mov     bx, 0b650h
        mov     word ptr [W_B62C], bx
        mov     word ptr [W_B630], 0
        mov     si, 1894h
        mov     word ptr [W_B62E], si
        mov     word ptr [W_B632], si
        call    fn_771a
        jmp     br_70ff
        db      90h
loop_70e1:
        mov     si, word ptr [W_B62E]
        mov     cx, word ptr [W_B632]
        sub     cx, si
        mov     di, 1894h
        mov     word ptr [W_B62E], di
        mov     word ptr [W_B632], di
        add     word ptr [W_B632], cx
        rep movsb
        call    fn_75ce
br_70ff:
        or      ax, ax
        je      br_717c
        add     ax, word ptr [W_B632]
        mov     word ptr [W_B632], ax
loop_710a:
        mov     si, word ptr [W_B62E]
        mov     ah, byte ptr [si]
        inc     si
        mov     al, byte ptr [si]
        mov     cx, word ptr [W_B630]
        shl     ax, cl
        mov     cl, 0ch
        shr     ax, cl
        neg     ax
        je      br_7129
        add     ax, 10h
        mov     dx, 0ah
        imul    dl
br_7129:
        add     ax, 4
        cmp     ax, 4
        je      br_7134
        add     ax, 0ah
br_7134:
        add     ax, word ptr [W_B630]
        sar     ax, 1
        sar     ax, 1
        sar     ax, 1
        add     ax, word ptr [W_B62E]
        cmp     word ptr [W_B632], ax
        jbe     loop_70e1
        push    ds
        mov     ax, 0b638h
        push    ax
        push    ds
        mov     ax, word ptr [W_B62E]
        push    ax
        mov     ax, word ptr [W_B630]
        push    ax
        mov     ax, 0ah
        push    ax
        call    fn_739b
        add     sp, 0ch
        mov     ax, dx
        sar     ax, 1
        sar     ax, 1
        sar     ax, 1
        add     ax, word ptr [W_B62E]
        mov     word ptr [W_B62E], ax
        and.w   dx, 7
        mov     word ptr [W_B630], dx
        call    fn_71aa
        jmp     loop_710a
br_717c:
        mov     ax, word ptr [W_B62E]
        inc     ax
        cmp     word ptr [W_B632], ax
        jbe     br_71a1
        push    ds
        mov     ax, 0b638h
        push    ax
        push    ds
        mov     ax, word ptr [W_B62E]
        push    ax
        mov     ax, word ptr [W_B630]
        push    ax
        mov     ax, 0ah
        push    ax
        call    fn_739b
        add     sp, 0ch
        call    fn_71aa
br_71a1:
        endif
        if      (FW_VERSION >= 400) || (MODEL = 950)
        pop     es
        pop     ds
        endif
        if      MODEL = 950
        popa
        ret

fn_97dd_s950:
        cmp     ah, 32h
        jl      br_97e4_s950
        mov     ah, 32h
br_97e4_s950:
        cmp     ah, 0ceh
        jge     br_97eb_s950
        mov     ah, 0ceh
br_97eb_s950:
        ret

fn_97ec_s950:
        cwd
        xor     dx, ax
        and     ax, dx
        cmp     ax, 63h
        jb      br_97f9_s950
        mov     ax, 63h
br_97f9_s950:
        ret

fn_97fa_s950:
        mul     al
        mov     cx, 24eh
        mul     cx
        xchg    dx, ax
        ret

fn_9803_s950:
        pusha
        mov     si, dx
        mov     di, dx
        mov     cx, 8ah
        add     di, cx
        push    di
        rep movsb
        pop     si
        mov     di, dx
        sub     ax, ax
        mov     cx, 3ch
        rep stosb
        mov     di, dx
        push    si
        mov     cx, 5
        add     si, 3
        rep movsw
        mov     di, dx
        pop     si
        call    fn_384a_s950
        mov     ax, word ptr [si+1ah]
        mov     word ptr [di+10h], ax
        mov     dx, word ptr [si+1ch]
        mov     word ptr [di+12h], dx
        and     byte ptr [di+10h], 0feh
        mov     al, byte ptr [si+2]
        cbw
        shl     ax, 4
        mov     word ptr [di+16h], ax
        mov     dx, 0ac44h
        cmp     byte ptr [si+1], 1
        je      br_9851_s950
        mov     dx, 5622h
br_9851_s950:
        push    si
        mov     cx, word ptr [si+14h]
        mov     si, 9867h
        neg     cx
        js      br_9889_s950
loop_985c_s950:
        lodsw
        shl     cx, 1
        jae     br_9863_s950
        mul     dx
br_9863_s950:
        jcxz    br_98c8_s950
        jmp     loop_985c_s950
        db      28h, 00h, 59h, 06h, 51h, 28h, 98h, 65h, 45h, 0a1h, 30h, 0cbh, 12h, 0e4h, 0a2h, 0f1h
        db      0b6h, 0f8h, 54h, 0fch, 29h, 0feh, 14h, 0ffh, 8ah, 0ffh, 0c5h, 0ffh, 0e2h, 0ffh, 0f1h, 0ffh
        db      0f9h, 0ffh
br_9889_s950:
        neg     cx
        cmp     dx, 0ac44h
        jne     br_989f_s950
        cmp     cx, 6dch
        jb      br_98b2_s950
        shr     cx, 4
        sub     word ptr [di+16h], cx
        jmp     br_98c8_s950
br_989f_s950:
        cmp     cx, 12dch
        jb      br_98b2_s950
        sub     cx, 0c00h
        add     dx, dx
        sub     word ptr [di+16h], 0c0h
        jmp     br_9889_s950
br_98b2_s950:
        sub     ax, ax
loop_98b4_s950:
        shl     cx, 1
        jae     br_98c2_s950
        div     word ptr [si]
        xchg    dx, ax
        shl     ax, 1
        mov     ax, 0
        adc     dx, ax
br_98c2_s950:
        endif
        if      FW_VERSION >= 400
        pop     di
        pop     si
        pop     bp
        pop     dx
        pop     cx
        pop     bx
        ret

fn_71aa:
        mov     bx, 0b638h
        mov     cx, 0ah
loop_71b0:
        mov     ax, word ptr [bx-2]
        add     ax, ax
        add     ax, word ptr [bx]
        sub     ax, word ptr [bx-4]
        test    ax, 800h
        je      br_71c5
        or      ax, 0f000h
        jmp     br_71c8
        db      90h
br_71c5:
        and     ax, 0fffh
br_71c8:
        mov     word ptr [bx], ax
        inc     bx
        inc     bx
        loop    loop_71b0
        mov     ax, word ptr [bx-2]
        mov     word ptr [W_B636], ax
        mov     ax, word ptr [bx-4]
        mov     word ptr [W_B634], ax
        mov     si, 0b638h
        mov     cx, 0ah
        mov     bx, word ptr [W_B62C]
loop_71e4:
        mov     ax, word ptr [bx+4]
        or      ax, ax
        jne     br_71ec
        ret
br_71ec:
        mov     ax, word ptr [bx+2]
        mov     es, ax
        mov     dx, word ptr [bx+6]
        mov     di, word ptr [bx+8]
loop_71f7:
        cmp     dx, di
        ja      br_7207
        mov     word ptr [bx+8], di
        add     bx, 0ah
        mov     word ptr [W_B62C], bx
        jmp     loop_71e4
br_7207:
        lodsw
        shl     ax, 1
        shl     ax, 1
        shl     ax, 1
        shl     ax, 1
        stosw
        loop    loop_71f7
        mov     word ptr [bx+8], di
        mov     cx, 14h
        mov     di, 0b638h
        push    ds
        pop     es
        xor     ax, ax
        rep stosb
        ret

fn_7223:
        mov     cx, 14h
        mov     di, 0b638h
        push    ds
        pop     es
        xor     ax, ax
        rep stosb
        mov     cx, 20h
        mov     di, 1c94h
        push    ds
        pop     es
        xor     ax, ax
        rep stosb
        mov     cx, 400h
        mov     di, 1894h
        push    ds
        pop     es
        xor     ax, ax
        rep stosb
        xor     ax, ax
        mov     word ptr [W_B634], ax
        mov     word ptr [W_B636], ax
        ret

fn_7250:
        push    ax
        xor     ax, ax
        cmp     byte ptr [B_0F40+1], al
        pop     ax
        jne     br_725d
        jmp     fn_1724
br_725d:
        call    fn_7524
        call    fn_7264
        ret

fn_7264:
        call    fn_7223
        call    fn_775a
        mov     bx, 0b650h
        mov     word ptr [W_B62C], bx
        mov     word ptr [W_B630], 0
        mov     di, 18d0h
        mov     word ptr [W_B62E], di
loop_727e:
        call    fn_72d8
        jcxz    br_72bf
        push    ds
        mov     ax, 0b638h
        push    ax
        push    ds
        mov     ax, word ptr [W_B62E]
        push    ax
        mov     ax, word ptr [W_B630]
        push    ax
        mov     ax, cx
        push    ax
        call    fn_744d
        add     sp, 0ch
        mov     ax, dx
        sar     ax, 1
        sar     ax, 1
        sar     ax, 1
        add     ax, word ptr [W_B62E]
        mov     word ptr [W_B62E], ax
        and.w   dx, 7
        mov     word ptr [W_B630], dx
        sub     ax, 1894h
        cmp     ax, 400h
        jl      loop_727e
        call    fn_7359
        jmp     loop_727e
        db      0c3h
br_72bf:
        mov     cx, word ptr [W_B62E]
        mov     ax, word ptr [W_B630]
        or      ax, ax
        je      br_72cb
        inc     cx
br_72cb:
        sub     cx, 1894h
        jcxz    br_72d4
        call    fn_779c
br_72d4:
        call    fn_788e
        ret

fn_72d8:
        mov     bx, word ptr [W_B62C]
        mov     cx, word ptr [bx+4]
        jcxz    br_7358
        mov     di, 0b638h
        mov     cx, 0ah
        push    ds
        pop     es
loop_72e9:
        mov     ax, word ptr es:[bx+4]
        or      ax, ax
        je      br_7321
        mov     ax, word ptr es:[bx+2]
        mov     ds, ax
        mov     dx, word ptr es:[bx+6]
        mov     si, word ptr es:[bx+8]
loop_72ff:
        cmp     dx, si
        ja      br_7311
        mov     word ptr es:[bx+8], si
        add     bx, 0ah
        mov     word ptr es:[0b62ch], bx
        jmp     loop_72e9
br_7311:
        lodsw
        sar     ax, 1
        sar     ax, 1
        sar     ax, 1
        sar     ax, 1
        stosw
        loop    loop_72ff
        mov     word ptr es:[bx+8], si
br_7321:
        xor     ax, ax
        rep stosw
        mov     word ptr es:[0b62ch], bx
        push    es
        pop     ds
        mov     bx, 0b64ah
        mov     ax, word ptr [bx]
        push    ax
        mov     ax, word ptr [bx-2]
        push    ax
        mov     cx, 0ah
loop_7339:
        mov     ax, word ptr [bx-2]
        add     ax, ax
        neg     ax
        add     ax, word ptr [bx]
        add     ax, word ptr [bx-4]
        and     ax, 0fffh
        mov     word ptr [bx], ax
        dec     bx
        dec     bx
        loop    loop_7339
        pop     ax
        mov     word ptr [bx-2], ax
        pop     ax
        mov     word ptr [bx], ax
        mov     cx, 0ah
br_7358:
        ret

fn_7359:
        mov     cx, 400h
        call    fn_776e
        mov     cx, 400h
        mov     di, 1894h
        push    ds
        pop     es
        xor     ax, ax
        rep stosb
        mov     cx, word ptr [W_B62E]
        sub     cx, 400h
        mov     word ptr [W_B62E], cx
        sub     cx, 1894h
        inc     cx
        mov     ax, word ptr [W_B630]
        or      ax, ax
        je      br_7383
br_7383:
        inc     cx
        mov     di, 1894h
        mov     si, 1c94h
        push    ds
        pop     es
        rep movsb
        mov     cx, 20h
        mov     di, 1c94h
        push    ds
        pop     es
        xor     ax, ax
        rep stosb
        ret

fn_739b:
        push    bp
        mov     bp, sp
        mov     es, word ptr [bp+0eh]
        mov     ds, word ptr [bp+0ah]
        mov     bx, word ptr [bp+6]
        and.w   bx, 7
        mov     si, word ptr [bp+8]
        mov     di, word ptr [bp+0ch]
        mov     dx, 4
        add     word ptr [bp+6], dx
        call    fn_7403
        or      ax, ax
        je      br_73f7
        mov     word ptr [0b610h], ax
        mov     dx, word ptr [bp+4]
        add     word ptr [bp+6], dx
        call    fn_7403
        mov     cx, 0fh
        sub     cx, dx
        shl     ax, cl
        mov     word ptr [0b60eh], ax
        mov     cx, dx
        mov     dx, 10h
        sub     dx, word ptr [0b610h]
loop_73dd:
        add     word ptr [bp+6], dx
        call    fn_7403
        shl     word ptr [0b60eh], 1
        jns     br_73eb
        neg     ax
br_73eb:
        mov     word ptr es:[di], ax
        inc     di
        inc     di
        loop    loop_73dd
loop_73f2:
        mov     dx, word ptr [bp+6]
        pop     bp
        ret
br_73f7:
        mov     cx, word ptr [bp+4]
        xor     ax, ax
loop_73fc:
        mov     word ptr es:[di], ax
        loop    loop_73fc
        jmp     loop_73f2

fn_7403:
        push    cx
        mov     cx, bx
        add     bx, dx
        and.w   bx, 7
        push    bx
        add     cx, dx
        neg     cx
        add     cx, 10h
        js      br_7436
        mov     ah, byte ptr [si]
        cmp     cl, 8
        js      br_7420
        jmp     br_7423
        db      90h
br_7420:
        inc     si
        mov     al, byte ptr [si]
br_7423:
        shr     ax, cl
loop_7425:
        pop     bx
        or      bx, bx
        jne     br_742b
        inc     si
br_742b:
        mov     cx, 10h
        sub     cx, dx
        shl     ax, cl
        shr     ax, cl
        pop     cx
        ret
br_7436:
        mov     ah, byte ptr [si]
        inc     si
        mov     al, byte ptr [si]
        inc     si
        mov     bh, byte ptr [si]
        neg     cx
        shl     ax, cl
        neg     cx
        add     cx, 10h
        shr     bx, cl
        or      ax, bx
        jmp     loop_7425

fn_744d:
        push    bp
        mov     bp, sp
        mov     es, word ptr [bp+0eh]
        mov     ds, word ptr [bp+0ah]
        mov     bx, word ptr [bp+0ch]
        mov     cx, word ptr [bp+4]
        mov     ax, 10h
        mov     word ptr [0b610h], ax
        xor     ax, ax
        mov     word ptr [0b60eh], ax
loop_7467:
        mov     ax, word ptr es:[bx]
        shl     word ptr [0b60eh], 1
        test    ax, 800h
        je      br_747f
        or      ax, 0f000h
        neg     ax
        mov     word ptr es:[bx], ax
        inc     word ptr [0b60eh]
br_747f:
        xor     dx, dx
        or      ax, ax
        je      br_7494
loop_7485:
        inc     dx
        shl     ax, 1
        jns     loop_7485
        cmp     dx, word ptr [0b610h]
        jge     br_7494
        mov     word ptr [0b610h], dx
br_7494:
        inc     bx
        inc     bx
        loop    loop_7467
        mov     bx, word ptr [bp+6]
        and.w   bx, 7
        mov     si, word ptr [bp+0ch]
        mov     di, word ptr [bp+8]
        mov     ax, word ptr [W_B610]
        and     ax, 0fh
        mov     dx, 4
        add     word ptr [bp+6], dx
        call    fn_74e8
        or      ax, ax
        je      br_74e3
        mov     ax, word ptr [W_B60E]
        mov     dx, word ptr [bp+4]
        add     word ptr [bp+6], dx
        call    fn_74e8
        mov     ax, word ptr [W_B610]
        neg     ax
        add     ax, 10h
        mov     word ptr [W_B610], ax
        mov     cx, word ptr [bp+4]
loop_74d2:
        mov     ax, word ptr es:[si]
        endif
        if      (FW_VERSION >= 400) || (MODEL = 950)
        inc     si
        inc     si
        endif
        if      MODEL = 950
        jcxz    br_98c8_s950
        jmp     loop_98b4_s950
br_98c8_s950:
        mov     word ptr [di+14h], dx
        pop     si
        mov     ax, word ptr [si+22h]
        mov     word ptr [di+1ch], ax
        mov     dx, word ptr [si+24h]
        mov     word ptr [di+1eh], dx
        mov     ax, word ptr [si+1eh]
        mov     word ptr [di+20h], ax
        mov     dx, word ptr [si+20h]
        mov     word ptr [di+22h], dx
        mov     byte ptr [di+1ah], 4fh
        cmp     byte ptr [si+10h], cl
        je      br_98fd_s950
        mov     byte ptr [di+1ah], 4ch
        mov     ax, word ptr [si+26h]
        mov     word ptr [di+1ch], ax
        mov     dx, word ptr [si+28h]
        mov     word ptr [di+1eh], dx
br_98fd_s950:
        mov     ax, word ptr [si+2ch]
        mov     dx, word ptr [si+2eh]
        shl     word ptr [si+2ah], 1
        adc     ax, cx
        adc     dx, cx
        mov     word ptr [di+24h], ax
        mov     word ptr [di+26h], dx
        mov     byte ptr [di+2bh], 4eh
        popa
        ret
br_9916_s950:
        sub     cx, cx
        mov     word ptr [W_95E4], cx
        mov     bp, 96h
        mov     word ptr [W_7CD4], bp
        endif
        if      FW_VERSION >= 400
        mov     dx, word ptr [W_B610]
        add     word ptr [bp+6], dx
        call    fn_74e8
        loop    loop_74d2
br_74e3:
        mov     dx, word ptr [bp+6]
        pop     bp
        ret

fn_74e8:
        push    cx
        mov     cx, bx
        add     bx, dx
        and.w   bx, 7
        push    bx
loop_74f2:
        add     cx, dx
        neg     cx
        add     cx, 10h
        js      br_750f
        shl     ax, cl
        or      byte ptr [di], ah
        cmp     cl, 8
        jns     br_7507
        inc     di
        mov     byte ptr [di], al
br_7507:
        pop     bx
        or      bx, bx
        jne     br_750d
        inc     di
br_750d:
        pop     cx
        ret
br_750f:
        mov     bx, ax
        neg     cx
        shr     ax, cl
        or      byte ptr [di], ah
        inc     di
        mov     byte ptr [di], al
        inc     di
        mov     ax, bx
        mov     dx, cx
        mov     cx, 0
        jmp     loop_74f2

fn_7524:
        xor     ax, ax
        mov     word ptr [W_B62A], ax
        mov     cx, 8
        mov     di, 0b622h
        rep stosb
        mov     ax, 7ffeh
        mov     di, 0b612h
        mov     cx, 8
loop_753a:
        stosw
        add     ax, 800h
        loop    loop_753a
        mov     ax, word ptr [bx+36h]
        mov     word ptr [W_95CE], ax
        mov     word ptr [W_95DC], ax
        mov     ax, word ptr [bx+38h]
        mov     word ptr [W_95D0], ax
        or      ax, 8
        mov     word ptr [W_95DE], ax
        endif
        if      (FW_VERSION >= 400) || (MODEL = 950)
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        endif
        if      MODEL = 950
        shl     ax, 1
        rcl     dx, 1
        mov     word ptr [W_95D8], ax
        mov     word ptr [W_95DA], dx
        mov     ax, word ptr [W_95EE]
        sub     ax, bp
loop_9939_s950:
        cmp     word ptr [W_95DA], cx
        jne     br_994f_s950
        cmp     ax, word ptr [W_95D8]
        jb      br_994f_s950
        mov     ax, word ptr [W_95D8]
        mov     word ptr [W_95D6], ax
        jmp     word ptr [W_95C2]
br_994f_s950:
        mov     word ptr [W_95D6], ax
        call    word ptr [W_95C2]
        call    word ptr [W_95F0]
        sub     cx, cx
        mov     word ptr [W_7CD4], cx
        mov     ax, word ptr [W_95D6]
        add     word ptr [W_95CE], ax
        adc     word ptr [W_95D0], cx
        sub     word ptr [W_95D8], ax
        sbb     word ptr [W_95DA], cx
        mov     ax, word ptr [W_95EE]
        jmp     loop_9939_s950
        endif
        if      FW_VERSION >= 400
        push    ax
        push    dx
        mov     bp, 0ff00h
        mov     bx, 0b650h
        mov     si, W_95CE
        call    fn_7595
        pop     dx
        pop     ax
        mov     si, W_95DC
        add     bx, 0ah
        call    fn_7595
        add     bx, 0ah
        mov     word ptr [bx+4], 0
        mov     word ptr [W_B64C], 0
        mov     word ptr [W_B64C], 0
        mov     di, 0b64ch
        mov     si, word ptr [W_95C0]
        add     si, 11h
        movsw
        movsb
        ret

fn_7595:
        push    si
loop_7596:
        mov     word ptr [bx+4], bp
        mov     word ptr [bx+8], 0
        mov     di, bx
        push    ax
        call    fn_1841
        pop     ax
        or      dx, dx
        je      br_75be
        mov     word ptr [bx+6], bp
        sub     ax, bp
        sbb     dx, 0
        add     bx, 0ah
        pop     si
        push    si
        add     word ptr [si], bp
        adc     word ptr [si+2], 0
        jmp     loop_7596
br_75be:
        mov     word ptr [bx+6], ax
        pop     si
        ret

fn_75c3:
        push    si
        mov     si, word ptr [W_95C0]
        cmp     byte ptr [si+16h], 0
        pop     si
        ret

fn_75ce:
        mov     ax, word ptr [W_B64C]
        or      ax, ax
        jne     br_75dc
        mov     ax, word ptr [W_B64E]
        or      ax, ax
        je      br_75e6
br_75dc:
        call    fn_75e7
        or      ax, ax
        jne     br_75e6
        call    fn_763a
br_75e6:
        ret

fn_75e7:
        xor     ax, ax
        mov     es, ax
        inc     al
        mov     di, 0b622h
        mov     cx, 8
        repne scasb
        jne     br_7637
        dec     di
        mov     byte ptr [di], ah
        mov     ax, di
        sub     ax, 0b622h
        shl     ax, 1
        add     ax, 0b612h
        mov     si, ax
        mov     si, word ptr [si]
        inc     si
        mov     di, word ptr [W_B632]
        mov     ax, 8000h
        mov     ds, ax
        mov     cx, 400h
loop_7615:
        movsb
        inc     si
        loop    loop_7615
        xor     dx, dx
        mov     ds, dx
        mov     ax, 400h
        sub     word ptr [W_B64C], ax
        sbb     word ptr [W_B64E], dx
        jae     br_7636
        add     ax, word ptr [W_B64C]
        mov     word ptr [W_B64C], dx
        mov     word ptr [W_B64E], dx
br_7636:
        ret
br_7637:
        xor     ax, ax
        ret

fn_763a:
        call    fn_770c
        xor     ax, ax
        mov     word ptr [W_95D6], ax
        mov     word ptr [W_95E4], ax
        mov     word ptr [W_02D0], ax
        mov     word ptr [W_7CD4], 400h
        mov     ax, word ptr [W_B632]
        mov     word ptr [FP_02CE], ax
        mov     ax, 4452h
        call    disk_catalog_scan
        mov     ax, 400h
        xor     dx, dx
        sub     word ptr [W_B64C], ax
        sbb     word ptr [W_B64E], dx
        jae     br_7676
        add     ax, word ptr [W_B64C]
        mov     word ptr [W_B64C], dx
        mov     word ptr [W_B64E], dx
        ret
br_7676:
        push    ax
        push    word ptr [W_B64C]
        push    word ptr [W_B64E]
        mov     cx, 8
        mov     bx, 0b612h
        mov     di, 0b622h
        xor     ax, ax
        mov     word ptr [W_95D6], ax
        mov     word ptr [W_7CD4], ax
        mov     word ptr [FP_02CE], ax
        mov     word ptr [W_02D0], ax
loop_7696:
        call    fn_76a9
        or      ax, ax
        je      br_769f
        loop    loop_7696
br_769f:
        pop     word ptr [W_B64E]
        pop     word ptr [W_B64C]
        pop     ax
        ret

fn_76a9:
        mov     ax, word ptr [W_B64C]
        or      ax, ax
        jne     br_76b7
        mov     ax, word ptr [W_B64E]
        or      ax, ax
        je      br_770b
br_76b7:
        push    cx
        push    di
        push    bx
        call    fn_770c
        xor     ax, ax
        mov     word ptr [W_95D6], ax
        mov     word ptr [W_7CD4], ax
        mov     word ptr [FP_02CE], ax
        mov     word ptr [W_02D0], ax
        mov     word ptr [W_95E4], 400h
        mov     word ptr [W_95E2], 8000h
        mov     ax, word ptr [bx]
        mov     word ptr [FP_95E0], ax
        mov     ax, 5352h
        call    disk_catalog_scan
        xor     ax, ax
        mov     ds, ax
        mov     es, ax
        pop     bx
        pop     di
        pop     cx
        mov     al, 1
        stosb
        inc     bx
        inc     bx
        mov     ax, 400h
        xor     dx, dx
        sub     word ptr [W_B64C], ax
        sbb     word ptr [W_B64E], dx
        jae     br_770b
        add     ax, word ptr [W_B64C]
        mov     word ptr [W_B64C], dx
        mov     word ptr [W_B64E], dx
br_770b:
        ret

fn_770c:
        mov     si, word ptr [W_95EA]
        shl     si, 1
        mov     ax, word ptr [si+TBL_8EFE]
        mov     word ptr [W_95EA], ax
        ret

fn_771a:
        mov     ax, 3ch
        sub     word ptr [W_B64C], ax
        sbb     word ptr [W_B64E], 0
        mov     ax, word ptr [W_B64C]
        or      ax, ax
        jne     br_7734
        mov     ax, word ptr [W_B64E]
        or      ax, ax
        je      br_7759
br_7734:
        mov     cx, 3c4h
        mov     ax, cx
        mov     di, 1894h
        mov     si, P_7D2A
        rep movsb
        xor     dx, dx
        sub     word ptr [W_B64C], ax
        sbb     word ptr [W_B64E], dx
        jae     br_7759
        add     ax, word ptr [W_B64C]
        mov     word ptr [W_B64C], dx
        mov     word ptr [W_B64E], dx
br_7759:
        ret

fn_775a:
        xor     ax, ax
        mov     word ptr [W_B64C], ax
        mov     word ptr [W_B64E], ax
        mov     cx, 3ch
        mov     di, 1894h
        mov     si, W_7CEE
        rep movsb
        ret

fn_776e:
        add     word ptr [W_B64C], cx
        adc     word ptr [W_B64E], 0
        cmp     word ptr [W_95C4], 0
        je      br_7793
        dec     word ptr [W_95C4]
        call    fn_77ba
        or      ax, ax
        jne     br_7792
        call    fn_77e6
        mov     word ptr [W_B62A], 0
br_7792:
        ret
br_7793:
        mov     ax, 3f46h
        call    disk_catalog_scan
        jmp     loop_06ff

fn_779c:
        add     word ptr [W_B64C], cx
        adc     word ptr [W_B64E], 0
        cmp     word ptr [W_95C4], 0
        je      br_7793
        dec     word ptr [W_95C4]
        call    fn_77e6
        mov     word ptr [W_B62A], 0
        ret

fn_77ba:
        mov     ax, word ptr [W_B62A]
        cmp     ax, 8
        jge     br_77e3
        mov     di, ax
        add     di, ax
        add     di, 0b612h
        mov     di, word ptr [di]
        inc     di
        inc     ax
        mov     word ptr [W_B62A], ax
        mov     si, 1894h
        mov     ax, 8000h
        mov     es, ax
loop_77d9:
        movsb
        inc     di
        loop    loop_77d9
        xor     ax, ax
        mov     es, ax
        inc     ax
        ret
br_77e3:
        xor     ax, ax
        ret

fn_77e6:
        mov     cx, word ptr [W_B62A]
        jcxz    br_7804
        mov     bx, 0b612h
        xor     ax, ax
        mov     word ptr [W_95D6], ax
        mov     word ptr [W_7CD4], ax
        mov     word ptr [FP_02CE], ax
        mov     word ptr [W_02D0], ax
loop_77fd:
        call    fn_7843
        inc     bx
        inc     bx
        loop    loop_77fd
br_7804:
        xor     ax, ax
        mov     word ptr [W_95D6], ax
        mov     word ptr [W_95E4], ax
        mov     word ptr [W_02D0], ax
        mov     word ptr [W_7CD4], 400h
        mov     word ptr [FP_02CE], 1894h
        mov     ax, 4457h
        call    disk_catalog_scan
        mov     di, word ptr [W_95EA]
        mov     dx, di
        shl     di, 1
        mov     word ptr [di+TBL_8EFE], dx
        mov     word ptr [W_95EC], dx
        call    fn_0e5c
        mov     dx, word ptr [W_95EA]
        mov     di, word ptr [W_95EC]
        shl     di, 1
        mov     word ptr [di+TBL_8EFE], dx
        ret

fn_7843:
        push    bx
        push    cx
        xor     ax, ax
        mov     word ptr [W_95D6], ax
        mov     word ptr [W_7CD4], ax
        mov     word ptr [W_02D0], ax
        mov     word ptr [FP_02CE], ax
        mov     word ptr [W_95E4], 400h
        mov     word ptr [W_95E2], 8000h
        mov     ax, word ptr [bx]
        mov     word ptr [FP_95E0], ax
        mov     ax, 5357h
        call    disk_catalog_scan
        mov     di, word ptr [W_95EA]
        mov     dx, di
        shl     di, 1
        mov     word ptr [di+TBL_8EFE], dx
        mov     word ptr [W_95EC], dx
        call    fn_0e5c
        mov     dx, word ptr [W_95EA]
        mov     di, word ptr [W_95EC]
        shl     di, 1
        mov     word ptr [di+TBL_8EFE], dx
        pop     cx
        pop     bx
        ret

fn_788e:
        mov     di, word ptr [W_95C0]
        push    bx
        push    ax
        push    dx
        push    cx
        mov     bx, W_7CEE
        mov     ax, word ptr [bx+10h]
        mov     dx, word ptr [bx+12h]
        mov     cl, 2
        mov     al, ah
        mov     ah, dl
        mov     dx, ax
        shr     dx, 1
        add     ax, dx
        add     ax, 3
        shr     ax, cl
        cmp     ax, 1
        jns     br_78b8
        mov     ax, 1
br_78b8:
        mov     word ptr [di+16h], ax
        pop     cx
        pop     dx
        pop     ax
        pop     bx
        add     di, 11h
        mov     si, 0b64ch
        movsw
        movsb
        mov     di, word ptr [W_95EC]
        shl     di, 1
        mov     word ptr [di+TBL_8EFE], 8000h
        mov     ax, 5744h
        call    disk_catalog_scan
        ret
        db      "January 14, 1988"
        endif
KEY_MAP:
        db      97h, 94h, 96h, 95h, 93h, 92h, 91h, 90h, 09h, 08h
        db      "987$$$"
        db      10h, 11h
        db      "654$$$"
        db      0ah
        db      " 321$$$"
        db      0fh, 0dh, 2dh, 2bh, 30h, 0ffh, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 0ffh, 0eh, 0eh
        db      0eh, 04h, 04h, 04h, 04h, 0ffh, 07h, 07h, 07h, 07h, 07h, 07h, 07h, 0ffh, 1eh, 1eh
        db      1eh, 1ch, 1ch, 1ch, 1ch, 0ffh, 1ch, 1ch, 1ch, 1ch, 1ch, 1ch, 1ch, 0ffh, 0fh, 0fh
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      0fh, 07h, 07h, 07h, 07h, 08h, 08h, 0ah, 0dh, 09h, 0ah, 0ch, 08h
        else
        db      0fh, 07h, 07h, 07h, 07h, 08h, 08h, 0ah, 0dh, 09h, 0ah, 0ch, 08h, 90h
TBL_7948:
        db      0e8h, 0fdh
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
semitone_ratio_table:
        RUN_AFTER_SEMITONE_RATIO_TABLE
        db      05h, 05h, 05h, 05h
        if      MODEL = 950
        db      05h, 04h                        ; two more, for midi_note_trigger's 0AAh clamp
        endif
        db      90h, 0e8h, 03h, 62h, 03h, 0eeh, 02h, 89h, 02h, 32h, 02h, 0e7h
        db      01h, 0a6h, 01h, 6dh, 01h, 3ch, 01h, 12h, 01h, 0edh, 00h, 0cdh, 00h, 0b2h, 00h, 9ah
        db      00h, 85h, 00h, 73h, 00h, 64h, 00h, 57h, 00h, 4bh, 00h, 41h, 00h, 38h, 00h, 31h
        db      00h, 2ah, 00h, 25h, 00h, 20h, 00h, 1bh, 00h, 18h, 00h, 15h, 00h, 12h, 00h, 0fh
        db      00h, 0dh, 00h, 0ch, 00h, 0ah, 00h, 09h, 00h, 07h, 00h, 06h, 00h, 06h, 00h, 05h
        db      00h, 04h, 00h, 04h, 00h, 03h, 00h, 03h, 00h, 02h, 00h, 02h, 00h, 02h, 00h, 02h
        db      00h, 01h, 00h, 01h, 00h, 01h, 00h, 01h, 00h
sine_lfo_table:
        RUN_P_7A78
        endif
ERR_TOO_MANY_SAMPLES_IN:
        db      "OOPS! Too many samples in memory."
        db      0aeh, 0feh
ERR_BAD_DATA_FROM_DISK:
        db      "OOPS! Bad data from disk."
        db      0b6h, 0feh
ERR_DISK_DIRECTORY_FULL_ERASE:
        db      "OOPS! Disk directory is full. Erase     somethin"
        db      "g."
        db      9dh, 0feh
ERR_DISK_NOT_MOUNTED:
        db      "OOPS! Disk not mounted."
        db      0b8h, 0feh
ERR_DISK_SAMPLE_SPACE_FULL:
        db      "OOPS! Disk sample space is full."
        db      0afh, 0feh
ERR_DISK_UNPREPARED_YOU_MUST:
        db      "OOPS! Disk is unprepared. you must            FO"
        db      "RMAT it."
        db      97h, 0feh
ERR_DISK_WRITE_PROTECTED_TAKE:
        db      "OOPS! Disk is write-protected. Take it  out and "
        db      "close the switch in the corner.."
        db      0feh
        if      FW_VERSION < 400
MSG_ENOUGH_ALREADY:
        endif
        db      "ENOUGH ALREADY! "
        db      0bfh, 0feh
ERR_MEMORY_SAMPLE_SPACE_FULL:
        db      "OOPS! Memory sample space is full."
        db      0adh, 0feh
ERR_MEMORY_SPACE_FOR_PROGRAMS:
        db      "OOPS! Memory space for programs/samples//keygrou"
        db      "ps is full. Erase something."
        if      MODEL = 950
        db      83h, 0feh, 0ffh
        else
        db      83h, 0feh
B_7C55:
        db      0ffh
        endif
LCD_CURSOR_MODE:
        if      FW_VERSION < 210
        db      0ch
B_7C57:
        db      40h
KEY_MATRIX_LAST:
        db      0ffh
PANEL_LAMPS:
        db      0ffh
        else
        db      0dh
B_7C57:
        db      00h
KEY_MATRIX_LAST:
        db      21h
PANEL_LAMPS:
        db      0bfh
        endif
P_7C5A:
        db      "Monitor   "
MIDI_SETTINGS:
        db      "DEFAULT PR      "
B_7C74:
        db      00h, 00h, 00h, 00h, 01h, 00h, 3ch, 00h, 40h, 00h, 00h
MIDI_BASIC_CHANNEL:
        db      80h
B_7C80:
        if      MODEL = 950
        db      00h, 01h
        else
        db      00h
CONTROL_BY:
        db      01h
        endif
B_7C82:
        db      3ch, 0f7h, 50h, 46h, 1ch
B_7C87:
        db      07h
P_7C88:
        db      0c0h, 03h, 00h, 00h
        if      (FW_VERSION >= 210) || (MODEL = 950)
P_7C8C:
        db      7fh, 18h, 80h, 00h, 50h, 63h, 1eh, 0ah, 32h, 00h, 00h, 1eh, 00h, 00h, 63h, 40h
        db      2ah, 00h, 04h, 0ffh, 00h, 00h, 32h, 00h
        db      "TONE      "
        db      14h, 14h, 14h, 14h, 40h, 00h, 00h, 00h, 00h, 00h, 63h, 00h
        db      "2 SAMPLE  "
        db      10 dup (0)
        db      63h, 00h, 00h, 00h
        endif
B_7CD2:
        if      MODEL = 950
W_7CD4  equ     $+2
        db      14h, 90h, 00h, 04h
CUR_PROGRAM:
        db      38h, 0c4h
W_7CD8:
        db      38h, 0c4h
IDLE_HOOK:
        db      0a7h, 11h
        else
        db      14h, 90h
W_7CD4:
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      00h, 04h
CUR_PROGRAM:
        db      4ah, 0abh
W_7CD8:
        db      4ah, 0abh
IDLE_HOOK:
        db      3ah, 10h
        endif
        if      FW_VERSION = 210
        db      1ch, 13h
CUR_PROGRAM:
        db      9eh, 0aah
W_7CD8:
        db      9eh, 0aah
        endif
        if      FW_VERSION >= 400
        db      00h, 28h
CUR_PROGRAM:
        db      0cah, 0a0h
W_7CD8:
        db      0cah, 0a0h
        endif
        if      FW_VERSION >= 210
IDLE_HOOK:
        dw      idle_tasks
        endif
W_7CDC:
        db      0ffh, 00h
        if      MODEL = 950
MIDI_RX_TAIL:
        db      5ch, 0fah
MIDI_RX_HEAD:
        db      5ch, 0fah
LCD_SCROLL_MAX:
        db      0d8h, 00h
LCD_ROW1:
        db      7ah, 0a9h
LCD_ROW2:
        db      82h, 0aah
LCD_SCROLL:
        db      0ffh, 0ffh
W_7CEE:
        db      00h, 04h, 05h, 06h, 07h, 04h, 05h, 06h, 07h, 0a1h, 0a1h, 0a1h, 0a1h, 0c1h, 0c1h, 0c1h
        else
TX_TAIL:
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      56h, 0bdh
TX_HEAD:
        db      56h, 0bdh
MIDI_RX_TAIL:
        db      96h, 0bdh
MIDI_RX_HEAD:
        db      96h, 0bdh
LCD_SCROLL_MAX:
        db      0d8h, 00h
LCD_ROW1:
        db      0aeh, 0a8h
LCD_ROW2:
        db      0b6h, 0a9h
LCD_SCROLL:
        db      0ffh, 0ffh
        endif
        if      FW_VERSION = 210
        db      0aah, 0bch
TX_HEAD:
        db      0aah, 0bch
MIDI_RX_TAIL:
        db      0eah, 0bch
MIDI_RX_HEAD:
        db      0eah, 0bch
        endif
        if      FW_VERSION >= 400
        db      0d6h, 0b2h
TX_HEAD:
        db      0d6h, 0b2h
MIDI_RX_TAIL:
        db      16h, 0b3h
MIDI_RX_HEAD:
        db      16h, 0b3h
        endif
        if      FW_VERSION >= 210
LCD_SCROLL_MAX:
        db      0ffh, 00h
LCD_ROW1:
        endif
        if      FW_VERSION = 210
        db      04h, 1fh
LCD_ROW2:
        db      2ch, 1fh
        endif
        if      FW_VERSION >= 400
        db      0c6h, 03h
LCD_ROW2:
        db      0eeh, 03h
        endif
        if      FW_VERSION >= 210
LCD_SCROLL:
        db      00h, 00h
        endif
        if      MODEL = 900
W_7CEE:
        db      00h
        endif
        if      FW_VERSION = 210
P_801C:
        db      04h, 05h, 06h, 07h, 04h, 05h, 06h, 07h, 0a1h, 0a1h, 0a1h, 0a1h, 0c1h, 0c1h, 0c1h
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
W_7CFE:
        db      0c1h, 00h
W_7D00:
        db      00h, 00h, 00h, 00h, 00h
B_7D05:
        db      00h, 00h, 00h, 01h, 02h, 03h, 00h, 01h, 02h, 03h, 01h, 02h, 04h, 08h, 01h, 02h
        db      04h, 08h, 10h, 12h, 14h, 18h, 1ah, 1ch, 20h, 22h, 00h, 01h, 02h, 03h, 04h
W_7D24:
        db      05h, 06h
W_7D26:
        endif
        if      MODEL = 950
        db      07h
        db      "`abcdefg(*,0248:"
        endif
        if      FW_VERSION = 210
        db      07h, 60h, 61h, 62h
P_7D2A:
        db      "cdefg(*,0248:"
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        db      01h, 02h, 04h, 08h, 10h, 20h, 40h, 80h, 16h, 16h, 16h, 1eh, 1eh, 1eh
        db      "&&6v"
        db      0b6h, 36h, 76h, 0b6h, 36h, 76h
        endif
br_7cef:
        xor     ax, ax
        mov     ds, ax
        mov     es, ax
        mov     ss, ax
        mov     sp, VOICES
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        cld
        if      MODEL = 950
        call    fn_3521_s950
        mov     al, 0
        else
L_7CFB:
        mov     word ptr [2], ax
        endif
        if      FW_VERSION >= 400
W_7CFE:
        endif
        if      MODEL = 900
L_7CFE:
        mov     word ptr [0], isr_divide_error
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
B_7D05:
        endif
        if      MODEL = 900
L_7D04:
        mov     al, 8
        endif
        out     8, al
        if      FW_VERSION < 400
        mov     di, P_8148
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      FW_VERSION >= 400
        mov     di, SYSEX_CHECKSUM
        mov     ax, 1ce3h
        sub     ax, DISK_LAST_FIELD
        add     ax, di
        mov     di, ax
        endif
        xor     cx, cx
        sub     cx, di
        xor     ax, ax
        rep stosb
        if      MODEL = 900
        mov     dx, 0f000h
loop_7d20:
        xchg    dx, ax
        mov     es, ax
        xchg    dx, ax
        endif
        if      FW_VERSION >= 400
W_7D24:
        endif
        if      MODEL = 900
        mov     cx, 8000h
        rep stosw
L_7D29:
        sub     dx, 1000h
L_7D2D:
        jne     loop_7d20
        mov     es, ax
        endif
        if      FW_VERSION >= 400
        call    fn_1ce6
        mov     di, P_8148
        xor     cx, cx
        sub     cx, di
        xor     ax, ax
        rep stosb
        endif
        mov     al, 2
        out     80h, al
        mov     ax, 90h
        out     88h, ax
        mov     al, 1
        out     81h, al
        mov     al, 59h
        out     8ah, al
        if      MODEL = 950
        mov     ax, 7fffh
        else
        mov     ax, 0ffh
        endif
        out     82h, ax
        xor     ax, ax
        out     84h, ax
        out     86h, al
        mov     al, 0dh
        out     8fh, al
        mov     al, 2
        out     81h, al
        mov     al, 0c0h
        out     8ah, al
        mov     al, 3
        out     81h, al
        mov     al, 0c0h
        out     8ah, al
        mov     al, 2
        out     0a0h, al
        out     0c0h, al
        mov     ax, 150h
        out     0a8h, ax
        out     0c8h, ax
        mov     dx, 78h
        mov     cx, 8
        mov     al, 0
loop_7d84:
        out     dx, al
        inc     dh
        loop    loop_7d84
        mov     si, P_7F96
        if      MODEL = 950
        mov     cx, 3fh
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        if      MODEL = 900
        mov     cx, 43h
        endif
        nop
        mov     dh, 0
loop_7d92:
        lodsw
        mov     dl, al
        mov     al, ah
        out     dx, al
        loop    loop_7d92
        mov     ah, 38h
        call    lcd_command
        mov     ah, 1
        call    lcd_command
        mov     ah, 2
        call    lcd_command
        mov     ah, 6
        call    lcd_command
        mov     ah, 0ch
        call    lcd_command
        mov     ah, 80h
        call    lcd_command
        mov     si, P_807C
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        call    fn_2d65
        if      MODEL = 950
sample_ram_size_probe:
        mov     bx, 0
loop_9e7b_s950:
        add     bx, 10h
        mov     dx, 1c4h
        mov     al, bl
        out     dx, al
        mov     ax, 2000h
        mov     es, ax
        mov     cx, 1f4h
        mov     di, 0
loop_9e8f_s950:
        inc     di
        mov     ax, cx
        stosb
        loop    loop_9e8f_s950
        mov     cx, 1f4h
        mov     di, 0
loop_9e9b_s950:
        inc     di
        mov     ax, cx
        scasb
        loope   loop_9e9b_s950
        je      loop_9e7b_s950
        mov     word ptr [W_B4A2_S950], bx
        mov     bx, 1
loop_9eaa_s950:
        mov     dx, 1c4h
        mov     al, bl
        out     dx, al
        sub     ax, ax
        mov     di, ax
        mov     cx, 8000h
        rep stosw
        inc     bx
        cmp     bx, word ptr [W_B4A2_S950]
        jne     loop_9eaa_s950
        mov     es, ax
        mov     ax, 20h
        mul     word ptr [W_B4A2_S950]
        mov     bp, 0a002h
        call    put_field_value
        endif
        mov     ax, 4b50h
        mov     word ptr [W_9E4A], ax
        mov     word ptr [SLOT_TAGS], ax
        mov     byte ptr [B_9E4E], 53h
        nop
        mov     si, P_7F70
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        mov     di, P_A03E
        nop
        else
        mov     di, P_A03E
        endif
        mov     bx, di
        mov     cx, 46h
        rep movsb
        mov     word ptr [bx+12h], di
        mov     si, P_7C8C
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     cx, 46h
        rep movsb
        mov     si, P_7F70
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     bx, di
        mov     cx, 46h
        rep movsb
        mov     word ptr [bx+12h], di
        mov     si, P_7C8C
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     cx, 46h
        rep movsb
        mov     si, P_5932
        mov     bx, di
        mov     cx, 46h
        rep movsb
        if      MODEL = 950
        mov     word ptr [bx+36h], 8000h
        mov     word ptr [bx+38h], 1
        else
        mov     word ptr [bx+36h], 0c000h
        mov     word ptr [bx+38h], 0
        endif
        call    fn_0043
        mov     di, P_A03E
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     si, P_7C5A
        mov     cx, 5
        rep movsw
        call    program_sample_name_xref_resolve
        call    thk_program_sample_tag_scan
        mov     si, 23b7h
        mov     bx, 0
        mov     bp, 7fa6h
        if      MODEL = 950
        mov     ax, 1800h
        push    es
        mov     es, ax
        mov     cx, 708h
        else
        mov     byte ptr [W_7CEE], 2
        mov     ax, 0c00h
loop_7e33:
        mov     es, ax
        mov     cx, 384h
        endif
        xor     di, di
loop_7e3a:
        mov     ax, bp
        imul    si
        add     bx, dx
        mov     ax, bx
        stosw
        imul    si
        sub     bp, dx
        loop    loop_7e3a
        if      MODEL = 950
        pop     es
        mov     si, 9d7bh
        else
        mov     ax, 8c00h
        dec     byte ptr [W_7CEE]
        jne     loop_7e33
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        xor     ax, ax
        mov     es, ax
        mov     si, 7ed1h
        nop
        endif
        if      FW_VERSION < 210
        mov     dx, 0ch
        mov     di, 0
        else
        xchg    cx, ax
        endif
        if      FW_VERSION = 210
        mov     word ptr [W_2968_OS21+6], ax
        endif
        if      FW_VERSION >= 400
        mov     word ptr [W_0EC8], 8f30h
        mov     word ptr [W_0ECA], ax
        endif
        if      FW_VERSION >= 210
        mov     byte ptr [B_4403], al
        mov     es, ax
        mov     si, P_801C
        mov     dx, 0ch
        xchg    di, ax
        endif
loop_7e68:
        mov     bp, VOICES
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
        endif
        mov     cx, 8
loop_7e6e:
        lodsb
        mov     byte ptr [bp+di+VC(2bh)], al
        add     bp, VOICE_SIZE
        loop    loop_7e6e
        inc     di
        dec     dx
        jne     loop_7e68
        if      MODEL = 900
        mov     cx, 64h
        mov     dx, 140h
loop_7e81:
        mov     ax, cx
        out     40h, al
        ror     ax, 1
        in      al, dx
        xor     al, ah
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        js      br_7d81_v12a
        endif
        if      FW_VERSION >= 210
        js      br_7ed8
        endif
        if      MODEL = 900
        loop    loop_7e81
        dec     byte ptr [B_4403]
        mov     ax, 3040h
        mov     dx, 1040h
        endif
        mov     bl, 0
        mov     di, P_9F4E
        if      (MODEL = 900) && (FW_VERSION < 210)
        nop
loop_7e9d:
        mov     si, 7dc1h
        nop
        else
loop_7e9d:
        mov     si, P_7F52
        endif
        if      MODEL = 900
        mov     word ptr [si+1ch], ax
        add     ax, 100h
        mov     word ptr [si+1ah], dx
        or      dx, 100h
        out     dx, al
        add     dx, 100h
        endif
        mov     byte ptr [si], bl
        mov     cx, 1eh
        rep movsb
        inc     bl
        cmp     bl, 8
        jne     loop_7e9d
        if      MODEL = 950
        call    voice_reset_all
        mov     si, 9fbeh
        mov     di, 0fdh
        movsw
        movsb
        mov     si, MSG_OS_NAME
        else
        mov     word ptr [DRUM_INPUTS_ON], cx
        mov     dx, 3040h
        out     dx, al
        mov     dx, 2040h
        out     dx, al
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        jmp     br_7d87_v12a
br_7d81_v12a:
        mov     word ptr [W_34F0_V12A+2], 0
br_7d87_v12a:
        mov     si, 7da0h
        nop
        endif
        if      FW_VERSION = 210
        mov     word ptr [W_2968_OS21+6], P_8F21
        endif
        if      FW_VERSION >= 400
        mov     word ptr [W_0EC8], P_8F21
        mov     word ptr [W_0ECA], 0f4bh
        endif
        if      FW_VERSION >= 210
br_7ed8:
        mov     si, MSG_BANNER
        endif
        if      MODEL = 900
        mov     ax, word ptr [si+1bh]
        mov     word ptr [W_1DE1], ax
        mov     al, byte ptr [si+1dh]
        mov     byte ptr [B_1DE3], al
        endif
        mov     dx, 1
        call    lcd_print
        if      MODEL = 950
        mov     word ptr [W_95B0], 7
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        jmp     loop_2a0f
        db      "         AKAI S900 VERSION 1,2 "
        db      0b1h, 0feh, 00h, 00h, 3ch, 32h, 14h, 44h, 00h, 00h, 00h, 00h, 00h, 00h, 0ch, 00h
        db      78h, 00h, 50h, 00h, 21h
        else
        mov     word ptr [W_95B0], 1eh
        endif
        if      (FW_VERSION >= 210) || (MODEL = 950)
loop_7ef3:
        call    timer_poll
        jne     loop_7ef3
        mov     word ptr [PROGRAM_LAST_FIELD], FLD_SOFT_SAMPLE_1
        endif
        if      MODEL = 950
        jmp     loop_0de4_s950
MSG_OS_NAME:
        endif
        if      (MODEL = 950) && (FW_VERSION = 100)
        db      "   AKAI S950 1.0  xxxx Kwords installed         "
        endif
        if      (MODEL = 950) && (FW_VERSION = 120)
        db      "   AKAI S950 1.2  xxxx Kwords installed         "
        endif
        if      MODEL = 950
        db      "   AKAI professional            "
        db      0feh, 0b1h, 9fh, 63h, 13h, 17h, 04h, 00h, 00h, 00h, 10h, 27h, 00h, 00h, 00h, 7dh
P_7F52:
        db      00h, 00h, 3ch, 32h, 14h, 44h, 00h, 00h, 0ffh, 19h, 02h, 00h, 0ch, 00h, 78h, 00h
        endif
        if      FW_VERSION >= 210
        jmp     loop_2a0f
MSG_BANNER:
        endif
        if      FW_VERSION = 210
        db      "         AKAI S900 VERSION 2.1          X-fade l"
        endif
        if      FW_VERSION >= 400
        db      "         AKAI S900 VERSION 4.0          X-fade l"
        endif
        if      FW_VERSION >= 210
        db      "ooping-Filter ADSR-Pretrig rec. "
        db      0feh
P_7F52:
        endif
        if      FW_VERSION = 210
        db      00h, 00h, 3ch, 32h, 14h, 44h, 00h, 00h, 00h, 00h, 00h, 00h, 0ch, 00h, 78h, 00h
        endif
        if      (FW_VERSION = 210) || (MODEL = 950)
        db      50h, 00h, 21h
        endif
        if      FW_VERSION < 400
        db      11 dup (0)
        else
        db      07h, 00h, 3ch, 32h, 14h, 44h, 00h, 00h, 00h, 00h, 00h, 00h, 0ch, 00h, 78h, 00h
        db      50h, 00h, 21h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 40h, 1eh, 40h, 37h
        endif
P_7F70:
        if      MODEL = 950
        db      "TONE PRGRM"
        db      12 dup (0)
        db      0ffh, 00h, 00h, 00h, 00h, 0ffh
        db      10 dup (0)
        else
        db      "TONE PRGRM      "
        db      00h, 00h, 00h, 00h, 00h, 00h, 0ffh
        db      15 dup (0)
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
P_7C8C:
        db      7fh, 18h, 80h, 00h, 50h, 63h, 1eh, 0ah, 32h, 00h, 00h, 1eh, 00h, 00h, 63h, 40h
        db      40h, 00h, 04h, 0ffh, 00h, 00h, 32h, 00h
        db      "TONE            "
        db      00h, 00h, 00h, 00h, 63h, 00h
        db      "2 SAMPLE        "
        db      00h, 00h, 00h, 00h, 63h, 00h, 00h, 00h
        endif
P_7F96:
        db      16h, 36h, 16h, 76h, 16h, 0b6h, 1eh, 36h, 1eh, 76h, 1eh, 0b6h
        db      "&6&v&"
        db      0b6h
        db      ".6.v."
        db      0b6h
        db      "666v6"
        db      0b6h
        db      ">6>v>"
        db      0a6h, 3ch, 00h, 28h, 0ah, 28h, 00h, 2ah, 0ah, 2ah, 00h, 2ch, 0ah, 2ch, 00h, 30h
        db      0ah, 30h, 00h, 32h, 0ah, 32h, 00h, 34h, 0ah, 34h, 00h, 38h, 0ah, 38h, 00h, 3ah
        db      0ah, 3ah, 00h, 10h, 03h, 10h, 03h, 12h, 03h, 12h, 03h, 14h, 03h, 14h, 03h, 18h
        db      03h, 18h, 03h, 1ah, 03h, 1ah, 03h, 1ch, 03h, 1ch, 03h, 20h, 03h, 20h, 03h, 22h
        if      MODEL = 950
        db      03h, 22h, 03h, 66h, 82h, 64h, 0ffh, 68h, 00h, 48h, 01h, 50h, 17h, 50h, 95h, 0e0h
        db      17h, 0e2h, 08h, 0e2h, 03h, 0e2h, 0ffh, 0e0h, 80h, 0e0h, 48h
        else
        db      03h, 22h, 03h, 66h, 82h, 64h, 0ffh, 68h, 00h, 5ah, 00h, 5ah, 00h, 5ah, 00h, 5ah
        db      40h, 48h, 01h, 50h, 17h, 50h, 95h, 0e0h, 17h, 0e2h, 08h, 0e2h, 03h, 0e2h, 0ffh, 0e0h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      80h, 0e0h, 48h, 04h, 05h, 06h, 07h, 04h, 05h, 06h, 07h, 0a1h, 0a1h, 0a1h, 0a1h, 0c1h
        db      0c1h, 0c1h, 0c1h
        endif
        if      FW_VERSION >= 210
        db      80h, 0e0h, 48h
        endif
        if      FW_VERSION >= 400
P_801C:
        db      04h, 05h, 06h, 07h, 04h, 05h, 06h, 07h, 0a1h, 0a1h, 0a1h, 0a1h, 0c1h, 0c1h, 0c1h, 0c1h
        endif
        if      (MODEL = 900) && (FW_VERSION <> 210)
        db      9 dup (0)
        db      01h, 02h, 03h, 00h, 01h, 02h, 03h, 01h, 02h, 04h, 08h, 01h, 02h, 04h, 08h, 10h
        db      12h, 14h, 18h, 1ah, 1ch, 20h, 22h, 00h, 01h, 02h, 03h, 04h, 05h, 06h, 07h
        db      "`abcdefg(*,0248:"
        db      01h, 02h, 04h, 08h, 10h, 20h, 40h, 80h, 16h, 16h, 16h, 1eh, 1eh, 1eh
        db      "&&6v"
        db      0b6h, 36h, 76h, 0b6h, 36h, 76h
        endif
P_807C:
        db      18h, 0ch, 06h, 1fh, 1fh, 06h, 0ch, 18h, 1bh, 1fh, 1eh, 1ch, 1eh, 1fh, 1bh, 19h
        db      1fh, 1fh, 1eh, 1fh, 1fh, 0fh, 1fh, 1fh, 1fh, 1fh, 1fh, 13h, 13h, 1fh, 1fh, 1fh
        db      11h, 0ah, 04h, 11h, 0ah, 04h, 0ah, 11h, 1fh, 04h, 04h, 04h, 04h, 04h, 04h, 1fh
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 1fh, 00h, 00h, 00h, 0ch, 0ch, 00h, 00h, 1fh
        if      FW_VERSION < 210
P_8148:
        endif
        if      MODEL = 950
        db      79 dup (0)
P_88E6:
        db      24 dup (0)
DISK_CATALOG:
        db      16 dup (0)
P_890E:
        db      630 dup (0)
P_8EB6_OS21 equ     $+14ah
P_8EE6  equ     $+362h
P_8EFE  equ     $+37ah
TBL_8EFE equ     $+37ah
P_8F00  equ     $+37ch
P_86EE  equ     $+57ah
TBL_86EE equ     $+57ah
P_86F2  equ     $+57eh
P_86F7  equ     $+583h
P_86FF  equ     $+58bh
P_8709  equ     $+595h
W_870A  equ     $+596h
B_87F6  equ     $+682h
TBL_87F6 equ     $+682h
P_87F7  equ     $+683h
P_8810  equ     $+69ch
P_8811  equ     $+69dh
P_953E  equ     $+0ffah
KEY_CODE equ     $+0ffbh
B_95BC  equ     $+0ffch
B_9564  equ     $+0ffeh
B_9566  equ     $+1000h
B_9567  equ     $+1001h
B_9568  equ     $+1002h
B_9569  equ     $+1003h
B_956A  equ     $+1004h
SYSEX_CHECKSUM equ     $+1005h
B_9605  equ     $+1006h
B_9606  equ     $+1007h
B_9607  equ     $+1008h
B_9608  equ     $+1009h
B_9609  equ     $+100ah
B_960A  equ     $+100bh
B_960C  equ     $+100dh
B_960D  equ     $+100eh
B_960E  equ     $+100fh
B_956B  equ     $+1010h
B_B411_S950 equ     $+1011h
B_956C  equ     $+1012h
B_B413_S950 equ     $+1013h
FLOPPY_CTRL equ     $+1015h
ENTER_KEY equ     $+1017h
B_9570  equ     $+1018h
B_0443  equ     $+101bh
B_B41C_S950 equ     $+101ch
B_B41D_S950 equ     $+101dh
B_B41E_S950 equ     $+101eh
B_B41F_S950 equ     $+101fh
B_04D7  equ     $+1020h
B_B421_S950 equ     $+1021h
B_9571  equ     $+1022h
B_9572  equ     $+1023h
B_9573  equ     $+1024h
B_9575  equ     $+1025h
B_B426_S950 equ     $+1026h
B_960F  equ     $+1027h
B_9610  equ     $+1028h
B_9611  equ     $+1029h
B_9612  equ     $+102ah
B_9576  equ     $+102bh
B_9577  equ     $+102ch
B_9578  equ     $+102dh
B_B457_S950 equ     $+1057h
B_B458_S950 equ     $+1058h
B_02C2  equ     $+1059h
B_0497  equ     $+105ah
FDC_RESULT equ     $+105bh
B_B462_S950 equ     $+1062h
B_B464_S950 equ     $+1064h
B_957A  equ     $+1065h
B_B466_S950 equ     $+1066h
B_B467_S950 equ     $+1067h
B_02C3  equ     $+1068h
B_95FD  equ     $+1069h
FIELD_COUNT equ     $+106ah
B_957C  equ     $+106bh
B_957D  equ     $+106ch
B_B46D_S950 equ     $+106dh
TIMER_TICKS equ     $+106eh
W_9580  equ     $+1070h
W_9582  equ     $+1072h
CUR_SAMPLE equ     $+1074h
W_9586  equ     $+1076h
W_9588  equ     $+1078h
B_B47A_S950 equ     $+107ah
ERROR_MSG equ     $+107ch
W_B482_S950 equ     $+1082h
B_B483_S950 equ     $+1083h
W_B484_S950 equ     $+1084h
W_B486_S950 equ     $+1086h
W_B488_S950 equ     $+1088h
W_B48A_S950 equ     $+108ah
W_B48C_S950 equ     $+108ch
W_B48E_S950 equ     $+108eh
W_B490_S950 equ     $+1090h
W_B492_S950 equ     $+1092h
W_B494_S950 equ     $+1094h
W_B496_S950 equ     $+1096h
W_B498_S950 equ     $+1098h
W_B49A_S950 equ     $+109ah
W_B49C_S950 equ     $+109ch
FIELD_LIST_POS equ     $+109eh
CUR_KEYGROUP equ     $+10a0h
W_B4A2_S950 equ     $+10a2h
B_9594  equ     $+10a4h
W_9596  equ     $+10a6h
LAST_FIELD_PTR equ     $+10a8h
W_959A  equ     $+10aah
MASTER_TUNING equ     $+10ach
W_959E  equ     $+10aeh
FIELD_LIST equ     $+10b0h
MODE_FILL equ     $+10b2h
FIELD_RECENT equ     $+10b4h
FIELD_PREVIOUS equ     $+10b6h
MIDI_RUNNING_CHANNEL equ     $+10b8h
W_95AA  equ     $+10bah
W_95AC equ     $+10bch
W_B4BE_S950 equ     $+10beh
MODE_SP equ     $+10c0h
W_95B0  equ     $+10c2h
W_95B2  equ     $+10c4h
TBL_95B4 equ     $+10c6h
W_95B4  equ     $+10c6h
W_95B6  equ     $+10c8h
W_B4CE_S950 equ     $+10ceh
W_B4D0_S950 equ     $+10d0h
W_95BE  equ     $+10d2h
W_95C0  equ     $+10d4h
W_95C2  equ     $+10d6h
W_95C4  equ     $+10d8h
B_95C6  equ     $+10dah
W_95C8  equ     $+10dch
B_B4DD_S950 equ     $+10ddh
W_95CA  equ     $+10deh
B_95CC  equ     $+10e0h
W_95CE  equ     $+10e4h
W_95D0  equ     $+10e6h
W_95D6  equ     $+10e8h
W_95D8  equ     $+10eah
W_95DA  equ     $+10ech
W_95DC  equ     $+10eeh
W_95DE  equ     $+10f0h
W_95E4  equ     $+10f2h
W_95E6  equ     $+10f4h
W_95E8  equ     $+10f6h
W_95EA  equ     $+10f8h
B_B4F9_S950 equ     $+10f9h
W_95EC  equ     $+10fah
W_95EE  equ     $+10fch
W_95F0  equ     $+10feh
W_95F2  equ     $+1100h
W_B502_S950 equ     $+1102h
W_95FE  equ     $+1104h
P_9614  equ     $+1106h
W_961E  equ     $+1110h
B_9620  equ     $+1112h
W_9622  equ     $+1114h
W_9624  equ     $+1116h
W_9626  equ     $+1118h
W_9628  equ     $+111ah
W_B51E_S950 equ     $+111eh
W_B520_S950 equ     $+1120h
P_962C  equ     $+1122h
W_9630  equ     $+1126h
W_9632  equ     $+1128h
B_9633  equ     $+1129h
W_9636  equ     $+112ch
W_9638  equ     $+112eh
W_963A  equ     $+1130h
W_A00C_OS21 equ     $+1132h
W_963E  equ     $+1134h
W_9640  equ     $+1136h
W_B538_S950 equ     $+1138h
W_9642  equ     $+113ah
W_9644  equ     $+113ch
W_A016_OS21 equ     $+113eh
W_9648  equ     $+1140h
W_A01A_OS21 equ     $+1142h
W_A01C_OS21 equ     $+1144h
W_A01E_OS21 equ     $+1146h
W_9658  equ     $+1150h
W_A02A_OS21 equ     $+1152h
B_A02C_OS21 equ     $+1154h
W_A02E_OS21 equ     $+1156h
W_A030_OS21 equ     $+1158h
W_A034_OS21 equ     $+115ch
W_A036_OS21 equ     $+115eh
W_A038_OS21 equ     $+1160h
W_A03A_OS21 equ     $+1162h
W_A03C_OS21 equ     $+116ah
W_966E  equ     $+116ch
W_9670  equ     $+116eh
W_A042_OS21 equ     $+1170h
W_9674  equ     $+1172h
B_A046_OS21 equ     $+1174h
W_A048_OS21 equ     $+1176h
W_9600  equ     $+1178h
W_9602  equ     $+117ah
P_967A  equ     $+117ch
W_9E4A  equ     $+1d34h
SLOT_TAGS equ     $+1d36h
B_9E4E  equ     $+1d38h
P_9E8E  equ     $+1dfch
TBL_9E8E equ     $+1dfch
TBL_9EB0 equ     $+1e1eh
P_9ED2  equ     $+1e40h
TBL_9ED2 equ     $+1e40h
P_9EF4  equ     $+1e62h
TBL_9EF4 equ     $+1e62h
P_9F16  equ     $+1e84h
TBL_9F16 equ     $+1e84h
DRUM_INPUTS_ON equ     $+1ea6h
DRUM_INPUT equ     $+1ea8h
P_9F4E  equ     $+1ebch
P_A03E  equ     $+1fach
P_AA2A_OS21 equ     $+1fc4h
P_A084  equ     $+1ff2h
SLOTS   equ     $+2038h
P_A100  equ     $+206eh
MIDI_RX_BUF equ     $+565ch
MIDI_RX_END equ     $+585ch
VOICES  equ     $+58dch
W_FCF5_S950 equ     $+58f5h
P_B48D  equ     $+5911h
P_B4C4  equ     $+5946h
P_B4FB  equ     $+597bh
P_B532  equ     $+59b0h
P_B569  equ     $+59e5h
        db      23042 dup (0ffh)
        db      24 dup (0)
P_B5A0:
        db      53 dup (0)
P_B5D7:
        db      305 dup (0)
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        db      15 dup (0)
        endif
        if      FW_VERSION < 210

; reached from reset_stub 0F800h:7F80h. port 62h: 0FFh = nothing attached,
; copy ROM to 0; else get byte count + bytes from link 58h/5Ah to 0:0.
shadow_copy_and_jump:
        mov     al, 2
        out     80h, al
        mov     ax, 90h
        out     88h, ax
        endif
        if      MODEL = 950
        sub     ax, ax
        mov     es, ax
        mov     ds, ax
        mov     di, ax
        mov     si, ax
        mov     dx, 1c0h
        out     dx, al
        endif
        if      FW_VERSION < 210
        mov     al, 82h
        out     66h, al
        in      al, 62h
        inc     al
        je      boot_copy_rom
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
conditional_floppy_load_path:
        endif
        if      FW_VERSION < 210
        mov     al, 0b6h
        out     26h, al
        endif
        if      MODEL = 950
        mov     al, 8
        out     24h, al
        mov     al, 0
        out     24h, al
        mov     al, 17h
        out     50h, al
        mov     al, 55h
        out     50h, al
boot_status_poll_loop:
        in      al, 52h
        and     al, 1
        je      boot_status_poll_loop
        in      al, 56h
        xchg    cx, ax
loop_ffbe_s950:
        in      al, 52h
        and     al, 1
        je      loop_ffbe_s950
        in      al, 56h
        mov     ch, al
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     al, 34h
        out     24h, al
        xor     al, al
        out     24h, al
        out     5ah, al
        out     5ah, al
        out     5ah, al
        mov     al, 40h
        out     5ah, al
        mov     al, 4eh
        out     5ah, al
        mov     al, 37h
        out     5ah, al
        mov     di, 0
boot_status_poll_loop:
        in      al, 5ah
        and     al, 2
        je      boot_status_poll_loop
        in      al, 58h
        xchg    cl, al
loop_7fbe_v12a:
        in      al, 5ah
        and     al, 2
        je      loop_7fbe_v12a
        in      al, 58h
        xchg    ch, al
        endif
        if      FW_VERSION < 210
loop_7fc8_v12a:
        lodsb
        endif
        if      MODEL = 950
        in      al, 52h
        and     al, 1
        je      loop_7fc8_v12a
        in      al, 56h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        in      al, 5ah
        and     al, 2
        je      loop_7fc8_v12a
        in      al, 58h
        endif
        if      FW_VERSION < 210
        stosb
        loop    loop_7fc8_v12a
        jmp     boot_enter_os
boot_copy_rom:
        endif
        if      MODEL = 950
        mov     ax, 0f000h
        mov     ds, ax
        mov     cx, 8000h
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        mov     si, 0
        mov     di, si
        mov     cx, 4000h
        endif
        if      FW_VERSION < 210
        rep movsw
boot_enter_os:
        endif
        if      MODEL = 950
        jmpf    0:os_entry
        endif
        if      (MODEL = 900) && (FW_VERSION < 210)
        jmpf    0:0
        endif
        if      FW_VERSION < 210
        db      11 dup (0)

reset_stub:
        endif
        if      MODEL = 950
        jmpf    0f000h:shadow_copy_and_jump
        db      81h, 0f9h, 0dch, 06h, 72h, 1bh, 0c1h, 0e9h, 04h, 29h, 4dh
        elseif  (MODEL = 900) && (FW_VERSION < 210)
        mov     ax, 0f800h
        mov     ds, ax
        jmpf    0fff8h:0
        db      00h, 00h, 00h, 00h, 00h, 00h
        else

; 'F' files load/run here. ROM loader at 83B4h. FIXUPS assembled for 83B4h;
; ROM runs it, loader calls resolve only there.
ffile_buf:
        section ffile_copy
        phase   83b4h
        include "fixups.inc"
        dephase
        endsection
        endif
        if      FW_VERSION >= 400
        db      1446 dup (0)
        db      "PROGRAMS.                     TONE PRGRM        "
        db      "                                                "
        db      "                                                "
        db      "                                                "
        db      "                                                "
        db      "                                                "
        db      "1                                               "
        db      "                                                "
        db      "                                                "
        db      "                                                "
        db      "                                                "
        db      "FIXUPS    "
        db      00h, 00h, 00h, 00h, 00h, 00h, 46h, 8ch, 00h, 00h, 04h, 00h, 00h, 00h
        db      "S900 4.0  "
        db      00h, 00h, 00h, 00h, 00h, 00h, 46h, 4bh, 0b0h, 00h, 05h
        db      1500 dup (0)
        db      80h, 06h, 00h, 07h, 00h, 08h, 00h, 09h, 00h, 0ah, 00h, 0bh, 00h, 0ch, 00h, 0dh
        db      00h, 0eh, 00h, 0fh, 00h, 10h, 00h, 11h, 00h, 12h, 00h, 13h, 00h, 14h, 00h, 15h
        db      00h, 16h, 00h, 17h, 00h, 18h, 00h, 19h, 00h, 1ah, 00h, 1bh, 00h, 1ch, 00h, 1dh
        db      00h, 1eh, 00h, 1fh, 00h, 20h, 00h, 21h, 00h, 22h, 00h, 23h, 00h, 24h, 00h, 25h
        db      00h, 26h, 00h, 27h, 00h, 28h, 00h, 29h, 00h, 2ah, 00h, 2bh, 00h, 2ch, 00h, 2dh
        db      00h, 2eh, 00h, 2fh, 00h, 30h, 00h, 31h, 00h, 00h, 80h
        db      1538 dup (0)
        db      84h, 0ffh, 38h, 00h, 00h, 00h, 00h, 00h, 00h, 0bh, 00h, 00h, 00h, 40h, 40h, 00h
        db      18h, 00h, 01h, 01h, 00h, 00h, 50h, 10h, 00h, 00h, 01h
        db      9 dup (0)
        db      01h, 00h, 00h, 00h, 4bh, 0b0h, 00h, 00h, 0b8h, 0eh, 10h, 0a1h, 00h, 00h, 00h, 00h
        db      9ch, 02h, 00h, 00h, 00h, 00h, 00h, 00h, 0aeh, 0eh, 0c1h, 14h
FIELDS_CLEAR_MEMORY_AND_LOAD:
        dw      FLD_ENSEMBLE, FLD_LOAD_PROGRM_NAME, 0
        db      00h, 00h, 4ch, 0b4h, 54h, 0b4h, 3ah, 0f2h, 00h, 00h, 17h, 87h, 11h, 88h, 00h, 00h
        db      00h, 00h, 00h, 00h, 4bh, 24h, 16h, 89h, 00h, 00h, 0eeh, 02h, 3eh, 00h, 57h, 44h
        db      32 dup (0)
; 95EAh+ OS variables. rest: stale RAM from build near v2.1, third matches
; v2.1 at +47C0h/+4515h. not OS code.
        db      28h, 00h, 31h, 00h, 00h, 28h, 00h, 00h, 00h, 00h, 01h, 20h, 04h, 00h, 04h, 00h
        db      01h, 03h, 00h, 20h, 00h, 00h, 00h, 00h, 00h, 00h, 24h, 0bh, 00h, 00h, 20h, 00h
        db      00h, 00h, 01h, 00h, 00h, 00h, 67h, 13h, 0d0h, 07h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
        db      "01      *Select, Copy      TONE          SAMPLE "
        db      "*Rename, delete(-) TONE        *02  *Select prog"
        db      "ram Monitor                                     "
        db      "               *03 *Loudness  *Nom pitch  *Fine "
        db      "pitch         +00       C3  60        +00      *"
        db      "04   *REPLAY MODE One shot(1),               Loo"
        db      "ping(2), Alternating(3) 2      *05   *TIME DIREC"
        db      "TION                         Normal(1), Reverse("
        db      "2) 1           *06  START POINT   *Coarse *Fine "
        db      " *AUTO     (0 -    1,700)       0,000      01  *"
        db      "07  END POINT     *Coarse *Fine         (000,100"
        db      "-001,800)       1,800          *08  LOOP LENGTH "
        db      "  *Coarse *Fine  *AUTO     (5 -    1,800)       "
        db      "0,045    (ENT) *09  *Resample at half bandwidth "
        db      "(ENT)   *Discard before start, after end (ENT) *"
        db      "10 SPLICE  *2nd sample name SAMPLE 2       X-FAD"
        db      "E  *New sample name NEW SAMPLE *11 *Splice cross"
        db      "fade time, (points)              (0-     0)   10"
        db      "00             *12 *SPLICE ORDER: 1st then 2nd(1"
        db      "),      2nd then 1st(2), Together(3) . Mem   0%*"
        db      "13  CROSSFADE LOOP.  *Name NEW SAMPLE   *X-fade "
        db      "length 32000 *Execute  Mem   0%*14  VX-TIME SKEW"
        db      ". *Name NEW SAMPLE  Mem*Time  5000  *Delay soft/"
        db      "loud(1/2)    0%*15 *Loud LOUD SAMPL  *New NEW SA"
        db      "MPLE  M    *Soft SOFT SAMPL  *Create VX _    0%"
        db      89h, 26h, 0aeh, 95h, 0c7h, 06h, 0a4h, 95h, 0ach, 0ah, 0c7h, 06h, 98h, 95h, 9ch, 02h
        db      0a1h, 9ch, 02h, 0a3h, 0a6h, 95h, 0e8h, 94h, 16h, 0c7h, 06h, 0a2h, 95h, 90h, 07h, 0e8h
        db      0ch, 00h, 0c7h, 06h, 0e6h, 7ch, 0ffh, 00h, 0b8h, 5ch, 0ah, 0e9h, 8dh, 1ah, 0e8h, 9ah
        db      18h, 22h, 0e4h, 75h, 25h, 0beh, 0a6h, 07h, 0bah, 01h, 00h, 0e8h, 80h, 25h, 0ffh, 16h
        db      0dah, 7ch, 0ebh, 0fah
        db      "No samples present. "
        db      0bbh, 0feh, 0bdh, 0ach, 0ah, 0e8h, 0efh, 47h, 8bh, 0d7h, 0e8h, 4fh, 1ch, 73h, 1ah, 0bbh
        db      4ch, 9eh, 0beh, 0cah, 0a0h, 80h, 3fh, 53h, 74h, 06h, 43h, 83h, 0c6h, 46h, 0ebh, 0f5h
        db      8bh, 0deh, 0b9h, 05h, 00h, 8bh, 0fah, 0f3h, 0a5h, 0b0h, 63h, 86h, 06h, 82h, 95h, 50h
        db      0bdh, 0ach, 0ah, 0e8h, 0d6h, 14h, 0bdh, 0e9h, 0bh, 0e8h, 0dh, 01h, 89h, 1eh, 84h, 95h
        db      0e8h, 85h, 14h, 0e8h, 22h, 16h, 0bdh, 0b5h, 0ah, 0e8h, 0c0h, 14h, 8bh, 0f3h, 0e8h, 0a0h
        db      47h, 8bh, 47h, 18h, 0bdh, 0beh, 0ah, 0e8h, 0e5h, 47h, 8bh, 47h, 16h, 0b1h, 04h, 05h
        db      08h, 00h, 0d3h, 0e8h, 0bdh, 06h, 0bh, 0e8h, 0e8h, 47h, 8bh, 47h, 16h, 25h, 0fh, 00h
        db      0a9h, 08h, 00h, 74h, 03h, 0dh, 0f0h, 0ffh, 0bdh, 15h, 0bh, 0e8h, 0d4h, 47h, 8ah, 47h
        db      1ah, 0bfh, 36h, 0bh, 0b9h, 03h, 00h, 0f2h, 0aeh, 0b8h, 33h, 00h, 2bh, 0c1h, 0bdh, 24h
        db      0bh, 0e8h, 63h, 47h, 0aah, 0e8h, 0cch, 00h, 0bdh, 0a8h, 0bh, 0e8h, 52h, 00h, 8ah, 47h
        db      2bh, 0bfh, 0c7h, 0bh, 0b9h, 02h, 00h, 0f2h, 0aeh, 0b8h, 32h, 00h, 2bh, 0c1h, 0bdh, 0b8h
        db      0bh, 0e8h, 43h, 47h, 0aah, 0bdh, 0cbh, 0bh, 0e8h, 35h, 00h, 0bdh, 0dah, 0bh, 0e8h, 2fh
        db      00h, 0bdh, 38h, 0ch, 0e8h, 29h, 00h, 0bdh, 6eh, 0ch, 0e8h, 23h, 00h, 0bdh, 0f2h, 0bh
        db      0e8h, 39h, 14h, 0bdh, 0fbh, 0bh, 0e8h, 33h, 14h, 0bdh, 65h, 0ch, 0e8h, 2dh, 14h, 0e8h
        db      06h, 14h, 0e8h, 12h, 00h, 0bdh, 13h, 0ch, 0e8h, 05h, 00h, 58h, 0a2h, 82h, 95h, 0c3h
        db      0e8h, 04h, 47h, 0c6h, 05h, 20h, 0c3h, 0b0h, 63h, 86h, 06h, 82h, 95h, 50h, 53h, 8bh
        db      1eh, 84h, 95h, 0bdh, 04h, 0ch, 8bh, 46h, 09h, 0e8h, 33h, 47h, 0e8h, 22h, 0fh, 50h
        db      52h, 0bah, 9fh, 05h, 0e8h, 45h, 1bh, 0b8h, 00h, 00h, 99h, 72h, 03h, 0e8h, 11h, 0fh
        db      5fh, 5eh, 0e8h, 7ch, 0ah, 0b8h, 00h, 7dh, 99h, 0e8h, 75h, 0ah, 96h, 0bah, 3ch, 37h
        db      0bdh, 04h, 0ch, 8bh, 7eh, 00h, 4fh, 0e8h, 60h, 17h, 0bdh, 7dh, 0ch, 8bh, 46h, 09h
        db      0e8h, 0fch, 46h, 5bh, 58h, 0a2h, 82h, 95h, 0c3h, 60h, 0e8h, 0aah, 46h, 0beh, 5ah, 7ch
        db      0f3h, 0a6h, 0beh, 3eh, 0a0h, 74h, 04h, 8bh, 36h, 0d6h, 7ch, 89h, 36h, 0d6h, 7ch, 0e8h
        db      8fh, 46h, 61h, 0c3h, 83h, 3eh, 0a6h, 02h, 00h, 74h, 01h, 0c3h, 0b0h, 63h, 86h, 06h
        db      82h, 95h, 50h, 53h, 8bh, 47h, 20h, 8bh, 57h, 22h, 50h, 52h, 0b9h, 0e8h, 03h, 0f7h
        db      0f1h, 89h, 16h, 51h, 0bh, 0a3h, 42h, 0bh, 8bh, 47h, 1ch, 8bh, 57h, 1eh, 50h, 52h
        db      8bh, 0f0h, 8bh, 0fah, 0f7h, 0f1h, 89h, 16h, 80h, 0bh, 0a3h, 71h, 0bh, 89h, 16h, 0a4h
        db      0bh, 0a3h, 95h, 0bh, 0c7h, 06h, 0a2h, 0bh, 05h, 00h, 0c7h, 06h, 93h, 0bh, 00h, 00h
        db      "ZX-d"
        db      00h, 83h, 0dah, 00h, 0f7h, 0f1h, 89h, 16h, 55h, 0bh, 0a3h, 46h, 0bh, 8bh, 47h, 24h
        db      8bh, 57h, 26h, 3bh, 0c6h, 1bh, 0d7h, 8bh, 57h, 26h, 72h, 03h, 96h, 87h, 0d7h, 89h
        db      47h, 24h, 89h, 57h, 26h, 0f7h, 0f1h, 89h, 16h, 0a0h, 0bh, 0a3h, 91h, 0bh, 5ah, 58h
        db      05h, 64h, 00h, 83h, 0d2h, 00h, 0f7h, 0f1h, 89h, 16h, 82h, 0bh, 0a3h, 73h, 0bh, 8bh
        db      47h, 10h, 8bh, 57h, 12h, 80h, 7fh, 2ah, 00h, 74h, 04h, 0d1h, 0eah, 0d1h, 0d8h, 0f7h
        db      0f1h, 89h, 16h, 84h, 0bh, 0a3h, 75h, 0bh, 0beh, 9eh, 0ah, 0b9h, 06h, 00h, 0adh, 25h
        db      0ffh, 7fh, 95h, 51h, 8bh, 46h, 09h, 0e8h, 21h, 46h, 59h, 0e2h, 0f1h, 0beh, 3ah, 0ah
        db      0b9h, 08h, 00h, 0adh, 95h, 0adh, 92h, 8bh, 7eh, 00h, 4fh, 8bh, 46h, 0bh, 83h, 0f9h
        db      03h, 72h, 03h, 8bh, 46h, 0dh, 51h, 0e8h, 5ch, 16h, 59h, 0e2h, 0e6h, 0b9h, 03h, 00h
        db      0beh, 9eh, 0ah, 0adh, 25h, 0ffh, 7fh, 95h, 0adh, 93h, 8bh, 57h, 09h, 8bh, 46h, 09h
        db      3bh, 46h, 0bh, 74h, 0dh, 3bh, 57h, 0bh, 73h, 03h, 0ffh, 46h, 0bh, 0c7h, 47h, 0bh
        db      00h, 00h, 3bh, 46h, 0dh, 74h, 0dh, 39h, 57h, 0dh, 73h, 03h, 0ffh, 4eh, 0dh, 0c7h
        db      47h, 0dh, 0e7h, 03h, 0e2h, 0cdh, 5bh, 58h, 0a2h, 82h, 95h, 0c3h, 39h, 0bh, 36h, 33h
        db      48h, 0bh, 3ah, 37h, 68h, 0bh, 36h, 33h, 77h, 0bh, 3ah, 37h, 88h, 0bh, 36h, 33h
        db      97h, 0bh, 3ah, 37h, 68h, 0bh, 2eh, 2bh, 77h, 0bh, 32h, 2fh, 00h, 00h, 0ach, 8ah
        db      0b5h, 0ah, 0e9h, 8bh, 0beh, 8ah, 06h, 0bh, 15h, 0bh, 24h, 8bh, 0b8h, 8bh, 39h, 8bh
        db      48h, 0bh, 59h, 0bh, 68h, 8bh, 77h, 0bh, 88h, 8bh, 97h, 0bh, 0a8h, 0bh, 0dah, 8bh
        db      0cbh, 0bh, 0f2h, 8bh, 0fbh, 0bh, 04h, 8ch, 13h, 8ch, 9bh, 8ch, 7dh, 0ch, 6eh, 0ch
        db      65h, 8ch, 47h, 0ch, 38h, 0ch, 0cdh, 8ah, 0d6h, 0ah, 0dfh, 0ah, 0e8h, 0ah, 00h, 00h
        db      39h, 0bh, 48h, 0bh, 68h, 0bh, 77h, 0bh, 88h, 0bh, 97h, 0bh, 0a8h, 0bh, 0b2h, 02h
        db      09h, 1dh, 27h, 01h, 53h, 0a5h, 0ch, 0b2h, 02h, 31h, 45h, 4fh, 01h, 53h, 41h, 0dh
        db      52h, 03h, 04h, 30h, 33h, 14h, 00h, 0c7h, 0dh, 00h, 00h, 0ceh, 0ffh, 32h, 00h, 12h
        db      07h, 04h, 0bh, 15h, 01h, 53h, 0a0h, 15h, 12h, 07h, 16h, 1ch, 26h, 01h, 53h, 0a0h
        db      15h, 12h, 07h, 2ch, 33h, 3dh, 01h, 53h, 0a0h, 15h, 12h, 07h
        db      ">JK "
        db      00h, 0d2h, 0dh, 00h, 00h, 0b7h, 0bh, 01h, 00h, 12h, 07h, 00h, 4dh, 50h, 04h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 52h, 03h, 0fh, 3eh, 40h, 02h, 00h, 0b6h
        db      0eh, 3ch, 00h, 18h, 00h, 60h, 00h, 52h, 03h, 1bh, 48h, 4bh, 14h, 00h, 0b6h, 0eh
        db      00h, 00h, 9dh, 0ffh, 63h, 00h, 0a2h, 03h, 06h, 4ah, 4bh, 20h, 00h, 0c9h, 0eh, 00h
        db      00h, 33h, 0bh, 03h, 00h
        db      "123OLAB"
        db      04h, 13h, 40h, 43h, 04h, 00h, 8ch, 0fh, 00h, 00h, 00h, 00h, 01h, 00h, 42h, 04h
        db      1bh, 44h, 47h, 04h, 00h, 8ch, 0fh, 00h, 00h, 00h, 00h, 0e7h, 03h, 20h, 00h, 42h
        db      04h, 22h, 4dh, 4fh, 04h, 00h, 0deh, 0eh, 01h, 00h, 00h, 00h, 63h, 00h, 92h, 04h
        db      13h, 40h, 43h, 04h, 00h, 8ch, 0fh, 01h, 00h, 00h, 00h, 01h, 00h, 92h, 04h, 1bh
        db      44h, 47h, 04h, 00h, 8ch, 0fh, 20h, 03h, 00h, 00h, 20h, 03h, 1ch, 00h, 0e2h, 04h
        db      13h, 40h, 43h, 04h, 00h, 8ch, 0fh, 00h, 00h, 00h, 00h, 01h, 00h, 0e2h, 04h, 1bh
        db      44h, 47h, 04h, 00h, 8ch, 0fh, 2dh, 00h, 05h, 00h, 0e7h, 03h, 24h, 00h, 0e2h, 04h
        db      22h, 50h, 51h, 20h, 00h, 0c1h, 0fh, 00h, 00h, 0b7h, 0bh, 01h, 00h, 0dh, 0f2h, 03h
        db      06h, 45h, 46h, 20h, 00h, 72h, 11h, 00h, 00h, 0c9h, 0bh, 02h, 00h
        db      "NR122"
        db      05h
        db      ")PQ "
        db      00h, 8ch, 12h, 00h, 00h, 0b7h, 0bh, 01h, 00h, 32h, 05h, 05h, 27h, 28h, 20h, 00h
        db      0b2h, 14h, 00h, 00h, 0b7h, 0bh, 01h, 00h, 02h, 03h, 05h, 16h, 20h, 01h, 50h, 76h
        db      15h, 82h, 05h, 0ch, 1eh, 28h, 01h, 53h, 97h, 15h, 82h, 05h, 34h, 46h, 50h, 01h
        db      53h, 0a0h, 15h, 0d2h, 05h, 04h, 3fh, 44h, 84h, 00h, 0a5h, 15h, 0e8h, 03h, 00h, 00h
        db      00h, 7dh, 22h, 06h, 04h, 46h, 47h, 20h, 00h, 0a6h, 15h, 00h, 00h, 25h, 0ch, 04h
        db      00h
        db      "LFT 123"
        db      22h, 06h, 00h, 4dh, 50h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 64h, 00h, 0c2h
        db      06h
        db      "5KL "
        db      00h, 56h, 19h, 00h, 00h, 25h, 0ch, 03h, 00h, 0c2h, 06h, 28h, 2fh, 34h, 84h, 00h
        db      0a5h, 15h, 88h, 13h, 00h, 00h, 00h, 7dh, 0c2h, 06h, 00h, 4dh, 50h, 04h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 64h, 00h, 0c2h, 06h, 13h, 1ah, 24h, 01h, 53h, 0a0h, 15h
        db      72h, 06h
        db      ">GH "
        db      00h, 4bh, 1ah, 00h, 00h, 0b7h, 0bh, 01h, 00h, 72h, 06h, 29h, 39h, 3eh, 84h, 00h
        db      0a5h, 15h, 00h, 7dh, 00h, 00h, 00h, 7dh, 72h, 06h, 00h, 4dh, 50h, 04h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 64h, 00h, 72h, 06h, 16h, 1dh, 27h, 01h, 53h, 0a0h, 15h
        db      0c3h, 0e8h, 30h, 0f5h, 8bh, 0d6h, 8bh, 3eh, 84h, 95h, 0f3h, 0a6h, 75h, 01h, 0c3h, 0e8h
        db      60h, 17h, 73h, 14h, 8bh, 0fah, 0b0h, 20h, 0b9h, 0ah, 00h, 0f3h, 0aeh, 75h, 0fh, 0bah
        db      0f6h, 02h, 0e8h, 0f0h, 00h, 0e8h, 56h, 11h, 0e8h, 0c1h, 0fah, 0e9h, 0ech, 02h, 0e8h, 11h
        db      0f5h, 0e8h, 1fh, 00h, 55h, 53h, 0e8h, 12h, 1eh, 8bh, 36h, 84h, 95h, 50h, 8bh, 44h
        db      10h, 2bh, 0c3h, 8bh, 44h, 12h, 1bh, 0c1h
        db      "X[]r"
        db      0fh, 0b8h, 0e3h, 7bh, 0e9h, 95h, 16h, 0e8h, 53h, 17h, 0b8h, 07h, 7ch, 72h, 0f5h, 0c3h
        db      8bh, 0fbh, 0b9h, 3ch, 00h, 0f3h, 0a4h, 89h, 47h, 36h, 89h, 57h, 38h, 0c6h, 46h, 00h
        db      53h, 0beh, 0ceh, 02h, 0b9h, 05h, 00h, 8bh, 0fbh, 0f3h, 0a5h, 53h, 87h, 1eh, 84h, 95h
        db      89h, 1eh, 60h, 96h, 5bh, 89h, 4fh, 28h, 0e8h, 18h, 0f3h, 8bh, 1eh, 60h, 96h, 8dh
        db      77h, 36h, 8bh, 3eh, 84h, 95h, 8dh, 7dh, 36h, 8dh, 5fh, 10h, 0e8h, 0cbh, 0f4h, 0ebh
        db      88h, 0e8h, 94h, 0f4h, 8bh, 3eh, 84h, 95h, 0f3h, 0a6h, 75h, 01h, 0c3h, 0bfh, 0f6h, 02h
        db      80h, 3dh, 2dh, 74h, 09h, 0b9h, 0ah, 00h, 0b0h, 20h, 0f3h, 0aeh, 75h, 07h, 8bh, 16h
        db      84h, 95h, 0e9h, 61h, 0ffh, 0bah, 0f6h, 02h, 0e8h, 4eh, 00h, 0bdh, 4ah, 9eh, 0bah, 56h
        db      0a0h, 80h, 7eh, 00h, 4bh, 75h, 0bh, 8bh, 0fah, 0e8h, 26h, 00h, 83h, 0c7h, 16h, 0e8h
        db      20h, 00h, 83h, 0c2h, 46h, 45h, 81h, 0fdh, 8eh, 9eh, 75h, 0e5h, 8bh, 3eh, 84h, 95h
        db      0e8h, 0fh, 00h, 0bfh, 0ceh, 02h, 0e8h, 09h, 00h, 0e8h, 86h, 10h, 0e8h, 0f1h, 0f9h, 0e9h
        db      1ch, 02h, 57h, 0beh, 0ceh, 02h, 0b9h, 05h, 00h, 0f3h, 0a7h, 75h, 0ah, 5fh, 57h, 0beh
        db      0f6h, 02h, 0b9h, 05h, 00h, 0f3h, 0a5h, 5fh, 0c3h, 60h, 0e8h, 59h, 16h, 72h, 06h, 0e8h
        db      0dfh, 13h, 0e8h, 60h, 0f3h, 61h, 0c3h, 8bh, 46h, 09h, 8bh, 1eh, 84h, 95h, 89h, 47h
        db      18h, 0c3h, 0e8h, 96h, 0eh, 75h, 01h, 0c3h, 0bah, 2dh, 07h, 0e8h, 0dbh, 0ffh, 0bah, 44h
        db      07h, 0e8h, 32h, 16h, 73h, 01h, 0c3h, 89h, 1eh, 4ah, 96h, 0bah, 1ch, 07h, 0e8h, 25h
        db      16h, 72h, 0f3h, 89h, 1eh, 6ch, 96h, 0e8h, 0ech, 0f3h, 0e8h, 0fah, 0feh, 8bh, 0fbh, 8bh
        db      36h, 4ah, 96h, 0b9h, 3ch, 00h, 0f3h, 0a4h, 0beh, 2dh, 07h, 8bh, 0fbh, 0b9h, 0ah, 00h
        db      0f3h, 0a4h, 89h, 1eh, 9eh, 02h, 8bh, 1eh, 6ch, 96h, 0e8h, 0ceh, 09h, 96h, 87h, 0fah
        db      8bh, 1eh, 4ah, 96h, 0e8h, 0c4h, 09h, 0e8h, 31h, 05h, 8bh, 1eh, 9eh, 02h, 89h, 47h
        db      1ch, 89h, 57h, 1eh, 03h, 0c0h, 13h, 0d2h, 89h, 47h, 10h, 89h, 57h, 12h, 0e8h, 0aeh
        db      1ch, 75h, 03h, 0e9h, 1dh, 08h, 8bh, 2eh, 9eh, 02h, 89h, 46h, 36h, 89h, 56h, 38h
        db      0d1h, 0d9h, 0d1h, 0ebh, 2bh, 5eh, 10h, 1bh, 4eh, 12h, 72h, 0e7h, 0e8h, 0eeh, 15h, 0c6h
        db      46h, 00h, 53h, 0c6h, 47h, 2ah, 0ffh, 33h, 0c0h, 89h, 47h, 18h, 89h, 47h, 20h, 89h
        db      47h, 22h, 89h, 47h, 28h, 0e8h, 0c4h, 0bh, 8bh, 2eh, 9eh, 02h, 8bh, 1eh, 4ah, 96h
        db      33h, 0c0h, 0e8h, 0fh, 00h, 0b8h, 08h, 00h, 8bh, 1eh, 6ch, 96h, 0e8h, 05h, 00h, 8bh
        db      0ddh, 0e9h, 61h, 0bh, 0bh, 46h, 38h, 0a3h, 44h, 96h, 8bh, 46h, 36h, 0a3h, 42h, 96h
        db      0e8h, 19h, 09h, 0a3h, 00h, 96h, 89h, 16h, 02h, 96h, 0e8h, 4bh, 09h, 0c7h, 06h, 74h
        db      96h, 0c8h, 18h, 0e9h, 02h, 0ah, 0a1h, 0fh, 0bh, 0b1h, 04h, 0d3h, 0e0h, 03h, 06h, 1eh
        db      0bh, 8bh, 1eh, 84h, 95h, 89h, 47h, 16h, 0c3h, 0e8h, 0ch, 0f3h, 53h, 0bbh, 05h, 0bh
        db      0d7h, 5bh, 3ah, 47h, 1ah, 75h, 01h, 0c3h, 88h, 47h, 1ah, 0e9h, 65h, 0f1h, 8bh, 46h
        db      09h, 80h, 3eh, 6fh, 95h, 00h, 75h, 07h, 3bh, 06h, 0a4h, 02h, 75h, 01h, 0c3h, 0a3h
        db      0a4h, 02h, 0b8h, 4ah, 01h, 0f7h, 66h, 09h, 0a3h, 0ach, 02h, 8bh, 1eh, 84h, 95h, 0b8h
        db      00h, 7dh, 99h, 8bh, 77h, 1ch, 8bh, 7fh, 1eh, 83h, 0eeh, 64h, 1bh, 0fah, 0e8h, 4ah
        db      04h, 56h, 0e8h, 24h, 00h, 5eh, 80h, 7fh, 2ah, 00h, 74h, 12h, 0ffh, 77h, 20h, 0bfh
        db      08h, 00h, 0e8h, 14h, 00h
        db      "X;G s"
        db      03h, 89h, 47h, 20h, 53h, 0e8h, 11h, 0f1h, 5bh, 0e8h, 0e8h, 0f9h, 0e9h, 41h, 1fh, 33h
        db      0c0h, 89h, 47h, 20h, 89h, 47h, 22h, 0a3h, 0b0h, 02h, 89h, 36h, 00h, 96h, 0a3h, 02h
        db      96h, 8bh, 47h, 36h, 0a3h, 6eh, 96h, 0a3h, 42h, 96h, 8bh, 47h, 38h, 03h, 0c7h, 0a3h
        db      70h, 96h, 0a3h, 44h, 96h, 8bh, 0ebh, 0c7h, 06h, 74h, 96h, 6ah, 0fh, 0e9h, 53h, 04h
        db      2eh, 83h, 3eh, 0b0h, 02h, 00h, 74h, 01h, 0c3h, 2eh, 8bh, 1eh, 0ach, 02h, 0adh, 99h
        db      33h, 0c2h, 3bh, 0c3h, 73h, 06h, 0ffh, 46h, 20h, 0e2h, 0eeh, 0c3h, 2eh, 0ffh, 06h, 0b0h
        db      02h, 0c3h, 0b9h, 03h, 00h, 0beh, 9eh, 0ah, 0adh, 25h, 0ffh, 7fh, 95h, 0adh, 93h, 8bh
        db      46h, 09h, 0bah, 0e8h, 03h, 0f7h, 0e2h, 03h, 47h, 09h, 83h, 0d2h, 00h, 8bh, 7fh, 0fh
        db      8bh, 1eh, 84h, 95h, 03h, 0fbh, 0abh, 89h, 15h, 0e2h, 0ddh, 0e8h, 66h, 0f9h, 0e8h, 88h
        db      0f0h, 0e8h, 0f3h, 0f8h, 0e9h, 0b9h, 1eh, 0e8h, 0a7h, 0ch, 75h, 01h, 0c3h, 9ch, 0fah, 33h
        db      0c9h, 8bh, 47h, 1ch, 8bh, 57h, 1eh, 8bh, 0f0h, 8bh, 0fah, 2bh, 47h, 24h, 1bh, 57h
        db      26h, 2bh, 06h, 0a0h, 02h, 1bh, 0d1h, 73h, 03h, 33h, 0c0h, 99h, 0a3h, 6eh, 96h, 89h
        db      16h, 70h, 96h, 0a3h, 4ch, 96h, 89h, 16h, 4eh, 96h, 83h, 0eeh, 05h, 1bh, 0f9h, 03h
        db      06h, 0aah, 02h, 13h, 0d1h, 3bh, 0c6h, 52h, 1bh, 0d7h, 5ah, 73h, 03h, 96h, 87h, 0fah
        db      8bh, 0ceh, 2bh, 0eh, 6eh, 96h, 89h, 0eh, 3ch, 96h, 0a1h, 0a0h, 02h, 29h, 06h, 3ch
        db      96h, 0a1h, 6eh, 96h, 8bh, 16h, 70h, 96h, 0d1h, 0e0h, 0d1h, 0d2h, 0e8h, 0bch, 00h, 80h
        db      7fh, 2ah, 00h
        db      "u*+G"
        db      10h, 1bh, 57h, 12h, 72h, 05h, 0e8h, 0a5h, 00h, 0ebh, 1dh, 0d1h, 0fah, 0d1h, 0d8h, 03h
        db      0c1h, 83h, 0d2h, 00h, 78h, 12h, 50h, 2bh, 0c8h, 0e8h, 0aah, 00h, 59h, 33h, 0c0h, 99h
        db      0e8h, 8bh, 00h, 0e8h, 0a3h, 00h, 0ebh, 03h, 0e8h, 9bh, 00h, 8bh, 0eh, 0a0h, 02h, 41h
        db      8bh, 47h, 1ch, 8bh, 57h, 1eh, 2bh, 0c1h, 83h, 0dah, 00h, 0d1h, 0e0h, 0d1h, 0d2h, 0e8h
        db      72h, 00h, 2bh, 47h, 10h, 1bh, 57h, 12h, 72h, 03h, 0e8h, 61h, 00h, 49h, 0bfh, 0beh
        db      84h, 0e8h, 75h, 00h, 4fh, 89h, 3eh, 46h, 96h, 0b8h, 0ffh, 0ffh, 0a3h, 36h, 96h, 0a3h
        db      38h, 96h, 0b8h, 0eeh, 7ch, 03h, 06h, 0a0h, 02h, 0a3h, 3ah, 96h, 8bh, 0f8h, 8bh, 36h
        db      46h, 96h, 0e8h, 75h, 00h, 47h, 0ffh, 0eh, 3ch, 96h, 75h, 0f2h, 33h, 0c9h, 8bh, 47h
        db      1ch, 8bh, 57h, 1eh, 0f9h, 1bh, 06h, 3ah, 96h, 1bh, 0d1h, 05h, 0eeh, 7ch, 13h, 0d1h
        db      2bh, 06h, 4ch, 96h, 1bh, 16h, 4eh, 96h, 89h, 47h, 24h, 89h, 57h, 26h, 0e8h, 4ch
        db      0f8h, 0e8h, 6eh, 0efh, 0e8h, 2bh, 56h, 0e8h, 0cfh, 55h, 9dh, 0e9h, 0dfh, 0feh, 52h, 80h
        db      0cah, 08h, 0ebh, 01h, 52h, 50h, 03h, 47h, 36h, 13h, 57h, 38h, 0a3h, 6eh, 96h, 89h
        db      16h, 70h, 96h, 58h, 5ah, 0c3h, 0bfh, 0eeh, 7ch, 1eh, 51h, 0a1h, 6eh, 96h, 8bh, 0f0h
        db      81h, 0e6h, 0fh, 00h, 25h, 0f0h, 0ffh, 0bh, 06h, 70h, 96h, 0b1h, 04h, 0d3h, 0c8h, 8eh
        db      0d8h, 59h, 0adh, 86h, 0c4h, 0aah, 0e2h, 0fah, 1fh, 0c3h, 0fdh, 57h, 8bh, 0eh, 0a0h, 02h
        db      4fh, 0ach, 2ah, 05h, 70h, 48h, 0f6h, 0e8h, 3ch, 0ah, 73h, 42h, 0d1h, 0e0h, 0d1h, 0e0h
        db      99h, 95h, 4fh, 49h, 0ach, 2ah, 05h, 70h, 35h, 0f6h, 0e8h, 0d1h, 0e0h, 03h, 0e8h, 4fh
        db      49h, 0ach, 2ah, 05h, 70h, 28h, 0f6h, 0e8h, 03h, 0e8h, 72h, 1fh, 4fh, 0e2h, 0f2h, 0a1h
        db      38h, 96h, 39h, 2eh, 36h, 96h, 1bh, 0c2h, 72h, 08h, 89h, 2eh, 36h, 96h, 89h, 16h
        db      38h, 96h, 5fh, 72h, 04h, 89h, 3eh, 3ah, 96h, 0fch, 0c3h, 42h, 0ebh, 0deh, 5fh, 0ebh
        db      0f8h, 0e8h, 63h, 0f0h, 53h, 0bbh, 96h, 0bh, 0d7h
        db      "[:G+u"
        db      01h, 0c3h, 88h, 47h, 2bh, 9ch, 0fah, 0e8h, 7ah, 55h, 0e8h, 05h, 00h, 0e8h, 1bh, 55h
        db      9dh, 0c3h, 9ch, 0fah, 8bh, 6fh, 10h, 8bh, 57h, 12h, 0c6h, 06h, 34h, 96h, 01h, 8bh
        db      47h, 38h, 0a3h, 70h, 96h, 0a3h, 44h, 96h, 8bh, 47h, 36h, 0a3h, 6eh, 96h, 03h, 0c5h
        db      11h, 16h, 44h, 96h, 2dh, 02h, 00h, 83h, 1eh, 42h, 96h, 00h, 81h, 0eh, 44h, 96h
        db      08h, 00h, 0a3h, 42h, 96h, 0d1h, 0eah, 0d1h, 0ddh, 80h, 7fh, 2ah, 00h, 74h, 20h, 81h
        db      26h, 44h, 96h, 07h, 00h, 0feh, 06h, 34h, 96h, 0d1h, 0eah, 0d1h, 0ddh, 0ffh, 36h, 42h
        db      96h, 0ffh, 36h, 44h, 96h, 0ffh, 36h, 6eh, 96h, 0ffh, 36h, 70h, 96h, 55h, 52h, 33h
        db      0c0h, 0b9h, 0f8h, 7fh, 3bh, 0cdh, 1bh, 0c2h, 73h, 1eh, 0e8h, 46h, 00h, 0b8h, 0f8h, 7fh
        db      2bh, 0e8h, 1bh, 0d1h, 0d1h, 0e0h, 01h, 06h, 6eh, 96h, 11h, 0eh, 70h, 96h, 29h, 06h
        db      42h, 96h, 19h, 0eh, 44h, 96h, 0ebh, 0d7h, 8bh, 0cdh, 0e8h, 26h, 00h, 0feh, 0eh, 34h
        db      96h, 74h, 1eh, 5ah, 5dh, 8fh, 06h, 70h, 96h, 8fh, 06h, 6eh, 96h, 80h, 0eh, 70h
        db      96h, 08h, 8fh, 06h, 44h, 96h, 8fh, 06h, 42h, 96h, 80h, 0eh, 44h, 96h, 08h, 0ebh
        db      0aeh, 9dh, 0c3h, 51h, 0a1h, 6eh, 96h, 8bh, 0f8h, 81h, 0e7h, 0fh, 00h, 25h, 0f0h, 0ffh
        db      0bh, 06h, 70h, 96h, 0b1h, 04h, 0d3h, 0c8h, 8eh, 0c0h, 0a1h, 42h, 96h, 8bh, 0f0h, 81h
        db      0ceh, 0f0h, 0ffh, 25h, 0f0h, 0ffh, 0bh, 06h, 44h, 96h, 0b1h, 04h, 0d3h, 0c8h, 2dh, 0ffh
        db      0fh, 73h, 06h, 33h, 0c0h, 8bh, 36h, 42h, 96h, 8eh, 0d8h, 59h, 26h, 8bh, 05h, 87h
        db      04h, 0abh, 4eh, 4eh, 0e2h, 0f6h, 33h, 0c0h, 8eh, 0d8h, 8eh, 0c0h, 0c3h, 0e8h, 0dch, 09h
        db      75h, 01h, 0c3h, 9ch, 0fah, 33h, 0c0h, 0a2h, 62h, 96h
        db      "8G*u"
        db      18h, 8bh, 47h, 10h, 8bh, 57h, 12h, 2bh, 47h, 1ch, 1bh, 57h, 1eh, 0e8h, 44h, 05h
        db      72h, 07h, 0feh, 0eh, 62h, 96h, 0e8h, 0d9h, 01h, 0bdh, 0eeh, 7ch, 8bh, 0fdh, 8bh, 0f3h
        db      0b9h, 3ch, 00h, 0f3h, 0a4h, 8bh, 77h, 36h, 89h, 36h, 42h, 96h, 8bh, 7fh, 38h, 89h
        db      3eh, 44h, 96h, 8bh, 47h, 20h, 8bh, 57h, 22h, 0d1h, 0e0h, 0d1h, 0d2h, 03h, 0c6h, 13h
        db      0d7h, 0a3h, 6eh, 96h, 89h, 16h, 70h, 96h, 89h, 4eh, 20h, 89h, 4eh, 22h, 0e8h, 0fdh
        db      04h, 05h, 01h, 00h, 13h, 0d1h, 25h, 0feh, 0ffh, 89h, 46h, 1ch, 89h, 56h, 1eh, 89h
        db      46h, 10h, 89h, 56h, 12h, 0a3h, 00h, 96h, 89h, 16h, 02h, 96h
        db      "8O*t"
        db      13h, 0d1h, 66h, 10h, 0d1h, 56h, 12h, 55h, 53h, 8dh, 5eh, 10h, 0e8h, 00h, 0efh, 5bh
        db      5dh, 0ebh, 1ah, 90h, 0e8h, 89h, 00h, 0a3h, 54h, 96h, 89h, 16h, 56h, 96h, 0beh, 6eh
        db      96h, 0e8h, 78h, 00h, 0c7h, 06h, 74h, 96h, 0bah, 13h, 0e8h, 83h, 00h, 8bh, 0f5h, 8bh
        db      0fbh, 0b9h, 3ch, 00h, 0f3h, 0a4h, 38h, 0eh, 62h, 96h, 74h, 03h, 0e8h, 43h, 01h, 53h
        db      0e8h, 0d5h, 0edh, 5bh, 0e8h, 0efh, 0ech, 9dh, 0e8h, 38h, 0f4h, 0e9h, 63h, 0fch, 3bh, 0c6h
        db      52h, 1bh, 0d7h, 5ah, 73h, 03h, 96h, 87h, 0fah, 0c3h, 01h, 0dh, 83h, 55h, 02h, 00h
        db      0a7h, 75h, 0eh, 0a7h, 75h, 0bh, 83h, 0efh, 04h, 8dh, 77h, 36h, 0a5h, 0adh, 0ch, 08h
        db      0abh, 0c3h, 56h, 0adh, 80h, 3ch, 08h, 72h, 07h, 75h, 1fh, 3dh, 00h, 0c0h, 73h, 1ah
        db      2bh, 06h, 54h, 96h, 8bh, 14h, 1bh, 16h, 56h, 96h, 72h, 0eh, 03h, 47h, 36h, 13h
        db      57h, 38h, 80h, 0cah, 08h, 89h, 14h, 89h, 44h, 0feh, 5eh, 0c3h, 56h, 0adh, 0ebh, 0e0h
        db      8bh, 47h, 36h, 8bh, 57h, 38h, 03h, 47h, 10h, 13h, 57h, 12h, 0c3h, 0f3h, 0a5h, 0c3h
        db      0c7h, 06h, 0a8h, 02h, 67h, 13h, 9ch, 0fah, 0e8h, 0e5h, 0ffh, 0a3h, 54h, 96h, 89h, 16h
        db      56h, 96h, 87h, 0ddh, 0e8h, 0d9h, 0ffh, 0a3h, 50h, 96h, 89h, 16h, 52h, 96h, 87h, 0ebh
        db      8bh, 36h, 00h, 96h, 8bh, 3eh, 02h, 96h, 0d1h, 0e6h, 0d1h, 0d7h, 0a1h, 54h, 96h, 8bh
        db      16h, 56h, 96h, 2bh, 06h, 6eh, 96h, 1bh, 16h, 70h, 96h, 0e8h, 60h, 0ffh, 81h, 3eh
        db      0a8h, 02h, 6ah, 15h, 74h, 12h, 0a1h, 50h, 96h, 8bh, 16h, 52h, 96h, 2bh, 06h, 42h
        db      96h, 1bh, 16h, 44h, 96h, 0e8h, 46h, 0ffh, 23h, 0ffh, 0b9h, 0f8h, 7fh, 75h, 13h, 23h
        db      0f6h, 75h, 02h, 9dh, 0c3h, 8bh, 0ceh, 0d1h, 0e9h, 81h, 0f9h, 0f9h, 7fh, 72h, 03h, 83h
        db      0e9h, 08h, 51h, 1eh, 06h, 51h, 0b1h, 04h, 0a1h, 6eh, 96h, 8bh, 0f0h, 81h, 0e6h, 0fh
        db      00h, 25h, 0f0h, 0ffh, 0bh, 06h, 70h, 96h, 0d3h, 0c8h, 50h, 0a1h, 42h, 96h, 8bh, 0f8h
        db      81h, 0e7h, 0fh, 00h, 25h, 0f0h, 0ffh, 0bh, 06h, 44h, 96h, 0d3h, 0c8h, 8eh, 0c0h, 1fh
        db      "YSU."
        db      0ffh, 16h, 74h, 96h, 5dh, 5bh, 07h, 1fh, 59h, 29h, 0eh, 00h, 96h, 83h, 1eh, 02h
        db      96h, 00h, 0d1h, 0e1h, 0bfh, 6eh, 96h, 0beh, 54h, 96h, 0e8h, 0e9h, 0feh, 0bfh, 42h, 96h
        db      0beh, 50h, 96h, 87h, 0ddh, 0ffh, 16h, 0a8h, 02h, 87h, 0ebh, 0e9h, 4eh, 0ffh, 8bh, 47h
        db      10h, 8bh, 57h, 12h, 8bh, 0f0h, 8bh, 0fah, 2bh, 47h, 1ch, 1bh, 57h, 1eh, 87h, 47h
        db      20h, 87h, 57h, 22h, 2bh, 0f0h, 1bh, 0fah, 89h, 77h, 1ch, 89h, 7fh, 1eh, 0e9h, 0dfh
        db      0fch, 0e8h, 0b6h, 07h, 75h, 01h, 0c3h, 83h, 7fh, 12h, 00h, 75h, 07h, 81h, 7fh, 10h
        db      0c8h, 00h, 72h, 07h, 81h, 7fh, 14h, 0b8h, 0bh, 73h, 06h, 0b8h, 0d1h, 7bh, 0e9h, 0bah
        db      0eh, 9ch, 0fah, 8bh, 0f3h, 0bfh, 0eeh, 7ch, 0b9h, 3ch, 00h, 0f3h, 0a4h, 83h, 47h, 10h
        db      02h, 83h, 57h, 12h, 00h, 81h, 67h, 10h, 0fch, 0ffh, 0d1h, 6fh, 12h, 0d1h, 5fh, 10h
        db      0d1h, 6fh, 22h, 0d1h, 5fh, 20h, 0d1h, 6fh, 1eh, 0d1h, 5fh, 1ch, 0d1h, 6fh, 26h, 0d1h
        db      5fh, 24h, 0d1h, 6fh, 14h, 8bh, 0ebh, 0bbh, 0eeh, 7ch, 8dh, 77h, 10h, 0bfh, 00h, 96h
        db      0a5h, 0a5h, 8dh, 77h, 36h, 56h, 0bfh, 6eh, 96h, 0a5h, 0a5h, 5eh, 0bfh, 42h, 96h, 0a5h
        db      0a5h, 0c7h, 06h, 74h, 96h, 41h, 15h, 0c7h, 06h, 0a8h, 02h, 6ah, 15h, 0b8h, 00h, 80h
        db      0a3h, 5eh, 96h, 0a2h, 5ch, 96h, 0e8h, 89h, 0feh, 8bh, 1eh, 84h, 95h, 0e9h, 0bh, 0feh
        db      55h, 0bdh, 5ah, 96h, 0c7h, 46h, 00h, 00h, 00h, 0adh, 80h, 0c4h, 80h, 0f6h, 46h, 02h
        db      01h, 75h, 0ch, 03h, 46h, 04h, 0d1h, 0d8h, 80h, 0c4h, 80h, 0abh, 0ffh, 46h, 00h, 89h
        db      46h, 04h, 0feh, 46h, 02h, 0e2h, 0e2h, 5dh, 0c3h, 51h, 8bh, 0eh, 5ah, 96h, 0d1h, 0e1h
        db      0e8h, 0f3h, 0fdh, 59h, 0c3h, 0e8h, 5fh, 0ech, 8bh, 0d6h, 0e8h, 9ch, 0eh, 72h, 16h, 3bh
        db      1eh, 0d6h, 7ch, 74h, 10h, 89h, 1eh, 0d6h, 7ch, 9ch, 0fah, 0e8h, 74h, 51h, 0e8h, 18h
        db      51h, 0e8h, 0aah, 4ch, 9dh, 0c3h, 0e8h, 2ch, 07h, 0e8h, 14h, 0f3h, 0e9h, 0dah, 18h, 0e8h
        db      23h, 07h, 0ebh, 0f8h, 0c3h, 0e8h, 2fh, 0ech, 75h, 01h, 0c3h, 0c7h, 06h, 0a2h, 02h, 0c7h
        db      05h, 0c6h, 04h, 20h, 0bbh, 0f1h, 0bh, 0d7h, 0a2h, 76h, 96h, 0e8h, 38h, 0f7h, 8bh, 0fbh
        db      8bh, 36h, 84h, 95h, 0b9h, 3ch, 00h, 0f3h, 0a4h, 89h, 1eh, 78h, 96h, 89h, 2eh, 72h
        db      96h, 0bah, 0c7h, 05h, 0e8h, 3eh, 0eh, 72h, 0dh, 89h, 1eh, 78h, 96h, 89h, 2eh, 72h
        db      96h, 0e8h, 0bch, 0bh, 0ebh, 03h, 0e8h, 0fch, 0ebh, 0e8h, 38h, 0ebh, 0bah, 9fh, 05h, 0e8h
        db      23h, 0eh, 73h, 03h, 0e9h, 0c6h, 0f9h, 8bh, 2eh, 84h, 95h, 80h, 3eh, 76h, 96h, 4ch
        db      75h, 02h, 87h, 0ebh, 89h, 1eh, 4ah, 96h, 89h, 2eh, 6ch, 96h, 8bh, 76h, 1ch, 8bh
        db      7eh, 1eh, 2bh, 76h, 20h, 1bh, 7eh, 22h, 0e8h, 0cfh, 01h, 0e8h, 3ch, 0fdh, 9ch, 3bh
        db      36h, 0dh, 0ch, 57h, 83h, 0dfh, 00h, 5fh, 73h, 04h, 89h, 36h, 0dh, 0ch, 80h, 3eh
        db      76h, 96h, 54h, 75h, 0dh, 9dh, 73h, 16h, 89h, 2eh, 4ah, 96h, 89h, 1eh, 6ch, 96h
        db      0ebh, 0ch, 9dh, 03h, 0c6h, 13h, 0d7h, 2bh, 06h, 0dh, 0ch, 83h, 0dah, 00h, 50h, 52h
        db      0e8h, 9bh, 14h, 8bh, 0f0h, 8bh, 0fah, 5ah, 58h, 74h, 07h, 0f9h, 1bh, 0d8h, 1bh, 0cah
        db      73h, 06h, 0b8h, 0e3h, 7bh, 0e9h, 23h, 0dh, 8bh, 1eh, 72h, 96h, 0c6h, 07h, 53h, 8bh
        db      1eh, 78h, 96h, 89h, 77h, 36h, 89h, 7fh, 38h, 89h, 36h, 42h, 96h, 89h, 3eh, 44h
        db      96h, 89h, 47h, 1ch, 89h, 57h, 1eh, 05h, 01h, 00h, 83h, 0d2h, 00h, 25h, 0feh, 0ffh
        db      89h, 47h, 10h, 89h, 57h, 12h, 8bh, 36h, 0a2h, 02h, 8bh, 0fbh, 0b9h, 05h, 00h, 0f3h
        db      0a5h, 89h, 4fh, 20h, 89h, 4fh, 22h, 0c6h, 47h, 2ah, 00h, 9ch, 0fah, 0e8h, 0e0h, 01h
        db      8bh, 1eh, 4ah, 96h, 0e8h, 40h, 01h, 0e8h, 01h, 01h, 80h, 3eh, 76h, 96h, 54h, 74h
        db      05h, 0e8h, 0d7h, 01h, 74h, 1eh, 0a3h, 00h, 96h, 89h, 16h, 02h, 96h, 0c7h, 06h, 74h
        db      96h, 0c8h, 18h, 0e8h, 0ddh, 01h, 80h, 3eh, 76h, 96h, 54h, 74h, 0ah, 83h, 3eh, 0dh
        db      0ch, 00h, 74h, 40h, 0ebh, 70h, 90h, 0c7h, 06h, 74h, 96h, 0d8h, 18h, 8dh, 76h, 36h
        db      0bfh, 42h, 96h, 0a5h, 0a5h, 83h, 3eh, 0dh, 0ch, 00h, 74h, 28h, 8bh, 1eh, 6ch, 96h
        db      0e8h, 0f4h, 00h, 0e8h, 0b5h, 00h, 0e8h, 92h, 01h, 74h, 0ah, 0a3h, 00h, 96h, 89h, 16h
        db      02h, 96h, 0e8h, 9eh, 01h, 0e8h, 5bh, 01h, 0c7h, 06h, 74h, 96h, 20h, 19h, 0e8h, 86h
        db      01h, 0ebh, 1dh, 90h, 8bh, 1eh, 6ch, 96h, 0e8h, 90h, 00h, 0a3h, 00h, 96h, 89h, 16h
        db      02h, 96h, 0e8h, 0c2h, 00h, 33h, 0c0h, 0a3h, 68h, 96h, 0a3h, 6ah, 96h, 0e8h, 73h, 01h
        db      0e8h, 0deh, 06h, 8bh, 1eh, 78h, 96h, 0c7h, 47h, 28h, 00h, 00h, 0e8h, 0f3h, 0e8h, 9dh
        db      0e8h, 4eh, 05h, 0e9h, 64h, 0f8h, 0e8h, 1ah, 01h, 0c7h, 06h, 74h, 96h, 0f5h, 18h, 0ffh
        db      36h, 42h, 96h, 0ffh, 36h, 44h, 96h, 0e8h, 3dh, 01h, 8fh, 06h, 44h, 96h, 8fh, 06h
        db      42h, 96h, 8bh, 1eh, 6ch, 96h, 0e8h, 7eh, 00h, 0e8h, 3fh, 00h, 50h, 52h, 33h, 0c0h
        db      8bh, 0c8h, 0a3h, 64h, 96h, 87h, 06h, 66h, 96h, 99h, 0f7h, 36h, 0dh, 0ch, 91h, 0f7h
        db      36h, 0dh, 0ch, 05h, 01h, 00h, 0a3h, 68h, 96h, 83h, 0d1h, 00h, 89h, 0eh, 6ah, 96h
        db      0c7h, 06h, 74h, 96h, 20h, 19h, 0e8h, 0feh, 00h, 5ah, 58h, 0e8h, 0edh, 00h, 75h, 02h
        db      0ebh, 8eh, 0c7h, 06h, 74h, 96h, 0c8h, 18h, 0e9h, 70h, 0ffh, 0e8h, 0eeh, 0fbh, 05h, 01h
        db      00h, 83h, 0d2h, 00h, 24h, 0feh, 0a3h, 54h, 96h, 89h, 16h, 56h, 96h, 8bh, 47h, 20h
        db      8bh, 57h, 22h, 0d1h, 0e0h, 0d1h, 0d2h, 03h, 47h, 36h, 13h, 57h, 38h, 0a3h, 6eh, 96h
        db      89h, 16h, 70h, 96h, 0beh, 6eh, 96h, 0e8h, 0beh, 0fbh, 8bh, 47h, 1ch, 8bh, 57h, 1eh
        db      2bh, 47h, 20h, 1bh, 57h, 22h, 0c3h, 53h, 0c7h, 06h, 64h, 96h, 00h, 00h, 8bh, 47h
        db      18h, 04h, 32h, 98h, 0bbh, 0eh, 18h, 0d7h, 0a3h, 66h, 96h, 5bh, 0c3h, 00h, 01h, 02h
        db      02h, 02h, 02h, 02h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 03h, 04h, 04h, 04h, 04h
        db      04h, 04h, 05h, 05h, 05h, 05h, 05h, 06h, 06h, 06h, 06h, 07h, 07h, 07h, 08h, 08h
        db      08h, 09h, 09h, 0ah, 0ah, 0ah, 0bh, 0bh, 0ch, 0ch, 0dh, 0dh, 0eh, 0fh, 0fh, 10h
        db      11h, 11h, 12h, 13h, 14h, 15h, 16h, 17h, 18h, 19h, 1ah, 1bh, 1ch, 1dh, 1fh
        db      " !#$&()+-/1468;=@CFILOSW[_cglpu{"
        db      7fh, 7fh, 7fh, 7fh, 33h, 0c0h, 8bh, 0c8h, 0a3h, 64h, 96h, 0a1h, 66h, 96h, 99h, 0f7h
        db      36h, 0dh, 0ch, 91h, 0f7h, 36h, 0dh, 0ch, 29h, 06h, 68h, 96h, 19h, 0eh, 6ah, 96h
        db      0c3h, 33h, 0c0h, 0bfh, 64h, 96h, 0b9h, 04h, 00h, 0f3h, 0abh, 0c3h, 2bh, 06h, 0dh, 0ch
        db      83h, 0dah, 00h, 8bh, 0c8h, 0bh, 0cah, 0c3h, 0a1h, 0dh, 0ch, 33h, 0d2h, 0a3h, 00h, 96h
        db      89h, 16h, 02h, 96h, 8bh, 2eh, 78h, 96h, 0c7h, 06h, 10h, 00h, 0c1h, 18h, 0e9h, 0fch
        db      0fah, 92h, 99h, 92h, 35h, 0ffh, 7fh, 0cfh, 2eh, 8bh, 2eh, 66h, 96h, 0adh, 0c1h, 0f8h
        db      04h, 0f7h, 0edh, 0ceh, 0abh, 0e2h, 0f6h, 0c3h, 2eh, 8bh, 2eh, 66h, 96h, 0adh, 0c1h, 0f8h
        db      04h, 0f7h, 0edh, 0ceh, 26h, 03h, 05h, 70h, 04h, 0abh, 0e2h, 0f1h, 0c3h, 99h, 0d1h, 0dah
        db      92h, 0abh, 0e2h, 0e9h, 0c3h, 0bdh, 64h, 96h, 0adh, 0c1h, 0f8h, 04h, 0f7h, 6eh, 01h, 8ah
        db      0c4h, 8ah, 0e2h, 8ah, 0feh, 99h, 3ah, 0f7h, 74h, 06h, 93h, 99h, 92h, 35h, 0ffh, 7fh
        db      0abh, 8bh, 46h, 04h, 01h, 46h, 00h, 8bh, 46h, 06h, 11h, 46h, 02h, 0e2h, 0d9h, 0c3h
        db      0bdh, 64h, 96h, 0adh, 0c1h, 0f8h, 04h, 0f7h, 6eh, 01h, 8ah, 0c4h, 8ah, 0e2h, 8ah, 0feh
        db      99h, 3ah, 0f7h, 74h, 06h, 93h, 99h, 92h, 35h, 0ffh, 7fh, 26h, 03h, 05h, 70h, 10h
        db      0abh, 8bh, 46h, 04h, 01h, 46h, 00h, 8bh, 46h, 06h, 11h, 46h, 02h, 0e2h, 0d4h, 0c3h
        db      99h, 0d1h, 0dah, 92h, 0ebh, 0eah, 0e8h, 7fh, 0e8h, 75h, 01h, 0c3h, 0c6h, 04h, 20h, 80h
        db      7fh, 2ah, 00h, 75h, 03h, 0e9h, 12h, 15h, 0a2h, 0aeh, 02h, 0bah, 0dbh, 06h, 0e8h, 48h
        db      0f4h, 0e8h, 72h, 0e8h, 0e8h, 78h, 11h, 50h, 52h, 74h, 16h, 8bh, 2eh, 84h, 95h, 0a1h
        db      50h, 0ch, 99h, 03h, 0c0h, 03h, 46h, 10h, 13h, 56h, 12h, 2bh, 0d8h, 1bh, 0cah, 73h
        db      03h, 0e9h, 0cfh, 0fch, 50h, 52h, 0e8h, 5eh, 0f3h, 0c6h, 46h, 00h, 53h, 8bh, 0fbh, 8bh
        db      36h, 84h, 95h, 0b9h, 3ch, 00h, 0f3h, 0a4h, 8bh, 0fbh, 0beh, 0dbh, 06h, 0b9h, 0ah, 00h
        db      0f3h, 0a4h, 8fh, 47h, 12h, 8fh, 47h, 10h, 8fh, 47h, 38h, 8fh, 47h, 36h, 0e8h, 7bh
        db      00h, 8bh, 0ebh, 8bh, 1eh, 84h, 95h, 0c7h, 06h, 74h, 96h, 0bah, 13h, 0bfh, 00h, 00h
        db      8bh, 0f7h, 80h, 3eh, 0aeh, 02h, 31h, 75h, 01h, 4eh, 0e8h, 24h, 00h, 0bfh, 08h, 00h
        db      0beh, 00h, 00h, 80h, 3eh, 0aeh, 02h, 32h, 75h, 01h, 4eh, 0e8h, 13h, 00h, 8bh, 0ddh
        db      0c7h, 47h, 28h, 00h, 00h, 0e8h, 4bh, 0e6h, 0e8h, 27h, 04h, 0e8h, 92h, 0edh, 0e9h, 79h
        db      14h, 8bh, 47h, 36h, 0a3h, 6eh, 96h, 8bh, 47h, 38h, 0bh, 0c7h, 0a3h, 70h, 96h, 8bh
        db      46h, 36h, 8bh, 56h, 38h, 8bh, 0eh, 50h, 0ch, 23h, 0ceh, 03h, 0c9h, 03h, 0c1h, 13h
        db      0d7h, 0a3h, 42h, 96h, 89h, 16h, 44h, 96h, 8bh, 47h, 10h, 8bh, 57h, 12h, 0d1h, 0eah
        db      0d1h, 0d8h, 0a3h, 00h, 96h, 89h, 16h, 02h, 96h, 0e9h, 81h, 0f9h, 0c6h, 06h, 79h, 2fh
        db      33h, 0e8h, 97h, 1fh, 0feh, 0eh, 79h, 2fh, 0e9h, 90h, 1fh, 0e8h, 1dh, 02h, 75h, 01h
        db      0c3h, 0bah, 8eh, 06h, 0e8h, 62h, 0f3h, 8bh, 1eh, 84h, 95h, 80h, 7fh, 2ah, 00h, 75h
        db      03h, 0e9h, 0b8h, 00h, 0e8h, 0b5h, 00h, 0bfh, 0eeh, 7ch, 0b9h, 3ch, 00h, 03h, 0f9h, 8bh
        db      0f7h, 87h, 36h, 84h, 95h, 8bh, 0dfh, 0f3h, 0a4h, 8bh, 47h, 10h, 8bh, 57h, 12h, 0d1h
        db      0eah, 0d1h, 0d8h, 01h, 47h, 20h, 11h, 57h, 22h, 01h, 47h, 1ch, 11h, 57h, 1eh, 0ffh
        db      36h, 8eh, 06h, 0c6h, 06h, 8eh, 06h, 24h, 0e8h, 81h, 00h, 0bah, 8eh, 06h, 0e8h, 75h
        db      09h, 89h, 1eh, 0eeh, 7ch, 0e8h, 0f9h, 06h, 8fh, 06h, 8eh, 06h, 0e8h, 67h, 09h, 8bh
        db      2eh, 0eeh, 7ch, 8bh, 47h, 36h, 0a3h, 6eh, 96h, 8bh, 47h, 38h, 0ch, 08h, 0a3h, 70h
        db      96h, 8bh, 46h, 36h, 0a3h, 42h, 96h, 8bh, 46h, 38h, 0a3h, 44h, 96h, 0c7h, 06h, 74h
        db      96h, 12h, 1bh, 8bh, 47h, 10h, 8bh, 57h, 12h, 0d1h, 0eah, 0d1h, 0d8h, 0a3h, 00h, 96h
        db      89h, 16h, 02h, 96h, 0e8h, 0d6h, 0f8h, 0c6h, 47h, 2ah, 0ffh, 8dh, 76h, 36h, 0bfh, 3eh
        db      96h, 57h, 8bh, 47h, 36h, 03h, 47h, 10h, 0abh, 8bh, 47h, 38h, 13h, 47h, 12h, 0abh
        db      5fh, 53h, 8dh, 5eh, 10h, 0e8h, 02h, 0e7h, 5bh, 0d1h, 67h, 10h, 0d1h, 57h, 12h, 0e9h
        db      0e3h, 0feh, 26h, 8bh, 05h, 0a5h, 89h, 44h, 0feh, 0e2h, 0f7h, 0c3h, 0e8h, 30h, 01h, 8bh
        db      0f3h, 0bfh, 0eeh, 7ch, 8bh, 0efh, 0b9h, 3ch, 00h, 0f3h, 0a4h, 80h, 7fh, 1ah, 41h, 74h
        db      50h, 8bh, 77h, 24h, 8bh, 7fh, 26h, 8bh, 47h, 1ch, 8bh, 57h, 1eh, 2bh, 0c6h, 1bh
        db      0d7h, 50h, 52h, 0e8h, 0abh, 0fch, 0e8h, 12h, 0f8h, 0a1h, 86h, 0ch, 99h, 0e8h, 0bh, 0f8h
        db      89h, 36h, 86h, 0ch, 5ah, 58h, 89h, 46h, 1ch, 89h, 56h, 1eh, 2bh, 0c6h, 1bh, 0d7h
        db      89h, 46h, 20h, 89h, 56h, 22h, 0c7h, 06h, 0a2h, 02h, 8eh, 06h, 0c6h, 06h, 76h, 96h
        db      46h, 0a1h, 86h, 0ch, 87h, 06h, 0dh, 0ch, 50h, 0e8h, 89h, 0fah, 8fh, 06h, 0dh, 0ch
        db      0c3h, 8bh, 47h, 24h, 8bh, 57h, 26h, 0d1h, 0eah, 75h, 0bh, 0d1h, 0d8h, 39h, 06h, 86h
        db      0ch, 72h, 03h, 0a3h, 86h, 0ch, 0ffh, 36h, 0ceh, 02h, 0c6h, 06h, 0ceh, 02h, 24h, 0e8h
        db      30h, 0f1h, 8bh, 1eh, 84h, 95h, 8bh, 47h, 1ch, 8bh, 57h, 1eh, 2bh, 47h, 24h, 1bh
        db      57h, 26h, 89h, 47h, 20h, 89h, 57h, 22h, 50h, 52h, 0ffh, 0eh, 0a6h, 02h, 0e8h, 0d1h
        db      0f6h, 0ffh, 06h, 0a6h, 02h, 8bh, 1eh, 84h, 95h, 0e8h, 0c5h, 0f5h, 8bh, 36h, 60h, 96h
        db      0bbh, 0eeh, 7ch, 8bh, 0fbh, 0b9h, 3ch, 00h, 0f3h, 0a4h, 5ah, 58h, 89h, 47h, 20h, 89h
        db      57h, 22h, 03h, 06h, 86h, 0ch, 13h, 0d1h, 89h, 47h, 1ch, 89h, 57h, 1eh, 0e8h, 5eh
        db      00h, 0c7h, 06h, 0a2h, 02h, 96h, 1bh, 0bdh, 0eeh, 7ch, 0e8h, 6fh, 0ffh, 0bah, 0ceh, 02h
        db      0e8h, 0b6h, 0f1h, 8fh, 06h, 0ceh, 02h, 8bh, 1eh, 60h, 96h, 89h, 1eh, 84h, 95h, 0e8h
        db      3dh, 00h, 8bh, 1eh, 78h, 96h, 0c6h, 47h, 1ah, 4ch, 8bh, 47h, 24h, 8bh, 57h, 26h
        db      2bh, 06h, 86h, 0ch, 83h, 0dah, 00h, 03h, 0c0h, 13h, 0d2h, 89h, 47h, 24h, 89h, 57h
        db      26h, 0bah, 96h, 1bh, 0e8h, 0dfh, 07h, 8bh, 0ebh, 8bh, 1eh, 84h, 95h, 0c7h, 06h, 0a2h
        db      02h, 8eh, 06h, 0e8h, 26h, 0ffh, 0bah, 96h, 1bh, 0e8h, 6dh, 0f1h, 0e9h, 41h, 0ebh, 0e8h
        db      94h, 0e5h, 0e8h, 0a2h, 0f0h, 89h, 1eh, 78h, 96h, 89h, 2eh, 72h, 96h, 8bh, 0fbh, 8bh
        db      1eh, 84h, 95h, 8bh, 0f3h, 0b9h, 3ch, 00h, 0f3h, 0a4h, 0c3h, 0e8h, 43h, 33h, 87h, 0feh
        db      8bh, 1eh, 84h, 95h, 80h, 3eh, 6fh, 95h, 00h, 75h, 01h, 0c3h, 0c6h, 06h, 6fh, 95h
        db      00h, 0c3h, 60h, 8bh, 36h, 84h, 95h, 0bfh, 84h, 0a0h, 80h, 65h, 12h, 0fdh, 80h, 7ch
        db      2ah, 00h, 74h, 04h, 80h, 4dh, 12h, 02h, 83h, 0c7h, 18h, 0b9h, 05h, 00h, 0f3h, 0a5h
        db      61h, 0c3h, 0e8h, 52h, 0e5h, 0bdh, 29h, 0ch, 0e8h, 4eh, 33h, 0e8h, 49h, 0e5h, 0bdh, 0f7h
        db      0ah, 0e8h, 45h, 33h, 0e8h, 40h, 0e5h, 0bdh, 8ch, 0ch, 0e8h, 3ch, 33h, 0e8h, 37h, 0e5h
        db      0bdh, 56h, 0ch, 0e9h, 33h, 33h, 60h, 0e8h, 0e7h, 32h, 8bh, 0d7h, 0e8h, 47h, 07h, 0b0h
        db      20h, 72h, 09h, 80h, 7fh, 2ah, 00h, 74h, 03h, 0b8h, 04h, 00h, 8bh, 0fah, 88h, 45h
        db      0ah, 61h, 0c3h
        endif
