/* draft: no function entry: only jumps reach it */
/* asm:
T2_L_0B5FA:
	mov ax, STR_EXT_ST1
br_0B5FD:
	mov cx, ds
	mov di, ax
	mov si, P_56AB
	mov es, cx
	push ds
	mov cx, 0ffffh
	xor ax, ax
	repne scasb
	not cx
	sub di, cx
	push cx
	xchg di, si
	push ds
	push es
	pop ds
	pop es
	mov cx, 0ffffh
	repne scasb
	dec di
	pop cx
	shr cx, 1
	rep movsw
	adc cx, cx
	rep movsb
	pop ds
	cmp word ptr [bp+10h], 2
	jne tgt_0B638
	nop
	push cs
	call tgt_0BC26
	pop si
	pop di
	leave
	retf
*/
