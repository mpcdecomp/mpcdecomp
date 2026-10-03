/* draft: no function entry: only jumps reach it */
/* asm:
X_073D6:
	push ds
	push G_REC_MODE
	push 2
	mov al, byte ptr [REC_MODE_X]
	push ax
	mov al, byte ptr [REC_MODE_Y]
	push ax
	push 7
	push word TEXT1_SEG
	push L_07398
	jmp NEAR L_07482
	db 90h
X_073F0:
	push ds
	push SAMPLE_MONITOR
	push 1
	mov al, byte ptr [B_2E3A]
	push ax
	mov al, byte ptr [B_2E3B]
	push ax
	push 4
	push word TEXT1_SEG
	push L_073A8
	jmp SHORT L_07482
*/
