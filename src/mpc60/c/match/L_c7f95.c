extern int W_BADD_V112;
extern int W_BADF_V112;

L_c7f95(a0)
int *a0;
{
	W_BADD_V112 = (far_da912(a0[4]) + -0x2000) / 20;
	if (W_BADD_V112 < 0) {
		W_BADF_V112 = 0;
		if (W_BADD_V112 < -120)
			W_BADD_V112 = -120;
		W_BADD_V112 = -W_BADD_V112;
	}
	else {
		W_BADF_V112 = 1;
		if (W_BADD_V112 > 60)
			W_BADD_V112 = 60;
	}
	return;
}
