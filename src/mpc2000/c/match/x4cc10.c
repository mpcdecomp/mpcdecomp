#include "mpc2kxl.h"

extern char C1_W_08FCB[1];
extern char C2_W_02588[1];

void __far resample_focus_new_name(void)
{
	C2_W_RESAMPLE_CURSOR = 2;
	ui_field_engine(C2_W_02588, C1_W_08FCB);
}
