/* draft: no function entry: only jumps reach it */
/* asm:
X_03E00:
	lea ax, [si+FXS_FIELD_0E]
	push word ptr [bp-2]
	push ax
	push 22h
	push 40h
	push 2
	push 31h
	push 0bh
X_03E11:
	push 0
	push 0
	push TEXT2_SEG
	push fx_redraw
	callf TEXT2_SEG:status_read_6A_3
	callf TEXT2_SEG:win_keys_merge_disable
	mov byte ptr [WIN_FIELD_BOX_W], 12h
L_03E2A:
	dec byte ptr [G_FLAG_1589]
L_03E2E:
	pop si
	leave
	ret
	db 00h
*/
