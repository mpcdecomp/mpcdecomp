/* draft: no function entry: only jumps reach it */
/* asm:
tgt_0B638:
	push word ptr [bp+10h]
	push word ptr [bp+8]
	push word ptr [bp+6]
	nop
	push cs
	call midi_stop_helper
	mov di, ax
	mov word ptr [bp-6], dx
	mov word ptr [FP_56C2], ax
	mov word ptr [W_56C4], dx
	or dx, ax
	je loop_0B5E7
	mov word ptr [bp-4], 0
	mov word ptr [bp-8], ax
loop_0B65E:
	mov bx, word ptr [bp-4]
	mov al, byte ptr [bx+TBL_MPC60_PAD_SND]
	cbw
	mov word ptr [bp-2], ax
	add bx, word ptr [bp-0ch]
	mov es, word ptr [bp-0ah]
	mov cx, ax
	mov al, byte ptr es:[bx]
	cbw
	mov si, ax
	sub si, 23h
	inc cx
	jne tgt_0B680
	jmp br_0B795
*/
