far_d7be4()
{
	int v2;

	if ((inport(514) & 4) != 0)
		return 1;
	outport(518, 13);
	v2 = 0;
	do {
		far_ddb1f(2);
		if ((inport(514) & 4) != 0)
			return 1;
		++v2;
	} while (v2 < 3);
	far_d7cba();
	return 0;
}
