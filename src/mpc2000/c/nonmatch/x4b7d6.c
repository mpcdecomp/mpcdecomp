#include "mpc2kxl.h"

void __far L_4B7D6(void)
{
	long t1;

	C2_W_LOOP_FINE_CURSOR = 3;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x1c26), MK_FP(SEG_DATA, -0x282a));
	return;
}
