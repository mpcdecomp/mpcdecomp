extern char B_53DB;
extern char STR_23DD[];
extern char STR_23E8[];

far_c5f4b()
{
	char v1;
	char v2;

	far_c1f4e(STR_23DD);
	far_d885c(STR_23E8);
	far_d885c(0x23fb);
	far_d885c(0x2418);
	far_d8827(7, 0);
	v1 = far_da533(&v2, 6, 0);
	if (v1 == 0) {
		switch (v2) {
		case 1:
			v1 = far_c603c();
			break;
		case 2:
			v1 = far_c6269();
			break;
		case 3:
			v1 = far_c6355();
			break;
		default:
			v1 = B_53DB;
			break;
		}
	}
	return v1;
}
