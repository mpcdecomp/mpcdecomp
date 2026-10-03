/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
lcd_init_setup:
	push bp
	mov bp, sp
	push di
	mov bx, word ptr [bp+6]
	mov ax, bx
	mov cx, bx
	cwd
	sub dh, dh
	add ax, dx
	sar ax, 8
	imul ax, ax, 64h
	mov bx, ax
	mov dx, 100h
	mov di, dx
	mov ax, cx
	cwd
	idiv di
	imul ax, dx, 64h
	add ax, 80h
	cwd
	sub dh, dh
	add ax, dx
	sar ax, 8
	add ax, bx
	pop di
	leave
	retf 2
	db 00h
*/
