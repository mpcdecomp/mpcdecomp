#include "mpc2kxl.h"

void __far sample_record_focus_field4(void)
{
	long t1;

	C2_W_SAMPLE_REC_CURSOR = 4;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x14e0), MK_FP(SEG_DATA, -0x282e));
	return;
}
