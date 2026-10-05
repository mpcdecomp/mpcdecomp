/* differs: +c beq $5 | jz br_eaf74 */
extern char B_52B5_V112;
extern char B_5759_V112;
extern unsigned char B_A06A;
extern char TBL_6197_V112[];
extern int W_52CC_V112;
extern int W_52CE_V112;
extern int W_575A_V112;
extern int W_94D0;
extern int W_94D2;
extern int W_94D6;

L_d97d2(a0, a1)
{
	int v2;

	if (B_5759_V112 != 0) {
		v2 = W_575A_V112;
		if (TBL_6197_V112[((B_A06A - 1 << 5) - (B_A06A - 1) << 2) + (B_A06A - 1) << 2] == 0)
			return ((B_A06A - 1 << 5) - (B_A06A - 1) << 2) + (B_A06A - 1) << 2;
	}
	else {
		v2 = W_94D6;
		if (B_52B5_V112 < 0)
			return;
	}
	if (a1 > v2)
		a0 = 256;
	if (a1 != W_52CE_V112)
		L_d7288(a1);
	if (a0 <= W_52CC_V112)
		L_d7288(a1);
	while (W_52CC_V112 != a0)
		far_eafec();
	far_d7994(W_94D0, W_94D2);
}
