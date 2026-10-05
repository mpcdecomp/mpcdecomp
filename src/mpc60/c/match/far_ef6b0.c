extern char TBL_A667[];

far_ef6b0(a0)
{
	int v2;

	v2 = a0;
	while (TBL_A667[v2 * 59] != a0)
		v2 = TBL_A667[v2 * 59];
	if (v2 == a0)
		return -1;
	TBL_A667[v2 * 59] = TBL_A667[a0 * 59];
	return v2;
}
