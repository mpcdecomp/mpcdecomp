extern char TBL_8E65[];
extern int W_8E63;

far_e3bba()
{
	if (W_8E63 != 0) {
		far_cb998(TBL_8E65, W_8E63, 0);
		W_8E63 = 0;
	}
	return;
}
