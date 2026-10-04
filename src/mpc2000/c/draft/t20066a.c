/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
int2F_bcd_wrapper2:
	push bp
	mov bp, sp
	push bp
	push ds
	mov bl, 1fh
	mov ax, word ptr [bp+6]
	mov dx, word ptr [bp+8]
	int 2fh
	pop ds
	pop bp
	leave
	retf
	db 00h
*/
