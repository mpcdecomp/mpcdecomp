/* differs: +6 push di | push si */
extern char TBL_7C4E[];

far_ece81(a0, a1)
{
	int v2;
	register char *r1;

	v2 = 0;
	do {
		r1 = a1;
		if (*(v2 + r1) == 0)
			break;
		r1[16] = 0;
		v2++;
	} while (v2 < 16);
	strcpy(a0 * 17 + TBL_7C4E, a1);
	return;
}
