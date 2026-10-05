extern char B_4E7A;
extern char B_52AC[];
extern char B_8CCC;
extern char STR_283D[];
extern char STR_285C[];
extern char TBL_0BC4[];

far_c6b43()
{
	int v2;
	int v4;

	far_c1f4e(STR_283D);
	far_d8827(2, 0);
	far_d916d(STR_285C, B_52AC, TBL_0BC4, 4);
	far_d8827(4, 0);
	far_d885c(0x2868);
	far_d8827(6, 0);
	far_d8894(61, 40);
	B_8CCC = 1;
	v4 = B_4E7A;
	far_d4273(7);
	for (; ; ) {
		if ((v2 = far_d981a(0)) != 0)
			break;
	}
	far_d4273(v4);
	B_8CCC = 0;
	return v2;
}
