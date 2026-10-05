extern char B_53DB;

L_c3e28()
{
	int v2;
	int v4;

	L_c4063(0x19e1);
	far_d8827(2, 0);
	far_d885c(0x19ed);
	far_d8827(7, 0);
	far_d885c(0x1a10);
	v2 = far_d981a(1);
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(0x1a1c);
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
