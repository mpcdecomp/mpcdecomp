#include "mpc2kxl.h"

extern char C2_W_010DC[1];

void __far conv_table_focus_field0(void)
{
	C2_W_CONV_TABLE_CURSOR = 0;
	ui_field_engine(C2_W_010DC, ((char *)C2_B_CONV_MPC60_PAD));
}
