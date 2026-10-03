#include "mpc2k.h"

void __far __pascal note_range_calc_4(int pad)
{
	int n;
	int k;
	char __far *p;

	k = PTR_TRACK_DATA[pad];
	if ((unsigned)(k - 0x23) <= 0x3f) {
		p = note_range_clamp(k) + 4;
		n = (*p + 2) / 3;
		if (n > 0) {
			if (--n) n = n * 3 - 2;
			note_clamp_multi(3, pad, *p = n);
		}
	}
}
