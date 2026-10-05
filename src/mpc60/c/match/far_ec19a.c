extern char B_8CCB;
extern char B_94A6;
extern char B_981C;
extern char B_9D34;
extern char TBL_954C[];
extern int W_8D4E;
extern int W_8D50;
long far_ed6eb();

far_ec19a(a0)
{
	long v4;

	far_d55e8(&B_981C);
	v4 = far_ed6eb();
	++B_8CCB;
	far_d6a82(&B_94A6, B_9D34, 0);
	if (B_94A6 < 0) {
		--B_8CCB;
		return;
	}
	if (a0 != 0)
		far_ec252(a0, W_8D4E, W_8D50, v4);
	else {
		a0 = 1;
		do {
			if ((TBL_954C[a0] & 2) == 2)
				far_ec252(a0, W_8D4E, W_8D50, v4);
			++a0;
		} while (a0 <= 99);
	}
	far_d4855(B_9D34, 1);
	--B_8CCB;
	far_d4c91();
}
