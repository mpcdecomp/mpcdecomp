extern int TBL_A678[];
extern int TBL_A67A[];
extern int TBL_A67C[];
extern int TBL_A67E[];
extern int TBL_A686[];
extern int TBL_A688[];

far_dfaf7(a0)
{
	int v2;
	int v4;
	int v6;

	if ((unsigned)a0 >= 34)
		return;
	if ((v2 = *(int *)((char *)TBL_A67A + a0 * 59) - *(int *)((char *)TBL_A678 + a0 * 59) + -10) < 0)
		v2 = 0;
	if ((v4 = *(int *)((char *)TBL_A688 + a0 * 59) + *(int *)((char *)TBL_A67C + a0 * 59) + *(int *)((char *)TBL_A686 + a0 * 59) + *(int *)((char *)TBL_A67E + a0 * 59)) > v2) {
		if ((v6 = v4 - v2) > *(int *)((char *)TBL_A686 + a0 * 59))
			v6 = *(int *)((char *)TBL_A686 + a0 * 59);
		*(int *)((char *)TBL_A686 + a0 * 59) -= v6;
		v4 -= v6;
	}
	if (v4 > v2) {
		if ((v6 = v4 - v2) > *(int *)((char *)TBL_A67C + a0 * 59))
			v6 = *(int *)((char *)TBL_A67C + a0 * 59);
		*(int *)((char *)TBL_A67C + a0 * 59) -= v6;
		v4 -= v6;
	}
	if (v4 > v2) {
		if ((v6 = v4 - v2) > *(int *)((char *)TBL_A688 + a0 * 59))
			v6 = *(int *)((char *)TBL_A688 + a0 * 59);
		*(int *)((char *)TBL_A688 + a0 * 59) -= v6;
		v4 -= v6;
	}
	if (v4 > v2) {
		if ((v6 = v4 - v2) > *(int *)((char *)TBL_A67E + a0 * 59))
			v6 = *(int *)((char *)TBL_A67E + a0 * 59);
		*(int *)((char *)TBL_A67E + a0 * 59) -= v6;
		v4 -= v6;
	}
}
