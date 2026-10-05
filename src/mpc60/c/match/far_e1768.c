extern char B_53DB;
extern char B_9D34;
extern char B_9D36;
extern char B_A04C;
extern char B_A61D;
extern char STR_389E[];
extern char STR_38AA[];
extern char STR_38D0[];
extern char STR_38E5[];
extern char STR_38EF[];
extern char STR_38FF[];
extern char TBL_94E7[];
extern char TBL_94E8[];
extern char TBL_94E9[];

far_e1768()
{
	int v2;
	int v4;
	int v6;
	int v8;
	char v9;
	int v11;
	char z0[16];
	char v28;
	char z1[16];
	char v45;

	v2 = 1;
	v4 = 2;
	far_d880a();
	far_da730(STR_389E);
	far_d8827(4, 0);
	far_d885c(STR_38AA);
	far_d8827(5, 0);
	far_d885c(STR_38D0);
	far_d8827(7, 0);
	far_d885c(STR_38E5);
	far_d97f5();
	far_d8827(1, 0);
	v9 = B_9D34;
	far_d936c(STR_38EF, &v2, 2, 1, 99, 0);
	far_d6668(v9, TBL_94E8[v2], &v28);
	far_d885c(0x38fd);
	far_d885c(&v28);
	far_d8827(2, 0);
	far_d936c(STR_38FF, &v4, 2, 1, 99, 0);
	far_d6668(v9, TBL_94E8[v4], &v45);
	far_d885c(0x390d);
	far_d885c(&v45);
	v11 = 0;
	while (v11 == 0) {
		for (; ; ) {
			if ((v11 = far_d981a(1)) != 0)
				break;
			switch (B_A61D) {
			case 0:
				far_da14f(0);
				far_d6668(v9, TBL_94E8[v2], &v28);
				far_d8827(1, 16);
				far_d885c(&v28);
				break;
			case 1:
				far_da14f(1);
				far_d6668(v9, TBL_94E8[v4], &v45);
				far_d8827(2, 16);
				far_d885c(&v45);
				break;
			}
		}
		if (v11 == 80) {
			v11 = 0;
			continue;
		}
		if (v11 == 120) {
			v6 = TBL_94E8[v2];
			if (v2 < v4) {
				v8 = v2 + 1;
				for (; v8 < v4; ) {
					TBL_94E7[v8] = TBL_94E8[v8];
					v8++;
				}
				TBL_94E7[v4] = v6;
			}
			else if (v2 > v4) {
				v8 = v2 - 1;
				for (; v8 >= v4; ) {
					TBL_94E9[v8] = TBL_94E8[v8];
					v8--;
				}
				TBL_94E8[v4] = v6;
			}
			B_9D36 = TBL_94E8[B_A04C];
			far_d4855(B_9D34, 1);
			v11 = B_53DB;
		}
	}
	return v11;
}
