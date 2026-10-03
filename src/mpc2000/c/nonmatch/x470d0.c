#include "mpc2kxl.h"

void __far conv_table_focus_field0(void)
{
	long t1;

	C2_W_CONV_TABLE_CURSOR = 0;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x10dc), (unsigned char far *)C2_B_CONV_MPC60_PAD);
	return;
}
