#include "mpc2kxl.h"

void __far save_pgm_field0_thunk(void)
{
	long t1;

	C1_W_SAVE_PGM_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0xa82), MK_FP(SEG_DATA, -0x2838));
	return;
}
