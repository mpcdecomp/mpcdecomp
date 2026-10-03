/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
smem_read_word:
	push bp
	mov bp, sp
	call smem_read_byte
	in al, dx
	sub ah, ah
	leave
	ret
	db 00h
*/
