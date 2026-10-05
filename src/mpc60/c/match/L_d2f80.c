extern char B_5503;
extern int TBL_BA78[];
extern char TBL_BB0E_V112[];

L_d2f80(a0)
{
	int v2;

	v2 = TBL_BA78[a0];
	if (TBL_BB0E_V112[a0] == 0)
		v2 = -v2;
	far_ddf6d(B_5503 + a0, v2 * 20 + 0x2000);
	return;
}
