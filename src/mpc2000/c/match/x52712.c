#include "mpc2kxl.h"

void __far copy_fx_field2_thunk(void)
{
	long t1;

	C2_W_COPY_FX_CURSOR = 2;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x471e), MK_FP(SEG_DATA, -0x6747));
	return;
}
