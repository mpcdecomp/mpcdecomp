#include "mpc2kxl.h"

void __far sample_record_focus_field3(void)
{
	long t1;

	C2_W_SAMPLE_REC_CURSOR = 3;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x14b6), MK_FP(SEG_DATA, -0x2830));
	return;
}
