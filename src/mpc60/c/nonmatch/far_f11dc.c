/* differs: +41 mov al,byte ptr TBL_5232_V112_ [bx] | mov bx, word ptr [bp - 2] */
extern char B_94A7;
extern char B_A04C;
extern char B_BF02_V112;
extern char B_BFAC_V112;
extern char TBL_520D_V112[];
extern char TBL_5212_V112[];
extern char TBL_5232_V112[];
extern char TBL_5252_V112[];
extern int TBL_5272_V112[];
extern char TBL_BF07_V112[];
extern char TBL_BF0C_V112[];
extern char TBL_BF2C_V112[];
extern char TBL_BF4C_V112[];
extern int TBL_BF6C_V112[];
extern int W_520B_V112;
extern int W_94D8;
extern int W_BF03_V112;
extern int W_BF05_V112;

far_f11dc()
{
	int v2;

	B_BF02_V112 = B_94A7;
	W_BF03_V112 = W_94D8;
	W_BF05_V112 = W_520B_V112;
	v2 = 0;
	do {
		TBL_BF07_V112[v2] = TBL_520D_V112[v2];
		v2++;
	} while (v2 < 5);
	v2 = 0;
	do {
		TBL_BF0C_V112[v2] = TBL_5212_V112[v2];
		TBL_BF2C_V112[v2] = TBL_5232_V112[v2];
		TBL_BF4C_V112[v2] = TBL_5252_V112[v2];
		TBL_BF6C_V112[v2] = TBL_5272_V112[v2];
		++v2;
	} while (v2 < 32);
	B_BFAC_V112 = B_A04C;
	return;
}
