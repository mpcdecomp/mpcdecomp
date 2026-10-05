extern char B_52AD;
extern char TBL_5176[];
extern char TBL_5196[];
extern char TBL_5212_V112[];
extern char TBL_5232_V112[];
extern int W_550B;

far_c58d0(a0, a1, a2)
{
	int v2;
	int v4;
	int v6;

	v2 = a0 + a1;
	if (a2 == 0) {
		v4 = B_52AD != 0 ? TBL_5212_V112[v2] : TBL_5176[v2];
		if (v4 < 127) {
			v4 += W_550B << 1;
			if (v4 > 127)
				v4 = 127;
			far_ddef2(v2, v4);
			far_c50a2(a0, a1, v4);
		}
	}
	else {
		v6 = B_52AD != 0 ? TBL_5232_V112[v2] : TBL_5196[v2];
		if (v6 < 127) {
			v6 += W_550B * 3;
			if (v6 >= 127)
				v6 = 127;
			far_ddf1b(v2, v6);
			far_c538e(a0, a1);
		}
	}
	return;
}
