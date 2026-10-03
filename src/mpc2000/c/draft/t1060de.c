/* draft: no function entry: only jumps reach it */
/* asm:
X_0605E:
	lea ax, [si+0dh]
	push dx
	push ax
	push word -TUNE_MAX
	push word TUNE_MAX
	push 3
	push 61h
	push 1ch
	push 0
	push 0
	push 0
	push 0
	callf TEXT2_SEG:status_read_6A_2
	pop si
	ret
*/
