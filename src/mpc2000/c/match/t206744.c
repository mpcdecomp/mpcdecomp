#include "mpc2k.h"

void __far __pascal note_range_calc_2(int pad)
{
	int n;
	int k;
	char __far *p;

	k = PTR_TRACK_DATA[pad];
	if ((unsigned)(k - PGM_NOTE_BASE) <= PGM_NOTE_COUNT - 1) {
		p = note_range_clamp(k) + 2;
		n = (*p + 2) / 3;
		if (n > 0) {
			if (--n) n = n * 3 - 2;
			note_clamp_multi(5, pad, *p = n);
		}
	}
}
