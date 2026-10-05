extern char B_A61D;
extern char B_BAE4_V112;
extern char B_BAE5_V112;
extern char TBL_5ED8_V112[];
extern char TBL_5EE1_V112[];

L_c9304()
{
	char v1;
	char v2;
	char v3;

	L_c4063(0x2d9e);
	far_d8827(2, 0);
	far_d916d(0x2dbd, -0x451c, 0xe49, 14);
	v2 = TBL_5ED8_V112[B_BAE4_V112];
	far_d916d(0x2dc9, &v2, 0xb08, 3);
	far_d8827(4, 0);
	far_d936c(0x2dd5, -0x451b, 3, 0, 127, 8);
	v3 = TBL_5EE1_V112[B_BAE5_V112];
	far_d916d(0x2de2, &v3, 0xb08, 3);
	for (; ; ) {
		if ((v1 = far_d981a(0)) != 0)
			break;
		switch (B_A61D) {
		case 0:
			v2 = TBL_5ED8_V112[B_BAE4_V112];
			far_da14f(1);
			break;
		case 1:
			TBL_5ED8_V112[B_BAE4_V112] = v2;
			break;
		case 2:
			v3 = TBL_5EE1_V112[B_BAE5_V112];
			far_da14f(3);
			break;
		case 3:
			TBL_5EE1_V112[B_BAE5_V112] = v3;
			break;
		}
	}
	return v1;
}
