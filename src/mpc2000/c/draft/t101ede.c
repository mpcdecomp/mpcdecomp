/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
win_keys_merge:
	push bp
	mov bp, sp
	push si
	push di
	push ds
	push bp
	les bp, [bp+6]
	int 30h
	pop bp
	pop ds
	pop di
	pop si
	leave
	retf 4
*/
