#include "mpc2k.h"

void __far __pascal note_pitch_calc_2(int p0)
{
	int l2;
	int si_;
	char far *v0;

	si_ = PTR_TRACK_DATA[p0];
	if ((unsigned)(si_ - PGM_NOTE_BASE) > PGM_NOTE_COUNT - 1) goto tgt_0693B;
	v0 = note_clamp_flag(si_);
	l2 = (*v0 + 2) / 3;
	if (l2 <= 0) goto tgt_0693B;
	l2--;
	if (!l2) goto tgt_06926;
	l2 = l2 * 3 - 2;
tgt_06926:
	*v0 = (char)l2;
	note_clamp_multi(1, p0, *v0);
tgt_0693B:
	;
}
