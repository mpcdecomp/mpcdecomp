#include "mpc2kxl.h"

extern char C1_B_0D7D8[1];
extern char C2_W_01ACA[1];

void __far L_4B55C(void)
{
	C2_W_END_FINE_CURSOR = 1;
	ui_field_engine(C2_W_01ACA, C1_B_0D7D8);
}
