#include "mpc2kxl.h"

void __far loop_focus_lock(void)
{
	long t1;

	C2_W_LOOP_CURSOR = 3;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x1e94), MK_FP(SEG_DATA, -0x2826));
	return;
}
