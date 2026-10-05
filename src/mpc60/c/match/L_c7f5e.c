extern int W_BADB_V112;
extern int W_BADF_V112;

L_c7f5e(a0)
{
	int v2;
	int *v4;

	v2 = W_BADB_V112;
	if (W_BADF_V112 == 0)
		v2 = -v2;
	v4 = a0 + 2;
	*v4 = far_da949(v2 + 0x2000);
	return;
}
