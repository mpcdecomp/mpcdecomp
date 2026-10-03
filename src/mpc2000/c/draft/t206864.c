/* draft: no function entry: only jumps reach it */
/* asm:
X_06C42:
	push di
	nop
	push cs
	call note_range_clamp
	mov word ptr [bp-4], ax
	mov word ptr [bp-2], dx
	imul di, di, PGM_PAD_STRIDE
	les bx, [PGM_CURRENT]
	mov ax, word ptr es:[bx+di-PGM_PAD_BIAS]
	mov dx, word ptr es:[bx+di-PGM_PAD_BIAS+PGM_PAD_SND_SEG]
	mov si, ax
	mov word ptr [bp-8], dx
	push 12h
	mov ax, word ptr [bp+8]
	add ax, 7
	push ax
	les bx, [bp-4]
	mov al, byte ptr es:[bx+PGM_MIX_IVOL]
	cbw
	add ax, 2
	mov cx, 3
	cwd
	idiv cx
	mov cx, ax
	sub ax, 31h
	neg ax
	push ax
	push 4
	push cx
	nop
	push cs
	call cmd_build_params
	mov ax, word ptr [bp-8]
	or ax, si
	je L_06CA2
	mov es, word ptr [bp-8]
	mov al, byte ptr es:[si+13h]
	cbw
	mov word ptr [bp-6], ax
	jmp br_06CA7
L_06CA2:
	mov word ptr [bp-6], 1
br_06CA7:
	push word ptr [bp+8]
	push 1
	les bx, [bp-4]
	mov al, byte ptr es:[bx+PGM_MIX_IOUT]
	and ax, 0fh
	mov bx, ax
	mov ax, word ptr [bp-6]
	mov cx, ax
	shl ax, 2
	add ax, cx
	add ax, ax
	add bx, ax
	shl bx, 2
	push word ptr [bx+TBL_NOTE_GLYPHS+2]
	push word ptr [bx+TBL_NOTE_GLYPHS]
	nop
	push cs
	call cmd_caller_setup
br_06CD6:
	pop si
	pop di
	leave
	retf 4
*/
