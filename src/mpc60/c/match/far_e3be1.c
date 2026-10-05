extern char B_7E12;
extern char TBL_8E65[];
extern int W_8E63;

far_e3be1(a0, a1, a2)
{
	if (W_8E63 != 0) {
		far_cb998(TBL_8E65, W_8E63, 0);
		W_8E63 = 0;
	}
	if (a2 == 0)
		far_04a89();
	far_e7aef();
	far_ec4ae(a0, a1);
	far_ee201(8, 0);
	B_7E12 = 0;
	return;
}
