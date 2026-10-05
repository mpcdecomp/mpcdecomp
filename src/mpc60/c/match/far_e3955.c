extern char TBL_8E65[];
extern int W_8E63;

far_e3955(a0)
{
	int v2;
	int v4;
	int v6;
	char z0[9];
	char v16;

	v4 = W_8E63;
	v2 = 2;
	do {
		far_d8827(v2, 1);
		if (v4 != 0) {
			v4 = far_cbe28(&v16, 10, 0);
			far_d97f5();
			far_c998b(a0 + v2 - 1, &v16, v4);
		}
		else
			far_d88b2(40);
		++v2;
	} while (v2 <= 5);
	far_d97f5();
	far_d8827(1, 1);
	v6 = far_c998b(a0, TBL_8E65, W_8E63);
	far_de758(0);
	return v6;
}
