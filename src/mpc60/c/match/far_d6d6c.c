extern long W_94A8;

far_d6d6c(a0, a1)
{
	char z0;
	unsigned char v2;
	char z1[21];
	unsigned char v24;
	int v26;
	long v30;

	if (W_94A8 == 0L)
		return 0;
	v30 = W_94A8 + 202L;
	v26 = peekb(v30 + -1L);
	while (v26-- != 0) {
		far_da993(v30, &v24, far_daa7a(), 24);
		if (v24 == a0) {
			if (a1 < 0)
				return v2;
			if (a1 > 128)
				a1 = 0;
			poke(v30 + 22L, a1);
			return a1;
		}
		v30 += 24L;
	}
	return 0;
}
