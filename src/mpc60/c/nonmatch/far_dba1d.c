/* differs: +48 mov ax,-1 | mov dx, 0ffffh */
extern char TBL_5176[];
extern char TBL_5196[];
extern char TBL_51B6[];
extern char TBL_51D6[];
extern int W_BEE2_V112;
long far_df0a8();

far_dba1d(a0)
{
	int v2;
	int v4;
	char z0[272];
	long v280;

	far_d7b8c(0);
	if (far_d7b8c(2, a0) >= 0)
		return -0x800;
	if ((W_BEE2_V112 = far_d7b8c(1, a0)) < 0)
		return W_BEE2_V112;
	far_df3d4(0, -1, -1);
	v280 = far_df0a8();
	v2 = 2;
	if ((v4 = far_d7b8c(5, &v2, W_BEE2_V112, 2)) != 0)
		return v4;
	if ((v4 = far_d7b8c(5, &v280, W_BEE2_V112, 3)) != 0)
		return v4;
	v4 = far_d7b8c(5, -0x5944, W_BEE2_V112, 0x7d6);
	if (v4 != 0)
		return v4;
	if ((v4 = far_d7b8c(5, -0x516e, W_BEE2_V112, 34)) != 0)
		return v4;
	v2 = 1;
	if ((v4 = far_d7b8c(5, &v2, W_BEE2_V112, 1)) != 0)
		return v4;
	if ((v4 = far_d7b8c(5, TBL_5176, W_BEE2_V112, 32)) != 0)
		return v4;
	if ((v4 = far_d7b8c(5, TBL_5196, W_BEE2_V112, 32)) != 0)
		return v4;
	if ((v4 = far_d7b8c(5, TBL_51B6, W_BEE2_V112, 32)) != 0)
		return v4;
	if ((v4 = far_d7b8c(5, TBL_51D6, W_BEE2_V112, 64)) != 0)
		return v4;
	v2 = 867;
	--v2;
	setmem(-0x6fc1, v2, 0);
	if ((v4 = far_d7b8c(5, -0x6fc1, W_BEE2_V112, v2)) != 0)
		return v4;
	if ((v4 = far_dc012(W_BEE2_V112, 0, 0, v280)) != 0)
		return v4;
	far_d49f3(-1, 0);
	return far_d7b8c(3, 0, W_BEE2_V112);
}
