#include "mpc2kxl.h"

extern char C0_B_0D7D6[1];
extern char C2_W_01E40[1];

void __far loop_focus_play_x(void)
{
	C2_W_LOOP_CURSOR = 1;
	ui_field_engine(C2_W_01E40, C0_B_0D7D6);
}
