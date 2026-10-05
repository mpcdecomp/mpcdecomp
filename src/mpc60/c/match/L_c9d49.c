extern char B_53DC;
extern char B_54F7;
extern char B_8CDA;

L_c9d49()
{
	char v1;
	char v2;
	char z0[30];

	L_de62c(0x3091);
	far_d8827(1, 0);
	far_d885c(0x3096);
	far_d8827(2, 0);
	far_d885c(0x30b9);
	far_d8827(3, 0);
	far_d885c(0x30dc);
	far_d8827(4, 0);
	far_d885c(0x3105);
	far_d8827(5, 0);
	far_d885c(0x3116);
	far_d8827(7, 0);
	v1 = far_da533(&v2, 3, 0);
	if (v1 == 0) {
		B_53DC = v2;
		switch (B_53DC) {
		case 1:
			v1 = L_c9e4e();
			break;
		case 2:
			v1 = L_ca0c8();
			break;
		case 3:
			B_8CDA |= 16;
			v1 = B_54F7;
			break;
		}
	}
	return v1;
}
