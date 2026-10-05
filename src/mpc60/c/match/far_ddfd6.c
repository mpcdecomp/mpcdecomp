extern char TBL_A68A[];
extern char TBL_AE2C[];

far_ddfd6(a0, a1)
{
	int v2;

	v2 = TBL_AE2C[a0];
	if ((unsigned)v2 < 34)
		TBL_A68A[v2 * 59] = a1 + 7;
	return;
}
