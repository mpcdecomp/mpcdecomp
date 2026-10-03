#include "mpc2kxl.h"

void __far auto_chromatic_field4_thunk(void)
{
	long t1;

	C2_W_AUTO_CHROMATIC_CURSOR = 4;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x3e50), MK_FP(SEG_DATA, -0x7035));
	return;
}
