extern unsigned char TBL_5516[];
extern char TBL_5517[];

far_ecd6a(a0, a1)
{
	int v2;
	int v4;

	v4 = 0;
	while (TBL_5517[a0 * 500 + (v4 << 1)] != 0) {
		v2 = TBL_5516[a0 * 500 + (v4++ << 1)];
		if (far_d602b(v2) == -1)
			return -17;
		if (a1 == v2)
			return -16;
	}
	return 0;
}
