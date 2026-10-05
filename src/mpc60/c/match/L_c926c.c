extern char B_53DC;

L_c926c()
{
	char v1;
	char v2;

	L_c4063(0x2d5a);
	far_d8827(2, 0);
	far_d885c(0x2d68);
	far_d885c(0x2d8a);
	far_d8827(5, 0);
	v1 = far_da533(&v2, 2, 0);
	if (v1 == 0) {
		B_53DC = v2 + 1;
		switch (v2) {
		case 1:
			v1 = L_c9304();
			break;
		case 2:
			v1 = L_c9440();
			break;
		}
	}
	return v1;
}
