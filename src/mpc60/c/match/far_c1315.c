extern char B_53DB;
extern char B_53DC;
extern char B_8CCB;
extern char STR_17B4[];
extern char STR_1810[];
extern char STR_181C[];
extern char TBL_8E30[];

far_c1315(a0)
char *a0;
{
	int v2;
	int v4;
	int v6;

	B_53DC = 54;
	far_c1f4e(STR_17B4);
	far_d8827(2, 0);
	far_d885c(0x17d3);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_1810);
	v2 = far_d981a(1);
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(STR_181C);
		if ((v4 = far_c20ed(a0, 2)) != 0) {
			far_de533(v4);
			return B_53DB;
		}
		++B_8CCB;
		if ((v4 = far_dc84f(a0)) != 0)
			far_de533(v4);
		else {
			v6 = a0[11] != 0 ? 16 : 8;
			strncpy(TBL_8E30, a0, v6);
			TBL_8E30[v6] = 0;
		}
		far_d8765();
		--B_8CCB;
		v2 = 0;
	}
	return v2;
}
