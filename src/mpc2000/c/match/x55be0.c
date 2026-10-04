#include "mpc2kxl.h"

void __far sample_dump_field2_thunk(void)
{
	long t1;

	C2_W_SAMPLE_DUMP_CURSOR = 2;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x6608), (unsigned char far *)C2_B_0647D);
	return;
}
