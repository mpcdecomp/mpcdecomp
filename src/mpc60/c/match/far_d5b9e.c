extern char TBL_5066_V112[];

far_d5b9e(a0)
{
	int v2;

	v2 = 0;
	do {
		if (TBL_5066_V112[v2] == a0)
			return v2;
		v2++;
	} while (v2 <= 99);
	return a0;
}
