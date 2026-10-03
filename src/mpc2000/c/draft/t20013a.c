/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
int43_wrapper:
	push bp
	mov bp, sp
	push di
	push si
	push bp
	push ds
	push di
	push si
	mov ax, word ptr [bp+6]
	int 43h
	pop si
	pop di
	pop ds
	pop bp
	pop si
	pop di
	leave
	retf 2
*/
