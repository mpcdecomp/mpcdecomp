#include "mpc2kxl.h"

void __far L_4BBE8(void)
{
	long t1;

	C2_W_COPY_SOUND_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x22be), MK_FP(SEG_DATA, -0x7035));
	return;
}
