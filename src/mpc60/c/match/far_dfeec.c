extern char TBL_A656[];

far_dfeec(a0, a1)
{
	int v2;

	v2 = (unsigned)a0 >= 34 || TBL_A656[a0 * 59] == 0;
	if (v2 != 0)
		strcpy(a1, 0x3ca2);
	else
		strncpy(a1, a0 * 59 + -0x5944, 17);
	return v2;
}
