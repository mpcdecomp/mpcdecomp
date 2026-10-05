extern char TBL_AE2C[];

far_ef103(a0, a1, a2, a3)
{
	int v2;

	far_df868(TBL_AE2C[a0]);
	v2 = far_f175b(a1, a2, a3);
	if (v2 == -1)
		v2 = far_f1b01(a1);
	far_ef0d4(a0, v2);
	if (v2 >= 0)
		far_ef16b(a0 - 2);
	return v2;
}
