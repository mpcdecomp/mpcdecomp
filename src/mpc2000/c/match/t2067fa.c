#include "mpc2k.h"

void __far __pascal bcd_arithmetic_3(int p0)
{
	int l6;
	int si_;
	int di_;
	char far *v0;

	si_ = p0;
	l6 = PTR_TRACK_DATA[si_];
	if ((unsigned)(l6 - 0x23) > 0x3f) goto br_06C1E;
	v0 = note_range_clamp(l6);
	di_ = v0[3] & 0xf;
	switch (v0[3] & 0xf) { case 0: goto br_06C1E; }
	v0[3] = v0[3] & 0x80 | (char)(di_ - 1);
br_06C1E:
	;
}
