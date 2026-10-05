/* differs: +2d jmp $6 | mov ax, word ptr [bx + TBL_A66C] */
extern char TBL_A656[];
extern long TBL_A66C[];

far_df0f4(a0)
{
	if ((unsigned)a0 >= 34)
		return 0;
	if (TBL_A656[a0 * 59] == 0)
		return 0;
}
