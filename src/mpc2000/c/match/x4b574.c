#include "mpc2kxl.h"

extern char C0_B_0D7D6[1];
extern char C2_W_01AF4[1];

void __far L_4B574(void)
{
	C2_W_END_FINE_CURSOR = 2;
	ui_field_engine(C2_W_01AF4, C0_B_0D7D6);
}
