#include "mpc2kxl.h"

void __far save_pgm_field1_thunk(void)
{
	long t1;

	C1_W_SAVE_PGM_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0xaac), MK_FP(SEG_DATA, -0x2836));
	return;
}
