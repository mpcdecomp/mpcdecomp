extern int TBL_A67C[];
extern int TBL_A67E[];
extern char TBL_A683[];
extern int TBL_A686[];
extern int TBL_A688[];

far_c7cd8(a0, a1, a2, a3, a4, a5)
int *a1;
int *a2;
int *a3;
int *a4;
int *a5;
{
	if ((unsigned)a0 < 34) {
		*a1 = *(int *)((char *)TBL_A67C + a0 * 59);
		*a2 = *(int *)((char *)TBL_A67E + a0 * 59);
		*a3 = *(int *)((char *)TBL_A688 + a0 * 59);
		*a4 = *(int *)((char *)TBL_A686 + a0 * 59);
		*a5 = TBL_A683[a0 * 59];
	}
	else {
		*a1 = 0;
		*a2 = 0;
		*a3 = 0;
		*a4 = 0;
		*a5 = 0;
	}
	return;
}
