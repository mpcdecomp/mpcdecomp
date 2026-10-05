extern char W_4C1C[];
extern char W_535F[];

far_dab2d(a0)
{
	int v2;
	int v4;

	far_d7b8c(0);
	if ((v2 = far_d7b8c(2, a0)) < 0)
		return v2;
	if ((v4 = far_dabb3(v2)) != 0) {
		if (far_de3b5(0, W_4C1C, (unsigned)(W_535F - W_4C1C) >> 1 << 1) != 0)
			far_cb577();
	}
	else
		far_de3f8(W_4C1C, 0, (unsigned)(W_535F - W_4C1C) >> 1 << 1);
	far_e61c1();
	return v4;
}
