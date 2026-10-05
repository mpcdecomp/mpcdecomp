extern char B_53DC;
extern char B_8FCB_V112;

L_c3b20(a0)
{
	int v2;
	int v4;

	B_53DC = 52;
	L_c4063(0x18da);
	far_d8827(2, 0);
	far_d885c(0x18f9);
	far_d8827(7, 0);
	far_d885c(0x1936);
	v2 = far_d981a(1);
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(0x1942);
		++B_8FCB_V112;
		if ((v4 = L_e0488(a0)) != 0)
			far_de533(v4);
		else
			strncpy(-0x6fdd, a0, 8);
		far_d8765();
		--B_8FCB_V112;
		v2 = 0;
	}
	return v2;
}
