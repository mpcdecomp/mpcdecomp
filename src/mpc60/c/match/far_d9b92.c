extern char B_5504;
extern char B_8D8A;
extern char B_94A6;
extern char B_A61E;
extern char B_A61F;
extern char B_A622;
extern char B_A625;
extern char TBL_A624[];
extern int W_A650;
long far_eae2e();
long far_ee710();

far_d9b92()
{
	int v2;
	long v6;

	if (B_A622 == 0) {
		switch (B_A61E & 15) {
		case 0:
			TBL_A624[B_A61F] = 0;
			v2 = far_d9c99(TBL_A624);
			if ((B_A61E & 128) == 0 && far_ee48f() < 0)
				v2 = -v2;
			far_ee39e(v2);
			break;
		case 1:
			far_da007(TBL_A624);
			if (TBL_A624[0] == 0) {
				TBL_A624[0] = 95;
				B_A625 = 0;
			}
			far_da0bd(TBL_A624, B_A61F);
			strcpy(W_A650, TBL_A624);
			B_5504 = 1;
			far_eea3a(W_A650);
			break;
		case 5:
			v6 = far_ee710(TBL_A624);
			if (B_8D8A == 0)
				v6 = far_eae2e(&B_94A6, v6);
			far_ee667(v6);
			break;
		}
		return -0x8000;
	}
	return 0;
}
