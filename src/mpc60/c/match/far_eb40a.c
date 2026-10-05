extern char B_8CD3;
extern char B_8CD4;
extern char B_94A6;
extern char B_94A7;
extern char B_981C;
extern char B_9D34;
extern char B_A069;
extern char B_BE8E;
extern char TBL_8E65;
extern int W_8CCD;
extern int W_8CCF;
extern int W_8CD1;
extern int W_94D6;
extern int W_94D8;

far_eb40a()
{
	int v2;

	B_BE8E = B_A069;
	B_A069 = 0;
	far_d4c91();
	far_ee201(7, 1);
	B_8CD3 = 1;
	B_8CD4 = B_9D34;
	far_f11dc();
	far_d7156();
	far_d55e8(&B_94A6);
	W_8CD1 = W_8CCF - 1;
	if ((v2 = far_f0ace(B_8CD4, 0)) != 0) {
		far_eb7bb();
		return v2;
	}
	far_d6a82(&B_981C, B_8CD4, 1);
	far_e8cd3(&B_981C, W_8CCF);
	if ((v2 = far_eb52e()) != 0) {
		far_eb7bb();
		return v2;
	}
	far_eb7fc(W_8CCD, 1);
	TBL_8E65 = -1;
	far_05303(1, &TBL_8E65, 1);
	W_94D6 = W_8CCD;
	far_f1255();
	W_94D8 = 1;
	B_94A7 |= 1;
	far_d55e8(&B_94A6);
	far_d55e8(&B_981C);
	far_d6a82(&B_94A6, 0, 0);
	far_d7241(&B_94A6);
	return 0;
}
