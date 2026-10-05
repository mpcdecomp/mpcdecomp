extern char B_8CCB;

far_e01e1(a0, a1, a2)
{
	int v2;

	++B_8CCB;
	v2 = far_e0219(a0, a1, a2);
	--B_8CCB;
	far_ee201(10, 0);
	return v2;
}
