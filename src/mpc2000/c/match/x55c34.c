#include "mpc2kxl.h"

void __far sample_dump_field4_thunk(void)
{
	long t1;

	C2_W_SAMPLE_DUMP_CURSOR = 4;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x665c), (unsigned char far *)P_647E);
	return;
}
