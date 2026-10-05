extern char B_5C51_V112;
extern char B_A61D;
extern char B_BB1E_V112;
extern char TBL_0BC4[];
extern char TBL_5C59_V112[];
extern char TBL_AE2C[];

L_d1f32()
{
	char v1;
	char v2;
	char z0[3];
	char v6;
	char z1[16];
	char v23;

	L_c4063(0x3611);
	far_d8827(1, 0);
	far_d916d(0x3630, 0x5c51, 0xcaf, 9);
	far_dfeec(TBL_AE2C[B_5C51_V112], &v23);
	far_d90a6(0x3636, &v23, 16);
	far_d8827(2, 0);
	far_d885c(0x3640);
	far_d8827(2, 18);
	far_d885c(0x364b);
	L_d2183();
	far_d8827(3, 0);
	L_de62c(0x3656);
	far_d8827(4, 0);
	far_d916d(0x3667, -0x44e2, TBL_0BC4, 4);
	v6 = TBL_5C59_V112[B_BB1E_V112];
	far_d916d(0x366d, &v6, 0xc66, 4);
	far_d8827(7, 0);
	far_d885c(0x3685);
	v2 = 0;
	while (v2 == 0) {
		for (; ; ) {
			if ((v1 = far_d981a(1)) != 0)
				break;
			switch (B_A61D) {
			case 0:
				far_dfeec(TBL_AE2C[B_5C51_V112], &v23);
				far_da14f(1);
				L_d2183();
				break;
			case 1:
				L_d633f(TBL_AE2C[B_5C51_V112], &v23);
				far_dfeec(TBL_AE2C[B_5C51_V112], &v23);
				far_da14f(1);
				break;
			case 2:
				v6 = TBL_5C59_V112[B_BB1E_V112];
				far_da14f(3);
				break;
			case 3:
				TBL_5C59_V112[B_BB1E_V112] = v6;
				break;
			}
		}
		switch (v1) {
		case 120:
			far_de385(B_5C51_V112);
			far_dfeec(TBL_AE2C[B_5C51_V112], &v23);
			L_d2183();
			far_da14f(1);
			break;
		default:
			v2 = 1;
			break;
		}
	}
	return v1;
}
