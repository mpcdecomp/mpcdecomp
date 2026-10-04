#include "mpc2k.h"

void __far __pascal voice_release_by_note(int p0)
{
	int si_;
	int di_;

	si_ = 0;
	di_ = VOICE_TABLE;
loop_025A4:
	if (p0 != (unsigned char)((char __near *)di_)[0]) goto br_025B3;
	voice_release(si_);
br_025B3:
	di_ += 0x12;
	si_++;
	if (si_ < 0x20) goto loop_025A4;
}
