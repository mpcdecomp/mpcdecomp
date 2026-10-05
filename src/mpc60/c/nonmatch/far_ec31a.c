/* differs: +e bne $6 | jmp br_ec444 */
extern unsigned char B_8E67;
extern unsigned char B_8E68;
extern unsigned char B_8E69;
extern char B_8E6A;
extern char B_94A6;
extern char B_9D37;
extern char B_A063;
extern char TBL_7E6C[];
extern int TBL_7EEC[];
extern char TBL_7FEC[];
extern int TBL_806C[];
extern unsigned char TBL_8E65;
extern char TBL_8E66[];
extern long W_94B8;
extern int W_94E0;

far_ec31a()
{
	long v4;
	int v6;
	int v8;

	while (W_94E0 == 0) {
		v4 = W_94B8;
		v6 = far_03012(1, &TBL_8E65, 0x640);
		switch (TBL_8E65 & 248) {
		case 136:
			W_94E0 = far_da91e(TBL_8E66);
			continue;
		case 168:
			far_ed328(&B_94A6, B_8E68, B_8E69);
			far_05a01(&B_94A6, &TBL_8E65, v6);
			continue;
		case 152:
			if (TBL_8E66[0] != B_9D37) {
				far_05a01(&B_94A6, &TBL_8E65, v6);
				break;
			}
			v8 = B_8E67;
			TBL_7E6C[v8] = B_8E68;
			TBL_7EEC[v8] = 0;
			TBL_7FEC[v8] = B_8E69;
			TBL_806C[v8] = far_da91e(&B_8E6A);
			B_A063 = 1;
			break;
		case 248:
			W_94B8 = v4;
			return 1;
		default:
			far_05a01(&B_94A6, &TBL_8E65, v6);
			continue;
		}
	}
	return 0;
}
