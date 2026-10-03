#include "mpc2kxl.h"

extern char C0_B_098B8[1];
extern char C2_W_036D2[1];

void __far L_4F6A4(void)
{
	C0_B_098B8[0] = C2_B_PAD_ASSIGN_MASTER;
	ui_field_engine(C2_W_036D2, C0_B_098B8);
}
