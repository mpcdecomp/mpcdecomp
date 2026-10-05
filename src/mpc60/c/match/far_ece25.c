extern char TBL_5517[];
extern char TBL_7C4E[];

far_ece25(a0, a1)
{
	int v2;

	v2 = 0x4a52;
	if (TBL_5517[a0 * 500] == 0) {
		strcpy(a1, v2);
		return 0;
	}
	strcpy(a1, a0 * 17 + TBL_7C4E);
	return 1;
}
