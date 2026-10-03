#include "mpc2k.h"

void __far __pascal note_range_calc_1(int pad)
{
	int n;
	int k;
	char __far *p;
	char c;

	k = PTR_TRACK_DATA[pad];
	if ((unsigned)(k - 0x23) <= 0x3f) {
		p = note_range_clamp(k) + 2;
		n = (*p + 2) / 3;
		if (n < 0x22) {
			*p = c = n * 3 + 1;
			note_clamp_multi(5, pad, c);
		}
	}
}
