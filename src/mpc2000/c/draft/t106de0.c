/* draft: no function entry: only jumps reach it */
/* asm:
dma_06D60:
	lea di, [bp-2ch]
	mov si, P_2DDC
	mov ax, ss
	mov es, ax
	mov cx, 16h
	rep movsw
	mov word ptr [bp-2ah], 1000h
	mov word ptr [bp-24h], 1114h
	mov word ptr [bp-22h], 10h
	cmp byte ptr [G_REC_MODE], 2
	je dma_06D88
	jmp dma_06E3A
*/
