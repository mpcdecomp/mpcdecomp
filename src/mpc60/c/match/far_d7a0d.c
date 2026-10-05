extern char B_4C20;
extern int W_4C1C;
extern int W_5365;
extern int W_5367;
extern int W_9FA5;

far_d7a0d()
{
	W_5367 = B_4C20 != 0 ? W_9FA5 : W_4C1C;
	W_5365 = far_d393d(W_5367, 0, 0);
	far_d391a();
	return;
}
