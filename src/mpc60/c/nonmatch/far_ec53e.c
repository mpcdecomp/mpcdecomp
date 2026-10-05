/* differs: +1a push ax | mov ax, word ptr [bp + 0ah] */
extern char B_4CBE_V112;
extern char B_8FCB_V112;
extern int W_52CE_V112;
extern int W_8FF4_V112;

far_ec53e(a0, a1, a2, a3)
{
	char z0[2];
	int v4;
	int v6;
	char z1[8];

	v4 = a0 * 384 / a1;
	if ((v6 = a2 * 384 / a3) == v4)
		return 0;
	if (W_8FF4_V112 == W_52CE_V112)
		L_d7288(W_8FF4_V112);
	L_daf8f();
	far_d6a82(B_4CBE_V112, 0);
	L_e5337(0, W_8FF4_V112);
	++B_8FCB_V112;
	if (v6 < v4)
		far_ec616(v6, a2, a3);
	else
		far_ec71f(v4, v6 - v4, a2, a3);
	--B_8FCB_V112;
	L_d8414();
	L_dafbe();
	L_dc484(B_4CBE_V112, 1);
}
