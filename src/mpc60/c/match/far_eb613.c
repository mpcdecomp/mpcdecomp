extern char B_8CD4;
extern char B_94A6;
extern char B_981C;
extern int W_8CCD;
extern int W_8CCF;
extern long W_94C8;
extern long W_9B9A;
long far_d6216();
long far_d7820();

far_eb613()
{
	int v2;
	long v6;
	long v10;
	long v14;

	far_d55e8(&B_94A6);
	if (far_d7820(0) > far_d6216()) {
		far_eb795();
		return -3;
	}
	far_d602b(B_8CD4);
	v10 = W_9B9A;
	far_d602b(0);
	v6 = W_9B9A;
	far_da993(v6 + 7L, v10 + 7L, 16);
	far_da993(v6 + 32L, v10 + 32L, 168);
	far_d6a82(&B_94A6, B_8CD4, 0);
	far_e8cd3(&B_94A6, W_8CCF);
	B_94A6 = 1;
	far_e8cd3(&B_94A6, W_8CCF + W_8CCD);
	B_94A6 = 0;
	far_d6a82(&B_981C, 0, 1);
	far_e8cd3(&B_981C, 1);
	v14 = W_94C8;
	far_eb7fc(W_8CCD, W_8CCF);
	W_94C8 = v14;
	v2 = far_eb8a8(0, B_8CD4);
	far_eb7bb();
	far_d4855(B_8CD4, 1);
	return v2;
}
