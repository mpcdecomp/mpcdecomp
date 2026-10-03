/* draft: no function entry: only jumps reach it */
/* asm:
dsp_01CD4:
	mov byte ptr [bx], ah
	add al, al
	mul byte ptr [bx+1]
	add ax, word ptr [bx+4]
	mov word ptr [bx+4], ax
	shl ax, 1
	jae dsp_01CE7
	not ah
dsp_01CE7:
	sub ah, 80h
	mov al, byte ptr [bx+3]
	imul ah
	add ah, byte ptr [bx+2]
	jns dsp_01CF6
	sub ax, ax
dsp_01CF6:
	cmp ah, 38h
	jbe dsp_01CFE
	mov ax, 3800h
dsp_01CFE:
	mov bl, ah
	mov bh, 0
	add bx, bx
	add bx, P_45A4
	push ds
	mov dx, DATA_SEG
	mov ds, dx
	mov ah, al
	mov al, 0
	mov cx, ax
	not ax
	mul word ptr [bx]
	mov bp, dx
	mov ax, cx
	mul word ptr [bx+2]
	add dx, bp
	pop ds
	mov ax, 238h
	add al, byte ptr [B_4EB0]
	out ASIC_REG, ax
	mov ax, dx
	out ASIC_DATA, ax
	ret
*/
