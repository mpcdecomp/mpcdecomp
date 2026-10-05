far_df8b4(a0)
{
	int v2;

	v2 = 0;
	do {
		if (strncmp(a0, v2 * 59 + -0x5944, 16) == 0)
			return v2;
		++v2;
	} while (v2 < 34);
	return -4;
}
