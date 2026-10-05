extern char B_8CDA;
extern char B_8CDB;
extern char B_94A6[];
extern char B_981C[];
extern char B_9D34;

far_dc46c(a0, a1)
{
	int v2;
	int v4;
	int v6;

	far_d7b8c(0);
	if ((v2 = far_d7b8c(2, a0)) < 0)
		return v2;
	v6 = B_9D34;
	far_d55e8(B_94A6);
	far_d55e8(B_981C);
	far_e9d7e(a1);
	if ((v4 = far_dc510(a1, v2)) != 0)
		a1 = v6;
	far_d6474(a1);
	far_d6a82(B_94A6, a1, 1);
	far_d4c91();
	B_8CDB |= 64;
	B_8CDA |= -128;
	return v4;
}
