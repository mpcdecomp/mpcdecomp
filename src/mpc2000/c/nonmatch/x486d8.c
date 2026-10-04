/* differs: XL v1.20 +C, 24 bytes */
extern char TBL_PITCH_RATIO[1];
void __far __pascal __aFFaldiv(long, char far *);

int __far far_486D8(long p0, int p2, int p3)
{
	char l4[4];
	long l8;

	l8 = p0;
	*(long *)l4 = (long)((int *)TBL_PITCH_RATIO)[p3] * p2 * 0x193cL;
	if (!l8) goto L_47DE4;
	if (l8 / 2L + *(long *)l4 < *(long *)l4) goto L_47DE4;
	__aFFaldiv(l8, l4);
	goto br_4874C;
L_47DE4:
	*(int *)l4 = 0x7fff;
	*(int *)(l4 + 2) = 0;
br_4874C:
	if (*(int *)(l4 + 2) > 0) goto br_48760;
	if (*(int *)(l4 + 2) < 0) goto br_4875B;
	if ((unsigned)*(int *)l4 >= 0x2710) goto br_48760;
br_4875B:
	return *(int *)l4;
br_48760:
	return 0;
}
