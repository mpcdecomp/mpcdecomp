/* draft: no function entry: only jumps reach it */
/* asm:
X_049C8:
	cmp byte ptr [G_SEQ_MODE], 2
	jge X_049DA
	mov al, byte ptr [WIN_FIELD_DIGITS]
	sub al, byte ptr [G_SEQ_MODE]
	add al, 2
	jmp SHORT X_049E3
*/
