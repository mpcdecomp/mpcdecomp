#include "mpc2kxl.h"

void __far trim_focus_view(void)
{
	long t1;

	C2_W_TRIM_CURSOR = 4;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x18aa), MK_FP(SEG_DATA, -0x2829));
	return;
}
