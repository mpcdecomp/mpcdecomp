extern char TBL_8E65[];
extern long TBL_A66C[];
extern long W_AE68;

far_e0da1(a0, a1, a2)
{
	int v2;
	int v4;
	char *v6;
	long v10;

	if ((unsigned)a0 >= 34)
		return 0;
	far_ef913(a0);
	v10 = *(long *)((char *)TBL_A66C + a0 * 59);
	while (v10 > 0L) {
		v4 = 800;
		if ((long)v4 > v10)
			v4 = v10;
		far_dff5e(a0, TBL_8E65, v4);
		if (far_d870d() != 0) {
			if (far_d861e() == 120)
				return -20;
		}
		v6 = TBL_8E65;
		if (a2 != 0) {
			v2 = 0;
			for (; v2 < v4; ) {
				*(int *)v6 = far_efe59(*(int *)v6);
				v6 += 2;
				++v2;
			}
		}
		else {
			v2 = 0;
			for (; v2 < v4; ) {
				*(int *)v6 = far_f002e(*(int *)v6);
				v6 += 2;
				++v2;
			}
		}
		if (far_d870d() != 0) {
			if (far_d861e() == 120)
				return -20;
		}
		if (a1 != 0) {
			W_AE68 -= (long)v4;
			far_e01a3(a0, TBL_8E65, v4);
			if (far_d870d() != 0) {
				if (far_d861e() == 120)
					return -20;
			}
		}
		v10 -= (long)v4;
	}
	return 0;
}
