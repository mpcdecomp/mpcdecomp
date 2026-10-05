extern char B_94A6;
extern char B_9D34;
extern int W_9B9A;
extern int W_9B9C;
long far_d61d8();

long far_d7820(a0)
{
	if (far_d602b(a0) != 0)
		return 0;
	if (B_9D34 == a0) {
		far_d55e8(&B_94A6);
		far_d6a82(&B_94A6, a0, 1);
		far_d602b(a0);
	}
	return far_d61d8(W_9B9A, W_9B9C) + (long)far_d617f(W_9B9A, W_9B9C);
}
