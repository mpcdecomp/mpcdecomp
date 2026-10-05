/* differs: +34f bne $11 | jmp br_e4aa4 */
extern char B_4C1F;
extern char B_4C20;
extern char B_4C2E;
extern char B_53DB;
extern char B_54F7;
extern char B_5508;
extern unsigned char B_7E06;
extern char B_94A6;
extern unsigned char B_A06A;
extern unsigned char B_A06B;
extern char B_A06C;
extern char B_A06E;
extern char B_A61D;
extern char B_BE83;
extern char B_BE84;
extern char B_BE85;
extern char B_BE86;
extern char STR_41F8[];
extern char STR_4202[];
extern char STR_420A[];
extern char STR_4211[];
extern char STR_4215[];
extern char STR_4234[];
extern char STR_4250[];
extern char STR_425B[];
extern char STR_4263[];
extern char STR_4271[];
extern char STR_429A[];
extern char TBL_41F4[];
extern unsigned char TBL_5516[];
extern unsigned char TBL_5517[];
extern char TBL_5709[];
extern char TBL_7C26[];
extern unsigned char TBL_7C3A[];
extern char TBL_BE82[];

far_e3e65()
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;
	int v12;
	int v14;
	int v16;
	int v18;
	int v20;
	int v22;
	int v24;
	int v26;
	char v27;
	char v28;
	char z0[16];
	char v45;
	char z1[16];
	char v62;

	far_da730(STR_41F8);
	B_54F7 = B_53DB;
	v26 = B_4C2E;
	if (B_4C20 == 0)
		B_4C2E = 0;
	if (B_A06E == 0)
		far_ecf22(B_A06A);
	B_7E06 = B_A06B + 1;
	v20 = B_A06A;
	far_d936c(STR_4202, &v20, 2, 1, 20, 0);
	far_ece25(v20 - 1, &v62);
	far_d90a6(0x3e8c, &v62, 16);
	v8 = B_A06A - 1;
	v27 = TBL_7C26[v8];
	far_d8827(1, 25);
	far_d916d(STR_420A, &v27, 0x3e66, 7);
	if ((v12 = TBL_7C3A[v8]) <= 0)
		v12 = TBL_7C3A[v8] = 1;
	far_d936c(0x3e94, &v12, 3, 1, 250, 0);
	if (v27 == 0) {
		far_d8827(1, 37);
		far_d885c(STR_4211);
	}
	far_e4bc1(v8);
	far_d8827(2, 0);
	far_d936c(STR_4215, &B_BE86, 2, 0, 99, 10);
	far_d936c(0x3eb0, &B_BE85, 2, 0, 59, 10);
	far_d936c(0x3eb2, &B_BE84, 2, 0, 59, 10);
	far_d936c(0x3eb4, &B_BE83, 2, 0, 29, 10);
	far_d936c(0x3eb6, TBL_BE82, 2, 0, 99, 10);
	far_d8827(3, 0);
	far_d936c(STR_4234, &B_7E06, 3, 1, 250, 8);
	far_d885c(STR_4250);
	v10 = TBL_5516[(B_7E06 - 1 << 1) + v8 * 500];
	if (v10 == 0)
		TBL_5516[(B_7E06 - 1 << 1) + v8 * 500] = v10 = 1;
	far_d8827(4, 0);
	v18 = TBL_5517[(B_7E06 - 1 << 1) + v8 * 500];
	far_d936c(STR_425B, &v10, 2, 1, 99, 0);
	far_e4b91(v10, v18, &v45);
	far_d90a6(0x3ee5, &v45, 16);
	far_d88b2(25);
	far_d936c(STR_4263, &v18, 2, 0, 99, 0);
	far_e4ab1(v10, v18);
	far_c30b6();
	far_d885c(STR_4271);
	v4 = 0;
	while (v4 == 0) {
		v2 = far_d981a(4);
		v24 = 0;
		switch (v2) {
		case 71:
			continue;
		case 80:
			if (B_A06B + 1 != B_7E06) {
				B_7E06 = B_A06B + 1;
				v10 = TBL_5516[(B_7E06 - 1 << 1) + v8 * 500];
				v18 = TBL_5517[(B_7E06 - 1 << 1) + v8 * 500];
				far_e4b91(v10, v18, &v45);
				far_ece25(v8, &v62);
				far_e4bc1(v8);
				far_da14f(1);
				far_da14f(4);
				far_da14f(5);
				far_da14f(6);
				far_da14f(7);
				far_da14f(8);
				far_da14f(9);
				far_da14f(10);
				far_da14f(11);
				far_da14f(12);
				far_e4ab1(v10, v18);
			}
			continue;
		}
		v14 = B_A61D;
		v16 = far_e4b4f(v8);
		switch (v2) {
		case 120:
			far_d7939();
			if (TBL_7C3A[v8] >= B_7E06)
				TBL_7C3A[v8]++;
			v22 = B_7E06 - 1;
			v6 = 248;
			for (; v6 >= v22; ) {
				TBL_5516[v8 * 500 + (v6 + 1 << 1)] = TBL_5516[v8 * 500 + (v6 << 1)];
				TBL_5517[v8 * 500 + (v6 + 1 << 1)] = TBL_5517[v8 * 500 + (v6 << 1)];
				--v6;
			}
			v2 = 0;
			v14 = 13;
			B_A06C = 0;
			break;
		case 121:
			far_d7939();
			if (TBL_7C3A[v8] > B_7E06)
				TBL_7C3A[v8]--;
			v6 = B_7E06 - 1;
			for (; v6 < v16 - 1; ) {
				TBL_5516[v8 * 500 + (v6 << 1)] = TBL_5516[v8 * 500 + (v6 + 1 << 1)];
				TBL_5517[v8 * 500 + (v6 << 1)] = TBL_5517[v8 * 500 + (v6 + 1 << 1)];
				++v6;
			}
			v2 = 0;
			v14 = 13;
			B_A06C = 0;
			break;
		case 117:
		case 122:
			if (v2 == 117)
				++B_7E06;
			else if (B_7E06 > 1)
				--B_7E06;
			v2 = 0;
			v14 = 9;
			break;
		case 109:
			v20 = B_5508;
			if (v20 < 1)
				v20 = 1;
			if (v20 > 20)
				v20 = 20;
			v2 = 0;
			v14 = 0;
			break;
		}
		if (v2 != 0)
			break;
		far_d7939();
		far_d8719();
		switch (v14) {
		case 0:
			B_7E06 = 1;
			break;
		case 1:
			far_ece81(v8, &v62);
			v28 = far_ece25(v8, &v62);
			far_da14f(1);
			if (v28 == 0) {
				TBL_5517[v8 * 500] = 1;
				TBL_5516[(B_7E06 - 1 << 1) + v8 * 500] = v10;
				v18 = TBL_5517[(B_7E06 - 1 << 1) + v8 * 500];
				far_e4b91(v10, v18, &v45);
				far_ece25(v8, &v62);
				far_e4cd2();
				B_A06C = 0;
				far_da14f(1);
				far_da14f(11);
				far_da14f(12);
				far_e4c59(v10);
				far_e4ab1(v10, v18);
				far_de758(0);
			}
			break;
		case 3:
			B_A06C = 0;
			break;
		case 9:
			far_d7241(&B_94A6);
			v24 = far_d6fda(B_7E06 - 1);
			break;
		case 10:
			far_e4cd2();
			B_A06C = 0;
			TBL_5516[(B_7E06 - 1 << 1) + v8 * 500] = v10;
			far_e4b91(v10, v18, &v45);
		case 12:
			far_e4c59(v10);
			far_e4ab1(v10, v18);
			far_de758(0);
			break;
		case 7:
			if ((unsigned)B_BE83 > TBL_41F4[B_4C1F]) {
				B_BE83 = TBL_41F4[B_4C1F];
				far_da14f(7);
			}
		case 4:
		case 5:
		case 6:
		case 8:
			far_e4bf8(v8);
			break;
		case 11:
			if (v18 != 0)
				far_d700c(v10, -1, &v45);
			far_e4b91(v10, v18, &v45);
			far_da14f(11);
			break;
		}
		switch (v14) {
		case 10:
			if (v18 != 0)
				break;
			v18 = 1;
		case 12:
			far_e4cd2();
			B_A06C = 0;
			TBL_5517[(B_7E06 - 1 << 1) + v8 * 500] = v18;
			if (v18 == 0 && B_7E06 == 1) {
				setmem(TBL_BE82, 5, 0);
				far_e4bf8(v8);
			}
		case 0:
		case 9:
		case 13:
			v8 = v20 - 1;
			far_ece25(v8, &v62);
			far_e4bc1(v8);
			v16 = far_e4b4f(v8);
			if (B_7E06 > v16)
				B_7E06 = v16;
			far_da14f(9);
			far_da14f(4);
			far_da14f(5);
			far_da14f(6);
			far_da14f(7);
			far_da14f(8);
			far_da14f(0);
			far_da14f(1);
			v10 = TBL_5516[(B_7E06 - 1 << 1) + v8 * 500];
			if (v10 == 0)
				TBL_5516[(B_7E06 - 1 << 1) + v8 * 500] = v10 = 1;
			TBL_5709[v8 * 500] = 0;
			v18 = TBL_5517[(B_7E06 - 1 << 1) + v8 * 500];
			far_da14f(10);
			far_da14f(12);
			far_e4b91(v10, v18, &v45);
			far_da14f(11);
			v27 = TBL_7C26[v8];
			far_da14f(2);
			v12 = TBL_7C3A[v8];
		case 2:
			TBL_7C26[v8] = v27;
		case 3:
			if (v12 >= v16)
				v12 = v16 - 1;
			if (v12 < 1)
				v12 = 1;
			TBL_7C3A[v8] = v12;
			if (v27 == 0) {
				far_d8827(1, 37);
				far_d885c(STR_429A);
			}
			else
				far_da14f(3);
			if (v14 != 0 && v14 != 3)
				far_d4a9b(1);
			if (B_A06A != v20)
				far_ecf22(v20);
			if (v24 != 0)
				far_e8cd3(&B_94A6, v24);
			far_d78a2();
			far_e4ab1(v10, v18);
			far_de758(0);
			break;
		}
	}
	B_4C2E = v26;
	return v2;
}
