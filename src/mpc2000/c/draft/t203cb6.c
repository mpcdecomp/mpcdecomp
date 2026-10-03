/* draft: not lifted */
/* asm:
L_03D56:
	push ds
	mov cx, DATA_SEG
	mov ds, cx
	cmp byte ptr [G_PAD_INDEX], 0fh
	jae L_03D67
	inc byte ptr [G_PAD_INDEX]
L_03D67:
	pop ds
	retf
	db 00h
*/
