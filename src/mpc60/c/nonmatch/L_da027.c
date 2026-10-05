/* differs: +21 mov ax,word ptr 6[bp] | mov bx, word ptr [bp + 6] */
extern char B_9041_V112;

L_da027(a0)
{
	unsigned char v1;
	register int r1;

	if ((v1 = B_9041_V112) >= 32)
		return 1;
	r1 = v1;
	return *(char *)(a0 + r1);
}
