/* differs: +24e bne $6 | jmp near br_e2bcc */
extern char B_4CBE_V112;
extern char B_53DB;
extern char B_5C47_V112;
extern char B_8FEC_V112;
extern char B_8FED_V112;
extern char B_8FF2_V112;
extern char B_8FF3_V112;
extern char B_A04C;
extern char B_A61D;
extern int W_8FEE_V112;
extern int W_8FF0_V112;
extern int W_8FF4_V112;
extern int W_8FF6_V112;
extern int W_94D6;

far_e290c()
{
	char z0[2];
	int v4;
	int v6;
	int v8;
	int v10;

	L_c4063(0x25b2);
	B_8FF2_V112 = B_4CBE_V112;
	B_8FEC_V112 = B_8FF2_V112;
	B_8FF3_V112 = B_A04C;
	B_8FED_V112 = B_8FF3_V112;
	W_8FF4_V112 = W_8FF6_V112 = 1;
	W_8FEE_V112 = W_8FF4_V112;
	W_8FF0_V112 = W_94D6 + 1;
	v8 = W_94D6;
	v6 = v8;
	L_c9617(-0x7012, -0x7010, v6);
	far_d936c(0x25ca, -0x7014, 2, 1, 99, 8);
	far_d8827(1, 14);
	far_d936c(0x25d5, -0x7013, 2, 1, 99, 8);
	far_d8827(2, 0);
	far_d936c(0x25dc, -0x7012, 3, 1, 999, 0);
	far_d8827(2, 14);
	far_d936c(0x25e6, -0x7010, 3, 1, 999, 0);
	far_d8827(3, 0);
	L_de62c(0x25ee);
	far_d8827(4, 0);
	far_d936c(0x2604, -0x700e, 2, 1, 99, 8);
	far_d8827(4, 14);
	far_d936c(0x260f, -0x700d, 2, 1, 99, 8);
	far_d8827(5, 0);
	far_d936c(0x2616, -0x700a, 3, 1, 999, 0);
	far_d8827(5, 14);
	far_d936c(0x2620, -0x700c, 3, 1, 999, 0);
	far_d8827(5, 28);
	far_d916d(0x2629, 0x5c47, 0x259c, 7);
	far_d8827(6, 0);
	far_d8894(45, 40);
	far_d8827(7, 0);
	far_d885c(0x262f);
	for (; ; ) {
		if ((v4 = far_d981a(1)) != 0)
			break;
		switch (B_A61D) {
		case 0:
			v6 = L_d88fd(B_8FEC_V112);
		case 2:
		case 3:
			L_c9617(-0x7012, -0x7010, v6);
			far_da14f(2);
			far_da14f(3);
			break;
		case 4:
			v8 = L_d88fd(B_8FF2_V112);
		case 7:
			if (W_8FF4_V112 > v8 + 1) {
				W_8FF4_V112 = v8 + 1;
				far_da14f(7);
			}
			break;
		}
	}
	if (v4 == 120) {
		if ((W_8FF0_V112 - W_8FEE_V112) * W_8FF6_V112 > v8 - W_8FF4_V112 + 1) {
			far_d8850();
			far_de639(102, 1, 11);
			v4 = far_da610(1);
			if (v4 != 120)
				return v4;
			far_d8856();
		}
		far_d8827(7, 0);
		far_d885c(0x2639);
		if ((v10 = L_da7aa(B_5C47_V112)) < 0)
			far_de533(v10);
		v4 = B_53DB;
	}
	return v4;
}
