/* differs: +5e mov cx, offset W_535F_ | mov ax, W_535F */
extern char W_4C1C;
extern char W_535F;

far_dabb3(a0)
{
	int v2;
	char z0;
	char v4;
	char v5;
	char v6;

	if ((v2 = far_d7b8c(4, &v6, a0, 2)) != 0)
		return v2;
	if (v6 != 8)
		return -9;
	if (v5 != 0)
		return -9;
	if ((v2 = far_d7b8c(4, &v4, a0, 2)) != 0)
		return v2;
	if ((unsigned)(&W_535F - &W_4C1C) >> 1 << 1 != v4)
		return -9;
	v2 = far_d7b8c(4, &W_4C1C, a0, v4);
}
