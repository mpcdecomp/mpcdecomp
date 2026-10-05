/* differs: +41 add word ptr 12[bp],-1 | mov dx, word ptr [bp + 0eh] */
extern char B_7E5E;
extern char B_8C07;
extern char B_94A6;
extern char B_9D37;
extern char B_A064;
extern int W_A059;
extern int W_A05B;
extern int W_A05D;
extern int W_A05F;
extern int W_A061;

far_ec252(a0, a1, a2, a3)
long a3;
{
	int v2;
	int v4;
	int v6;

	v4 = B_9D37;
	v2 = B_8C07;
	v6 = B_7E5E;
	B_9D37 = a0;
	B_8C07 = far_d65f7(a0);
	far_eaf33(&B_94A6, a1, a2);
	for (; ; ) {
		a3 += -1L;
		if (a3 == 0 || far_ec31a() != 0)
			break;
		if (W_A05D == 0 || W_A05D == W_A061) {
			W_A05B = W_A059;
			W_A059 = 0;
			B_A064 = 1;
		}
		if (W_A05F == 0) {
			B_7E5E = 1;
			far_04d5e();
		}
		if (B_A064 == 2)
			far_04fa0();
		far_f0ee4(&B_94A6);
	}
	B_7E5E = 1;
	far_04d5e();
	B_9D37 = v4;
	B_8C07 = v2;
	B_7E5E = v6;
	return;
}
