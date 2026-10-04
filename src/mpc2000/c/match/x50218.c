#include "mpc2kxl.h"

void __far velo_env_filter_field0_thunk(void)
{
	long t1;

	C2_W_VELO_ENV_FILTER_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x3a78), MK_FP(SEG_DATA, -0x2840));
	return;
}
