/* differs: +105 bne $6 | jmp near br_e3bb3 */
extern char B_53DC;
extern char B_5FEB_V112;
extern char B_A61D;
extern char B_BAD2_V112;
extern char B_BAD3_V112;
extern char TBL_5F61_V112[];
extern char TBL_5F6A_V112[];

far_e3a15()
{
	char v1;
	char v2;
	char v3;

	L_c4063(0x28ce);
	B_53DC = 1;
	far_d916d(0x28e0, 0x5feb, 0xeb7, 14);
	far_d916d(0x28f7, 0x5fec, 0xb08, 3);
	far_d8827(4, 0);
	far_d885c(0x291c);
	far_d916d(0x2945, -0x452d, 0xe49, 14);
	v2 = TBL_5F61_V112[B_BAD3_V112];
	far_d916d(0x2951, &v2, 0xb08, 3);
	far_d8827(6, 0);
	far_d936c(0x295d, -0x452e, 3, 0, 127, 8);
	v3 = TBL_5F6A_V112[B_BAD2_V112];
	far_d916d(0x296a, &v3, 0xb08, 3);
	for (; ; ) {
		if ((v1 = far_d981a(0)) != 0)
			break;
		switch (B_A61D) {
		case 0:
			if (B_5FEB_V112 == 0) {
				B_5FEB_V112 = 1;
				far_da14f(0);
			}
			break;
		case 2:
			v2 = TBL_5F61_V112[B_BAD3_V112];
			far_da14f(3);
			break;
		case 3:
			TBL_5F61_V112[B_BAD3_V112] = v2;
			break;
		case 4:
			v3 = TBL_5F6A_V112[B_BAD2_V112];
			far_da14f(5);
			break;
		case 5:
			TBL_5F6A_V112[B_BAD2_V112] = v3;
			break;
		}
	}
	return v1;
}
