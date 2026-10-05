/* differs: +121 beq $10 | jmp br_ebf75 */
extern char B_8CCB;
extern char B_94A6;
extern char B_981C;
extern char B_9D36;
extern char TBL_94E8[];
extern char TBL_954C[];
extern char TBL_95B0[];
extern char TBL_9614[];
extern char TBL_98C2[];
extern char TBL_9926[];
extern char TBL_998A[];
extern int W_5510;
extern int W_94E0;
extern long W_982E;
extern int W_9856;
extern int W_A059;
long far_d6216();

far_ebd5e(a0)
int *a0;
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;
	int v12;
	long v16;
	long v20;
	long v24;
	char z0[1503];
	char v1528;

	far_d55e8(&B_981C);
	far_d6a82(&B_94A6, a0[1], 0);
	far_eaf33(&B_94A6, a0[6], a0[7]);
	far_d6a82(&B_981C, *a0, 1);
	far_eaf33(&B_981C, a0[3], a0[4]);
	v2 = far_f166b(*a0, a0[5]);
	v4 = TBL_94E8[a0[8]];
	if ((TBL_954C[v4] & 2) != 0) {
		if (((TBL_954C[v4] ^ TBL_98C2[v2]) & 4) != 0)
			return -10;
	}
	else {
		TBL_954C[v4] = TBL_98C2[v2];
		TBL_95B0[v4] = TBL_9926[v2];
		TBL_9614[v4] = TBL_998A[v2];
	}
	++B_8CCB;
	v24 = W_982E;
	v8 = W_9856;
	v6 = a0[9];
	W_5510 = &v1528;
	v10 = B_9D36;
	v20 = *(long *)((char *)a0 + 24);
	while (v6-- != 0) {
		if (v20 == 0L)
			break;
		W_982E = v24;
		W_9856 = v8;
		v16 = *(long *)((char *)a0 + 20);
		if (v16 > v20)
			v16 = v20;
		v20 -= v16;
		far_cbdf5();
		for (; ; ) {
			v16 += -1L;
			if (v16 == 0)
				break;
			v12 = 0;
			if (W_94E0 == 0) {
				B_9D36 = v4;
				if (a0[2] == 0)
					far_cbdf5();
				else
					v12 = 1;
			}
			if (W_9856 == 0) {
				B_9D36 = v2;
				far_ebfb5();
				v12 = 1;
			}
			if (v12 != 0) {
				if (far_d6216() < 0x5dcL) {
					--B_8CCB;
					return -3;
				}
				B_9D36 = v4;
				far_e7aef();
			}
			++W_A059;
			--W_94E0;
			--W_9856;
		}
	}
	B_9D36 = v10;
	W_A059 += W_94E0;
	far_03ec1(1);
	W_94E0 = 0;
	--B_8CCB;
	far_d55e8(&B_94A6);
	far_d55e8(&B_981C);
	return 0;
}
