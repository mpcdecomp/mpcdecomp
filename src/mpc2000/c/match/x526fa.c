#include "mpc2kxl.h"

void __far copy_fx_field1_thunk(void)
{
	long t1;

	C2_W_COPY_FX_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x46f4), MK_FP(SEG_DATA, -0x6746));
	return;
}
