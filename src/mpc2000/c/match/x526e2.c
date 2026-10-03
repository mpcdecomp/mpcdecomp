#include "mpc2kxl.h"

void __far copy_fx_field0_thunk(void)
{
	long t1;

	C2_W_COPY_FX_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x46ca), MK_FP(SEG_DATA, -0x6748));
	return;
}
