#include "mpc2kxl.h"

void __far zone_focus_play_x(void)
{
	long t1;

	C2_W_ZONE_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x28a2), MK_FP(SEG_DATA, -0x282a));
	return;
}
