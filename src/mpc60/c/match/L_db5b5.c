extern char B_7E10;
extern char B_7E11;
extern char B_88E7_V112;
extern char B_8FCB_V112;
extern int W_53CD;
extern int W_53CF;

L_db5b5()
{
	if (B_7E10 != 0) {
		far_d3c3d();
		while (B_7E11 != 0)
			;
		++B_8FCB_V112;
		far_ec31a();
		far_d5373(W_53CD, W_53CF);
		--B_8FCB_V112;
		B_88E7_V112 = 1;
	}
	return;
}
