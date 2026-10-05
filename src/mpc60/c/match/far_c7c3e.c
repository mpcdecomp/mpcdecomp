extern int TBL_A672[];
extern int TBL_A678[];
extern int TBL_A67A[];
extern char TBL_A682[];

far_c7c3e(a0, a1, a2, a3, a4)
char *a1;
int *a2;
int *a3;
int *a4;
{
	if ((unsigned)a0 < 34) {
		*a3 = *(int *)((char *)TBL_A678 + a0 * 59);
		*a4 = *(int *)((char *)TBL_A67A + a0 * 59);
		*a1 = TBL_A682[a0 * 59];
		*a2 = *(int *)((char *)TBL_A672 + a0 * 59);
	}
	else {
		*a3 = 0;
		*a4 = 0;
		*a1 = 100;
		*a2 = 0;
	}
	return;
}
