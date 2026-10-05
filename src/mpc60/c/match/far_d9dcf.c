extern char B_A61D;
extern char *W_A61A;

far_d9dcf()
{
	register int r1;

	--B_A61D;
	r1 = W_A61A[-1];
	W_A61A -= r1;
	return r1;
}
