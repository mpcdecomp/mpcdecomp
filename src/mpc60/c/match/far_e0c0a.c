extern int B_8E68;
extern char B_8E6A;
extern char B_8E6B;
extern char B_8E77;
extern char B_B202;
extern char B_B213;
extern char W_8E6E;
extern int W_B200;
extern long W_B203;
extern long W_B207;
extern int W_B20B;
extern int W_B20D;
extern int W_B20F;
extern int W_B211;
long far_da92c();

far_e0c0a()
{
	W_B200 = B_8E68;
	B_B202 = B_8E6A;
	W_B203 = far_da92c(&B_8E6B);
	W_B207 = far_da92c(&W_8E6E);
	W_B20D = 0;
	W_B20B = 0;
	W_B211 = 0;
	W_B20F = 0;
	B_B213 = B_8E77;
	return;
}
