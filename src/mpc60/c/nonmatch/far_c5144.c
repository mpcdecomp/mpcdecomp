/* differs: +2e inc word ptr -10[bp] | push word ptr [W_B256] */
extern int TBL_01BF[];
extern int W_B256;

far_c5144(a0, a1)
{
	int v2;
	int v4;
	char z0[2];
	int v8;
	int v10;

	v10 = TBL_01BF[a0];
	v2 = a1 * 15 + 3;
	v8 = 0x49f;
	v4 = 0;
	do {
		v10++;
		far_de424(v8, v2, *(char *)v10++, 5, W_B256);
		v8 += 30;
		++v4;
	} while (v4 < 3);
	return;
}
