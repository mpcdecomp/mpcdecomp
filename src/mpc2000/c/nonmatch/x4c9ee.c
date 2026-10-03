#include "mpc2kxl.h"

void __far st_to_mono_focus_l_name(void)
{
	long t1;

	C2_W_STEREO_TO_MONO_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x24ae), MK_FP(SEG_DATA, -0x7035));
	return;
}
