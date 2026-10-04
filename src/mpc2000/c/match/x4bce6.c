#include "mpc2kxl.h"

extern char C1_B_0D7DA[1];
extern char C2_W_01E94[1];

void __far loop_focus_lock(void)
{
	C2_W_LOOP_CURSOR = 3;
	ui_field_engine(C2_W_01E94, C1_B_0D7DA);
}
