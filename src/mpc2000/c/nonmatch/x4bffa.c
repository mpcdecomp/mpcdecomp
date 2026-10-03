#include "mpc2kxl.h"

void __far snd_params_focus_play_x(void)
{
	long t1;

	C2_W_SND_PARAMS_CURSOR = 1;
	t1 = ui_field_engine(MK_FP(SEG_DATA, 0x1fee), MK_FP(SEG_DATA, -0x282a));
	return;
}
