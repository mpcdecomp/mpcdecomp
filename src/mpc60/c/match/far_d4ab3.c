extern char B_3588;
extern char TBL_A690[];
extern long W_9B9A;

far_d4ab3(a0)
{
	int v2;
	int v4;
	int v6;
	char z0;
	long v11;

	if (a0 == 0) {
		if (B_3588 != 0)
			a0 = 1;
		v2 = 0;
		do {
			if ((TBL_A690[v2 * 59] & 2) != 0)
				a0 = 1;
			v2++;
		} while (v2 < 34);
		v4 = v6 = 0;
		v11 = W_9B9A;
		for (; ; ) {
			if ((v4 = far_ec448(v6)) <= v6)
				break;
			if ((peekb(W_9B9A + 23L) & 2) != 0)
				a0 = 1;
			v6 = v4;
		}
		W_9B9A = v11;
	}
	far_ee201(6, a0);
	return;
}
