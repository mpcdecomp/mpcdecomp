#include "mpc2kxl.h"

void __far conv_table_focus_field1(void)
{
	long t1;

	C2_W_CONV_TABLE_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x1106), MK_FP(SEG_DATA, -0x2840));
	return;
}
