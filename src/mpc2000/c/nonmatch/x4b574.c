#include "mpc2kxl.h"

void __far L_4B574(void)
{
	long t1;

	C2_W_END_FINE_CURSOR = 2;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x1af4), MK_FP(SEG_DATA, -0x282a));
	return;
}
