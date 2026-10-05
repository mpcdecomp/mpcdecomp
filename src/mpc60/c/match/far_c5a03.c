extern char B_52AE;
extern char TBL_51B6[];
extern char TBL_5252_V112[];
extern int W_550B;

far_c5a03(a0, a1)
{
	int v2;
	int v4;

	v2 = a0 + a1;
	v4 = B_52AE == 0 ? TBL_51B6[v2] : TBL_5252_V112[a0 + a1];
	if (v4 < 127) {
		v4 += W_550B << 1;
		if (v4 >= 127)
			v4 = 127;
		far_ddf44(v2, v4);
		far_c50a2(a0, a1, v4);
	}
	return;
}
