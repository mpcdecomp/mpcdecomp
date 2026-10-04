#include "mpc2kxl.h"

void __far velo_pitch_field0_thunk(void)
{
	long t1;

	C2_W_VELO_PITCH_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x3be6), MK_FP(SEG_DATA, -0x2840));
	return;
}
