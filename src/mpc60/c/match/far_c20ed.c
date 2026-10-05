extern char TBL_8E65[];
extern unsigned char TBL_8E66;

far_c20ed(a0, a1)
{
	int v2;
	int v4;
	int v6;
	int v8;

	far_d7b8c(0);
	if ((v2 = far_d7b8c(2, a0)) < 0)
		return v2;
	if ((v4 = far_d7b8c(4, TBL_8E65, v2, 2)) != 0)
		return v4;
	if ((v6 = TBL_8E66) <= a1)
		v4 = 0;
	else
		v4 = -9;
	if ((v8 = far_d7b8c(3, 0, v2)) != 0)
		return v8;
	return v4;
}
