extern char TBL_8E65;
extern unsigned char TBL_8E66;

far_e7de1()
{
	register int r1;
	register int r2;

	r2 = 6;
	do {
		for (; ; ) {
			r1 = far_03012(r2, &TBL_8E66, 0x63f);
			if (r1 == 0)
				break;
			TBL_8E65 = TBL_8E66 & 240;
			++r1;
			far_e7e9c(&TBL_8E65, r1);
		}
		++r2;
	} while (r2 <= 7);
	return;
}
