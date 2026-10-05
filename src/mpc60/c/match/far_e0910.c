extern char B_52A4;
extern char B_52AA;
extern char B_8E68;
extern int TBL_8E65;

far_e0910(a0, a1)
{
	int v2;

	if (a0 != -1)
		far_ef434(0, a0);
	while (1) {
		for (; ; ) {
			if ((v2 = far_e0a11(B_52A4)) != 0)
				break;
			if (a1 != 0) {
				if (B_52AA == 1)
					far_e0be8(a1);
				else
					far_e0d14(a1);
				a1 = 0;
			}
			L_df04f(1);
			if (a0 != -1) {
				if (L_ef444(0) == 0)
					return -2;
			}
		}
		if (v2 == -20) {
			if (B_52AA == 1)
				far_e0be8(125);
			else
				far_e0d14(125);
			return v2;
		}
		if (B_52AA == 1)
			break;
		if (TBL_8E65 != 0x7ef0) {
			B_8E68 = 0;
			return 0;
		}
		if (B_8E68 != 124)
			break;
		a0 = -1;
	}
	return v2;
}
