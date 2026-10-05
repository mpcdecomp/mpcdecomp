/* differs: +4b shl al,cl | cbw */
extern char B_A61C;
extern int W_8CD1;
extern char *W_A61A;

far_d936c(a0, a1, a2, a3, a4, a5)
int *a1;
char a2;
char a5;
{
	int *v2;
	int v4;
	char v5;
	char v6;

	far_d885c(a0);
	far_d8880(&v5, &v6);
	*W_A61A++ = 12;
	*W_A61A++ = v5;
	*W_A61A++ = v6;
	*W_A61A++ = a5 << 4;
	*W_A61A++ = a2;
	v2 = W_A61A;
	v2 += 2;
	*v2 = a1;
	v2 += 2;
	*v2 = a3;
	v2 += 2;
	*v2 = a4;
	W_A61A = v2;
	*W_A61A++ = 12;
	*W_A61A = 0;
	v4 = *a1;
	if ((a5 & 1) != 0)
		v4 += W_8CD1;
	far_d9445(v4, a2, a5);
	B_A61C = 0;
	return;
}
