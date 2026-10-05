extern char B_4C1E;
extern char B_4C1F;
extern char B_53AB;
extern char B_7E10;
extern int W_535F;
extern int W_5361;
extern char W_53BB[];
extern int W_94D0;
extern int W_94D2;

far_c3056()
{
	if (B_53AB != 0)
		W_535F = far_d3a45(W_5361, B_4C1E, B_4C1F);
	else
		far_d7a3c(W_535F, B_4C1E);
	if (B_7E10 == 0) {
		far_d447f(W_94D0, W_94D2, W_53BB);
		far_de758(0);
	}
	return;
}
