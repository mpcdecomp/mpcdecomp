#include "mpc2kxl.h"

void __far sample_dump_field3_thunk(void)
{
	long t1;

	C2_W_SAMPLE_DUMP_CURSOR = 3;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x6632), MK_FP(SEG_DATA, -0x283e));
	return;
}
