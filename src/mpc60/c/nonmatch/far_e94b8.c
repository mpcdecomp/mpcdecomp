/* differs: +85 beq $9 | jz br_e9595 */
extern char B_6182_V112;
extern char B_6183_V112;
extern char B_6184_V112;
extern char B_8FEC_V112;
extern char B_8FF2_V112;
extern char TBL_5066_V112[];
extern char TBL_50CA_V112[];
extern int TBL_512E_V112[];
extern char TBL_547E_V112[];
extern int TBL_54E2_V112[];
extern long W_9B9A;

far_e94b8()
{
	int v2;
	int v4;
	int v6;
	int v8;
	int v10;
	int v12;
	char z0[2];
	int v16;
	long v20;
	char v121[101];
	register int r1;
	register int r2;

	if (far_d602b(B_8FF2_V112) != 0) {
		if ((v4 = far_eb96c(B_8FF2_V112)) != 0)
			return v4;
	}
	L_d8414();
	setmem(v121, 101, 0);
	far_d602b(0);
	v20 = W_9B9A + 202L;
	v2 = peekb(v20 + -1L);
	while (v2-- != 0) {
		if ((v6 = peekb(v20)) != 255) {
			v16 = peekb(v20 + 1L);
			r1 = v16;
			v121[r1] = v6;
		}
		v20 += 21L;
	}
	far_d6a82(B_8FF2_V112, 0);
	far_eddc3(0);
	v16 = 1;
	do {
		r1 = v16;
		if ((v6 = v121[r1]) != 0) {
			v8 = TBL_5066_V112[r1];
			if ((TBL_50CA_V112[v8] & 2) == 0) {
				r2 = v6;
				TBL_50CA_V112[v8] = TBL_547E_V112[r2];
				TBL_512E_V112[v8] = TBL_54E2_V112[v6];
			}
			else {
				v10 = TBL_50CA_V112[v8] & 4;
				if ((v12 = TBL_547E_V112[v6] & 4) != v10) {
					B_6182_V112 = B_8FEC_V112;
					B_6183_V112 = B_8FF2_V112;
					B_6184_V112 = v16;
					L_d8414();
					L_e5326();
					return -10;
				}
			}
		}
		++v16;
	} while (v16 != 100);
	L_d8414();
	L_e5326();
	return 0;
}
