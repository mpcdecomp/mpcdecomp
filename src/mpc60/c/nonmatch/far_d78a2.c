/* differs: +38 beq $5 | jz br_d78ee */
extern char B_53CB;
extern char B_8BDD;
extern char B_8CDA;
extern int W_5509;
extern long W_94CC;

far_d78a2()
{
	long v4;
	int v6;

	v4 = W_94CC / 24L;
	v6 = W_94CC % 24L;
	if (v6 != 0) {
		v4 += 1L;
		B_53CB = ((unsigned)(v6 - 1) >> 2) + -5;
	}
	if ((long)W_5509 != v4) {
		W_5509 = v4;
		B_8CDA |= 32;
		B_8BDD = 1;
	}
	return;
}
