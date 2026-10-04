#include "mpc2kxl.h"

extern char C1_B_0D7DB[1];
extern char C2_W_01BFC[1];

void __far L_4B7BE(void)
{
	C2_W_LOOP_FINE_CURSOR = 2;
	ui_field_engine(C2_W_01BFC, C1_B_0D7DB);
}
