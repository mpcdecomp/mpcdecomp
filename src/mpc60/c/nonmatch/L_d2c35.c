/* differs: +7c bne $7 | jmp br_cb3eb */
extern char B_4CBE_V112;
extern char B_52B5_V112;
extern char B_617D_V112;
extern char B_A61D;
extern char TBL_347E[];
extern int TBL_BA78[];
extern char TBL_BB0E_V112[];
extern int W_A650;

L_d2c35()
{
	char v1;
	char v2;
	int v4;
	char z0[2];
	int *v8;

	far_d880a();
	L_de62c(0x38ac);
	if (B_52B5_V112 < 0)
		far_d5bcd(B_4CBE_V112, 0, 2);
	far_cb3f8();
	far_d8827(6, 0);
	far_d8894(45, 40);
	far_d8827(7, 0);
	far_d885c(0x38b7);
	v2 = 0;
	while (v2 == 0) {
		for (; ; ) {
			if ((v1 = far_d981a(67)) != 0)
				break;
			if (B_A61D <= 15) {
				v8 = W_A650;
				v4 = TBL_347E[B_A61D];
				if (TBL_BB0E_V112[v4] != 0 && *v8 > 60) {
					*v8 = 60;
					far_da14f(B_A61D);
				}
				L_d2f80(v4);
			}
			else if (B_A61D == 16) {
				far_cb3f8();
				far_de02f();
			}
		}
		switch (v1) {
		case 120:
			if (B_A61D <= 15) {
				v4 = TBL_347E[B_A61D];
				if ((TBL_BB0E_V112[v4] = TBL_BB0E_V112[v4] ^ 1) != 0 && TBL_BA78[v4] > 60)
					TBL_BA78[v4] = 60;
				L_d2fc5();
				L_d2ecb(B_A61D);
				far_da14f(B_A61D);
			}
			break;
		case 121:
			L_d2f44();
			break;
		case 100:
			far_cb3f8();
			break;
		case 68:
		case 78:
			break;
		default:
			v2 = 1;
			break;
		}
	}
	far_d71fa();
	return v1;
}
