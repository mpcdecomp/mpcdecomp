#include "mpc2k.h"

void __far __pascal note_range_calc_1(int pad)
{
	int n;
	int k;
	char __far *p;
	char c;

	k = PTR_TRACK_DATA[pad];
	if ((unsigned)(k - PGM_NOTE_BASE) <= PGM_NOTE_COUNT - 1) {
		p = note_range_clamp(k) + 2;
		n = (*p + 2) / 3;
		if (n < 0x22) {
			*p = c = n * 3 + 1;
			note_clamp_multi(5, pad, c);
		}
	}
}
