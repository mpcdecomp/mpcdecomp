/* draft: not lifted */
/* asm:
L_00DA6:
	push ds
	mov cx, DATA_SEG
	mov ds, cx
	push cx
	push P_03FC
	callf TEXT1_SEG:win_keys_merge
	push ds
	push TBL_WINKEYS_00562
	callf TEXT1_SEG:win_keys_merge
	mov word ptr [W_4EFC], 0ffffh
	callf TEXT1_SEG:system_setup_2
	nop
	push cs
	call cmd_far_stub
	callf TEXT1_SEG:X_025D8
	pop ds
	retf
	db 00h
*/
