extern char B_9D36;
extern char B_A04C;
extern char TBL_954C[];
extern long W_94A8;

far_d6e23()
{
	char z0[23];
	char v24;
	int v26;
	long v30;

	if (W_94A8 == 0L)
		return 0;
	v30 = W_94A8 + 202L;
	poke(v30 + -3L, B_A04C);
	v26 = peekb(v30 + -1L);
	while (v26-- != 0) {
		far_da993(v30, &v24, far_daa7a(), 24);
		if (v24 == B_9D36) {
			poke(v30 + 2L, TBL_954C[B_9D36]);
			break;
		}
		v30 += 24L;
	}
}
