/* differs: +6 push di | push si */
extern char B_A61C;
extern char *W_A61A;

far_d916d(a0, a1, a2, a3)
char *a1;
char a3;
{
	int *v2;
	char *v4;
	char v5;
	char v6;
	char v7;
	register int r1;

	far_d885c(a0);
	far_d8880(&v6, &v7);
	*W_A61A++ = 10;
	*W_A61A++ = v6;
	*W_A61A++ = v7;
	*W_A61A++ = 2;
	*W_A61A++ = a3;
	v2 = W_A61A;
	v2 += 2;
	*v2 = a1;
	v2 += 2;
	*v2 = a2;
	W_A61A = v2;
	*W_A61A++ = 10;
	*W_A61A = 0;
	r1 = *a1;
	v4 = *(int *)(a2 + (r1 << 1));
	v5 = 0;
	for (; v5 < a3; ++v5) {
		if (*v4 != 0) {
			v4++;
			far_d8837(*v4++);
			continue;
		}
		far_d8837(32);
	}
	B_A61C = 0;
	return;
}
