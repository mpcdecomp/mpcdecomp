/* differs: +3a beq $6 | jz L_db9ef */
extern unsigned char TBL_6196_V112[];
extern unsigned char TBL_6197_V112[];
extern unsigned char TBL_88BA_V112[];

far_eb7fc(a0)
{
	int v2;
	int v4;
	int v6;
	int v8;

	v2 = 1;
	v4 = 0;
	for (; ; ) {
		if ((v6 = TBL_6197_V112[a0 * 500 + (v4 << 1)]) == 0)
			break;
		v8 = TBL_6196_V112[a0 * 500 + (v4 << 1)];
		if (TBL_88BA_V112[a0] - 1 == v4)
			break;
		v2 += L_d88fd(v8) * v6;
		++v4;
	}
	return v2;
}
