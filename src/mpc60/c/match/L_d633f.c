extern char TBL_A656[];
extern char TBL_A667[];

L_d633f(a0, a1)
{
	int v2;

	if (far_df8b4(a1) >= 0)
		return -1;
	if ((unsigned)a0 < 34 && TBL_A656[a0 * 59] != 0) {
		v2 = a0;
		do {
			strncpy(v2 * 59 + -0x5944, a1, 16);
			far_d49f3(v2, 1);
		} while ((v2 = TBL_A667[v2 * 59]) != a0);
		return 0;
	}
	return -5;
}
