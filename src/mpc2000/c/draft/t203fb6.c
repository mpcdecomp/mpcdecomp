/* draft: not lifted */
/* asm:
read_io_chain:
	push bp
	mov bp, sp
	push ds
	push P_9D89
	push -0dh
	push 2
	push 2
	mov al, byte ptr [bp+8]
	push ax
	mov al, byte ptr [bp+6]
	push ax
	push 0
	push 0
	push TEXT2_SEG
	push L_040F4
	nop
	push cs
	call field_register_s8
	mov byte ptr [WIN_FIELD_BOX_W], 1eh
	nop
	push cs
	call win_keys_merge_disable
	nop
	push cs
	call far_02DC8
	leave
	retf 4
	db 00h
*/
