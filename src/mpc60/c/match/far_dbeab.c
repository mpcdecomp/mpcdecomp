extern char TBL_A656[];
extern int TBL_A668[];
extern int TBL_A66A[];
extern long TBL_A66C[];
extern int TBL_A672[];
extern int TBL_A678[];
extern int TBL_A67A[];
extern int TBL_A67C[];
extern int TBL_A67E[];
extern char TBL_A682[];
extern char TBL_A683[];
extern int TBL_A686[];
extern int TBL_A688[];
extern char TBL_AE2C[];
extern int W_BE5C;

far_dbeab(a0, a1)
{
	int v2;
	int v4;
	char v5;
	int v7;
	int v9;
	int v11;
	char v12;
	int v14;
	int v16;
	int v18;
	int v20;
	long v24;
	char z0[16];
	char v41;
	char v42;
	char v43;

	v4 = TBL_AE2C[a1];
	if ((unsigned)v4 > 34 || TBL_A656[v4 * 59] == 0)
		return 0;
	far_d7b8c(0);
	if (far_d7b8c(2, a0) >= 0)
		return -0x800;
	if ((W_BE5C = far_d7b8c(1, a0)) < 0)
		return W_BE5C;
	v43 = 1;
	v42 = 1;
	v24 = *(long *)((char *)TBL_A66C + v4 * 59);
	v20 = *(int *)((char *)TBL_A678 + v4 * 59);
	v18 = *(int *)((char *)TBL_A67A + v4 * 59);
	v16 = *(int *)((char *)TBL_A67C + v4 * 59);
	v14 = *(int *)((char *)TBL_A67E + v4 * 59);
	v12 = TBL_A682[v4 * 59];
	v11 = *(int *)((char *)TBL_A672 + v4 * 59);
	v9 = *(int *)((char *)TBL_A688 + v4 * 59);
	v7 = *(int *)((char *)TBL_A686 + v4 * 59);
	v5 = TBL_A683[v4 * 59];
	far_dfeec(v4, &v41);
	if ((v2 = far_d7b8c(5, &v43, W_BE5C, 39)) != 0)
		return v2;
	if ((v2 = far_dc012(W_BE5C, *(int *)((char *)TBL_A668 + v4 * 59), *(int *)((char *)TBL_A66A + v4 * 59), v24)) != 0)
		return v2;
	far_d49f3(v4, 0);
	return far_d7b8c(3, 0, W_BE5C);
}
