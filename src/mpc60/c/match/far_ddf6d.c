extern char B_5216;
extern char B_5504;
extern int TBL_51D6[];
extern int TBL_A00C[];

far_ddf6d(a0, a1)
{
	if (B_5216 != 0)
		TBL_A00C[a0] = a1;
	else {
		TBL_51D6[a0] = a1;
		B_5504 = 1;
	}
	return;
}
