/* differs: +15 test ax,ax | jnz L_da7c7 */
extern char B_8FEC_V112;
extern char B_8FED_V112;
extern char B_8FF2_V112;
extern char B_8FF3_V112;
extern char TBL_5066_V112[];
extern char TBL_50CA_V112[];
extern int TBL_512E_V112[];
extern char TBL_547E_V112[];
extern int TBL_54E2_V112[];
extern int W_8FEE_V112;
extern int W_8FF0_V112;
extern int W_8FF4_V112;
extern int W_8FF6_V112;
long far_d6216();
long far_f07d4();

L_da7aa(a0)
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;
	int v12;
	int v14;
	char z0[8];
	long v26;
	char z1[18];

	v14 = 0;
	v2 = W_8FF0_V112 - W_8FEE_V112;
	if (W_8FF0_V112 - W_8FEE_V112 == 0)
		return 0;
	v10 = L_e4731(B_8FEC_V112, B_8FED_V112);
	if (v10 < 0)
		return 0;
	if (far_d602b(B_8FF2_V112) != 0)
		return -12;
	L_daf8f();
	v26 = far_f07d4(B_8FEC_V112, W_8FEE_V112, W_8FF0_V112);
	if (B_8FEC_V112 == B_8FF2_V112) {
		v4 = far_e9686(B_8FEC_V112, 0);
		if (v4 != 0) {
			L_dafbe();
			return v4;
		}
		v8 = B_8FEC_V112;
		v6 = 0;
		v14 = 1;
	}
	else {
		v6 = B_8FEC_V112;
		v8 = B_8FF2_V112;
	}
	if ((long)W_8FF6_V112 * v26 + 200L > far_d6216()) {
		L_d8414();
		far_e9d7e(0);
		L_dafbe();
		return -3;
	}
	far_d6a82(v8, 0);
	L_e5337(0, W_8FF4_V112);
	far_eddc3(v6);
	L_e5337(1, W_8FEE_V112);
	v12 = TBL_5066_V112[B_8FF3_V112];
	if ((TBL_50CA_V112[v12] & 2) != 0) {
		if (((TBL_50CA_V112[v12] ^ TBL_547E_V112[v10]) & 4) != 0) {
			L_dafbe();
			return -10;
		}
	}
	else {
		v12 = TBL_5066_V112[B_8FF3_V112];
		TBL_50CA_V112[v12] = TBL_547E_V112[v10];
		TBL_512E_V112[v12] = TBL_54E2_V112[v10];
	}
	L_da9a0(v10, v12, a0);
	L_d8414();
	if (v14 != 0)
		far_e9d7e(0);
	L_dafbe();
	L_dc484(B_8FF2_V112, 1);
	return 0;
}
