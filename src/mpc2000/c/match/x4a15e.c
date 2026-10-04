#include "mpc2kxl.h"

extern char C0_W_0D7C2[1];
extern char C2_W_01802[1];

void __far trim_focus_sound(void)
{
	C2_W_TRIM_CURSOR = 0;
	ui_field_engine(C2_W_01802, C0_W_0D7C2);
}
