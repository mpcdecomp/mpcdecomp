extern char B_53DC;
extern char B_5C51_V112;
extern char B_8FCB_V112;

L_c3980(a0)
{
	int v2;
	int v4;

	L_c4063(0x183c);
	B_53DC = 51;
	far_d8827(2, 0);
	far_d916d(0x1855, 0x5c51, 0xcaf, 9);
	far_d8827(7, 0);
	far_d885c(0x1869);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
	}
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(0x1875);
		++B_8FCB_V112;
		if ((v4 = far_daf9b(a0, B_5C51_V112)) != 0)
			far_de533(v4);
		far_d8765();
		--B_8FCB_V112;
		v2 = 0;
	}
	return v2;
}
