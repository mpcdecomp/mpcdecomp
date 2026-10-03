#include "mpc2kxl.h"

void __far save_aps_field2_thunk(void)
{
	long t1;

	C1_W_SAVE_APS_CURSOR = 2;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0xc2c), MK_FP(SEG_DATA, -0x289c));
	return;
}
