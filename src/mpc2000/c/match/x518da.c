#include "mpc2kxl.h"

void __far mixer_setup_field3_thunk(void)
{
	long t1;

	C2_W_MIXER_SETUP_CURSOR = 3;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x40e4), MK_FP(SEG_DATA, -0x2845));
	return;
}
