#include "mpc2kxl.h"

void __far L_4DAE6(void)
{
	long t1;

	C2_W_ZONE_END_FINE_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x2ac2), MK_FP(SEG_DATA, -0x282a));
	return;
}
