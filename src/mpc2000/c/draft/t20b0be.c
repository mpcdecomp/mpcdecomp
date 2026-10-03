/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
int4D_sample_wrapper:
	push bp
	mov bp, sp
	push si
	push bp
	push ds
	int 4dh
	pop ds
	pop bp
	mov ax, si
	mov dx, es
	pop si
	leave
	retf
	db 00h
*/
