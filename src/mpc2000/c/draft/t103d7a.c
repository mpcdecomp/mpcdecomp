/* draft: no function entry: only jumps reach it */
/* asm:
X_03CF4:
	lea ax, [si+0fh]
	push dx
	push ax
	push -25h
	push 0ch
	push 2
	push 55h
	push 0bh
X_03D03:
	push 0
	push 0
	push TEXT2_SEG
	push fx_redraw
	callf TEXT2_SEG:field_register_s8
	jmp NEAR L_03E2A
	db 90h
X_03D16:
	lea ax, [si+0bh]
	push dx
	push ax
	push 0ch
	push 38h
	push 2
	push 31h
	push 15h
	jmp NEAR X_03E11
*/
