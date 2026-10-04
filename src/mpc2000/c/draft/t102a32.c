/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
v53_read_timer:
	push bp
	mov bp, sp
	mov dx, 0fffch
	in al, dx
	mov ah, al
	mov dx, 0fffbh
	in al, dx
	and al, 0f0h
	leave
	ret
	db 00h
*/
