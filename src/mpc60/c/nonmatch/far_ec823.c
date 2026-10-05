/* differs: +3f beq $6 | jz br_ec886 */
extern unsigned char TBL_6196_V112[];
extern unsigned char TBL_6197_V112[];

far_ec823(a0)
{
	int v2;
	int v4;
	long v8;

	v8 = 0L;
	v2 = 0;
	do {
		if ((v4 = TBL_6197_V112[a0 * 500 + (v2 << 1)]) == 0)
			break;
		v8 += (long)(L_d88fd(TBL_6196_V112[a0 * 500 + (v2 << 1)]) * v4);
		++v2;
	} while (v2 < 250);
	if ((unsigned)v8 > 0x7fff)
		return 0x7fff;
	return v8;
}
