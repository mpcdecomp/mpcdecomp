extern char B_53DC;
extern char STR_486C[];
extern char STR_48BB[];

far_e6926(a0)
{
	int v2;

	B_53DC = 52;
	far_c1f4e(STR_486C);
	far_d8827(2, 0);
	far_d885c(0x488b);
	far_d8827(6, 0);
	far_d8894(61, 40);
	far_d8827(7, 0);
	far_d885c(STR_48BB);
	v2 = far_d981a(1);
	if (v2 == 120)
		v2 = far_e69bc(a0);
	return v2;
}
