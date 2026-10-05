/* differs: +37 mov al, byte ptr B_5D9E_V112_ | mov bx, word ptr [bp - 2] */
extern char B_5064_V112;
extern char B_5D9E_V112;
extern char B_94A7;
extern char B_9D36;
extern char B_9F92;
extern char B_A04C;
extern char TBL_5066_V112[];
extern char TBL_50CA_V112[];
extern int TBL_512E_V112[];
extern int W_51FA_V112;
extern int W_51FC_V112;
extern int W_520B_V112;
extern int W_53A7;
extern int W_5B08_V112;
extern int W_5D9F_V112;
extern int W_94C4;
extern int W_94C6;
extern int W_94D8;
extern int W_9D38;

far_d5eec()
{
	int v2;

	B_9F92 = 0;
	W_94C6 = 0;
	W_94C4 = 0;
	W_9D38 = W_53A7 = 0x1000;
	B_5064_V112 = 0;
	v2 = 0;
	do {
		TBL_5066_V112[v2] = v2;
		TBL_50CA_V112[v2] = B_5D9E_V112;
		TBL_512E_V112[v2] = W_5D9F_V112;
		++v2;
	} while (v2 <= 99);
	B_94A7 = 1;
	W_94D8 = 1;
	W_520B_V112 = W_5B08_V112;
	setmem(0x520d, 5, 0);
	W_51FC_V112 = 0;
	W_51FA_V112 = 0;
	B_A04C = 1;
	B_9D36 = TBL_5066_V112[B_A04C];
	far_d7a0d();
	far_e8f55();
	return;
}
