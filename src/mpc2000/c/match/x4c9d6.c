#include "mpc2kxl.h"

extern char C0_W_0D7C2[1];
extern char C2_W_02484[1];

void __far st_to_mono_focus_source(void)
{
	C2_W_STEREO_TO_MONO_CURSOR = 0;
	ui_field_engine(C2_W_02484, C0_W_0D7C2);
}
