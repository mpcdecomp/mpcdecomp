#include "mpc2kxl.h"

extern char C1_B_0D7D7[1];
extern char C2_W_018AA[1];

void __far trim_focus_view(void)
{
	C2_W_TRIM_CURSOR = 4;
	ui_field_engine(C2_W_018AA, C1_B_0D7D7);
}
