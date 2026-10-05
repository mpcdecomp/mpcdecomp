extern char B_53DC;
extern char B_8E03;

L_c182b()
{
	int v2;
	char z0[2];

	far_c1f4e(0x1974);
	B_53DC = 60;
	far_d8827(1, 0);
	far_d885c(0x1980);
	far_d885c(0x19a8);
	far_d8827(4, 0);
	far_d916d(0x19c3, -0x71fd, 0x11ff, 16);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(0x19c9);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
		L_d82f3(B_8E03);
		far_da14f(0);
	}
	if (v2 == 120)
		v2 = 0;
	return v2;
}
