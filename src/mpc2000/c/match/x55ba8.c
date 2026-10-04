#include "mpc2kxl.h"

void __far sample_dump_field0_thunk(void)
{
	long t1;

	C2_W_SAMPLE_DUMP_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x65b4), (unsigned char far *)C2_W_0647C);
	return;
}
