/* differs: +c beq $5 | jz br_eaf74 */
extern char B_94A6[];
extern unsigned char B_A06A;
extern char B_A06E;
extern char TBL_5517[];
extern int W_A06F;

far_eaf33(a0, a1, a2)
char *a0;
{
	int v2;

	if (B_A06E != 0 && a0 == B_94A6) {
		v2 = W_A06F;
		if (TBL_5517[((B_A06A - 1 << 5) - (B_A06A - 1) << 2) + (B_A06A - 1) << 2] == 0)
			return ((B_A06A - 1 << 5) - (B_A06A - 1) << 2) + (B_A06A - 1) << 2;
	}
	else {
		v2 = *(int *)(a0 + 48);
		if (*a0 < 0)
			return;
	}
	if (a2 > v2)
		a1 = 256;
	if (*(int *)(a0 + 56) != a2)
		far_e8cd3(a0, a2);
	if (a1 <= *(int *)(a0 + 54))
		far_e8cd3(a0, a2);
	while (*(int *)(a0 + 54) != a1)
		far_eafec(a0);
	if (a0 == B_94A6)
		far_d7994(*(int *)(a0 + 42), *(int *)(a0 + 44));
}
