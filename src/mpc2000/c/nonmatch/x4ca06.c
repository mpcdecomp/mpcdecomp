#include "mpc2kxl.h"

void __far st_to_mono_focus_r_name(void)
{
	long t1;

	C2_W_STEREO_TO_MONO_CURSOR = 2;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x24d8), MK_FP(SEG_DATA, -0x72c8));
	return;
}
