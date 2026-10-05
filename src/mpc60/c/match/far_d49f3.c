extern char TBL_A656[];
extern char TBL_A690[];

far_d49f3(a0, a1)
{
	int v2;

	if (a0 == -1) {
		v2 = 0;
		do {
			if (TBL_A656[v2 * 59] != 0) {
				if (a1 != 0)
					TBL_A690[v2 * 59] |= 2;
				else
					TBL_A690[v2 * 59] &= -3;
			}
			v2++;
		} while (v2 < 34);
		far_d4ab3(a1);
		return;
	}
	if (a0 < 0 || a0 > 34)
		return;
	if (a1 != 0)
		TBL_A690[a0 * 59] |= 2;
	else
		TBL_A690[a0 * 59] &= -3;
	far_d4ab3(a1);
}
