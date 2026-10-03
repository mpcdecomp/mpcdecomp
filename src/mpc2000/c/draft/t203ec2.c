/* draft: no function entry: only jumps reach it */
/* asm:
tgt_0400C:
	push word ptr [bp-2]
	nop
	push cs
	call note_clamp_flag
	mov es, dx
	mov bx, ax
	mov ax, si
	mov byte ptr es:[bx], al
	pop si
	pop di
	leave
	retf 6
	db 90h
tgt_04024:
	push word ptr [bp-2]
	nop
	push cs
	call note_clamp_flag
	mov es, dx
	mov bx, ax
	mov ax, si
	mov byte ptr es:[bx+PGM_MIX_PAN], al
	pop si
	pop di
	leave
	retf 6
*/
