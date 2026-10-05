extern char B_53DC;
extern char STR_48D9[];
extern char STR_48E7[];
extern char STR_4910[];
extern char STR_492F[];

far_e6b11(a0, a1)
{
	int v2;
	char v3;

	B_53DC = 52;
	far_c1f4e(STR_48D9);
	far_d8827(1, 0);
	far_d885c(STR_48E7);
	far_d8827(2, 0);
	far_d885c(STR_4910);
	far_d8827(3, 0);
	far_d885c(STR_492F);
	far_d8827(7, 0);
	v2 = far_da533(&v3, 2, 0);
	if (v2 == 0) {
		switch (v3) {
		case 1:
			if (a1 == 2)
				v2 = far_e687a(a0);
			else
				v2 = far_e69bc(a0);
			break;
		case 2:
			v2 = far_e6bf1(a0);
			break;
		}
	}
	return v2;
}
