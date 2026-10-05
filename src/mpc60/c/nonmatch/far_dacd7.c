/* differs: +52 cmp byte ptr -2[bp],2 | cmp word ptr [bp - 2], 2 */
extern char TBL_5176[];
extern char TBL_5196[];
extern char TBL_51B6[];
extern char TBL_51D6[];

far_dacd7(a0)
{
	char z0;
	char v2;
	int v4;
	int v6;
	int v8;
	int v10;

	far_d7b8c(0);
	if ((v6 = far_d7b8c(2, a0)) < 0)
		return v6;
	far_df8fc();
	if ((v4 = far_d7b8c(4, &v2, v6, 2)) != 0)
		return v4;
	if (v2 != 2)
		return 10;
	v8 = 0;
	v10 = 0;
	if ((v4 = far_d7b8c(4, &v10, v6, 3)) != 0)
		return v4;
	if ((v4 = far_d7b8c(4, -0x5944, v6, 0x7d6)) != 0)
		return v4;
	if ((v4 = far_d7b8c(4, -0x516e, v6, 34)) != 0)
		return v4;
	if ((v4 = far_d7b8c(4, &v2, v6, 1)) != 0)
		return v4;
	if (v2 != 0) {
		if ((v4 = far_d7b8c(4, TBL_5176, v6, 32)) != 0)
			return v4;
		if ((v4 = far_d7b8c(4, TBL_5196, v6, 32)) != 0)
			return v4;
		if ((v4 = far_d7b8c(4, TBL_51B6, v6, 32)) != 0)
			return v4;
		if ((v4 = far_d7b8c(4, TBL_51D6, v6, 64)) != 0)
			return v4;
		v2 = 99;
		--v2;
		if ((v4 = far_d7b8c(4, -0x6fc1, v6, v2)) != 0)
			return v4;
	}
	else {
		v2 = 3;
		--v2;
		if ((v4 = far_d7b8c(4, -0x6fc1, v6, v2)) != 0)
			return v4;
	}
	v4 = far_db286(v6, 0, 0, v10, v8);
	far_db378();
	far_db8ab();
	far_db915();
	return v4;
}
