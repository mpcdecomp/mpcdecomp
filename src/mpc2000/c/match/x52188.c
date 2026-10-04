#include "mpc2kxl.h"

void __far mixer_field3_thunk(void)
{
	long t1;

	C2_B_08D90 = (char)32;
	C2_W_MIXER_CURSOR = 3;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x4546), 0L);
	return;
}
