extern char TBL_A690[];
extern char TBL_AE2C[];

far_ef0d4(a0, a1)
{
	TBL_AE2C[a0] = a1;
	if (a0 < 3)
		TBL_A690[a1 * 59] |= 1;
	return;
}
