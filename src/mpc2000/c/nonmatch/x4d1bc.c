#include "mpc2kxl.h"

void __far L_4C85E(void)
{
	long t1;

	C2_W_TS_CURSOR = 4;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x2734), MK_FP(SEG_DATA, -0x2820));
	return;
}
