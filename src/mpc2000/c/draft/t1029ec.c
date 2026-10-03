/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
smem_read_byte:
	push bp
	mov bp, sp
	mov dh, 0ffh
	in al, dx
	mov ah, al
	mov dl, 0feh
	in al, dx
	and al, 1
	mov cl, al
	mov al, 0f9h
	sar al, cl
	and ah, al
	shr ch, cl
	or ah, ch
	mov dl, 0fch
	in al, dx
	mov dh, al
	mov dl, ah
	leave
	ret
*/
