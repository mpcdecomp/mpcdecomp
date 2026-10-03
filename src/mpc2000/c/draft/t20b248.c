/* draft: no function entry: only jumps reach it */
/* asm:
tgt_0B680:
	imul bx, word ptr [bp-2], 3bh
	mov word ptr [bp-0eh], bx
	cmp byte ptr [bx+TBL_MPC60_SND_HDR], 0
	jne br_0B691
	jmp br_0B795
br_0B691:
	cmp byte ptr [G_SMEM_STATE_B], 0
	je br_0B6A2
	mov ax, word ptr [bx+TBL_5BDA]
	add ax, word ptr [bx+TBL_5BDC]
	jmp br_0B6AB
br_0B6A2:
	push word ptr [bx+P_5BEA]
	nop
	push cs
	call midi_out_io2
br_0B6AB:
	mov bx, di
	mov es, word ptr [bp-6]
	imul cx, si, PGM_PAD_STRIDE
	add bx, cx
	mov word ptr [bp-12h], bx
	mov word ptr [bp-10h], es
	mov word ptr es:[bx+PGM_PADS+PGM_PAD_TUNE], ax
	mov bx, word ptr [bp-0eh]
	push word ptr [bx+P_5BE6]
	push 1
	nop
	push cs
	call midi_io_chain
	les bx, [bp-12h]
	mov byte ptr es:[bx+2dh], al
	mov bx, word ptr [bp-0eh]
	push word ptr [bx+P_5BE8]
	push 1
	nop
	push cs
	call midi_io_chain
	les bx, [bp-12h]
	mov byte ptr es:[bx+2eh], al
	cmp byte ptr [G_SMEM_STATE_B], 0
	je br_0B700
	mov bx, word ptr [bp-0eh]
	mov al, byte ptr [bx+TBL_5BED]
	les bx, [bp-12h]
	mov byte ptr es:[bx+35h], al
	jmp br_0B708
br_0B700:
	les bx, [bp-12h]
	mov byte ptr es:[bx+35h], 64h
br_0B708:
	cmp byte ptr [G_SMEM_STATE_B], 0
	je br_0B726
	mov bx, word ptr [bp-0eh]
	push word ptr [bx+P_5BF0]
	push 1
	nop
	push cs
	call midi_io_chain
	les bx, [bp-12h]
	mov byte ptr es:[bx+36h], al
	jmp br_0B72E
br_0B726:
	les bx, [bp-12h]
	mov byte ptr es:[bx+36h], 0
br_0B72E:
	cmp byte ptr [G_SMEM_STATE_B], 0
	je br_0B74C
	mov bx, word ptr [bp-0eh]
	push word ptr [bx+P_5BF2]
	push 1
	nop
	push cs
	call midi_io_chain
	les bx, [bp-12h]
	mov byte ptr es:[bx+37h], al
	jmp br_0B754
br_0B74C:
	les bx, [bp-12h]
	mov byte ptr es:[bx+PGM_PADS+PGM_PAD_V_START], 0
br_0B754:
	mov al, 19h
	mov bx, word ptr [bp-0eh]
	imul byte ptr [bx+TBL_5BF5]
	cwd
	and dx, 1fh
	add ax, dx
	sar ax, 5
	mov bx, di
	mov es, word ptr [bp-6]
	mov cx, si
	add cx, si
	add cx, si
	add cx, cx
	add bx, cx
	mov byte ptr es:[bx+PGM_MIX], al
	mov al, 19h
	mov cx, bx
	mov bx, word ptr [bp-0eh]
	imul byte ptr [bx+TBL_5BF6]
	cwd
	and dx, 1fh
	add ax, dx
	sar ax, 5
	mov bx, cx
	mov byte ptr es:[bx+PGM_MIX+PGM_MIX_PAN], al
br_0B795:
	inc word ptr [bp-4]
	cmp word ptr [bp-4], 22h
	jge br_0B7A1
	jmp loop_0B65E
br_0B7A1:
	mov si, word ptr [bp-8]
	les bx, [bp-0ch]
	mov al, byte ptr es:[bx]
	cbw
	mov di, ax
	sub di, 23h
	imul bx, di, PGM_PAD_STRIDE
	mov ax, word ptr [bp-6]
	add bx, si
	mov es, ax
	mov byte ptr es:[bx+PGM_PADS+PGM_PAD_MODE], 3
	mov bx, si
	imul cx, di, PGM_PAD_STRIDE
	add bx, cx
	mov cx, ax
	mov byte ptr es:[bx+24h], 0eh
	mov dx, bx
	les bx, [bp-0ch]
	mov al, byte ptr es:[bx+1]
	mov bx, dx
	mov es, cx
	mov byte ptr es:[bx+25h], al
	mov byte ptr es:[bx+26h], 2ah
	les bx, [bp-0ch]
	mov al, byte ptr es:[bx+MPC_SECONDARY_state_word]
	mov bx, dx
	mov es, cx
	mov byte ptr es:[bx+PGM_PADS+PGM_PAD_ALT2], al
	les bx, [bp-0ch]
	mov al, byte ptr es:[bx+1]
	mov bx, dx
	mov es, cx
	mov byte ptr es:[bx+PGM_PADS+PGM_PAD_MUTE1], al
	les bx, [bp-0ch]
	mov al, byte ptr es:[bx+MPC_SECONDARY_state_word]
	mov bx, dx
	mov es, cx
	mov byte ptr es:[bx+2ah], al
	mov byte ptr es:[bx+PGM_PADS+PGM_PAD_DCY_MODE], 1
	lea ax, [di+23h]
	mov es, word ptr [bp-6]
	mov byte ptr es:[si+PGM_HDR_NOTE], al
	mov es, cx
	mov byte ptr es:[bx+PGM_PADS+PGM_PAD_FIELD_1B], 1
	mov word ptr [bp-4], 1
	mov si, word ptr [bp-4]
loop_0B82E:
	cmp byte ptr [si+TBL_6459], 0
	jle tgt_0B89B
	les bx, [bp-0ch]
	mov al, byte ptr es:[bx+si+2]
	cbw
	mov di, ax
	cmp byte ptr [si+TBL_6479], 1
	jne tgt_0B85E
	imul bx, di, PGM_PAD_STRIDE
	add bx, word ptr [bp-8]
	mov es, word ptr [bp-6]
	mov word ptr [bp-12h], bx
	mov word ptr [bp-10h], es
	mov byte ptr es:[bx-PGM_PAD_BIAS+PGM_PAD_MODE], 2
	jmp tgt_0B873
	db 90h
tgt_0B85E:
	imul bx, di, PGM_PAD_STRIDE
	add bx, word ptr [bp-8]
	mov es, word ptr [bp-6]
	mov word ptr [bp-12h], bx
	mov word ptr [bp-10h], es
	mov byte ptr es:[bx-PGM_PAD_BIAS+PGM_PAD_MODE], 1
tgt_0B873:
	mov al, byte ptr [si+TBL_6459]
	cbw
	mov bx, ax
	add bx, word ptr [bp-0ch]
	mov es, word ptr [bp-0ah]
	mov al, byte ptr es:[bx+1]
	les bx, [bp-12h]
	mov byte ptr es:[bx-PGM_PAD_BIAS+PGM_PAD_ALT1], al
	mov al, byte ptr [si+TBL_6499]
	mov byte ptr es:[bx-PGM_PAD_BIAS+PGM_PAD_SW1], al
	mov byte ptr es:[bx-PGM_PAD_BIAS+PGM_PAD_SW2], 7fh
tgt_0B89B:
	inc si
	cmp si, 20h
	jl loop_0B82E
	nop
	push cs
	call sample_process_2
	pop si
	pop di
	leave
	retf
*/
