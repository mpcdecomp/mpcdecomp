/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
timer_loop_io:
	push bp
	mov bp, sp
	mov cx, 7d0h
tgt_03B68:
	loop tgt_03B68
	leave
	retf
*/
