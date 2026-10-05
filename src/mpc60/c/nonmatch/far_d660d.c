/* differs: +14 mov ax,word ptr 8[bp] | mov bx, word ptr [bp + 8] */
extern char B_501C;

far_d660d(a0, a1)
{
	int v2;

	if (B_501C == -1)
		return 0;
	if ((((char *)(a1 + a0))[266] & 15) == B_501C)
		return 1;
	v2 = ((char *)(a1 + a0))[366];
	if (v2 == -1)
		return 0;
	return B_501C == (v2 & 15);
}
