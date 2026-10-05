extern char B_53DB;
extern char B_53DC;
extern char B_8CCB;
extern char STR_175D[];
extern char STR_1779[];
extern char STR_1798[];
extern char STR_17A4[];

far_c11f9(a0)
{
	int v2;
	int v4;
	char v5;

	far_c1f4e(STR_175D);
	B_53DC = 53;
	far_d8827(2, 0);
	v5 = far_d77d7();
	far_d936c(STR_1779, &v5, 2, 1, 99, 10);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_1798);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
	}
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(STR_17A4);
		if ((v4 = far_c20ed(a0, 2)) != 0) {
			far_de533(v4);
			return B_53DB;
		}
		++B_8CCB;
		if ((v4 = far_dc46c(a0, v5)) != 0)
			far_de533(v4);
		far_d8765();
		--B_8CCB;
		v2 = 0;
	}
	return v2;
}
