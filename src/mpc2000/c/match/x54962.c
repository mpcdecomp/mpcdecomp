#include "mpc2kxl.h"

void __far fx_mixer_field2_thunk(void)
{
	long t1;

	C2_W_FX_MIXER_CURSOR = 2;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x576c), MK_FP(SEG_DATA, -0x2843));
	return;
}
