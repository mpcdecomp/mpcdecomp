#include "mpc2kxl.h"

void __far save_snd_field0_thunk(void)
{
	long t1;

	C1_W_SAVE_SND_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0xe38), MK_FP(SEG_DATA, -0x283e));
	return;
}
