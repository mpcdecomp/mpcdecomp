/* differs: +12 mov byte ptr 2 [bx],71 | mov bx, word ptr [bp + 6] */
extern char B_9D36;

far_cc3c7(a0)
char *a0;
{
	*a0 = -16;
	a0[1] = B_9D36;
	a0[2] = 71;
	a0[3] = 0;
	a0[4] = 68;
	a0[5] = 69;
	return;
}
