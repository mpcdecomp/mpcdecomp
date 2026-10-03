#include "mpc2kxl.h"

void __far delete_pgm_field1_thunk(void)
{
	long t1;

	C2_W_NEW_PGM_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x35bc), MK_FP(SEG_DATA, -0x6748));
	return;
}
