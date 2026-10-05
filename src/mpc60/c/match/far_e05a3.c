extern char B_8CCB;

far_e05a3(a0, a1)
char a1;
{
	int v2;

	++B_8CCB;
	v2 = far_e05da(a0, a1);
	--B_8CCB;
	far_ee201(9, 0);
	return v2;
}
