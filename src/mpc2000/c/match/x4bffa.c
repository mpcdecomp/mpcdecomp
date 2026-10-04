#include "mpc2kxl.h"

extern char C0_B_0D7D6[1];
extern char C2_W_01FEE[1];

void __far snd_params_focus_play_x(void)
{
	C2_W_SND_PARAMS_CURSOR = 1;
	ui_field_engine(C2_W_01FEE, C0_B_0D7D6);
}
