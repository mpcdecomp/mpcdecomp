/* differs: +4d mov ax,word ptr -2[bp] | mov al, byte ptr [bx + TBL_5517] */
extern char A_9F97[];
extern char B_94A6;
extern char B_A06A;
extern unsigned char B_A06B;
extern char B_A06E;
extern unsigned char TBL_5516[];
extern unsigned char TBL_5517[];
extern char TBL_7DA2[];
extern char TBL_9FA7[];
extern char W_53BB;
extern int W_94D0;
extern int W_94D2;

far_ecf22(a0)
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;

	if (B_A06E == 0)
		far_d7939();
	if (B_A06B >= 250)
		B_A06B = 0;
	B_A06A = a0;
	v2 = a0 - 1;
	v4 = TBL_5516[v2 * 500];
	v6 = TBL_5517[v2 * 500];
	if (v6 != 0) {
		far_d55e8(&B_94A6);
		B_A06E = 0;
		far_d6a82(&B_94A6, v4, 1);
		B_A06E = 1;
		if (B_A06B != 0) {
			far_d7241(&B_94A6);
			v8 = far_d6fda(B_A06B);
			far_e8cd3(&B_94A6, v8);
		}
		v10 = 0;
		do {
			TBL_9FA7[v10] = TBL_7DA2[v2 * 5 + v10];
			v10++;
		} while (v10 < 5);
		far_d442b(TBL_9FA7, A_9F97);
		far_d447f(W_94D0, W_94D2, &W_53BB);
	}
	else {
		far_d55e8(&B_94A6);
		far_e8cd3(&B_94A6, 1);
	}
	B_A06E = 1;
	far_d4c91();
	far_ec4cc();
	return;
}
