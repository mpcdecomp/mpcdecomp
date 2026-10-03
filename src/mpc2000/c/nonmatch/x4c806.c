#include "mpc2kxl.h"

void __far L_4BEA8(void)
{
	long t1;

	C2_W_MONO_TO_STEREO_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x23a8), MK_FP(SEG_DATA, -0x283e));
	return;
}
