extern char STR_2435[];
extern char TBL_A656[];
extern char TBL_A667[];
extern int TBL_A668[];
extern int TBL_A66A[];
extern int TBL_A66C[];
extern int TBL_A66E[];
extern int TBL_A674[];
extern int TBL_A676[];
extern int TBL_A678[];
extern int TBL_A67A[];
extern int TBL_A67C[];
extern int TBL_A67E[];
extern int TBL_A680[];
extern unsigned char TBL_A682[];
extern int TBL_A684[];
extern int TBL_A686[];
extern int TBL_A688[];
extern char TBL_A68A[];
extern char TBL_A68B[];
extern char TBL_A68C[];
extern unsigned char TBL_A68D[];
extern unsigned char TBL_A68E[];
extern unsigned char TBL_A68F[];
extern unsigned char TBL_A690[];
extern char TBL_AE2C[];

far_c609e(a0)
{
	int v2;

	v2 = 0;
	do {
		if (TBL_AE2C[v2] == a0)
			break;
		v2++;
	} while (v2 < 34);
	if (v2 == 34)
		v2 = -1;
	far_d8827(0, 8);
	far_d88e6(STR_2435, a0 * 59 + TBL_A656, v2);
	far_d88e6(0x2447, *(int *)((char *)TBL_A668 + a0 * 59), *(int *)((char *)TBL_A66A + a0 * 59), *(int *)((char *)TBL_A680 + a0 * 59));
	far_d88e6(0x245d, *(int *)((char *)TBL_A674 + a0 * 59), *(int *)((char *)TBL_A676 + a0 * 59), TBL_A682[a0 * 59], TBL_A667[a0 * 59]);
	far_d88e6(0x247c, *(int *)((char *)TBL_A66C + a0 * 59), *(int *)((char *)TBL_A66E + a0 * 59), *(int *)((char *)TBL_A684 + a0 * 59), TBL_A68A[a0 * 59]);
	far_d88e6(0x249b, *(int *)((char *)TBL_A678 + a0 * 59), *(int *)((char *)TBL_A686 + a0 * 59), TBL_A690[a0 * 59], TBL_A690[a0 * 59]);
	far_d88e6(0x24bf, *(int *)((char *)TBL_A67A + a0 * 59), *(int *)((char *)TBL_A688 + a0 * 59), TBL_A68F[a0 * 59], TBL_A68F[a0 * 59]);
	far_d88e6(0x24e3, *(int *)((char *)TBL_A67C + a0 * 59), TBL_A68B[a0 * 59], TBL_A68E[a0 * 59], TBL_A68E[a0 * 59]);
	far_d88e6(0x2506, *(int *)((char *)TBL_A67E + a0 * 59), TBL_A68C[a0 * 59], TBL_A68D[a0 * 59], TBL_A68D[a0 * 59]);
	return;
}
