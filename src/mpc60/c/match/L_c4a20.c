extern char B_4CBE_V112;
extern char TBL_6197_V112[];
extern int W_9B96;
extern int W_9B98;
extern int W_A450_V112;
extern int W_A452_V112;
long far_daa02();

L_c4a20()
{
	long v4;
	int v6;
	int v8;

	L_d8414();
	far_d6a82(B_4CBE_V112, 1);
	v4 = far_daa02(W_A450_V112, W_A452_V112, W_9B96, W_9B98) + 8L;
	v6 = 0;
	do {
		v8 = 0;
		do {
			if (TBL_6197_V112[v6 * 500 + (v8 << 1)] == 0)
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
