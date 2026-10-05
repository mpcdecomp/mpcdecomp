/* differs: none, but two callees sit in overlapping ROM segments: no link places both */
extern char B_53DB;
extern char B_53DC;
extern char STR_1503[];
extern char STR_1508[];
extern char STR_1531[];
extern char STR_1556[];

far_c04f0()
{
	char v1;
	char v2;

	far_da730(STR_1503);
	far_d8827(1, 0);
	far_d885c(STR_1508);
	far_d8827(2, 0);
	far_d885c(STR_1531);
	far_d8827(3, 0);
	far_d885c(STR_1556);
	far_d8827(4, 0);
	far_d885c(0x1307);
	far_d8827(7, 0);
	v1 = far_da533(&v2, 9, 0);
	if (v1 == 0) {
		B_53DC = v2;
		switch (B_53DC) {
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
			v1 = far_c8b5d(v2);
			break;
		case 6:
			v1 = L_c05ee();
			break;
		case 7:
			v1 = L_c12a5();
			break;
		case 8:
			v1 = far_c1a13();
			break;
		case 9:
			far_d4855(-1, 0);
			far_d49f3(-1, 0);
			far_d4a9b(0);
			v1 = B_53DB;
			break;
		}
	}
	return v1;
}
