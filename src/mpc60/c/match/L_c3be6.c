extern char B_53DB;
extern char B_53DC;

L_c3be6(a0)
{
	int v2;
	char z0[13];
	char v16;

	L_c4063(0x1954);
	B_53DC = 55;
	far_d8827(2, 0);
	far_d885c(0x1961);
	L_c3fcc(a0, &v16);
	far_d885c(&v16);
	far_d885c(0x1972);
	far_d8827(7, 0);
	far_d885c(0x1975);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
	}
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(0x1980);
		far_d7b8c(0);
		far_de533(far_d7b8c(6, a0));
		v2 = B_53DB;
	}
	return v2;
}
