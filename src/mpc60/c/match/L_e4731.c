extern char B_4CBE_V112;
extern char B_52B5_V112;
extern char TBL_5066_V112[];
extern long W_9B9A;

L_e4731(a0, a1)
{
	char z0[3];
	unsigned char v4;
	unsigned char v5;
	int v7;
	int v9;
	long v13;

	if (B_4CBE_V112 == a0 && B_52B5_V112 >= 0)
		return TBL_5066_V112[a1];
	if ((v7 = far_d602b(a0)) != 0)
		return v7;
	v13 = W_9B9A + 202L;
	v9 = peekb(v13 + -1L);
	while (v9-- != 0) {
		L_de8d2(v13, &v5, far_daa7a(), 5);
		v13 += 21L;
		if (v4 == a1)
			return v5;
	}
	return -5;
}
