#include "mpc2kxl.h"

void __far mixer_chan_field0_thunk(void)
{
	long t1;

	C2_W_CHANSET_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x4240), MK_FP(SEG_DATA, -0x2840));
	return;
}
