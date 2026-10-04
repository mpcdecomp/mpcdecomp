#include "mpc2kxl.h"

extern char C0_W_0D7C2[1];
extern char C2_W_01E16[1];

void __far loop_focus_sound(void)
{
	C2_W_LOOP_CURSOR = 0;
	ui_field_engine(C2_W_01E16, C0_W_0D7C2);
}
