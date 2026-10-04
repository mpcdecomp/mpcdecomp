/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
int4B_wrapper:
	push bp
	mov bp, sp
	push di
	push si
	push bp
	push ds
	push di
	push si
	int 4bh
	pop si
	pop di
	pop ds
	pop bp
	pop si
	pop di
	leave
	retf
	db 00h
*/
