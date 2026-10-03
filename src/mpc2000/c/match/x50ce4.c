#include "mpc2kxl.h"

void __far auto_chromatic_field0_thunk(void)
{
	long t1;

	C2_W_AUTO_CHROMATIC_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x3da8), MK_FP(SEG_DATA, -0x2840));
	return;
}
