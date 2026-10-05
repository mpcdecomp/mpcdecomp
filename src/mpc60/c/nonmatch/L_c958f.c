/* differs: +2d mov ax, word ptr W_52CE_V112_ | mov dx, word ptr [W_52CE_V112] */
extern char B_4CBE_V112;
extern char B_52B5_V112;
extern char TBL_5066_V112[];
extern long W_52CC_V112;
extern int W_52CE_V112;

L_c958f(a0, a1, a2, a3)
{
	int v2;
	int v4;

	far_d8827(7, 0);
	far_d885c(0x2e63);
	L_dcb15(40);
	v2 = W_52CE_V112;
	v4 = W_52CC_V112;
	if (B_52B5_V112 != 0)
		far_d6a82(B_4CBE_V112, 0);
	if (B_52B5_V112 != 0)
		return;
	L_d9e75(a0, a1 - 1, TBL_5066_V112[a2], a3);
	L_d97d2(v4, v2);
}
