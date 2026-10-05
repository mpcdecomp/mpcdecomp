extern char TBL_A656[];

far_df868(a0)
{
	if ((unsigned)a0 >= 34)
		return -4;
	if (TBL_A656[a0 * 59] == 0)
		return -4;
	far_ef5cf(a0);
	far_d49f3(a0, 0);
	return 0;
}
