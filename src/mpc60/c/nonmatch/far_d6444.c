/* differs: +8 mov ax,word ptr 6[bp] | mov bx, word ptr [bp + 6] */
far_d6444(a0)
{
	char z0[206];
	if (*(long *)((char *)a0 + 2) == 0L)
		return;
	far_e7b3b(a0);
	far_d62e8(a0);
}
