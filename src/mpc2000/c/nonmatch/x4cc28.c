#include "mpc2kxl.h"

void __far resample_focus_new_bit(void)
{
	long t1;

	C2_W_RESAMPLE_CURSOR = 3;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x25b2), MK_FP(SEG_DATA, 0x2504));
	return;
}
