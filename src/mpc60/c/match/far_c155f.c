extern char B_53DB;
extern char B_53DC;
extern char STR_18E7[];
extern char STR_18F4[];
extern char STR_1908[];
extern char STR_1913[];

far_c155f(a0)
{
	int v2;
	char z0[21];
	char v24;

	far_c1f4e(STR_18E7);
	B_53DC = 55;
	far_d8827(2, 0);
	far_d885c(STR_18F4);
	far_c1e6c(a0, &v24);
	far_d885c(&v24);
	far_d885c(0x1905);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_1908);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
	}
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(STR_1913);
		far_d7b8c(0);
		far_de533(far_d7b8c(6, a0));
		v2 = B_53DB;
	}
	return v2;
}
