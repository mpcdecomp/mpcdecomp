/* draft: no function entry: only jumps reach it */
/* asm:
X_0580A:
	mov si, L_05D2A
	mov dx, TEXT1_SEG
	mov word ptr [bp-2], dx
	lea ax, [di+0fh]
	push word ptr [bp-6]
	push ax
	push 0
	push 64h
	push 3
	push 2ch
	push 16h
X_05824:
	push 0
	push 0
	push 0
	push 0
	callf TEXT2_SEG:status_read_6A_3
	jmp NEAR X_0591E
L_05834_1:
	mov ax, L_05D2A
	mov dx, TEXT1_SEG
	mov si, ax
	mov word ptr [bp-2], dx
	lea ax, [di+10h]
	push word ptr [bp-6]
	push ax
	push 0
	push 64h
	push 3
	push 2ch
	push 1fh
	jmp SHORT X_05824
*/
