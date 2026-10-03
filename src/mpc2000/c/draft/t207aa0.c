/* draft: no function entry: only jumps reach it */
/* asm:
X_07E7E:
	mov ax, word ptr [G_ZONE_START]
	mov dx, word ptr [G_ZONE_START_HI]
	mov word ptr [bp-4], ax
	mov word ptr [bp-2], dx
	mov ax, word ptr [G_ZONE_END]
	mov dx, word ptr [ZONE_END_HI]
	jmp SHORT X_07EEA
*/
