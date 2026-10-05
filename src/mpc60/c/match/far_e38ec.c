extern char TBL_8E65[];
extern int W_8E63;

far_e38ec(a0)
{
	int v2;

	if (W_8E63 != 0)
		far_cb998(TBL_8E65, W_8E63, 0);
	far_cc39e(a0);
	W_8E63 = far_cbe28(TBL_8E65, 0x640, 0);
	v2 = far_e3955(a0);
	if (W_8E63 != 0)
		far_cbb63(TBL_8E65);
	return v2;
}
