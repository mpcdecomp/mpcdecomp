/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
int2F_bcd_wrapper:
	push bp
	mov bp, sp
	push bp
	push ds
	mov bl, 1eh
	int 2fh
	pop ds
	pop bp
	leave
	retf
	db 00h
*/
