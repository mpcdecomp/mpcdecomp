extern char B_8CCB;
extern char B_94A7;
extern unsigned char TBL_8E65;
extern char TBL_8E66[];
extern long W_94B8;

far_f113e(a0)
{
	long v4;
	int v6;
	char *v8;

	++B_8CCB;
	B_94A7 &= -3;
	while (1) {
		v4 = W_94B8;
		v6 = far_03012(1, &TBL_8E65, 0x640);
		if (TBL_8E65 == 255) {
			W_94B8 = v4;
			--B_8CCB;
			break;
		}
		if ((TBL_8E65 & 248) == 168) {
			v8 = TBL_8E66;
			*(int *)v8 = far_da949(a0++);
		}
		far_05303(1, &TBL_8E65, v6);
	}
	return;
}
