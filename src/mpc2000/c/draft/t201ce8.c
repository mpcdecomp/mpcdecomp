/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
mpc_poll_data2:
	enter 2, 0
	not word ptr [bp+6]
	pushf
	cli
	mov dx, 0c038h
	in ax, dx
	mov word ptr [bp-2], ax
	or al, 4
	out dx, ax
	mov dx, 0c03fh
	in al, dx
	and al, byte ptr [bp+6]
	sub ah, ah
	out dx, al
	mov ax, word ptr [bp-2]
	mov dx, 0c038h
	out dx, ax
	popf
	leave
	retf 2
	db 00h
*/
