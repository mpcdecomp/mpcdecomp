extern char B_5320;
extern char B_5321;
extern char B_53DB;
extern char B_94A6;
extern char B_9D34;
extern char B_A61D;
extern char STR_3EF1[];
extern char STR_3F03[];
extern char STR_3F25[];
extern char STR_3F36[];
extern char STR_3F5F[];
extern char STR_3F83[];
extern char STR_3FA5[];
extern char STR_3FAF[];
extern int TBL_3EE9[];
extern char TBL_96DE[];
extern char TBL_96DF[];
extern int W_8D62;
extern int W_94D6;

far_e3014()
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;
	char v11;

	v4 = 1;
	far_c1f4e(STR_3EF1);
	if (B_94A6 == -1)
		far_d5bcd(B_9D34);
	far_d8827(1, 0);
	far_d936c(STR_3F03, &v4, 3, 1, 999, 0);
	far_d8827(2, 0);
	v6 = B_5320;
	far_d936c(STR_3F25, &v6, 2, 1, 31, 8);
	v11 = B_5321;
	far_d916d(0x3f34, &v11, 0xf7f, 2);
	far_d8827(3, 0);
	far_d885c(STR_3F36);
	far_d8827(4, 0);
	far_d885c(STR_3F5F);
	far_d8827(5, 0);
	far_d885c(STR_3F83);
	far_d7241(&B_94A6);
	v10 = far_e3213(v4);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_3FA5);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
		switch (B_A61D) {
		case 0:
			if (v4 > W_94D6) {
				v4 = W_94D6;
				far_da14f(0);
			}
			v10 = far_e3213(v4);
			break;
		}
	}
	if (v2 == 120) {
		W_8D62 = v4;
		far_d8827(7, 0);
		far_d885c(STR_3FAF);
		v8 = TBL_3EE9[v11];
		far_ec53e(TBL_96DE[v10 << 2], TBL_96DF[v10 << 2], v6, v8);
		v2 = B_53DB;
	}
	return v2;
}
