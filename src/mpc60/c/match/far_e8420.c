extern char B_5507;
extern char B_7E11;
extern char B_8B4F;
extern char B_9D37;
extern char B_A063;
extern unsigned char B_A065;
extern char TBL_7E6C[];
extern int TBL_7EEC[];
extern char TBL_7FEC[];
extern int TBL_806C[];
extern char TBL_8C09[];
extern char TBL_8C29[];

far_e8420()
{
	int v2;
	int v4;
	int v6;
	char v7;
	char v8;
	char v9;
	char v10;
	char v11;
	register int r1;

	r1 = 0;
	for (; (unsigned)r1 < 32; ) {
		if ((v2 = TBL_8C09[r1]) != 0) {
			TBL_8C29[0] = B_8B4F;
			if (B_7E11 >= 8) {
				TBL_7E6C[r1] = v2;
				TBL_7EEC[r1] = 0;
				TBL_7FEC[r1] = TBL_8C29[r1];
				TBL_806C[r1] = B_A065 + -4;
				B_A063 = 1;
			}
			v11 = -104;
			v10 = B_9D37;
			v9 = r1;
			v8 = v2;
			v7 = TBL_8C29[r1];
			v4 = B_A065 + -4;
			if (v4 <= 1)
				v4 = 1;
			v6 = far_da949(v4);
			far_044eb(&v11, 7);
		}
		if (B_5507 == 0)
			B_5507 = 1;
		++r1;
	}
	return;
}
