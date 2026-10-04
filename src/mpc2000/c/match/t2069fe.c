#include "mpc2k.h"

void __far __pascal timer_dma_setup(int p0)
{
	int si_;

	si_ = PTR_TRACK_DATA[p0];
	if ((unsigned)(si_ - PGM_NOTE_BASE) > PGM_NOTE_COUNT - 1) goto br_06E15;
	if (note_range_clamp(si_)[5] >= 4) goto br_06E15;
	note_range_clamp(si_)[5]++;
br_06E15:
	;
}
