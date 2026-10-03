/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
note_clamp_multi:
	push bp
	mov bp, sp
	push di
	push si
	cmp byte ptr [RECORD_MIX_CHANGES], 0
	je br_03FBF
	push ds
	push si
	push di
	push bp
	mov ah, byte ptr [bp+0ah]
	mov al, byte ptr [bp+8]
	mov cl, byte ptr [bp+6]
	int 48h
	pop bp
	pop di
	pop si
	pop ds
br_03FBF:
	pop si
	pop di
	leave
	retf 6
	db 00h
*/
