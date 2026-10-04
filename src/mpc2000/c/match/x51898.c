#include "mpc2kxl.h"

void __far mixer_setup_field1_thunk(void)
{
	long t1;

	C2_W_MIXER_SETUP_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x4090), MK_FP(SEG_DATA, -0x2847));
	return;
}
