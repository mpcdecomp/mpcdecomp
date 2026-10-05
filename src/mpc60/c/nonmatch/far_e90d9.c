/* differs: +10 test ax,ax | jnz br_e90f1 */
extern char B_5064_V112;
extern char B_52E5_V112;
extern char B_5757_V112;
extern char B_8FEC_V112;
extern char B_8FF2_V112;
extern int W_8FEE_V112;
extern int W_8FF0_V112;
extern int W_8FF4_V112;
extern int W_8FF6_V112;

far_e90d9()
{
	int v2;
	int v4;
	int v6;
	char z0[12];

	v2 = W_8FF0_V112 - W_8FEE_V112;
	if (W_8FF0_V112 - W_8FEE_V112 == 0)
		return 0;
	if (far_d602b(B_8FEC_V112) != 0)
		return 0;
	B_52E5_V112 = B_5757_V112 = 0;
	B_5064_V112 = B_52E5_V112;
	L_daf8f();
	L_d8414();
	if ((v4 = far_e9380()) != 0) {
		L_d8414();
		far_e9d7e(0);
		L_dafbe();
		return v4;
	}
	if (B_8FF2_V112 != B_8FEC_V112) {
		if ((v4 = far_e94b8()) != 0) {
			L_d8414();
			far_e9d7e(0);
			L_dafbe();
			return v4;
		}
	}
	far_d6a82(B_8FF2_V112, 0);
	L_e535c(W_8FF4_V112);
	far_eddc3(0);
	L_e5471(1);
	far_e9280(v2, W_8FF6_V112);
	v6 = v2 * W_8FF6_V112 + W_8FF4_V112;
	far_f113e(v6);
	far_f0c14(W_8FF4_V112, v6, 1);
	L_d8414();
	far_e9d7e(0);
	far_d6a82(B_8FF2_V112, 0);
	L_dc484(B_8FF2_V112, 1);
	return 0;
}
