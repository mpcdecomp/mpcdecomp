extern char B_94A6;
extern char B_9D34;
extern int W_8D4E;
extern int W_8D50;
extern int W_8D52;
extern int W_8D54;

long far_ed6eb()
{
	long v4;
	long v8;
	long v12;

	far_d55e8(&B_94A6);
	far_d6a82(&B_94A6, B_9D34, 1);
	far_d7241(&B_94A6);
	far_d4153(&B_94A6, W_8D52, W_8D54, &v12);
	far_d4153(&B_94A6, W_8D4E, W_8D50, &v8);
	v4 = v12 - v8;
	far_d55e8(&B_94A6);
	return v4;
}
