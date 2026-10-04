extern int TBL_PITCH_RATIO[1];

int __far __pascal sample_calc_offset(char far *p, int idx)
{
	long len;
	char c;
	long t;
	long q;

	if (p) {
		len = *(long far *)(p + 0x20);
		c = p[0x25];
		t = TBL_PITCH_RATIO[idx];
		if (len) {
			q = c * t * 0x193cL / len;
			if (q < 10000L) return (int)q;
		}
	}
	return 0;
}
