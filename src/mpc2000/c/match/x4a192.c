#include "mpc2kxl.h"

extern char C0_B_0D7D6[1];
extern char C2_W_0182C[1];

void __far trim_focus_play_x(void)
{
	C2_W_TRIM_CURSOR = 1;
	ui_field_engine(C2_W_0182C, C0_B_0D7D6);
}
