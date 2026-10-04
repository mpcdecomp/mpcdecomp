#include "mpc2kxl.h"

extern char C1_W_08FCB[1];
extern char C2_W_024AE[1];

void __far st_to_mono_focus_l_name(void)
{
	C2_W_STEREO_TO_MONO_CURSOR = 1;
	ui_field_engine(C2_W_024AE, C1_W_08FCB);
}
