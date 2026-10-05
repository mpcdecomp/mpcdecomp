extern char B_8CCB;

far_e127e(a0)
{
	int v2;

	++B_8CCB;
	v2 = far_e12b0(a0);
	--B_8CCB;
	far_ee201(9, 0);
	return v2;
}
