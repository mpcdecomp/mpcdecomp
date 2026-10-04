#include "mpc2kxl.h"

extern char C1_B_0D7DB[1];
extern char C2_W_01D2E[1];

void __far L_4B9C8(void)
{
	C2_W_LOOP_END_FINE_CURSOR = 2;
	ui_field_engine(C2_W_01D2E, C1_B_0D7DB);
}
