/* draft: not lifted */
/* asm:
L_09CE8:
	cmp byte ptr [ZONE_LEN_FIX], 0
	je X_09D06
	mov ax, word ptr [G_ZONE_END]
	mov dx, word ptr [ZONE_END_HI]
	sub ax, word ptr [G_ZONE_LEN]
	sbb dx, word ptr [G_ZONE_LEN_HI]
	mov word ptr [G_ZONE_START], ax
	mov word ptr [G_ZONE_START_HI], dx
	retf
*/
