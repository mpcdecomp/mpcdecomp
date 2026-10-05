extern char B_A61D;
extern char B_BAD4_V112;
extern char TBL_8E66[];
extern int W_903D_V112;
extern int W_BAD5_V112;
extern int W_BAD7_V112;
extern int W_BAD9_V112;
extern int W_BAE1_V112;

tgt_c9eca()
{
	int *v2;

	switch (far_d3ef5(-0x6fc1)) {
	case 1:
		v2 = -0x6fbc;
		*v2 = far_da949(W_BAE1_V112);
		break;
	case 6:
		L_c7f5e(-0x6fc1);
		break;
	case 7:
		switch (B_A61D) {
		case 0:
			if (W_BAD5_V112 > W_BAD7_V112) {
				setmem(W_903D_V112 + -0x6fc1, W_BAD5_V112 - W_BAD7_V112, 0);
				W_BAD7_V112 = W_BAD5_V112;
			}
			W_903D_V112 = W_BAD5_V112 + 2;
			break;
		case 1:
			if (W_BAD9_V112 > W_BAD5_V112) {
				W_BAD9_V112 = W_BAD5_V112;
				far_da14f(1);
			}
			B_BAD4_V112 = TBL_8E66[W_BAD9_V112];
			far_da14f(2);
			break;
		case 2:
			TBL_8E66[W_BAD9_V112] = B_BAD4_V112;
			break;
		}
		break;
	case 11:
		L_c7fe9(-0x6fc1);
		far_da14f(2);
		break;
	}
	return;
}
