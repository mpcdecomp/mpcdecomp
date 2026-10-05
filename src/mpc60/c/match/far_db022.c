extern char TBL_A667[];
extern int TBL_A6CE_V112[];
extern int TBL_A6D0_V112[];

far_db022(a0, a1)
{
	int v2;
	int v4;
	char z0[2];
	int v8;
	int v10;
	int v12;
	int v14;
	int v16;
	int v18;
	int v20;
	char z1[16];
	char v37;
	char z2;
	char v39;

	far_d7b8c(0);
	if ((v2 = far_d7b8c(2, a0)) < 0)
		return v2;
	if ((v4 = far_d7b8c(4, &v39, v2, 31)) != 0)
		return v4;
	if (v39 != 1)
		return 10;
	v8 = far_ef103(a1, &v37, v20, v18);
	if (v8 < 0)
		return -v8;
	L_d5ca8(v8, v16, v14, v12, v10);
	if (TBL_A667[v8 * 59] != v8)
		return 0;
	return far_db286(v2, *(int *)((char *)TBL_A6CE_V112 + v8 * 59), *(int *)((char *)TBL_A6D0_V112 + v8 * 59), v20, v18);
}
