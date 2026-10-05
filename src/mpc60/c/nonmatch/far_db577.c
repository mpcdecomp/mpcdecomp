/* differs: +24 mov word ptr TBL_A672_ [bx],0 | mov ax, word ptr [bp - 2] */
extern int TBL_A670[];
extern int TBL_A672[];
extern char TBL_A682[];
extern char TBL_A683[];
extern int TBL_A686[];
extern int TBL_A688[];

far_db577()
{
	int v2;

	v2 = 0;
	do {
		*(int *)((char *)TBL_A670 + v2 * 59) = 0;
		*(int *)((char *)TBL_A672 + v2 * 59) = 0;
		TBL_A682[v2 * 59] = 100;
		*(int *)((char *)TBL_A686 + v2 * 59) = 0;
		*(int *)((char *)TBL_A688 + v2 * 59) = 0;
		TBL_A683[v2 * 59] = 100;
		v2++;
	} while (v2 < 34);
	return;
}
