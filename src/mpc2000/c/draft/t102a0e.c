/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
smem_byte_wrapper:
	push bp
	mov bp, sp
	call smem_read_byte
	mov al, bl
	out dx, al
	leave
	ret
	db 00h
*/
