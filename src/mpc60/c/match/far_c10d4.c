extern char B_5218[];
extern char B_53DB;
extern char B_53DC;
extern char B_8CCB;
extern char STR_16F8[];
extern char STR_1743[];
extern char STR_174F[];
extern char TBL_0CF1[];
extern char TBL_AE2C[];

far_c10d4(a0)
{
	int v2;
	int v4;

	far_c1f4e(STR_16F8);
	B_53DC = 50;
	far_d8827(2, 0);
	far_d916d(0x1711, B_5218, TBL_0CF1, 9);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_1743);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
	}
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(STR_174F);
		if ((v4 = far_c20ed(a0, 1)) != 0) {
			far_de533(v4);
			return B_53DB;
		}
		++B_8CCB;
		if ((v4 = far_daf9b(a0, B_5218[0])) != 0) {
			far_df868(TBL_AE2C[B_5218[0]]);
			far_de533(v4);
		}
		far_d8765();
		--B_8CCB;
		v2 = 0;
	}
	return v2;
}
