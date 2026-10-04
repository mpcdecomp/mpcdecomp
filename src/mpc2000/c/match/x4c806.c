#include "mpc2kxl.h"

extern char C0_W_0D7C2[1];
extern char C2_W_023A8[1];

void __far L_4BEA8(void)
{
	C2_W_MONO_TO_STEREO_CURSOR = 0;
	ui_field_engine(C2_W_023A8, C0_W_0D7C2);
}
