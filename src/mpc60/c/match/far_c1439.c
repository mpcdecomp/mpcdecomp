extern char B_53DC;
extern char B_8CCB;
extern char STR_182E[];
extern char STR_18C2[];
extern char STR_18CB[];
extern char STR_18D7[];
extern char TBL_8E41[];

far_c1439(a0)
char *a0;
{
	int v2;
	int v4;
	int v6;

	far_c1f4e(STR_182E);
	B_53DC = 57;
	far_d8827(2, 0);
	far_d885c(0x184b);
	far_d885c(0x1872);
	far_d885c(0x1899);
	far_d885c(STR_18C2);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_18CB);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
	}
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(STR_18D7);
		++B_8CCB;
		if ((v4 = far_dab2d(a0)) != 0)
			far_de533(v4);
		else {
			v6 = a0[11] != 0 ? 16 : 8;
			strncpy(TBL_8E41, a0, v6);
			TBL_8E41[v6] = 0;
		}
		far_d8765();
		--B_8CCB;
		v2 = 0;
	}
	return v2;
}
