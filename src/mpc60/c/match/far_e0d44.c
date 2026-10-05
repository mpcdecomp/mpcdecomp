extern char B_8E67;
extern int B_8E69;
extern char B_8E6B;
extern char B_8E6C;
extern char B_8E6F;
extern char B_8E78;
extern char B_B1FF;
extern char B_B202;
extern char B_B213;
extern int W_B200;
extern long W_B203;
extern long W_B207;
extern int W_B20B;
extern int W_B20D;
extern int W_B20F;
extern int W_B211;
long far_da92c();

far_e0d44()
{
	B_B1FF = B_8E67;
	W_B200 = B_8E69;
	B_B202 = B_8E6B;
	W_B203 = far_da92c(&B_8E6C);
	W_B207 = far_da92c(&B_8E6F);
	W_B20D = 0;
	W_B20B = 0;
	W_B211 = 0;
	W_B20F = 0;
	B_B213 = B_8E78;
	return;
}
