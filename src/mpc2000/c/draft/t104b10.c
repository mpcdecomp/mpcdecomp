/* draft: no function entry: only jumps reach it */
/* asm:
X_04A8A:
	lea ax, [si+5]
	push dx
	push ax
	push 0
	push 28h
	push 2
	push 0c7h
	push 1fh
X_04A9A:
	push 0
	push 0
	push TEXT2_SEG
	push far_04B42
	callf TEXT2_SEG:status_read_6A_3
	callf TEXT2_SEG:win_keys_merge_disable
	mov byte ptr [WIN_FIELD_BOX_W], 12h
	jmp SHORT L_04AE1
	db 90h
X_04AB6:
	mov ax, si
	mov dx, es
	add ax, 6
	push dx
	push ax
	push 28h
	push 42h
	push 2
	push 0c7h
	push 29h
	jmp SHORT X_04A9A
br_04ACC:
	push dx
	push si
	push 6
	push 31h
	push 0bh
	push 0bh
	push TEXT2_SEG
	push far_04B42
	callf TEXT2_SEG:voice_trigger_full
L_04AE1:
	dec byte ptr [G_FLAG_1589]
X_04AE5:
	pop si
	ret
	db 00h
*/
