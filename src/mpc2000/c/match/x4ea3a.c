#include "mpc2kxl.h"

extern char C2_W_02F94[1];

void __far far_4E0DA(void)
{
	C2_W_PARAMS_CURSOR = 1;
	ui_field_engine(C2_W_02F94, ((char *)&C2_B_PAD_NOTE));
}
