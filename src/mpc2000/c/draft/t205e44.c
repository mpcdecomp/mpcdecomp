/* draft: not lifted */
/* asm:
L_0619E:
pgm_assign_key:
	push ds
	mov cx, DATA_SEG
	mov ds, cx
	mov ax, word ptr [PGM_CURRENT+2]
	or ax, word ptr [PGM_CURRENT]
	je X_0624C
	mov al, byte ptr [PGM_SLOT]
	cbw
	mov bx, ax
	shl bx, 2
	les bx, [bx+PGM_TABLE]
	cmp word ptr es:[bx], 2
	jbe X_0624C
	callf TEXT1_SEG:pgm_assign_enter
	pop ds
	retf
	db 90h
X_0624C:
	mov word ptr [G_ERRNO], ERR_INTERNAL
	nop
	push cs
	call err_msg_report
	pop ds
	retf
	db 00h
*/
