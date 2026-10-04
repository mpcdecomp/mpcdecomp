#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C2_W_023D2[1];

void __far L_4C81E(void)
{
	C2_W_MONO_TO_STEREO_CURSOR = 1;
	ui_field_engine(C2_W_023D2, C0_B_098B8);
}
