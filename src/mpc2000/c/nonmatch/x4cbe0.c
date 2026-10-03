#include "mpc2kxl.h"

void __far resample_focus_new_fs(void)
{
	long t1;

	C2_W_RESAMPLE_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x2534), MK_FP(SEG_DATA, 0x2502));
	return;
}
