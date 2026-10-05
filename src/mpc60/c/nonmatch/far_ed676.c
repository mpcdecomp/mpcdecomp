/* differs: +3 push di | push si */
extern unsigned char B_8E67;
extern unsigned char TBL_8E66;

far_ed676(a0)
char *a0;
{
	register int r1;

	if (far_d65f7(TBL_8E66) != 0) {
		if (B_8E67 >= 32)
			return 1;
		r1 = B_8E67;
		return a0[r1];
	}
	if (B_8E67 >= *a0 && B_8E67 <= a0[1])
		return 1;
	return 0;
}
