/* draft: no function entry: only jumps reach it */
/* asm:
X_03D28:
	lea ax, [si+0ch]
	push dx
	push ax
	push -25h
	push 0ch
	push 2
	push 55h
	push 15h
	jmp SHORT X_03D03
	db 90h
X_03D3A:
	lea ax, [si+0dh]
	push dx
	push ax
	push 0
	push 63h
	push 2
	push 7fh
L_03D47:
	push 15h
L_03D49:
	push 0
	push 0
L_03D4D:
	push TEXT2_SEG
	push fx_redraw
	callf TEXT2_SEG:status_read_6A_3
	jmp NEAR L_03E2A
	db 90h
X_03D5C:
	lea ax, [si+12h]
	push dx
	push ax
	push 0
	push 63h
	push 2
	push 9dh
	push 15h
L_03D6C:
	push TEXT2_SEG
	push L_03808
	jmp SHORT L_03D4D
*/
