/* draft: no function entry: only jumps reach it */
/* asm:
dma_0250C:
	xor cx, cx
dma_0250E:
	mov ax, word ptr [bp-8]
	or ah, 7
	out DMA_CTRL, ax
	mov al, byte ptr es:[bx+9]
	cbw
	mov si, ax
	mov al, byte ptr [si+TBL_0C38]
	cbw
	or ax, cx
	out DMA_DATA_HI, ax
	cmp byte ptr es:[bx+0bh], 1
	je dma_02534
	cmp byte ptr es:[bx+0bh], 2
	jne dma_0254F
dma_02534:
	mov al, byte ptr es:[bx+0bh]
	cbw
	mov bx, ax
	cmp byte ptr [bx+TBL_0611], 0
	jne dma_0254F
	mov bx, word ptr [bp+6]
	xor al, al
	mov byte ptr es:[bx+8], al
	mov byte ptr es:[bx+7], al
dma_0254F:
	les bx, [bp+6]
	sub al, al
	mov ah, byte ptr es:[bx+8]
	mov cl, byte ptr es:[bx+7]
	sub ch, ch
	or ax, cx
	out DMA_DATA_LO, ax
	cmp byte ptr es:[bx+0bh], 1
	jl br_02582
	cmp byte ptr es:[bx+0bh], 4
	jg br_02582
	mov ah, byte ptr es:[bx+0bh]
	dec ah
	sub al, al
	mov si, ax
	mov ah, byte ptr es:[bx+0ch]
	mov cx, ax
	jmp br_02587
br_02582:
	mov si, 200h
	xor cx, cx
br_02587:
	sub ah, ah
	mov al, byte ptr es:[bx]
	or ax, si
	push ax
	push cx
	nop
	push cs
	call asic_reg1_write
	pop si
	leave
	retf 4
*/
