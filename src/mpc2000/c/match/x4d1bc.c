#include "mpc2kxl.h"

extern char C1_B_0D7E0[1];
extern char C2_W_02734[1];

void __far L_4C85E(void)
{
	C2_W_TS_CURSOR = 4;
	ui_field_engine(C2_W_02734, C1_B_0D7E0);
}
