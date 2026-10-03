#include "mpc2kxl.h"

void __far zone_focus_sound(void)
{
	long t1;

	C2_W_ZONE_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x2878), MK_FP(SEG_DATA, -0x283e));
	return;
}
