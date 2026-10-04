#include "mpc2kxl.h"

extern char C2_B_02604[1];
extern char C2_W_027B2[1];

void __far L_4D204(void)
{
	C2_W_TS_CURSOR = 7;
	ui_field_engine(C2_W_027B2, C2_B_02604);
}
