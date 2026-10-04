/* draft: not lifted */
/* asm:
L_03808:
	cmp byte ptr [G_FLAG_8CA8], 0
	je X_03840
	mov al, byte ptr [WIN_FIELD_BOX_R]
	sub ah, ah
	add ax, 6
	push ax
	mov al, byte ptr [WIN_FIELD_BOX_B]
	sub ah, ah
	push ax
	push 6
	push 0
	nop
	push cs
	call cmd_param_setup
	mov al, byte ptr [WIN_FIELD_X]
	sub ah, ah
	push ax
	mov al, byte ptr [EDIT_FIELD_Y]
	push ax
	push word ptr [NUM_ENTRY_VALUE]
	mov al, byte ptr [WIN_FIELD_DIGITS]
	cbw
	push ax
	nop
	push cs
	call ratio_calc_divide
	retf
*/
