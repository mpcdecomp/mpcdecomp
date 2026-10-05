/* differs: +12 bne $6 | jmp br_c1d48 */
extern char B_53DC;
extern unsigned char B_5512;
extern unsigned char B_5514;
extern char STR_1A38[];
extern char STR_1A87[];
extern char STR_1AA9[];
extern char STR_1ACD[];
extern char STR_1ADD[];
extern char STR_1AE7[];
extern char STR_1B0B[];
extern char STR_1B31[];
extern char STR_1B3B[];
extern int W_9B92;
extern int W_9B94;
extern int W_9B96;
extern int W_9B98;
long far_daa02();
long far_daa54();

far_c1a13()
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;
	long v14;
	long v18;
	char z0[26];
	char v45;

	v2 = 0;
	while (v2 == 0) {
		far_c1f4e(0x16c6);
		far_d8827(1, 0);
		far_d885c(STR_1A38);
		far_d8827(2, 0);
		far_d885c(0x16fb);
		far_d8827(6, 0);
		far_d8894(61, 40);
		far_d8827(7, 0);
		far_d885c(STR_1A87);
		v2 = far_d981a(1);
		if (v2 == 120) {
			v18 = far_daa02(W_9B92, W_9B94, W_9B96, W_9B98);
			v6 = v18 / 512L;
			B_5514 = v10 = 0;
			v14 = far_daa54(W_9B96, W_9B98);
			B_5512 = v8 = 80;
			while (v8 != 0) {
				far_c1f4e(0x1731);
				far_d8827(1, 0);
				far_d885c(STR_1AA9);
				far_d8827(2, 0);
				far_d885c(STR_1ACD);
				far_d8827(7, 0);
				far_d885c(STR_1ADD);
				B_53DC = 81;
				far_d8719();
				v2 = far_d981a(1);
				if (v2 != 120)
					break;
				v2 = 0;
				far_d8827(7, 0);
				far_d885c(STR_1AE7);
				far_d7b8c(0);
				v4 = far_d7b8c(9, 0xf95, &v45);
				if ((v4 & -256) == -256) {
					far_de533(v4);
					break;
				}
				if ((v4 = far_d7cd1(v14, v6, v10)) != 0) {
					far_de533(v4);
					break;
				}
				far_d8827(1, 0);
				far_d885c(STR_1B0B);
				far_d8827(7, 0);
				far_d88b2(40);
				far_d8827(7, 0);
				far_d885c(STR_1B31);
				B_53DC = 82;
				far_d8719();
				v2 = far_d981a(1);
				if (v2 != 120)
					break;
				v2 = 0;
				far_d8827(7, 0);
				far_d885c(STR_1B3B);
				far_d7b8c(0);
				v4 = far_d7b8c(9, 0xf95, &v45);
				if ((v4 & -256) == -256) {
					far_de533(v4);
					break;
				}
				if ((v4 = far_d7dad(v14, v10)) != 0) {
					far_de533(v4);
					break;
				}
				v10 = B_5514;
				v8 -= B_5512;
				if (v8 < B_5512)
					B_5512 = v8;
			}
			far_d4b6e();
		}
	}
	return v2;
}
