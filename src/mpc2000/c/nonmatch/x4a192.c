#include "mpc2kxl.h"

void __far trim_focus_play_x(void)
{
	long t1;

	C2_W_TRIM_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x182c), MK_FP(SEG_DATA, -0x282a));
	return;
}
