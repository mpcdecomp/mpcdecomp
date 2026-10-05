extern char B_94A6;
extern char B_94A7;
extern char B_9D34;
extern long W_94A8;
extern long W_9B9A;

far_d4855(a0, a1)
{
	long v4;
	int v6;
	int v8;
	int v10;

	if (a0 == -1) {
		v8 = a0 = 0;
		v4 = W_9B9A;
		for (; ; ) {
			if ((v8 = far_ec448(a0)) <= a0)
				break;
			v10 = peekb(W_9B9A + 23L);
			if (a1 != 0)
				v10 |= 4;
			else
				v10 &= 251;
			poke(W_9B9A + 23L, v10);
			a0 = v8;
		}
		far_d4ab3(a1);
		W_9B9A = v4;
		return;
	}
	if (a0 < 1 || a0 > 99)
		return;
	if (B_94A6 >= 0 && B_9D34 == a0) {
		if (a1 != 0)
			B_94A7 |= 4;
		else
			B_94A7 &= -5;
		poke(W_94A8 + 23L, B_94A7);
	}
	else {
		v4 = W_9B9A;
		v6 = far_d602b(a0);
		if (v6 == -1) {
			W_9B9A = v4;
			return;
		}
		v10 = peekb(W_9B9A + 23L);
		if (a1 != 0) {
			v10 |= 4;
			poke(W_9B9A + 23L, v10);
		}
		else {
			v10 &= 251;
			poke(W_9B9A + 23L, v10);
		}
		W_9B9A = v4;
	}
	far_d4ab3(a1);
}
