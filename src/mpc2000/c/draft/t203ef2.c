/* draft: no function entry: only jumps reach it */
/* asm:
tgt_0403C:
	push word ptr [bp-2]
	nop
	push cs
	call note_range_clamp
	mov es, dx
	mov bx, ax
	mov ax, si
	mov byte ptr es:[bx+PGM_MIX_FX_LEVEL], al
	pop si
	pop di
	leave
	retf 6
*/
