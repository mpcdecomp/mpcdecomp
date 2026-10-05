/* differs: +1bd bne $6 | jmp br_e281b */
extern char B_4CBE_V112;
extern char B_53DB;
extern char B_6182_V112;
extern char B_6183_V112;
extern char B_6184_V112;
extern char B_8FEC_V112;
extern char B_8FF2_V112;
extern char B_A61D;
extern int W_8FEE_V112;
extern int W_8FF0_V112;
extern int W_8FF4_V112;
extern int W_8FF6_V112;
extern int W_94D6;

far_e2591()
{
	int v2;
	int v4;
	int v6;
	int v8;

	L_c4063(0x24f9);
	B_8FF2_V112 = B_4CBE_V112;
	B_8FEC_V112 = B_8FF2_V112;
	W_8FEE_V112 = W_8FF6_V112 = 1;
	W_8FF4_V112 = W_94D6 + 1;
	W_8FF0_V112 = W_8FF4_V112;
	v8 = W_94D6;
	v6 = v8;
	L_c9617(-0x7012, -0x7010, v6);
	far_d936c(0x250e, -0x7014, 2, 1, 99, 8);
	far_d8827(2, 0);
	far_d936c(0x2519, -0x7012, 3, 1, 999, 0);
	far_d8827(2, 14);
	far_d936c(0x2523, -0x7010, 3, 1, 999, 0);
	far_d8827(3, 0);
	L_de62c(0x252b);
	far_d8827(4, 0);
	far_d936c(0x253e, -0x700e, 2, 1, 99, 8);
	far_d8827(5, 0);
	far_d936c(0x2549, -0x700a, 3, 1, 999, 0);
	far_d8827(5, 14);
	far_d936c(0x2553, -0x700c, 3, 1, 999, 0);
	far_d8827(6, 0);
	far_d8894(45, 40);
	far_d8827(7, 0);
	far_d885c(0x2566);
	for (; ; ) {
		if ((v2 = far_d981a(1)) != 0)
			break;
		switch (B_A61D) {
		case 0:
			v6 = L_d88fd(B_8FEC_V112);
		case 1:
		case 2:
			L_c9617(-0x7012, -0x7010, v6);
			far_da14f(1);
			far_da14f(2);
			break;
		case 3:
			v8 = L_d88fd(B_8FF2_V112);
			if (W_8FF4_V112 > v8 + 1) {
				W_8FF4_V112 = v8 + 1;
				far_da14f(5);
			}
			break;
		case 4:
			far_e2fd8(-0x700a, W_8FEE_V112, W_8FF0_V112, v6);
		case 5:
			if (W_8FF4_V112 > v8 + 1) {
				W_8FF4_V112 = v8 + 1;
				far_da14f(5);
			}
			break;
		}
	}
	if (v2 == 120) {
		far_d8827(7, 0);
		far_d885c(0x2570);
		if ((v4 = far_e90d9()) < 0) {
			if (v4 == -10) {
				far_d8810(0);
				far_de639(102, 3, 32);
				far_d8827(4, 6);
				far_d88e6(0x2581, B_6184_V112);
				far_d8827(5, 0);
				far_d88e6(0x2586, B_6182_V112, B_6183_V112);
				far_d8827(7, 0);
				far_d885c(0x2594);
				while (far_d861e() != 120)
					;
				far_d8810(3);
			}
			else
				far_de533(v4);
		}
		v2 = B_53DB;
	}
	return v2;
}
