extern char B_54F9;
extern char B_5503;
extern char B_A61D;
extern char STR_2753[];
extern char TBL_26A6[];
extern unsigned char *W_A650;

far_c675e()
{
	char v1;
	char v2;

	far_d880a();
	far_da730(STR_2753);
	far_c6834();
	far_d8827(6, 0);
	far_d8894(61, 40);
	v2 = 0;
	while (v2 == 0) {
		for (; ; ) {
			if ((v1 = far_d981a(64)) != 0)
				break;
			if (B_A61D <= 15)
				far_de010(TBL_26A6[B_A61D] + B_5503, *W_A650);
		}
		switch (v1) {
		case 100:
			far_c6834();
			break;
		case 68:
			far_da3ad(TBL_26A6[B_54F9 & 15]);
			break;
		case 78:
			break;
		default:
			v2 = 1;
			break;
		}
	}
	return v1;
}
