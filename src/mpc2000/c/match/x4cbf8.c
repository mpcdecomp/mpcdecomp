#include "mpc2kxl.h"

extern char C2_W_02505[1];
extern char C2_W_0255E[1];

void __far resample_focus_quality(void)
{
	C2_W_RESAMPLE_CURSOR = 1;
	ui_field_engine(C2_W_0255E, C2_W_02505);
}
