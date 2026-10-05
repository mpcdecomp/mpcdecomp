/* differs: +1e bne $5 | jnz br_ef664 */
extern char TBL_A656[];
extern char TBL_AE8F[];
extern char TBL_AE90[];
extern int TBL_AE93[];
extern long TBL_AE95[];
extern long TBL_AEF6_V112[];

far_ef5cf(a0)
{
	int v2;
	int v4;

	v4 = 0;
	v2 = far_ef6b0(a0);
	if (v2 == -1) {
		v4 = 0;
		do {
			if (TBL_AE90[v4 * 10] == a0) {
				TBL_AE8F[v4 * 10] = -1;
				TBL_AE90[v4 * 10] = -1;
				far_f1c62(*(int *)((char *)TBL_AEF6_V112 + v4 * 10), TBL_AE93[v4 * 5], *(long *)((char *)TBL_AE95 + v4 * 10) + *(long *)((char *)TBL_AEF6_V112 + v4 * 10), v4);
			}
			++v4;
		} while (v4 < 80);
	}
	else {
		v4 = 0;
		do {
			if (TBL_AE90[v4 * 10] == a0) {
				TBL_AE90[v4 * 10] = v2;
				break;
			}
			v4++;
		} while (v4 < 80);
	}
	TBL_A656[a0 * 59] = 0;
	return;
}
