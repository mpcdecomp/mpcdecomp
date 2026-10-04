/* draft: no function entry: only jumps reach it */
/* asm:
X_008A8:
	mov si, TBL_00EE
	mov di, word ptr [bp-2]
X_008AE:
	lea ax, [bp-0eh]
	push ss
	push ax
	push word ptr [si+2]
	push word ptr [si]
	callf TEXT1_SEG:__fstricmp
	add sp, 8
	or ax, ax
	je X_008D2
	inc di
	add si, 8
	mov ax, word ptr [si+2]
	or ax, word ptr [si]
	jne X_008AE
	jmp SHORT X_00934
	db 90h
X_008D2:
	cmp di, 2
	jge X_008F4
	mov si, word ptr [bp-0ah]
	push 10h
	push word ptr [bp-8]
	push si
	lea ax, [bp-20h]
	push ss
	push ax
	callf TEXT1_SEG:__fstrncpy
	add sp, 0ah
	mov byte ptr [bp-10h], 0
	jmp SHORT X_00905
	db 90h
X_008F4:
	mov si, word ptr [bp-0ah]
	lea ax, [bp-20h]
	push ss
	push ax
	push word ptr [bp-8]
	push si
	nop
	push cs
	call bcd_arithmetic_1
X_00905:
	mov dx, word ptr [bp+8]
	mov ax, word ptr [bp+4]
	push dx
	push ax
	mov cx, word ptr [bp+0ch]
	mov si, cx
	push cx
	push ax
	push word ptr [bp+10h]
	push cx
	push word ptr [bp-4]
	push word ptr [bp-6]
	lea ax, [bp-20h]
	push ss
	push ax
	mov bx, di
	shl bx, 3
	callf [bx+TBL_00EE+4]
	add sp, 14h
	mov word ptr [bp+12h], ax
	jmp SHORT L_0093F
*/
