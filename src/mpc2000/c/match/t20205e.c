#include "mpc2k.h"

void __far __pascal voice_buf_helper_1(int p0)
{
	int si_;

	if (p0 != 0x10) goto br_02103;
	si_ = 0;
loop_020F0:
	voice_release_full(si_);
	P_9A4E[si_] |= 2;
	si_ += 2;
	if (si_ < 0x20) goto loop_020F0;
br_02103:
	;
}
