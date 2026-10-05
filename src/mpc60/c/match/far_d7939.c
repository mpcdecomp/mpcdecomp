extern char B_7E10;
extern char B_7E11;
extern char B_7E5D;
extern char B_8CCB;
extern char B_94A6[];
extern int W_53CD;
extern int W_53CF;

far_d7939()
{
	if (B_7E10 != 0) {
		far_d3c3d();
		while (B_7E11 != 0)
			;
		++B_8CCB;
		far_eddc3();
		far_d5373(W_53CD, W_53CF);
		--B_8CCB;
		far_d62e8(B_94A6);
		B_7E5D = 1;
	}
	return;
}
