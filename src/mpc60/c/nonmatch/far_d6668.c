/* differs: +a5 beq $11 | jz br_d675a */
extern char B_4CBE_V112;
extern char TBL_50CA_V112[];
extern long W_9B9A;

far_d6668(a0, a1, a2)
char a1;
char *a2;
{
	char z0[3];
	char v4;
	long v8;

	if (a0 < 0)
		return -6;
	if (a0 > 99)
		return -6;
	if (far_d602b(a0) != 0) {
		strcpy(a2, 0x3de6);
		return 1;
	}
	if (a1 < 0) {
		L_de8d2(W_9B9A + 7L, a2, far_daa7a(), 16);
		a2[16] = 0;
		return 0;
	}
	v8 = W_9B9A + 202L;
	v4 = peekb(v8 + -1L);
	while (v4-- != 0) {
		if (peekb(v8) == a1) {
			L_de8d2(v8 + 5L, a2, far_daa7a(), 16);
			a2[16] = 0;
			return 0;
		}
		v8 += 21L;
	}
	if (B_4CBE_V112 == a0 && (TBL_50CA_V112[a1] & 2) != 0) {
		far_d679a(a2, a1);
		return 0;
	}
	strcpy(a2, 0x3df7);
	return 1;
}
