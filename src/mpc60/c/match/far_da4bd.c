extern char A_BE52[];
extern char B_BE54;
extern char B_BE55;
extern char B_BE56;
extern int TBL_3618[];

far_da4bd(a0)
{
	int v2;
	int v4;

	v2 = a0 % 12;
	v4 = a0 / 12 - 2;
	setmem(A_BE52, 5, 32);
	strcpy(A_BE52, TBL_3618[v2]);
	if (v4 < 0) {
		B_BE54 = 45;
		B_BE55 = 48 - v4;
	}
	else {
		B_BE54 = v4 + 48;
		B_BE55 = 32;
	}
	B_BE56 = 0;
	return A_BE52;
}
