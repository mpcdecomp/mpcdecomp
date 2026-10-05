extern int TBL_BA78[];
extern char TBL_BB0E_V112[];

L_d2f44()
{
	char v1;
	char z0[2];

	v1 = 0;
	for (; v1 <= 15; ) {
		TBL_BB0E_V112[v1] = 1;
		TBL_BA78[v1] = 0;
		v1++;
	}
	L_d2fc5();
	far_cb3f8();
	return;
}
