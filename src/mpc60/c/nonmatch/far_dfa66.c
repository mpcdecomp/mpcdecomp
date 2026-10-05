/* differs: +66 mov ax,word ptr TBL_A67A_ [bx] | mov ax, word ptr [bp + 6] */
extern long TBL_A66C[];
extern int TBL_A678[];
extern int TBL_A67A[];

far_dfa66(a0)
{
	int v2;
	int v4;

	if ((unsigned)a0 >= 34)
		return;
	v4 = *(long *)((char *)TBL_A66C + a0 * 59) / 40L;
	if (*(int *)((char *)TBL_A67A + a0 * 59) > v4)
		*(int *)((char *)TBL_A67A + a0 * 59) = v4;
	if (v4 > 10)
		v4 = 10;
	v2 = *(int *)((char *)TBL_A67A + a0 * 59) - v4;
	if (*(int *)((char *)TBL_A678 + a0 * 59) > v2)
		*(int *)((char *)TBL_A678 + a0 * 59) = v2;
}
