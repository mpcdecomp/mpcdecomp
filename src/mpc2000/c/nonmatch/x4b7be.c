#include "mpc2kxl.h"

void __far L_4B7BE(void)
{
	long t1;

	C2_W_LOOP_FINE_CURSOR = 2;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x1bfc), MK_FP(SEG_DATA, -0x2825));
	return;
}
