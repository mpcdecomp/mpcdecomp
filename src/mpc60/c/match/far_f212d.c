extern long W_9B9A;

far_f212d(a0, a1)
{
	char z0[3];
	unsigned char v4;
	unsigned char v5;
	int v7;
	int v9;
	long v13;

	if ((v7 = far_d602b(a0)) != 0)
		return v7;
	v13 = W_9B9A + 202L;
	v9 = peekb(v13 + -1L);
	while (v9-- != 0) {
		far_da993(v13, &v5, far_daa7a(), 5);
		v13 += 24L;
		if (v5 == a1)
			return v4;
	}
	return -5;
}
