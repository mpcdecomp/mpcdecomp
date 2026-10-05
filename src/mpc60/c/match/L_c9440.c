extern char B_A61D;
extern int W_94D6;

L_c9440()
{
	char v1;
	int v3;
	int v5;

	v3 = 1;
	v5 = W_94D6 + 1;
	L_c4063(0x2df8);
	far_d8827(1, 0);
	far_d936c(0x2e09, &v3, 3, 1, 999, 1);
	L_dcb15(24);
	far_d936c(0x2e13, &v5, 3, 1, 999, 1);
	far_d8827(3, 0);
	far_d885c(0x2e1b);
	far_d885c(0x2e40);
	far_d8827(6, 0);
	far_d8894(45, 40);
	far_d8827(7, 0);
	far_d885c(0x2e59);
	for (; ; ) {
		if ((v1 = far_d981a(1)) != 0)
			break;
		switch (B_A61D) {
		case 0:
		case 1:
			L_c9617(&v3, &v5, W_94D6);
			far_da14f(0);
			far_da14f(1);
			break;
		}
	}
	if (v1 == 120) {
		L_c958f(v3, v5, 0);
		v1 = 77;
	}
	return v1;
}
