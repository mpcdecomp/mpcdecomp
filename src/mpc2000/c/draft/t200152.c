/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
int44_wrapper:
	push bp
	mov bp, sp
	push di
	push si
	push bp
	push ds
	push di
	push si
	mov ax, word ptr [bp+6]
T2_L_0015E:
	int 44h
	pop si
	pop di
	pop ds
	pop bp
	pop si
	pop di
	leave
	retf 2
*/
