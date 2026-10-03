#include "mpc2kxl.h"

void __far st_to_mono_focus_source(void)
{
	long t1;

	C2_W_STEREO_TO_MONO_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x2484), MK_FP(SEG_DATA, -0x283e));
	return;
}
