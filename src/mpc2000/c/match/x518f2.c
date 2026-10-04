#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C1_B_0D775;
extern char C2_W_0410E[1];

void __far mixer_setup_field4_thunk(void)
{
	C0_B_098B8[0] = C1_B_0D775;
	C2_W_MIXER_SETUP_CURSOR = 4;
	ui_field_engine(C2_W_0410E, C0_B_098B8);
}
