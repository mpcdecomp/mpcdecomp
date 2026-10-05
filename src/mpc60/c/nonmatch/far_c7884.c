/* differs: +12 bne $6 | jmp br_c7c37 */
extern char B_5218;
extern char B_53DC;
extern char B_A61D;
extern char STR_2B18[];
extern char STR_2B2E[];
extern char STR_2B34[];
extern char STR_2B3F[];
extern char STR_2B48[];
extern char STR_2B56[];
extern char STR_2B67[];
extern char STR_2B7F[];
extern char STR_2B91[];
extern char STR_2BA1[];
extern char TBL_0CF1[];
extern int TBL_A67C[];
extern int TBL_A67E[];
extern char TBL_A683[];
extern int TBL_A686[];
extern int TBL_A688[];
extern char TBL_AE2C[];

far_c7884()
{
	char z0[16];
	char v17;
	int v19;
	int v21;
	int v23;
	char z1;
	char v25;
	char z2;
	char v27;
	char z3;
	char v29;
	char z4;
	char v31;
	char z5;
	char v33;

	v19 = 0;
	while (v19 == 0) {
		far_d97f5();
		v23 = TBL_AE2C[B_5218];
		far_c7cd8(v23, &v27, &v25, &v29, &v31, &v33);
		far_c1f4e(STR_2B18);
		far_d8827(1, 0);
		far_d916d(STR_2B2E, &B_5218, TBL_0CF1, 9);
		far_dfeec(v23, &v17);
		far_d90a6(STR_2B34, &v17, 16);
		far_d8827(2, 0);
		far_da730(STR_2B3F);
		far_d8827(3, 0);
		far_d936c(STR_2B48, &v27, 4, 0, 0x270f, 0);
		far_d936c(STR_2B56, &v25, 4, 0, 0x270f, 0);
		far_d8827(4, 0);
		far_da730(STR_2B67);
		far_d8827(5, 0);
		far_d936c(0x2800, &v29, 3, 0, 999, 0);
		far_d936c(STR_2B7F, &v31, 3, 0, 999, 0);
		far_d8827(6, 0);
		far_d936c(STR_2B91, &v33, 3, 0, 100, 0);
		far_d8827(7, 0);
		far_d885c(STR_2BA1);
		B_53DC = 20;
		for (; ; ) {
			if ((v19 = far_d981a(4)) != 0)
				break;
			switch (B_A61D) {
			case 1:
				v21 = far_dff9c(v23, &v17);
				if (v21 == -1) {
					far_d8850();
					far_de533(-v21);
					far_d8856();
				}
				else if (v23 >= 0)
					far_d49f3(v23, 1);
				far_dfeec(v23, &v17);
				far_da14f(1);
				break;
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
				if (v23 >= 0) {
					*(int *)((char *)TBL_A67C + v23 * 59) = v27;
					*(int *)((char *)TBL_A67E + v23 * 59) = v25;
					*(int *)((char *)TBL_A688 + v23 * 59) = v29;
					*(int *)((char *)TBL_A686 + v23 * 59) = v31;
					TBL_A683[v23 * 59] = v33;
					far_dfaf7(v23);
					far_d49f3(v23, 1);
				}
			case 0:
				v23 = TBL_AE2C[B_5218];
				far_c7cd8(v23, &v27, &v25, &v29, &v31, &v33);
				far_dfeec(v23, &v17);
				far_da14f(1);
				far_da14f(2);
				far_da14f(3);
				far_da14f(4);
				far_da14f(5);
				far_da14f(6);
				break;
			}
		}
		switch (v19) {
		case 120:
		case 121:
		case 122:
			if (v23 == -1)
				break;
			v19 = far_c7f34(v19, &v17);
			break;
		}
	}
	return v19;
}
