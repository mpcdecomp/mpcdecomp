/* differs: +10 shl al,1 | cbw */
extern char TBL_A68F[];

far_dfe95(a0, a1)
char a1;
{
	if ((unsigned)a0 > 34)
		return;
	TBL_A68F[a0 * 59] = a1 << 1;
}
