far_e76e2(a0, a1, a2, a3, a4, a5, a6, a7)
{
	int v2;
	int v4;

	outportw(-170, 0x4000);
	v4 = inportw(-162);
	outportw(-162, 0x4000);
	far_da8f6(1);
	v2 = far_e777b(a0, a1, a2, a3, a4, a5, a6, a7);
	far_da8f6(0);
	outportw(-170, -0x1fff);
	outportw(-162, v4 | -0x2000);
	return v2;
}
