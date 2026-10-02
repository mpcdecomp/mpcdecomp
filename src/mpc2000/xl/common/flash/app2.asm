; app2 -- MPC2000XL flash: INT 8Fh display service.
; v1.20 0x1a9b6-0x2310a (34644 bytes), v1.14 0x1a4b6-0x23088 (35794 bytes),
; v1.12 0x1a2f6-0x22e98 (35746 bytes).
; v1.11 0x1a296-0x22e18 (35714 bytes), v1.10 0x1a286-0x22e08 (35714 bytes).
; 32-entry dispatch table 0x1a9d6 (INT 90h owns the next byte) and the handlers;
; the 6-byte entry 0x1a9b0 ends the RAM frame (ram.asm).  Then the LCD driver --
; left half 60h/62h, right half 100h/102h -- and the screen code that drives it.

APP2_CSBASE set     APP2_SEG*16-SEGBASE

        if      FW_VERSION >= 110
        db      0ddh
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
        dw      disp_svc_init-APP2_CSBASE, disp_svc8f_flush-APP2_CSBASE, disp_svc8f_clear-APP2_CSBASE, disp_svc8f_font-APP2_CSBASE
        dw      disp_svc8f_char-APP2_CSBASE, disp_svc8f_text-APP2_CSBASE, disp_svc8f_msg-APP2_CSBASE, disp_svc_plane0-APP2_CSBASE
        dw      disp_svc8f_num-APP2_CSBASE, disp_svc8f_num0-APP2_CSBASE, disp_svc8f_numr-APP2_CSBASE, disp_svc8f_hex8-APP2_CSBASE
        dw      disp_svc8f_hex16-APP2_CSBASE, disp_svc8f_clip-APP2_CSBASE, disp_svc8f_hline-APP2_CSBASE, disp_svc8f_vline-APP2_CSBASE
        dw      disp_svc8f_hdots-APP2_CSBASE, disp_svc8f_vdots-APP2_CSBASE, disp_svc8f_box-APP2_CSBASE, disp_svc8f_fill-APP2_CSBASE
        dw      disp_svc8f_erase-APP2_CSBASE, disp_svc8f_invert-APP2_CSBASE, disp_svc8f_bmp-APP2_CSBASE, disp_svc8f_bmp_erase-APP2_CSBASE
        dw      disp_svc8f_bmp_invert-APP2_CSBASE, disp_svc8f_softkey-APP2_CSBASE, disp_svc8f_pixel-APP2_CSBASE, disp_svc_nop-APP2_CSBASE
        dw      disp_svc8f_win-APP2_CSBASE, disp_svc_nop-APP2_CSBASE, disp_svc8f_text_idx-APP2_CSBASE, disp_svc8f_plane-APP2_CSBASE
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
        dw      disp_svc_init-APP2_CSBASE, disp_svc_flush-APP2_CSBASE, disp_svc_clear-APP2_CSBASE, disp_svc_font-APP2_CSBASE
        dw      disp_svc_char-APP2_CSBASE, disp_svc_text-APP2_CSBASE, disp_svc_msg-APP2_CSBASE, disp_svc_plane0-APP2_CSBASE
        dw      disp_svc_num-APP2_CSBASE, disp_svc_num0-APP2_CSBASE, disp_svc_numr-APP2_CSBASE, disp_svc_hex8-APP2_CSBASE
        dw      disp_svc_hex16-APP2_CSBASE, disp_svc_clip-APP2_CSBASE, disp_svc_hline-APP2_CSBASE, disp_svc_vline-APP2_CSBASE
        dw      disp_svc_hdots-APP2_CSBASE, disp_svc_vdots-APP2_CSBASE, disp_svc_box-APP2_CSBASE, disp_svc_fill-APP2_CSBASE
        dw      disp_svc_erase-APP2_CSBASE, disp_svc_invert-APP2_CSBASE, disp_svc_bmp-APP2_CSBASE, disp_svc_bmp_erase-APP2_CSBASE
        dw      disp_svc_bmp_invert-APP2_CSBASE, disp_svc_softkey-APP2_CSBASE, disp_svc_nop-APP2_CSBASE, disp_svc_nop-APP2_CSBASE
        dw      disp_svc_win-APP2_CSBASE, disp_svc_nop-APP2_CSBASE, disp_svc_text_idx-APP2_CSBASE, disp_svc_plane-APP2_CSBASE
disp_svc_nop:
        ret
disp_svc_init:
        mov     al, 23h
        endif
        call    xl_io_out_port_60_site1
        mov     al, 85h
        call    xl_io_wait_port_60_site1
        call    xl_io_out_port_62_site1
        mov     al, 24h
        call    xl_io_out_port_60_site1
        mov     al, 1
        call    xl_io_wait_port_60_site1
        call    xl_io_out_port_62_site1
        mov     al, 23h
        call    xl_io_out_port_100_site1
        mov     al, 8dh
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        mov     al, 24h
        call    xl_io_out_port_100_site1
        mov     al, 1
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        call    fn_1ABD3
        mov     bl, 0
loop_1AAAD:
        mov     al, 22h
        call    xl_io_out_port_60_site1
        mov     al, bl
        call    xl_io_wait_port_60_site1
        call    xl_io_out_port_62_site1
        mov     al, 21h
        call    xl_io_out_port_60_site1
        mov     al, 0
        call    xl_io_wait_port_60_site1
        call    xl_io_out_port_62_site1
        mov     al, 20h
        call    xl_io_out_port_60_site1
        mov     cx, 14h
tgt_1AACF:
        mov     al, 0
        call    xl_io_wait_port_60_site1
        call    xl_io_out_port_62_site1
        loop    tgt_1AACF
        inc     bl
        cmp     bl, 41h
        jne     loop_1AAAD
        call    fn_1ABD3
        mov     bl, 0
loop_1AAE5:
        mov     al, 22h
        call    xl_io_out_port_100_site1
        mov     al, bl
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        mov     al, 21h
        call    xl_io_out_port_100_site1
        mov     al, 0
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        mov     al, 20h
        call    xl_io_out_port_100_site1
        mov     cx, 14h
tgt_1AB07:
        mov     al, 0
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        loop    tgt_1AB07
        inc     bl
        cmp     bl, 41h
        jne     loop_1AAE5
        call    fn_1ABD3
        mov     cx, 0
        mov     bl, 64h
loop_1AB20:
        push    cx
        push    bx
        mov     al, 22h
        call    xl_io_out_port_100_site1
        mov     al, cl
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        mov     al, 21h
        call    xl_io_out_port_100_site1
        mov     al, bl
        sub     ah, ah
        mov     cl, 8
        div     cl
        mov     bl, ah
        sub     bh, bh
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        mov     al, 20h
        call    xl_io_out_port_100_site1
        mov     al, byte ptr [bx+A2_B_075B7]
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        pop     bx
        pop     cx
        inc     bl
        inc     cl
        cmp     cl, 3ch
        jne     loop_1AB20
        mov     al, 23h
        call    xl_io_out_port_60_site1
        mov     al, 5
        call    xl_io_wait_port_60_site1
        call    xl_io_out_port_62_site1
        mov     al, 24h
        call    xl_io_out_port_60_site1
        mov     al, 1
        call    xl_io_wait_port_60_site1
        call    xl_io_out_port_62_site1
        mov     al, 23h
        call    xl_io_out_port_100_site1
        mov     al, 2dh
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        mov     al, 24h
        call    xl_io_out_port_100_site1
        mov     al, 1
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        call    fn_1ABD3
        call    fn_1AD2C
        ret
        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
xl_io_out_port_60_site1:
        mov     dx, 60h
        out     dx, al
        ret
xl_io_out_port_62_site1:
        mov     dx, 62h
        out     dx, al
        ret
xl_io_wait_port_60_site1:
        push    ax
        push    cx
        mov     cx, 0ffffh
tgt_1ABAA:
        mov     dx, 60h
        in      al, dx
        test    al, 80h
        je      br_1ABB4
        loop    tgt_1ABAA
br_1ABB4:
        pop     cx
        pop     ax
        ret
xl_io_out_port_100_site1:
        mov     dx, 100h
        out     dx, al
        ret
xl_io_out_port_102_site1:
        mov     dx, 102h
        out     dx, al
        ret
xl_io_wait_port_100_site1:
        push    ax
        push    cx
        mov     cx, 0ffffh
tgt_1ABC6:
        mov     dx, 100h
        in      al, dx
        test    al, 80h
        je      br_1ABD0
        loop    tgt_1ABC6
br_1ABD0:
        pop     cx
        pop     ax
        ret
fn_1ABD3:
        push    cx
        mov     cx, 2710h
loop_1ABD7:
        dec     cx
        jne     loop_1ABD7
        pop     cx
        ret
fn_1ABDC:
disp_svc_flush:
disp_svc8f_flush:
        cmp     word ptr [A2_W_LCD_DRAW_PLANE], A2_W_06E22
        je      br_1ABEE
        cmp     byte ptr [A2_B_LCD_PLANE_B_SEL], 0
        jne     br_1ABEE
        jmp     NEAR br_1AC85
br_1ABEE:
        mov     si, word ptr [A2_W_LCD_DRAW_PLANE]
        sub     bx, bx
        mov     cx, 3ch
loop_1ABF7:
        call    fn_1AC02
        inc     bl
        cmp     bl, 20h
        jne     loop_1ABF7
        ret
fn_1AC02:
        cmp     bl, 14h
        jae     br_1AC45
        push    bx
        push    cx
        mov     al, 22h
        call    xl_io_out_port_60_site1
        mov     al, 0
        call    xl_io_wait_port_60_site1
        call    xl_io_out_port_62_site1
        mov     al, 21h
        call    xl_io_out_port_60_site1
        mov     al, bl
        call    xl_io_wait_port_60_site1
        call    xl_io_out_port_62_site1
        mov     al, 20h
        call    xl_io_out_port_60_site1
        sub     bh, bh
tgt_1AC2A:
        mov     ah, byte ptr [bx+si]
        mov     dx, 60h
        in      al, dx
        shl     al, 1
        je      br_1AC37
        call    xl_io_wait_port_60_site1
br_1AC37:
        mov     al, ah
        mov     dx, 62h
        out     dx, al
        add     bx, 20h
        loop    tgt_1AC2A
        pop     cx
        pop     bx
        ret
br_1AC45:
        push    bx
        push    cx
        mov     al, 22h
        call    xl_io_out_port_100_site1
        mov     al, 0
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        mov     al, 21h
        call    xl_io_out_port_100_site1
        mov     al, bl
        sub     al, 14h
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        mov     al, 20h
        call    xl_io_out_port_100_site1
        sub     bh, bh
tgt_1AC6A:
        mov     ah, byte ptr [bx+si]
        mov     dx, 100h
        in      al, dx
        shl     al, 1
        je      br_1AC77
        call    xl_io_wait_port_100_site1
br_1AC77:
        mov     al, ah
        mov     dx, 102h
        out     dx, al
        add     bx, 20h
        loop    tgt_1AC6A
        pop     cx
        pop     bx
        ret
        if      FW_VERSION >= 111
br_1AC85:
        else
BR_1AC85:
        endif
        sub     bx, bx
        mov     cx, 3ch
loop_1AC8A:
        call    fn_1AC95
        inc     bl
        cmp     bl, 20h
        jne     loop_1AC8A
        ret
fn_1AC95:
        cmp     bl, 14h
        jae     br_1ACE2
        push    bx
        push    cx
        mov     al, 22h
        call    xl_io_out_port_60_site1
        mov     al, 0
        call    xl_io_wait_port_60_site1
        call    xl_io_out_port_62_site1
        mov     al, 21h
        call    xl_io_out_port_60_site1
        mov     al, bl
        call    xl_io_wait_port_60_site1
        call    xl_io_out_port_62_site1
        mov     al, 20h
        call    xl_io_out_port_60_site1
        sub     bh, bh
tgt_1ACBD:
        mov     ah, byte ptr [bx+P_57A2]
        or      ah, byte ptr [bx+A2_W_05F22]
        xor     ah, byte ptr [bx+A2_W_066A2]
        mov     dx, 60h
        in      al, dx
        shl     al, 1
        je      br_1ACD4
        call    xl_io_wait_port_60_site1
br_1ACD4:
        mov     al, ah
        mov     dx, 62h
        out     dx, al
        add     bx, 20h
        loop    tgt_1ACBD
        pop     cx
        pop     bx
        ret
br_1ACE2:
        push    bx
        push    cx
        mov     al, 22h
        call    xl_io_out_port_100_site1
        mov     al, 0
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        mov     al, 21h
        call    xl_io_out_port_100_site1
        mov     al, bl
        sub     al, 14h
        call    xl_io_wait_port_100_site1
        call    xl_io_out_port_102_site1
        mov     al, 20h
        call    xl_io_out_port_100_site1
        sub     bh, bh
tgt_1AD07:
        mov     ah, byte ptr [bx+P_57A2]
        or      ah, byte ptr [bx+A2_W_05F22]
        xor     ah, byte ptr [bx+A2_W_066A2]
        mov     dx, 100h
        in      al, dx
        shl     al, 1
        je      br_1AD1E
        call    xl_io_wait_port_100_site1
br_1AD1E:
        mov     al, ah
        mov     dx, 102h
        out     dx, al
        add     bx, 20h
        loop    tgt_1AD07
        pop     cx
        pop     bx
        ret
fn_1AD2C:
disp_svc_clear:
disp_svc8f_clear:
        mov     di, P_57A2
        mov     word ptr [A2_W_LCD_DRAW_PLANE], di
        mov     ax, ds
        mov     es, ax
        mov     cx, 0f00h
        sub     ax, ax
        rep stosw
        mov     word ptr [A2_W_LCD_FONT_FN], fn_1B18A-APP2_CSBASE
        ret
disp_svc8f_plane:
        mov     al, byte ptr es:[bp]
        inc     bp
disp_svc_plane:
        mov     byte ptr [A2_B_LCD_PLANE_B_SEL], 0
        mov     si, P_57A2
        cmp     al, 0
        je      br_1AD5E
        mov     si, A2_W_05F22
        mov     byte ptr [A2_B_LCD_PLANE_B_SEL], 1
br_1AD5E:
        mov     word ptr [A2_W_LCD_DRAW_PLANE], si
        ret
disp_svc8f_softkey:
        mov     al, byte ptr es:[bp]
        cmp     al, 0
        jne     br_1AD6E
        jmp     br_1AE15
br_1AD6E:
        cmp     al, 7
        jne     br_1AD75
        jmp     NEAR BR_1AE2A
br_1AD75:
        mov     ah, byte ptr es:[bp+1]
        mov     dx, es
        add     bp, 2
        mov     si, bp
        call    fn_1AD86
        mov     bp, si
        ret
fn_1AD86:
disp_svc_softkey:
        sub     al, 1
        jae     br_1AD8B
        ret
br_1AD8B:
        cmp     al, 6
        jb      br_1AD90
        ret
br_1AD90:
        push    ax
        mov     ah, 3
        call    fn_1ADD4
        pop     ax
        call    fn_1AD9E
        call    fn_1ADD4
        ret
fn_1AD9E:
        push    ax
        mov     es, dx
        push    si
        sub     bx, bx
        dec     bl
        dec     si
loop_1ADA7:
        inc     si
        inc     bl
        cmp     byte ptr es:[si], 0
        jne     loop_1ADA7
        pop     si
        mov     cl, byte ptr cs:[bx+TBL_SOFTKEY_CENTER-APP2_CSBASE]
        mov     bl, al
        add     cl, byte ptr cs:[bx+TBL_SOFTKEY_X-APP2_CSBASE]
        mov     ch, 34h
        push    word ptr [A2_W_LCD_FONT_FN]
        mov     word ptr [A2_W_LCD_FONT_FN], fn_1B18A-APP2_CSBASE
        mov     ah, 28h
        call    fn_1B171
        pop     ax
        mov     word ptr [A2_W_LCD_FONT_FN], ax
        pop     ax
        ret
fn_1ADD4:
        push    ax
        push    si
        push    dx
        call    fn_1ADDE
        pop     dx
        pop     si
        pop     ax
        ret
fn_1ADDE:
        mov     bl, al
        sub     bh, bh
        mov     dl, ah
        mov     cl, byte ptr cs:[bx+TBL_SOFTKEY_X-APP2_CSBASE]
        mov     ch, 33h
        mov     al, 27h
        mov     ah, 9
        cmp     dl, 1
        jne     br_1ADF7
        jmp     fn_1B52F
br_1ADF7:
        cmp     dl, 2
        jne     L_1ADFF
        jmp     disp_svc_invert
L_1ADFF:
        cmp     dl, 3
        jne     br_1AE07
        jmp     fn_1B637
br_1AE07:
        ret
TBL_SOFTKEY_X:                                  ; F1-F6 label x
        db      02h, 2bh, 54h, 7dh, 0a6h, 0cfh
TBL_SOFTKEY_CENTER:                             ; x indent by label length
        db      14h, 11h, 0eh, 0bh, 08h, 05h, 02h
br_1AE15:
        inc     bp
        mov     si, bp
        mov     al, 0
        mov     dx, es
loop_1AE1C:
        push    dx
        call    fn_1AD9E
        pop     dx
        inc     al
        cmp     al, 6
        jne     loop_1AE1C
        mov     bp, si
        ret
br_1AE2A:
        inc     bp
        mov     al, 0
loop_1AE2D:
        mov     ah, byte ptr es:[bp]
        inc     bp
        push    es
        call    fn_1ADD4
        pop     es
        inc     al
        cmp     al, 6
        jne     loop_1AE2D
        ret
disp_svc8f_msg:
        mov     dx, es
        mov     si, bp
        call    fn_1AE48
        mov     bp, si
        ret
fn_1AE48:
disp_svc_msg:
        push    dx
        push    si
        mov     si, 0
        mov     di, A2_W_06E22
        mov     word ptr [A2_W_LCD_DRAW_PLANE], di
        mov     ax, ds
        mov     es, ax
        mov     cx, 3c0h
tgt_1AE5B:
        mov     ax, word ptr [si+P_57A2]
        or      ax, word ptr [si+A2_W_05F22]
        xor     ax, word ptr [si+A2_W_066A2]
        stosw
        add     si, 2
        loop    tgt_1AE5B
        mov     cl, 20h
        mov     ch, 12h
        mov     si, (APP2_BASE+tbl_1AF06-APP2_SEG*16)
        mov     dx, cs
        call    fn_1B98B
        mov     cl, 28h
        mov     ch, 12h
        mov     al, 0a8h
        mov     ah, 11h
        call    fn_1B637
        mov     cl, 0d0h
        mov     ch, 12h
        mov     si, (APP2_BASE+tbl_1AF19-APP2_SEG*16)
        mov     dx, cs
        call    fn_1B98B
        mov     cl, 20h
        mov     ch, 12h
        mov     si, (APP2_BASE+tbl_1AF2C-APP2_SEG*16)
        mov     dx, cs
        call    fn_1B8FF
        mov     cl, 0d0h
        mov     ch, 12h
        mov     si, (APP2_BASE+tbl_1AF3F-APP2_SEG*16)
        mov     dx, cs
        call    fn_1B8FF
        mov     cl, 28h
        mov     ch, 12h
        mov     dx, cs
        mov     si, (APP2_BASE+tbl_1AF52-APP2_SEG*16)
        mov     bl, 15h
loop_1AEB3:
        pusha
        call    fn_1B8FF
        popa
        add     cl, 8
        dec     bl
        jne     loop_1AEB3
        pop     si
        pop     dx
        push    word ptr [A2_W_LCD_FONT_FN]
        mov     word ptr [A2_W_LCD_FONT_FN], fn_1B18A-APP2_CSBASE
        mov     cl, 2ah
        mov     ch, 17h
        mov     ah, 28h
        call    fn_1B171
        push    si
        mov     cl, 20h
        mov     ch, 12h
        mov     si, (APP2_BASE+tbl_1AF06-APP2_SEG*16)
        mov     dx, cs
        call    fn_1B945
        mov     cl, 28h
        mov     ch, 12h
        mov     al, 0a8h
        mov     ah, 11h
        call    disp_svc_invert
        mov     cl, 0d0h
        mov     ch, 12h
        mov     si, (APP2_BASE+tbl_1AF19-APP2_SEG*16)
        call    fn_1B945
        call    fn_1ABDC
        pop     si
        pop     ax
        mov     word ptr [A2_W_LCD_FONT_FN], ax
        ret
disp_svc_plane0:
        mov     word ptr [A2_W_LCD_DRAW_PLANE], P_57A2
        ret
tbl_1AF06:
        db      01h, 11h, 03h, 0fh, 1fh, 3fh, 7fh, 7fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 7fh, 7fh, 3fh
        db      1fh, 0fh, 03h
tbl_1AF19:
        db      01h, 11h, 0c0h, 0f0h, 0f8h, 0fch, 0feh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0feh, 0feh, 0fch, 0f8h, 0f0h, 0c0h
tbl_1AF2C:
        db      01h, 11h, 00h, 03h, 0eh, 18h, 30h, 20h, 60h, 40h
        db      40h, 40h, 60h, 20h, 30h, 18h, 0eh, 03h, 00h
tbl_1AF3F:
        db      01h, 11h, 00h, 0c0h, 70h, 18h, 0ch
        db      04h, 06h, 02h, 02h, 02h, 06h, 04h, 0ch, 18h, 70h, 0c0h, 00h
tbl_1AF52:
        db      01h, 11h, 00h, 0ffh
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0ffh, 00h
disp_svc8f_hex8:
        mov     cl, byte ptr es:[bp]
        mov     cl, byte ptr es:[bp+1]
        add     bp, 2
disp_svc_hex8:
        call    fn_1BAC7
fn_1AF73:
        mov     si, (APP2_BASE+TBL_HEX_DIGITS_8F-APP2_SEG*16)
        mov     bl, al
        mov     bh, 0
        push    bx
        shr     bl, 4
        mov     al, byte ptr cs:[bx+si]
        call    fn_1B18A
        pop     bx
        and     bl, 0fh
        mov     al, byte ptr cs:[bx+si]
        call    fn_1B18A
        ret
TBL_HEX_DIGITS_8F:
        db      "0123456789ABCDEF"
disp_svc8f_hex16:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        add     bp, 2
disp_svc_hex16:
        call    fn_1BAC7
        push    ax
        mov     al, ah
        call    fn_1AF73
        pop     ax
        call    fn_1AF73
        ret
disp_svc8f_num:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     bh, byte ptr es:[bp+2]
        mov     byte ptr [A2_B_LCD_NUM_WIDTH], bh
        add     bp, 3
fn_1AFCB:
disp_svc_num:
        mov     byte ptr [P_75B6], 0
        call    fn_1AFD4
        ret
fn_1AFD4:
        call    fn_1BAC7
        mov     bl, byte ptr [A2_B_LCD_NUM_WIDTH]
        mov     bh, 0
        shl     bx, 1
        push    bp
        call    word ptr cs:[bx+TBL_NUM_FORMAT-APP2_CSBASE]
        pop     bp
        ret
TBL_NUM_FORMAT:
        dw      L_1A959-APP2_CSBASE, L_1A959-APP2_CSBASE, fn_1B023-APP2_CSBASE, loop_1B02A-APP2_CSBASE
        dw      loop_1B02F-APP2_CSBASE, loop_1B034-APP2_CSBASE, loop_1B039-APP2_CSBASE, loop_1B03E-APP2_CSBASE
        dw      loop_1B043-APP2_CSBASE, tgt_1B048-APP2_CSBASE, tgt_1B04D-APP2_CSBASE
disp_svc8f_num0:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     bh, byte ptr es:[bp+2]
        mov     byte ptr [A2_B_LCD_NUM_WIDTH], bh
        add     bp, 3
disp_svc_num0:
        mov     byte ptr [P_75B6], 1
        call    fn_1AFD4
        ret
L_1A959:
        sub     ah, ah
loop_1B01B:
        mov     byte ptr [P_75B6], 1
        jmp     fn_1B10F
fn_1B023:
        sub     ah, ah
L_1AB25:
        call    fn_1B102
        jmp     SHORT loop_1B01B
loop_1B02A:
        call    fn_1B0FD
        jmp     SHORT L_1AB25
loop_1B02F:
        call    fn_1B0F8
        jmp     SHORT loop_1B02A
loop_1B034:
        call    L_1B0D6
        jmp     loop_1B02F
loop_1B039:
        call    fn_1B0CE
        jmp     loop_1B034
loop_1B03E:
        call    fn_1B0C6
        jmp     loop_1B039
loop_1B043:
        call    fn_1B0BE
        jmp     loop_1B03E
tgt_1B048:
        call    fn_1B0B6
        jmp     loop_1B043
tgt_1B04D:
        call    L_1B0AE
        jmp     SHORT tgt_1B048
disp_svc8f_numr:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     bh, byte ptr es:[bp+2]
        mov     byte ptr [A2_B_LCD_NUM_WIDTH], bh
        add     bp, 3
disp_svc_numr:
        mov     byte ptr [P_75B6], 0
        mov     bl, byte ptr [A2_B_LCD_NUM_WIDTH]
        mov     bh, 0
        shl     bx, 1
        jmp     word ptr cs:[bx+TBL_1B071-APP2_CSBASE]
TBL_1B071:
        dw      loop_1B081-APP2_CSBASE, loop_1B081-APP2_CSBASE, loop_1B081-APP2_CSBASE, fn_1B092-APP2_CSBASE
        dw      tgt_1B0A1-APP2_CSBASE
loop_1B081:
        cmp     al, 0ah
        jae     L_1B08D
        add     cl, 3
        call    fn_1BAC7
        jmp     SHORT L_1A959
L_1B08D:
        call    fn_1BAC7
        jmp     SHORT fn_1B023
fn_1B092:
        cmp     ax, 64h
        jae     br_1B09C
        add     cl, 3
        jmp     loop_1B081
br_1B09C:
        call    fn_1BAC7
        jmp     SHORT loop_1B02A
tgt_1B0A1:
        cmp     ax, 3e8h
        jae     fn_1B092
        add     cl, 3
        call    fn_1BAC7
        jmp     fn_1B092
L_1B0AE:
        mov     si, 3b9ah
        mov     bp, 0ca00h
        jmp     br_1B0DC
fn_1B0B6:
        mov     si, 5f5h
        mov     bp, 0e100h
        jmp     br_1B0DC
fn_1B0BE:
        mov     si, 98h
        mov     bp, 9680h
        jmp     br_1B0DC
fn_1B0C6:
        mov     si, 0fh
        mov     bp, 4240h
        jmp     br_1B0DC
fn_1B0CE:
        mov     si, 1
        mov     bp, 86a0h
        jmp     br_1B0DC
L_1B0D6:
        mov     si, 0
        mov     bp, 2710h
br_1B0DC:
        mov     word ptr [A2_W_075AC], di
        mov     byte ptr [A2_B_075AB], cl
        mov     di, bp
        int     0b8h
        push    di
        push    si
        mov     di, word ptr [A2_W_075AC]
        mov     cl, byte ptr [A2_B_075AB]
        call    fn_1B10F
        pop     dx
        pop     ax
        ret
fn_1B0F8:
        mov     bx, 3e8h
        jmp     br_1B105
fn_1B0FD:
        mov     bx, 64h
        jmp     br_1B105
fn_1B102:
        mov     bx, 0ah
br_1B105:
        sub     dx, dx
        div     bx
        push    dx
        call    fn_1B10F
        pop     ax
        ret
fn_1B10F:
        or      byte ptr [P_75B6], al
        cmp     byte ptr [P_75B6], 0
        jne     br_1B121
        mov     al, 20h
        call    word ptr [A2_W_LCD_FONT_FN]
        ret
br_1B121:
        or      al, 30h
        call    word ptr [A2_W_LCD_FONT_FN]
        ret
disp_svc8f_font:
        mov     al, byte ptr es:[bp]
        inc     bp
disp_svc_font:
        and     al, 3
        mov     bl, al
        mov     bh, 0
        shl     bx, 1
        mov     ax, word ptr cs:[bx+TBL_FONT_FN-APP2_CSBASE]
        mov     word ptr [A2_W_LCD_FONT_FN], ax
        ret
TBL_FONT_FN:
        dw      fn_1B18A-APP2_CSBASE, font_small-APP2_CSBASE, font_big-APP2_CSBASE, font_wide-APP2_CSBASE
        ret
disp_svc8f_char:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        add     bp, 2
disp_svc_char:
        call    fn_1BAC7
        call    word ptr [A2_W_LCD_FONT_FN]
        ret
disp_svc8f_text:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     ah, 50h
        mov     dx, es
        add     bp, 2
        mov     si, bp
        call    fn_1B171
        mov     bp, si
        ret
fn_1B171:
disp_svc_text:
        call    fn_1BAC7
        mov     es, dx
fn_1B176:
        mov     al, byte ptr es:[si]
        inc     si
        or      al, al
        jne     br_1B17F
        ret
br_1B17F:
        call    word ptr [A2_W_LCD_FONT_FN]
        dec     ah
        jne     L_1B188
        ret
L_1B188:
        jmp     fn_1B176
fn_1B18A:
        or      al, al
        jns     br_1B190
        mov     al, 2ah
br_1B190:
        mov     ch, 7
        push    ax
        push    si
        push    cx
        push    di
        mul     ch
        mov     si, A2_W_075F3
        add     si, ax
        mov     bl, cl
        sub     bh, bh
        shl     bx, 1
        mov     dx, word ptr cs:[bx+TBL_FONT_MASK-APP2_CSBASE]
loop_1B1A8:
        mov     ah, byte ptr [di]
        mov     al, byte ptr [di+1]
        and     ax, dx
        mov     bh, byte ptr [si]
        sub     bl, bl
        shr     bx, cl
        or      ax, bx
        mov     byte ptr [di], ah
        mov     byte ptr [di+1], al
        inc     si
        add     di, 20h
        dec     ch
        jne     loop_1B1A8
        pop     di
        pop     cx
        pop     si
        pop     ax
        add     cl, 3
        cmp     al, 5eh
        je      br_1B1D2
        add     cl, 3
br_1B1D2:
        cmp     cl, 8
        jb      br_1B1DB
        sub     cl, 8
        inc     di
br_1B1DB:
        ret
TBL_FONT_MASK:                                  ; keep-mask per pen bit (fn_1B18A)
        dw      07ffh, 83ffh, 0c1ffh, 0e0ffh, 0f07fh, 0f83fh, 0fc1fh, 0fe0fh
font_big:
        or      al, al
        jns     br_1B1F2
        mov     al, 2ah
br_1B1F2:
        mov     ch, 0dh
        push    ax
        push    si
        push    cx
        push    di
        mul     ch
        mov     si, A2_W_075F3+380h
        add     si, ax
        mov     bl, cl
        sub     bh, bh
        shl     bx, 1
        mov     dx, word ptr cs:[bx+TBL_FONT_BIG_MASK-APP2_CSBASE]
loop_1B20A:
        mov     ah, byte ptr [di]
        mov     al, byte ptr [di+1]
        and     ax, dx
        mov     bh, byte ptr [si]
        sub     bl, bl
        shr     bx, cl
        or      ax, bx
        mov     byte ptr [di], ah
        mov     byte ptr [di+1], al
        inc     si
        add     di, 20h
        dec     ch
        jne     loop_1B20A
        pop     di
        pop     cx
        pop     si
        pop     ax
        add     cl, 4
        cmp     al, 5eh
        je      br_1B234
        add     cl, 4
br_1B234:
        cmp     cl, 8
        jb      br_1B23D
        sub     cl, 8
        inc     di
br_1B23D:
        ret
TBL_FONT_BIG_MASK:                              ; keep-mask per pen bit (font_big)
        dw      01ffh, 80ffh, 0c07fh, 0e03fh, 0f01fh, 0f80fh, 0fc07h, 0fe03h
font_wide:
        push    ax
        push    di
        push    si
        mov     ah, 20h
        mul     ah
        mov     si, A2_W_075F3+381h
        add     si, ax
        mov     ch, 0fh
loop_1B25C:
        push    cx
        mov     bl, cl
        shl     bl, 1
        add     bl, cl
        sub     bh, bh
        add     bx, TBL_FONT_WIDE_MASK-APP2_CSBASE
        mov     ch, byte ptr cs:[bx]
        mov     cl, byte ptr cs:[bx+1]
        mov     dl, byte ptr cs:[bx+2]
        mov     ah, byte ptr [di]
        mov     al, byte ptr [di+1]
        mov     dh, byte ptr [di+2]
        and     ax, cx
        and     dh, dl
        pop     cx
        mov     bx, word ptr [si]
        mov     dl, bl
        shr     bx, cl
        or      ax, bx
        mov     byte ptr [di], ah
        mov     byte ptr [di+1], al
        mov     bh, dl
        mov     bl, 0
        shr     bx, cl
        or      dh, bl
        mov     byte ptr [di+2], dh
        add     di, 20h
        add     si, 2
        dec     ch
        jne     loop_1B25C
        add     cl, byte ptr [si]
        mov     al, cl
        and     cl, 7
        shr     al, 3
        sub     ah, ah
        pop     si
        pop     di
        add     di, ax
        pop     ax
        ret
TBL_FONT_WIDE_MASK:                             ; 3-byte keep-mask per pen bit (font_wide)
        db      00h, 00h, 0ffh, 80h, 00h, 7fh, 0c0h, 00h, 3fh, 0e0h, 00h, 1fh, 0f0h, 00h, 0fh, 0f8h
        db      00h, 07h, 0fch, 00h, 03h, 0feh, 00h, 01h
font_small:
        sub     al, 20h
        push    ax
        push    cx
        push    di
        push    si
        mov     ch, 5
        mul     ch
        mov     si, A2_W_075F3+383h
        add     si, ax
        mov     bl, cl
        sub     bh, bh
        shl     bx, 1
        mov     dx, word ptr cs:[bx+TBL_FONT_SMALL_MASK-APP2_CSBASE]
loop_1B2E7:
        mov     ah, byte ptr [di]
        mov     al, byte ptr [di+1]
        and     ax, dx
        mov     bh, byte ptr [si]
        sub     bl, bl
        shr     bx, cl
        or      ax, bx
        mov     byte ptr [di], ah
        mov     byte ptr [di+1], al
        inc     si
        add     di, 20h
        dec     ch
        jne     loop_1B2E7
        pop     si
        pop     di
        pop     cx
        pop     ax
        add     cl, 4
        cmp     cl, 8
        jb      br_1B313
        sub     cl, 8
        inc     di
br_1B313:
        ret
TBL_FONT_SMALL_MASK:                            ; keep-mask per pen bit (font_small)
        dw      1fffh, 8fffh, 0c7ffh, 0e3ffh, 0f1ffh, 0f8ffh, 0fc7fh, 0fe3fh
disp_svc8f_hline:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        add     bp, 3
fn_1B333:
disp_svc_hline:
        call    fn_1BAC7
        mov     bl, al
        mov     ax, ds
        mov     es, ax
        or      bl, bl
        je      br_1B368
fn_1B340:
        cmp     bl, 9
        jb      br_1B369
        mov     al, 0ffh
        shr     al, cl
        or      byte ptr [di], al
        inc     di
        xor     cl, 7
        inc     cl
        sub     bl, cl
        mov     cl, bl
        shr     cl, 3
        je      br_1B35E
        mov     al, 0ffh
        rep stosb
br_1B35E:
        and     bx, 7
        mov     al, byte ptr cs:[bx+TBL_HIGH_BITS-APP2_CSBASE]
        or      byte ptr [di], al
br_1B368:
        ret
br_1B369:
        sub     bh, bh
        mov     ah, byte ptr cs:[bx+TBL_HIGH_BITS-APP2_CSBASE]
        sub     al, al
        shr     ax, cl
        or      byte ptr [di], ah
        inc     di
        or      byte ptr [di], al
        ret
TBL_HIGH_BITS:                                  ; n high bits set, n = 0-8
        db      00h, 80h, 0c0h, 0e0h, 0f0h, 0f8h, 0fch, 0feh, 0ffh
disp_svc8f_hdots:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        add     bp, 3
fn_1B392:
disp_svc_hdots:
        call    fn_1BAC7
        mov     bl, al
        mov     ax, ds
        mov     es, ax
        or      bl, bl
        je      L_1B3C6
        cmp     bl, 9
        jb      br_1B3C7
        mov     ax, 0aaaah
        shr     ax, cl
        or      byte ptr [di], ah
        inc     di
        xor     cl, 7
        inc     cl
        sub     bl, cl
        mov     cl, bl
        shr     cl, 3
        je      br_1B3BC
        rep stosb
br_1B3BC:
        and     bx, 7
        and     al, byte ptr cs:[bx+TBL_HIGH_BITS-APP2_CSBASE]
        or      byte ptr [di], al
L_1B3C6:
        ret
br_1B3C7:
        sub     bh, bh
        mov     ah, 0aah
        and     ah, byte ptr cs:[bx+TBL_HIGH_BITS-APP2_CSBASE]
        sub     al, al
        shr     ax, cl
        or      byte ptr [di], ah
        inc     di
        or      byte ptr [di], al
        ret
disp_svc8f_vline:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        add     bp, 3
fn_1B3E9:
disp_svc_vline:
        call    fn_1BAC7
        mov     bl, al
        mov     al, 80h
        shr     al, cl
        mov     cl, bl
        jcxz    br_1B3FD
tgt_1B3F6:
        or      byte ptr [di], al
        add     di, 20h
        loop    tgt_1B3F6
br_1B3FD:
        ret
disp_svc8f_vdots:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        add     bp, 3
fn_1B40D:
disp_svc_vdots:
        call    fn_1BAC7
        mov     bl, al
        mov     al, 80h
        shr     al, cl
        sub     ah, ah
        mov     cl, bl
        jcxz    br_1B425
        shr     cl, 1
tgt_1B41E:
        or      byte ptr [di], al
        add     di, 40h
        loop    tgt_1B41E
br_1B425:
        ret
disp_svc8f_clip:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        mov     ah, byte ptr es:[bp+3]
        add     bp, 4
        push    bp
        call    fn_1B43F
        pop     bp
        ret
fn_1B43F:
disp_svc_clip:
        mov     bh, 0
        mov     bl, cl
        mov     word ptr [A2_W_075AE], bx
        cmp     ch, 3ch
        jb      br_1B44E
        mov     ch, 3bh
br_1B44E:
        mov     bl, ch
        mov     word ptr [A2_W_075B0], bx
        mov     bl, al
        mov     word ptr [A2_W_075B2], bx
        cmp     ah, 3ch
        jb      br_1B461
        mov     ah, 3bh
br_1B461:
        mov     bl, ah
        mov     word ptr [A2_W_075B4], bx
        call    fn_1BAC7
        mov     ax, word ptr [A2_W_075B2]
        sub     ax, word ptr [A2_W_075AE]
        jae     br_1B478
        or      ch, 1
        neg     ax
br_1B478:
        mov     dx, 20h
        mov     bx, word ptr [A2_W_075B4]
        sub     bx, word ptr [A2_W_075B0]
        jae     br_1B48C
        neg     dx
        neg     bx
        or      ch, 2
br_1B48C:
        mov     word ptr [A2_W_075B0], dx
        cmp     ax, bx
        jb      br_1B4D7
        mov     si, ax
        shl     bx, 1
        mov     bp, bx
        sub     bx, ax
        mov     dx, bx
        sub     bx, ax
loop_1B4A0:
        push    bx
        mov     bx, A2_B_075B7
        mov     al, cl
        xlat
d_a0_tbl_0b407:
        pop     bx
        or      byte ptr [di], al
        test    ch, 1
        jne     br_1B4BB
        inc     cl
        cmp     cl, 8
        jne     br_1B4C3
        sub     cl, cl
        inc     di
        jmp     br_1B4C3
br_1B4BB:
        sub     cl, 1
        jae     br_1B4C3
        mov     cl, 7
        dec     di
br_1B4C3:
        or      dx, dx
        jns     br_1B4CD
        add     dx, bp
        dec     si
        jne     loop_1B4A0
        ret
br_1B4CD:
        add     di, word ptr [A2_W_075B0]
        add     dx, bx
        dec     si
        jne     loop_1B4A0
        ret
br_1B4D7:
        mov     si, bx
        shl     ax, 1
        mov     bp, ax
        sub     ax, bx
        mov     dx, ax
        sub     ax, bx
        mov     bx, ax
loop_1B4E5:
        push    bx
        mov     bx, A2_B_075B7
        mov     al, cl
        xlat
        pop     bx
        or      byte ptr [di], al
        add     di, word ptr [A2_W_075B0]
        or      dx, dx
        jns     br_1B4FD
        add     dx, bp
        dec     si
        jne     loop_1B4E5
        ret
br_1B4FD:
        test    ch, 0ch
        jne     br_1B50E
        inc     cl
        cmp     cl, 8
        jne     br_1B516
        sub     cl, cl
        inc     di
        jmp     br_1B516
br_1B50E:
        sub     cl, 1
        jae     br_1B516
        mov     cl, 7
        dec     di
br_1B516:
        add     dx, bx
        dec     si
        jne     loop_1B4E5
        ret
disp_svc8f_box:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        mov     ah, byte ptr es:[bp+3]
        add     bp, 4
fn_1B52F:
disp_svc_box:
        mov     byte ptr [A2_B_LCD_RECT_X], cl
        mov     byte ptr [A2_B_LCD_RECT_Y], ch
        mov     byte ptr [A2_B_LCD_RECT_W], al
        mov     byte ptr [A2_B_0758D], ah
        call    fn_1B333
        mov     cl, byte ptr [A2_B_LCD_RECT_X]
        mov     ch, byte ptr [A2_B_LCD_RECT_Y]
        add     ch, byte ptr [A2_B_0758D]
        dec     ch
        and     ch, 3fh
        mov     al, byte ptr [A2_B_LCD_RECT_W]
        call    fn_1B333
        mov     cl, byte ptr [A2_B_LCD_RECT_X]
        mov     ch, byte ptr [A2_B_LCD_RECT_Y]
        mov     al, byte ptr [A2_B_0758D]
        call    fn_1B3E9
        mov     cl, byte ptr [A2_B_LCD_RECT_X]
        mov     ch, byte ptr [A2_B_LCD_RECT_Y]
        add     cl, byte ptr [A2_B_LCD_RECT_W]
        dec     cl
        mov     al, byte ptr [A2_B_0758D]
        call    fn_1B3E9
        ret
disp_svc8f_fill:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        mov     ah, byte ptr es:[bp+3]
        add     bp, 4
fn_1B58E:
disp_svc_fill:
        cmp     al, 0
        jne     br_1B593
        ret
br_1B593:
        cmp     ah, 0
        jne     br_1B599
        ret
br_1B599:
        call    fn_1BAC7
        mov     bx, ax
        mov     ax, ds
        mov     es, ax
loop_1B5A2:
        push    bx
        push    cx
        push    di
        call    fn_1B340
        pop     di
        pop     cx
        pop     bx
        add     di, 20h
        dec     bh
        jne     loop_1B5A2
        ret
disp_svc8f_invert:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        mov     ah, byte ptr es:[bp+3]
        add     bp, 4
disp_svc_invert:
        cmp     al, 0
        jne     br_1B5CB
        ret
br_1B5CB:
        cmp     ah, 0
        jne     br_1B5D1
        ret
br_1B5D1:
        call    fn_1BAC7
        mov     bx, ax
loop_1B5D6:
        push    bx
        push    cx
        push    di
        call    fn_1B5E7
        pop     di
        pop     cx
        pop     bx
        add     di, 20h
        dec     bh
        jne     loop_1B5D6
        ret
fn_1B5E7:
        cmp     bl, 9
        jb      br_1B613
        mov     al, 0ffh
        shr     al, cl
        xor     byte ptr [di], al
        inc     di
        xor     cl, 7
        inc     cl
        sub     bl, cl
        mov     cl, bl
        shr     cl, 3
        je      br_1B608
        mov     al, 0ffh
tgt_1B603:
        xor     byte ptr [di], al
        inc     di
        loop    tgt_1B603
br_1B608:
        and     bx, 7
        mov     al, byte ptr cs:[bx+TBL_HIGH_BITS-APP2_CSBASE]
        xor     byte ptr [di], al
        ret
br_1B613:
        sub     bh, bh
        mov     ah, byte ptr cs:[bx+TBL_HIGH_BITS-APP2_CSBASE]
        sub     al, al
        shr     ax, cl
        xor     byte ptr [di], ah
        inc     di
        xor     byte ptr [di], al
        ret
disp_svc8f_erase:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        mov     ah, byte ptr es:[bp+3]
        add     bp, 4
fn_1B637:
disp_svc_erase:
        call    fn_1BAC7
        mov     bx, ax
        or      bl, bl
        jne     br_1B641
        ret
br_1B641:
        mov     ax, ds
        mov     es, ax
loop_1B645:
        push    bx
        push    cx
        push    di
        call    fn_1B656
        pop     di
        pop     cx
        pop     bx
        add     di, 20h
        dec     bh
        jne     loop_1B645
        ret
fn_1B656:
        cmp     bl, 9
        jb      br_1B683
        mov     al, 0ffh
        shr     al, cl
        not     al
        and     byte ptr [di], al
        inc     di
        xor     cl, 7
        inc     cl
        sub     bl, cl
        mov     cl, bl
        shr     cl, 3
        je      br_1B676
        sub     al, al
        rep stosb
br_1B676:
        and     bx, 7
        mov     al, byte ptr cs:[bx+TBL_HIGH_BITS-APP2_CSBASE]
        not     al
        and     byte ptr [di], al
        ret
br_1B683:
        sub     bh, bh
        mov     ah, byte ptr cs:[bx+TBL_HIGH_BITS-APP2_CSBASE]
        sub     al, al
        shr     ax, cl
        not     ax
        and     byte ptr [di], ah
        inc     di
        and     byte ptr [di], al
        ret
disp_svc8f_win:
        mov     al, byte ptr es:[bp]
        inc     bp
        cmp     al, 0
        je      br_1B6B0
        cmp     al, 1
        jne     br_1B6A6
        jmp     fn_1B794
br_1B6A6:
        cmp     al, 2
        jne     br_1B6AD
        jmp     br_1B7AD
br_1B6AD:
        jmp     br_1B7BB
br_1B6B0:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        mov     ah, byte ptr es:[bp+3]
        add     bp, 4
        call    fn_1B6C9
        mov     bp, si
        ret
fn_1B6C9:
disp_svc_win:
        mov     byte ptr [A2_B_LCD_RECT_X], cl
        mov     byte ptr [A2_B_LCD_RECT_Y], ch
        mov     byte ptr [A2_B_LCD_RECT_W], al
        mov     byte ptr [A2_B_0758D], ah
        push    dx
        pusha
        call    fn_1B637
        popa
        pusha
        add     cl, 1
        add     ch, 1
        sub     al, 2
        sub     ah, 2
        call    fn_1B52F
        popa
        pusha
        add     cl, 3
        add     ch, 3
        sub     al, 6
        sub     ah, 6
        call    fn_1B52F
        popa
        pusha
        add     cl, 3
        add     ch, 0dh
        sub     al, 6
        call    fn_1B333
        popa
        mov     dx, ax
        pop     es
        mov     bp, si
        mov     al, 0fdh
        dec     bp
loop_1B713:
        inc     bp
        add     al, 3
        cmp     byte ptr es:[bp], 0
        jne     loop_1B713
        cmp     al, 0
        jne     br_1B722
        ret
br_1B722:
        mov     byte ptr [A2_B_LCD_NUM_WIDTH], al
        shr     dl, 1
        sub     dl, al
        add     cl, dl
        add     ch, 5
        push    word ptr [A2_W_LCD_FONT_FN]
        mov     word ptr [A2_W_LCD_FONT_FN], fn_1B18A-APP2_CSBASE
        mov     dx, es
        call    fn_1B171
        pop     ax
        mov     word ptr [A2_W_LCD_FONT_FN], ax
        mov     cl, byte ptr [A2_B_LCD_RECT_X]
        mov     ch, byte ptr [A2_B_LCD_RECT_Y]
        add     ch, 3
        add     cl, 2
        mov     al, byte ptr [A2_B_LCD_RECT_W]
        sub     al, 6
        shr     al, 1
        sub     al, byte ptr [A2_B_LCD_NUM_WIDTH]
        push    cx
        pusha
        call    fn_1B392
        popa
        add     ch, 2
        pusha
        call    fn_1B392
        popa
        add     ch, 2
        pusha
        call    fn_1B392
        popa
        pop     cx
        mov     ah, byte ptr [A2_B_LCD_RECT_W]
        shr     ah, 1
        add     cl, ah
        add     cl, byte ptr [A2_B_LCD_NUM_WIDTH]
        sub     cl, 1
        pusha
        call    fn_1B392
        popa
        add     ch, 2
        pusha
        call    fn_1B392
        popa
        add     ch, 2
        call    fn_1B392
        ret
fn_1B794:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        mov     ah, byte ptr es:[bp+3]
        add     bp, 4
        call    fn_1B7C9
        mov     bp, si
        ret
br_1B7AD:
        mov     cl, 1dh
        mov     ch, 2
        mov     al, 0beh
        mov     ah, 3ah
        call    fn_1B7C9
        mov     bp, si
        ret
br_1B7BB:
        mov     cl, 10h
        mov     ch, 2
        mov     al, 0d8h
        mov     ah, 3ah
        call    fn_1B7C9
        mov     bp, si
        ret
fn_1B7C9:
        push    es
        pusha
        call    fn_1B637
        popa
        pusha
        add     cl, 2
        sub     al, 4
        call    fn_1B333
        popa
        pusha
        add     cl, 2
        add     ch, ah
        sub     ch, 1
        sub     al, 4
        call    fn_1B333
        popa
        pusha
        add     ch, 2
        mov     al, ah
        sub     al, 4
        call    fn_1B3E9
        popa
        pusha
        add     ch, 2
        add     cl, al
        sub     cl, 1
        mov     al, ah
        sub     al, 4
        call    fn_1B3E9
        popa
        pusha
        add     cl, 1
        add     ch, 1
        call    fn_1BAC7
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, al
        sub     cl, 2
        add     ch, 1
        call    fn_1BAC7
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, 1
        add     ch, ah
        sub     ch, 2
        call    fn_1BAC7
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, al
        sub     cl, 2
        add     ch, ah
        sub     ch, 2
        call    fn_1BAC7
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        popa
        pusha
        add     cl, 4
        add     ch, 4
        sub     al, 8
        sub     ah, 8
        call    fn_1B52F
        popa
        pusha
        add     cl, 4
        add     ch, 3
        sub     al, 8
        call    fn_1B392
        popa
        pusha
        add     cl, 3
        add     ch, ah
        sub     ch, 2
        sub     al, 5
        call    fn_1B392
        popa
        pusha
        add     cl, 3
        add     ch, 4
        mov     al, ah
        sub     al, 7
        call    fn_1B40D
        popa
        pusha
        add     cl, al
        sub     cl, 2
        add     ch, 3
        mov     al, ah
        sub     al, 5
        call    fn_1B40D
        popa
        pop     es
        mov     si, bp
        mov     dl, 0fdh
        dec     si
loop_1B8A3:
        inc     si
        add     dl, 3
        cmp     byte ptr es:[si], 0
        jne     loop_1B8A3
        cmp     dl, 0
        je      br_1B8EA
        mov     si, bp
        pusha
        push    es
        add     cl, 1ch
        sub     ch, 2
        sub     al, 39h
        mov     ah, 9
        pusha
        call    fn_1B637
        popa
        call    fn_1B52F
        pop     es
        popa
        shr     al, 1
        add     cl, al
        sub     cl, dl
        sub     ch, 1
        call    fn_1BAC7
        push    word ptr [A2_W_LCD_FONT_FN]
        mov     word ptr [A2_W_LCD_FONT_FN], fn_1B18A-APP2_CSBASE
        mov     ah, 28h
        call    fn_1B176
        pop     ax
        mov     word ptr [A2_W_LCD_FONT_FN], ax
        ret
br_1B8EA:
        if      FW_VERSION >= 114
        inc     si
        inc     si
        else
        inc     bp
        inc     bp
        endif
        ret
disp_svc8f_bmp:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        add     bp, 3
disp_svc_bmp:
        call    fn_1BD1B
fn_1B8FF:
        call    fn_1BAC7
        mov     es, dx
        mov     bl, byte ptr es:[si]
        or      bl, bl
        jne     br_1B90C
        ret
br_1B90C:
        inc     si
        sub     bh, bh
        mov     ch, byte ptr es:[si]
        inc     si
loop_1B913:
        push    bx
loop_1B914:
        mov     al, byte ptr es:[si]
        inc     si
        mov     ah, al
        sub     al, al
        shr     ax, cl
        or      byte ptr [di], ah
        or      byte ptr [di+1], al
        inc     di
        dec     bl
        jne     loop_1B914
        pop     bx
        add     di, 20h
        sub     di, bx
        dec     ch
        jne     loop_1B913
        ret
disp_svc8f_bmp_invert:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        add     bp, 3
disp_svc_bmp_invert:
        call    fn_1BD1B
fn_1B945:
        call    fn_1BAC7
        mov     es, dx
        mov     bl, byte ptr es:[si]
        or      bl, bl
        jne     br_1B952
        ret
br_1B952:
        inc     si
        sub     bh, bh
        mov     ch, byte ptr es:[si]
        inc     si
loop_1B959:
        push    bx
loop_1B95A:
        mov     al, byte ptr es:[si]
        inc     si
        mov     ah, al
        sub     al, al
        shr     ax, cl
        xor     byte ptr [di], ah
        xor     byte ptr [di+1], al
        inc     di
        dec     bl
        jne     loop_1B95A
        pop     bx
        add     di, 20h
        sub     di, bx
        dec     ch
        jne     loop_1B959
        ret
disp_svc8f_bmp_erase:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        add     bp, 3
disp_svc_bmp_erase:
        call    fn_1BD1B
fn_1B98B:
        call    fn_1BAC7
        mov     es, dx
        mov     bl, byte ptr es:[si]
        or      bl, bl
        jne     br_1B998
        ret
br_1B998:
        inc     si
        sub     bh, bh
        mov     ch, byte ptr es:[si]
        inc     si
L_1B99F:
        push    bx
loop_1B9A0:
        mov     al, byte ptr es:[si]
        inc     si
        mov     ah, al
        sub     al, al
        shr     ax, cl
        xor     ax, 0ffffh
        and     byte ptr [di], ah
        and     byte ptr [di+1], al
        inc     di
        dec     bl
        jne     loop_1B9A0
        pop     bx
        add     di, 20h
        sub     di, bx
        dec     ch
        jne     L_1B99F
        ret
disp_svc8f_pixel:
        call    fn_1BAC7
        mov     al, 80h
        shr     al, cl
        or      byte ptr [di], al
        ret
disp_svc8f_text_idx:
        mov     bl, byte ptr es:[bp]
        inc     bp
        mov     bh, 0
        shl     bx, 1
        call    word ptr cs:[bx+TBL_DISP8F_1E_FORM-APP2_CSBASE]
        ret
TBL_DISP8F_1E_FORM:
        dw      disp_svc8f_text_idx_form-APP2_CSBASE, disp_svc8f_note_form-APP2_CSBASE, disp_svc8f_note_chan_form-APP2_CSBASE
disp_svc_text_idx:
        mov     bl, byte ptr [A2_B_LCD_NUM_WIDTH]
        mov     bh, 0
        shl     bx, 1
        call    word ptr cs:[bx+TBL_DISP_1E_FORM-APP2_CSBASE]
        ret
TBL_DISP_1E_FORM:
        dw      disp_svc_text_idx_form-APP2_CSBASE, disp_svc_note_form-APP2_CSBASE, disp_svc_note_chan_form-APP2_CSBASE
disp_svc8f_text_idx_form:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     di, word ptr es:[bp+2]
        mov     si, word ptr es:[bp+4]
        add     bp, 6
disp_svc_text_idx_form:
        mov     es, dx
        mov     al, byte ptr es:[di]
        mov     ah, byte ptr es:[si]
        inc     si
        push    ax
        mul     ah
        add     si, ax
        pop     ax
        call    disp_svc_text
        ret
disp_svc8f_note_form:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        add     bp, 2
disp_svc_note_form:
        mov     ah, 0
        push    cx
        push    ax
        call    fn_1B092
        pop     ax
        pop     cx
        add     cl, 12h
        mov     bl, 0ch
        div     bl
        mov     bl, al
        mov     al, 5
        mul     ah
        if      FW_VERSION >= 114
        add     ax, 75bfh
        elseif  FW_VERSION >= 112
        add     ax, 75a3h
        elseif  FW_VERSION >= 110
        add     ax, 759fh
        else
        add     ax, 7581h
        endif
        mov     si, ax
        mov     dx, ds
        push    bx
        push    cx
        mov     ah, 5
        call    fn_1B171
        pop     cx
        pop     bx
        sub     bh, bh
        mov     al, byte ptr [bx+A2_B_075DF]
        add     cl, 12h
        call    fn_1BAC7
        call    fn_1B18A
        ret
disp_svc8f_note_chan_form:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        add     bp, 2
disp_svc_note_chan_form:
        cmp     ah, 41h
        je      br_1BABC
        call    fn_1BAC7
        cmp     al, 23h
        jb      br_1BA83
        cmp     al, 63h
        jae     br_1BA83
        push    ax
        call    fn_1B023
        mov     al, 2fh
        call    fn_1B18A
        pop     ax
        jmp     br_1BA94
br_1BA83:
        push    ax
        mov     al, 2dh
        call    fn_1B18A
        mov     al, 2dh
        call    fn_1B18A
        mov     al, 2fh
        call    fn_1B18A
        pop     ax
br_1BA94:
        mov     al, ah
        cmp     al, 40h
        je      br_1BAAC
        push    ax
        shr     al, 4
        add     al, 41h
        call    fn_1B18A
        pop     ax
        and     al, 0fh
        inc     al
        call    fn_1B023
        ret
br_1BAAC:
        mov     al, 4fh
        call    fn_1B18A
        mov     al, 46h
        call    fn_1B18A
        mov     al, 46h
        call    fn_1B18A
        ret
br_1BABC:
        mov     si, A2_W_07607
        mov     dx, ds
        mov     ah, 3
        call    fn_1B171
        ret
fn_1BAC7:
        mov     di, ax
        cmp     cl, 0f8h
        jb      br_1BAD0
        mov     cl, 0
br_1BAD0:
        cmp     ch, 3ch
        jb      br_1BAD7
        mov     ch, 0
br_1BAD7:
        mov     bl, cl
        and     cl, 7
        shr     bl, 3
        sub     bh, bh
        mov     al, 20h
        mul     ch
        add     ax, bx
        add     ax, word ptr [A2_W_LCD_DRAW_PLANE]
        xchg    di, ax
        sub     ch, ch
        ret
isr_1BAEF:
        sti
        push    ds
        push    es
        pusha
        mov     ax, RAM_SEG
        mov     ds, ax
isr_1BAF8:
        sub     ah, ah
        mov     al, byte ptr es:[bp]
        cmp     al, 0
        je      isr_1BB11
        shl     ax, 1
        inc     bp
        mov     di, TBL_INT2E_RESOURCE_CMD-APP2_CSBASE
        add     di, ax
        push    es
        call    word ptr cs:[di]
        pop     es
        jmp     isr_1BAF8
isr_1BB11:
        popa
        pop     es
        pop     ds
        iret
TBL_INT2E_RESOURCE_CMD:
        dw      tgt_1BB64-APP2_CSBASE, tgt_1BB64-APP2_CSBASE, fn_1BB68-APP2_CSBASE, L_1BB6F-APP2_CSBASE
        dw      fn_1BB76-APP2_CSBASE, tgt_1BB7D-APP2_CSBASE, tgt_1BB9C-APP2_CSBASE, disp_svc8f_text-APP2_CSBASE
        dw      tgt_1BB63-APP2_CSBASE, tgt_1BB63-APP2_CSBASE, tgt_1BB63-APP2_CSBASE, disp_svc8f_hline-APP2_CSBASE
        dw      disp_svc8f_hdots-APP2_CSBASE, tgt_1BB63-APP2_CSBASE, disp_svc8f_vline-APP2_CSBASE, disp_svc8f_vdots-APP2_CSBASE
        dw      tgt_1BB63-APP2_CSBASE, disp_svc8f_box-APP2_CSBASE, disp_svc8f_fill-APP2_CSBASE, disp_svc8f_erase-APP2_CSBASE
        dw      tgt_1BBA2-APP2_CSBASE, tgt_1BBD7-APP2_CSBASE, tgt_1BBEA-APP2_CSBASE, tgt_1BBFD-APP2_CSBASE
        dw      fn_1BC2B-APP2_CSBASE, tgt_1BC35-APP2_CSBASE, disp_svc8f_softkey-APP2_CSBASE, tgt_1BB63-APP2_CSBASE
        dw      tgt_1BB63-APP2_CSBASE, tgt_1BB63-APP2_CSBASE, tgt_1BB81-APP2_CSBASE, tgt_1BB63-APP2_CSBASE
        dw      tgt_1BC54-APP2_CSBASE, tgt_1BC76-APP2_CSBASE, tgt_1BCD6-APP2_CSBASE, tgt_1BC39-APP2_CSBASE
        dw      disp_svc8f_clip-APP2_CSBASE, tgt_1BC97-APP2_CSBASE, tgt_1BCBF-APP2_CSBASE
tgt_1BB63:
        ret
tgt_1BB64:
        call    fn_1AD2C
        ret
fn_1BB68:
        mov     word ptr [A2_W_LCD_DRAW_PLANE], P_57A2
        ret
L_1BB6F:
        mov     word ptr [A2_W_LCD_DRAW_PLANE], A2_W_05F22
        ret
fn_1BB76:
        mov     word ptr [A2_W_LCD_DRAW_PLANE], A2_W_066A2
        ret
tgt_1BB7D:
        call    fn_1ABDC
        ret
tgt_1BB81:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     si, word ptr es:[bp+2]
        mov     dx, word ptr es:[bp+4]
        add     bp, 6
        push    bp
        mov     ah, 28h
        call    fn_1B171
        pop     bp
        ret
tgt_1BB9C:
        mov     byte ptr [A2_B_00063], 1
        ret
tgt_1BBA2:
        push    word ptr [A2_W_LCD_DRAW_PLANE]
        mov     word ptr [A2_W_LCD_DRAW_PLANE], A2_W_066A2
        push    es
        mov     di, A2_W_066A2
        mov     ax, ds
        mov     es, ax
        mov     cx, 3c0h
        sub     ax, ax
        rep stosw
        pop     es
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        mov     ah, byte ptr es:[bp+3]
        add     bp, 4
        call    fn_1B58E
        pop     ax
        mov     word ptr [A2_W_LCD_DRAW_PLANE], ax
        ret
tgt_1BBD7:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        add     bp, 3
        call    disp_svc_hex8
        ret
tgt_1BBEA:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     ax, word ptr es:[bp+2]
        add     bp, 4
        call    disp_svc_hex16
        ret
tgt_1BBFD:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     bh, byte ptr es:[bp+2]
        mov     byte ptr [A2_B_LCD_NUM_WIDTH], bh
        mov     ax, word ptr es:[bp+3]
        mov     dx, word ptr es:[bp+5]
        inc     bp
        cmp     bh, 3
        jb      br_1BC24
        inc     bp
        cmp     bh, 5
        jb      br_1BC24
        add     bp, 2
br_1BC24:
        add     bp, 3
        call    fn_1AFCB
        ret
fn_1BC2B:
        mov     dx, es
        mov     si, bp
        call    fn_1AE48
        mov     bp, si
        ret
tgt_1BC35:
        call    disp_svc_plane0
        ret
tgt_1BC39:
        call    fn_1BC2B
        pusha
loop_1BC3D:
        int     0b9h
        or      ax, ax
        je      br_1BC48
        test    ah, 80h
        je      br_1BC4E
br_1BC48:
        int     0bah
        or      ax, cx
        je      loop_1BC3D
br_1BC4E:
        mov     bl, 7
        int     90h
        popa
        ret
tgt_1BC54:
        push    word ptr [A2_W_LCD_DRAW_PLANE]
        mov     word ptr [A2_W_LCD_DRAW_PLANE], A2_W_05F22
        mov     dx, es
        mov     si, bp
        mov     al, 0
loop_1BC64:
        push    dx
        call    fn_1AD9E
        pop     dx
        inc     al
        cmp     al, 6
        jne     loop_1BC64
        pop     ax
        mov     word ptr [A2_W_LCD_DRAW_PLANE], ax
        mov     bp, si
        ret
tgt_1BC76:
        push    word ptr [A2_W_LCD_DRAW_PLANE]
        mov     word ptr [A2_W_LCD_DRAW_PLANE], A2_W_05F22
        mov     al, 0
loop_1BC82:
        mov     ah, byte ptr es:[bp]
        inc     bp
        push    es
        call    fn_1ADD4
L_1B56B:
        pop     es
        inc     al
        cmp     al, 6
        jne     loop_1BC82
        pop     ax
        mov     word ptr [A2_W_LCD_DRAW_PLANE], ax
        ret
tgt_1BC97:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     bl, byte ptr es:[bp+2]
        add     bp, 3
        sub     bh, bh
        shl     bx, 1
        mov     si, word ptr cs:[bx+TBL_BMP_1305-APP2_CSBASE]
        mov     dx, ds
        call    fn_1B8FF
        ret
TBL_BMP_1305:                                   ; DS bitmaps
        dw      A2_W_075F3+684h, A2_W_075F3+73bh, A2_W_075F3+61eh, A2_W_075F3+5feh, A2_W_075F3+5deh
tgt_1BCBF:
        mov     cl, byte ptr es:[bp]
        mov     ch, byte ptr es:[bp+1]
        mov     si, word ptr es:[bp+2]
        mov     dx, word ptr es:[bp+4]
        add     bp, 6
        call    fn_1B8FF
        ret
tgt_1BCD6:
        if      FW_VERSION >= 114
        db      0ffh, 36h, 0a2h, 75h, 26h, 8ah, 4eh, 00h, 26h, 8ah, 6eh, 01h, 26h, 8ah, 46h, 02h ; .6.u&.N.&.n.&.F.
        elseif  FW_VERSION >= 112
        db      0ffh, 36h, 86h, 75h, 26h, 8ah, 4eh, 00h, 26h, 8ah, 6eh, 01h, 26h, 8ah, 46h, 02h ; .6.u&.N.&.n.&.F.
        else
        if      FW_VERSION >= 110
        db      0ffh, 36h, 82h
        else
        db      0ffh, 36h, 64h
        endif
        jne     L_1B641
        mov     cl, byte ptr [bp]
        mov     ch, byte ptr es:[bp+1]
        mov     al, byte ptr es:[bp+2]
        endif
        mov     ah, byte ptr es:[bp+3]
        push    es
        call    fn_1BB76
        call    fn_1BD06
        call    L_1BB6F
        call    fn_1BD06
        call    fn_1BB68
        call    fn_1BD06
        pop     es
        call    fn_1B794
L_1B641:
        pop     ax
L_1B642:
        mov     word ptr [A2_W_LCD_DRAW_PLANE], ax
        ret
fn_1BD06:
        pusha
        call    fn_1B637
        popa
        pusha
        add     cl, 1ch
        sub     ch, 2
        sub     al, 39h
        mov     ah, 9
        call    fn_1B637
        popa
        ret
fn_1BD1B:
        cmp     al, 0
        jne     br_1BD20
        ret
br_1BD20:
        dec     al
        mov     bl, al
        mov     bh, 0
        shl     bx, 1
        mov     si, word ptr cs:[bx+TBL_BMP_1380-APP2_CSBASE]
        mov     dx, ds
        ret
TBL_BMP_1380:                                   ; DS bitmaps
        dw      A2_W_075F3+384h, A2_W_075F3+3c5h, A2_W_075F3+406h, A2_W_075F3+447h
        dw      A2_W_075F3+488h, A2_W_075F3+4efh, A2_W_075F3+4bdh, A2_W_075F3+524h
        dw      A2_W_075F3+5a0h, A2_W_075F3+562h, A2_W_075F3+5deh, A2_W_075F3+5feh
        dw      A2_W_075F3+61eh, A2_W_075F3+684h, A2_W_075F3+6bfh, A2_W_075F3+6f1h
        dw      A2_W_075F3+73bh, A2_W_075F3+7dfh, A2_W_075F3+76fh, A2_W_075F3+775h
        dw      A2_W_075F3+77bh, A2_W_075F3+781h, A2_W_075F3+787h, A2_W_075F3+7afh
        dw      A2_W_075F3+63ah, A2_W_075F3+7e1h, A2_W_075F3+7f3h, A2_W_075F3+805h
        dw      A2_W_075F3+80eh, A2_W_075F3+82ch, A2_W_075F3+835h, A2_W_075F3+84ch
        dw      A2_W_075F3+896h, A2_W_075F3+8bch, A2_W_075F3+8c7h
far_1BD76:
        mov     ax, cx
        retf
disk_screen_enter:
        mov     byte ptr [A2_B_00F2E], 0
        mov     al, 0
        int     0ddh
        mov     al, 0
        int     0aeh
        callf   EP_SEQ_NAMES_FETCH_SEG:EP_SEQ_NAMES_FETCH_OFF
        mov     al, 2
        mov     byte ptr [A2_B_00F2F], al
        int     0adh
        int     0e6h
        mov     bl, 1
        int     4eh
        mov     word ptr [A2_W_SEQ_SEG], 8000h
        mov     al, byte ptr [A2_B_DISK_DEVICE]
        mov     ah, 0
        int     94h
        if      FW_VERSION >= 110
        call    fn_1BE66
        endif
        callf   [A2_W_DISK_PAGE_FN]
        push    cs
        call    far_1C05D
        DISP_FLUSH
        call    fn_1BE66
        retf
L_1BDB7:
        int     0b4h
        call    fn_1BE98
        jae     br_1BDC8
        mov     bl, 0ch
        int     93h
        jae     L_1B705
        retf
L_1B705:
        call    fn_1BE98
br_1BDC8:
        call    fn_1BE66
        callf   [A2_W_DISK_PAGE_FN]
        retf
fn_1BDD0:
        pop     si
        push    si
        sub     si, 3
L_1B715:
        mov     word ptr [A2_W_DISK_PAGE_FN], si
fn_1BDD9:
        int     0a4h
        KEY_SOFT        (APP2_BASE+L_1BDB7-APP2_SEG*16), APP2_SEG, (APP2_BASE+ISR_1EE40-APP2_SEG*16), APP2_SEG, (APP2_BASE+FAR_1FB3E-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1CD1C-APP2_SEG*16), APP2_SEG, 0000h, 0000h, (APP2_BASE+L_1CC99-APP2_SEG*16), APP2_SEG
        KEY_DOWN        20h, EP_FAR_1C05D_OFF, EP_FAR_1C05D_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        29h, EP_L_1BE16_OFF, APP2_SEG
        if      FW_VERSION >= 110
        KEY_DOWN        26h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        endif
        ret
L_1BE16:
        mov     al, 0
        int     0c7h
        retf
fn_1BE1B:
        cmp     byte ptr [A2_B_DISK_FORMAT], 2
        je      br_1BE3C
        cmp     byte ptr [A2_B_DISK_FORMAT], 3
        je      br_1BE3C
        cmp     byte ptr [A2_B_DISK_FORMAT], 0ah
        je      br_1BE3C
        cmp     byte ptr [A2_B_DISK_FORMAT], 0bh
        je      br_1BE3C
        cmp     byte ptr [A2_B_DISK_FORMAT], 0ch
br_1BE3C:
        ret
fn_1BE3D:
        cmp     byte ptr [A2_B_DISK_FORMAT], 5
        jne     br_1BE45
        ret
br_1BE45:
        cmp     byte ptr [A2_B_DISK_FORMAT], 6
        ret
fn_1BE4B:
        int     0d5h
        shl     ax, 4
        mov     word ptr [A2_W_FREE_SEQ_K], ax
        sub     ax, ax
        sub     dx, dx
        int     39h
        and     dx, 3ffh
        mov     bx, 400h
        div     bx
        mov     word ptr [P_2E97], ax
        ret
fn_1BE66:
        cmp     byte ptr [A2_B_DISK_MOUNTED], 0
        je      L_1BE96
        mov     bl, 11h
        int     91h
        jb      br_1BE74
        ret
br_1BE74:
        cmp     byte ptr [A2_B_DISK_DEVICE], 0
        je      L_1BE96
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        je      L_1BE96
        cmp     al, 0eh
        jne     br_1BE87
        ret
br_1BE87:
        if      FW_VERSION >= 110
        cmp     al, 1dh
        je      L_1BE96
        endif
        mov     bl, 0ch
        int     93h
        mov     bl, 11h
        int     91h
        jb      L_1BE96
        ret
L_1BE96:
        int     0b4h
fn_1BE98:
        mov     byte ptr [A2_B_DISK_MOUNTED], 0
        mov     word ptr [A2_W_LOAD_FILE_INDEX], 0
        mov     word ptr [A2_W_FILE_PANE_TOP], 0
        mov     word ptr [A2_W_FILE_PANE_ROW], 0
        mov     word ptr [A2_W_DIR_LIST_TOP], 0
        mov     word ptr [A2_W_DIR_LIST_ROW], 0
        mov     word ptr [A2_W_DISK_PARTITION], 0
        mov     word ptr [A2_W_DISK_PARTITION_COUNT], 0
        mov     word ptr [A2_W_DIR_LIST_TOP], 0
        mov     byte ptr [A2_B_DISK_FS_TYPE], 0
        mov     byte ptr [A2_B_DISK_FORMAT], 0
        mov     word ptr [A2_W_02EEA], 0
        mov     byte ptr [A2_B_DIR_NAME_MODE], 0
        if      FW_VERSION >= 110
        mov     word ptr [A2_W_DISK_PAGE_FN], br_1C359-APP2_CSBASE
        mov     word ptr [P_2E8A], cs
        endif
        mov     ah, 1
        int     94h
        jae     br_1BF06
        cmp     al, 0fh
        jne     br_1BEF8
        jmp     br_1BF6C
br_1BEF8:
        cmp     al, 1dh
        jne     br_1BF4B
        mov     ah, 1
        int     94h
        mov     byte ptr [A2_B_DISK_DEVICE], bl
        jb      br_1BF4B
br_1BF06:
        mov     byte ptr [A2_B_DISK_FS_TYPE], al
        mov     byte ptr [A2_B_DISK_FORMAT], ah
        mov     byte ptr [A2_B_DISK_DEVICE], bl
        mov     byte ptr [A2_W_DISK_PARTITION], dl
        mov     byte ptr [A2_W_DISK_PARTITION_COUNT], dh
        mov     word ptr [A2_W_DISK_SIZE_MB], di
        mov     word ptr [A2_W_02EEA], di
        mov     ax, ds
        mov     bx, es
        mov     ds, bx
        mov     es, ax
        mov     di, P_2E99
        mov     cx, 24h
        rep movsb
        mov     ds, ax
        mov     byte ptr [A2_B_DISK_MOUNTED], 1
        call    fn_1BFF4
        DISP_PLANE0
        mov     bl, byte ptr [A2_B_DISK_DEVICE]
        mov     bh, 0
        mov     byte ptr [bx+A2_TBL_DEVICE_STATE], 2
        clc
        ret
br_1BF4B:
        cmp     byte ptr [A2_B_DISK_QUIET_MOUNT], 0
        jne     br_1BF54
        int     95h
br_1BF54:
        mov     bl, byte ptr [A2_B_DISK_DEVICE]
        mov     bh, 0
        cmp     byte ptr [bx+A2_TBL_DEVICE_STATE], 2
        je      br_1BF6A
        cmp     al, 0eh
        jne     br_1BF6A
        mov     byte ptr [bx+A2_TBL_DEVICE_STATE], 1
br_1BF6A:
        stc
        ret
br_1BF6C:
        mov     byte ptr [A2_B_DISK_DEVICE], bl
        int     95h
        push    ax
        mov     dx, ds
        mov     di, P_2E99
        mov     cx, 2ch
        mov     cx, 24h
        mov     bl, 4
        int     93h
        mov     ah, byte ptr [P_2E99]
        cmp     ah, 0
        mov     al, 5
        je      br_1BF9D
        cmp     ah, 5
        mov     al, 6
        je      br_1BF9D
        cmp     ah, 7
        mov     al, 7
        je      br_1BF9D
        mov     al, 4
br_1BF9D:
        mov     byte ptr [A2_B_DISK_FS_TYPE], al
        mov     byte ptr [A2_B_DISK_MOUNTED], 1
        pop     ax
        stc
        ret
xl_boot_device_select:
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        mov     byte ptr [A2_B_BOOT_DEVICE_REQ], al
        cmp     al, 9
        jb      br_1BFB7
        mov     al, 0
br_1BFB7:
        mov     byte ptr [A2_B_DISK_DEVICE], al
        mov     byte ptr [A2_B_ATAPI_DEVICE], ah
        cmp     ah, 0
        je      br_1BFD8
        push    ds
        mov     ax, ds
        mov     es, ax
        mov     ax, cs
        mov     ds, ax
        mov     di, TBL_DISK_DEVICE_TEXT
        if      FW_VERSION >= 110
        mov     si, 163eh
        else
        mov     si, 1625h
        endif
        mov     cx, 6
        rep movsb
        pop     ds
br_1BFD8:
        mov     al, byte ptr [A2_B_DISK_DEVICE]
        mov     ah, 0
        int     94h
        mov     byte ptr [A2_B_DISK_QUIET_MOUNT], 1
        call    fn_1BE98
        mov     byte ptr [A2_B_DISK_QUIET_MOUNT], 0
        pop     ds
        retf
        db      "ATAPI "
fn_1BFF4:
        cmp     byte ptr [A2_B_DISK_FORMAT], 1
        jne     br_1BFFC
        ret
br_1BFFC:
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 0
        jne     br_1C004
        ret
br_1C004:
        mov     ax, word ptr [A2_W_DIR_LIST_TOP]
        add     ax, word ptr [A2_W_DIR_LIST_ROW]
        mov     cl, 1
        mov     bl, 1ah
        int     91h
        jae     br_1C014
        ret
br_1C014:
        push    es
        pusha
        mov     di, P_2F0A
        mov     ax, ds
        mov     es, ax
        mov     cx, 10h
        mov     al, 20h
        rep stosb
        mov     word ptr [A2_W_FILE_PANE_TOP], 0
        mov     word ptr [A2_W_FILE_PANE_ROW], 0
        mov     word ptr [A2_W_LOAD_FILE_INDEX], 0
        popa
        pop     es
        push    ds
        mov     di, P_2F0A
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        mov     cx, 10h
        rep movsb
        pop     ds
        mov     byte ptr [A2_B_DIR_NAME_MODE], 2
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 6
        jne     br_1C05B
        mov     byte ptr [A2_B_DIR_NAME_MODE], 1
br_1C05B:
        clc
        ret
far_1C05D:
        DISP_CLEAR
        db      0e8h
        if      FW_VERSION >= 110
        mov     dh, 1
        call    fn_1C139
        else
        cmpsw
        db      01h, 0e8h
        rol     word ptr [bx+si], cl
        endif
        call    fn_1C28D
        call    fn_1C111
        call    fn_1BE4B
        DISP_TEXT       74h, 15h, "LOAD"
        mov     si, 0bh
        DISP_BMP        78h, 1eh, 0bh
        mov     si, 1
        DISP_BMP        90h, 16h, 01h
        DISP_SOFTKEY    01h, DISP_SK_PLAIN, "LOAD"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "SAVE"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "FORMAT"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "SETUP"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "DO IT"
        DISP_TEXT       0b6h, 15h, "Free memory"
        DISP_TEXT       0b6h, 1eh, "snd=      K"
        DISP_TEXT       0b6h, 27h, "seq=      K"
        mov     ax, word ptr [P_2E97]
        mov     dx, 0
        DISP_NUM        0ceh, 1eh, 06h
        mov     ax, word ptr [A2_W_FREE_SEQ_K]
        mov     dx, 0
        DISP_NUM        0ceh, 27h, 06h
        call    word ptr [A2_W_DISK_CURSOR_FN]
        retf
fn_1C111:
        DISP_TEXT       00h, 01h, "View:"
        cmp     byte ptr [A2_B_DISK_FORMAT], 8
        jne     L_1BC24
        ret
L_1BC24:
        cmp     byte ptr [A2_B_DISK_FORMAT], 9
        jne     L_1BC2C
        ret
L_1BC2C:
        mov     dx, ds
        DISP_TEXT_IDX   1eh, 01h, A2_B_FILE_VIEW_TYPE, TBL_FILE_TYPE_LABELS
        ret
fn_1C139:
        DISP_TEXT       00h, 09h, "File:"
        DISP_HDOTS      00h, 12h, 0f8h
        DISP_TEXT       00h, 15h, "Device:"
        DISP_TEXT       00h, 28h, "  Type="
        DISP_TEXT       0b0h, 09h, "Size=      K"
        mov     dx, ds
        DISP_TEXT_IDX   2ah, 15h, A2_B_DISK_DEVICE, TBL_DISK_DEVICE_LABELS
        mov     dx, ds
        DISP_TEXT_IDX   2ah, 28h, A2_B_DISK_FORMAT, TBL_DISK_FORMAT_LABELS
        if      FW_VERSION >= 110
        mov     di, P_2F32
        mov     ax, ds
        mov     es, ax
        mov     cx, 14h
        mov     ax, 0
        rep stosb
        endif
        cmp     byte ptr [A2_B_DISK_FORMAT], 0
        je      L_1C1E1
        dec     word ptr [A2_W_LOAD_FILE_INDEX]
loop_1C1A8:
        inc     word ptr [A2_W_LOAD_FILE_INDEX]
        mov     ax, word ptr [A2_W_LOAD_FILE_INDEX]
        mov     bl, 3
        int     91h
        jb      L_1C1E1
        cmp     byte ptr es:[si], 2eh
        je      loop_1C1A8
        mov     word ptr [A2_W_SEL_FILE_SIZE_LO], bx
        mov     word ptr [A2_W_SEL_FILE_SIZE_HI], dx
        call    fn_1C3C5
        jne     loop_1C1A8
        call    fn_1C2EF
        push    dx
        push    bx
        call    fn_1C1F1
        pop     ax
        pop     dx
        mov     cx, 0ah
tgt_1C1D5:
        shr     dx, 1
        rcr     ax, 1
        loop    tgt_1C1D5
        DISP_NUM        0ceh, 09h, 06h
L_1C1E1:
        if      FW_VERSION < 120
        mov     al, byte ptr [A2_B_02ED7]
        mov     bx, 2fd3h
        else
        mov     al, byte ptr [A2_B_02EE7]
        mov     bx, 2fe3h
        endif
        xlat
        mov     cl, 5ah
        mov     ch, 16h
        mov     bl, 16h
        int     90h
        ret
fn_1C1F1:
        mov     dx, ds
        mov     si, P_2F32
        mov     cl, 1eh
        mov     ch, 9
        mov     ah, 14h
        cmp     byte ptr [si+10h], 20h
        je      br_1C207
        mov     bl, 5
        int     90h
        ret
br_1C207:
        mov     cl, 28h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     si, 1ch
        DISP_BMP        1eh, 09h, 1ch
        ret
        cmp     byte ptr [A2_B_DIR_NAME_MODE], 0
        jne     br_1C221
        ret
br_1C221:
        call    fn_1BE3D
        je      br_1C24D
        cmp     byte ptr [A2_B_DISK_FORMAT], 8
        je      br_1C26D
        mov     si, 1eh
        DISP_BMP        0bah, 01h, 1eh
        DISP_TEXT       0c2h, 01h, ":"
        mov     dx, ds
        mov     si, P_2F0A
        mov     cl, 0c8h
        mov     ch, 1
        mov     ah, 8
        mov     bl, 5
        int     90h
        ret
br_1C24D:
        mov     si, 1eh
        DISP_BMP        0a2h, 01h, 1eh
        DISP_TEXT       0aah, 01h, ":"
        mov     dx, ds
        mov     cl, 0b0h
        mov     ch, 1
        mov     si, P_2F0A
        mov     ah, 0ch
        mov     bl, 5
        int     90h
        ret
br_1C26D:
        mov     si, 1eh
        DISP_BMP        8ah, 01h, 1eh
        DISP_TEXT       92h, 01h, ":"
        mov     dx, ds
        mov     cl, 98h
        mov     ch, 1
        mov     si, P_2F0A
        mov     ah, 10h
        mov     bl, 5
        int     90h
        ret
fn_1C28D:
        cmp     word ptr [A2_W_DISK_PARTITION_COUNT], 0
        jne     br_1C295
        ret
br_1C295:
        DISP_TEXT       00h, 1eh, "  Part:"
        mov     ax, word ptr [A2_W_DISK_PARTITION]
        add     al, 41h
        mov     cl, 2ah
        mov     ch, 1eh
        mov     bl, 4
        int     90h
        ret
cb_1C2B0:
        DISP_CURSOR     1eh, 1, 37h
        ret
cb_1C2B9:
        DISP_CURSOR     1eh, 9, 79h
        ret
cb_1C2C2:
        DISP_CURSOR     2ah, 15h, 25h
        ret
cb_1C2CB:
        DISP_CURSOR     2ah, 1eh, 7
        ret
cb_1C2D4:
        DISP_CURSOR     0c8h, 1, 31h
        ret
cb_1C2DD:
        DISP_CURSOR     0b0h, 1, 49h
        ret
cb_1C2E6:
        DISP_CURSOR     98h, 1, 61h
        ret
fn_1C2EF:
        push    bx
        push    si
        push    es
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        mov     di, P_2F32
        mov     cx, 14h
        rep movsb
        mov     ds, ax
        pop     es
        pop     si
        pop     bx
        ret
L_1BC48:
L_1C308:
        cmp     byte ptr [A2_B_DISK_FORMAT], 8
        jne     br_1C311
        if      FW_VERSION >= 110
        jmp     br_1C359
        else
        retf
        endif
br_1C311:
        cmp     byte ptr [A2_B_DISK_FORMAT], 9
        jne     br_1C319
        retf
br_1C319:
        call    fn_1BDD0
        mov     word ptr [A2_W_DISK_CURSOR_FN], cb_1C2B0-APP2_CSBASE
        if      FW_VERSION >= 114
        FIELD_WHEEL     ds, A2_B_FILE_VIEW_TYPE, 0, 0, 8, intcb_1C34E-APP2_CSBASE
        else
        mov     cx, ds
        mov     si, A2_B_FILE_VIEW_TYPE
        mov     bl, 0
        mov     bh, 0
        mov     dx, 8
        mov     di, (APP2_BASE+intcb_1C34E-APP2_SEG*16)
        int     7dh
        endif
        KEY_CURSOR      0000h, 0000h, EP_L_1D335_OFF, APP2_SEG, 0000h, 0000h, EP_BR_1C359_OFF, EP_BR_1C359_SEG
        KEY_DOWN        16h, EP_L_1C40C_OFF, APP2_SEG
        retf
intcb_1C34E:
        mov     word ptr [A2_W_LOAD_FILE_INDEX], 0ffffh
        push    cs
        call    far_1C387
        retf
br_1C359:
        call    fn_1BDD0
        mov     word ptr [A2_W_DISK_CURSOR_FN], cb_1C2B9-APP2_CSBASE
        KEY_WHEEL2      EP_L_1C39F_OFF, APP2_SEG, EP_FAR_1C387_OFF, EP_FAR_1C387_SEG
        if      FW_VERSION >= 114
        KEY_CURSOR      EP_L_1D335_OFF, APP2_SEG, EP_L_1D335_OFF, APP2_SEG, (APP2_BASE+L_1BC48-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1D078-APP2_SEG*16), APP2_SEG
        else
        KEY_CURSOR      EP_L_1D335_OFF, APP2_SEG, EP_L_1D335_OFF, APP2_SEG, EP_L_1BC48_OFF, APP2_SEG, (APP2_BASE+L_1C9B8-APP2_SEG*16), APP2_SEG
        endif
        KEY_DOWN        16h, EP_L_1C40C_OFF, APP2_SEG
        retf
far_1C387:
        call    fn_1BE66
        mov     ax, word ptr [A2_W_LOAD_FILE_INDEX]
loop_1C38D:
        inc     ax
        mov     bl, 3
        int     91h
        jae     br_1C395
        retf
br_1C395:
        call    fn_1C3C5
        jne     loop_1C38D
        mov     word ptr [A2_W_LOAD_FILE_INDEX], ax
        clc
        retf
L_1C39F:
        call    fn_1BE66
        mov     ax, word ptr [A2_W_LOAD_FILE_INDEX]
loop_1C3A5:
        cmp     ax, 0
        stc
        jne     br_1C3AC
        retf
br_1C3AC:
        dec     ax
        mov     bl, 16h
        int     91h
        jae     br_1C3B4
        retf
br_1C3B4:
        cmp     byte ptr es:[si], 2eh
        stc
        jne     br_1C3BC
        retf
br_1C3BC:
        call    fn_1C3C5
        jne     loop_1C3A5
        mov     word ptr [A2_W_LOAD_FILE_INDEX], ax
        retf
fn_1C3C5:
        cmp     byte ptr [A2_B_DISK_FORMAT], 8
        jne     br_1C3CD
        ret
br_1C3CD:
        cmp     byte ptr [A2_B_DISK_FORMAT], 9
        jne     br_1C3D5
        ret
br_1C3D5:
        cmp     byte ptr [A2_B_FILE_VIEW_TYPE], 0
        jne     br_1C3DD
        ret
br_1C3DD:
        cmp     byte ptr es:[si+11h], 20h
        jne     br_1C3F3
        cmp     byte ptr es:[si+12h], 20h
        jne     br_1C3F3
        cmp     byte ptr es:[si+13h], 20h
        jne     br_1C3F3
        ret
br_1C3F3:
        pusha
        mov     al, byte ptr [A2_B_FILE_VIEW_TYPE]
        mov     ah, 3
        mul     ah
        mov     di, si
        add     ax, TBL_FILE_EXT_CODES
        mov     si, ax
        add     di, 11h
        mov     cx, 3
        repe cmpsb
        popa
        ret
L_1C40C:
        KEY_SAVE        A2_TBL_030B4
        mov     ax, word ptr [A2_W_LOAD_FILE_INDEX]
        mov     word ptr [A2_W_FILE_PANE_TOP], ax
        mov     word ptr [A2_W_FILE_PANE_ROW], 0
        callf   [A2_W_DIR_WIN_KEY_FN]
        retf
far_1C421:
        call    fn_1BE66
        callf   [A2_W_DIR_WIN_KEY_FN]
        retf
far_1C429:
        DISP_WIN_WIDE   "Directory"
        call    loop_1C495
        call    fn_1C640
        call    word ptr [A2_W_DIR_WIN_PAINT_FN]
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 6
        jne     br_1C454
        retf
br_1C454:
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "DELETE"
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        je      br_1C473
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "RENAME"
br_1C473:
        if      FW_VERSION < 120
        cmp     byte ptr [A2_B_02ED5], 2
        else
        cmp     byte ptr [A2_B_02EE5], 2
        endif
        je      br_1C47B
        retf
br_1C47B:
        DISP_SOFTKEY    05h, DISP_SK_BOX,    " "
        db      0beh, 1ch, 00h
        DISP_BMP        0adh, 34h, 1ch
        DISP_TEXT       0b7h, 34h, "NEW"
        db      0cbh
loop_1C495:
        mov     ax, word ptr [A2_W_DIR_LIST_TOP]
        mov     cl, 0
        mov     bl, 1ah
        int     91h
        jae     br_1C4A3
        jmp     br_1C5EC
br_1C4A3:
        cmp     byte ptr es:[si], 2eh
        jne     br_1C4AF
        inc     word ptr [A2_W_DIR_LIST_TOP]
        jmp     loop_1C495
br_1C4AF:
        mov     ax, word ptr [A2_W_DIR_LIST_TOP]
        sub     ax, 1
        jb      br_1C4C6
        mov     cl, 0
        mov     bl, 1ah
        int     91h
        cmp     byte ptr es:[si], 2eh
        je      br_1C4C6
        call    fn_1C544
br_1C4C6:
        mov     bp, 0
        mov     ax, word ptr [A2_W_DIR_LIST_TOP]
        mov     ch, 0bh
        call    fn_1C4FF
        jae     br_1C4D4
        ret
br_1C4D4:
        call    fn_1C54F
        call    fn_1C4FF
        jae     br_1C4DD
        ret
br_1C4DD:
        call    fn_1C577
        call    fn_1C4FF
        jae     br_1C4E6
        ret
br_1C4E6:
        call    fn_1C577
        call    fn_1C4FF
        jae     br_1C4EF
        ret
br_1C4EF:
        call    fn_1C577
        call    fn_1C4FF
        jae     br_1C4F8
        ret
br_1C4F8:
        call    fn_1C577
        call    fn_1C5D5
        ret
fn_1C4FF:
        push    ax
        push    bx
        push    cx
        push    cx
        push    bp
        mov     cl, 0
        mov     bl, 1ah
        int     91h
        pop     bp
        pop     cx
        jb      br_1C53F
        push    dx
        mov     dx, es
        mov     cl, 24h
        mov     ah, 8
        mov     bl, 5
        int     90h
        mov     ah, ch
        sub     ah, 0bh
        shr     ah, 3
        mov     al, 1ch
        cmp     ah, byte ptr [A2_W_DIR_LIST_ROW]
        jne     br_1C52B
        mov     al, 1eh
br_1C52B:
        mov     cl, 1ah
        mov     bl, 16h
        int     90h
        call    fn_1C58E
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        inc     ax
        inc     bp
        add     ch, 8
        clc
        ret
br_1C53F:
        pop     cx
        pop     bx
        pop     ax
        stc
        ret
fn_1C544:
        mov     ch, 0bh
        mov     cl, 17h
        mov     al, 5
        mov     bl, 0fh
        int     90h
        ret
fn_1C54F:
        cmp     dx, 0
        jne     br_1C555
        ret
br_1C555:
        pusha
        sub     ch, 4
        mov     cl, 17h
        mov     al, 3
        cmp     byte ptr [A2_B_DISK_FORMAT], 8
        je      br_1C571
        call    fn_1BE3D
        mov     cl, 17h
        mov     al, 3
        je      br_1C571
        mov     cl, 14h
        mov     al, 5
br_1C571:
        mov     bl, 0eh
        int     90h
        popa
        ret
fn_1C577:
        pusha
        sub     ch, 4
        mov     cl, 17h
        mov     al, 3
        mov     bl, 0eh
        int     90h
        sub     ch, 7
        mov     al, 7
        mov     bl, 0fh
        int     90h
        popa
        ret
fn_1C58E:
        cmp     bp, word ptr [A2_W_DIR_LIST_ROW]
        je      br_1C595
        ret
br_1C595:
        mov     ah, 8
        cmp     byte ptr [A2_B_DISK_FORMAT], 8
        je      br_1C5B7
        call    fn_1BE3D
        mov     ah, 8
        je      br_1C5B7
        mov     ah, 0
        mov     es, dx
loop_1C5A9:
        cmp     byte ptr es:[si], 20h
        je      br_1C5B7
        inc     si
        inc     ah
        cmp     ah, 8
        jne     loop_1C5A9
br_1C5B7:
        mov     al, 6
        mul     ah
        push    ax
        add     al, 24h
        mov     cl, al
        mov     ax, bp
        shl     al, 3
        add     al, 0eh
        mov     ch, al
        pop     ax
        mov     ah, 3eh
        sub     ah, al
        mov     al, ah
        mov     bl, 0eh
        int     90h
        ret
fn_1C5D5:
        pusha
        mov     cl, 0
        mov     bl, 1ah
        int     91h
        popa
        jae     br_1C5E0
        ret
br_1C5E0:
        sub     ch, 4
        mov     cl, 17h
        mov     al, 7
        mov     bl, 0fh
        int     90h
        ret
br_1C5EC:
        mov     cl, 23h
        mov     ch, 0eh
        mov     cl, 54h
        mov     al, 7
        mov     bl, 0eh
        int     90h
        cmp     byte ptr [A2_B_DISK_DEVICE], 0
        je      br_1C60E
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        je      br_1C61F
        cmp     byte ptr [A2_B_DISK_FORMAT], 9
        je      br_1C62F
        ret
br_1C60E:
        DISP_TEXT       1ah, 0bh, "[^Floppy^]"
        db      0c3h
br_1C61F:
        DISP_TEXT       1ah, 0bh, "[^F-ROM^]"
        db      0c3h
br_1C62F:
        DISP_TEXT       1ah, 0bh, "[^CD-ROM^]"
        db      0c3h
fn_1C640:
        mov     ax, ds
        mov     es, ax
        mov     di, P_2F32
        mov     cx, 14h
        mov     al, 20h
        rep stosb
        mov     ax, 0ffffh
        mov     word ptr [A2_TBL_FILE_PANE_ENTRIES], ax
        mov     word ptr [A2_W_02EF8], ax
        mov     word ptr [A2_W_02EFA], ax
        mov     word ptr [A2_W_02EFC], ax
        mov     word ptr [A2_W_02EFE], ax
        DISP_VLINE      5bh, 0eh, 20h
        DISP_HLINE      5bh, 0eh, 08h
        DISP_HLINE      5bh, 16h, 09h
        DISP_HLINE      5bh, 1eh, 09h
        DISP_HLINE      5bh, 26h, 09h
        DISP_HLINE      5bh, 2eh, 09h
        dec     word ptr [A2_W_FILE_PANE_TOP]
L_1C688:
        inc     word ptr [A2_W_FILE_PANE_TOP]
        mov     ax, word ptr [A2_W_FILE_PANE_TOP]
        mov     bl, 3
        int     91h
        jae     br_1C696
        ret
br_1C696:
        cmp     byte ptr es:[si], 2eh
        je      L_1C688
        mov     ax, word ptr [A2_W_FILE_PANE_TOP]
loop_1C69F:
        sub     ax, 1
        if      FW_VERSION >= 120
        jb      br_1C6B7
        else
        db      72h, 13h
        endif
        mov     bl, 16h
        int     91h
        if      FW_VERSION >= 120
        jb      br_1C6B7
        else
        db      72h, 0dh
        endif
        push    ax
        call    fn_1C3C5
        pop     ax
        jne     loop_1C69F
        DISP_VLINE      5bh, 0ah, 04h
        if      FW_VERSION <> 120
        mov     ax, word ptr [A2_W_02EE2]
        endif
br_1C6B7:
        if      FW_VERSION >= 120
        mov     ax, word ptr [A2_W_FILE_PANE_TOP]
        endif
        mov     cl, 67h
        mov     ch, 0bh
        mov     bl, 0
        call    fn_1C717
        if      FW_VERSION >= 112
        jae     br_1C6C6
        ret
br_1C6C6:
        mov     word ptr [A2_TBL_FILE_PANE_ENTRIES], ax
        dec     word ptr [A2_TBL_FILE_PANE_ENTRIES]
        call    fn_1C717
        jae     br_1C6D3
        ret
br_1C6D3:
        mov     word ptr [A2_W_02EF8], ax
        dec     word ptr [A2_W_02EF8]
        call    fn_1C717
        endif
        jae     br_1C6E0
        ret
br_1C6E0:
        if      FW_VERSION >= 112
        mov     word ptr [A2_W_02EFA], ax
        dec     word ptr [A2_W_02EFA]
        else
        mov     word ptr [A2_TBL_FILE_PANE_ENTRIES], ax
        dec     word ptr [A2_TBL_FILE_PANE_ENTRIES]
        endif
        call    fn_1C717
        jae     br_1C6ED
        ret
br_1C6ED:
        if      FW_VERSION < 112
        mov     word ptr [A2_W_02EF8], ax
        dec     word ptr [A2_W_02EF8]
        call    fn_1C717
        jae     L_1BFC0
        ret
L_1BFC0:
        mov     word ptr [A2_W_02EEA_2], ax
        dec     word ptr [A2_W_02EEA_2]
        call    fn_1C717
        jae     L_1BFCD
        ret
L_1BFCD:
        endif
        mov     word ptr [A2_W_02EFC], ax
        dec     word ptr [A2_W_02EFC]
        call    fn_1C717
        jae     br_1C6FA
        ret
br_1C6FA:
        mov     word ptr [A2_W_02EFE], ax
        dec     word ptr [A2_W_02EFE]
loop_1C701:
        mov     bl, 3
        int     91h
        jae     br_1C708
        ret
br_1C708:
        inc     ax
        pusha
        call    fn_1C3C5
        popa
        jne     loop_1C701
        DISP_VLINE      5bh, 2eh, 04h
        db      0c3h
fn_1C717:
        push    cx
        push    bx
        mov     bl, 3
        int     91h
        mov     word ptr [A2_W_SEL_FILE_SIZE_LO], bx
        mov     word ptr [A2_W_SEL_FILE_SIZE_HI], dx
        pop     bx
        pop     cx
        jae     br_1C72A
        ret
br_1C72A:
        inc     ax
        pusha
        call    fn_1C3C5
        popa
        jne     fn_1C717
        push    ax
        push    bx
        mov     ah, 14h
        mov     dx, es
        mov     bl, 5
        int     90h
        cmp     byte ptr es:[si+10h], 20h
        jne     br_1C756
        push    cx
        sub     cl, 0ah
        mov     al, 0ah
        mov     ah, 7
        mov     bl, 14h
        int     90h
        mov     al, 1ch
        mov     bl, 16h
        int     90h
        pop     cx
br_1C756:
        pop     bx
        pop     ax
        mov     bh, bl
        inc     bl
        add     ch, 8
        cmp     bh, byte ptr [A2_W_FILE_PANE_ROW]
        clc
        je      br_1C767
        ret
br_1C767:
        pusha
        push    ds
        dec     ax
        mov     word ptr [P_2F00], ax
        mov     di, P_2F32
        mov     ax, ds
        mov     es, ax
        mov     ds, dx
        mov     cx, 14h
        rep movsb
        pop     ds
        popa
        clc
        ret
cb_1C77F:
        mov     ax, word ptr [A2_W_DIR_LIST_ROW]
        shl     al, 3
        mov     ch, al
        add     ch, 0ah
        mov     cl, 23h
        mov     al, 31h
        mov     ah, 9
        mov     bl, 15h
        int     90h
        ret
cb_1C795:
        mov     ax, word ptr [A2_W_FILE_PANE_ROW]
        mov     ah, 8
        mul     ah
        add     al, 0ah
        mov     ch, al
        mov     cl, 66h
        mov     al, 79h
        mov     ah, 9
        mov     bl, 15h
        int     90h
        ret
far_1C7AB:
        mov     ax, word ptr [A2_W_DIR_LIST_ROW]
        add     word ptr [A2_W_DIR_LIST_TOP], ax
        mov     word ptr [A2_W_DIR_LIST_ROW], 0
        KEY_RESTORE     A2_TBL_030B4
        mov     bx, word ptr [A2_W_FILE_PANE_ROW]
        shl     bx, 1
        mov     ax, word ptr [bx+A2_TBL_FILE_PANE_ENTRIES]
        mov     bl, 16h
        int     91h
        mov     word ptr [A2_W_LOAD_FILE_INDEX], ax
        retf
far_1C7CE:
        mov     word ptr [A2_W_DIR_WIN_KEY_FN], far_1C7CE-APP2_CSBASE
        mov     word ptr [A2_W_DIR_WIN_PAINT_FN], cb_1C795-APP2_CSBASE
        int     0a4h
        KEY_WHEEL2      EP_FAR_1C8E8_OFF, EP_FAR_1C8E8_SEG, EP_FAR_1C8AD_OFF, EP_FAR_1C8AD_SEG
        KEY_CURSOR      EP_L_1CDDE_OFF, APP2_SEG, EP_L_1C861_OFF, APP2_SEG, EP_L_1C8A6_OFF, APP2_SEG, EP_L_1C89F_OFF, APP2_SEG
        KEY_DOWN        20h, EP_FAR_1C429_OFF, EP_FAR_1C429_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        16h, EP_L_1C91A_OFF, APP2_SEG
        KEY_DOWN        13h, EP_L_1C91A_OFF, APP2_SEG
        if      FW_VERSION >= 120
        db      80h, 3eh, 0e7h
        else
        db      80h, 3eh, 0d7h
        endif
        db      2eh, 06h
        jne     br_1C820
        retf
br_1C820:
        KEY_SOFT        0000h, 0000h, EP_FAR_1CA5C_OFF, EP_FAR_1CA5C_SEG, EP_L_1C949_OFF, APP2_SEG, EP_FAR_1C7AB_OFF, EP_FAR_1C7AB_SEG, 0000h, 0000h, 0000h, 0000h
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        db      75h, 08h
        KEY_DOWN        12h, 0000h, 0000h
        if      FW_VERSION >= 120
        db      80h, 3eh, 0e7h
        else
        db      80h, 3eh, 0d7h
        endif
        db      2eh, 05h, 74h, 08h
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 7
        je      br_1C858
        retf
br_1C858:
        KEY_DOWN        14h, EP_L_1C9D4_OFF, APP2_SEG
        db      0cbh
L_1C861:
        call    fn_1BE66
        mov     bx, word ptr [A2_W_FILE_PANE_ROW]
        shl     bx, 1
        mov     ax, word ptr [bx+A2_TBL_FILE_PANE_ENTRIES]
        mov     cl, 6
        mov     bl, 1ah
        int     91h
        jb      br_1C88F
        mov     word ptr [A2_W_DIR_LIST_TOP], ax
        mov     word ptr [A2_W_DIR_LIST_ROW], 0
        mov     word ptr [A2_W_FILE_PANE_ROW], 0
        mov     word ptr [A2_W_FILE_PANE_TOP], 0
        call    fn_1BFF4
        retf
br_1C88F:
        cmp     ax, 0
        jne     br_1C895
        retf
br_1C895:
        int     95h
        call    fn_1BE98
        push    cs
        call    far_1C421
        retf
L_1C89F:
        int     0a3h
        push    cs
        call    far_1C8AD
        retf
L_1C8A6:
        int     0a3h
        push    cs
        call    far_1C8E8
        retf
far_1C8AD:
        call    fn_1BE66
        mov     ax, word ptr [A2_W_FILE_PANE_ROW]
        cmp     ax, 4
        je      br_1C8CE
        mov     bx, word ptr [A2_W_FILE_PANE_ROW]
        inc     bx
        shl     bx, 1
        cmp     word ptr [bx+A2_TBL_FILE_PANE_ENTRIES], -1
        stc
        jne     br_1C8C8
        retf
br_1C8C8:
        inc     word ptr [A2_W_FILE_PANE_ROW]
        clc
        retf
br_1C8CE:
        mov     ax, word ptr [A2_W_02EFE]
loop_1C8D1:
        inc     ax
        mov     bl, 3
        int     91h
        jae     br_1C8D9
        retf
br_1C8D9:
        push    ax
        call    fn_1C3C5
        pop     ax
        jne     loop_1C8D1
        mov     ax, word ptr [A2_W_02EF8]
        mov     word ptr [A2_W_FILE_PANE_TOP], ax
        clc
        retf
far_1C8E8:
        call    fn_1BE66
        cmp     word ptr [A2_W_FILE_PANE_ROW], 0
        je      br_1C8F7
        dec     word ptr [A2_W_FILE_PANE_ROW]
        retf
br_1C8F7:
        mov     ax, word ptr [A2_W_FILE_PANE_TOP]
loop_1C8FA:
        cmp     ax, 0
        stc
        jne     br_1C901
        retf
br_1C901:
        dec     ax
        mov     bl, 16h
        int     91h
        jae     br_1C909
        retf
br_1C909:
        cmp     byte ptr es:[si], 2eh
        stc
        jne     br_1C911
        retf
br_1C911:
        call    fn_1C3C5
        jne     loop_1C8FA
        mov     word ptr [A2_W_FILE_PANE_TOP], ax
        retf
L_1C91A:
        mov     bx, word ptr [A2_W_FILE_PANE_ROW]
        shl     bx, 1
        mov     ax, word ptr [bx+A2_TBL_FILE_PANE_ENTRIES]
        mov     cl, 6
        mov     bl, 1ah
        int     91h
        jb      br_1C944
        mov     word ptr [A2_W_DIR_LIST_TOP], ax
        mov     word ptr [A2_W_DIR_LIST_ROW], 0
        mov     word ptr [A2_W_FILE_PANE_ROW], 0
        mov     word ptr [A2_W_FILE_PANE_TOP], 0
        call    fn_1BFF4
br_1C944:
        push    cs
        call    far_1C7AB
        retf
L_1C949:
        call    fn_1BE66
        mov     si, P_2F32
        mov     cx, 10h
        mov     al, 0
tgt_1C954:
        or      al, byte ptr [si]
        inc     si
        loop    tgt_1C954
        cmp     al, 20h
        jne     br_1C95E
        retf
br_1C95E:
        mov     ax, ds
        mov     es, ax
        mov     cx, 14h
        mov     si, P_2F32
        mov     di, P_2F47
        rep movsb
        mov     si, P_2F47
        mov     dx, ds
        mov     ah, 10h
        cmp     byte ptr [si+10h], 2eh
        je      br_1C97C
        mov     ah, 8
br_1C97C:
        if      FW_VERSION >= 110
        mov     bx, 1fd4h
        else
        mov     bx, 1fabh
        endif
        mov     cx, cs
        int     0b7h
        retf
        pusha
        mov     bl, 11h
        int     91h
        cmp     bl, 0
        popa
        jne     br_1C9CD
        mov     si, ax
        mov     ds, dx
        mov     bx, APPDATA_SEG
        mov     es, bx
        mov     di, P_2F47
        mov     cx, 10h
        rep movsb
        mov     ds, bx
        mov     es, bx
        mov     si, P_2F47
        pusha
        mov     bl, 0eh
        int     91h
        popa
        jae     br_1C9C6
        push    si
        mov     ax, ds
        mov     es, ax
        mov     si, P_2F32
        mov     bl, 0eh
        int     91h
        pop     si
        mov     dx, ds
        mov     bl, 0bh
        int     91h
        mov     ax, 1
        retf
br_1C9C6:
        mov     al, 0dh
        int     95h
        sub     ax, ax
        retf
br_1C9CD:
        mov     al, 1
        int     95h
        sub     ax, ax
        retf
L_1C9D4:
        call    fn_1BE66
        mov     ax, ds
        mov     es, ax
        mov     cx, 14h
        mov     si, STR_NEWFOLDR
        mov     di, P_2F47
        rep movsb
        mov     si, P_2F47
        mov     dx, ds
        mov     ah, 8
        if      FW_VERSION >= 110
        mov     bx, 2045h
        else
        mov     bx, 201ch
        endif
        mov     cx, cs
        int     0b7h
        retf
        pusha
        int     0b4h
        popa
        mov     si, ax
        mov     ds, dx
        mov     bx, APPDATA_SEG
        mov     es, bx
        mov     di, P_2F47
        mov     cx, 8
tgt_1CA08:
        mov     al, byte ptr [si]
        cmp     al, 61h
        jb      br_1CA14
        cmp     al, 7bh
        jae     br_1CA14
        sub     al, 20h
br_1CA14:
        mov     byte ptr es:[di], al
        inc     si
        inc     di
        loop    tgt_1CA08
        mov     ds, bx
        mov     es, bx
        mov     si, P_2F47
        mov     bl, 0eh
        int     91h
        jb      br_1CA2A
        jmp     br_1CA50
br_1CA2A:
        mov     ax, ds
        mov     es, ax
        mov     si, P_2F47
        mov     cl, 3
        mov     bl, 1ah
        int     91h
        jb      br_1CA57
        call    fn_1C640
loop_1CA3C:
        push    cs
        call    far_1C8AD
        pushf
        call    fn_1C640
        popf
        jae     loop_1CA3C
        DISP_PLANE0
        int     0a5h
        mov     ax, 1
        retf
br_1CA50:
        mov     al, 1ah
        int     95h
        sub     ax, ax
        retf
br_1CA57:
        int     95h
        sub     ax, ax
        retf
far_1CA5C:
        call    fn_1BE66
        mov     si, P_2F32
        mov     cx, 10h
        mov     al, 0
tgt_1CA67:
        or      al, byte ptr [si]
        inc     si
        loop    tgt_1CA67
        cmp     al, 20h
        jne     br_1CA71
        retf
br_1CA71:
        cmp     byte ptr [A2_B_02F42], 2eh
        je      br_1CA7C
        call    FAR_1CAA8
        retf
br_1CA7C:
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        jne     BR_1CAA4
        mov     si, P_2F43
        call    far_1D420
        db      "SND", 00h
        jb      BR_1CAA4
        mov     si, P_2F32
        mov     ax, ds
        mov     es, ax
        mov     ax, 2
        int     47h
        cmp     ax, 0
        je      BR_1CAA4
        call    far_1CBC3
        retf
BR_1CAA4:
        call    far_1CB3A
        retf
FAR_1CAA8:
        DISP_WIN_NARROW "Delete Folder"
        DISP_TEXT       28h, 0eh, "Pressing DO IT will delete"
        DISP_TEXT       28h, 18h, "selected folder and its"
        DISP_TEXT       28h, 22h, "contents!!"
        mov     si, 11h
        DISP_BMP        0c6h, 18h, 11h
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        int     0a4h
        KEY_DOWN        13h, EP_FAR_1C421_OFF, EP_FAR_1C421_SEG
        KEY_DOWN        14h, EP_FAR_1CC70_OFF, EP_FAR_1CC70_SEG
        db      0c3h
far_1CB3A:
        DISP_WIN_NARROW "Delete File"
        DISP_TEXT       28h, 14h, "Pressing DO IT will delete"
        DISP_TEXT       28h, 1eh, "selected file!!"
        mov     si, 11h
        DISP_BMP        0c6h, 18h, 11h
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "ALL"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        int     0a4h
        KEY_DOWN        11h, EP_L_1CC9C_OFF, APP2_SEG
        KEY_DOWN        13h, EP_FAR_1C421_OFF, EP_FAR_1C421_SEG
        KEY_DOWN        14h, EP_FAR_1CC70_OFF, EP_FAR_1CC70_SEG
        db      0c3h
far_1CBC3:
        DISP_WIN_NARROW "Delete F-ROM Sound"
        DISP_TEXT       28h, 0eh, "This sound is in use."
        DISP_TEXT       28h, 18h, "Pressing DO IT will"
        DISP_TEXT       28h, 22h, "    delete immediately!!"
        mov     si, 11h
        DISP_BMP        0c6h, 18h, 11h
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        int     0a4h
        KEY_DOWN        13h, EP_FAR_1C421_OFF, EP_FAR_1C421_SEG
        KEY_DOWN        14h, EP_L_1CC5F_OFF, APP2_SEG
        db      0c3h
L_1CC5F:
        mov     ax, ds
        mov     es, ax
        mov     si, P_2F32
        mov     ax, 3
        int     47h
        push    cs
        call    far_1CC70
        retf
far_1CC70:
        mov     bl, 11h
        int     91h
        jb      br_1CC95
        cmp     bl, 0
        jne     br_1CC90
        call    fn_1CDA5
        mov     ax, ds
        mov     es, ax
        mov     si, P_2F32
        mov     bl, 14h
        int     91h
        jb      br_1CC95
        push    cs
        call    far_1C421
        retf
br_1CC90:
        mov     al, 1
        int     95h
        retf
br_1CC95:
        int     95h
        push    cs
        call    far_1C421
        retf
L_1CC9C:
        int     0a4h
        mov     cx, ds
        mov     si, P_2EE2
        mov     bl, 0
        mov     bh, 0
        mov     dx, 8
        mov     di, (APP2_BASE+intcb_1CCC8-APP2_SEG*16)
        int     7dh
        KEY_DOWN        13h, EP_L_1CD65_OFF, APP2_SEG
        KEY_DOWN        14h, EP_L_1CD76_OFF, APP2_SEG
        KEY_DOWN        20h, EP_L_1CCC9_OFF, APP2_SEG
        retf
intcb_1CCC8:
        retf
L_1CCC9:
        DISP_WIN        32h, 06h, 0beh, 36h, "Delete ALL Files"
        DISP_TEXT       39h, 11h, "Pressing DO IT will delete"
        DISP_TEXT       39h, 1ch, "all files!!(except folders)"
        DISP_TEXT       39h, 28h, "Delete:"
        mov     si, 11h
        DISP_BMP        0dbh, 17h, 11h
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        mov     dx, ds
        DISP_TEXT_IDX   63h, 28h, P_2EE2, TBL_FILE_TYPE_LABELS
        DISP_CURSOR     63h, 28h, 37h
        retf
L_1CD65:
        push    cs
        call    far_1C05D
        push    cs
        call    far_1C421
        push    cs
        call    far_1C429
        push    cs
        call    far_1CA5C
        retf
L_1CD76:
        call    EP_FN_1BE66_OFF+APP2_CSBASE
        mov     si, TBL_FILE_TYPE_LABELS
        lodsb
        mov     ah, byte ptr [P_2EE2]
        mul     ah
        add     si, ax
        mov     cl, 2ah
        mov     ch, 2ah
        mov     dl, 2ah
        lodsb
        cmp     al, 41h
        je      br_1CD98
        mov     cl, byte ptr [si]
        mov     ch, byte ptr [si+1]
        mov     dl, byte ptr [si+2]
br_1CD98:
        mov     bl, 1bh
        int     91h
        jae     br_1CDA0
        int     95h
br_1CDA0:
        push    cs
        call    far_1C421
        retf
fn_1CDA5:
        pusha
        push    es
        DISP_MSG        " Delete:"
        DISP_ERASE      5ah, 17h, 78h, 07h
        mov     dx, ds
        mov     cl, 5ah
        mov     ch, 17h
        mov     si, P_2F32
        mov     ah, 14h
        mov     bl, 5
        int     90h
        DISP_INVERT     5ah, 17h, 78h, 07h
        DISP_FLUSH
        mov     cx, 1f4h
        int     0b6h
        DISP_PLANE0
        pop     es
        popa
        ret
L_1CDDE:
        cmp     byte ptr [A2_B_DIR_NAME_MODE], 0
        je      br_1CE62
        mov     ax, 0
        mov     cl, 0
        mov     bl, 1ah
        int     91h
        jb      br_1CE62
        cmp     dx, 0
        je      br_1CE67
        mov     word ptr [A2_W_DIR_WIN_KEY_FN], L_1CDDE-APP2_CSBASE
        mov     word ptr [A2_W_DIR_WIN_PAINT_FN], cb_1C77F-APP2_CSBASE
        int     0a4h
        KEY_WHEEL2      EP_FAR_1CF54_OFF, EP_FAR_1CF54_SEG, EP_FAR_1CF29_OFF, EP_FAR_1CF29_SEG
        KEY_CURSOR      EP_FAR_1CECA_OFF, EP_FAR_1CECA_SEG, EP_FAR_1C7CE_OFF, EP_FAR_1C7CE_SEG, EP_L_1CF22_OFF, APP2_SEG, EP_L_1CF1B_OFF, APP2_SEG
        KEY_DOWN        20h, EP_FAR_1C429_OFF, EP_FAR_1C429_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        16h, EP_FAR_1C7AB_OFF, EP_FAR_1C7AB_SEG
        KEY_DOWN        13h, EP_FAR_1C7AB_OFF, EP_FAR_1C7AB_SEG
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 6
        jne     br_1CE47
        retf
br_1CE47:
        KEY_SOFT        0000h, 0000h, EP_L_1CFEF_OFF, APP2_SEG, EP_L_1CF8D_OFF, APP2_SEG, EP_FAR_1C7AB_OFF, EP_FAR_1C7AB_SEG, 0000h, 0000h, 0000h, 0000h
        retf
br_1CE62:
        push    cs
        call    far_1C7CE
        retf
br_1CE67:
        mov     word ptr [A2_W_DIR_WIN_KEY_FN], L_1CDDE-APP2_CSBASE
        mov     word ptr [A2_W_DIR_WIN_PAINT_FN], cb_1C77F-APP2_CSBASE
        int     0a4h
        KEY_CURSOR      0000h, 0000h, EP_FAR_1C7CE_OFF, EP_FAR_1C7CE_SEG, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, EP_FAR_1C429_OFF, EP_FAR_1C429_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        16h, EP_FAR_1C7AB_OFF, EP_FAR_1C7AB_SEG
        KEY_DOWN        13h, EP_FAR_1C7AB_OFF, EP_FAR_1C7AB_SEG
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 6
        jne     br_1CEAF
        retf
br_1CEAF:
        KEY_SOFT        0000h, 0000h, EP_L_1CFEF_OFF, APP2_SEG, EP_L_1CF8D_OFF, APP2_SEG, EP_FAR_1C7AB_OFF, EP_FAR_1C7AB_SEG, 0000h, 0000h, 0000h, 0000h
        retf
far_1CECA:
        call    fn_1BE66
        mov     cl, 7
        mov     bl, 1ah
        int     91h
        jb      br_1CF0B
        mov     word ptr [A2_W_DIR_LIST_TOP], ax
        mov     word ptr [A2_W_DIR_LIST_ROW], 0
        mov     word ptr [A2_W_FILE_PANE_ROW], 0
        mov     word ptr [A2_W_FILE_PANE_TOP], 0
        push    bx
        call    fn_1BFF4
        jb      br_1CF0B
        mov     ax, 0
        mov     cl, 0
        mov     bl, 1ah
        int     91h
        pop     bx
        cmp     dx, 0
        je      br_1CF00
        retf
br_1CF00:
        mov     word ptr [A2_W_FILE_PANE_TOP], bx
        mov     word ptr [A2_W_FILE_PANE_ROW], 0
        retf
br_1CF0B:
        cmp     ax, 0
        jne     br_1CF11
        retf
br_1CF11:
        int     95h
        call    fn_1BE98
        push    cs
        call    far_1C421
        retf
L_1CF1B:
        int     0a3h
        push    cs
        call    far_1CF29
        retf
L_1CF22:
        int     0a3h
        push    cs
        call    far_1CF54
        retf
far_1CF29:
        call    fn_1BE66
        cmp     word ptr [A2_W_DIR_LIST_ROW], 4
        je      br_1CF42
        inc     word ptr [A2_W_DIR_LIST_ROW]
        call    fn_1BFF4
        jb      br_1CF3D
        retf
br_1CF3D:
        dec     word ptr [A2_W_DIR_LIST_ROW]
        retf
br_1CF42:
        inc     word ptr [A2_W_DIR_LIST_TOP]
        call    fn_1BFF4
        jb      br_1CF4C
        retf
br_1CF4C:
        dec     word ptr [A2_W_DIR_LIST_TOP]
        call    fn_1BFF4
        retf
far_1CF54:
        call    fn_1BE66
        cmp     word ptr [A2_W_DIR_LIST_ROW], 0
        je      br_1CF66
        dec     word ptr [A2_W_DIR_LIST_ROW]
        call    fn_1BFF4
        retf
br_1CF66:
        cmp     word ptr [A2_W_DIR_LIST_TOP], 0
        stc
        jne     br_1CF6F
        retf
br_1CF6F:
        mov     ax, word ptr [A2_W_DIR_LIST_TOP]
        dec     ax
        mov     cl, 0
        mov     bl, 1ah
        int     91h
        jae     br_1CF7C
        retf
br_1CF7C:
        cmp     byte ptr es:[si], 2eh
        stc
        jne     br_1CF84
        retf
br_1CF84:
        dec     word ptr [A2_W_DIR_LIST_TOP]
        call    fn_1BFF4
        clc
        retf
L_1CF8D:
        call    fn_1BE66
        mov     ax, word ptr [A2_W_DIR_LIST_TOP]
        add     ax, word ptr [A2_W_DIR_LIST_ROW]
        mov     cl, 0
        mov     bl, 1ah
        int     91h
        push    ds
        push    es
        push    ds
        pop     es
        pop     ds
        mov     cx, 14h
        mov     di, P_2F47
        rep movsb
        pop     ds
        mov     si, P_2F47
        mov     dx, ds
        mov     ah, 8
        if      FW_VERSION >= 110
        mov     bx, 260ah
        else
        mov     bx, 25e1h
        endif
        mov     cx, cs
        int     0b7h
        retf
        mov     si, ax
        mov     ds, dx
        mov     bx, APPDATA_SEG
        mov     es, bx
        mov     di, P_2F47
        mov     cx, 10h
        rep movsb
        mov     ds, bx
        mov     es, bx
        mov     si, P_2F47
        pusha
        mov     cl, 5
        mov     bl, 1ah
        int     91h
        popa
        jae     br_1CFE8
        mov     dx, ds
        mov     cl, 2
        mov     bl, 1ah
        int     91h
        mov     ax, 1
        retf
br_1CFE8:
        mov     al, 0dh
        int     95h
        sub     ax, ax
        retf
L_1CFEF:
        call    fn_1BE66
        call    FAR_1CAA8
        KEY_DOWN        13h, EP_FAR_1C421_OFF, EP_FAR_1C421_SEG
        KEY_DOWN        14h, EP_L_1D006_OFF, APP2_SEG
        db      0cbh
L_1D006:
        call    fn_1BE66
        mov     bl, 11h
        int     91h
        jb      br_1D038
        cmp     bl, 0
        jne     br_1D033
        call    fn_1D03F
        mov     cl, 4
        mov     bl, 1ah
        int     91h
        jb      br_1D038
        call    fn_1BFF4
        jae     br_1D02E
        push    cs
        call    far_1CF54
        jae     br_1D02E
        push    cs
        call    far_1CECA
br_1D02E:
        push    cs
        call    far_1C421
        retf
br_1D033:
        mov     al, 1
        int     95h
        retf
br_1D038:
        int     95h
        push    cs
        call    far_1C421
        retf
fn_1D03F:
        pusha
        push    es
        DISP_MSG        " Delete:"
        DISP_ERASE      5ah, 17h, 78h, 07h
        mov     dx, ds
        mov     cl, 5ah
        mov     ch, 17h
        mov     si, P_2F0A
        mov     ah, 14h
        mov     bl, 5
        int     90h
        DISP_INVERT     5ah, 17h, 78h, 07h
        DISP_FLUSH
        mov     cx, 1f4h
        int     0b6h
        DISP_PLANE0
        pop     es
        popa
        ret
L_1D078:
L_1C9B8:
        call    fn_1BDD0
        mov     word ptr [A2_W_DISK_CURSOR_FN], cb_1C2C2-APP2_CSBASE
        KEY_WHEEL2      EP_DISK_DEVICE_SELECT_PREV_OFF, APP2_SEG, EP_DISK_DEVICE_SELECT_NEXT_OFF, EP_DISK_DEVICE_SELECT_NEXT_SEG
        KEY_CURSOR      EP_BR_1C359_OFF, EP_BR_1C359_SEG, EP_L_1D335_OFF, APP2_SEG, EP_BR_1C359_OFF, EP_BR_1C359_SEG, EP_L_1D2C5_OFF, APP2_SEG
        KEY_DOWN        16h, EP_L_1D142_OFF, APP2_SEG
        db      0cbh
disk_device_select_next:
        mov     bh, 0
        mov     bl, byte ptr [A2_B_DISK_DEVICE]
loop_1D0AC:
        inc     bl
        cmp     bl, 7
        jne     br_1D0B5
        inc     bl
br_1D0B5:
        cmp     bl, 0ah
        jb      br_1D0BC
        mov     bl, 0
br_1D0BC:
        mov     byte ptr [A2_B_DISK_DEVICE], bl
        cmp     byte ptr [bx+A2_TBL_DEVICE_STATE], 1
        je      loop_1D0AC
        mov     al, bl
        mov     ah, 0
        int     94h
        int     0b4h
        call    fn_1BE98
        jb      br_1D0D5
        retf
br_1D0D5:
        cmp     byte ptr [A2_B_DISK_DEVICE], 0
        jne     br_1D0DD
        retf
br_1D0DD:
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        jne     br_1D0E5
        retf
br_1D0E5:
        cmp     al, 0eh
        jne     br_1D0EA
        retf
br_1D0EA:
        mov     bl, 0ch
        int     93h
        jae     br_1D0F1
        retf
br_1D0F1:
        call    fn_1BE98
        retf
disk_device_select_prev:
        mov     bh, 0
        mov     bl, byte ptr [A2_B_DISK_DEVICE]
loop_1D0FB:
        sub     bl, 1
        jae     br_1D102
        mov     bl, 9
br_1D102:
        cmp     bl, 7
        jne     br_1D109
        dec     bl
br_1D109:
        mov     byte ptr [A2_B_DISK_DEVICE], bl
        cmp     byte ptr [bx+A2_TBL_DEVICE_STATE], 1
        je      loop_1D0FB
        mov     al, bl
        mov     ah, 0
        int     94h
        int     0b4h
        call    fn_1BE98
        jb      br_1D122
        retf
br_1D122:
        cmp     byte ptr [A2_B_DISK_DEVICE], 0
        jne     br_1D12A
        retf
br_1D12A:
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        jne     br_1D132
        retf
br_1D132:
        cmp     al, 0eh
        jne     br_1D137
        retf
br_1D137:
        mov     bl, 0ch
        int     93h
        jae     br_1D13E
        retf
br_1D13E:
        call    fn_1BE98
        retf
L_1D142:
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        jne     br_1D14B
        jmp     br_1D1C8
br_1D14B:
        mov     bl, 1ch
        int     91h
        mov     di, A2_TBL_DEVICE_STATE
        mov     ax, ds
        mov     es, ax
        mov     al, 0
        mov     cx, 0ah
        rep stosb
        retf
        int     0a4h
        if      FW_VERSION >= 114
        KEY_DOWN        11h, (APP2_BASE+L_1D1BF-APP2_SEG*16), APP2_SEG
        endif
        KEY_DOWN        13h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        14h, (APP2_BASE+L_1CAD6-APP2_SEG*16), APP2_SEG
        DISP_WIN_NARROW "SCSI RESET"
        if      FW_VERSION >= 114
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "1MIN"
        endif
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        db      0cbh
L_1CAD6:
        mov     di, A2_TBL_DEVICE_STATE
        mov     ax, ds
        mov     es, ax
        mov     al, 0
        mov     cx, 0ah
        rep stosb
        mov     bl, 0bh
        int     93h
        push    cs
        call    disk_screen_enter
        retf
L_1D1BF:
        mov     bl, 0dh
        int     93h
        push    cs
        call    disk_screen_enter
        retf
br_1D1C8:
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        je      br_1D1D0
        retf
br_1D1D0:
        cmp     byte ptr [A2_B_DISK_FORMAT], 0bh
        je      br_1D1D8
        retf
br_1D1D8:
        int     0b1h
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "ARRANG"
        int     0a4h
        KEY_DOWN        16h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        13h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        14h, (APP2_BASE+L_1CB42-APP2_SEG*16), APP2_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_1CB42:
        DISP_WIN_NARROW "Arrange F-ROM"
        db      0beh, 0eh, 00h
        DISP_BMP        2eh, 1ah, 0eh
        DISP_TEXT       24h, 0fh, "THIS PROCESS^WILL^TAKE^A^WHILE!"
        DISP_TEXT       4eh, 1bh, "IT'S NOT POSIIBLE TO"
        DISP_TEXT       4eh, 25h, "ABORT,ONCE INITIATED!"
        DISP_SOFTKEY    04h, DISP_SK_FILL, "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        int     0a4h
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        13h, (APP2_BASE+DISK_SCREEN_ENTER-APP2_SEG*16), APP2_SEG
        KEY_DOWN        14h, (APP2_BASE+L_1CBE9-APP2_SEG*16), APP2_SEG
        db      0cbh
L_1CBE9:
        int     0b5h
        call    fn_1BE98
        push    cs
        call    disk_screen_enter
        retf
L_1D2C5:
        cmp     word ptr [A2_W_DISK_PARTITION_COUNT], 0
        jne     br_1D2CD
        retf
br_1D2CD:
        call    fn_1BDD9
        mov     word ptr [A2_W_DISK_CURSOR_FN], cb_1C2CB-APP2_CSBASE
        if      FW_VERSION >= 110
        FIELD_WHEEL     ds, A2_W_DISK_PARTITION, 0, 0, word ptr [A2_W_DISK_PARTITION_COUNT], intcb_1D2FB-APP2_CSBASE
        KEY_CURSOR      0000h, 0000h, EP_L_1D335_OFF, APP2_SEG, (APP2_BASE+L_1D078-APP2_SEG*16), APP2_SEG, 0000h, 0000h
        db      0cbh
        else
        mov     cx, ds
        mov     si, A2_W_DISK_PARTITION
        mov     bl, 0
        mov     bh, 0
        mov     dx, word ptr [A2_W_DISK_PARTITION_COUNT]
        mov     di, A2_W_0294B
        int     7dh
        KEY_CURSOR      0000h, 0000h, EP_L_1D335_OFF, APP2_SEG, (APP2_BASE+L_1D078-APP2_SEG*16), APP2_SEG, 0000h, 0000h
        retf
        endif
intcb_1D2FB:
        int     0b4h
        mov     ax, word ptr [A2_W_DISK_PARTITION]
        if      FW_VERSION >= 110
        push    ax
        endif
        mov     bl, 17h
        int     91h
        if      FW_VERSION <> 107
        pop     ax
        jae     br_1D314
        or      ax, ax
        je      br_1D314
        dec     ax
        mov     word ptr [A2_W_DISK_PARTITION], ax
        mov     bl, 17h
        int     91h
br_1D314:
        endif
        mov     word ptr [A2_W_FILE_PANE_TOP], 0
        mov     word ptr [A2_W_FILE_PANE_ROW], 0
        mov     word ptr [A2_W_DIR_LIST_TOP], 0
        mov     word ptr [A2_W_DIR_LIST_ROW], 0
        call    fn_1BFF4
        DISP_PLANE0
        int     0a5h
        retf
L_1D335:
        cmp     byte ptr [A2_B_DIR_NAME_MODE], 0
        jne     L_1CE3D
        retf
L_1CE3D:
        mov     ax, word ptr [A2_W_DIR_LIST_ROW]
        add     word ptr [A2_W_DIR_LIST_TOP], ax
        mov     word ptr [A2_W_DIR_LIST_ROW], 0
        if      FW_VERSION >= 114
        mov     si, (APP2_BASE+L_1D335-APP2_SEG*16)
        elseif  FW_VERSION >= 110
        mov     si, 2973h
        else
        mov     si, 293ah
        endif
        call    L_1B715
        mov     word ptr [A2_W_DISK_CURSOR_FN], cb_1C2D4-APP2_CSBASE
        KEY_WHEEL2      (APP2_BASE+L_1CCD8-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1CCC3-APP2_SEG*16), APP2_SEG
        KEY_CURSOR      EP_L_1C308_OFF, APP2_SEG, EP_BR_1C359_OFF, EP_BR_1C359_SEG, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        16h, EP_L_1C40C_OFF, APP2_SEG
        call    fn_1BE3D
        je      L_1CE87
        cmp     byte ptr [A2_B_DISK_FORMAT], 8
        je      L_1CE8E
        retf
L_1CE87:
        mov     word ptr [A2_W_DISK_CURSOR_FN], cb_1C2DD-APP2_CSBASE
        retf
L_1CE8E:
        mov     word ptr [A2_W_DISK_CURSOR_FN], cb_1C2E6-APP2_CSBASE
        retf
L_1CCC3:
        mov     ax, word ptr [A2_W_DIR_LIST_TOP]
        inc     ax
        mov     cl, 0
        mov     bl, 1ah
        int     91h
        jae     br_1D3A2
        retf
br_1D3A2:
        inc     word ptr [A2_W_DIR_LIST_TOP]
        call    fn_1BFF4
        retf
L_1CCD8:
        mov     ax, word ptr [A2_W_DIR_LIST_TOP]
        sub     ax, 1
        jae     br_1D3B3
        retf
br_1D3B3:
        mov     cl, 0
        mov     bl, 1ah
        int     91h
        jae     br_1D3BC
        retf
br_1D3BC:
        cmp     byte ptr es:[si], 2eh
        jne     br_1D3C3
        retf
br_1D3C3:
        dec     word ptr [A2_W_DIR_LIST_TOP]
        call    fn_1BFF4
        retf
L_1CC99:
        call    fn_1BE66
        jae     br_1D3D1
        retf
br_1D3D1:
        cmp     byte ptr [A2_B_DISK_FORMAT], 0
        jne     br_1D3D9
        retf
br_1D3D9:
        mov     bl, 11h
        int     91h
        jae     br_1D3E0
        retf
br_1D3E0:
        if      FW_VERSION >= 110
        cmp     byte ptr [P_2F32], 0
        if      FW_VERSION < 112
        jne     L_1CCB6
        retf
L_1CCB6:
        cmp     byte ptr [P_2F32], 20h
        endif
        else
        cmp     byte ptr [P_2F32], 20h
        endif
        jne     br_1D3E8
        retf
br_1D3E8:
        cmp     byte ptr [A2_B_02F42], 20h
        je      br_1D3F5
        callf   EP_L_1D675_SEG:EP_L_1D675_OFF
        retf
br_1D3F5:
        mov     ax, word ptr [A2_W_LOAD_FILE_INDEX]
        mov     cl, 6
        mov     bl, 1ah
        int     91h
        jae     br_1D401
        retf
br_1D401:
        mov     word ptr [A2_W_DIR_LIST_TOP], ax
        mov     word ptr [A2_W_LOAD_FILE_INDEX], 0
        mov     word ptr [A2_W_DIR_LIST_ROW], 0
        mov     word ptr [A2_W_FILE_PANE_ROW], 0
        mov     word ptr [A2_W_FILE_PANE_TOP], 0
        call    fn_1BFF4
        retf
far_1D420:
        pop     bp
        mov     dx, si
loop_1D423:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      br_1D441
        mov     ah, byte ptr [si]
        inc     si
        cmp     ah, al
        je      loop_1D423
loop_1D433:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     loop_1D433
        mov     si, dx
        stc
        jmp     bp
br_1D441:
        mov     si, dx
        clc
        jmp     bp
L_1CD1C:
        int     0a4h
        KEY_SOFT        (APP2_BASE+L_1BDB7-APP2_SEG*16), APP2_SEG, (APP2_BASE+ISR_1EE40-APP2_SEG*16), APP2_SEG, (APP2_BASE+FAR_1FB3E-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1CD1C-APP2_SEG*16), APP2_SEG, 0000h, 0000h, 0000h, 0000h
        KEY_DOWN        20h, (APP2_BASE+L_1CDE7-APP2_SEG*16), APP2_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_WHEEL2      (APP2_BASE+TGT_1D52F-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1CDF3-APP2_SEG*16), APP2_SEG
        KEY_DOWN        1ah, (APP2_BASE+L_1CE17-APP2_SEG*16), APP2_SEG
        db      0cbh
far_1D485:
        DISP_CLEAR
        DISP_TEXT       0ah, 0ah, "        Primary device:"
        DISP_TEXT       0ah, 19h, "Auto loading file type:"
        int     6eh
        mov     byte ptr [A2_B_030B3], al
        mov     dx, ds
        DISP_TEXT_IDX   94h, 0ah, A2_B_030B3, TBL_DISK_DEVICE_LABELS
        int     6eh
        mov     byte ptr [A2_B_030B3], ah
        mov     dx, ds
        DISP_TEXT_IDX   94h, 19h, A2_B_030B3, TBL_AUTOLOAD_LABELS
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "LOAD"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "SAVE"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "FORMAT"
        DISP_SOFTKEY    04h, DISP_SK_PLAIN, "SETUP"
        db      0c3h
L_1CDE7:
        call    far_1D485
        DISP_CURSOR     94h, 0ah, 25h
        retf
L_1CDF3:
        db      0cdh, 6eh, 3ch, 09h
        jne     br_1D524
        retf
br_1D524:
        inc     al
        cmp     al, 7
        jne     br_1D52C
        inc     al
br_1D52C:
        int     6dh
        retf
tgt_1D52F:
        int     6eh
        cmp     al, 0
        jne     br_1D536
        retf
br_1D536:
        dec     al
        cmp     al, 7
        jne     br_1D53E
        dec     al
br_1D53E:
        int     6dh
        retf
L_1CE17:
        KEY_WHEEL2      (APP2_BASE+L_1CE47-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1CE3A-APP2_SEG*16), APP2_SEG
        KEY_DOWN        20h, (APP2_BASE+L_1CE54-APP2_SEG*16), APP2_SEG
        KEY_DOWN        19h, (APP2_BASE+L_1CD1C-APP2_SEG*16), APP2_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        db      0cbh
L_1CE3A:
        int     6eh
        cmp     ah, 3
        jne     br_1D56C
        retf
br_1D56C:
        inc     ah
        int     6dh
        retf
L_1CE47:
        int     6eh
        cmp     ah, 0
        jne     br_1D579
        retf
br_1D579:
        dec     ah
        int     6dh
        retf
L_1CE54:
        call    far_1D485
        DISP_CURSOR     94h, 19h, 2ah
        retf
        if      FW_VERSION < 110
        db      00h
        endif
isr_1D58A:
        push    ds
        mov     ax, APPDATA_SEG
        mov     es, ax
        mov     si, A2_TBL_03456
        pop     ds
        iret
X_1D595:
        push    ds
        mov     bp, APPDATA_SEG
        mov     ds, bp
        mov     word ptr [A2_W_SEQ_SEG], 8000h
        mov     byte ptr [A2_B_DISK_QUIET_MOUNT], 1
        mov     byte ptr [A2_B_0323F], ah
        mov     byte ptr [A2_B_DISK_DEVICE], al
        mov     ah, 0
        int     94h
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        int     77h
        mov     word ptr [A2_W_03240], ax
loop_1D5BB:
        mov     ah, 1
        int     94h
        jae     br_1D5D6
        cmp     al, 0fh
        je      br_1D5C9
        cmp     al, 2fh
        jne     br_1D600
br_1D5C9:
        int     77h
        sub     ax, word ptr [A2_W_03240]
        cmp     ax, 1388h
        jb      loop_1D5BB
        jmp     br_1D600
br_1D5D6:
        cmp     byte ptr [A2_B_0323F], 0
        je      br_1D600
        mov     byte ptr [A2_B_DISK_QUIET_MOUNT], 1
        call    fn_1BE98
        int     0b2h
        DISP_FLUSH
        test    byte ptr [A2_B_0323F], 2
        je      br_1D5F4
        call    fn_1D611
br_1D5F4:
        test    byte ptr [A2_B_0323F], 1
        je      br_1D600
        call    fn_1D646
        jae     br_1D60F
br_1D600:
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        mov     byte ptr [A2_B_DISK_QUIET_MOUNT], 0
        mov     byte ptr [A2_B_DISK_MOUNTED], 0
br_1D60F:
        pop     ds
        retf
fn_1D611:
        mov     ax, 0
br_1D614:
        mov     bl, 3
        int     91h
        jae     br_1D61B
        ret
br_1D61B:
        inc     ax
        push    ax
        call    fn_1C2EF
        mov     si, A2_B_02F42
        call    far_1D420
        db      ".ALL", 00h
        pop     ax
        jb      br_1D614
        call    fn_1DE8F
        jae     br_1D634
        ret
br_1D634:
        mov     si, 0
        mov     cx, 0bh
        repe cmpsb
        stc
        je      br_1D640
        ret
br_1D640:
        push    cs
        call    far_1DA43
        clc
        ret
fn_1D646:
        mov     ax, 0
br_1D649:
        mov     bl, 3
        int     91h
        jae     br_1D650
        ret
br_1D650:
        mov     word ptr [A2_W_03242], bx
        mov     word ptr [A2_W_03244], dx
        inc     ax
        push    ax
        call    fn_1C2EF
        mov     si, A2_B_02F42
        call    far_1D420
        db      ".APS", 00h
        pop     ax
        jb      br_1D649
        jae     br_1D66E
        ret
br_1D66E:
        call    fn_1E83D
        int     0feh
        clc
        ret
L_1D675:
        call    fn_1D679
        retf
fn_1D679:
        mov     si, P_2F43
        call    far_1D420
        db      "BIN", 00h
        jb      br_1D688
        jmp     fn_1E892
br_1D688:
        call    far_1D420
        db      "EXE", 00h
        jb      br_1D694
        jmp     br_1EAAC
br_1D694:
        call    far_1D420
        db      "SYS", 00h
        jb      br_1D6A0
        jmp     br_1EAAC
br_1D6A0:
        mov     si, P_2F43
        call    far_1D420
        db      "MID", 00h
        jb      br_1D6AF
        jmp     fn_1D7DA
br_1D6AF:
        call    far_1D420
        db      "SMF", 00h
        jb      br_1D6BB
        jmp     fn_1D7DA
br_1D6BB:
        call    far_1D420
        db      "ALL", 00h
        jb      br_1D6C7
        jmp     br_1D763
br_1D6C7:
        call    far_1D420
        db      "SEQ", 00h
        jb      br_1D6D3
        jmp     br_1E66B
br_1D6D3:
        mov     si, P_2F43
        call    far_1D420
        db      "SND", 00h
        jb      br_1D6E2
        jmp     br_1E839
br_1D6E2:
        call    far_1D420
        db      "S3 ", 00h
        jb      br_1D6EE
        jmp     br_1E839
br_1D6EE:
        call    far_1D420
        db      "S1 ", 00h
        jb      br_1D6FA
        jmp     br_1E839
br_1D6FA:
        call    far_1D420
        db      "WAV", 00h
        jb      br_1D706
        jmp     br_1E839
br_1D706:
        call    far_1D420
        db      "PGM", 00h
        jb      br_1D712
        jmp     br_1E839
br_1D712:
        call    far_1D420
        db      "APS", 00h
        jb      br_1D71E
        jmp     br_1E839
br_1D71E:
        call    far_1D420
        db      "SET", 00h
        jb      br_1D72A
        jmp     br_1E839
br_1D72A:
        call    far_1D420
        db      "ST1", 00h
        jb      br_1D736
        jmp     br_1E839
br_1D736:
        call    far_1D420
        db      "ST2", 00h
        jb      br_1D742
        jmp     br_1E839
br_1D742:
        call    far_1D420
        db      "RLD", 00h
        jb      br_1D74E
        jmp     br_1E862
br_1D74E:
        call    far_1D420
        db      "EMU", 00h
        jb      br_1D75A
        jmp     br_1E839
br_1D75A:
        call    fn_1D7DA
        jb      BR_1D760
        ret
BR_1D760:
        jmp     br_1E839
br_1D763:
        call    fn_1DE8F
        jae     br_1D76A
        jmp     loop_1D7D1
br_1D76A:
        push    di
        mov     bl, 0ah
        int     91h
        pop     di
        push    di
        mov     si, 0
        mov     cx, 0bh
        repe cmpsb
        pop     di
        jne     br_1D77F
        jmp     br_1D970
br_1D77F:
        mov     si, STR_MPC2000_ALL_SIG
        mov     cx, 0bh
        repe cmpsb
        jne     br_1D78C
        jmp     br_1DD40
br_1D78C:
        jmp     br_1E0FD
fn_1D78F:
        pusha
        push    es
        DISP_MSG        "Loading:   "
        DISP_ERASE      5ah, 17h, 78h, 07h
        mov     dx, ds
        mov     cl, 5ah
        mov     ch, 17h
        mov     si, P_2F32
        mov     ah, 14h
        mov     bl, 5
        int     90h
        DISP_INVERT     5ah, 17h, 78h, 07h
        DISP_FLUSH
        pop     es
        popa
        ret
fn_1D7C3:
        mov     ax, ds
        mov     es, ax
        mov     si, P_2F32
        mov     bl, 4
        int     91h
        jb      loop_1D7D1
        ret
loop_1D7D1:
        int     95h
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        stc
        ret
fn_1D7DA:
        call    fn_1D7C3
        jae     br_1D7E0
        ret
br_1D7E0:
        mov     al, bh
        mov     ah, dl
        cmp     ax, 480h
        mov     al, 21h
        jae     br_1D82A
        call    fn_1D78F
        call    fn_1EDD4
        call    fn_1EDE3
        int     0e7h
        mov     ax, 3800h
        mov     es, ax
        call    fn_1EDF3
        jb      br_1D82A
        int     0c9h
        mov     bx, 3800h
        mov     ax, 0f000h
        mov     cx, word ptr [A2_W_SEQ_SEG]
        callf   APP2_SEG:(APP2_BASE+far_20242-APP2_SEG*16)
        pushf
        push    ax
        int     0e8h
        mov     al, byte ptr [A2_B_DISK_DEVICE]
        mov     ah, 0
        int     94h
        pop     ax
        popf
        jb      br_1D82A
        int     0dfh
        DISP_PLANE0
        call    far_1D851
        clc
        ret
br_1D82A:
        push    ax
        int     0e8h
        mov     al, byte ptr [A2_B_DISK_DEVICE]
        mov     ah, 0
        int     94h
        mov     si, P_2F43
        call    far_1D420
        db      "MID", 00h
        pop     ax
        jae     loop_1D84E
        push    ax
        call    far_1D420
        db      "SMF", 00h
        pop     ax
        jae     loop_1D84E
        stc
        ret
loop_1D84E:
        int     95h
        ret
far_1D851:
        int     0ebh
        mov     word ptr [A2_W_LOAD_INTO_SEQ], ax
        int     0a4h
        FIELD_ENTRY     ds, A2_W_LOAD_INTO_SEQ, 1, 0, 63h, intcb_1F5D1-APP2_CSBASE
        KEY_DOWN        12h, (APP2_BASE+L_1D1DF-APP2_SEG*16), APP2_SEG
        KEY_DOWN        13h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        14h, EP_FAR_1D94B_OFF, EP_FAR_1D94B_SEG
        KEY_DOWN        20h, (APP2_BASE+L_1D168-APP2_SEG*16), APP2_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0c3h
L_1D168:
        DISP_WIN_WIDE   "Load a Sequence"
        DISP_TEXT       24h, 10h, "File:"
        DISP_TEXT       24h, 22h, " Load into:  -"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "PLAY"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "DSCARD"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "KEEP"
        mov     dx, ds
        mov     cl, 42h
        mov     ch, 10h
        mov     si, P_2F32
        mov     ah, 14h
        mov     bl, 5
        int     90h
        mov     ax, word ptr [A2_W_LOAD_INTO_SEQ]
        mov     cl, 66h
        mov     ch, 22h
        callf   EP_DRAW_SEQ_NUMBER_NAME_SEG:EP_DRAW_SEQ_NUMBER_NAME_OFF
        DISP_CURSOR     66h, 22h, 0dh
        retf
L_1D1DF:
        DISP_WIN        50h, 14h, 58h, 15h, ""
        db      00h, 0b3h, 1ch, 0cdh
        xchg    cx, bp
        db      86h, 0b1h, 62h, 0b5h
        if      FW_VERSION >= 111
        db      1bh
        if      FW_VERSION < 120
        db      9ah, 29h, 19h
        endif
        if      FW_VERSION >= 120
        callf   APP3_SEG:(APP3_BASE+draw_bar_beat_tick-APP3_SEG*16)
        DISP_FLUSH
        db      0cdh
        mov     cx, 0c4f6h
        xor     byte ptr [si-15h], 0b3h
        sbb     ax, 87cdh
        elseif  FW_VERSION >= 114
        sbb     ax, 0cd26h
        pop     word ptr [bx+di]
        int     0b9h
        test    ah, 80h
        db      74h, 0ebh
        mov     bl, 1dh
        int     87h
        else
        if      FW_VERSION >= 112
        db      0feh
        else
        out     dx, al
        endif
        and     ax, 8fcdh
        db      01h, 0cdh
        mov     cx, 0c4f6h
        xor     byte ptr [si-15h], 0b3h
        sbb     ax, 87cdh
        endif
        else
        if      FW_VERSION >= 110
        sbb     bx, word ptr [bp+si+191ch]
        db      0edh
        else
        sbb     bx, word ptr [bp+si+190dh]
        pushf
        endif
        and     ax, 8fcdh
        db      01h, 0cdh
        mov     cx, 0c4f6h
        xor     byte ptr [si-15h], 0b3h
        sbb     ax, 87cdh
        endif
        DISP_TEXT       62h, 1bh, "  STOP ! "
        DISP_FLUSH
        mov     cx, 2bch
        int     0b6h
        call    far_1D851
        retf
far_1D94B:
        mov     ax, word ptr [A2_W_LOAD_INTO_SEQ]
        mov     word ptr [A2_W_CUR_SEQ], ax
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     byte ptr es:[12h], al
        inc     byte ptr es:[12h]
        push    ax
        int     0d3h
        pop     ax
        int     0d2h
        jae     br_1D96A
        mov     al, 19h
        int     95h
br_1D96A:
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        retf
br_1D970:
        DISP_WIN_NARROW "MPC2000XL ALL file"
        DISP_TEXT       26h, 0ch, "This^will^replace all^existing"
        DISP_TEXT       26h, 15h, "sequence & songs!"
        DISP_TEXT       26h, 1eh, "<SEQ> will^load a single"
        DISP_TEXT       26h, 27h, "sequence."
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "<SEQ>"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "LOAD"
        int     0a4h
        KEY_DOWN        20h, 0000h, 0000h
        KEY_DOWN        12h, (APP2_BASE+L_1D39F-APP2_SEG*16), APP2_SEG
        KEY_DOWN        13h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        14h, EP_FAR_1DA43_OFF, EP_FAR_1DA43_SEG
        KEY_DOWN        16h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0c3h
far_1DA43:
        call    fn_1D78F
        call    fn_1D7C3
        jae     br_1DA4C
        retf
br_1DA4C:
        int     0d4h
        mov     ax, ds
        mov     es, ax
        mov     di, 0
        mov     cx, 0f06h
        mov     bl, 6
        int     91h
        jb      loop_1DAB1
        mov     ax, 0e000h
        mov     es, ax
        mov     di, 0
        mov     cx, 2940h
        mov     bl, 6
        int     91h
        jb      loop_1DAB1
        mov     si, 810h
        mov     ax, 0
loop_1DA75:
        mov     cx, word ptr [si+10h]
        cmp     cx, 0
        je      br_1DA90
        push    si
        push    ax
        mov     es, word ptr [A2_W_00F10]
        call    fn_1EE12
        pop     ax
        pop     si
        jb      loop_1DAB1
        push    si
        push    ax
        int     0d2h
        pop     ax
        pop     si
br_1DA90:
        inc     ax
        add     si, 12h
        cmp     ax, 63h
        jne     loop_1DA75
        mov     word ptr [A2_W_CUR_SEQ], 0
        callf   EP_L_27146_SEG:EP_L_27146_OFF
        int     0ach
        call    fn_1DAB9
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        int     0fah
        retf
loop_1DAB1:
        int     95h
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        retf
fn_1DAB9:
        mov     ax, ds
        mov     es, ax
        mov     si, P_2F32
        mov     di, BUF_ALL_FILENAME
        mov     cx, 10h
        rep movsb
        ret
L_1D39F:
        int     0b4h
        call    fn_1D7C3
        mov     cx, 810h
        mov     bl, 13h
        int     91h
        jb      loop_1DAB1
        mov     ax, 0e2a0h
        mov     es, ax
        mov     di, 0
        mov     cx, 6f6h
        mov     bl, 6
        int     91h
        jb      loop_1DAB1
        mov     cx, 2940h
        mov     bl, 13h
        int     91h
        DISP_PLANE0
        int     0ebh
        mov     word ptr [A2_W_LOAD_INTO_SEQ], ax
        push    cs
        call    far_1DBC6
        retf
far_1DAFC:
        DISP_WIN_NARROW "Load a sequence"
        DISP_TEXT       25h, 10h, "     File:##-"
        DISP_TEXT       25h, 26h, "Load into:##-"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "PLAY"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "DSCARD"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "KEEP"
        mov     cl, 61h
        mov     ch, 10h
        mov     al, byte ptr [A2_B_0322F]
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
        mov     si, ax
        mov     dx, 0e2a0h
        mov     es, dx
        mov     ax, word ptr es:[si+10h]
        mov     word ptr [A2_W_03234], ax
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     ax, word ptr [A2_W_LOAD_INTO_SEQ]
        mov     ah, 0
        push    ax
        inc     al
        DISP_NUM0       61h, 26h, 02h
        pop     ax
        mov     ah, 12h
        mul     ah
        add     ax, 810h
        mov     si, ax
        mov     dx, ds
        mov     cl, 73h
        mov     ch, 26h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        call    word ptr [A2_W_LOADSEQ_CURSOR_FN]
        retf
        DISP_CURSOR     61h, 10h, 0dh
        ret
cb_1DBBD:
        DISP_CURSOR     61h, 26h, 0dh
        ret
far_1DBC6:
        int     0a4h
        mov     word ptr [A2_W_LOADSEQ_CURSOR_FN], cb_1DF71-APP2_CSBASE
        mov     cx, ds
        mov     si, A2_B_0322F
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, (APP2_BASE+intcb_1DC20-APP2_SEG*16)
        int     7eh
        KEY_DOWN        1ah, (APP2_BASE+L_1D4F7-APP2_SEG*16), APP2_SEG
        KEY_DOWN        19h, 0000h, 0000h
        KEY_DOWN        12h, (APP2_BASE+L_1D551-APP2_SEG*16), APP2_SEG
        KEY_DOWN        13h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        14h, (APP2_BASE+L_1D5A2-APP2_SEG*16), APP2_SEG
        KEY_DOWN        20h, EP_FAR_1DAFC_OFF, EP_FAR_1DAFC_SEG
        KEY_DOWN        16h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
intcb_1DC20:
        retf
L_1D4F7:
        int     0a4h
        mov     word ptr [A2_W_LOADSEQ_CURSOR_FN], cb_1DBBD-APP2_CSBASE
        FIELD_ENTRY     ds, A2_W_LOAD_INTO_SEQ, 1, 0, 63h, intcb_1F5D1-APP2_CSBASE
        KEY_DOWN        19h, EP_FAR_1DBC6_OFF, EP_FAR_1DBC6_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        KEY_DOWN        12h, (APP2_BASE+L_1D551-APP2_SEG*16), APP2_SEG
        KEY_DOWN        13h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        14h, (APP2_BASE+L_1D5A2-APP2_SEG*16), APP2_SEG
        KEY_DOWN        20h, EP_FAR_1DAFC_OFF, EP_FAR_1DAFC_SEG
        KEY_DOWN        16h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_1D551:
        cmp     word ptr [A2_W_03234], 0
        jne     L_1D783
        retf
L_1D783:
        call    fn_1DCDF
        jae     br_1DC89
        retf
br_1DC89:
        DISP_WIN        50h, 14h, 58h, 15h, ""
        db      00h
        mov     bl, 1ch
        int     87h
        int     86h
        mov     cl, 62h
        mov     ch, 1bh
        callf   EP_DRAW_BAR_BEAT_TICK_SEG:EP_DRAW_BAR_BEAT_TICK_OFF
        DISP_FLUSH
        db      0cdh
        mov     cx, 0c4f6h
        xor     byte ptr [si-15h], 0b3h
        sbb     ax, 87cdh
        DISP_TEXT       62h, 1bh, "  STOP ! "
        DISP_FLUSH
        db      0b9h, 0bch, 02h
        int     0b6h
        push    cs
        call    far_1DAFC
        retf
L_1D5A2:
        cmp     word ptr [A2_W_03234], 0
        jne     br_1DCD4
        retf
br_1DCD4:
        call    fn_1DCDF
        jae     br_1DCDA
        retf
br_1DCDA:
        push    cs
        call    far_1D94B
        retf
fn_1DCDF:
        int     0b4h
        call    fn_1D7C3
        mov     cx, 3846h
        mov     bl, 13h
        int     91h
        jb      br_1DD3C
        mov     ax, 0e2a0h
        mov     es, ax
        mov     bl, 0
        mov     ax, 0
        mov     dx, 0
        mov     si, 0
loop_1DCFD:
        cmp     bl, byte ptr [A2_B_0322F]
        je      br_1DD11
        add     ax, word ptr es:[si+10h]
        adc     dx, 0
        add     si, 12h
        inc     bl
        jmp     loop_1DCFD
br_1DD11:
        mov     cx, ax
        or      cx, dx
        je      br_1DD26
        mov     cx, 4
tgt_1DD1A:
        shl     ax, 1
        rcl     dx, 1
        loop    tgt_1DD1A
        mov     bl, 1fh
        int     91h
        jb      br_1DD3C
br_1DD26:
        mov     es, word ptr [A2_W_00F10]
        mov     cx, word ptr [A2_W_03234]
        call    fn_1EE12
        jb      br_1DD3C
        mov     bl, 0ah
        int     91h
        DISP_PLANE0
        clc
        ret
br_1DD3C:
        int     95h
        stc
        ret
br_1DD40:
        DISP_WIN_NARROW "MPC2000 ALL file"
        DISP_TEXT       26h, 0ch, "This^will^replace all^existing"
        DISP_TEXT       26h, 15h, "sequence & songs!"
        DISP_TEXT       26h, 1eh, "<SEQ> will^load a single"
        DISP_TEXT       26h, 27h, "sequence."
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "<SEQ>"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "LOAD"
        int     0a4h
        KEY_DOWN        20h, 0000h, 0000h
        KEY_DOWN        12h, (APP2_BASE+L_1D77F-APP2_SEG*16), APP2_SEG
        KEY_DOWN        13h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        14h, (APP2_BASE+L_1D6E7-APP2_SEG*16), APP2_SEG
        KEY_DOWN        16h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        ret
L_1D6E7:
        call    fn_1D78F
        call    fn_1DE8F
        mov     cx, 530h
        mov     bl, 13h
        int     91h
        mov     di, A2_W_DISK_IO_BUF
        mov     cx, 100h
        push    di
        mov     bl, 6
        int     91h
        pop     di
        mov     si, 710h
        mov     ax, word ptr [di+4]
        mov     word ptr [si+4], ax
        mov     al, byte ptr [di+3]
        mov     byte ptr [si+6], al
        mov     ax, 0e000h
        mov     es, ax
        sub     di, di
        mov     cx, 2940h
        mov     bl, 6
        int     91h
        mov     cx, 0c60h
        mov     bl, 13h
        int     91h
        int     0d4h
        int     0e7h
loop_1DE52:
        callf   EP_SEQ_BUFFER_INIT_BLANK_SEG:EP_SEQ_BUFFER_INIT_BLANK_OFF
        callf   EP_L_219D6_SEG:EP_L_219D6_OFF
        jb      br_1DE64
        int     0d2h
        jb      br_1DE69
        jmp     loop_1DE52
br_1DE64:
        cmp     ax, 0
        jne     br_1DE7E
br_1DE69:
        DISP_PLANE0
        int     0e8h
        callf   EP_L_27146_SEG:EP_L_27146_OFF
        int     0ach
        call    fn_1DAB9
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        retf
br_1DE7E:
        int     95h
        int     0e8h
        callf   EP_L_27146_SEG:EP_L_27146_OFF
        int     0ach
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        retf
fn_1DE8F:
        call    fn_1D7C3
        jae     br_1DE95
        ret
br_1DE95:
        mov     ax, ds
        mov     es, ax
        mov     di, A2_W_DISK_IO_BUF
        mov     cx, 10h
        pusha
        push    es
        mov     bl, 6
        int     91h
        pop     es
        popa
        clc
        ret
L_1D77F:
        int     0b4h
        call    fn_1E0E4
        DISP_PLANE0
        int     0ebh
        mov     word ptr [A2_W_LOAD_INTO_SEQ], ax
        push    cs
        call    far_1DF83
        retf
fn_1DEBB:
        DISP_WIN_NARROW "Load a sequence"
        DISP_TEXT       25h, 10h, "     File:##-"
        DISP_TEXT       25h, 26h, "Load into:##-"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "PLAY"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "DSCARD"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "KEEP"
        mov     ah, 62h
        mov     al, byte ptr [A2_B_0322F]
        inc     al
        mov     bx, 0e2a0h
        mov     es, bx
        sub     si, si
        sub     bx, bx
loop_1DF25:
        mov     dx, word ptr es:[si]
        or      dx, dx
        je      br_1DF3D
        cmp     al, byte ptr es:[si+13h]
        je      br_1DF3D
        add     bx, dx
        add     si, 20h
        dec     ah
        jne     loop_1DF25
        sub     si, si
br_1DF3D:
        mov     word ptr [P_3232], si
        mov     word ptr [A2_W_03234], dx
        mov     word ptr [A2_W_03230], bx
        add     si, 2
        push    si
        push    es
        DISP_NUM0       61h, 10h, 02h
        pop     dx
        pop     si
        mov     cl, 73h
        mov     ch, 10h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     ax, word ptr [A2_W_LOAD_INTO_SEQ]
        mov     cl, 61h
        mov     ch, 26h
        callf   EP_DRAW_SEQ_NUMBER_NAME_SEG:EP_DRAW_SEQ_NUMBER_NAME_OFF
        call    word ptr [A2_W_LOADSEQ_CURSOR_FN]
        retf
cb_1DF71:
        DISP_CURSOR     61h, 10h, 0dh
        ret
cb_1DF7A:
        DISP_CURSOR     61h, 26h, 0dh
        ret
far_1DF83:
        int     0a4h
        mov     word ptr [A2_W_LOADSEQ_CURSOR_FN], cb_1DF71-APP2_CSBASE
        FIELD_ENTRY     ds, A2_B_0322F, 1, 0, 63h, intcb_1DFDD-APP2_CSBASE
        KEY_DOWN        1ah, (APP2_BASE+L_1D8B4-APP2_SEG*16), APP2_SEG
        KEY_DOWN        19h, 0000h, 0000h
        if      FW_VERSION >= 112
        KEY_DOWN        12h, (APP2_BASE+L_1D966-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        12h, EP_L_1D90E_OFF, APP2_SEG
        endif
        KEY_DOWN        13h, (APP2_BASE+DISK_SCREEN_ENTER-APP2_SEG*16), APP2_SEG
        KEY_DOWN        14h, (APP2_BASE+L_1D957-APP2_SEG*16), APP2_SEG
        KEY_DOWN        20h, (APP2_BASE+fn_1DEBB-APP2_SEG*16), APP2_SEG
        KEY_DOWN        16h, (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
intcb_1DFDD:
        retf
L_1D8B4:
        int     0a4h
        mov     word ptr [A2_W_LOADSEQ_CURSOR_FN], cb_1DF7A-APP2_CSBASE
        FIELD_ENTRY     ds, A2_W_LOAD_INTO_SEQ, 1, 0, 63h, intcb_1F5D1-APP2_CSBASE
        KEY_DOWN        19h, (APP2_BASE+far_1DF83-APP2_SEG*16), APP2_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        if      FW_VERSION >= 112
        KEY_DOWN        12h, (APP2_BASE+L_1D966-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        12h, EP_L_1D90E_OFF, APP2_SEG
        endif
        KEY_DOWN        13h, (APP2_BASE+DISK_SCREEN_ENTER-APP2_SEG*16), APP2_SEG
        KEY_DOWN        14h, (APP2_BASE+L_1D957-APP2_SEG*16), APP2_SEG
        KEY_DOWN        20h, (APP2_BASE+fn_1DEBB-APP2_SEG*16), APP2_SEG
        KEY_DOWN        16h, (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_1D966:
        if      FW_VERSION >= 114
        call    fn_1E09D
        jae     br_1E03E
        retf
br_1E03E:
        else
        db      0e8h, 62h, 00h, 73h, 01h, 0cbh
        endif
        DISP_WIN        50h, 14h, 58h, 15h, ""
        db      00h
        mov     bl, 1ch
        int     87h
        int     86h
        mov     cl, 62h
        mov     ch, 1bh
        callf   EP_DRAW_BAR_BEAT_TICK_SEG:EP_DRAW_BAR_BEAT_TICK_OFF
        DISP_FLUSH
        db      0cdh
        mov     cx, 0c4f6h
        xor     byte ptr [si-15h], 0b3h
        sbb     ax, 87cdh
        DISP_TEXT       62h, 1bh, "  STOP ! "
        DISP_FLUSH
        db      0b9h, 0bch, 02h
        int     0b6h
        push    cs
        call    fn_1DEBB
        retf
L_1D957:
        if      FW_VERSION >= 114
        call    fn_1E09D
        jae     br_1E087
        retf
br_1E087:
        mov     ax, word ptr [A2_W_LOAD_INTO_SEQ]
        int     0d2h
        jb      L_1DB9A
        mov     bl, 0ah
        int     91h
        int     0e8h
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        retf
L_1DB9A:
        int     95h
        retf
fn_1E09D:
        cmp     word ptr [A2_W_03234], 0
        stc
        jne     br_1E0A6
        ret
br_1E0A6:
        int     0e7h
        int     0b4h
        call    fn_1E0E4
        mov     cx, word ptr [A2_W_03230]
        cmp     cx, 0
        je      br_1E0D2
loop_1E0B6:
        sub     cx, 800h
        jb      br_1E0C7
        push    cx
        mov     cx, 8000h
        mov     bl, 13h
        int     91h
        pop     cx
        jmp     loop_1E0B6
br_1E0C7:
        add     cx, 800h
        shl     cx, 4
        mov     bl, 13h
        int     91h
br_1E0D2:
        callf   EP_SEQ_BUFFER_INIT_BLANK_SEG:EP_SEQ_BUFFER_INIT_BLANK_OFF
        callf   EP_L_219D6_SEG:EP_L_219D6_OFF
        push    ax
        else
        db      0e8h, 19h, 00h, 73h, 01h, 0cbh, 0a1h, 11h, 32h, 0cdh, 0d2h, 72h, 0ch, 0b3h, 0ah, 0cdh
        db      91h, 0cdh, 0e8h, 9ah
        dw      (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG
        db      0cbh, 0cdh, 95h, 0cbh, 83h, 3eh, 24h, 32h
        db      00h, 0f9h, 75h, 01h, 0c3h, 0cdh, 0e7h, 0cdh, 0b4h, 0e8h, 37h, 00h, 8bh, 0eh, 20h, 32h
        db      83h, 0f9h, 00h, 74h, 1ch, 81h, 0e9h, 00h, 08h, 72h, 0bh, 51h, 0b9h, 00h, 80h, 0b3h
        db      13h, 0cdh, 91h, 59h, 0ebh, 0efh, 81h, 0c1h, 00h, 08h, 0c1h, 0e1h, 04h, 0b3h, 13h, 0cdh
        db      91h, 9ah
        dw      EP_SEQ_BUFFER_INIT_BLANK_OFF, EP_SEQ_BUFFER_INIT_BLANK_SEG
        db      9ah
        dw      EP_L_219D6_OFF, EP_L_219D6_SEG
        db      50h
        endif
        DISP_PLANE0
        int     0e8h
        pop     ax
        ret
fn_1E0E4:
        call    fn_1DE8F
        mov     cx, 2f70h
        mov     bl, 13h
        int     91h
        mov     ax, 0e2a0h
        mov     es, ax
        sub     di, di
        mov     cx, 0c60h
        mov     bl, 6
        int     91h
        ret
br_1E0FD:
        mov     ax, word ptr [A2_W_DISK_IO_BUF]
        cmp     ax, 304h
        je      br_1E125
        cmp     ax, 104h
        je      br_1E125
        cmp     ax, 204h
        je      br_1E125
        cmp     ax, 103h
        je      br_1E125
        cmp     ax, 203h
        je      br_1E125
        if      FW_VERSION >= 120
        mov     al, 0ah
        int     95h
        int     0e8h
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        ret
        else
        mov     al, 4
        jmp     br_1E278
        endif
br_1E125:
        mov     byte ptr [A2_B_0323C], ah
        cmp     byte ptr [A2_B_0348E], 1
        je      br_1E137
        cmp     byte ptr [A2_B_0348E], 2
        jne     br_1E15A
br_1E137:
        call    fn_1E70C
        if      FW_VERSION >= 114
        KEY_DOWN        14h, L_1E143-APP2_CSBASE, APP2_SEG
        elseif  FW_VERSION >= 112
        KEY_DOWN        14h, (APP2_BASE+L_1E143-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        14h, EP_L_1E143_OFF, APP2_SEG
        endif
        db      0c3h
L_1E143:
        DISP_WIN_NARROW "MPC60 ALL file"
        db      0e8h
        push    ss
        db      00h, 0cbh
br_1E15A:
        DISP_WIN_NARROW "MPC3000 ALL file"
        DISP_TEXT       26h, 0ch, "This^will^replace all^existing"
        DISP_TEXT       26h, 15h, "sequence & songs!"
        DISP_TEXT       26h, 1eh, "<SEQ> will^load a single"
        DISP_TEXT       26h, 27h, "sequence."
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "<SEQ>"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "LOAD"
        int     0a4h
        KEY_DOWN        12h, L_1E38E-APP2_CSBASE, APP2_SEG
        KEY_DOWN        13h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        14h, L_1E223-APP2_CSBASE, APP2_SEG
        KEY_DOWN        16h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        ret
L_1E223:
        call    fn_1D78F
        call    fn_1D7C3
        jae     br_1E22C
        retf
br_1E22C:
        int     0d4h
        mov     cx, 6
        mov     bl, 13h
        int     91h
        jb      br_1E278
        int     0e7h
L_1E239:
        callf   EP_SEQ_BUFFER_INIT_BLANK_SEG:EP_SEQ_BUFFER_INIT_BLANK_OFF
        call    fn_1E282
        jb      br_1E278
        cmp     al, 0ffh
        je      loop_1E253
        push    ax
        int     0dfh
        pop     ax
        dec     al
        int     0d2h
        jb      br_1E278
        jmp     SHORT L_1E239
loop_1E253:
        int     0e8h
        mov     bl, 5
        int     91h
        jb      br_1E268
        cmp     al, 0ffh
        je      br_1E268
        cmp     al, 0
        je      br_1E268
        call    fn_1E29F
        jmp     loop_1E253
br_1E268:
        callf   EP_L_27146_SEG:EP_L_27146_OFF
        int     0ach
        call    fn_1DAB9
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        retf
br_1E278:
        int     95h
        int     0e8h
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        retf
fn_1E282:
        mov     ax, 0e2a0h
        mov     bx, 3800h
        mov     cx, word ptr [A2_W_SEQ_SEG]
        cmp     byte ptr [A2_B_0323C], 3
        jne     br_1E299
        callf   EP_L_21F2C_SEG:EP_L_21F2C_OFF
        ret
br_1E299:
        callf   EP_L_225B3_SEG:EP_L_225B3_OFF
        ret
fn_1E29F:
        cmp     byte ptr [A2_B_0323C], 1
        jne     br_1E2A8
        jmp     br_1E322
br_1E2A8:
        push    ax
        mov     ah, 0
        shl     ax, 1
        add     ax, 18h
        mov     cx, ax
        mov     di, 0
        push    di
        mov     ax, 0e2a0h
        mov     es, ax
        mov     bl, 6
        int     91h
        pop     si
        pop     cx
        mov     al, byte ptr es:[si]
        dec     al
        sub     ah, ah
        mov     bx, 210h
        mul     bx
        mov     di, ax
        mov     ax, 0e000h
        mov     es, ax
        mov     byte ptr es:[di+206h], 1
        push    ds
        mov     ax, 0e2a0h
        mov     ds, ax
        push    si
        push    di
        add     di, 10h
        add     si, 18h
        mov     ch, 0
        cmp     cl, 0fah
        jb      br_1E2F1
        mov     cl, 0fah
br_1E2F1:
        lodsw
        dec     al
        stosw
        loop    br_1E2F1
        mov     ax, 0ffffh
        stosw
        pop     di
        pop     si
        mov     al, byte ptr [si+2]
        mov     byte ptr es:[di+208h], al
        push    di
        push    si
        add     di, 0
        add     si, 3
        mov     cx, 10h
        rep movsb
        pop     si
        pop     di
        add     di, 20ah
        add     si, 13h
        mov     cx, 5
        rep movsb
        pop     ds
        ret
br_1E322:
        push    ax
        mov     ah, 0
        shl     ax, 1
        add     ax, 3
        mov     cx, ax
        mov     di, 0
        push    di
        mov     ax, 0e2a0h
        mov     es, ax
        mov     bl, 6
        int     91h
        pop     si
        pop     cx
        mov     al, byte ptr es:[si]
        dec     al
        sub     ah, ah
        mov     bx, 210h
        mul     bx
        mov     di, ax
        mov     ax, 0e000h
        mov     es, ax
        mov     byte ptr es:[di+206h], 1
        pusha
        mov     si, 777h
        mov     cx, 10h
        add     di, 0
        rep movsb
        popa
        push    ds
        mov     ax, 0e2a0h
        mov     ds, ax
        push    si
        push    di
        add     di, 10h
        add     si, 3
        mov     ch, 0
        cmp     cl, 0fah
        jb      br_1E378
        mov     cl, 0fah
br_1E378:
        lodsw
        dec     al
        stosw
        loop    br_1E378
        mov     ax, 0ffffh
        stosw
        pop     di
        pop     si
        mov     al, byte ptr [si+2]
        mov     byte ptr es:[di+208h], al
        pop     ds
        ret
L_1E38E:
        call    fn_1D78F
        call    fn_1E58A
        DISP_PLANE0
        mov     byte ptr [A2_B_0322F], 0
        push    cs
        call    far_1E44D
        retf
far_1E3A1:
        DISP_WIN_NARROW "Load a sequence"
        DISP_TEXT       25h, 10h, "     File:  -"
        DISP_TEXT       25h, 26h, "Load into:  -"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "PLAY"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "DSCARD"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "KEEP"
        mov     al, byte ptr [A2_B_0322F]
        push    ax
        inc     al
        mov     ah, 0
        DISP_NUM0       61h, 10h, 02h
        pop     ax
        mov     ah, 20h
        mul     ah
        add     ax, 0bh
        cmp     byte ptr [A2_B_0323C], 3
        je      br_1E41B
        sub     ax, 2
br_1E41B:
        mov     si, ax
        mov     dx, 0e2a0h
        mov     cl, 73h
        mov     ch, 10h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     ax, word ptr [A2_W_LOAD_INTO_SEQ]
        mov     cl, 61h
        mov     ch, 26h
        callf   EP_DRAW_SEQ_NUMBER_NAME_SEG:EP_DRAW_SEQ_NUMBER_NAME_OFF
        call    word ptr [A2_W_LOADSEQ_CURSOR_FN]
        retf
L_1E43B:
        DISP_CURSOR     61h, 10h, 0dh
        ret
        db      0b1h
        popa
        mov     ch, 26h
        mov     al, 0dh
        int     0b0h
        ret
far_1E44D:
        int     0a4h
        mov     word ptr [A2_W_LOADSEQ_CURSOR_FN], L_1E43B-APP2_CSBASE
        FIELD_ENTRY     ds, A2_B_0322F, 1, 0, word ptr [A2_W_0323D], L_1E4A8-APP2_CSBASE
        if      FW_VERSION >= 114
        KEY_DOWN        1ah, L_1E4A9-APP2_CSBASE, APP2_SEG
        elseif  FW_VERSION >= 112
        KEY_DOWN        1ah, (APP2_BASE+L_1E4A9-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        1ah, EP_L_1E4A9_OFF, APP2_SEG
        endif
        KEY_DOWN        19h, 0000h, 0000h
        if      FW_VERSION >= 114
        KEY_DOWN        12h, L_1E503-APP2_CSBASE, APP2_SEG
        KEY_DOWN        13h, (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG
        KEY_DOWN        14h, L_1E54C-APP2_CSBASE, APP2_SEG
        elseif  FW_VERSION >= 112
        KEY_DOWN        12h, (APP2_BASE+L_1E503-APP2_SEG*16), APP2_SEG
        KEY_DOWN        13h, (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG
        KEY_DOWN        14h, (APP2_BASE+L_1E54C-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        12h, EP_L_1E503_OFF, APP2_SEG
        KEY_DOWN        13h, (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG
        KEY_DOWN        14h, EP_L_1E54C_OFF, APP2_SEG
        endif
        KEY_DOWN        20h, EP_FAR_1E3A1_OFF, EP_FAR_1E3A1_SEG
        KEY_DOWN        16h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_1E4A8:
        retf
L_1E4A9:
        int     0a4h
        mov     word ptr [A2_W_LOADSEQ_CURSOR_FN], cb_1DF7A-APP2_CSBASE
        FIELD_ENTRY     ds, A2_W_LOAD_INTO_SEQ, 1, 0, 63h, intcb_1F5D1-APP2_CSBASE
        KEY_DOWN        19h, EP_FAR_1E44D_OFF, EP_FAR_1E44D_SEG
        KEY_DOWN        1ah, 0000h, 0000h
        if      FW_VERSION >= 114
        KEY_DOWN        12h, L_1E503-APP2_CSBASE, APP2_SEG
        KEY_DOWN        13h, (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG
        KEY_DOWN        14h, L_1E54C-APP2_CSBASE, APP2_SEG
        elseif  FW_VERSION >= 112
        KEY_DOWN        12h, (APP2_BASE+L_1E503-APP2_SEG*16), APP2_SEG
        KEY_DOWN        13h, (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG
        KEY_DOWN        14h, (APP2_BASE+L_1E54C-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        12h, EP_L_1E503_OFF, APP2_SEG
        KEY_DOWN        13h, (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG
        KEY_DOWN        14h, EP_L_1E54C_OFF, APP2_SEG
        endif
        KEY_DOWN        20h, EP_FAR_1E3A1_OFF, EP_FAR_1E3A1_SEG
        KEY_DOWN        16h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_1E503:
        call    fn_1E554
        DISP_WIN        50h, 14h, 58h, 15h, ""
        db      00h
        mov     bl, 1ch
        int     87h
        int     86h
        mov     cl, 62h
        mov     ch, 1bh
        callf   EP_DRAW_BAR_BEAT_TICK_SEG:EP_DRAW_BAR_BEAT_TICK_OFF
        DISP_FLUSH
        db      0cdh
        mov     cx, 0c4f6h
        xor     byte ptr [si-15h], 0b3h
        sbb     ax, 87cdh
        DISP_TEXT       62h, 1bh, "  STOP ! "
        DISP_FLUSH
        db      0b9h, 0bch, 02h
        int     0b6h
        push    cs
        call    far_1E3A1
        call    fn_1E58A
        retf
L_1E54C:
        call    fn_1E554
        push    cs
        call    far_1D94B
        retf
fn_1E554:
        int     0b4h
        call    fn_1D7C3
        jae     br_1E55C
        ret
br_1E55C:
        mov     cx, 6
        mov     bl, 13h
        int     91h
        mov     al, byte ptr [A2_B_0322F]
loop_1E566:
        sub     al, 1
        jb      br_1E571
        push    ax
        call    fn_1E5C1
        pop     ax
        jmp     loop_1E566
br_1E571:
        int     0e7h
        callf   EP_SEQ_BUFFER_INIT_BLANK_SEG:EP_SEQ_BUFFER_INIT_BLANK_OFF
        call    fn_1E282
        jb      br_1E585
        int     0dfh
        int     0e8h
        DISP_PLANE0
        ret
br_1E585:
        int     0e8h
        int     95h
        ret
fn_1E58A:
        call    fn_1D7C3
        jae     br_1E590
        ret
br_1E590:
        mov     cx, 6
        mov     bl, 13h
        int     91h
        mov     word ptr [A2_W_0323D], 0
        mov     ax, 0e2a0h
        mov     es, ax
        mov     di, 0
        mov     byte ptr es:[di], 0
loop_1E5A9:
        push    di
        push    es
        call    fn_1E5C1
        pop     es
        pop     di
        jae     br_1E5B3
        ret
br_1E5B3:
        inc     word ptr [A2_W_0323D]
        mov     si, A2_W_DISK_IO_BUF
        mov     cx, 20h
        rep movsb
        jmp     loop_1E5A9
fn_1E5C1:
        cmp     byte ptr [A2_B_0323C], 3
        je      br_1E5CA
        jmp     br_1E621
br_1E5CA:
        mov     di, A2_B_0348F
        mov     cx, 151h
        mov     ax, ds
        mov     es, ax
        push    cx
        mov     bl, 6
        int     91h
        pop     cx
        cmp     ax, cx
        stc
        je      br_1E5E0
        ret
br_1E5E0:
        cmp     byte ptr [A2_B_0348F], 0ffh
        stc
        jne     br_1E5E9
        ret
br_1E5E9:
        mov     al, byte ptr [A2_B_035DF]
        mov     ah, 18h
        mul     ah
        mov     cx, ax
        mov     al, byte ptr [A2_B_035DE]
        mov     ah, 6
        mul     ah
        add     cx, ax
        mov     ax, word ptr [A2_W_03490]
        mov     dx, word ptr [A2_W_03492]
        add     ax, cx
        adc     dx, 0
loop_1E607:
        mov     cx, 8000h
        sub     ax, cx
        sbb     dx, 0
        jb      br_1E619
        pusha
        mov     bl, 13h
        int     91h
        popa
        jmp     loop_1E607
br_1E619:
        add     cx, ax
        mov     bl, 13h
        int     91h
        clc
        ret
br_1E621:
        mov     di, A2_B_0348F
        mov     cx, 0cah
        mov     ax, ds
        mov     es, ax
        push    cx
        mov     bl, 6
        int     91h
        pop     cx
        cmp     ax, cx
        stc
        je      br_1E637
        ret
br_1E637:
        cmp     byte ptr [A2_B_0348F], 0ffh
        stc
        jne     br_1E640
        ret
br_1E640:
        mov     al, byte ptr [A2_B_03558]
        mov     ah, 15h
        cmp     byte ptr [A2_B_0323C], 1
        je      br_1E64E
        mov     ah, 18h
br_1E64E:
        mul     ah
        mov     cx, ax
        mov     al, byte ptr [A2_B_03557]
        mov     ah, 6
        mul     ah
        add     cx, ax
        mov     ax, word ptr [A2_W_03490]
        mov     dl, byte ptr [A2_W_03492]
        mov     dh, 0
        add     ax, cx
        adc     dx, 0
        jmp     loop_1E607
br_1E66B:
        call    fn_1D78F
        callf   EP_SEQ_BUFFER_INIT_BLANK_SEG:EP_SEQ_BUFFER_INIT_BLANK_OFF
        call    fn_1EDE3
        call    fn_1D7C3
        jae     br_1E67E
        jmp     loop_1D84E
br_1E67E:
        mov     al, bh
        mov     ah, dl
        cmp     ax, 480h
        mov     al, 21h
        jb      br_1E68C
        jmp     loop_1D84E
br_1E68C:
        mov     ax, ds
        mov     es, ax
        mov     di, A2_W_DISK_IO_BUF
        if      FW_VERSION >= 120
        mov     cx, 8
        mov     bl, 6
        int     91h
        cmp     byte ptr [A2_B_03491], 4dh
        jne     L_1E6B3
        cmp     byte ptr [A2_W_03492], 50h
        jne     L_1E6B3
        cmp     byte ptr [A2_W_03493], 43h
        jne     L_1E6B3
        mov     al, 0ah
        jmp     br_1E709
L_1E6B3:
        call    fn_1D7C3
        jae     br_1E6BB
        jmp     loop_1D84E
br_1E6BB:
        mov     ax, ds
        mov     es, ax
        mov     di, A2_W_DISK_IO_BUF
        endif
        mov     cx, 2
        mov     bl, 6
        int     91h
        cmp     byte ptr [A2_B_0348E], 1
        je      br_1E6D9
        cmp     byte ptr [A2_B_0348E], 2
        je      br_1E6D9
        jmp     fn_1E6E9
br_1E6D9:
        call    fn_1E70C
        if      FW_VERSION >= 114
        KEY_DOWN        14h, L_1E6E5-APP2_CSBASE, APP2_SEG
        elseif  FW_VERSION >= 112
        KEY_DOWN        14h, (APP2_BASE+L_1E6E5-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        14h, EP_L_1E6E5_OFF, APP2_SEG
        endif
        db      0c3h
L_1E6E5:
        call    fn_1E6E9
        retf
fn_1E6E9:
        int     0e7h
        mov     ax, 0e2a0h
        mov     bx, 3800h
        mov     cx, word ptr [A2_W_SEQ_SEG]
        callf   EP_L_21F28_SEG:EP_L_21F28_OFF
        pushf
        int     0e8h
        popf
        jb      br_1E709
        DISP_PLANE0
        int     0dfh
        call    far_1D851
        ret
br_1E709:
        int     95h
        ret
fn_1E70C:
        int     0a4h
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_DOWN        20h, L_1DFCB-APP2_CSBASE, APP2_SEG
        KEY_DOWN        13h, (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG
        push    cs
        call    far_1E7B6
        KEY_DOWN        22h, L_1E81B-APP2_CSBASE, APP2_SEG
        else
        KEY_DOWN        20h, (APP2_BASE+L_1DFCB-APP2_SEG*16), APP2_SEG
        KEY_DOWN        13h, (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG
        db      0eh, 0e8h, 94h
        db      00h
        KEY_DOWN        22h, (APP2_BASE+L_1E81B-APP2_SEG*16), APP2_SEG
        endif
        db      0c3h
        else
        KEY_DOWN        20h, EP_L_1DFCB_OFF, APP2_SEG
        KEY_DOWN        13h, EP_DISK_SCREEN_ENTER_OFF, APP2_SEG
        db      0eh, 0e8h, 94h
        db      00h
        KEY_DOWN        22h, (APP2_BASE+L_1E0BB-APP2_SEG*16), APP2_SEG
        ret
        endif
L_1DFCB:
        DISP_WIN_WIDE   "Conversion table"
        db      0beh, 0dh, 00h
        DISP_BMP        26h, 19h, 0dh
        DISP_TEXT       44h, 0fh, "MPC60 pad:"
        DISP_TEXT       44h, 23h, "Becomes note:"
        DISP_HDOTS      38h, 1dh, 0aah
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "LOAD"
        db      8ch, 0dah
        DISP_TEXT_IDX   80h, 0fh, P_3455, TBL_DRUM_NAME_LABELS
        if      FW_VERSION >= 120
        call    fn_1E82C
        else
        db      0e8h, 95h, 00h
        endif
        db      0cdh, 7bh
        DISP_NOTE_CHAN  92h, 23h
        if      FW_VERSION >= 112
        db      0ffh
        push    ss
        if      FW_VERSION >= 120
        pop     ds
        else
        db      0fh
        endif
        xor     cl, bl
d_p_3df4:
        DISP_CURSOR     80h, 0fh, 5bh
        ret
d_p_3dfd:
        DISP_CURSOR     92h, 23h, 25h
        ret
far_1E7B6:
        if      FW_VERSION >= 114
        mov     word ptr [A2_W_0321F], P_3DF4
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, L_1E7E0-APP2_CSBASE, APP2_SEG
        FIELD_WHEEL     ds, A2_B_03455, 0, 0, 21h, intcb_1F5D1-APP2_CSBASE
        else
        mov     word ptr [A2_W_0321F], 3dach
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP2_BASE+L_1E7E0-APP2_SEG*16), APP2_SEG
        mov     cx, ds
        mov     si, 3445h
        mov     bl, 0
        mov     bh, 0
        mov     dx, 21h
        mov     di, P_4C21
        int     7dh
        endif
        retf
L_1E7E0:
        mov     word ptr [A2_W_0321F], P_3DFD
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP2_BASE+far_1E7B6-APP2_SEG*16), APP2_SEG, 0000h, 0000h
        if      FW_VERSION >= 114
        KEY_WHEEL2      (APP2_BASE+L_1E803-APP2_SEG*16), APP2_SEG, L_1E80F-APP2_CSBASE, APP2_SEG
        retf
        else
        KEY_WHEEL2      (APP2_BASE+L_1E803-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1E80F-APP2_SEG*16), APP2_SEG
        db      0cbh
        endif
L_1E803:
        call    fn_1E82C
        cmp     al, 23h
        je      br_1E80C
        dec     al
br_1E80C:
        mov     byte ptr [bx], al
        retf
L_1E80F:
        call    fn_1E82C
        cmp     al, 62h
        je      br_1E818
        inc     al
br_1E818:
        mov     byte ptr [bx], al
        retf
L_1E81B:
        cmp     cl, 0
        jne     br_1E821
        retf
br_1E821:
        mov     bl, byte ptr [A2_B_03455]
        mov     bh, 0
        mov     byte ptr [bx+A2_TBL_03456], al
        retf
fn_1E82C:
        mov     bl, byte ptr [A2_B_03455]
        mov     bh, 0
        add     bx, A2_TBL_03456
        mov     al, byte ptr [bx]
        ret
        else
        db      0ffh, 16h, 0fh, 32h, 0cbh, 0b1h, 80h, 0b5h, 0fh, 0b0h, 5bh, 0cdh
L_1E056                         equ     $+0bh
        if      FW_VERSION >= 110
        db      0b0h, 0c3h, 0b1h, 92h, 0b5h, 23h, 0b0h, 25h, 0cdh, 0b0h, 0c3h, 0c7h, 06h, 0fh, 32h, 0b4h
        else
        db      0b0h, 0c3h, 0b1h, 92h, 0b5h, 23h, 0b0h, 25h, 0cdh, 0b0h, 0c3h, 0c7h, 06h, 0fh, 32h, 74h
        endif
        db      3dh
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, (APP2_BASE+L_1E080-APP2_SEG*16), APP2_SEG
        db      8ch, 0d9h, 0beh, 45h, 34h, 0b3h, 00h, 0b7h, 00h, 0bah, 21h, 00h, 0bfh
L_1E080                         equ     $+5
        if      FW_VERSION >= 110
        db      0b5h, 4bh, 0cdh, 7dh, 0cbh, 0c7h, 06h, 0fh, 32h, 0bdh, 3dh
        else
        db      6dh, 4bh, 0cdh, 7dh, 0cbh, 0c7h, 06h, 0fh, 32h, 7dh, 3dh
        endif
        KEY_CURSOR      0000h, 0000h, 0000h, 0000h, (APP2_BASE+L_1E056-APP2_SEG*16), APP2_SEG, 0000h, 0000h
        KEY_WHEEL2      (APP2_BASE+L_1E0A3-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1E0AF-APP2_SEG*16), APP2_SEG
L_1E0A3                         equ     $+1
        db      0cbh, 0e8h, 26h, 00h, 3ch, 23h, 74h, 02h, 0feh
L_1E0AF                         equ     $+4
        db      0c8h, 88h, 07h, 0cbh, 0e8h, 1ah, 00h, 3ch, 62h, 74h, 02h, 0feh, 0c0h, 88h, 07h, 0cbh
L_1E0BB:
        db      80h, 0f9h, 00h, 75h, 01h, 0cbh, 8ah, 1eh, 45h, 34h, 0b7h, 00h, 88h, 87h, 46h, 34h
        db      0cbh, 8ah, 1eh, 45h, 34h, 0b7h, 00h, 81h, 0c3h, 46h, 34h, 8ah, 07h, 0c3h
        endif
br_1E839:
        int     6fh
        int     5bh
fn_1E83D:
        mov     ax, ds
        mov     es, ax
        mov     ax, word ptr [A2_W_03242]
        mov     dx, word ptr [A2_W_03244]
        mov     si, P_2F32
        push    ds
        int     31h
        pop     ds
        or      ax, ax
        KEY_DOWN        29h, EP_L_1BE16_OFF, APP2_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        27h, L_1E88A-APP2_CSBASE, APP2_SEG
        elseif  FW_VERSION >= 112
        KEY_DOWN        27h, (APP2_BASE+L_1E88A-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        27h, EP_L_1E88A_OFF, APP2_SEG
        endif
        db      0c3h
br_1E862:
        int     5bh
        mov     ax, ds
        mov     es, ax
        mov     si, P_2F32
        mov     bl, 4
        int     91h
        jae     br_1E874
        jmp     loop_1D7D1
br_1E874:
        mov     bl, 0ah
        int     91h
        mov     ax, bx
        mov     di, si
        mov     bx, es
        push    ds
        pop     es
        mov     si, P_2F32
        push    ds
        int     31h
        pop     ds
        or      ax, ax
        ret
L_1E88A:
        int     9bh
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        retf
fn_1E892:
        DISP_WIN_WIDE   "OS update"
        DISP_TEXT       24h, 0ch, "This writes OS to Flash memory."
        DISP_TEXT       24h, 15h, "   This process requires^system"
        DISP_TEXT       24h, 1eh, "   restart. All memory contents"
        DISP_TEXT       24h, 27h, "   will be lost !!"
        mov     si, 0eh
        DISP_BMP        1ch, 17h, 0eh
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        int     0a4h
        KEY_DOWN        13h, EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        14h, L_1E962-APP2_CSBASE, APP2_SEG
        elseif  FW_VERSION >= 112
        KEY_DOWN        14h, (APP2_BASE+L_1E962-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        14h, EP_L_1E962_OFF, APP2_SEG
        endif
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        ret
L_1E962:
        mov     al, 0
        int     0dch
        int     0e7h
        mov     ax, ds
        mov     es, ax
        mov     si, P_2F32
        mov     bl, 4
        int     91h
        if      FW_VERSION >= 114
        jae     br_1E977
        jmp     br_1E9DF
br_1E977:
        push    es
        push    ax
        mov     ax, RAM_SEG
        mov     es, ax
        cmp     byte ptr es:[21f9h], 0
        pop     ax
        pop     es
        je      br_1E996
        mov     ax, word ptr es:[si+16h]
        cmp     ax, 9c0h
        mov     ax, 36h
        endif
        jae     br_1E996
        jmp     br_1E9DF
br_1E996:
        mov     ax, 3800h
        mov     es, ax
        mov     di, 0
        mov     cx, 1000h
        mov     bl, 6
        int     91h
        jae     br_1E9A9
        jmp     br_1E9DF
br_1E9A9:
        mov     ax, 3800h
        mov     es, ax
        mov     di, word ptr es:[0a8h]
        mov     si, STR_MPC2000XL_ID
        mov     cx, 9
        repe cmpsb
        mov     ax, 0ah
        jne     br_1E9DF
        call    fn_1D7C3
        call    fn_1D78F
        mov     ax, 3800h
        mov     es, ax
        mov     di, 0
        mov     cx, 7800h
        call    fn_1EE12
        int     0cfh
        DISP_PLANE0
        call    fn_1E9ED
        int     0f7h
        retf
br_1E9DF:
        int     95h
        int     0e8h
        mov     al, 1
        int     0dch
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        retf
fn_1E9ED:
        int     0a5h
        DISP_WIN_WIDE   "Completed"
        DISP_TEXT       24h, 0ch, "Writing to Flash memory is"
        DISP_TEXT       24h, 15h, "completed."
        DISP_TEXT       24h, 1eh, "Pressing any key will restart"
        DISP_TEXT       24h, 27h, "the system."
        DISP_FLUSH
loop_1EA64:
        int     0b9h
        or      ax, ax
        je      loop_1EA64
        test    ah, 80h
        jne     loop_1EA64
        ret
tgt_1EA70:
        dec     bp
        push    ax
        inc     bx
        xor     cl, byte ptr [bp+di+58h]
        db      "L        "
        db      " .EXE"
d_str_mpc2kxl_sys:
        db      "MPC2KXL         .SYS"
d_str_mpc2kxl_bin:
        db      "MPC2KX"
        db      "L        "
        and     byte ptr [A2_B_04942], ch
        dec     si
br_1EAAC:
        call    fn_1E892
        if      FW_VERSION >= 114
        KEY_DOWN        14h, L_1EAB8-APP2_CSBASE, APP2_SEG
        elseif  FW_VERSION >= 112
        KEY_DOWN        14h, (APP2_BASE+L_1EAB8-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        14h, EP_L_1EAB8_OFF, APP2_SEG
        endif
        db      0c3h
L_1EAB8:
        mov     al, 0
        int     0dch
        int     0e7h
        call    fn_1EAE9
        call    fn_1EB04
        jb      br_1EAD9
        call    fn_1EBB8
        jb      br_1EAD9
        call    fn_1ED28
        int     0cfh
        DISP_PLANE0
        call    fn_1E9ED
        int     0f7h
        retf
br_1EAD9:
        mov     al, 8
        int     95h
        int     0e8h
        mov     al, 1
        int     0dch
        callf   EP_DISK_SCREEN_ENTER_SEG:EP_DISK_SCREEN_ENTER_OFF
        retf
fn_1EAE9:
        mov     bx, 3800h
        mov     cx, 8
tgt_1EAEF:
        push    cx
        mov     es, bx
        mov     cx, 8000h
        sub     di, di
        mov     ax, 0
        rep stosw
        pop     cx
        add     bx, 1000h
        loop    tgt_1EAEF
        ret
fn_1EB04:
        mov     ax, cs
        mov     es, ax
        mov     si, STR_MPC2KXL_EXE
        mov     bl, 4
        int     91h
        jae     br_1EB12
        ret
br_1EB12:
        mov     ax, word ptr es:[si+16h]
        mov     cx, word ptr es:[si+18h]
        mov     word ptr [A2_W_03252], ax
        mov     word ptr [A2_W_03254], cx
        DISP_MSG        "Loading:  MPC2KXL.EXE"
        DISP_FLUSH
        mov     di, A2_W_DISK_IO_BUF
        mov     cx, 200h
        mov     ax, ds
        mov     es, ax
        mov     bl, 6
        int     91h
        if      FW_VERSION >= 112
        jae     loop_1EB4E
        ret
        endif
loop_1EB4E:
        sub     word ptr [A2_W_03495], 20h
        je      br_1EB6A
        mov     cx, 200h
loop_1EB58:
        mov     bl, 13h
        int     91h
        jae     loop_1EB4E
        mov     cx, word ptr [A2_W_03495]
        add     cx, 20h
        shl     cx, 4
        jmp     loop_1EB58
br_1EB6A:
        cmp     word ptr [A2_W_DISK_IO_BUF], 5a4dh
        mov     si, A2_W_DISK_IO_BUF
        stc
        je      br_1EB77
        ret
br_1EB77:
        mov     ax, 3800h
        mov     es, ax
loop_1EB7C:
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        int     91h
        pop     es
        if      FW_VERSION >= 112
        jae     br_1EB8A
        ret
br_1EB8A:
        endif
        cmp     ax, 8000h
        jne     br_1EB99
        mov     bx, es
        add     bx, 800h
        mov     es, bx
        jmp     loop_1EB7C
br_1EB99:
        mov     di, ax
        mov     ax, 0
loop_1EB9E:
        stosb
        test    di, 0ffh
        jne     loop_1EB9E
        shr     di, 4
        mov     ax, es
        add     ax, di
        sub     ax, 3800h
        mov     word ptr [A2_W_03250], ax
        mov     bl, 0ah
        int     91h
        clc
        ret
fn_1EBB8:
        mov     ax, cs
        mov     es, ax
        mov     si, STR_MPC2KXL_SYS
        mov     bl, 4
        int     91h
        jae     br_1EBC6
        ret
br_1EBC6:
        DISP_MSG        "Loading:  MPC2KXL.SYS"
        DISP_FLUSH
        mov     cx, 200h
        mov     ax, 0e000h
        mov     es, ax
        mov     di, 0
        push    es
        push    di
        mov     bl, 6
        int     91h
        pop     di
        pop     es
        if      FW_VERSION >= 112
        jae     br_1EBF8
        ret
br_1EBF8:
        endif
        cmp     word ptr es:[di], 5a4dh
        stc
        je      br_1EC01
        ret
br_1EC01:
        mov     cx, word ptr es:[di+8]
        shl     cx, 4
        sub     cx, 200h
        je      br_1EC20
        cmp     cx, 7e00h
        mov     al, 22h
        jb      br_1EC19
        jmp     loop_1ECDA
br_1EC19:
        mov     di, 200h
        mov     bl, 6
        int     91h
br_1EC20:
        mov     dx, 3800h
        add     dx, word ptr [A2_W_03250]
        mov     es, dx
loop_1EC29:
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        int     91h
        pop     es
        if      FW_VERSION >= 112
        jae     br_1EC37
        ret
br_1EC37:
        endif
        cmp     ax, 8000h
        jne     br_1EC46
        mov     bx, es
        add     bx, 800h
        mov     es, bx
        jmp     loop_1EC29
br_1EC46:
        pusha
        push    es
        push    ds
        sub     ax, 10h
        jae     br_1EC59
        add     ax, 10h
        and     ax, 0fh
        mov     bx, es
        dec     bx
        mov     es, bx
br_1EC59:
        mov     cx, es
        mov     ds, cx
        mov     si, ax
        mov     bx, 3800h
        mov     es, bx
        mov     di, word ptr es:[0b4h]
        add     bx, word ptr es:[0b6h]
        mov     es, bx
        mov     cx, 10h
        rep movsb
        pop     ds
        pop     es
        popa
        mov     di, ax
        mov     ax, 0
loop_1EC7D:
        stosb
        test    di, 0ffh
        jne     loop_1EC7D
        shr     di, 4
        mov     ax, es
        add     ax, di
        push    ax
        mov     bl, 0ah
        int     91h
        mov     dx, word ptr [A2_W_03250]
        mov     ax, 0e000h
        mov     es, ax
        mov     si, word ptr es:[18h]
        mov     cx, word ptr es:[6]
        jcxz    br_1ECBD
tgt_1ECA5:
        mov     di, word ptr es:[si]
        mov     ax, word ptr es:[si+2]
        push    es
        add     ax, dx
        add     ax, 3800h
        mov     es, ax
        add     word ptr es:[di], dx
        add     si, 4
        pop     es
        loop    tgt_1ECA5
br_1ECBD:
        mov     ax, word ptr es:[14h]
        add     dx, word ptr es:[16h]
        mov     bx, 3800h
        mov     es, bx
        mov     word ptr es:[0a4h], ax
        mov     word ptr es:[0a6h], dx
        pop     ax
        sub     ax, 3800h
        clc
        ret
loop_1ECDA:
        int     95h
        stc
        ret
        mov     ax, cs
        mov     es, ax
        mov     si, STR_MPC2KXL_BIN
        mov     bl, 4
        int     91h
        jae     br_1ECED
        jmp     loop_1ECDA
br_1ECED:
        DISP_MSG        "Loading:MPC2KXL.BIN"
        DISP_FLUSH
        mov     ax, 3800h
        mov     es, ax
loop_1ED0C:
        mov     cx, 8000h
        sub     di, di
        push    es
        push    di
        mov     bl, 6
        int     91h
        pop     di
        pop     es
        mov     bx, es
        add     bx, 800h
        mov     es, bx
        cmp     bx, 0b000h
        jb      loop_1ED0C
        ret
fn_1ED28:
        mov     ax, 0
        mov     bx, 3800h
        mov     cx, 7
tgt_1ED31:
        push    cx
        mov     es, bx
        mov     cx, 8000h
        sub     si, si
tgt_1ED39:
        add     ax, word ptr es:[si]
        add     si, 2
        loop    tgt_1ED39
        pop     cx
        add     bx, 1000h
        loop    tgt_1ED31
        mov     es, bx
        mov     cx, 3fffh
        sub     si, si
tgt_1ED4F:
        add     ax, word ptr es:[si]
        add     si, 2
        loop    tgt_1ED4F
        mov     word ptr es:[si], ax
        ret
        DISP_MSG        "Saving:  MPC2KXL.BIN"
        DISP_FLUSH
        mov     ax, cs
        mov     es, ax
        mov     si, STR_MPC2KXL_BIN
        mov     bl, 14h
        int     91h
        mov     ax, cs
        mov     es, ax
        mov     si, STR_MPC2KXL_BIN
        mov     cx, word ptr [A2_W_03252]
        mov     dx, word ptr [A2_W_03254]
        mov     bl, 7
        int     91h
        mov     ax, 3800h
        mov     es, ax
        mov     dx, 7800h
        call    fn_1EDA7
        mov     bl, 0ah
        int     91h
        ret
        db      0cdh, 95h, 0c3h
fn_1EDA7:
        sub     si, si
        cmp     dx, 800h
        jb      br_1EDCA
        mov     cx, 8000h
        push    es
        push    dx
        mov     bl, 9
        int     91h
        pop     dx
        pop     es
        jae     br_1EDBD
        ret
br_1EDBD:
        mov     ax, es
        add     ax, 800h
        mov     es, ax
        sub     dx, 800h
        jmp     fn_1EDA7
br_1EDCA:
        mov     cx, dx
        shl     cx, 4
        mov     bl, 9
        int     91h
        ret
fn_1EDD4:
        mov     si, 10h
        mov     es, word ptr [A2_W_00F10]
        sub     di, di
        mov     cx, 700h
        rep movsb
        ret
fn_1EDE3:
        mov     es, word ptr [A2_W_00F10]
        mov     di, 0
        mov     si, P_2F32
        mov     cx, 10h
        rep movsb
        ret
fn_1EDF3:
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        int     91h
        pop     es
        jae     br_1EE01
        ret
br_1EE01:
        cmp     ax, 8000h
        clc
        je      br_1EE08
        ret
br_1EE08:
        mov     bx, es
        add     bx, 800h
        mov     es, bx
        jmp     fn_1EDF3
fn_1EE12:
        sub     cx, 800h
        jb      br_1EE31
        push    cx
        push    es
        mov     cx, 8000h
        sub     di, di
        mov     bl, 6
        int     91h
        pop     es
        pop     cx
        jae     br_1EE28
        ret
br_1EE28:
        mov     ax, es
        add     ax, 800h
        mov     es, ax
        jmp     fn_1EE12
br_1EE31:
        add     cx, 800h
        shl     cx, 4
        sub     di, di
        mov     bl, 6
        int     91h
        ret
        if      FW_VERSION >= 114
        db      00h
        endif
isr_1EE40:
        int     6fh
        mov     al, 0
        int     0ddh
        mov     al, 0
        int     0aeh
        push    cs
        call    far_1F388
        mov     byte ptr [A2_B_00F2E_2], 0
        mov     al, 2
        mov     byte ptr [A2_B_00F2F], al
L_1E40C:
        int     0adh
        callf   EP_SEQ_NAMES_FETCH_SEG:EP_SEQ_NAMES_FETCH_OFF
        mov     word ptr [A2_W_SEQ_SEG], 8000h
        mov     al, byte ptr [A2_B_DISK_DEVICE]
        mov     ah, 0
        int     94h
        callf   [A2_W_0368E]
        push    cs
        call    far_1EF4E
        call    fn_1F439
        call    fn_1F413
        call    fn_1F475
        DISP_FLUSH
        db      0cdh
        out     0e8h, al
        if      FW_VERSION >= 114
        pop     di
        if      FW_VERSION >= 120
        db      00h, 0e8h, 0deh
        iret
        else
        db      00h, 0e8h
        adc     al, 0d0h
        endif
        retf
        elseif  FW_VERSION >= 110
        pop     di
        db      00h, 0e8h
        if      FW_VERSION >= 112
        inc     si
        else
        dec     dx
        endif
        ror     bl, 1
        else
        push    di
        add.d0  al, ch
        jg      L_1E40C
        retf
        endif
L_1E6ED:
        int     0b4h
        call    fn_1BE98
        call    fn_1BE66
        callf   [A2_W_0368E]
        retf
fn_1EE96:
        pop     si
        push    si
        sub     si, 3
L_1E773:
        mov     word ptr [A2_W_0368E], si
fn_1EE9F:
        int     0a4h
        if      FW_VERSION >= 114
        KEY_SOFT        EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG, L_1E6ED-APP2_CSBASE, APP2_SEG, EP_FAR_1FB3E_OFF, EP_FAR_1FB3E_SEG, (APP2_BASE+L_1CD1C-APP2_SEG*16), APP2_SEG, 0000h, 0000h, L_1F562-APP2_CSBASE, APP2_SEG
        elseif  FW_VERSION >= 112
        KEY_SOFT        (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1E6ED-APP2_SEG*16), APP2_SEG, EP_FAR_1FB3E_OFF, EP_FAR_1FB3E_SEG, (APP2_BASE+L_1CD1C-APP2_SEG*16), APP2_SEG, 0000h, 0000h, (APP2_BASE+L_1F562-APP2_SEG*16), APP2_SEG
        elseif  FW_VERSION >= 111
        KEY_SOFT        EP_L_1B659_OFF, APP2_SEG, (APP2_BASE+L_1E6ED-APP2_SEG*16), APP2_SEG, EP_FAR_1FB3E_OFF, EP_FAR_1FB3E_SEG, (APP2_BASE+L_1CD1C-APP2_SEG*16), APP2_SEG, 0000h, 0000h, (APP2_BASE+L_1F562-APP2_SEG*16), APP2_SEG
        else
        KEY_SOFT        EP_DISK_SCREEN_ENTER_OFF, APP2_SEG, EP_L_1E6ED_OFF, APP2_SEG, EP_FAR_1FB3E_OFF, EP_FAR_1FB3E_SEG, EP_L_1CD1C_OFF, APP2_SEG, 0000h, 0000h, EP_L_1F562_OFF, APP2_SEG
        endif
        KEY_DOWN        20h, EP_FAR_1EF4E_OFF, EP_FAR_1EF4E_SEG
        if      FW_VERSION >= 110
        KEY_DOWN        26h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        endif
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        cmp     byte ptr [A2_B_BOOT_DEVICE_REQ], 0bh
        je      L_1E9A5
        ret
L_1E9A5:
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_DOWN        14h, L_1FAE7-APP2_CSBASE, APP2_SEG
        else
        KEY_DOWN        14h, (APP2_BASE+L_1FAE7-APP2_SEG*16), APP2_SEG
        endif
        db      0c3h
        else
        KEY_DOWN        14h, (APP2_BASE+L_1F35B-APP2_SEG*16), APP2_SEG
        ret
        endif
        mov     ax, ds
        mov     es, ax
        mov     si, 810h
        push    si
        callf   EP_SEQ_NAMES_FETCH_SEG:EP_SEQ_NAMES_FETCH_OFF
        pop     si
        add     si, 10h
        sub     ax, ax
        sub     dx, dx
        mov     cx, 63h
tgt_1EEFC:
        add     ax, word ptr [si]
        adc     dx, 0
        add     si, 12h
        loop    tgt_1EEFC
        mov     bx, 0f06h
        shr     bx, 4
        add     ax, bx
        adc     dx, 0
        add     ax, 294h
        and     dx, 3fh
        mov     bx, 40h
        div     bx
        mov     word ptr [A2_W_0369A], ax
        ret
fn_1EF20:
        DISP_MSG        "          Saving....."
        db      0c3h
fn_1EF3A:
        cmp     byte ptr [A2_B_DISK_DEVICE], 0
        stc
        je      br_1EF43
        ret
br_1EF43:
        cmp     byte ptr [A2_B_ATAPI_DEVICE], 0
        stc
        je      br_1EF4C
        ret
br_1EF4C:
        clc
        ret
far_1EF4E:
        DISP_CLEAR
        DISP_TEXT       00h, 01h, "Type:"
        DISP_TEXT       00h, 09h, "File:"
        DISP_TEXT       0aah, 09h, " Size=      K"
        DISP_HDOTS      00h, 12h, 0f8h
        DISP_TEXT       0a4h, 15h, "Device:"
        DISP_TEXT       6bh, 15h, "SAVE"
        mov     si, 0bh
        DISP_BMP        6fh, 1eh, 0bh
        mov     si, 1
        DISP_BMP        4eh, 16h, 01h
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "LOAD"
        DISP_SOFTKEY    02h, DISP_SK_PLAIN, "SAVE"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "FORMAT"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "SETUP"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "DO IT"
        mov     dx, ds
        DISP_TEXT_IDX   0ceh, 15h, A2_B_DISK_DEVICE, TBL_DISK_DEVICE_LABELS
        call    fn_1F2AE
        call    fn_1F011
        call    fn_1F021
        call    fn_1F0C7
        call    fn_1F0EC
        call    word ptr [A2_W_SAVE_CURSOR_FN]
        cmp     byte ptr [A2_B_BOOT_DEVICE_REQ], 0bh
        je      br_1F006
        retf
br_1F006:
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "BOOT"
        db      0cbh
fn_1F011:
        mov     al, byte ptr [A2_B_DISK_FS_TYPE]
        mov     bx, P_2FE3
        xlat
        mov     cl, 88h
        mov     ch, 16h
        mov     bl, 16h
        int     90h
        ret
fn_1F021:
        cmp     byte ptr [A2_B_ATAPI_DEVICE], 0
        jne     br_1F04C
        cmp     byte ptr [A2_B_DISK_DEVICE], 0
        jne     br_1F04C
        DISP_TEXT       0b0h, 27h, "Free=      K"
        db      0b3h, 0dh, 0cdh
        xchg    cx, ax
        DISP_NUM        0dah, 27h, 04h
        db      0c3h
br_1F04C:
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 0
        jne     br_1F054
        ret
br_1F054:
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 6
        jne     br_1F05C
        ret
br_1F05C:
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        je      br_1F08F
        DISP_TEXT       0b0h, 27h, "Free=    . M"
        mov     bl, 0dh
        int     91h
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        push    dx
        DISP_NUM        0ceh, 27h, 04h
        db      58h
        DISP_NUM        0ech, 27h, 01h
        db      0c3h
br_1F08F:
        DISP_TEXT       0b0h, 1eh, "Frag'd=    K"
        if      FW_VERSION >= 120
        db      0a1h, 96h, 36h
        else
        db      0a1h, 86h, 36h
        endif
        DISP_NUM        0dah, 1eh, 04h
        DISP_TEXT       0b0h, 27h, "  Free=    K"
        db      0b3h, 0dh, 0cdh
        xchg    cx, ax
        DISP_NUM        0dah, 27h, 04h
        db      0c3h
fn_1F0C7:
        cmp     word ptr [A2_W_DISK_PARTITION_COUNT], 0
        jne     br_1F0CF
        ret
br_1F0CF:
        DISP_TEXT       0b0h, 1eh, "Part:       "
        mov     ax, word ptr [A2_W_DISK_PARTITION]
        add     al, 41h
        DISP_CHAR       0ceh, 1eh
        ret
fn_1F0EC:
        mov     bx, word ptr [A2_W_SAVE_TYPE]
        shl     bx, 1
        jmp     word ptr cs:[bx+TBL_SAVE_TYPE_TITLE-APP2_CSBASE]
TBL_SAVE_TYPE_TITLE:
        dw      save_title_all_seqs-APP2_CSBASE, save_title_seq-APP2_CSBASE, save_title_all_pgms-APP2_CSBASE, save_title_pgm-APP2_CSBASE
        dw      save_title_sound-APP2_CSBASE, save_title_os-APP2_CSBASE
save_title_all_seqs:
        DISP_TEXT       1eh, 01h, "Save All Sequences^&^Songs"
        mov     dx, ds
        mov     cl, 1eh
        mov     ch, 9
        mov     si, BUF_ALL_FILENAME
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     ax, word ptr [A2_W_0369A]
        mov     dx, 0
        DISP_NUM        0ceh, 09h, 06h
        db      0c3h
save_title_seq:
        DISP_TEXT       1eh, 01h, "Save a Sequence"
        mov     ax, word ptr [A2_W_CUR_SEQ]
        mov     cl, 1eh
        mov     ch, 9
        callf   EP_DRAW_SEQ_NUMBER_NAME_SEG:EP_DRAW_SEQ_NUMBER_NAME_OFF
        push    ds
        mov     ax, ds
        mov     es, ax
        mov     di, BUF_MID_FILENAME
        mov     ds, dx
        mov     cx, 10h
        rep movsb
        pop     ds
        mov     es, word ptr [A2_W_00F10]
        mov     ax, 0
        cmp     byte ptr es:[12h], 0
        je      br_1F189
        mov     ax, word ptr es:[10h]
        add     ax, 280h
        shr     ax, 6
br_1F189:
        mov     dx, 0
        DISP_NUM        0ceh, 09h, 06h
        db      0c3h
save_title_all_pgms:
        DISP_TEXT       1eh, 01h, "Save All Programs^&^Sounds"
        mov     ax, 0
        mov     es, ax
        mov     si, word ptr es:[190h]
        mov     dx, word ptr es:[192h]
        mov     ah, 10h
        mov     cl, 1eh
        mov     ch, 9
        mov     bl, 5
        int     90h
        mov     ax, word ptr [A2_W_036A2]
        mov     dx, word ptr [A2_W_036A4]
        mov     bx, 400h
        div     bx
        sub     dx, dx
        DISP_NUM        0ceh, 09h, 06h
        db      0c3h
save_title_pgm:
        DISP_TEXT       1eh, 01h, "Save a Program & Sounds"
        mov     al, byte ptr [A2_B_0371E]
        mov     ah, 0
        inc     al
        DISP_NUM0       1eh, 09h, 02h
        DISP_TEXT       2ah, 09h, "-"
        mov     dx, ds
        mov     cl, 30h
        mov     ch, 9
        mov     si, BUF_PGM_FILENAME
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     ax, word ptr [A2_W_036A6]
        mov     dx, word ptr [A2_W_036A8]
        mov     bx, 400h
        div     bx
        sub     dx, dx
        DISP_NUM        0ceh, 09h, 06h
        db      0c3h
save_title_sound:
        DISP_TEXT       1eh, 01h, "Save a Sound"
        db      8ch, 0dah, 0b1h
        push    ds
        mov     ch, 9
        mov     si, BUF_SND_FILENAME
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     ax, word ptr [A2_W_036AA]
        mov     dx, word ptr [A2_W_036AC]
        mov     bx, 400h
        div     bx
        sub     dx, dx
        DISP_NUM        0ceh, 09h, 06h
        ret
save_title_os:
        DISP_TEXT       1eh, 01h, "Copy Operating System"
        DISP_TEXT       1eh, 09h, "MPC2KXL         .BIN"
        DISP_TEXT       0ceh, 09h, "   512"
        db      0c3h
fn_1F2AE:
        cmp     byte ptr [A2_B_DIR_NAME_MODE], 0
        jne     br_1F2B6
        ret
br_1F2B6:
        mov     si, 1eh
        DISP_BMP        0bah, 01h, 1eh
        DISP_TEXT       0c2h, 01h, ":"
        mov     dx, ds
        mov     si, P_2F0A
        mov     cl, 0c8h
        mov     ch, 1
        mov     ah, 8
        mov     bl, 5
        int     90h
        ret
cb_1F2D6:
        db      0b1h, 1eh, 0b5h, 01h, 0b0h, 97h
        int     0b0h
        ret
cb_1F2DF:
        db      0b1h, 1eh, 0b5h, 09h, 0b0h, 73h, 0cdh
        mov     al, 0c3h
cb_1F2E8:
        mov     cl, 0ceh
        mov     ch, 15h
        mov     al, 25h
        int     0b0h
        ret
cb_1F2F1:
        db      0b1h, 0ceh, 0b5h, 1eh, 0b0h, 07h, 0cdh
        mov     al, 0c3h
cb_1F2FA:
        DISP_CURSOR     0c8h, 1, 31h
        ret
far_1F303:
        call    fn_1EE96
        mov     word ptr [A2_W_SAVE_CURSOR_FN], cb_1F2D6-APP2_CSBASE
        FIELD_WHEEL     ds, A2_W_SAVE_TYPE, 0, 0, 5, intcb_1F5D1-APP2_CSBASE
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_CURSOR      0000h, 0000h, L_1F402-APP2_CSBASE, APP2_SEG, 0000h, 0000h, EP_FAR_1F330_OFF, EP_FAR_1F330_SEG
        else
        KEY_CURSOR      0000h, 0000h, (APP2_BASE+L_1F402-APP2_SEG*16), APP2_SEG, 0000h, 0000h, EP_FAR_1F330_OFF, EP_FAR_1F330_SEG
        endif
        db      0cbh
        else
        KEY_CURSOR      0000h, 0000h, EP_L_1F402_OFF, APP2_SEG, 0000h, 0000h, EP_FAR_1F330_OFF, EP_FAR_1F330_SEG
        retf
        endif
far_1F330:
        call    fn_1EE96
        mov     word ptr [A2_W_SAVE_CURSOR_FN], cb_1F2DF-APP2_CSBASE
        mov     bx, word ptr [A2_W_SAVE_TYPE]
        shl     bx, 1
        call    word ptr cs:[bx+TBL_1F345-APP2_CSBASE]
        retf
TBL_1F345:
        dw      tgt_1F351-APP2_CSBASE, tgt_1F364-APP2_CSBASE, tgt_1F390-APP2_CSBASE, tgt_1F3A3-APP2_CSBASE
        dw      tgt_1F3D0-APP2_CSBASE, tgt_1F3FD-APP2_CSBASE
tgt_1F351:
        if      FW_VERSION >= 114
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, L_1F402-APP2_CSBASE, APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        elseif  FW_VERSION >= 112
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, (APP2_BASE+L_1F402-APP2_SEG*16), APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        else
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, EP_L_1F402_OFF, APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        endif
        db      0c3h
tgt_1F364:
        if      FW_VERSION >= 114
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, L_1F402-APP2_CSBASE, APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        elseif  FW_VERSION >= 112
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, (APP2_BASE+L_1F402-APP2_SEG*16), APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        else
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, EP_L_1F402_OFF, APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        endif
        mov     cx, ds
        mov     si, 710h
        mov     bl, 1
        mov     bh, 0
        mov     dx, 63h
        mov     di, P_49D8
        int     7eh
        ret
far_1F388:
        mov     ax, word ptr [A2_W_CUR_SEQ]
        int     0d1h
        int     0a5h
        retf
tgt_1F390:
        if      FW_VERSION >= 114
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, L_1F402-APP2_CSBASE, APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        elseif  FW_VERSION >= 112
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, (APP2_BASE+L_1F402-APP2_SEG*16), APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        else
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, EP_L_1F402_OFF, APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        endif
        db      0c3h
tgt_1F3A3:
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, L_1F402-APP2_CSBASE, APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        KEY_WHEEL2      EP_PGM_FILENAME_FETCH_OFF, APP2_SEG, L_1F3C8-APP2_CSBASE, APP2_SEG
        else
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, (APP2_BASE+L_1F402-APP2_SEG*16), APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        KEY_WHEEL2      EP_PGM_FILENAME_FETCH_OFF, APP2_SEG, (APP2_BASE+L_1F3C8-APP2_SEG*16), APP2_SEG
        endif
        db      0c3h
        else
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, EP_L_1F402_OFF, APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        KEY_WHEEL2      EP_PGM_FILENAME_FETCH_OFF, APP2_SEG, EP_L_1F3C8_OFF, APP2_SEG
        ret
        endif
pgm_filename_fetch:
        mov     al, 8
        int     3bh
        call    fn_1F41B
        retf
L_1F3C8:
        mov     al, 7
        int     3bh
        call    fn_1F41B
        retf
tgt_1F3D0:
        if      FW_VERSION >= 114
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, L_1F402-APP2_CSBASE, APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        KEY_WHEEL2      EP_SND_FILENAME_FETCH_OFF, APP2_SEG, L_1F3F5-APP2_CSBASE, APP2_SEG
        ret
        elseif  FW_VERSION >= 112
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, (APP2_BASE+L_1F402-APP2_SEG*16), APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        KEY_WHEEL2      EP_SND_FILENAME_FETCH_OFF, APP2_SEG, (APP2_BASE+L_1F3F5-APP2_SEG*16), APP2_SEG
        db      0c3h
        else
        KEY_CURSOR      EP_FAR_1F4A4_OFF, EP_FAR_1F4A4_SEG, EP_L_1F402_OFF, APP2_SEG, EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        KEY_WHEEL2      EP_SND_FILENAME_FETCH_OFF, APP2_SEG, EP_L_1F3F5_OFF, APP2_SEG
        ret
        endif
snd_filename_fetch:
        mov     al, 5
        int     3bh
        call    fn_1F47D
        retf
L_1F3F5:
        mov     al, 4
        int     3bh
        call    fn_1F47D
        retf
tgt_1F3FD:
        push    cs
        call    far_1F4E1
        ret
L_1F402:
        cmp     byte ptr [A2_B_DIR_NAME_MODE], 0
        je      br_1F40E
        push    cs
        call    far_1F4A4
        retf
br_1F40E:
        push    cs
        call    far_1F4E1
        retf
fn_1F413:
        sub     ax, ax
        sub     dx, dx
        mov     al, 6
        int     3bh
fn_1F41B:
        mov     word ptr [A2_W_036A6], ax
        mov     word ptr [A2_W_036A8], dx
        mov     byte ptr [A2_B_0371E], bl
fn_1F426:
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        mov     di, BUF_PGM_FILENAME
        mov     cx, 10h
        rep movsb
        mov     ds, ax
        ret
fn_1F439:
        sub     ax, ax
        sub     dx, dx
        mov     al, 6
        int     3bh
        mov     word ptr [A2_W_036A2], ax
        mov     word ptr [A2_W_036A4], dx
        call    fn_1F426
        mov     byte ptr [A2_B_03762], 17h
loop_1F450:
        mov     al, 7
        int     3bh
        pusha
        mov     di, si
        mov     si, BUF_PGM_FILENAME
        mov     cx, 10h
        repe cmpsb
        popa
        jne     br_1F463
        ret
br_1F463:
        add     word ptr [A2_W_036A2], ax
        adc     word ptr [A2_W_036A4], dx
        call    fn_1F426
        dec     byte ptr [A2_B_03762]
        jne     loop_1F450
        ret
fn_1F475:
        sub     ax, ax
        sub     dx, dx
        mov     al, 3
        int     3bh
fn_1F47D:
        mov     word ptr [A2_W_036AA], ax
        mov     word ptr [A2_W_036AC], dx
        mov     bx, ax
        or      bx, dx
        jne     br_1F491
        mov     ax, ds
        mov     es, ax
        mov     si, STR_NO_SOUND_PADDED
br_1F491:
        mov     ax, ds
        mov     bx, es
        mov     es, ax
        mov     ds, bx
        mov     di, BUF_SND_FILENAME
        mov     cx, 10h
        rep movsb
        mov     ds, ax
        ret
far_1F4A4:
        cmp     byte ptr [A2_B_DIR_NAME_MODE], 0
        je      br_1F4DC
        mov     si, P_4AF4
        call    L_1E773
        mov     word ptr [A2_W_SAVE_CURSOR_FN], cb_1F2FA-APP2_CSBASE
        KEY_WHEEL2      (APP2_BASE+L_1CCD8-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1CCC3-APP2_SEG*16), APP2_SEG
        KEY_CURSOR      EP_FAR_1F303_OFF, EP_FAR_1F303_SEG, EP_FAR_1F330_OFF, EP_FAR_1F330_SEG, 0000h, 0000h, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG
        KEY_DOWN        16h, EP_L_1C40C_OFF, APP2_SEG
        retf
br_1F4DC:
        push    cs
        call    far_1F330
        retf
far_1F4E1:
        call    fn_1EE96
        mov     word ptr [A2_W_SAVE_CURSOR_FN], cb_1F2E8-APP2_CSBASE
        KEY_WHEEL2      EP_DISK_DEVICE_SELECT_PREV_OFF, APP2_SEG, EP_DISK_DEVICE_SELECT_NEXT_OFF, EP_DISK_DEVICE_SELECT_NEXT_SEG
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_CURSOR      EP_FAR_1F507_OFF, EP_FAR_1F507_SEG, 0000h, 0000h, L_1F518-APP2_CSBASE, APP2_SEG, L_1F529-APP2_CSBASE, APP2_SEG
        else
        KEY_CURSOR      EP_FAR_1F507_OFF, EP_FAR_1F507_SEG, 0000h, 0000h, (APP2_BASE+L_1F518-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1F529-APP2_SEG*16), APP2_SEG
        endif
        else
        KEY_CURSOR      EP_FAR_1F507_OFF, EP_FAR_1F507_SEG, 0000h, 0000h, EP_L_1F518_OFF, APP2_SEG, EP_L_1F529_OFF, APP2_SEG
        endif
        db      0cbh
far_1F507:
        cmp     word ptr [A2_W_SAVE_TYPE], 5
        je      br_1F513
        push    cs
        call    far_1F330
        retf
br_1F513:
        push    cs
        call    far_1F303
        retf
L_1F518:
        cmp     byte ptr [A2_B_DIR_NAME_MODE], 0
        je      br_1F524
        push    cs
        call    far_1F4A4
        retf
br_1F524:
        push    cs
        call    far_1F507
        retf
L_1F529:
        cmp     word ptr [A2_W_DISK_PARTITION_COUNT], 0
        jne     br_1F531
        retf
br_1F531:
        mov     si, P_4B79
        if      FW_VERSION >= 110
        call    fn_1EE9F
        else
        call    L_1E773
        endif
        mov     word ptr [A2_W_SAVE_CURSOR_FN], cb_1F2F1-APP2_CSBASE
        FIELD_WHEEL     ds, A2_W_DISK_PARTITION, 0, 0, word ptr [A2_W_DISK_PARTITION_COUNT], intcb_1D2FB-APP2_CSBASE
        KEY_CURSOR      EP_FAR_1F330_OFF, EP_FAR_1F330_SEG, 0000h, 0000h, EP_FAR_1F4E1_OFF, EP_FAR_1F4E1_SEG, 0000h, 0000h
        db      0cbh
L_1F562:
        call    fn_1BE66
        jae     br_1F568
        retf
br_1F568:
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 0
        jne     br_1F570
        retf
br_1F570:
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 6
        jne     br_1F578
        retf
br_1F578:
        cmp     byte ptr [A2_B_DISK_FORMAT], 2
        je      br_1F5A3
        cmp     byte ptr [A2_B_DISK_FORMAT], 3
        je      br_1F5A3
        cmp     byte ptr [A2_B_DISK_FORMAT], 4
        je      br_1F5A3
        cmp     byte ptr [A2_B_DISK_FORMAT], 0ah
        je      br_1F5A3
        cmp     byte ptr [A2_B_DISK_FORMAT], 0bh
        je      br_1F5A3
        cmp     byte ptr [A2_B_DISK_FORMAT], 0ch
        je      br_1F5A3
        retf
br_1F5A3:
        mov     bl, 11h
        int     91h
        jae     br_1F5AF
        push    cs
        call    isr_1EE40
        jmp     br_1F5C2
br_1F5AF:
        cmp     bl, 0
        jne     L_1F08A
        mov     bx, word ptr [A2_W_SAVE_TYPE]
        shl     bx, 1
        call    word ptr cs:[bx+TBL_SAVE_TYPE_EXEC-APP2_CSBASE]
        retf
L_1F08A:
        mov     al, 1
br_1F5C2:
        int     95h
        retf
TBL_SAVE_TYPE_EXEC:
        dw      save_exec_all_seqs-APP2_CSBASE, save_exec_seq-APP2_CSBASE, save_exec_all_pgms-APP2_CSBASE, save_exec_pgm-APP2_CSBASE
        dw      save_exec_sound-APP2_CSBASE, save_exec_os-APP2_CSBASE
intcb_1F5D1:
        retf
save_exec_all_seqs:
        int     0a4h
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_DOWN        20h, L_1F63C-APP2_CSBASE, APP2_SEG
        KEY_DOWN        12h, L_1F68F-APP2_CSBASE, APP2_SEG
        else
        KEY_DOWN        20h, (APP2_BASE+L_1F63C-APP2_SEG*16), APP2_SEG
        KEY_DOWN        12h, (APP2_BASE+L_1F68F-APP2_SEG*16), APP2_SEG
        endif
        KEY_DOWN        13h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        14h, L_1F69C-APP2_CSBASE, APP2_SEG
        else
        KEY_DOWN        14h, (APP2_BASE+L_1F69C-APP2_SEG*16), APP2_SEG
        endif
        KEY_DOWN        16h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        if      FW_VERSION >= 114
        KEY_WHEEL       L_1F629-APP2_CSBASE, APP2_SEG
        KEY_DIGITS      L_1F629-APP2_CSBASE, APP2_SEG
        KEY_DOWN        22h, L_1F629-APP2_CSBASE, APP2_SEG
        KEY_DOWN        17h, L_1F629-APP2_CSBASE, APP2_SEG
        KEY_DOWN        18h, L_1F629-APP2_CSBASE, APP2_SEG
        else
        KEY_WHEEL       (APP2_BASE+L_1F629-APP2_SEG*16), APP2_SEG
        KEY_DIGITS      (APP2_BASE+L_1F629-APP2_SEG*16), APP2_SEG
        KEY_DOWN        22h, (APP2_BASE+L_1F629-APP2_SEG*16), APP2_SEG
        KEY_DOWN        17h, (APP2_BASE+L_1F629-APP2_SEG*16), APP2_SEG
        KEY_DOWN        18h, (APP2_BASE+L_1F629-APP2_SEG*16), APP2_SEG
        endif
        db      0c3h
L_1F629:
        mov     si, BUF_ALL_FILENAME
        mov     dx, ds
        mov     ah, 10h
        mov     bx, P_4C88
        mov     cx, cs
        else
        KEY_DOWN        20h, EP_L_1F63C_OFF, APP2_SEG
        KEY_DOWN        12h, EP_L_1F68F_OFF, APP2_SEG
        KEY_DOWN        13h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        KEY_DOWN        14h, EP_L_1EF10_OFF, APP2_SEG
        KEY_DOWN        16h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        KEY_WHEEL       EP_L_1EE9D_OFF, APP2_SEG
        KEY_DIGITS      EP_L_1EE9D_OFF, APP2_SEG
        KEY_DOWN        22h, EP_L_1EE9D_OFF, APP2_SEG
        KEY_DOWN        17h, EP_L_1EE9D_OFF, APP2_SEG
        KEY_DOWN        18h, EP_L_1EE9D_OFF, APP2_SEG
        if      FW_VERSION >= 110
L_1F629                         equ     $+1
        db      0c3h, 0beh, 0aeh, 36h, 8ch, 0dah, 0b4h, 10h, 0bbh, 1ch, 4ch, 8ch, 0c9h
        else
        ret
L_1F629:
        mov     si, BUF_ALL_FILENAME
        mov     dx, ds
        mov     ah, 10h
        mov     bx, P_4C88
        mov     cx, cs
        endif
        endif
        int     0b7h
        retf
d_p_4c88:
        mov     ax, 1
        retf
L_1F63C:
        DISP_WIN_NARROW "Save ALL file"
        DISP_TEXT       24h, 18h, "File^name:"
        mov     dx, ds
        mov     cl, 5dh
        mov     ch, 18h
        mov     si, BUF_ALL_FILENAME
        mov     ah, 14h
        mov     bl, 5
        int     90h
        DISP_CURSOR     5dh, 18h, 7
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "SAVE"
        db      0e8h
        outsb
        db      00h, 0cbh
L_1F68F:
        call    fn_1EF3A
        jae     L_1F15F
        retf
L_1F15F:
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
L_1F69C                         equ     $+7
        db      0b8h, 8dh, 4ch, 0e8h, 3fh, 03h, 0cbh, 0b8h, 8dh, 4ch, 0bbh, 0b6h, 4bh, 0beh, 0aeh, 36h
        db      0e8h, 4ah, 02h, 0cbh, 8ch, 0d8h, 8eh, 0c0h, 0beh, 0aeh, 36h, 0b9h, 00h, 00h, 0bah, 00h
        db      00h, 0b3h, 07h, 0cdh, 91h, 73h, 02h, 0ebh, 34h, 8ch, 0d8h, 8eh, 0c0h, 0beh, 00h, 00h
        db      0b9h, 06h, 0fh, 0b3h, 09h, 0cdh, 91h, 73h, 02h, 0ebh, 22h, 0b8h, 00h, 0e0h, 8eh, 0c0h
        db      0beh, 00h, 00h, 0b9h, 40h, 29h, 0b3h, 09h, 0cdh, 91h, 73h, 02h, 0ebh, 0fh, 0cdh, 0eah
        db      73h, 02h, 0ebh, 09h, 0b3h, 0ah, 0cdh, 91h, 0eh, 0e8h, 4fh, 0f7h, 0c3h, 0cdh, 95h, 0e8h
        db      0dh, 0c8h, 0eh, 0e8h, 45h, 0f7h, 0c3h, 0e8h, 3bh, 0f8h, 73h, 01h, 0c3h
        else
        mov     ax, P_4CF9
        call    far_1F9DA
        retf
L_1F69C:
        mov     ax, P_4CF9
        mov     bx, P_4C22
        mov     si, BUF_ALL_FILENAME
        call    fn_1F8F2
        retf
d_p_4cf9:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_ALL_FILENAME
        mov     cx, 0
        mov     dx, 0
        mov     bl, 7
        int     91h
        jae     br_1F6BE
        jmp     br_1F6F2
br_1F6BE:
        mov     ax, ds
        mov     es, ax
        mov     si, 0
        mov     cx, 0f06h
        mov     bl, 9
        int     91h
        jae     br_1F6D0
        jmp     br_1F6F2
br_1F6D0:
        mov     ax, 0e000h
        mov     es, ax
        mov     si, 0
        mov     cx, 2940h
        mov     bl, 9
        int     91h
        jae     br_1F6E3
        jmp     br_1F6F2
br_1F6E3:
        int     0eah
        jae     br_1F6E9
        jmp     br_1F6F2
br_1F6E9:
        mov     bl, 0ah
        int     91h
        push    cs
        call    isr_1EE40
        ret
br_1F6F2:
        int     95h
        call    fn_1BE98
        push    cs
        call    isr_1EE40
        ret
fn_1F6FC:
        call    fn_1EF3A
        jae     br_1F702
        ret
br_1F702:
        endif
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "WIPE"
        db      0c3h
save_exec_seq:
        mov     es, word ptr [A2_W_00F10]
        cmp     byte ptr es:[12h], 0
        jne     br_1F71A
        ret
br_1F71A:
        push    cs
        call    far_1F71F
        ret
far_1F71F:
        mov     word ptr [A2_W_SAVE_CURSOR_FN], cb_1F7DC-APP2_CSBASE
        int     0a4h
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        mov     cx, ds
        mov     si, G_MIDI_FILE_TYPE
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, P_4C21
        int     7dh
        KEY_DOWN        1ah, EP_L_1F2B8_OFF, APP2_SEG
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_DOWN        20h, L_1F771-APP2_CSBASE, APP2_SEG
        KEY_DOWN        12h, L_1F861-APP2_CSBASE, APP2_SEG
        else
        KEY_DOWN        20h, (APP2_BASE+L_1F771-APP2_SEG*16), APP2_SEG
        KEY_DOWN        12h, (APP2_BASE+L_1F861-APP2_SEG*16), APP2_SEG
        endif
        KEY_DOWN        13h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        14h, L_1F86E-APP2_CSBASE, APP2_SEG
        else
        KEY_DOWN        14h, (APP2_BASE+L_1F86E-APP2_SEG*16), APP2_SEG
        endif
        else
        KEY_DOWN        20h, EP_L_1F771_OFF, APP2_SEG
        KEY_DOWN        12h, EP_L_1F0D5_OFF, APP2_SEG
        KEY_DOWN        13h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        KEY_DOWN        14h, EP_L_1F0E2_OFF, APP2_SEG
        endif
        KEY_DOWN        16h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        db      0cbh
L_1F771:
        DISP_WIN_NARROW "Save a Sequence"
        DISP_TEXT       24h, 10h, " Save as:"
        DISP_TEXT       24h, 22h, "    File:"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "SAVE"
        mov     dx, ds
        DISP_TEXT_IDX   5ah, 10h, G_MIDI_FILE_TYPE, TBL_MIDI_FILE_TYPE_LABELS
        if      FW_VERSION >= 112
        mov     dx, ds
        mov     cl, 5ah
        mov     ch, 22h
        mov     si, BUF_MID_FILENAME
        mov     ah, 14h
        mov     bl, 5
        int     90h
        call    word ptr [A2_W_SAVE_CURSOR_FN]
        call    fn_1F6FC
        retf
cb_1F7DC:
        mov     cl, 5ah
tgt_1F7DE:
        mov     ch, 10h
        mov     al, 61h
        int     0b0h
        ret
cb_1F7E5:
        DISP_CURSOR     5ah, 22h, 7
        ret
L_1F2B8:
        mov     word ptr [A2_W_SAVE_CURSOR_FN], cb_1F7E5-APP2_CSBASE
tgt_1F7F4:
        int     0a4h
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        20h, L_1F771-APP2_CSBASE, APP2_SEG
        KEY_DOWN        12h, L_1F861-APP2_CSBASE, APP2_SEG
        else
        KEY_DOWN        20h, (APP2_BASE+L_1F771-APP2_SEG*16), APP2_SEG
        KEY_DOWN        12h, (APP2_BASE+L_1F861-APP2_SEG*16), APP2_SEG
        endif
        KEY_DOWN        13h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        14h, L_1F86E-APP2_CSBASE, APP2_SEG
        else
        KEY_DOWN        14h, (APP2_BASE+L_1F86E-APP2_SEG*16), APP2_SEG
        endif
        KEY_DOWN        16h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        if      FW_VERSION >= 114
        KEY_CURSOR      L_1F84D-APP2_CSBASE, APP2_SEG, L_1F84D-APP2_CSBASE, APP2_SEG, EP_FAR_1F71F_OFF, EP_FAR_1F71F_SEG, 0000h, 0000h
        KEY_WHEEL       L_1F84D-APP2_CSBASE, APP2_SEG
        KEY_DIGITS      L_1F84D-APP2_CSBASE, APP2_SEG
        KEY_DOWN        22h, L_1F84D-APP2_CSBASE, APP2_SEG
        else
        KEY_CURSOR      (APP2_BASE+L_1F84D-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1F84D-APP2_SEG*16), APP2_SEG, EP_FAR_1F71F_OFF, EP_FAR_1F71F_SEG, 0000h, 0000h
        KEY_WHEEL       (APP2_BASE+L_1F84D-APP2_SEG*16), APP2_SEG
        KEY_DIGITS      (APP2_BASE+L_1F84D-APP2_SEG*16), APP2_SEG
        KEY_DOWN        22h, (APP2_BASE+L_1F84D-APP2_SEG*16), APP2_SEG
        endif
        db      0cbh
L_1F84D:
        mov     si, BUF_MID_FILENAME
        mov     dx, ds
        mov     ah, 10h
        mov     bx, P_4C88
        mov     cx, cs
        int     0b7h
        retf
d_p_4eac:
        push    cs
        call    L_1F2B8
        ret
L_1F861:
        call    fn_1EF3A
        jae     br_1F867
        retf
br_1F867:
        mov     ax, P_4ECB
        call    far_1F9DA
        retf
L_1F86E:
        mov     ax, P_4ECB
        mov     bx, P_4EAC
        mov     si, BUF_MID_FILENAME
        call    fn_1F8F2
        retf
d_p_4ecb:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_MID_FILENAME
        mov     cx, 0
        mov     dx, 0
        mov     bl, 7
        int     91h
        jb      br_1F8BC
        int     0e7h
        int     83h
        mov     dx, ds
        mov     di, BUF_MID_FILENAME
        mov     al, byte ptr [G_MIDI_FILE_TYPE]
        mov     bx, word ptr [A2_W_SEQ_SEG]
        callf   EP_X_2111E_SEG:EP_X_2111E_OFF
        mov     bx, 3800h
        mov     es, bx
        sub     si, si
        call    fn_1FAA8
        jb      br_1F8BC
        mov     bl, 0ah
        int     91h
        jb      br_1F8BC
        int     0e8h
        push    cs
        call    isr_1EE40
        ret
br_1F8BC:
        int     95h
        int     0e8h
        call    fn_1BE98
        push    cs
        call    isr_1EE40
        ret
        else
        if      FW_VERSION >= 110
        db      8ch, 0dah, 0b1h, 5ah, 0b5h, 22h, 0beh, 0c2h, 36h, 0b4h, 14h, 0b3h, 05h, 0cdh, 90h, 0ffh
        db      16h, 82h, 36h, 0e8h, 21h, 0ffh, 0cbh
cb_1F7DC:
        db      0b1h, 5ah, 0b5h, 10h, 0b0h, 61h, 0cdh, 0b0h, 0c3h
cb_1F7E5:
        db      0b1h, 5ah, 0b5h, 22h, 0b0h, 07h, 0cdh, 0b0h, 0c3h
L_1F2B8:
        mov     word ptr [A2_W_SAVE_CURSOR_FN], cb_1F7E5-APP2_CSBASE
        else
        mov     dx, ds
        mov     cl, 5ah
        mov     ch, 22h
        mov     si, BUF_MID_FILENAME
        mov     ah, 14h
        mov     bl, 5
        int     90h
        call    word ptr [A2_W_SAVE_CURSOR_FN]
        call    fn_1F6FC
        retf
cb_1F7DC:
        mov     cl, 5ah
tgt_1F7DE:
        mov     ch, 10h
        mov     al, 61h
        int     0b0h
        ret
cb_1F7E5:
        DISP_CURSOR     5ah, 22h, 7
        ret
L_1F2B8:
        mov     word ptr [A2_W_SAVE_CURSOR_FN], cb_1F7E5-APP2_CSBASE
tgt_1F7F4:
        endif
        int     0a4h
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        20h, EP_L_1F771_OFF, APP2_SEG
        KEY_DOWN        12h, EP_L_1F0D5_OFF, APP2_SEG
        KEY_DOWN        13h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        KEY_DOWN        14h, EP_L_1F0E2_OFF, APP2_SEG
        KEY_DOWN        16h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        KEY_CURSOR      EP_L_1F0C1_OFF, APP2_SEG, EP_L_1F0C1_OFF, APP2_SEG, EP_FAR_1F71F_OFF, EP_FAR_1F71F_SEG, 0000h, 0000h
        KEY_WHEEL       EP_L_1F0C1_OFF, APP2_SEG
        KEY_DIGITS      EP_L_1F0C1_OFF, APP2_SEG
        KEY_DOWN        22h, EP_L_1F0C1_OFF, APP2_SEG
        if      FW_VERSION >= 110
L_1F84D                         equ     $+1
        db      0cbh, 0beh, 0c2h, 36h, 8ch, 0dah, 0b4h, 10h, 0bbh
L_1F861                         equ     $+0ch
        db      1ch, 4ch, 8ch, 0c9h, 0cdh, 0b7h, 0cbh, 0eh, 0e8h, 8eh, 0ffh, 0c3h, 0e8h, 0d6h, 0f6h, 73h
L_1F86E                         equ     $+9
        db      01h, 0cbh, 0b8h, 5fh, 4eh, 0e8h, 6dh, 01h, 0cbh, 0b8h, 5fh, 4eh, 0bbh, 40h, 4eh, 0beh
        db      0c2h, 36h, 0e8h, 78h, 00h, 0cbh, 8ch, 0d8h, 8eh, 0c0h, 0beh, 0c2h, 36h, 0b9h, 00h, 00h
        db      0bah, 00h, 00h, 0b3h, 07h, 0cdh, 91h, 72h, 2eh, 0cdh, 0e7h, 0cdh, 83h, 8ch, 0dah, 0bfh
        db      0c2h, 36h, 0a0h, 11h, 37h, 8bh, 1eh, 10h, 0fh, 9ah
        dw      EP_X_2111E_OFF, EP_X_2111E_SEG
        db      0bbh, 00h
        db      38h, 8eh, 0c3h, 2bh, 0f6h, 0e8h, 0fbh, 01h, 72h, 0dh, 0b3h, 0ah, 0cdh, 91h, 72h, 07h
        db      0cdh, 0e8h, 0eh, 0e8h, 85h, 0f5h, 0c3h, 0cdh, 95h, 0cdh, 0e8h, 0e8h, 41h, 0c6h, 0eh, 0e8h
        db      79h, 0f5h, 0c3h
        else
        retf
L_1F84D:
        mov     si, BUF_MID_FILENAME
        mov     dx, ds
        mov     ah, 10h
        mov     bx, P_4C88
        mov     cx, cs
        int     0b7h
        retf
d_p_4eac:
        push    cs
        call    L_1F2B8
        ret
L_1F861:
        call    fn_1EF3A
        jae     br_1F867
        retf
br_1F867:
        mov     ax, P_4ECB
        call    far_1F9DA
        retf
L_1F86E:
        mov     ax, P_4ECB
        mov     bx, P_4EAC
        mov     si, BUF_MID_FILENAME
        call    fn_1F8F2
        retf
d_p_4ecb:
        mov     ax, ds
        mov     es, ax
        mov     si, BUF_MID_FILENAME
        mov     cx, 0
        mov     dx, 0
        mov     bl, 7
        int     91h
        jb      br_1F8BC
        int     0e7h
        int     83h
        mov     dx, ds
        mov     di, BUF_MID_FILENAME
        mov     al, byte ptr [G_MIDI_FILE_TYPE]
        mov     bx, word ptr [A2_W_SEQ_SEG]
        callf   EP_X_2111E_SEG:EP_X_2111E_OFF
        mov     bx, 3800h
        mov     es, bx
        sub     si, si
        call    fn_1FAA8
        jb      br_1F8BC
        mov     bl, 0ah
        int     91h
        jb      br_1F8BC
        int     0e8h
        push    cs
        call    isr_1EE40
        ret
br_1F8BC:
        int     95h
        int     0e8h
        call    fn_1BE98
        push    cs
        call    isr_1EE40
        ret
        endif
        endif
save_exec_all_pgms:
        int     5bh
        call    fn_1F8D2
        mov     al, 0
        int     3bh
        ret
fn_1F8D2:
        mov     ah, 0
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        jne     br_1F8DD
        mov     ah, 1
br_1F8DD:
        ret
save_exec_pgm:
        int     5bh
        call    fn_1F8D2
        mov     al, 1
        int     3bh
        ret
save_exec_sound:
        int     5bh
        call    fn_1F8D2
        mov     al, 2
        int     3bh
        ret
        if      FW_VERSION >= 112
fn_1F8F2:
        mov     word ptr [A2_W_SAVE_EXEC_FN], ax
        mov     word ptr [A2_W_0369E], bx
        mov     word ptr [A2_W_036A0], si
        push    ds
        pop     es
        mov     bl, 4
        int     91h
        jae     br_1F908
        jmp     fn_1F999
        else
        if      FW_VERSION >= 110
        mov     word ptr [A2_W_0368C], ax
        else
fn_1F8F2:
        mov     word ptr [A2_W_SAVE_EXEC_FN], ax
        endif
        db      89h, 1eh, 8eh, 36h, 89h, 36h, 90h, 36h, 1eh, 07h, 0b3h, 04h, 0cdh, 91h, 73h, 03h
        db      0e9h, 91h, 00h
        endif
br_1F908:
        DISP_WIN_NARROW "File Exists"
        mov     si, 0eh
        DISP_BMP        28h, 14h, 0eh
        DISP_TEXT       46h, 14h, "File name exists!"
        DISP_TEXT       46h, 1eh, "Replace or rename?"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "REPLAC"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "RENAME"
        int     0a4h
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_SOFT        0000h, 0000h, 0000h, 0000h, L_1F9BA-APP2_CSBASE, APP2_SEG, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG, L_1F9B5-APP2_CSBASE, APP2_SEG, 0000h, 0000h
        else
        KEY_SOFT        0000h, 0000h, 0000h, 0000h, (APP2_BASE+L_1F9BA-APP2_SEG*16), APP2_SEG, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG, (APP2_BASE+L_1F9B5-APP2_SEG*16), APP2_SEG, 0000h, 0000h
        endif
        db      0c3h
fn_1F999:
        mov     bl, 11h
        int     91h
        jb      br_1F9B2
        cmp     bl, 0
        if      FW_VERSION >= 114
        mov     al, 1
        endif
        jne     br_1F9B2
        call    fn_1EF20
        call    word ptr [A2_W_SAVE_EXEC_FN]
        push    cs
        call    isr_1EE40
        ret
br_1F9B2:
        if      FW_VERSION < 114
        mov     al, 1
        endif
        int     95h
        ret
L_1F9B5:
        call    word ptr [A2_W_0369E]
        retf
L_1F9BA:
        mov     bl, 11h
        int     91h
        jb      br_1F9D7
        cmp     bl, 0
        mov     al, 1
        jne     br_1F9D7
        mov     ax, ds
        mov     es, ax
        mov     si, word ptr [A2_W_036A0]
        mov     bl, 14h
        int     91h
        call    fn_1F999
        retf
br_1F9D7:
        int     95h
        retf
far_1F9DA:
        mov     word ptr [A2_W_SAVE_EXEC_FN], ax
        else
        KEY_SOFT        0000h, 0000h, 0000h, 0000h, EP_L_1F22E_OFF, APP2_SEG, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG, (APP2_BASE+L_1F229-APP2_SEG*16), APP2_SEG, 0000h, 0000h
        if      FW_VERSION >= 110
        db      0c3h, 0b3h, 11h, 0cdh, 91h, 72h, 11h, 80h, 0fbh, 00h, 75h, 0ch, 0e8h
        db      79h, 0f5h, 0ffh, 16h, 8ch, 36h, 0eh, 0e8h, 91h, 0f4h, 0c3h, 0b0h, 01h, 0cdh, 95h, 0c3h
        else
        ret
fn_1F999:
        mov     bl, 11h
        int     91h
        jb      br_1F9B2
        cmp     bl, 0
        jne     br_1F9B2
        call    fn_1EF20
        call    word ptr [A2_W_SAVE_EXEC_FN]
        push    cs
        call    isr_1EE40
        ret
br_1F9B2:
        mov     al, 1
        int     95h
        ret
        endif
L_1F229:
        if      FW_VERSION >= 110
L_1F9BA                         equ     $+5
        db      0ffh, 16h, 8eh, 36h, 0cbh, 0b3h, 11h, 0cdh, 91h, 72h, 17h, 80h, 0fbh, 00h, 0b0h, 01h
        db      75h, 10h, 8ch, 0d8h, 8eh, 0c0h, 8bh, 36h, 90h, 36h, 0b3h, 14h, 0cdh, 91h, 0e8h, 0c3h
        db      0ffh, 0cbh, 0cdh, 95h, 0cbh, 0a3h, 8ch, 36h
        else
        call    word ptr [A2_W_0369E]
        retf
L_1F9BA:
        mov     bl, 11h
        int     91h
        jb      br_1F9D7
        cmp     bl, 0
        mov     al, 1
        jne     br_1F9D7
        mov     ax, ds
        mov     es, ax
        mov     si, word ptr [A2_W_036A0]
        mov     bl, 14h
        int     91h
        call    fn_1F999
        retf
br_1F9D7:
        int     95h
        retf
far_1F9DA:
        mov     word ptr [A2_W_SAVE_EXEC_FN], ax
        endif
        endif
        DISP_WIN_NARROW "Wipe Disk"
        mov     si, 0eh
        DISP_BMP        28h, 14h, 0eh
        DISP_TEXT       46h, 14h, "This will erase disk"
        DISP_TEXT       46h, 1eh, "contents !!"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "WIPE"
        int     0a4h
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        KEY_DOWN        20h, 0000h, 0000h
        KEY_DOWN        12h, 0000h, 0000h
        KEY_DOWN        13h, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG
        if      FW_VERSION >= 112
        KEY_DOWN        14h, (APP2_BASE+L_1F338-APP2_SEG*16), APP2_SEG
        db      0c3h
L_1F338:
        db      0b3h, 11h, 0cdh, 91h
        jae     br_1FA71
        db      0eh, 0e8h, 0d6h
        db      0f3h, 0b3h, 11h, 0cdh
tgt_1FA6D:
        xchg    cx, ax
        jae     br_1FA71
        retf
br_1FA71:
        cmp     bl, 0
        jne     br_1FAA3
tgt_1FA78                       equ     $+2
        DISP_MSG        "        WIPE DISK........"
        mov     bl, 15h
        int     91h
        call    fn_1EF20
        call    word ptr [A2_W_SAVE_EXEC_FN]
        push    cs
        call    isr_1EE40
        retf
br_1FAA3:
        mov     al, 1
        int     95h
        retf
fn_1FAA8:
        mov     cx, ax
        or      cx, dx
        jne     br_1FAAF
        ret
br_1FAAF:
        mov     bx, si
        shr     bx, 4
        mov     cx, es
        add     cx, bx
        mov     es, cx
        and     si, 0fh
        mov     cx, 8000h
        sub     ax, cx
        sbb     dx, 0
        jae     br_1FACD
        add     cx, ax
        sub     ax, ax
        sub     dx, dx
br_1FACD:
        push    ax
        push    dx
        push    si
        push    es
        mov     bl, 9
        int     91h
        mov     cx, ax
        pop     es
        pop     si
        pop     dx
        pop     ax
        jb      br_1FAE3
        add     si, 8000h
        jmp     fn_1FAA8
br_1FAE3:
        mov     ax, cx
        stc
        ret
L_1FAE7:
        mov     al, 0
        int     0dch
        int     0e7h
        int     0ceh
        retf
        db      "MPC2KXL         .BIN"
        else
        KEY_DOWN        14h, (APP2_BASE+L_1F2D4-APP2_SEG*16), APP2_SEG
        if      FW_VERSION >= 110
L_1F2D4                         equ     $+1
        db      0c3h, 0b3h, 11h, 0cdh, 91h, 73h
        db      0bh, 0eh, 0e8h, 0d6h, 0f3h, 0b3h, 11h, 0cdh, 91h, 73h, 01h, 0cbh, 80h, 0fbh, 00h, 75h
        db      2dh
        DISP_MSG        "        WIPE DISK........"
        db      0b3h, 15h
        db      0cdh, 91h, 0e8h, 86h, 0f4h, 0ffh, 16h, 8ch, 36h, 0eh, 0e8h, 9eh, 0f3h, 0cbh, 0b0h, 01h
        db      0cdh, 95h, 0cbh, 8bh, 0c8h, 0bh, 0cah, 75h, 01h, 0c3h, 8bh, 0deh, 0c1h, 0ebh, 04h, 8ch
        db      0c1h, 03h, 0cbh, 8eh, 0c1h, 83h, 0e6h, 0fh, 0b9h, 00h, 80h, 2bh, 0c1h, 83h, 0dah, 00h
        db      73h, 06h, 03h, 0c8h, 2bh, 0c0h, 2bh, 0d2h, 50h, 52h, 56h, 06h, 0b3h, 09h, 0cdh, 91h
        db      08bh, 0c8h, 007h, "^ZXr", 006h, 081h, 0c6h, 000h, 080h, 0ebh, 0c5h, 08bh, 0c1h
        else
        ret
L_1F2D4:
        db      0b3h, 11h, 0cdh, 91h, 73h, 0bh, 0eh, 0e8h, 0deh, 0f3h, 0b3h, 11h, 0cdh
tgt_1FA6D:
        xchg    cx, ax
        jae     br_1FA71
        retf
br_1FA71:
        cmp     bl, 0
        jne     br_1FAA3
tgt_1FA78                       equ     $+2
        DISP_MSG        "        WIPE DISK........"
        mov     bl, 15h
        int     91h
        call    fn_1EF20
        call    word ptr [A2_W_SAVE_EXEC_FN]
        push    cs
        call    isr_1EE40
        retf
br_1FAA3:
        mov     al, 1
        int     95h
        retf
fn_1FAA8:
        mov     cx, ax
        or      cx, dx
        jne     br_1FAAF
        ret
br_1FAAF:
        mov     bx, si
        shr     bx, 4
        mov     cx, es
        add     cx, bx
        mov     es, cx
        and     si, 0fh
        mov     cx, 8000h
        sub     ax, cx
        sbb     dx, 0
        jae     br_1FACD
        add     cx, ax
        sub     ax, ax
        sub     dx, dx
br_1FACD:
        push    ax
        push    dx
        push    si
        push    es
        mov     bl, 9
        int     91h
        mov     cx, ax
        pop     es
        pop     si
        pop     dx
        pop     ax
        jb      br_1FAE3
        add     si, 8000h
        jmp     fn_1FAA8
br_1FAE3:
        mov     ax, cx
        endif
L_1F35B                         equ     $+2
        db      0f9h, 0c3h, 0b0h, 000h, 0cdh, 0dch, 0cdh, 0e7h, 0cdh, 0ceh, 0cbh, "MPC2K"
        db      "XL         .BIN"
        endif
save_exec_os:
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        db      80h
        db      3eh, 0d6h, 2eh, 09h, 75h, 01h, 0c3h, 8ch, 0c8h, 8eh, 0c0h, 0beh, 0d4h, 50h, 0b3h, 14h
        db      0cdh, 91h, 0e8h, 06h, 0f4h, 0cdh, 74h, 0beh, 0d4h, 50h, 8ch, 0c8h, 8eh, 0c0h, 0b3h, 07h
        db      0cdh, 91h, 72h, 0dh, 0cdh, 0d0h, 72h, 09h, 0b3h, 0ah, 0cdh, 91h, 0eh, 0e8h, 0bh, 0f3h
        db      0c3h, 0cdh, 95h, 0eh, 0e8h, 04h, 0f3h, 0c3h, 00h
        else
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        jne     br_1FB0C
        ret
br_1FB0C:
        mov     ax, cs
        mov     es, ax
        mov     si, STR_MPC2KXL_BIN_2
        mov     bl, 14h
        int     91h
        call    fn_1EF20
        int     74h
        mov     si, STR_MPC2KXL_BIN_2
        mov     ax, cs
        mov     es, ax
        mov     bl, 7
        int     91h
        jb      br_1FB36
        int     0d0h
        jb      br_1FB36
        mov     bl, 0ah
        int     91h
        push    cs
        call    isr_1EE40
        ret
br_1FB36:
        int     95h
        push    cs
        call    isr_1EE40
        ret
        db      00h
        endif
far_1FB3E:
        call    fn_1BE66
        mov     ax, 0
        push    cs
        call    far_1FE73
        push    cs
        call    far_1FB4D
        retf
far_1FB4D:
        mov     word ptr [A2_W_0376C], P_52BF
        int     0a4h
        if      FW_VERSION >= 114
        KEY_SOFT        EP_DISK_SCREEN_ENTER_OFF, EP_DISK_SCREEN_ENTER_SEG, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG, L_1FBAC-APP2_CSBASE, APP2_SEG, (APP2_BASE+L_1CD1C-APP2_SEG*16), APP2_SEG, 0000h, 0000h, L_1FEF4-APP2_CSBASE, APP2_SEG
        KEY_WHEEL2      EP_L_1FB92_OFF, APP2_SEG, L_1FB9F-APP2_CSBASE, APP2_SEG
        elseif  FW_VERSION >= 112
        KEY_SOFT        (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG, EP_ISR_1EE40_OFF, EP_ISR_1EE40_SEG, (APP2_BASE+L_1FBAC-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1CD1C-APP2_SEG*16), APP2_SEG, 0000h, 0000h, (APP2_BASE+L_1FEF4-APP2_SEG*16), APP2_SEG
        KEY_WHEEL2      EP_L_1FB92_OFF, APP2_SEG, (APP2_BASE+L_1FB9F-APP2_SEG*16), APP2_SEG
        else
        KEY_SOFT        (APP2_BASE+disk_screen_enter-APP2_SEG*16), APP2_SEG, (APP2_BASE+ISR_1EE40-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1FBAC-APP2_SEG*16), APP2_SEG, (APP2_BASE+L_1CD1C-APP2_SEG*16), APP2_SEG, 0000h, 0000h, (APP2_BASE+L_1FEF4-APP2_SEG*16), APP2_SEG
        KEY_WHEEL2      EP_L_1FB92_OFF, APP2_SEG, EP_L_1FB9F_OFF, APP2_SEG
        endif
        KEY_DOWN        20h, EP_FAR_1FBB4_OFF, EP_FAR_1FBB4_SEG
        if      FW_VERSION >= 114
        KEY_DOWN        16h, L_1FEB5-APP2_CSBASE, APP2_SEG
        elseif  FW_VERSION >= 112
        KEY_DOWN        16h, (APP2_BASE+L_1FEB5-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        16h, EP_L_1FEB5_OFF, APP2_SEG
        endif
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_1FB92:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 112
        callf   APP2_SEG:EP_DISK_DEVICE_SELECT_PREV_OFF
        else
        db      9ah
        inc     bp
        daa
        if      FW_VERSION >= 111
        sub     word ptr [bp+si], bx
        else
        db      28h, 1ah
        endif
        endif
        else
        db      9ah
        sbb     al, 27h
        add     word ptr [bp+si], bx
        endif
        mov     ax, 0
        push    cs
        call    far_1FE73
        retf
L_1FB9F:
        callf   EP_DISK_DEVICE_SELECT_NEXT_SEG:EP_DISK_DEVICE_SELECT_NEXT_OFF
        mov     ax, 0
        push    cs
        call    far_1FE73
        retf
L_1FBAC:
        call    fn_1BE98
        push    cs
        call    far_1FB3E
        retf
far_1FBB4:
        DISP_CLEAR
        DISP_TEXT       00h, 01h, " Device:"
        DISP_HDOTS      00h, 1bh, 0f8h
        mov     si, 0eh
        DISP_BMP        06h, 1eh, 0eh
        mov     dx, ds
        DISP_TEXT_IDX   30h, 01h, A2_B_DISK_DEVICE, TBL_DISK_DEVICE_LABELS
        DISP_TEXT       2ah, 24h, "THIS WILL ERASE THE WHOLE DISK!!"
        mov     dx, ds
        DISP_TEXT_IDX   30h, 01h, A2_B_DISK_DEVICE, TBL_DISK_DEVICE_LABELS
        mov     al, byte ptr [A2_B_DISK_FS_TYPE]
        mov     bx, P_2FE3
        xlat
        mov     cl, 0dch
        mov     ch, 1
        mov     bl, 16h
        int     90h
        call    fn_1FC8A
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "LOAD"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "SAVE"
        DISP_SOFTKEY    03h, DISP_SK_PLAIN, "FORMAT"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "SETUP"
        call    word ptr [A2_W_0376C]
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 0
        jne     br_1FC5B
        retf
br_1FC5B:
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 6
        jne     br_1FC63
        retf
br_1FC63:
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "DO IT"
        db      0cbh
d_p_52bf:
        DISP_CURSOR     30h, 1, 26h
        ret
d_p_52c8:
        DISP_CURSOR     0bah, 9, 13h
        ret
d_p_52d1:
        DISP_CURSOR     0c8h, 1, 13h
        ret
fn_1FC8A:
        mov     al, byte ptr [A2_B_DISK_DEVICE]
        cmp     al, 0
        jne     br_1FC94
        jmp     br_1FD5E
br_1FC94:
        cmp     al, 9
        jne     br_1FC9B
        jmp     br_1FE05
br_1FC9B:
        if      FW_VERSION < 120
L_1FD7C:
        endif
        DISP_TEXT       60h, 01h, "Partition size=   M"
        DISP_TEXT       96h, 09h, "Parts:A-"
        DISP_TEXT       00h, 0ah, " Vender="
        DISP_TEXT       00h, 12h, "Product=                  Ver.="
        mov     dx, ds
        mov     cl, 30h
        mov     ch, 0ah
        mov     si, P_2EA1
        mov     ah, 8
        mov     bl, 5
        int     90h
        mov     dx, ds
        mov     cl, 30h
        mov     ch, 12h
        mov     si, P_2EA9
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     dx, ds
        mov     cl, 0bah
        mov     ch, 12h
        mov     si, P_2EB9
        mov     ah, 4
        mov     bl, 5
        int     90h
        cmp     byte ptr [A2_B_DISK_FORMAT], 0
        jne     br_1FD2A
        ret
br_1FD2A:
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 9
        jne     br_1FD32
        ret
br_1FD32:
        mov     ax, word ptr [A2_W_DISK_SIZE_MB]
        DISP_NUM        0d6h, 13h, 04h
        DISP_TEXT       0eeh, 13h, "M"
        mov     ax, word ptr [P_3764]
        DISP_NUM        0bah, 01h, 03h
        mov     al, byte ptr [A2_B_0376E]
        add     al, 41h
        DISP_CHAR       0c6h, 09h
        if      FW_VERSION < 112
        KEY_DOWN        18h, EP_L_1FE49_OFF, APP2_SEG
        elseif  FW_VERSION < 114
        KEY_DOWN        18h, (APP2_BASE+L_1FE49-APP2_SEG*16), APP2_SEG
        else
        KEY_DOWN        18h, L_1FE49-APP2_CSBASE, APP2_SEG
        endif
        db      0c3h
br_1FD5E:
        cmp     byte ptr [A2_B_ATAPI_DEVICE], 0
        je      br_1FD67
        jmp     L_1FD7C
br_1FD67:
        mov     dx, ds
        DISP_TEXT_IDX   0aah, 01h, G_FLOPPY_TYPE, TBL_FLOPPY_TYPE_LABELS
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_DOWN        18h, L_1FE1F-APP2_CSBASE, APP2_SEG
        else
        KEY_DOWN        18h, (APP2_BASE+L_1FE1F-APP2_SEG*16), APP2_SEG
        endif
        db      0c3h
        else
        KEY_DOWN        18h, EP_L_1FE1F_OFF, APP2_SEG
        ret
        endif
        if      FW_VERSION >= 120
L_1FD7C:
        DISP_TEXT       00h, 0ah, " Vender="
        DISP_TEXT       00h, 12h, "Product=                  Ver.="
        mov     dx, ds
        mov     cl, 30h
        mov     ch, 0ah
        mov     si, 2ea1h
        mov     ah, 8
        mov     bl, 5
        int     90h
        mov     dx, ds
        mov     cl, 30h
        mov     ch, 12h
        mov     si, 2ea9h
        mov     ah, 10h
        mov     bl, 5
        int     90h
        mov     dx, ds
        mov     cl, 0bah
        mov     ch, 12h
        mov     si, 2eb9h
        mov     ah, 4
        mov     bl, 5
        int     90h
        cmp     byte ptr [A2_B_DISK_FORMAT], 0
        jne     L_1FDE4
        ret
L_1FDE4:
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 9
        jne     L_1FDEC
        ret
L_1FDEC:
        mov     ax, word ptr [A2_W_DISK_SIZE_MB]
        DISP_NUM        0d6h, 13h, 04h
        DISP_TEXT       0eeh, 13h, "M"
        KEY_DOWN        18h, 0000h, 0000h
        db      0c3h
        endif
br_1FE05:
        cmp     byte ptr [A2_B_DISK_FORMAT], 0
        jne     br_1FE0D
        ret
br_1FE0D:
        mov     si, 8
        DISP_BMP        0dch, 01h, 08h
        if      FW_VERSION >= 120
        KEY_DOWN        18h, 0000h, 0000h
        endif
        ret
L_1FE1F:
        mov     word ptr [A2_W_0376C], P_52D1
        KEY_CURSOR      EP_FAR_1FB4D_OFF, EP_FAR_1FB4D_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        mov     cx, ds
        if      FW_VERSION < 120
        mov     si, 375fh
        else
        mov     si, 376fh
        endif
        mov     bl, 0
        mov     bh, 0
        mov     dx, 1
        mov     di, P_4C21
        int     7dh
        retf
L_1FE49:
        mov     word ptr [A2_W_0376C], P_52C8
        KEY_CURSOR      EP_FAR_1FB4D_OFF, EP_FAR_1FB4D_SEG, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        mov     cx, ds
        if      FW_VERSION < 120
        mov     si, 375eh
        else
        mov     si, 376eh
        endif
        mov     bl, 0
        mov     bh, 0
        mov     dx, 19h
        if      FW_VERSION >= 114
        mov     di, far_1FE73-APP2_CSBASE
        else
        mov     di, (APP2_BASE+far_1FE73-APP2_SEG*16)
        endif
        int     7dh
        retf
far_1FE73:
        mov     bl, al
        sub     bh, bh
loop_1FE77:
        mov     ax, word ptr [A2_W_DISK_SIZE_MB]
        cmp     ax, 0ah
        jae     br_1FE80
        retf
br_1FE80:
        sub     dx, dx
        inc     bl
        div     bx
        cmp     ax, 0ah
        jae     loop_1FE96
        cmp     bl, 3
        jae     br_1FE91
        retf
br_1FE91:
        sub     bl, 2
        jmp     loop_1FE77
loop_1FE96:
        cmp     ax, 3e8h
        jb      br_1FEAB
        cmp     bl, 19h
        jae     br_1FEAB
        inc     bl
        mov     ax, word ptr [A2_W_DISK_SIZE_MB]
        sub     dx, dx
        div     bx
        jmp     loop_1FE96
br_1FEAB:
        dec     bl
        mov     byte ptr [A2_B_0376E], bl
        mov     word ptr [P_3764], ax
        retf
L_1FEB5:
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        je      br_1FEBD
        retf
br_1FEBD:
        cmp     byte ptr [A2_B_DISK_FORMAT], 0ah
        je      br_1FECC
        cmp     byte ptr [A2_B_DISK_FORMAT], 0bh
        je      br_1FECC
        retf
br_1FECC:
        int     0b1h
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CLOSE"
        int     0a4h
        KEY_DOWN        13h, EP_FAR_1FB3E_OFF, EP_FAR_1FB3E_SEG
        KEY_DOWN        16h, EP_FAR_1FB3E_OFF, EP_FAR_1FB3E_SEG
        KEY_DOWN        27h, EP_GOTO_MAIN_SCREEN_OFF, EP_GOTO_MAIN_SCREEN_SEG
        db      0cbh
L_1FEF4:
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 0
        jne     br_1FEFC
        retf
br_1FEFC:
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 6
        jne     br_1FF04
        retf
br_1FF04:
        call    fn_1FF45
        jae     br_1FF0A
        retf
br_1FF0A:
        mov     si, 0eh
        DISP_BMP        27h, 16h, 0eh
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "DO IT"
        int     0a4h
        KEY_DOWN        13h, EP_FAR_1FB3E_OFF, EP_FAR_1FB3E_SEG
        KEY_DOWN        16h, EP_FAR_1FB3E_OFF, EP_FAR_1FB3E_SEG
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        KEY_DOWN        14h, L_1FFEA-APP2_CSBASE, APP2_SEG
        else
        KEY_DOWN        14h, (APP2_BASE+L_1FFEA-APP2_SEG*16), APP2_SEG
        endif
        db      0cbh
        else
        KEY_DOWN        14h, EP_L_1FFEA_OFF, APP2_SEG
        retf
        endif
fn_1FF45:
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        je      br_1FF94
        DISP_WIN        1dh, 06h, 0beh, 36h, "Format disk"
        DISP_TEXT       46h, 16h, "THIS WILL ERASE"
        DISP_TEXT       46h, 1fh, "      THE ENTIRE DISK!!"
        db      0f8h
        ret
br_1FF94:
        mov     bl, 11h
        int     91h
        jae     br_1FF9E
        cmp     al, 12h
        je      br_1FFE6
br_1FF9E:
        DISP_WIN        1dh, 06h, 0beh, 36h, "Format F-ROM"
        DISP_TEXT       46h, 16h, "THIS WILL ERASE"
        DISP_TEXT       46h, 1fh, "    THE ENTIRE F-ROM!!"
        clc
        ret
br_1FFE6:
        int     95h
        stc
        ret
L_1FFEA:
        call    fn_1FFEE
        retf
fn_1FFEE:
        mov     bl, 11h
        int     91h
        jae     br_20000
        push    cs
        call    far_1FB3E
        mov     bl, 11h
        int     91h
        cmp     al, 7
        je      br_2001F
br_20000:
        cmp     bl, 0
        jne     L_1FA57
        push    cs
        call    far_1FBB4
        cmp     byte ptr [A2_B_DISK_DEVICE], 0
        je      br_20022
        cmp     byte ptr [A2_B_DISK_DEVICE], 9
        jne     L_1FA54
        jmp     br_201A2
L_1FA54:
        jmp     br_200D0
L_1FA57:
        mov     al, 1
br_2001F:
        int     95h
        ret
br_20022:
        cmp     byte ptr [A2_B_ATAPI_DEVICE], 0
        je      br_2002C
        jmp     br_200D0
br_2002C:
        DISP_TEXT       2ah, 24h, " Formating..........   0%         "
        DISP_FLUSH
        mov     al, byte ptr [G_FLOPPY_TYPE]
        mov     bl, 18h
        int     91h
resume_2005E:
        mov     byte ptr [A2_B_03790], 0
loop_20063:
        mov     bl, 0ch
        int     91h
        jb      br_200A3
        push    ax
        mov     ah, 64h
        mul     ah
        mov     bl, 50h
        div     bl
        sub     ah, ah
        DISP_NUM        0a8h, 24h, 03h
        pop     ax
        push    ax
        call    fn_200B7
        DISP_FLUSH
        pop     ax
        cmp     al, 50h
        jne     loop_20063
        mov     bl, 19h
        int     91h
        jb      br_200A3
resume_2008D:
        call    fn_1BE98
        call    fn_1BE1B
        mov     al, 18h
        jne     br_200A3
        mov     cx, 1f4h
        int     0b6h
        push    cs
        call    far_1FB3E
        int     0a5h
        ret
br_200A3:
        push    ax
        DISP_TEXT       0a8h, 24h, "  0"
        pop     ax
        int     95h
        push    cs
        call    far_1FB3E
        int     0a5h
        ret
fn_200B7:
        add     byte ptr [A2_B_03790], 80h
        jb      br_200C6
        DISP_ERASE      06h, 1eh, 15h, 13h
        db      0c3h
br_200C6:
        mov     si, 0eh
        DISP_BMP        06h, 1eh, 0eh
        ret
br_200D0:
        if      FW_VERSION >= 110
        mov     word ptr [A2_W_DISK_PARTITION], 0
        endif
        call    fn_1BE66
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 5
        je      br_200E8
        cmp     byte ptr [A2_B_DISK_FS_TYPE], 7
        je      br_200E8
        ret
br_200E8:
        mov     bl, 11h
        int     91h
        jae     br_200F0
        if      FW_VERSION >= 110
        jmp     loop_2015D
        else
        jmp     L_1F69A
        endif
br_200F0:
        DISP_TEXT       2ah, 24h, " Formating............             "
        DISP_FLUSH
        DISP_TEXT       2ah, 24h, "THIS WILL ERASE THE WHOLE DISK!!"
        mov     al, byte ptr [A2_B_0376E]
        inc     al
        mov     bl, 0ch
        int     91h
        if      FW_VERSION >= 110
        jb      loop_2015D
        else
        jb      L_1F69A
        endif
        mov     bl, 1
        int     91h
        if      FW_VERSION >= 110
        jb      loop_2015D
        else
        jb      L_1F69A
        cmp     ah, 0bh
        jne     loop_2015D
        endif
        call    fn_1BE98
        push    cs
        call    far_1FB3E
        int     0a5h
        ret
loop_2015D:
        if      FW_VERSION >= 110
        cmp     al, 4
        je      br_2017F
        cmp     al, 35h
        je      br_2017F
        int     95h
        else
        mov     bl, 6
        int     93h
        jb      L_1F6AB
        mov     bl, 0ch
        int     91h
        jb      L_1F6AB
        mov     bl, 1
        int     91h
        jb      L_1F6AB
        cmp     ah, 0bh
        jne     L_1F69A
        endif
        call    fn_1BE98
        push    cs
        call    far_1FB3E
        int     0a5h
        if      FW_VERSION >= 110
        stc
        endif
        ret
        if      FW_VERSION >= 110
loop_20172:
        else
L_1F69A:
        cmp     al, 4
        je      loop_2015D
        endif
        int     95h
        call    fn_1BE98
        push    cs
        call    far_1FB3E
        int     0a5h
        stc
        ret
        if      FW_VERSION >= 110
br_2017F:
        jmp     loop_20172
        mov     bl, 6
        int     93h
        jb      loop_20172
        mov     bl, 0ch
        int     91h
        jb      loop_20172
        mov     bl, 1
        int     91h
        jb      loop_20172
        cmp     ah, 0bh
        jne     loop_2015D
        else
L_1F6AB:
        int     95h
        endif
        call    fn_1BE98
        push    cs
        call    far_1FB3E
        int     0a5h
        if      FW_VERSION < 110
        stc
        endif
        ret
br_201A2:
        cmp     byte ptr [A2_B_DISK_FORMAT], 0dh
        je      br_2021B
        sub     ax, ax
        int     47h
        DISP_TEXT       2ah, 24h, " Formating..........   0%         "
        DISP_FLUSH
        mov     byte ptr [A2_B_03790], 0
        mov     ax, 0
loop_201E0:
        push    ax
        mov     bl, 0ch
        int     91h
        pop     ax
        call    far_20202
        inc     al
        cmp     al, 80h
        jne     loop_201E0
        mov     cx, 1f4h
        int     0b6h
        mov     bl, 19h
        int     91h
loop_201F8:
        call    fn_1BE98
        push    cs
        call    far_1FB3E
        int     0a5h
        ret
far_20202:
        push    ax
        mov     bl, 64h
        mul     bl
        mov     cl, 7fh
        div     cl
        mov     ah, 0
        DISP_NUM        0a8h, 24h, 03h
        call    fn_200B7
        DISP_FLUSH
        db      58h, 0c3h
br_2021B:
        DISP_MSG        "        No F-ROM !!      "
        mov     cx, 1f4h
        int     0b6h
        DISP_PLANE0
        jmp     loop_201F8
far_20242:
        call    fn_20246
        retf
fn_20246:
        mov     word ptr [A2_W_SMF_SAVED_SP], sp
        mov     word ptr [A2_W_SMF_NOTE_TBL_SEG], ax
        mov     word ptr [A2_W_SMF_SEQ_SEG], cx
        mov     bp, bx
        mov     word ptr [A2_W_SMF_BAR_LEN], 180h
        mov     word ptr [P_379F], 60h
        mov     word ptr [P_37A1], 4b0h
        mov     byte ptr [A2_B_SMF_TIMESIG_NUM], 4
        mov     byte ptr [A2_B_037A4], 4
        mov     byte ptr [A2_B_0379C], 60h
        mov     word ptr [A2_W_SMF_BAR_TICK_LO], 0
        mov     word ptr [A2_W_SMF_BAR_TICK_HI], 0
        mov     word ptr [A2_W_SMF_TICK_LO], 0
        mov     word ptr [A2_W_SMF_TICK_HI], 0
        mov     word ptr [A2_W_SMF_BAR_COUNT], 0
        mov     byte ptr [A2_B_037B4], 0
        mov     byte ptr [A2_B_037B5], 0
        mov     word ptr [A2_W_SMF_RESCALE_REM], 0
        mov     byte ptr [A2_B_037B6], 0
        mov     word ptr [A2_W_SMF_TEMPO_PTR], 700h
        mov     word ptr [A2_W_SMF_BAR_PTR], 1500h
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     byte ptr es:[18h], 4
        mov     byte ptr es:[19h], 4
        mov     byte ptr es:[13h], 1
        mov     word ptr es:[14h], 0
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     di, 700h
        sub     ax, ax
        mov     cx, 700h
        rep stosw
        mov     di, 1500h
        sub     ax, ax
        mov     cx, 7d0h
        rep stosw
        mov     es, word ptr [A2_W_SMF_NOTE_TBL_SEG]
        sub     di, di
        mov     cx, 4100h
        sub     ax, ax
        rep stosw
        mov     ax, ds
        mov     es, ax
        mov     di, A2_TBL_SMF_TRACK_USED
        mov     cx, 40h
        mov     al, 0
        rep stosb
        sub     si, si
        call    fn_210B3
        cmp     bx, 4d54h
        je      br_20311
        jmp     loop_20682
br_20311:
        cmp     ax, 6864h
        je      br_20319
        jmp     loop_20682
br_20319:
        call    fn_210B3
        call    fn_2109D
        cmp     ax, 2
        jb      br_20327
        jmp     loop_20682
br_20327:
        mov     byte ptr [A2_B_SMF_FORMAT], al
        call    fn_2109D
        cmp     ax, 41h
        jb      br_20335
        mov     ax, 41h
br_20335:
        mov     byte ptr [A2_B_SMF_TRACK_COUNT], al
        call    fn_2109D
        test    ah, 80h
        je      br_20343
        mov     ax, 60h
br_20343:
        mov     word ptr [A2_W_SMF_DIVISION], ax
        mov     di, P_3817
        sub     cl, cl
loop_2034B:
        call    fn_210B3
        cmp     bx, 4d54h
        je      br_20357
        jmp     loop_20682
br_20357:
        cmp     ax, 726bh
        je      br_2035F
        jmp     loop_20682
br_2035F:
        call    fn_210B3
        mov     byte ptr [di+4], 0
        mov     byte ptr [di+5], 0
        mov     byte ptr [di+0bh], 0ffh
        mov     byte ptr [di+0ch], 0
        mov     word ptr [di+6], si
        mov     word ptr [di+8], bp
        mov     ch, cl
        sub     ch, 1
        jae     br_20385
        mov     ch, byte ptr [A2_B_SMF_TRACK_COUNT]
        dec     ch
br_20385:
        mov     byte ptr [di+0ah], ch
        add     di, 0dh
        push    cx
        sub     dx, dx
        mov     cx, 4
tgt_20391:
        shl     bp, 1
        rcl     dx, 1
        loop    tgt_20391
        add     bp, si
        adc     dx, 0
        add     ax, bp
        adc     bx, dx
        mov     si, ax
        shl     bx, 0ch
        mov     bp, bx
        pop     cx
        inc     cl
        cmp     cl, byte ptr [A2_B_SMF_TRACK_COUNT]
        jne     loop_2034B
        call    fn_20B48
        mov     dx, word ptr [A2_W_SMF_SEQ_SEG]
        mov     di, 2800h
        mov     cl, byte ptr [A2_B_SMF_TRACK_COUNT]
        mov     bx, P_3817
loop_203C1:
        mov     si, word ptr [bx+6]
        mov     bp, word ptr [bx+8]
        push    cx
        push    bx
        call    fn_20694
        pop     bx
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], cx
        mov     word ptr [bx+6], si
        mov     word ptr [bx+8], bp
        add     bx, 0dh
        pop     cx
        dec     cl
        jne     loop_203C1
        mov     word ptr [A2_W_SMF_NEXT_DELTA_LO], 0
        mov     word ptr [A2_W_SMF_NEXT_DELTA_HI], 0
loop_203EC:
        mov     byte ptr [A2_B_SMF_TRACKS_ENDED], 0
        push    dx
        mov     ax, word ptr [A2_W_SMF_NEXT_DELTA_LO]
        mov     dx, word ptr [A2_W_SMF_NEXT_DELTA_HI]
        mov     word ptr [A2_W_SMF_STEP_DELTA_LO], ax
        mov     word ptr [P_3800], dx
        mov     word ptr [A2_W_SMF_NEXT_DELTA_LO], 0ffffh
        mov     word ptr [A2_W_SMF_NEXT_DELTA_HI], 0ffffh
        call    midi_import_ticks_rescale
        add     word ptr [A2_W_SMF_TICK_LO], ax
        adc     word ptr [A2_W_SMF_TICK_HI], dx
        pop     dx
loop_20418:
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     bx, word ptr [A2_W_SMF_TICK_HI]
        sub     ax, word ptr [A2_W_SMF_BAR_TICK_LO]
        sbb     bx, word ptr [A2_W_SMF_BAR_TICK_HI]
        jb      br_2043B
        call    fn_20B48
        inc     word ptr [A2_W_SMF_BAR_COUNT]
        cmp     word ptr [A2_W_SMF_BAR_COUNT], 3e6h
        jb      loop_20418
        jmp     loop_204D4
br_2043B:
        mov     byte ptr [A2_B_SMF_TRACK_INDEX], 0
        mov     bx, P_3817
loop_20443:
        mov     word ptr [A2_W_SMF_TRACK_PTR], bx
        cmp     byte ptr [bx+5], 0
        je      br_2045C
        inc     byte ptr [A2_B_SMF_TRACKS_ENDED]
        mov     al, byte ptr [A2_B_SMF_TRACKS_ENDED]
        cmp     al, byte ptr [A2_B_SMF_TRACK_COUNT]
        jne     br_204BA
        jmp     loop_204D4
br_2045C:
        mov     ax, word ptr [bx]
        mov     cx, word ptr [bx+2]
        sub     ax, word ptr [A2_W_SMF_STEP_DELTA_LO]
        sbb     cx, word ptr [P_3800]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], cx
        mov     si, ax
        or      si, cx
        jne     br_204A3
        mov     si, word ptr [bx+6]
        mov     bp, word ptr [bx+8]
loop_2047A:
        call    fn_20712
        sub     ax, ax
        sub     cx, cx
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        cmp     byte ptr [bx+5], 0
        jne     br_20498
        call    fn_20694
        mov     bx, ax
        or      bx, cx
        je      loop_2047A
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
br_20498:
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], cx
        mov     word ptr [bx+6], si
        mov     word ptr [bx+8], bp
br_204A3:
        push    dx
        mov     bx, ax
        mov     dx, cx
        sub     bx, word ptr [A2_W_SMF_NEXT_DELTA_LO]
        sbb     dx, word ptr [A2_W_SMF_NEXT_DELTA_HI]
        jae     br_204B9
        mov     word ptr [A2_W_SMF_NEXT_DELTA_LO], ax
        mov     word ptr [A2_W_SMF_NEXT_DELTA_HI], cx
br_204B9:
        pop     dx
br_204BA:
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        add     bx, 0dh
        inc     byte ptr [A2_B_SMF_TRACK_INDEX]
        mov     al, byte ptr [A2_B_SMF_TRACK_INDEX]
        cmp     al, byte ptr [A2_B_SMF_TRACK_COUNT]
        je      br_204D1
        jmp     loop_20443
br_204D1:
        jmp     loop_203EC
loop_204D4:
        mov     sp, word ptr [A2_W_SMF_SAVED_SP]
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     bx, word ptr [A2_W_SMF_TICK_HI]
        add     ax, word ptr [A2_W_SMF_BAR_LEN]
        adc     bx, 0
        sub     ax, word ptr [A2_W_SMF_BAR_TICK_LO]
        sbb     bx, word ptr [A2_W_SMF_BAR_TICK_HI]
        or      ax, bx
        je      br_20507
        mov     ax, word ptr [A2_W_SMF_BAR_TICK_LO]
        mov     bx, word ptr [A2_W_SMF_BAR_TICK_HI]
        mov     word ptr [A2_W_SMF_TICK_LO], ax
        mov     word ptr [A2_W_SMF_TICK_HI], bx
        call    fn_20B48
        inc     word ptr [A2_W_SMF_BAR_COUNT]
br_20507:
        mov     ax, dx
        mov     si, di
        sub     si, 8
        jae     br_20513
        sub     ax, 1000h
br_20513:
        mov     es, ax
        mov     ax, word ptr es:[si]
        mov     bl, byte ptr es:[si+2]
        and     bx, 0fh
        sub     ax, word ptr [A2_W_SMF_TICK_LO]
        sbb     bx, word ptr [A2_W_SMF_TICK_HI]
        or      ax, bx
        jne     br_20540
        mov     ax, word ptr [A2_W_SMF_BAR_TICK_LO]
        mov     bx, word ptr [A2_W_SMF_BAR_TICK_HI]
        mov     word ptr [A2_W_SMF_TICK_LO], ax
        mov     word ptr [A2_W_SMF_TICK_HI], bx
        call    fn_20B48
        inc     word ptr [A2_W_SMF_BAR_COUNT]
br_20540:
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     si, word ptr [A2_W_SMF_BAR_PTR]
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     bx, word ptr [A2_W_SMF_TICK_HI]
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], bx
        mov     word ptr es:[1ch], ax
        mov     word ptr es:[1eh], bx
        mov     si, word ptr [A2_W_SMF_TEMPO_PTR]
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], bx
        mov     word ptr es:[si], 3e8h
        mov     ax, word ptr [A2_W_SMF_BAR_COUNT]
        mov     word ptr es:[1ah], ax
        mov     es, dx
        mov     ax, 0ffffh
        mov     cx, 4
        rep stosw
        test    di, 0fh
        je      br_2058C
        mov     cx, 4
        rep stosw
br_2058C:
        shr     di, 4
        mov     ax, es
        add     ax, di
        sub     ax, word ptr [A2_W_SMF_SEQ_SEG]
        sub     ax, 280h
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     word ptr es:[10h], ax
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     di, 180h
        mov     bx, A2_TBL_SMF_TRACK_USED
        mov     si, 680h
        mov     cx, 40h
tgt_205B2:
        cmp     byte ptr [bx], 0
        je      br_205C2
        or      byte ptr es:[si], 1
        cmp     byte ptr [A2_B_SMF_FORMAT], 0
        jne     br_205C2
        if      FW_VERSION < 110
        pusha
        mov     ax, 41h
        sub     ax, cx
        mov     si, 38d7h
        mov     cx, 6
        rep movsb
        mov     cl, 0ah
        div     cl
        or      ax, 3030h
        mov     word ptr es:[di], ax
        popa
        endif
br_205C2:
        inc     si
        inc     bx
        add     di, 10h
        loop    tgt_205B2
        cmp     byte ptr [A2_B_SMF_FORMAT], 0
        jne     br_20607
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     ax, 0ffffh
        mov     word ptr es:[32h], ax
        sub     ax, ax
        mov     word ptr es:[30h], ax
        mov     byte ptr es:[34h], al
        mov     di, 580h
        mov     si, 5c0h
        mov     al, 1
loop_205ED:
        stosb
        mov     byte ptr es:[si], 0
        inc     si
        inc     al
        cmp     al, 11h
        jne     loop_205ED
        mov     byte ptr es:[5c9h], 1
        mov     byte ptr es:[590h], 1
loop_20605:
        clc
        ret
br_20607:
        cmp     byte ptr [A2_B_037B6], 0
        jne     br_20651
        mov     si, P_3817
        sub     bx, bx
        sub     cx, cx
        mov     cl, byte ptr [A2_B_SMF_TRACK_COUNT]
tgt_20619:
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     bl, byte ptr [si+0ah]
        mov     al, byte ptr [si+4]
        and     al, 0fh
        mov     byte ptr es:[bx+580h], al
        inc     byte ptr es:[bx+580h]
        cmp     al, 9
        jne     br_20639
        mov     byte ptr es:[bx+5c0h], 1
br_20639:
        add     si, 0dh
        loop    tgt_20619
        mov     ax, 0ffffh
        mov     word ptr es:[32h], ax
        sub     ax, ax
        mov     word ptr es:[30h], ax
        mov     byte ptr es:[34h], al
        jmp     loop_20605
br_20651:
        mov     ax, word ptr es:[1ah]
        dec     ax
        cmp     ax, word ptr es:[30h]
        jae     br_20661
        mov     word ptr es:[30h], ax
br_20661:
        mov     bx, 0ffffh
        cmp     bx, word ptr es:[32h]
        je      br_20677
        cmp     ax, word ptr es:[32h]
        jae     br_20677
        mov     word ptr es:[32h], bx
br_20677:
        jmp     loop_20605
loop_20679:
        mov     sp, word ptr [A2_W_SMF_SAVED_SP]
        mov     ax, 19h
        stc
        ret
loop_20682:
        mov     sp, word ptr [A2_W_SMF_SAVED_SP]
        mov     ax, 0ah
        stc
        ret
loop_2068B:
        mov     sp, word ptr [A2_W_SMF_SAVED_SP]
        mov     ax, 0ah
        stc
        ret
fn_20694:
        sub     bx, bx
        sub     cx, cx
loop_20698:
        mov     cl, bh
        shr     cl, 1
        shl     bx, 7
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_206AF
        add     bp, 1000h
        jne     br_206AF
        jmp     loop_20682
br_206AF:
        mov     ah, al
        and     al, 7fh
        or      bl, al
        test    ah, 80h
        jne     loop_20698
        mov     ax, bx
        ret
midi_import_ticks_rescale:
        cmp     word ptr [A2_W_SMF_DIVISION], 60h
        je      br_206E4
        or      dx, dx
        jne     br_206F2
        mov     dx, 60h
        mul     dx
        add     ax, word ptr [A2_W_SMF_RESCALE_REM]
        adc     dx, 0
        mov     bx, word ptr [A2_W_SMF_DIVISION]
        cmp     dx, bx
        jae     loop_206E5
        div     bx
        mov     word ptr [A2_W_SMF_RESCALE_REM], dx
        sub     dx, dx
br_206E4:
        ret
loop_206E5:
        push    di
        mov     di, bx
        sub     si, si
        int     0b8h
        mov     word ptr [A2_W_SMF_RESCALE_REM], di
        pop     di
        ret
br_206F2:
        push    di
        sub     di, di
        sub     si, si
        mov     cx, 60h
tgt_206FA:
        add     di, ax
        adc     si, dx
        loop    tgt_206FA
        mov     ax, di
        mov     dx, si
        add     ax, word ptr [A2_W_SMF_RESCALE_REM]
        adc     dx, 0
        mov     bx, word ptr [A2_W_SMF_DIVISION]
        pop     di
        jmp     loop_206E5
fn_20712:
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_20723
        add     bp, 1000h
        jne     br_20723
        jmp     loop_20682
br_20723:
        cmp     al, 0ffh
        jne     br_2072A
        jmp     br_20B7D
br_2072A:
        cmp     al, 0f0h
        jne     br_20731
        jmp     br_20935
br_20731:
        cmp     al, 0f7h
        jne     br_20738
        jmp     br_20A75
br_20738:
        cmp     al, 80h
        jae     br_2073E
        jmp     br_20758
br_2073E:
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        mov     byte ptr [bx+4], al
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_20756
        add     bp, 1000h
        jne     br_20756
        jmp     loop_20682
br_20756:
        jmp     br_20758
br_20758:
        mov     cl, al
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        mov     ch, byte ptr [bx+0ah]
        mov     ah, byte ptr [bx+4]
        cmp     byte ptr [A2_B_SMF_FORMAT], 1
        je      br_20770
        mov     ch, ah
        and     ch, 0fh
br_20770:
        mov     byte ptr [A2_B_037BB], ch
        sub     bh, bh
        mov     bl, ch
        mov     byte ptr [bx+A2_TBL_SMF_TRACK_USED], 1
        mov     bl, ah
        shr     bl, 3
        and     bl, 0eh
        jmp     word ptr cs:[bx+TBL_MIDI_STATUS_EVT-APP2_CSBASE]
TBL_MIDI_STATUS_EVT:
        dw      midi_evt_note_off-APP2_CSBASE, midi_evt_note_on-APP2_CSBASE, midi_evt_2data-APP2_CSBASE, midi_evt_2data-APP2_CSBASE
        dw      midi_evt_1data-APP2_CSBASE, midi_evt_1data-APP2_CSBASE, midi_evt_2data-APP2_CSBASE, br_20FED-APP2_CSBASE
midi_evt_note_off:
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_207AB
        add     bp, 1000h
        jne     br_207AB
        jmp     loop_20682
br_207AB:
        mov     bx, cx
        shl     bl, 1
        shl     bx, 1
        mov     es, word ptr [A2_W_SMF_NOTE_TBL_SEG]
        push    si
        mov     si, bx
        mov     bh, cl
        mov     bl, al
        mov     ax, word ptr es:[si]
        mov     cx, word ptr es:[si+2]
        mov     word ptr es:[si], 0
        mov     word ptr es:[si+2], 0
        pop     si
        cmp     cx, 0
        je      br_207FD
fn_207D4:
        mov     es, cx
        mov     bx, ax
        mov     cx, word ptr es:[bx]
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        sub     ax, cx
        cmp     ax, 270fh
        jb      br_207E8
        mov     ax, 270fh
br_207E8:
        mov     byte ptr es:[bx+5], al
        mov     al, 0
        shr     ax, 2
        shl     ah, 4
        or      byte ptr es:[bx+3], al
        or      byte ptr es:[bx+2], ah
        ret
br_207FD:
        cmp     byte ptr [A2_B_037B6], 0
        jne     br_20805
        ret
br_20805:
        mov     ax, bx
        and     ah, 3
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        mov     byte ptr [bx+0bh], ah
        mov     byte ptr [bx+0ch], al
        ret
midi_evt_note_on:
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_20826
        add     bp, 1000h
        jne     br_20826
        jmp     loop_20682
br_20826:
        or      al, al
        jne     br_2082C
        jmp     br_2089D
br_2082C:
        mov     es, dx
        mov     byte ptr es:[di+4], cl
        mov     byte ptr es:[di+6], al
        mov     byte ptr es:[di+3], ch
        mov     byte ptr es:[di+7], 40h
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     bx, word ptr [A2_W_SMF_TICK_HI]
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], bl
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        cmp     byte ptr [bx+0bh], 0ffh
        je      br_20875
        mov     ah, byte ptr [bx+0bh]
        mov     al, byte ptr [bx+0ch]
        shl     al, 1
        shr     ax, 1
        mov     byte ptr es:[di+7], al
        mov     al, byte ptr es:[di+6]
        shl     al, 1
        shr     ax, 1
        mov     byte ptr [bx+0bh], 0ffh
        mov     byte ptr es:[di+6], al
br_20875:
        mov     bx, cx
        shl     bl, 1
        shl     bx, 1
        mov     es, word ptr [A2_W_SMF_NOTE_TBL_SEG]
        pusha
        mov     ax, word ptr es:[bx]
        mov     cx, word ptr es:[bx+2]
        or      cx, cx
        je      br_2088E
        call    fn_207D4
br_2088E:
        popa
        mov     es, word ptr [A2_W_SMF_NOTE_TBL_SEG]
        mov     word ptr es:[bx], di
        mov     word ptr es:[bx+2], dx
        jmp     fn_2110A
br_2089D:
        mov     bx, cx
        shl     bl, 1
        shl     bx, 1
        mov     es, word ptr [A2_W_SMF_NOTE_TBL_SEG]
        mov     ax, word ptr es:[bx]
        mov     cx, word ptr es:[bx+2]
        mov     word ptr es:[bx], 0
        mov     word ptr es:[bx+2], 0
        or      cx, cx
        je      br_208C0
        jmp     fn_207D4
br_208C0:
        ret
midi_evt_2data:
        mov     es, dx
        mov     cl, ah
        mov     ah, byte ptr [A2_B_037BB]
        mov     byte ptr es:[di+3], ah
        mov     byte ptr es:[di+5], al
        and     cl, 0f0h
        mov     byte ptr es:[di+4], cl
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     word ptr es:[di], ax
        mov     ax, word ptr [A2_W_SMF_TICK_HI]
        mov     byte ptr es:[di+2], al
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_208F6
        add     bp, 1000h
        jne     br_208F6
        jmp     loop_20682
br_208F6:
        mov     es, dx
        mov     byte ptr es:[di+6], al
        mov     byte ptr es:[di+7], 0
        jmp     fn_2110A
midi_evt_1data:
        mov     es, dx
        mov     cl, ah
        mov     ah, byte ptr [A2_B_037BB]
        mov     byte ptr es:[di+3], ah
        mov     byte ptr es:[di+5], al
        and     cl, 0f0h
        mov     byte ptr es:[di+4], cl
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     word ptr es:[di], ax
        mov     ax, word ptr [A2_W_SMF_TICK_HI]
        mov     byte ptr es:[di+2], al
        mov     byte ptr es:[di+6], 0
        mov     byte ptr es:[di+7], 0
        jmp     fn_2110A
br_20935:
        call    fn_20694
        mov     es, dx
        mov     word ptr [A2_W_SMF_SYSEX_LEFT_LO], ax
        mov     word ptr [A2_W_SMF_SYSEX_LEFT_HI], cx
        mov     word ptr [A2_W_SMF_SYSEX_COUNT_LO], 1
        mov     word ptr [A2_W_SMF_SYSEX_COUNT_HI], 0
        mov     word ptr [A2_FP_03812], di
        mov     word ptr [A2_W_03814], es
        mov     byte ptr [A2_B_SMF_SYSEX_LAST], 0
        call    fn_20A55
        mov     byte ptr es:[di+3], al
        mov     byte ptr es:[di+4], 0f0h
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     word ptr es:[di], ax
        mov     ax, word ptr [A2_W_SMF_TICK_HI]
        mov     byte ptr es:[di+2], al
        call    fn_2110A
        mov     es, dx
        mov     byte ptr es:[di], 0f0h
        inc     di
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        mov     cx, word ptr [A2_W_SMF_SYSEX_LEFT_LO]
        or      cl, byte ptr [A2_W_SMF_SYSEX_LEFT_HI]
        or      cx, cx
        je      br_209C4
loop_2099E:
        mov     es, dx
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        mov     cx, word ptr [A2_W_SMF_SYSEX_LEFT_LO]
        or      cl, byte ptr [A2_W_SMF_SYSEX_LEFT_HI]
        or      cx, cx
        jne     loop_2099E
br_209C4:
        mov     byte ptr es:[di+4], 0f8h
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     word ptr es:[di], ax
        mov     ax, word ptr [A2_W_SMF_TICK_HI]
        mov     byte ptr es:[di+2], al
        call    fn_20A55
        mov     byte ptr es:[di+3], al
        sub     ax, ax
        mov     byte ptr es:[di+5], al
        mov     word ptr es:[di+6], ax
        call    fn_2110A
        push    es
        pusha
        les     di, [A2_FP_03812]
        mov     ax, word ptr [A2_W_SMF_SYSEX_COUNT_LO]
        mov     cl, byte ptr [A2_W_SMF_SYSEX_COUNT_HI]
        mov     word ptr es:[di+5], ax
        mov     byte ptr es:[di+7], cl
        popa
        pop     es
        ret
fn_20A02:
        sub     al, al
        mov     cx, word ptr [A2_W_SMF_SYSEX_LEFT_LO]
        or      cl, byte ptr [A2_W_SMF_SYSEX_LEFT_HI]
        or      cx, cx
        je      loop_20A3C
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_20A21
        add     bp, 1000h
        jne     br_20A21
        jmp     loop_20682
br_20A21:
        sub     word ptr [A2_W_SMF_SYSEX_LEFT_LO], 1
        sbb     word ptr [A2_W_SMF_SYSEX_LEFT_HI], 0
        cmp     byte ptr [A2_B_SMF_SYSEX_LAST], 0f7h
        je      br_20A51
        add     word ptr [A2_W_SMF_SYSEX_COUNT_LO], 1
        adc     word ptr [A2_W_SMF_SYSEX_COUNT_HI], 0
loop_20A3C:
        mov     es, dx
        mov     byte ptr es:[di], al
        inc     di
        jne     br_20A48
        add     dx, 1000h
br_20A48:
        cmp     al, 0f7h
        je      br_20A4D
        ret
br_20A4D:
        mov     byte ptr [A2_B_SMF_SYSEX_LAST], al
        ret
br_20A51:
        mov     al, 0
        jmp     loop_20A3C
fn_20A55:
        cmp     byte ptr [A2_B_SMF_FORMAT], 0
        jne     br_20A64
        mov     al, 10h
        mov     byte ptr [P_37CC], 1
        ret
br_20A64:
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        mov     al, byte ptr [bx+0ah]
        mov     bl, al
        sub     bh, bh
        mov     byte ptr [bx+A2_TBL_SMF_TRACK_USED], 1
        ret
br_20A75:
        call    fn_20694
        mov     es, dx
        mov     word ptr [A2_W_SMF_SYSEX_LEFT_LO], ax
        mov     word ptr [A2_W_SMF_SYSEX_LEFT_HI], cx
        mov     word ptr [A2_W_SMF_SYSEX_COUNT_LO], 0
        mov     word ptr [A2_W_SMF_SYSEX_COUNT_HI], 0
        mov     word ptr [A2_FP_03812], di
        mov     word ptr [A2_W_03814], es
        mov     byte ptr [A2_B_SMF_SYSEX_LAST], 0
        call    fn_20A55
        mov     byte ptr es:[di+3], al
        mov     byte ptr es:[di+4], 0f0h
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     word ptr es:[di], ax
        mov     ax, word ptr [A2_W_SMF_TICK_HI]
        mov     byte ptr es:[di+2], al
        call    fn_2110A
        mov     es, dx
        mov     byte ptr es:[di], 0f7h
        inc     di
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        mov     cx, word ptr [A2_W_SMF_SYSEX_LEFT_LO]
        or      cl, byte ptr [A2_W_SMF_SYSEX_LEFT_HI]
        or      cx, cx
        je      br_20B04
loop_20ADE:
        mov     es, dx
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        call    fn_20A02
        mov     cx, word ptr [A2_W_SMF_SYSEX_LEFT_LO]
        or      cl, byte ptr [A2_W_SMF_SYSEX_LEFT_HI]
        or      cx, cx
        jne     loop_20ADE
br_20B04:
        mov     byte ptr es:[di+4], 0f8h
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     word ptr es:[di], ax
        mov     ax, word ptr [A2_W_SMF_TICK_HI]
        mov     byte ptr es:[di+2], al
        call    fn_20A55
        mov     byte ptr es:[di+3], al
        sub     ax, ax
        mov     byte ptr es:[di+5], al
        mov     word ptr es:[di+6], ax
        call    fn_2110A
        push    es
        pusha
        les     di, [A2_FP_03812]
        mov     ax, word ptr [A2_W_SMF_SYSEX_COUNT_LO]
        mov     cl, byte ptr [A2_W_SMF_SYSEX_COUNT_HI]
        add     ax, 1
        adc     cl, 0
        mov     word ptr es:[di+5], ax
        mov     byte ptr es:[di+7], cl
        popa
        pop     es
        ret
fn_20B48:
        push    di
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     di, word ptr [A2_W_SMF_BAR_PTR]
        mov     ax, word ptr [A2_W_SMF_BAR_TICK_LO]
        mov     bx, word ptr [A2_W_SMF_BAR_TICK_HI]
        mov     bh, byte ptr [A2_B_0379C]
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], bx
        add     di, 4
        and     bx, 0fh
        mov     word ptr [A2_W_SMF_BAR_PTR], di
        add     ax, word ptr [A2_W_SMF_BAR_LEN]
        adc     bx, 0
        mov     word ptr [A2_W_SMF_BAR_TICK_LO], ax
        mov     word ptr [A2_W_SMF_BAR_TICK_HI], bx
        pop     di
        ret
br_20B7D:
        call    fn_210BA
        pusha
        call    fn_20B8F
        popa
        add     si, cx
        jb      br_20B8A
        ret
br_20B8A:
        add     bp, 1000h
        ret
fn_20B8F:
        cmp     ah, 2fh
        jne     br_20B97
        jmp     br_20FED
br_20B97:
        cmp     cx, 0
        jne     br_20B9D
        ret
br_20B9D:
        cmp     ah, 51h
        jne     br_20BA4
        jmp     br_20BCD
br_20BA4:
        cmp     ah, 58h
        jne     br_20BAC
        jmp     br_20C5F
br_20BAC:
        cmp     ah, 1
        jne     L_205EE
        jmp     br_20E62
L_205EE:
        cmp     ah, 3
        jne     br_20BBC
        jmp     br_20D8E
br_20BBC:
        cmp     ah, 4
        jne     br_20BC4
        jmp     br_21032
br_20BC4:
        cmp     ah, 54h
        jne     br_20BCC
        jmp     br_21000
br_20BCC:
        ret
br_20BCD:
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_20BDE
        add     bp, 1000h
        jne     br_20BDE
        jmp     loop_20682
br_20BDE:
        sub     ah, ah
        mov     bx, ax
        call    fn_2109D
        push    dx
        push    si
        push    di
        push    bp
        push    cx
        mov     si, bx
        mov     di, ax
        mov     dx, 23c3h
        mov     ax, 4600h
        int     0b8h
        pop     cx
        pop     bp
        pop     di
        pop     si
        pop     dx
        cmp     ax, 12ch
        jae     br_20C03
        mov     ax, 12ch
br_20C03:
        cmp     ax, 0bb8h
        jb      br_20C0B
        mov     ax, 0bb8h
br_20C0B:
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        cmp     byte ptr [A2_B_037B4], 0
        jne     br_20C1F
        mov     byte ptr [A2_B_037B4], 1
        mov     word ptr es:[16h], ax
br_20C1F:
        push    dx
        push    cx
        push    si
        mov     bx, 3e8h
        mul     bx
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        cmp     word ptr es:[14h], 0ffh
        je      br_20C5B
        mov     bx, word ptr es:[16h]
        div     bx
        mov     si, word ptr [A2_W_SMF_TEMPO_PTR]
        mov     word ptr es:[si], ax
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     cx, word ptr [A2_W_SMF_TICK_HI]
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], cx
        add     word ptr [A2_W_SMF_TEMPO_PTR], 0eh
        inc     word ptr es:[14h]
br_20C5B:
        pop     si
        pop     cx
        pop     dx
        ret
br_20C5F:
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_20C70
        add     bp, 1000h
        jne     br_20C70
        jmp     loop_20682
br_20C70:
        cmp     al, 20h
        jb      br_20C76
        mov     al, 20h
br_20C76:
        cmp     al, 0
        jne     br_20C7C
        mov     al, 1
br_20C7C:
        mov     byte ptr [A2_B_SMF_TIMESIG_NUM], al
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_20C90
        add     bp, 1000h
        jne     br_20C90
        jmp     loop_20682
br_20C90:
        cmp     al, 6
        jb      br_20C96
        mov     al, 2
br_20C96:
        mov     bl, al
        mov     bh, 0
        mov     ah, byte ptr cs:[bx+TBL_SMF_TS_DENOM-APP2_CSBASE]
        mov     al, byte ptr cs:[bx+TBL_SMF_TS_CLOCKS-APP2_CSBASE]
        mov     byte ptr [A2_B_037A4], ah
        mov     byte ptr [A2_B_0379C], al
        cmp     byte ptr [A2_B_037B5], 0
        jne     br_20CCA
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     al, byte ptr [A2_B_037A4]
        mov     ah, byte ptr [A2_B_SMF_TIMESIG_NUM]
        mov     byte ptr es:[19h], al
        mov     byte ptr es:[18h], al
        mov     byte ptr [A2_B_037B5], 1
br_20CCA:
        mov     al, byte ptr [A2_B_0379C]
        mov     bl, byte ptr [A2_B_SMF_TIMESIG_NUM]
        mul     bl
        mov     bx, word ptr [A2_W_SMF_BAR_LEN]
        sub     word ptr [A2_W_SMF_BAR_TICK_LO], bx
        sbb     word ptr [A2_W_SMF_BAR_TICK_HI], 0
        mov     word ptr [A2_W_SMF_BAR_LEN], ax
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_20CF4
        add     bp, 1000h
        jne     br_20CF4
        jmp     loop_20682
br_20CF4:
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_20D05
        add     bp, 1000h
        jne     br_20D05
        jmp     loop_20682
br_20D05:
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     bx, word ptr [A2_W_SMF_TICK_HI]
        sub     ax, word ptr [A2_W_SMF_BAR_TICK_LO]
        sbb     bx, word ptr [A2_W_SMF_BAR_TICK_HI]
        jb      br_20D1F
        sub     word ptr [A2_W_SMF_BAR_PTR], 4
        call    fn_20B48
        ret
br_20D1F:
        mov     ax, word ptr [A2_W_SMF_BAR_TICK_LO]
        sub     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     cx, ax
        mov     bl, 60h
        div     bl
        cmp     ah, 0
        je      br_20D5F
        mov     bl, 30h
        mov     ax, cx
        div     bl
        cmp     ah, 0
        je      br_20D5F
        mov     bl, 18h
        mov     ax, cx
        div     bl
        cmp     ah, 0
        je      br_20D5F
        mov     bl, 0ch
        mov     ax, cx
        div     bl
        cmp     ah, 0
        je      br_20D5F
        sub     bl, ah
        mov     bh, 0
        add     word ptr [A2_W_SMF_TICK_LO], bx
        adc     word ptr [A2_W_SMF_TICK_LO], 0
br_20D5F:
        push    si
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     si, word ptr [A2_W_SMF_BAR_PTR]
        sub     si, 4
        mov     byte ptr es:[si+3], bl
        pop     si
        mov     ax, word ptr [A2_W_SMF_TICK_LO]
        mov     bx, word ptr [A2_W_SMF_TICK_HI]
        mov     word ptr [A2_W_SMF_BAR_TICK_LO], ax
        mov     word ptr [A2_W_SMF_BAR_TICK_HI], bx
        call    fn_20B48
        ret
TBL_SMF_TS_DENOM:
        db      04h, 04h, 04h, 08h, 10h, 20h
TBL_SMF_TS_CLOCKS:
        db      60h, 60h, 60h, 30h, 18h, 0ch
br_20D8E:
        cmp     byte ptr [A2_B_SMF_FORMAT], 1
        je      br_20D96
        ret
br_20D96:
        cmp     byte ptr [A2_B_SMF_TRACK_INDEX], 0
        je      br_20DF1
        cmp     cx, 10h
        jb      br_20DA5
        mov     cx, 10h
br_20DA5:
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        cmp     byte ptr [A2_B_037B6], 0
        je      br_20DC1
        push    es
        pusha
        add     si, 1fh
        call    parse_hex_byte
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        mov     byte ptr [bx+0ah], al
        popa
        pop     es
br_20DC1:
        mov     al, byte ptr [bx+0ah]
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     ah, 10h
        mul     ah
        add     ax, 180h
        mov     di, ax
        push    cx
        push    di
        mov     al, 20h
        mov     cx, 10h
        rep stosb
        pop     di
        pop     cx
        push    ds
        mov     ds, bp
tgt_20DDF:
        lodsb
        cmp     al, 20h
        jae     br_20DE6
        mov     al, 2ah
br_20DE6:
        cmp     al, 7dh
        jbe     br_20DEC
        mov     al, 2ah
br_20DEC:
        stosb
        loop    tgt_20DDF
        pop     ds
        ret
br_20DF1:
        push    cx
        call    fn_21076
        db      "MPC2000", 00h
        pop     cx
        jae     br_20E01
        ret
br_20E01:
        mov     byte ptr [A2_B_037B6], 1
        push    cx
        call    fn_21076
        db      "MPC2000XL", 00h
        pop     cx
        jb      br_20E1C
        mov     byte ptr [A2_B_037B6], 2
br_20E1C:
        cmp     cx, 20h
        jae     br_20E22
        ret
br_20E22:
        add     si, 10h
        push    es
        push    ds
        mov     ax, es
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     di, 0
        mov     ds, ax
        mov     cx, 10h
tgt_20E35:
        lodsb
        cmp     al, 61h
        jb      br_20E40
        cmp     al, 7ah
        ja      br_20E40
        sub     al, 20h
br_20E40:
        cmp     al, byte ptr es:[di]
        jne     br_20E5F
        inc     di
        loop    tgt_20E35
        mov     cx, 10h
        sub     di, cx
        sub     si, cx
tgt_20E4F:
        lodsb
        cmp     al, 20h
        jae     br_20E56
        mov     al, 20h
br_20E56:
        cmp     al, 7dh
        jbe     br_20E5C
        mov     al, 20h
br_20E5C:
        stosb
        loop    tgt_20E4F
br_20E5F:
        pop     ds
        pop     es
        ret
br_20E62:
        cmp     byte ptr [A2_B_037B6], 0
        jne     br_20E6A
        ret
br_20E6A:
        call    fn_21076
        db      "LOOP=", 00h
        jb      br_20E78
        jmp     br_20F46
br_20E78:
        call    fn_21076
        db      "TRACK DATA:", 00h
        jae     br_20E8A
        ret
br_20E8A:
        add     si, 0bh
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        call    parse_hex_byte
        mov     byte ptr [bx+0ah], al
        mov     bl, al
        sub     bh, bh
        mov     word ptr [A2_W_SMF_TRACK_INDEX], bx
        call    parse_hex_byte
        push    ax
        call    parse_hex_byte
        push    ax
        call    parse_hex_byte
        push    ax
        call    parse_hex_byte
        mov     cl, al
        cmp     byte ptr [A2_B_037B6], 2
        jne     br_20EB9
        jmp     SHORT br_20F11
br_20EB9:
        pop     ax
        mov     ch, al
        pop     ax
        mov     dl, al
        pop     ax
        mov     dh, al
        mov     word ptr [A2_W_SMF_TRACK_INDEX], bx
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     byte ptr es:[bx+600h], dl
        mov     byte ptr es:[bx+640h], ch
        mov     al, 0
        test    dh, 20h
        je      br_20EE1
        mov     al, dh
        and     al, 1fh
        inc     al
br_20EE1:
        mov     byte ptr es:[bx+580h], al
        mov     al, 0
        test    dh, 40h
        je      br_20EEF
        mov     al, 1
br_20EEF:
        mov     byte ptr es:[bx+5c0h], al
        mov     al, 0
        test    dh, 80h
        je      br_20EFD
        or      al, 2
br_20EFD:
        test    cl, 1
        je      br_20F04
        or      al, 1
br_20F04:
        test    cl, 2
        je      br_20F0B
        or      al, 4
br_20F0B:
        mov     byte ptr es:[bx+680h], al
        ret
br_20F11:
        call    parse_hex_byte
        call    parse_hex_byte
        push    ax
        call    parse_hex_byte
        push    ax
        call    parse_hex_byte
        mov     bx, word ptr [A2_W_SMF_TRACK_INDEX]
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     byte ptr es:[bx+680h], al
        pop     ax
        mov     byte ptr es:[bx+5c0h], al
        pop     ax
        mov     byte ptr es:[bx+580h], al
        pop     ax
        mov     byte ptr es:[bx+640h], al
        pop     ax
        mov     byte ptr es:[bx+600h], al
        pop     ax
        ret
br_20F46:
        push    es
        push    si
        mov     al, 0
        cmp     word ptr es:[si+6], 204eh
        jne     br_20F54
        mov     al, 1
br_20F54:
        push    ax
        add     si, 0fh
        call    fn_20F99
        push    ax
        add     si, 8
        call    fn_21076
        db      "END", 00h
        jb      br_20F6D
        mov     ax, 0ffffh
        jmp     SHORT br_20F70
br_20F6D:
        call    fn_20F99
br_20F70:
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     word ptr es:[32h], ax
        pop     ax
        mov     word ptr es:[30h], ax
        pop     ax
        mov     byte ptr es:[34h], al
        pop     si
        pop     es
        mov     al, 0
        cmp     word ptr es:[si+22h], 204eh
        jne     br_20F90
        mov     al, 1
br_20F90:
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     byte ptr es:[13h], al
        ret
fn_20F99:
        mov     al, byte ptr es:[si]
        and     al, 0fh
        mov     ah, 64h
        mul     ah
        mov     bx, ax
        mov     al, byte ptr es:[si+1]
        and     al, 0fh
        mov     ah, 0ah
        mul     ah
        add     bx, ax
        mov     al, byte ptr es:[si+2]
        and     ax, 0fh
        add     ax, bx
        ret
parse_hex_byte:
        call    parse_hex_digit
        mov     ah, al
        call    parse_hex_digit
        shl     ah, 4
        or      al, ah
        ret
parse_hex_digit:
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_20FD7
        push    ax
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        pop     ax
br_20FD7:
        sub     al, 30h
        jb      br_20FEA
        cmp     al, 0ah
        jb      L_20A23
        sub     al, 11h
        jb      br_20FEA
        add     al, 0ah
        cmp     al, 10h
        jae     br_20FEA
L_20A23:
        ret
        if      FW_VERSION <> 110
br_20FEA:
        else
BR_20FEA:
        endif
        mov     al, 0
        ret
br_20FED:
        cmp     byte ptr [A2_B_SMF_FORMAT], 0
        jne     br_20FF7
        jmp     loop_204D4
br_20FF7:
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        mov     byte ptr [bx+5], 1
        ret
br_21000:
        mov     al, byte ptr es:[si]
        mov     ah, byte ptr es:[si+1]
        mov     bl, byte ptr es:[si+2]
        mov     bh, byte ptr es:[si+3]
        mov     cl, byte ptr es:[si+4]
        push    es
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     byte ptr es:[35h], al
        mov     byte ptr es:[36h], ah
        mov     byte ptr es:[37h], bl
        mov     byte ptr es:[38h], bh
        mov     byte ptr es:[39h], cl
        pop     es
        ret
br_21032:
        cmp     byte ptr [A2_B_SMF_FORMAT], 1
        je      br_2103A
        ret
br_2103A:
        cmp     cx, 8
        jb      br_21042
        mov     cx, 8
br_21042:
        mov     bx, word ptr [A2_W_SMF_TRACK_PTR]
        mov     bl, byte ptr [bx+0ah]
        mov     bh, 0
        push    es
        mov     es, word ptr [A2_W_SMF_SEQ_SEG]
        mov     bl, byte ptr es:[bx+580h]
        cmp     bl, 0
        je      br_21074
        shl     bx, 3
        add     bx, 78h
        mov     ax, si
        shr     ax, 4
        add     ax, bp
        and     si, 0fh
        push    di
        push    ds
        mov     ds, ax
        mov     di, bx
        rep movsb
        pop     ds
        pop     di
br_21074:
        pop     es
        ret
fn_21076:
        pop     bp
        mov     bx, si
loop_21079:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      br_21098
        mov     ah, byte ptr es:[si]
        inc     si
        cmp     ah, al
        je      loop_21079
loop_2108A:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     loop_2108A
        mov     si, bx
        stc
        jmp     bp
br_21098:
        mov     si, bx
        clc
        jmp     bp
fn_2109D:
        mov     es, bp
        mov     ax, word ptr es:[si]
        xchg    al, ah
        add     si, 2
        jae     br_210B2
        add     bp, 1000h
        jne     br_210B2
        jmp     loop_20682
br_210B2:
        ret
fn_210B3:
        call    fn_2109D
        mov     bx, ax
        jmp     fn_2109D
fn_210BA:
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_210CB
        add     bp, 1000h
        jne     br_210CB
        jmp     loop_20682
br_210CB:
        mov     bh, al
        mov     ah, 0
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_210E0
        add     bp, 1000h
        jne     br_210E0
        jmp     loop_20682
br_210E0:
        cmp     al, 80h
        jb      br_21105
        mov     ah, al
        and     ah, 7fh
        mov     es, bp
        mov     al, byte ptr es:[si]
        inc     si
        jne     br_210FA
        add     bp, 1000h
        jne     br_210FA
        jmp     loop_20682
br_210FA:
        cmp     al, 80h
        jb      br_21101
        jmp     loop_2068B
br_21101:
        shl     al, 1
        shr     ax, 1
br_21105:
        mov     cx, ax
        mov     ah, bh
        ret
fn_2110A:
        add     di, 8
        jae     br_2111C
        add     dx, 1000h
        cmp     dx, 0e000h
        jb      br_2111C
        jmp     loop_20679
br_2111C:
        ret
        if      FW_VERSION >= 110
        db      00h
        endif
X_2111E:
        mov     byte ptr [A2_B_03ED5], al
        dec     al
        mov     byte ptr [P_3B70], al
        mov     word ptr [A2_W_SMFW_SEQ_SEG], bx
        mov     word ptr [A2_W_03B60], si
        mov     word ptr [A2_W_03B62], es
        push    ds
        mov     ax, ds
        mov     es, ax
        mov     ds, dx
        mov     si, di
        mov     di, SMF_SEQ_NAME_TEXT
        mov     cx, 10h
        rep movsb
        pop     ds
        mov     bx, P_67C1
        cmp     byte ptr [A2_B_03ED5], 0
        je      br_21151
        mov     bx, P_67F9
br_21151:
        call    bx
        mov     ax, word ptr [A2_W_03B6A]
        mov     dx, word ptr [A2_W_03B6C]
        sub     dx, 3800h
        mov     cx, 4
        mov     bx, dx
        sub     dx, dx
tgt_21165:
        shl     bx, 1
        rcl     dx, 1
        loop    tgt_21165
        add     ax, bx
        adc     dx, 0
        retf
d_p_67c1:
        mov     es, word ptr [A2_W_SMFW_SEQ_SEG]
        mov     bx, 0
        mov     cx, 40h
        mov     di, P_3B72
tgt_2117E:
        mov     al, byte ptr es:[bx+580h]
        sub     al, 1
        jae     br_21192
        mov     al, byte ptr es:[bx+5c0h]
        sub     al, 1
        jb      br_21192
        mov     al, 9
br_21192:
        and     al, 0fh
        mov     byte ptr [di], al
        inc     bx
        inc     di
        loop    tgt_2117E
        mov     byte ptr [A2_B_03ED7], 1
        call    fn_21230
        mov     ax, P_6B68
        call    fn_212CC
        ret
d_p_67f9:
        mov     es, word ptr [A2_W_SMFW_SEQ_SEG]
        mov     si, 680h
        mov     al, 0
        mov     cx, 40h
tgt_211B5:
        test    byte ptr es:[si], 1
        je      br_211BD
        inc     al
br_211BD:
        inc     si
        loop    tgt_211B5
        inc     al
        mov     byte ptr [A2_B_03ED7], al
        call    fn_21230
        mov     ax, P_6B1B
        call    fn_212CC
        mov     byte ptr [A2_B_03B6E], 0
loop_211D3:
        mov     es, word ptr [A2_W_SMFW_SEQ_SEG]
        mov     bl, byte ptr [A2_B_03B6E]
        sub     bh, bh
        mov     al, byte ptr es:[bx+580h]
        sub     al, 1
        jae     br_211E8
        mov     al, 0
br_211E8:
        and     al, 0fh
        mov     byte ptr [A2_B_03B6F], al
        test    byte ptr es:[bx+680h], 1
        je      br_21224
        mov     word ptr [A2_W_03BC4], P_3BCC
        mov     word ptr [A2_W_03BC6], 0ffffh
        mov     word ptr [A2_W_03BC8], 0ffffh
        mov     di, word ptr [A2_W_03B6A]
        mov     dx, word ptr [A2_W_03B6C]
        push    di
        push    dx
        add     di, 4ch
        call    fn_21518
        mov     word ptr [A2_W_03B6A], di
        mov     word ptr [A2_W_03B6C], dx
        pop     es
        pop     di
        call    fn_2138D
br_21224:
        inc     byte ptr [A2_B_03B6E]
        cmp     byte ptr [A2_B_03B6E], 40h
        jne     loop_211D3
        ret
fn_21230:
        mov     es, word ptr [A2_W_SMFW_SEQ_SEG]
        mov     di, word ptr es:[16h]
        sub     si, si
        mov     dx, 23c3h
        mov     ax, 4600h
        int     0b8h
        mov     byte ptr [A2_B_03F32], dl
        mov     byte ptr [A2_B_03F33], ah
        mov     byte ptr [A2_B_03F34], al
        mov     ax, 4646h
        cmp     byte ptr es:[34h], 0
        je      br_2125C
        mov     ax, 204eh
br_2125C:
        mov     word ptr [SMF_LOOP_ONOFF_TEXT], ax
        mov     ax, word ptr es:[30h]
        call    format_decimal3_ascii
        mov     byte ptr [SMF_LOOP_START_TEXT], bh
        mov     byte ptr [P_3F1A], al
        mov     byte ptr [P_3F1B], ah
        mov     ax, word ptr es:[32h]
        mov     byte ptr [A2_B_03F21], 45h
        mov     byte ptr [A2_B_03F22], 4eh
        mov     byte ptr [A2_B_03F23], 44h
        cmp     ax, 0ffffh
        je      br_21297
        call    format_decimal3_ascii
        mov     byte ptr [A2_B_03F21], bh
        mov     byte ptr [A2_B_03F22], al
        mov     byte ptr [A2_B_03F23], ah
br_21297:
        mov     ax, 4646h
        cmp     byte ptr es:[13h], 0
        je      br_212A5
        mov     ax, 204eh
br_212A5:
        mov     word ptr [SMF_TEMPO_ONOFF_TEXT], ax
        mov     al, byte ptr es:[35h]
        mov     byte ptr [SMF_SMPTE_OFFSET], al
        mov     al, byte ptr es:[36h]
        mov     byte ptr [P_3F3A], al
        mov     al, byte ptr es:[37h]
        mov     byte ptr [P_3F3B], al
        mov     al, byte ptr es:[38h]
        mov     byte ptr [P_3F3C], al
        mov     al, byte ptr es:[39h]
        mov     byte ptr [P_3F3D], al
        ret
fn_212CC:
        push    ax
        mov     word ptr [A2_W_03BC4], P_3BCC
        mov     word ptr [A2_W_03BC6], 0ffffh
        mov     word ptr [A2_W_03BC8], 0ffffh
        mov     word ptr [A2_W_03BB2], 1500h
        mov     word ptr [A2_W_03BBA], 700h
        mov     word ptr [A2_W_03BBE], 3e8h
        mov     word ptr [A2_W_03BB6], 0
        mov     word ptr [A2_W_03BB8], 0
        mov     es, word ptr [A2_W_SMFW_SEQ_SEG]
        mov     ax, word ptr es:[1ah]
        shl     ax, 2
        add     ax, 1500h
        mov     word ptr [A2_W_03BB4], ax
        mov     ax, word ptr es:[14h]
        mov     ah, 0eh
        mul     ah
        add     ax, 700h
        mov     word ptr [A2_W_03BBC], ax
        call    fn_218FB
        call    L_21978
        mov     dx, 3800h
        mov     di, 72h
        pop     bx
        call    bx
        mov     word ptr [A2_W_03B6A], di
        mov     word ptr [A2_W_03B6C], dx
        sub     dx, 3800h
        mov     cx, 4
        mov     bx, dx
        sub     dx, dx
tgt_2133E:
        shl     bx, 1
        rcl     dx, 1
        loop    tgt_2133E
        add     di, bx
        adc     dx, 0
        mov     ax, di
        sub     ax, 16h
        sbb     dx, 0
        mov     byte ptr [SMF_TRK0_LEN], dh
        mov     byte ptr [P_3EDF], dl
        mov     byte ptr [P_3EE0], ah
        mov     byte ptr [P_3EE1], al
        mov     si, SMF_MTHD_TEMPLATE
        mov     cx, 3800h
        mov     es, cx
        sub     di, di
        mov     cx, 72h
        rep movsb
        ret
format_decimal3_ascii:
        cmp     ax, 3e7h
        jb      br_21378
        mov     ax, 3e7h
br_21378:
        mov     bl, 64h
        div     bl
        mov     bh, al
        mov     al, ah
        mov     ah, 0
        mov     bl, 0ah
        div     bl
        or      ax, 3030h
        or      bh, 30h
        ret
fn_2138D:
        push    es
        push    di
        mov     ax, word ptr [A2_W_03B6A]
        mov     bx, word ptr [A2_W_03B6C]
        sub     si, si
        mov     cx, 4
tgt_2139B:
        shl     bx, 1
        rcl     si, 1
        loop    tgt_2139B
        add     ax, bx
        jae     br_213A8
        add     si, 1
br_213A8:
        mov     bx, es
        sub     dx, dx
        mov     cx, 4
tgt_213AF:
        shl     bx, 1
        rcl     dx, 1
        loop    tgt_213AF
        add     bx, di
        jae     br_213BC
        add     dx, 1
br_213BC:
        sub     ax, bx
        sbb     si, dx
        mov     cx, si
        sub     ax, 8
        sbb     cx, 0
        mov     byte ptr [SMF_MTRK_LEN], ch
        mov     byte ptr [P_3F44], cl
        mov     byte ptr [P_3F45], ah
        mov     byte ptr [P_3F46], al
        mov     es, word ptr [A2_W_SMFW_SEQ_SEG]
        mov     bl, byte ptr [A2_B_03B6E]
        mov     bh, 0
        push    bx
        shl     bx, 4
        mov     si, 180h
        add     si, bx
        mov     di, SMF_TRACK_NAME_TEXT
        mov     cx, 10h
tgt_213F0:
        mov     al, byte ptr es:[si]
        inc     si
        mov     byte ptr [di], al
        inc     di
        loop    tgt_213F0
        pop     bx
        mov     al, bl
        call    fn_215D0
        mov     byte ptr [SMF_TRACK_DATA_TEXT], ah
        mov     byte ptr [P_3F6B], al
        mov     al, byte ptr es:[bx+580h]
        call    fn_215D0
        mov     byte ptr [P_3F76], ah
        mov     byte ptr [P_3F77], al
        mov     al, byte ptr es:[bx+5c0h]
        call    fn_215D0
        mov     byte ptr [P_3F78], ah
        mov     byte ptr [P_3F79], al
        mov     al, byte ptr es:[bx+600h]
        call    fn_215D0
        mov     byte ptr [P_3F6E], ah
        mov     byte ptr [P_3F6F], al
        mov     al, byte ptr es:[bx+640h]
        call    fn_215D0
        mov     byte ptr [P_3F70], ah
        mov     byte ptr [P_3F71], al
        mov     al, byte ptr es:[bx+680h]
        call    fn_215D0
        mov     byte ptr [P_3F7A], ah
        mov     byte ptr [P_3F7B], al
        mov     al, 0
        mov     ah, byte ptr es:[bx+580h]
        cmp     ah, 0
        je      br_21463
        dec     ah
        mov     al, ah
        or      al, 20h
br_21463:
        mov     ah, byte ptr es:[bx+5c0h]
        cmp     ah, 0
        je      br_2146F
        or      al, 40h
br_2146F:
        mov     ah, byte ptr es:[bx+680h]
        test    ah, 2
        je      br_2147B
        or      al, 80h
br_2147B:
        push    ax
        call    fn_215D0
        mov     byte ptr [P_3F6C], ah
        mov     byte ptr [P_3F6D], al
        pop     ax
        mov     al, 1
        test    ah, 4
        je      br_21490
        or      al, 2
br_21490:
        call    fn_215D0
        mov     byte ptr [P_3F72], ah
        mov     byte ptr [P_3F73], al
        mov     es, word ptr [A2_W_SMFW_SEQ_SEG]
        mov     bl, byte ptr [A2_B_03B6E]
        mov     bh, 0
        mov     bl, byte ptr es:[bx+580h]
        shl     bx, 3
        mov     si, 78h
        add     si, bx
        mov     di, SMF_INSTR_NAME_TEXT
        mov     cx, 8
tgt_214B7:
        mov     al, byte ptr es:[si]
        inc     si
        mov     byte ptr [di], al
        inc     di
        loop    tgt_214B7
        pop     di
        pop     es
        mov     si, SMF_MTRK_TEMPLATE
        mov     cx, 4ch
        rep movsb
        ret
d_p_6b1b:
        sub     ax, ax
        mov     word ptr [A2_W_03B66], ax
        mov     word ptr [A2_W_03B68], ax
loop_214D3:
        mov     bx, A2_W_03BC6
        cmp     word ptr [bx+2], -1
        je      br_214F5
        call    fn_217D2
        cmp     di, 1000h
        jb      loop_214D3
        sub     di, 1000h
        add     dx, 100h
        cmp     dx, 7f00h
        jb      loop_214D3
        stc
        ret
br_214F5:
        mov     es, word ptr [A2_W_SMFW_SEQ_SEG]
        mov     ax, word ptr es:[1ch]
        mov     cx, word ptr es:[1eh]
        call    fn_217B5
        mov     es, dx
        mov     byte ptr es:[di], 0ffh
        inc     di
        mov     byte ptr es:[di], 2fh
        inc     di
        mov     byte ptr es:[di], 0
        inc     di
        clc
        ret
fn_21518:
        mov     bp, word ptr [A2_W_03B62]
        mov     si, word ptr [A2_W_03B60]
        sub     ax, ax
        mov     byte ptr [A2_B_SMFW_RUNNING_STATUS], al
        mov     word ptr [A2_W_03B66], ax
        mov     word ptr [A2_W_03B68], ax
loop_2152B:
        mov     es, bp
        cmp     byte ptr es:[si+4], 0ffh
        je      br_215A7
        mov     bl, byte ptr es:[si+3]
        and     bx, 3fh
        mov     al, byte ptr [bx+P_3B72]
        cmp     byte ptr [A2_B_03ED5], 0
        je      br_2154F
        mov     al, byte ptr [A2_B_03B6F]
        cmp     bl, byte ptr [A2_B_03B6E]
        jne     br_21581
br_2154F:
        mov     byte ptr [A2_B_03B6F], al
        mov     ax, word ptr es:[si]
        mov     cx, word ptr es:[si+2]
        and     cx, 0fh
        call    fn_217B5
        call    fn_215F9
        add     si, 8
        jae     br_2156B
        add     bp, 1000h
br_2156B:
        cmp     di, 1000h
        jb      loop_2152B
        sub     di, 1000h
        add     dx, 100h
        cmp     dx, 7f00h
        jb      loop_2152B
        stc
        ret
br_21581:
        mov     al, byte ptr es:[si+4]
        add     si, 8
        jae     br_2158E
        add     bp, 1000h
br_2158E:
        cmp     al, 0f0h
        jne     loop_2152B
loop_21592:
        mov     es, bp
        mov     al, byte ptr es:[si+4]
        add     si, 8
        jae     br_215A1
        add     bp, 1000h
br_215A1:
        cmp     al, 0f8h
        jne     loop_21592
        jmp     loop_2152B
br_215A7:
        mov     es, word ptr [A2_W_SMFW_SEQ_SEG]
        mov     ax, word ptr es:[1ch]
        mov     cx, word ptr es:[1eh]
        push    ax
        push    cx
        call    fn_219B1
        pop     cx
        pop     ax
        call    fn_217B5
        mov     es, dx
        mov     byte ptr es:[di], 0ffh
        inc     di
        mov     byte ptr es:[di], 2fh
        inc     di
        mov     byte ptr es:[di], 0
        inc     di
        ret
fn_215D0:
        push    bx
        sub     bx, bx
        mov     bl, al
        shr     bl, 4
        mov     ah, byte ptr cs:[bx+TBL_HEX_DIGITS-APP2_CSBASE]
        mov     bl, al
        and     bl, 0fh
        mov     al, byte ptr cs:[bx+TBL_HEX_DIGITS-APP2_CSBASE]
        pop     bx
        ret
TBL_HEX_DIGITS:
        db      "0123456789ABCDEF"
fn_215F9:
        mov     es, bp
        mov     bx, word ptr es:[si+4]
        cmp     bl, 80h
        jb      br_21606
        jmp     br_21668
br_21606:
        push    cx
        push    ax
        mov     cl, bl
        mov     ax, word ptr es:[si+2]
        xchg    ah, al
        shr     ah, 4
        shl     ax, 2
        mov     al, bh
        mov     bx, word ptr es:[si+6]
        mov     ch, bl
        and     ch, 7fh
        rol     bl, 1
        shl     bh, 1
        rcl     bl, 1
        shr     bh, 1
        and     bl, 3
        mov     es, dx
        cmp     bx, 4000h
        je      br_21645
        push    ax
        mov     al, byte ptr [A2_B_03B6F]
        or      al, 80h
        stosb
        mov     byte ptr [A2_B_SMFW_RUNNING_STATUS], al
        mov     ax, bx
        stosw
        mov     al, 0
        stosb
        pop     ax
br_21645:
        mov     bh, 90h
        or      bh, byte ptr [A2_B_03B6F]
        cmp     bh, byte ptr [A2_B_SMFW_RUNNING_STATUS]
        je      br_21659
        mov     byte ptr [A2_B_SMFW_RUNNING_STATUS], bh
        mov     byte ptr es:[di], bh
        inc     di
br_21659:
        xchg    cx, ax
        stosw
        mov     bl, al
        pop     ax
        add     ax, cx
        pop     cx
        adc     cx, 0
        call    fn_2176B
        ret
br_21668:
        mov     ax, bx
        cmp     al, 0f0h
        jne     br_21670
        jmp     br_21699
br_21670:
        mov     cl, al
        or      al, byte ptr [A2_B_03B6F]
        mov     ch, byte ptr es:[si+6]
        mov     es, dx
        cmp     al, byte ptr [A2_B_SMFW_RUNNING_STATUS]
        je      br_21686
        mov     byte ptr [A2_B_SMFW_RUNNING_STATUS], al
        stosb
br_21686:
        mov     al, ah
        stosb
        cmp     cl, 0d0h
        jne     br_2168F
        ret
br_2168F:
        cmp     cl, 0c0h
        jne     br_21695
        ret
br_21695:
        mov     al, ch
        stosb
        ret
br_21699:
        mov     byte ptr [A2_B_SMFW_RUNNING_STATUS], 0
        mov     bx, word ptr es:[si+5]
        mov     cl, byte ptr es:[si+7]
        mov     ch, 0
        sub     bx, 1
        sbb     cl, 0
        mov     word ptr [A2_W_03BC0], bx
        mov     word ptr [A2_W_03BC2], cx
        add     si, 8
        jae     br_216C1
        add     bp, 1000h
        mov     es, bp
br_216C1:
        push    ds
        mov     ds, bp
        mov     es, dx
        lodsb
        stosb
        shl     bx, 1
        rcl     cl, 1
        shr     bl, 1
        shl     bh, 1
        rcl     cl, 1
        shr     bh, 1
        cmp     cl, 0
        je      br_216DF
        or      cl, 80h
        or      bh, 80h
br_216DF:
        cmp     bh, 0
        je      br_216E7
        or      bh, 80h
br_216E7:
        test    cl, 80h
        je      br_216F2
        mov     byte ptr es:[di], cl
        call    fn_21758
br_216F2:
        test    bh, 80h
        je      br_216FD
        mov     byte ptr es:[di], bh
        call    fn_21758
br_216FD:
        mov     byte ptr es:[di], bl
        call    fn_21758
loop_21703:
        lodsb
        stosb
        cmp     si, 0
        jne     br_21710
        add     bp, 1000h
        mov     ds, bp
br_21710:
        cmp     di, 1000h
        jb      br_21726
        sub     di, 1000h
        add     dx, 100h
        mov     es, dx
        cmp     dx, 7f00h
        je      br_21756
br_21726:
        pop     ds
        mov     ax, word ptr [A2_W_03BC0]
        mov     bx, word ptr [A2_W_03BC2]
        sub     ax, 1
        sbb     bx, 0
        mov     word ptr [A2_W_03BC0], ax
        mov     word ptr [A2_W_03BC2], bx
        push    ds
        mov     ds, bp
        or      ax, bx
        jne     loop_21703
loop_21742:
        test    si, 7
        je      br_21756
        inc     si
        cmp     si, 0
        jne     loop_21742
        add     bp, 1000h
        mov     ds, bp
        jmp     loop_21742
br_21756:
        pop     ds
        ret
fn_21758:
        inc     di
        cmp     di, 1000h
        jae     br_21760
        ret
br_21760:
        sub     di, 1000h
        add     dx, 100h
        mov     es, dx
        ret
fn_2176B:
        push    si
        push    di
        push    bx
        push    cx
        mov     bx, ds
        mov     es, bx
        mov     bx, A2_W_03BC0
loop_21776:
        add     bx, 6
        cmp     cx, word ptr [bx+2]
        jb      br_21784
        jne     loop_21776
        cmp     ax, word ptr [bx]
        ja      loop_21776
br_21784:
        mov     di, word ptr [A2_W_03BC4]
loop_21788:
        mov     si, di
        sub     si, 6
        cmp     bx, si
        je      br_2179B
        mov     cx, 3
        rep movsw
        sub     di, 0ch
        jmp     loop_21788
br_2179B:
        mov     cx, 3
        rep movsw
        sub     si, 6
        add     word ptr [A2_W_03BC4], 6
        pop     cx
        pop     bx
        mov     word ptr [si], ax
        mov     word ptr [si+2], cx
        mov     word ptr [si+4], bx
        pop     di
        pop     si
        ret
fn_217B5:
        mov     bx, A2_W_03BC6
        cmp     cx, word ptr [bx+2]
        jae     br_217C0
        jmp     fn_218A0
br_217C0:
        jne     br_217C9
        cmp     ax, word ptr [bx]
        jae     br_217C9
        jmp     fn_218A0
br_217C9:
        push    ax
        push    cx
        call    fn_217D2
        pop     cx
        pop     ax
        jmp     fn_217B5
fn_217D2:
        push    bx
        mov     ax, word ptr [bx]
        mov     cx, word ptr [bx+2]
        call    fn_218A0
        pop     bx
        mov     cx, ds
        mov     es, cx
        push    si
        push    di
        mov     di, bx
        mov     si, bx
        add     si, 6
        mov     cx, word ptr [A2_W_03BC4]
        sub     cx, 6
        sub     cx, bx
        shr     cx, 1
        mov     ax, word ptr [bx+4]
        rep movsw
        sub     word ptr [A2_W_03BC4], 6
        pop     di
        pop     si
        mov     es, dx
        cmp     ah, 0
        je      br_2181E
        cmp     ah, 90h
        jb      br_21851
        cmp     ah, byte ptr [A2_B_SMFW_RUNNING_STATUS]
        je      br_21819
        mov     byte ptr [A2_B_SMFW_RUNNING_STATUS], al
        mov     byte ptr es:[di], ah
        inc     di
br_21819:
        stosb
        mov     al, 0
        stosb
        ret
br_2181E:
        mov     byte ptr es:[di], 0ffh
        inc     di
        mov     byte ptr es:[di], 58h
        inc     di
        mov     byte ptr es:[di], 4
        inc     di
        mov     ah, al
        and     al, 1fh
        inc     al
        stosb
        mov     al, ah
        shr     al, 5
        stosb
        mov     byte ptr es:[di], 18h
        inc     di
        mov     byte ptr es:[di], 8
        inc     di
        push    di
        push    es
        call    fn_218FB
        pop     es
        pop     di
        mov     byte ptr [A2_B_SMFW_RUNNING_STATUS], 0
        ret
br_21851:
        and     ah, 0fh
        mov     bx, ax
        push    dx
        push    di
        push    si
        push    bp
        mov     dh, 0
        mov     dl, byte ptr [A2_B_03F32]
        mov     ah, byte ptr [A2_B_03F33]
        mov     al, byte ptr [A2_B_03F34]
        mov     cx, 3e8h
        int     8bh
        mov     di, bx
        sub     si, si
        int     0b8h
        sub     ax, 64h
        sbb     dx, 0
        pop     bp
        pop     si
        pop     di
        mov     byte ptr es:[di], 0ffh
        inc     di
        mov     byte ptr es:[di], 51h
        inc     di
        mov     byte ptr es:[di], 3
        inc     di
        mov     byte ptr es:[di], dl
        inc     di
        mov     byte ptr es:[di], ah
        inc     di
        mov     byte ptr es:[di], al
        inc     di
        pop     dx
        call    L_21978
        mov     byte ptr [A2_B_SMFW_RUNNING_STATUS], 0
        ret
fn_218A0:
        push    ax
        push    cx
        sub     ax, word ptr [A2_W_03B66]
        sbb     cx, word ptr [A2_W_03B68]
        mov     bx, cx
        mov     es, dx
        test    bx, 0fe0h
        jne     br_218C5
        mov     bh, bl
        mov     bl, ah
        test    bx, 1fc0h
        jne     br_218D6
        test    ax, 3f80h
        jne     br_218E0
        jmp     br_218EB
br_218C5:
        shl     bx, 3
        or      bh, 80h
        mov     byte ptr es:[di], bh
        inc     di
        shr     bx, 3
        mov     bh, bl
        mov     bl, ah
br_218D6:
        shl     bx, 2
        or      bh, 80h
        mov     byte ptr es:[di], bh
        inc     di
br_218E0:
        shl     ax, 1
        or      ah, 80h
        mov     byte ptr es:[di], ah
        inc     di
        shr     ax, 1
br_218EB:
        and     al, 7fh
        mov     byte ptr es:[di], al
        inc     di
        pop     cx
        pop     ax
        mov     word ptr [A2_W_03B66], ax
        mov     word ptr [A2_W_03B68], cx
        ret
fn_218FB:
        mov     es, word ptr [A2_W_SMFW_SEQ_SEG]
        mov     bx, word ptr [A2_W_03BB2]
        cmp     bx, word ptr [A2_W_03BB4]
        jne     loop_2190A
        ret
loop_2190A:
        mov     ax, word ptr es:[bx+4]
        sub     ax, word ptr es:[bx]
        mov     cx, word ptr es:[bx+2]
        mov     cl, 0
        cmp     ax, word ptr [A2_W_03BB6]
        jne     br_21931
        cmp     cx, word ptr [A2_W_03BB8]
        jne     br_21931
        add     bx, 4
        cmp     bx, word ptr [A2_W_03BB4]
        jne     loop_2190A
        mov     word ptr [A2_W_03BB2], bx
        ret
br_21931:
        mov     word ptr [A2_W_03BB6], ax
        mov     word ptr [A2_W_03BB8], cx
        mov     word ptr [A2_W_03BB2], bx
        add     word ptr [A2_W_03BB2], 4
        push    bx
        div     ch
        mov     cl, al
        dec     cl
        mov     ax, 180h
        div     ch
        mov     ah, 2
        cmp     al, 4
        je      br_21961
        mov     ah, 3
        cmp     al, 8
        je      br_21961
        mov     ah, 4
        cmp     al, 10h
        je      br_21961
        mov     ah, 5
br_21961:
        shl     ah, 5
        or      cl, ah
        mov     ch, 0
        pop     bx
        push    cx
        mov     ax, word ptr es:[bx]
        mov     cx, word ptr es:[bx+2]
        mov     ch, 0
        pop     bx
        call    fn_2176B
        ret
L_21978:
        mov     es, word ptr [A2_W_SMFW_SEQ_SEG]
        mov     bx, word ptr [A2_W_03BBA]
loop_21980:
        cmp     bx, word ptr [A2_W_03BBC]
        jne     br_21987
        ret
br_21987:
        mov     ax, word ptr es:[bx]
        cmp     ax, word ptr [A2_W_03BBE]
        jne     br_21999
        add     bx, 0eh
        mov     word ptr [A2_W_03BBA], bx
        jmp     loop_21980
br_21999:
        mov     word ptr [A2_W_03BBE], ax
        mov     word ptr [A2_W_03BBA], bx
        or      ah, 10h
        push    ax
        mov     ax, word ptr es:[bx+2]
        mov     cx, word ptr es:[bx+4]
        pop     bx
        call    fn_2176B
        ret
fn_219B1:
        mov     bx, A2_W_03BC6
loop_219B4:
        cmp     word ptr [bx], -1
        jne     br_219C0
        cmp     word ptr [bx+2], -1
        jne     br_219C0
        ret
br_219C0:
        push    ax
        push    cx
        sub     ax, word ptr [bx]
        sbb     cx, word ptr [bx+2]
        pop     cx
        pop     ax
        jae     br_219D0
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], cx
br_219D0:
        add     bx, 6
        jmp     loop_219B4
        db      00h
L_219D6:
        call    fn_219DA
        retf
fn_219DA:
        mov     es, word ptr [A2_W_00F10]
        mov     word ptr [A2_W_03FA4], 0
        mov     word ptr [A2_W_03FA6], 0
        mov     word ptr [A2_W_03FA8], 0
        mov     di, 8000h
        mov     cx, 530h
        push    es
        push    di
        push    cx
        mov     bl, 6
        int     91h
        pop     cx
        pop     si
        pop     es
        jae     br_21A03
        ret
br_21A03:
        sub     di, di
        cmp     ax, cx
        jne     br_21A0F
        cmp     word ptr es:[si], 0
        jne     br_21A14
br_21A0F:
        mov     ax, 0
        stc
        ret
br_21A14:
        pusha
        push    ds
        mov     ax, es
        mov     ds, ax
        add     si, 2
        mov     di, 0
        mov     cx, 10h
        rep movsb
        pop     ds
        popa
        push    word ptr es:[si]
        mov     al, byte ptr es:[si+13h]
        mov     byte ptr es:[di+12h], al
        mov     ax, word ptr es:[si+14h]
        mov     word ptr es:[di+16h], ax
        mov     al, byte ptr es:[si+1ah]
        mov     byte ptr es:[di+18h], al
        mov     al, byte ptr es:[si+1bh]
        mov     byte ptr es:[di+19h], al
        mov     ax, word ptr es:[si+18h]
        mov     word ptr es:[di+1ah], ax
        mov     ax, word ptr es:[si+1ch]
        mov     bx, word ptr es:[si+1eh]
        mov     cl, byte ptr es:[si+20h]
        mov     word ptr es:[di+30h], ax
        mov     word ptr es:[di+32h], bx
        mov     byte ptr es:[di+34h], cl
        mov     al, byte ptr es:[si+21h]
        mov     ah, byte ptr es:[si+22h]
        mov     bl, byte ptr es:[si+23h]
        mov     bh, byte ptr es:[si+24h]
        mov     cl, byte ptr es:[si+25h]
        mov     byte ptr es:[di+35h], al
        mov     byte ptr es:[di+36h], ah
        mov     byte ptr es:[di+37h], bl
        mov     byte ptr es:[di+38h], bh
        mov     byte ptr es:[di+39h], cl
        pusha
        push    ds
        add     si, 30h
        mov     di, 180h
        mov     cx, 400h
        mov     ax, es
        mov     ds, ax
        rep movsb
        pop     ds
        popa
        add     si, 430h
        sub     di, di
        mov     cx, 40h
tgt_21AAE:
        mov     al, byte ptr es:[si]
        mov     bl, byte ptr es:[si+40h]
        mov     bh, byte ptr es:[si+80h]
        mov     dl, byte ptr es:[si+0c0h]
        mov     byte ptr es:[di+600h], bl
        mov     byte ptr es:[di+640h], bh
        mov     ah, al
        and     al, 1fh
        inc     al
        test    ah, 20h
        jne     br_21AD6
        mov     al, 0
br_21AD6:
        mov     byte ptr es:[di+580h], al
        mov     al, 1
        test    ah, 40h
        jne     br_21AE4
        mov     al, 0
br_21AE4:
        mov     byte ptr es:[di+5c0h], al
        mov     al, 0
        test    ah, 80h
        je      br_21AF2
        mov     al, 2
br_21AF2:
        test    dl, 1
        je      br_21AF9
        or      al, 1
br_21AF9:
        test    dl, 2
        je      br_21B00
        or      al, 4
br_21B00:
        mov     byte ptr es:[di+680h], al
        inc     si
        inc     di
        loop    tgt_21AAE
        pop     dx
        sub     dx, 53h
        mov     word ptr [A2_W_03FA2], dx
        mov     ax, 3800h
        mov     es, ax
        mov     di, 0
        mov     word ptr [A2_FP_ALLCONV_SRC], di
        mov     word ptr [A2_W_ALLCONV_SRC_SEG], es
        call    fn_21EE2
        jae     br_21B27
        ret
br_21B27:
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     word ptr [A2_W_ALLCONV_DST_SEG], es
        mov     word ptr [A2_FP_ALLCONV_DST], 2800h
        mov     word ptr [A2_W_03FA0], 0
        mov     word ptr [A2_W_ALLCONV_TICK_LO], 0
        mov     word ptr [A2_W_ALLCONV_TICK_HI], 0
        mov     byte ptr [A2_B_03FAA], 0
        mov     byte ptr [A2_B_03FAB], 40h
        mov     word ptr [A2_W_03F98], 70eh
        mov     word ptr [A2_W_03F9A], 1500h
loop_21B5D:
        les     si, [A2_FP_ALLCONV_SRC]
        mov     ax, word ptr [A2_FP_ALLCONV_DST]
        mov     bx, word ptr [A2_W_ALLCONV_DST_SEG]
        shr     ax, 4
        add     ax, bx
        cmp     ax, 0dff0h
        jae     br_21B7F
        mov     al, byte ptr es:[si]
        cmp     al, 0ffh
        je      br_21BAE
        call    fn_21C0F
        jae     loop_21B5D
        ret
br_21B7F:
        mov     ax, 33h
        int     95h
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     ax, word ptr [A2_W_03FA6]
        mov     dx, word ptr [A2_W_03FA8]
        mov     cx, word ptr [A2_W_03FA4]
        mov     word ptr es:[1ch], ax
        mov     word ptr es:[1eh], dx
        dec     cx
        mov     word ptr es:[1ah], cx
loop_21BA2:
        cmp     word ptr [A2_W_03FA2], 0
        je      br_21BAE
        call    fn_21E8B
        jmp     loop_21BA2
br_21BAE:
        les     di, [A2_FP_ALLCONV_DST]
        mov     al, 0ffh
loop_21BB4:
        mov     byte ptr es:[di], al
        inc     di
        jne     br_21BC2
        mov     bx, es
        add     bx, 1000h
        mov     es, bx
br_21BC2:
        test    di, 0fh
        jne     loop_21BB4
        mov     ax, es
        sub     ax, 8000h
        shr     di, 4
        add     ax, di
        push    ax
        mov     es, word ptr [A2_W_00F10]
        mov     di, word ptr [A2_W_03F98]
        mov     ax, 3e8h
        mov     word ptr es:[di], ax
        mov     ax, word ptr [A2_W_ALLCONV_TICK_LO]
        mov     dx, word ptr [A2_W_ALLCONV_TICK_HI]
        mov     word ptr es:[1ch], ax
        mov     word ptr es:[1eh], dx
        mov     word ptr es:[di+2], ax
        mov     word ptr es:[di+4], dx
        pop     ax
        sub     ax, 280h
        mov     es, word ptr [A2_W_00F10]
        mov     word ptr es:[10h], ax
        mov     al, byte ptr es:[12h]
        mov     ah, 0
        dec     al
        clc
        ret
fn_21C0F:
        cmp     al, 0c1h
        je      br_21C89
        cmp     al, 0c0h
        jne     br_21C19
        jmp     br_21C35
br_21C19:
        and     al, 0c0h
        cmp     al, 0
        jne     br_21C22
        jmp     br_21CDD
br_21C22:
        cmp     al, 40h
        jne     br_21C29
        jmp     br_21D5A
br_21C29:
        cmp     al, 80h
        jne     br_21C30
        jmp     br_21DB2
br_21C30:
        mov     ax, 0ah
        stc
        ret
br_21C35:
        mov     ax, word ptr [A2_W_03FA0]
        add     word ptr [A2_W_ALLCONV_TICK_LO], ax
        adc     word ptr [A2_W_ALLCONV_TICK_HI], 0
        mov     ax, 180h
        sub     dx, dx
        mov     bl, byte ptr es:[si+4]
        mov     bh, 0
        div     bx
        mov     cx, ax
        mov     ah, byte ptr es:[si+3]
        mul     ah
        mov     word ptr [A2_W_03FA0], ax
        mov     bx, ax
        mov     ax, word ptr [A2_W_ALLCONV_TICK_LO]
        mov     dx, word ptr [A2_W_ALLCONV_TICK_HI]
        mov     es, word ptr [A2_W_SEQ_SEG]
        mov     di, word ptr [A2_W_03F9A]
        stosw
        mov     ax, dx
        mov     ah, cl
        stosw
        mov     word ptr [A2_W_03F9A], di
        add     ax, bx
        adc     dx, 0
        mov     word ptr [A2_W_03FA6], ax
        mov     word ptr [A2_W_03FA8], dx
        inc     word ptr [A2_W_03FA4]
        call    fn_21E8B
        clc
        ret
br_21C89:
        mov     cx, word ptr es:[si+3]
        mov     ax, word ptr [A2_W_ALLCONV_TICK_LO]
        mov     dx, word ptr [A2_W_ALLCONV_TICK_HI]
        add     ax, word ptr es:[si+1]
        adc     dx, 0
        mov     bx, ax
        or      bx, dx
        jne     br_21CAF
        sub     word ptr [A2_W_03F98], 0eh
        mov     es, word ptr [A2_W_SEQ_SEG]
        dec     word ptr es:[14h]
br_21CAF:
        mov     es, word ptr [A2_W_SEQ_SEG]
        cmp     word ptr es:[14h], 0ffh
        je      br_21CD8
        mov     di, word ptr [A2_W_03F98]
        push    ax
        mov     ax, cx
        stosw
        pop     ax
        stosw
        mov     ax, dx
        stosw
        sub     ax, ax
        stosw
        stosw
        stosw
        stosw
        mov     word ptr [A2_W_03F98], di
        inc     word ptr es:[14h]
br_21CD8:
        call    fn_21E8B
        clc
        ret
br_21CDD:
        mov     bx, word ptr es:[si]
        mov     cx, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        les     di, [A2_FP_ALLCONV_DST]
        mov     byte ptr es:[di+3], bl
        mov     al, bh
        mov     ah, cl
        and     ah, 7
        sub     bx, bx
        add     ax, word ptr [A2_W_ALLCONV_TICK_LO]
        adc     bx, word ptr [A2_W_ALLCONV_TICK_HI]
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], bl
        mov     al, ch
        mov     ah, cl
        shl     dl, 1
        rcr     ah, 1
        shr     ah, 2
        shr     dl, 1
        mov     byte ptr es:[di+4], dl
        mov     byte ptr es:[di+5], al
        mov     al, 0
        shr     ax, 2
        shl     ah, 4
        or      byte ptr es:[di+3], al
        or      byte ptr es:[di+2], ah
        mov     al, byte ptr [A2_B_03FAA]
        shl     dh, 1
        shr     al, 1
        rcr     dh, 1
        mov     byte ptr es:[di+6], dh
        mov     ah, byte ptr [A2_B_03FAB]
        shl     ah, 1
        shr     al, 1
        rcr     ah, 1
        mov     byte ptr es:[di+7], ah
        mov     byte ptr [A2_B_03FAA], 0
        mov     byte ptr [A2_B_03FAB], 40h
        call    fn_21ED3
        call    fn_21E8B
        clc
        ret
br_21D5A:
        mov     bx, word ptr es:[si]
        mov     cx, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        cmp     ch, 0a0h
        jb      br_21D9F
        les     di, [A2_FP_ALLCONV_DST]
        and     bl, 3fh
        mov     byte ptr es:[di+3], bl
        mov     al, bh
        mov     ah, cl
        sub     bx, bx
        add     ax, word ptr [A2_W_ALLCONV_TICK_LO]
        adc     bx, word ptr [A2_W_ALLCONV_TICK_HI]
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], bl
        mov     byte ptr es:[di+4], ch
        mov     word ptr es:[di+5], dx
        mov     byte ptr es:[di+7], 0
        call    fn_21ED3
        call    fn_21E8B
        clc
        ret
br_21D9F:
        and     ch, 3
        and     dh, 7fh
        mov     byte ptr [A2_B_03FAA], ch
        mov     byte ptr [A2_B_03FAB], dh
        call    fn_21E8B
        clc
        ret
br_21DB2:
        mov     bx, word ptr es:[si]
        mov     cx, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        les     di, [A2_FP_ALLCONV_DST]
        and     bl, 3fh
        mov     byte ptr es:[di+3], bl
        push    bx
        mov     al, bh
        mov     ah, cl
        sub     bx, bx
        add     ax, word ptr [A2_W_ALLCONV_TICK_LO]
        adc     bx, word ptr [A2_W_ALLCONV_TICK_HI]
        push    ax
        push    bx
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], bl
        mov     byte ptr es:[di+4], 0f0h
        mov     byte ptr es:[di+5], ch
        mov     word ptr es:[di+6], dx
        call    fn_21ED3
        call    fn_21E8B
        push    ds
        les     di, [A2_FP_ALLCONV_DST]
        lds     si, [A2_FP_ALLCONV_SRC]
loop_21DFC:
        call    fn_21E6C
        call    fn_21E7C
        cmp     al, 0f7h
        jne     loop_21DFC
loop_21E06:
        mov     al, byte ptr [si]
        cmp     al, 0c2h
        je      br_21E11
        call    fn_21E6C
        jmp     loop_21E06
br_21E11:
        call    fn_21E6C
        call    fn_21E6C
        call    fn_21E6C
        call    fn_21E6C
        call    fn_21E6C
        call    fn_21E6C
        mov     dx, ds
        mov     al, 0
loop_21E27:
        test    di, 7
        je      br_21E30
        stosb
        jmp     loop_21E27
br_21E30:
        pop     ds
        pop     bx
        pop     ax
        pop     cx
        mov     word ptr [A2_FP_ALLCONV_SRC], si
        mov     word ptr [A2_W_ALLCONV_SRC_SEG], dx
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], bl
        mov     byte ptr es:[di+3], cl
        mov     byte ptr es:[di+4], 0f8h
        sub     ax, ax
        mov     byte ptr es:[di+5], al
        mov     word ptr es:[di+6], ax
        add     di, 8
        jae     br_21E62
        mov     ax, es
        adc     ax, 1000h
        mov     es, ax
br_21E62:
        mov     word ptr [A2_FP_ALLCONV_DST], di
        mov     word ptr [A2_W_ALLCONV_DST_SEG], es
        clc
        ret
fn_21E6C:
        lodsb
        cmp     si, 10h
        jae     br_21E73
        ret
br_21E73:
        sub     si, 10h
        mov     bx, ds
        inc     bx
        mov     ds, bx
        ret
fn_21E7C:
        stosb
        or      di, di
        je      br_21E82
        ret
br_21E82:
        mov     bx, es
        add     bx, 1000h
        mov     es, bx
        ret
fn_21E8B:
        les     si, [A2_FP_ALLCONV_SRC]
        mov     ax, es
        add     si, 6
        cmp     si, 10h
        jb      br_21E9D
        sub     si, 10h
        inc     ax
br_21E9D:
        mov     es, ax
        mov     word ptr [A2_FP_ALLCONV_SRC], si
        mov     word ptr [A2_W_ALLCONV_SRC_SEG], es
        cmp     ax, 7fe0h
        je      br_21EAD
        ret
br_21EAD:
        push    ds
        mov     ax, 7fe0h
        mov     ds, ax
        mov     ax, 3800h
        mov     di, ax
        mov     di, 0
        mov     si, 0
        mov     cx, 10h
        rep movsb
        pop     ds
        mov     ax, 3801h
        mov     es, ax
        call    fn_21EE2
        mov     word ptr [A2_W_ALLCONV_SRC_SEG], 3800h
        ret
fn_21ED3:
        add     word ptr [A2_FP_ALLCONV_DST], 8
        jb      BR_21EDB
        ret
BR_21EDB:
        add     word ptr [A2_W_ALLCONV_DST_SEG], 1000h
        ret
fn_21EE2:
        mov     ax, word ptr [A2_W_03FA2]
        mov     dx, ax
        sub     ax, 47f0h
        mov     bx, 0
        jb      br_21EF4
        mov     dx, 47f0h
        mov     bx, ax
br_21EF4:
        mov     word ptr [A2_W_03FA2], bx
loop_21EF8:
        mov     cx, 8000h
        sub     dx, 800h
        jae     br_21F0C
        add     dx, 800h
        mov     cx, dx
        shl     cx, 4
        sub     dx, dx
br_21F0C:
        sub     di, di
        push    es
        push    dx
        mov     bl, 6
        int     91h
        pop     dx
        pop     es
        jae     br_21F19
        ret
br_21F19:
        mov     bx, es
        add     bx, 800h
        mov     es, bx
        cmp     dx, 0
        jne     loop_21EF8
        clc
        ret
L_21F28:
        call    fn_21F30
        retf
L_21F2C:
        call    fn_21F3B
        retf
fn_21F30:
        cmp     word ptr [A2_W_DISK_IO_BUF], 303h
        je      fn_21F3B
        jmp     fn_225B7
fn_21F3B:
        mov     byte ptr [A2_B_03FB0], 0
        mov     word ptr [A2_W_CONV_SAVED_SP], sp
        mov     word ptr [A2_W_03FD0], ax
        mov     word ptr [A2_W_03FBE], bx
        mov     word ptr [A2_W_CONV_SEQ_SEG], cx
        mov     word ptr [A2_FP_03FDC], 1500h
        mov     word ptr [A2_W_03FDE], cx
        add     cx, 280h
        mov     word ptr [A2_W_03FD4], cx
        sub     ax, ax
        mov     word ptr [A2_W_CONV_TICK_LO], ax
        mov     word ptr [A2_W_CONV_TICK_HI], ax
        mov     bl, 5
        int     91h
        cmp     al, 0ffh
        jne     br_21F72
        ret
br_21F72:
        mov     byte ptr [A2_B_03FB4], al
        mov     ax, ds
        mov     es, ax
        mov     di, A2_W_03490
        mov     cx, 150h
        mov     bl, 6
        int     91h
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     di, 0
        mov     si, P_3498
        mov     cx, 10h
        rep movsb
        mov     al, byte ptr [P_34A9]
        and     al, 1
        mov     byte ptr es:[34h], al
        mov     si, P_34B4
        mov     di, 35h
        lodsb
        mov     byte ptr es:[di+4], al
        lodsb
        mov     byte ptr es:[di+3], al
        lodsb
        mov     byte ptr es:[di+2], al
        lodsb
        mov     byte ptr es:[di+1], al
        lodsb
        mov     byte ptr es:[di], al
        mov     ax, word ptr [A2_W_03490]
        mov     dx, word ptr [A2_W_03492]
        mov     word ptr [A2_W_03FC0], ax
        mov     word ptr [A2_W_03FC2], dx
        mov     bx, word ptr [P_3494]
        mov     cx, word ptr [P_3496]
        mov     word ptr [A2_W_03FC4], bx
        mov     word ptr [A2_W_03FC6], cx
        sub     ax, bx
        sbb     dx, cx
        mov     word ptr [A2_W_03FC8], ax
        mov     word ptr [A2_W_03FCA], dx
        mov     ax, word ptr [P_34B2]
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     word ptr es:[16h], ax
        mov     al, byte ptr [A2_B_035DE]
        mov     byte ptr [A2_B_03FB1], al
        mov     ah, 0
        sub     al, 1
        jne     br_21FFB
        mov     al, 1
br_21FFB:
        mov     word ptr es:[14h], ax
        mov     cl, byte ptr [A2_B_035DF]
        sub     ch, ch
tgt_22005:
        push    cx
        mov     cx, 18h
        mov     ax, ds
        mov     es, ax
        mov     di, A2_W_DISK_IO_BUF
        mov     bl, 6
        int     91h
        mov     al, byte ptr [A2_W_DISK_IO_BUF]
        dec     al
        cmp     al, 40h
        jae     BR_2206B
        mov     bl, al
        sub     bh, bh
        mov     cx, 10h
        mul     cl
        add     ax, 180h
        mov     di, ax
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     si, A2_W_03492
        rep movsb
        mov     al, byte ptr [A2_W_03490]
        inc     al
        and     al, 1fh
        mov     byte ptr es:[bx+580h], al
        mov     al, 0
        test    byte ptr [A2_B_0348F], 4
        je      br_2204B
        mov     al, 1
br_2204B:
        mov     byte ptr es:[bx+5c0h], al
        mov     byte ptr es:[bx+680h], 5
        test    byte ptr [A2_B_0348F], 1
        jne     BR_22063
        or      byte ptr es:[bx+680h], 2
BR_22063:
        mov     al, byte ptr [P_34A3]
        mov     byte ptr es:[bx+600h], al
BR_2206B:
        pop     cx
        loop    tgt_22005
loop_2206E:
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     di, 700h
        mov     cx, 700h
        sub     ax, ax
        rep stosw
        mov     es, word ptr [A2_W_03FD0]
        sub     di, di
        mov     al, byte ptr [A2_B_03FB1]
        mov     ah, 6
        mul     ah
        mov     cx, ax
        push    es
        push    di
        mov     bl, 6
        int     91h
        pop     si
        pop     bp
        add     si, 6
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     cx, word ptr es:[14h]
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     di, 700h
        mov     ax, 3e8h
        mov     word ptr es:[di], ax
        sub     ax, ax
        mov     word ptr es:[di+2], ax
        mov     word ptr es:[di+4], ax
        mov     word ptr es:[di+6], ax
        mov     word ptr es:[di+8], ax
        mov     word ptr es:[di+0ah], ax
        mov     word ptr es:[di+0ch], ax
        add     di, 0eh
        dec     cx
        je      br_2210B
        inc     cx
        sub     di, 0eh
        push    ds
        mov     ds, bp
tgt_220D3:
        mov     ax, word ptr [si]
        mov     bx, word ptr [si+2]
        mov     word ptr es:[di+2], ax
        mov     word ptr es:[di+4], bx
        mov     ax, word ptr [si+4]
        mov     bx, 3e8h
        mul     bx
        mov     bx, 1000h
        div     bx
        mov     word ptr es:[di], ax
        sub     ax, ax
        mov     word ptr es:[di+6], ax
        mov     word ptr es:[di+8], ax
        mov     word ptr es:[di+0ah], ax
        mov     word ptr es:[di+0ch], ax
        add     si, 6
        add     di, 0eh
        loop    tgt_220D3
        pop     ds
br_2210B:
        mov     ax, word ptr [A2_W_03FC0]
        mov     dx, word ptr [A2_W_03FC2]
        mov     es, word ptr [A2_W_03FBE]
loop_22116:
        mov     bx, ax
        or      bx, dx
        je      br_22144
        sub     ax, 8000h
        sbb     dx, 0
        jb      br_22139
        mov     cx, 8000h
        pusha
        sub     di, di
        mov     bl, 6
        int     91h
        popa
        mov     bx, es
        add     bx, 800h
        mov     es, bx
        jmp     loop_22116
br_22139:
        add     ax, 8000h
        mov     cx, ax
        sub     di, di
        mov     bl, 6
        int     91h
br_22144:
        mov     ax, word ptr [A2_W_03FBE]
        sub     dx, dx
        mov     cx, 4
tgt_2214C:
        shl     ax, 1
        rcl     dx, 1
        loop    tgt_2214C
        add     ax, word ptr [A2_W_03FC4]
        adc     dx, word ptr [A2_W_03FC6]
        mov     di, ax
        mov     cx, 4
tgt_2215F:
        shr     dx, 1
        rcr     ax, 1
        loop    tgt_2215F
        and     di, 0fh
        mov     word ptr [A2_FP_CONV_READ_PTR], di
        mov     word ptr [A2_W_03FB8], ax
loop_2216F:
        call    buffer_process
        cmp     al, 0a8h
        jne     loop_2216F
        sub     word ptr [A2_FP_CONV_READ_PTR], 1
        sbb     word ptr [A2_W_03FB8], 0
        add     word ptr [A2_W_03FC8], 1
        adc     word ptr [A2_W_03FCA], 0
        mov     es, word ptr [A2_W_03FD4]
        sub     di, di
        if      FW_VERSION >= 114
L_22190:
        mov     ax, L_22190-APP2_CSBASE
        else
        mov     ax, A2_W_076E8
        endif
        push    ax
        call    buffer_process
        cmp     al, 0ffh
        jne     br_2219E
        jmp     loop_2244D
br_2219E:
        test    al, 80h
        jne     br_221A5
        jmp     fn_223B9
br_221A5:
        cmp     byte ptr [A2_B_CONV_SYSEX_OPEN], 0
        push    ax
        call    fn_223E3
        pop     ax
        mov     bl, al
        and     al, 0f8h
        cmp     al, 88h
        jne     br_221B9
        jmp     br_22201
br_221B9:
        cmp     al, 0a8h
        jne     br_221BF
        jmp     br_2220E
br_221BF:
        cmp     al, 98h
        jne     br_221C6
        jmp     br_22255
br_221C6:
        cmp     al, 0a0h
        jne     br_221CD
        jmp     br_22302
br_221CD:
        cmp     al, 0b0h
        jne     br_221D4
        jmp     br_22302
br_221D4:
        cmp     al, 0e0h
        jne     br_221DB
        jmp     br_22302
br_221DB:
        cmp     al, 0c0h
        jne     br_221E2
        jmp     br_22339
br_221E2:
        cmp     al, 0d0h
        jne     br_221E9
        jmp     br_22339
br_221E9:
        cmp     al, 0f0h
        jne     br_221F0
        jmp     br_2236B
br_221F0:
        cmp     al, 0e8h
        jne     br_221F7
        jmp     NEAR L_21E79
br_221F7:
        cmp     al, 0b8h
        jne     L_221FE
        jmp     br_22443
L_221FE:
        jmp     loop_224EA
br_22201:
        call    fn_22585
        add     word ptr [A2_W_CONV_TICK_LO], ax
        adc     word ptr [A2_W_CONV_TICK_HI], 0
        ret
br_2220E:
        call    fn_22585
        mov     word ptr [A2_W_03FCE], ax
        dec     ax
        mov     cx, ax
        call    buffer_process
        mov     bl, al
        call    buffer_process
        mov     bh, al
        cmp     bh, 4
        jae     br_22228
        mov     bh, 4
br_22228:
        cmp     bl, 0
        jne     br_2222F
        mov     bl, 4
br_2222F:
        mov     ax, 180h
        div     bh
        mov     bx, word ptr [A2_W_CONV_TICK_LO]
        mov     cx, word ptr [A2_W_CONV_TICK_HI]
        mov     ch, al
        push    es
        push    si
        les     si, [A2_FP_03FDC]
        mov     word ptr es:[si], bx
        mov     word ptr es:[si+2], cx
        add     si, 4
        mov     word ptr [A2_FP_03FDC], si
        pop     si
        pop     es
        ret
br_22255:
        call    buffer_process
        dec     al
        and     al, 3fh
        mov     dh, al
        call    buffer_process
        mov     dl, al
        call    buffer_process
        mov     cl, al
        call    buffer_process
        mov     bh, al
        push    bx
        call    fn_22585
        cmp     ax, 2710h
        jb      br_22279
        mov     ax, 270fh
br_22279:
        pop     bx
        push    es
        push    bx
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     bl, dh
        sub     bh, bh
        cmp     byte ptr es:[bx+5c0h], 0
        pop     bx
        pop     es
        je      br_222C5
        cmp     byte ptr [A2_B_03FB0], 0
        je      br_222C2
        if      FW_VERSION >= 112
        cmp     dl, 0
        jne     BR_222AD
        mov     bl, 1
        push    si
        push    ax
        mov     al, bh
        mov     ah, 0
        mov     si, P_3FE8
        add     si, ax
        mov     bh, byte ptr [si]
        pop     ax
        pop     si
        jmp     br_222B0
        endif
        if      FW_VERSION >= 110
BR_222AD:
        mov     bx, 4000h
br_222B0:
        endif
        push    bx
        mov     bl, dl
        cmp     bl, 0
        je      br_222BB
        add     bl, 2
br_222BB:
        mov     bh, 0
        mov     dl, byte ptr [bx+A2_TBL_03456]
        pop     bx
br_222C2:
        and     bl, 3
br_222C5:
        xchg    bh, bl
        shl     bl, 1
        shr     bx, 1
        mov     byte ptr es:[di+7], bl
        mov     bl, cl
        shl     bl, 1
        shr     bx, 1
        mov     byte ptr es:[di+6], bl
        mov     byte ptr es:[di+5], al
        mov     byte ptr es:[di+4], dl
        mov     al, dh
        shl     al, 2
        shr     ax, 2
        mov     byte ptr es:[di+3], al
        shl     ah, 4
        or      ah, byte ptr [A2_W_CONV_TICK_HI]
        mov     byte ptr es:[di+2], ah
        mov     ax, word ptr [A2_W_CONV_TICK_LO]
        mov     word ptr es:[di], ax
        call    fn_22596
        ret
br_22302:
        mov     cl, al
        call    buffer_process
        dec     al
        and     al, 3fh
        mov     bh, al
        call    buffer_process
        mov     bl, al
        call    buffer_process
        mov     byte ptr es:[di+3], bh
        mov     byte ptr es:[di+4], cl
        mov     byte ptr es:[di+5], bl
        mov     ah, 0
        mov     word ptr es:[di+6], ax
        mov     ax, word ptr [A2_W_CONV_TICK_LO]
        mov     bx, word ptr [A2_W_CONV_TICK_HI]
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], bl
        call    fn_22596
        ret
br_22339:
        mov     cl, al
        call    buffer_process
        dec     al
        and     al, 3fh
        mov     bh, al
        call    buffer_process
        mov     byte ptr es:[di+3], bh
        mov     byte ptr es:[di+4], cl
        mov     byte ptr es:[di+5], al
        sub     ax, ax
        mov     word ptr es:[di+6], ax
        mov     ax, word ptr [A2_W_CONV_TICK_LO]
        mov     bx, word ptr [A2_W_CONV_TICK_HI]
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], bl
        call    fn_22596
        ret
br_2236B:
        call    buffer_process
        dec     al
        and     al, 3fh
        mov     byte ptr es:[di+3], al
        mov     byte ptr es:[di+4], 0f0h
        mov     ax, word ptr [A2_W_CONV_TICK_LO]
        mov     bx, word ptr [A2_W_CONV_TICK_HI]
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], bx
        sub     ax, ax
        mov     byte ptr es:[di+5], al
        mov     word ptr es:[di+6], ax
        mov     word ptr [A2_FP_03FE0], di
        mov     word ptr [P_3FE2], es
        mov     word ptr [A2_W_03FE4], 1
        mov     word ptr [A2_W_03FE6], 0
        call    fn_22596
        mov     byte ptr es:[di], 0f0h
        mov     byte ptr [A2_B_03FB3], 1
        mov     byte ptr [A2_B_CONV_SYSEX_OPEN], 1
        ret
fn_223B9:
        add     word ptr [A2_W_03FE4], 1
        jae     fn_223C5
        adc     word ptr [A2_W_03FE6], 0
fn_223C5:
        mov     bl, byte ptr [A2_B_03FB3]
        sub     bh, bh
        mov     byte ptr es:[bx+di], al
        inc     bl
        mov     byte ptr [A2_B_03FB3], bl
        cmp     bl, 8
        je      br_223DA
        ret
br_223DA:
        mov     byte ptr [A2_B_03FB3], 0
        call    fn_22596
        ret
fn_223E3:
        cmp     byte ptr [A2_B_CONV_SYSEX_OPEN], 0
        jne     br_223EB
        ret
br_223EB:
        mov     byte ptr [A2_B_CONV_SYSEX_OPEN], 0
        mov     al, 0f7h
        call    fn_223B9
loop_223F5:
        mov     al, 0
        cmp     al, byte ptr [A2_B_03FB3]
        je      br_22402
        call    fn_223C5
        jmp     loop_223F5
br_22402:
        mov     byte ptr [A2_B_CONV_SYSEX_OPEN], 0
        mov     byte ptr es:[di+4], 0f8h
        mov     ax, word ptr [A2_W_CONV_TICK_LO]
        mov     bx, word ptr [A2_W_CONV_TICK_HI]
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], bx
        mov     ax, word ptr [A2_W_03FE4]
        mov     bx, word ptr [A2_W_03FE6]
        push    es
        push    di
        les     di, [A2_FP_03FE0]
        mov     word ptr es:[di+5], ax
        mov     byte ptr es:[di+7], bl
        pop     di
        pop     es
        sub     ax, ax
        mov     byte ptr es:[di+5], al
        mov     word ptr es:[di+6], ax
        call    fn_22596
        ret
L_21E79:
        call    buffer_process
        ret
br_22443:
        call    buffer_process
        call    buffer_process
        call    buffer_process
        ret
loop_2244D:
        mov     sp, word ptr [A2_W_CONV_SAVED_SP]
        push    es
        mov     ax, word ptr [A2_W_CONV_TICK_LO]
        mov     bx, word ptr [A2_W_CONV_TICK_HI]
        les     si, [A2_FP_03FDC]
        mov     bh, byte ptr es:[si-1]
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], bx
        mov     bh, 0
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     word ptr es:[1ch], ax
        mov     word ptr es:[1eh], bx
        push    ax
        mov     ax, word ptr es:[14h]
        mov     ah, 0eh
        mul     ah
        add     ax, 700h
        mov     si, ax
        pop     ax
        mov     word ptr es:[si+2], ax
        mov     word ptr es:[si+4], bx
        mov     word ptr es:[si], 3e8h
        sub     ax, ax
        mov     word ptr es:[si+6], ax
        mov     word ptr es:[si+8], ax
        mov     word ptr es:[si+0ah], ax
        mov     word ptr es:[si+0ch], ax
        mov     cx, word ptr [A2_W_03FCE]
        mov     word ptr es:[1ah], cx
        pop     es
        mov     ax, 0ffffh
        mov     cx, 4
        rep stosw
loop_224B7:
        test    di, 0fh
        je      br_224C0
        stosb
        jmp     loop_224B7
br_224C0:
        shr     di, 4
        mov     ax, es
        add     ax, di
        sub     ax, word ptr [A2_W_CONV_SEQ_SEG]
        sub     ax, 280h
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     word ptr es:[10h], ax
        mov     al, byte ptr [A2_B_03FB4]
        mov     ah, 0
        mov     byte ptr es:[12h], al
        clc
        ret
loop_224E1:
        mov     sp, word ptr [A2_W_CONV_SAVED_SP]
        mov     ax, 19h
        stc
        ret
loop_224EA:
        mov     sp, word ptr [A2_W_CONV_SAVED_SP]
        mov     ax, 4
        stc
        ret
buffer_process:
        push    bx
        push    cx
        push    dx
        push    es
        push    si
        mov     bx, word ptr [A2_W_03FC8]
        mov     cx, word ptr [A2_W_03FCA]
        mov     dx, bx
        or      dx, cx
        je      br_22548
        les     si, [A2_FP_CONV_READ_PTR]
        mov     al, byte ptr es:[si]
        add     si, 1
        jae     br_2251A
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_2251A:
        mov     word ptr [A2_FP_CONV_READ_PTR], si
        mov     word ptr [A2_W_03FB8], es
        sub     bx, 1
        sbb     cx, 0
        mov     word ptr [A2_W_03FC8], bx
        mov     word ptr [A2_W_03FCA], cx
        or      bx, cx
        jne     loop_22542
        mov     word ptr [A2_FP_CONV_READ_PTR], 0
        mov     bx, word ptr [A2_W_03FBE]
        mov     word ptr [A2_W_03FB8], bx
loop_22542:
        pop     si
        pop     es
        pop     dx
        pop     cx
        pop     bx
        ret
br_22548:
        mov     bx, word ptr [A2_W_03FC4]
        mov     cx, word ptr [A2_W_03FC6]
        mov     dx, bx
        or      dx, cx
        jne     br_22559
        jmp     loop_2244D
br_22559:
        les     si, [A2_FP_CONV_READ_PTR]
        mov     al, byte ptr es:[si]
        add     si, 1
        jae     br_2256D
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_2256D:
        mov     word ptr [A2_FP_CONV_READ_PTR], si
        mov     word ptr [A2_W_03FB8], es
        sub     bx, 1
        sbb     cx, 0
        mov     word ptr [A2_W_03FC4], bx
        mov     word ptr [A2_W_03FC6], cx
        jmp     loop_22542
fn_22585:
        call    buffer_process
        mov     bl, al
        call    buffer_process
        mov     ah, al
        mov     al, bl
        shl     al, 1
        shr     ax, 1
        ret
fn_22596:
        add     di, 8
        cmp     di, 10h
        jb      br_225A6
        sub     di, 10h
        mov     ax, es
        inc     ax
        mov     es, ax
br_225A6:
        cmp     ax, 0e000h
        jne     br_225AE
        jmp     loop_224E1
br_225AE:
        ret
        call    fn_225B7
        retf
L_225B3:
        call    fn_225CA
        retf
fn_225B7:
        cmp     word ptr [A2_W_DISK_IO_BUF], 103h
        je      fn_225CA
        cmp     word ptr [A2_W_DISK_IO_BUF], 203h
        je      fn_225CA
        jmp     loop_224EA
fn_225CA:
        mov     byte ptr [A2_B_03FB0], 1
        mov     word ptr [A2_W_CONV_SAVED_SP], sp
        mov     word ptr [A2_W_03FD0], ax
        mov     word ptr [A2_W_03FBE], bx
        mov     word ptr [A2_W_CONV_SEQ_SEG], cx
        mov     word ptr [A2_FP_03FDC], 1500h
        mov     word ptr [A2_W_03FDE], cx
        add     cx, 280h
        mov     word ptr [A2_W_03FD4], cx
        sub     ax, ax
        mov     word ptr [A2_W_CONV_TICK_LO], ax
        mov     word ptr [A2_W_CONV_TICK_HI], ax
        mov     bl, 5
        int     91h
        cmp     al, 0ffh
        jne     br_22601
        ret
br_22601:
        mov     byte ptr [A2_B_0348F], al
        mov     byte ptr [A2_B_03FB4], al
        mov     ax, ds
        mov     es, ax
        mov     di, A2_W_03490
        mov     cx, 0c9h
        mov     bl, 6
        int     91h
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     di, 0
        mov     si, P_3496
        mov     cx, 10h
        rep movsb
        mov     al, byte ptr [P_34A6]
        and     al, 1
        mov     byte ptr es:[34h], al
        mov     si, P_34B1
        mov     di, 35h
        lodsb
        mov     byte ptr es:[di+4], al
        lodsb
        mov     byte ptr es:[di+3], al
        lodsb
        mov     byte ptr es:[di+2], al
        lodsb
        mov     byte ptr es:[di+1], al
        lodsb
        mov     byte ptr es:[di], al
        mov     ax, word ptr [A2_W_03490]
        mov     dl, byte ptr [A2_W_03492]
        mov     dh, 0
        mov     word ptr [A2_W_03FC0], ax
        mov     word ptr [A2_W_03FC2], dx
        mov     bx, word ptr [A2_W_03493]
        mov     cl, byte ptr [A2_W_03495]
        mov     ch, 0
        mov     word ptr [A2_W_03FC4], bx
        mov     word ptr [A2_W_03FC6], cx
        sub     ax, bx
        sbb     dx, cx
        mov     word ptr [A2_W_03FC8], ax
        mov     word ptr [A2_W_03FCA], dx
        mov     ax, word ptr [P_34AF]
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     word ptr es:[16h], ax
        mov     cl, byte ptr [A2_B_03558]
        sub     ch, ch
loop_22689:
        push    cx
        mov     cx, 15h
        cmp     byte ptr [A2_B_0348E], 1
        je      br_22697
        mov     cx, 18h
br_22697:
        mov     ax, ds
        mov     es, ax
        mov     di, P_358D
        push    di
        mov     bl, 6
        int     91h
        pop     bp
        mov     al, byte ptr ds:[bp]
        dec     al
        cmp     al, 40h
        jae     br_22711
        mov     bl, al
        sub     bh, bh
        mov     cx, 10h
        mul     cl
        add     ax, 180h
        mov     di, ax
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     si, bp
        add     si, 5
        rep movsb
        mov     al, byte ptr ds:[bp+3]
        cmp     byte ptr [A2_B_0348E], 2
        je      br_226D5
        call    fn_22731
br_226D5:
        and     al, 1fh
        inc     al
        mov     byte ptr es:[bx+580h], al
        mov     al, 0
        test    byte ptr ds:[bp+2], 4
        je      br_226E9
        mov     al, 1
br_226E9:
        mov     byte ptr es:[bx+5c0h], al
        mov     byte ptr es:[bx+680h], 5
        test    byte ptr ds:[bp+2], 1
        jne     br_22701
        or      byte ptr es:[bx+680h], 2
br_22701:
        cmp     byte ptr [A2_B_0348E], 1
        je      br_22711
        mov     al, byte ptr ds:[bp+16h]
        mov     byte ptr es:[bx+600h], al
br_22711:
        pop     cx
        dec     cx
        je      br_22718
        jmp     loop_22689
br_22718:
        mov     al, byte ptr [A2_B_03557]
        mov     byte ptr [A2_B_03FB1], al
        mov     ah, 0
        sub     al, 1
        jne     br_22726
        mov     al, 1
br_22726:
        mov     es, word ptr [A2_W_CONV_SEQ_SEG]
        mov     word ptr es:[14h], ax
        jmp     loop_2206E
fn_22731:
        mov     dx, word ptr ds:[bp+3]
        mov     cx, 10h
        mov     al, 0
tgt_2273A:
        shr     dx, 1
        jb      br_22742
        inc     al
        loop    tgt_2273A
br_22742:
        ret
        PARA_PAD
APPDATA_ORIGIN:
        db      "MPC2KXL ALL 1.00Sequence  "
d_c0_w_0001a:
        db      "  "
d_c0_w_0001c:
        db      "  "
d_c0_w_0001e:
        db      "  "
        db      01h, 00h, 00h, 01h, 01h, 00h, 0b0h, 04h, 04h, 04h, 02h, 00h, 00h, 00h, 00h, 00h
        db      80h, 84h, 1eh, 00h, 80h, 84h, 1eh, 00h, 80h, 84h, 1eh, 00h, 80h, 84h, 1eh, 00h
        db      00h, 00h, 0ffh, 0ffh, 01h

        if      FW_VERSION < 114
FREE_21FD5:
        endif
FREE_22795:
        PAD_TO  APPDATA_SEG*16+00088h-SEGBASE, 000h

        db      "        Device01Device02Device03Device04Device05Device06Device07Device08Device09Device10Device11Device12Device13Device14Device15Device16Device17Device18Device19Device20Device21Device22Device23Device24Device25Device26Device27Device28Device29Device30Device31Device32Track-01        Track-02        Track-03        Track-04        Track-05        Track-06        Track-07        Track-08        Track-09        Track-10        Track-11        Track-12        Track-13        Track-14        Track-15        Track-16        Track-17        Track-18        Track-19        Track-20        Track-21        Track-22        Track-23        Track-24        Track-25        Track-26        Track-27        Track-28        Track-29        Track-30        Track-31        Track-32        Track-33        Track-34        Track-35        Track-36        Track-37        Track-38        Track-39        Track-40        Track-41        Track-42        Track-43        Track-44        Track-45        Track-46        Track-47        Track-48  "
d_a3_b_0048a:
        db      "      Track-49        Track-50        Track-51        Track-52        Track-53        Track-54        Track-55        Track-56        Track-57        Track-58        Track-59        Track-60        Track-61        Track-62        Track-63        "
d_a3_tbl_00580:
        db      "Track-64        "
        if      FW_VERSION < 110

; 0x221f0-0x22230, 64 x 00h -- per-track default, 1 byte/track
FREE_221F0:
FREE_22CE0:
        PAD_TO  (APPDATA_SEG*16+005D0h-SEGBASE)-010h, 000h
d_a3_tbl_005c0:
        PAD_TO  APPDATA_SEG*16+005D0h-SEGBASE, 000h

        elseif  FW_VERSION < 114
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_a3_tbl_005c0:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        endif

; 0x22ce0-0x22d20, 64 x 00h -- per-track default, 1 byte/track
        if      FW_VERSION >= 114
FREE_22CE0:
        PAD_TO  (APPDATA_SEG*16+005D0h-SEGBASE)-010h, 000h
d_a3_tbl_005c0:
        PAD_TO  APPDATA_SEG*16+005D0h-SEGBASE, 000h
        else
FREE_22750:
        endif


; 0x22d20-0x22d60, 64 x 01h -- per-track default, 1 byte/track
FREE_22D20:
        PAD_TO  (APPDATA_SEG*16+00610h-SEGBASE)-010h, 001h
d_a3_tbl_00600:
        PAD_TO  APPDATA_SEG*16+00610h-SEGBASE, 001h


; 0x22d60-0x22da0, 64 x 00h -- per-track default, 1 byte/track
        if      FW_VERSION < 114
FREE_22790:
        endif
FREE_22D60:
        PAD_TO  (APPDATA_SEG*16+00650h-SEGBASE)-010h, 000h
d_a3_tbl_00640:
        PAD_TO  APPDATA_SEG*16+00650h-SEGBASE, 000h


; 0x22da0-0x22de0, 64 x 64h -- per-track default, Velo% 100
        if      FW_VERSION < 114
FREE_227D0:
        endif
FREE_22DA0:
        PAD_TO  (APPDATA_SEG*16+00690h-SEGBASE)-010h, 064h
d_a3_tbl_00680:
        PAD_TO  APPDATA_SEG*16+00690h-SEGBASE, 064h


; 0x22de0-0x22e20, 64 x 06h -- per-track default, 1 byte/track
        if      FW_VERSION < 114
FREE_22810:
        endif
FREE_22DE0:
        PAD_TO  APPDATA_SEG*16+006D0h-SEGBASE, 006h


; 0x22e20-0x22e64, 68 bytes of 00h -- unverified, do not assume free
        if      FW_VERSION < 114
FREE_22850:
; 0x22751-0x2292c, 475 bytes of 00h -- unverified, do not assume free
        endif
FREE_22E20:
        PAD_TO  ((APPDATA_SEG*16+00714h-SEGBASE)-04h)-028h, 000h
d_a3_tbl_006e8:
        PAD_TO  (APPDATA_SEG*16+00714h-SEGBASE)-04h, 000h
d_c0_w_00710:
        PAD_TO  APPDATA_SEG*16+00712h-SEGBASE, 000h
d_a3_w_00712:
        PAD_TO  APPDATA_SEG*16+00714h-SEGBASE, 000h

d_a3_w_00714:
        db      0b0h, 04h
d_a3_b_00716:
        db      01h
d_a3_b_00717:
        db      03h
d_a3_b_00718:
        db      00h
d_a3_b_00719:
        db      00h
d_a3_w_0071a:
        db      00h, 00h
d_a3_b_0071c:
        db      0ch, 00h
d_a3_w_0071e:
        db      00h, 00h
d_a3_w_00720:
        db      00h, 00h
d_a3_b_00722:
        db      00h, 00h
d_a3_b_00724:
        db      00h, 01h, 01h, 64h, 00h
d_a3_b_00729:
        db      00h
d_a3_b_0072a:
        db      01h, 00h
d_a3_b_0072c:
        db      00h
d_a3_b_0072d:
        db      00h
d_a3_b_0072e:
        db      00h
d_a3_b_0072f:
        db      00h
d_a3_b_00730:
        db      7fh
d_a3_b_00731:
        db      40h
d_a3_b_00732:
        db      01h
d_a3_b_00733:
        db      00h
d_a3_b_00734:
        db      01h
d_a3_b_00735:
        db      00h
d_a3_b_00736:
        db      00h
d_a3_b_00737:
        db      00h
d_a3_tbl_00738:
        db      01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0ah, 0bh, 0ch
        db      0dh, 0eh, 0fh, 10h, 11h, 12h, 13h, 14h, 15h, 16h, 17h, 18h, 19h, 1ah, 1bh, 1ch
        db      1dh, 1eh, 1fh, 20h, 21h, 22h, 01h, 00h, 00h, 00h, 00h, 00h, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
d_a3_b_00770:
        db      00h
d_a3_b_00771:
        db      00h
d_a3_b_00772:
        db      00h
d_a3_b_00773:
        db      00h
d_a3_b_00774:
        db      01h
d_a3_b_00775:
        db      00h, 00h
        db      "Song         "
        db      20h, 20h, 20h
d_c0_b_00787:
        db      01h, 00h
d_a3_w_00789:
        db      00h, 00h
d_a3_w_0078b:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
d_a3_b_007b1:
        db      00h, 00h
d_a3_b_007b3:
        db      00h
        db      00h
d_a3_b_007b5:
        db      00h, 00h
d_a3_b_007b7:
        db      00h, 00h
d_a3_b_007b9:
        db      00h, 00h
d_a3_w_007bb:
        db      00h, 00h
d_a3_b_007bd:
        db      00h, 00h
d_a3_b_007bf:
        db      00h
d_a3_b_007c0:
        db      64h
d_a3_b_007c1:
        if      FW_VERSION >= 110
        if      FW_VERSION < 114
FREE_22941:
FREE_22F11:
        if      FW_VERSION >= 112
        PAD_TO  APPDATA_SEG*16+0099Ch-SEGBASE, 000h
        else
        PAD_TO  APPDATA_SEG*16+0091Ah-SEGBASE, 000h
        endif
        endif

        if      FW_VERSION >= 114
; 0x22f11-0x2310a, 505 bytes of 00h -- unverified, do not assume free
FREE_22F11:
        else
FREE_2310A:
        endif
        if      FW_VERSION >= 120
        PAD_TO  APPDATA_SEG*16+009BAh-SEGBASE, 000h
        else
        PAD_TO  APPDATA_SEG*16+00F08h-SEGBASE, 000h
        endif
        else
FREE_22941:
FREE_22F11:
        PAD_TO  (APPDATA_SEG*16+00F08h-SEGBASE)-0453h, 000h
d_a3_b_00ab5:
        PAD_TO  APPDATA_SEG*16+00F08h-SEGBASE, 000h

        endif
APP2_END:
