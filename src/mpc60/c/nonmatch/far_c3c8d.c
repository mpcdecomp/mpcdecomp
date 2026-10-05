/* differs: +85 mov al, byte ptr B_B24B_ | push ax */
extern char B_5018;
extern char B_501A;
extern char B_501B;
extern char B_501C;
extern char B_54F8;
extern char B_8CCB;
extern char B_A61D;
extern char B_B24B;
extern char B_B24C;
extern char STR_1E9F[];
extern char STR_1EBE[];
extern char STR_1ED9[];
extern char STR_1EE3[];
extern char STR_1EEA[];
extern char STR_1F09[];
extern char STR_1F22[];
extern char STR_1F28[];
extern char STR_1F38[];
extern char STR_1F3E[];
extern char TBL_0BC4[];
extern char TBL_501E[];
extern char TBL_509E[];
extern char TBL_954C[];
extern char TBL_98C2[];
extern char W_0022;

far_c3c8d()
{
	int v2;
	int v4;
	int v6;
	char v7;
	char v8;

	far_c1f4e(STR_1E9F);
	far_d7983();
	far_d8827(1, 0);
	far_d916d(STR_1EBE, &B_501A, 0xb44, 3);
	far_d8827(2, 0);
	far_d936c(STR_1ED9, &B_B24B, 3, 0, 127, 8);
	far_d885c(0x1b6f);
	far_da4bd(B_B24B);
	far_d885c(far_da4bd(B_B24B));
	far_d885c(0x1b71);
	far_d88b2(19);
	v7 = TBL_501E[B_B24B];
	far_d916d(STR_1EE3, &v7, 0xca6, 9);
	far_d8827(3, 0);
	far_da730(STR_1EEA);
	far_d8827(4, 0);
	far_d916d(STR_1F09, &B_501B, 0x19cc, 14);
	far_d8827(5, 0);
	far_d916d(STR_1F22, &B_B24C, TBL_0BC4, 4);
	far_d88b2(19);
	v8 = TBL_509E[B_B24C];
	far_d936c(STR_1F28, &v8, 3, 0, 127, 8);
	far_d885c(0x1bc4);
	far_da4bd(v8);
	far_d885c(far_da4bd(v8));
	far_d885c(0x1bc6);
	far_d8827(6, 0);
	far_da730(STR_1F38);
	far_d8827(7, 0);
	v4 = B_501C + 1;
	far_d936c(STR_1F3E, &v4, 2, 1, 16, 0);
	v2 = 0;
	while (v2 == 0) {
		for (; ; ) {
			if ((v2 = far_d981a(64)) != 0)
				break;
			switch (B_A61D) {
			case 1:
				v7 = TBL_501E[B_B24B];
				far_d8827(2, 9);
				far_da4bd(B_B24B);
				far_d885c(far_da4bd(B_B24B));
				far_da14f(2);
				break;
			case 2:
				far_d656b();
				TBL_501E[B_B24B] = v7;
				far_d8827(2, 9);
				far_da4bd(B_B24B);
				far_d885c(far_da4bd(B_B24B));
				far_da14f(2);
				--B_8CCB;
				break;
			case 4:
				v8 = TBL_509E[B_B24C];
				far_d8827(5, &W_0022);
				far_da4bd(v8);
				far_d885c(far_da4bd(v8));
				far_da14f(4);
				far_da14f(5);
				break;
			case 5:
				far_d656b();
				TBL_509E[B_B24C] = v8;
				far_d8827(5, &W_0022);
				far_da4bd(v8);
				far_d885c(far_da4bd(v8));
				far_da14f(4);
				far_da14f(5);
				--B_8CCB;
				break;
			case 6:
				far_d656b();
				B_501C = v4 - 1;
				far_c49ac((B_5018 & 15) + 1, B_5018 >> 4);
				v6 = 0;
				do {
					if (far_d65f7(v6) != 0) {
						TBL_954C[v6] |= 4;
						TBL_98C2[v6] |= 4;
					}
					else {
						TBL_954C[v6] &= -5;
						TBL_98C2[v6] &= -5;
					}
					v6++;
				} while (v6 < 100);
				--B_8CCB;
				break;
			}
		}
		switch (v2) {
		case 78:
		default:
			if (B_A61D == 1 || B_A61D == 2) {
				B_B24B = B_54F8;
				v7 = TBL_501E[B_B24B];
				far_d8827(2, 9);
				far_da4bd(B_B24B);
				far_d885c(far_da4bd(B_B24B));
				far_da14f(1);
				far_da14f(2);
			}
			if (B_A61D == 5 || B_A61D == 4) {
				far_d656b();
				v8 = B_54F8;
				TBL_509E[B_B24C] = v8;
				far_d8827(5, &W_0022);
				far_da4bd(v8);
				far_d885c(far_da4bd(v8));
				far_da14f(5);
				--B_8CCB;
			}
		case 68:
			v2 = 0;
			break;
		}
	}
	return v2;
}
