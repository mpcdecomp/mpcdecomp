far_d8907(a0, a1)
{
	int v2;

	v2 = 100 - a0;
	if (a0 == 0)
		v2 = 127;
	if (a1 != 0)
		v2 |= 128;
	outport(512, v2);
	return;
}
