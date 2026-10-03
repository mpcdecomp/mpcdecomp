/* draft: hand asm in the original (register interface, no C source); stays out of match/ */
/* asm:
string_scan_sysex:
	enter 8, 0
	mov cx, word ptr [bp+4]
	mov byte ptr [bp-8], 0f0h
	mov byte ptr [bp-7], 7eh
	mov byte ptr [bp-5], 3
	mov al, byte ptr [bp+6]
	mov byte ptr [bp-6], al
	mov ax, cx
	and cl, 7fh
	mov byte ptr [bp-4], cl
	add ax, ax
	mov al, ah
	mov byte ptr [bp-3], ah
	mov byte ptr [bp-2], 0f7h
	lea ax, [bp-8]
	push ss
	push ax
	push 7
	call int4A_sysex_wrapper
	leave
	ret 4
*/
