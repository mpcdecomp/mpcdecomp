extern char B_A61C;
extern char *W_A61A;

far_d96fe(a0, a1)
char a0;
char a1;
{
	*W_A61A++ = 5;
	*W_A61A++ = a0;
	*W_A61A++ = a1;
	*W_A61A++ = 7;
	*W_A61A++ = 5;
	*W_A61A = 0;
	B_A61C = 0;
	return;
}
