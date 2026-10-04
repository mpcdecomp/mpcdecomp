/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
t2_int46_wrapper:
	push bp
	mov bp, sp
	push ds
	mov cx, DATA_SEG
	mov ds, cx
	push bp
	int 46h
	pop bp
	pop ds
	leave
	retf
*/
