/* differs: +7b mov bx,word ptr -2[bp] | mov bx, word ptr [bp + 6] */
extern char B_52AD;
extern char TBL_032B[];
extern char TBL_5176[];
extern char TBL_5212_V112[];
extern int W_B256;

far_c52de(a0, a1, a2, a3)
{
	int v2;
	int v4;

	++W_B256;
	v2 = 0;
	do {
		TBL_032B[v2] = 0;
		v2++;
	} while (v2 < 0x780);
	far_c54b2(0);
	far_c51a2(a0);
	v2 = 0;
	do {
		far_c538e(v2, a0);
		++v2;
	} while (v2 < 16);
	far_c5047(a3, a2, a1);
	--W_B256;
	far_c57be();
	v2 = 0;
	do {
		v4 = B_52AD == 0 ? TBL_5176[a0 + v2] : TBL_5212_V112[a0 + v2];
		far_c50a2(v2, a0, v4);
		++v2;
	} while (v2 < 16);
	return;
}
