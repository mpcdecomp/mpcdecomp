extern char B_5320;
extern char B_5321;
extern char B_53DB;
extern char B_94A6[];
extern char B_9D34;
extern char B_A61D;
extern char STR_3B87[];
extern char STR_3B99[];
extern char STR_3BA9[];
extern char STR_3BBC[];
extern char STR_3BCF[];
extern char STR_3BD9[];
extern int W_52B6;
extern int W_94D6;

far_e2197()
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

	v8 = v10 = 1;
	if (W_94D6 >= 999)
		v8 = 0;
	far_c1f4e(STR_3B87);
	far_d8827(2, 0);
	far_d936c(STR_3B99, &v8, 3, 0, 999, 0);
	v6 = B_5320;
	far_d936c(STR_3BA9, &v6, 2, 1, 31, 8);
	v4 = B_5321;
	far_d916d(0x3bba, &v4, 0xf7f, 2);
	far_d8827(3, 0);
	far_d936c(STR_3BBC, &v10, 3, 1, 999, 0);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_3BCF);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
		switch (B_A61D) {
		case 0:
			if (v8 + W_94D6 > 999)
				v8 = 999 - W_94D6;
			far_da14f(0);
			break;
		case 3:
			if (v10 > W_94D6)
				v10 = W_94D6 + 1;
			far_da14f(4);
			break;
		}
	}
	if (v2 == 120) {
		if (v8 != 0) {
			far_d8827(7, 0);
			far_d885c(STR_3BD9);
			far_d6a82(B_94A6, B_9D34, 0);
			if (B_94A6[0] < 0) {
				v12 = B_5320;
				v14 = B_5321;
				v16 = W_52B6;
				B_5320 = v6;
				B_5321 = v4;
				W_52B6 = v8;
				far_d5bcd(B_9D34);
				B_5320 = v12;
				B_5321 = v14;
				W_52B6 = v16;
			}
			else if ((v18 = far_ead5e(v8, v10, v6, 4 << v4)) < 0)
				far_de533(v18);
			far_e8cd3(B_94A6, v10);
		}
		v2 = B_53DB;
	}
	return v2;
}
