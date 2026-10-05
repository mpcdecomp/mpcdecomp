extern char B_52AA;
extern char TBL_8E65[];
extern int W_B214;

far_e0a11(a0)
{
	int v2;
	int v4;

	v4 = B_52AA == 1 ? W_B214 : 0x640;
	v2 = far_03012(a0 + 5, TBL_8E65, v4);
	if (far_d870d() == 0)
		return v2;
	if (far_d861e() != 120)
		return v2;
	return -20;
}
