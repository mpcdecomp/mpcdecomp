#include "mpc2kxl.h"

extern char C1_W_08FCB[1];
extern char C2_W_023FC[1];

void __far L_4BED8(void)
{
	C2_W_MONO_TO_STEREO_CURSOR = 2;
	ui_field_engine(C2_W_023FC, C1_W_08FCB);
}
