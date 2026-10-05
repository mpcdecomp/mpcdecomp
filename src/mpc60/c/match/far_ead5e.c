extern char B_94A6;
extern char B_9D34;
extern int W_94E4;
extern int W_A059;
long far_d6216();

far_ead5e(a0, a1, a2, a3)
{
	int v2;
	int v4;

	if (B_94A6 != 0)
		return 0;
	if ((long)(a0 + 1 << 3) > far_d6216())
		return -3;
	a1 = far_e8cd3(&B_94A6, a1);
	far_ed328(&B_94A6, a2, a3);
	v4 = a1 + a0;
	v2 = a1;
	for (; v2 < v4; ) {
		far_e7daf(1, v2);
		W_A059 = W_94E4;
		far_03ec1(1);
		++v2;
	}
	far_f113e(v4);
	far_f0c14(a1, v4, 1);
	far_d4855(B_9D34, 1);
	return 0;
}
