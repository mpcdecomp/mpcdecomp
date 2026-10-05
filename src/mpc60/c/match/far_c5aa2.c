extern char A_212E[];
extern char B_515E;
extern char B_515F;
extern char B_5160;
extern char B_5161;
extern char B_5162;
extern char B_53DB;
extern char B_8CD3;
extern char B_A61D;
extern char STR_21EF[];
extern char STR_21F9[];
extern char STR_2201[];
extern char STR_220A[];
extern char STR_2215[];
extern char STR_2223[];
extern char STR_222A[];
extern char STR_2232[];
extern char STR_2238[];
extern char STR_2253[];
extern char TBL_1023[];
extern int W_A051;

far_c5aa2()
{
	int v2;

	far_da730(STR_21EF);
	far_d8827(1, 0);
	far_d936c(STR_21F9, &B_515E, 2, 0, 14, 8);
	far_d916d(STR_2201, &B_5160, 0x20c4, 10);
	far_d916d(STR_220A, &B_515F, 0xb36, 3);
	far_d8827(2, 0);
	far_da730(STR_2215);
	far_d8827(3, 0);
	far_d916d(STR_2223, &B_5161, A_212E, 13);
	far_d916d(STR_222A, &B_5162, A_212E, 13);
	far_d8827(4, 0);
	far_da730(STR_2232);
	far_d8827(5, 0);
	far_d88e6(STR_2238, far_d62a9());
	far_d8827(6, 0);
	far_d8827(7, 0);
	far_d885c(STR_2253);
	v2 = 0;
	while (v2 == 0) {
		for (; ; ) {
			if ((v2 = far_d981a(4)) != 0)
				break;
			switch (B_A61D) {
			case 1:
				W_A051 = TBL_1023[B_5160];
				break;
			}
		}
		switch (v2) {
		case 120:
			far_d7983();
			if (B_8CD3 != 0) {
				far_de533(-40);
				v2 = B_53DB;
				break;
			}
			v2 = far_c5c79();
			break;
		case 121:
			v2 = far_e6338();
			break;
		case 122:
			v2 = 0;
			break;
		case 117:
			v2 = far_c5cfc();
			break;
		}
	}
	return v2;
}
