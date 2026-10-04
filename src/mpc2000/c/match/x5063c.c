#include "mpc2kxl.h"

void __far velo_pitch_field3_thunk(void)
{
	long t1;

	C2_W_VELO_PITCH_CURSOR = 3;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x3c64), MK_FP(SEG_DATA, -0x283a));
	return;
}
