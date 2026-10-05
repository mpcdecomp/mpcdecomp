extern unsigned char B_8E68;
extern unsigned char B_8E69;
extern char B_94A6;
extern char B_9D36;
extern unsigned char TBL_8E65;
extern char TBL_8E66[];
extern long W_94B8;
extern int W_94E0;

far_e79ab()
{
	long v4;
	int v6;
	int v8;

	far_cbdf5();
	v8 = 0;
	while (W_94E0 == 0) {
		v4 = W_94B8;
		v6 = far_03012(1, &TBL_8E65, 0x640);
		switch (TBL_8E65 & 248) {
		case 136:
			W_94E0 = far_da91e(TBL_8E66);
			continue;
		case 168:
			far_ed328(&B_94A6, B_8E68, B_8E69);
			far_f170e(&TBL_8E65, v6);
			continue;
		case 248:
			W_94B8 = v4;
			far_cb998(&TBL_8E65, v6, 0);
			return;
		case 240:
			if (far_d3ef5(&TBL_8E65) == 7) {
				if (v8 == 0 && TBL_8E66[0] == B_9D36) {
					far_cb998(&TBL_8E65, v6, 0);
					v8 = 1;
				}
				else
					far_f170e(&TBL_8E65, v6);
				continue;
			}
			break;
		}
		if (TBL_8E66[0] == B_9D36)
			far_cb998(&TBL_8E65, v6, 0);
		else
			far_f170e(&TBL_8E65, v6);
	}
}
