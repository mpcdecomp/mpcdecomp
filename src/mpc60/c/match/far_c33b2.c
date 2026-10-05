extern char B_94A7;
extern char B_B23B;
extern char STR_1C80[];
extern int W_94D8;
extern int W_B23C;

far_c33b2()
{
	B_B23B = B_94A7 & 1;
	W_B23C = W_94D8;
	far_da14f(5);
	if (B_B23B == 0) {
		far_d8827(2, 36);
		far_d885c(STR_1C80);
	}
	else
		far_da14f(6);
	return;
}
