extern unsigned char TBL_8E65;
extern unsigned char TBL_8E66[];
extern char TBL_985E[];

far_eccd5(a0)
{
	int v2;
	char *v4;

	v4 = TBL_8E66;
	while (1) {
		v2 = far_03012(3, &TBL_8E65, 0x640);
		switch (TBL_8E65 & 248) {
		case 248:
			return a0;
		case 168:
			*(int *)v4 = far_da949(a0++);
			break;
		case 136:
			break;
		case 184:
			break;
		default:
			TBL_8E66[0] = TBL_985E[TBL_8E66[0]];
			break;
		}
		far_05303(1, &TBL_8E65, v2);
	}
}
