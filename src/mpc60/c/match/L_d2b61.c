extern int TBL_A678[];
extern int TBL_A67A[];
extern int TBL_A6E4_V112[];

L_d2b61(a0, a1, a2, a3, a4)
int *a2;
int *a3;
int *a4;
{
	if ((unsigned)a0 < 34) {
		*a2 = *(int *)((char *)TBL_A678 + a0 * 59);
		*a3 = *(int *)((char *)TBL_A67A + a0 * 59);
		*a4 = *(int *)((char *)TBL_A6E4_V112 + a0 * 59);
	}
	else {
		*a2 = 0;
		*a3 = 0;
		*a4 = 0;
	}
	far_dfeec(a0, a1);
	return;
}
