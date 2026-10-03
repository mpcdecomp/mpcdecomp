/* draft: no function entry: only jumps reach it */
/* asm:
t2_program_copy:
	mov word ptr [G_ERRNO], ERR_PROG_DIR_FULL
br_06654:
	cmp word ptr [G_ERRNO], ERR_UNKNOWN
	je L_06660
	nop
	push cs
	call err_msg_report
L_06660:
	nop
	push cs
L_06662:
	call program_close
	pop ds
	pop si
	pop di
	leave
	retf
L_0666A:
	push ds
	mov cx, DATA_SEG
	mov ds, cx
	push cx
	push DL_CREATE_NEW_PROGRAM
L_06674:
	callf TEXT1_SEG:disp_list_run
	push 7fh
	push 13h
	push ds
	push TBL_SOUND_NAMES
	nop
	push cs
	call cmd_dispatch_1E
	push 0c1h
	push 25h
	mov al, byte ptr [COPY_PGM_TO]
	cbw
	inc ax
	cwd
	push dx
	push ax
	push 3
	nop
	push cs
	call draw_unsigned_value
	cmp byte ptr [COPY_PGM_CURSOR], 0
	jne L_066B2
	push 49h
	push 1ch
	push word ptr [PTR_STR_PRESS_ENTER_SEG]
	push word ptr [PTR_STR_PRESS_ENTER]
	nop
	push cs
	call cmd_dispatch_1E
L_066B2:
	nop
	push cs
L_066B4:
	call field_redraw
	pop ds
	retf
	db 00h
*/
