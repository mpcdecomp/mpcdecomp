#include "mpc2k.h"

void __far __pascal bcd_arithmetic_2(int p0)
{
	int l6;
	int si_;
	int di_;
	char far *v0;

	si_ = p0;
	l6 = PTR_TRACK_DATA[si_];
	if ((unsigned)(l6 - PGM_NOTE_BASE) > PGM_NOTE_COUNT - 1) goto br_06BD1;
	v0 = note_range_clamp(l6);
	di_ = v0[3] & 0xf;
	if ((unsigned)(v0[3] & 0xf) >= 8) goto br_06BD1;
	v0[3] = v0[3] & 0x80 | (char)(di_ + 1);
br_06BD1:
	;
}
