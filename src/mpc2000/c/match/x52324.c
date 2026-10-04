#include "mpc2kxl.h"

void __far mixer_field8_thunk(void)
{
	long t1;

	C2_B_08D90 = (char)1;
	C2_W_MIXER_CURSOR = 8;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x4618), 0L);
	return;
}
