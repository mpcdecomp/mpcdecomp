#include "mpc2kxl.h"

void __far L_4C81E(void)
{
	long t1;

	C2_W_MONO_TO_STEREO_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x23d2), MK_FP(SEG_DATA, -0x6748));
	return;
}
