#include "mpc2kxl.h"

extern char C0_B_0D7D6[1];
extern char C2_W_01D58[1];

void __far L_4B9E0(void)
{
	C2_W_LOOP_END_FINE_CURSOR = 3;
	ui_field_engine(C2_W_01D58, C0_B_0D7D6);
}
