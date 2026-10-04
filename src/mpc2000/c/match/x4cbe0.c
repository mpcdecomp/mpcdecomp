#include "mpc2kxl.h"

extern char C2_W_02502[1];
extern char C2_W_02534[1];

void __far resample_focus_new_fs(void)
{
	C2_W_RESAMPLE_CURSOR = 0;
	ui_field_engine(C2_W_02534, C2_W_02502);
}
