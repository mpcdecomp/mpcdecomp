/* differs: +17 beq $7 | jz br_d53ae */
extern char B_52B5_V112;
extern char B_5759_V112;
extern char B_94A7;
extern unsigned char B_A06A;
extern char TBL_6197_V112[];
extern char TBL_88A5_V112[];
extern int W_52CE_V112;
extern int W_575A_V112;
extern long W_94CC;
extern int W_94D6;

far_d5373(a0)
long a0;
{
	int v2;
	char z0;
	char v4;

	if (B_52B5_V112 < 0)
		return;
	if (B_5759_V112 != 0 && TBL_6197_V112[((B_A06A - 1 << 5) - (B_A06A - 1) << 2) + (B_A06A - 1) << 2] == 0)
		return ((B_A06A - 1 << 5) - (B_A06A - 1) << 2) + (B_A06A - 1) << 2;
	far_d3f44(a0, &v4);
	W_52CE_V112 = 0;
	L_d97d2(v4, v2);
	if (B_5759_V112 != 0) {
		if (W_52CE_V112 > W_575A_V112 && TBL_88A5_V112[B_A06A] != 0)
			L_d7288(1);
	}
	else if (W_52CE_V112 > W_94D6 && (B_94A7 & 1) != 0)
		L_d7288(1);
	W_94CC = a0;
	far_d447f(a0, 0x601a);
	L_e1dd3(0);
}
