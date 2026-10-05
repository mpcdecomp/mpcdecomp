/* differs: +2b beq $5 | jz br_c958a */
long far_c955a()
{
	int v2;
	char z0;
	char v4;
	char z1;
	char v6;
	char z2;
	char v8;

	far_d7b8c(0);
	if ((v2 = far_d7bc9(&v4, &v6, &v8)) != 0)
		return v2;
	return v4 * (long)v8 / 0x400L;
}
