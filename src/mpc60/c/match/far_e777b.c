extern char TBL_A667[];

far_e777b(a0, a1, a2, a3, a4, a5, a6, a7)
{
	int v2;
	int v4;
	char v5;
	char v6;

	if ((unsigned)a3 >= 34)
		return 0;
	if (TBL_A667[a3 * 59] != a3)
		return 0;
	far_d7b8c(0);
	if ((v4 = far_d7b8c(2, a0)) < 0)
		return v4;
	if ((v2 = far_d7b8c(4, &v6, v4, 2)) != 0)
		return v2;
	if (v6 != 2 && v6 != 5 && v6 != 6 || v5 > 1)
		return -9;
	if ((v2 = far_d7b8c(12, v4, a1, a2)) != 0)
		return v2;
	return far_db286(v4, a4, a5, a6, a7);
}
