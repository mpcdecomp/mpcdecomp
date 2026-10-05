extern char B_BE58;
extern char B_BEDF_V112;
extern int W_BE59;

far_db741(a0)
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;
	int v12;

	far_d7b8c(0);
	if ((W_BE59 = far_d7b8c(2, a0)) < 0)
		return W_BE59;
	v2 = 0;
	if ((v4 = far_d7b8c(4, &v2, W_BE59, 2)) != 0)
		return v4;
	if (v2 != 6)
		return 10;
	v6 = 0;
	v8 = 0;
	if ((v4 = far_d7b8c(4, &v8, W_BE59, 3)) != 0)
		return v4;
	v10 = 0;
	v12 = 0;
	if ((v4 = far_d7b8c(4, &v12, W_BE59, 3)) != 0)
		return v4;
	if ((v4 = far_d7b8c(4, -0x4122, W_BE59, 1)) != 0)
		return v4;
	if (B_BE58 != B_BEDF_V112)
		return 10;
	v2 = 0xbf7;
	if ((v4 = far_d7b8c(4, -0x6fc1, W_BE59, v2)) != 0)
		return v4;
	v4 = far_db286(W_BE59, v12, v10, v8, v6);
	far_db378();
	far_db8ab();
	far_db915();
	return v4;
}
