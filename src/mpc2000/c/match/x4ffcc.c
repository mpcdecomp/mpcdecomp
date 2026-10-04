#include "mpc2kxl.h"

void __far velocity_mod_field4_thunk(void)
{
	long t1;

	C2_W_VELOCITY_MOD_CURSOR = 4;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x39c6), MK_FP(SEG_DATA, -0x283a));
	return;
}
