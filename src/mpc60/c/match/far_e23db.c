extern char B_53DB;
extern char B_94A6[];
extern char B_9D34;
extern char STR_3BEC[];
extern char STR_3BF8[];
extern char STR_3C02[];
extern char STR_3C0A[];
extern char STR_3C14[];
extern char STR_3C2A[];
extern int W_94D6;
extern int W_94DE;

far_e23db()
{
	int v2;
	int v4;
	int v6;

	v4 = W_94DE;
	v6 = v4 + 1;
	far_e544a(&v4, &v6, W_94D6);
	far_c1f4e(STR_3BEC);
	far_d8827(2, 3);
	far_d936c(STR_3BF8, &v4, 3, 1, 999, 0);
	far_d88b2(27);
	far_d936c(STR_3C02, &v6, 3, 1, 999, 0);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_3C0A);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
		far_e544a(&v4, &v6, W_94D6);
		far_da14f(0);
		far_da14f(1);
	}
	if (v2 == 120) {
		if (v6 - v4 >= W_94D6) {
			far_de639(102, 3, 31);
			v2 = far_da610(1);
			if (v2 == 120) {
				far_d8827(7, 0);
				far_d885c(STR_3C14);
				far_d55e8(B_94A6);
				far_e9d7e(B_9D34);
				v2 = B_53DB;
			}
		}
		else {
			far_d8827(7, 0);
			far_d885c(STR_3C2A);
			far_e9cab(v4, v6);
			v2 = B_53DB;
		}
	}
	return v2;
}
