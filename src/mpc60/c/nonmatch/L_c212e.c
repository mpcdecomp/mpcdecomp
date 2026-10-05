/* differs: +1a8 bne $7 | jmp L_c2491 */
extern char B_4C1F;
extern char B_4CBE_V112;
extern char B_4E7A;
extern char B_52B5_V112;
extern char B_53AB;
extern char B_53DC;
extern char B_5757_V112;
extern char B_5B0A_V112;
extern char B_A61D;
extern int TBL_0B9E[];
extern int TBL_0BA8[];
extern int TBL_0FD1_V112[];
extern int W_520B_V112;
extern int W_5385;
extern int W_5387;
extern int W_5B08_V112;
extern int W_94D0;
extern int W_94D2;

L_c212e()
{
	char v1;
	char v2;
	int v4;
	int v6;
	int v8;
	char z0[2];

	L_de62c(0x139e);
	far_d7983();
	if (B_52B5_V112 < 0)
		far_d5bcd(B_4CBE_V112, 0);
	far_d8827(1, 0);
	far_d916d(0x13a4, 0x5b0c, 0xb24, 8);
	v8 = (B_4C1F + 1) * B_5B0A_V112;
	far_d8827(2, 0);
	v4 = far_cb22f(W_520B_V112);
	far_d936c(0x13b9, &v4, 5, TBL_0B9E[v8], TBL_0BA8[v8], 4);
	v6 = far_cb22f(W_5B08_V112);
	far_d936c(0x13c3, &v6, 5, TBL_0B9E[v8], TBL_0BA8[v8], 4);
	far_d8827(3, 0);
	L_de62c(0x13d3);
	far_d8827(4, 0);
	far_d916d(0x13e0, 0x5b0a, 0xb3c, 3);
	far_d916d(0x13e9, 0x5b0b, 0xb4a, 6);
	far_d8827(5, 0);
	L_de62c(0x1400);
	far_d8827(6, 0);
	far_d936c(0x1406, 0x5b0e, 1, 2, 4, 8);
	far_d8827(7, 0);
	far_d885c(0x1415);
	v2 = 0;
	while (v2 == 0) {
		for (; ; ) {
			if ((v1 = far_d981a(2)) != 0)
				break;
			B_5757_V112 = 0;
			switch (B_A61D) {
			case 0:
				far_d7a0d();
				break;
			case 1:
				far_d393d(v4, B_5B0A_V112, B_4C1F);
				W_520B_V112 = far_d3a45(far_d393d(v4, B_5B0A_V112, B_4C1F), 0, 0);
				B_5757_V112 = 0;
				far_d7a0d();
				v4 = far_cb22f(W_520B_V112);
				far_da14f(1);
				break;
			case 2:
				far_d393d(v6, B_5B0A_V112, B_4C1F);
				W_5B08_V112 = far_d3a45(far_d393d(v6, B_5B0A_V112, B_4C1F), 0, 0);
				far_d7a0d();
				v6 = far_cb22f(W_5B08_V112);
				far_da14f(2);
				break;
			case 3:
			case 4:
				W_5387 = TBL_0FD1_V112[B_4C1F * 2 + 4];
				W_5385 = TBL_0FD1_V112[B_4C1F * 2 + 3];
				v4 = far_cb22f(W_520B_V112);
				v6 = far_cb22f(W_5B08_V112);
				v8 = (B_4C1F + 1) * B_5B0A_V112;
				far_da2b0(1, TBL_0B9E[v8], TBL_0BA8[v8]);
				far_da2b0(2, TBL_0B9E[v8], TBL_0BA8[v8]);
				far_da14f(1);
				far_da14f(2);
				far_d442b(0x520e, 0x51fa);
				break;
			}
		}
		switch (v1) {
		case 120:
			B_53DC = 1;
			v1 = far_c5aa2();
			v2 = 1;
			break;
		case 121:
			v1 = L_c2717();
			v2 = 1;
			break;
		default:
			v2 = 1;
			break;
		}
	}
	if (B_4E7A != 6 || B_53AB == 0)
		far_d447f(W_94D0, W_94D2, 0x601a);
	return v1;
}
