#include "mpc2kxl.h"

void __far save_snd_field1_thunk(void)
{
	long t1;

	C1_W_SAVE_SND_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0xe62), MK_FP(SEG_DATA, -0x2835));
	return;
}
