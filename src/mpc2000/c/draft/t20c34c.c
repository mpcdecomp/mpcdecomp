/* draft: no function entry: only jumps reach it */
/* asm:
X_0C784:
	lea ax, [bp-2]
	push ss
	push ax
	push 2
	nop
	push cs
	call bcd_display_calc
	or ax, ax
	je br_0C804
	push si
	nop
	push cs
	call ctrl_port_48_B8
	or ax, ax
	je br_0C804
	lea ax, [bp-6]
	push ss
	push ax
	push 2
	nop
	push cs
	call bcd_display_calc
	or ax, ax
	je br_0C804
	push ds
	push B_9D5A
	push 32h
	nop
	push cs
	call bcd_display_calc
	or ax, ax
	je br_0C804
	lea ax, [bp-4]
	push ss
	push ax
	push 2
	nop
	push cs
	call bcd_display_calc
	or ax, ax
	je br_0C804
	push ds
	push P_9DA0
	push word ptr [bp-4]
	nop
	push cs
	call smem_ctrl_setup_2
	or ax, ax
	je br_0C804
	push ds
	push P_8F78
	push 40h
	nop
	push cs
	call ctrl_port_48_read
	or ax, ax
	je br_0C804
	nop
	push cs
	call smem_ctrl_setup_1
	or ax, ax
	je br_0C804
	callf TEXT1_SEG:int2F_dispatch_10
	mov ax, 1
	pop si
	pop di
	leave
	retf 4
	db 90h
br_0C804:
	callf TEXT1_SEG:int2F_dispatch_10
br_0C809:
	xor ax, ax
	pop si
	pop di
	leave
	retf 4
	db 00h
*/
