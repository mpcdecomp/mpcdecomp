extern char B_8D78;
extern char B_94A6;
extern char B_9D34;
extern int W_94D6;
extern int W_94D8;

far_e9cab(a0, a1)
{
	if (B_94A6 != 0 && far_d6a82(&B_94A6, B_9D34, 0) != 0)
		return;
	far_d7241(&B_94A6);
	if (B_8D78 != 0)
		return;
	far_f0c14(a0, a1, 0);
	a0 = far_e8cd3(&B_94A6, a0);
	B_94A6 = 1;
	a1 = far_e8cd3(&B_94A6, a1);
	B_94A6 = 0;
	far_f113e(a0);
	far_e8cd3(&B_94A6, 1);
	far_d7241(&B_94A6);
	far_e8cd3(&B_94A6, a0);
	if (W_94D8 > W_94D6)
		W_94D8 = 1;
	far_d4855(B_9D34, 1);
}
