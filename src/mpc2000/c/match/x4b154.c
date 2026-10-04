#include "mpc2kxl.h"

extern char C0_B_0D7D6[1];
extern char C2_W_019EC[1];

void __far L_4B154(void)
{
	C2_W_START_FINE_CURSOR = 2;
	ui_field_engine(C2_W_019EC, C0_B_0D7D6);
}
