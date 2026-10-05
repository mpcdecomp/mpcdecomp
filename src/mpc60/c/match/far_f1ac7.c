extern char TBL_A656[];

far_f1ac7()
{
	int v2;

	v2 = 0;
	do {
		if (TBL_A656[v2 * 59] == 0)
			return v2;
		v2++;
	} while (v2 < 34);
	return -1;
}
