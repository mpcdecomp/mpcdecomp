extern char B_A426[];
extern char B_A61D;
extern char *W_A61A;

far_d9dec(a0)
{
	if (a0 < 0)
		a0 = 0;
	B_A61D = 0;
	W_A61A = B_A426;
	++W_A61A;
	while (a0-- != 0)
		far_d9da3();
	return;
}
