/* differs: +108 bne $12 | jnz br_e62db */
extern char B_4C1E;
extern char B_4C1F;
extern char B_4C20;
extern char B_4E76;
extern char B_4E79;
extern char B_4E7A;
extern char B_5017;
extern char B_5018;
extern char B_5160;
extern char B_521B;
extern char TBL_1023[];
extern long TBL_1033[];
extern int TBL_1043[];
extern int TBL_1045[];
extern int TBL_1047[];
extern char TBL_5284[];
extern int TBL_5389;
extern char TBL_954C[];
extern char TBL_95B0[];
extern int W_4C1C;
extern int W_5361;
extern int W_5363;
extern int W_5365;
extern int W_5367;
extern long W_5385;
extern int W_538B;
extern int W_538D;
extern int W_53A9;
extern int W_9FA5;
extern int W_A051;

far_e61c1()
{
	int v2;

	W_A051 = TBL_1023[B_5160];
	far_c49ac((B_5018 & 15) + 1, B_5018 >> 4);
	W_53A9 = B_4E76 * 0x9c4;
	far_e5842();
	W_5367 = B_4C20 != 0 ? W_9FA5 : W_4C1C;
	W_5363 = far_d393d(W_5367, B_4C1E, B_4C1F);
	W_5361 = W_5363;
	W_5365 = W_5361;
	W_5385 = TBL_1033[B_4C1F];
	TBL_5389 = TBL_1043[B_4C1F * 3];
	W_538B = TBL_1045[B_4C1F * 3];
	W_538D = TBL_1047[B_4C1F * 3];
	v2 = 0;
	do {
		far_ddf9a(v2, TBL_5284[v2]);
		++v2;
	} while (v2 < 32);
	v2 = 0;
	do {
		if ((TBL_954C[v2] & 2) == 0) {
			TBL_954C[v2] = B_5017;
			TBL_95B0[v2] = B_5018;
		}
		v2++;
	} while (v2 < 100);
	far_d4273(B_4E7A);
	far_d438f(B_4E79);
	far_d87e1(B_521B);
	far_de02f();
	return;
}
