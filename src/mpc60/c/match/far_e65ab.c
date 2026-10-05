extern char B_4C1E;
extern char B_4C1F;
extern char B_501C;
extern char B_53DC;
extern char B_54F7;
extern char B_5507;
extern char B_7E63;
extern char B_94A6;
extern char B_9D34;
extern char B_A61D;
extern char STR_4732[];
extern char STR_4749[];
extern char STR_4754[];
extern char STR_475D[];
extern char STR_47CC[];
extern char STR_47E2[];
extern char STR_47F2[];
extern int TBL_0B9E[];
extern int TBL_0BA8[];
extern int W_535F;
extern int W_5361;

far_e65ab()
{
	int v2;
	int v4;
	char z0[16];
	char v21;

	far_c1f4e(STR_4732);
	B_7E63 = 1;
	B_54F7 = 0;
	B_53DC = 3;
	far_d88e6(STR_4749, B_9D34);
	far_d6668(B_9D34, -1, &v21);
	far_d90a6(0x4752, &v21, 16);
	v4 = (B_4C1F + 1) * B_4C1E;
	W_535F = far_d3a45(W_5361, B_4C1E, B_4C1F);
	far_d936c(STR_4754, &W_535F, 5, TBL_0B9E[v4], TBL_0BA8[v4], 4);
	far_d916d(0x475b, &B_4C1E, 0xb6a, 3);
	far_d8827(2, 0);
	far_d885c(STR_475D);
	far_d8827(3, 0);
	far_d885c(0x477f);
	far_d885c(0x47a4);
	far_d885c(STR_47CC);
	if (B_501C < 0)
		far_d885c(STR_47E2);
	else
		far_d88e6(STR_47F2, B_501C + 1);
	far_c30b6();
	v2 = 0;
	while (v2 == 0) {
		for (; ; ) {
			if ((v2 = far_d981a(0)) != 0)
				break;
			switch (B_A61D) {
			case 0:
				far_d700c(B_9D34, -1, &v21);
				break;
			case 1:
				far_c3056();
				break;
			case 2:
				v4 = (B_4C1F + 1) * B_4C1E;
				far_da2b0(2, TBL_0B9E[v4], TBL_0BA8[v4]);
				far_de758(0);
				break;
			}
		}
		switch (v2) {
		case 87:
			far_d3eb6();
			B_5507 = 0;
			far_de758(0);
			v2 = 0;
			break;
		case 47:
			B_54F7 = 1;
			break;
		default:
			B_54F7 = 77;
			break;
		}
	}
	far_d7939();
	B_7E63 = 0;
	far_d55e8(&B_94A6);
	far_d6a82(&B_94A6, B_9D34, 1);
	return v2;
}
