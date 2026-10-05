extern int W_9B9A;
extern int W_9B9C;

far_ec448(a0)
unsigned char a0;
{
	far_d602b(a0 + 1);
	a0 = peekb(W_9B9A, W_9B9C);
	if (a0 == 255) {
		far_d602b(0);
		a0 = peekb(W_9B9A, W_9B9C);
		if (a0 == 255)
			return -1;
	}
	return a0 & 127;
}
