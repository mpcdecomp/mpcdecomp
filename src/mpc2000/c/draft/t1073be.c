/* draft: not lifted */
/* asm:
L_0733E:
	push ds
	mov cx, DATA_SEG
	mov ds, cx
	cmp word ptr [SAMPLE_TIME], 0
	je br_07372
	cmp byte ptr [P_9D40], 0
	je br_0736A
	mov byte ptr [G_SAMPLE_MODE], 1
	call io_near_stub
	cmp byte ptr [SAMPLE_THRESHOLD], 0c1h
	jge L_07383
	call fn_07030
	call fn_0704C
	pop ds
	retf
	db 90h
br_0736A:
	nop
	push cs
	call far_067A6
	jmp L_07380
	db 90h
br_07372:
	push ds
	push STR_TIME_TOO_SHORT
	callf TEXT2_SEG:string_fill_stosb
	mov byte ptr [REC_CURSOR], 4
L_07380:
	call rec_arm_field
L_07383:
	pop ds
	retf
	db 00h
*/
