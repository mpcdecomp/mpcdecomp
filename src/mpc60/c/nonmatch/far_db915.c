/* differs: +20 bhis $8 | jnc br_db951 */
extern char TBL_5282[];
extern char TBL_A68A[];
extern char TBL_AE2C[];

far_db915()
{
	int v2;
	int v4;
	int v6;

	v2 = 2;
	do {
		v4 = TBL_AE2C[v2];
		v6 = 0;
		if ((unsigned)v4 < 34)
			v6 = TBL_A68A[v4 * 59] + -7;
		if (v6 < 0)
			v6 = 0;
		if (v6 > 8)
			v6 = 0;
		TBL_5282[v2] = v6;
		v2++;
	} while (v2 < 34);
	return;
}
