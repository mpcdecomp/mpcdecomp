extern char B_54F7;
extern char B_94A6[];
extern char B_9D34;
extern char B_A069;

far_dc84f(a0)
{
	int v2;

	far_d4b6e();
	if ((v2 = far_dc8bb(a0)) != 0)
		far_d4b6e();
	far_d4855(-1, 0);
	far_d4a9b(0);
	B_54F7 = 77;
	far_d6533();
	far_d6a82(B_94A6, B_9D34, 1);
	B_A069 = 0;
	far_d4c91();
	return v2;
}
