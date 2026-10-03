#include "mpc2kxl.h"

void __far resample_focus_quality(void)
{
	long t1;

	C2_W_RESAMPLE_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x255e), MK_FP(SEG_DATA, 0x2505));
	return;
}
