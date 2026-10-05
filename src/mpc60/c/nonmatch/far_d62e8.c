/* differs: +23 bne $5 | jmp near br_d63bd */
extern char B_5017;
extern char B_5018;
extern char B_94A6[];
extern char B_981C[];
extern char B_9D36;
extern char B_A04C;
extern char B_A06E;
extern char TBL_94E8[];
extern char TBL_985E[];

far_d62e8(a0)
char *a0;
{
	char v100[100];
	char z0[2];
	int v104;
	int v106;
	char v206[100];
	register char *r1;

	setmem(v100, 100, 0);
	if (B_A06E == 0) {
		if (a0 == B_94A6) {
			v104 = 0;
			do {
				if ((a0 + v104)[66] != -1) {
					r1 = (a0 + v104)[66];
					*(v100 + r1) = 1;
				}
				++v104;
			} while (v104 <= 99);
			v106 = 0;
			do {
				r1 = v106;
				if (*(v100 + r1) == 0) {
					r1 += a0;
					r1[166] = B_5017;
					(v106 + a0)[266] = B_5018;
					(v106 + a0)[366] = -1;
					(v106 + a0)[466] = 100;
				}
				++v106;
			} while (v106 <= 99);
			v106 = 0;
			v104 = 0;
			do {
				if ((a0 + v104)[66] == -1) {
					for (; ; ) {
						r1 = v106;
						if (*(v100 + r1) == 0)
							break;
						++v106;
					}
					(a0 + v104)[66] = v106;
					++v106;
				}
				++v104;
			} while (v104 <= 99);
		}
	}
	if (a0 == B_94A6) {
		B_A04C = peekb(*(long *)(a0 + 2) + 199L);
		B_9D36 = TBL_94E8[B_A04C];
	}
	if (a0 == B_981C) {
		v104 = 0;
		do {
			if (TBL_985E[v104] == -1) {
				r1 = v104;
				*(v206 + r1) = v104;
			}
			else {
				r1 = TBL_985E[v104];
				*(v206 + r1) = v104;
			}
			++v104;
		} while (v104 < 99);
		v104 = 0;
		do {
			r1 = v104;
			*(TBL_985E + r1) = *(v206 + r1);
			++v104;
		} while (v104 < 99);
	}
	return;
}
