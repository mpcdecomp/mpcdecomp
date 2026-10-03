#include "mpc2kxl.h"

void __far trim_focus_start(void)
{
	int t1;

	C2_W_TRIM_CURSOR = 2;
	far_4A1F0(MK_FP(SEG_DATA, 0x1856));
	return;
}
