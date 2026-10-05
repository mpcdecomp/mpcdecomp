/* differs: +c beq $5 | jz br_eb1fc */
extern char B_94A6;
extern char B_A067;
extern unsigned char B_A06A;
extern char B_A06E;
extern char TBL_5517[];
extern int W_94D0;
extern int W_94D2;
extern int W_94DE;
extern int W_94E0;

far_eb1c8()
{
	unsigned char v1;
	unsigned char v2;
	char z0[2];
	unsigned char v5;

	if (B_A06E != 0) {
		if (TBL_5517[((B_A06A - 1 << 5) - (B_A06A - 1) << 2) + (B_A06A - 1) << 2] == 0)
			return ((B_A06A - 1 << 5) - (B_A06A - 1) << 2) + (B_A06A - 1) << 2;
	}
	else if (B_94A6 < 0)
		return;
	do {
		if (far_eafec(&B_94A6) == 0)
			continue;
		if (B_A06E != 0) {
			far_e8cd3(&B_94A6, W_94DE);
			continue;
		}
		B_A067 = 1;
	} while (B_A067 == 0);
	if (W_94E0 == 0) {
		far_031ea(&B_94A6, &v5, 5);
		if (v5 == 168)
			far_ed328(&B_94A6, v2, v1);
	}
	far_d7994(W_94D0, W_94D2);
}
