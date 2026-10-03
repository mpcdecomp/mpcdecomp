#include "mpc2kxl.h"

void __far L_4D204(void)
{
	long t1;

	C2_W_TS_CURSOR = 7;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x27b2), MK_FP(SEG_DATA, 0x2604));
	return;
}
