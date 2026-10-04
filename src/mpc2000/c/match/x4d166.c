#include "mpc2kxl.h"

extern char C2_W_026B6[1];

void __far far_4D166(void)
{
	C2_W_TS_CURSOR = 1;
	ui_field_engine(C2_W_026B6, ((char *)C2_W_08D4E));
}
