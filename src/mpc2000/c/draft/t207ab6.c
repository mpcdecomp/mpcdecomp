/* draft: no function entry: only jumps reach it */
/* asm:
X_07E94:
	sub ax, ax
	mov word ptr [bp-2], ax
	mov word ptr [bp-4], ax
	mov ax, word ptr [G_ZONE_START]
	mov dx, word ptr [G_ZONE_START_HI]
	jmp SHORT X_07EEA
	db 90h
X_07EA6:
	mov ax, word ptr [G_ZONE_END]
	mov dx, word ptr [ZONE_END_HI]
	mov word ptr [bp-4], ax
	mov word ptr [bp-2], dx
L_07EB3:
	les bx, [SND_CURRENT]
	jmp SHORT L_07EE2
	db 90h
X_07EBA:
	sub ax, ax
	mov word ptr [bp-2], ax
	mov word ptr [bp-4], ax
	les bx, [SND_CURRENT]
	mov ax, word ptr es:[bx+14h]
	mov dx, word ptr es:[bx+16h]
	jmp SHORT X_07EEA
*/
