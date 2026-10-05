/* differs: +64 add word ptr -2[bp],4 | mov bx, word ptr [bp - 2] */
extern char B_A61C;
extern char *W_A61A;

far_d90a6(a0, a1, a2)
char *a1;
char a2;
{
	int *v2;
	char v3;
	char z0[41];
	char v45;
	char v46;

	far_d885c(a0);
	far_d8880(&v45, &v46);
	*W_A61A++ = 8;
	*W_A61A++ = v45;
	*W_A61A++ = v46;
	*W_A61A++ = 1;
	*W_A61A++ = a2;
	v2 = W_A61A;
	v2 += 2;
	*v2 = a1;
	W_A61A = v2;
	*W_A61A++ = 8;
	*W_A61A = 0;
	v3 = 0;
	for (; v3 < a2; ++v3) {
		if (*a1 != 0) {
			a1++;
			far_d8837(*a1++);
			continue;
		}
		far_d8837(32);
	}
	B_A61C = 0;
	return;
}
