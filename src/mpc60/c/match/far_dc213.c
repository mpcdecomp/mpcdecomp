extern int W_BE5C;

far_dc213(a0)
{
	int v2;
	int v4;

	outportw(-170, 0x4000);
	v4 = inportw(-162);
	outportw(-162, 0x4000);
	far_da8f6(1);
	if ((v2 = far_dc2ae(a0)) != 0)
		far_d7b8c(3, 0, W_BE5C);
	far_da8f6(0);
	outportw(-170, -0x1fff);
	outportw(-162, v4 | -0x2000);
	return v2;
}
