/* differs: none, but two callees sit in overlapping ROM segments: no link places both */
extern char A_9F97[];
extern char B_4C1E;
extern char B_4C1F;
extern char B_4C20;
extern char B_4C21;
extern char B_4E7A;
extern char B_53AB;
extern char B_94A6;
extern char B_9D34;
extern char B_A06C;
extern char B_A61D;
extern char STR_321F[];
extern char STR_3225[];
extern char STR_323A[];
extern char STR_3244[];
extern char STR_3254[];
extern char STR_3261[];
extern char STR_326A[];
extern char STR_3281[];
extern char STR_3287[];
extern char STR_3296[];
extern int TBL_0B9E[];
extern int TBL_0BA8[];
extern long TBL_1033[];
extern int TBL_1043[];
extern int TBL_5389[];
extern char TBL_9FA7[];
extern int W_4C1C;
extern long W_5385;
extern char W_53BB;
extern int W_94D0;
extern int W_94D2;
extern int W_9FA5;

far_c9fb2()
{
	char v1;
	char v2;
	int v4;
	int v6;
	int v8;
	int v10;

	far_da730(STR_321F);
	far_d7983();
	if (B_94A6 < 0)
		far_d5bcd(B_9D34);
	far_d8827(1, 0);
	far_d916d(STR_3225, &B_4C20, 0xb52, 8);
	v8 = (B_4C1F + 1) * B_4C1E;
	far_d8827(2, 0);
	v4 = far_cb22f(W_9FA5);
	far_d936c(STR_323A, &v4, 5, TBL_0B9E[v8], TBL_0BA8[v8], 4);
	v6 = far_cb22f(W_4C1C);
	far_d936c(STR_3244, &v6, 5, TBL_0B9E[v8], TBL_0BA8[v8], 4);
	far_d8827(3, 0);
	far_da730(STR_3254);
	far_d8827(4, 0);
	far_d916d(STR_3261, &B_4C1E, 0xb6a, 3);
	far_d916d(STR_326A, &B_4C1F, 0xb78, 6);
	far_d8827(5, 0);
	far_da730(STR_3281);
	far_d8827(6, 0);
	far_d936c(STR_3287, &B_4C21, 1, 2, 4, 8);
	far_d8827(7, 0);
	far_d885c(STR_3296);
	v2 = 0;
	while (v2 == 0) {
		for (; ; ) {
			if ((v1 = far_d981a(2)) != 0)
				break;
			B_A06C = 0;
			switch (B_A61D) {
			case 0:
				far_d7a0d();
				break;
			case 1:
				W_9FA5 = far_d3a45(far_d393d(v4, B_4C1E, B_4C1F), 0, 0);
				B_A06C = 0;
				far_d7a0d();
				v4 = far_cb22f(W_9FA5);
				far_da14f(1);
				far_d4855(B_9D34, 1);
				break;
			case 2:
				W_4C1C = far_d3a45(far_d393d(v6, B_4C1E, B_4C1F), 0, 0);
				far_d7a0d();
				v6 = far_cb22f(W_4C1C);
				far_da14f(2);
				break;
			case 3:
			case 4:
				W_5385 = TBL_1033[B_4C1F];
				v10 = 0;
				do {
					TBL_5389[v10] = *(int *)((char *)TBL_1043 + (B_4C1F * 6 + (v10 << 1)));
					++v10;
				} while (v10 < 3);
				v4 = far_cb22f(W_9FA5);
				v6 = far_cb22f(W_4C1C);
				v8 = (B_4C1F + 1) * B_4C1E;
				far_da2b0(1, TBL_0B9E[v8], TBL_0BA8[v8]);
				far_da2b0(2, TBL_0B9E[v8], TBL_0BA8[v8]);
				far_da14f(1);
				far_da14f(2);
				far_d442b(TBL_9FA7, A_9F97);
				break;
			}
		}
		switch (v1) {
		case 120:
			v1 = far_ca378();
			v2 = 1;
			break;
		case 121:
			v1 = far_ca7f7();
			v2 = 1;
			break;
		default:
			v2 = 1;
			break;
		}
	}
	if (B_4E7A != 6 || B_53AB == 0)
		far_d447f(W_94D0, W_94D2, &W_53BB);
	return v1;
}
