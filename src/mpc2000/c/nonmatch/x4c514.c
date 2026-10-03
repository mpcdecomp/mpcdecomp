#include "mpc2kxl.h"

void __far far_4C514(void)
{
	long t1;

	C2_W_COPY_SOUND_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x2294), MK_FP(SEG_DATA, -0x283e));
	return;
}
