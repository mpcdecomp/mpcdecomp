extern char TBL_015B[];
extern int TBL_017D[];

far_c5846(a0)
char a0;
{
	int v2;

	v2 = 0;
	for (; TBL_015B[v2] != 0; ) {
		if (TBL_015B[v2] == a0)
			return TBL_017D[v2];
		v2++;
	}
	return TBL_017D[0];
}
