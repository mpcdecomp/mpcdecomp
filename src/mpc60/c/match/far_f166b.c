extern char B_94A6;
extern char B_9D34;
extern char TBL_94E8[];
extern long W_9B9A;

far_f166b(a0, a1)
{
	char z0[3];
	unsigned char v4;
	unsigned char v5;
	int v7;
	int v9;
	long v13;

	if (B_9D34 == a0 && B_94A6 >= 0)
		return TBL_94E8[a1];
	if ((v7 = far_d602b(a0)) != 0)
		return v7;
	v13 = W_9B9A + 202L;
	v9 = peekb(v13 + -1L);
	while (v9-- != 0) {
		far_da993(v13, &v5, far_daa7a(), 5);
		v13 += 24L;
		if (v4 == a1)
			return v5;
	}
	return -5;
}
