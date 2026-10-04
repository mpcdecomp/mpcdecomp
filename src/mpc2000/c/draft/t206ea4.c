/* draft: no function entry: only jumps reach it */
/* asm:
X_07282:
	mov al, byte ptr [G_PAD_NOTE_BASE]
	sub ah, ah
	push ax
	nop
	push cs
	call note_clamp_flag
	mov bx, ax
	mov es, dx
	mov al, byte ptr es:[bx+1]
	sub al, 32h
	mov byte ptr [G_EDIT_FIELD_VAL], al
	push ds
	push G_EDIT_FIELD_VAL
	push -32h
	push 32h
	push 2
	mov al, byte ptr [bp-1]
	push ax
	mov al, byte ptr [bp-2]
	push ax
	push 0
	push 0
	push TEXT2_SEG
	push mix_pan_store
	nop
	push cs
	call field_register_s8
	leave
	retf
	db 90h
X_072BE:
	mov al, byte ptr [G_PAD_NOTE_BASE]
	sub ah, ah
	push ax
	nop
	push cs
	call note_range_clamp
	mov bx, ax
	mov es, dx
	mov al, byte ptr es:[bx+2]
	mov byte ptr [G_EDIT_FIELD_VAL], al
	push ds
	push G_EDIT_FIELD_VAL
	push 0
	push 64h
	push 3
	mov al, byte ptr [bp-1]
	push ax
	mov al, byte ptr [bp-2]
	push ax
	push 0
	push 0
	push TEXT2_SEG
	push L_07136
	jmp SHORT X_0727B
*/
