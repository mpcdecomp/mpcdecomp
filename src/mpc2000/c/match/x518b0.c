#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C1_B_0D7BA;
extern char C2_W_040BA[1];

void __far mixer_setup_field2_thunk(void)
{
	C0_B_098B8[0] = C1_B_0D7BA;
	C2_W_MIXER_SETUP_CURSOR = 2;
	ui_field_engine(C2_W_040BA, C0_B_098B8);
}
