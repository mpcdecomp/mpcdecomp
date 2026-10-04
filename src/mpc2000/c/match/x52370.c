#include "mpc2kxl.h"

void __far mixer_field9_thunk(void)
{
	long t1;

	C2_W_MIXER_CURSOR = 9;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x4642), MK_FP(SEG_DATA, -0x6748));
	return;
}
