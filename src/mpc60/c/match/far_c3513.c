extern char A_8E52[];
extern char A_B218[];
extern char B_8CD3;
extern char B_8CD4;
extern char B_9D34;
extern char B_9D36;

far_c3513()
{
	int v2;

	far_d6668(B_9D34, -1, A_B218);
	far_d6668(B_9D34, B_9D36, A_8E52);
	far_c316d();
	v2 = B_8CD3 != 0 ? B_8CD4 : B_9D34;
	return v2;
}
