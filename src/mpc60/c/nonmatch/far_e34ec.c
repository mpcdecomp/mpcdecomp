/* differs: +1a mov ax, word ptr W_52CE_V112_ | mov dx, word ptr [W_52CE_V112] */
extern char B_4CBE_V112;
extern char B_4E85;
extern char B_52B5_V112;
extern char B_53DB;
extern char B_54F7;
extern char B_54FB;
extern char B_5B07_V112;
extern char B_5FEB_V112;
extern char B_5FEC_V112;
extern char B_88DA_V112;
extern char B_8C07;
extern char B_8FCB_V112;
extern unsigned char B_903F_V112;
extern char B_9D36;
extern char B_9D37;
extern char B_A61C;
extern char B_A61D;
extern char TBL_50CA_V112[];
extern long W_52CC_V112;
extern int W_52CE_V112;
extern int W_5510;
extern int W_903D_V112;
extern int W_BACC_V112;
extern int W_BACE_V112;
extern int W_BAD0_V112;

far_e34ec()
{
	int v2;
	int v4;
	int v6;
	int v8;
	char v9;
	char z0[1003];
	char v1013;

	L_de62c(0x289c);
	W_5510 = &v1013;
	W_BACE_V112 = W_52CE_V112;
	W_BACC_V112 = W_52CC_V112;
	if (B_52B5_V112 != 0 && far_de533(far_eb96c(B_4CBE_V112)) != 0)
		return 77;
	W_52CE_V112 = 0;
	L_d97d2(W_BACC_V112, W_BACE_V112);
	if (B_5B07_V112 == 0)
		far_eb134(125);
	B_54F7 = B_53DB;
	B_88DA_V112 = 1;
	far_ee201(8, 1);
	v8 = B_4E85;
	if (B_5FEC_V112 != 0)
		B_4E85 = 0;
	far_d8827(1, 0);
	far_d8837(62);
	L_c0f0e();
	far_d885c(0x28a6);
	++B_8FCB_V112;
	B_8C07 = far_d65f7(B_9D36);
	far_e39fe();
	--B_8FCB_V112;
	W_BAD0_V112 = 1;
	v2 = 0;
	v4 = 0;
	while (v4 == 0) {
		if (v2 != 120)
			v6 = far_e38ec(W_BAD0_V112);
		if (v2 == 122)
			B_A61C = v9;
		for (; ; ) {
			if ((v2 = far_d981a(116)) != 0)
				break;
			tgt_c9eca();
			if (B_A61D == 0) {
				if ((B_903F_V112 & 248) == 152) {
					far_d97f5();
					far_d8827(1, 1);
					far_c998b(W_BAD0_V112, -0x6fc1, W_903D_V112);
				}
			}
		}
		++B_8FCB_V112;
		switch (v2) {
		case 68:
			if (W_903D_V112 != 1)
				far_e3bba();
			B_9D37 = B_9D36;
			far_e7de1();
			far_e7918();
			far_05248();
			if (W_903D_V112 == 1) {
				B_903F_V112 = 255;
				break;
			}
			TBL_50CA_V112[B_9D36] |= 2;
			if (B_5FEC_V112 == 0)
				break;
			L_dc484(B_4CBE_V112, 1);
			if (far_e7d6a() != 0)
				break;
			if (B_54FB == 0)
				break;
			B_54FB = 0;
			v2 = 125;
		case 93:
		case 125:
			if (W_903D_V112 == 1)
				break;
		case 91:
		case 123:
			if (W_903D_V112 != 0)
				far_cb998(-0x6fc1, W_903D_V112);
			far_e7aef();
			far_eb134(v2);
			W_BACE_V112 = W_52CE_V112;
			W_BACC_V112 = W_52CC_V112;
			far_e39fe();
			W_BAD0_V112 = 1;
			break;
		case 120:
			if (W_903D_V112 == 1)
				break;
			if (W_52CE_V112 > 999)
				break;
			far_e3bba();
			W_903D_V112 = far_c990b(B_5FEB_V112, -0x6fc1);
			far_cc39e(W_BAD0_V112);
			v6 = far_e3955(W_BAD0_V112);
			TBL_50CA_V112[B_9D36] |= 2;
			L_dc484(B_4CBE_V112, 1);
			break;
		case 121:
			if (W_903D_V112 != 1)
				W_903D_V112 = 0;
			L_dc484(B_4CBE_V112, 1);
			break;
		case 122:
			v9 = B_A61D;
			far_044eb(-0x6fc1, W_903D_V112, 0x512e);
			far_05248();
			break;
		case 117:
			far_d8827(7, 0);
			L_dcb15(40);
			far_e3be1(W_BACC_V112, W_BACE_V112, 0);
			--B_8FCB_V112;
			v2 = far_e3a15();
			B_4E85 = v8;
			return v2;
		case 33:
			if (W_903D_V112 != 0)
				++W_BAD0_V112;
			break;
		case 94:
			if (W_BAD0_V112 > 1)
				--W_BAD0_V112;
			break;
		case 109:
			break;
		case 81:
			v2 = 77;
		default:
			v4 = 1;
			break;
		}
		--B_8FCB_V112;
	}
	far_e3be1(W_BACC_V112, W_BACE_V112, v2 == 83);
	B_4E85 = v8;
	return v2;
}
