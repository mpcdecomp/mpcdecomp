/* differs: +4b shl word ptr -2[bp],1 | mov ax, word ptr [bp - 2] */
extern char B_903F_V112[];
extern long TBL_A66C[];
extern long TBL_A6CE_V112[];
extern long TBL_A6D6_V112[];

far_e0c61(a0)
{
	int v2;
	int v4;

	v2 = *(long *)((char *)TBL_A6D6_V112 + a0 * 59) - (*(long *)((char *)TBL_A6CE_V112 + a0 * 59) + *(long *)((char *)TBL_A66C + a0 * 59));
	v4 = (60 - v2 << 1) + 5;
	v2 = v2 << 1;
	while (v2-- > 0)
		B_903F_V112[v4++] = 0;
	return;
}
