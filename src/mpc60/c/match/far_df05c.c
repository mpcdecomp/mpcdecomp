extern char TBL_AE8F[];
extern long TBL_AE95[];

long far_df05c()
{
	int v2;
	long v6;

	v6 = 0L;
	v2 = 0;
	do {
		if (TBL_AE8F[v2 * 10] == -1)
			v6 += *(long *)((char *)TBL_AE95 + v2 * 10);
		++v2;
	} while (v2 < 80);
	return v6;
}
