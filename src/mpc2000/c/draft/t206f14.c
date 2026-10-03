/* draft: no function entry: only jumps reach it */
/* asm:
X_072F2:
	mov al, byte ptr [G_PAD_NOTE_BASE]
	sub ah, ah
	push ax
	nop
	push cs
	call note_range_clamp
	mov bx, ax
	mov es, dx
	mov al, byte ptr es:[bx+3]
	and al, 7
	mov byte ptr [G_EDIT_FIELD_VAL], al
	push ds
	push G_EDIT_FIELD_VAL
	push 8
	mov al, byte ptr [bp-1]
	push ax
	mov al, byte ptr [bp-2]
	push ax
	push 4
	push TEXT2_SEG
	push L_07154
	jmp NEAR X_073BC
	db 90h
X_07324:
	mov al, byte ptr [G_PAD_NOTE_BASE]
	sub ah, ah
	push ax
	nop
	push cs
	call note_range_clamp
	mov bx, ax
	mov es, dx
	mov al, byte ptr es:[bx+4]
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
	push L_071AE
	jmp NEAR X_0727B
	db 90h
X_0735A:
	mov al, byte ptr [G_PAD_NOTE_BASE]
	sub ah, ah
	push ax
	nop
	push cs
	call note_range_clamp
	mov bx, ax
	mov es, dx
	mov al, byte ptr es:[bx+5]
	mov byte ptr [G_EDIT_FIELD_VAL], al
	push ds
	push G_EDIT_FIELD_VAL
	push 4
	mov al, byte ptr [bp-1]
	push ax
	mov al, byte ptr [bp-2]
	push ax
	push 3
	push TEXT2_SEG
	push L_071CC
	jmp SHORT X_073BC
*/
