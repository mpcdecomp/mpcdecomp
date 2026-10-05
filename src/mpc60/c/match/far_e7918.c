extern char B_9D37;
extern char TBL_8E65;
extern char TBL_8E66[];

far_e7918()
{
	register int r1;

	for (; ; ) {
		r1 = far_03012(5, TBL_8E66, 0x63f);
		if (r1 == 0)
			break;
		TBL_8E65 = TBL_8E66[0];
		TBL_8E66[0] = B_9D37;
		far_f0694(&TBL_8E65, r1 + 1);
	}
	return;
}
