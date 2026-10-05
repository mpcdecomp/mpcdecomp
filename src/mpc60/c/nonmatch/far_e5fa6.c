/* differs: +7 mov ax,1262 | mov ax, 5ff6h */
extern char B_52E4_V112;
extern char B_5C35_V112;
extern char B_7E0A;
extern char B_7E0B;
extern char B_88CE_V112;
extern char B_8CD5;
extern char B_8CD7;
extern char B_8FD3_V112;
extern char B_8FD6_V112;
extern char B_9009_V112;
extern char B_A06A;
extern char B_AEF1_V112;
extern int TBL_0BC4[];
extern int TBL_0C66_V112[];
extern int TBL_0FA1[];
extern int TBL_33DA_V112[];
extern char TBL_5176[];
extern char TBL_5196[];
extern char TBL_51B6[];
extern int TBL_51D6[];
extern char TBL_5212_V112[];
extern char TBL_5232_V112[];
extern char TBL_5252_V112[];
extern int TBL_5272_V112[];
extern char TBL_6049_V112[];
extern char TBL_8DF0_V112[];
extern char TBL_8F07_V112[];
extern int W_520B_V112;
extern int W_53A7;
extern int W_5B08_V112;
extern int W_AEF2_V112;

far_e5fa6()
{
	int v2;

	if (far_de3b5(0, 0x5b08, (unsigned)(0x5ff6 - 0x5b08) >> 1 << 1) != 0)
		far_cb577();
	B_8FD6_V112 = -1;
	B_AEF1_V112 = 127;
	W_AEF2_V112 = 0x3e8;
	B_9009_V112 = 1;
	B_5C35_V112 = 1;
	B_52E4_V112 = 0;
	B_8CD7 = 0;
	v2 = 0;
	for (; (unsigned)v2 < 4; ) {
		TBL_6049_V112[v2] = 0;
		v2++;
	}
	B_A06A = 1;
	B_88CE_V112 = 1;
	B_8CD5 = 0;
	B_8FD3_V112 = 0;
	W_520B_V112 = W_5B08_V112;
	B_7E0A = 0;
	B_7E0B = 0;
	W_53A7 = 0x1000;
	v2 = 0;
	do {
		TBL_8F07_V112[v2] = 1;
		TBL_0C66_V112[v2 + 1] = TBL_0BC4[v2];
		++v2;
	} while (v2 < 32);
	v2 = 0;
	do {
		TBL_8DF0_V112[v2] = -1;
		v2++;
	} while (v2 < 128);
	L_de80e(4, 4);
	far_df8fc();
	if (peekb(15, -1) == 0) {
		v2 = 0;
		do {
			TBL_0FA1[v2] = TBL_33DA_V112[v2];
			++v2;
		} while (v2 < 16);
	}
	setmem(-0x7746, 20, 1);
	far_e7d22();
	v2 = 0;
	do {
		TBL_5212_V112[v2] = TBL_5176[v2];
		TBL_5232_V112[v2] = TBL_5196[v2];
		TBL_5252_V112[v2] = TBL_51B6[v2];
		TBL_5272_V112[v2] = TBL_51D6[v2];
		++v2;
	} while (v2 < 32);
	far_e61c1();
	far_c5001();
	inport(384);
	return;
}
