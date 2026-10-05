/* differs: +6 push di | push si */
extern char B_54FE;
extern char B_54FF;
extern char B_5500;
extern char B_94A6;
extern char B_981C;
extern unsigned char TBL_5516[];
extern char TBL_5517[];
extern char TBL_954C[];
extern char TBL_95B0[];
extern char TBL_9614[];
extern char TBL_98C2[];
extern char TBL_9926[];
extern char TBL_998A[];
extern long W_94A8;

far_f140b(a0, a1)
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;
	int v12;
	int v14;
	int v16;
	int v18;
	char v118[100];
	long v122;
	register int r1;

	v4 = 0;
	if (TBL_5517[a0 * 500 + (v4 << 1)] == 0)
		return -14;
	far_d55e8(&B_94A6);
	if (far_d602b(a1) == 0)
		far_e9d7e(a1);
	v2 = TBL_5516[a0 * 500 + (v4 << 1)];
	if ((v6 = far_f0ace(v2, a1)) != 0)
		return v6;
	v122 = W_94A8 + 202L;
	v8 = peekb(v122 + -1L);
	while (v8-- != 0) {
		if (peekb(v122) != 255)
			poke(v122, peekb(v122 + 1L));
		v122 += 24L;
	}
	far_d6444(&B_94A6);
	v18 = 0;
	do {
		r1 = v18;
		v118[r1] = v2;
		++v18;
	} while (v18 < 100);
	while (TBL_5517[a0 * 500 + (v4 << 1)] != 0) {
		v2 = TBL_5516[a0 * 500 + (v4 << 1)];
		++v4;
		far_d6a82(&B_981C, v2, 1);
		v10 = 0;
		do {
			if ((TBL_98C2[v10] & 2) != 0) {
				v12 = far_f212d(v2, v10);
				if (v12 != -5) {
					if ((TBL_954C[v12] & 2) == 0) {
						TBL_954C[v12] = TBL_98C2[v10];
						TBL_95B0[v12] = TBL_9926[v10];
						TBL_9614[v12] = TBL_998A[v10];
						r1 = v12;
						v118[r1] = v2;
					}
					else {
						v14 = TBL_954C[v12] & 4;
						if ((v16 = TBL_98C2[v10] & 4) != v14) {
							r1 = v12;
							B_54FE = v118[r1];
							B_54FF = v2;
							B_5500 = r1;
							far_d55e8(&B_981C);
							far_d55e8(&B_94A6);
							return -10;
						}
					}
				}
			}
			++v10;
		} while (v10 < 100);
	}
	far_d55e8(&B_981C);
	far_d55e8(&B_94A6);
	return 0;
}
