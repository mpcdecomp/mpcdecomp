extern char B_5C51_V112;
extern char TBL_AE2C[];
long far_df05c();

L_d2183()
{
	int v2;
	int v4;

	v2 = far_df0f4(TBL_AE2C[B_5C51_V112]) / 100;
	far_d8827(2, 10);
	far_d9445(v2, 4, 4);
	v4 = far_df05c() / 0xfa0L;
	far_d8827(2, 28);
	far_d9445(v4, 4, 4);
	return;
}
