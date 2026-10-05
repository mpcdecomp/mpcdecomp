/* differs: +57 add word ptr -2[bp],4 | mov bx, word ptr [bp - 2] */
extern char B_A61C;
extern char *W_A61A;

far_d94cf(a0)
char *a0;
{
	int *v2;
	char v3;
	char v4;

	far_d8880(&v3, &v4);
	*W_A61A++ = 8;
	*W_A61A++ = v3;
	*W_A61A++ = v4;
	*W_A61A++ = 3;
	*W_A61A++ = 4;
	v2 = W_A61A;
	v2 += 2;
	*v2 = a0;
	W_A61A = v2;
	*W_A61A++ = 8;
	*W_A61A = 0;
	far_d885c(far_da4bd(*a0));
	B_A61C = 0;
	return;
}
