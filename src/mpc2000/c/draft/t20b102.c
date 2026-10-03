/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
midi_out_io3:
	push bp
	mov bp, sp
	push di
	mov cx, word ptr [bp+6]
	cmp cx, 1
	ja br_0B54E
	mov ax, cx
	pop di
	leave
	retf 2
	db 90h
br_0B54E:
	mov bx, cx
	shr bx, 1
	mov di, 9
loop_0B555:
	mov ax, word ptr [bp+6]
	sub dx, dx
	div bx
	add ax, bx
	shr ax, 1
	mov bx, ax
	dec di
	jne loop_0B555
	pop di
	leave
	retf 2
*/
