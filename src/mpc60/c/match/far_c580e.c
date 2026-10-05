far_c580e(a0, a1)
{
	for (; ; ) {
		if ((inport(176) & 128) == 0)
			break;
	}
	outport(180, a0);
	outport(182, a1);
	return;
}
