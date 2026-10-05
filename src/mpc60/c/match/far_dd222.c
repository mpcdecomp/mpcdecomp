extern char W_4C1C;
extern char W_535F;
extern int W_BE68;

far_dd222(a0)
{
	int v2;
	char v3;
	char v4;
	int v6;

	far_d7b8c(0);
	if (far_d7b8c(2, a0) >= 0)
		return -0x800;
	if ((W_BE68 = far_d7b8c(1, a0)) < 0)
		return W_BE68;
	v4 = 8;
	v3 = 0;
	if ((v2 = far_d7b8c(5, &v4, W_BE68, 2)) != 0)
		return v2;
	v6 = (unsigned)(&W_535F - &W_4C1C) >> 1 << 1;
	if ((v2 = far_d7b8c(5, &v6, W_BE68, 2)) != 0)
		return v2;
	if ((v2 = far_d7b8c(5, &W_4C1C, W_BE68, (unsigned)(&W_535F - &W_4C1C) >> 1 << 1)) != 0)
		return v2;
	return far_d7b8c(3, 0, W_BE68);
}
