extern char B_53DC;
extern char STR_4800[];
extern char STR_484F[];

far_e67e4(a0)
{
	int v2;

	B_53DC = 52;
	far_c1f4e(STR_4800);
	far_d8827(2, 0);
	far_d885c(0x481f);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_484F);
	v2 = far_d981a(1);
	if (v2 == 120)
		v2 = far_e687a(a0);
	return v2;
}
