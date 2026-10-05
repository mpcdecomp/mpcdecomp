extern char B_4CBE_V112;
extern char B_53DB;
extern char B_A61D;
extern int W_5FF0_V112;
extern int W_5FF2_V112;

far_e1d7f()
{
	int v2;

	L_c4063(0x2375);
	far_d8827(2, 0);
	far_d936c(0x2398, 0x5ff0, 3, 1, 999, 0);
	L_dcb15(21);
	far_d936c(0x23a8, 0x5fee, 2, 1, 31, 10);
	far_d916d(0x23b3, 0x5fef, 0xf41, 2);
	far_d8827(3, 0);
	far_d916d(0x23b5, 0x5ff4, 0x21cc, 14);
	L_dcb15(21);
	far_d936c(0x23ba, 0x5ff2, 3, 1, 999, 0);
	far_d8827(5, 0);
	far_d885c(0x23c5);
	far_d8827(7, 0);
	far_d885c(0x23ea);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
		switch (B_A61D) {
		case 0:
		case 4:
			if (W_5FF2_V112 > W_5FF0_V112) {
				W_5FF2_V112 = W_5FF0_V112;
				far_da14f(4);
			}
			break;
		}
	}
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(0x23f4);
		L_d8414();
		far_e9d7e(B_4CBE_V112);
		far_d5bcd(B_4CBE_V112, 0);
		v2 = B_53DB;
	}
	return v2;
}
