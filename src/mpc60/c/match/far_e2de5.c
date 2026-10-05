extern char B_53DB;
extern char B_54FE;
extern char B_54FF;
extern char B_5500;
extern unsigned char B_A06A;
extern char STR_3E36[];
extern char STR_3E4F[];
extern char STR_3E5D[];
extern char STR_3E6C[];
extern char STR_3E8A[];
extern char STR_3EB0[];
extern char STR_3EBA[];
extern char STR_3ECE[];
extern char STR_3ED3[];
extern char STR_3EE1[];

far_e2de5()
{
	int v2;
	int v4;
	int v6;
	int v8;

	v4 = B_A06A;
	v6 = far_d77d7();
	far_c1f4e(STR_3E36);
	far_d8827(2, 2);
	far_d936c(STR_3E4F, &v4, 2, 1, 99, 8);
	far_d88b2(22);
	far_d936c(STR_3E5D, &v6, 2, 1, 99, 8);
	far_d8827(4, 0);
	far_d885c(STR_3E6C);
	far_d8827(5, 0);
	far_d885c(STR_3E8A);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_3EB0);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
	}
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(STR_3EBA);
		if ((v8 = far_ec957(v4 - 1, v6)) != 0) {
			if (v8 == -10) {
				far_d8810(0);
				far_de639(102, 3, 32);
				far_d8827(4, 6);
				far_d88e6(STR_3ECE, B_5500);
				far_d8827(5, 0);
				far_d88e6(STR_3ED3, B_54FE, B_54FF);
				far_d8827(7, 0);
				far_d885c(STR_3EE1);
				far_de723();
				far_d8810(3);
			}
			else
				far_de533(v8);
		}
		v2 = B_53DB;
	}
	return v2;
}
