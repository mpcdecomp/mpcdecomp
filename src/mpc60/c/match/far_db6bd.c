far_db6bd(a0)
{
	int v2;
	int v4;

	outportw(-170, 0x4000);
	v4 = inportw(-162);
	outportw(-162, 0x4000);
	far_da8f6(1);
	v2 = far_db741(a0);
	far_da8f6(0);
	outportw(-170, -0x1fff);
	outportw(-162, v4 | -0x2000);
	return v2;
}
