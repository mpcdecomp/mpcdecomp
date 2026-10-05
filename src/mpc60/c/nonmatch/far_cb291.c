/* differs: +75 bne $7 | jmp br_cb3eb */
extern char B_54F9;
extern char B_8D4C;
extern char B_94A6;
extern char B_9D34;
extern char B_A61D;
extern char STR_348E[];
extern char STR_3499[];
extern char TBL_347E[];
extern int TBL_BA78[];

far_cb291()
{
	char v1;
	char v2;
	int v4;

	far_d880a();
	far_da730(STR_348E);
	if (B_94A6 < 0)
		far_d5bcd(B_9D34);
	far_cb3f8();
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_3499);
	v2 = 0;
	while (v2 == 0) {
		for (; ; ) {
			if ((v1 = far_d981a(66)) != 0)
				break;
			if (B_A61D <= 15)
				far_cb50b(TBL_347E[B_A61D]);
			else if (B_A61D == 16) {
				far_cb3f8();
				far_de02f();
			}
		}
		switch (v1) {
		case 120:
			v4 = 0;
			do {
				TBL_BA78[v4] = 0;
				far_cb50b(v4);
				++v4;
			} while (v4 < 16);
			far_cb3f8();
			break;
		case 121:
			break;
		case 100:
			far_cb3f8();
			break;
		case 68:
		case 78:
			break;
		case 80:
			if (B_8D4C == 4) {
				far_cb3f8();
				far_da3ad(B_A61D);
				B_8D4C = 0;
			}
			break;
		default:
			v2 = 1;
			break;
		}
	}
	far_d71fa();
	return v1;
}
