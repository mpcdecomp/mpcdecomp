#include "mpc2kxl.h"

void __far trim_focus_end(void)
{
	int t1;

	C2_W_TRIM_CURSOR = 3;
	far_4A5E8(MK_FP(SEG_DATA, 0x1880));
	return;
}
