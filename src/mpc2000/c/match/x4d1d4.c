#include "mpc2kxl.h"

extern char C2_W_02602[1];
extern char C2_W_0275E[1];

void __far far_4D1D4(void)
{
	C2_W_TS_CURSOR = 5;
	ui_field_engine(C2_W_0275E, C2_W_02602);
}
