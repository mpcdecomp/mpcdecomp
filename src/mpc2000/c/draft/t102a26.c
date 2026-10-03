/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
smem_word_wrapper:
	push bp
	mov bp, sp
	mov dl, 0f8h
	mov ch, 2
	call smem_read_word
	leave
	retf
*/
