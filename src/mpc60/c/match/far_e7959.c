extern char B_94A6;
extern long W_94B8;
extern int W_94E0;

far_e7959()
{
	long v4;
	int v6;

	if (B_94A6 == 0) {
		B_94A6 = 1;
		v4 = W_94B8;
		v6 = W_94E0;
		far_04596(&B_94A6);
		far_05248();
		W_94E0 = v6;
		W_94B8 = v4;
		B_94A6 = 0;
	}
	return;
}
