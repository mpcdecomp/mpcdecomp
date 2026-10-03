#include "mpc2kxl.h"

void __far mixer_field1_thunk(void)
{
	long t1;

	C2_B_08D90 = (char)1;
	C2_W_MIXER_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x44f2), MK_FP(SEG_DATA, -0x2839));
	return;
}
