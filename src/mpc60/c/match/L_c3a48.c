extern char B_53DC;
extern char B_8FCB_V112;

L_c3a48(a0)
{
	int v2;
	int v4;
	char v5;

	L_c4063(0x1883);
	B_53DC = 53;
	far_d8827(2, 0);
	v5 = far_d77d7();
	far_d936c(0x189f, &v5, 2, 1, 99, 10);
	far_d8827(7, 0);
	far_d885c(0x18be);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
	}
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(0x18ca);
		++B_8FCB_V112;
		if ((v4 = far_dc46c(a0, v5)) != 0)
			far_de533(v4);
		far_d8765();
		--B_8FCB_V112;
		v2 = 0;
	}
	return v2;
}
