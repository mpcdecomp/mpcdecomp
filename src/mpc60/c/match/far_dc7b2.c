extern int W_9B9A;
extern int W_9B9C;
long far_d7820();

far_dc7b2(a0, a1)
{
	long v4;
	int v6;
	int v8;
	int v10;

	v4 = far_d7820(a1);
	far_d7b8c(0);
	if ((v6 = far_d7b8c(1, a0)) < 0)
		return v6;
	v10 = 515;
	if ((v8 = far_d7b8c(5, &v10, v6, 2)) != 0)
		return v8;
	if ((v8 = far_edfaa(5, W_9B9A, W_9B9C, v6, v4)) != 0)
		return v8;
	return far_d7b8c(3, 0, v6);
}
