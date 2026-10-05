/* differs: +17c sar al,cl | cbw */
extern char B_5014;
extern char B_5015;
extern char B_5016;
extern char B_5018;
extern char B_5019;
extern char B_8CDA;
extern char B_94A6;
extern char B_A61D;
extern unsigned char B_B24A;
extern char STR_1DED[];
extern char STR_1DFF[];
extern char STR_1E06[];
extern char STR_1E14[];
extern char STR_1E33[];
extern char STR_1E3E[];
extern char STR_1E4E[];
extern char STR_1E5D[];
extern char STR_1E7F[];
extern char TBL_4E82[];
extern char TBL_4F0B[];

far_c392c()
{
	int v2;
	int v4;
	int v6;
	char v7;
	char v8;
	char v9;

	far_c1f4e(STR_1DED);
	far_d7983();
	far_d8827(1, 0);
	far_d885c(STR_1DFF);
	far_d956b(&B_B24A);
	far_d8827(2, 0);
	v7 = TBL_4E82[B_B24A];
	v8 = TBL_4F0B[B_B24A];
	far_d916d(STR_1E06, &v7, 0xb36, 3);
	far_d88b2(36);
	far_d936c(0x1aa3, &v8, 3, 0, 127, 8);
	far_d8827(3, 0);
	far_d916d(STR_1E14, &B_5014, 0x19b8, 6);
	far_d88b2(21);
	far_d936c(0x1ab3, &B_5015, 3, 1, 127, 8);
	far_d8827(4, 0);
	far_da730(STR_1E33);
	far_d8827(5, 0);
	far_d916d(STR_1E3E, &B_5016, 0xb44, 3);
	far_d88b2(21);
	v6 = (B_5018 & 15) + 1;
	far_d936c(STR_1E4E, &v6, 2, 1, 16, 0);
	v9 = B_5018 >> 4;
	far_d916d(0x1aec, &v9, 0xbb2, 1);
	far_d8827(6, 0);
	far_d916d(STR_1E5D, &B_5019, 0xb44, 3);
	far_d8827(7, 0);
	far_d885c(STR_1E7F);
	far_c3c2a(B_B24A, v8);
	v4 = 0;
	v2 = 0;
	while (v2 == 0) {
		for (; ; ) {
			if ((v2 = far_d981a(1)) != 0)
				break;
			switch (B_A61D) {
			case 0:
				v7 = TBL_4E82[B_B24A];
				far_da14f(1);
				v8 = TBL_4F0B[B_B24A];
				far_c3c2a(B_B24A, v8);
				break;
			case 1:
				TBL_4E82[B_B24A] = v7;
				break;
			case 2:
				TBL_4F0B[B_B24A] = far_c3c2a(B_B24A, v8);
				break;
			case 6:
			case 7:
				far_c49ac(v6, v9);
				v4 = 1;
				break;
			}
		}
		switch (v2) {
		case 120:
			B_8CDA |= 16;
			v2 = 0;
			break;
		}
	}
	if (v4 != 0) {
		far_d7156();
		far_d55e8(&B_94A6);
		far_d7185();
	}
	return v2;
}
