#include "mpc2kxl.h"

extern char C0_W_0D7C2[1];
extern char C2_W_02878[1];

void __far zone_focus_sound(void)
{
	C2_W_ZONE_CURSOR = 0;
	ui_field_engine(C2_W_02878, C0_W_0D7C2);
}
