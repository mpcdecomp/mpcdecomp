extern int TBL_0FA1[];

far_ee201(a0, a1)
{
	a0 = TBL_0FA1[a0 & 15];
	if (a1 != 0)
		a0 += 16;
	outport(a0, 0);
	return;
}
