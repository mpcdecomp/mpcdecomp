#include "mpc2kxl.h"

extern char C2_W_01106[1];

void __far conv_table_focus_field1(void)
{
	C2_W_CONV_TABLE_CURSOR = 1;
	ui_field_engine(C2_W_01106, ((char *)&C2_B_PAD_NOTE));
}
