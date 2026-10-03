#include "mpc2kxl.h"

void __far L_4BED8(void)
{
	long t1;

	C2_W_MONO_TO_STEREO_CURSOR = 2;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x23fc), MK_FP(SEG_DATA, -0x7035));
	return;
}
