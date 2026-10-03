#include "mpc2kxl.h"

void __far velo_env_filter_field5_thunk(void)
{
	long t1;

	C2_W_VELO_ENV_FILTER_CURSOR = 5;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x3b4a), MK_FP(SEG_DATA, -0x283a));
	return;
}
