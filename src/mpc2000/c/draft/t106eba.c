/* draft: no function entry: only jumps reach it */
/* asm:
dma_06E3A:
	mov word ptr [bp-0ah], 0
	mov word ptr [bp-0ch], 8080h
	push 15h
	lea ax, [bp-2ch]
	push ss
	push ax
	push 1ffeh
	callf TEXT2_SEG:dma_field_write
	cmp byte ptr [P_03C7], 0
	je smem_dma_clear_go
	mov word ptr [bp-0ch], 0
	mov word ptr [bp-0ah], 4000h
	xor si, si
dma_06E66:
	and byte ptr [bp-0ah], 0f0h
	mov al, byte ptr [si+TBL_0C39]
	cbw
	or word ptr [bp-0ah], ax
	lea ax, [si+1]
	push ax
	lea cx, [bp-2ch]
	push ss
	push cx
	push 1ffeh
	callf TEXT2_SEG:dma_field_write
	lea ax, [si+1]
	mov si, ax
	cmp si, 8
	jl dma_06E66
smem_dma_clear_go:
	in al, DMA_STATUS
	and al, 7fh
	mov ah, 1
	out DMA_STATUS, ax
br_06E95:
	pop si
	pop di
	leave
	ret
	db 00h
*/
