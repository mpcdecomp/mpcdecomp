extern char B_7E0F;
extern char B_7E14;
extern int W_BE76;

fn_dee92()
{
	W_BE76 = 1;
	while (B_7E14 != 0) {
		switch (B_7E0F & 63) {
		case 8:
			far_ee201(8, 0);
			far_ee201(10, W_BE76);
			break;
		case 10:
			far_ee201(10, 0);
			far_ee201(8, W_BE76);
			break;
		default:
			far_ee201(10, 0);
			far_ee201(8, 0);
			B_7E14 = 0;
			return;
		}
		L_df04f(4);
		W_BE76 = 1 - W_BE76;
	}
}
