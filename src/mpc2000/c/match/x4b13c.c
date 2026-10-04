#include "mpc2kxl.h"

extern char C1_B_0D7D8[1];
extern char C2_W_019C2[1];

void __far L_4B13C(void)
{
	C2_W_START_FINE_CURSOR = 1;
	ui_field_engine(C2_W_019C2, C1_B_0D7D8);
}
