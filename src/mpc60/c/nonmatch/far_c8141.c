/* differs: +50 bne $6 | jmp br_c86d0 */
extern char B_4E78;
extern char B_5016;
extern char B_5218;
extern char B_52A4;
extern char B_52A5;
extern char B_52A7;
extern char B_52A8;
extern char B_52AA;
extern char B_8D89;
extern char B_8E67;
extern char B_8E68;
extern char B_8E69;
extern char B_A61D;
extern char B_BA5E;
extern char STR_2C58[];
extern char STR_2C73[];
extern char STR_2C7F[];
extern char STR_2C93[];
extern char STR_2C9B[];
extern char STR_2CB0[];
extern char STR_2CB6[];
extern char STR_2CBC[];
extern char STR_2CE3[];
extern char STR_2CFE[];
extern char STR_2D0C[];
extern char STR_2D1F[];
extern char STR_2D35[];
extern char STR_2D39[];
extern char STR_2D55[];
extern char STR_2D7D[];
extern char TBL_0CF1[];
extern char TBL_4E87;
extern char TBL_8E65[];
extern char TBL_AE2C[];
long far_df05c();

far_c8141()
{
	int v2;
	int v4;
	int v6;
	char z0[16];
	char v23;
	char z1[16];
	char v40;
	long v44;
	int v46;
	int v48;
	int v50;
	int v52;
	int v54;
	int v56;

	B_BA5E = 0;
	B_8D89 = 1;
	v50 = B_5016;
	v52 = B_4E78;
	B_5016 = 0;
	B_4E78 = 0;
	v48 = TBL_4E87;
	TBL_4E87 = 1;
	outportw(-198, 17);
	v6 = 0;
	while (v6 == 0) {
		far_d97f5();
		far_c1f4e(STR_2C58);
		far_d8827(1, 0);
		far_d936c(STR_2C73, &B_52A4, 1, 1, 2, 8);
		far_d936c(STR_2C7F, &B_52A5, 1, 1, 4, 8);
		far_d8827(2, 0);
		far_d916d(STR_2C93, &B_52AA, 0x28d4, 8);
		far_d88b2(19);
		v44 = far_df05c();
		v46 = v44 / 0x3e8L;
		far_d88e6(STR_2C9B, v46);
		far_d8827(3, 0);
		far_d916d(STR_2CB0, &B_5218, TBL_0CF1, 9);
		far_d88b2(19);
		far_dfeec(TBL_AE2C[B_5218], &v23);
		far_d90a6(STR_2CB6, &v23, 16);
		far_d8827(4, 0);
		far_d885c(STR_2CBC);
		far_d8827(5, 0);
		far_da730(STR_2CE3);
		far_d8827(6, 0);
		far_d936c(STR_2CFE, &B_52A7, 2, 1, 16, 8);
		far_d936c(STR_2D0C, &B_52A8, 4, 0, 0x270f, 8);
		far_d8827(7, 0);
		far_d88b2(40);
		far_d8827(7, 0);
		far_d885c(STR_2D1F);
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
						v56 = far_dff9c(TBL_AE2C[B_5218], &v23);
						if (v56 == -1) {
							far_d8850();
							far_de533(-v56);
							far_d8856();
						}
					case 3:
						far_dfeec(TBL_AE2C[B_5218], &v23);
						far_da14f(4);
						break;
					}
				}
				if (v2 == 80) {
					for (; ; ) {
						if ((v54 = far_03012(B_52A4 + 5, TBL_8E65, 0x640)) == 0)
							break;
						if (v54 == 6 && B_8E68 == 3) {
							B_5218 = B_8E69;
							B_BA5E = 1;
							v2 = 121;
						}
						if (v54 == 20 && B_8E68 == 1) {
							B_BA5E = 1;
							far_e0d14(124);
							v2 = 120;
						}
						if (B_BA5E != 0) {
							B_52A7 = B_8E67 + 1;
							far_dfeec(TBL_AE2C[B_5218], &v23);
							far_d8827(3, 15);
							far_d88e6(STR_2D35, B_5218);
							far_da14f(3);
							far_da14f(4);
							break;
						}
					}
					if (B_BA5E == 0)
						break;
				}
			}
			switch (v2) {
			case 120:
				if (v2 == 120) {
					far_da8f6(1);
					far_d8827(7, 0);
					far_d88b2(40);
					if (far_de385(B_5218) == 0) {
						far_d8827(6, 0);
						far_d885c(STR_2D39);
						far_d88b2(40);
						far_df3d4(0, -1, -1);
						far_c733d(&v23);
					}
					far_dfeec(34, &v40);
					if (strcmp(&v23, &v40) == 0)
						far_c733d(&v23);
					far_da14f(4);
					if (B_BA5E == 0) {
						far_d8827(6, 0);
						far_d885c(STR_2D55);
					}
					far_d8827(7, 0);
					far_d885c(STR_2D7D);
					far_d88b2(40);
					if (B_52AA == 1)
						v56 = far_e0f06(B_5218, &v23);
					else
						v56 = far_e01e1(B_5218, &v23, B_BA5E);
					if (v56 != 0)
						far_de385(B_5218);
				}
				far_da8f6(0);
				far_dff9c(TBL_AE2C[B_5218], &v23);
				far_dfeec(TBL_AE2C[B_5218], &v23);
				far_da14f(4);
				B_BA5E = 0;
				v4 = 1;
				break;
			case 121:
				v2 = far_c8720();
				if (v2 != 121)
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
	far_d8799(1, 1);
	far_d8799(2, 1);
	outportw(-198, 19);
	TBL_4E87 = v48;
	B_5016 = v50;
	B_4E78 = v52;
	B_8D89 = 0;
	far_d8765();
	return v2;
}
