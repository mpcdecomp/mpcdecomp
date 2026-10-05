/* differs: +c bne $5 | jnz br_ede27 */
extern char B_94A6;
extern char B_94DD;
extern long W_94B4;
extern long W_94B8;
extern long W_94BC;
extern long W_94DC;
extern int W_94DE;
extern int W_94E0;
extern int W_A059;

far_eddc3()
{
	long v4;

	if (B_94A6 == 2) {
		W_94B8 = W_94B4;
		W_94B4 = W_94BC;
		B_94A6 = 0;
		v4 = W_94DC;
		W_94DE = 1;
		B_94DD = 1;
		W_94DC = 0;
		W_94E0 = W_A059 = 0;
		far_ec4ae(v4);
	}
	return;
}
