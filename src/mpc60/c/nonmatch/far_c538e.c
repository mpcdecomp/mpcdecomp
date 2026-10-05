/* differs: +f mov bx,word ptr 6[bp] | mov bx, word ptr [bp + 8] */
extern char B_52AD;
extern int TBL_01C3[];
extern char TBL_032B[];
extern char TBL_5196[];
extern char TBL_5232_V112[];
extern int W_B256;

far_c538e(a0, a1)
{
	int v2;
	int v4;
	int v6;
	char z0[2];
	char *v10;
	int v12;

	v2 = B_52AD == 0 ? TBL_5196[a1 + a0] : TBL_5232_V112[a1 + a0];
	v10 = TBL_032B;
	v4 = a0 * 15;
	v12 = TBL_01C3[(v2 + 3) / 9];
	v6 = 0;
	do {
		v12++;
		far_de424(v10, v4 + 3, *(char *)v12++, 8, W_B256);
		v12++;
		far_de424(v10, v4, *(char *)v12++, 3, W_B256);
		v10 += 30;
		++v6;
	} while (v6 < 11);
	return;
}
