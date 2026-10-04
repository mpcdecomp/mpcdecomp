#include "mpc2kxl.h"

extern char C0_B_0D7D6[1];
extern char C2_W_028A2[1];

void __far zone_focus_play_x(void)
{
	C2_W_ZONE_CURSOR = 1;
	ui_field_engine(C2_W_028A2, C0_B_0D7D6);
}
