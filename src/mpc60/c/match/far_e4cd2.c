extern unsigned char B_7E06;
extern char B_94A6[];
extern char B_94DD;
extern char B_A06A;
extern char B_A06C;
extern char W_94DC;
extern int W_94DE;

far_e4cd2()
{
	int v2;

	v2 = far_d6fda(B_7E06 - 1);
	if (B_A06C == B_A06A)
		far_e8cd3(B_94A6, v2);
	else {
		W_94DE = v2;
		B_94DD = 1;
		W_94DC = 0;
	}
	return;
}
