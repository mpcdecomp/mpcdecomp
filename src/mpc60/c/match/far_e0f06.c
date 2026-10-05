extern char B_8CCB;

far_e0f06(a0, a1)
{
	int v2;

	++B_8CCB;
	v2 = far_e0f3b(a0, a1);
	--B_8CCB;
	far_ee201(10, 0);
	return v2;
}
