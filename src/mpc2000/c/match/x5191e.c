#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C2_W_04138[1];

void __far mixer_setup_field5_thunk(void)
{
	C0_B_098B8[0] = C2_B_MIXER_DRUM;
	C2_W_MIXER_SETUP_CURSOR = 5;
	ui_field_engine(C2_W_04138, C0_B_098B8);
}
