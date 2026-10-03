/* draft: no function entry: only jumps reach it */
/* asm:
T2_br_07CB8:
	nop
	push cs
	call sample_caller_setup
	or ax, ax
	jne br_07CCA
	mov word ptr [G_ERRNO], ERR_SOUND_DIR_FULL
	jmp loop_07CAF
	db 90h
br_07CCA:
	les bx, [bp+6]
	mov bx, word ptr es:[bx+MPC_STATE_cache_lo]
	mov ax, bx
	shl bx, 2
	add bx, ax
	add bx, bx
	push word ptr [bx+SMEM_POOL_LEN_HI]
	push word ptr [bx+SMEM_POOL_LEN]
	callf TEXT1_SEG:smem_alloc
	mov word ptr [bp-2], ax
	inc ax
	jne br_t2_07CF6
	mov word ptr [G_ERRNO], ERR_NO_MEMORY
	jmp loop_07CAF
	db 90h
br_t2_07CF6:
	les bx, [bp+6]
	mov si, word ptr es:[bx+MPC_STATE_cache_lo]
	mov ax, si
	shl si, 2
	add si, ax
	add si, si
	push word ptr [si+SMEM_POOL_BASE_HI]
	push word ptr [si+SMEM_POOL]
	mov di, word ptr [bp-2]
	mov ax, di
	shl di, 2
	add di, ax
	add di, di
	push word ptr [di+SMEM_POOL_BASE_HI]
	push word ptr [di+SMEM_POOL]
	push word ptr [si+SMEM_POOL_LEN_HI]
	push word ptr [si+SMEM_POOL_LEN]
	nop
	push cs
	call smem_copy_buffered
	mov ax, word ptr [bp+6]
	mov dx, word ptr [bp+8]
	push ds
	lea di, [bp-38h]
	mov si, ax
	push ss
	pop es
	mov ds, dx
	mov cx, 1bh
	rep movsw
	pop ds
	push ds
	lea si, [bp-38h]
	mov cx, ss
	mov ds, cx
	les di, [bp+0ah]
	mov cx, 0ffffh
	xor ax, ax
	repne scasb
	not cx
	sub di, cx
	xchg di, si
	push ds
	push es
	pop ds
	pop es
	shr cx, 1
	rep movsw
	adc cx, cx
	rep movsb
	pop ds
	mov ax, word ptr [bp-2]
	mov word ptr [bp-8], ax
	sub sp, 36h
	push ds
	lea si, [bp-38h]
	mov di, sp
	add di, 2
	push ss
	pop es
	push ss
	pop ds
	mov cx, 1bh
	rep movsw
	pop ds
	nop
	push cs
	call sample_pool_add
	pop si
	pop di
	leave
	retf 8
	db 90h
X_07D92:
	push ds
	mov cx, DATA_SEG
	mov ds, cx
	cmp byte ptr [G_SAMPLE_MODE], 1
	jne L_07DB0
	push 0
	push 0
	callf TEXT1_SEG:callback_set_main
	add sp, 4
	mov byte ptr [G_SAMPLE_MODE], 0
L_07DB0:
	pop ds
	retf
*/
