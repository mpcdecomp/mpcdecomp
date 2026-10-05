extern char TBL_AE8F[];
extern long TBL_AE95[];

long far_df0a8()
{
	long v4;
	int v6;

	v4 = 0L;
	v6 = 0;
	do {
		if (TBL_AE8F[v6 * 10] == 1)
			v4 += *(long *)((char *)TBL_AE95 + v6 * 10);
		++v6;
	} while (v6 < 80);
	return v4;
}
