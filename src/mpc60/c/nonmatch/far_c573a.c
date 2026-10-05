/* differs: +3a beq $8 | jz br_c579e */
extern char TBL_032B[];

far_c573a()
{
	int v2;
	int v4;
	char v5;
	unsigned char v6;

	far_c580e(10, 0);
	far_c580e(11, 0);
	v2 = 0;
	do {
		v6 = 0;
		if ((v5 = TBL_032B[v2]) != 0) {
			v4 = 0;
			do {
				v6 = v6 << 1;
				if ((v5 & 1) != 0)
					++v6;
				v5 = (unsigned)v5 >> 1;
				++v4;
			} while (v4 < 8);
		}
		far_c580e(12, v6);
		++v2;
	} while (v2 < 0x780);
	return;
}
