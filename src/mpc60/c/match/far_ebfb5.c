extern char B_9D36;
extern unsigned char TBL_8E65;
extern char TBL_8E66[];
extern long W_982E;
extern int W_9856;

far_ebfb5()
{
	long v4;
	int v6;

	while (W_9856 == 0) {
		v4 = W_982E;
		v6 = far_03012(3, &TBL_8E65, 0x640);
		switch (TBL_8E65 & 248) {
		case 136:
			W_9856 = far_da91e(TBL_8E66);
			continue;
		case 168:
			continue;
		case 248:
			W_982E = v4;
			return;
		}
		if (TBL_8E66[0] == B_9D36)
			far_cb998(&TBL_8E65, v6, 1);
	}
}
