/* draft: no function entry: only jumps reach it */
/* asm:
X_07388:
	mov al, byte ptr [G_PAD_NOTE_BASE]
	sub ah, ah
	push ax
	nop
	push cs
	call note_range_clamp
	mov bx, ax
	mov es, dx
	mov al, byte ptr es:[bx+3]
	and al, 80h
	cmp al, 1
	sbb al, al
	inc al
	mov byte ptr [G_EDIT_FIELD_VAL], al
	push ds
	push G_EDIT_FIELD_VAL
	push 1
	mov al, byte ptr [bp-1]
	push ax
	mov al, byte ptr [bp-2]
	push ax
	push 4
	push TEXT2_SEG
	push timer_poll_wait_5
X_073BC:
	nop
	push cs
	call voice_trigger_full
X_073C1:
	leave
	retf
	db 00h
*/
