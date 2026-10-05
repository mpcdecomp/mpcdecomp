extern char B_5218;
extern char B_52A4;
extern char B_52A5;
extern char B_52A7;
extern char B_52A8;
extern char B_52AA;
extern char B_53DC;
extern char B_8E67;
extern char B_8E68;
extern char B_8E69;
extern char B_A61D;
extern char B_BA5E;
extern char STR_2D86[];
extern char STR_2D9E[];
extern char STR_2DAA[];
extern char STR_2DBE[];
extern char STR_2DC6[];
extern char STR_2DD8[];
extern char STR_2DFF[];
extern char STR_2E17[];
extern char STR_2E1F[];
extern char STR_2E25[];
extern char STR_2E2C[];
extern char STR_2E42[];
extern char STR_2E46[];
extern char STR_2E4A[];
extern char TBL_0CF1[];
extern char TBL_8E65[];
extern char TBL_AE2C[];

far_c8720()
{
	int v2;
	int v4;
	int v6;
	char z0[16];
	char v23;
	int v25;
	int v27;
	char v28;
	char v29;

	v29 = 0;
	v28 = B_53DC;
	B_53DC = 66;
	v27 = B_52A8;
	v6 = 0;
	while (v6 == 0) {
		far_d97f5();
		far_c1f4e(STR_2D86);
		far_d8827(1, 0);
		far_d936c(STR_2D9E, &B_52A4, 1, 1, 2, 8);
		far_d936c(STR_2DAA, &B_52A5, 1, 1, 4, 8);
		far_d8827(2, 0);
		far_d916d(STR_2DBE, &B_52AA, 0x2c44, 8);
		far_d936c(STR_2DC6, &B_52A7, 2, 1, 16, 8);
		far_d8827(3, 0);
		far_d885c(STR_2DD8);
		far_d8827(5, 0);
		far_da730(STR_2DFF);
		far_d8827(6, 0);
		far_d916d(STR_2E17, &B_5218, TBL_0CF1, 9);
		far_d885c(0x2e1d);
		far_d8827(6, 15);
		far_d88e6(STR_2E1F, B_5218);
		far_d885c(0x2e23);
		far_dfeec(TBL_AE2C[B_5218], &v23);
		far_d90a6(STR_2E25, &v23, 16);
		far_d8827(7, 0);
		far_d88b2(40);
		far_d8827(7, 0);
		far_d885c(STR_2E2C);
		far_d8719();
		if (B_BA5E != 0)
			v2 = 120;
		v4 = 0;
		while (v4 == 0) {
			if (B_BA5E == 0) {
				for (; ; ) {
					if ((v2 = far_d981a(2)) != 0)
						break;
					switch (B_A61D) {
					case 4:
						far_dfeec(TBL_AE2C[B_5218], &v23);
						far_d8827(6, 15);
						far_d88e6(STR_2E42, B_5218);
						far_da14f(5);
						break;
					case 5:
						far_dff9c(TBL_AE2C[B_5218], &v23);
						far_dfeec(TBL_AE2C[B_5218], &v23);
						break;
					}
				}
				if (v2 == 80) {
					for (; ; ) {
						if ((v25 = far_03012(B_52A4 + 5, TBL_8E65, 0x640)) == 0)
							break;
						if (v25 == 6 && B_8E68 == 3) {
							B_5218 = B_8E69;
							B_BA5E = 1;
							v2 = 120;
						}
						if (v25 == 20 && B_8E68 == 1) {
							B_BA5E = 1;
							far_e0d14(124);
							v2 = 121;
						}
						if (B_BA5E != 0) {
							B_52A7 = B_8E67 + 1;
							if (B_5218 > 33) {
								B_5218 = 33;
								v29 = 1;
							}
							far_dfeec(TBL_AE2C[B_5218], &v23);
							far_d8827(6, 15);
							far_d88e6(STR_2E46, B_5218);
							far_da14f(4);
							far_da14f(5);
							break;
						}
					}
					if (B_BA5E == 0)
						break;
				}
			}
			switch (v2) {
			case 120:
				if (B_BA5E == 0)
					B_52A8 = B_5218;
				far_da8f6(1);
				far_d8827(7, 0);
				far_d885c(STR_2E4A);
				far_d88b2(40);
				if (B_52AA == 1)
					far_e127e(B_5218);
				else
					far_e05a3(B_5218, v29);
				far_da8f6(0);
				B_BA5E = 0;
				B_52A8 = v27;
				v4 = 1;
				break;
			case 121:
				v6 = 1;
				v4 = 1;
				break;
			default:
				v6 = 1;
				v4 = 1;
				break;
			}
		}
	}
	B_53DC = v28;
	return v2;
}
