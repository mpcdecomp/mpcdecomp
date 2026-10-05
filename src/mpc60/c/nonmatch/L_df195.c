/* differs: +53 cmp byte ptr -2[bp],5 | cmp word ptr [bp - 2], 5 */
extern char B_BE58;
extern char B_BEDF_V112;
extern char TBL_5176[];
extern char TBL_5196[];
extern char TBL_51B6[];
extern char TBL_51D6[];
extern int W_BE59;

L_df195(a0)
{
	char z0;
	char v2;
	int v4;
	int v6;
	int v8;

	far_d7b8c(0);
	if ((W_BE59 = far_d7b8c(2, a0)) < 0)
		return W_BE59;
	far_df8fc();
	if ((v4 = far_d7b8c(4, &v2, W_BE59, 2)) != 0)
		return v4;
	if (v2 != 5)
		return 10;
	v6 = 0;
	v8 = 0;
	if ((v4 = far_d7b8c(4, &v8, W_BE59, 3)) != 0)
		return v4;
	if ((v4 = far_d7b8c(4, -0x5944, W_BE59, 0x7d6)) != 0)
		return v4;
	if ((v4 = far_d7b8c(4, -0x4122, W_BE59, 1)) != 0)
		return v4;
	B_BEDF_V112 = B_BE58;
	if ((v4 = far_d7b8c(4, -0x516e, W_BE59, 34)) != 0)
		return v4;
	if ((v4 = far_d7b8c(4, &v2, W_BE59, 1)) != 0)
		return v4;
	if (v2 != 0) {
		if ((v4 = far_d7b8c(4, TBL_5176, W_BE59, 32)) != 0)
			return v4;
		if ((v4 = far_d7b8c(4, TBL_5196, W_BE59, 32)) != 0)
			return v4;
		if ((v4 = far_d7b8c(4, TBL_51B6, W_BE59, 32)) != 0)
			return v4;
		if ((v4 = far_d7b8c(4, TBL_51D6, W_BE59, 64)) != 0)
			return v4;
		v2 = 99;
		--v2;
		if ((v4 = far_d7b8c(4, -0x6fc1, W_BE59, v2)) != 0)
			return v4;
	}
	else {
		v2 = 3;
		--v2;
		if ((v4 = far_d7b8c(4, -0x6fc1, W_BE59, v2)) != 0)
			return v4;
	}
	v4 = far_db286(W_BE59, 0, 0, v8, v6);
}
