#include "mpc2kxl.h"

extern char C0_W_0D7C2[1];
extern char C2_W_01FC4[1];

void __far snd_params_focus_sound(void)
{
	C2_W_SND_PARAMS_CURSOR = 0;
	ui_field_engine(C2_W_01FC4, C0_W_0D7C2);
}
