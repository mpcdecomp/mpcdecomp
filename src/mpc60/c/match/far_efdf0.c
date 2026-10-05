extern int W_53D5;
extern int W_53D7;
extern int W_8D7C;
extern int W_8D7E;
extern int W_8D82;
extern int W_8D84;
extern int W_8D86;

far_efdf0()
{
	if (-W_8D86 > W_8D84)
		W_8D84 = -W_8D86;
	W_8D82 = W_8D84 + 1;
	W_8D7E = 0;
	W_8D7C = 0;
	W_53D5 = W_53D7 = 0;
	W_8D84 = W_8D86 = 0;
	return;
}
