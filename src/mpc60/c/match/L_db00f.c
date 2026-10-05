extern unsigned char B_5756_V112;
extern char B_5758_V112;
extern char B_5759_V112;
extern unsigned char B_A06A;
extern unsigned char TBL_6196_V112[];
extern char TBL_6197_V112[];
extern int W_575A_V112;
extern int W_7E08;

L_db00f()
{
	int v2;
	int v4;

	v2 = B_A06A - 1;
	if (B_5759_V112 == 0) {
		L_db5b5();
		B_5756_V112 = 0;
	}
	if (B_5756_V112 >= 250)
		B_5756_V112 = 0;
	v4 = TBL_6196_V112[(B_5756_V112 << 1) + v2 * 500];
	B_5758_V112 = TBL_6197_V112[(B_5756_V112 << 1) + v2 * 500];
	if (B_5758_V112 != 0) {
		if (B_5756_V112 != 0)
			far_e82a4(v4);
		else {
			L_d8414();
			B_5759_V112 = 0;
			far_d6a82(v4, 1);
		}
	}
	else {
		L_d8414();
		L_d7288(1);
	}
	W_575A_V112 = far_ec823(v2);
	W_7E08 = far_eb7fc(v2);
	B_5759_V112 = 1;
	return;
}
