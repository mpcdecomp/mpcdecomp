/* draft: no function entry: only jumps reach it */
/* asm:
X_058FC:
	mov si, L_063DE
	mov dx, TEXT1_SEG
	mov word ptr [bp-2], dx
	lea ax, [di+0ah]
	push word ptr [bp-6]
	push ax
	push 2
	push 0beh
	push 28h
	push 9
X_05915:
	push 0
	push 0
	callf TEXT2_SEG:voice_trigger_full
X_0591E:
	push word ptr [bp-2]
	push si
	callf TEXT2_SEG:install_handler_15
	pop si
	pop di
	leave
	ret
	db 90h
X_0592C:
	push ds
	push PGM_SLOT
	push 1
	push 1ah
	push 2
	push TEXT2_SEG
	push L_05EEE
	push word TEXT1_SEG
	push L_06570
	callf TEXT2_SEG:seq_write_data
	mov byte ptr [WIN_FIELD_BOX_W], 0ch
	pop si
	pop di
	leave
	ret
*/
