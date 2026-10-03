#include "mpc2kxl.h"

void __far L_4B55C(void)
{
	long t1;

	C2_W_END_FINE_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x1aca), MK_FP(SEG_DATA, -0x2828));
	return;
}
