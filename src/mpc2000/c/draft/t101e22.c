/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
int2F_call_fn5:
	push bp
	mov bp, sp
	push bp
	push si
	push di
	push ds
	mov bl, 5
	int 2fh
	pop ds
	pop di
	pop si
	pop bp
	leave
	retf
	db 00h
*/
