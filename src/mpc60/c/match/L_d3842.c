extern char B_4E7A;
extern char B_8CCC;
extern char TBL_0BC4[];

L_d3842()
{
	int v2;
	char z0[2];
	int v6;

	L_c4063(0x3ac1);
	far_d8827(2, 0);
	far_d916d(0x3ae0, 0x5cae, TBL_0BC4, 4);
	far_d8827(4, 0);
	far_d885c(0x3aec);
	B_8CCC = 1;
	v6 = B_4E7A;
	far_d4273(7);
	for (; ; ) {
		if ((v2 = far_d981a(0)) != 0)
			break;
	}
	far_d4273(v6);
	B_8CCC = 0;
	return v2;
}
