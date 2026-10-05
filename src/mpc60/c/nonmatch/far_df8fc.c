/* differs: +9f mov ax,15 | mov dx, 0fh */
extern char B_AEB7_V112;
extern char TBL_AE8F;
extern char TBL_AE90[];
extern int TBL_AE93[];
extern int TBL_AE95;
extern int TBL_AE97;
extern int TBL_AEF6_V112[];
extern char TBL_B1B9[];
extern int W_B1F9;
extern int W_B1FB;
extern int W_B1FD;

far_df8fc()
{
	int v2;
	int v4;

	setmem(-0x5944, 0x7d6, 0);
	setmem(-0x510c, 810, 0);
	setmem(-0x514c, 3, -1);
	setmem(-0x516e, 34, -1);
	setmem(-0x5148, 16, -1);
	setmem(TBL_B1B9, 65, 0);
	W_B1F9 = -1;
	W_B1FB = 0;
	W_B1FD = 0;
	far_ef944();
	v4 = 0x5550;
	far_efbf1(-1, 15, &v4, 1);
	v4 = 0;
	far_efbf1(-1, 7, &v4, 1);
	far_ef8c5(-1, 15, &v4, 1);
	if (((v4 ^ 0x5550) & -16) != 0) {
		B_AEB7_V112 = 0;
		TBL_AE97 = 8;
		TBL_AE95 = 0;
	}
	else {
		B_AEB7_V112 = 1;
		TBL_AE97 = 16;
		TBL_AE95 = 0;
	}
	TBL_AE8F = -1;
	TBL_AE90[0] = -1;
	TBL_AE93[0] = 0;
	TBL_AEF6_V112[0] = 0;
	v2 = 1;
	do {
		TBL_AE90[v2 * 10] = -1;
		TBL_AE93[v2 * 5] = -1;
		TBL_AEF6_V112[v2 * 5] = -1;
		v2++;
	} while (v2 <= 80);
	far_d49f3(-1, 0);
	far_e016f();
	return;
}
