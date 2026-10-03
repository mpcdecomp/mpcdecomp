#include "mpc2kxl.h"

extern char C1_TBL_0D7FE[1];

void __far voice_buf_helper_1(int p0)
{
	int si_;

	if (p0 != 0x10) goto br_41A9A;
	si_ = 0;
loop_41A84:
	voice_release_full(si_);
	C1_TBL_0D7FE[si_] |= 2;
	si_ += 2;
	if (si_ < 0x20) goto loop_41A84;
br_41A9A:
	;
}
