/* differs: +12c bne $6 | jmp L_d2b59 */
extern char B_53DB;
extern char B_5C51_V112;
extern char B_A61D;
extern char STR_2A78[];
extern char STR_2A7E[];
extern char TBL_AE2C[];

L_d28e4()
{
	char z0[16];
	char v17;
	char v18;
	char v19;
	int v21;
	char z1;
	char v23;
	char z2;
	char v25;
	char z3;
	char v27;

	v21 = TBL_AE2C[B_5C51_V112];
	L_d2b61(v21, &v17, &v23, &v25, &v27);
	L_c4063(0x383f);
	far_d8827(2, 0);
	far_d916d(STR_2A78, 0x5c51, 0xcaf, 9);
	far_dfeec(TBL_AE2C[B_5C51_V112], &v17);
	far_d90a6(STR_2A7E, &v17, 16);
	far_d8827(3, 0);
	far_d936c(0x385d, &v23, 4, 0, 0x270f, 0);
	far_d936c(0x386a, &v25, 4, 0, 0x270f, 0);
	far_d8827(4, 0);
	far_d936c(0x3878, &v27, 4, 0, 0x270f, 0);
	far_d8827(7, 0);
	far_d885c(0x3885);
	v19 = 0;
	while (v19 == 0) {
		for (; ; ) {
			if ((v18 = far_d981a(2)) != 0)
				break;
			switch (B_A61D) {
			case 1:
				L_d633f(TBL_AE2C[B_5C51_V112], &v17);
				far_dfeec(TBL_AE2C[B_5C51_V112], &v17);
				far_da14f(1);
				break;
			case 2:
			case 3:
			case 4:
				L_d5ca8(v21, v23, v25, -1, v27);
			case 0:
				v21 = TBL_AE2C[B_5C51_V112];
				L_d2b61(v21, &v17, &v23, &v25, &v27);
				far_d8827(2, 24);
				far_da14f(1);
				far_da14f(2);
				far_da14f(3);
				far_da14f(4);
				break;
			}
		}
		switch (v18) {
		case 120:
			L_d3923(v21);
			break;
		case 121:
			far_df136(v21);
			v18 = B_53DB;
			v19 = 1;
			break;
		default:
			v19 = 1;
			break;
		}
	}
	return v18;
}
