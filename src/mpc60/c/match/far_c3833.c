extern char B_53DC;
extern char B_54F7;
extern char B_8CDA;
extern char STR_1D63[];
extern char STR_1D68[];
extern char STR_1D8E[];
extern char STR_1DB5[];
extern char STR_1DD8[];

far_c3833()
{
	char v1;
	char v2;

	far_da730(STR_1D63);
	far_d8827(1, 0);
	far_d885c(STR_1D68);
	far_d8827(2, 0);
	far_d885c(STR_1D8E);
	far_d8827(3, 0);
	far_d885c(STR_1DB5);
	far_d8827(4, 0);
	far_d885c(STR_1DD8);
	far_d8827(7, 0);
	v1 = far_da533(&v2, 4, 0);
	if (v1 == 0) {
		B_53DC = v2;
		switch (B_53DC) {
		case 1:
			v1 = far_c392c();
			break;
		case 2:
			v1 = far_c3c8d();
			break;
		case 3:
			v1 = far_c4134();
			break;
		case 4:
			B_8CDA |= 16;
			v1 = B_54F7;
			break;
		}
	}
	return v1;
}
