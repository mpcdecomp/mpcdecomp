extern char TBL_8C09[];
extern char TBL_8C49[];

far_e7d6a()
{
	int v2;
	int v4;

	v2 = 0;
	v4 = 0;
	do {
		v2 |= TBL_8C49[v4];
		v4++;
	} while (v4 < 128);
	v4 = 0;
	do {
		v2 |= TBL_8C09[v4];
		v4++;
	} while (v4 < 32);
	return v2;
}
