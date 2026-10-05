extern int W_BADD_V112;
extern int W_BADF_V112;

L_c7fe9(a0)
{
	int v2;
	int *v4;

	if (W_BADF_V112 != 0) {
		if (W_BADD_V112 > 60)
			W_BADD_V112 = 60;
	}
	else if (W_BADD_V112 > 120)
		W_BADD_V112 = 120;
	v2 = W_BADD_V112;
	if (W_BADF_V112 == 0)
		v2 = -v2;
	v4 = a0 + 8;
	*v4 = far_da949(v2 * 20 + 0x2000);
	return;
}
