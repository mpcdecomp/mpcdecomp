/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
int4A_sysex_wrapper:
	push bp
	mov bp, sp
	push si
	mov ah, byte ptr [SDS_TX_PORT]
	les si, [bp+6]
	mov cx, word ptr [bp+4]
	jcxz br_0AA06
tgt_0A9FE:
	mov al, byte ptr es:[si]
	int 4ah
	inc si
	loop tgt_0A9FE
br_0AA06:
	pop si
	leave
	ret 6
	db 00h
*/
