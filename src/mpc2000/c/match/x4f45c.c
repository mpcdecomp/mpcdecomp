#include "mpc2kxl.h"

void __far delete_pgm_field0_thunk(void)
{
	long t1;

	C2_W_NEW_PGM_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x3592), MK_FP(SEG_DATA, -0x7035));
	return;
}
