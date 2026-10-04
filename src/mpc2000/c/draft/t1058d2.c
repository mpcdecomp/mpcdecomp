/* draft: no function entry: only jumps reach it */
/* asm:
X_05852:
	mov si, L_05D2A
	mov dx, TEXT1_SEG
	mov word ptr [bp-2], dx
	lea ax, [di+11h]
	push word ptr [bp-6]
	push ax
	push 1
	push 2ch
	push 28h
	push 6
	jmp NEAR X_05915
	db 90h
X_0586E:
	mov ax, T1_L_06702
	mov dx, TEXT1_SEG
	mov si, ax
	mov word ptr [bp-2], dx
	push ds
	push G_PAD_NOTE_BASE
	push 4ah
	push 2
	push 0
	callf TEXT2_SEG:timer_value_read_1
	mov byte ptr [WIN_FIELD_BOX_W], 0a6h
	jmp NEAR X_0591E
*/
