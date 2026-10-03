/* draft: no function entry: only jumps reach it */
/* asm:
	mov ax, si
	mov cx, ds
	shl cx, 4
	sub ax, cx
	sub ax, BUF_XFER
	shr ax, 1
	pop si
	leave
	retf
	db 00h
*/
