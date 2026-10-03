#include "mpc2kxl.h"

void __far loop_focus_sound(void)
{
	long t1;

	C2_W_LOOP_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x1e16), MK_FP(SEG_DATA, -0x283e));
	return;
}
