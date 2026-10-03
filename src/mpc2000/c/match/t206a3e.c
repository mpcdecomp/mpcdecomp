#include "mpc2k.h"

void __far __pascal timer_dma_setup2(int p0)
{
	int si_;
	int di_;

	di_ = p0;
	si_ = PTR_TRACK_DATA[di_];
	if ((unsigned)(PTR_TRACK_DATA[di_] - 0x23) > 0x3f) goto br_06E55;
	if (note_range_clamp(si_)[5] <= 0) goto br_06E55;
	note_range_clamp(si_)[5]--;
br_06E55:
	;
}
