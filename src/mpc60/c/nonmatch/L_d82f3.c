/* differs: +20 cmp word ptr 6[bp],0 | push word ptr [bp + 6] */
extern char B_8DF9;
extern char B_8E03;
extern long TBL_8D8D[];
extern long W_8DF5;

L_d82f3(a0)
{
	if ((unsigned)a0 > B_8DF9)
		a0 = B_8DF9;
	far_d7b8c(0);
	if (a0 != 0) {
		far_d7cba();
		W_8DF5 = TBL_8D8D[a0 - 1];
	}
	far_d7b8c(0);
	B_8E03 = a0;
	return a0;
}
