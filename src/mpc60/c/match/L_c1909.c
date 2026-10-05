extern char B_53DB;
extern char STR_1A0B[];
extern char STR_1A17[];

L_c1909()
{
	int v2;
	int v4;

	far_c1f4e(0x19d5);
	far_d8827(2, 0);
	far_d885c(0x19ea);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_1A0B);
	v2 = far_d981a(1);
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(STR_1A17);
		L_d82f3(0);
		far_d7b8c(0);
		if ((v4 = far_d7b8c(11, 0, 5)) != 0) {
			if (v4 == -254 || v4 == -252 || v4 == -240)
				far_de67d(0, 26, v4);
			else
				far_de533(v4);
		}
		v2 = B_53DB;
	}
	return v2;
}
