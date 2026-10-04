/* draft: no function entry: only jumps reach it */
/* asm:
tgt_0A2F2:
	cmp word ptr [bp+0ah], 101dh
	jne br_0A312
	cmp word ptr [bp+0ch], 0
	jne br_0A312
	nop
	push cs
	call far_0A682
	pop si
	pop di
	leave
	retf
*/
