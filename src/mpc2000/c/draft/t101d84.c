/* draft: no function entry: only jumps reach it */
/* asm:
dsp_01D84:
	sub cx, ax
	sbb bp, dx
	jb dsp_01D8F
	cmp bp, word ptr [bx+0ah]
	jae dsp_01D92
dsp_01D8F:
	mov bp, word ptr [bx+0ah]
dsp_01D92:
	mov word ptr [bx+8], bp
	mov word ptr [bx+6], cx
	mov al, byte ptr [B_4ECA]
	xchg byte ptr [G_DSP_CHAN], al
	push ax
	mov ax, 92h
	add al, byte ptr [G_DSP_CHAN]
	out ASIC_REG, ax
	mov ax, bp
	out ASIC_DATA, ax
	mov ax, 94h
	add al, byte ptr [G_DSP_CHAN]
	out ASIC_REG, ax
	mov ax, bp
	out ASIC_DATA, ax
	add cx, cx
	adc bp, bp
	add cx, cx
	adc bp, bp
	mov cx, 0ffffh
	sub cx, bp
	mov ax, word ptr [bx+10h]
	mul cx
	mov ax, 8ch
	add al, byte ptr [G_DSP_CHAN]
	out ASIC_REG, ax
	mov ax, dx
	out ASIC_DATA, ax
	mov ax, 90h
	add al, byte ptr [G_DSP_CHAN]
	out ASIC_REG, ax
	mov ax, dx
	out ASIC_DATA, ax
	mov ax, word ptr [bx+12h]
	mul cx
	neg dx
	mov ax, 7ch
	add al, byte ptr [G_DSP_CHAN]
	out ASIC_REG, ax
	mov ax, dx
	out ASIC_DATA, ax
	mov ax, 7eh
	add al, byte ptr [G_DSP_CHAN]
	out ASIC_REG, ax
	mov ax, dx
	out ASIC_DATA, ax
	pop ax
	mov byte ptr [G_DSP_CHAN], al
	ret
*/
