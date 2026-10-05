/* differs: +c bne $5 | jnz br_f0551 */
extern char B_52B5_V112;
extern char B_A063;
extern int TBL_806C[];
extern char TBL_88F0_V112[];
extern char TBL_8A70_V112[];
extern int W_A04D;

far_f04ce()
{
	int v2;
	char z0[4];

	if (B_52B5_V112 == 0) {
		v2 = 0;
		for (; (unsigned)v2 < 128; v2++) {
			if (TBL_88F0_V112[v2] == -1)
				continue;
			if (TBL_88F0_V112[v2] == -2) {
				if (TBL_8A70_V112[v2] == -1) {
					TBL_8A70_V112[v2] = 64;
					TBL_806C[v2] = W_A04D;
				}
				continue;
			}
			TBL_88F0_V112[v2] = TBL_8A70_V112[v2] = -1;
		}
		B_A063 = 1;
		far_04fa0();
	}
	return;
}
