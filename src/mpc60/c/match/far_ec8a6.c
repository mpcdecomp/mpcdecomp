extern unsigned char B_A06A;
extern unsigned char TBL_5516[];
extern char TBL_5517[];

far_ec8a6()
{
	int v2;
	int v4;
	int v6;

	v2 = B_A06A - 1;
	v6 = 0;
	while (TBL_5517[v2 * 500 + (v6 << 1)] != 0) {
		v4 = TBL_5516[v2 * 500 + (v6++ << 1)];
		if (far_eb9a3(v4) == 0)
			return v6;
	}
	return 0;
}
