extern char B_94A6;
extern char B_9D34;
extern char TBL_5517[];
extern int W_9B96;
extern int W_9B98;
extern int W_9B9E;
extern int W_9BA0;
long far_daa02();

far_c949c()
{
	long v4;
	int v6;
	int v8;

	far_d55e8(&B_94A6);
	far_d6a82(&B_94A6, B_9D34, 1);
	v4 = far_daa02(W_9B9E, W_9BA0, W_9B96, W_9B98) + 8L;
	v6 = 0;
	do {
		v8 = 0;
		do {
			if (TBL_5517[v6 * 500 + (v8 << 1)] == 0)
				break;
			if (v8 == 0)
				v4 += 4L;
			v4 += 2L;
			++v8;
		} while (v8 < 250);
		++v6;
	} while (v6 < 20);
	return (v4 + 0x3ffL) / 0x400L;
}
