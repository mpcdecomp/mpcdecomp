extern long TBL_A66C[];
extern char TBL_AE2C[];

far_c93f3(a0)
{
	long v4;

	if (TBL_AE2C[a0] < 0)
		return 0;
	v4 = *(long *)((char *)TBL_A66C + TBL_AE2C[a0] * 59) * 3L / 2L + 16L;
	return (v4 + 0x3ffL) / 0x400L;
}
