/* draft: no function entry: only jumps reach it */
/* asm:
DMA_018EE_V172:
	mov ax, 600h
	out DMA_CTRL, ax
	mov ax, 8000h
	out DMA_DATA_HI, ax
	xor ax, ax
	out DMA_CTRL, ax
	out DMA_ADDR_HI, ax
	mov ax, 610h
	out DMA_CTRL, ax
	mov ax, 8000h
	out DMA_DATA_HI, ax
	mov ax, 10h
	out DMA_CTRL, ax
	xor ax, ax
	out DMA_ADDR_HI, ax
	cmp byte ptr [P_0610], al
	je L_0196A
	cmp byte ptr [B_9D8C], al
	jne L_0193A
	mov ax, 700h
	out DMA_CTRL, ax
	mov ax, 0ff00h
	out DMA_DATA_LO, ax
	xor ax, ax
	out DMA_DATA_HI, ax
	mov ax, 710h
	out DMA_CTRL, ax
	mov ax, 0ffh
	out DMA_DATA_LO, ax
	xor ax, ax
L_01937:
	out DMA_DATA_HI, ax
	retf
L_0193A:
	mov ax, 700h
	out DMA_CTRL, ax
	xor ax, ax
	out DMA_DATA_LO, ax
	mov al, byte ptr [B_9D8C]
	add al, al
	dec al
	cbw
	mov bx, ax
	mov al, byte ptr [bx+TBL_0C38]
	cbw
	add ah, 80h
	out DMA_DATA_HI, ax
	mov ax, 710h
	out DMA_CTRL, ax
	xor ax, ax
	out DMA_DATA_LO, ax
	mov al, byte ptr [bx+TBL_0C39]
	cbw
	add ah, 80h
	jmp L_01937
L_0196A:
	mov ax, 700h
	out DMA_CTRL, ax
	xor ax, ax
	out 8ch, ax
	mov ax, 710h
dac_out_write_d136:
	out DMA_CTRL, ax
	xor ax, ax
	out 8ch, ax
lcd_write_data_D13C:
	retf
	db 00h
*/
