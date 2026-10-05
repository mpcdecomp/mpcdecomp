extern char A_212E[];
extern char B_515E;
extern char B_5160;
extern char B_5161;
extern char B_5162;
extern char B_53DB;
extern char B_8FD3_V112;
extern char B_A61D;
extern char STR_2223[];
extern char STR_222A[];
extern char STR_2238[];
extern char TBL_1023[];
extern int W_A051;

L_c5101()
{
	char z0;
	int v3;
	char z1[4];

	L_de62c(0x1dfd);
	far_d936c(0x1e03, &B_515E, 2, 0, 14, 8);
	far_d916d(0x1e12, &B_5160, 0x1cd2, 10);
	far_d8827(2, 0);
	far_d916d(STR_2223, &B_5161, A_212E, 13);
	far_d916d(STR_222A, &B_5162, A_212E, 13);
	far_d8827(4, 0);
	far_d88e6(STR_2238, far_d62a9());
	far_d8827(7, 0);
	far_d885c(0x1e46);
	v3 = 0;
	while (v3 == 0) {
		for (; ; ) {
			if ((v3 = far_d981a(4)) != 0)
				break;
			switch (B_A61D) {
			case 1:
				W_A051 = TBL_1023[B_5160];
				break;
			}
		}
		switch (v3) {
		case 120:
			far_d7983();
			if (B_8FD3_V112 != 0) {
				far_de533(-40);
				v3 = B_53DB;
				break;
			}
			v3 = far_c5cfc();
			break;
		case 121:
		case 122:
			v3 = 0;
			break;
		case 117:
			v3 = L_c52e5();
			break;
		}
	}
	return v3;
}
