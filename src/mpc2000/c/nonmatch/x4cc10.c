#include "mpc2kxl.h"

void __far resample_focus_new_name(void)
{
	long t1;

	C2_W_RESAMPLE_CURSOR = 2;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x2588), MK_FP(SEG_DATA, -0x7035));
	return;
}
