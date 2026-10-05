extern int TBL_3B38_V112[];

L_d622a(a0)
{
	int v2;

	v2 = 0;
	for (; (unsigned)v2 < 180; ) {
		if (TBL_3B38_V112[v2] >= a0)
			break;
		++v2;
	}
	return v2 * 20 + 0x16a0;
}
