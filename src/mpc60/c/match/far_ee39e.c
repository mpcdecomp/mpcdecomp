extern char B_5504;
extern char B_A61E;
extern char B_A61F;
extern char B_A620;
extern char B_A621;
extern char B_A622;
extern char TBL_A624[];
extern int W_8CD1;
extern char *W_A650;
extern int W_A652;
extern int W_A654;

far_ee39e(a0)
{
	int *v2;
	char v3;

	if ((B_A61E & 16) != 0)
		a0 -= W_8CD1;
	if (a0 < W_A652)
		a0 = W_A652;
	if (a0 > W_A654)
		a0 = W_A654;
	if ((B_A61E & 16) != 0)
		a0 += W_8CD1;
	v3 = 32;
	if ((B_A61E & 32) != 0)
		v3 = 48;
	far_daa7d(a0, TBL_A624, B_A61F, v3);
	if ((B_A61E & 64) != 0)
		far_d974c(TBL_A624);
	far_d8810(3);
	far_d8827(B_A620, B_A621);
	far_d885c(TBL_A624);
	far_d8827(B_A620, B_A621);
	if ((B_A61E & 16) != 0)
		a0 -= W_8CD1;
	if ((B_A61E & 128) != 0)
		*W_A650 = a0;
	else {
		v2 = W_A650;
		*v2 = a0;
	}
	B_5504 = 1;
	B_A622 = 1;
	return;
}
