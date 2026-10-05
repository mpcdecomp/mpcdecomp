/* differs: +68 blt $9 | jl L_d5d3c */
extern long TBL_A66C[];
extern int TBL_A678[];
extern int TBL_A67A[];
extern int TBL_A67C[];
extern int TBL_A6E4_V112[];

L_d5ca8(a0, a1, a2, a3, a4)
{
	int v2;

	if ((unsigned)a0 >= 34)
		return;
	if (a2 >= 0) {
		v2 = *(long *)((char *)TBL_A66C + a0 * 59) / 40L;
		if (a2 > v2)
			a2 = v2;
		*(int *)((char *)TBL_A67A + a0 * 59) = a2;
	}
	if (a1 >= 0) {
		v2 = *(int *)((char *)TBL_A67A + a0 * 59);
		if (a1 > v2)
			a1 = v2;
		*(int *)((char *)TBL_A678 + a0 * 59) = a1;
	}
	if (a3 >= 0)
		*(int *)((char *)TBL_A67C + a0 * 59) = a3;
	if (a4 >= 0) {
		v2 = *(int *)((char *)TBL_A67A + a0 * 59) - *(int *)((char *)TBL_A678 + a0 * 59);
		if (a4 > v2)
			a4 = v2;
		*(int *)((char *)TBL_A6E4_V112 + a0 * 59) = a4;
	}
	L_e36c4(a0);
}
