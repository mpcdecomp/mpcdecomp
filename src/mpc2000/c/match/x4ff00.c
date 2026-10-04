#include "mpc2kxl.h"

void __far velocity_mod_field0_thunk(void)
{
	long t1;

	C2_W_VELOCITY_MOD_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x391e), MK_FP(SEG_DATA, -0x2840));
	return;
}
