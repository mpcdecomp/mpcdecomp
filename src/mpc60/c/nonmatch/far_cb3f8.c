/* differs: +78 shl ax,1 | add ax, TBL_BA78 */
extern char B_5216;
extern char B_5503;
extern char STR_34A2[];
extern char TBL_347E[];
extern int TBL_51D6[];
extern int TBL_A00C[];
extern int TBL_BA78[];

far_cb3f8()
{
	int v2;
	int v4;

	v2 = 0;
	do {
		v4 = B_5503 + v2;
		TBL_BA78[v2] = ((B_5216 != 0 ? TBL_A00C[v4] : TBL_51D6[v4]) + -0x2000) / 20;
		++v2;
	} while (v2 <= 15);
	far_d97f5();
	v2 = 0;
	do {
		far_cb4b4(v2);
		far_d936c(0x312f, (TBL_347E[v2] << 1) + TBL_BA78, 4, -120, 60, 0);
		++v2;
	} while (v2 < 16);
	far_d8827(5, 0);
	far_d916d(STR_34A2, &B_5216, 0xb52, 8);
	return;
}
