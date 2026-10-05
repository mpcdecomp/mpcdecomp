extern char B_4CBE_V112;
extern int W_94D6;
extern long W_9B9A;

L_d88fd(a0)
{
	if (B_4CBE_V112 == a0)
		return W_94D6;
	if (far_d602b(a0) != 0)
		return 0;
	return peekw(W_9B9A + 26L);
}
