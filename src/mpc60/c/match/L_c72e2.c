extern int TBL_4CC6_V112[];

L_c72e2(a0)
{
	int v2;

	v2 = 0;
	do {
		if ((unsigned)a0 < TBL_4CC6_V112[(v2 + 1) * 2])
			return v2;
		++v2;
	} while (v2 < 80);
}
