#include "mpc2kxl.h"

void __far trim_focus_sound(void)
{
	long t1;

	C2_W_TRIM_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x1802), MK_FP(SEG_DATA, -0x283e));
	return;
}
