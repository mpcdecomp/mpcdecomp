/* differs: +1e jmp $8 | jmp L_c9e7c */
extern char B_8FCB_V112;
extern char B_A61D;
extern char B_BAE9_V112;
extern char B_BAEA_V112;
extern char TBL_0BC4[];
extern char TBL_5CD2_V112[];
extern char TBL_5CF2_V112[];
extern char TBL_5D12_V112[];

L_c9e4e()
{
	int v2;
	int v4;
	int v6;
	int v8;
	char v9;
	char v10;
	char v26[16];
	register int r1;

	L_c4063(0x312b);
	far_d7983();
	v4 = 0;
	for (; (unsigned)v4 < 16; ) {
		r1 = v4;
		v26[r1] = TBL_5CF2_V112[v4];
		++v4;
	}
	far_d8827(1, 0);
	far_d885c(0x314b);
	far_d8827(2, 0);
	far_d885c(0x3172);
	v4 = 0;
	v6 = 1;
	do {
		v8 = 3;
		do {
			far_d8827(v6, v8);
			v4++;
			far_d936c(0x3199, v4++ + v26, 1, 1, 4, 8);
			v8 += 5;
		} while (v8 <= 38);
		++v6;
	} while (v6 <= 2);
	far_d8827(3, 0);
	L_de62c(0x319a);
	far_d8827(4, 0);
	far_d916d(0x31ba, 0x5b1f, 0xb16, 3);
	far_d8827(5, 0);
	far_d936c(0x31d5, -0x4517, 3, 0, 127, 8);
	v9 = TBL_5D12_V112[B_BAE9_V112];
	far_d916d(0x31e5, &v9, 0xc66, 4);
	far_d8827(6, 0);
	L_de62c(0x31f0);
	far_d916d(0x3210, -0x4516, TBL_0BC4, 4);
	v10 = TBL_5CD2_V112[B_BAEA_V112];
	far_d936c(0x321f, &v10, 3, 0, 127, 8);
	for (; ; ) {
		if ((v2 = far_d981a(0)) != 0)
			break;
		switch (B_A61D) {
		case 17:
			v9 = TBL_5D12_V112[B_BAE9_V112];
			far_da14f(18);
			break;
		case 18:
			far_d656b();
			TBL_5D12_V112[B_BAE9_V112] = v9;
			--B_8FCB_V112;
			break;
		case 19:
			v10 = TBL_5CD2_V112[B_BAEA_V112];
			far_da14f(20);
			break;
		case 20:
			far_d656b();
			TBL_5CD2_V112[B_BAEA_V112] = v10;
			--B_8FCB_V112;
			break;
		default:
			far_d656b();
			r1 = B_A61D;
			TBL_5CF2_V112[B_A61D] = v26[r1];
			--B_8FCB_V112;
			break;
		}
	}
	return v2;
}
