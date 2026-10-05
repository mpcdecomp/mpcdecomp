/* differs: +2c8 bne $6 | jmp br_c304f */
extern char A_8E52[];
extern char A_B218[];
extern char A_B229[];
extern char A_B232[];
extern char B_4C1E;
extern char B_4C1F;
extern char B_4C20;
extern char B_4C32;
extern char B_53DB;
extern char B_53DC;
extern char B_54F7;
extern char B_5507;
extern char B_5508;
extern char B_7E10;
extern char B_7E11;
extern char B_8CC9;
extern char B_8CCB;
extern char B_8CD3;
extern char B_8CD4;
extern char B_8CDA;
extern char B_8CDB;
extern char B_8D8C;
extern char B_8E1A;
extern char B_94A6;
extern char B_94A7;
extern char B_981C;
extern char B_9D34;
extern char B_9D35;
extern char B_9D36;
extern unsigned char B_9F92;
extern char B_A04C;
extern char B_A61D;
extern char B_B23B;
extern char B_B23E;
extern char B_B23F;
extern char B_B240;
extern char B_B241;
extern char B_B242;
extern char B_B243;
extern char B_B244;
extern char B_B245;
extern char STR_1B79[];
extern char STR_1B81[];
extern char STR_1B8A[];
extern char STR_1BAA[];
extern char STR_1BB5[];
extern char STR_1BBD[];
extern char STR_1BC5[];
extern char STR_1BCB[];
extern char STR_1BD6[];
extern char STR_1BE1[];
extern char STR_1C0A[];
extern char STR_1C28[];
extern int TBL_0B9E[];
extern int TBL_0BA8[];
extern char TBL_94E8[];
extern char TBL_954C[];
extern char TBL_9678[];
extern long TBL_9D3A[];
extern int TBL_9D3E[];
extern int W_535F;
extern int W_5361;
extern char W_53BB;
extern char W_7E55;
extern long W_94C0;
extern long W_94C4;
extern int W_94D0;
extern int W_94D2;
extern int W_94D6;
extern int W_94D8;
extern long W_9B9A;
extern int W_9D38;
extern int W_B23C;
extern char W_B246;
extern char W_B248;
long far_d6f51();
long far_d7ae2();

far_c22a2()
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;
	int v12;
	char z0[16];
	char v29;
	char v30;

	v12 = far_c3513();
	far_c34be();
	B_54F7 = B_53DB;
	far_d936c(STR_1B79, &v12, 2, 1, 99, 0);
	far_d90a6(0x180f, A_B218, 16);
	v6 = (B_4C1F + 1) * B_4C1E;
	W_535F = far_d3a45(W_5361, B_4C1E, B_4C1F);
	far_d936c(STR_1B81, &W_535F, 5, TBL_0B9E[v6], TBL_0BA8[v6], 4);
	far_d916d(0x1818, &B_4C1E, 0xb6a, 3);
	far_d8827(2, 0);
	far_d96fe(2, 5);
	B_B23B = B_94A7 & 1;
	W_B23C = W_94D8;
	far_d916d(STR_1B8A, &B_B23B, 0x17f8, 6);
	far_d936c(0x1839, &W_B23C, 3, 1, 999, 0);
	far_d8827(3, 0);
	far_da730(STR_1BAA);
	far_d8827(4, 0);
	v30 = B_A04C;
	far_d936c(STR_1BB5, &v30, 2, 1, 99, 8);
	far_d90a6(0x184b, A_8E52, 16);
	far_d936c(STR_1BBD, &B_B23E, 2, 1, 16, 8);
	far_d916d(0x1852, &B_B240, 0xbb2, 1);
	far_c3404(B_B240, B_B23E, A_B229);
	far_d90a6(0x1853, A_B229, 8);
	far_d8827(5, 0);
	far_d936c(STR_1BC5, &W_B246, 3, 1, 200, 0);
	far_d936c(STR_1BCB, &W_B248, 3, 0, 128, 0);
	far_d936c(STR_1BD6, &B_B23F, 2, 0, 16, 8);
	far_d916d(0x186e, &B_B241, 0xbb2, 1);
	far_c3404(B_B241, B_B23F, A_B232);
	far_d90a6(0x186f, A_B232, 8);
	far_c30b6();
	far_d885c(STR_1BE1);
	far_c3308();
	far_c3342();
	far_c337a();
	far_c33b2();
	far_d86a8();
	v10 = B_94A6;
	v4 = 0;
	while (v4 == 0) {
		if (B_94A6 != v10 && B_7E11 == 0) {
			far_d55e8(&B_981C);
			far_d4c91();
			v10 = B_94A6;
		}
		for (; ; ) {
			if ((v2 = far_d981a(4)) != 0)
				break;
			switch (B_A61D) {
			case 0:
				if (B_8CD3 != 0) {
					far_d8850();
					far_de533(-40);
					far_d8856();
					v12 = B_8CD4;
					far_da14f(0);
					break;
				}
				if (B_7E10 == 0)
					;
				else {
					if (B_9D34 == v12)
						B_9D35 = 0;
					else if (B_94A6 == 1 && far_d602b(v12) == 0) {
						B_9D35 = 0;
						far_da993(W_9B9A + 28L, &W_7E55, far_daa7a(), 4);
						B_9D35 = v12;
					}
					v12 = B_9D34;
					far_da14f(0);
					far_c34be();
					B_5507 = 0;
					break;
				}
				if (B_8CC9 != 0) {
					far_d656b();
					--B_8CCB;
				}
				B_9D35 = 0;
				far_d6a82(&B_94A6, v12, 1);
				far_d4c91();
				v30 = B_A04C;
				far_c3561(&v12);
				far_d78a2();
				B_8CDB |= 64;
				B_8CDA |= -128;
				break;
			case 1:
				if (B_94A6 < 0) {
					far_d6668(0, -1, &v29);
					if (strcmp(A_B218, &v29) != 0) {
						far_d5bcd(v12);
						B_A04C = v30;
						B_9D36 = TBL_94E8[B_A04C];
						far_de758(0);
						far_d78a2();
					}
				}
				far_d700c(B_9D34, -1, A_B218);
				far_d4855(B_9D34, 1);
				break;
			case 2:
				if (B_94A6 < 0 && far_d5bcd(v12) == 0) {
					far_d67e8(A_B218, B_9D34);
					B_A04C = v30;
					B_9D36 = TBL_94E8[B_A04C];
					far_da14f(1);
				}
				far_c3056();
				break;
			case 3:
				v6 = (B_4C1F + 1) * B_4C1E;
				far_da2b0(2, TBL_0B9E[v6], TBL_0BA8[v6]);
				far_de758(0);
				break;
			case 5:
				if (B_7E10 != 0) {
					far_c33b2();
					break;
				}
				if (B_94A6 == -1) {
					far_d5bcd(B_9D34);
					B_A04C = v30;
					B_9D36 = TBL_94E8[B_A04C];
					W_B23C = W_94D8;
					far_d67e8(A_B218, B_9D34);
					far_da14f(1);
					far_de758(0);
				}
				B_94A7 = B_94A7 & -2 | B_B23B;
				far_d4855(B_9D34, 1);
				far_c33b2();
				break;
			case 6:
				if (B_7E10 != 0 || B_B23B == 0) {
					far_c33b2();
					break;
				}
				if (B_94A6 == -1) {
					far_d5bcd(B_9D34);
					B_A04C = v30;
					B_9D36 = TBL_94E8[B_A04C];
					far_d67e8(A_B218, B_9D34);
					far_da14f(1);
					far_de758(0);
				}
				far_d6a82(&B_94A6, B_9D34, 0);
				if (W_B23C > W_94D6) {
					W_B23C = W_94D6;
					far_c33b2();
				}
				W_94D8 = W_B23C;
				if ((B_94A7 & 2) != 0) {
					W_94C0 = far_d6f51(0, W_94D8);
					W_94C4 = far_d7ae2(&B_94A6, W_94D8);
				}
				else
					far_d7241(&B_94A6);
				W_9D38 = 0x1000;
				if (B_9F92 != 0) {
					v8 = 0;
					for (; v8 < B_9F92; ) {
						if ((unsigned)W_94C4 < *(long *)((char *)TBL_9D3A + v8 * 6))
							break;
						++v8;
					}
					if (v8 != 0)
						W_9D38 = TBL_9D3E[(v8 - 1 << 1) + (v8 - 1)];
				}
				far_d447f(W_94D0, W_94D2, &W_53BB);
				far_d4855(B_9D34, 1);
				break;
			case 7:
				if (B_8CC9 != 0) {
					far_d656b();
					--B_8CCB;
				}
				B_A04C = v30;
				if (TBL_94E8[B_A04C] == -1)
					far_d62e8(&B_94A6);
				B_9D36 = TBL_94E8[B_A04C];
				far_d6668(B_9D34, B_9D36, A_8E52);
				far_da14f(8);
				far_c3308();
				far_c316d();
				far_da14f(12);
				far_da14f(13);
				far_c30f2();
				far_d6e23();
				break;
			case 8:
				if (B_7E10 != 0) {
					far_d700c(B_9D34, B_9D36, A_8E52);
					far_d6668(B_9D34, B_9D36, A_8E52);
					far_da14f(8);
					break;
				}
				far_d6836(B_9D34, B_9D36, A_8E52);
				far_d6668(B_9D34, -1, A_B218);
				far_da14f(1);
				far_de758(0);
				far_c34be();
				break;
			case 12:
			case 13:
				if (B_94A6 < 0 && far_d5bcd(v12) == 0) {
					far_d67e8(A_B218, B_9D34);
					B_A04C = v30;
					B_9D36 = TBL_94E8[B_A04C];
					far_da14f(1);
					far_de758(0);
				}
				if ((TBL_954C[B_9D36] & 2) == 0 && B_7E10 == 0) {
					TBL_954C[B_9D36] |= 2;
					far_d679a(A_8E52, B_A04C);
					far_d6836(B_9D34, B_9D36, A_8E52);
					far_da14f(8);
				}
				if (TBL_94E8[B_A04C] == -1)
					far_d62e8(&B_94A6);
				TBL_9678[B_9D36] = W_B246;
				if (B_A61D == 13) {
					far_d6d6c(B_9D36, W_B248);
					W_B248 = far_d6d6c(B_9D36, -1);
					far_da14f(13);
					if (W_B248 != 0) {
						if ((TBL_954C[B_9D36] & 1) == 0) {
							B_8D8C = W_B248 - 1;
							B_8CDB |= 16;
							B_8CDA |= -128;
						}
					}
				}
				far_d4855(B_9D34, 1);
				break;
			case 9:
			case 10:
			case 14:
			case 15:
				if (B_7E10 == 0) {
					if (B_8CD3 == 0) {
						if (far_d6a82(&B_94A6, v12, 0) == -1) {
							if (far_d5bcd(v12) == 0) {
								B_A04C = v30;
								B_9D36 = TBL_94E8[B_A04C];
								far_d67e8(A_B218, B_9D34);
								far_d78a2();
							}
						}
						far_da14f(1);
					}
					if ((TBL_954C[B_9D36] & 2) == 0) {
						TBL_954C[B_9D36] |= 2;
						far_d679a(A_8E52, B_A04C);
						far_d6836(B_9D34, B_9D36, A_8E52);
						far_da14f(8);
					}
					far_c34be();
					far_c321a();
					far_c30f2();
					far_de758(0);
				}
				else {
					B_B23E = B_B242;
					B_B23F = B_B243;
					B_B240 = B_B244;
					B_B241 = B_B245;
					far_da14f(9);
					far_da14f(10);
					far_da14f(14);
					far_da14f(15);
				}
				far_d4855(B_9D34, 1);
				break;
			case 11:
				far_c3470(B_B240, B_B23E, A_B229);
				far_c30f2();
				break;
			case 16:
				far_c3470(B_B241, B_B23F, A_B232);
				far_c30f2();
				break;
			}
		}
		switch (v2) {
		case 120:
			far_c32c2(far_c32a7() == 0);
			far_c3308();
			far_d6e23();
			far_d4855(B_9D34, 1);
			break;
		case 121:
			B_4C32 = B_4C32 == 0;
			far_c3342();
			break;
		case 122:
			B_4C20 = B_4C20 == 0;
			far_c337a();
			far_d7a0d();
			far_d447f(W_94D0, W_94D2, &W_53BB);
			far_de758(0);
			break;
		case 117:
			B_53DC = 1;
			far_d7983();
			v2 = far_e1768();
			v4 = 1;
			break;
		case 109:
			if (B_8CD3 != 0)
				break;
			if (B_7E10 != 0)
				break;
			v12 = B_5508;
			if (v12 < 1)
				v12 = 1;
			if (v12 > 99)
				v12 = 99;
			far_d6a82(&B_94A6, v12, 1);
			far_d78a2();
			B_8E1A = 0;
		case 80:
			if (B_8E1A != 0) {
				v12 = B_8E1A;
				far_d6a82(&B_94A6, v12, 1);
				far_d78a2();
				B_8E1A = 0;
			}
			B_9D35 = 0;
			v30 = B_A04C;
			far_c3561(&v12);
			break;
		case 77:
			break;
		case 87:
			if (B_8CD3 == 0) {
				if (far_d6a82(&B_94A6, v12, 0) == -1) {
					if (far_d5bcd(v12) == 0) {
						B_A04C = v30;
						B_9D36 = TBL_94E8[B_A04C];
						far_d679a(A_8E52, B_A04C);
						far_d67e8(A_B218, B_9D34);
						far_d6836(B_9D34, B_9D36, A_8E52);
						far_da14f(8);
						far_da14f(1);
					}
				}
				if (B_7E11 == 0) {
					far_d55e8(&B_981C);
					far_d4c91();
					v10 = B_94A6;
				}
			}
			far_c33b2();
			far_d3eb6();
			B_5507 = 0;
			far_c34be();
			far_de758(0);
			break;
		case 69:
			if ((B_7E10 & 20) != 0) {
				far_d8827(0, 0);
				far_da730(STR_1C0A);
			}
			if (B_7E10 == 0)
				v4 = 1;
			break;
		case 82:
			if ((B_7E10 & 21) != 0) {
				far_d8827(0, 0);
				far_da730(STR_1C28);
			}
			if (B_7E10 == 0)
				v4 = 1;
			break;
		case 101:
		case 114:
			far_c34be();
			break;
		default:
			v4 = 1;
			break;
		}
	}
	return v2;
}
