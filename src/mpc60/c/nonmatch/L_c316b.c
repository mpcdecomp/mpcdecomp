/* differs: none, but two callees sit in overlapping ROM segments: no link places both */
extern char B_53DB;
extern char B_53DC;

L_c316b()
{
	char v1;
	char v2;

	L_de62c(0x15f0);
	far_d8827(1, 0);
	far_d885c(0x15fc);
	far_d8827(2, 0);
	far_d885c(0x1625);
	far_d8827(3, 0);
	far_d885c(0x164a);
	far_d8827(4, 0);
	far_d885c(0x1669);
	far_d8827(7, 0);
	v1 = far_da533(&v2, 7, 0);
	if (v1 == 0) {
		B_53DC = v2;
		switch (B_53DC) {
		case 1:
		case 2:
		case 3:
		case 4:
			v1 = far_c8b5d(v2);
			break;
		case 5:
			v1 = L_c329c();
			break;
		case 6:
			v1 = L_c3e28();
			break;
		case 7:
			L_dc484(-1, 0);
			far_d49f3(-1, 0);
			far_d4a9b(0);
			v1 = B_53DB;
			break;
		}
	}
	return v1;
}
