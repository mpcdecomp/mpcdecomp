extern char STR_3FC0[];
extern int TBL_96DC[];
extern char TBL_96DE[];
extern char TBL_96DF[];

far_e3213(a0)
{
	int v2;

	v2 = 0;
	do {
		if ((unsigned)a0 < TBL_96DC[(v2 + 1) * 2])
			break;
		++v2;
	} while (v2 < 80);
	far_d8827(2, 5);
	far_d88e6(STR_3FC0, TBL_96DE[v2 << 2], TBL_96DF[v2 << 2]);
	return v2;
}
