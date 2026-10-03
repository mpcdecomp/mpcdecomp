#include "mpc2kxl.h"

void __far fx_chorus_field0_thunk(void)
{
	long t1;

	C2_W_FX_MOD_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x4c2e), MK_FP(SEG_DATA, -0x7190));
	return;
}
