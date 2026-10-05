/* differs: +8b add word ptr -118[bp],4 | mov bx, word ptr [bp - 76h] */
extern char STR_2574[];
extern char STR_259A[];
extern long W_AE68;
extern long W_BA5A;

far_c6355()
{
	char z0[111];
	char v112;
	int v114;
	int v116;
	int *v118;

	far_d880a();
	setmem(&v112, 112, -1);
	far_c646e(STR_2574, &W_BA5A);
	W_AE68 = W_BA5A;
	while (1) {
		far_dff5e(0, &v112, 56);
		far_d880a();
		far_d88e6(0x2212, W_BA5A, W_BA5A);
		v118 = &v112;
		v116 = 0;
		do {
			v114 = 0;
			do {
				v118 += 2;
				far_d88e6(STR_259A, *v118);
				++v114;
			} while (v114 < 8);
			++v116;
		} while (v116 < 7);
		switch (far_d861e()) {
		case 45:
			W_BA5A -= 56L;
			if (W_BA5A < 0L)
				W_BA5A = 0L;
			W_AE68 = W_BA5A;
			break;
		case 43:
			W_BA5A = W_AE68;
			break;
		default:
			return 79;
		}
	}
}
