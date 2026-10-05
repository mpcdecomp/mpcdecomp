/* differs: +9 beq $5 | jz br_eb1fc */
extern char B_52B5_V112;
extern char B_5759_V112;
extern char B_5B07_V112;
extern unsigned char B_A06A;
extern char TBL_6197_V112[];
extern int W_52CE_V112;
extern int W_94D0;
extern int W_94D2;

L_d81af()
{
	if (B_5759_V112 != 0) {
		if (TBL_6197_V112[((B_A06A - 1 << 5) - (B_A06A - 1) << 2) + (B_A06A - 1) << 2] == 0)
			return ((B_A06A - 1 << 5) - (B_A06A - 1) << 2) + (B_A06A - 1) << 2;
	}
	else if (B_52B5_V112 < 0)
		return;
	do {
		if (far_eafec() == 0)
			continue;
		if (B_5759_V112 != 0) {
			L_d7288(W_52CE_V112);
			continue;
		}
		B_5B07_V112 = 1;
	} while (B_5B07_V112 == 0);
	far_d7994(W_94D0, W_94D2);
}
