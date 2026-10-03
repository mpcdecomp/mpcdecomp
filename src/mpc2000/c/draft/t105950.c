/* draft: no function entry: only jumps reach it */
/* asm:
X_058D0:
	mov si, L_0620E
	mov dx, TEXT1_SEG
	mov word ptr [bp-2], dx
	lea ax, [di+0dh]
	push word ptr [bp-6]
	push ax
	push word -TUNE_MAX
	push word TUNE_MAX
	push 3
	push 0dch
	push 0ch
	push 0
	push 0
	push 0
	push 0
	callf TEXT2_SEG:status_read_6A_2
	jmp SHORT X_0591E
*/
