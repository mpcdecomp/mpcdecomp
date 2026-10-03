/* draft: no function entry: only jumps reach it */
/* asm:
X_07428:
	push ds
	push SAMPLE_TIME
	push 0
	call fn_0683A
	push ax
	push 4
	mov al, byte ptr [REC_TIME_X]
	push ax
	mov al, byte ptr [REC_TIME_Y]
	push ax
	push TEXT2_SEG
	push L_03808
	push 0
	push 0
	callf TEXT2_SEG:status_read_6A
	ret
L_0744C:
	push ds
	push SAMPLE_PREREC
	push 0
	push 64h
	push 3
	mov al, byte ptr [B_2E40]
	push ax
	mov al, byte ptr [B_2E41]
	push ax
	push 0
L_07460:
	push 0
	push 0
	push 0
	callf TEXT2_SEG:status_read_6A_3
	ret
*/
