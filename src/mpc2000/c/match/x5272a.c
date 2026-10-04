#include "mpc2kxl.h"

void __far copy_fx_field3_thunk(void)
{
	long t1;

	C2_W_COPY_FX_CURSOR = 3;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x4748), MK_FP(SEG_DATA, -0x6745));
	return;
}
