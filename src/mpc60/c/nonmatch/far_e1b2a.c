/* differs: +d4 bne $6 | jmp br_e1c0e */
extern char B_4CBE_V112;
extern char B_5064_V112;
extern char B_52B5_V112;
extern char B_94A7;
extern unsigned char B_9F92;
extern char B_A61D;
extern int TBL_4CC6_V112[];
extern int TBL_4E10_V112[];
extern long W_4E0C_V112[];
extern long W_94C0;
extern long W_94C4;
extern int W_94D0;
extern int W_94D2;
extern int W_94D6;
extern int W_94D8;
extern int W_9D38;
long far_d6f51();
long far_d7ae2();

far_e1b2a()
{
	int v2;
	int v4;
	int v6;
	char v7;
	int v9;
	int v11;

	L_c4063(0x22d8);
	far_d8827(1, 0);
	v7 = B_94A7 & 1;
	far_d916d(0x22f5, &v7, 0x21cc, 14);
	far_d936c(0x22fd, 0x5203, 3, 1, 999, 0);
	far_d8827(2, 0);
	L_de62c(0x230a);
	far_d8827(6, 0);
	far_d8894(45, 40);
	v9 = 0;
	v11 = far_e1c15(v9);
	far_d8827(7, 0);
	far_d885c(0x2325);
	v4 = 0;
	while (v4 == 0) {
		for (; ; ) {
			if ((v2 = far_d981a(2)) != 0)
				break;
			switch (B_A61D) {
			case 0:
				if (B_52B5_V112 == -1) {
					far_d5bcd(B_4CBE_V112, 0);
					v11 = far_e1c15(v9);
					far_da14f(1);
				}
				B_94A7 = B_94A7 & -2 | v7;
				L_dc484(B_4CBE_V112, 1);
				break;
			case 1:
				if (B_52B5_V112 == -1) {
					far_d5bcd(B_4CBE_V112, 0);
					v11 = far_e1c15(v9);
					far_da14f(2);
				}
				far_d6a82(B_4CBE_V112, 0);
				if (W_94D8 > W_94D6) {
					W_94D8 = W_94D6;
					far_da14f(1);
				}
				if (B_5064_V112 != 0) {
					W_94C0 = far_d6f51(W_94D8);
					W_94C4 = far_d7ae2(W_94D8);
				}
				else
					far_d7268();
				W_9D38 = 0x1000;
				if (B_9F92 != 0) {
					v6 = 0;
					for (; v6 < B_9F92; ) {
						if ((unsigned)W_94C4 < *(long *)((char *)W_4E0C_V112 + v6 * 6))
							break;
						++v6;
					}
					if (v6 != 0)
						W_9D38 = TBL_4E10_V112[(v6 - 1 << 1) + (v6 - 1)];
				}
				far_d447f(W_94D0, W_94D2, 0x601a);
				L_dc484(B_4CBE_V112, 1);
				break;
			}
		}
		switch (v2) {
		case 120:
			if (v11 == 6 && TBL_4CC6_V112[((v9 + 1 << 1) + (v9 + 1)) * 4] != -1) {
				++v9;
				v11 = far_e1c15(v9);
			}
			break;
		case 121:
			if (v9 > 0) {
				--v9;
				v11 = far_e1c15(v9);
			}
			break;
		default:
			v4 = 1;
			break;
		}
	}
	return v2;
}
