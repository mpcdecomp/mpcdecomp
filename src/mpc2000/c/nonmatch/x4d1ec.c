#include "mpc2kxl.h"

void __far L_4D1EC(void)
{
	long t1;

	C2_W_TS_CURSOR = 6;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x2788), MK_FP(SEG_DATA, 0x2600));
	return;
}
