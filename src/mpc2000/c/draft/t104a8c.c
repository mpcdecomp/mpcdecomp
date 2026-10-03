/* draft: no function entry: only jumps reach it */
/* asm:
X_04A06:
	lea ax, [si+2]
	push dx
	push ax
	push 0
	push 5ah
	push 2
	push 61h
	push 15h
	push 0
	push 0
	push TEXT2_SEG
	push far_04B42
	callf TEXT2_SEG:status_read_6A
	jmp NEAR L_04AE1
	db 90h
X_04A28:
	cmp byte ptr es:[si], 3
	jle X_04A38
	mov ax, si
	mov dx, es
	add ax, 9
	jmp SHORT X_04A3F
	db 90h
X_04A38:
	mov ax, si
	mov dx, es
	add ax, 7
X_04A3F:
	push dx
	push ax
	push 0
	push 63h
	push 2
	push 61h
	push 1fh
X_04A4B:
	push 0
	push 0
	push TEXT2_SEG
	push far_04B42
	callf TEXT2_SEG:status_read_6A_3
	jmp NEAR L_04AE1
	db 90h
X_04A5E:
	mov ax, si
	mov dx, es
	add ax, 8
	push dx
	push ax
	push 0
	push 63h
	push 2
	push 61h
	push 29h
	jmp SHORT X_04A4B
	db 90h
X_04A74:
	mov ax, si
	mov dx, es
	add ax, 4
	push dx
	push ax
	push 0
	push 63h
	push 2
	push 0c7h
	push 15h
	jmp SHORT X_04A4B
*/
