#include "mpc2kxl.h"

void __far L_4B13C(void)
{
	long t1;

	C2_W_START_FINE_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x19c2), MK_FP(SEG_DATA, -0x2828));
	return;
}
